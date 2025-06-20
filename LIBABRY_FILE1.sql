CREATE DATABASE libarary_mangemnt;

-- CREATE BRANCH TABLE
USE libarary_mangemnt;
DROP TABLE IF EXISTS branch;
CREATE TABLE branch
     (  
     branch_id VARCHAR(15) PRIMARY KEY,
     manager_id VARCHAR(15),
     branch_address VARCHAR(65),
     contact_no  VARCHAR(15)

     );
     
-- CREATE TABLE EMPLOYEE

USE libarary_mangemnt;
DROP TABLE IF EXISTS employees;

CREATE TABLE employees
     (  
     emp_id VARCHAR(25) PRIMARY KEY,
     emp_name VARCHAR(55),
     position VARCHAR(35),
     salary FLOAT,
     branch_id VARCHAR(45)
     ); 
     
-- CREATE TABLE Books

USE libarary_mangemnt;
DROP TABLE IF EXISTS books;

CREATE TABLE books
     (  
     isbn VARCHAR(20) PRIMARY KEY,
     book_title VARCHAR(75),
     category VARCHAR(40),
     rental_price FLOAT,
     status VARCHAR(45),
     author VARCHAR(55),
     publisher VARCHAR(60)

     ); 
     
-- CREATE TABLE Members
USE libarary_mangemnt;
DROP TABLE IF EXISTS members;

CREATE TABLE members
     (  
     member_id VARCHAR(15) PRIMARY KEY,
     member_name VARCHAR(25),
     member_address VARCHAR(40),
     reg_date DATE
     );


-- CREATE TABLE ISSUE_STATUTS
USE libarary_mangemnt;
DROP TABLE IF EXISTS issued_status;

CREATE TABLE issued_status
     (  
     issued_id VARCHAR(10) PRIMARY KEY,
     issued_member_id VARCHAR(25),  /*FK*/
     issued_book_name VARCHAR(55),  
     issued_date DATE,
     issued_book_isbn VARCHAR(40),  /*FK*/
     issued_emp_id VARCHAR(20)   /*FK*/

     ); 

-- CREATE TABLE RETURN_STATUS
USE libarary_mangemnt;
DROP TABLE IF EXISTS return_status;

CREATE TABLE return_status
     (  
     return_id VARCHAR(10) PRIMARY KEY,
     issued_id  VARCHAR(10),
     return_book_name VARCHAR(75),
     return_date DATE,
     return_book_isbn VARCHAR(10)
     ); 
     

-- FOREGEN KEY
USE libarary_mangemnt;
ALTER TABLE issued_status
ADD CONSTRAINT fk_members
FOREIGN KEY (issued_member_id )
REFERENCES members(memberPRIMARY_id);



USE libarary_mangemnt;
ALTER TABLE issued_status
ADD CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn )
REFERENCES books(isbn);


USE libarary_mangemnt;
ALTER TABLE issued_status
ADD CONSTRAINT fk_employees
FOREIGN KEY (issued_emp_id  )
REFERENCES employees(emp_id);



USE libarary_mangemnt;
ALTER TABLE employees
ADD CONSTRAINT fk_branch
FOREIGN KEY (branch_id  )
REFERENCES branch(branch_id);

USE libarary_mangemnt;
ALTER TABLE return_status
ADD CONSTRAINT fk_issued_status
FOREIGN KEY (issued_id )
REFERENCES issued_status(issued_id);

