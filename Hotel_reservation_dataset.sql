Select * from hotel_reservation_dataset;

Set SQL_SAFE_UPDATES =0;
Update hotel_reservation_dataset
set arrival_date = replace (arrival_date,"-", "/");

Update  hotel_reservation_dataset
set arrival_date = str_to_date(arrival_date, "%d/%m/%YYYY");

alter table hotel_reservation_dataset
modify column arrival_date date;
-- 1. What is the total number of reservations in the dataset?
select count(*) as Total_reservation from hotel_reservation_dataset; 

-- 2. Which meal plan is the most popular among guests?  
select  type_of_meal_plan, count(type_of_meal_plan) as count_meal from hotel_reservation_dataset
where booking_status ="Not_canceled" group by type_of_meal_plan order by count_meal desc limit 1;

alter table  hotel_reservation_dataset
add column reservation_date date;

update hotel_reservation_dataset
set reservation_date = date_sub(arrival_date, interval lead_time Day);

-- 3. What is the average price per room for reservations involving children?  
select round(avg(avg_price_per_room),2) from hotel_reservation_dataset
where no_of_children !=0;

-- 4.	How many reservations were made for the year 20XX (replace XX with the desired year)?  
select year(reservation_date) as year, count(reservation_date) as No_of_res from hotel_reservation_dataset
where Extract(Year from reservation_date) = 2018 group by year(reservation_date);

-- 5. What is the most commonly booked room type?  
select room_type_reserved, count(room_type_reserved)as mostly_booked from hotel_reservation_dataset
group by room_type_reserved order by mostly_booked desc limit 1;

-- 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?  
 select count(room_type_reserved) as count_room_reserved from hotel_reservation_dataset
 where no_of_weekend_nights > 0;

-- 7. What is the highest and lowest lead time for reservations?  
select max(lead_time), min(lead_time) from hotel_reservation_dataset;

-- 8. What is the most common market segment type for reservations?
select market_segment_type, count(market_segment_type) as no_res from hotel_reservation_dataset
group by market_segment_type order by no_res desc limit 1;

-- 9. How many reservations have a booking status of "Confirmed"?  
select count(booking_status) as confirmed_booking_status from hotel_reservation_dataset
where booking_status = "Not_canceled";

-- 10. What is the total number of adults and children across all reservations?  
select sum(no_of_adults) as total_adult, sum(no_of_children) as total_children,
(sum(no_of_adults)+sum(no_of_children))as Total_AC from hotel_reservation_dataset;

-- 11.	What is the average number of weekend nights for reservations involving children?  
select round(avg(no_of_weekend_nights),2) as avg_weekend_night from hotel_reservation_dataset where no_of_children>0;


-- 12.	How many reservations were made in each month of the year?
select Monthname(reservation_date) as month_year,month(reservation_date) as month_no, count(reservation_date) as count_res from hotel_reservation_dataset
group by month_year, month_no order by month_no;

-- 13.	What is the average number of nights (both weekend and weekday) spent by guests for each room type?  
select room_type_reserved, round(avg(no_of_week_nights + no_of_weekend_nights),2) as no_of_nights from hotel_reservation_dataset
where booking_status ="Not_canceled"
group by room_type_reserved order by no_of_nights desc;

-- 14.	For reservations involving children, what is the most common room type, and what is the average price for that room type? 
select room_type_reserved, count(room_type_reserved)as most_common_room, round(avg(avg_price_per_room),2)
from hotel_reservation_dataset where no_of_children> 0 
group by room_type_reserved order by most_common_room desc limit 1;
 
-- 15.	Find the market segment type that generates the highest average price per room.  
select market_segment_type, round(avg(avg_price_per_room),2) as avg_price
from hotel_reservation_dataset group by market_segment_type order by avg_price desc limit 1; 

select * from hotel_reservation_dataset;