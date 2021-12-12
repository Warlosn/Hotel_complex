use Hotel_complex;
----------------------------------------Процедуры работника--------------------------------------
Exec Import_services_type_xml;															 -- импорт нового сервиса
Exec Export_rooms_xml;																   	 -- экспорт состояний номеров
Exec FindUserIndex 'asnowdon3g@blogger.com';											 -- Проверка на индексирование
Exec CheckFreeRoomView;																	 -- Просмотр представления со свободными комнатами
Exec AddUser 'vanya.@mail.ru', 'password', 'ivan', 'grishin','37544777777777';			 -- Добавляет нового клиента
Exec CheckBookedRoom;																	-- просмотр забронированных номеров
Exec CheckBusyRoom;																		-- просмотр занятых номеров
Exec CheckClient 'thollingshead5@privacy.gov.au', '11.12.2021','11.01.2022','luxury';   --заселить клиента
Exec CheckBookedClient 1;																 -- заселить клиента в забронированный номер
select dbo.CountEmptyRooms('twin');														--кол-во свободных номеров по типу
Exec CheckAddServices 1;																-- просмотр заказанных сервисов
Exec AddClientService 1,1;                                                              --добавить клиенту сервис
Exec CheckOutClient  15;																-- выселить клиента
----------------------------------------Процедуры клиентов---------------------------------------------
Exec AddUser 'vanya.@mail.ru', 'password', 'ivan', 'grishin','375447777777';			 -- Регистрация клиента
Exec ViewRoomTypes;																		-- Просмотр типов номеров
select dbo.CountEmptyRooms('twin');														--кол-во свободных номеров по типу
Exec ViewServiceType;																	-- просмотр доступных сервисов
Exec BookRoom 'test','11.01.2021','15.01.2021','twin';									-- бронирование номера
