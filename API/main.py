# Initialize App and import dependencies
from flask import Flask, request, jsonify
from datetime import datetime
app = Flask(__name__)


# Initialize Database Connection and import all tables and data
from Models import UserActivities, PokemonRatings, Pokemons, PokeUsers, Roles, XpGroups, PokemonTypes
from Models.DatabaseConnection import DatabaseConnection
from config import DB_NAME, DB_USER, DB_PASSWORD, DB_HOST

db = DatabaseConnection(DB_NAME, DB_USER, DB_PASSWORD, DB_HOST)
user_activity = UserActivities.UserActivity(db)
poke_user = PokeUsers.PokeUser(db)
pokemon_rating = PokemonRatings.PokemonRating(db)
pokemon_type = PokemonTypes.PokemonType(db)
role = Roles.Role(db)
xp_group = XpGroups.XPGroup(db)
pokemon = Pokemons.Pokemon(db)


# User Activities logic
@app.route('/user_activity/add', methods=['POST'])
def add_user_activity():
    data = request.json
    user_id = data.get('user_id')
    activity = data.get('activity')
    timestamp = data.get('timestamp')
    
    if not all([user_id, activity, timestamp]):
        return jsonify({'error': 'Missing data'}), 400
    
    user_activity.add_activity(user_id, activity, timestamp)
    return jsonify({'message': 'Activity added successfully'}), 201

@app.route('/user_activity/<int:activity_id>', methods=['GET'])
def get_user_activity(activity_id):
    activity = user_activity.get_activity_by_id(activity_id)
    if activity:
        return jsonify({'activity': activity}), 200
    else:
        return jsonify({'error': 'Activity not found'}), 404

@app.route('/user_activity/user/<int:user_id>', methods=['GET'])
def get_activities_by_user(user_id):
    activities = user_activity.get_activities_by_user(user_id)
    answer = []
    for activity in activities:
        answer.append({
            'activity_id': activity[0],
            'user_id': activity[1],
            'activity': activity[2],
            'timestamp': activity[3]
        })
    return jsonify(answer), 200


# Users logic
@app.route('/user', methods=['GET'])
def get_all_users():
    user = poke_user.get_all_users()

    users = []
    for data in user:
        users.append({
            'user_id': data[0],
            'user_name': data[1],
            'user_totem_pokemon': data[2],
            'user_password': data[3],
            'user_role': data[4]
        })
    return jsonify(users),200

@app.route('/user/add', methods=['POST'])
def add_user():
    data = request.json
    if not all([data['user_name'], data['user_totem_pokemon'], data['user_password'], data['user_role']]):
        return jsonify({"error": "Missing data"}), 400
    
    poke_user.add_user(data['user_name'], data['user_totem_pokemon'], data['user_password'], data['user_role'])
    return jsonify({"message": "User added successfully"}), 201

@app.route('/user/<int:user_id>', methods=['GET'])
def get_user(user_id):
    user_data = poke_user.get_user(user_id)
    return jsonify(({
        'user_id': user_data[0],
        'user_name': user_data[1],
        'user_totem_pokemon': user_data[2],
        'user_password': user_data[3],
        'user_role': user_data[4]
        })), 200

@app.route('/user/delete/<int:user_id>', methods=['DELETE'])
def delete_user(user_id):
    poke_user.delete_user(user_id)
    return jsonify({"message": "User deleted successfully"}), 200

@app.route('/user/edit/<int:user_id>', methods=['PUT'])
def edit_user(user_id):
    data = request.json
    try:
        poke_user.edit_user(user_id, **data)
        return jsonify({"message": "User updated successfully"}), 200
    except ValueError as e:
        return jsonify({"error": str(e)}), 400

@app.route('/user/checkpassword', methods=['GET'])
def check_user_password():
    user_name = request.args.get('user_name')
    user_password = request.args.get('user_password')
    user_id = poke_user.check_password(user_name, user_password)

    if user_id:
        return jsonify(user_id), 200
    else:
        return jsonify(None), 200


