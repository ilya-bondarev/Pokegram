class UserActivity:
    def __init__(self, db_connection):
        self.db = db_connection

    def add_activity(self, user_id, activity, timestamp):
        insert_query = """
        INSERT INTO user_activities (user_id, activity, timestamp)
        VALUES (%s, %s, %s);
        """
        self.db.cursor.execute(insert_query, (user_id, activity, timestamp))

    def get_activity_by_id(self, activity_id):
        select_query = "SELECT * FROM user_activities WHERE activity_id = %s;"
        self.db.cursor.execute(select_query, (activity_id,))
        return self.db.cursor.fetchone()

    def get_activities_by_user(self, user_id):
        select_query = "SELECT * FROM user_activities WHERE user_id = %s ORDER BY timestamp DESC;"
        self.db.cursor.execute(select_query, (user_id,))
        return self.db.cursor.fetchall()
    
    def get_all_activities(self):
        select_query = "SELECT * FROM user_activities ORDER BY timestamp DESC;"
        self.db.cursor.execute(select_query)
        return self.db.cursor.fetchall()