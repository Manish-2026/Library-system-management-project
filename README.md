# 📚 Library Management System (MySQL)

A mini project for designing and managing a **Library System** database in **MySQL**.

This repository includes:
- 📦 Complete database schema and table creation scripts
- 🔑 Foreign key constraint scripts
- 📊 EER diagram (MySQL Workbench model)
- ⚙️ Stored procedures and CTAS queries for real-world tasks (e.g., issuing books, returning books, reporting)

---

## 🛠️ Project Overview

The project simulates a real-world library system with the following core tables:
- `books`
- `members`
- `employees`
- `branch`
- `issued_status`
- `return_status`

Relationships are defined using foreign keys (see `fk_queries.sql`).

---

## 📂 Files

| File | Description |
|-----|-------------|
| `EER_Diagram.mwb` | MySQL Workbench model showing full ER diagram |
| `fk_queries.sql` | Foreign key constraints connecting tables |
| `Sql_queries01.sql` | Main schema: table creation + insert + update + select tasks |
| `Sql_queries02.sql` | Advanced queries: procedures, CTAS, reports, and more |
| `Screenshot.png` | Preview of EER diagram (visual reference) |

---

## ✅ Features & Tasks Implemented

- Create tables and populate data
- Update and delete data
- Foreign key relations
- Stored procedures:
  - `issue_book` — check availability and issue books
  - `add_return_record` — handle book returns and update status
- CTAS (Create Table As Select) for reporting:
  - Active members
  - Branch performance
  - Book issue counts
- Analytical queries:
  - Members with overdue books
  - Employees with most book issues processed
  - Rental income by category

---

