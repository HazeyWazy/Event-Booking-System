create table Loyalty
(
LoyaltyLevel varchar(10) primary key,
No_of_Bookings_Required int,
Discount varchar(5)
)

select * from Loyalty

insert into Loyalty
values('Gold',10,'10%'),
('Silver',5,'7%'),
('Bronze',2,'5%')

select * from Loyalty

create table CustomersDetail
(
CustomerRef int primary key,
FirstName varchar(30),
Surname varchar(30),
Address varchar(80),
ContactNumber varchar(20),
Email varchar(30),
LoyaltyLevel varchar(10),
foreign key(LoyaltyLevel) references Loyalty
)

select * from CustomersDetail

insert into CustomersDetail
values(1, 'Jamie', 'Davidson', '12 Smith St, Salford', 07858987789, 'jdavid@kmail.com', 'Gold'),
(2, 'Paula', 'Davies', '34 Princess St, Macclesfield', 07754895632, 'livelyfish@jive.co.uk', 'Silver'),
(3, 'Ibrahaim', 'Shah', '45 Railway Grove, Cheadle', 07587774147, 'shahi@hmail.com', 'Gold'),
(4, 'Dylan', 'Gani', '56 Harry Potts Road, Stockport', 07999852147, 'dylang@kmail.com', 'Bronze')

select * from CustomersDetail

alter table CustomersDetail
drop column ContactNumber

alter table CustomersDetail
add ContactNumber varchar(20)

update CustomersDetail
set ContactNumber = '07858987789'
where CustomerRef = 1

update CustomersDetail
set ContactNumber = '07754895632'
where CustomerRef = 2

update CustomersDetail
set ContactNumber = '07587774147'
where CustomerRef = 3

update CustomersDetail
set ContactNumber = '07999852147'
where CustomerRef = 4

select * from CustomersDetail

create table Venue
(
VenueID int primary key,
Name varchar(30),
Address varchar(80),
ContactName varchar(30),
TelNumber varchar(20),
Capacity int
)

select * from Venue

insert into Venue
values(1, 'The Coliseum', 'Drew Lane, Stockport, SK1 4PT', 'Paul Gilling', 07898564456, 450),
(2, 'Apollo', 'Srnith Lane, Salford, M17 1AF', 'Susie Shaw', 07877458854, 200),
(3, 'The Princess Theatre', 'Roebuck Lane, Sale, M33 1DG', 'Bruce Bradley', 07785456123, 124),
(4, 'The Octagon', 'Crewe Lane, Astley, M23 5TH', 'Samina Shah', 07787452145, 50)

select * from Venue

alter table Venue
drop column TelNumber

alter table Venue
add TelNumber varchar(20)

update Venue
set TelNumber = '07898564456'
where VenueID = 1

update Venue
set TelNumber = '07877458854'
where VenueID = 2

update Venue
set TelNumber = '07785456123'
where VenueID = 3

update Venue
set TelNumber = '07787452145'
where VenueID = 4

select * from Venue

create table Event
(
EventID int primary key,
Description varchar(50),
FullPrice varchar(10),
EventDate varchar(10),
Time varchar(5),
VenueDetails varchar(50)
)

alter table Event
alter column EventDate Date 

select * from Event

insert into Event
values(1, 'The Jive Crew', '£12', '25/10/2018', '7pm', 'The Coliseum, Stockport'),
(2, 'Taming of Shrew', '£15', '1/11/2018', '7pm', 'Apollo Salford'),
(3, 'The Simthsons', '£25', '5/11/2018', '2pm', 'The Princess Theatre, Sale')

select * from Event

create table Booking
(
BookingRef int primary key,
BookingDate varchar(10),
CustomerRef int,
foreign key(CustomerRef) references CustomersDetail,
PaymentMethod varchar(20),
TicketQTY int,
EventID int,
foreign key(EventID) references Event,
VenueID int,
foreign key(VenueID) references Venue
)

select * from Booking

insert into Booking
values(12, '12/06/2018', 1, 'Credit Card', 3, 1, 1),
(25, '4/07/2018', 2, 'Debit Card', 2, 3, 2),
(32, '14/09/2018', 3, 'Credit Card', 2, 2, 3),
(45, '4/10/2018', 3, 'Debit Card', 1, 1, 1),
(47, '15/10/2018', 4, 'Cash', 1, 2, 3)

select * from Booking

create table Ticket
(
TicketNo int primary key,
SeatNo int,
Row varchar(10),
CustomerName varchar(50),
BookingRef int,
foreign key(BookingRef) references Booking,
Post_Collect varchar(10)
)

select * from Ticket

insert into Ticket
values(1, 34, 'B', 'Jamie Davidson', 12, 'Post'),
(2, 35, 'B', 'Jamie Davidson', 12, 'Post'),
(3, 36, 'B', 'Jamie Davidson', 12, 'Post'),
(4, 2, 'A', 'Paula Davies', 25, 'Collect'),
(5, 2, 'A', 'Paula Davies', 25, 'Collect'),
(6, 45, 'D', 'Ibrahaim Shah', 32, 'Post'),
(7, 46, 'D', 'Ibrahaim Shah', 32, 'Post'),
(8, 5, 'F', 'Ibrahaim Shah', 45, 'Collect'),
(9, 3, 'H', 'Dylan Gani', 47, 'Collect')

select * from Ticket

select FirstName, Surname
from CustomersDetail
order by Surname asc

select b.*, et.EventDate
from Booking b, Event et
where b.EventID = et.EventID
order by et.EventDate asc

select COUNT(BookingRef) as No_of_Booking
from Booking
where PaymentMethod = 'Credit Card'

select b.*, et.*
from Booking b, Event et
where b.EventID = et.EventID
and b.TicketQTY > 1
order by et.Description asc

select cd.FirstName, cd.Surname, cd.LoyaltyLevel
from CustomersDetail cd, Booking b
where cd.CustomerRef = b.CustomerRef
and b.PaymentMethod = 'Credit Card'
group by cd.LoyaltyLevel, cd.FirstName, cd.Surname

update Venue
set ContactName = 'Mark Hibbart'
where Name = 'The Coliseum'

select * from Venue

insert into Venue
values('5', 'The Round Theatre', '12 Grayson Lane, Manchester, M1 2RT', 'Sarah Jones', '07667543444', '230')

update Venue
set TelNumber = '07667543444'
where VenueID = 5

select * from Venue

delete from Venue
where Name = 'The Octagon'

select * from Venue