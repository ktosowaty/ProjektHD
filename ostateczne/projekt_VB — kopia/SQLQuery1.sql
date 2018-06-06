insert into groups(variable_name,group_name,value) 
select value2,value,value3 from rough  group by value,value2,value3,number having count(1)=1
select * from rough
select count(1) from rough
select count(1) from groups
truncate table rough
truncate table HD_PROJECT
delete from GROUPS
truncate table table_pivot

SELECT * FROM HD_PROJECT
SELECT COUNT(1)*6 FROM HD_PROJECT

select * from rough where value3 like ('%[%]%')

alter table groups drop column value
alter table groups alter column value float


delete  from date
