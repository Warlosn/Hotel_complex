use Hotel_complex;
----------------------------------------��������� ���������--------------------------------------
Exec FindUserIndex 'sdelgardo33@google.it';											 -- �������� �� ��������������
Exec CheckFreeRoomView;																	 -- �������� ������������� �� ���������� ���������
Exec AddUser 'vanya.@mail.ru', 'password', 'ivan', 'grishin','37544777777777';			 -- ��������� ������ �������
Exec CheckBookedRoom;																	-- �������� ��������������� �������
Exec CheckBusyRoom;																		-- �������� ������� �������
Exec CheckClient 'sdelgardo33@google.it', '11.01.2022','11.01.2022','single';   --�������� �������
Exec CheckBookedClient 1;																 -- �������� ������� � ��������������� �����
select dbo.CountEmptyRooms('single');														--���-�� ��������� ������� �� ����
Exec CheckAddServices 1;																-- �������� ���������� ��������
Exec AddClientService 1,2;                                                              --�������� ������� ������
Exec CheckOutClient 1;																-- �������� �������
----------------------------------------��������� ��������---------------------------------------------
Exec AddUser 'vanya.grishin.@mail.ru', 'password', 'ivan', 'grishin','375447777777';	 -- ����������� �������
Exec ViewRoomTypes;																		-- �������� ����� �������
select dbo.CountEmptyRooms('single');														--���-�� ��������� ������� �� ����
Exec ViewServiceType;																	-- �������� ��������� ��������
Exec BookRoom 'sdelgardo33@google.it','17.12.2021','19.12.2021','single';									-- ������������ ������
