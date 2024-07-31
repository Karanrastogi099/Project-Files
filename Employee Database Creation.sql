Create Database company;
Use company;

Create table department (
department_id int auto_increment primary key,
department_name varchar(100) not null
);

Create table manager (
manager_id int auto_increment primary key, 
manager_name varchar(100) not null,
department_id int,
foreign key (department_id) references department(department_id)
);

Create table employee (
employee_id int auto_increment primary key,
employee_name varchar(100) not null,
hire_date date,
salary decimal(10,2),
department_id int,
manager_id int,
foreign key (department_id) references department(department_id),
foreign key (manager_id) references manager(manager_id)
);


-- Now we have to insert the values in these tables. So that we can perform the SQL Queries

Insert into department (department_name) Values 
('Sales'), ('HR'), ('Engineering'), ('Marketing');

Insert into manager (manager_name, department_id) Values
('Alice', 1),
('Bob', 2),
('Charlie', 3),
('David', 4);

Insert into employee (employee_name, hire_date, salary, department_id, manager_id) Values
('John', '2023-01-15', 60000, 1, 1),
('Jane', '2023-02-20', 55000, 1, 1),
('Bill', '2022-11-05', 45000, 2, 2),
('Lisa', '2021-12-12', 70000, 3, 3),
('Tom', '2023-03-10', 62000, 3, 3),
('Emily', '2023-04-22', 72000, 4, 4),
('Nina', '2022-08-30', 68000, 4, 4),
('Mike', '2023-05-15', 56000, 2, 2);

