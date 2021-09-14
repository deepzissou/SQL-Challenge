--Leaving my drop tables up here in case I've made a mistake
DROP TABLE employees;
DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE salaries;
DROP TABLE titles;


--Create your tables based on the csv's

--Dept_no is a primary key?
--Dept_no is found in dept_emp & dept_manager
--======================================================
CREATE TABLE departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	CONSTRAINT "pk_departments" PRIMARY KEY ("dept_no")
);
 
--Shares values with dept_manager
--Used VARCHAR for dept_no because of the letter in the value
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL	
);

--Similar to dept_emp file share values
CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL
); 

--This one has a lot of different types of values
--Used DATE instead of VARCHAR for birth and hire date
--Emp_no
--Emp_title_id could be similar to title_id in the titles table
CREATE TABLE employees (
	emp_no INT NOT NULL, 
	emp_title_id VARCHAR NOT NULL, 
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR (5) NOT NULL,
	hire_date DATE NOT NULL,
	CONSTRAINT "pk_employees" PRIMARY KEY ("emp_no")
);

--Emp_no shows up again
--Emp_no and salariy are both integers
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL
);

--Title_id similar to emp_title_id from employees table
--Both values are VARCHAR
CREATE TABLE titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	CONSTRAINT "pk.titles" PRIMARY KEY ("title_id")	
);

--Fix the tables and add the Foreign keys
--============================================================================
--Changing the "employees" table add the foreign key emp_title_id. Reference should be "titles"
ALTER TABLE "employees" 
ADD CONSTRAINT "fk_employees_emp_title_id" 
FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

--Changing the "dept_emp" table add the foreign key emp_no. Reference should be "employees"
ALTER TABLE "dept_emp" 
ADD CONSTRAINT "fk_dept_emp_emp_no" 
FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

--Changing the "dept_emp" table add the foreign key dept_no. Reference should be "departments"
ALTER TABLE "dept_emp" 
ADD CONSTRAINT "fk_dept_emp_dept_no" 
FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

--Changing the "dept_manager" table add the foreign key dept_no. Reference should be "departments"
ALTER TABLE "dept_manager" 
ADD CONSTRAINT "fk_dept_manager_dept_no" 
FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

--Changing the "dept_manager" table add the foreign key emp_no. Reference should be "employees"
ALTER TABLE "dept_manager" 
ADD CONSTRAINT "fk_dept_manager_emp_no" 
FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

--Changing the "salaries" table add the foreign key emp_no. Reference should be "employees"
ALTER TABLE "salaries" 
ADD CONSTRAINT "fk_salaries_emp_no" 
FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");