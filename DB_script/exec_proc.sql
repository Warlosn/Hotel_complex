use Hotel_complex;
----------------------------------------Процедуры работника--------------------------------------
Exec FindUserIndex 'sdelgardo33@google.it';											 -- Проверка на индексирование
Exec CheckFreeRoomView;																	 -- Просмотр представления со свободными комнатами
Exec AddUser 'vanya.@mail.ru', 'password', 'ivan', 'grishin','37544777777777';			 -- Добавляет нового клиента
Exec CheckBookedRoom;																	-- просмотр забронированных номеров
Exec CheckBusyRoom;																		-- просмотр занятых номеров
Exec CheckClient 'sdelgardo33@google.it', '11.01.2022','11.01.2022','single';   --заселить клиента
Exec CheckBookedClient 1;																 -- заселить клиента в забронированный номер
select dbo.CountEmptyRooms('single');														--кол-во свободных номеров по типу
Exec CheckAddServices 1;																-- просмотр заказанных сервисов
Exec AddClientService 1,2;                                                              --добавить клиенту сервис
Exec CheckOutClient 1;																-- выселить клиента
----------------------------------------Процедуры клиентов---------------------------------------------
Exec AddUser 'vanya.grishin.@mail.ru', 'password', 'ivan', 'grishin','375447777777';	 -- Регистрация клиента
Exec ViewRoomTypes;																		-- Просмотр типов номеров
select dbo.CountEmptyRooms('single');														--кол-во свободных номеров по типу
Exec ViewServiceType;																	-- просмотр доступных сервисов
Exec BookRoom 'sdelgardo33@google.it','17.12.2021','19.12.2021','single';									-- бронирование номера
