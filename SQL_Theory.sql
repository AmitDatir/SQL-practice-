--SQL Datatypes:
CHAR(x)  --Stores String(0-255), stores character with Fixed memory allocation
VARCHAR(x)  --Stores String(0-255), stores character only upto given length of string
BLOB(x)  --Stores large binary objects/large string(0-65535) 
INT  --Stores integers(-2147 to 483648 || 2147 to 483647)
TINYINT  --Stores small integers(-128 TO 127)
BIGINT  --Stores big integers(-9223372036854775808 to 9223372036854775807)
BIT(x)  --Stores x-bit values, x value ranges from 1 to 64
FLOAT  --Stores decimal number, precision upto 23 digits
DOUBLE  --Stores decimal number, precision from 24 to 53 digits
BOOLEAN  --Boolean values 0 or 1
DATE  --date in format YYYY-MM-DD ranging from 1000-01-01 to 9999-12-31
YEAR  --year in 4 digit from 1901 to 2155

--Signed & Unsigned datatypes:By default, all numeric datatypes can include negative values(Signed Datatypes). We can define specific numeric data types as unsigned datatype, to include only positive values
--Unsigned: TINYINT UNSIGNED(0 to 255)
--Signed: TINYINT (-128 to 127)



--Types of SQL Commands:
DDL(Data Definition Language) : Create, alter, rename, truncate & Drop
DQL(Data Query Language) : Select
DML(Data Manipulation Language) : insert, update & delete
DCL(Data Control Language) : grant & revoke permission to user
TCL(Transaction Control Language) : Start Transaction, commit, rollback




  
Database:
--Create a new database:
CREATE DATABASE db_name;

--Create database only if not created earlier:
CREATE DATABASE IF NOT EXISTS db_name;   --Shows only warning, instead of error if database already exist

--Delete any database:
DROP DATABASE db_name;

--Delete database only if it exist:
DROP DATABASE IF EXISTS db_name;   --Shows only warning, instead of error if database does not exist

--Use specific database:
USE db_name;

--To display all the database created:
SHOW DATABASES;




Table:
--Create a new table:
CREATE TABLE table_name (       --create table schema
  column_name1 datatype constraint,
  column_name2 datatype constraint,
  column_name3 datatype constraint
);

--Insert row values:(when order of column defined & type is known to us)
INSERT INTO table_name VALUES(id, name, age);

--Insert values inside limited columns with specific order:
INSERT INTO table_name
  (colname1, colname2)
  VALUES
  (col1_v1, col2_v1),
  (col1_v2, col2_v2);

--To select & view entire table added:
SELECT * FROM table_name;

--To display all the tables created from the database in use:
SHOW TABLES;

--Delete any table:
DROP TABLE table_name;

--Exp.:
CREATE TABLE student (
  id INT PRIMARY KEY,   --Primary Key is always unique and not null
  name VARCHAR(50),
  age INT NOT NULL
); 
INSERT INTO student VALUES(1, "Amit", 25);
INSERT INTO student VALUES(2, "Abhi", 27);
SELECT * FROM student;



--KEYS:
PRIMARY KEY
-- It is a column(or set of columns) in a table that uniquely idetifies each row.(a unique key)
-- There is only 1 primary key and it should be NOT NULL

FOREIGN KEY
-- It is a column(or set of columns) in a table that refers to the primary key of another table
-- There can be multiple Foreign keys
-- Foreign keys can have duplicate and NULL values



--Constraints: (used to speify rules for data in a table)
NOT NULL
-- columns can not have NULL values
  
UNIQUE
-- all values in column are different
  
PRIMARY KEY
-- makes a column unique and not null but used only once
-- Define1:
CREATE TABLE table_name (       
  column_name1 datatype PRIMARY KEY
);
-- Define2:
CREATE TABLE table_name (      
  column_name1 datatype constraint,
  column_name2 datatype constraint,
  column_name3 datatype constraint,
  PRIMARY KEY (column_name1)         
);
-- Define3:
CREATE TABLE table_name (      
  column_name1 datatype constraint,
  column_name2 datatype constraint,
  column_name3 datatype constraint,
  PRIMARY KEY (column_name1, column_name2)     --in this case, both columns can have duplicate values but their combination should be unique     
);

