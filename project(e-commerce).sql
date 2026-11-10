create database project; # creation of database
use project;
#creatiom of customers table
create table customers(customer_id int primary key, customer_name varchar(20), email varchar(20), phone bigint, city varchar(20));
describe customers;

#creation of categories table
create table categories(category_id int primary key, category_name varchar(20));
describe categories;

#creation of products table
create table products(product_id int primary key, category_id int, foreign key(category_id) references categories(category_id),product_name varchar(20),
	price decimal(10,2),stock_quantity int);
describe products;

#creation of orders table
create table orders(order_id int primary key,customer_id int, foreign key(customer_id) references customers(customer_id),
	product_id int, foreign key(product_id) references products(product_id), quantity int, order_date varchar(30), order_status varchar(30));
describe orders;

#creation of payments table
create table payments(payment_id int primary key,order_id int, foreign key(order_id) references orders(order_id), 
payment_method varchar(20), payment_amount int, payment_status varchar(30), payment_date varchar(30));
describe payments;

#insertion of values into customers table 
insert into customers values 
(101,'Aarav Sharma','aarav@gmail.com','9876500001','Hyderabad'), 
(102,'Bhavya Reddy','bhavya@gmail.com','9876500002','Vijayawada'), 
(103,'Charan Kumar','charan@gmail.com','9876500003','Visakhapatnam'), 
(104,'Divya Patel','divya@gmail.com','9876500004','Bengaluru'), 
(105,'Esha  Gupta','esha@gmail.com','9876500005','Chennai'), 
(106,'Farhan Ali','farhan@gmail.com','9876500006','Mumbai'), 
(107,'Gopi Krishna','gopi@gmail.com','9876500007','Warangal'), 
(108,'Harini Rao','harini@gmail.com','9876500008','Guntur'), 
(109,'Ishaan Verma','ishaan@gmail.com','9876500009','Pune'), 
(110,'John Mathew','john@gmail.com','9876500010','Kochi');
select * from customers;

#insertion of values into categories table
insert into categories values
(201,'Electronics'), 
(202,'Fashion'), 
(203,'Books'), 
(204,'Home Appliances'), 
(205,'Sports'); 
select * from categories;

#insertion of values into products table
insert into products values
(301,201,'Laptop',65000,20), 
(302,201,'Smartphone',25000,40), 
(303,201,'Bluetooth Speaker',3000,50), 
(304,202,'Running Shoes',4500,35), 
(305,202,'Backpack',1800,60), 
(306,203,'Python Programming',700,100), 
(307,203,'SQL Complete Guide',650,80), 
(308,204,'Mixer Grinder',4200,25), 
(309,204,'Air Fryer',5500,18), 
(310,205,'Cricket Bat',2200,30); 
select * from products;

#insertion of values into orders table
insert into orders values 
(401,101,301,1,'2026-07-01','Delivered'), 
(402,102,302,1,'2026-07-02','Delivered'), 
(403,103,304,2,'2026-07-03','Shipped'), 
(404,104,306,1,'2026-07-04','Delivered'), 
(405,105,309,1,'2026-07-05','Pending'), 
(406,106,303,3,'2026-07-06','Delivered'), 
(407,107,307,2,'2026-07-07','Delivered'), 
(408,108,305,1,'2026-07-08','Cancelled'), 
(409,109,308,1,'2026-07-09','Delivered'), 
(410,110,310,2,'2026-07-10','Shipped'), 
(411,101,302,1,'2026-07-11','Delivered'), 
(412,103,301,1,'2026-07-12','Pending');
select * from orders;

#insertion of values into payments
insert into payments values
(501,401,'UPI',65000,'Paid','2026-07-01'), 
(502,402,'Credit  Card',25000,'Paid','2026-07-02'), 
(503,403,'Debit  Card',9000,'Paid','2026-07-03'), 
(504,404,'UPI',700,'Paid','2026-07-04'), 
(505,405,'Net  Banking',5500,'Pending','2026-07-05'), 
(506,406,'UPI',9000,'Paid','2026-07-06'), 
(507,407,'Credit  Card',1300,'Paid','2026-07-07'), 
(508,408,'Cash on Delivery',1800,'Cancelled','2026-07-08'), 
(509,409,'UPI',4200,'Paid','2026-07-09'), 
(510,410,'Debit  Card',4400,'Paid','2026-07-10'), 
(511,411,'UPI',25000,'Paid','2026-07-11'), 
(512,412,'Credit  Card',65000,'Pending','2026-07-12'); 
select * from payments;

