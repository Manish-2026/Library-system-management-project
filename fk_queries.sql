

ALTER TABLE issued_status
ADD CONSTRAINT fk_member_id
FOREIGN KEY (issued_member_id)
REFERENCES members(member_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_employee_id
FOREIGN KEY (issued_emp_id)
REFERENCES employees(emp_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_book_isbn_id
FOREIGN KEY (issued_book_isbn)
REFERENCES books(isbn);

ALTER TABLE branch
ADD CONSTRAINT fk_emp_id
FOREIGN KEY (manager_id)
REFERENCES employees(emp_id);

ALTER TABLE return_status
ADD CONSTRAINT fk_book_isbn
FOREIGN KEY (return_book_isbn)
REFERENCES books(isbn);