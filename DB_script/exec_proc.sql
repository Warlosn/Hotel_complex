use Hotel_complex;
----------------------------------------��������� ���������--------------------------------------
Exec Import_services_type_xml; -- ������ ������ �������
Exec Export_rooms_xml; -- ������� ��������� �������
Exec CheckFreeRoomView; -- �������� ������������� �� ���������� ���������
Exec AddUser 'vanya.@mail.ru', 'password', 'ivan', 'grishin','37544777777777'; -- ��������� ������ �������
Exec ViewEmptyRooms 'double'; --- ���������� ��������� ������� �� ���� ������
Exec CheckServices; -- �������� ���������� ��������
Exec CheckBookedRoom; -- �������� ��������������� �������
Exec CheckBusyRoom; -- �������� ������� �������

Exec CheckClient; --�������� �������
Exec CheckBookedClient; -- �������� ������� � ��������������� �����
Exec CheckOutClient -- �������� �������
----------------------------------------��������� ��������---------------------------------------------
Exec AddUser 'vanya.@mail.ru', 'password', 'ivan', 'grishin','375447777777'; -- ����������� �������
Exec ViewRoomTypes; -- �������� ����� �������
Exec ViewEmptyRooms 'double'; --- ���������� ��������� ������� �� ���� ������
Exec ViewServiceType; -- �������� ��������� ��������

Exec BookRoom; -- ������������ ������