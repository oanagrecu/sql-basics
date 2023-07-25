# SQL questionnaire

## Setup
Import this [fake database content](mysqlsampledatabase.zip) into your database.

Below you will find a list of questions.

Find out the answer to each question using the dummy data in your database.

**Copy this file** (see: copy raw content) and fill in your queries + answer on the given location in each question.

## START !

### 1) How many customers do we have?
```
SELECT COUNT(*) AS total_customers
FROM customers;
```

solution: `122`

### 2) What is the customer number of Mary Young?
```
select customerNumber from customers where contactFirstName="Mary" and contactLastName="Young";
```

solution: `219`

### 3) What is the customer number of the person living at Magazinweg 7, Frankfurt 60528?
```
SELECT customerNumber
FROM customers
WHERE addressLine1 = 'Magazinweg 7' AND city = 'Frankfurt' AND postalCode = '60528';
```

solution: `247`

### 4) If you sort the employees on their last name, what is the email of the first employee?
```
select lastName, email from employees group by lastName limit 1;
```

solution: `gbondur@classicmodelcars.com`

### 5) If you sort the employees on their last name, what is the email of the last employee?
```
SELECT email
FROM employees
ORDER BY lastName DESC
LIMIT 1;
```

solution: `gvanauf@classicmodelcars.com`

### 6) What is first the product code of all the products from the line 'Trucks and Buses', sorted first by productscale, then by productname.
```
SELECT productCode, productLine
FROM products
WHERE productLine = 'Trucks and Buses'
ORDER BY productScale, productName;
```

solution: `S12_4473`

### 7) What is the email of the first employee, sorted on their last name that starts with a 't'?
```
SELECT 
    email, lastName
FROM
    employees
WHERE
    lastName LIKE 't%';
```
solution: `lthompson@classicmodelcars.com`

### 8) Which customer (give customer number) payed by check on 2004-01-19?
```
select customerNumber from payments
where paymentDate = '2004-01-19';
```

solution: `177`

### 9) How many customers do we have living in the state Nevada or New York?
```
SELECT COUNT(*) AS totalCustomers
FROM customers
WHERE state IN ('NV', 'NY');
```
solution: `7`

### 10) How many customers do we have living in the state Nevada or New York or outside the united states?
```
SELECT COUNT(*) AS totalCustomers FROM customers
WHERE state IN ('NV', 'NY') OR country != 'USA';
```
solution: `93`

### 11) How many customers do we have with the following conditions (only 1 query needed):  - Living in the state Nevada or New York OR - Living outside the USA or the customers and with a credit limit above 1000 dollar?
```
SELECT COUNT(*) AS totalCustomers
FROM customers
WHERE (state IN ('Nevada', 'New York') OR country != 'USA')
AND creditLimit > 1000;

```

solution: `70`

### 12) How many customers don't have an assigned sales representative?
```
SELECT COUNT(*) AS customersWithoutSalesRep
FROM customers
WHERE salesRepEmployeeNumber IS NULL;
```

solution: `22`

### 13) How many orders have a comment?
```
SELECT COUNT(*) AS totalOrdersWithComments
FROM orders
WHERE comments IS NOT NULL;
```
solution: `80`

### 14) How many orders do we have where the comment mentions the word "caution"?
```
SELECT COUNT(*) AS ordersWithCaution
FROM orders
WHERE comments LIKE '%caution%';
```

solution: `4`

### 15) What is the average credit limit of our customers from the USA? (rounded)
```
SELECT ROUND(AVG(creditLimit)) AS averageCreditLimit
FROM customers
WHERE country = 'USA';
```
solution: `78103`


### 16) What is the most common last name from our customers?
```
SELECT contactLastName, COUNT(*) AS nameFrequency
FROM customers
GROUP BY contactLastName
ORDER BY nameFrequency DESC
LIMIT 1;
```

solution: `Young`

### 17) What are valid statuses of the orders?
- [ ] Resolved

- [ ] Cancelled

- [ ] Broken

- [ ] On Hold

- [ ] Disputed

