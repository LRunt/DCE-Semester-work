from sqlalchemy import Column, Integer, String, Date, Numeric, Time, Boolean, ForeignKey, Text
from sqlalchemy.orm import relationship
from database import Base

class Result(Base):
    __tablename__ = "results"
    id = Column(Integer, primary_key=True, index=True)
    race_date = Column(Date, nullable=False)
    race_name = Column(String(255), nullable=False)
    sport_type = Column(String(64), nullable=False)
    distance = Column(Numeric(10, 2))
    position = Column(String(10))
    category_position = Column(String(10))
    result_time = Column(Time)
    event_place = Column(String(255))
    race_website_url = Column(String(512))
    results_url = Column(String(512))
    strava_url = Column(String(512))

class Project(Base):
    __tablename__ = "projects"
    id = Column(Integer, primary_key=True, index=True)
    school = Column(Boolean, default=False)
    img = Column(String(512))
    # Relace na obsahy v různých jazycích
    contents = relationship("ProjectContent", back_populates="project")

class ProjectContent(Base):
    __tablename__ = "projects_content"
    id = Column(Integer, primary_key=True, index=True)
    project_id = Column(Integer, ForeignKey("projects.id"))
    language_code = Column(String(2), nullable=False)
    name = Column(String(255), nullable=False)
    description = Column(Text)
    project = relationship("Project", back_populates="contents")