from pydantic import BaseModel, Field
from typing import List
import uuid


class MCPServerAgent(BaseModel):
    id: str = Field(default_factory=lambda: str(uuid.uuid4()))
    name: str
    description: str
    actions: List[str]


