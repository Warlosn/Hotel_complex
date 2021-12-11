use Hotel_complex;

drop procedure Import_services_type_xml;
drop procedure Export_rooms_xml;
-----------------------------------IMPORT SERVICE_TYPE FROM XML--------------------------------
go
Create Procedure Import_services_type_xml
AS
Begin
	INSERT INTO Services_type (services_type_name,services_type_price)
	SELECT
	   MY_XML.Service_type.query('services_type_name').value('.', 'VARCHAR(20)'),
	   MY_XML.Service_type.query('services_type_price').value('.', 'float')
	FROM (SELECT CAST(MY_XML AS xml)
		  FROM OPENROWSET(BULK 'D:\GitHub\Hotel_complex\anyFiles\for_import.xml', SINGLE_BLOB) AS T(MY_XML)) AS T(MY_XML)
		  CROSS APPLY MY_XML.nodes('Services_type/Service_type') AS MY_XML (Service_type);
End;
go
-----------------------------------EXPORT ROOMS TO XML--------------------------------
go
create procedure Export_rooms_xml
as
begin
EXEC master.dbo.sp_configure 'show advanced options', 1
		reconfigure with override;
	EXEC master .dbo.sp_configure 'xp_cmdshell', 1
		reconfigure with override;

declare @fileName nvarchar(100);
	declare @sqlStr varchar(1000);
	declare @sqlCmd varchar(1000);

	set @fileName = 'D:\GitHub\Hotel_complex\anyFiles\for_export.xml';
	set @sqlStr = 'USE Hotel_complex; SELECT room_id, room_number, room_idType, room_isFree from Rooms FOR XML PATH(''ROOM''), ROOT(''ROOMS'') '
	set @sqlCmd = 'bcp.exe "' + @sqlStr + '" queryout ' + @fileName + ' -w -T -S "DESKTOP-E4TFQEB\MSSQLSERVER02"'
	EXEC xp_cmdshell @sqlCmd;
end;
go
-------------------------------------------------------------------------------------------
go

go
