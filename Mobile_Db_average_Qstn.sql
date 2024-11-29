

Problem # 1: WAQ to display the Model Name,Manufacturer, Price , Warranty , 
Internal memory, memory card capacity,gprs support,bluetooth,camera quality and OS for the mobile with IME NO ‘ime07" .

use mobile;


select
	mm.model_name,
	mm.manufacturer,
	mm.price,
	mm.warranty_in_years,
	ms.internal_mem_in_MB,
	ms.memory_card_capacity_gb,
	ms.gprs,
	ms.bluetooth,
	ms.camera_quality,
	ms.os
from
	mobile_master mm
inner join
mobile_specification ms
on
	mm.ime_no = ms.ime_no
where
	mm.ime_no = 'ime07';



Problem # 2: WAQ to display IMENO, Model Name,Manufacturer,Price ,GPRS information,
Memory card support of mobiles which has GPRS support with memory card  capacity 16GB or above.


select
	mm.ime_no,
	mm.model_name,
	mm.manufacturer,
	mm.price,
	ms.gprs,
	ms.memory_card_capacity_gb
from
	mobile_master mm
inner join
mobile_specification ms
on
	mm.ime_no = ms.ime_no
where
	ms.memory_card_capacity_gb >= 16;


Problem # 3: WAQ  to display the customer name ,mobile purchase details such as IMENO,Model Name ,Purchase Date,
Net amount paid in sorted order of customer name.


select
	c.customer_name,
	mm.ime_no,
	mm.model_name,
	s.sales_date,
	s.net_amount
from
	sales_info s
inner join
customer_info c
on
	s.customer_id = c.customer_id
inner join
mobile_master mm
on
	s.ime_no = mm.ime_no
order by
	customer_name asc;


Problem # 4: WAQ to display the distributor details such as distributor id ,name ,
address,contact no who has supplied the maximum number of mobiles.

select
	distributor_id,
	distributor_name,
	address,
	mobile
from
	distributor
where
	distributor_id = 
(select 
distributor_id
from mobile_master
group by distributor_id
order by count(*) desc 
limit 1);

// subquery to help out 
select 
distributor_id,
count(*) as no_of_phone_supplied
from mobile_master 
group by distributor_id
order by no_of_phone_supplied desc
limit 1;


Problem # 5: WAQ to display the IMENO,model name,manufacturer,price and discount of all mobiles regardless of whether the mobile is sold or not.
          [Hint: If not sold, display discount as "Not Sold"]


select 
mm.ime_no,
mm.manufacturer,
mm.price,
ifnull(s.discount, 'not sold') as discount
from mobile_master mm
left join 
sales_info s
on mm.ime_no = s.ime_no;


Problem # 6: WAQ to display the report containing the sales date and total sales amount of the dates between 20-dec-12 and 29-dec-12. 
	(Hint : total sales amount column should be displayed as "Total Sales Amount" )


select
sales_date,
sum(net_amount) as 'total sales amount '
from sales_info
where sales_date between '2012-12-20' and '2012-12-29' group by sales_date;


Problem # 7: WAQ to display mobile imeno,model name,manufacturer and price of the mobiles which are having the longest battery life.

select
mm.ime_no,
mm.model_name,
mm.manufacturer,
mm.price,
ms.battery_life_hrs
from mobile_master mm
inner join
mobile_specification ms
on
mm.ime_no = ms.ime_no
where battery_life_hrs = ( select max(battery_life_hrs) from mobile_specification );


Problem # 8: WAQ to display the ImeNO, Model Name,Manufacturer, Price of mobiles having the maximum price.

select
ime_no, model_name, manufacturer, price from mobile_master where price = (select max(price) from mobile_master);


Problem # 9: WAQ to display the customer details such as Customer ID,Customer Name, Address, Total Purchase amount.

select
c.customer_id,
c.customer_name,
c.address,
sum(Net_amount) as 'Total purchase amount'
from customer_info c
inner join
sales_info s
on c.customer_id = s.customer_id group by customer_id;


Problem # 10: WAQ to display the most costly mobile information such as mobile model, manufacturer and price manufactured by "Samsung".


select
model_name,
manufacturer,
price as 'most costly'
from mobile_master where manufacturer= 'samsung' and price = (select max(price) from mobile_master);
	