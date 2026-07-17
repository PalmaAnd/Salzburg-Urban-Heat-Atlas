
from fastapi import FastAPI


app = FastAPI(
    title="Salzburg Urban Heat Atlas API",
    description="API for urban climate analysis and heat mapping",
    version="0.1.0"
)


@app.get("/")
def root():
    return {
        "project": "Salzburg Urban Heat Atlas",
        "status": "development"
    }

