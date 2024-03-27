-- UBER RIDE ASSIGNMENT
show tables;

create procedure d()
select * from drivers;

create procedure p()
select * from passengers p;

create procedure r()
select * from rides r;

call d()

call p()

call r()

-- 1)
select count(distinct(pickup_location)) as Distinct_Locations from rides r;

-- 2)
describe rides;

select count(ride_id) from rides r; 

-- 3)
select avg(ride_duration) from rides; 

-- 4)
select * from drivers d
order by earnings desc
limit 5; 

-- 5)
select payment_method, count(payment_method) from rides
group by payment_method;

-- 6)
select * from rides
where fare_amount > 20;

-- 7)
select pickup_location as commom_location, count(pickup_location) as No_times from rides
group by pickup_location
order by pickup_location desc 
limit 1;

-- 8)
select avg(fare_amount) Avg_fare from rides;

-- 9)
select driver_name ,avg(rating) from drivers d
group by driver_name
order by avg(rating) desc
limit 10;

-- 10)
select sum(earnings) from drivers d;

-- 11)
select count(ride_id) Cash_paid from rides
where payment_method = "cash";

-- 12)
select count(ride_id) NumberOfRides, avg(ride_distance) AvgDistance from rides r
where pickup_location = "Dhanbad";

-- 13)
select * from rides r
where ride_duration < 10;

-- 14)
select passenger_name, total_rides from passengers
order by total_rides desc;

-- 15)
select driver_name ,count(total_rides) Rides from drivers d
group by driver_name 
order by count(total_rides) desc; 

-- 16)
call p()

call r()

select payment_method ,count(payment_method) from rides r
where pickup_location = "Gandhinagar"
group by payment_method ;

-- 17
select avg(fare_amount) from rides r
where ride_distance > 10;

-- 18)
select driver_name, total_rides from drivers d
order by total_rides desc;

-- 19)
call r()

select pickup_location, count(*)/(select count(*) 
from rides)*100 from rides
group by pickup_location;

-- 20)
select * from rides where pickup_location = dropoff_location;

-- Intermediate level

-- 1)
select p.passenger_name, r.passenger_id, count(distinct r.pickup_location) 
from rides r join passengers p
on r.passenger_id = p.passenger_id
group by r.passenger_id, p.passenger_name
having count(distinct r.pickup_location) > 300; 

-- 2)
call r()

describe rides;

update rides 
set new_timestamp = str_to_date(ride_timestamp, "%m/%d/%Y %H:%i") 

alter table rides 
drop column ride_timestamp, 
change column new_timestamp ride_timestamp datetime;

alter table rides 
rename column new_timestamp to ride_timestamp;

select avg(fare_amount) Weekdays_amt from rides 
where weekday(ride_timestamp) in (0,1,2,3,4);

-- 3)
select r.passenger_id, p.passenger_name, r.ride_distance from
rides r join passengers p 
on r.passenger_id = p.passenger_id 
where r.ride_distance > 19
order by r.ride_distance;

-- 4)
use assignments

call d()

select sum(earnings) from drivers where drivers.total_rides > 100;

-- 5)
select * from rides where fare_amount < (
select avg(fare_amount) from rides);

-- 6)
select count(driver_id) from drivers d;

select * from rides order by driver_id;

select driver_id, rating from drivers d;

select distinct driver_id, payment_method
from rides
order by driver_id;

SELECT AVG(d.rating) AS average_rating
FROM drivers d
WHERE EXISTS (
    SELECT 1
    FROM rides r
    WHERE r.driver_id = d.driver_id
    GROUP BY r.driver_id
    HAVING COUNT(DISTINCT r.payment_method) = 2
);

-- 7)
call p()

select * from passengers p
order by total_spent
limit 3;

-- 8)
call r()

select month(ride_timestamp), avg(fare_amount) from rides r
group by month(ride_timestamp)
order by month(ride_timestamp);

-- 9)
call r()

select dropoff_location, count(dropoff_location) from rides
group by dropoff_location
order by count(dropoff_location) desc
limit 1;

