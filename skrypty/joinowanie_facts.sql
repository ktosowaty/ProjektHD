create table TABLE_PIVOT(Date varchar(50),
Channel varchar(50),
Description varchar(100),
second_Description varchar(100),
Start_time varchar(50),
Duration varchar(50),
Variable varchar(50),
Group2 varchar(50),
VALUE varchar(50));
select * from time
alter table time add whole_time varchar(50)
SELECT * FROM TABLE_PIVOT

ALTER TABLE TIME ADD FLAG CHAR(1)

--data trzeba poprawiæ
insert into FACTS_TABLE(channel_id,programme_id,start_time_id,duration,normal_date_id,time_id,radio_date_id,amr,[amr%],[SHR%],[RCH%],RCH,GROUP_ID) select (select channel_id,programme_id,start_time_id,duration,normal_date_id,time_id,radio_date_id,amr,[amr%],[SHR%],[RCH%],RCH,GROUP_ID 

select * 
from TABLE_PIVOT tp  
join channel c on (tp.Channel=c.CHANNEL_NAME ) 
join programme p on(tp.Description=p.DESCRIPTION and tp.second_Description=p.SECOND_DESCRIPTION) 
join GROUPS g on(tp.Group2=g.GROUP_NAME and tp.Variable=g.VARIABLE_NAME and tp.VALUE=g.VALUE) 
join time t on(t.whole_time=tp.Start_time) 
join date d1 on(tp.Date=d1.whole_data) 
join  date d2 on(dateadd(day,t.flag,convert(date,tp.Date))=tp.Date);


--dodac do tabeli time kolumne whole i do data whole data