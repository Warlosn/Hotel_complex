use Hotel_complex;
drop procedure CheckBookedRoom;
drop procedure CheckBusyRoom;
drop procedure AddStoUsers;
drop procedure CheckClient;
drop procedure CheckBookedClient;
drop procedure CheckOutClient;
drop procedure AddClientService;
drop procedure CheckAddServices;
go 
------------------------------Просмотр забронированных номеров------------------------------------------------------------
create procedure CheckBookedRoom
as
begin
select * from BookedRooms;
end;
go
------------------------------Просмотр занятых номеров------------------------------------------------------------
create procedure CheckBusyRoom
as
begin
select * from Busy_room;
end;
go
------------------------------Добавить 100к строк--------------------------------------------------------
create procedure AddStoUsers
				@email nvarchar(40),
				@password nvarchar(20),
				@firstName nvarchar(20),
				@secondName nvarchar(20),
				@phone nvarchar(20)
as 
begin
insert into Users(user_email, user_password,user_name_,user_secondName,user_phone)
	values(@email, @password, @firstName, @secondName, @phone)
end;
go
-----------------------------Заселить клиента в номер------------------------------------------------------------
create procedure CheckClient
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
set @price = DATEDIFF(day, @checkIn, @checkOut) * (select type_coastPerDay 
from Room_type where type_name_ = @roomType);
insert into Busy_room(room_id, user_id_,date_checkIn,date_checkOut,price) 
values( @roomId,@userId,@checkIn,@checkOut, @price);
	update Rooms set room_isFree=0 where room_id =@roomId;
end;
go
-----------------------------Заселить клиента по брони------------------------------------------------------------
create procedure CheckBookedClient(@book_id int)
as
DECLARE CheckBooked CURSOR FOR 
     SELECT room_id, user_id_, date_checkIn, date_checkOut, price 
     FROM BookedRooms where book_id = @book_id;
begin
declare @roomId int;
declare @userId int;
declare @checkIn date;
declare @checkOut date;
declare @price float;
open CheckBooked;
fetch next from CheckBooked into @roomId,@userId,@checkIn,@checkOut,@price;
insert into Busy_room(room_id, user_id_,date_checkIn,date_checkOut,price) 
	values(@roomId,@userId,@checkIn,@checkOut,@price);
	CLOSE CheckBooked;
   DEALLOCATE CheckBooked;
   delete from BookedRooms where book_id=@book_id;
end;
go
----------------------------Выселить клиента------------------------------------------------------------
create procedure CheckOutClient
		@idBusyRoom int
as
begin
delete from Services_ where busy_id = @idBusyRoom;
update Rooms set room_isFree = 1  from Rooms inner join Busy_room 
	on Rooms.room_id=Busy_room.room_id where Busy_room.busy_id=@idBusyRoom;
delete from Busy_room where busy_id = @idBusyRoom;
end;
go
-----------------------------Добавление сервиса------------------------------------------------------------
create procedure AddClientService
		@idBusy int,
		@serviceTypeId int
as
begin
declare @lastprice float;
select @lastprice = price from Busy_room where busy_id=@idBusy;
insert into Services_(busy_id,service_type)values
						(@idBusy,@serviceTypeId);
declare @serviceTypePrice float;
select @serviceTypePrice = services_type_price from Services_type 
		where services_type_id = @serviceTypeId;
update Busy_room set price = @lastprice + @serviceTypePrice  
		where busy_id=@idBusy;
end;
go
---------------------------Просмотр заказанных сервисов------------------------------------------------------------
Create procedure CheckAddServices
			@busyId int
as
begin
select Services_.busy_id, Services_type.services_type_name,
Services_type.services_type_price from Services_ inner join 
Services_type on Services_.service_type=Services_type.services_type_id
	where busy_id=@busyId;
end;
go