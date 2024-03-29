class PokemonRating:
    def __init__(self, db_connection):
        self.db = db_connection

    def add_rating(self, pokemon_id, user_id, rating):
        insert_query = """
        INSERT INTO pokemons_ratings (pokemon_id, user_id, rating)
        VALUES (%s, %s, %s);
        """
        self.db.cursor.execute(insert_query, (pokemon_id, user_id, rating))

    def get_ratings_by_pokemon(self, pokemon_id):
        select_query = "SELECT * FROM pokemons_ratings WHERE pokemon_id = %s;"
        self.db.cursor.execute(select_query, (pokemon_id,))
        return self.db.cursor.fetchall()

    def get_ratings_by_user(self, user_id):
        select_query = "SELECT * FROM pokemons_ratings WHERE user_id = %s;"
        self.db.cursor.execute(select_query, (user_id,))
        return self.db.cursor.fetchall()