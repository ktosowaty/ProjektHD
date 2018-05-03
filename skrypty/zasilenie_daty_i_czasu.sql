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
insert into dbo.Date(YEAR,QUARTER,MONTH,WEEK,DAY,DOW) 
values(convert(integer,DATEPART(YEAR,@DATA)),convert(integer,DATEPART(quarter,@DATA)),convert(integer,DATEPART(MONTH,@DATA)),convert(integer,DATEPART(week,@DATA)),convert(integer,DATEPART(DAY,@DATA)),convert(integer,DATEPART(weekday,@DATA)))
set @data=dateadd(day,1,@data)
end 

--czas
declare @time datetime;
set @time='01-01-2010 00:00:00';
while datepart(day,@time)<>'2'
begin
insert into dbo.time(hour_normal,hour_radio,minute) 
values (datepart(hour,@time),datepart(hour,DATEADD(hour,2,@time)),datepart(minute,@time))
set @time=dateadd(minute,1,@time)
end 
