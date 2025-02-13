# Hotel Reservation Analysis SQL 

![7gbqunsp](https://github.com/user-attachments/assets/2f3552bb-295b-4094-8339-a054d582c36e)

## Table of Content 
- [Introduction](#Introduction)
- [Project Overview](#Project-Overview)
- [Project Objectives](#Project-Objectives)
- [Data Cleaning and Transformation](#Data-Cleaning-and-Transformaation)
- [Data EXploration and Insight](#Data-Exploration-and-Insights)
- [Recommendation](#Recommendation)
- [Files Detail](#Files-Details)
- [Conclusion](#Conclusion)
  

## Introduction
The hospitality industry relies on data to make informed decisions and provide a better guest experience. 
This analysis seeks to examine the key trends, pattern and factors that influence hotel reservations over a specific period of time. 
Through this comprehensive evaluation, the goal is to provide a clearer understanding of hotel reservation trends and contribute to the strategic growth.   

## Project-Overview
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

## Project-Objectives 
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


## Data-Cleaning-and-Transformation
-- Add new column arrival_date and reservation_date
```Sql
--Standardizing date format
Update hotel_reservation_dataset
set arrival_date = replace (arrival_date,"-", "/");

Update  hotel_reservation_dataset
set arrival_date = str_to_date(arrival_date, "%d/%m/%YYYY");
```
-- Add column Reservation_date
```Sql
alter table hotel_reservation_dataset
modify column arrival_date date;

alter table  hotel_reservation_dataset
add column reservation_date date;

update hotel_reservation_dataset
set reservation_date = date_sub(arrival_date, interval lead_time Day);
```

## Data-Exploration-and-Insights
1.	What is the total number of reservations in the dataset?  
Insight: The total number of reservations in the dataset is 700
2.	Which meal plan is the most popular among guests? 
Insight: The most popular meal plan among the guest is 
Meal Plan 1 which is a total 377 order
3.	What is the average price per room for reservations involving children?  
Insight: The average price per room involving children is 144.57
4.	How many reservations were made for the year 20XX (replace XX with the desired year)?  
Insight: Number of reservations made in year 2018 are 501
5.	What is the most commonly booked room type?  
Insight: The most commonly booked room type is Room type 1
6.	How many reservations fall on a weekend (no_of_weekend_nights > 0)?
Insight: Number of reservations that falls om weekend is   383
7.	What is the highest and lowest lead time for reservations? 
Insight: The highest lead time:443
lowest lead time for reservations is 443 and 0
8.	What is the most common market segment type for reservations? 
Insight: The most common market segment type for reservations is (Online 518)
9.	How many reservations have a booking status of "Confirmed"?
Insight: Number of reservations with booking status “confirmed” is    493
10.	What is the total number of adults and children across all reservations?
Insight: Total number of adults and children across all reservations are   1385
11.	What is the average number of weekend nights for reservations involving children?
Insight: The average number of weekend night for reservation involving children are   1.00
12.	How many reservations were made in each month of the year? 
Insight: Number of reservations made in each month of the year are 
Jan 90
Feb 80
March 69
 April 46
 May 44
 Jun 36
 Jul 55
 Aug 61
 Sep 73
 Oct 74
 Nov 34
 Dec 38
13.	What is the average number of nights (both weekend and weekday) spent by guests for each room type?  
Insight: The average number of nights for both weekend and weekday spent by each guest for each type room are 
Room Type 1: 2.79
Room Type 2: 3.17
Room Type 4: 3.45
Room Type 5: 2.50
Room Type 6: 3.11
Room Type 7: 2.60
14.	For reservations involving children, what is the most common room type, and what is the average price for that room type?  
Insight: The most common room type involving children and its average price per room type
  Room Type 1, avg_price: 123.12
15.	Find the market segment type that generates the highest average price per room.  
Insight: Online 112.46

## Recommendation
1.	Meal Plan Focus: Since Meal Plan 1 is the most popular, consider offering discounts, special promotions, or even enhancements to Meal Plan 1 to increase its appeal even further. It may also be beneficial to promote Meal Plan 1 more prominently during the booking process.
2.	Targeting Families: With the average price per room for reservations involving children being relatively high, it may be useful to create family packages or themed experiences (e.g., discounts on additional nights or free children's meals) to further attract this demographic.
3.	Weekend Promotions: The high number of weekend bookings (383) suggests that weekend stays are particularly popular. Offering weekend-specific promotions (e.g., packages or discounts) could help boost occupancy, especially in lower-demand months.
4.	Room Type Strategy: Room Type 1 is the most popular overall, but Room Type 4 seems to have a longer average stay duration. Consider offering Room Type 4 as a premium option for guests who plan extended stays and might require more space or amenities. Additionally, monitor the popularity of Room Type 1 and continue to maintain its appeal to retain guest preference.
5.	Online Bookings Optimization: Given that the "Online" market segment generates the highest average price per room, it is worth investing in improving the online booking experience, perhaps by providing exclusive online discounts or additional perks for direct bookings. This could help boost revenue from this channel.
6.	Booking Status and Lead Time: Since most reservations are confirmed, it may be beneficial to analyze further why some bookings aren't confirmed and streamline the booking process. Offering early bird discounts or incentives for guests who confirm their bookings ahead of time could also reduce the impact of last-minute cancellations.
7.	Monthly Demand Planning: Considering the fluctuations in reservations per month, marketing campaigns during slower months (such as May, June, and December) could help increase bookings and ensure steady occupancy throughout the year.

## Files-Details
-Hotel Reservation Dataset.csv: The raw data used for analysis
- Problem Statement- Hotel Reservation Analysis.pdf: Project overview and objectives
- Query.sql: SQL queries used to extract and analyze the data
- README.md: Documentation for the project


## Conclusion
The analysis reveals a clear trend in guest preferences, with Meal Plan 1 and Room Type 1 being particularly popular choices. Additionally, reservations involving children show a moderate price point with average stays being relatively short. Given the popularity of weekend stays and online reservations, targeting these segments with special promotions could help maximize revenue and occupancy. By tailoring the offerings to family needs, optimizing online booking channels, and leveraging the insight into peak demand months, the hotel can increase guest satisfaction, improve profitability, and maintain a competitive edge in the market.