#-------------------------------------------------Queries---------------------------------------------------
#1.Display all products along with their prices and available stock. 
select * from products;
select product_id,product_name,price,stock_quantity as available_stock from products;

#2.Increase the price of all products in a particular category by 5%.
select * from categories;
#select p.product_id,c.category_name, (p.price+(0.05*p.price)) as updated_price from products p join categories c on p.category_id=c.category_id;
Update products set  price =price+(0.05*price) where category_id = 201;
SELECT * FROM products;

#3.Change the payment status of a pending payment to Paid. 
SET SQL_SAFE_UPDATES = 0;
update payments set payment_status ='Paid' where payment_status='pending';
select * from payments;
SET SQL_SAFE_UPDATES = 1;

#4.Delete a cancelled order. 
delete from orders where order_status = 'Cancelled';
select * from orders;

#5.Display all customer names in uppercase and lowercase.
select customer_name,upper(customer_name) as uppercase, lower(customer_name) as lower from customers;

#6.Display the first five characters of each product name. 
select distinct product_name,left(product_name,5) as first_five_charcters from products;

#7.Concatenate the customer name and city. 
select * from customers;
select customer_name,city,concat(customer_name,city)as concat_result from customers;

#8.Replace the word Guide with Handbook in product names. 
select product_name,replace(product_name,'Guide','Handbook') as replaced_words from products;

#9.Display last week orders.
select * from orders where order_date between '01-11-2026' and '07-11-2026';
#select * from orders where order_date = date_sub(order by order_date desc, interval 7 day);# error

#10.Find the number of days since each order was placed.
select order_date, datediff(curdate(),order_date) as no_of_days from orders;

#11. Display the payment date in DD-Mon-YYYY format
	#select payment_date, date_format(payment_date,'%d-%m-%Y') from payments;
select payment_date,date_format(payment_date,'%D-%M-%Y')from payments;
	#select payment_date,date_format(payment_date,'%d-%b-%Y') from payments;

#12.Display the month and year of every order.
select order_date,month(order_date) as order_month, year(order_date) as order_year from orders;

#13.Count the total number of products in each category
#select c.category_name,c.category_id,count(p.product_id) as product_count from categories c join products p on c.category_id = p.category_id group by c.category_id;
select category_id, count(product_id) from products group by category_id;

#14.Display the average product price for each category. 
#select c.category_name,c.category_id, avg(p.price) as avg_price from categories c join products p on c. category_id=p.category_id group by c.category_id;
select category_id, avg(price) from products group by category_id;

# 15.Find the highest-priced product. 
select * from products order by price desc limit 1;

# 16.Display the total sales amount collected through each payment method. 
select * from orders;
select * from payments;
#select p.payment_method, count(p.payment_amount) as total_sales from payments p join orders o on o.order_id=p.order_id group by payment_method;
select payment_method,sum(payment_amount) as total_sales from payments group by payment_method;

# 17.Find the average quantity ordered for each product. 
select * from orders;
select * from products;
#select p.product_name,avg(o.quantity)as average_quantity from orders o join products p on o.product_id=p.product_id group by o.product_id;
select product_id, avg(quantity) as avg_quantity from orders group by product_id;

#18. Display customer names, product names, and order dates.
select c.customer_name,p.product_name,o.order_date from customers c join orders o on c.customer_id=o.customer_id join products p on o.product_id=p.product_id;

#19. Display customer names, ordered products, and payment status.
select * from customers;
select * from orders;
select * from products;
select * from payments;
select c.customer_name,p.product_name,pa.payment_status from customers c join orders o on c.customer_id=o.customer_id join products p on p.product_id=o.product_id 
	join payments pa on pa.order_id=o.order_id;
    
#20. Display customer names, product names, quantity ordered, and payment amount.
select * from customers;
select * from orders;
select * from products;
select * from payments;
select c.customer_name,p.product_name,o.quantity,pa.payment_amount from customers c join orders o on c.customer_id=o.customer_id 
	join products p on o.product_id = p.product_id join payments pa on pa.order_id = o.order_id;
    
#21. Display all products along with their category names, even if no orders have been placed for them. 
select * from products;
select * from categories;
select p.product_name, c.category_name from products p left join categories c on p.category_id=c.category_id;

