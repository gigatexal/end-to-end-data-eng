from order_status import OrderStatus
from order_items import OrderItem, Item
from currency_code import Currency

from datetime import datetime
from uuid import UUID, uuid4 
from typing import List, Optional
from pydantic import BaseModel

class Order(BaseModel):
    id: UUID
    name: str
    email: str
    address: str
    country: str
    status: OrderStatus
    created_at: datetime
    updated_at: Optional[datetime] = None
    vendor_id: UUID
    items: List[OrderItem] = [] 
    test: bool = False

def create_test_order()->Order:
    vendor_id=uuid4()
    return Order(
            id=uuid4(),
            name="test",
            email="test@test.com",
            address="1234 berlin lane, berlin, 10707",
            country="Germany",
            status=OrderStatus.CREATED,
            created_at=datetime.utcnow(),
            updated_at=None,
            vendor_id=vendor_id,
            items=[OrderItem(
                order_id=uuid4(),
                created_at=datetime.utcnow(),
                updated_at=None,
                vendor_id=vendor_id,
                items=[Item(
                    id=uuid4(),
                    value=100,
                    currency_id=Currency.EUR,
                    name="test-meal",
                    parent_item=None, 
                    description="test item!",
                    vendor_id=vendor_id,
                    active=True)])],
            test=True)


