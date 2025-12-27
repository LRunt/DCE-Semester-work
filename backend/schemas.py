from pydantic import BaseModel
from datetime import date, time
from decimal import Decimal

class ResultDTO(BaseModel):
    id: int
    race_date: date
    race_name: str
    sport_type: str
    distance: Decimal | None
    position: str | None
    category_position: str | None
    result_time: time | None
    event_place: str | None
    race_website_url: str | None
    results_url: str | None
    strava_url: str | None

    class Config:
        from_attributes = True

class ProjectDTO(BaseModel):
    id: int
    school: bool
    img: str | None
    name: str
    description: str | None

    class Config:
        from_attributes = True