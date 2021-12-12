use Hotel_complex;
----------------------------------------ѕроцедуры работника--------------------------------------
Exec Import_services_type_xml;															 -- импорт нового сервиса
Exec Export_rooms_xml;																   	 -- экспорт состо€ний номеров
Exec FindUserIndex 'asnowdon3g@blogger.com';											 -- ѕроверка на индексирование
Exec CheckFreeRoomView;																	 -- ѕросмотр представлени€ со свободными комнатами
Exec AddUser 'vanya.@mail.ru', 'password', 'ivan', 'grishin','37544777777777';			 -- ƒобавл€ет нового клиента
Exec CheckServices;																		-- просмотр заказанных сервисов
Exec CheckBookedRoom;																	-- просмотр забронированных номеров
Exec CheckBusyRoom;																		-- просмотр зан€тых номеров
Exec CheckClient 'thollingshead5@privacy.gov.au', '11.12.2021','11.01.2022','luxury';   --заселить клиента
Exec CheckBookedClient 9;																 -- заселить клиента в забронированный номер
Exec CheckOutClient  15;																-- выселить клиента
go
select dbo.CountEmptyRooms('twin');														--кол-во свободных номеров по типу
go
----------------------------------------ѕроцедуры клиентов---------------------------------------------
Exec AddUser 'vanya.@mail.ru', 'password', 'ivan', 'grishin','375447777777';			 -- –егистраци€ клиента
Exec ViewRoomTypes;																		-- ѕросмотр типов номеров
Exec ViewServiceType;																	-- просмотр доступных сервисов
Exec BookRoom 'test','11.01.2021','15.01.2021','twin';									-- бронирование номера
select dbo.CountEmptyRooms('twin');														--кол-во свободных номеров по типу