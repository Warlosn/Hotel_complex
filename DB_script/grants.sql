use Hotel_complex;
drop role Hotel_clinet_role
drop role Hotel_employee_role
--------------------------------
CREATE ROLE Hotel_clinet_role;
go
grant execute on AddUser to Hotel_clinet_role;
grant execute on ViewRoomTypes to Hotel_clinet_role;
grant execute on CountEmptyRooms to Hotel_clinet_role;
grant execute on ViewServiceType to Hotel_clinet_role;
grant execute on BookRoom to Hotel_clinet_role;
go

CREATE ROLE Hotel_employee_role;
go
grant execute on Import_services_type_xml  to Hotel_employee_role;
grant execute on Export_rooms_xml  to Hotel_employee_role;
grant execute on FindUserIndex  to Hotel_employee_role;
grant execute on CheckFreeRoomView  to Hotel_employee_role;
grant execute on AddUser  to Hotel_employee_role;
grant execute on CheckBookedRoom  to Hotel_employee_role;
grant execute on CheckBusyRoom  to Hotel_employee_role;
grant execute on CheckClient  to Hotel_employee_role;
grant execute on CheckBookedClient  to Hotel_employee_role;
grant execute on CountEmptyRooms  to Hotel_employee_role;
grant execute on CheckAddServices  to Hotel_employee_role;
grant execute on AddClientService  to Hotel_employee_role;
grant execute on CheckOutClient  to Hotel_employee_role;
go
exec sp_addrolemember 'Hotel_clinet_role', 'hotel_complex_client';
go
exec sp_addrolemember 'Hotel_employee_role', 'hotel_complex_empoyee';
go
-----------------------------------------------------------------
GRANT EXECUTE ON [sys].[xp_cmdshell] TO hotel_complex_empoyee
use Hotel_complex;
revoke control server to hotel_employee;
use master;