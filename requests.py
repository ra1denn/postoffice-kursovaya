# requests.py
from datetime import datetime
from typing import List, Optional
from sqlmodel import Session, select
from models import Client, Shipment, StatusHistory, Route, Payment, Ticket, Branch, Employee

def register_shipment(session: Session, shipment: Shipment, payment: Optional[Payment] = None) -> Shipment:
    session.add(shipment)
    session.commit()
    session.refresh(shipment)
    # status
    status = StatusHistory(shipment_id=shipment.id, status="Зарегистрировано")
    session.add(status)
    if payment:
        payment.shipment_id = shipment.id
        session.add(payment)
    session.commit()
    session.refresh(shipment)
    return shipment

def get_new_shipments_for_sorting(session: Session, branch_id: Optional[int] = None) -> List[Shipment]:
    stmt = select(Shipment).where(Shipment.current_status == None)
    return session.exec(stmt).all()

def mark_as_sorted(session: Session, shipment_id: str, branch_id: Optional[int] = None, to_branch_id: Optional[int] = None):
    shipment = session.get(Shipment, shipment_id)
    if not shipment:
        raise ValueError("Shipment not found")
    shipment.current_status = "Отсортировано"
    session.add(StatusHistory(shipment_id=shipment_id, status="Отсортировано", branch_id=branch_id))
    if to_branch_id:
        session.add(Route(shipment_id=shipment_id, from_branch_id=branch_id, to_branch_id=to_branch_id, departure_at=datetime.utcnow()))
    session.add(shipment)
    session.commit()
    session.refresh(shipment)
    return shipment

def transport_batch(session: Session, shipment_ids: List[str], courier_id: int, to_branch_id: int):
    for sid in shipment_ids:
        shipment = session.get(Shipment, sid)
        if not shipment:
            continue
        shipment.current_status = "В пути"
        session.add(StatusHistory(shipment_id=sid, status="В пути", comment=f"Курьер {courier_id} везёт в {to_branch_id}"))
        session.add(Route(shipment_id=sid, to_branch_id=to_branch_id, departure_at=datetime.utcnow()))
        session.add(shipment)
    session.commit()

def confirm_arrival(session: Session, shipment_id: str, branch_id: int):
    shipment = session.get(Shipment, shipment_id)
    shipment.current_status = "Доставлено в отделение"
    session.add(StatusHistory(shipment_id=shipment_id, status="Доставлено в отделение", branch_id=branch_id))
    session.add(shipment)
    session.commit()
    session.refresh(shipment)
    return shipment

def deliver_to_recipient(session: Session, shipment_id: str, proof: Optional[str] = None):
    shipment = session.get(Shipment, shipment_id)
    shipment.current_status = "Доставлено"
    session.add(StatusHistory(shipment_id=shipment_id, status="Доставлено", comment=proof))
    session.add(shipment)
    session.commit()
    session.refresh(shipment)
    return shipment

def pickup_in_branch(session: Session, shipment_id: str, picked_by_client_id: int):
    shipment = session.get(Shipment, shipment_id)
    shipment.current_status = "Выдано получателю"
    session.add(StatusHistory(shipment_id=shipment_id, status="Выдано получателю"))
    session.add(shipment)
    session.commit()
    session.refresh(shipment)
    return shipment

def initiate_return(session: Session, shipment_id: str, reason: str):
    shipment = session.get(Shipment, shipment_id)
    shipment.current_status = "Возврат"
    session.add(StatusHistory(shipment_id=shipment_id, status="Возврат", comment=reason))
    session.add(shipment)
    session.commit()
    session.refresh(shipment)
    return shipment

def create_ticket(session: Session, ticket: Ticket):
    session.add(ticket)
    session.commit()
    session.refresh(ticket)
    return ticket

def payments_report(session: Session, since: Optional[datetime]=None):
    stmt = select(Payment)
    if since:
        stmt = stmt.where(Payment.timestamp >= since)
    return session.exec(stmt).all()