# Pockemon Rating logic
@app.route('/rating/add', methods=['POST'])
def add_rating():
    data = request.json
    pokemon_id = data.get('pokemon_id')
    user_id = data.get('user_id')
    rating = data.get('rating')

    if not all([pokemon_id, user_id, rating]):
        return jsonify({"error": "Missing data for pokemon_id, user_id, or rating"}), 400
    pokemon_rating.add_rating(pokemon_id, user_id, rating)
    return jsonify({"message": "Rating added successfully"}), 201

@app.route('/rating/pokemon/<int:pokemon_id>', methods=['GET'])
def get_ratings_by_pokemon(pokemon_id):
    ratings = pokemon_rating.get_ratings_by_pokemon(pokemon_id)
    return jsonify(ratings), 200

@app.route('/rating/user/<int:user_id>', methods=['GET'])
def get_ratings_by_user(user_id):
    ratings = pokemon_rating.get_ratings_by_user(user_id)
    return jsonify(ratings), 200


# Pockemon Type logic
@app.route('/pokemon_type/add', methods=['POST'])
def add_pokemon_type():
    data = request.json
    type_title = data.get('type_title')

    if not type_title:
        return jsonify({'error': 'Type title is required'}), 400
    pokemon_type.add_type(type_title)
    return jsonify({'message': 'Pokemon type added successfully'}), 201

@app.route('/pokemon_type/<int:type_id>', methods=['GET'])
def get_pokemon_type(type_id):
    type_data = pokemon_type.get_type(type_id)
    if type_data:
        return jsonify({'type_id': type_data[0], 'type_title': type_data[1]}), 200
    else:
        return jsonify({'message': 'Pokemon type not found'}), 404


# User Role logic
@app.route('/user_role/add', methods=['POST'])
def add_role():
    data = request.json
    role_title = data.get('role_title')

    if not role_title:
        return jsonify({'error': 'Role title is required'}), 400
    role.add_role(role_title)
    return jsonify({'message': 'Role added successfully'}), 201

@app.route('/user_role/<int:role_id>', methods=['GET'])
def get_role(role_id):
    role_data = role.get_role(role_id)
    if role_data:
        return jsonify({'role_id': role_data[0],'role_title': role_data[1]}), 200
    else:
        return jsonify({'error': 'Role not found'}), 404


# Pockemon XP Group logic
@app.route('/xp_group/add', methods=['POST'])
def add_xp_group():
    data = request.json
    group_title = data.get('group_title')

    if not group_title:
        return jsonify({"error": "Missing group_title"}), 400
    xp_group.add_group(group_title)
    return jsonify({"success": True, "message": "XP Group added successfully"}), 201

@app.route('/xp_group/<int:group_id>', methods=['GET'])
def get_xp_group(group_id):
    group = xp_group.get_group(group_id)
    if group:
        return jsonify({"group_id": group[0], "group_title": group[1]}), 200
    else:
        return jsonify({"message": "XP Group not found"}), 404


# Pokemon logic
@app.route('/pokemon/add', methods=['POST'])
def add_pokemon():
    data = request.json

    if not all(
        data['pokemon_title'],
        data['pokemon_photo'],
        data['pokemon_name'],
        data['pokemon_number'],
        data['pokemon_type'],
        data['pokemon_height'],
        data['pokemon_weight'],
        data['pokemon_xp_group'],
        data['pokemon_abilities'],
        data['pokemon_breed_period'],
        data['pokemon_sex_ratio'],
        data['pokemon_total_amount'],
        data['pokemon_shine'],
        data['pokemon_rarity'],
        data['pokemon_health'],
        data['pokemon_attack'],
        data['pokemon_defence'],
        data['pokemon_speed'],
        data['pokemon_special_attack'],
        data['pokemon_special_defence'],
        data['pokemon_summ']):
        return jsonify({"error": "Missing data"}), 400
        
    pokemon.add_pokemon(
        data['pokemon_title'],
        data['pokemon_photo'],
        data['pokemon_name'],
        data['pokemon_number'],
        data['pokemon_type'],
        data['pokemon_height'],
        data['pokemon_weight'],
        data['pokemon_xp_group'],
        data['pokemon_abilities'],
        data['pokemon_breed_period'],
        data['pokemon_sex_ratio'],
        data['pokemon_total_amount'],
        data['pokemon_shine'],
        data['pokemon_rarity'],
        data['pokemon_health'],
        data['pokemon_attack'],
        data['pokemon_defence'],
        data['pokemon_speed'],
        data['pokemon_special_attack'],
        data['pokemon_special_defence'],
        data['pokemon_summ'])
    return jsonify({'message': 'Pokemon added successfully'}), 201

