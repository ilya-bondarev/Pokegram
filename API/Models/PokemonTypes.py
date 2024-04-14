class PokemonType:
    def __init__(self, db_connection):
        self.db = db_connection

    def add_type(self, type_title):
        insert_query = "INSERT INTO pokemon_types (type_title) VALUES (%s);"
        self.db.cursor.execute(insert_query, (type_title,))

    def get_type(self, type_id):
        select_query = "SELECT * FROM pokemon_types WHERE type_id = %s;"
        self.db.cursor.execute(select_query, (type_id,))
        return self.db.cursor.fetchone()