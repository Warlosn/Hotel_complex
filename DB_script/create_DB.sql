use master;

create database Hotel_complex;
use Hotel_complex;

create login hotel_client 
with password='Dfyef2001',
default_database = Hotel_complex,
default_language=[русский],
check_expiration=off, check_policy=on;

create login hotel_employee
with password='Fumiba2001',
default_database = Hotel_complex,
default_language=[русский],
check_expiration=off, check_policy=on;

create user hotel_complex_client for login hotel_client;
create user hotel_complex_empoyee for login hotel_employee;

drop user hotel_complex_empoyee;
drop user hotel_complex_client;
drop login hotel_employee;
drop login hotel_client;
----------------------------------------------------------------------
drop table Users;
drop table Room_type;
drop table Rooms;
drop table Busy_room;
drop table Services_;
drop table BookedRooms;
drop table Services_type;


select * from Users;
select * from Room_type;
select * from Rooms;
select * from Busy_room;
select * from Services_;
select * from BookedRooms;
select * from Services_type;






create table Users(
user_id_ int primary key identity(1,1),
user_email nvarchar(40) not null UNIQUE,
user_password nvarchar(20) not null,
user_name_ nvarchar(20) not null,
user_secondName nvarchar(20) not null,
user_phone nvarchar(20) not null
);

create table Room_type(
type_id_ int primary key identity(1,1),
type_name_ nvarchar(20) not null,
type_coastPerDay float not null,
type_description nvarchar(50) not null 
);

create table Rooms(
room_id int primary key identity(1,1),
room_number int not null,
room_idType int not null constraint
FK_Rooms_Room_type foreign  key references Room_type(type_id_),
room_isFree bit not null
);

create table Services_type(
services_type_id int primary key identity(1,1),
services_type_name varchar(20) not null,
services_type_price float not null
)

create table Busy_room(
busy_id int primary key identity(1,1),
room_id int not null constraint FK_Busy_room_Rooms
foreign  key references Rooms(room_id),
user_id_ int not null constraint FK_Busy_room_Users
foreign  key references Users(user_id_),
date_checkIn date not null,
date_checkOut date not null,
price float
);

create table Services_(
service_id int primary key identity(1,1),
busy_id int not null constraint FK_Services_Busy_room
foreign  key references Busy_room(busy_id),
service_type int not null constraint FK_Services_Services_type
foreign  key references Services_type(services_type_id)
)

create table BookedRooms(
book_id int primary key identity(1,1),
room_id int not null constraint FK_BookedRooms_Rooms
foreign  key references Rooms(room_id),
user_id_ int not null constraint FK_BookedRooms_Users
foreign  key references Users(user_id_),
date_checkIn date not null,
date_checkOut date not null,
price float
);
---------------------------------------------------------TRIGGER-------------------------------------------------------
drop trigger SuccessBook
go
create trigger SuccessBook 
	on BookedRooms after insert
	as
begin
	print 'Room booked'
end;
go
---------------------------------------------------------VIEW---------------------------------------------------------------
drop view FreeRoomView;
drop procedure CheckFreeRoomView;
go
create view FreeRoomView(Номер, [Тип номера])
	as select room_number, room_idType from Rooms
		where room_isFree = 1;

go
create procedure CheckFreeRoomView
as
begin
select * from FreeRoomView;
end;
go
--------------------------------------------------------INDEX----------------------------------------------------------------
drop procedure FindUserIndex;
drop index FindUserEmail on Users;
set statistics io on;
set statistics time on;
go
create procedure FindUserIndex 
@email nvarchar(40)
as 
begin
select * from Users where user_email = @email;
end;
go
create index FindUserEmail on Users(user_email);
DBCC dropcleanbuffers;
checkpoint