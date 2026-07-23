# Backend Development Setup

This guide covers the minimum local setup for the FastAPI backend.

## 1) Create and activate a virtual environment

From the repository root:

```bash
cd backend
python3 -m venv .venv
source .venv/bin/activate
```

On Windows (PowerShell):

```powershell
cd backend
python -m venv .venv
.venv\Scripts\Activate.ps1
```

## 2) Install dependencies

```bash
pip install --upgrade pip
pip install -r requirements.txt
```

## 3) Configure environment variables

Copy the example file and adjust values if needed:

```bash
cp .env.example .env
```

Variables currently supported:

- `APP_TITLE`
- `APP_DESCRIPTION`
- `APP_VERSION`
- `APP_HOST`
- `APP_PORT`

## 4) Run FastAPI locally

From the `backend` directory:

```bash
uvicorn main:app --reload --host "${APP_HOST:-127.0.0.1}" --port "${APP_PORT:-8000}"
```

Then open:

- API root: `http://127.0.0.1:8000/`
- Swagger UI: `http://127.0.0.1:8000/docs`

## 5) Run with Docker Compose

From the repository root:

```bash
docker compose up --build
```

This starts:

- PostGIS database on `localhost:5432`
- FastAPI backend on `http://localhost:8000`
- Next.js frontend on `http://localhost:3000`
