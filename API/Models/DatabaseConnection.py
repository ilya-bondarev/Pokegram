import psycopg2

class DatabaseConnection:
    def __init__(self, dbname, user, password, host='localhost'):
        self.connection = psycopg2.connect(
            dbname=dbname,
            user=user,
            password=password,
            host=host
        )
        self.connection.autocommit = True
        self.cursor = self.connection.cursor()

    def close(self):
        self.cursor.close()
        self.connection.close()