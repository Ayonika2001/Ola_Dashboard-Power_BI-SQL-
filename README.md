# Ola Power BI & SQL Project

This repository contains the SQL queries and Power BI report used for analyzing Ola ride booking data. The project consists of the following key files:

- **Bookings.csv**: The dataset containing ride booking information.
- **ola quary.sql**: SQL scripts that perform various queries on the bookings data.
- **ola.pbix**: The Power BI report file used for data visualization.
- **README.md**: This file.

---

## Database Setup

Before running the queries, create and select the database with the following commands:

```sql
Create database ola;
use ola;
```

---

## SQL Queries

The SQL queries in this project are designed to extract insights from the `bookings` table. Below are the query snippets:

### 1. Retrieve all successful bookings

```sql
select Booking_ID, Booking_Status from bookings
where Booking_Status = "Success";

select count(Booking_ID) from bookings
where Booking_Status = "Success";
```

### 2. Find the average ride distance for each vehicle type

```sql
select Vehicle_Type, Round(avg(Ride_Distance), 2) as average_ride_distance from bookings
group by Vehicle_Type;
```

### 3. Get the total number of cancelled rides by customers

```sql
select count(Booking_Status) as cancelled_rides
from bookings
where Booking_Status = "Canceled by Customer";
```

### 4. List the top 5 customers who booked the highest number of rides

```sql
select Customer_ID, count(Booking_ID) as highest_number_of_rides
from bookings
group by Customer_ID
order by highest_number_of_rides desc limit 5;
```

### 5. Get the number of rides cancelled by drivers due to personal and car-related issues

```sql
select count(Canceled_Rides_by_Driver) as cancelled_by_drivers
from bookings
where Canceled_Rides_by_Driver = "Personal & Car related issue";
```

### 6. Find the maximum and minimum driver ratings for Prime Sedan bookings

```sql
Select max(Driver_Ratings) as Max_Driver_Rating, min(Driver_Ratings) as Min_Drive_Rating from bookings;
```

### 7. Retrieve all rides where payment was made using UPI

```sql
Select Booking_ID, Payment_Method from bookings
where Payment_Method = "UPI";
```

### 8. Find the average customer rating per vehicle type

```sql
Select Vehicle_Type, round(avg(Customer_Rating), 2) as Avg_Rating from bookings
group by Vehicle_Type;
```

### 9. Calculate the total booking value of rides completed successfully

```sql
Select sum(Booking_Value) as total_Booking_Value from bookings
where Booking_Status = "Success";
```

### 10. List all incomplete rides along with the reason

```sql
Select Booking_ID, Incomplete_Rides_Reason from bookings
where Incomplete_Rides_Reason <> "Null";

Select count(Booking_ID) from bookings
where Incomplete_Rides_Reason <> "Null";
```

---

## Power BI Report

The `ola.pbix` file contains the Power BI report created to visualize the insights derived from the SQL queries. Open this file in Power BI Desktop to interact with the dashboard and explore the data further.

---

## Usage Instructions

1. **Database & Data Import**:  
   - Create the `ola` database and switch to it.
   - Import the data from `Bookings.csv` into a table named `bookings`.

2. **Executing SQL Queries**:  
   - Run the SQL queries provided in the `ola quary.sql` file to extract various insights from the data.

3. **Visualization with Power BI**:  
   - Open the `ola.pbix` file in Power BI Desktop to view and interact with the dashboard.
## Dashboard

https://github.com/user-attachments/assets/66e88f8a-1435-41ea-840f-c1b4476acaf4


---

*Note: This markdown file is constructed solely based on the contents available in the repository.*
