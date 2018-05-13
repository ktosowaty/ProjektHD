

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
   CHANNEL_ID           INTEGER IDENTITY               not null,
   CHANNEL_NAME         varchar(50)                           null,
   constraint PK_CHANNEL primary key clustered (CHANNEL_ID)
);

/*==============================================================*/
/* Table: "DATE"                                                */
/*==============================================================*/
create table "DATE" 
(
   DATE_ID            INTEGER IDENTITY                        not null,
   YEAR               integer                        null,
   QUARTER            integer                        null,
   MONTH              integer                        null,
   DAY                integer                        null,
   WEEK				  integer                        null,
   DOW				  integer                        null,
   WHOLE_DATA		  varchar(50)					 null,
   constraint PK_DATE primary key clustered (DATE_ID)
);

/*==============================================================*/
/* Table: FACTS_TABLE                                           */
/*==============================================================*/
create table FACTS_TABLE 
(
   FACT_ID              integer                        not null,
   CHANNEL_ID           integer                        null,
   PROGRAMME_ID         integer                        null,
   START_TIME_ID        integer                        null,
   DURATION             integer                        null,
   NORMAL_DATE_ID       integer                        null,
   TIME_ID              integer                        null,
   RADIO_DATE_ID        integer                        null,
   AMR                  integer                        null,
   [AMR%]               integer                        null,
   [SHR%]               integer                        null,
   [RCH%]               integer                        null,
   [RCH]                integer                        null,
   GROUP_ID             integer                        null,
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
   GROUP_ID             INTEGER IDENTITY                        not null,
   VARIABLE_NAME        varchar(50)                            null,
   GROUP_NAME           varchar(50)                            null,
   VALUE                integer                        null,
   constraint PK_GROUPS primary key clustered (GROUP_ID)
);

/*==============================================================*/
/* Table: PROGRAMME                                             */
/*==============================================================*/
create table PROGRAMME 
(
   PROGRAMME_ID         INTEGER IDENTITY                        not null,
   DESCRIPTION          varchar(100)                            null,
   SECOND_DESCRIPTION      varchar(100)                            null,
   constraint PK_PROGRAMME primary key clustered (PROGRAMME_ID)
);

/*==============================================================*/
/* Table: "TIME"                                                */
/*==============================================================*/
create table "TIME" 
(
   TIME_ID              INTEGER IDENTITY               not null,
   HOUR_NORMAL          integer                        null,
   HOUR_RADIO           integer                        null,
   MINUTE               integer                        null,
   WHOLE_TIME			varchar(50)					   null,
   FLAG					integer     				   null,
   constraint PK_TIME primary key clustered (TIME_ID)
);

alter table FACTS_TABLE
   add constraint FK_FACTS_TA_RELATIONS_TIME foreign key (TIME_ID)
      references "TIME" (TIME_ID);

alter table FACTS_TABLE
   add constraint FK_FACTS_TA_RELATIONS_GROUPS foreign key (GROUP_ID)
      references GROUPS (GROUP_ID);

alter table FACTS_TABLE
   add constraint FK_FACTS_TA_RELATIONS_PROGRAMM foreign key (PROGRAMME_ID)
      references PROGRAMME (PROGRAMME_ID);

alter table FACTS_TABLE
   add constraint FK_FACTS_TA_RELATIONS_CHANNEL foreign key (CHANNEL_ID)
      references CHANNEL (CHANNEL_ID);

alter table FACTS_TABLE
   add constraint FK_FACTS_TA_RELATIONS_DATEl foreign key (RADIO_DATE_ID)
      references "DATE" (DATE_ID);

alter table FACTS_TABLE
   add constraint FK_FACTS_TA_RELATIONS_DATE foreign key (NORMAL_DATE_ID)
      references "DATE" (DATE_ID);

