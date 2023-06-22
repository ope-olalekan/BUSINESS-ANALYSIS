--i want to create a table on sql by writing a qeury
create table crixus(
timestamp timestamp,
gender varchar(10),
destination	varchar(50),
time_of_travel integer,
type_of_activity varchar(50),	
holiday_with varchar(50),	
transportation varchar(100)	
);

--i want to see my whole table
select *
from crixus;

--i want to find out the total number of respondents
select count(gender)
from crixus;  

--male and female 
select gender, count (*)
from crixus
group by gender
order by 2 desc;

--case study
--2.how many customers responded to the survey?
select count(*)
from crixus;

select count(*) As survey_responders
from crixus;

--3.where is the most preferred destination?
select destination, count(*) As num_times
from crixus
group by destination
order by 2 desc
limit 1;

--4.which is the least preferred destination?
select destination, count(*) As num_times
from crixus
group by destination
order by 2
limit 1;

--5.what is the most preferred type of activity?
select type_of_activity,count(*)
from crixus
group by type_of_activity;

select type_of_activity,count(*)
from crixus
group by type_of_activity
order by 2 desc
limit 1;

--6.How would customers like to move around?
select transportation,count(*)
from crixus
group by transportation
order by 2 desc;

--7.what is the customers preferred mode of holidaying?
select holiday_with,count(*)
from crixus
group by holiday_with
order by 2 desc;

--8.when will the customers prefer to travel?
select time_of_travel,count(*)
from crixus
group by time_of_travel
order by 2 desc
limit 1;