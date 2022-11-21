from client import Client
from generate import get_random_appointment

config = {
    "host": "localhost",
    "port": 5432,
    "user": "postgres",
    "password": "changeme"
}

sql_insert_query = """
    INSERT INTO appointment (patient_id, staff_id, dttm_of_appointment)
    VALUES (%s, %s, %s)
"""


def _main():
    client = Client(**config)

    client.execute_query(sql_insert_query, get_random_appointment())

    rows_cnt = client.get_row("SELECT COUNT(*) FROM appointment")
    print(rows_cnt)


if __name__ == "__main__":
    _main()
