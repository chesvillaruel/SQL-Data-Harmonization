---Creating a database
CREATE DATABASE PUMA

--DELETING A DATABASE
DROP DATABASE PUMA

-- ACTIVATING THE DATABASE (BECAUSE THE DEFAULT DATABASE IS MASTER)
USE PUMA
--Inserting table inside the database
CREATE TABLE Customer_Database (CustomerID Int, CustomerName Varchar(30), Age Int)
-- Viewing the tables
Select * from Customer_Database
--Selecting a particular column(age)
Select Age from Customer_Database
-- Inserting values into the table
Insert into Customer_Database values(1,'Irene', 24)
Insert into Customer_Database values(2,'Seojoon', 32)
Insert into Customer_Database values(3,'Kyungsoo', 27)
Insert into Customer_Database values(4,'Chanyeol', 29)
Insert into Customer_Database values(5,'Taeyeon',35)


--Keeping conditions to the table
Select * from Customer_Database where age > 25

--Giving multiple conditions to the table
--and operator
Select * from Customer_Database where Age > 25 and CustomerID >3
--OR OPERATOR
SELECT * FROM Customer_Database WHERE AGE > 25 OR CustomerID > 3
--NOT OPERATOR
SELECT * FROM Customer_Database WHERE NOT CustomerName = 'timothy'

--Altering the table
ALTER TABLE Customer_Database ADD PROFIT INT
 
 --ALTERING THE TABLE CHANGE A COLUMN DATA TYPE
ALTER TABLE Customer_Database ALTER COLUMN Profit Float

--ALTERING THE TABLE CHANGE A COLUMN DATA TYPE
ALTER TABLE Customer_Database DROP COLUMN Profit

--Try to add sales column with floar
ALTER TABLE Customer_Database ADD Sales Float



--Updating the table
Update Customer_Database SET Sales = 27.28 Where CustomerID = 1
UPDATE Customer_Database SET Sales = 29.28 Where CustomerID = 2
UPDATE Customer_Database SET Sales = 31.28 where CustomerID = 3
UPDATE Customer_Database SET Sales = 33.28 Where CustomerID = 4
UPDATE Customer_Database SET Sales = 35.28 Where CustomerID = 5


--create another table
CREATE TABLE PRODUCT_INFO(CustomerID int, PRODUCTid int, PRODUCTname varchar(30))
SELECT * FROM PRODUCT_INFO
--in tomorrow session are going to prepare a presentation
--customerID 1,2,3,6, and 7
--joins, advanced function, union, windowing func, if else
submit github, then azure account

Insert Into PRODUCT_INFO values (1,11, 'Slippers')
Insert Into PRODUCT_INFO values (2,25, 'Radio')
Insert Into PRODUCT_INFO values (3,33, 'Tumbler')
Insert Into PRODUCT_INFO values (6,47, 'Printer')
Insert Into PRODUCT_INFO values (7,25, 'Laptop')

UPDATE PRODUCT_INFO SET PRODUCTname = 'Laptop Stand' Where CustomerID = '7'

/*USE PUMA
ALTER TABLE PUMA.DBO.CUSTOMER_DATABASE ALTER COLUMN SALES FLOAT
SELECT * FROM Customer_Database_2*/
Truncate Table Customer_database_2
Insert Into Customer_Database_2 values (7,'Chris Pine',11,2)
Insert Into Customer_Database_2 values (8,'Chris Hemsworth',25,2)
Insert Into Customer_Database_2 values (9,'Chris Evans',26, 2)
Insert Into Customer_Database_2 values (10,'Chris Pratt',28,2)
Insert Into Customer_Database_2 values (11,'Chritopher Nolan',28,2)

SELECT * FROM Customer_Database UNION SELECT * FROM Customer_Database_2

 

--imported excel files
SELECT * FROM [dbo].[Orders$]
SELECT * FROM [dbo].[Returns$]
SELECT * FROM [dbo].[Users$]

 


