# College Database Project

This repository contains SQL scripts to create and manage a simple database for a college system. The database includes the following:

## Contents

### 1. Database Creation
- A database named `college` is created and made active.

### 2. Tables
- **`student` Table:** Stores information about students, including roll numbers, names, marks, grades, and cities.
- **`dept` Table:** Contains department details, such as department IDs and names.
- **`teacher` Table:** Holds teacher data, including IDs, names, and associated department IDs. It establishes a relationship with the `dept` table using a foreign key.

### 3. Sample Data
- Sample records are inserted into the `student`, `dept`, and `teacher` tables for demonstration purposes.

### 4. Queries
- Various SQL queries are included to:
  - Retrieve data from tables.
  - Filter, sort, and limit results.
  - Perform grouping and aggregation.

### 5. Data Updates
- SQL statements to update data in the `student`, `dept`, and `teacher` tables are provided.

### 6. Relationships
- Demonstrates the use of foreign keys and cascading updates/deletions between tables (`teacher` and `dept`).

## Usage
1. Use the SQL script to create the database and tables.
2. Insert the provided sample data.
3. Execute the queries to interact with the data and understand the relationships.
