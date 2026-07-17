#!/bin/bash

set -e

PROJECT_NAME="Salzburg-Urban-Heat-Atlas"

echo "🌳 Setting up $PROJECT_NAME..."

########################################
# Root folders
########################################

echo "Creating directory structure..."

mkdir -p \
backend/app \
backend/api \
backend/core \
backend/models \
backend/services \
backend/utils \
backend/tests \
frontend \
database/migrations \
database/schemas \
database/seeds \
data/raw \
data/processed \
data/cache \
data/exports \
scripts/setup \
scripts/download \
scripts/processing \
scripts/utilities \
notebooks \
infrastructure \
tests \
.github/ISSUE_TEMPLATE \
.github/workflows \
assets


########################################
# Backend initialization
########################################

echo "Creating backend structure..."

touch backend/app/__init__.py
touch backend/api/__init__.py
touch backend/core/__init__.py
touch backend/models/__init__.py
touch backend/services/__init__.py
touch backend/utils/__init__.py

cat <<EOF > backend/requirements.txt

fastapi
uvicorn
sqlalchemy
geoalchemy2
psycopg2-binary
pydantic
python-dotenv
geopandas
shapely
rasterio
numpy
pandas

EOF


cat <<EOF > backend/main.py

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

EOF


########################################
# Frontend placeholder
########################################

echo "Creating frontend placeholder..."

cat <<EOF > frontend/README.md

# Frontend

React + TypeScript frontend application.

Planned technologies:

- React
- TypeScript
- Vite
- MapLibre GL JS

EOF


########################################
# Database
########################################

echo "Creating database structure..."

cat <<EOF > database/README.md

# Database

The project will use PostgreSQL with PostGIS.

Purpose:

- store spatial datasets
- manage environmental layers
- support GIS queries

EOF


########################################
# Docker Compose
########################################

echo "Creating Docker configuration..."

cat <<EOF > docker-compose.yml

version: "3.9"

services:

  database:
    image: postgis/postgis:latest
    container_name: suha-postgis
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: urban_heat
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data


  backend:
    build:
      context: ./backend
    container_name: suha-backend
    ports:
      - "8000:8000"
    depends_on:
      - database


volumes:

  postgres_data:

EOF


########################################
# GitHub templates
########################################

echo "Creating GitHub templates..."


cat <<EOF > .github/PULL_REQUEST_TEMPLATE.md

# Pull Request

## Description

Describe what changed.

## Related Issue

#

## Checklist

- [ ] Code tested
- [ ] Documentation updated
- [ ] No sensitive data included
- [ ] Scientific assumptions documented

EOF



cat <<EOF > .github/ISSUE_TEMPLATE/feature_request.md

---
name: Feature Request
about: Suggest an improvement
title: ""
labels: enhancement
---

## Description

Describe the proposed feature.

## Motivation

Why is this useful?

## Possible Implementation

How could this work?

EOF



cat <<EOF > .github/ISSUE_TEMPLATE/bug_report.md

---
name: Bug Report
about: Report a problem
title: ""
labels: bug
---

## Description

What happened?

## Steps To Reproduce

1.
2.
3.

## Expected Behaviour


## Additional Information


EOF



########################################
# Documentation files
########################################

echo "Creating documentation..."


cat <<EOF > CONTRIBUTING.md

# Contributing Guide

Thank you for contributing to the Salzburg Urban Heat Atlas.

## Development Principles

This project values:

- scientific accuracy
- open data
- reproducibility
- clean code
- good documentation


## Contributions

Possible contribution areas:

- software development
- GIS
- climate science
- documentation
- visualization


## Workflow

1. Create an issue
2. Discuss implementation
3. Create a branch
4. Submit a pull request


EOF



cat <<EOF > CHANGELOG.md

# Changelog

All notable changes will be documented here.

Format based on:
https://keepachangelog.com/

---

## [Unreleased]

### Added

-

### Changed

-

### Fixed

-

EOF



########################################
# Gitignore
########################################

cat <<EOF > .gitignore


# Python

__pycache__/
*.py[cod]
*.egg-info/
.env


# Node

node_modules/
dist/


# Data

data/raw/*
data/cache/*


# IDE

.vscode/
.idea/


# OS

.DS_Store


# Database

*.sqlite


EOF



########################################
# Git initialization
########################################

echo "Initializing Git..."

git init

git add .

git commit -m "Initial project structure"

echo ""
echo "✅ Project setup completed!"
echo ""
echo "Next steps:"
echo "1. Review generated files"
echo "2. Push to GitHub"
echo "3. Create first milestones"
echo "4. Start Wiki structure"