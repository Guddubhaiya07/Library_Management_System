📚 Library Management System using SQL (Advanced Project)
🔍 Project Overview
Author: Lokendra Singh
Level: Intermediate to Advanced
Database: libarary_mangemnt
Technology: MySQL, Stored Procedures, CTAS, ERD

This project simulates a real-world Library Management System using SQL. It includes full schema creation, CRUD operations, advanced queries, and analytics-ready summary tables, along with stored procedures to handle core library functions like issuing and returning books.

🎯 Objectives
📌 Build normalized tables with real-world relationships

🧱 Implement database constraints and foreign keys

🔁 Perform CRUD operations

📈 Use CTAS and analytical queries for reporting

⚙️ Simulate workflows using Stored Procedures

🗃️ Project Files
File	Description
LIBABRY_FILE1.sql	Full database schema: tables, constraints, foreign keys
LIBABRY_FILE2.sql	All CRUD operations, advanced queries, stored procedures
erd_digram.mwb	MySQL Workbench ERD (visual schema)
erd_digram.mwb.beforefix	Original ERD backup

🧱 Database Schema
Tables created:

branch

employees

members

books

issued_status

return_status

Each table uses proper primary and foreign key constraints to maintain data integrity.

🔁 Key Features
✅ CRUD Operations
Add books, members, employees

Update member details

Delete issued records

Track issued books by employee

📊 CTAS & Summary Reports
book_cnts: Books with total number of issues

branch_reports: Branch performance with revenue

active_members: Members active in the last 2 months

⚙️ Stored Procedures
issue_book: Issue a book only if available

add_return_records: Mark book as returned and update status

📈 Sample Use Cases
Find Overdue Books
sql
Copy
Edit
SELECT 
    m.member_name, b.book_title, ist.issued_date,
    CURRENT_DATE - ist.issued_date AS overdue_days
FROM issued_status ist
JOIN members m ON m.member_id = ist.issued_member_id
JOIN books b ON b.isbn = ist.issued_book_isbn
LEFT JOIN return_status rs ON rs.issued_id = ist.issued_id
WHERE rs.return_id IS NULL AND CURRENT_DATE - ist.issued_date > 30;
Branch Performance Report
sql
Copy
Edit
SELECT 
    b.branch_id,
    COUNT(ist.issued_id) AS total_issues,
    COUNT(rs.return_id) AS total_returns,
    SUM(bk.rental_price) AS revenue
FROM branch b
JOIN employees e ON e.branch_id = b.branch_id
JOIN issued_status ist ON ist.issued_emp_id = e.emp_id
LEFT JOIN return_status rs ON rs.issued_id = ist.issued_id
JOIN books bk ON bk.isbn = ist.issued_book_isbn
GROUP BY b.branch_id;
Procedure to Issue a Book
sql
Copy
Edit
CALL issue_book('IS155', 'C108', '978-0-553-29698-2', 'E104');
📐 ER Diagram
Open erd_digram.mwb in MySQL Workbench to view:

1:Many relationships between branches, employees, and books

Centralized transaction flow via issued_status and return_status

🧠 Key Learning Outcomes
Design relational databases with integrity constraints

Automate SQL operations using procedures

Perform data summarization using CTAS and aggregates

Apply real-time business logic in SQL

▶️ How to Run
Import and execute LIBABRY_FILE1.sql to build schema.

Run LIBABRY_FILE2.sql to test queries, procedures, and tasks.

Open erd_digram.mwb in MySQL Workbench for ER visualization.

Modify or extend tasks to fit additional features like triggers or views.

