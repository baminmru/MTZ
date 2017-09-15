
/* --kernel*/

 

-- Kernel Tables --
drop table sysoptions
;
create table sysoptions(
sysoptionsID CHAR(38) primary key,
Name varchar(255) null,
TheValue varchar(255) null,
OptionType varchar(255) null
)
;
drop table typelist
;
create  table typelist(
typelistID CHAR(38) primary key  ,
Name varchar(255) not null,
SecurityStyleID CHAR(38) null, 
RegisterProc varchar(255) null,
DeleteProc varchar(255) null,
HCLProc varchar(255) null ,
PropagateProc varchar(255) null 
)
;
drop table Instance
;
create table Instance(
InstanceID CHAR(38) not null primary key,
LockUserID CHAR(38) null, 
LockSessionID CHAR(38) null, 
SecurityStyleID CHAR(38) null, 
Name varchar(255) null,
ObjType varchar(255) null
)
;
alter table instance add OwnerPartName varchar(255) null
;
alter table instance add OwnerRowID CHAR(38) null
;
alter  table instance add status CHAR(38) null
;
alter  table instance add archived numeric null
;
drop table QueryResult
;
CREATE TABLE QueryResult (
  QueryResultid CHAR(38) NOT NULL ,
  result CHAR(38) NULL 
)
;
drop table RPRESULT
;
CREATE TABLE RPRESULT (
  RPRESULTID CHAR(38) NOT NULL ,
  PARENTLEVEL numeric NOT NULL ,
  PARTNAME varchar (255) NULL ,
  THEROWID CHAR(38) NULL 
)
;




