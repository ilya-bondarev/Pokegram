from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
from flask import Flask, request, jsonify
from datetime import datetime
from flask import Flask
import hashlib

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:admin@localhost/postgres'
db = SQLAlchemy(app)
bcrypt = Bcrypt(app)


#user
class User(db.Model):
    user_id = db.Column(db.Integer, primary_key=True)
    user_name = db.Column(db.String(80), unique=True, nullable=False)
    user_totem_pokemon = db.Column(db.String(80), nullable=False)
    user_password = db.Column(db.String(120), nullable=False)
    user_role = db.Column(db.String(80), nullable=False)

@app.route('/user', methods=['GET'])
def get_all_users():
    users = User.query.all()
    result = [{
        'user_id': user.user_id,
        'user_name': user.user_name,
        'user_totem_pokemon': user.user_totem_pokemon,
        'user_password': user.user_password,
        'user_role': user.user_role
    } for user in users]
    return jsonify(result), 200

@app.route('/user/add', methods=['POST'])
def add_user():
    data = request.json
    if not all([data.get('user_name'), data.get('user_totem_pokemon'), data.get('user_password'), data.get('user_role')]):
        return jsonify({"error": "Missing data"}), 400

    if User.query.filter_by(user_name=data['user_name']).first() is not None:
        return jsonify({"error": "User with this username already exists"}), 400

    hashed_password = bcrypt.generate_password_hash(data['user_password']).decode('utf-8')
    new_user = User(
        user_name=data['user_name'],
        user_totem_pokemon=data['user_totem_pokemon'],
        user_password=hashed_password,
        user_role=data['user_role']
    )
    db.session.add(new_user)
    db.session.commit()
    return jsonify({"message": "User added successfully"}), 201

@app.route('/user/<int:user_id>', methods=['GET'])
def get_user(user_id):
    user = User.query.get(user_id)
    if user:
        user_data = {
            'user_id': user.user_id,
            'user_name': user.user_name,
            'user_totem_pokemon': user.user_totem_pokemon,
            'user_password': user.user_password,
            'user_role': user.user_role
        }
        return jsonify(user_data), 200
    else:
        return jsonify({"error": "User not found"}), 404

@app.route('/user/delete/<int:user_id>', methods=['DELETE'])
def delete_user(user_id):
    user = User.query.get(user_id)
    if user:
        db.session.delete(user)
        db.session.commit()
        return jsonify({"message": "User deleted successfully"}), 200
    else:
        return jsonify({"error": "User not found"}), 404

@app.route('/user/edit/<int:user_id>', methods=['PUT'])
def edit_user(user_id):
    user = User.query.get(user_id)
    data = request.json
    if user:
        user.user_name = data.get('user_name', user.user_name)
        user.user_totem_pokemon = data.get('user_totem_pokemon', user.user_totem_pokemon)
        if data.get('user_password'):
            user.user_password = bcrypt.generate_password_hash(data['user_password']).decode('utf-8')
        user.user_role = data.get('user_role', user.user_role)
        db.session.commit()
        return jsonify({"message": "User updated successfully"}), 200
    else:
        return jsonify({"error": "User not found"}), 404

@app.route('/user/checkpassword', methods=['GET'])
def check_user_password():
    user_name = request.args.get('user_name')
    user_password = request.args.get('user_password')
    user = User.query.filter_by(user_name=user_name).first()
    if user and bcrypt.check_password_hash(user.user_password, user_password):
        return jsonify(user.user_id), 200
    else:
        return jsonify(None), 200


#user_activity
class UserActivity(db.Model):
    activity_id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('user.user_id'), nullable=False)
    activity = db.Column(db.String(255), nullable=False)
    timestamp = db.Column(db.DateTime, nullable=False)

@app.route('/user_activity/add', methods=['POST'])
def add_user_activity():
    data = request.json
    user_id = data.get('user_id')
    activity = data.get('activity')
    timestamp = data.get('timestamp')

    if not all([user_id, activity, timestamp]):
        return jsonify({'error': 'Missing data'}), 400
    
    new_activity = UserActivity(user_id=user_id, activity=activity, timestamp=timestamp)
    db.session.add(new_activity)
    db.session.commit()
    return jsonify({'message': 'Activity added successfully'}), 201

@app.route('/user_activity/<int:activity_id>', methods=['GET'])
def get_user_activity(activity_id):
    activity = UserActivity.query.get(activity_id)
    if activity:
        return jsonify({
            'activity_id': activity.activity_id,
            'user_id': activity.user_id,
            'activity': activity.activity,
            'timestamp': activity.timestamp
        }), 200
    else:
        return jsonify({'error': 'Activity not found'}), 404

@app.route('/user_activity/user/<int:user_id>', methods=['GET'])
def get_activities_by_user(user_id):
    activities = UserActivity.query.filter_by(user_id=user_id).order_by(UserActivity.timestamp.desc()).all()
    answer = [{
        'activity_id': activity.activity_id,
        'user_id': activity.user_id,
        'activity': activity.activity,
        'timestamp': activity.timestamp
    } for activity in activities]
    return jsonify(answer), 200

