use master;

create database Hotel_complex;
use Hotel_complex;

drop table Users;
drop table Rooms;
drop table Room_type;
drop table Busy_room;
drop table Services_;
drop table BookedRooms;


create table Users(
user_id_ int primary key identity(1,1),
user_isEmployee bit not null, ----mb skip
user_email nvarchar(40) not null,
user_password nvarchar(20) not null,
user_name_ nvarchar(20) not null,
user_secondName nvarchar(20) not null,
user_phone int not null
);

create table Rooms(
room_id int primary key identity(1,1),
room_number int not null,
room_idType int not null constraint FK_Rooms_Room_type foreign  key references Room_type(type_id_),
room_isFree bit not null
);

create table Room_type(
type_id_ int primary key identity(1,1),
type_name_ nvarchar(20) not null,
type_coastPerDay float not null,
type_description nvarchar(40) not null 
);

create table Busy_room(
busy_id int primary key identity(1,1),
room_id int not null constraint FK_Busy_room_Rooms foreign  key references Rooms(room_id),
user_id_ int not null constraint FK_Busy_room_Users foreign  key references Users(user_id_),
service_id int not null constraint FK_Busy_room_Services_ foreign  key references Services_(service_id),
date_checkIn date not null,
date_checkOut date not null,
price float
);

create table Services_(
service_id int primary key identity(1,1),
service_name_ nvarchar(20),
service_cost float
)


create table BookedRooms(
book_id int primary key identity(1,1),
room_id int not null constraint FK_Busy_room_Rooms foreign  key references Rooms(room_id),
user_id_ int not null,
service_id int not null,
date_checkIn date not null,
date_checkOut date not null,
price float
);
