import os
from fastapi import FastAPI
from dotenv import load_dotenv


load_dotenv()


app = FastAPI(
    title=os.getenv("APP_TITLE", "Salzburg Urban Heat Atlas API"),
    description=os.getenv(
        "APP_DESCRIPTION",
        "API for urban climate analysis and heat mapping",
    ),
    version=os.getenv("APP_VERSION", "0.1.0"),
)


@app.get("/")
def root():
    return {
        "project": "Salzburg Urban Heat Atlas",
        "status": "development"
    }
