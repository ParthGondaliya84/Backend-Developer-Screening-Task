from fastapi import FastAPI
from pydantic import BaseModel
from typing import List

app = FastAPI()

class ScoreRequest(BaseModel):
    scores: List[int]

@app.post("/average-score")
async def average_score(data: ScoreRequest):
    if not data.scores:
        return {"average": 0.0}
    avg = sum(data.scores) / len(data.scores)
    return {"average": round(avg, 2)}
