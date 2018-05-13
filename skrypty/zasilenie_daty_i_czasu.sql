
--data
declare @start_data  date;
declare @end_data  date;
declare @data  date;
declare @hop integer;
set @start_data='1950-01-01'
set @end_data='2030-12-31'
set @data=@start_data;

while datediff(day,@data,@end_data)>-1
begin
insert into dbo.Date(YEAR,QUARTER,MONTH,WEEK,DAY,DOW,whole_data) 
values(convert(integer,DATEPART(YEAR,@DATA)),convert(integer,DATEPART(quarter,@DATA)),convert(integer,DATEPART(MONTH,@DATA)),convert(integer,DATEPART(week,@DATA)),convert(integer,DATEPART(DAY,@DATA)),convert(integer,DATEPART(weekday,@DATA)), CONVERT(varchar, @data, 105))
set @data=dateadd(day,1,@data)
end 

--czas
declare @time datetime;
set @time='01-01-2010 00:00:00';
while datepart(day,@time)<>'2'
begin
insert into dbo.time(hour_normal,hour_radio,minute) 
values (datepart(hour,@time),datepart(hour,@time),datepart(minute,@time))
set @time=dateadd(hour,1,@time)
end 


--zasilenie godziny radiowej
UPDATE dbo.time  
SET HOUR_RADIO =  CASE  
    WHEN HOUR_NORMAL = 0 THEN 24 
    WHEN HOUR_NORMAL = 1 THEN 25 
	ELSE  HOUR_NORMAL
END 

--ustawianie flagi informującej czy jest to dzień następny
UPDATE dbo.time  
SET FLAG =  CASE  
	WHEN HOUR_NORMAL = 0 OR HOUR_NORMAL = 1 THEN 1 
	ELSE 0
    END 

--zasilenie całkowitego czasu
UPDATE dbo.time
set whole_time = (CONVERT(VARCHAR,HOUR_RADIO)+':'+ SUBSTRING('0'+CONVERT(VARCHAR,MINUTE),LEN('0'+CONVERT(VARCHAR,MINUTE))-1,2)+':00')