#22. Display all customers and their order details. 
select c.customer_name, o.* from customers c left join orders o on c.customer_id=o.customer_id;

#23. Display category names, product names, customer names, and order status in a single result. 
select c.category_name, p.product_name,c1.customer_name,o.order_status from categories c join products p on c.category_id=p.category_id 
	join orders o on o.product_id=p.product_id join customers c1 on o.customer_id=c1.customer_id;

#24. Find customers whose payment amount is greater than the average payment amount. 
select * from customers;
select * from orders;
select * from payments;
select avg(payment_amount) from payments;
select * from customers where customer_id in (select customer_id from orders where order_id in 
	( select order_id from payments where payment_amount > (select avg(payment_amount) from payments)));
    
#select c.*,p.payment_amount from customers c join orders o on c.customer_id=o.customer_id join payments p on p.order_id=o.order_id 
#where p.payment_amount> (select avg(payment_amount) from payments);

#25.Display the category that contains the most expensive product. 
select * from categories;
select * from products;
select c.category_name,p.price from categories c join products p on c.category_id=p.category_id order by p.price desc limit 1;

#26. Find customers who purchased the highest-priced product.
select * from customers;
select * from products;
select * from orders;
select c.customer_name,p.price from customers c join orders o on c.customer_id =o.customer_id join products p on p.product_id=o.product_id 
where p.price= (select max(price) from products) ;

#27.  Display products whose price is greater than the average price of all products. 
select * from products;
select avg(price) from products;
select product_id,product_name,price from products where price > (select avg(price) from products);

#28.  Find customers who have never placed an order using NOT EXISTS. 
select * from customers;
select * from orders;
select * from customers c where not exists ( select * from orders o where c.customer_id=o.customer_id);
select c.customer_id, c.customer_name, o.order_id from customers c left join orders o on c.customer_id = o.customer_id where o.order_id is null;

#29. Create a view named Customer_Order_Details displaying customer name, product name, quantity, order date, and payment status. 
create view Customer_Order_Details as select c.customer_name,p.product_name,o.quantity,o.order_date, pa.payment_status from customers c 
join orders o on c.customer_id= o.customer_id join payments pa on pa.order_id=o.order_id join products p on o.product_id = p.product_id;
select * from Customer_Order_Details;

#30. Create another view named Category_Sales_Report displaying category name, total products sold, and total sales amount. 
select * from products;
select * from payments;
create view Category_Sales_Report as select c.category_name, sum(o.quantity) as total_products_sold, sum(pa.payment_amount) as total_sales_amount 
from categories c join products p on c.category_id=p.category_id join orders o on o.product_id=p.product_id join payments pa on pa.order_id=o.order_id 
group by c.category_id;
select * from Category_Sales_Report;

#31. Retrieve records from both views. 
select * from Customer_Order_Details;
select * from Category_Sales_Report;

#32. Start a transaction. Update the stock quantity of a product. Create a SAVEPOINT.  Then update the payment status of an order. Roll back to the savepoint. 
	#Commit the transaction. 
select * from payments;
start transaction;
update products set stock_quantity = stock_quantity + 30 where product_id =301;
savepoint sp1;
update payments set payment_status = "Cancelled" where order_id= 403;
rollback to sp1;
select * from payments;
commit;

#33. Create a stored procedure to display products whose stock quantity is below a  given value. 
	#• Input: stock_limit  total_orderstotal_orders
	#• Display product name, price, and stock quantity.
call display_products(20);

#34. Create a stored procedure to find the total number of orders placed by  customers from a particular city.  
	#• Input: city  
	#• Display the number of orders.
    select * from customers;
call total_orders('hyderabad');

#35. Create a stored procedure to display the details of a particular order.  
	#• Input: order_id  
	#• Display customer name, product name, quantity, order date, order status, and payment status. 
select * from orders;
call details_particular_order(407);


#36. Create a trigger on the Producstudents2ts table. If someone tries to set stock_quantity to a negative value, prevent the update. 
select * from products;
update products set stock_quantity =-90 where product_id=301;
select * from products;

#37. Create a trigger on the Orders table.  Whenever a new order is placed, automatically reduce the corresponding 
	#product's stock_quantity based on the ordered quantity.
select * from orders;
select * from products;
insert into products values(311,201,'laptop',70000,60);
insert into orders values (413,103,311,1,'2026-07-12','Pending'); 
select * from products;




