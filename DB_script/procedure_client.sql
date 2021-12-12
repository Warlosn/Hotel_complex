use Hotel_complex;
drop procedure AddUser;
drop procedure ViewRoomTypes;
drop function CountEmptyRooms;
drop procedure BookRoom;
drop procedure ViewServiceType;
drop procedure BookRoom;
drop procedure CheckAllServices;
go
---------------------------------------------------------------Регистрация клиента-------------------------------------------------------------
create procedure AddUser
				@email nvarchar(40),
				@password nvarchar(20),
				@firstName nvarchar(20),
				@secondName nvarchar(20),
				@phone nvarchar(20)
as
begin 
	if EXISTS (select top 1 * from Users where Users.user_email = @email)
		print 'User exists';
	else
	begin
	insert into Users(user_email, user_password,user_name_,user_secondName,user_phone)
	values(@email, @password, @firstName, @secondName, @phone)
   end;
   END;
go
---------------------------------------------------------------Просмотр типов номеров-------------------------------------------------------------
create procedure ViewRoomTypes
as 
begin
select type_name_, type_coastPerDay, type_description from Room_type;
end;
go
---------------------------------------------------------------Просмотр кол-ва свободных номеров-------------------------------------------------------------
create function CountEmptyRooms (@type nvarchar(20))
returns int
as
begin
declare @countR int;
declare @check nvarchar(20);
select @check = type_id_ from Room_type where type_name_ =@type;
select @countR = count(*) from Rooms where Rooms.room_isFree=1 and room_idType=@check;
return @countR;
end;
go
---------------------------------------------------------------Просмотр доступных сервисов-------------------------------------------------------------
create procedure ViewServiceType
as 
begin
select services_type_name, services_type_price from Services_type;
end;
go
---------------------------------------------------------------Бронирование номера-------------------------------------------------------------
create procedure BookRoom
		@email nvarchar(40),
		@checkIn date,
		@checkOut date,
		@roomType nvarchar(20)
as
begin
declare @userId int;
select @userId = user_id_ from Users where user_email = @email;
declare @roomId int;
set @roomId = (select top 1 r.room_id from rooms r inner join Room_type t 
	on r.room_idType = t.type_id_
		where t.type_name_ = @roomType and r.room_isFree=1);
declare @price float;
set @price = DATEDIFF(day, @checkIn, @checkOut) * (select type_coastPerDay from Room_type where type_name_ = @roomType);
insert into BookedRooms(room_id, user_id_,date_checkIn,date_checkOut,price) values
	( @roomId,@userId,@checkIn,@checkOut, @price);
	update Rooms set room_isFree=0 where room_id =@roomId;
end;
go
----------------------------------------------Просмотр доступных сервисов------------------------------------------------------------
create procedure CheckAllServices
as begin
select services_type_name, services_type_price from Services_type;
end;
go