- [ ] In Process

- [ ] Processing

- [ ] Shipped

```
select distinct status from orders where status not in("%Resolved%",  "%Cancelled%", "%Broken%", "%on hold%" ,"%Disputed%" ,"%in process%" ,"%Processing%", "%Shipped%");
```

solution: `Broken , processing`


### 18) In which countries don't we have any customers?
- [ ] Austria

- [ ] Canada

- [ ] China

- [ ] Germany

- [ ] Greece

- [ ] Japan

- [ ] Philippines

- [ ] South Korea

```
SELECT country
FROM (SELECT DISTINCT country FROM customers) AS noCustomerCountries
WHERE country IN ('Austria', 'Canada', 'China', 'Germany', 'Greece', 'Japan', 'Philippines', 'South Korea');
```

solution: `China  Greece South Korea`


### 19) How many orders where never shipped?
```
SELECT COUNT(*)
FROM orders
WHERE shippedDate IS NULL;
```
solution: `14`

### 20) How many customers does Steve Patterson have with a credit limit above 100 000 EUR?
```
SELECT COUNT(*) AS NumberOfCustomers
FROM customers 
JOIN employees  ON customers.salesRepEmployeeNumber = employees.employeeNumber
WHERE employees.firstName = 'Steve' AND employees.lastName = 'Patterson'
  AND customers.creditLimit > 100000;
```
solution: `3`

### 21) How many orders have been shipped to our customers?
```
SELECT COUNT(*) AS NumberOfShippedOrders
FROM orders
WHERE shippedDate IS NOT NULL;
```

solution: `312`

### 22) How much products does the biggest product line have? And which product line is that?
```
SELECT COUNT(*) AS numProducts, productLine
FROM products
GROUP BY productLine
ORDER BY numProducts DESC
LIMIT 1;
```

solution: `'38', 'Classic Cars'`

### 23) How many products are low in stock? (below 100 pieces)
```
SELECT COUNT(*) AS numLowInStock
FROM products
WHERE quantityInStock < 100;
```

solution: `2`

### 24) How many products have more the 100 pieces in stock, but are below 500 pieces.
```
SELECT COUNT(*) AS numProductsBetween100And500
FROM products
WHERE quantityInStock > 100 AND quantityInStock < 500;
```
solution: `3`

### 25) How many orders did we ship between and including June 2004 & September 2004
```
SELECT COUNT(*) AS NumberOfShippedOrders
FROM orders
WHERE shippedDate >= '2004-06-01' AND shippedDate <= '2004-09-30';
```
solution: `43`

### 26) How many customers share the same last name as an employee of ours?
```
ELECT contactLastName, count(DISTINCT customers.customerNumber) AS numCustomersWithSameLastName
FROM customers 
JOIN employees  ON customers.contactLastName = employees.lastName;
```

solution: `'King', 9`

### 27) Give the product code for the most expensive product for the consumer?
```

```

solution: `<your solution here>`

### 28) What product (product code) offers us the largest profit margin (difference between buyPrice & MSRP).
```
SELECT productCode, productName
FROM products
ORDER BY (MSRP - buyPrice) DESC
LIMIT 1;
```
solution: `'S10_1949', '1952 Alpine Renault 1300'`

### 29) How much profit (rounded) can the product with the largest profit margin (difference between buyPrice & MSRP) bring us.
```
SELECT ROUND((MSRP - buyPrice), 0) AS profit
FROM products
ORDER BY (MSRP - buyPrice) DESC
LIMIT 1;
```
solution: `116`

### 30) Given the  product number of the products (separated with spaces) that have never been sold?
```
<Your SQL query here>
```
solution: `<your solution here>`

### 31) How many products give us a profit margin below 30 dollar?
```
SELECT COUNT(*) AS numProductsBelow30Profit
FROM products
WHERE (MSRP - buyPrice) < 30;
```

solution: `23`

### 32) What is the product code of our most popular product (in number purchased)?
```
SELECT productCode
FROM orderdetails
GROUP BY productCode
ORDER BY SUM(quantityOrdered) DESC
LIMIT 1;
```
solution: `S18_3232'
`

