# Week 8: SQL & API Projects

This repository contains solutions for Week 8 assignments:

- **Question 1 (Week8-Q1):** Library Management SQL schema.
- **Question 2:** Contact Management API built with FastAPI, SQLAlchemy, and MySQL.

---

## 📚 Question 1: Library Management SQL

The `Week8-Q1` folder contains the SQL file for setting up a Library Management System.

- **File:** `Week8-Q1/library_management.sql`

This script creates tables for managing books, members, borrowing records, and more.

➡️ Run this file in MySQL Workbench or MySQL CLI to initialize the library database.

---

## 📇 Question 2: Contact API (FastAPI + MySQL)

A robust CRUD API for managing contacts, built using FastAPI, SQLAlchemy, and MySQL.
This project demonstrates integrating Python RESTful APIs with MySQL following best practices.

- **Schema file for this API:** `contacts.sql` (located in the project root)

### 🗺️ Database ERD Diagram

Below is the Entity-Relationship Diagram (ERD) representing the structure of the `contact_db` database:

<p align="center">
  <img src="contact%20ERD.png" alt="Contact DB ERD" width="600"/>
</p>

---

## 🚩 Table of Contents

- [Project Overview](#-project-overview)
- [Features](#-features)
- [Tech Stack](#️-tech-stack)
- [Prerequisites](#️-prerequisites)
- [Installation & Setup](#-installation--setup)
- [Directory Structure](#-directory-structure)
- [Configuration](#️-configuration)
- [API Endpoints](#-api-endpoints)
- [Testing](#-testing)
- [Error Handling](#-error-handling)
- [Contributing](#-contributing)
- [License](#-license)

---

## 🔎 Project Overview

This Contact API allows you to manage a contact book with users, groups, and individual contacts.

The API supports:
- Create a new contact
- Read all contacts or a single contact by ID
- Update existing contacts
- Delete contacts

---

## 🌟 Features

- RESTful API following HTTP standards
- Swagger UI and ReDoc API docs
- Environment-based configuration
- Clean code structure with separation of concerns
- Error handling with meaningful HTTP codes

---

## 🛠️ Tech Stack

- Python 3.x
- FastAPI (web framework)
- Uvicorn (ASGI server)
- SQLAlchemy (ORM)
- MySQL (database)
- Pydantic (data validation)

---

## ✅ Prerequisites

- Python 3.7 or higher
- MySQL server installed and running
- Git or Git Bash

---

## 🚀 Installation & Setup

### 1. Clone the Repository

cd ~/Desktop/Week8
[git clone https://github.com/KibutuJr/contact_api.git](https://github.com/KibutuJr/Week-8-Assignment.git)
cd contact_api

2. Configure Environment Variables
Create a .env file:

DATABASE_URL=mysql+mysqlconnector://<DB_USER>:<DB_PASSWORD>@localhost/contact_db
Replace <DB_USER> and <DB_PASSWORD> with your MySQL credentials.

3. Initialize Virtual Environment

python -m venv venv
source venv/Scripts/activate  # Windows (Git Bash)
# or
source venv/bin/activate      # macOS/Linux
4. Install Dependencies

pip install -r requirements.txt
5. Setup MySQL Database

Open MySQL Workbench or CLI and run:

CREATE DATABASE contact_db;
USE contact_db;
SOURCE contacts.sql;

6. Run Database Migrations

Tables are auto-created on startup using SQLAlchemy's Base.metadata.create_all.
Just ensure your .env and database setup are correct.

7. Start the API Server

uvicorn main:app --reload --host 0.0.0.0 --port 8000
➡️ Visit http://localhost:8000/docs for Swagger docs.

📂 Directory Structure

contact_api/
├── main.py             # FastAPI entrypoint & routes
├── database.py         # SQLAlchemy engine & session
├── models.py           # ORM models (User, Group, Contact)
├── schemas.py          # Pydantic schemas
├── crud.py             # CRUD utility functions
├── requirements.txt    # Python dependencies
├── contacts.sql        # SQL file for Question 2
├── contact ERD.png     # ERD diagram image
├── Week8-Q1/
│   └── library_management.sql  # SQL file for Question 1
├── .env                # Environment variables
├── .gitignore          # Git ignore rules
└── README.md           # Documentation
⚙️ Configuration
Manage settings through .env:

DATABASE_URL — MySQL connection string

📡 API Endpoints
Method	Path	Description
POST	/contacts/	Create a new contact
GET	/contacts/	Get list of contacts
GET	/contacts/{id}	Get a contact by ID
PUT	/contacts/{id}	Update an existing contact
DELETE	/contacts/{id}	Delete a contact by ID

Example: Create Contact

curl -X POST "http://localhost:8000/contacts/" \
  -H "Content-Type: application/json" \
  -d '{
        "name": "Alice Smith",
        "phone": "123-456-7890",
        "email": "alice@example.com",
        "user_id": 1,
        "group_id": 2
      }'
🧪 Testing
Test API via:

Swagger UI: http://localhost:8000/docs

ReDoc: http://localhost:8000/redoc

cURL or Postman

🚩 Error Handling
404 Not Found for missing resources

422 Unprocessable Entity for invalid payloads

Custom exception handlers in main.py

🤝 Contributing
Fork this repository

Create a new branch: git checkout -b feature/YourFeature

Commit your changes: git commit -m "Add some feature"

Push: git push origin feature/YourFeature

Open a Pull Request on GitHub

📄 License
Licensed under the MIT License. See LICENSE for details.
