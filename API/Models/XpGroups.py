class XPGroup:
    def __init__(self, db_connection):
        self.db = db_connection

    def add_group(self, group_title):
        insert_query = "INSERT INTO xp_groups (group_title) VALUES (%s);"
        self.db.cursor.execute(insert_query, (group_title,))

    def get_group(self, group_id):
        select_query = "SELECT * FROM xp_groups WHERE group_id = %s;"
        self.db.cursor.execute(select_query, (group_id,))
        return self.db.cursor.fetchone()