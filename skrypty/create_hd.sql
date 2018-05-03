/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     06.04.2018 21:52:41                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_FACTS_TA_RELATIONS_TIME') then
    alter table FACTS_TABLE
       delete foreign key FK_FACTS_TA_RELATIONS_TIME
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_FACTS_TA_RELATIONS_GROUPS') then
    alter table FACTS_TABLE
       delete foreign key FK_FACTS_TA_RELATIONS_GROUPS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_FACTS_TA_RELATIONS_PROGRAMM') then
    alter table FACTS_TABLE
       delete foreign key FK_FACTS_TA_RELATIONS_PROGRAMM
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_FACTS_TA_RELATIONS_CHANNEL') then
    alter table FACTS_TABLE
       delete foreign key FK_FACTS_TA_RELATIONS_CHANNEL
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_FACTS_TA_RELATIONS_DATEl') then
    alter table FACTS_TABLE
       delete foreign key FK_FACTS_TA_RELATIONS_DATEl
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_FACTS_TA_RELATIONS_DATE') then
    alter table FACTS_TABLE
       delete foreign key FK_FACTS_TA_RELATIONS_DATE
end if;

drop table if exists CHANNEL;

drop table if exists "DATE";

drop index if exists FACTS_TABLE.Relationship_3_FK;

drop table if exists FACTS_TABLE;

drop table if exists GROUPS;

drop table if exists PROGRAMME;

drop table if exists "TIME";

/*==============================================================*/
/* Table: CHANNEL                                               */
/*==============================================================*/
create table CHANNEL 
(
   CHANNEL_ID           numeric                        not null,
   CHANNEL_NAME         text                           null,
   constraint PK_CHANNEL primary key clustered (CHANNEL_ID)
);

/*==============================================================*/
/* Table: "DATE"                                                */
/*==============================================================*/
create table "DATE" 
(
   DATE_ID              numeric                        not null,
   ROK                  integer                        null,
   MIESIAC              integer                        null,
   DZIEN                integer                        null,
   constraint PK_DATE primary key clustered (DATE_ID)
);

/*==============================================================*/
/* Table: FACTS_TABLE                                           */
/*==============================================================*/
create table FACTS_TABLE 
(
   FACT_ID              numeric                        not null,
   CHANNEL_ID           numeric                        null,
   PROGRAMME_ID         numeric                        null,
   START_TIME_ID        numeric                        null,
   DURATION             numeric                        null,
   NORMAL_DATE_ID       numeric                        null,
   TIME_ID              numeric                        null,
   RADIO_DATE_ID        numeric                        null,
   AMR                  integer                        null,
   AMR%                 numeric(0)                     null,
   SHR%                 numeric(0)                     null,
   RCH%                 numeric(0)                     null,
   RCH                  integer                        null,
   GROUP_ID             numeric                        null,
   constraint PK_FACTS_TABLE primary key clustered (FACT_ID)
);

/*==============================================================*/
/* Index: Relationship_3_FK                                     */
/*==============================================================*/
create index Relationship_3_FK on FACTS_TABLE (
PROGRAMME_ID ASC
);

/*==============================================================*/
/* Table: GROUPS                                                */
/*==============================================================*/
create table GROUPS 
(
   GROUP_ID             numeric                        not null,
   VARIABLE_NAME        text                           null,
   GROUP_NAME           text                           null,
   VALUE                money                        null,
   constraint PK_GROUPS primary key clustered (GROUP_ID)
);

/*==============================================================*/
/* Table: PROGRAMME                                             */
/*==============================================================*/
create table PROGRAMME 
(
   PROGRAMME_ID         numeric                        not null,
   DESCRIPTION          text                           null,
   2ND_DESCRIPTION      text                           null,
   constraint PK_PROGRAMME primary key clustered (PROGRAMME_ID)
);

/*==============================================================*/
/* Table: "TIME"                                                */
/*==============================================================*/
create table "TIME" 
(
   TIME_ID              numeric                        not null,
   HOUR_NORMAL          integer                        null,
   HOUR_RADIO           integer                        null,
   MINUTE               integer                        null,
   SECOND               integer                        null,
   constraint PK_TIME primary key clustered (TIME_ID)
);

alter table FACTS_TABLE
   add constraint FK_FACTS_TA_RELATIONS_TIME foreign key (TIME_ID)
      references "TIME" (TIME_ID)
      on update restrict
      on delete restrict;

alter table FACTS_TABLE
   add constraint FK_FACTS_TA_RELATIONS_GROUPS foreign key (GROUP_ID)
      references GROUPS (GROUP_ID)
      on update restrict
      on delete restrict;

alter table FACTS_TABLE
   add constraint FK_FACTS_TA_RELATIONS_PROGRAMM foreign key (PROGRAMME_ID)
      references PROGRAMME (PROGRAMME_ID)
      on update restrict
      on delete restrict;

alter table FACTS_TABLE
   add constraint FK_FACTS_TA_RELATIONS_CHANNEL foreign key (CHANNEL_ID)
      references CHANNEL (CHANNEL_ID)
      on update restrict
      on delete restrict;

alter table FACTS_TABLE
   add constraint FK_FACTS_TA_RELATIONS_DATEl foreign key (RADIO_DATE_ID)
      references "DATE" (DATE_ID)
      on update restrict
      on delete restrict;

alter table FACTS_TABLE
   add constraint FK_FACTS_TA_RELATIONS_DATE foreign key (NORMAL_DATE_ID)
      references "DATE" (DATE_ID)
      on update restrict
      on delete restrict;