select pickup_location, count(pickup_location) from rides
group by pickup_location
order by count(pickup_location) desc
limit 1;

SELECT pickup_location, dropoff_location, COUNT(*) AS pair_count
FROM rides
GROUP BY pickup_location, dropoff_location
ORDER BY pair_count DESC
LIMIT 1;

-- 10)
call d()

select driver_id, sum(earnings) from drivers d 
group by driver_id
order by sum(earnings) desc;

-- 11)
call p()
 
select * from passengers;

ALTER TABLE passengers
MODIFY COLUMN signup_date DATE;

UPDATE passengers 
SET signup_date = STR_TO_DATE(signup_date, '%d/%m/%Y');

select date(signup_date) from passengers;

select date(ride_timestamp) from rides;

UPDATE passengers
SET signup_date = STR_TO_DATE(signup_date, '%m/%d/%Y');

ALTER TABLE passengers
MODIFY COLUMN signup_date DATE;

select  from passengers where signup_date in (
select date(ride_timestamp) from rides);

select p.* from 
passengers p join rides r 
on p.passenger_id = r.passenger_id
where p.signup_date = date(r.ride_timestamp); 

-- 12)
call d()

select driver_id, avg(earnings) from drivers
group by driver_id
order by avg(earnings) desc;

-- 13)
call r()

select * from rides where ride_distance < (
select avg(ride_distance) from rides);

-- 14)
call d()

select * from drivers d
order by total_rides 
limit 1;

-- 15)
call p()

select avg(fare_amount) from rides where passenger_id in (
select passenger_id from passengers p where total_rides >= 20);

-- 16)
select pickup_location, avg(fare_amount) from rides
group by pickup_location
order by avg(fare_amount) desc
limit 1;

-- 17)
call d()

select from d

select avg(rating) from drivers
where total_rides >= 100;

-- 18)
select passenger_id, distinct(pickup_location) from rides
group by passenger_id;

select passenger_id, count(distinct pickup_location) from rides
group by passenger_id
order by passenger_id; 

SELECT passenger_id
FROM rides
GROUP BY passenger_id
HAVING COUNT(DISTINCT pickup_location) >= 5;

-- 19)
call p()

select avg(fare_amount) from rides where passenger_id in (
select passenger_id from passengers p where rating > 4);

-- 20)
call r()

select pickup_location, min(ride_duration) from rides
group by pickup_location;

-- ADVANCED LEVEL
-- 1)
select count(distinct pickup_location) from rides;

select driver_id, count(distinct(pickup_location)) from rides
group by driver_id
having count(distinct(pickup_location)) = (
select count(distinct pickup_location) from rides);

-- 2)
select avg(r.fare_amount) from 
passengers p join rides r 
on p.passenger_id = r.passenger_id
where p.total_spent > 300;

-- 3)
call d()

select driver_id ,avg(earnings) from drivers d
group by driver_id
order by avg(earnings) limit 5;

-- 4)
call r()

select passenger_id, sum(fare_amount) as cash_fare from rides
where payment_method = "Cash" or payment_method = "Credit Card"
group by passenger_id
order by passenger_id;

describe rides 

-- 5)
select * from rides where 
fare_amount > (
select avg(fare_amount)*1.5 from rides);

-- 6)
call d()

update drivers 
set join_date = str_to_date(join_date ,'%m/%d/%Y');

ALTER TABLE drivers
MODIFY COLUMN join_date DATE;

select * from drivers d where date(join_date) in (
select date(ride_timestamp) from rides);

-- 7)
select passenger_id, avg(fare_amount) from rides
group by passenger_id
having count(payment_method) > 1
order by passenger_id;

-- 8)
select pickup_location, avg(fare_amount) as FAEC from rides
group by pickup_location;

select pickup_location, (sum(fare_amount)-avg(fare_amount))/avg(fare_amount) as Percentage_Increase from rides
group by pickup_location
order by Percentage_Increase desc limit 1;

-- 9)
select * from rides r 
where pickup_location = dropoff_location;

-- 10)
select avg(rating) from drivers d;
