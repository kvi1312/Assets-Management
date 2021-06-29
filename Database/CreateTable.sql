/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     16/06/2021 09:19:49                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ASSET') and o.name = 'FK_ASSET_RELATIONS_ASSET_TY')
alter table ASSET
   drop constraint FK_ASSET_RELATIONS_ASSET_TY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ASSET_HAND_OVER_REALATIONSHIP') and o.name = 'FK_ASSET_HA_ASSET_HAN_ASSET')
alter table ASSET_HAND_OVER_REALATIONSHIP
   drop constraint FK_ASSET_HA_ASSET_HAN_ASSET
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ASSET_HAND_OVER_REALATIONSHIP') and o.name = 'FK_ASSET_HA_ASSET_HAN_HAND_OVE')
alter table ASSET_HAND_OVER_REALATIONSHIP
   drop constraint FK_ASSET_HA_ASSET_HAN_HAND_OVE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ASSET_REQUEST') and o.name = 'FK_ASSET_RE_RELATIONS_ASSET')
alter table ASSET_REQUEST
   drop constraint FK_ASSET_RE_RELATIONS_ASSET
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ASSET_REQUEST') and o.name = 'FK_ASSET_RE_RELATIONS_REQUEST_')
alter table ASSET_REQUEST
   drop constraint FK_ASSET_RE_RELATIONS_REQUEST_
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ASSET_REQUEST') and o.name = 'FK_ASSET_RE_SEND_REQU_USER')
alter table ASSET_REQUEST
   drop constraint FK_ASSET_RE_SEND_REQU_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ASSET_USER_RELATIONSHIP') and o.name = 'FK_ASSET_US_RELATIONS_ASSET')
alter table ASSET_USER_RELATIONSHIP
   drop constraint FK_ASSET_US_RELATIONS_ASSET
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ASSET_USER_RELATIONSHIP') and o.name = 'FK_ASSET_US_RELATIONS_USER')
alter table ASSET_USER_RELATIONSHIP
   drop constraint FK_ASSET_US_RELATIONS_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('HAND_OVER') and o.name = 'FK_HAND_OVE_RECV_HAND_USER')
alter table HAND_OVER
   drop constraint FK_HAND_OVE_RECV_HAND_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('HAND_OVER') and o.name = 'FK_HAND_OVE_SEND_HAND_USER')
alter table HAND_OVER
   drop constraint FK_HAND_OVE_SEND_HAND_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('"USER"') and o.name = 'FK_USER_RELATIONS_USER_TYP')
alter table "USER"
   drop constraint FK_USER_RELATIONS_USER_TYP
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('"USER"') and o.name = 'FK_USER_RELATIONS_ASSET')
alter table "USER"
   drop constraint FK_USER_RELATIONS_ASSET
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ASSET')
            and   name  = 'RELATIONSHIP_1_FK'
            and   indid > 0
            and   indid < 255)
   drop index ASSET.RELATIONSHIP_1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ASSET')
            and   type = 'U')
   drop table ASSET
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ASSET_HAND_OVER_REALATIONSHIP')
            and   name  = 'ASSET_HAND_OVER_REALATIONSHIP2_FK'
            and   indid > 0
            and   indid < 255)
   drop index ASSET_HAND_OVER_REALATIONSHIP.ASSET_HAND_OVER_REALATIONSHIP2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ASSET_HAND_OVER_REALATIONSHIP')
            and   name  = 'ASSET_HAND_OVER_REALATIONSHIP_FK'
            and   indid > 0
            and   indid < 255)
   drop index ASSET_HAND_OVER_REALATIONSHIP.ASSET_HAND_OVER_REALATIONSHIP_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ASSET_HAND_OVER_REALATIONSHIP')
            and   type = 'U')
   drop table ASSET_HAND_OVER_REALATIONSHIP
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ASSET_REQUEST')
            and   name  = 'RELATIONSHIP_9_FK'
            and   indid > 0
            and   indid < 255)
   drop index ASSET_REQUEST.RELATIONSHIP_9_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ASSET_REQUEST')
            and   name  = 'RELATIONSHIP_7_FK'
            and   indid > 0
            and   indid < 255)
   drop index ASSET_REQUEST.RELATIONSHIP_7_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ASSET_REQUEST')
            and   name  = 'SEND_REQUEST_FK'
            and   indid > 0
            and   indid < 255)
   drop index ASSET_REQUEST.SEND_REQUEST_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ASSET_REQUEST')
            and   type = 'U')
   drop table ASSET_REQUEST
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ASSET_TYPE')
            and   type = 'U')
   drop table ASSET_TYPE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ASSET_USER_RELATIONSHIP')
            and   name  = 'RELATIONSHIP_11_FK'
            and   indid > 0
            and   indid < 255)
   drop index ASSET_USER_RELATIONSHIP.RELATIONSHIP_11_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ASSET_USER_RELATIONSHIP')
            and   name  = 'RELATIONSHIP_10_FK'
            and   indid > 0
            and   indid < 255)
   drop index ASSET_USER_RELATIONSHIP.RELATIONSHIP_10_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ASSET_USER_RELATIONSHIP')
            and   type = 'U')
   drop table ASSET_USER_RELATIONSHIP
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('HAND_OVER')
            and   name  = 'RECV_HAND_OVER_FK'
            and   indid > 0
            and   indid < 255)
   drop index HAND_OVER.RECV_HAND_OVER_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('HAND_OVER')
            and   name  = 'SEND_HAND_OVER_FK'
            and   indid > 0
            and   indid < 255)
   drop index HAND_OVER.SEND_HAND_OVER_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('HAND_OVER')
            and   type = 'U')
   drop table HAND_OVER
