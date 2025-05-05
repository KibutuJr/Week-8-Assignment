**Contact API (FastAPI + MySQL)**

A simple yet robust CRUD (Create, Read, Update, Delete) API for managing contacts, built with FastAPI, SQLAlchemy, and MySQL. This project demonstrates how to integrate Python-based RESTful APIs with a MySQL database, following best practices for structure, configuration, and deployment.

---

## Table of Contents

1. [Project Overview](#project-overview)
2. [Features](#features)
3. [Tech Stack](#tech-stack)
4. [Prerequisites](#prerequisites)
5. [Installation & Setup](#installation--setup)

   1. [Clone the Repository](#clone-the-repository)
   2. [Configure Environment Variables](#configure-environment-variables)
   3. [Initialize Virtual Environment](#initialize-virtual-environment)
   4. [Install Dependencies](#install-dependencies)
   5. [Setup MySQL Database](#setup-mysql-database)
   6. [Run Database Migrations](#run-database-migrations)
   7. [Start the API Server](#start-the-api-server)
6. [Directory Structure](#directory-structure)
7. [Configuration](#configuration)
8. [API Endpoints](#api-endpoints)
9. [Testing](#testing)
10. [Error Handling](#error-handling)
11. [Contributing](#contributing)
12. [License](#license)

---

## Project Overview

This Contact API allows you to manage a simple contact book with users, groups, and individual contacts. The API supports the following core operations:

* **Create** a new contact
* **Read** all contacts or a single contact by ID
* **Update** an existing contact
* **Delete** a contact

The application leverages FastAPI for fast performance, SQLAlchemy ORM for database abstraction, and MySQL as the persistent data store.

---

## Features

* **RESTful API** adhering to HTTP standards
* **Automatic API documentation** via Swagger UI and ReDoc
* **Configurable** via environment variables
* **Clean code structure** separating models, schemas, CRUD logic, and application entrypoint
* **Error handling** with meaningful HTTP status codes

---

## Tech Stack

* **Python 3.x**
* **FastAPI** for web framework
* **Uvicorn** as ASGI server
* **SQLAlchemy** for ORM
* **MySQL** for database
* **Pydantic** for data validation and serialization

---

## Prerequisites

* Python 3.7 or higher installed
* MySQL server installed and running
* Git or Git Bash for version control

---

## Installation & Setup

### Clone the Repository

```bash
cd ~/Desktop/Week8
git clone https://github.com/YourUsername/contact_api.git
cd contact_api
```

### Configure Environment Variables

Create a `.env` file in the project root with the following content:

```ini
DATABASE_URL=mysql+mysqlconnector://<DB_USER>:<DB_PASSWORD>@localhost/contact_db
```

Replace `<DB_USER>` and `<DB_PASSWORD>` with your MySQL credentials.

### Initialize Virtual Environment

```bash
python -m venv venv
source venv/Scripts/activate        # Windows (Git Bash)
# or
source venv/bin/activate            # macOS/Linux
```

### Install Dependencies

```bash
pip install -r requirements.txt
```

### Setup MySQL Database

1. Open MySQL Workbench (or CLI).
2. Create a new database:

   ```sql
   CREATE DATABASE contact_db;
   USE contact_db;
   ```
3. Run the schema script located in `database/schema.sql` (or manually create tables using the provided SQL in README).

### Run Database Migrations

This project uses SQLAlchemy's `Base.metadata.create_all` to auto-create tables on startup. Ensure your database is running and credentials in `.env` are correct.

### Start the API Server

```bash
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

Visit `http://localhost:8000/docs` for interactive API docs.

---

## Directory Structure

```
contact_api/
├── main.py            # FastAPI entrypoint and routes
├── database.py        # SQLAlchemy engine and session
├── models.py          # ORM models (User, Group, Contact)
├── schemas.py         # Pydantic schemas for request/response
├── crud.py            # CRUD utility functions
├── requirements.txt   # Python dependencies
├── .env               # Environment variables (not committed)
├── .gitignore         # Git ignore rules
└── README.md          # This documentation
```

---

## Configuration

All critical settings are managed through environment variables:

* `DATABASE_URL` – Connection string for MySQL (SQLAlchemy format)

Feel free to extend with additional variables as needed (e.g., `DEBUG`, `LOG_LEVEL`).

---

## API Endpoints

| Method | Path             | Description                |
| ------ | ---------------- | -------------------------- |
| POST   | `/contacts/`     | Create a new contact       |
| GET    | `/contacts/`     | Retrieve list of contacts  |
| GET    | `/contacts/{id}` | Retrieve a contact by ID   |
| PUT    | `/contacts/{id}` | Update an existing contact |
| DELETE | `/contacts/{id}` | Delete a contact by ID     |

Example cURL for creating a contact:

```bash
curl -X POST "http://localhost:8000/contacts/" \
  -H "Content-Type: application/json" \
  -d '{
        "name": "Alice Smith",
        "phone": "123-456-7890",
        "email": "alice@example.com",
        "user_id": 1,
        "group_id": 2
      }'
```

---

## Testing

You can test endpoints via:

* **Swagger UI**: `http://localhost:8000/docs`
* **ReDoc**: `http://localhost:8000/redoc`
* **cURL** or **Postman** for custom requests

---

## Error Handling

* Returns `404 Not Found` for missing resources
* Returns `422 Unprocessable Entity` for invalid request payloads
* Customize exception handlers in `main.py` as needed

---

## Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/YourFeature`
3. Commit your changes: `git commit -m "Add some feature"`
4. Push to the branch: `git push origin feature/YourFeature`
5. Open a Pull Request on GitHub

Please adhere to the existing code style and include tests where appropriate.

---

## License

This project is licensed under the **MIT License**. See `LICENSE` for details.