FOREIGN KEY
-- prevent action that would destroy links between two tables
-- Define1:
CREATE TABLE table_name1 (      
  column_name1 datatype PRIMARY KEY,
  column_name2 datatype constraint,
  column_name3 datatype constraint,
  FOREIGN KEY (column_name3) references table_name2 (column_name4)           --column_name4 will be a primary key of table_name2
);

DEFAULT
-- sets the default value of a column
-- Define:
CREATE TABLE table_name (
  column_name1 datatype PRIMARY KEY
  column_name2 datatype DEFAULT (default value)
);

CHECK
-- it can limit the values allowed in a column
-- Define1:
CREATE TABLE table_name (
  column_name1 datatype CHECK(condition)   --exp: CHECK(age >= 18)
);
-- Define2:
CREATE TABLE table_name (      
  column_name1 datatype constraint,
  column_name2 datatype constraint,
  column_name3 datatype constraint,
  CONSTRAINT constraint_name CHECK (conditions)        --exp: CHECK(age >=18 AND/OR city="Delhi")
);



SELECT :
--Use to select any data from the database
-- Basic syntax:
SELECT col1, col2 FROM table_name;

-- To select all:
SELECT * FROM table_name;

-- To display unique values from the table column:
SELECT DISTINCT col1 FROM table_name;




WHERE clause:
--To define some conditions
-- Basic syntax:
SELECT col1, col2 FROM table_name
  WHERE conditions;               --exp.: WHERE marks > 80 OR city = "Mumbai";

--Using operators in WHERE:
Arithmatic Operator : + , - , * , / , %
Comparison Operator : =(equal to), !=(not equal to), > , < , >= , <=
Logical Operator : AND, OR, NOT, IN, BETWEEN, ALL, LIKE, ANY
Bitwise Operator : &(Bitwise AND), |(Bitwise OR)


  
--Operators:
AND 
--to check both conditions to be true
--Syntax:
SELECT * FROM table_name WHERE condition1 AND condition2;

OR 
--to check for one of the conditions to be true
--Syntax:
SELECT * FROM table_name WHERE condition1 OR condition2;

BETWEEN
--to select between given range
--Syntax:
SELECT * FROM table_name WHERE column1 BETWEEN value1 AND value2;  --both values are inclusive

IN
--to select value that matches any value in list
--Syntax:
SELECT * FROM table_name WHERE column1 IN (value1, value2);

NOT
--to negate the given condition
--Syntax:
SELECT * FROM table_name WHERE column1 NOT IN (value1, value2);  --reverse the given condition



LIMIT clause:
--sets upper limit on number of (tuples) rows to be returned
-- Basic syntax:
SELECT * FROM table_name
  WHERE conditions
  LIMIT number;               --exp.: SELECT * FROM student LIMIT 3;



ORDER BY clause: 
--to sort in ascending(ASC) or descending order(DESC)
-- Basic syntax:
SELECT * FROM table_name
  ORDER BY column1 ASC;               --exp.: SELECT * FROM student ORDER BY city ASC;
-- by default, ascending sort is applied if not stated


Aggregate functions:
--aggregate functions perform a calculation on a set of values and return a single value
COUNT() : --to get count of entries in a column
MAX() : --to get max value from the column
MIN() : --to get min value from the column
SUM() : --to get sum of all values from the column
AVG() : --to get avg of all values from the column



GROUP BY clause: 
--groups rows that have the same values into summary rows.
--It collects data from multiple records and groups the result by one or more column
--Generally, we use GROUP BY clause with some aggregation function
-- Basic syntax:
SELECT column1, fun(column2) FROM table_name
  GROUP BY column1;                           --exp.: SELECT city, count(name) FROM student GROUP BY city;

--we need to use GROUP BY clause on same number of columns as we used in SELECT clause without aggregate function
