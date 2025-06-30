# Hospital Database Management System

This project is a web-based Hospital Database Management System built using the Django framework. It provides functionalities for managing patient information, appointments, admissions, tests, and operations, with different access levels for various hospital staff roles.

## Features

* **User Authentication and Authorization**:
    * Login for different user roles: Doctor, Front Desk Operator, Data Entry Operator, and Administrator.
    * Role-based access control ensuring users can only access relevant functionalities.
* **Patient Management**:
    * Register new patients with biodata (name, DOB, gender, address, phone, email).
    * View patient medical history, including appointments, tests, and operations.
* **Appointment Scheduling**:
    * Schedule appointments with doctors, including priority levels.
    * Doctors can view their upcoming appointments.
* **Admission and Discharge**:
    * Admit existing patients to wards.
    * Discharge admitted patients, updating room availability.
* **Medical Records Management**:
    * Schedule medical tests for patients.
    * Schedule operations with multiple doctors and an operation theatre.
    * Data Entry Operators can upload reports for appointments, tests, and operations.
* **Reporting and Information Access**:
    * Download appointment, test, and operation reports.
    * Doctors can view patients under their care and their complete medical history.

## Technologies Used

* **Backend**: Python, Django
* **Database**: PostgreSQL (managed via Docker)
* **Database Admin Tool**: pgAdmin (managed via Docker)
* **Frontend**: HTML, CSS (Bootstrap and Font Awesome for styling)
* **Dependency Management**: pip
* **Containerization**: Docker, Docker Compose

## Setup Instructions

Follow these steps to set up and run the Hospital Management System locally.

### Prerequisites

* **Docker**: Ensure Docker is installed and running on your system.
* **Python**: Python 3.x
* **pip**: Python package installer (usually comes with Python)
* **Git**: For cloning the repository.

### 1. Clone the Repository

```bash
git clone <repository_url>
cd Hospital-DataBase-Management
```

### 2. Database Setup with Docker Compose
Navigate to the root directory of the cloned project where docker-compose.yaml is located.

Start the PostgreSQL database and pgAdmin containers:

```bash
docker-compose up -d --build
```

This will set up:

* A PostgreSQL database named `mydb` with user `myuser` and password `mypassword`.
* A pgAdmin instance accessible at `http://localhost:5050` (default `email: admin@admin.com`, password: `admin`).

### 3. Python Environment Setup
It's recommended to use a virtual environment for dependency management.

```bash
python -m venv venv
source venv/bin/activate   # On Windows: `venv\Scripts\activate`
```
Install the required Python packages:

```bash
pip install -r requirements.txt
```

### 4. Django Database Migrations

Apply the database migrations to create the necessary tables in your PostgreSQL database:
```bash
python manage.py migrate
```

### 5. Create a Django Superuser
Create an administrator account to access the Django admin panel and manage initial users:

```bash
python manage.py createsuperuser
```

Follow the prompts to set up your username, email, and password.

### 6. Run the Django Application
Start the Django development server:

```bash
python manage.py runserver
```
The application will be accessible at `http://127.0.0.1:8000/`.


Usage
* **Administrator**: Access the Django admin panel at `http://127.0.0.1:8000/admin/` using the superuser credentials created in step 5. Here you can create Profile objects and assign roles (Doctor, Front Desk Operator, Data Entry Operator) to User accounts.

* **Front Desk Operator**: Log in via the main application login page. They can register new patients, admit/discharge patients, and schedule appointments, tests, and operations.

* **Data Entry Operator**: Log in via the main application login page. They are responsible for uploading reports for appointments, tests, and operations.

* **Doctor**: Log in via the main application login page. They can view their upcoming appointments and access detailed information about specific patients.