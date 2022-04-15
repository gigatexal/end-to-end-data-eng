from order_status import OrderStatus

from datetime import datetime
from uuid import UUID, uuid4 
from typing import Optional
from pydantic import BaseModel

class Order(BaseModel):
    id: UUID
    name: str
    email: str
    address: str
    status: OrderStatus
    created_at: datetime
    updated_at: Optional[datetime] = None
    vendor_id: UUID

