
use mobile;


Problem # 1: WAQ to Display the mobile details such as IMENO, Model Name produced by the manufacturer "Nokia".

select IME_NO, Model_Name from mobile_master where Manufacturer = 'nokia';



Problem # 2: WAQ to display IMENO, Model Name,Manufacturer,Camerea Quality of mobiles whose camera quality is 5MP.

C:\Users\Admin\AppData\Roaming\DBeaverData\workspace6\General\Scripts\Mobile Simple Qstns.sql
select
	mm.ime_no,
	mm.model_name,
	mm.manufacturer,
	ms.camera_quality
from
	mobile_master mm
inner join 
  mobile_specification ms
  on
	mm.ime_no = ms.ime_no
where
	camera_quality = '2 mp';
  

 Problem # 3: WAQ to  display Model Name,Quantity sold on the date 23-Oct-12.  
 
 
 select 
 mm.model_name,
 count(model_name) ,
 s.sales_date
 from 
 mobile_master mm
 inner join 
 sales_info s
 on mm.ime_no = s.ime_no
 where sales_date = '2012-10-23'
 group by 
 model_name,
 sales_date;

 
Problem # 4: WAQ to display distributor id ,mobile supply details such as mobile model name, quantity supplied in sorted order of distributor id.

select
	distributor_id,
	model_name,
	count(model_name)
from
	mobile_master
group by
	distributor_id,
	model_name
order by
	distributor_id asc;






 Problem # 5: WAQ to display the IMENO,model name,manufacturer,price and discount of all mobiles regardless of whether the mobile is sold or not.


select 
mm.ime_no,
mm.model_name,
mm.manufacturer,
mm.price,
s.discount
from
mobile_master mm
inner join
sales_info s
on
mm.ime_no = s.ime_no;

Problem # 6: WAQ to display the distributor details such as distributor name,mobile number and email of the model 'ime09'.

  select 
  distributor_name,
  mobile,
  email,
  from distributor where distributor_id =
  (select distributor_id from mobile_master where ime_no = 'ime09' );
  
 
 Problem # 7: WAQ to display the Ime No and Model Name of mobiles which are not sold(Hint : use minus operator)
 
 // Error 

select ime_no, model_name 
from mobile_master 
Minus
select 
    s.ime_no,
    m.model_name
from sales_info s
inner join mobile_master m
on s.ime_no = m.ime_no;


Problem # 8: WAQ to display the Ime No and Model Name of mobiles which are sold(Hint : use intersect operator)


select
	ime_no,
	model_name
from
	mobile_master
intersect 
select
	s.ime_no,
	m.model_name
from
	sales_info s
inner join
mobile_master m 
on
	s.ime_no = m.ime_no;


Problem # 9: WAQ to display the ImeNO, Model Name,Manufacturer, Price and NewPrice of all mobiles.
	(Hint : find new price as 10% of the price with column name "New Price")
 
	
select ime_no,model_name,manufacturer,price, price + (price*10 /100) as 'new price' from mobile_master ;



Problem # 10: WAQ to display mobile model, manufacturer and price for the mobiles having a price range from 8500 to 25300.


select model_name, manufacturer, price from mobile_master where price between 8500 and 25300;
 