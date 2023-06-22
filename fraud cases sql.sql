
--i want to create a table
--the syntax for creating a table is:create table table_name(column_name data type);

create table fraud(
step integer,
type varchar,
amount float,
nameorig varchar(20),
oldbalanceorg float,
newbalanceorig float,
namedest varchar(20),
oldbalancedest float,
newbalancedest float,
isfraud integer,
isflaggedfraud integer
);

--i want to see the whole table
select *
from fraud;

copy public.fraud
from 'filepath'
delimeter ','cvs header;

--question 1 is transaction per transaction type
select count(*)
from fraud
;

select type,count(*)
from fraud
group by type
order by count(*) desc
;

--2.Transaction Type with Highest Fraudulent Transactions
select type,count(*)
from fraud
where isfraud = 1
group by 1
order by 2 desc
limit 1;

--3.What is the average fraudulent transaction amount
select round(avg(amount))
from fraud
where isfraud =1;

--4.what is the maximum fraudulent transaction amount
select max(amount)
from fraud
where isfraud = 1;

--5.what is the minimum fraudulent transaction amount
select min(amount)
from fraud
where isfraud = 1;

--6.who are the top ten customers with the highest amount defrauded
select nameorig, sum(amount)
from fraud
where isfraud = 1
group by 1
order by 2 desc
limit 10;

--7.how is effective is the bank in flagging fraud
select isfraud, isflaagedfraud
from fraud;

select sum(isfraud), sum(isflaggedfraud)
from fraud;

--8.who are the top 20 fraudsters
select namedest, round(sum(amount))
from fraud
where isfraud = 1
group by namedest
order by 2 desc
limit 20;