# postoffice-kursovaya



* Установка зависимостей: pip install fastapi uvicorn sqlmodel psycopg2
* Проект использует PostgreSQL. Строка подключения указана в файле database.py: DATABASE\_URL = "postgresql://postgres:1234@localhost:5432/postoffice"
* Создайте базу данных через pgAdmin или SQL-команду: CREATE DATABASE postoffice;
* Чтобы наполнить базу данных начальными данными, выполните: python populate\_db.py
* Запустите сервер FastAPI: uvicorn main:app --reload
* После запуска проект будет доступен по адресу: http://127.0.0.1:8000/docs
