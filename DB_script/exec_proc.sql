use Hotel_complex;
----------------------------------------��������� ���������--------------------------------------
Exec Import_services_type_xml;															 -- ������ ������ �������
Exec Export_rooms_xml;																   	 -- ������� ��������� �������
Exec FindUserIndex 'asnowdon3g@blogger.com';											 -- �������� �� ��������������
Exec CheckFreeRoomView;																	 -- �������� ������������� �� ���������� ���������
Exec AddUser 'vanya.@mail.ru', 'password', 'ivan', 'grishin','37544777777777';			 -- ��������� ������ �������
Exec CheckBookedRoom;																	-- �������� ��������������� �������
Exec CheckBusyRoom;																		-- �������� ������� �������
Exec CheckClient 'thollingshead5@privacy.gov.au', '11.12.2021','11.01.2022','luxury';   --�������� �������
Exec CheckBookedClient 1;																 -- �������� ������� � ��������������� �����
select dbo.CountEmptyRooms('twin');														--���-�� ��������� ������� �� ����
Exec CheckAddServices 1;																-- �������� ���������� ��������
Exec AddClientService 1,1;                                                              --�������� ������� ������
Exec CheckOutClient  15;																-- �������� �������
----------------------------------------��������� ��������---------------------------------------------
Exec AddUser 'vanya.@mail.ru', 'password', 'ivan', 'grishin','375447777777';			 -- ����������� �������
Exec ViewRoomTypes;																		-- �������� ����� �������
select dbo.CountEmptyRooms('twin');														--���-�� ��������� ������� �� ����
Exec ViewServiceType;																	-- �������� ��������� ��������
Exec BookRoom 'test','11.01.2021','15.01.2021','twin';									-- ������������ ������
