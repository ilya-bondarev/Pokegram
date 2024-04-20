# Initialize App and import dependencies
from flask import Flask, request, jsonify
from datetime import datetime
import bcrypt
import hashlib

# Initialize Database Connection and import all tables and data
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from models import Pokemon, PokemonDetail, PokemonStat, User, UserActivity
from config import DB_NAME, DB_USER, DB_PASSWORD, DB_HOST

# Connect to the database
engine = create_engine(f"postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}/{DB_NAME}")
Session = sessionmaker(bind=engine)
session = Session()
app = Flask(__name__)


# Pokemon logic
@app.route('/pokemon/<int:pokemon_id>', methods=['GET'])
def get_pokemon(pokemon_id):
    pokemon = session.query(Pokemon).filter_by(pokemon_id=pokemon_id).one()
    details = session.query(PokemonDetail).filter_by(pokemon_id=pokemon_id).one()
    stats = session.query(PokemonStat).filter_by(pokemon_id=pokemon_id).one()

    abilities = " ".join([ability.ability_name for ability in pokemon.abilities])

    #TODO Make tables separated
    pokemon_data = {
        "pokemon_abilities": abilities,
        "pokemon_attack": stats.pokemon_attack,
        "pokemon_breed_period": details.pokemon_breed_period,
        "pokemon_defence": stats.pokemon_defence,
        "pokemon_health": stats.pokemon_health,
        "pokemon_height": details.pokemon_height,
        "pokemon_id": pokemon.pokemon_id,
        "pokemon_name": pokemon.pokemon_name,
        "pokemon_number": None, #TODO Remove this none
        "pokemon_photo": details.pokemon_photo,
        "pokemon_rarity": details.pokemon_rarity,
        "pokemon_sex_ratio": details.pokemon_sex_ratio,
        "pokemon_shine": details.pokemon_shine,
        "pokemon_special_attack": stats.pokemon_special_attack,
        "pokemon_special_defence": stats.pokemon_special_defence,
        "pokemon_speed": stats.pokemon_speed,
        "pokemon_summ": stats.pokemon_total_sum,
        "pokemon_title": pokemon.pokemon_title,
        "pokemon_total_amount": details.pokemon_total_amount,
        "pokemon_type": pokemon.pokemon_type,
        "pokemon_weight": details.pokemon_weight,
        "pokemon_xp_group": pokemon.pokemon_xp_group
    }

    return jsonify(pokemon_data)

@app.route('/pokemon', methods=['GET'])
def get_all_pokemons():
    page = request.args.get('page', 1, type=int)
    page_size = request.args.get('pageSize', 10, type=int)

    # Calculate offset for pagination
    offset = (page - 1) * page_size

    # Get total count of pokemons
    total_pokemons = session.query(Pokemon).count()
    total_pages = (total_pokemons + page_size - 1) // page_size

    # Query for pokemons by page
    pokemons_query = session.query(Pokemon).offset(offset).limit(page_size).all()
    
    pokemons_data = []
    for pokemon in pokemons_query:
        details = session.query(PokemonDetail).filter_by(pokemon_id=pokemon.pokemon_id).one_or_none()
        stats = session.query(PokemonStat).filter_by(pokemon_id=pokemon.pokemon_id).one_or_none()
        
        if details and stats:
            abilities = " ".join([ability.ability_name for ability in pokemon.abilities])
            pokemon_info = {
                "pokemon_abilities": abilities,
                "pokemon_attack": stats.pokemon_attack,
                "pokemon_breed_period": details.pokemon_breed_period,
                "pokemon_defence": stats.pokemon_defence,
                "pokemon_health": stats.pokemon_health,
                "pokemon_height": details.pokemon_height,
                "pokemon_id": pokemon.pokemon_id,
                "pokemon_name": pokemon.pokemon_name,
                "pokemon_number": None,
                "pokemon_photo": details.pokemon_photo,
                "pokemon_rarity": details.pokemon_rarity,
                "pokemon_sex_ratio": details.pokemon_sex_ratio,
                "pokemon_shine": details.pokemon_shine,
                "pokemon_special_attack": stats.pokemon_special_attack,
                "pokemon_special_defence": stats.pokemon_special_defence,
                "pokemon_speed": stats.pokemon_speed,
                "pokemon_summ": stats.pokemon_total_sum,
                "pokemon_title": pokemon.pokemon_title,
                "pokemon_total_amount": details.pokemon_total_amount,
                "pokemon_type": pokemon.pokemon_type,
                "pokemon_weight": details.pokemon_weight,
                "pokemon_xp_group": pokemon.pokemon_xp_group
            }
            pokemons_data.append(pokemon_info)

    result = {
        "page": page,
        "page_size": page_size,
        "pokemons": pokemons_data,
        "total_pages": total_pages,
        "total_pokemons": total_pokemons
    }

    return jsonify(result)


