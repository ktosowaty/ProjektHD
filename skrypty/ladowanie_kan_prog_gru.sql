
--create table rough(value varchar(100),value2 varchar(100))
--DROP TABLE ROUGH

--zasilenie kana³ów
truncate table rough;
insert into rough(value) select distinct replace(channel,'"','') from hd_project where replace(channel,'"','') not in( select channel_name from channel);
insert into dbo.CHANNEL(channel_name) select value from dbo.rough;

--zasilanie programów
truncate table rough;
insert into rough(value,value2) select distinct replace(description,'"',''),replace(second_description,'"','') from hd_project;

MERGE INTO 
  PROGRAMME a
USING
  (SELECT * FROM rough) b
ON
  (a.description = b.value and a.second_description=b.value2)
when not matched then INSERT (description, second_description) values (b.value, b.value2);

--zasilenie grup
--update b³ednych liczb

UPDATE hd_project WITH(TABLOCKX) 
SET A16_49=replace(replace(replace(replace(A16_49,'%',''),'0,000','0'),',','.'),' ',''),
M16_49=replace(replace(replace(replace(M16_49,'%',''),'0,000','0'),',','.'),' ',''),
A4_15=replace(replace(replace(replace(A4_15,'%',''),'0,000','0'),',','.'),' ',''),
A4_9=replace(replace(replace(replace(A4_9,'%',''),'0,000','0'),',','.'),' ',''),
TOTAL_INDIVIDUALS=replace(replace(replace(replace(TOTAL_INDIVIDUALS,'%',''),'0,000','0'),',','.'),' ',''),
PODGRUPA=replace(replace(replace(replace(PODGRUPA,'%',''),'0,000','0'),',','.'),' ','');

--usuwa n.a
UPDATE hd_project WITH(TABLOCKX) SET A16_49='0.0'  where  A16_49 like('%n.a%') 
UPDATE hd_project WITH(TABLOCKX) set M16_49='0.0'  where  M16_49  like('%n.a%') 
UPDATE hd_project WITH(TABLOCKX) set A4_15='0.0'  where  A4_15  like('%n.a%') 
UPDATE hd_project WITH(TABLOCKX) SET A4_9='0.0'  where  A4_9  like('%n.a%') 
UPDATE hd_project WITH(TABLOCKX) SET TOTAL_INDIVIDUALS='0.0'  where  TOTAL_INDIVIDUALS  like('%n.a%') 
UPDATE hd_project WITH(TABLOCKX) SET PODGRUPA='0.0'  where  PODGRUPA  like('%n.a%') 

--zamienia na liczby bez spacji
UPDATE hd_project WITH(TABLOCKX) SET A16_49=SUBSTRING(A16_49,1,len(A16_49)-4)+SUBSTRING(A16_49,len(A16_49)-2,3) where TRY_CONVERT(money,replace(A16_49,' ','')) is  null
UPDATE hd_project WITH(TABLOCKX) SET M16_49=SUBSTRING(M16_49,1,len(M16_49)-4)+SUBSTRING(M16_49,len(M16_49)-2,3) where TRY_CONVERT(money,replace(M16_49,' ','')) is  null
UPDATE hd_project WITH(TABLOCKX) SET A4_15=SUBSTRING(A4_15,1,len(A4_15)-4)+SUBSTRING(A4_15,len(A4_15)-2,3) where TRY_CONVERT(money,replace(A4_15,' ','')) is  null
UPDATE hd_project WITH(TABLOCKX)SET A4_9=SUBSTRING(A4_9,1,len(A4_9)-4)+SUBSTRING(A4_9,len(A4_9)-2,3) where TRY_CONVERT(money,replace(A4_9,' ','')) is  null
UPDATE hd_project WITH(TABLOCKX) SET TOTAL_INDIVIDUALS=SUBSTRING(TOTAL_INDIVIDUALS,1,len(TOTAL_INDIVIDUALS)-4)+SUBSTRING(TOTAL_INDIVIDUALS,len(TOTAL_INDIVIDUALS)-2,3) where TRY_CONVERT(money,replace(TOTAL_INDIVIDUALS,' ','')) is  null
UPDATE hd_project WITH(TABLOCKX)SET PODGRUPA=SUBSTRING(PODGRUPA,1,len(PODGRUPA)-4)+SUBSTRING(PODGRUPA,len(PODGRUPA)-2,3) where TRY_CONVERT(money,replace(PODGRUPA,' ','')) is  null


alter table groups alter column value  money
--A16_49
TRUNCATE TABLE ROUGH
insert into rough(value,value2) select replace(VARIABLE,'"',''),A16_49  from hd_project;

MERGE INTO
  GROUPS a
USING
  (SELECT * FROM rough) b
ON
  (a.VARIABLE_NAME = b.value and a.VALUE=b.value2 and a.GROUP_NAME='A16-49')
when not matched then  INSERT (VARIABLE_NAME,GROUP_NAME,VALUE) values (b.value,'A16-49', b.value2);

--M16_49
TRUNCATE TABLE ROUGH
insert into rough(value,value2) select replace(VARIABLE,'"',''),M16_49  from hd_project;

MERGE INTO
  GROUPS a
USING
  (SELECT * FROM rough) b
ON
  (a.VARIABLE_NAME = b.value and a.VALUE=b.value2 and a.GROUP_NAME='M16_49')
when not matched then  INSERT (VARIABLE_NAME,GROUP_NAME,VALUE) values (b.value,'M16_49', b.value2);

--A4_15
TRUNCATE TABLE ROUGH
insert into rough(value,value2) select replace(VARIABLE,'"',''),A4_15  from hd_project;

MERGE INTO
  GROUPS a
USING
  (SELECT * FROM rough) b
ON
  (a.VARIABLE_NAME = b.value and a.VALUE=b.value2 and a.GROUP_NAME='A4_15')
when not matched then  INSERT (VARIABLE_NAME,GROUP_NAME,VALUE) values (b.value,'A4_15', b.value2);

--A4_9
TRUNCATE TABLE ROUGH
insert into rough(value,value2) select replace(VARIABLE,'"',''),A4_9  from hd_project;

MERGE INTO
  GROUPS a
USING
  (SELECT * FROM rough) b
ON
  (a.VARIABLE_NAME = b.value and a.VALUE=b.value2 and a.GROUP_NAME='A4_9')
when not matched then  INSERT (VARIABLE_NAME,GROUP_NAME,VALUE) values (b.value,'A4_9', b.value2);

--TOTAL_INDIVIDUALS
TRUNCATE TABLE ROUGH
insert into rough(value,value2) select replace(VARIABLE,'"',''),TOTAL_INDIVIDUALS  from hd_project;

MERGE INTO
  GROUPS a
USING
  (SELECT * FROM rough) b
ON
  (a.VARIABLE_NAME = b.value and a.VALUE=b.value2 and a.GROUP_NAME='TOTAL_INDIVIDUALS')
when not matched then  INSERT (VARIABLE_NAME,GROUP_NAME,VALUE) values (b.value,'TOTAL_INDIVIDUALS', b.value2);


--PODGRUPA
TRUNCATE TABLE ROUGH
insert into rough(value,value2) select replace(VARIABLE,'"',''),PODGRUPA  from hd_project;

MERGE INTO
  GROUPS a
USING
  (SELECT * FROM rough) b
ON
  (a.VARIABLE_NAME = b.value and a.VALUE=b.value2 and a.GROUP_NAME='PODGRUPA')
when not matched then  INSERT (VARIABLE_NAME,GROUP_NAME,VALUE) values (b.value,'PODGRUPA', b.value2);
SELECT * FROM HD_PROJECT

