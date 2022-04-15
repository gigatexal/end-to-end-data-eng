from enum import Enum

class OrderStatus(Enum):
    CREATED = 1
    UPDATED = 2
    ACCEPTED = 3
    REJECTED = 4
    DELIVERED = 5
    PICKEDUP = 6
