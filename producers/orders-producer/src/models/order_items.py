from datetime import datetime
from uuid import UUID
from typing import List, Optional
from pydantic import BaseModel
from pydantic.class_validators import validator

from currency_code import Currency

class Item(BaseModel):
    id: UUID
    value: float
    currency_id: Currency 
    name: str
    parent_item: Optional[UUID] = None
    description: str
    vendor_id: UUID
    active: bool

class OrderItem(BaseModel):
    order_id: UUID
    created_at: datetime
    updated_at: Optional[datetime] = None
    vendor_id: UUID 
    items: List[Item]
    