#user_role
class Role(db.Model):
    role_id = db.Column(db.Integer, primary_key=True)
    role_title = db.Column(db.String(100), unique=True, nullable=False)

@app.route('/user_role/add', methods=['POST'])
def add_role():
    data = request.json
    role_title = data.get('role_title')

    if not role_title:
        return jsonify({'error': 'Role title is required'}), 400

    # Check if the role already exists
    if Role.query.filter_by(role_title=role_title).first():
        return jsonify({'error': 'Role already exists'}), 400

    new_role = Role(role_title=role_title)
    db.session.add(new_role)
    db.session.commit()
    return jsonify({'message': 'Role added successfully'}), 201

@app.route('/user_role/<int:role_id>', methods=['GET'])
def get_role(role_id):
    role = Role.query.get(role_id)
    if role:
        return jsonify({'role_id': role.role_id, 'role_title': role.role_title}), 200
    else:
        return jsonify({'error': 'Role not found'}), 404


#pokemon..
class Pokemon(db.Model):
    pokemon_id = db.Column(db.Integer, primary_key=True)
    pokemon_number = db.Column(db.Integer, nullable=False)
    pokemon_xp_group = db.Column(db.Integer, db.ForeignKey('xp_groups.group_id'))
    pokemon_total_amount = db.Column(db.Integer)
    pokemon_shine = db.Column(db.Integer)
    pokemon_rarity = db.Column(db.Float)
    pokemon_title = db.Column(db.String, nullable=False)
    pokemon_photo = db.Column(db.Text)
    pokemon_name = db.Column(db.String, nullable=False)
    pokemon_abilities = db.Column(db.Text)  # Assume simple text for demo, should be relation to abilities table

    physical = db.relationship('PokemonPhysical', backref='pokemon', uselist=False)
    breeding = db.relationship('PokemonBreeding', backref='pokemon', uselist=False)
    stats = db.relationship('PokemonStats', backref='pokemon', uselist=False)

class PokemonBreeding(db.Model):
    pokemon_id = db.Column(db.Integer, db.ForeignKey('pokemons.pokemon_id'), primary_key=True)
    breed_period = db.Column(db.Integer)
    sex_ratio = db.Column(db.String)

class PokemonStats(db.Model):
    pokemon_id = db.Column(db.Integer, db.ForeignKey('pokemons.pokemon_id'), primary_key=True)
    health = db.Column(db.Integer)
    attack = db.Column(db.Integer)
    defence = db.Column(db.Integer)
    speed = db.Column(db.Integer)
    special_attack = db.Column(db.Integer)
    special_defence = db.Column(db.Integer)
    summ = db.Column(db.Integer)

class PokemonPhysical(db.Model):
    pokemon_id = db.Column(db.Integer, db.ForeignKey('pokemons.pokemon_id'), primary_key=True)
    height = db.Column(db.Float)
    weight = db.Column(db.Float)

class XpGroups(db.Model):
    group_id = db.Column(db.Integer, primary_key=True)
    group_title = db.Column(db.String, nullable=False)

@app.route('/pokemon/add', methods=['POST'])
def add_pokemon():
    data = request.json
    # Create instances for all tables related to a Pokemon
    new_pokemon = Pokemon(
        pokemon_number=data['pokemon_number'],
        pokemon_xp_group=data['pokemon_xp_group'],
        pokemon_total_amount=data['pokemon_total_amount'],
        pokemon_shine=data['pokemon_shine'],
        pokemon_rarity=data['pokemon_rarity'],
        pokemon_title=data['pokemon_title'],
        pokemon_photo=data['pokemon_photo'],
        pokemon_name=data['pokemon_name'],
        pokemon_abilities=data['pokemon_abilities']
    )
    new_physical = PokemonPhysical(
        height=data['pokemon_height'],
        weight=data['pokemon_weight'],
        pokemon=new_pokemon
    )
    new_breeding = PokemonBreeding(
        breed_period=data['pokemon_breed_period'],
        sex_ratio=data['pokemon_sex_ratio'],
        pokemon=new_pokemon
    )
    new_stats = PokemonStats(
        health=data['pokemon_health'],
        attack=data['pokemon_attack'],
        defence=data['pokemon_defence'],
        speed=data['pokemon_speed'],
        special_attack=data['pokemon_special_attack'],
        special_defence=data['pokemon_special_defence'],
        summ=data['pokemon_summ'],
        pokemon=new_pokemon
    )
    
    db.session.add(new_pokemon)
    db.session.add(new_physical)
    db.session.add(new_breeding)
    db.session.add(new_stats)
    db.session.commit()
    
    return jsonify({'message': 'Pokemon added successfully'}), 201

