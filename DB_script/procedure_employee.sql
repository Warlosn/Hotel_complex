use Hotel_complex;
drop procedure CheckClient;
drop procedure CheckBookedClient;
drop procedure CheckOutClient;
drop procedure CheckServices;
drop procedure CheckBookedRoom;
drop procedure CheckBusyRoom;
go 
----------------------------------------------�������� ���������� ��������------------------------------------------------------------
create procedure CheckServices
as
begin
select * from Services_;
end;
go
----------------------------------------------�������� ��������������� �������------------------------------------------------------------
create procedure CheckBookedRoom
as
begin
select * from BookedRooms;
end;
go
----------------------------------------------�������� ������� �������------------------------------------------------------------
create procedure CheckBusyRoom
as
begin
select * from Busy_room;
end;
go
------------------------------------------------�������� 100� �����--------------------------------------------------------
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
----------------------------------------------�������� ������� � �����------------------------------------------------------------
create procedure CheckClient
		@checkIn date,
		@checkOut date,
		@roomType nvarchar(20)
as
begin
end;
go
----------------------------------------------�������� ������� �� �����------------------------------------------------------------
create procedure CheckBookedClient
		
as
begin
end;
go
----------------------------------------------�������� �������------------------------------------------------------------
create procedure CheckOutClient
		
as
begin
end;