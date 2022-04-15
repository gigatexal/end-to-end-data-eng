from datetime import datetime
from uuid import UUID
from typing import List, Optional
from pydantic import BaseModel

from currency_code import Currency

class Item(BaseModel):
    id: UUID
    value: float
    currency_id: Currency 
    name: str
    parent_item: UUID
    description: str
    active: bool


class OrderItems(BaseModel):
    order_id: UUID
    created_at: datetime
    updated_at: Optional[datetime] = None
    vendor_id: UUID 
    items: List[Item]
    
