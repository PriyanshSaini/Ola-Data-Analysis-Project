create database ola_project;
use ola_project;

#Retrive all sucessfull booking
create view sucessfull_booking As
SELECT * FROM ola_project.`ola data`
where Booking_Status = 'Success';

SELECT * FROM sucessfull_booking;

# Find the avg ride distance fro each vehicle
create view ride_distance_for_each_vehicle as
Select Vehicle_Type , avg(Ride_Distance)
as Avg_distance from  ola_project.`ola data`
group by Vehicle_Type;

Select *from ride_distance_for_each_vehicle;

#Get the total number of cancel rides by custoemrs
Create view  total_number_of_cancel_rides_by_custoemrs as
Select count(*) from ola_project.`ola data`
where Booking_Status = 'Canceled by Customer';

select * from total_number_of_cancel_rides_by_custoemrs;

# List the top_5_customer
create view top_5_customer as
Select Customer_ID, count(Booking_ID) as total_rides
from  ola_project.`ola data`
group by  Customer_ID
order by total_rides desc limit 5;

select * from top_5_customer; 

#number of rides canceld bydrivers due to personal or car related issues
create view rides_canceld_by_drivers_due_to_personal_or_car_related_issues as
 select * from ola_project.`ola data`
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from rides_canceld_by_drivers_due_to_personal_or_car_related_issues;

# Max_and_Min_driver_Rating_for_Prime_and_Sedan
create view Max_and_Min_driver_Rating_for_Prime_and_Sedan as
select Max(Driver_Ratings) as max_rating, 
Min(Driver_Ratings) as min_rating
from ola_project.`ola data`
where Vehicle_Type = 'Prime Sedan';

select * from Max_and_Min_driver_Rating_for_Prime_and_Sedan;

# payemet_made_by_UPI
create view  payemet_made_by_UPI as
 select * from ola_project.`ola data`
 where Payment_Method = 'UPI';
 
 select * from payemet_made_by_UPI;
 
# Avg_cutstomer_rating_and_driver_rating_per_vehicel_type
create view  Avg_cutstomer_rating_and_driver_rating_per_vehicel_type as
select Vehicle_Type,
avg(Customer_Rating) as avg_custoemr_rating,
avg(Driver_Ratings) as avg_driver_rating
from ola_project.`ola data`
group by Vehicle_Type;

select * from  Avg_cutstomer_rating_and_driver_rating_per_vehicel_type;

#Total_Booking_Vlaue_of_successful_ride
create view Total_Booking_Vlaue_of_successful_ride as
select sum(Booking_Value)
from ola_project.`ola data`
where Booking_Status = 'Success';

select * from Total_Booking_Vlaue_of_successful_ride;

#List_incompelete_rides_along_with_reason
create view incompelete_rides_along_with_reason as
select Booking_ID, Incomplete_Rides_Reason
from ola_project.`ola data`
where Incomplete_Rides = 'Yes';

select * from incompelete_rides_along_with_reason;


 
 
 


 