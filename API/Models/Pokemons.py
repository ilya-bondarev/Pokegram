from datetime import datetime
import hashlib

class Pokemon:
    def __init__(self, db_connection):
        self.db = db_connection

    def add_pokemon(self, pokemon_data):
            # Insert into pokemons table
        self.db.cursor.execute("""
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
        pokemon_id = self.db.cursor.fetchone()[0]

            # Insert into pokemon_breeding table
        self.db.cursor.execute("""
                INSERT INTO pokemon_breeding (pokemon_id, breed_period, sex_ratio)
                VALUES (%s, %s, %s);
            """, (pokemon_id, pokemon_data['breed_period'], pokemon_data['sex_ratio']))

            # Insert into pokemon_stats table
        self.db.cursor.execute("""
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

        self.db.commit()

    def get_pokemon(self, pokemon_id):
        self.db.cursor.execute("""
SELECT 
    p.pokemon_id,
    p.pokemon_title,
    d.pokemon_photo,
    p.pokemon_name,
    NULL AS pokemon_number,  -- Always NULL
    p.pokemon_type,
    d.pokemon_height,
    d.pokemon_weight,
    p.pokemon_xp_group,
    STRING_AGG(a.ability_name, '   ') AS pokemon_abilities,
    d.pokemon_breed_period,
    d.pokemon_sex_ratio,
    d.pokemon_total_amount,
    d.pokemon_shine,
    d.pokemon_rarity,
    s.pokemon_health,
    s.pokemon_attack,
    s.pokemon_defence,
    s.pokemon_speed,
    s.pokemon_special_attack,
    s.pokemon_special_defence,
    s.pokemon_total_sum
FROM 
    public.pokemons p
JOIN 
    public.pokemon_details d ON p.pokemon_id = d.pokemon_id
JOIN 
    public.pokemon_stats s ON p.pokemon_id = s.pokemon_id
LEFT JOIN 
    public.pokemon_abilities pa ON p.pokemon_id = pa.pokemon_id
LEFT JOIN 
    public.abilities a ON pa.ability_id = a.ability_id
WHERE 
    p.pokemon_id = %s
GROUP BY 
    p.pokemon_id""", (pokemon_id,))
        return self.db.cursor.fetchone()

    
    def get_all_pokemons(self, page=1, pageSize=10):
        offset = (page - 1) * pageSize
        self.db.cursor.execute("""
                SELECT 
                    p.pokemon_id,
                    p.pokemon_title,
                    d.pokemon_photo,
                    p.pokemon_name,
                    p.pokemon_type,
                    d.pokemon_height,
                    d.pokemon_weight,
                    p.pokemon_xp_group,
                    STRING_AGG(a.ability_name, '   ') AS pokemon_abilities,
                    d.pokemon_breed_period,
                    d.pokemon_sex_ratio,
                    d.pokemon_total_amount,
                    d.pokemon_shine,
                    d.pokemon_rarity,
                    s.pokemon_health,
                    s.pokemon_attack,
                    s.pokemon_defence,
                    s.pokemon_speed,
                    s.pokemon_special_attack,
                    s.pokemon_special_defence,
                    s.pokemon_total_sum
                FROM 
                    public.pokemons p
                LEFT JOIN 
                    public.pokemon_details d ON p.pokemon_id = d.pokemon_id
                LEFT JOIN 
                    public.pokemon_stats s ON p.pokemon_id = s.pokemon_id
                LEFT JOIN 
                    public.pokemon_abilities pa ON p.pokemon_id = pa.pokemon_id
                LEFT JOIN 
                    public.abilities a ON pa.ability_id = a.ability_id
                GROUP BY 
                    p.pokemon_id, d.pokemon_photo, d.pokemon_height, d.pokemon_weight, d.pokemon_breed_period, 
                    d.pokemon_sex_ratio, d.pokemon_total_amount, d.pokemon_shine, d.pokemon_rarity, 
                    s.pokemon_health, s.pokemon_attack, s.pokemon_defence, s.pokemon_speed, 
                    s.pokemon_special_attack, s.pokemon_special_defence, s.pokemon_total_sum,
                    p.pokemon_title, p.pokemon_name, p.pokemon_type, p.pokemon_xp_group
                ORDER BY 
                    p.pokemon_id
                LIMIT 
                    %s
                OFFSET 
                    %s; 
            """, (pageSize, offset))
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