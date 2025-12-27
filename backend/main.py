from fastapi import FastAPI, Query
from fastapi.middleware.cors import CORSMiddleware
from typing import List
import models
import schemas
from database import SessionLocal

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173"], # Vue.js
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/healthcheck")
def healthcheck():
    return {"status": "OK"}

@app.get("/results", response_model=List[schemas.ResultDTO])
def get_results():
    with SessionLocal() as db:
        results = db.query(models.Result).order_by(models.Result.race_date.desc()).all()
        return results

@app.get("/projects", response_model=List[schemas.ProjectDTO])
def get_projects(lang: str = Query("cs", min_length=2, max_length=2)):
    with SessionLocal() as db:
        db_projects = db.query(models.Project).all()
        
        projects = []
        for p in db_projects:
            content = next((c for c in p.contents if c.language_code == lang), None)
            if not content and p.contents:
                content = p.contents[0]
            if content:
                projects.append({
                    "id": p.id,
                    "school": p.school,
                    "img": p.img,
                    "name": content.name,
                    "description": content.description
                })
        return projects