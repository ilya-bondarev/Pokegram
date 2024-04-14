from datetime import datetime
import hashlib

class Pokemon:
    def __init__(self, db_connection):
        self.db = db_connection

    def add_pokemon(self, pokemon_data):
        with self.db.cursor as cursor:
            # Insert into pokemons table
            cursor.execute("""
                INSERT INTO pokemons (
                    pokemon_number, pokemon_xp_group, pokemon_total_amount,
                    pokemon_shine, pokemon_rarity, pokemon_title, pokemon_photo,
                    pokemon_name, pokemon_abilities
                ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s) RETURNING pokemon_id;
            """, (
                pokemon_data['pokemon_number'], pokemon_data['pokemon_xp_group'],
                pokemon_data['pokemon_total_amount'], pokemon_data['pokemon_shine'],
                pokemon_data['pokemon_rarity'], pokemon_data['pokemon_title'],
                pokemon_data['pokemon_photo'], pokemon_data['pokemon_name'],
                pokemon_data['pokemon_abilities']
            ))
            pokemon_id = cursor.fetchone()[0]

            # Insert into pokemon_breeding table
            cursor.execute("""
                INSERT INTO pokemon_breeding (pokemon_id, breed_period, sex_ratio)
                VALUES (%s, %s, %s);
            """, (pokemon_id, pokemon_data['breed_period'], pokemon_data['sex_ratio']))

            # Insert into pokemon_stats table
            cursor.execute("""
                INSERT INTO pokemon_stats (
                    pokemon_id, health, attack, defence, speed,
                    special_attack, special_defence, summ
                ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s);
            """, (
                pokemon_id, pokemon_data['health'], pokemon_data['attack'],
                pokemon_data['defence'], pokemon_data['speed'],
                pokemon_data['special_attack'], pokemon_data['special_defence'],
                pokemon_data['summ']
            ))

            # Assuming pokemon_type and xp_groups are managed elsewhere as they involve lookups

        self.db.commit()

    def get_pokemon(self, pokemon_id):
        with self.db.cursor as cursor:
            cursor.execute("""
                SELECT p.*, b.breed_period, b.sex_ratio, s.health, s.attack,
                    s.defence, s.speed, s.special_attack, s.special_defence, s.summ
                FROM pokemons p
                LEFT JOIN pokemon_breeding b ON p.pokemon_id = b.pokemon_id
                LEFT JOIN pokemon_stats s ON p.pokemon_id = s.pokemon_id
                WHERE p.pokemon_id = %s;
            """, (pokemon_id,))
            return cursor.fetchone()

    
    def get_all_pokemons(self, page=1, pageSize=10):
        offset = (page - 1) * pageSize
        with self.db.cursor as cursor:
            cursor.execute("""
                SELECT p.*, b.breed_period, b.sex_ratio, s.health, s.attack,
                    s.defence, s.speed, s.special_attack, s.special_defence, s.summ
                FROM pokemons p
                LEFT JOIN pokemon_breeding b ON p.pokemon_id = b.pokemon_id
                LEFT JOIN pokemon_stats s ON p.pokemon_id = s.pokemon_id
                LIMIT %s OFFSET %s;
            """, (pageSize, offset))
            return cursor.fetchall()

    
    def get_total_pokemons_count(self):
        count_query = "SELECT COUNT(*) FROM pokemons"
        self.db.cursor.execute(count_query)
        return self.db.cursor.fetchone()[0]

    def get_id_pokemon_of_day(self, date_str):
        
        # Используем хэш-функцию для генерации уникального значения
        hash_result = hashlib.sha256(date_str.encode())
        
        # Преобразуем хэш в число
        hash_number = int(hash_result.hexdigest(), base=16)
        
        # Получаем уникальное число от 0 до 999, используя остаток от деления
        unique_number = hash_number % 1200
        
        return unique_number

    def get_id_pokemon_of_month(self, date_str):
        
        # Используем хэш-функцию для генерации уникального значения
        hash_result = hashlib.sha256(date_str.encode())
        
        # Преобразуем хэш в число
        hash_number = int(hash_result.hexdigest(), base=16)
        
        # Получаем уникальное число от 0 до 999, используя остаток от деления
        unique_number = hash_number % 1200
        
        return unique_number