# User
@app.route('/user/<int:user_id>', methods=['GET'])
def get_user(user_id):
    user = session.query(User).filter(User.user_id == user_id).first()
    if user:
        user_data = {
            "user_id": user.user_id,
            "user_name": user.user_name,
            "user_password": user.user_password,
            "user_role": user.user_role,
            "user_totem_pokemon": user.user_totem_pokemon
        }
        return jsonify(user_data)
    else:
        return jsonify({"error": "User not found"})


@app.route('/user', methods=['GET'])
def get_all_users():
    users = session.query(User).all()
    user_list = []

    for user in users:
        user_data = {
            "user_id": user.user_id,
            "user_name": user.user_name,
            "user_password": user.user_password,
            "user_role": user.user_role,
            "user_totem_pokemon": user.user_totem_pokemon
        }
        user_list.append(user_data)

    return jsonify(user_list)

@app.route('/user/add', methods=['POST'])
def add_user():
    data = request.json
    

    if not all([data.get('user_name'), data.get('user_totem_pokemon'), data.get('user_password'), data.get('user_role')]):
        return jsonify({"error": "Missing data"}), 400
    user = session.query(User).filter_by(user_name=data['user_name']).first()
    
    if user:
        return jsonify({"error": "User with this username already exists"}), 400

    hashed_password = bcrypt.hashpw(data['user_password'].encode('utf-8'), bcrypt.gensalt()).decode('utf-8')
    new_user = User(
        user_name=data['user_name'],
        user_totem_pokemon=data['user_totem_pokemon'],
        user_password=hashed_password,
        user_role=data['user_role']
    )
    session.add(new_user)
    session.commit()
    return jsonify({"message": "User added successfully"}), 201

@app.route('/user/delete/<int:user_id>', methods=['DELETE'])
def delete_user(user_id):
    

    session.query(UserActivity).filter_by(user_id=user_id).delete()
    session.query(User).filter_by(user_id=user_id).delete()
    session.commit()
    return jsonify({"message": "User deleted successfully"}), 200

@app.route('/user/checkpassword', methods=['GET'])
def check_user_password():
    user_name = request.args.get('user_name')
    user_password = request.args.get('user_password')
    
    user = session.query(User).filter_by(user_name=user_name).first()
    
    if user and bcrypt.checkpw(user_password.encode('utf-8'), user.user_password.encode('utf-8')):
        return jsonify(user.user_id), 200
    else:
        return jsonify(None), 200

@app.route('/pokemon/of_day', methods=['GET'])
def get_id_pokemon_of_day():
    date_str = datetime.today().strftime('%Y-%m-%d')

    # Используем хэш-функцию для генерации уникального значения
    hash_result = hashlib.sha256(date_str.encode())
    # Преобразуем хэш в число
    hash_number = int(hash_result.hexdigest(), base=16)
    # Получаем уникальное число от 0 до 999, используя остаток от деления
    unique_number = hash_number % 1200
        
    return jsonify(unique_number)

@app.route('/pokemon/of_month', methods=['GET'])
def get_id_pokemon_of_month():
    date_str = datetime.today().strftime('%Y-%m')

    # Используем хэш-функцию для генерации уникального значения
    hash_result = hashlib.sha256(date_str.encode())        
    # Преобразуем хэш в число
    hash_number = int(hash_result.hexdigest(), base=16)
    # Получаем уникальное число от 0 до 999, используя остаток от деления
    unique_number = hash_number % 1200
        
    return jsonify(unique_number)



#User Activity
@app.route('/user_activity/add', methods=['POST'])
def add_user_activity():
    data = request.json
    

    user_id = data.get('user_id')
    activity = data.get('activity')
    timestamp = data.get('timestamp')
    if not all([user_id, activity, timestamp]):
        
        return jsonify({'error': 'Missing data'}), 400

    new_activity = UserActivity(
        user_id=user_id,
        activity=activity,
        timestamp=timestamp
    )
    session.add(new_activity)
    session.commit()
    
    return jsonify({'message': 'Activity added successfully'}), 201

@app.route('/user_activity/<int:activity_id>', methods=['GET'])
def get_user_activity(activity_id):
    
    activity = session.query(UserActivity).filter_by(activity_id=activity_id).first()
    
    if activity:
        activity_data = {
            'activity_id': activity.activity_id,
            'user_id': activity.user_id,
            'activity': activity.activity,
            'timestamp': activity.timestamp
        }
        return jsonify({'activity': activity_data}), 200
    else:
        return jsonify({'error': 'Activity not found'}), 404

@app.route('/user_activity/user/<int:user_id>', methods=['GET'])
def get_activities_by_user(user_id):
    
    activities = session.query(UserActivity).filter_by(user_id=user_id).all()
    answer = [{
        'activity_id': activity.activity_id,
        'user_id': activity.user_id,
        'activity': activity.activity,
        'timestamp': activity.timestamp
    } for activity in activities]

    return jsonify(answer), 200

# Run app
if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)