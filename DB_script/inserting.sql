use Hotel_complex;
------------------------------------SERVICE_TYPE(FOR import)-----------------------------------------------
select * from Services_type;

insert into Services_type(services_type_name,services_type_price)
	values ('breakfast', 25);
insert into Services_type(services_type_name,services_type_price)
	values ('lunch', 35);
insert into Services_type(services_type_name,services_type_price)
	values ('dinner', 35);
insert into Services_type(services_type_name,services_type_price)
	values ('parking', 50);
insert into Services_type(services_type_name,services_type_price)
	values ('conference_Hall', 40);
insert into Services_type(services_type_name,services_type_price)
	values ('dry_clinning', 25);
	--It's a row for import from xml
--insert into Services_type(services_type_name,services_type_price) 
	--values ('spa', 50);
------------------------------------ROOM_TYPE-----------------------------------------------
select * from Room_type;
insert into Room_type(type_name_,type_coastPerDay,type_description)
	values ('single', 300,'one_person');
insert into Room_type(type_name_,type_coastPerDay,type_description)
	values ('double', 360,'large_bed');
insert into Room_type(type_name_,type_coastPerDay,type_description)
	values ('twin', 400,'two_bed');
insert into Room_type(type_name_,type_coastPerDay,type_description)
	values ('luxury', 500,'premium');
insert into Room_type(type_name_,type_coastPerDay,type_description)
	values ('apartment', 500,'kitchen');
---------------------------------ROOMS(FOR export)-----------------------------------------
select * from Rooms;
	insert into Rooms(room_number,room_idType,room_isFree)
		values (201,1,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (202,1,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (203,1,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (204,1,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (205,1,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (206,2,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (207,2,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (208,2,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (209,2,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (210,3,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (211,3,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (212,3,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (213,4,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (214,4,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (215,5,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (301,1,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (302,1,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (303,1,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (304,1,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (305,1,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (306,2,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (307,2,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (308,2,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (309,2,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (310,3,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (311,3,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (312,3,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (313,4,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (314,4,1);
	insert into Rooms(room_number,room_idType,room_isFree)
		values (315,5,1);

