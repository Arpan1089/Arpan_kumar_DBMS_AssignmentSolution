/* Create a new database */
CREATE DATABASE IF NOT EXISTS TravelOnTheGo;

/* Using the database */
use TravelOnTheGo;

/* 1. create table PASSENGER */
CREATE TABLE  if not exists PASSENGER(Passenger_name varchar(50),Category varchar(20),Gender varchar(10),Boarding_City varchar(10),Destination_City varchar(20),Distance int,Bus_Type varchar(20));

/* 1. create table PRICE */
CREATE TABLE  if not exists PRICE (Bus_Type varchar(10),Distance int,Price int);

/* 2. Insert the  data in the table  PASSENGER */
insert into PASSENGER values("Sejal","AC", "F", "Bengaluru", "Chennai",'350',"Sleeper");
insert into PASSENGER values("Anmol","Non-AC", "M", "Mumbai", "Hydrabad",'700',"Sitting");
insert into PASSENGER values("Pallavi","AC", "F", "Panji", "Bengaluru",'600',"Sleeper");
insert into PASSENGER values("Khusboo","AC", "F", "Chennai", "Mumbai",'1500',"Sleeper");
insert into PASSENGER values("Udit","Non-AC", "M", "Trivandrum", "Panji",'1000',"Sleeper");
insert into PASSENGER values("Ankur","AC", "M", "Nagpur", "Hydrabad",'500',"Sitting");
insert into PASSENGER values("Hemant","Non-AC", "M", "Panji", "Mumbai",'700',"Sleeper");
insert into PASSENGER values("Manish","Non-AC", "M", "Hydrabad", "Bengaluru",'500',"Sitting");
insert into PASSENGER values("Piyush","AC", "M", "Pune", "Nagpur",'700',"Sitting");

/* 2. Insert the  data in the table  PRICE */
insert into PRICE values("Sleeper",'350','770');
insert into PRICE values("Sleeper",'500','1100');
insert into PRICE values("Sleeper",'600','1320');
insert into PRICE values("Sleeper",'700','1540');
insert into PRICE values("Sleeper",'1000','2200');
insert into PRICE values("Sleeper",'1200','2640');
insert into PRICE values("Sleeper",'1500','2700');
insert into PRICE values("Sitting",'500','620');
insert into PRICE values("Sitting",'600','744');
insert into PRICE values("Sitting",'700','868');
insert into PRICE values("Sitting",'1000','1240');
insert into PRICE values("Sitting",'1200','1488');
insert into PRICE values("Sitting",'1500','1860');

/*3 How many females and how many male passengers travelled for a minimum distance of 600 KM s? */
SELECT  SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) as Male,
         SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) as Female
         FROM PASSENGER WHERE Distance >= 600;
		
 /* 4. Find the minimum ticket price for Sleeper Bus. */       
SELECT MIN(Price) as min_price_sleeper FROM PRICE WHERE  Bus_Type = "Sleeper";

/* 5.Select passenger names whose names start with character 'S' */
SELECT Passenger_name as PassengerName from  PASSENGER WHERE Passenger_name like 'S%';

/*6.Calculate price charged for each passenger displaying Passenger name, Boarding City,Destination City, Bus_Type, Price in the output */
SELECT Passenger_name , p1.Boarding_City, p1.Destination_city, p1.Bus_Type, p2.Price FROM passenger p1, price p2 WHERE p1.Distance = p2.Distance and p1.Bus_type = p2.Bus_type;

/* 7.What are the passenger name/s and his/her ticket price who travelled in the Sitting busfor a distance of 1000 KM s*/
SELECT p1.Passenger_name, p2.Price FROM PASSENGER p1, PRICE p2 WHERE p1.Distance = 1000 and p1.Bus_type = 'Sitting' and p1.distance= P2.distance and P1. Bus_type= P2.bus_type;

/* 8 What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji? */
SELECT DISTINCT p1.Passenger_name, p1.Boarding_city as Destination_city, p1.Destination_city as Boardng_city, p1.Bus_type, p2.Price FROM passenger p1, price p2 WHERE Passenger_name = 'Pallavi' and p1.Distance = p2.Distance;

/* 9. List the distances from the "Passenger" table which are unique (non-repeateddistances) in descending order. */
SELECT DISTINCT distance FROM passenger ORDER BY Distance desc;

/* 10 .Display the passenger name and percentage of distance travelled by that passenger
from the total distance travelled by all passengers without using user variables */

SELECT Passenger_name, Distance * 100.0/ (SELECT SUM(Distance) FROM passenger)FROM passenger GROUP BY Distance;

/*11.  Display the distance, price in three categories in table Price
a) Expensive if the cost is more than 1000
b) Average Cost if the cost is less than 1000 and greater than 500
c) Cheap otherwise */
Select Distance, price,
Case 
when Price > 1000
Then 'Expensive Cost'
When Price > 500 and Price < 1000
Then ' Average Cost'
 When Price <500
Then ' cheap' 
End as Category
From price;

