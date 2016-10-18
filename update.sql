use Azgard
go

delete from dbo.call_data_recordings where convert(varchar(6),call_datetime,112) = '201609'
go

insert into dbo.call_data_recordings
select subscriber_number, subscriber_name, cast(call_date + ' ' + call_time as datetime) as call_datetime, call_direction, remote_number, remote_name, dialed_number, dialed_name, ring_time, talk_time
from dbo.cdr
go

update dbo.call_data_recordings
set		call_datetime = 
		(
			case
				when call_datetime >= '01/01/2016 00:00:00' and call_datetime <= '03/09/2016 01:59:59' then dateadd(hh,-8,call_datetime)
				when call_datetime >= '03/09/2016 02:00:00' and call_datetime <= '11/02/2016 01:59:59' then dateadd(hh,-7,call_datetime) 
				when call_datetime >= '11/02/2016 02:00:00' and call_datetime <= '12/31/2016 11:59:59' then dateadd(hh,-8,call_datetime) 
				
			end
		)
where		convert(varchar(6),call_datetime,112) = '201609' 
go


truncate table dbo.cdr
go
