create database ola;
use ola;

-- SQL Questions:
-- 1. Retrieve all successful bookings:
select Booking_ID,Booking_Status from bookings
where Booking_Status="Success";

-- 2. Find the average ride distance for each vehicle type:

select Vehicle_Type,round(avg(Ride_Distance),2) as average_ride_distance
from bookings
group by Vehicle_Type;

-- 3. Get the total number of cancelled rides by customers:

select count(Booking_ID) as No_of_cancelled_rides
from bookings
where Booking_Status="Canceled by Customer";


-- 4. List the top 5 customers who booked the highest number of rides:

select Customer_ID,count(Booking_ID) as no_of_rides
from bookings
where Booking_Status="Success"
group by Customer_ID
order by no_of_rides desc limit 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:

select count(Booking_ID) 
from bookings
where Canceled_Rides_by_Driver="Personal & Car related issue";


-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

select max(Driver_Ratings) as max_driver_rating ,min(Driver_Ratings) as min_driver_rating from bookings 
where Vehicle_Type="Prime Sedan";


-- 7. Retrieve all rides where payment was made using UPI:
select Booking_ID
from bookings
where Payment_Method="UPI";

select count(Booking_ID)
from bookings
where Payment_Method="UPI";

-- 8. Find the average customer rating per vehicle type:
select Vehicle_Type,round(avg(Customer_Rating),2) as average_customer_rating
from bookings
group by Vehicle_Type;

-- 9. Calculate the total booking value of rides completed successfully:
select sum(Booking_Value) as total_booking_value
from bookings
where Booking_Status="Success";


-- 10. List all incomplete rides along with the reason:

select Booking_ID
from bookings
where Incomplete_Rides_Reason<>"null";

select count(Booking_ID)
from bookings
where Incomplete_Rides_Reason<>"null";