class Role:
    def __init__(self, db_connection):
        self.db = db_connection

    def add_role(self, role_title):
        insert_query = "INSERT INTO roles (role_title) VALUES (%s);"
        self.db.cursor.execute(insert_query, (role_title,))

    def get_role(self, role_id):
        select_query = "SELECT * FROM roles WHERE role_id = %s;"
        self.db.cursor.execute(select_query, (role_id,))
        return self.db.cursor.fetchone()