### 33) How many of our popular product did we effectively ship?
```
SELECT COUNT(od.productCode) AS shippedPopularProductCount
FROM orderdetails od
JOIN orders o ON od.orderNumber = o.orderNumber
JOIN (
    SELECT productCode, SUM(quantityOrdered) AS totalQuantity
    FROM orderdetails
    GROUP BY productCode
    ORDER BY totalQuantity DESC
    LIMIT 1
) AS popular_product ON od.productCode = popular_product.productCode
WHERE o.status = 'Shipped';
```

solution: `50`

### 34) Which check number paid for order 10210. Tip: Pay close attention to the date fields on both tables to solve this.  
```
SELECT checkNumber, paymentDate
FROM payments 
JOIN orders  ON payments.customerNumber = orders.customerNumber
WHERE orders.orderNumber = 10210 
AND payments.paymentDate <= orders.shippedDate
ORDER BY payments.paymentDate DESC
LIMIT 1;
```

solution: `'CI381435', '2004-01-19'
`

### 35) Which order was paid by check CP804873?
```
SELECT orderNumber
FROM orders 
JOIN customers  ON orders.customerNumber = customers.customerNumber
JOIN payments ON customers.customerNumber = payments.customerNumber
WHERE payments.checkNumber = 'CP804873';
```

solution: `'10108'
'10198'
'10330'
`

### 36) How many payments do we have above 5000 EUR and with a check number with a 'D' somewhere in the check number, ending the check number with the digit 9?
```
SELECT COUNT(*) AS NumberOfPayments
FROM payments
WHERE amount > 5000
AND checkNumber LIKE '%D%9';
```
solution: `3`


### 38) In which country do we have the most customers that we do not have an office in?
```
<Your SQL query here>
```

solution: `<your solution here>`

### 39) What city has our biggest office in terms of employees?
```
SELECT offices.city, COUNT(employees.employeeNumber) AS employeeCount
FROM offices
LEFT JOIN employees ON offices.officeCode = employees.officeCode
GROUP BY offices.city
ORDER BY employeeCount DESC
LIMIT 1;
```
solution: `San Francisco`

### 40) How many employees does our largest office have, including leadership?

```
SELECT offices.city, COUNT(employees.employeeNumber) AS employeeCount
FROM offices
LEFT JOIN employees ON offices.officeCode = employees.officeCode
GROUP BY offices.city
ORDER BY employeeCount DESC
LIMIT 1;
```

solution: `6`

### 41) How many employees do we have on average per country (rounded)?
```
<Your SQL query here>
```

solution: `<your solution here>`

### 42) What is the total value of all shipped & resolved sales ever combined?
```
<Your SQL query here>
```

solution: `<your solution here>`

### 43) What is the total value of all shipped & resolved sales in the year 2005 combined? (based on shipping date)
```
<Your SQL query here>
```

solution: `<your solution here>`


### 44) What was our most profitable year ever (based on shipping date), considering all shipped & resolved orders?
```
<Your SQL query here>
```

solution: `<your solution here>`

### 45) How much revenue did we make on in our most profitable year ever (based on shipping date), considering all shipped & resolved orders?
```
<Your SQL query here>
```

solution: `<your solution here>`

### 46) What is the name of our biggest customer in the USA of terms of revenue?
```
<Your SQL query here>
```

solution: `<your solution here>`


### 47) How much has our largest customer inside the USA ordered with us (total value)?
```
<Your SQL query here>
```

solution: `<your solution here>`

### 48) How many customers do we have that never ordered anything?
```
<Your SQL query here>
```

solution: `<your solution here>`

### 49) What is the last name of our best employee in terms of revenue?
```
<Your SQL query here>
```

solution: `<your solution here>`


### 50) What is the office name of the least profitable office in the year 2004?
```
<Your SQL query here>
```

solution: `<your solution here>`


## Are you done? Amazing!
![](../_assets/clap-clap-clap.gif)