@app.route('/pokemon/<int:pokemon_id>', methods=['GET'])
def get_pokemon(pokemon_id):
    pokemon = Pokemon.query.get(pokemon_id)
    if pokemon:
        response_data = {
            'pokemon_id': pokemon.pokemon_id,
            'pokemon_title': pokemon.pokemon_title,
            'pokemon_photo': pokemon.pokemon_photo,
            'pokemon_name': pokemon.pokemon_name,
            'pokemon_number': pokemon.pokemon_number,
            'pokemon_type': pokemon.pokemon_abilities,  # Assuming simple for demo
            'pokemon_height': pokemon.physical.height if pokemon.physical else None,
            'pokemon_weight': pokemon.physical.weight if pokemon.physical else None,
            'pokemon_xp_group': pokemon.pokemon_xp_group,
            'pokemon_abilities': pokemon.pokemon_abilities,
            'pokemon_breed_period': pokemon.breeding.breed_period if pokemon.breeding else None,
            'pokemon_sex_ratio': pokemon.breeding.sex_ratio if pokemon.breeding else None,
            'pokemon_total_amount': pokemon.pokemon_total_amount,
            'pokemon_shine': pokemon.pokemon_shine,
            'pokemon_rarity': pokemon.pokemon_rarity,
            'pokemon_health': pokemon.stats.health if pokemon.stats else None,
            'pokemon_attack': pokemon.stats.attack if pokemon.stats else None,
            'pokemon_defence': pokemon.stats.defence if pokemon.stats else None,
            'pokemon_speed': pokemon.stats.speed if pokemon.stats else None,
            'pokemon_special_attack': pokemon.stats.special_attack if pokemon.stats else None,
            'pokemon_special_defence': pokemon.stats.special_defence if pokemon.stats else None,
            'pokemon_summ': pokemon.stats.summ if pokemon.stats else None
        }
        return jsonify(response_data), 200
    else:
        return jsonify({'error': 'Pokemon not found'}), 404

@app.route('/pokemon', methods=['GET'])
def get_all_pokemons():
    page = request.args.get('page', 1, type=int)
    pageSize = request.args.get('pageSize', 10, type=int)

    total_count = Pokemon.query.count()
    totalPages = (total_count + pageSize - 1) // pageSize
    pokemons = Pokemon.query.offset((page-1) * pageSize).limit(pageSize).all()

    pokemons_data = [{
        'pokemon_id': pokemon.pokemon_id,
        'pokemon_title': pokemon.pokemon_title,
        'pokemon_photo': pokemon.pokemon_photo,
        'pokemon_name': pokemon.pokemon_name,
        'pokemon_number': pokemon.pokemon_number,
        'pokemon_type': pokemon.pokemon_abilities,
        'pokemon_height': pokemon.physical.height if pokemon.physical else None,
        'pokemon_weight': pokemon.physical.weight if pokemon.physical else None,
        'pokemon_xp_group': pokemon.pokemon_xp_group,
        'pokemon_abilities': pokemon.pokemon_abilities,
        'pokemon_breed_period': pokemon.breeding.breed_period if pokemon.breeding else None,
        'pokemon_sex_ratio': pokemon.breeding.sex_ratio if pokemon.breeding else None,
        'pokemon_total_amount': pokemon.pokemon_total_amount,
        'pokemon_shine': pokemon.pokemon_shine,
        'pokemon_rarity': pokemon.pokemon_rarity,
        'pokemon_health': pokemon.stats.health if pokemon.stats else None,
        'pokemon_attack': pokemon.stats.attack if pokemon.stats else None,
        'pokemon_defence': pokemon.stats.defence if pokemon.stats else None,
        'pokemon_speed': pokemon.stats.speed if pokemon.stats else None,
        'pokemon_special_attack': pokemon.stats.special_attack if pokemon.stats else None,
        'pokemon_special_defence': pokemon.stats.special_defence if pokemon.stats else None,
        'pokemon_summ': pokemon.stats.summ if pokemon.stats else None
    } for pokemon in pokemons]

    response = {
        'pokemons': pokemons_data,
        'page': page,
        'page_size': pageSize,
        'total_pages': totalPages,
        'total_pokemons': total_count
    }

    return jsonify(response), 200

@app.route('/pokemon/of_day', methods=['GET'])
def get_id_pokemon_of_day():
    date_str = datetime.today().strftime('%Y-%m-%d')
    hash_result = hashlib.sha256(date_str.encode())
    hash_number = int(hash_result.hexdigest(), base=16)
    pokemon_id = hash_number % 1200  # Ensure this range aligns with your actual Pokemon ID range
    return jsonify({pokemon_id}), 200

@app.route('/pokemon/of_month', methods=['GET'])
def get_id_pokemon_of_month():
    date_str = datetime.today().strftime('%Y-%m')
    hash_result = hashlib.sha256(date_str.encode())
    hash_number = int(hash_result.hexdigest(), base=16)
    pokemon_id = hash_number % 1200  # Ensure this range aligns with your actual Pokemon ID range
    return jsonify({pokemon_id}), 200