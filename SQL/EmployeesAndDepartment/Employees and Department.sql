create database Project;

CREATE TABLE LOCATION (
  Location_ID INT PRIMARY KEY,
  City VARCHAR(50)
);

INSERT INTO LOCATION (Location_ID, City)
VALUES (122, 'New York'),
       (123, 'Dallas'),
       (124, 'Chicago'),
       (167, 'Boston');


  CREATE TABLE DEPARTMENT (
  Department_Id INT PRIMARY KEY,
  Name VARCHAR(50),
  Location_Id INT,
  FOREIGN KEY (Location_Id) REFERENCES LOCATION(Location_ID)
);


INSERT INTO DEPARTMENT (Department_Id, Name, Location_Id)
VALUES (10, 'Accounting', 122),
       (20, 'Sales', 124),
       (30, 'Research', 123),
       (40, 'Operations', 167);

	   CREATE TABLE JOB (
  Job_ID INT PRIMARY KEY,
  Designation VARCHAR(50)
);

CREATE TABLE JOB
(JOB_ID INT PRIMARY KEY,
DESIGNATION VARCHAR(20))

INSERT  INTO JOB VALUES
(667, 'CLERK'),
(668,'STAFF'),
(669,'ANALYST'),
(670,'SALES_PERSON'),
(671,'MANAGER'),
(672, 'PRESIDENT')


CREATE TABLE EMPLOYEE
(EMPLOYEE_ID INT,
LAST_NAME VARCHAR(20),
FIRST_NAME VARCHAR(20),
MIDDLE_NAME CHAR(1),
JOB_ID INT FOREIGN KEY
REFERENCES JOB(JOB_ID),
MANAGER_ID INT,
HIRE_DATE DATE,
SALARY INT,
COMM INT,
DEPARTMENT_ID  INT FOREIGN KEY
REFERENCES DEPARTMENT(DEPARTMENT_ID))

INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','JOHN','Q',667,7902,'17-DEC-84',800,NULL,20),
(7499,'ALLEN','KEVIN','J',670,7698,'20-FEB-84',1600,300,30),
(7505,'DOYLE','JEAN','K',671,7839,'04-APR-85',2850,NULl,30),
(7506,'DENNIS','LYNN','S',671,7839,'15-MAY-85',2750,NULL,30),
(7507,'BAKER','LESLIE','D',671,7839,'10-JUN-85',2200,NULL,40),
(7521,'WARK','CYNTHIA','D',670,7698,'22-FEB-85',1250,500,30)





--1. List all the employee details. 
select * from EMPLOYEE
--2. List all the department details. 
select * from DEPARTMENT
--3. List all job details.
select * from JOB
--4. List all the locations. 
select * from LOCATION;
--5. List out the First Name, Last Name, Salary, Commission for allEmployees. 
select FIRST_NAME,LAST_NAME,SALARY,COMM
from EMPLOYEE
--6. List out the Employee ID, Last Name, Department ID for all employees and alias Employee ID as "ID of the Employee", Last Name as "Name of theEmployee", Department ID as "Dep_id". 
select EMPLOYEE_ID AS ID, DEPARTMENT_ID AS DP_ID,LAST_NAME AS NAME
FROM EMPLOYEE;

--7. List out the annual salary of the employees with their names only.
SELECT FIRST_NAME,(SALARY*12) AS ANNUAL 
FROM EMPLOYEE

WHERE Condition:
--8. List the details about "Smith". 
SELECT * FROM EMPLOYEE
WHERE LAST_NAME = 'SMITH'

--9. List out the employees who are working in department 20.
SELECT * FROM EMPLOYEE
WHERE DEPARTMENT_ID = 20;

--10. List out the employees who are earning salaries between 3000and4500. 
SELECT * FROM EMPLOYEE
WHERE SALARY BETWEEN 2000 AND 3000;

--11. List out the employees who are working in department 10 or 20. 
SELECT * FROM EMPLOYEE
WHERE DEPARTMENT_ID =10 OR DEPARTMENT_ID = 20;

--12. Find out the employees who are not working in department 10 or 30. 
SELECT * FROM EMPLOYEE
WHERE DEPARTMENT_ID NOT IN (10,30)

--13. List out the employees whose name starts with 'S'
SELECT * FROM EMPLOYEE
WHERE FIRST_NAME LIKE'S%';

--14. List out the employees whose name starts with 'S' and ends with'H'. 
SELECT * FROM EMPLOYEE
WHERE FIRST_NAME LIKE 'S%H'

--15. List out employees who are working in department 10 and draw salaries more than 3500. 
SELECT * FROM EMPLOYEE
WHERE  DEPARTMENT_ID =30 AND SALARY > 2500;

--16. List out the employees who are not receiving commission
SELECT * FROM EMPLOYEE
WHERE COMM IS NULL;

--17. List out the Employee ID and Last Name in ascending order based on the Employee ID. 
SELECT EMPLOYEE_ID,LAST_NAME FROM EMPLOYEE
ORDER BY EMPLOYEE_ID

--18. List out the Employee ID and Name in descending order based onsalary. 
SELECT EMPLOYEE_ID,LAST_NAME FROM EMPLOYEE
ORDER BY EMPLOYEE_ID DESC

--19. List out the employee details according to their Last Name in ascending-order.
SELECT * FROM EMPLOYEE
ORDER BY LAST_NAME;