--SELECT * FROM PRIMARY_TABLE INNER JOIN CHILD_TABLE1 ON PARENT_TABLE.PRIMARYKEY = CHILD_TABLE1.PRIMARYKEY 
--INNER JOIN CHILD_TABLE2 ON PARENT_TABLE.PRIMARYKEY = CHILD_TABLE2.PRIMARYKEY

 

SELECT * FROM [dbo].[Orders$] INNER JOIN [dbo].[Returns$] ON [Orders$].[Order ID] = [Returns$].[Order ID]
INNER JOIN [dbo].[Users$] ON [Orders$].[Region] = [Users$].[Region]

 

 --ROWID
--ORDER ID
 --REGION

 -common keys with the two tables same(column_names,data)

 

 --like, having, groupby, in, between, rank desc

 

 --Sorting the data

 


 --DESC descending
 SELECT * FROM Orders$ Order By [ROW ID] DESC

 

 --ASC ascending
 SELECT * FROM Orders$ Order By [ROW ID] ASC

 

 --Like Operator Wildcards(%,
 SELECT * FROM Orders$ WHERE [Customer Name] Like '%k' 

 

  -- Between Operator 
 SELECT * FROM Orders$ WHERE Sales between 2000 and 4000

 

 --Calculated Field or DAX Field                    Ask lj get column sales/profit
 SELECT *, (Sales/Profit) as 'S/P' FROM Orders$ 

 

 --Aggregate Function Sum min max avg count
 SELECT SUM        (SALES)                FROM Orders$
 SELECT MIN        (SALES)                FROM Orders$
 SELECT MAX        (SALES)                FROM Orders$
 SELECT COUNT    (SALES)                FROM Orders$
 SELECT AVG        (SALES)                FROM Orders$

 

 -- ALIASING giving a column name
 SELECT SUM        (SALES)        AS  'SUM'            FROM Orders$
 SELECT MIN        (SALES)        AS    'MIN'            FROM Orders$
 SELECT MAX        (SALES)        AS    'MAX'            FROM Orders$
 SELECT COUNT    (SALES)        AS    'COUNT'            FROM Orders$
 SELECT AVG        (SALES)        AS    'AVG'            FROM Orders$

 

 --Group by needs aggregated functions
 SELECT SUM(SALES) AS 'Sum of Sales', -- aggregated func
        REGION                            -- database column
 FROM Orders$ 
 Group By Region

 

 --Having Operator
 SELECT SUM(SALES) AS 'Sum of Sales', -- aggregated func
        REGION                            -- database column
 FROM Orders$ 
 Group By Region 
 Having Region = 'West'

 

 --Creating a view
 CREATE VIEW Group_By_Table AS 
 SELECT SUM(SALES) AS 'Sum of Sales', 
        REGION                            
 FROM Orders$ 
 Group By Region

 

 SELECT * FROM Group_By_Table WHERE Region ='West'

 

 --Window functions
 --RANK rank by sales desc
 SELECT *, RANK() OVER (ORDER BY SALES DESC) AS 'RANK' FROM Orders$

 

 /* Create table with identical duplicates( having column name as customerid customername sales (Need 10 Entries)
 */

 

 /* CustomerID CustomerName Sales
    1, SAM, 23
    1, SAM, 23
    1, SAM, 23
    2, LJ, 22
    2, LJ, 22
    3, Timothy, 24
    3, Timothy, 24
    3, Timothy, 24
    3, Timothy, 24
    3, Timothy, 24
    3, Timothy, 24
    4, Roman, 25
    4, Roman, 25
    4, Roman, 25
    4, Roman, 25
*/
    /* 
    Advanced Function , Windows Function, If Else Statement, 
    Case Statement, Numeric Functions, String Functions, Stored Procedures, Triggers, Deployment in Github,
    Connecting SQL Server with Power BI
    TheN SSIS / SSRS
    */

--advance function
Select CURRENT_TIMESTAMP
Select DAY ('2020-12-05')
Select GETDATE ()
Select GETUTCDATE ()
Select ISDATE ('2020-12-05')
Select MONTH ('2020-12-05')
Select SYSDATETIME ()
Select YEAR ('2020-12-05')
Select COALESCE (null,'yourname',null,'sneha','Besant')    --takes first non null value
Select CONVERT (int,26.85)      
Select SESSION_USER
Select SYSTEM_USER---current working on the session
Select USER_NAME () ---can very off

--string functions
 
SELECT CHAR (95)           --ascii code
SELECT CONCAT ('SURESH','yournamme and surname','UNNIKRISHNAN')
SELECT DATALENGTH ('SURESH U')
SELECT LEFT('SURESH',2)
select LEN('SURESH')
SELECT LOWER('SURESH')
SELECT LTRIM('   SURESH')
select REPLACE('SURESH','S','R')
SELECT REPLICATE('SURESH ',5)    
select REVERSE('SURESH')
SELECT RIGHT('SURESH',2)
SELECT RTRIM('SURESH   ')
SELECT SUBSTRING('SURESH',3,2)
select UNICODE('A')                  -- Reverse of Char
select UPPER('suresh unnikrishnan')

--**Numeric functions
 
//**
ABS Returns the absolute value of a number**//
 
Select ABS(-18)
 
//**ACOS Returns the arc cosine of a number**//
 
Select Acos (0.5)
 
//**ASIN Returns the arc sine of a number**//
 
Select ASIN(0.5)
 
//**ATAN Returns the arc tangent of one or two numbers**//
 
Select ATAN(0.5)
 
 
--//**CEILING Returns the smallest integer value that is >= to a number**//
 
Select CEILING(26.10)
 

//**COS Returns the cosine of a number**//
 
Select Cos(90)
 

//**COT Returns the cotangent of a number**//
 
Select Cot(90)
 

//**DEGREES Converts a value in radians to degrees**//
 
Select DEGREES(1)
 

//**EXP Returns e raised to the power of a specified number**//
 
Select EXP(1)
 
//**FLOOR Returns the largest integer value that is <= to a number**//
 
Select FLOOR(25.90)
 
//**LOG Returns the natural logarithm of a number, or the logarithm of a number to a specified base**//
 
Select Log(2)
 
//**LOG10 Returns the natural logarithm of a number to base 10**//
 
Select LOG10(10)
 
 
//**PI Returns the value of PI**//
 
Select PI()
 
//**POWER Returns the value of a number raised to the power of another number**//
 
Select POWER(2,3)
 
//**RADIANS Converts a degree value into radians**//
 
Select Radians(90)
 
//**RAND Returns a random number**//
 
Select Rand()
 
//**ROUND Rounds a number to a specified number of decimal places**//
 
Select ROUND(25.68,1)
 
//**SIGN Returns the sign of a number**//
 
Select sign (-9)
 

//**SIN Returns the sine of a number**//
 
Select sin (45)
 
//**SQRT Returns the square root of a number**//
 
Select sqrt (64)
 

--//**TAN Returns the tangent of a number**//
 
Select TAN(90)

Create table tb4
(
 ID int,
 FirstName nvarchar(50),
 LastName nvarchar(50),
 Gender nvarchar(50),
 Salary int
)
GO

Insert into tb4 values (1, 'Mark', 'Hastings', 'Male', 60000)
Insert into tb4 values (1, 'Mark', 'Hastings', 'Male', 60000)
Insert into tb4 values (1, 'Mark', 'Hastings', 'Male', 60000)
Insert into tb4 values (2, 'Mary', 'Lambeth', 'Female', 30000)
Insert into tb4 values (2, 'Mary', 'Lambeth', 'Female', 30000)
Insert into tb4 values (3, 'Ben', 'Hoskins', 'Male', 70000)
Insert into tb4 values (3, 'Ben', 'Hoskins', 'Male', 70000)
Insert into tb4 values (3, 'Ben', 'Hoskins', 'Male', 70000)

--Rank--
SELECT *,
RANK() OVER (ORDER BY SALARY DESC) AS Rank
    FROM     TB4

--Dense Rank--
SELECT SALARY,
DENSE_RANK()
OVER (ORDER BY SALARY DESC) AS DENSERANK
FROM TB4

--Row Number--
SELECT *,
ROW_NUMBER()
OVER (ORDER BY SALARY DESC) AS ROWNUMBER
FROM tb4

--select top salary--
 
SELECT TOP 1 Salary
FROM (
      SELECT DISTINCT TOP 3 Salary
      FROM TB4
      ORDER BY Salary DESC
      ) RESULT
ORDER BY Salary desc

-- getting the second highest salary

WITH OUTPUT AS (

SELECT *,
DENSE_RANK()
OVER (ORDER BY SALARY DESC) AS DENSERANK
FROM TB4
)SELECT TOP 1, * FROM OUTPUT WHERE DENSE_RANK = 2

WITH OUTPUT AS (
SELECT *,
ROW_NUMBER()
OVER (ORDER BY SALARY DESC) AS ROW_NUMBER
FROM TB4
) SELECT * FROM OUTPUT WHERE ROW_NUMBER = 5

--Deleting the duplicates--
WITH RESULT AS
(
   SELECT *, ROW_NUMBER()OVER(PARTITION BY ID ORDER BY ID) AS RowNumber
   FROM tb4
)
DELETE FROM RESULT WHERE RowNumber > 1

--if statement--
Create table Employees
(
 Id int primary key identity,
 Name nvarchar(10),
 GenderId int
)
Go
select * from Employees
 
Insert into Employees values ('Mark', 1)
Insert into Employees values ('John', 1)
Insert into Employees values ('Amy', 2)
Insert into Employees values ('Ben', 1)
Insert into Employees values ('Sara', 2)
Insert into Employees values ('David', 1)
 
--Using CASE statement--
SELECT Name, GenderId, 
CASE WHEN GenderId = 1
THEN 'Male'
ELSE 'Female'
END AS Gender
FROM Employees
 
--Using iif statement
SELECT Name, GenderId, IIF(GenderId = 1, 'Male', 'Female') AS Gender
FROM Employees

-- SQL If Else Example--
 
--Declaring Number and Total Variables
DECLARE @Marks INT = 49 ;
 
IF @marks > = 50
BEGIN
   PRINT ' Congratulations ';
   PRINT ' You pass the Examination ';
END
ELSE
BEGIN
   PRINT ' You Failed ';
   PRINT ' Better Luck Next Time ';
END
 

-- SQL Else If Example--
 
--Declaring Total Marks Out of 1000
DECLARE @Total_Marks INT = 800 ;
 
IF @Total_Marks > = 900
BEGIN
   PRINT ' Congratulations ';
   PRINT ' You are eligible for Full Scholarship ';
END
ELSE IF @Total_Marks > = 800
BEGIN
   PRINT ' Congratulations ';
   PRINT ' You are eligible for 50 Percent Scholarship ';
END
ELSE IF @Total_Marks > = 750
BEGIN
   PRINT ' Congratulations ';
   PRINT ' You are eligible for 10 Percent Scholarship ';
END
ELSE
BEGIN

   PRINT ' You are Not eligible for Scholarship ';
   PRINT ' We are really Sorry for You ';
END


--go to statement--
 
DECLARE @TotalMaarks INT
SET @TotalMaarks = 52
 
IF @TotalMaarks >= 50
    GOTO Pass
IF @TotalMaarks < 50
    GOTO Fail
 
Pass:
    PRINT ' Congratulations '
    PRINT ' You pass the Examination '
    RETURN
 
Fail:
    PRINT ' You Failed! '
    PRINT ' Better Luck Next Time '
    RETURN
GO
 
--5 lang in sql DDL,DML,DCL,DQL,TCL--
--DDL- data definition lang 
--it holds the command 
--create,drop,alter,truncate
 
--DQL- data query lang
--it holds select command
 
--DML- data manipulation lang
--insert, update,delete
 
--DCL-data control lang
--it holds the command grant and revoke 
 
--TCL- transcation control lang
--it holds the command 
--commit,rollback,safepoint,set transcation
 
--normalisation
--normalisation is breaking down a historical table into 5 diff segements
--they are 5 rules of normalisation
 
--for the version
SELECT @@VERSION AS 'SQL Server Version'
 
--username--
SELECT @@VERSION AS 'SQL Server Version'
SELECT @@SPID AS 'SP ID', 
       SYSTEM_USER AS 'Login Name', 
       USER AS 'User Name';
 
--lang name--
SELECT @@LANGUAGE AS 'Language Name'
 
--lang Id--
SELECT @@LANGID AS 'Language ID Number'
 
--max/min connections--
SELECT @@MAX_CONNECTIONS AS 'Maximum Connections'
 
--precision--
SELECT @@MAX_PRECISION AS 'Maximum Precision Value'
 
--server name--
SELECT @@SERVERNAME AS 'Server Name'
 
--service name--
SELECT @@SERVICENAME AS 'Service Name'
 
--choose command--
SELECT CHOOSE(3, 'Apple', 'Orange', 'Kiwi', 'Cherry') AS Result2;
 
select * from Orders$


--concat--
select * , CONCAT( [Customer Name],',',[Ship Mode])
as 'First name' from Orders$

---DML DATA MANIPULATION LANGUAGE
---DDL DATA DEFINE LANGUAGE
---TCL Transanctional control language


--creating store procedure--
create procedure P1 as 
with Result as (select [dbo].[Orders$].[Region],[Sales] from [dbo].[Orders$]
full outer join [dbo].[Returns$] on [dbo].[Orders$].[Order ID] = [dbo].[Returns$].[Order ID]
full outer join [dbo].[Users$] on [dbo].[Orders$].[Region] = [dbo].[Users$].[Region])
 
select * from Result
 
where [Region]='West'
 
execute P1
 
create procedure P3 as
truncate table Employees
Insert into Employees values ('Mark', 1)
Insert into Employees values ('John', 1)
Insert into Employees values ('Amy', 2)
Insert into Employees values ('Ben', 1)
Insert into Employees values ('Sara', 2)
Insert into Employees values ('David', 1)
 
SELECT Name, GenderId, IIF(GenderId = 1, 'Male', 'Female') AS Gender
FROM Employees
 
execute P3
 
--trigger--
CREATE TABLE Employee_Test
(
Emp_ID INT Identity,
Emp_name Varchar(100),
Emp_Sal Decimal (10,2)
)
 
INSERT INTO Employee_Test VALUES ('Rohit',10000);
INSERT INTO Employee_Test VALUES ('Vikas',12000);
INSERT INTO Employee_Test VALUES ('Alen',110000);
INSERT INTO Employee_Test VALUES ('Vickey',130000);
INSERT INTO Employee_Test VALUES ('Maria',10000);
 

CREATE TABLE Employee_Test_Audit
(
Emp_ID int,
Emp_name varchar(100),
Emp_Sal decimal (10,2),
Audit_Action varchar(100),
Audit_Timestamp datetime
)
select * from Employee_Test
select * from Employee_Test_Audit
 
CREATE TRIGGER trgAfterInjsert ON [dbo].[Employee_Test] 
FOR INSERT
AS
    declare @empid int;
    declare @empname varchar(100);
    declare @empsal decimal(10,2);
    declare @audit_action varchar(100);
 
    select @empid=i.Emp_ID from inserted i;    
    select @empname=i.Emp_Name from inserted i;    
    select @empsal=i.Emp_Sal from inserted i;    
    set @audit_action='Inserted Record -- After Insert Trigger.';
 
    insert into Employee_Test_Audit
           (Emp_ID,Emp_Name,Emp_Sal,Audit_Action,Audit_Timestamp) 

values(@empid,@empname,@empsal,@audit_action,getdate());
 
    PRINT 'AFTER INSERT trigger fired.'
GO
 
insert into Employee_Test values('tom',9000);