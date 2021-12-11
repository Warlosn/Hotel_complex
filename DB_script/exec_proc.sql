use Hotel_complex;
----------------------------------------ѕроцедуры работника--------------------------------------
Exec Import_services_type_xml; -- импорт нового сервиса
Exec Export_rooms_xml; -- экспорт состо€ний номеров
Exec CheckFreeRoomView; -- ѕросмотр представлени€ со свободными комнатами
Exec AddUser 'vanya.@mail.ru', 'password', 'ivan', 'grishin','37544777777777'; -- ƒобавл€ет нового клиента
Exec ViewEmptyRooms 'double'; ---  оличество свободных номеров по типу номера
Exec CheckServices; -- просмотр заказанных сервисов
Exec CheckBookedRoom; -- просмотр забронированных номеров
Exec CheckBusyRoom; -- просмотр зан€тых номеров

Exec CheckClient; --заселить клиента
Exec CheckBookedClient; -- заселить клиента в забронированный номер
Exec CheckOutClient -- выселить клиента
----------------------------------------ѕроцедуры клиентов---------------------------------------------
Exec AddUser 'vanya.@mail.ru', 'password', 'ivan', 'grishin','375447777777'; -- –егистраци€ клиента
Exec ViewRoomTypes; -- ѕросмотр типов номеров
Exec ViewEmptyRooms 'double'; ---  оличество свободных номеров по типу номера
Exec ViewServiceType; -- просмотр доступных сервисов

Exec BookRoom; -- бронирование номера