@app.route('/pokemon/<int:pokemon_id>', methods=['GET'])
def get_pokemon(pokemon_id):
    pokemon_data = pokemon.get_pokemon(pokemon_id)
    if pokemon_data:
        return jsonify({
            'pokemon_id': pokemon_data[0],
            'pokemon_title': pokemon_data[1],
            'pokemon_photo': pokemon_data[2],
            'pokemon_name': pokemon_data[3],
            'pokemon_number': pokemon_data[4],
            'pokemon_type': pokemon_data[5],
            'pokemon_height': pokemon_data[6],
            'pokemon_weight': pokemon_data[7],
            'pokemon_xp_group': pokemon_data[8],
            'pokemon_abilities': pokemon_data[9],
            'pokemon_breed_period': pokemon_data[10],
            'pokemon_sex_ratio': pokemon_data[11],
            'pokemon_total_amount': pokemon_data[12],
            'pokemon_shine': pokemon_data[13],
            'pokemon_rarity': pokemon_data[14],
            'pokemon_health': pokemon_data[15],
            'pokemon_attack': pokemon_data[16],
            'pokemon_defence': pokemon_data[17],
            'pokemon_speed': pokemon_data[18],
            'pokemon_special_attack': pokemon_data[19],
            'pokemon_special_defence': pokemon_data[20],
            'pokemon_summ': pokemon_data[21]
        }), 200
    else:
        return jsonify({'message': 'Pokemon not found'}), 404


@app.route('/pokemon', methods=['GET'])
def get_all_pokemons():
    page = request.args.get('page', 1, type=int)
    pageSize = request.args.get('pageSize', 10, type=int)
    
    total_count = pokemon.get_total_pokemons_count()
    totalPages = (total_count + pageSize - 1) // pageSize
    pokemon_data = pokemon.get_all_pokemons(page, pageSize)

    pokemons = []
    for data in pokemon_data:
        pokemons.append({
            'pokemon_id': data[0],
            'pokemon_title': data[1],
            'pokemon_photo': data[2],
            'pokemon_name': data[3],
            'pokemon_number': data[4],
            'pokemon_type': data[5],
            'pokemon_height': data[6],
            'pokemon_weight': data[7],
            'pokemon_xp_group': data[8],
            'pokemon_abilities': data[9],
            'pokemon_breed_period': data[10],
            'pokemon_sex_ratio': data[11],
            'pokemon_total_amount': data[12],
            'pokemon_shine': data[13],
            'pokemon_rarity': data[14],
            'pokemon_health': data[15],
            'pokemon_attack': data[16],
            'pokemon_defence': data[17],
            'pokemon_speed': data[18],
            'pokemon_special_attack': data[19],
            'pokemon_special_defence': data[20],
            'pokemon_summ': data[21]
        })

    response = {
        'pokemons': pokemons,
        'page': page,
        'page_size': pageSize,
        'total_pages': totalPages,
        'total_pokemons': total_count
    }

    return jsonify(response), 200


@app.route('/pokemon/of_day', methods=['GET'])
def get_id_pokemon_of_day():

    pokemon_id = pokemon.get_id_pokemon_of_day(datetime.today().strftime('%Y-%m-%d'))

    return jsonify(pokemon_id), 200

@app.route('/pokemon/of_month', methods=['GET'])
def get_id_pokemon_of_month():
    datetime.today().strftime('%Y-%m-%d')
    pokemon_id = pokemon.get_id_pokemon_of_day(datetime.today().strftime('%Y-%m'))

    return jsonify(pokemon_id), 200



# Run app
if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)