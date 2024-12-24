select * from flight;
select * from airline;
select * from class;
select * from ticket;
select * from user;
select * from payment;

# 1. From the flight table print all the data where distance in greater than 800 miles
Select * from flight where distance > 800;

/** 2. From the flight table print how many times each flight has been mentioned 
and name the column Number_Of_Fights and arrange the data in descending order **/
Select Flight_Name,Count(flight_name) as Number_Of_Flights from flight 
group by flight_name 
having Number_Of_Flights > 2 
order by Number_Of_Flights Desc;

# 3. Print all the flight_name and airline_name using join
Select flight.Flight_Name, airline.Airline_Name from flight 
join airline 
on flight.airline_airline_id = airline.airline_id;

# 4. Print User_Name, Passenger_Name and Seat_Number using left join
Select user.User_Name , ticket.Passenger_Name, ticket.Seat_Number from User 
left join ticket on user.User_Id = ticket.user_User_Id;
 
/** 5. Print Passenger_Name, Seat_Number, Source, Destination from 
ticket table where destination is Paris using procedures**/
call ticket_dest_src();

# 6. Print PNR_Number, FLight_Number, Flight_Name and Airline_Id using right join 
Select ticket.PNR_Number, flight.Flight_Number, flight.Flight_Name, 
flight.Airline_Airline_Id as Airline_Id from ticket 
right join flight on ticket.PNR_Number = flight.ticket_PNR_Number;

/** 7. Print the PNR_Number and Payment_Mode of all the tickets where payment has 
been made using Apple Pay and PNR_Number begins with A **/
Select ticket.PNR_Number, payment.Payment_Mode from ticket 
inner join payment on ticket.Payment_Transaction_Id = payment.Transaction_Id 
Where payment.Payment_Mode = 'Apple Pay' and ticket.PNR_Number Like 'A%';

# 8. Print User_Name, Passenger_Name and Payment_Mode of all the Passengers
Select user.User_Name, ticket.Passenger_Name, payment.Payment_Mode from 
((ticket join user on user.User_Id = ticket.User_User_Id)
join payment on ticket.Payment_Transaction_Id = payment.Transaction_Id);  

/** 9. Insert a new row in the user table have User_Id = 21, Username = janedoe, First_Name = Jane, 
Last_Name = Doe, Gender = M and Phone_Number = +1-555-555-5005 **/
INSERT INTO User VALUES (21, 'janedoe', 'Jane', 'Doe', 'M', '+1-555-555-5005');

# 10. Update User_Name to 'joshwindsor', First_Name to 'Josh' and Last_name to 'Windsor' for user 21
Update User SET User_Name = 'joshwindsor', 
First_Name = 'Josh', Last_Name = 'Windsor' Where User_Id = 21;

Select * from user where User_Id = 21;

# 11. Delete from user table where User_Id = 21
Delete from user where User_Id = 21;

select max(User_Id) as Last_User_Id from user;

