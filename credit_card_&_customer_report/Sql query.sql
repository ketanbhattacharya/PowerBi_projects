-- Project--
create database PowerBiProject;
use powerBiproject;

-- creating table for creditCard details

CREATE TABLE cc_detail (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date varchar(50),
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);
-- importing data
/*C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql -u root -p
use PowerBiproject;
SET GLOBAL LOCAL_INFILE=1;
quit;
#mysql --local-infile=1 -u root -p #client-> server
mysql --local-infile=1 -u root -p
use PowerBiproject;
F:\POWERBI\pracitce\p_3
*/
set sql_safe_updates = 0;
SELECT STR_TO_DATE(Week_Start_Date, '%d-%m-%Y') FROM cc_detail;
ALTER TABLE cc_detail ADD COLUMN new_datetime DATETIME;
UPDATE cc_detail 
SET new_datetime = STR_TO_DATE(Week_Start_Date, '%d-%m-%Y');

select count(*) from cc_detail;
#CC_Details
LOAD DATA LOCAL INFILE 'F:\\POWERBI\\pracitce\\p_3\\credit_card.csv'
INTO TABLE cc_detail
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- 2. Create cc_detail table

CREATE TABLE cust_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);
ALTER TABLE cc_detail DROP COLUMN new_datetime;
LOAD DATA LOCAL INFILE 'F:\\POWERBI\\pracitce\\p_3\\customer.csv'
INTO TABLE cust_detail
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;