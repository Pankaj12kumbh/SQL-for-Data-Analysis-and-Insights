#Question 1
select first_name, last_name, age
from titanic
where survived = 1
order by age desc
limit 1;

#Question 2
create view passenger_status as
select survived, pclass, age, fare
from titanic;

SELECT * FROM passenger_status;

#question 3
delimiter $$
create procedure getpassengersbyagerange (in min_age int, in max_age int)
begin
    select first_name, last_name, age, pclass, survived
    from titanic
    where age between min_age and max_age;
end $$
delimiter ;

CALL GetPassengersByAgeRange(20, 40);

#Question 4
select first_name, last_name, fare,
       case 
           when fare < 50 then 'low'
           when fare between 50 and 100 then 'medium'
           when fare > 100 then 'high'
           else 'unknown' 
       end as fare_category
from titanic;

#Question 5
select first_name, last_name, fare, 
       lead(fare) over (order by passenger_no) as next_fare
from titanic;




#Question 6

select first_name, last_name, age, 
       lag(age) over (order by passenger_no) as previous_age
from titanic;



#Question 7

select first_name, last_name, fare,
       rank() over (order by fare desc) as fare_rank
from titanic;


#Question 8

select first_name, last_name, fare,
       dense_rank() over (order by fare desc) as fare_dense_rank
from titanic;


#Question 9

select first_name, last_name, fare,
       row_number() over (order by fare desc) as row_num
from titanic;

#Question 10

with avgfare as (
    select avg(fare) as average_fare
    from titanic
)
select first_name, last_name, fare
from titanic, avgfare
where fare > avgfare.average_fare;