--20. List out the employee details according to their Last Name in ascendingorder and then Department ID in descending order.
SELCT * FROM EMPLOYEE
ORDER BY LAST_NAME,DEPARTMENT_ID desc;

--21. List out the department wise maximum salary, minimumsalary andaverage salary of the employees. 
SELECT DEPARTMENT_ID,MAX(SALARY) AS MAX_SALARY,
MIN(SALARY) AS MIN_SALARY,
AVG(SALARY) AS AVG_SALARY FROM EMPLOYEE
GROUP BY DEPARTMENT_ID

--22. List out the job wise maximum salary, minimum salary and averagesalary of the employees. 
SELECT JOB_ID,MAX(SALARY) AS MAX_SALARY,
MIN(SALARY) AS MIN_SALARY,
AVG(SALARY) AS AVG_SALARY FROM EMPLOYEE
GROUP BY JOB_ID

--23. List out the number of employees who joined each month in ascending order.
SELECT MONTH(HIRE_DATE),COUNT(*)
FROM EMPLOYEE
GROUP BY MONTH(HIRE_DATE)

--24. List out the number of employees for each month and year in ascending order based on the year and month. 
SELECT MONTH(HIRE_DATE),YEAR(HIRE_DATE)
FROM EMPLOYEE
GROUP BY MONTH(HIRE_DATE),YEAR(HIRE_DATE)
ORDER BY MONTH(HIRE_DATE),YEAR(HIRE_DATE)

--25. List out the Department ID having at least four employees. 
SELECT COUNT(*),DEPARTMENT_ID FROM EMPLOYEE
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >=4;

--26. How many employees joined in the month of January?
SELECT MONTH(HIRE_DATE),COUNT(*)
FROM EMPLOYEE
WHERE MONTH(HIRE_DATE) = 1;

--27. How many employees joined in the month of January orSeptember?
SELECT MONTH(HIRE_DATE),COUNT(*)
FROM EMPLOYEE
WHERE MONTH(HIRE_DATE) IN (5,6);

--28. How many employees joined in 1985?

SELECT YEAR(HIRE_DATE),COUNT(*)
FROM EMPLOYEE
WHERE YEAR(HIRE_DATE) = 1985;

--29. How many employees joined each month in 1985?
SELECT MONTH(HIRE_DATE),COUNT(*)
FROM EMPLOYEE
WHERE YEAR(HIRE_DATE) = 1985
GROUP BY MONTH(HIRE_DATE);

--30. How many employees joined in March 1985?
SELECT COUNT(*) FROM EMPLOYEE
WHERE MONTH(HIRE_DATE) = 4
AND YEAR(HIRE_DATE) = 1985;

--31. Which is the Department ID having greater than or equal to 3 employeesjoining in April 1985?
SELECT DEPARTMENT_ID,COUNT(*) FROM EMPLOYEE
WHERE MONTH(HIRE_DATE) = 4 
AND YEAR(HIRE_DATE) = 1985
GROUP BY DEPARTMENT_ID
HAVING COUNT(*)>=3;

--32. List out employees with their department names. 
SELECT * FROM EMPLOYEE
INNER JOIN DEPARTMENT
ON EMPLOYEE.DEPARTMENT_ID = DEPARTMENT.DEPARTMENT_ID;

--33. Display employees with their designations. 
SELECT * FROM EMPLOYEE
INNER JOIN JOB
ON EMPLOYEE.JOB_ID = JOB.Job_ID;

--34. Display the employees with their department names and CITY. 
SELECT * FROM EMPLOYEE
INNER JOIN DEPARTMENT
ON EMPLOYEE.DEPARTMENT_ID = DEPARTMENT.DEPARTMENT_ID
JOIN LOCATION
ON DEPARTMENT.Location_Id = LOCATION.Location_ID;

--35. How many employees are working in different departments? Displaywithdepartment names. 
SELECT NAME,COUNT(*) FROM DEPARTMENT
LEFT JOIN EMPLOYEE
ON DEPARTMENT.Department_Id = EMPLOYEE.DEPARTMENT_ID
GROUP BY NAME;

--36. How many employees are working in the sales department?
SELECT NAME,COUNT(*) FROM DEPARTMENT
INNER JOIN EMPLOYEE
ON DEPARTMENT.Department_Id = EMPLOYEE.DEPARTMENT_ID
WHERE NAME ='SALES'
GROUP BY NAME;

--37. Which is the department having greater than or equal to 5 employees? Display the department names in ascending order. 
SELECT NAME,COUNT(*) FROM DEPARTMENT
INNER JOIN EMPLOYEE
ON DEPARTMENT.Department_Id = EMPLOYEE.DEPARTMENT_ID
GROUP BY NAME
HAVING COUNT(*)>=5
ORDER BY NAME;

--38. How many employees are working in "New York"?
SELECT COUNT(*) FROM EMPLOYEE
JOIN DEPARTMENT
ON EMPLOYEE.DEPARTMENT_ID = DEPARTMENT.Department_Id
JOIN LOCATION
ON DEPARTMENT.Location_Id = LOCATION.Location_ID
WHERE CITY = 'NEW YORK';

--39. Display all employees in sales or operation departments.
SELECT NAME,COUNT(*) FROM DEPARTMENT
INNER JOIN EMPLOYEE
ON DEPARTMENT.Department_Id = EMPLOYEE.DEPARTMENT_ID
WHERE NAME = 'SALES' OR NAME = 'OPERATION'
GROUP BY Name