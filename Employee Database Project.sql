-- Now the insertion of the data is done. So we move with the queries related to this database.

-- Retrieve all employees from the 'employee' table.
SELECT 
    *
FROM
    employee;
    
--  Find the names of all managers.
SELECT 
    manager_name
FROM
    manager;
    
-- List all department with their IDs.
SELECT 
    department_id, department_name
FROM
    department;
    
-- Find the names of employees who earn more than 60000.
SELECT 
    employee_name
FROM
    employee
WHERE
    salary > 60000;
    
-- Retrieve employees who were hired in the year 2023.
SELECT 
    *
FROM
    employee
WHERE
    YEAR(hire_date) = 2023;
    
-- Count the number of employees from each department.
SELECT 
    department_id, COUNT(*) AS employee_count
FROM
    employee
GROUP BY department_id;

-- Find the average salary of employees in each department.
SELECT 
    department_id, AVG(salary)
FROM
    employee
GROUP BY department_id;

-- Get the highest salary in the company.
SELECT 
    MAX(salary) AS Highest_Salary
FROM
    employee;

-- Find the department with the highest average salary.
SELECT 
    d.department_name
FROM
    department d
        JOIN
    employee e ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY AVG(e.salary) DESC
LIMIT 1;

-- List all employees who do  not have a manager.
SELECT 
    employee_name
FROM
    employee
WHERE
    manager_id IS NULL;

-- Retrieve the name and department of employees who report to a manager named 'Alice'.
SELECT 
    e.employee_name, d.department_name
FROM
    employee e
        JOIN
    manager m ON e.manager_id = m.manager_id
        JOIN
    department d ON e.department_id = d.department_id
WHERE
    m.manager_name = 'Alice';
    
-- Find the names of employee and their manager.
SELECT 
    e.employee_name, m.manager_name
FROM
    employee e
        LEFT JOIN
    manager m ON e.manager_id = m.manager_id;
    
-- List all departments and their manager (if any).
SELECT 
    d.department_name, m.manager_name
FROM
    department d
        LEFT JOIN
    manager m ON d.department_id = m.department_id;

-- Find the total salary in each department.
SELECT 
    d.department_name, SUM(e.salary) AS Total_salary
FROM
    department d
        JOIN
    employee e ON d.department_id = e.department_id
GROUP BY d.department_name;

-- Retrieve employees with salaries between 50000 and 70000
SELECT 
    employee_name
FROM
    employee
WHERE
    salary BETWEEN 50000 AND 70000;

-- Get employees who were hired before 2023 and have a salary greater than 50000.
SELECT 
    employee_name, salary
FROM
    employee
WHERE
    YEAR(hire_date) < '2023'
        AND salary > 50000;
        
-- Find the number of employees in each department, ordered by department name.
SELECT 
    d.department_name, COUNT(e.employee_id) AS Employee_Count
FROM
    department d
        LEFT JOIN
    employee e ON e.department_id = d.department_id
GROUP BY d.department_name;

-- Get the top 3 highest_paid employees.
SELECT 
    employee_name, salary
FROM
    employee
ORDER BY salary DESC
LIMIT 3; 

-- Retrieve the names of employees who earn more than their managers.
SELECT 
    e.employee_name
FROM
    employee e
        JOIN
    manager m ON e.manager_id = m.manager_id
WHERE
    e.salary > (SELECT 
            salary
        FROM
            employee
        WHERE
            employee_id = m.manager_id);
            
-- List the departments without any employees.
SELECT 
    d.department_name
FROM
    department d
        LEFT JOIN
    employee e ON d.department_id = e.department_id
WHERE
    e.employee_id IS NULL;
    


