# database.py
from sqlmodel import SQLModel, create_engine

# 🔹 Твоя строка подключения к PostgreSQL:
DATABASE_URL = "postgresql://postgres:1234@localhost:5432/postoffice"

# 🔹 Создаём движок SQLModel для соединения с базой:
engine = create_engine(DATABASE_URL, echo=True)  # echo=True — чтобы видеть SQL-запросы в консоли

# 🔹 Функция для создания всех таблиц
def init_db():
    SQLModel.metadata.create_all(engine)
