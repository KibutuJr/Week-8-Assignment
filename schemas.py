from pydantic import BaseModel
from typing import Optional

class ContactBase(BaseModel):
    name: str
    phone: str
    email: str
    user_id: int
    group_id: Optional[int]

class ContactCreate(ContactBase):
    pass

class Contact(ContactBase):
    id: int

    class Config:
        orm_mode = True
