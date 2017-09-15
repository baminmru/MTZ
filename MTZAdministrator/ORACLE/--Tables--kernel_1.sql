


 


drop table sysoptions
;
create table sysoptions(
sysoptionsID CHAR (38) primary key,
Name char varying(255) null,
TheValue char  varying(255) null,
OptionType Char  varying(255) null
)
;
drop table typelist
;
create  table typelist(
typelistID CHAR(38) primary key  ,
Name char  varying(255) not null,
SecurityStyleID CHAR(38) null, 
RegisterProc char  varying(255) null,
DeleteProc char  varying(255) null,
HCLProc char  varying(255) null ,
PropagateProc char  varying(255) null 
)
;
drop table Instance
;
create table Instance(
InstanceID CHAR(38) not null primary key,
LockUserID CHAR(38) null, 
LockSessionID CHAR(38) null, 
SecurityStyleID CHAR(38) null, 
Name char  varying(255) null,
ObjType char  varying(255) null
)
;
alter table instance add OwnerPartName char  varying(255) null
;
alter table instance add OwnerRowID CHAR(38) null
;
alter  table instance add status CHAR  varying(38) null
;
alter  table instance add archived numeric null
;
drop table QueryResult
;
CREATE TABLE QueryResult (
  QueryResultid CHAR(38) NOT NULL ,
  result CHAR  varying(38) NULL 
)
;
drop table RPRESULT
;
CREATE TABLE RPRESULT (
  RPRESULTID CHAR(38) NOT NULL ,
  PARENTLEVEL numeric NOT NULL ,
  PARTNAME char  varying(255) NULL ,
  THEROWID CHAR (38) NULL 
);






