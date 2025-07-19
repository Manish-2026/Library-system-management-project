create database library_system_management;
use library_system_management;
Drop table if exists books;
create table books (
isbn varchar(20) primary key,
book_title	varchar(60),
category	varchar(20),
rental_price	float,
status	varchar(5),
author	varchar(25),
publisher varchar(30)
);
 Drop table if exists members;
create table members (
member_id varchar(10) primary key,	
member_name	varchar(20),
member_address	varchar(20),
reg_date  date
);
 Drop table if exists issued_status;
create table issued_status(
issued_id	varchar(10) primary key,
issued_member_id	varchar(10) ,
issued_book_name	varchar(60),
issued_date	date,
issued_book_isbn	varchar(20),
issued_emp_id varchar(10)
);


Drop table if exists branch;
create table branch(
branch_id	varchar(10) primary key,
manager_id	varchar(10) ,
branch_address	varchar(15), 
contact_no varchar(15)
);

Drop table if exists employees;
create table employees(
emp_id	varchar(10) primary key,
emp_name	varchar(20),
position	varchar(10),
salary	int,
branch_id varchar(10)
);

Drop table if exists return_status;
create table return_status(
return_id	varchar(10) primary key,
issued_id	varchar(10),
return_book_name	varchar(10),
return_date	 date,
return_book_isbn varchar(10)
)
select * from books;
select * from branch;
select * from employees;
select * from issued_status;
select * from return_status;
select * from members;

-- Project Task

-- Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
insert into 
books ( isbn, book_title, category, rental_price, status, author, publisher)
values ('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
select * from books
where isbn = '978-1-60129-456-2';

-- Task 2: Update an Existing Member's Address
UPDATE members
SET member_address = '125 Main St'
WHERE member_id = 'C101';
SELECT * FROM members;

-- Task 3: Delete a Record from the Issued Status Table 
delete from issued_status
where issued_id = 'IS106';

-- Task 4: Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.
select * from issued_status
where issued_emp_id = 'E101';

-- Task 5: List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book.
select ss.issued_member_id,
mb.member_name,
count(ss.issued_id) as no_of_books_issued
from issued_status as ss
join members as mb
on ss.issued_member_id = mb.member_id
group by  ss.issued_member_id, mb.member_name
having count(ss.issued_id) > 1
order by no_of_books_issued;

-- CTAS
-- Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**
CREATE TABLE book_cnts
AS    
SELECT 
    b.isbn,
    b.book_title,
    COUNT(ist.issued_id) as no_issued
FROM books as b
JOIN
issued_status as ist
ON ist.issued_book_isbn = b.isbn
GROUP BY 1, 2;
SELECT * FROM
book_cnts;
alter table book_cnts
change no_issued  no_of_times_issued int;

-- Task 7. Retrieve All Books in a Specific Category:
SELECT * FROM books
WHERE category = 'Classic';

-- Task 8: Find Total Rental Income by Category:
select b.category,
	   sum(b.rental_price) as total_rent_from_specific_book_category,
       count(iss.issued_id) as no_of_times_issued
 from issued_status as iss
join books as b
on b.isbn = iss.issued_book_isbn
group by b.category
order by b.category;

-- 9. List Members Who Registered in the Last 180 Days:
INSERT INTO members(member_id, member_name, member_address, reg_date)
VALUES
('C120', 'sam', '145 Main St', '2025-06-01'),
('C121', 'john', '133 Main St', '2025-05-01');
SELECT * FROM members
WHERE reg_date >= curdate() - INTERVAL 180 day;

-- task 10 List Employees with Their Branch Manager's Name and their branch details:
select 
    e1.*,
    b.manager_id,
    e2.emp_name as manager
FROM employees as e1
JOIN  
branch as b
ON b.branch_id = e1.branch_id
JOIN
employees as e2
ON b.manager_id = e2.emp_id;

-- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold 7USD:
CREATE TABLE books_price_greater_than_seven
AS    
SELECT * FROM Books
WHERE rental_price > 7;
SELECT * FROM 
books_price_greater_than_seven;

-- Task 12: Retrieve the List of Books Not Yet Returned

SELECT 
    DISTINCT ist.issued_book_name
FROM issued_status as ist
LEFT JOIN
return_status as rs
ON ist.issued_id = rs.issued_id
WHERE rs.return_id IS NULL;











