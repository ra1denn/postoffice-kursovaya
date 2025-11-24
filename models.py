from sqlmodel import SQLModel, Field
from typing import Optional
from datetime import datetime

# Клиенты
class Клиент(SQLModel, table=True):
    __tablename__ = "клиент"
    id: Optional[int] = Field(default=None, primary_key=True)
    имя: str
    фамилия: str
    телефон: Optional[str] = None
    электронная_почта: Optional[str] = None
    адрес: Optional[str] = None

# Отделения
class Отделение(SQLModel, table=True):
    __tablename__ = "отделение"
    id: Optional[int] = Field(default=None, primary_key=True)
    код: str
    адрес: Optional[str] = None
    телефон: Optional[str] = None

# Сотрудники
class Сотрудник(SQLModel, table=True):
    __tablename__ = "сотрудник"
    id: Optional[int] = Field(default=None, primary_key=True)
    имя: str
    фамилия: str
    телефон: Optional[str] = None
    электронная_почта: Optional[str] = None
    роль: str
    отделение_id: Optional[int] = Field(default=None, foreign_key="отделение.id")

# Отправления
class Отправление(SQLModel, table=True):
    __tablename__ = "отправление"
    id: str = Field(primary_key=True)
    тип: Optional[str] = None
    вес: Optional[float] = None
    отправитель_id: Optional[int] = Field(default=None, foreign_key="клиент.id")
    получатель_id: Optional[int] = Field(default=None, foreign_key="клиент.id")
    адрес_отправителя: Optional[str] = None
    адрес_получателя: Optional[str] = None
    текущий_статус: Optional[str] = None

# История статусов
class ИсторияСтатусов(SQLModel, table=True):
    __tablename__ = "история_статусов"
    id: Optional[int] = Field(default=None, primary_key=True)
    отправление_id: str = Field(foreign_key="отправление.id")
    время: datetime
    статус: str
    отделение_id: Optional[int] = Field(default=None, foreign_key="отделение.id")
    комментарий: Optional[str] = None

# Маршруты отправлений
class Маршрут(SQLModel, table=True):
    __tablename__ = "маршрут"
    id: Optional[int] = Field(default=None, primary_key=True)
    отправление_id: str = Field(foreign_key="отправление.id")
    отделение_откуда_id: Optional[int] = Field(default=None, foreign_key="отделение.id")
    отделение_куда_id: Optional[int] = Field(default=None, foreign_key="отделение.id")
    время_отправления: Optional[datetime] = None
    время_прибытия: Optional[datetime] = None

# Платежи
class Оплата(SQLModel, table=True):
    __tablename__ = "оплата"
    id: Optional[int] = Field(default=None, primary_key=True)
    отправление_id: Optional[str] = Field(default=None, foreign_key="отправление.id")
    клиент_id: Optional[int] = Field(default=None, foreign_key="клиент.id")
    сумма: Optional[float] = None
    способ: Optional[str] = None
    время: datetime

# Заявки / тикеты
class Заявка(SQLModel, table=True):
    __tablename__ = "заявка"
    id: Optional[int] = Field(default=None, primary_key=True)
    клиент_id: Optional[int] = Field(default=None, foreign_key="клиент.id")
    отправление_id: Optional[str] = Field(default=None, foreign_key="отправление.id")
    время_создания: datetime
    тип: Optional[str] = None
    описание: Optional[str] = None
    результат: Optional[str] = None
