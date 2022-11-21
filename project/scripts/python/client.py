import psycopg2


class Client(object):
    def __init__(self, host, port, user, password=None):
        if password is None:
            password = 'defualt'
        try:
            self.__conn = psycopg2.connect(host=host, port=port, user=user, password=password)
            self.__cur = self.__conn.cursor()
        except Exception:
            print("Cannot connect to database.")

    def __exit__(self):
        self.__cur.close()
        self.__conn.close()

    def get_row(self, sql_query):
        self.__cur.execute(sql_query)
        return self.__cur.fetchall()

    def execute_query(self, sql_query, data):
        self.__cur.execute(sql_query, data)
        self.__conn.commit()






