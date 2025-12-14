# Disaster Database Project

![MySQL](https://img.shields.io/badge/Database-MySQL%208.0-blue)
![DBMS](https://img.shields.io/badge/DBMS-Core%20Concepts-green)
![ACID](https://img.shields.io/badge/Transactions-ACID%20Compliant-orange)
![SDG](https://img.shields.io/badge/UN%20SDG-11.5-red)

---

## Project Overview
This database project supports **SDG 11.5**, which aims to reduce the impacts of disasters. It stores data about disasters such as typhoons, floods, and earthquakes, including:

- Affected barangays  
- Human impact (deaths, injuries, affected people)  
- Damaged assets and estimated economic losses  

This system helps LGUs quickly identify high-risk areas, track disaster impacts, and plan effective disaster response.

---

## Features

- **Disaster Event Management**  
  Tracks hazard type, affected location, severity level, and duration of disaster events.

- **Human Impact Tracking**  
  Records the number of deaths, injuries, and affected individuals per disaster event.

- **Damage Assessment**  
  Stores damaged assets and computes estimated economic losses.

- **Data Integrity and Validation**  
  Ensures data accuracy and consistency through constraints and triggers:
  - Prevents invalid disaster timelines (e.g., `EndDate` earlier than `StartDate`)
  - Enforces valid numeric ranges for casualties and losses
  - Maintains referential integrity using primary and foreign keys

- **Views for Quick Analysis**
  - `view_disaster_summary`  
    Provides a consolidated view of hazard type, barangay, and disaster event details.
  - `view_total_losses_per_event`  
    Calculates and displays the total economic losses per disaster event.

- **Stored Procedures**  
  Uses transactional stored procedures to safely insert related records and ensure ACID compliance.

---

## Core DBMS Concepts Applied

This project applies essential Database Management System (DBMS) concepts covered throughout the course.

- **Data Definition Language (DDL)**  
  Used to define tables, relationships, constraints, indexes, and triggers.

- **Data Manipulation Language (DML)**  
  Used for inserting, updating, and testing disaster-related data.

- **Normalization (3NF / BCNF)**  
  Tables are normalized to reduce redundancy and prevent update, insertion, and deletion anomalies.

- **Constraints and Triggers**  
  CHECK constraints and triggers enforce business rules and maintain data validity.

- **Views (DQL)**  
  Views simplify complex queries and support efficient disaster data reporting.

- **Transactions and ACID Properties**  
  Stored procedures implement `BEGIN TRANSACTION`, `COMMIT`, and `ROLLBACK` to ensure data consistency and reliability.

---

## Database Components

- **DDL Scripts**  
  Define the database schema, tables, constraints, and triggers.

- **DML Scripts**  
  Insert sample data and test transactional behavior.

- **Views**  
  Provide summarized disaster information and total economic loss reports.

- **Stored Procedures**  
  Handle safe, consistent, and transactional data insertion.

---

## Getting Started

### Requirements
- MySQL 8.0 or later  
- Optional: VS Code or any SQL editor

### Setup
1. Clone the repository:
```bash
git clone https://github.com/Jyrowen/DisasterManagementDB-sdg11-dbms.git
