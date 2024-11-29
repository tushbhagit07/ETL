Complex Questions:



•Problem # 1: WAQ to display the customer details such as Customer ID,Customer Name, Address
 and Total Purchase amount  having the maximum purchase amount.
 
 use mobile;
 
 select 
 c.customer_id,
 c.customer_name,
 c.address,
 s.Net_amount
 from 
 customer_info c
 inner join
 sales_info s
 on
 c.customer_id = s.customer_id
 where net_amount = (select max(net_amount) from sales_info);
 


Problem # 2: WAQ to determine whether the mobile with ime no "ime10" is been sold out or not  
and display the model name,sales status.(Hint: If sold display status as "Sold Out" with column name "Sales Status").

select 
mm.model_name,
mm.ime_no,
case 
when s.ime_no = 'ime10' then 'soldout'
else 
'Available'
end as  "sales status" 
from
mobile_master mm
inner join 
sales_info s
on mm.ime_no = s.ime_no;



 Problem # 3: WAQ to display the mobile information such as ime no,model name,manufacturer ,distributor id ,distributor name  and  
price supplied  by  the  istributor named 'pappu barik' .

select 
mm.ime_no,
mm.model_name,
mm.manufacturer,
mm.distributor_id,
d.distributor_name,
mm.price
from
mobile_master mm
inner join
distributor d
on mm.distributor_id = d.distributor_id
where distributor_name= 'pappu barik' ;


Problem # 4: WAQ to display distributor details who supplies mobile with the following speficiations such as 
3G Network, Android OS, 5 MP Camera.

select
	d.distributor_id,
	d.distributor_name,
	d.address,
	d.mobile,
	ms.network_3g,
	ms.os,
	ms.camera_quality,
	mm.model_name
from
	distributor d
inner join
mobile_master mm 
on
	d.distributor_id = mm.Distributor_ID
inner join 
mobile_specification ms
on
	mm.ime_no = ms.ime_no
where
	ms.network_3g = 'yes'
	and ms.os = 'android'
	and ms.camera_quality = '2 mp';


Problem # 5: WAQ to Display the maximum sold mobile model name and manufacturer .

select model_name, manufacturer, ime_no from mobile_master
where ime_no = ( 
select ime_no from sales_info 
group by ime_no
order by count(*) desc 
limit 1);

