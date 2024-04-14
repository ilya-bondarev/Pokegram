from datetime import datetime
import hashlib

class Pokemon:
    def __init__(self, db_connection):
        self.db = db_connection

    def add_pokemon(self, pokemon_title, pokemon_photo, pokemon_name, pokemon_number, pokemon_type, pokemon_height, pokemon_weight, pokemon_xp_group, pokemon_abilities, pokemon_breed_period, pokemon_sex_ratio, pokemon_total_amount, pokemon_shine, pokemon_rarity, pokemon_health, pokemon_attack, pokemon_defence, pokemon_speed, pokemon_special_attack, pokemon_special_defence, pokemon_summ):
        insert_query = """
        INSERT INTO pokemons (pokemon_title, pokemon_photo, pokemon_name, pokemon_number, pokemon_type, pokemon_height, pokemon_weight, pokemon_xp_group, pokemon_abilities, pokemon_breed_period, pokemon_sex_ratio, pokemon_total_amount, pokemon_shine, pokemon_rarity, pokemon_health, pokemon_attack, pokemon_defence, pokemon_speed, pokemon_special_attack, pokemon_special_defence, pokemon_summ)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);
        """
        self.db.cursor.execute(insert_query, (pokemon_title, pokemon_photo, pokemon_name, pokemon_number, pokemon_type, pokemon_height, pokemon_weight, pokemon_xp_group, pokemon_abilities, pokemon_breed_period, pokemon_sex_ratio, pokemon_total_amount, pokemon_shine, pokemon_rarity, pokemon_health, pokemon_attack, pokemon_defence, pokemon_speed, pokemon_special_attack, pokemon_special_defence, pokemon_summ))

    def get_pokemon(self, pokemon_id):
        select_query = "SELECT * FROM pokemons WHERE pokemon_id = %s;"
        self.db.cursor.execute(select_query, (pokemon_id,))
        return self.db.cursor.fetchone()
    
    def get_all_pokemons(self, page=1, pageSize=10):
        offset = (page - 1) * pageSize
        select_query = f"SELECT * FROM pokemons LIMIT {pageSize} OFFSET {offset}"
        self.db.cursor.execute(select_query)
        return self.db.cursor.fetchall()
    
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