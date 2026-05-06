
CREATE TABLE CUSTOMER (Customer_id number primary key,Name varchar(100),Age number,Gender varchar(10),city varchar(30),
Join_date date);



CREATE TABLE Policies (
    Policy_ID INT PRIMARY KEY,
    Customer_ID INT,
    Policy_Type VARCHAR(50),
    Premium_Amount DECIMAL(10,2),
    Start_Date DATE,
    End_Date DATE,
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);



CREATE TABLE Claims (
    Claim_ID INT PRIMARY KEY,
    Policy_ID INT,
    Claim_Date DATE,
    Claim_Amount DECIMAL(10,2),
    Status VARCHAR(20),
    FOREIGN KEY (Policy_ID) REFERENCES Policies(Policy_ID)
);




CREATE TABLE Payments (
    Payment_ID INT PRIMARY KEY,
    Policy_ID INT,
    Payment_Date DATE,
    Amount DECIMAL(10,2),
    FOREIGN KEY (Policy_ID) REFERENCES Policies(Policy_ID)
);



INSERT all 
INTO Customer (Customer_id,Name,Age,Gender,city,Join_date)
VALUES (1, 'Amit Sharma', 35, 'Male', 'Mumbai', '15-01-2020')

into Customer (Customer_id,Name,Age,Gender,city,Join_date) VALUES 
(2, 'Priya Mehta', 29, 'Female', 'Delhi', '10-03-2021')

into Customer (Customer_id,Name,Age,Gender,city,Join_date) VALUES 
(3, 'Ravi Kumar', 42, 'Male', 'Pune', '22-07-2019')
select * from dual



select * from customer

select * from policies

INSERT INTO Policies VALUES
(103, 3, 'Motor Insurance', 12000, '01-08-2019', '01-08-2026');




INSERT INTO Claims VALUES
(1002, 103, '10-09-2021', 5000, 'Rejected');




INSERT INTO Payments 
VALUES
(2003, 103, '01-08-2019', 12000);

SELECT * FROM PAYMENTS


---1 a) Total Premium Collected by Year

SELECT EXTRACT(YEAR FROM PAYMENT_DATE) AS YEAR,
SUM(AMOUNT) AS TOTAL_PREMIUM
FROM PAYMENTS
GROUP BY EXTRACT(YEAR FROM PAYMENT_DATE);



SELECT * FROM CLAIMS

---b) Claim Ratio (Claims Approved vs Total Claims)


SELECT COUNT(CASE WHEN STATUS = 'APPROVED' THEN 1 END 0)*100.0/COUNT(*)
FROM CLAIMS;


---Top 3 Cities by Customer Count

SELECT * FROM CUSTOMER

select city,count(*)as customer_count
from customer
group by city 
order by customer_count desc
where rownum <=3;



---customer Retention (Policies > 5 years)

select * from policies

select count(*)as retained_customer
from policies
where (end_date - start_date)>(365 *5);


update policies set start_date = '01-08-22' where customer_id =3;

