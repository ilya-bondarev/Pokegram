import bcrypt

# def hash_password(password):
#     return bcrypt.hashpw(password.encode('utf-8'))
# def check_password(stored_password_hash, user_password):
#     return bcrypt.checkpw(user_password.encode('utf-8'), stored_password_hash)


class PokeUser:
    def __init__(self, db_connection):
        self.db = db_connection

    def user_exists(self, user_name):
        query = "SELECT * FROM poke_users WHERE user_name = %s;"
        self.db.cursor.execute(query, (user_name,))
        return self.db.cursor.fetchone() is not None

    def add_user(self, user_name, user_totem_pokemon, user_password, user_role):
        if self.user_exists(user_name):
            return False # User already exists

        hashed_password = bcrypt.hashpw(user_password.encode('utf-8'), bcrypt.gensalt()).decode('utf8')

        insert_query = """
        INSERT INTO poke_users (user_name, user_totem_pokemon, user_password, user_role)
        VALUES (%s, %s, %s, %s);
        """
        self.db.cursor.execute(insert_query, (user_name, user_totem_pokemon, hashed_password, user_role))
        return True # User added successfully

    def get_user(self, user_id):
        select_query = "SELECT * FROM poke_users WHERE user_id = %s;"
        self.db.cursor.execute(select_query, (user_id,))
        return self.db.cursor.fetchone()
    
    def delete_user(self, user_id):        
        delete_activities_query = "DELETE FROM user_activities WHERE user_id = %s;"
        self.db.cursor.execute(delete_activities_query, (user_id,))

        delete_query = "DELETE FROM poke_users WHERE user_id = %s;"
        self.db.cursor.execute(delete_query, (user_id,))
        self.db.connection.commit()
        return True
    
    def get_all_users(self):
        select_query = "SELECT * FROM poke_users;"
        self.db.cursor.execute(select_query)
        return self.db.cursor.fetchall()
    
    def check_password(self, user_name, user_password):
        select_query = "SELECT user_id, user_password FROM poke_users WHERE user_name = %s;"
        self.db.cursor.execute(select_query, (user_name,))
        result = self.db.cursor.fetchone()

        if result:
            user_id, stored_password_hash = result
            hashed_password = stored_password_hash.encode('utf-8')
            
            if bcrypt.checkpw(user_password.encode('utf-8'), hashed_password):
                return user_id
            else:
                return None
        else:
            return None