go

if exists (select 1
            from  sysobjects
           where  id = object_id('REQUEST_TYPE')
            and   type = 'U')
   drop table REQUEST_TYPE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('"USER"')
            and   name  = 'RELATIONSHIP_12_FK'
            and   indid > 0
            and   indid < 255)
   drop index "USER".RELATIONSHIP_12_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('"USER"')
            and   name  = 'RELATIONSHIP_8_FK'
            and   indid > 0
            and   indid < 255)
   drop index "USER".RELATIONSHIP_8_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"USER"')
            and   type = 'U')
   drop table "USER"
go

if exists (select 1
            from  sysobjects
           where  id = object_id('USER_TYPE')
            and   type = 'U')
   drop table USER_TYPE
go

/*==============================================================*/
/* Table: ASSET                                                 */
/*==============================================================*/
create table ASSET (
   AS_ID                int               not null,
   AT_ID                int               not null,
   AS_NAME              nvarchar(256)         null,
   AS_STATUS            nvarchar(256)         null,
   AS_PURCHASE_DATE     datetime             null,
   AS_PROVIDER          nvarchar(512)         null,
   AS_DESCRIPTION       nvarchar(1024)        null,
   AS_VALUE             int               null,
   AS_FLAG              bit                  null,
   constraint PK_ASSET primary key nonclustered (AS_ID)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on ASSET (
AT_ID ASC
)
go

/*==============================================================*/
/* Table: ASSET_HAND_OVER_REALATIONSHIP                         */
/*==============================================================*/
create table ASSET_HAND_OVER_REALATIONSHIP (
   AS_ID                int               not null,
   HO_ID                int               not null,
   constraint PK_ASSET_HAND_OVER_REALATIONSH primary key (AS_ID, HO_ID)
)
go

/*==============================================================*/
/* Index: ASSET_HAND_OVER_REALATIONSHIP_FK                      */
/*==============================================================*/
create index ASSET_HAND_OVER_REALATIONSHIP_FK on ASSET_HAND_OVER_REALATIONSHIP (
AS_ID ASC
)
go

/*==============================================================*/
/* Index: ASSET_HAND_OVER_REALATIONSHIP2_FK                     */
/*==============================================================*/
create index ASSET_HAND_OVER_REALATIONSHIP2_FK on ASSET_HAND_OVER_REALATIONSHIP (
HO_ID ASC
)
go

/*==============================================================*/
/* Table: ASSET_REQUEST                                         */
/*==============================================================*/
create table ASSET_REQUEST (
   AR_ID                int               not null,
   U_ID                 int               not null,
   RT_ID                int               not null,
   AS_ID                int               not null,
   AR_REASON            nvarchar(256)         null,
   AR_ASSET_STATUS      nvarchar(1024)        null,
   AR_REQUEST_DATE      datetime             null,
   AR_APPROVE_DATE      datetime             null,
   AR_STATUS            nvarchar(256)         null,
   constraint PK_ASSET_REQUEST primary key nonclustered (AR_ID)
)
go

/*==============================================================*/
/* Index: SEND_REQUEST_FK                                       */
/*==============================================================*/
create index SEND_REQUEST_FK on ASSET_REQUEST (
U_ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_7_FK on ASSET_REQUEST (
AS_ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_9_FK on ASSET_REQUEST (
RT_ID ASC
)
go

/*==============================================================*/
/* Table: ASSET_TYPE                                            */
/*==============================================================*/
create table ASSET_TYPE (
   AT_ID                int               not null,
   AT_NAME              nvarchar(256)         null,
   AT_CODE              nvarchar(256)         null,
   constraint PK_ASSET_TYPE primary key nonclustered (AT_ID)
)
go

/*==============================================================*/
/* Table: ASSET_USER_RELATIONSHIP                               */
/*==============================================================*/
create table ASSET_USER_RELATIONSHIP (
   ASSET_USER_RELATIONSHIP_ID int               not null,
   AS_ID                int               not null,
   U_ID                 int               not null,
   RECEIVE_DATE         datetime             null,
   constraint PK_ASSET_USER_RELATIONSHIP primary key nonclustered (ASSET_USER_RELATIONSHIP_ID)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_10_FK on ASSET_USER_RELATIONSHIP (
AS_ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_11_FK on ASSET_USER_RELATIONSHIP (
U_ID ASC
)
go

/*==============================================================*/
/* Table: HAND_OVER                                             */
/*==============================================================*/
create table HAND_OVER (
   HO_ID                int               not null,
   U_ID                 int               not null,
   USE_U_ID             int               not null,
   HO_DATE              datetime             null,
   HO_CONTEXT           ntext                 null,
   constraint PK_HAND_OVER primary key nonclustered (HO_ID)
)
go

/*==============================================================*/
/* Index: SEND_HAND_OVER_FK                                     */
/*==============================================================*/
create index SEND_HAND_OVER_FK on HAND_OVER (
U_ID ASC
)
go

/*==============================================================*/
/* Index: RECV_HAND_OVER_FK                                     */
/*==============================================================*/
create index RECV_HAND_OVER_FK on HAND_OVER (
USE_U_ID ASC
)
go

/*==============================================================*/
/* Table: REQUEST_TYPE                                          */
/*==============================================================*/
create table REQUEST_TYPE (
   RT_ID                int               not null,
   RT_NAME              nvarchar(256)         null,
   RT_CODE              nvarchar(256)         null,
   constraint PK_REQUEST_TYPE primary key nonclustered (RT_ID)
)
go

/*==============================================================*/
/* Table: "USER"                                                */
/*==============================================================*/
create table "USER" (
   U_ID                 int               not null,
   AS_ID                int               null,
   UT_ID                int               not null,
   U_USERNAME           nvarchar(256)         null,
   U_PASSWORD           nvarchar(256)         null,
   U_FULLNAME           nvarchar(256)         null,
   U_WORK_DATE          datetime             null,
   U_STATUS             nvarchar(256)         null,
   U_POSITION           nvarchar(256)         null,
   U_DEPARTMENT         nvarchar(256)         null,
   U_FLAG               bit                  null,
   constraint PK_USER primary key nonclustered (U_ID)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_8_FK on "USER" (
AS_ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_12_FK on "USER" (
UT_ID ASC
)
go

/*==============================================================*/
/* Table: USER_TYPE                                             */
/*==============================================================*/
create table USER_TYPE (
   UT_ID                int               not null,
   UT_ROLE              nvarchar(256)         null,
   constraint PK_USER_TYPE primary key nonclustered (UT_ID)
)
go

alter table ASSET
   add constraint FK_ASSET_RELATIONS_ASSET_TY foreign key (AT_ID)
      references ASSET_TYPE (AT_ID)
go

alter table ASSET_HAND_OVER_REALATIONSHIP
   add constraint FK_ASSET_HA_ASSET_HAN_ASSET foreign key (AS_ID)
      references ASSET (AS_ID)
go

alter table ASSET_HAND_OVER_REALATIONSHIP
   add constraint FK_ASSET_HA_ASSET_HAN_HAND_OVE foreign key (HO_ID)
      references HAND_OVER (HO_ID)
go

alter table ASSET_REQUEST
   add constraint FK_ASSET_RE_RELATIONS_ASSET foreign key (AS_ID)
      references ASSET (AS_ID)
go

alter table ASSET_REQUEST
   add constraint FK_ASSET_RE_RELATIONS_REQUEST_ foreign key (RT_ID)
      references REQUEST_TYPE (RT_ID)
go

alter table ASSET_REQUEST
   add constraint FK_ASSET_RE_SEND_REQU_USER foreign key (U_ID)
      references "USER" (U_ID)
go

alter table ASSET_USER_RELATIONSHIP
   add constraint FK_ASSET_US_RELATIONS_ASSET foreign key (AS_ID)
      references ASSET (AS_ID)
go

alter table ASSET_USER_RELATIONSHIP
   add constraint FK_ASSET_US_RELATIONS_USER foreign key (U_ID)
      references "USER" (U_ID)
go

alter table HAND_OVER
   add constraint FK_HAND_OVE_RECV_HAND_USER foreign key (USE_U_ID)
      references "USER" (U_ID)
go

alter table HAND_OVER
   add constraint FK_HAND_OVE_SEND_HAND_USER foreign key (U_ID)
      references "USER" (U_ID)
go

alter table "USER"
   add constraint FK_USER_RELATIONS_USER_TYP foreign key (UT_ID)
      references USER_TYPE (UT_ID)
go

alter table "USER"
   add constraint FK_USER_RELATIONS_ASSET foreign key (AS_ID)
      references ASSET (AS_ID)
go
