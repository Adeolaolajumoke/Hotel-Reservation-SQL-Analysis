# Hotel Reservation Analysis SQL 

![7gbqunsp](https://github.com/user-attachments/assets/2f3552bb-295b-4094-8339-a054d582c36e)

## Table of Content 
- [Introduction](#Introduction)
- [Project Overview](#Project-Overview)
- [Project Objectives](#Project-Objectives)
- [Data Cleaning and Transformation](#Data-Cleaning-and-Transformaation)
- [Data EXploration and Insight](#Data-Exploration-and-Insights)
- [Recommendation](#Recommendation)
- [Conclusion](#Conclusion)

## Introduction
The hospitality industry relies on data to make informed decisions and provide a better guest experience. 
This analysis seeks to examine the key trends, pattern and factors that influence hotel reservations over a specific period of time. 
Through this comprehensive evaluation, the goal is to provide a clearer understanding of hotel reservation trends and contribute to the strategic growth.   

## Project Overview
The dataset includes the following 700 rows and 12 columns which are:  
  
•	Booking_ID: A unique identifier for each hotel reservation. 
•	no_of_adults: The number of adults in the reservation.  
•	no_of_children: The number of children in the reservation. 
•	no_of_weekend_nights: The number of nights in the reservation that fall on weekends.  
•	no_of_week_nights: The number of nights in the reservation that fall on weekdays.  
•	type_of_meal_plan: The meal plan chosen by the guests.  
•	room_type_reserved: The type of room reserved by the guests. 
•	lead_time: The number of days between booking and arrival. 
•	arrival_date: The date of arrival.  
•	market_segment_type: The market segment to which the reservation belongs.  
•	avg_price_per_room: The average price per room in the reservation.  
•	booking_status: The status of the booking.  

<img width="953" alt="Screenshot 2025-02-13 105147" src="https://github.com/user-attachments/assets/ac572271-4453-450b-9863-4588b9c75dbf" />

## Project Objectives 
We are tasked with analyzing this hotel reservation dataset using SQL. Here are 15 questions for which I’m to write SQL queries to gain insights:  
   
1.	What is the total number of reservations in the dataset?  
2.	Which meal plan is the most popular among guests?  
3.	What is the average price per room for reservations involving children?  
4.	How many reservations were made for the year 20XX (replace XX with the desired year)?  
5.	What is the most commonly booked room type?  
6.	How many reservations fall on a weekend (no_of_weekend_nights > 0)?  
7.	What is the highest and lowest lead time for reservations?  
8.	What is the most common market segment type for reservations?  
9.	How many reservations have a booking status of "Confirmed"?  
10.	What is the total number of adults and children across all reservations?  
11.	What is the average number of weekend nights for reservations involving children?  
12.	How many reservations were made in each month of the year? 
13.	What is the average number of nights (both weekend and weekday) spent by guests for each room type?  
14.	For reservations involving children, what is the most common room type, and what is the average price for that room type?  
15.	Find the market segment type that generates the highest average price per room.  


## Data Cleaning and Transformation
-- Add new column arrival_date and reservation_date
```Sql
Update hotel_reservation_dataset
set arrival_date = replace (arrival_date,"-", "/");

Update  hotel_reservation_dataset
set arrival_date = str_to_date(arrival_date, "%d/%m/%YYYY");

alter table hotel_reservation_dataset
modify column arrival_date date;

alter table  hotel_reservation_dataset
add column reservation_date date;

update hotel_reservation_dataset
set reservation_date = date_sub(arrival_date, interval lead_time Day);


