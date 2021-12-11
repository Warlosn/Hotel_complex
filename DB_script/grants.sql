CREATE ROLE Hotel_clinet_role;
go
grant execute on AddUser to Hotel_clinet_role;
grant execute on ViewRoomTypes to Hotel_clinet_role;
grant execute on ViewEmptyRooms to Hotel_clinet_role;
grant execute on BookRoom to Hotel_clinet_role;
grant execute on ViewServiceType to Hotel_clinet_role;
go

CREATE ROLE Hotel_employee_role;
go
grant execute on Import_services_type_xml  to Hotel_employee_role;
grant execute on Export_rooms_xml  to Hotel_employee_role;
grant execute on AddUser  to Hotel_employee_role;
grant execute on ViewEmptyRooms  to Hotel_employee_role;
grant execute on CheckServices  to Hotel_employee_role;
grant execute on CheckBookedRoom  to Hotel_employee_role;
grant execute on CheckBusyRoom  to Hotel_employee_role;
grant execute on CheckClient  to Hotel_employee_role;
grant execute on CheckBookedClient  to Hotel_employee_role;
grant execute on CheckOutClient  to Hotel_employee_role;
go
exec sp_addrolemember 'Hotel_clinet_role', 'hotel_complex_client';
go
exec sp_addrolemember 'Hotel_employee_role', 'hotel_complex_empoyee';
go
