
/* --body*/

 

/*������ ����� �������*/
drop table FilterFieldGroup/*������ ����� �������*/ 
;
create table FilterFieldGroup/*������ ����� �������*/ (
InstanceID CHAR(38) ,
FilterFieldGroupid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table FilterFieldGroup add 
sequence
 integer null /* ������������������ */
;
alter  table FilterFieldGroup add 
Name
 VARCHAR (64) null /* �������� */
;
alter  table FilterFieldGroup add 
Caption
 VARCHAR (255) null /* ��������� */
;
alter  table FilterFieldGroup add 
AllowIgnore null 
 check (AllowIgnore in ( -1/* �� */
, 0/* ��� */ )) /* ����� ��������� */
;


/*���� �������*/
drop table FileterField/*���� �������*/ 
;
create table FileterField/*���� �������*/ (
ParentStructRowID CHAR(38) not null,
FileterFieldid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table FileterField add 
sequence
 integer null /* ������������������ */
;
alter  table FileterField add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table FileterField add 
Caption
 VARCHAR (255) null /* ��������� */
;
alter  table FileterField add 
FieldType null /* ��� ���� */
;
alter  table FileterField add 
FieldSize
 integer null /* ������ */
;
alter  table FileterField add 
RefType
 INTEGER null 
 check (RefType in ( 2/* �� ������ ������� */
, 3/* �� �������� ������ */
, 0/* ��������� ���� ( �� ������) */
, 1/* �� ������  */ )) /* ��� ������ */
;
alter  table FileterField add 
RefToType null /* ���, ���� ��������� */
;
alter  table FileterField add 
RefToPart null /* ������, ���� ��������� */
;
alter  table FileterField add 
ValueArray null 
 check (ValueArray in ( -1/* �� */
, 0/* ��� */ )) /* ������ �������� */
;


/*������*/
drop table Filters/*������*/ 
;
create table Filters/*������*/ (
InstanceID CHAR(38) ,
Filtersid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table Filters add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table Filters add 
TheCaption
 VARCHAR (80) null /* ��������� */
;
alter  table Filters add 
TheComment null /* �������� */
;


/*�������� �����*/
drop table PEK103_DEF/*�������� �����*/ 
;
create table PEK103_DEF/*�������� �����*/ (
InstanceID CHAR(38) ,
PEK103_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEK103_DEF add 
TheNumber
 integer null /* ����� */
;
alter  table PEK103_DEF add 
Sender null /* ����������� */
;
alter  table PEK103_DEF add 
RcvDate
 DATETIME null /* ���� ������ ������ */
;
alter  table PEK103_DEF add 
Coment null /* ���������� */
;
alter  table PEK103_DEF add 
NodeDate
 DATETIME null /* ���� �������  */
;
alter  table PEK103_DEF add 
PEKZ null /* ������ */
;
alter  table PEK103_DEF add 
ThePath null /* ������ �������� */
;


/*C����� �����*/
drop table PEK103_LINES/*C����� �����*/ 
;
create table PEK103_LINES/*C����� �����*/ (
InstanceID CHAR(38) ,
PEK103_LINESid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEK103_LINES add 
Seqence
 integer null /* � �\� */
;
alter  table PEK103_LINES add 
IndexTo null /* ������� ���������� */
;
alter  table PEK103_LINES add 
Reciever
 VARCHAR (255) null /* ���������� */
;
alter  table PEK103_LINES add 
Weight null /* ��� */
;
alter  table PEK103_LINES add 
WeightEDIZM null /* ��. ���. ���� */
;
alter  table PEK103_LINES add 
Quantity null /* ���������� */
;
alter  table PEK103_LINES add 
Cost null /* ��������� ��������� */
;
alter  table PEK103_LINES add 
PPOCode
 VARCHAR (14) null /* ��� ����������� */
;


/*����� ���������*/
drop table WEBC_BLOCK/*����� ���������*/ 
;
create table WEBC_BLOCK/*����� ���������*/ (
InstanceID CHAR(38) ,
WEBC_BLOCKid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBC_BLOCK add 
name
 VARCHAR (255) null /* �������� ����� */
;
alter  table WEBC_BLOCK add 
Info null /* ���������� */
;


/*�������*/
drop table WEBC_NEWS/*�������*/ 
;
create table WEBC_NEWS/*�������*/ (
InstanceID CHAR(38) ,
WEBC_NEWSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBC_NEWS add 
TheDate
 DATETIME null /* ���� */
;
alter  table WEBC_NEWS add 
ShortName
 VARCHAR (128) null /* ������� �������� */
;
alter  table WEBC_NEWS add 
Info null /* ���������� */
;
alter  table WEBC_NEWS add 
Accept null 
 check (Accept in ( -1/* �� */
, 0/* ��� */ )) /* ��������� ���������� */
;
alter  table WEBC_NEWS add 
Annotation
 VARCHAR (255) null /* ������� ��������� */
;


/*��������*/
drop table WEBC_JOB/*��������*/ 
;
create table WEBC_JOB/*��������*/ (
InstanceID CHAR(38) ,
WEBC_JOBid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBC_JOB add 
JobDate
 DATETIME null /* ���� */
;
alter  table WEBC_JOB add 
JobName
 VARCHAR (256) null /* �������� */
;
alter  table WEBC_JOB add 
JobCity
 VARCHAR (1024) null /* ����� */
;
alter  table WEBC_JOB add 
JobSex
 INTEGER null 
 check (JobSex in ( 1/* ������� */
, 0/* �� ����������� */
, -1/* ������� */ )) /* ��� */
;
alter  table WEBC_JOB add 
JobAge
 VARCHAR (64) null /* ������� */
;
alter  table WEBC_JOB add 
JobEducation null 
 check (JobEducation in ( 2/* ������� ����������� */
, 1/* ������� */
, -1/* �� ����� */
, 4/* ������ */
, 0/* �������� ������� */
, 3/* �������� ������ */
, 5/* ��������� ������ */ )) /* ����������� */
;
alter  table WEBC_JOB add 
JobExperience
 VARCHAR (1024) null /* ���� ������ */
;
alter  table WEBC_JOB add 
JobEmployment null 
 check (JobEmployment in ( 0/* ������ */
, 1/* ��������� */
, -1/* �� ����� */ )) /* ��������� */
;
alter  table WEBC_JOB add 
JobCompensation
 VARCHAR (256) null /* �������� */
;
alter  table WEBC_JOB add 
JobDescription
 VARCHAR (2000) null /* �������� */
;
alter  table WEBC_JOB add 
JobActual
 integer null 
 check (JobActual in ( 1/* �� */
, 0/* ��� */ )) /* ������������ */
;


/*���������*/
drop table WEBC_MESSAGES/*��������� �� �����������*/ 
;
create table WEBC_MESSAGES/*��������� �� �����������*/ (
InstanceID CHAR(38) ,
WEBC_MESSAGESid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBC_MESSAGES add 
MESSAGES_FIO
 VARCHAR (256) null /* �������, ���, �������� */
;
alter  table WEBC_MESSAGES add 
MESSAGES_Email
 VARCHAR (256) null /* ����� ����������� ����� */
;
alter  table WEBC_MESSAGES add 
MESSAGES_TEL
 VARCHAR (256) null /* ������� */
;
alter  table WEBC_MESSAGES add 
MESSAGES_City
 VARCHAR (256) null /* ����� */
;
alter  table WEBC_MESSAGES add 
MESSAGES_Org
 VARCHAR (256) null /* �������� ����������� */
;
alter  table WEBC_MESSAGES add 
MESSAGES_Position
 VARCHAR (256) null /* �������������/��������� */
;
alter  table WEBC_MESSAGES add 
MESSAGES_Text
 VARCHAR (2000) null /* ��������� */
;


/*���������*/
drop table WEBC_DOCS/*���������*/ 
;
create table WEBC_DOCS/*���������*/ (
InstanceID CHAR(38) ,
WEBC_DOCSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBC_DOCS add 
DocsNum
 integer null /* � */
;
alter  table WEBC_DOCS add 
DocsName
 VARCHAR (1024) null /* �������� */
;
alter  table WEBC_DOCS add 
DocsFileName
 VARCHAR (1024) null /* ��� ����� */
;
alter  table WEBC_DOCS add 
DocsFileSize null /* ������ */
;
alter  table WEBC_DOCS add 
DocsFileDate
 DATETIME null /* ����  */
;
alter  table WEBC_DOCS add 
DocsDescription
 VARCHAR (1024) null /* ���������� */
;
alter  table WEBC_DOCS add 
DocsActual
 integer null 
 check (DocsActual in ( 1/* �� */
, 0/* ��� */ )) /* ������������ */
;


/*���� � �������*/
drop table WEBC_FILIALS/*���� � �������*/ 
;
create table WEBC_FILIALS/*���� � �������*/ (
InstanceID CHAR(38) ,
WEBC_FILIALSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBC_FILIALS add 
OfficeName
 VARCHAR (1024) null /* �������� */
;
alter  table WEBC_FILIALS add 
OfficeCity
 VARCHAR (1024) null /* ����� */
;
alter  table WEBC_FILIALS add 
OfficeAddress
 VARCHAR (1024) null /* ����� */
;
alter  table WEBC_FILIALS add 
OfficeTelefons
 VARCHAR (1024) null /* �������� */
;
alter  table WEBC_FILIALS add 
OfficeSmallImage
 VARCHAR (1024) null /* URL �������� �� ������ */
;
alter  table WEBC_FILIALS add 
OfficeBigImage
 VARCHAR (1024) null /* URL �������� ����������� */
;
alter  table WEBC_FILIALS add 
OfficeNum
 integer null /* � */
;
alter  table WEBC_FILIALS add 
ReferFilial null /* ������ �� ������ */
;
alter  table WEBC_FILIALS add 
EMailManag varchar(255) null /* EMail ��������� */
;
alter  table WEBC_FILIALS add 
EMailAddit varchar(255) null /* �������������� EMail */
;


/*������*/
drop table WEBC_LINKS/*������*/ 
;
create table WEBC_LINKS/*������*/ (
InstanceID CHAR(38) ,
WEBC_LINKSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBC_LINKS add 
LinkName
 VARCHAR (1024) null /* �������� */
;
alter  table WEBC_LINKS add 
LinkURL
 VARCHAR (1024) null /* ������ */
;
alter  table WEBC_LINKS add 
LinkDescription
 VARCHAR (2048) null /* �������� */
;


/*�������*/
drop table VRRPT_COSTS/*�������*/ 
;
create table VRRPT_COSTS/*�������*/ (
InstanceID CHAR(38) ,
VRRPT_COSTSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRRPT_COSTS add 
Descrtiption null /* �������� */
;
alter  table VRRPT_COSTS add 
Cost null /* ��������� */
;
alter  table VRRPT_COSTS add 
Duration null /* ������������ (���.) */
;


/*����������� �������*/
drop table VRRPT_MeetingPlan/*����������� �������*/ 
;
create table VRRPT_MeetingPlan/*����������� �������*/ (
InstanceID CHAR(38) ,
VRRPT_MeetingPlanid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRRPT_MeetingPlan add 
DateOF
 DATETIME null /* ����� ������� */
;
alter  table VRRPT_MeetingPlan add 
PlaceOf null /* ����� ���������� */
;
alter  table VRRPT_MeetingPlan add 
theme null /* ���� */
;


/*���������*/
drop table VRRPT_Meeters/*���������*/ 
;
create table VRRPT_Meeters/*���������*/ (
ParentStructRowID CHAR(38) not null,
VRRPT_Meetersid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRRPT_Meeters add 
Worker null /* ��������� */
;
alter  table VRRPT_Meeters add 
Contact null /* ���������� ���� */
;
alter  table VRRPT_Meeters add 
Mandatory null 
 check (Mandatory in ( -1/* �� */
, 0/* ��� */ )) /* ����������� */
;
alter  table VRRPT_Meeters add 
ReminderTime
 integer null /* ��������� �� (���.) */
;
alter  table VRRPT_Meeters add 
ReminderSent null 
 check (ReminderSent in ( -1/* �� */
, 0/* ��� */ )) /* �������� */
;


/*�����*/
drop table VRRPT_MAIN/*�����*/ 
;
create table VRRPT_MAIN/*�����*/ (
InstanceID CHAR(38) ,
VRRPT_MAINid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRRPT_MAIN add 
Author null /* ����� */
;
alter  table VRRPT_MAIN add 
TheDate
 DATETIME null /* ���� ������ */
;
alter  table VRRPT_MAIN add 
Client null /* ������ */
;
alter  table VRRPT_MAIN add 
Project null /* ������ */
;
alter  table VRRPT_MAIN add 
Contract null /* ������� */
;
alter  table VRRPT_MAIN add 
Person null /* ���������� ���� */
;
alter  table VRRPT_MAIN add 
Name
 VARCHAR (255) null /* �������� ������ */
;
alter  table VRRPT_MAIN add 
Info null /* ���������� */
;
alter  table VRRPT_MAIN add 
Attrachment null /* �������� */
;
alter  table VRRPT_MAIN add 
 Attrachment_EXT char(4) null
;
alter  table VRRPT_MAIN add 
ReportType null /* ��� ������ */
;


/*����� ����������*/
drop table VRDGCommon/*����� ����������*/ 
;
create table VRDGCommon/*����� ����������*/ (
InstanceID CHAR(38) ,
VRDGCommonid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRDGCommon add 
DogNum
 VARCHAR (255) null /* ����� �������� */
;
alter  table VRDGCommon add 
DogDate
 DATETIME null /* ���� �������� */
;
alter  table VRDGCommon add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table VRDGCommon add 
Curator null /* ������������� */
;
alter  table VRDGCommon add 
Info null /* ���������� */
;
alter  table VRDGCommon add 
Client null /* ���������� */
;
alter  table VRDGCommon add 
PZDog null 
 check (PZDog in ( -1/* �� */
, 0/* ��� */ )) /* ������� � ������� ������ */
;
alter  table VRDGCommon add 
StartDate
 DATETIME null /* ������ �������� */
;
alter  table VRDGCommon add 
EndDate
 DATETIME null /* ��������� �������� �������� */
;
alter  table VRDGCommon add 
Code1C
 VARCHAR (40) null /* ���1� */
;


/*������*/
drop table VRDGReport/*������*/ 
;
create table VRDGReport/*������*/ (
InstanceID CHAR(38) ,
VRDGReportid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRDGReport add 
Report null /* ����� */
;


/*�������������� ����������*/
drop table VRDGContractChanges/*�������������� ����������*/ 
;
create table VRDGContractChanges/*�������������� ����������*/ (
InstanceID CHAR(38) ,
VRDGContractChangesid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRDGContractChanges add 
Code
 VARCHAR (80) null /* ����� ���������� */
;
alter  table VRDGContractChanges add 
DateOf
 DATETIME null /* ���� ���������� */
;
alter  table VRDGContractChanges add 
theFile null /* ���� ���������� */
;
alter  table VRDGContractChanges add 
 theFile_EXT char(4) null
;
alter  table VRDGContractChanges add 
the_Comment null /* ���������� */
;


/*������ ��������*/
drop table VRDGContractVersion/*������ ��������*/ 
;
create table VRDGContractVersion/*������ ��������*/ (
InstanceID CHAR(38) ,
VRDGContractVersionid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRDGContractVersion add 
DateOf
 DATETIME null /* ���� ������ */
;
alter  table VRDGContractVersion add 
theFile null /* ���� */
;
alter  table VRDGContractVersion add 
 theFile_EXT char(4) null
;
alter  table VRDGContractVersion add 
Actual null 
 check (Actual in ( -1/* �� */
, 0/* ��� */ )) /* ���������� ������ */
;
alter  table VRDGContractVersion add 
the_Comment null /* ���������� */
;


/*����������� �������*/
drop table VRDGContractSpesial/*����������� �������*/ 
;
create table VRDGContractSpesial/*����������� �������*/ (
InstanceID CHAR(38) ,
VRDGContractSpesialid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRDGContractSpesial add 
DateOf
 DATETIME null /* ���� */
;
alter  table VRDGContractSpesial add 
IsDone null 
 check (IsDone in ( -1/* �� */
, 0/* ��� */ )) /* ��������� */
;
alter  table VRDGContractSpesial add 
the_Comment null /* ���� ������� */
;


/*�����*/
drop table PEKSH_DATA/*�����*/ 
;
create table PEKSH_DATA/*�����*/ (
InstanceID CHAR(38) ,
PEKSH_DATAid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKSH_DATA add 
Train null /* ����� */
;
alter  table PEKSH_DATA add 
StartTime
 datetime null /* ����� ����������� */
;
alter  table PEKSH_DATA add 
Duration
 integer null /* ����� �������� */
;


/*���� � ����� �����������*/
drop table PEKSH_START/*���� � ����� �����������*/ 
;
create table PEKSH_START/*���� � ����� �����������*/ (
ParentStructRowID CHAR(38) not null,
PEKSH_STARTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKSH_START add 
DayInYear
 integer null /* ����� ��� � ���� */
;
alter  table PEKSH_START add 
StartTime
 datetime null /* ����� ����������� */
;


/*�������� ����������*/
drop table PEKSH_DEF/*�������� ����������*/ 
;
create table PEKSH_DEF/*�������� ����������*/ (
InstanceID CHAR(38) ,
PEKSH_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKSH_DEF add 
DIRECTION null /* ����������� */
;
alter  table PEKSH_DEF add 
TheYear
 integer null /* ��� */
;


/*���������� �������*/
drop table MTZ2JOB_DEF/*�������� ����������� �������*/ 
;
create table MTZ2JOB_DEF/*�������� ����������� �������*/ (
InstanceID CHAR(38) ,
MTZ2JOB_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table MTZ2JOB_DEF add 
EventDate
 DATETIME null /* �������� �� */
;
alter  table MTZ2JOB_DEF add 
EvenType
 VARCHAR (255) null /* ��� ������� */
;
alter  table MTZ2JOB_DEF add 
ThruObject null /* ������ - ������� ������� */
;
alter  table MTZ2JOB_DEF add 
ThruState
 uniqueidentifier null /* ��������� - ������� */
;
alter  table MTZ2JOB_DEF add 
NextState
 uniqueidentifier null /* ��������� ����� ��������� */
;
alter  table MTZ2JOB_DEF add 
ProcessDate
 DATETIME null /* ������ ��������� */
;
alter  table MTZ2JOB_DEF add 
Processed null 
 check (Processed in ( -1/* �� */
, 0/* ��� */ )) /* ��������� */
;


/*��������*/
drop table PEKPAY_DEF/*������� ��� ����� ���������� ������*/ 
;
create table PEKPAY_DEF/*������� ��� ����� ���������� ������*/ (
InstanceID CHAR(38) ,
PEKPAY_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKPAY_DEF add 
ToClient null /* ��������� */
;
alter  table PEKPAY_DEF add 
PLPNUM
 VARCHAR (20) null /* � ��������� */
;
alter  table PEKPAY_DEF add 
PLPDate
 DATETIME null /* ���� ��������� */
;
alter  table PEKPAY_DEF add 
PLPSumm null /* ����� */
;
alter  table PEKPAY_DEF add 
TheDept null /* � ���� ������� */
;
alter  table PEKPAY_DEF add 
TheComment null /* ��������� ������� */
;
alter  table PEKPAY_DEF add 
Code1C
 VARCHAR (40) null /* ���1� */
;


/*�������� ���������*/
drop table WEBSDIC_DEF/**/ 
;
create table WEBSDIC_DEF/**/ (
InstanceID CHAR(38) ,
WEBSDIC_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBSDIC_DEF add 
WEBS null /* ���� */
;
alter  table WEBSDIC_DEF add 
PathToFiles
 VARCHAR (2048) null /* ������� ��� ������ */
;


/*WEB ������������*/
drop table PWUUSERS/*WEB ������������ ����������� �������*/ 
;
create table PWUUSERS/*WEB ������������ ����������� �������*/ (
InstanceID CHAR(38) ,
PWUUSERSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PWUUSERS add 
PWUUSERSOrderNum
 integer null /* ����� �/� */
;
alter  table PWUUSERS add 
PWUUSERSLogin
 VARCHAR (256) null /* ��� ��� ����� */
;
alter  table PWUUSERS add 
PWUUSERSPassword
 VARCHAR (256) null /* ������ */
;
alter  table PWUUSERS add 
PWUUSERSEMail
 VARCHAR (256) null /* ����� ����������� ����� */
;
alter  table PWUUSERS add 
PWUUSERSClient null /* ������ */
;
alter  table PWUUSERS add 
PWUUSERSIsBanned null 
 check (PWUUSERSIsBanned in ( -1/* �� */
, 0/* ��� */ )) /* ������������ */
;
alter  table PWUUSERS add 
PWUUSERSRegDate
 DATETIME null /* ���� ����������� */
;


/*������� ��������*/
drop table pekz_path/*������� ��������*/ 
;
create table pekz_path/*������� ��������*/ (
InstanceID CHAR(38) ,
pekz_pathid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table pekz_path add 
sequence
 integer null /* � */
;
alter  table pekz_path add 
IsTranzit null 
 check (IsTranzit in ( -1/* �� */
, 0/* ��� */ )) /* ������� */
;
alter  table pekz_path add 
PathFilial null /* ������ */
;
alter  table pekz_path add 
TransSupplier null /* ��������� */
;
alter  table pekz_path add 
TheDirection null /* ����������� */
;
alter  table pekz_path add 
PPONum
 integer null /* ���-�� �� */
;
alter  table pekz_path add 
DestStation null /* ������� ���������� */
;
alter  table pekz_path add 
PPODescription null /* �������� ����� */
;
alter  table pekz_path add 
Receiver null /* ���������� */
;
alter  table pekz_path add 
PPOWeight null /* ��� �� */
;
alter  table pekz_path add 
WeightEDIZM null /* ��. ���. ���� */
;
alter  table pekz_path add 
PPOVol null /* ����� �� */
;
alter  table pekz_path add 
ValueEDIZM null /* ��.���. ������ */
;
alter  table pekz_path add 
RCVInfo null /* ������ ���������� */
;
alter  table pekz_path add 
PathPlanedDate
 DATETIME null /* ���� �������������� �������� */
;
alter  table pekz_path add 
RcvWaitDate
 DATETIME null /* ��������������� ���� ��������� */
;
alter  table pekz_path add 
trainNo null /* ����� */
;
alter  table pekz_path add 
vagNo
 VARCHAR (8) null /* ����� � */
;
alter  table pekz_path add 
SendDate
 DATETIME null /* ���� �������� */
;
alter  table pekz_path add 
PassFIO
 VARCHAR (255) null /* ��� ���������� */
;
alter  table pekz_path add 
PassDate
 DATETIME null /* ���� �������� ����� � ����� */
;
alter  table pekz_path add 
RcvFIO
 VARCHAR (255) null /* ��� ��� */
;
alter  table pekz_path add 
RcvDate
 DATETIME null /* ���� ��������� ����� � �� */
;
alter  table pekz_path add 
InforRcvFIO
 VARCHAR (255) null /* ���� �������� ���������� */
;
alter  table pekz_path add 
InfoDate
 DATETIME null /* ���� �������� ���������� */
;
alter  table pekz_path add 
InfoSendType null /* ������ �������� ���������� */
;
alter  table pekz_path add 
CalcWithNDS null 
 check (CalcWithNDS in ( -1/* �� */
, 0/* ��� */ )) /* ������ � ��� */
;
alter  table pekz_path add 
TheCurrency null /* ������ */
;
alter  table pekz_path add 
TRF null /* ����� */
;
alter  table pekz_path add 
SummNDS null /* ����� � ��� */
;
alter  table pekz_path add 
Summ null /* ����� ��� ��� */
;
alter  table pekz_path add 
SupTRF null /* ����� ���������� */
;
alter  table pekz_path add 
SupSumm null /* ����� ���������� ��� ��� */
;
alter  table pekz_path add 
SupSummNDS null /* ����� ���������� � ��� */
;


/*������� ������ ���*/
drop table PEKZ_WLIST/*������� ������ ���*/ 
;
create table PEKZ_WLIST/*������� ������ ���*/ (
ParentStructRowID CHAR(38) not null,
PEKZ_WLISTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKZ_WLIST add 
sequence
 integer null /* � */
;
alter  table PEKZ_WLIST add 
theWeight null /* ��� */
;
alter  table PEKZ_WLIST add 
shCode
 VARCHAR (14) null /* ����� ��� */
;
alter  table PEKZ_WLIST add 
NettoWeight null /* ��� ����� */
;
alter  table PEKZ_WLIST add 
TNBED
 VARCHAR (40) null /* ��� ����� */
;
alter  table PEKZ_WLIST add 
TheCountry null /* ������ ������������� */
;
alter  table PEKZ_WLIST add 
ItemPrice null /* ��������� ������� */
;
alter  table PEKZ_WLIST add 
VozmCost null /* ��������� ��������� */
;
alter  table PEKZ_WLIST add 
TheCurrency null /* ������ ��������� */
;
alter  table PEKZ_WLIST add 
IsPodarok null 
 check (IsPodarok in ( -1/* �� */
, 0/* ��� */ )) /* ������� */
;
alter  table PEKZ_WLIST add 
IsDocument null 
 check (IsDocument in ( -1/* �� */
, 0/* ��� */ )) /* �������� */
;
alter  table PEKZ_WLIST add 
IsObrazec null 
 check (IsObrazec in ( -1/* �� */
, 0/* ��� */ )) /* ������������ ������� */
;
alter  table PEKZ_WLIST add 
IsVozvrat null 
 check (IsVozvrat in ( -1/* �� */
, 0/* ��� */ )) /* ������� ������ */
;
alter  table PEKZ_WLIST add 
IsProchee null 
 check (IsProchee in ( -1/* �� */
, 0/* ��� */ )) /* ������ ����������� */
;
alter  table PEKZ_WLIST add 
ItemDescription
 VARCHAR (60) null /* �������� ����������� */
;
alter  table PEKZ_WLIST add 
QLicense
 integer null /* ���������� �������� */
;
alter  table PEKZ_WLIST add 
QSertif
 integer null /* ���������� ������������ */
;
alter  table PEKZ_WLIST add 
OrderNum
 VARCHAR (30) null /* � ����� */
;
alter  table PEKZ_WLIST add 
QDocs
 integer null /* ���������� ���������������� ���������� */
;


/*��������*/
drop table PEKZ_WLADDS/*�������� ��� �������*/ 
;
create table PEKZ_WLADDS/*�������� ��� �������*/ (
ParentStructRowID CHAR(38) not null,
PEKZ_WLADDSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKZ_WLADDS add 
TheAdds null /* �������� */
;


/*�������� ���������*/
drop table PEKZ_DOCS/*�������� ���������*/ 
;
create table PEKZ_DOCS/*�������� ���������*/ (
InstanceID CHAR(38) ,
PEKZ_DOCSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKZ_DOCS add 
TheDoc null /* �������� */
;


/*�������� ������*/
drop table pekz_def/*������ ���������  �������� ������ � ������.*/ 
;
create table pekz_def/*������ ���������  �������� ������ � ������.*/ (
InstanceID CHAR(38) ,
pekz_defid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table pekz_def add 
QueryDate
 DATETIME null /* ���� ������� */
;
alter  table pekz_def add 
Fillial null /* ������� � */
;
alter  table pekz_def add 
PEKCode
 VARCHAR (50) null /* � ������ */
;
alter  table pekz_def add 
PlatType
 INTEGER null 
 check (PlatType in ( 0/* ����������� */
, 1/* ���������� */
, 2/* ������ */ )) /* ������ */
;
alter  table pekz_def add 
TRType null /* ��� �������� */
;
alter  table pekz_def add 
PlanedDate
 DATETIME null /* ���� �������������� �������� */
;
alter  table pekz_def add 
ClientFrom null /* ����������� */
;
alter  table pekz_def add 
ClientTo null /* ���������� */
;
alter  table pekz_def add 
ClientPayed null /* ���������� */
;
alter  table pekz_def add 
AcceptDate
 DATETIME null /* ���� ������ ������ */
;
alter  table pekz_def add 
VRCFinfo null /* ������ ����������� */
;
alter  table pekz_def add 
Supplier null /* ��������� */
;
alter  table pekz_def add 
PayDept null /* ������������ �  */
;
alter  table pekz_def add 
TheDogovor null /* ������� */
;
alter  table pekz_def add 
IsPayed null 
 check (IsPayed in ( -1/* �� */
, 0/* ��� */ )) /* �������� */
;
alter  table pekz_def add 
RcvInfo null /* ������ ���������� */
;
alter  table pekz_def add 
IsNal null 
 check (IsNal in ( -1/* �� */
, 0/* ��� */ )) /* �������� ������ */
;
alter  table pekz_def add 
TheComment null /* ���������� */
;
alter  table pekz_def add 
AcceptTime
 datetime null /* ����� ������ ������ */
;
alter  table pekz_def add 
LoadTime
 datetime null /* ����� ������ ����� �� ����� */
;
alter  table pekz_def add 
LoadDate
 DATETIME null /* ���� ������ ����� �� ����� */
;
alter  table pekz_def add 
TRF null /* ����� */
;
alter  table pekz_def add 
Code1C
 VARCHAR (40) null /* ���1� */
;
alter  table pekz_def add 
IncludeInOrder null 
 check (IncludeInOrder in ( -1/* �� */
, 0/* ��� */ )) /* ������� � ����� */
;
alter  table pekz_def add 
IncludeInAct null 
 check (IncludeInAct in ( -1/* �� */
, 0/* ��� */ )) /* �������� � ��� */
;
alter  table pekz_def add 
SummNDS null /* ����� � ��� */
;
alter  table pekz_def add 
Summ null /* ����� ��� ��� */
;
alter  table pekz_def add 
SummDop null /* ����� ���. ����� ��� ��� */
;
alter  table pekz_def add 
SummDopNDS null /* ����� ���. ����� � ��� */
;
alter  table pekz_def add 
theActWork null /* ��� ����������� ����� */
;


/*���� �����*/
drop table PEKZ_ACLCT/*���� ����� ��� �������� ���������������*/ 
;
create table PEKZ_ACLCT/*���� ����� ��� �������� ���������������*/ (
InstanceID CHAR(38) ,
PEKZ_ACLCTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKZ_ACLCT add 
TheFilial null /* ������ */
;
alter  table PEKZ_ACLCT add 
AutoType null /* ��� �������������� */
;
alter  table PEKZ_ACLCT add 
CollectDate
 DATETIME null /* ���� ��������� ����� */
;
alter  table PEKZ_ACLCT add 
TheAddress null /* �����  */
;
alter  table PEKZ_ACLCT add 
CollectTimeFrom
 datetime null /* ������� � */
;
alter  table PEKZ_ACLCT add 
CollectTimeTo
 datetime null /* �� */
;
alter  table PEKZ_ACLCT add 
ThePerson
 VARCHAR (255) null /* ���������� ���� */
;
alter  table PEKZ_ACLCT add 
Phone
 VARCHAR (20) null /* ���������� ������� */
;
alter  table PEKZ_ACLCT add 
TheComment null /* ���������� */
;
alter  table PEKZ_ACLCT add 
TheLength null /* ���������� */
;
alter  table PEKZ_ACLCT add 
TheDuration null /* ������������ (���) */
;
alter  table PEKZ_ACLCT add 
Info null /* ������ � ����� */
;
alter  table PEKZ_ACLCT add 
AutoSuplier null /* ��������� */
;
alter  table PEKZ_ACLCT add 
SummNDS null /* ����� � ��� */
;
alter  table PEKZ_ACLCT add 
Summ null /* ����� ��� ��� */
;
alter  table PEKZ_ACLCT add 
SupSumm null /* ����� ���������� ��� ��� */
;
alter  table PEKZ_ACLCT add 
SupSummNDS null /* ����� ���������� � ��� */
;


/*���� ��������*/
drop table PEKZ_ADLVR/*�������� ����� ���������� ���������������*/ 
;
create table PEKZ_ADLVR/*�������� ����� ���������� ���������������*/ (
InstanceID CHAR(38) ,
PEKZ_ADLVRid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKZ_ADLVR add 
TheFilial null /* ������ */
;
alter  table PEKZ_ADLVR add 
AutoType null /* ��� �������������� */
;
alter  table PEKZ_ADLVR add 
TheAddress null /* �����  */
;
alter  table PEKZ_ADLVR add 
CollectDate
 DATETIME null /* ���� ��������� ����� */
;
alter  table PEKZ_ADLVR add 
CollectTimeFrom
 datetime null /* ������� � */
;
alter  table PEKZ_ADLVR add 
CollectTimeTo
 datetime null /* �� */
;
alter  table PEKZ_ADLVR add 
ThePerson
 VARCHAR (255) null /* ���������� ���� */
;
alter  table PEKZ_ADLVR add 
Phone
 VARCHAR (20) null /* ���������� ������� */
;
alter  table PEKZ_ADLVR add 
TheComment null /* ���������� */
;
alter  table PEKZ_ADLVR add 
TheLength null /* ���������� */
;
alter  table PEKZ_ADLVR add 
TheDuration null /* ������������ (���) */
;
alter  table PEKZ_ADLVR add 
Info null /* ������ � ����� */
;
alter  table PEKZ_ADLVR add 
AutoSuplier null /* ��������� */
;
alter  table PEKZ_ADLVR add 
CalcWithNDS null 
 check (CalcWithNDS in ( -1/* �� */
, 0/* ��� */ )) /* ������ � ��� */
;
alter  table PEKZ_ADLVR add 
SummNDS null /* ����� � ��� */
;
alter  table PEKZ_ADLVR add 
Summ null /* ����� ��� ��� */
;
alter  table PEKZ_ADLVR add 
SupSumm null /* ����� ���������� ��� ��� */
;
alter  table PEKZ_ADLVR add 
SupSummNDS null /* ����� ���������� � ��� */
;


/*�������������� ������*/
drop table pekz_dop/*�������������� ������*/ 
;
create table pekz_dop/*�������������� ������*/ (
InstanceID CHAR(38) ,
pekz_dopid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table pekz_dop add 
sequence
 integer null /* � */
;
alter  table pekz_dop add 
SRV null /* ������ */
;
alter  table pekz_dop add 
Quantity null /* ���������� */
;
alter  table pekz_dop add 
EDIZM null /* ��. ��������� */
;
alter  table pekz_dop add 
PathFilial null /* ������ */
;
alter  table pekz_dop add 
TheComment null /* ���������� */
;
alter  table pekz_dop add 
DopSupplier null /* ��������� */
;
alter  table pekz_dop add 
TheCurrency null /* ������ */
;
alter  table pekz_dop add 
TRF null /* ����� */
;
alter  table pekz_dop add 
Summ null /* ����� ��� ��� */
;
alter  table pekz_dop add 
SummNDS null /* ����� � ��� */
;
alter  table pekz_dop add 
SupTRF null /* ����� ���������� */
;
alter  table pekz_dop add 
SupSumm null /* ����� ���������� ��� ��� */
;
alter  table pekz_dop add 
SupSummNDS null /* ����� ���������� � ��� */
;
alter  table pekz_dop add 
CalcWithNDS null 
 check (CalcWithNDS in ( -1/* �� */
, 0/* ��� */ )) /* ������ � ��� */
;


/*������� ��������������� ��������*/
drop table REPD_LOCKED/*������� ��������������� ��������*/ 
;
create table REPD_LOCKED/*������� ��������������� ��������*/ (
InstanceID CHAR(38) ,
REPD_LOCKEDid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table REPD_LOCKED add 
LastTry
 DATETIME null /* ��������� ���������� */
;
alter  table REPD_LOCKED add 
SourceFile
 VARCHAR (2048) null /* ���� ������ */
;
alter  table REPD_LOCKED add 
ReplicaRowID
 uniqueidentifier null /* ������������� ������ ������� */
;
alter  table REPD_LOCKED add 
FirstTry
 DATETIME null /* ������ ��������� */
;
alter  table REPD_LOCKED add 
StructType
 VARCHAR (255) null /* ��� ������ */
;
alter  table REPD_LOCKED add 
ObjectType
 VARCHAR (255) null /* ��� ������� */
;
alter  table REPD_LOCKED add 
The_RowID
 uniqueidentifier null /* ������������� ������ */
;
alter  table REPD_LOCKED add 
The_InstanceID
 uniqueidentifier null /* ������ */
;
alter  table REPD_LOCKED add 
ReplicaPackID
 uniqueidentifier null /* ReplicaPackID */
;
alter  table REPD_LOCKED add 
PartCount
 integer null /* PartCount */
;
alter  table REPD_LOCKED add 
PartNumber
 integer null /* PartNumber */
;


/*������ ������ �� ������\ ������*/
drop table REPD_RequestQuery/*������ ������ �� ������\ ������*/ 
;
create table REPD_RequestQuery/*������ ������ �� ������\ ������*/ (
InstanceID CHAR(38) ,
REPD_RequestQueryid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table REPD_RequestQuery add 
TheRowID
 uniqueidentifier null /* TheRowID */
;
alter  table REPD_RequestQuery add 
ReqPartName
 VARCHAR (255) null /* ReqPartName */
;
alter  table REPD_RequestQuery add 
ObjectID
 uniqueidentifier null /* ObjectID */
;
alter  table REPD_RequestQuery add 
SourceSrv null /* SourceSrv */
;
alter  table REPD_RequestQuery add 
SendRecord null /* SendRecord */
;
alter  table REPD_RequestQuery add 
DestSrv null /* DestSrv */
;
alter  table REPD_RequestQuery add 
Provider null /* Provider */
;
alter  table REPD_RequestQuery add 
ReqTypeName
 VARCHAR (255) null /* ReqTypeName */
;


/*��������� �������*/
drop table REPD_ResQueryRcv/*��������� �������*/ 
;
create table REPD_ResQueryRcv/*��������� �������*/ (
ParentStructRowID CHAR(38) not null,
REPD_ResQueryRcvid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table REPD_ResQueryRcv add 
ReceiveRec null /* ReceiveRec */
;


/*��������� �����������*/
drop table REPD_PROV/*��������� �����������*/ 
;
create table REPD_PROV/*��������� �����������*/ (
InstanceID CHAR(38) ,
REPD_PROVid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table REPD_PROV add 
AssemblyName
 VARCHAR (255) null /* AssemblyName */
;
alter  table REPD_PROV add 
ClassName
 VARCHAR (255) null /* ClassName */
;
alter  table REPD_PROV add 
Name
 VARCHAR (255) null /* Name */
;


/*���� ����������*/
drop table REPD_SRV/*���� ����������*/ 
;
create table REPD_SRV/*���� ����������*/ (
InstanceID CHAR(38) ,
REPD_SRVid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table REPD_SRV add 
Obj3 null /* Obj3 */
;
alter  table REPD_SRV add 
name
 VARCHAR (255) null /* �������� */
;
alter  table REPD_SRV add 
Obj2 null /* Obj2 */
;
alter  table REPD_SRV add 
Obj1 null /* Obj1 */
;


/*���������� ������*/
drop table REPD_SNDTO/*���������� ������*/ 
;
create table REPD_SNDTO/*���������� ������*/ (
ParentStructRowID CHAR(38) not null,
REPD_SNDTOid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table REPD_SNDTO add 
DestSrv null /* DestSrv */
;
alter  table REPD_SNDTO add 
LastScan
 DATETIME null /* Last scan */
;
alter  table REPD_SNDTO add 
Config null /* Config */
;
alter  table REPD_SNDTO add 
LastReceive
 DATETIME null /* Last Receive */
;
alter  table REPD_SNDTO add 
Provider null /* Provider */
;
alter  table REPD_SNDTO add 
Work_Start
 datetime null /* ������ ������ (�����) */
;
alter  table REPD_SNDTO add 
Work_End
 datetime null /* ��������� ������ (�����) */
;
alter  table REPD_SNDTO add 
The_Interval
 integer null /* �������� */
;


/*��������� � �������*/
drop table REPD_CONST/**/ 
;
create table REPD_CONST/**/ (
ParentStructRowID CHAR(38) not null,
REPD_CONSTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table REPD_CONST add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table REPD_CONST add 
TheValue
 VARCHAR (255) null /* �������� */
;


/*��� ���������� ����������*/
drop table REPD_REPTYPE/*�������� ���� ���������� ���������� ��� ����*/ 
;
create table REPD_REPTYPE/*�������� ���� ���������� ���������� ��� ����*/ (
ParentStructRowID CHAR(38) not null,
REPD_REPTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table REPD_REPTYPE add 
ReplicaType null 
 check (ReplicaType in ( 0/* ���� �������� */
, 2/* ��������� */
, 1/* ��������� */ )) /* ��� ���������� */
;
alter  table REPD_REPTYPE add 
TheObjectType null /* ��� ������� */
;
alter  table REPD_REPTYPE add 
UseFilter null 
 check (UseFilter in ( -1/* �� */
, 0/* ��� */ )) /* ����������� �� ������� */
;
alter  table REPD_REPTYPE add 
RepConditonQRY null /* ������� ���������� */
;


/*������� �������*/
drop table REPD_SendQ/*������� �������*/ 
;
create table REPD_SendQ/*������� �������*/ (
InstanceID CHAR(38) ,
REPD_SendQid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table REPD_SendQ add 
SourceSrv null /* SourceSrv */
;
alter  table REPD_SendQ add 
Config null /* Config */
;
alter  table REPD_SendQ add 
SentDate
 DATETIME null /* SentDate */
;
alter  table REPD_SendQ add 
DestSrv null /* DestSrv */
;
alter  table REPD_SendQ add 
Provider null /* Provider */
;
alter  table REPD_SendQ add 
Acknowelge null 
 check (Acknowelge in ( -1/* �� */
, 0/* ��� */ )) /* Acknowelge */
;
alter  table REPD_SendQ add 
SendSize
 integer null /* SendSize */
;
alter  table REPD_SendQ add 
CheckDate
 DATETIME null /* CheckDate */
;
alter  table REPD_SendQ add 
ReplicaPackID
 uniqueidentifier null /* ReplicaPackID */
;
alter  table REPD_SendQ add 
FileName
 VARCHAR (1024) null /* FileName */
;
alter  table REPD_SendQ add 
PartCount
 integer null /* ���������� ������ */
;
alter  table REPD_SendQ add 
PartNumber
 integer null /* ����� */
;
alter  table REPD_SendQ add 
Sent
 integer null 
 check (Sent in ( 1/* �� */
, 0/* ��� */ )) /* Sent */
;
alter  table REPD_SendQ add 
ReplicatorPointer
 DATETIME null /* ��������� ���������� */
;


/*������� ��������� ������*/
drop table REPD_RecvQ/*������� ��������� ������*/ 
;
create table REPD_RecvQ/*������� ��������� ������*/ (
InstanceID CHAR(38) ,
REPD_RecvQid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table REPD_RecvQ add 
TheRowID
 uniqueidentifier null /* TheRowID */
;
alter  table REPD_RecvQ add 
Received
 DATETIME null /* Received */
;
alter  table REPD_RecvQ add 
Provider null /* Provider */
;
alter  table REPD_RecvQ add 
RecvSize
 integer null /* RecvSize */
;
alter  table REPD_RecvQ add 
SourceSrv null /* SourceSrv */
;
alter  table REPD_RecvQ add 
DestSrv null /* DestSrv */
;
alter  table REPD_RecvQ add 
Acknowelge null 
 check (Acknowelge in ( -1/* �� */
, 0/* ��� */ )) /* Acknowelge */
;
alter  table REPD_RecvQ add 
ReplicaPackID
 uniqueidentifier null /* ReplicaPackID */
;
alter  table REPD_RecvQ add 
PartCount
 integer null /* ���������� ������ */
;
alter  table REPD_RecvQ add 
PartNumber
 integer null /* ����� */
;
alter  table REPD_RecvQ add 
FileName
 VARCHAR (1024) null /* FileName */
;
alter  table REPD_RecvQ add 
Completed null 
 check (Completed in ( -1/* �� */
, 0/* ��� */ )) /* Completed */
;


/*������� ��� �����*/
drop table StateAction/*������� ��� �����*/ 
;
create table StateAction/*������� ��� �����*/ (
InstanceID CHAR(38) ,
StateActionid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table StateAction add 
OnDocStatus null /* ��� ����� � �������� */
;
alter  table StateAction add 
NewSecurityStyle null /* ���������� ����� ������ */
;
alter  table StateAction add 
ClearSecurity null 
 check (ClearSecurity in ( -1/* �� */
, 0/* ��� */ )) /* �������� ����� ������ */
;
alter  table StateAction add 
LibraryFile
 VARCHAR (255) null /* ����������-���������� */
;
alter  table StateAction add 
ActionClass
 VARCHAR (255) null /* ����� ��� ��������� */
;
alter  table StateAction add 
ActionScript null /* ������ ��� ���������� */
;


/*�������� ��������*/
drop table TheDiffPath/**/ 
;
create table TheDiffPath/**/ (
InstanceID CHAR(38) ,
TheDiffPathid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table TheDiffPath add 
TheNumber
 integer null /* ����� �������� � ������� �������� */
;
alter  table TheDiffPath add 
TempTownFrom null /* ������������� ����� ����������� */
;
alter  table TheDiffPath add 
Direction null /* ����������� */
;
alter  table TheDiffPath add 
TempDirStation null /* ������������� ����� �������� */
;
alter  table TheDiffPath add 
Transporter null /* ���������� */
;
alter  table TheDiffPath add 
Transport null /* ��������� */
;


/*���. ������ � ����� ��������*/
drop table DopUslTo/**/ 
;
create table DopUslTo/**/ (
ParentStructRowID CHAR(38) not null,
DopUslToid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table DopUslTo add 
DopUsluga null /* ���. ������ */
;


/*���. ������ � ����� �����������*/
drop table DopUslFrom/**/ 
;
create table DopUslFrom/**/ (
ParentStructRowID CHAR(38) not null,
DopUslFromid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table DopUslFrom add 
DopUsluga null /* ���. ������ */
;


/*�������� �������� ��������*/
drop table TheDefenitionDiffP/**/ 
;
create table TheDefenitionDiffP/**/ (
InstanceID CHAR(38) ,
TheDefenitionDiffPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table TheDefenitionDiffP add 
TheNumeric
 integer null /* ����� �������� �������� */
;
alter  table TheDefenitionDiffP add 
TownFrom null /* ����� ����������� */
;
alter  table TheDefenitionDiffP add 
DirStation null /* ������� ���������� */
;
alter  table TheDefenitionDiffP add 
CountParticles null /* ���������� �������� */
;
alter  table TheDefenitionDiffP add 
TheComment null /* ���������� */
;


/*�������� ����*/
drop table PEKACT_DEF/*��� ������*/ 
;
create table PEKACT_DEF/*��� ������*/ (
InstanceID CHAR(38) ,
PEKACT_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKACT_DEF add 
Podrazdelenie null /* ������������� */
;
alter  table PEKACT_DEF add 
Client null /* ������ */
;
alter  table PEKACT_DEF add 
Number_of_akt
 integer null /* �����_���� */
;
alter  table PEKACT_DEF add 
Date_FROM
 DATETIME null /* ���� � */
;
alter  table PEKACT_DEF add 
Date_TO
 DATETIME null /* ���� �� */
;
alter  table PEKACT_DEF add 
TheDgovor null /* ������� */
;
alter  table PEKACT_DEF add 
dateCreate
 DATETIME null /* ���� ���������� ���� */
;
alter  table PEKACT_DEF add 
dateSend
 DATETIME null /* ���� �������� ���� ������� */
;
alter  table PEKACT_DEF add 
dateReceive
 DATETIME null /* ���� �������� ������������ ���� ������ */
;
alter  table PEKACT_DEF add 
FIO
 VARCHAR (100) null /* ��� ����������� ��� */
;
alter  table PEKACT_DEF add 
Code1C
 VARCHAR (40) null /* ��� 1� */
;


/*����� �� ����*/
drop table PEKACT_ITOG/*���������� ����� �� ���� � ������� �����*/ 
;
create table PEKACT_ITOG/*���������� ����� �� ���� � ������� �����*/ (
InstanceID CHAR(38) ,
PEKACT_ITOGid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKACT_ITOG add 
SRV null /* ������ */
;
alter  table PEKACT_ITOG add 
Summ null /* ����� */
;
alter  table PEKACT_ITOG add 
SummNDS null /* ����� � ��� */
;
alter  table PEKACT_ITOG add 
SupSUMM null /* ����� ���������� */
;
alter  table PEKACT_ITOG add 
SupSummNDS null /* ����� ���������� � ��� */
;
alter  table PEKACT_ITOG add 
Quantity null /* ���������� */
;
alter  table PEKACT_ITOG add 
edizm null /* ������� ��������� */
;


/*������ ����*/
drop table PEKACT_LINES/*������ ���� ������ */ 
;
create table PEKACT_LINES/*������ ���� ������ */ (
InstanceID CHAR(38) ,
PEKACT_LINESid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKACT_LINES add 
Zayavka null /* ������ */
;


/*��� ����*/
drop table FIELDTYPE/*���� �����, ������������, ���������*/ 
;
create table FIELDTYPE/*���� �����, ������������, ���������*/ (
InstanceID CHAR(38) ,
FIELDTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table FIELDTYPE add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table FIELDTYPE add 
TypeStyle
 INTEGER null 
 check (TypeStyle in ( 3/* �������� */
, 0/* ��������� ��� */
, 4/* ������ */
, 2/* ������������ */
, 1/* ��������� */
, 5/* ������� ���������� */ )) /* ��������� */
;
alter  table FIELDTYPE add 
the_Comment null /* �������� */
;
alter  table FIELDTYPE add 
AllowSize null 
 check (AllowSize in ( -1/* �� */
, 0/* ��� */ )) /* ����� ������ */
;
alter  table FIELDTYPE add 
Minimum
 VARCHAR (64) null /* ������� */
;
alter  table FIELDTYPE add 
Maximum
 VARCHAR (64) null /* �������� */
;
alter  table FIELDTYPE add 
AllowLikeSearch null 
 check (AllowLikeSearch in ( -1/* �� */
, 0/* ��� */ )) /* ����� ������ */
;
alter  table FIELDTYPE add 
GridSortType
 INTEGER null 
 check (GridSortType in ( 0/* As String */
, 1/* As Numeric */
, 2/* As Date */ )) /* ������� ���������� � ��������� ������������� */
;


/*�����������*/
drop table FIELDTYPEMAP/*����������� ���� ���� �� ���������� ��� ��������*/ 
;
create table FIELDTYPEMAP/*����������� ���� ���� �� ���������� ��� ��������*/ (
ParentStructRowID CHAR(38) not null,
FIELDTYPEMAPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table FIELDTYPEMAP add 
Target null /* ��������� */
;
alter  table FIELDTYPEMAP add 
StoageType
 VARCHAR (255) null /* ��� �������� */
;
alter  table FIELDTYPEMAP add 
FixedSize
 integer null /* ������ */
;


/*�������*/
drop table ENUMITEM/*��� �������� Enum �����*/ 
;
create table ENUMITEM/*��� �������� Enum �����*/ (
ParentStructRowID CHAR(38) not null,
ENUMITEMid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ENUMITEM add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table ENUMITEM add 
NameValue
 integer null /* �������� */
;
alter  table ENUMITEM add 
NameInCode
 VARCHAR (100) null /* �������� � ���� */
;


/*������ � ���������*/
drop table SHAREDMETHOD/*������ � ���������*/ 
;
create table SHAREDMETHOD/*������ � ���������*/ (
InstanceID CHAR(38) ,
SHAREDMETHODid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table SHAREDMETHOD add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table SHAREDMETHOD add 
the_Comment null /* �������� ������ */
;
alter  table SHAREDMETHOD add 
ReturnType null /* ������������ ��� */
;


/*����������*/
drop table SCRIPT/*��� ������ �� �������� ����������� ���������� �����*/ 
;
create table SCRIPT/*��� ������ �� �������� ����������� ���������� �����*/ (
ParentStructRowID CHAR(38) not null,
SCRIPTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table SCRIPT add 
Target null /* ������� ��������� */
;
alter  table SCRIPT add 
Code null /* ������ */
;


/*���������*/
drop table PARAMETERS/*��������� ������*/ 
;
create table PARAMETERS/*��������� ������*/ (
ParentStructRowID CHAR(38) not null,
PARAMETERSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PARAMETERS add 
sequence
 integer null /* ������������������ */
;
alter  table PARAMETERS add 
Name
 VARCHAR (80) null /* ��� */
;
alter  table PARAMETERS add 
Caption
 VARCHAR (80) null /* ��������� */
;
alter  table PARAMETERS add 
TypeOfParm null /* ��� ������ */
;
alter  table PARAMETERS add 
DataSize
 integer null /* ������ */
;
alter  table PARAMETERS add 
AllowNull null 
 check (AllowNull in ( -1/* �� */
, 0/* ��� */ )) /* ����� �� �������� */
;
alter  table PARAMETERS add 
OutParam null 
 check (OutParam in ( -1/* �� */
, 0/* ��� */ )) /* ���������� �������� */
;
alter  table PARAMETERS add 
ReferenceType
 INTEGER null 
 check (ReferenceType in ( 2/* �� ������ ������� */
, 3/* �� �������� ������ */
, 0/* ��������� ���� ( �� ������) */
, 1/* �� ������  */ )) /* ��� ������ */
;
alter  table PARAMETERS add 
RefToType null /* ������ �� ��� */
;
alter  table PARAMETERS add 
RefToPart null /* ������ �� ������ */
;


/*��� �������*/
drop table OBJECTTYPE/*��� ������� (��������)*/ 
;
create table OBJECTTYPE/*��� ������� (��������)*/ (
InstanceID CHAR(38) ,
OBJECTTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table OBJECTTYPE add 
Package null /* ���������� */
;
alter  table OBJECTTYPE add 
the_Comment
 VARCHAR (255) null /* �������� */
;
alter  table OBJECTTYPE add 
Name
 VARCHAR (14) null /* ��� */
;
alter  table OBJECTTYPE add 
IsSingleInstance null 
 check (IsSingleInstance in ( -1/* �� */
, 0/* ��� */ )) /* ����������� ������ ���� ������ */
;
alter  table OBJECTTYPE add 
ChooseView null /* ������������� ��� ������ */
;
alter  table OBJECTTYPE add 
OnRun null /* ��� ������� */
;
alter  table OBJECTTYPE add 
OnCreate null /* ��� �������� */
;
alter  table OBJECTTYPE add 
OnDelete null /* ��� �������� */
;
alter  table OBJECTTYPE add 
AllowRefToObject null 
 check (AllowRefToObject in ( -1/* �� */
, 0/* ��� */ )) /* ���������� ��� ������ ������ */
;
alter  table OBJECTTYPE add 
AllowSearch null 
 check (AllowSearch in ( -1/* �� */
, 0/* ��� */ )) /* ���������� ��� ������ */
;
alter  table OBJECTTYPE add 
ReplicaType null 
 check (ReplicaType in ( 0/* ���� �������� */
, 2/* ��������� */
, 1/* ��������� */ )) /* ��� ���������� */
;
alter  table OBJECTTYPE add 
TheComment null /* �������� */
;


/*������*/
drop table PART/*������ �������*/ 
;
create table PART/*������ �������*/ (
ParentStructRowID CHAR(38) not null,
PARTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
;
alter  table PART add 
Sequence
 integer null /* � �/� */
;
alter  table PART add 
PartType null 
 check (PartType in ( 1/* ��������� */
, 3/* ���������� */
, 0/* ������ */
, 2/* ������ */
, 4/* ���������� � ������� */ )) /* ��� ��������  */
;
alter  table PART add 
Caption
 VARCHAR (255) null /* ��������� */
;
alter  table PART add 
Name
 VARCHAR (20) null /* �������� */
;
alter  table PART add 
the_Comment null /* �������� */
;
alter  table PART add 
NoLog null 
 check (NoLog in ( -1/* �� */
, 0/* ��� */ )) /* �� ���������� � ������ */
;
alter  table PART add 
ManualRegister null 
 check (ManualRegister in ( -1/* �� */
, 0/* ��� */ )) /* ��������� �� �������������� */
;
alter  table PART add 
OnCreate null /* ��� �������� */
;
alter  table PART add 
OnSave null /* ��� ���������� */
;
alter  table PART add 
OnRun null /* ��� �������� */
;
alter  table PART add 
OnDelete null /* ��� �������� */
;
alter  table PART add 
AddBehaivor
 INTEGER null 
 check (AddBehaivor in ( 0/* AddForm */
, 2/* RunAction */
, 1/* RefreshOnly */ )) /* ��������� ��� ���������� */
;
alter  table PART add 
ExtenderObject null /* ������ ���������� */
;
alter  table PART add 
shablonBrief
 VARCHAR (100) null /* ������ ��� �������� ����������� */
;
alter  table PART add 
ruleBrief null /* ������� ����������� BRIEF ���� */
;
alter  table PART add 
IsJormalChange null 
 check (IsJormalChange in ( -1/* �� */
, 0/* ��� */ )) /* ����� ������ ��������� */
;


/*������ �������*/
drop table PARTMENU/*������ ������ �������*/ 
;
create table PARTMENU/*������ ������ �������*/ (
ParentStructRowID CHAR(38) not null,
PARTMENUid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PARTMENU add 
Name
 VARCHAR (64) null /* �������� */
;
alter  table PARTMENU add 
Caption
 VARCHAR (80) null /* ��������� */
;
alter  table PARTMENU add 
ToolTip
 VARCHAR (80) null /* ��������� */
;
alter  table PARTMENU add 
the_Action null /* ����� */
;
alter  table PARTMENU add 
IsMenuItem null 
 check (IsMenuItem in ( -1/* �� */
, 0/* ��� */ )) /* �������� � ���� */
;
alter  table PARTMENU add 
IsToolBarButton null 
 check (IsToolBarButton in ( -1/* �� */
, 0/* ��� */ )) /* � ������ */
;
alter  table PARTMENU add 
HotKey
 VARCHAR (20) null /* ������� ������� */
;


/*����������� ����������*/
drop table PARTPARAMMAP/*����������� �������� ����� ������� �� ��������� ������*/ 
;
create table PARTPARAMMAP/*����������� �������� ����� ������� �� ��������� ������*/ (
ParentStructRowID CHAR(38) not null,
PARTPARAMMAPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PARTPARAMMAP add 
FieldName
 VARCHAR (255) null /* ���� (��������) */
;
alter  table PARTPARAMMAP add 
ParamName
 VARCHAR (80) null /* �������� */
;
alter  table PARTPARAMMAP add 
NoEdit null 
 check (NoEdit in ( -1/* �� */
, 0/* ��� */ )) /* ������������� �������� ������ */
;


/*����*/
drop table FIELD/*����*/ 
;
create table FIELD/*����*/ (
ParentStructRowID CHAR(38) not null,
FIELDid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table FIELD add 
Sequence
 integer null /* � �/� */
;
alter  table FIELD add 
Caption
 VARCHAR (80) null /* ������� */
;
alter  table FIELD add 
Name
 VARCHAR (64) null /* ��� ���� */
;
alter  table FIELD add 
FieldType null /* ��� ���� */
;
alter  table FIELD add 
IsBrief null 
 check (IsBrief in ( -1/* �� */
, 0/* ��� */ )) /* ������� ���������� */
;
alter  table FIELD add 
AllowNull null 
 check (AllowNull in ( -1/* �� */
, 0/* ��� */ )) /* ����� ���� ������ */
;
alter  table FIELD add 
DataSize
 integer null /* ������ ���� */
;
alter  table FIELD add 
ReferenceType
 INTEGER null 
 check (ReferenceType in ( 2/* �� ������ ������� */
, 3/* �� �������� ������ */
, 0/* ��������� ���� ( �� ������) */
, 1/* �� ������  */ )) /* ��� ������ */
;
alter  table FIELD add 
RefToType null /* ������ �� ��� */
;
alter  table FIELD add 
RefToPart null /* ������ �� ������ */
;
alter  table FIELD add 
InternalReference null 
 check (InternalReference in ( -1/* �� */
, 0/* ��� */ )) /* ������ � �������� ������� */
;
alter  table FIELD add 
CreateRefOnly null 
 check (CreateRefOnly in ( -1/* �� */
, 0/* ��� */ )) /* ������ �������� ������� */
;
alter  table FIELD add 
IsAutoNumber null 
 check (IsAutoNumber in ( -1/* �� */
, 0/* ��� */ )) /* ������������� */
;
alter  table FIELD add 
TheNumerator null /* ��������� */
;
alter  table FIELD add 
ZoneTemplate
 VARCHAR (255) null /* ������ ���� ��������� */
;
alter  table FIELD add 
NumberDateField null /* ���� ��� ������� ���� */
;
alter  table FIELD add 
TheComment null /* �������� */
;
alter  table FIELD add 
shablonBrief
 VARCHAR (100) null /* ������ ��� �������� ����������� */
;
alter  table FIELD add 
theNameClass
 VARCHAR (100) null /* ��� ������ ��� ������� ����� */
;


/*������ ���� �� �����*/
drop table FIELDVALIDATOR/*������ ������������ �� ����� ��� ��������� ����*/ 
;
create table FIELDVALIDATOR/*������ ������������ �� ����� ��� ��������� ����*/ (
ParentStructRowID CHAR(38) not null,
FIELDVALIDATORid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table FIELDVALIDATOR add 
Target null /* ��������� */
;
alter  table FIELDVALIDATOR add 
Code null /* ������ */
;


/*������ ����*/
drop table FIELDMENU/*������, ��������������� � �����*/ 
;
create table FIELDMENU/*������, ��������������� � �����*/ (
ParentStructRowID CHAR(38) not null,
FIELDMENUid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table FIELDMENU add 
Name
 VARCHAR (64) null /* �������� */
;
alter  table FIELDMENU add 
Caption
 VARCHAR (80) null /* ��������� */
;
alter  table FIELDMENU add 
ToolTip
 VARCHAR (80) null /* ��������� */
;
alter  table FIELDMENU add 
ActionID null /* ������������� ����������� ������ */
;
alter  table FIELDMENU add 
IsMenuItem null 
 check (IsMenuItem in ( -1/* �� */
, 0/* ��� */ )) /* � ���� */
;
alter  table FIELDMENU add 
IsToolBarButton null 
 check (IsToolBarButton in ( -1/* �� */
, 0/* ��� */ )) /* � ������ */
;
alter  table FIELDMENU add 
HotKey
 VARCHAR (20) null /* ������� ������� */
;


/*����������� ����������*/
drop table FIELDPARAMMAP/*����������� �������� �� ��������� ������*/ 
;
create table FIELDPARAMMAP/*����������� �������� �� ��������� ������*/ (
ParentStructRowID CHAR(38) not null,
FIELDPARAMMAPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table FIELDPARAMMAP add 
FieldName
 VARCHAR (255) null /* ���� (��������) */
;
alter  table FIELDPARAMMAP add 
ParamName
 VARCHAR (80) null /* �������� */
;
alter  table FIELDPARAMMAP add 
NoEdit null 
 check (NoEdit in ( -1/* �� */
, 0/* ��� */ )) /* ������������� �������� ������ */
;


/*���������� ����������*/
drop table FldExtenders/**/ 
;
create table FldExtenders/**/ (
ParentStructRowID CHAR(38) not null,
FldExtendersid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table FldExtenders add 
TheName
 VARCHAR (255) null /* �������� */
;
alter  table FldExtenders add 
TargetPlatform null /* ������� ��������� */
;
alter  table FldExtenders add 
TheObject
 VARCHAR (255) null /* ������ */
;
alter  table FldExtenders add 
TheConfig
 VARCHAR (512) null /* ������ */
;


/*�������� �� ���������*/
drop table FIELDEXPRESSION/*��������� ��� ���������� ����
��� �������� �� ���������*/ 
;
create table FIELDEXPRESSION/*��������� ��� ���������� ����
��� �������� �� ���������*/ (
ParentStructRowID CHAR(38) not null,
FIELDEXPRESSIONid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table FIELDEXPRESSION add 
Target null /* ��������� */
;
alter  table FIELDEXPRESSION add 
Code null /* ������ */
;


/*������������ ������*/
drop table DINAMICFILTERSCRIPT/*��������� ��� ���������� ��������������� ������� ��� ��������� �����*/ 
;
create table DINAMICFILTERSCRIPT/*��������� ��� ���������� ��������������� ������� ��� ��������� �����*/ (
ParentStructRowID CHAR(38) not null,
DINAMICFILTERSCRIPTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table DINAMICFILTERSCRIPT add 
Target null /* ������� ��������� */
;
alter  table DINAMICFILTERSCRIPT add 
Code null /* ������ */
;


/*�������� ��������� ������*/
drop table FIELDSRCDEF/*�������� ��������� ������ ��� ����� ���� ReferenceSQL */ 
;
create table FIELDSRCDEF/*�������� ��������� ������ ��� ����� ���� ReferenceSQL */ (
ParentStructRowID CHAR(38) not null,
FIELDSRCDEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table FIELDSRCDEF add 
Provider
 VARCHAR (128) null /* ��������� */
;
alter  table FIELDSRCDEF add 
ConnectionString
 VARCHAR (512) null /* ������ ���������� � ���������� */
;
alter  table FIELDSRCDEF add 
DataSource
 VARCHAR (512) null /* �������� ������ */
;
alter  table FIELDSRCDEF add 
IDField
 VARCHAR (128) null /* ID */
;
alter  table FIELDSRCDEF add 
BriefString
 VARCHAR (512) null /* �������� ������� ���������� */
;
alter  table FIELDSRCDEF add 
FilterString
 VARCHAR (512) null /* ������ ��������� ������ */
;
alter  table FIELDSRCDEF add 
SortField
 VARCHAR (512) null /* ���������� ��������� ������ */
;
alter  table FIELDSRCDEF add 
DescriptionString null /* ���������� */
;
alter  table FIELDSRCDEF add 
DontShowDialog
 integer null 
 check (DontShowDialog in ( 1/* �� */
, 0/* ��� */ )) /* �� ���������� ����� ������ */
;


/*�������������*/
drop table PARTVIEW/*������� �������������, ������� ����� �������������� ��� �������� �������*/ 
;
create table PARTVIEW/*������� �������������, ������� ����� �������������� ��� �������� �������*/ (
ParentStructRowID CHAR(38) not null,
PARTVIEWid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PARTVIEW add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table PARTVIEW add 
the_Alias
 VARCHAR (64) null /* ��������� */
;
alter  table PARTVIEW add 
ForChoose null 
 check (ForChoose in ( -1/* �� */
, 0/* ��� */ )) /* ��� ������ */
;
alter  table PARTVIEW add 
FilterField0
 VARCHAR (255) null /* ���� - ������ 0 */
;
alter  table PARTVIEW add 
FilterField1
 VARCHAR (255) null /* ���� - ������ 1 */
;
alter  table PARTVIEW add 
FilterField2
 VARCHAR (255) null /* ���� - ������ 2 */
;
alter  table PARTVIEW add 
FilterField3
 VARCHAR (255) null /* ���� - ������ 3 */
;


/*�������*/
drop table ViewColumn/*������� �������������*/ 
;
create table ViewColumn/*������� �������������*/ (
ParentStructRowID CHAR(38) not null,
ViewColumnid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ViewColumn add 
sequence
 integer null /* �  */
;
alter  table ViewColumn add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table ViewColumn add 
the_Alias
 VARCHAR (64) null /* �������� */
;
alter  table ViewColumn add 
FromPart null /* ������ */
;
alter  table ViewColumn add 
Field null /* ���� */
;
alter  table ViewColumn add 
Aggregation
 INTEGER null 
 check (Aggregation in ( 5/* MAX */
, 1/* AVG */
, 3/* SUM */
, 2/* COUNT */
, 4/* MIN */
, 6/* CUSTOM */
, 0/* none */ )) /* ��������� */
;
alter  table ViewColumn add 
Expression null /* ������� */
;
alter  table ViewColumn add 
ForCombo null 
 check (ForCombo in ( -1/* �� */
, 0/* ��� */ )) /* ��� ����� */
;


/*��������� �������������*/
drop table PARTVIEW_LNK/**/ 
;
create table PARTVIEW_LNK/**/ (
ParentStructRowID CHAR(38) not null,
PARTVIEW_LNKid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PARTVIEW_LNK add 
TheView null /* ������������� */
;
alter  table PARTVIEW_LNK add 
TheJoinSource null /* �����: ���� ��� join �������� */
;
alter  table PARTVIEW_LNK add 
RefType
 integer null 
 check (RefType in ( 2/* ������ �� ������ */
, 1/* ������ �� ������ */
, 3/* ������ InstanceID (� �������� �������) */
, 4/* ������ ParentStructRowID  (� �������� �������) */
, 0/* ��� */ )) /* ��������� ��� */
;
alter  table PARTVIEW_LNK add 
TheJoinDestination null /* �����: ���� ��� join �������� */
;
alter  table PARTVIEW_LNK add 
HandJoin
 VARCHAR (255) null /* ������ join */
;
alter  table PARTVIEW_LNK add 
SEQ
 integer null /* ������� */
;


/*���������� ����������*/
drop table ExtenderInterface/**/ 
;
create table ExtenderInterface/**/ (
ParentStructRowID CHAR(38) not null,
ExtenderInterfaceid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ExtenderInterface add 
TheName
 VARCHAR (255) null /* �������� */
;
alter  table ExtenderInterface add 
TargetPlatform null /* ������� ��������� */
;
alter  table ExtenderInterface add 
TheObject
 VARCHAR (255) null /* ������ */
;
alter  table ExtenderInterface add 
TheConfig
 VARCHAR (512) null /* ������ */
;


/*������ �� �����*/
drop table VALIDATOR/*�������� � ��������� ��������������*/ 
;
create table VALIDATOR/*�������� � ��������� ��������������*/ (
ParentStructRowID CHAR(38) not null,
VALIDATORid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VALIDATOR add 
Target null /* ������� ��������� */
;
alter  table VALIDATOR add 
Code null /* ������ */
;


/*����������� ������������*/
drop table UNIQUECONSTRAINT/*����������� ������������*/ 
;
create table UNIQUECONSTRAINT/*����������� ������������*/ (
ParentStructRowID CHAR(38) not null,
UNIQUECONSTRAINTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table UNIQUECONSTRAINT add 
Name
 VARCHAR (80) null /* �������� */
;
alter  table UNIQUECONSTRAINT add 
PerParent null 
 check (PerParent in ( -1/* �� */
, 0/* ��� */ )) /* �� �������� */
;
alter  table UNIQUECONSTRAINT add 
TheComment null /* �������� */
;


/*���� �����������*/
drop table CONSTRAINTFIELD/*���� �����������*/ 
;
create table CONSTRAINTFIELD/*���� �����������*/ (
ParentStructRowID CHAR(38) not null,
CONSTRAINTFIELDid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table CONSTRAINTFIELD add 
TheField null /* ���� */
;


/*�������� ������������*/
drop table INSTANCEVALIDATOR/*�������� ������������ ��� ������� � �����*/ 
;
create table INSTANCEVALIDATOR/*�������� ������������ ��� ������� � �����*/ (
ParentStructRowID CHAR(38) not null,
INSTANCEVALIDATORid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table INSTANCEVALIDATOR add 
Target null /* ��������� */
;
alter  table INSTANCEVALIDATOR add 
Code null /* ������ */
;


/*���������*/
drop table OBJSTATUS/*��������� ���������� ��������� ���������*/ 
;
create table OBJSTATUS/*��������� ���������� ��������� ���������*/ (
ParentStructRowID CHAR(38) not null,
OBJSTATUSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table OBJSTATUS add 
name
 VARCHAR (80) null /* �������� */
;
alter  table OBJSTATUS add 
isStartup null 
 check (isStartup in ( -1/* �� */
, 0/* ��� */ )) /* ��������� */
;
alter  table OBJSTATUS add 
IsArchive null 
 check (IsArchive in ( -1/* �� */
, 0/* ��� */ )) /* �������� */
;
alter  table OBJSTATUS add 
the_comment null /* �������� */
;


/*����������� ��������*/
drop table NEXTSTATE/*������� ��������� */ 
;
create table NEXTSTATE/*������� ��������� */ (
ParentStructRowID CHAR(38) not null,
NEXTSTATEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table NEXTSTATE add 
TheState null /* ����������� ��������� */
;


/*����� ������*/
drop table OBJECTMODE/*����� ������*/ 
;
create table OBJECTMODE/*����� ������*/ (
ParentStructRowID CHAR(38) not null,
OBJECTMODEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table OBJECTMODE add 
Name
 VARCHAR (5) null /* �������� ������ */
;
alter  table OBJECTMODE add 
DefaultMode null 
 check (DefaultMode in ( -1/* �� */
, 0/* ��� */ )) /* ���� ����� �������� �������� ������� ������ ������� */
;
alter  table OBJECTMODE add 
TheComment null /* �������� */
;


/*����������� ��������*/
drop table STRUCTRESTRICTION/*���������� �� ������ � ������� ���������*/ 
;
create table STRUCTRESTRICTION/*���������� �� ������ � ������� ���������*/ (
ParentStructRowID CHAR(38) not null,
STRUCTRESTRICTIONid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table STRUCTRESTRICTION add 
Struct null /* ���������, ������ � ������� ��������� */
;
alter  table STRUCTRESTRICTION add 
AllowRead null 
 check (AllowRead in ( -1/* �� */
, 0/* ��� */ )) /* �������� �������� */
;
alter  table STRUCTRESTRICTION add 
AllowAdd null 
 check (AllowAdd in ( -1/* �� */
, 0/* ��� */ )) /* ��������� ��������� */
;
alter  table STRUCTRESTRICTION add 
AllowEdit null 
 check (AllowEdit in ( -1/* �� */
, 0/* ��� */ )) /* ��������� �������� */
;
alter  table STRUCTRESTRICTION add 
AllowDelete null 
 check (AllowDelete in ( -1/* �� */
, 0/* ��� */ )) /* ��������� ������� */
;


/*����������� �����*/
drop table FIELDRESTRICTION/*����������� �� ������ � ����� �������*/ 
;
create table FIELDRESTRICTION/*����������� �� ������ � ����� �������*/ (
ParentStructRowID CHAR(38) not null,
FIELDRESTRICTIONid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table FIELDRESTRICTION add 
ThePart null /* ���������, ������� ����������� ���� */
;
alter  table FIELDRESTRICTION add 
TheField null /* ����, �� ������� ������������� ����������� */
;
alter  table FIELDRESTRICTION add 
AllowRead null 
 check (AllowRead in ( -1/* �� */
, 0/* ��� */ )) /* �������� �������� */
;
alter  table FIELDRESTRICTION add 
AllowModify null 
 check (AllowModify in ( -1/* �� */
, 0/* ��� */ )) /* ��������� ����������� */
;
alter  table FIELDRESTRICTION add 
MandatoryField null 
 check (MandatoryField in ( 0/* ��� */
, -1/* �� ����������� */
, 1/* �� */ )) /* ������������ ���� */
;


/*����������� �������*/
drop table METHODRESTRICTION/*����������� �� ������������� ������� �������*/ 
;
create table METHODRESTRICTION/*����������� �� ������������� ������� �������*/ (
ParentStructRowID CHAR(38) not null,
METHODRESTRICTIONid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table METHODRESTRICTION add 
Part null /* ���������, ������� ����������� ����� */
;
alter  table METHODRESTRICTION add 
Method null /* ����� */
;
alter  table METHODRESTRICTION add 
IsRestricted null 
 check (IsRestricted in ( -1/* �� */
, 0/* ��� */ )) /* ��������� ������������ */
;


/*������ ����*/
drop table TYPEMENU/*������ ������ ����*/ 
;
create table TYPEMENU/*������ ������ ����*/ (
ParentStructRowID CHAR(38) not null,
TYPEMENUid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table TYPEMENU add 
Name
 VARCHAR (64) null /* �������� */
;
alter  table TYPEMENU add 
Caption
 VARCHAR (80) null /* ��������� */
;
alter  table TYPEMENU add 
ToolTip
 VARCHAR (80) null /* ��������� */
;
alter  table TYPEMENU add 
the_Action null /* ����� */
;
alter  table TYPEMENU add 
IsMenuItem null 
 check (IsMenuItem in ( -1/* �� */
, 0/* ��� */ )) /* �������� � ���� */
;
alter  table TYPEMENU add 
IsToolBarButton null 
 check (IsToolBarButton in ( -1/* �� */
, 0/* ��� */ )) /* �������� � ������ */
;
alter  table TYPEMENU add 
HotKey
 VARCHAR (20) null /* ������� ������� */
;


/*����������*/
drop table MTZAPP/*������ ������������� ����������*/ 
;
create table MTZAPP/*������ ������������� ����������*/ (
InstanceID CHAR(38) ,
MTZAPPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table MTZAPP add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table MTZAPP add 
DBName
 VARCHAR (64) null /* ���� ������ */
;
alter  table MTZAPP add 
TheComment null /* �������� */
;


/*������������ ����������*/
drop table ParentPackage/*���������� �� ������� ������� ������ ����������*/ 
;
create table ParentPackage/*���������� �� ������� ������� ������ ����������*/ (
ParentStructRowID CHAR(38) not null,
ParentPackageid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ParentPackage add 
Package null /* ���������� */
;


/*����� ���������*/
drop table GENPACKAGE/*����� ���������*/ 
;
create table GENPACKAGE/*����� ���������*/ (
InstanceID CHAR(38) ,
GENPACKAGEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table GENPACKAGE add 
Name
 VARCHAR (255) null /* �������� */
;


/*����������*/
drop table GENERATOR_TARGET/*����������*/ 
;
create table GENERATOR_TARGET/*����������*/ (
ParentStructRowID CHAR(38) not null,
GENERATOR_TARGETid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table GENERATOR_TARGET add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table GENERATOR_TARGET add 
TargetType null 
 check (TargetType in ( 0/* ���� */
, 4/* ��� */
, 3/* ������������ */
, 1/* ������ */
, 2/* ���������� */ )) /* ��� ��������� */
;
alter  table GENERATOR_TARGET add 
QueueName
 VARCHAR (255) null /* ������� */
;
alter  table GENERATOR_TARGET add 
GeneratorProgID
 VARCHAR (255) null /* COM ����� */
;
alter  table GENERATOR_TARGET add 
GeneratorStyle
 INTEGER null 
 check (GeneratorStyle in ( 0/* ���� ��� */
, 1/* ��� ���� ����� */ )) /* ������� */
;
alter  table GENERATOR_TARGET add 
TheDevelopmentEnv null 
 check (TheDevelopmentEnv in ( 2/* JAVA */
, 3/* OTHER */
, 1/* DOTNET */
, 0/* VB6 */ )) /* ����� ���������� */
;


/*������ ���*/
drop table GENMANUALCODE/*���, ������� �� ������������ � �������� ������*/ 
;
create table GENMANUALCODE/*���, ������� �� ������������ � �������� ������*/ (
ParentStructRowID CHAR(38) not null,
GENMANUALCODEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table GENMANUALCODE add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table GENMANUALCODE add 
the_Alias
 VARCHAR (80) null /* ��������� */
;
alter  table GENMANUALCODE add 
Code null /* ��� */
;


/*����������� ��������*/
drop table GENCONTROLS/*����������� ��������, ������� ������������ ��� ���������*/ 
;
create table GENCONTROLS/*����������� ��������, ������� ������������ ��� ���������*/ (
ParentStructRowID CHAR(38) not null,
GENCONTROLSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table GENCONTROLS add 
ControlProgID
 VARCHAR (255) null /* ProgID ������������ �������� */
;
alter  table GENCONTROLS add 
ControlClassID
 VARCHAR (40) null /* ����� �������������������� */
;
alter  table GENCONTROLS add 
VersionMajor
 integer null /* ������ */
;
alter  table GENCONTROLS add 
VersionMinor
 integer null /* ��������� */
;


/*����������*/
drop table GENREFERENCE/*����������, ������� ������������ ��� ���������*/ 
;
create table GENREFERENCE/*����������, ������� ������������ ��� ���������*/ (
ParentStructRowID CHAR(38) not null,
GENREFERENCEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table GENREFERENCE add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table GENREFERENCE add 
RefClassID
 VARCHAR (40) null /* ����� ������ */
;
alter  table GENREFERENCE add 
VersionMajor
 integer null /* ����� ������ */
;
alter  table GENREFERENCE add 
VersionMinor
 integer null /* ��������� */
;


/*�����������*/
drop table LocalizeInfo/**/ 
;
create table LocalizeInfo/**/ (
InstanceID CHAR(38) ,
LocalizeInfoid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table LocalizeInfo add 
LangFull
 VARCHAR (255) null /* ���� - �������� */
;
alter  table LocalizeInfo add 
LangShort
 VARCHAR (255) null /* ��� ����� */
;


/*����������*/
drop table PEKPQ_DEF/*�������� ���������� �� ������*/ 
;
create table PEKPQ_DEF/*�������� ���������� �� ������*/ (
InstanceID CHAR(38) ,
PEKPQ_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKPQ_DEF add 
sequence
 integer null /* � */
;
alter  table PEKPQ_DEF add 
TheDate
 DATETIME null /* ���� ���������� */
;
alter  table PEKPQ_DEF add 
TheDept null /* ������������� */
;
alter  table PEKPQ_DEF add 
TheComment null /* ���������� ������� */
;
alter  table PEKPQ_DEF add 
TheSumm null /* ���� ������� */
;
alter  table PEKPQ_DEF add 
ToSuplier null /* ���������� */
;
alter  table PEKPQ_DEF add 
TheDescription null /* ���������� */
;
alter  table PEKPQ_DEF add 
TheDogovor null /* ������� */
;
alter  table PEKPQ_DEF add 
Code1C
 VARCHAR (40) null /* ���1� */
;


/*�����*/
drop table ENTDIC_BANK/*�����*/ 
;
create table ENTDIC_BANK/*�����*/ (
InstanceID CHAR(38) ,
ENTDIC_BANKid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ENTDIC_BANK add 
BIC
 VARCHAR (11) null /* ��� */
;
alter  table ENTDIC_BANK add 
RKC
 VARCHAR (11) null /* ��� */
;
alter  table ENTDIC_BANK add 
ACC
 VARCHAR (20) null /* ���� */
;
alter  table ENTDIC_BANK add 
KORACC
 VARCHAR (20) null /* ���. ���� */
;
alter  table ENTDIC_BANK add 
SUBKORACC
 VARCHAR (20) null /* ��� ��� ���� */
;
alter  table ENTDIC_BANK add 
name
 VARCHAR (255) null /* �������� */
;
alter  table ENTDIC_BANK add 
Addr
 VARCHAR (255) null /* ����� */
;
alter  table ENTDIC_BANK add 
Code1C
 VARCHAR (40) null /* ���1� */
;


/*��� ��������*/
drop table ENTDIC_DOST/*��� ��������*/ 
;
create table ENTDIC_DOST/*��� ��������*/ (
InstanceID CHAR(38) ,
ENTDIC_DOSTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ENTDIC_DOST add 
Code
 VARCHAR (10) null /* ��� */
;
alter  table ENTDIC_DOST add 
name
 VARCHAR (255) null /* �������� */
;


/*������*/
drop table ENTDIC_TOWN/*������*/ 
;
create table ENTDIC_TOWN/*������*/ (
InstanceID CHAR(38) ,
ENTDIC_TOWNid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ENTDIC_TOWN add 
name
 VARCHAR (255) null /* �������� */
;
alter  table ENTDIC_TOWN add 
country null /* ������ */
;


/*��� ����������*/
drop table ENTDIC_TransportType/*���� ����������*/ 
;
create table ENTDIC_TransportType/*���� ����������*/ (
InstanceID CHAR(38) ,
ENTDIC_TransportTypeid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ENTDIC_TransportType add 
TheName
 VARCHAR (255) null /* �������� ���� */
;


/*��������������-�������� �����*/
drop table ENTDIC_OPF/*��������������-�������� �����*/ 
;
create table ENTDIC_OPF/*��������������-�������� �����*/ (
InstanceID CHAR(38) ,
ENTDIC_OPFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ENTDIC_OPF add 
name
 VARCHAR (255) null /* �������� */
;


/*������� ���������*/
drop table ENTDIC_EDIZM/*������� ���������*/ 
;
create table ENTDIC_EDIZM/*������� ���������*/ (
InstanceID CHAR(38) ,
ENTDIC_EDIZMid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ENTDIC_EDIZM add 
code
 VARCHAR (10) null /* ��� */
;
alter  table ENTDIC_EDIZM add 
name
 VARCHAR (255) null /* �������� */
;
alter  table ENTDIC_EDIZM add 
Netto null /* ������� ������ */
;
alter  table ENTDIC_EDIZM add 
baseEDIZM null /* ������� ������� ���. */
;


/*������*/
drop table ENTDIC_CURRENCY/*������*/ 
;
create table ENTDIC_CURRENCY/*������*/ (
InstanceID CHAR(38) ,
ENTDIC_CURRENCYid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ENTDIC_CURRENCY add 
name
 VARCHAR (255) null /* �������� */
;
alter  table ENTDIC_CURRENCY add 
Code
 VARCHAR (10) null /* ��� */
;


/*���� ������*/
drop table ENTDIC_CURCOURCE/*���� ������*/ 
;
create table ENTDIC_CURCOURCE/*���� ������*/ (
ParentStructRowID CHAR(38) not null,
ENTDIC_CURCOURCEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ENTDIC_CURCOURCE add 
CourceDate
 DATETIME null /* ���� */
;
alter  table ENTDIC_CURCOURCE add 
the_Value null /* ���� */
;
alter  table ENTDIC_CURCOURCE add 
Quantity null /* ���������� */
;


/*������*/
drop table ENTDIC_COUNTRY/*������*/ 
;
create table ENTDIC_COUNTRY/*������*/ (
InstanceID CHAR(38) ,
ENTDIC_COUNTRYid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ENTDIC_COUNTRY add 
Code
 VARCHAR (10) null /* ��� */
;
alter  table ENTDIC_COUNTRY add 
name
 VARCHAR (255) null /* �������� */
;


/*�������� ��������*/
drop table ENTDIC_REGION/*�������� ��������*/ 
;
create table ENTDIC_REGION/*�������� ��������*/ (
InstanceID CHAR(38) ,
ENTDIC_REGIONid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ENTDIC_REGION add 
Code
 VARCHAR (10) null /* ��� */
;
alter  table ENTDIC_REGION add 
name
 VARCHAR (255) null /* �������� */
;


/*����������  ��������� �����*/
drop table ST_MAIN/**/ 
;
create table ST_MAIN/**/ (
InstanceID CHAR(38) ,
ST_MAINid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ST_MAIN add 
AccessDate
 DATETIME null /* ���� */
;
alter  table ST_MAIN add 
UrlReferer
 VARCHAR (1024) null /* ���������� ����� */
;
alter  table ST_MAIN add 
UserAgent
 VARCHAR (256) null /* �������� ����� */
;
alter  table ST_MAIN add 
UserHostAddress
 VARCHAR (512) null /* ����� ����� */
;
alter  table ST_MAIN add 
UserHostName
 VARCHAR (512) null /* ��� ����� */
;
alter  table ST_MAIN add 
the_Description
 VARCHAR (1024) null /* ���������� */
;
alter  table ST_MAIN add 
WEBS_Page null /* ��������� �������� */
;


/*��������*/
drop table ST_DEF/**/ 
;
create table ST_DEF/**/ (
InstanceID CHAR(38) ,
ST_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ST_DEF add 
Name
 VARCHAR (1024) null /* ��� */
;
alter  table ST_DEF add 
WEBS null /* ���� */
;
alter  table ST_DEF add 
the_Description
 VARCHAR (4000) null /* ���������� */
;
alter  table ST_DEF add 
IsActive null 
 check (IsActive in ( -1/* �� */
, 0/* ��� */ )) /* ������� */
;


/*���������� ��������� ������� �����*/
drop table ST_PAGES/**/ 
;
create table ST_PAGES/**/ (
InstanceID CHAR(38) ,
ST_PAGESid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ST_PAGES add 
AccessDate
 DATETIME null /* ���� */
;
alter  table ST_PAGES add 
UrlReferer
 VARCHAR (1024) null /* ���������� ����� */
;
alter  table ST_PAGES add 
UserAgent
 VARCHAR (256) null /* �������� ����� */
;
alter  table ST_PAGES add 
UserHostAddress
 VARCHAR (512) null /* ����� ����� */
;
alter  table ST_PAGES add 
UserHostName
 VARCHAR (512) null /* ��� ����� */
;
alter  table ST_PAGES add 
the_Description
 VARCHAR (1024) null /* ���������� */
;
alter  table ST_PAGES add 
WEBS_Page null /* ��������� �������� */
;


/*�������� ���������� ������*/
drop table STDJournlaExtInfo/**/ 
;
create table STDJournlaExtInfo/**/ (
InstanceID CHAR(38) ,
STDJournlaExtInfoid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table STDJournlaExtInfo add 
TheName
 VARCHAR (255) null /* �������� */
;
alter  table STDJournlaExtInfo add 
TheJournalRef null /* ������ */
;


/*���������*/
drop table STDJournalExtParam/**/ 
;
create table STDJournalExtParam/**/ (
InstanceID CHAR(38) ,
STDJournalExtParamid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table STDJournalExtParam add 
FieldName
 VARCHAR (255) null /* ���� (��������) */
;
alter  table STDJournalExtParam add 
ParamName
 VARCHAR (80) null /* �������� */
;
alter  table STDJournalExtParam add 
TargetPlatform null /* ������� ��������� */
;


/*������� �������*/
drop table STDJournalExtFlt/**/ 
;
create table STDJournalExtFlt/**/ (
InstanceID CHAR(38) ,
STDJournalExtFltid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table STDJournalExtFlt add 
ViewSource
 VARCHAR (255) null /* ������ ������� */
;


/*���� �������*/
drop table STDJournalExtField/**/ 
;
create table STDJournalExtField/**/ (
ParentStructRowID CHAR(38) not null,
STDJournalExtFieldid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table STDJournalExtField add 
ViewField
 VARCHAR (255) null /* ������� ������� */
;
alter  table STDJournalExtField add 
FieldSource
 VARCHAR (255) null /* ���� (��������) */
;
alter  table STDJournalExtField add 
TargetPlatform null /* ������� ��������� */
;
alter  table STDJournalExtField add 
ConstantValue
 VARCHAR (255) null /* �������� */
;
alter  table STDJournalExtField add 
ConditionType
 INTEGER null 
 check (ConditionType in ( 2/* <> */
, 3/* > */
, 1/* = */
, 4/* >= */
, 7/* <= */
, 8/* like */
, 6/* < */
, 0/* none */ )) /* ������� �� ���� */
;


/*���*/
drop table CAL_DAYS/*���� ���������*/ 
;
create table CAL_DAYS/*���� ���������*/ (
InstanceID CHAR(38) ,
CAL_DAYSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table CAL_DAYS add 
TheDate
 DATETIME null /* ���� */
;
alter  table CAL_DAYS add 
IsHoliday null 
 check (IsHoliday in ( -1/* �� */
, 0/* ��� */ )) /* �������� */
;


/*������� ����*/
drop table CAL_TIME/*������� ����� � �������� ���*/ 
;
create table CAL_TIME/*������� ����� � �������� ���*/ (
ParentStructRowID CHAR(38) not null,
CAL_TIMEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table CAL_TIME add 
FromTime
 datetime null /* ������ ������� */
;
alter  table CAL_TIME add 
ToTime
 datetime null /* ����� ������� */
;


/*��������*/
drop table CAL_HEAD/*�������� ���������*/ 
;
create table CAL_HEAD/*�������� ���������*/ (
InstanceID CHAR(38) ,
CAL_HEADid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table CAL_HEAD add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table CAL_HEAD add 
FillStyle
 VARCHAR (255) null /* ������� ���������� */
;


/*���� ���������*/
drop table SrvMessageInfo/*���� ���������*/ 
;
create table SrvMessageInfo/*���� ���������*/ (
InstanceID CHAR(38) ,
SrvMessageInfoid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table SrvMessageInfo add 
ForUser null /* ��� ������������ */
;
alter  table SrvMessageInfo add 
msgDate
 DATETIME null /* ���� */
;
alter  table SrvMessageInfo add 
MsgInfo null /* ����� ��������� */
;
alter  table SrvMessageInfo add 
TheDocument null /* �������� */
;
alter  table SrvMessageInfo add 
ReadTime
 DATETIME null /* ����� ��������� */
;


/*��������*/
drop table PEKNAL_DEF/*������ ��������� ���� �������� ������*/ 
;
create table PEKNAL_DEF/*������ ��������� ���� �������� ������*/ (
InstanceID CHAR(38) ,
PEKNAL_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKNAL_DEF add 
TheNumber
 VARCHAR (20) null /* ����� */
;
alter  table PEKNAL_DEF add 
TheDate
 DATETIME null /* ���� ������ */
;
alter  table PEKNAL_DEF add 
TheSumm null /* ����� ������ */
;
alter  table PEKNAL_DEF add 
ThePEKZ null /* ������ */
;
alter  table PEKNAL_DEF add 
TheDept null /* �� ������������� */
;
alter  table PEKNAL_DEF add 
FromClient null /* �� ������� */
;
alter  table PEKNAL_DEF add 
TheComment null /* ���������� ������� */
;
alter  table PEKNAL_DEF add 
RceivedBy null /* ��� ������� */
;
alter  table PEKNAL_DEF add 
Code1C
 VARCHAR (40) null /* ���1� */
;


/*�������� � �������*/
drop table PEKNAL_PZ/*�������� ������ � �������*/ 
;
create table PEKNAL_PZ/*�������� ������ � �������*/ (
InstanceID CHAR(38) ,
PEKNAL_PZid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKNAL_PZ add 
PZ null /* ������ */
;
alter  table PEKNAL_PZ add 
TheSumm null /* ����� */
;


/*��������� �� ��������*/
drop table PEKNAL_ROWS/*�������� ��������� �������� ������ �� ��������*/ 
;
create table PEKNAL_ROWS/*�������� ��������� �������� ������ �� ��������*/ (
InstanceID CHAR(38) ,
PEKNAL_ROWSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKNAL_ROWS add 
TheNumber
 VARCHAR (20) null /* ����� */
;
alter  table PEKNAL_ROWS add 
TheDate
 DATETIME null /* ���� ������ */
;
alter  table PEKNAL_ROWS add 
TheSumm null /* ����� ������ */
;
alter  table PEKNAL_ROWS add 
TheDept null /* ������������� */
;
alter  table PEKNAL_ROWS add 
FromClient null /* �� ������� */
;
alter  table PEKNAL_ROWS add 
TheDogovor null /* ������� */
;


/*����*/
drop table FileDef/*����*/ 
;
create table FileDef/*����*/ (
InstanceID CHAR(38) ,
FileDefid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table FileDef add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table FileDef add 
the_Comment null /* ��������� */
;


/*������*/
drop table FileVersion/*������ �����*/ 
;
create table FileVersion/*������ �����*/ (
InstanceID CHAR(38) ,
FileVersionid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
;
alter  table FileVersion add 
Version
 VARCHAR (20) null /* ����� ������ */
;
alter  table FileVersion add 
Ext
 VARCHAR (5) null /* ���������� */
;
alter  table FileVersion add 
CurrentVersion null 
 check (CurrentVersion in ( -1/* �� */
, 0/* ��� */ )) /* ������� ������ */
;
alter  table FileVersion add 
the_Comment null /* ��������� */
;
alter  table FileVersion add 
FileData null /* ������ */
;
alter  table FileVersion add 
 FileData_EXT char(4) null
;


/*����*/
drop table Num_zones/*���� ���������� �������*/ 
;
create table Num_zones/*���� ���������� �������*/ (
InstanceID CHAR(38) ,
Num_zonesid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table Num_zones add 
ZoneMask
 VARCHAR (255) null /* ����� ���� */
;


/*������*/
drop table Num_Values/*���������� ������*/ 
;
create table Num_Values/*���������� ������*/ (
ParentStructRowID CHAR(38) not null,
Num_Valuesid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table Num_Values add 
the_Value
 integer null /* �������� */
;
alter  table Num_Values add 
OwnerPartName
 VARCHAR (64) null /* ������ */
;
alter  table Num_Values add 
OwnerRowID
 uniqueidentifier null /* ������������� ������ */
;


/*��������*/
drop table Num_head/*�������� ����������*/ 
;
create table Num_head/*�������� ����������*/ (
InstanceID CHAR(38) ,
Num_headid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table Num_head add 
Name
 VARCHAR (80) null /* �������� */
;
alter  table Num_head add 
Shema
 INTEGER null 
 check (Shema in ( 0/* ������ ���� */
, 1/* �� ���� */
, 4/* �� ��� */
, 2/* �� �������� */
, 3/* �� ������ */
, 10/* ������������ ���� */ )) /* ����� ��������� */
;


/*������� ���������*/
drop table BaseSetting/**/ 
;
create table BaseSetting/**/ (
InstanceID CHAR(38) ,
BaseSettingid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table BaseSetting add 
FIL null /* ������ */
;
alter  table BaseSetting add 
NDS
 VARCHAR (10) null /* ������ ��� */
;
alter  table BaseSetting add 
NewClientTRF null /* ����� ��� ������ ������� */
;
alter  table BaseSetting add 
SingleSendTRF null /* ����� ��� ������� �������� */
;
alter  table BaseSetting add 
SingleSendCli null /* ������ ��� ���� ������� ������ */
;
alter  table BaseSetting add 
Passport
 VARCHAR (200) null /* ������ �������� ��� �116 */
;
alter  table BaseSetting add 
NDS103 null 
 check (NDS103 in ( -1/* �� */
, 0/* ��� */ )) /* �103 � ��� */
;
alter  table BaseSetting add 
Count103
 VARCHAR (5) null /* ���-�� �103 */
;
alter  table BaseSetting add 
TrTypeDef null /* ��� �������� �� ��������� */
;
alter  table BaseSetting add 
Direction null /* ����������� �� ��������� */
;
alter  table BaseSetting add 
WED null /* ��. ���. ���� �� ��������� */
;
alter  table BaseSetting add 
VED null /* ��. ���. ������ �� ��������� */
;
alter  table BaseSetting add 
Code null 
 check (Code in ( -1/* �� */
, 0/* ��� */ )) /* ����������� ����� ��� ����������� */
;
alter  table BaseSetting add 
IDX
 VARCHAR (10) null /* ������ ��������� ��������� */
;
alter  table BaseSetting add 
DateSHCode
 VARCHAR (10) null /* ����� ��� ������ ��� �����-���� */
;
alter  table BaseSetting add 
Round500 null 
 check (Round500 in ( -1/* �� */
, 0/* ��� */ )) /* ���������� �� 500 ��. */
;
alter  table BaseSetting add 
AccountGeneral
 VARCHAR (100) null /* ������� ��������� */
;
alter  table BaseSetting add 
CashMan
 VARCHAR (255) null /* ������ */
;
alter  table BaseSetting add 
addInvoiceInfo null /* ������������ (��� ����-�������) */
;
alter  table BaseSetting add 
genDirector
 VARCHAR (255) null /* ������������ ����������� */
;


/*��������*/
drop table Reports/*��������*/ 
;
create table Reports/*��������*/ (
InstanceID CHAR(38) ,
Reportsid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table Reports add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table Reports add 
ReportFile null /* ���� ������ */
;
alter  table Reports add 
 ReportFile_EXT char(4) null
;
alter  table Reports add 
Caption
 VARCHAR (255) null /* ��������� */
;
alter  table Reports add 
PrepareMethod null /* ����� ��� ������������ */
;
alter  table Reports add 
ReportType
 INTEGER null 
 check (ReportType in ( 1/* ��������� ������� */
, 0/* ������� */
, 3/* ������� �� WORD ������� */
, 2/* ������ ������ */
, 4/* ������� �� Excel ������� */ )) /* ��� ������ */
;
alter  table Reports add 
TheReportExt null /* ���������� ��� �������� ������ */
;
alter  table Reports add 
ReportView
 VARCHAR (255) null /* ������� ������ */
;
alter  table Reports add 
TheComment null /* �������� */
;


/*������*/
drop table RPTStruct/*������*/ 
;
create table RPTStruct/*������*/ (
InstanceID CHAR(38) ,
RPTStructid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
;
alter  table RPTStruct add 
Name
 VARCHAR (64) null /* �������� */
;
alter  table RPTStruct add 
Caption
 VARCHAR (255) null /* ��������� */
;


/*���� ������*/
drop table RPTFields/*���� ������*/ 
;
create table RPTFields/*���� ������*/ (
ParentStructRowID CHAR(38) not null,
RPTFieldsid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table RPTFields add 
Name
 VARCHAR (64) null /* �������� */
;
alter  table RPTFields add 
FieldType null /* ��� ���� */
;
alter  table RPTFields add 
FieldSize
 integer null /* ������ */
;
alter  table RPTFields add 
Caption
 VARCHAR (255) null /* ��������� */
;


/*�������*/
drop table RPTFormula/*�������*/ 
;
create table RPTFormula/*�������*/ (
InstanceID CHAR(38) ,
RPTFormulaid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table RPTFormula add 
Name
 VARCHAR (64) null /* �������� */
;
alter  table RPTFormula add 
Code null /* ��������� */
;
alter  table RPTFormula add 
Platform null /* ��������� */
;


/*��������*/
drop table PEKRKO_DEF/*������ ��������� ���� �������� �������� �� �����*/ 
;
create table PEKRKO_DEF/*������ ��������� ���� �������� �������� �� �����*/ (
InstanceID CHAR(38) ,
PEKRKO_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKRKO_DEF add 
TheNumber
 VARCHAR (20) null /* ����� */
;
alter  table PEKRKO_DEF add 
TheDate
 DATETIME null /* ���� ������ */
;
alter  table PEKRKO_DEF add 
TheSumm null /* ����� ������ */
;
alter  table PEKRKO_DEF add 
ThePEKZ null /* ������ */
;
alter  table PEKRKO_DEF add 
TheDept null /* �� ������������� */
;
alter  table PEKRKO_DEF add 
FromClient null /* ������-���������� */
;
alter  table PEKRKO_DEF add 
TheComment null /* ���������� ������� */
;
alter  table PEKRKO_DEF add 
EmpPayed null /* ��� ����� */
;
alter  table PEKRKO_DEF add 
Code1C
 VARCHAR (40) null /* ���1� */
;


/*��������� �� ��������*/
drop table PEKRKO_ROWS/*�������� ��������� �������� �������� �� ��������*/ 
;
create table PEKRKO_ROWS/*�������� ��������� �������� �������� �� ��������*/ (
InstanceID CHAR(38) ,
PEKRKO_ROWSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKRKO_ROWS add 
TheNumber
 VARCHAR (20) null /* ����� */
;
alter  table PEKRKO_ROWS add 
TheDate
 DATETIME null /* ���� ������ */
;
alter  table PEKRKO_ROWS add 
TheSumm null /* ����� ������ */
;
alter  table PEKRKO_ROWS add 
TheDept null /* ������������� */
;
alter  table PEKRKO_ROWS add 
FromClient null /* �� ������� */
;
alter  table PEKRKO_ROWS add 
TheDogovor null /* ������� */
;


/*������� �� ������ ����*/
drop table PEKTRF_REGALL/*������� �� ������ ����*/ 
;
create table PEKTRF_REGALL/*������� �� ������ ����*/ (
InstanceID CHAR(38) ,
PEKTRF_REGALLid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKTRF_REGALL add 
WeightFrom null /* ��������� ��� �� */
;
alter  table PEKTRF_REGALL add 
WeightTo null /* ��������� ��� �� */
;
alter  table PEKTRF_REGALL add 
WeightEDIZM null /* ��. ���. ���� */
;
alter  table PEKTRF_REGALL add 
PricePercent null /* ������� �� ������ */
;
alter  table PEKTRF_REGALL add 
FixedPrice null /* ������������� ���� */
;
alter  table PEKTRF_REGALL add 
PriceCurrency null /* ������ ������������� ���� */
;


/*������*/
drop table PEKTRF_DECR/*������*/ 
;
create table PEKTRF_DECR/*������*/ (
InstanceID CHAR(38) ,
PEKTRF_DECRid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKTRF_DECR add 
Name
 VARCHAR (255) null /* �������� ������ */
;
alter  table PEKTRF_DECR add 
DecrPercent null /* ������� � ������ */
;


/*��������*/
drop table PEKTRF_ADDS/*��������*/ 
;
create table PEKTRF_ADDS/*��������*/ (
InstanceID CHAR(38) ,
PEKTRF_ADDSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKTRF_ADDS add 
Name null /* �������� �������� */
;
alter  table PEKTRF_ADDS add 
AddPercent null /* ������� � �������� ������ */
;
alter  table PEKTRF_ADDS add 
MinValue null /* ����������� �������� */
;
alter  table PEKTRF_ADDS add 
MaxValue null /* ������������ �������� */
;


/*����� ��������*/
drop table PEKTRF_DEF/*����� ��������*/ 
;
create table PEKTRF_DEF/*����� ��������*/ (
InstanceID CHAR(38) ,
PEKTRF_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKTRF_DEF add 
VolumeTarif null 
 check (VolumeTarif in ( -1/* �� */
, 0/* ��� */ )) /* ����� �� ������ */
;
alter  table PEKTRF_DEF add 
StartDate
 DATETIME null /* ������ �������� */
;
alter  table PEKTRF_DEF add 
TType null /* ��� ������ */
;
alter  table PEKTRF_DEF add 
TRType null /* ��� �������� */
;
alter  table PEKTRF_DEF add 
IncludeNDS null 
 check (IncludeNDS in ( -1/* �� */
, 0/* ��� */ )) /* ���� � ��� */
;
alter  table PEKTRF_DEF add 
MinPPOWeight null /* ����������� ��������� ��� */
;
alter  table PEKTRF_DEF add 
SupplierTarif null 
 check (SupplierTarif in ( -1/* �� */
, 0/* ��� */ )) /* ����� ���������� */
;
alter  table PEKTRF_DEF add 
Supplier null /* ��������� */
;
alter  table PEKTRF_DEF add 
EndDate
 DATETIME null /* ����� �������� ������ */
;
alter  table PEKTRF_DEF add 
TheFilial null /* ������ */
;
alter  table PEKTRF_DEF add 
NalAdds null /* �������� �� �������� ������ */
;


/*������������*/
drop table PEKTRF_AUTO/*��������� ������������ �����*/ 
;
create table PEKTRF_AUTO/*��������� ������������ �����*/ (
InstanceID CHAR(38) ,
PEKTRF_AUTOid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKTRF_AUTO add 
AutoType null /* ��� �������������� */
;
alter  table PEKTRF_AUTO add 
ForTime null 
 check (ForTime in ( -1/* �� */
, 0/* ��� */ )) /* �� ����� */
;
alter  table PEKTRF_AUTO add 
ByLength null 
 check (ByLength in ( -1/* �� */
, 0/* ��� */ )) /* �� ���������� */
;
alter  table PEKTRF_AUTO add 
LengthPrice null /* ��������� �� �� */
;
alter  table PEKTRF_AUTO add 
HourPrice null /* ��������� ���� */
;


/*������ �� ������*/
drop table PEKTRF_SRV/*������ �� ������*/ 
;
create table PEKTRF_SRV/*������ �� ������*/ (
InstanceID CHAR(38) ,
PEKTRF_SRVid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKTRF_SRV add 
SrvTYPE null /* ������ */
;
alter  table PEKTRF_SRV add 
Price null /* ���� */
;
alter  table PEKTRF_SRV add 
TheCurrency null /* ������ */
;
alter  table PEKTRF_SRV add 
EDIZM null /* ��. ���. */
;
alter  table PEKTRF_SRV add 
Quant null /* ���������� */
;


/*���������������*/
drop table PEKTRF_TR/*���������������*/ 
;
create table PEKTRF_TR/*���������������*/ (
InstanceID CHAR(38) ,
PEKTRF_TRid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKTRF_TR add 
Train null /* ����������� */
;
alter  table PEKTRF_TR add 
ToST null /* �� ������� */
;
alter  table PEKTRF_TR add 
Price null /* ���� */
;
alter  table PEKTRF_TR add 
TheCurrency null /* ������ */
;
alter  table PEKTRF_TR add 
TheQuantity null /* ���������� */
;
alter  table PEKTRF_TR add 
EDIZM null /* ������� ��������� */
;


/*������� �� ����*/
drop table PEKTRF_REGRTR/*������� �� ����*/ 
;
create table PEKTRF_REGRTR/*������� �� ����*/ (
ParentStructRowID CHAR(38) not null,
PEKTRF_REGRTRid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKTRF_REGRTR add 
WeightFrom null /* ��������� ��� �� */
;
alter  table PEKTRF_REGRTR add 
WeightTo null /* ��������� ��� �� */
;
alter  table PEKTRF_REGRTR add 
WeightEDIZM null /* ��. ���. ���� */
;
alter  table PEKTRF_REGRTR add 
PricePercent null /* ������� �� ������ */
;
alter  table PEKTRF_REGRTR add 
FixedPrice null /* ������������� ���� */
;
alter  table PEKTRF_REGRTR add 
PriceCurrency null /* ������ ������������� ���� */
;


/*�������� ������*/
drop table PEKCL_DEF/*�������� ������*/ 
;
create table PEKCL_DEF/*�������� ������*/ (
InstanceID CHAR(38) ,
PEKCL_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKCL_DEF add 
TheDep null /* ������ */
;
alter  table PEKCL_DEF add 
LimDate
 DATETIME null /* ���� */
;


/*������� ������*/
drop table PEKCL_DAYLY/*������� ������*/ 
;
create table PEKCL_DAYLY/*������� ������*/ (
InstanceID CHAR(38) ,
PEKCL_DAYLYid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKCL_DAYLY add 
Train null /* ����� */
;
alter  table PEKCL_DAYLY add 
GOTYPE null /* ��� ��� */
;
alter  table PEKCL_DAYLY add 
TheValue null /* ����� */
;
alter  table PEKCL_DAYLY add 
ValueEDIZM null /* ��. ���. ������ */
;
alter  table PEKCL_DAYLY add 
WeightValue null /* ��� */
;
alter  table PEKCL_DAYLY add 
WeightEDIZM null /* ��. ���.���� */
;
alter  table PEKCL_DAYLY add 
the_Description null /* �������� */
;


/*����� ��� ��������*/
drop table PEKL_TOLOAD/*����� ��� ��������*/ 
;
create table PEKL_TOLOAD/*����� ��� ��������*/ (
ParentStructRowID CHAR(38) not null,
PEKL_TOLOADid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKL_TOLOAD add 
SRCPekZ null /* �� ������ */
;
alter  table PEKL_TOLOAD add 
TheValue null /* ����� */
;
alter  table PEKL_TOLOAD add 
ValueEDIZM null /* ��. ���. ������ */
;
alter  table PEKL_TOLOAD add 
WeightValue null /* ��� */
;
alter  table PEKL_TOLOAD add 
WeightEDIZM null /* ��. ���.���� */
;


/*��������*/
drop table MTZExt_def/*������ ������������������ ����������*/ 
;
create table MTZExt_def/*������ ������������������ ����������*/ (
InstanceID CHAR(38) ,
MTZExt_defid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table MTZExt_def add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table MTZExt_def add 
ExtType null 
 check (ExtType in ( 1/* OnFormExt */
, 7/* CodeGenerator */
, 3/* JrnlAddExt */
, 6/* VerifyRowExt */
, 0/* StatusExt */
, 8/* ARMGenerator */
, 5/* DefaultExt */
, 2/* CustomExt */
, 4/* JrnlRunExt */ )) /* ��� ���������� */
;
alter  table MTZExt_def add 
TheDescription null /* �������� */
;


/*���������� ����������*/
drop table MTZExtRel/*���������� ���������� ��� ������ �������������� �������*/ 
;
create table MTZExtRel/*���������� ���������� ��� ������ �������������� �������*/ (
InstanceID CHAR(38) ,
MTZExtRelid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table MTZExtRel add 
ThePlatform null 
 check (ThePlatform in ( 2/* JAVA */
, 3/* OTHER */
, 1/* DOTNET */
, 0/* VB6 */ )) /* ���������� */
;
alter  table MTZExtRel add 
TheClassName
 VARCHAR (255) null /* �������� ������ */
;
alter  table MTZExtRel add 
TheLibraryName
 VARCHAR (255) null /* �������� ���������� */
;


/*��������*/
drop table InfoStoreDef/*�������� ��������*/ 
;
create table InfoStoreDef/*�������� ��������*/ (
InstanceID CHAR(38) ,
InfoStoreDefid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table InfoStoreDef add 
TheGroup null /* ������ */
;
alter  table InfoStoreDef add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table InfoStoreDef add 
InfoStoreType
 INTEGER null 
 check (InfoStoreType in ( 2/* ��������� */
, 1/* ������������ */
, 0/*  ����� */ )) /* ��� �������� */
;
alter  table InfoStoreDef add 
TheUser null /* ������������ */
;


/*�����*/
drop table Folder/*����� ��������*/ 
;
create table Folder/*����� ��������*/ (
InstanceID CHAR(38) ,
Folderid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
;
alter  table Folder add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table Folder add 
FolderType null 
 check (FolderType in ( 2/* ��������� */
, 10/* ����������� */
, 5/* ��������� */
, 0/*   */
, 1/* �������� */
, 9/* ���������� */
, 4/* ������ */
, 8/* � ������ */
, 7/* ��������� */
, 6/* ������������ */
, 3/* ��������� */ )) /* ��� ����� */
;


/*���������*/
drop table Shortcut/*������ ����������*/ 
;
create table Shortcut/*������ ����������*/ (
ParentStructRowID CHAR(38) not null,
Shortcutid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table Shortcut add 
DocItem null /* �������� */
;
alter  table Shortcut add 
StartMode
 VARCHAR (255) null /* ����� */
;


/*�������� �������*/
drop table PEKP_DEF/*�������� �������*/ 
;
create table PEKP_DEF/*�������� �������*/ (
InstanceID CHAR(38) ,
PEKP_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKP_DEF add 
FromClient null /* ������ */
;
alter  table PEKP_DEF add 
PLPNUM
 VARCHAR (20) null /* � ��������� */
;
alter  table PEKP_DEF add 
PLPDate
 DATETIME null /* ���� ��������� */
;
alter  table PEKP_DEF add 
PLPSumm null /* ����� */
;
alter  table PEKP_DEF add 
TheCurrncy null /* ������ */
;
alter  table PEKP_DEF add 
TheDogovor null /* � �������� */
;
alter  table PEKP_DEF add 
TheComment null /* ���������� ������� */
;
alter  table PEKP_DEF add 
TheDept null /* ������������� */
;
alter  table PEKP_DEF add 
Code1C
 VARCHAR (40) null /* ���1� */
;


/*������ � ���������� ���������*/
drop table PEKP_PZ/*�������� ������ � ���������� ���������*/ 
;
create table PEKP_PZ/*�������� ������ � ���������� ���������*/ (
InstanceID CHAR(38) ,
PEKP_PZid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKP_PZ add 
PZ null /* ������ */
;
alter  table PEKP_PZ add 
TheSumm null /* ����� */
;


/*������ �������*/
drop table SysLog/*������ �������, ������� ��������� � �������*/ 
;
create table SysLog/*������ �������, ������� ��������� � �������*/ (
InstanceID CHAR(38) ,
SysLogid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table SysLog add 
TheSession null /* ������ */
;
alter  table SysLog add 
the_Resource
 VARCHAR (255) null /* ������ */
;
alter  table SysLog add 
LogStructID
 VARCHAR (255) null /* ������ � ������� ��������� �������� */
;
alter  table SysLog add 
VERB
 VARCHAR (80) null /* �������� */
;
alter  table SysLog add 
LogInstanceID
 uniqueidentifier null /* ������������� ��������� */
;


/*������ ������������*/
drop table the_Session/*������������������ ������ �������������*/ 
;
create table the_Session/*������������������ ������ �������������*/ (
InstanceID CHAR(38) ,
the_Sessionid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table the_Session add 
UserRole null /* ������� ���� ������������ */
;
alter  table the_Session add 
ClosedAt
 DATETIME null /* ������ �������� */
;
alter  table the_Session add 
Closed
 integer null 
 check (Closed in ( 1/* �� */
, 0/* ��� */ )) /* ������� */
;
alter  table the_Session add 
Usersid null /* ������������ */
;
alter  table the_Session add 
LastAccess
 DATETIME null /* ��������� ������������� */
;
alter  table the_Session add 
StartAt
 DATETIME null /* ������ �������� */
;
alter  table the_Session add 
Lang
 VARCHAR (25) null /* ���� */
;


/*������ ������� �������*/
drop table LogReader/*���������, ������� ������������ ���� ��� 
����������� ���� �������.*/ 
;
create table LogReader/*���������, ������� ������������ ���� ��� 
����������� ���� �������.*/ (
InstanceID CHAR(38) ,
LogReaderid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table LogReader add 
Name
 VARCHAR (80) null /* �������� */
;
alter  table LogReader add 
AutoStart
 integer null 
 check (AutoStart in ( 1/* �� */
, 0/* ��� */ )) /* ������������������ ������ */
;
alter  table LogReader add 
AutoProgid
 VARCHAR (255) null /* ����� ��� ��������������� ������� */
;
alter  table LogReader add 
ReadMarker
 DATETIME null /* ���� ��������� ����������� ������ */
;
alter  table LogReader add 
StartInterval
 integer null /* �������� ������� (���) */
;
alter  table LogReader add 
LastStart
 DATETIME null /* ���� ���������� ������� */
;
alter  table LogReader add 
LastStop
 DATETIME null /* ���� �������� �������� */
;


/*��������*/
drop table Verb/*���������� �������� �������*/ 
;
create table Verb/*���������� �������� �������*/ (
InstanceID CHAR(38) ,
Verbid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table Verb add 
Name
 VARCHAR (80) null /* �������� */
;


/*������������*/
drop table Users/*������������*/ 
;
create table Users/*������������*/ (
InstanceID CHAR(38) ,
Usersid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table Users add 
Family
 VARCHAR (255) null /* ������� */
;
alter  table Users add 
Name
 VARCHAR (64) null /* ��� */
;
alter  table Users add 
SurName
 VARCHAR (255) null /* �������� */
;
alter  table Users add 
Login
 VARCHAR (64) null /* ��� ��� ����� */
;
alter  table Users add 
Password varchar(80) null /* ������ */
;
alter  table Users add 
DomaiName
 VARCHAR (255) null /* �������� ��� */
;
alter  table Users add 
EMail varchar(255) null /* e-mail */
;
alter  table Users add 
Phone
 VARCHAR (20) null /* ������� */
;
alter  table Users add 
LocalPhone
 VARCHAR (20) null /* ������� ������� */
;
alter  table Users add 
MobilePhone
 VARCHAR (20) null /* ��������� ������� */
;
alter  table Users add 
Photo null /* ���� */
;
alter  table Users add 
BirthDay
 DATETIME null /* ���� �������� */
;
alter  table Users add 
Activity null /* ������ ���������� */
;
alter  table Users add 
CertificateID
 VARCHAR (255) null /* CertificateID */
;
alter  table Users add 
CertData null /* CertData */
;
alter  table Users add 
ClientDef null /* ���������� � �������� */
;
alter  table Users add 
PersonaData null /* PersonaData */
;


/*������*/
drop table Groups/*������*/ 
;
create table Groups/*������*/ (
InstanceID CHAR(38) ,
Groupsid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table Groups add 
Name
 VARCHAR (80) null /* �������� */
;


/*������ ������*/
drop table GroupUser/*������ ������*/ 
;
create table GroupUser/*������ ������*/ (
ParentStructRowID CHAR(38) not null,
GroupUserid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table GroupUser add 
TheUser null /* ������������ */
;


/*������ ��������*/
drop table VRDContractStage/*������ ��������*/ 
;
create table VRDContractStage/*������ ��������*/ (
InstanceID CHAR(38) ,
VRDContractStageid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRDContractStage add 
Name
 VARCHAR (255) null /* �������� */
;


/*��� ������*/
drop table VRDRreportType/*��� ������*/ 
;
create table VRDRreportType/*��� ������*/ (
InstanceID CHAR(38) ,
VRDRreportTypeid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRDRreportType add 
Name
 VARCHAR (255) null /* �������� */
;


/*���� ��������*/
drop table VRDPrjType/*���� ��������*/ 
;
create table VRDPrjType/*���� ��������*/ (
InstanceID CHAR(38) ,
VRDPrjTypeid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRDPrjType add 
Name
 VARCHAR (255) null /* �������� */
;


/*����������� ������������*/
drop table VRDStream/*����������� ������������*/ 
;
create table VRDStream/*����������� ������������*/ (
InstanceID CHAR(38) ,
VRDStreamid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRDStream add 
Name
 VARCHAR (255) null /* ��������� */
;


/*������������������*/
drop table VRDInterest/*������������������*/ 
;
create table VRDInterest/*������������������*/ (
InstanceID CHAR(38) ,
VRDInterestid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRDInterest add 
Name
 VARCHAR (255) null /* �������� */
;


/*��� ���������*/
drop table VRDDocType/*��� ���������*/ 
;
create table VRDDocType/*��� ���������*/ (
InstanceID CHAR(38) ,
VRDDocTypeid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRDDocType add 
Name
 VARCHAR (255) null /* �������� */
;


/*����������*/
drop table VRDLoyalty/*����������*/ 
;
create table VRDLoyalty/*����������*/ (
InstanceID CHAR(38) ,
VRDLoyaltyid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRDLoyalty add 
the_Level
 VARCHAR (255) null /* ������� */
;


/*�����*/
drop table VRDMarket/*�����*/ 
;
create table VRDMarket/*�����*/ (
InstanceID CHAR(38) ,
VRDMarketid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
;
alter  table VRDMarket add 
Name
 VARCHAR (255) null /* �������� */
;


/*�������� ����*/
drop table MTZSEC_RIGHT/*�������� ���� ��� ������ ������*/ 
;
create table MTZSEC_RIGHT/*�������� ���� ��� ������ ������*/ (
InstanceID CHAR(38) ,
MTZSEC_RIGHTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table MTZSEC_RIGHT add 
Piority
 integer null /* ��������� */
;
alter  table MTZSEC_RIGHT add 
TheGroup null /* ������ */
;
alter  table MTZSEC_RIGHT add 
ProtectedItem
 VARCHAR (255) null /* ���������� ������� */
;
alter  table MTZSEC_RIGHT add 
Allow null 
 check (Allow in ( -1/* �� */
, 0/* ��� */ )) /* ���������� */
;


/*���������� ���������*/
drop table VRCAccounts/*���������� ���������*/ 
;
create table VRCAccounts/*���������� ���������*/ (
InstanceID CHAR(38) ,
VRCAccountsid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRCAccounts add 
BANK null /* ���� */
;
alter  table VRCAccounts add 
acc
 VARCHAR (20) null /* � ����� */
;
alter  table VRCAccounts add 
fillial null /* �������� ������� */
;
alter  table VRCAccounts add 
DefaultAccount null 
 check (DefaultAccount in ( -1/* �� */
, 0/* ��� */ )) /* �������� ���� ��� �������� */
;
alter  table VRCAccounts add 
Code1C
 VARCHAR (40) null /* ���1� */
;


/*����� ��������*/
drop table VRCTorg/*����� ��������*/ 
;
create table VRCTorg/*����� ��������*/ (
InstanceID CHAR(38) ,
VRCTorgid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRCTorg add 
Address null /* ����� */
;
alter  table VRCTorg add 
name
 VARCHAR (255) null /* �������� */
;
alter  table VRCTorg add 
Town null /* ����� */
;


/*���. ����������*/
drop table VRCAditional/*���. ����������*/ 
;
create table VRCAditional/*���. ����������*/ (
InstanceID CHAR(38) ,
VRCAditionalid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRCAditional add 
KPP
 VARCHAR (9) null /* ��� */
;
alter  table VRCAditional add 
Country null /* ������ */
;
alter  table VRCAditional add 
town null /* ����� */
;
alter  table VRCAditional add 
district
 VARCHAR (255) null /* ����� */
;
alter  table VRCAditional add 
uraddr null /* ����������� ����� */
;
alter  table VRCAditional add 
urphone
 VARCHAR (20) null /* ������� �� ��. ������ */
;
alter  table VRCAditional add 
regdate
 DATETIME null /* ���� ����������� */
;
alter  table VRCAditional add 
regby null /* ��� ��������������� */
;
alter  table VRCAditional add 
Stream null /* ����������� ����������� */
;
alter  table VRCAditional add 
WEBSite varchar(255) null /* WEB ���� */
;
alter  table VRCAditional add 
creditlimit null /* ����� ������� */
;
alter  table VRCAditional add 
maxcreditlen
 integer null /* ������������ ������� */
;
alter  table VRCAditional add 
townphonecode
 VARCHAR (10) null /* ���������� ���  */
;
alter  table VRCAditional add 
POSTINDEX
 VARCHAR (20) null /* �������� ������ */
;
alter  table VRCAditional add 
phone2
 VARCHAR (20) null /* ������� 2 */
;
alter  table VRCAditional add 
OKONH
 VARCHAR (20) null /* ����� */
;
alter  table VRCAditional add 
OKPO
 VARCHAR (20) null /* ���� */
;
alter  table VRCAditional add 
regsved
 VARCHAR (30) null /* ����� ������������� ������������ */
;
alter  table VRCAditional add 
Concurent null 
 check (Concurent in ( -1/* �� */
, 0/* ��� */ )) /* ��������� */
;
alter  table VRCAditional add 
eMail varchar(255) null /* ����������� ����� */
;
alter  table VRCAditional add 
mobTelephone
 VARCHAR (20) null /* ��������� ������� */
;
alter  table VRCAditional add 
prnActWork null 
 check (prnActWork in ( -1/* �� */
, 0/* ��� */ )) /* ������ ���� ����������� ����� */
;


/*������ �������*/
drop table VRCTarif/*������ ������� �� ��������*/ 
;
create table VRCTarif/*������ ������� �� ��������*/ (
InstanceID CHAR(38) ,
VRCTarifid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRCTarif add 
TheDept null /* ������ */
;
alter  table VRCTarif add 
TheTarifType null /* ������� ����� */
;


/*��������*/
drop table VRCCommonInfo/*����� ����������*/ 
;
create table VRCCommonInfo/*����� ����������*/ (
InstanceID CHAR(38) ,
VRCCommonInfoid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRCCommonInfo add 
IsPhizical null 
 check (IsPhizical in ( -1/* �� */
, 0/* ��� */ )) /* ���������� ���� */
;
alter  table VRCCommonInfo add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table VRCCommonInfo add 
fullname null /* ������ ������������ */
;
alter  table VRCCommonInfo add 
Address
 VARCHAR (255) null /* �������� ����� */
;
alter  table VRCCommonInfo add 
fax
 VARCHAR (20) null /* ���� */
;
alter  table VRCCommonInfo add 
Phone
 VARCHAR (25) null /* ������� */
;
alter  table VRCCommonInfo add 
the_Comment null /* ���������� */
;
alter  table VRCCommonInfo add 
INN
 VARCHAR (12) null /* ��� */
;
alter  table VRCCommonInfo add 
KPP
 VARCHAR (9) null /* ��� */
;
alter  table VRCCommonInfo add 
Curator null /* ������������� */
;
alter  table VRCCommonInfo add 
Transporter null 
 check (Transporter in ( -1/* �� */
, 0/* ��� */ )) /* ��������� ��. ����� */
;
alter  table VRCCommonInfo add 
PassportInfo null /* ���������� ������ */
;
alter  table VRCCommonInfo add 
Code1C
 VARCHAR (40) null /* ���1� */
;
alter  table VRCCommonInfo add 
MarkToDelete null 
 check (MarkToDelete in ( -1/* �� */
, 0/* ��� */ )) /* ������� �� ������� */
;


/*������������*/
drop table ROLES_USER/*������������*/ 
;
create table ROLES_USER/*������������*/ (
InstanceID CHAR(38) ,
ROLES_USERid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ROLES_USER add 
TheUser null /* ������������ */
;


/*����������� �� ������ ������*/
drop table ROLES_MAP/*����������� �� ������ ������*/ 
;
create table ROLES_MAP/*����������� �� ������ ������*/ (
InstanceID CHAR(38) ,
ROLES_MAPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ROLES_MAP add 
TheGroup null /* ������ */
;


/*��������� ���������*/
drop table ROLES_DOC/**/ 
;
create table ROLES_DOC/**/ (
InstanceID CHAR(38) ,
ROLES_DOCid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ROLES_DOC add 
The_Document null /* ��� ��������� */
;
alter  table ROLES_DOC add 
The_Denied
 integer null 
 check (The_Denied in ( 1/* �� */
, 0/* ��� */ )) /* �������� */
;
alter  table ROLES_DOC add 
AllowDeleteDoc null 
 check (AllowDeleteDoc in ( -1/* �� */
, 0/* ��� */ )) /* ��������� �������� */
;


/*��������� ���������*/
drop table ROLES_DOC_STATE/**/ 
;
create table ROLES_DOC_STATE/**/ (
ParentStructRowID CHAR(38) not null,
ROLES_DOC_STATEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ROLES_DOC_STATE add 
The_State null /* ��������� */
;
alter  table ROLES_DOC_STATE add 
The_Mode null /* ����� */
;
alter  table ROLES_DOC_STATE add 
AllowDelete null 
 check (AllowDelete in ( -1/* �� */
, 0/* ��� */ )) /* ����� ������� */
;
alter  table ROLES_DOC_STATE add 
StateChangeDisabled null 
 check (StateChangeDisabled in ( -1/* �� */
, 0/* ��� */ )) /* ��������� ����� ��������� */
;


/*����������� ����*/
drop table ROLES_DEF/*����������� ����*/ 
;
create table ROLES_DEF/*����������� ����*/ (
InstanceID CHAR(38) ,
ROLES_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ROLES_DEF add 
name
 VARCHAR (255) null /* �������� */
;
alter  table ROLES_DEF add 
TheComment null /* �������� */
;
alter  table ROLES_DEF add 
RightsSet_Denied null 
 check (RightsSet_Denied in ( -1/* �� */
, 0/* ��� */ )) /* ��������� ���� ��������� */
;
alter  table ROLES_DEF add 
FormCFG_Denied null 
 check (FormCFG_Denied in ( -1/* �� */
, 0/* ��� */ )) /* ��������� ���� ��������� */
;
alter  table ROLES_DEF add 
ListCFG_Denied null 
 check (ListCFG_Denied in ( -1/* �� */
, 0/* ��� */ )) /* ��������� �������� ��������� */
;
alter  table ROLES_DEF add 
FileExch_Denied null 
 check (FileExch_Denied in ( -1/* �� */
, 0/* ��� */ )) /* �������� ����� �������� */
;


/*������*/
drop table ROLES_REPORTS/**/ 
;
create table ROLES_REPORTS/**/ (
InstanceID CHAR(38) ,
ROLES_REPORTSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ROLES_REPORTS add 
The_Report null /* ����� */
;


/*��������� ����������*/
drop table ROLES_WP/*��������� ����������*/ 
;
create table ROLES_WP/*��������� ����������*/ (
InstanceID CHAR(38) ,
ROLES_WPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ROLES_WP add 
WP null /* ���������� */
;


/*���������� ��������*/
drop table ROLES_ACT/*���������� ��������*/ 
;
create table ROLES_ACT/*���������� ��������*/ (
ParentStructRowID CHAR(38) not null,
ROLES_ACTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
;
alter  table ROLES_ACT add 
Accesible
 integer null 
 check (Accesible in ( 1/* �� */
, 0/* ��� */ )) /* ����������� */
;
alter  table ROLES_ACT add 
EntryPoints null /* ��������� �������� */
;


/*��������� �� �������*/
drop table RptSrvMsg/*��������� �� �������*/ 
;
create table RptSrvMsg/*��������� �� �������*/ (
InstanceID CHAR(38) ,
RptSrvMsgid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table RptSrvMsg add 
Msgdate
 DATETIME null /* ���� ��������� */
;
alter  table RptSrvMsg add 
Info null /* ���������� */
;


/*������*/
drop table RptQuery/*������*/ 
;
create table RptQuery/*������*/ (
InstanceID CHAR(38) ,
RptQueryid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table RptQuery add 
ReportType null /* ��� ������ */
;
alter  table RptQuery add 
QueryUser null /* ����� ������ */
;
alter  table RptQuery add 
QryDate
 DATETIME null /* ���� ������ */
;
alter  table RptQuery add 
AcceptDate
 DATETIME null /* ���� ������ ������ �������� */
;
alter  table RptQuery add 
FinDate
 DATETIME null /* ������ ���������� ��������� */
;
alter  table RptQuery add 
ResultID
 uniqueidentifier null /* ������������� ���������� */
;


/*��������� ������*/
drop table RptQryParam/*��������� ������*/ 
;
create table RptQryParam/*��������� ������*/ (
InstanceID CHAR(38) ,
RptQryParamid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table RptQryParam add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table RptQryParam add 
TheValue null /* �������� */
;


/*�������� �������*/
drop table PEKORD_DEF/*�������� �������*/ 
;
create table PEKORD_DEF/*�������� �������*/ (
InstanceID CHAR(38) ,
PEKORD_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKORD_DEF add 
docnumber
 integer null /* ����� ������� */
;
alter  table PEKORD_DEF add 
author null /* ����� */
;
alter  table PEKORD_DEF add 
docname
 VARCHAR (80) null /* �������� */
;
alter  table PEKORD_DEF add 
regdate
 DATETIME null /* ���� ����������� */
;
alter  table PEKORD_DEF add 
comments null /* ���������� */
;
alter  table PEKORD_DEF add 
TarifStartDate
 DATETIME null /* ���� ������ �������� ������ */
;


/*������� �������*/
drop table PEKORD_DATA/*������� �������*/ 
;
create table PEKORD_DATA/*������� �������*/ (
InstanceID CHAR(38) ,
PEKORD_DATAid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKORD_DATA add 
Cient null /* ������ */
;
alter  table PEKORD_DATA add 
NewTarifType null /* ��� ������ */
;
alter  table PEKORD_DATA add 
TheDept null /* ������ */
;


/*���*/
drop table WorkPlace/*���*/ 
;
create table WorkPlace/*���*/ (
InstanceID CHAR(38) ,
WorkPlaceid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WorkPlace add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table WorkPlace add 
Caption
 VARCHAR (255) null /* ��������� */
;
alter  table WorkPlace add 
TheVersion
 VARCHAR (30) null /* ������ */
;
alter  table WorkPlace add 
ThePlatform null 
 check (ThePlatform in ( 2/* JAVA */
, 3/* OTHER */
, 1/* DOTNET */
, 0/* VB6 */ )) /* ��������� ���������� */
;
alter  table WorkPlace add 
TheComment null /* ���������� */
;


/*����*/
drop table EntryPoints/*����*/ 
;
create table EntryPoints/*����*/ (
InstanceID CHAR(38) ,
EntryPointsid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
;
alter  table EntryPoints add 
sequence
 integer null /* ������������������ */
;
alter  table EntryPoints add 
Name
 VARCHAR (38) null /* �������� */
;
alter  table EntryPoints add 
Caption
 VARCHAR (255) null /* ��������� */
;
alter  table EntryPoints add 
AsToolbarItem null 
 check (AsToolbarItem in ( -1/* �� */
, 0/* ��� */ )) /* �������� � ������ */
;
alter  table EntryPoints add 
ActionType null 
 check (ActionType in ( 5/* ������� ����� */
, 0/* ������ �� ������ */
, 2/* ��������� ����� */
, 1/* ������� �������� */
, 4/* ��������� ��� */
, 3/* ������� ������ */ )) /* ������� �������� */
;
alter  table EntryPoints add 
TheFilter null /* ������ */
;
alter  table EntryPoints add 
Journal null /* ������ */
;
alter  table EntryPoints add 
Report null /* ����� */
;
alter  table EntryPoints add 
Document null /* �������� */
;
alter  table EntryPoints add 
Method null /* ����� */
;
alter  table EntryPoints add 
IconFile
 VARCHAR (2000) null /* ���� �������� */
;
alter  table EntryPoints add 
TheExtention null /* ���������� */
;
alter  table EntryPoints add 
ARM null /* ��� */
;
alter  table EntryPoints add 
TheComment null /* ���������� */
;
alter  table EntryPoints add 
ObjectType null /* ��� ��������� */
;
alter  table EntryPoints add 
JournalFixedQuery null /* ����������� � ������� */
;


/*�������� �������*/
drop table EPFilterLink/*�������� ������� � �������*/ 
;
create table EPFilterLink/*�������� ������� � �������*/ (
ParentStructRowID CHAR(38) not null,
EPFilterLinkid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table EPFilterLink add 
RowSource
 VARCHAR (255) null /* �������� */
;
alter  table EPFilterLink add 
TheExpression null /* ��������� */
;
alter  table EPFilterLink add 
FilterField
 VARCHAR (255) null /* ���� ������� */
;


/*������ �����*/
drop table ARMTypes/*���� ����������, ������� ������������ � MDI ������*/ 
;
create table ARMTypes/*���� ����������, ������� ������������ � MDI ������*/ (
InstanceID CHAR(38) ,
ARMTypesid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ARMTypes add 
TheDocumentType null /* ��� ��������� */
;


/*��������� ��������*/
drop table ARMJournal/*�������� �������� ��������*/ 
;
create table ARMJournal/*�������� �������� ��������*/ (
InstanceID CHAR(38) ,
ARMJournalid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ARMJournal add 
TheJournal null /* ������ */
;


/*����������*/
drop table ARMJRNLADD/*�������� ��������� ����������*/ 
;
create table ARMJRNLADD/*�������� ��������� ����������*/ (
ParentStructRowID CHAR(38) not null,
ARMJRNLADDid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ARMJRNLADD add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table ARMJRNLADD add 
TheExtention null /* ���������� */
;


/*������*/
drop table ARMJRNLREP/*������ �� �������*/ 
;
create table ARMJRNLREP/*������ �� �������*/ (
ParentStructRowID CHAR(38) not null,
ARMJRNLREPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ARMJRNLREP add 
repname
 VARCHAR (255) null /* �������� ������ */
;
alter  table ARMJRNLREP add 
TheReport null /* ����� */
;


/*��������*/
drop table ARMJRNLRUN/*�������������� �������� � �������*/ 
;
create table ARMJRNLRUN/*�������������� �������� � �������*/ (
ParentStructRowID CHAR(38) not null,
ARMJRNLRUNid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ARMJRNLRUN add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table ARMJRNLRUN add 
TheExtention null /* ���������� */
;


/*���� ������� ���*/
drop table PEKD_NZONE/*���� ������� ���*/ 
;
create table PEKD_NZONE/*���� ������� ���*/ (
InstanceID CHAR(38) ,
PEKD_NZONEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_NZONE add 
Dept null /* ������ */
;
alter  table PEKD_NZONE add 
TheYear
 integer null /* ��� */
;
alter  table PEKD_NZONE add 
TheMonth null 
 check (TheMonth in ( 11/* ������ */
, 2/* ������� */
, 12/* ������� */
, 3/* ���� */
, 1/* ������ */
, 9/* �������� */
, 6/* ���� */
, 10/* ������� */
, 5/* ��� */
, 8/* ������ */
, 7/* ���� */
, 4/* ������ */ )) /* ����� */
;
alter  table PEKD_NZONE add 
FromPPOIDX
 integer null /* ������� � */
;
alter  table PEKD_NZONE add 
ToPPOIdx
 integer null /* �� */
;
alter  table PEKD_NZONE add 
POIDX
 VARCHAR (6) null /* ������ ��������� */
;


/*������� ������*/
drop table PEKD_USEDNUM/*������� ������*/ 
;
create table PEKD_USEDNUM/*������� ������*/ (
InstanceID CHAR(38) ,
PEKD_USEDNUMid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_USEDNUM add 
UsedNumber
 integer null /* ����� */
;


/*������� �������*/
drop table JournalColumn/*������� �������*/ 
;
create table JournalColumn/*������� �������*/ (
InstanceID CHAR(38) ,
JournalColumnid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table JournalColumn add 
sequence
 integer null /* ������������������ */
;
alter  table JournalColumn add 
name
 VARCHAR (255) null /* �������� */
;
alter  table JournalColumn add 
ColumnAlignment
 integer null 
 check (ColumnAlignment in ( 4/* Center Center */
, 3/* Center Top */
, 6/* Right Top */
, 8/* Right Bottom */
, 2/* Left Bottom */
, 7/* Right Center */
, 5/* Center Bottom */
, 1/* Left Center */
, 0/* Left Top */ )) /* ������������ */
;
alter  table JournalColumn add 
ColSort
 INTEGER null 
 check (ColSort in ( 0/* As String */
, 1/* As Numeric */
, 2/* As Date */ )) /* ���������� ������� */
;
alter  table JournalColumn add 
GroupAggregation
 INTEGER null 
 check (GroupAggregation in ( 5/* MAX */
, 1/* AVG */
, 3/* SUM */
, 2/* COUNT */
, 4/* MIN */
, 6/* CUSTOM */
, 0/* none */ )) /* ���������� ��� ����������� */
;


/*������ �������*/
drop table JColumnSource/*������ �������*/ 
;
create table JColumnSource/*������ �������*/ (
ParentStructRowID CHAR(38) not null,
JColumnSourceid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table JColumnSource add 
SrcPartView null /* ������������� */
;
alter  table JColumnSource add 
ViewField
 VARCHAR (255) null /* ���� ������������� */
;


/*������*/
drop table Journal/*������*/ 
;
create table Journal/*������*/ (
InstanceID CHAR(38) ,
Journalid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table Journal add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table Journal add 
the_Alias
 VARCHAR (32) null /* ��������� */
;
alter  table Journal add 
TheComment null /* �������� */
;


/*��������� �������*/
drop table JournalSrc/*��������� �������*/ 
;
create table JournalSrc/*��������� �������*/ (
InstanceID CHAR(38) ,
JournalSrcid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table JournalSrc add 
PartView
 uniqueidentifier null /* ������������� */
;
alter  table JournalSrc add 
OnRun
 INTEGER null 
 check (OnRun in ( 2/* ������� �������� */
, 1/* ������� ������ */
, 0/* ������ �� ������ */ )) /* ��� �������� */
;
alter  table JournalSrc add 
OpenMode
 VARCHAR (1) null /* ����� �������� */
;
alter  table JournalSrc add 
ViewAlias
 VARCHAR (255) null /* ��������� ������������� */
;


/*��������� �����*/
drop table pekmsg_path/*������� ��������*/ 
;
create table pekmsg_path/*������� ��������*/ (
InstanceID CHAR(38) ,
pekmsg_pathid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table pekmsg_path add 
SendDate
 DATETIME null /* ���� �������� */
;
alter  table pekmsg_path add 
RcvWaitDate
 DATETIME null /* ��������������� ���� ��������� */
;
alter  table pekmsg_path add 
trainNo null /* ����� */
;
alter  table pekmsg_path add 
vagNo
 VARCHAR (8) null /* ����� � */
;
alter  table pekmsg_path add 
PathFilial null /* ������ */
;
alter  table pekmsg_path add 
TransSupplier null /* ��������� */
;
alter  table pekmsg_path add 
TheDirection null /* ����������� */
;
alter  table pekmsg_path add 
PPONum
 integer null /* ���-�� �� */
;
alter  table pekmsg_path add 
DestStation null /* ������� ���������� */
;
alter  table pekmsg_path add 
PPODescription null /* �������� ����� */
;
alter  table pekmsg_path add 
Receiver null /* ���������� */
;
alter  table pekmsg_path add 
PPOWeight null /* ��� �� */
;
alter  table pekmsg_path add 
WeightEDIZM null /* ��. ���. ���� */
;
alter  table pekmsg_path add 
PPOVol null /* ����� �� */
;
alter  table pekmsg_path add 
ValueEDIZM null /* ��.���. ������ */
;
alter  table pekmsg_path add 
PassFIO
 VARCHAR (255) null /* ��� ���������� */
;
alter  table pekmsg_path add 
PassDate
 DATETIME null /* ���� �������� ����� � ����� */
;
alter  table pekmsg_path add 
RcvFIO
 VARCHAR (255) null /* ��� ��� */
;
alter  table pekmsg_path add 
RcvDate
 DATETIME null /* ���� ��������� ����� � �� */
;
alter  table pekmsg_path add 
InforRcvFIO
 VARCHAR (255) null /* ���� �������� ���������� */
;
alter  table pekmsg_path add 
InfoDate
 DATETIME null /* ���� �������� ���������� */
;
alter  table pekmsg_path add 
InfoSendType null /* ������ �������� ���������� */
;


/*������ ��������*/
drop table WEBS_MAILLIST/**/ 
;
create table WEBS_MAILLIST/**/ (
InstanceID CHAR(38) ,
WEBS_MAILLISTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBS_MAILLIST add 
Email
 VARCHAR (512) null /* ����� */
;


/*������������� ��������*/
drop table WEBS_RECLAME/**/ 
;
create table WEBS_RECLAME/**/ (
InstanceID CHAR(38) ,
WEBS_RECLAMEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBS_RECLAME add 
queque
 integer null /* ����� �/� */
;
alter  table WEBS_RECLAME add 
Path null /* ������� */
;


/*�������� �����*/
drop table WEBS_PAGEDEF/**/ 
;
create table WEBS_PAGEDEF/**/ (
InstanceID CHAR(38) ,
WEBS_PAGEDEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
;
alter  table WEBS_PAGEDEF add 
QueueNumber
 integer null /* ����� �/� */
;
alter  table WEBS_PAGEDEF add 
Name
 VARCHAR (256) null /* �������� */
;
alter  table WEBS_PAGEDEF add 
Url
 VARCHAR (1024) null /* ��� */
;
alter  table WEBS_PAGEDEF add 
Title
 VARCHAR (256) null /* ����� */
;
alter  table WEBS_PAGEDEF add 
ShortName
 VARCHAR (256) null /* �������� �������� */
;
alter  table WEBS_PAGEDEF add 
ObjectName null /* ��� ������� */
;
alter  table WEBS_PAGEDEF add 
ObjectCode null /* ��� ������� */
;
alter  table WEBS_PAGEDEF add 
AllowHeader null 
 check (AllowHeader in ( -1/* �� */
, 0/* ��� */ )) /* �������� ��������� */
;
alter  table WEBS_PAGEDEF add 
the_Mode
 VARCHAR (256) null /* ����� ������ */
;
alter  table WEBS_PAGEDEF add 
PageType
 INTEGER null 
 check (PageType in ( 0/* �� ����������� */
, 1/* ������ */
, 3/* ������ */
, 2/* ������� */ )) /* ��� */
;
alter  table WEBS_PAGEDEF add 
ControlPath
 VARCHAR (256) null /* ������� */
;
alter  table WEBS_PAGEDEF add 
SelectIDParameterName
 VARCHAR (256) null /* ��� ��������� ��� �������� � ����� �������������� */
;
alter  table WEBS_PAGEDEF add 
PageContent null /* C��������� */
;
alter  table WEBS_PAGEDEF add 
AllowAddPage null 
 check (AllowAddPage in ( -1/* �� */
, 0/* ��� */ )) /* ��������� ��������� �������� */
;
alter  table WEBS_PAGEDEF add 
the_IsLocked null 
 check (the_IsLocked in ( -1/* �� */
, 0/* ��� */ )) /* ������������� */
;
alter  table WEBS_PAGEDEF add 
IsOnMap null 
 check (IsOnMap in ( -1/* �� */
, 0/* ��� */ )) /* ���������� �� ����� ����� */
;
alter  table WEBS_PAGEDEF add 
IsShowHisory null 
 check (IsShowHisory in ( -1/* �� */
, 0/* ��� */ )) /* ���������� ������� */
;
alter  table WEBS_PAGEDEF add 
RedirectToFirstChild null 
 check (RedirectToFirstChild in ( -1/* �� */
, 0/* ��� */ )) /* ������� �� ������ �������� �������� */
;


/*��������*/
drop table WEBS_PICS/**/ 
;
create table WEBS_PICS/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_PICSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBS_PICS add 
Name
 VARCHAR (512) null /* �������� */
;
alter  table WEBS_PICS add 
FileContent null /* ���� */
;
alter  table WEBS_PICS add 
 FileContent_EXT char(4) null
;


/*��������� � ����*/
drop table WEBS_PAGEMENU/**/ 
;
create table WEBS_PAGEMENU/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_PAGEMENUid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBS_PAGEMENU add 
AllowInMenu null 
 check (AllowInMenu in ( -1/* �� */
, 0/* ��� */ )) /* � ���� */
;
alter  table WEBS_PAGEMENU add 
AllowInBottomMenu null 
 check (AllowInBottomMenu in ( -1/* �� */
, 0/* ��� */ )) /* � ������ ���� */
;
alter  table WEBS_PAGEMENU add 
UsePartRowsInMenu null 
 check (UsePartRowsInMenu in ( -1/* �� */
, 0/* ��� */ )) /* ���������� ������ � ���� */
;
alter  table WEBS_PAGEMENU add 
UsePartRowsEditForm null /* �������� ��� �������������� */
;
alter  table WEBS_PAGEMENU add 
UsePartRowsTextField
 VARCHAR (256) null /* ���� ������ ������ */
;
alter  table WEBS_PAGEMENU add 
UsePartRowsRowIDField
 VARCHAR (256) null /* ���� ID */
;
alter  table WEBS_PAGEMENU add 
UsePartRowsSort
 VARCHAR (256) null /* ���������� ����� ����� */
;


/*����������*/
drop table WEBS_PAGECONTENT/**/ 
;
create table WEBS_PAGECONTENT/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_PAGECONTENTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBS_PAGECONTENT add 
Content
 VARCHAR (8000) null /* ���������� */
;


/*���������*/
drop table WEBS_PAGEPARS/**/ 
;
create table WEBS_PAGEPARS/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_PAGEPARSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBS_PAGEPARS add 
Name
 VARCHAR (256) null /* ��� */
;
alter  table WEBS_PAGEPARS add 
TheValue
 VARCHAR (256) null /* �������� */
;


/*����������*/
drop table WEBS_PAGECOMP/**/ 
;
create table WEBS_PAGECOMP/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_PAGECOMPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBS_PAGECOMP add 
Name
 VARCHAR (256) null /* �������� */
;
alter  table WEBS_PAGECOMP add 
Title
 VARCHAR (256) null /* ����� */
;
alter  table WEBS_PAGECOMP add 
Selected null 
 check (Selected in ( -1/* �� */
, 0/* ��� */ )) /* ������� */
;
alter  table WEBS_PAGECOMP add 
IsCollection null 
 check (IsCollection in ( -1/* �� */
, 0/* ��� */ )) /* ��������� */
;
alter  table WEBS_PAGECOMP add 
the_PartName null /* ������ */
;
alter  table WEBS_PAGECOMP add 
IDField
 VARCHAR (256) null /* ���� ID */
;
alter  table WEBS_PAGECOMP add 
UserIdField
 VARCHAR (256) null /* ���� UserID */
;
alter  table WEBS_PAGECOMP add 
Visible null 
 check (Visible in ( -1/* �� */
, 0/* ��� */ )) /* ��������� */
;


/*��������� �����*/
drop table TablePart/**/ 
;
create table TablePart/**/ (
ParentStructRowID CHAR(38) not null,
TablePartid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table TablePart add 
FilterUserIDFieldName_
 VARCHAR (256) null /* ��� ���� ��� ������� UserID */
;
alter  table TablePart add 
Filter_
 VARCHAR (256) null /* ������ */
;
alter  table TablePart add 
SelectIDParameterName
 VARCHAR (256) null /* �������� ��� �������� ID */
;
alter  table TablePart add 
EditForm null /* �������� ��� �������������� */
;
alter  table TablePart add 
AllowDelete null 
 check (AllowDelete in ( -1/* �� */
, 0/* ��� */ )) /* ��������� �������� */
;
alter  table TablePart add 
AllowAddNew null 
 check (AllowAddNew in ( -1/* �� */
, 0/* ��� */ )) /* ��������� ���������� */
;
alter  table TablePart add 
AddStatusColumn_ null 
 check (AddStatusColumn_ in ( -1/* �� */
, 0/* ��� */ )) /* ���� Status ������� */
;
alter  table TablePart add 
AllowEditRowStatusNameValue
 VARCHAR (256) null /* �������� Status ��� �������������� */
;
alter  table TablePart add 
AllowEditField
 VARCHAR (256) null /* AllowEditField */
;
alter  table TablePart add 
JournalID null /* JournalID */
;
alter  table TablePart add 
FilterUserClientDef
 VARCHAR (256) null /* FilterUserClientDef */
;
alter  table TablePart add 
AllowEditUserClientDef null 
 check (AllowEditUserClientDef in ( -1/* �� */
, 0/* ��� */ )) /* AllowEditUserClientDef */
;
alter  table TablePart add 
ClientDefField
 VARCHAR (256) null /* ClientDefField */
;
alter  table TablePart add 
DataNavigateUrlField
 VARCHAR (256) null /* DataNavigateUrlField */
;
alter  table TablePart add 
PagerSize
 integer null /* PagerSize */
;
alter  table TablePart add 
EditCaption
 VARCHAR (256) null /* EditCaption */
;
alter  table TablePart add 
ViewCaption
 VARCHAR (256) null /* ViewCaption */
;
alter  table TablePart add 
DeleteCaption
 VARCHAR (256) null /* DeleteCaption */
;


/*������*/
drop table ReplaceValues/**/ 
;
create table ReplaceValues/**/ (
ParentStructRowID CHAR(38) not null,
ReplaceValuesid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ReplaceValues add 
Name
 VARCHAR (256) null /* ���� */
;
alter  table ReplaceValues add 
SourceName
 VARCHAR (256) null /* ���� �������� */
;


/*����������� ��� �������������� ����*/
drop table DenyEdit/**/ 
;
create table DenyEdit/**/ (
ParentStructRowID CHAR(38) not null,
DenyEditid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table DenyEdit add 
Name
 VARCHAR (256) null /* �������� */
;


/*��������� ����*/
drop table DenyVisible/**/ 
;
create table DenyVisible/**/ (
ParentStructRowID CHAR(38) not null,
DenyVisibleid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table DenyVisible add 
Name
 VARCHAR (256) null /* ��� ���� */
;


/*�������� ����, ������������ ��������������*/
drop table AllowEditFieldValues/*�������� ����, ������������ ��������������*/ 
;
create table AllowEditFieldValues/*�������� ����, ������������ ��������������*/ (
ParentStructRowID CHAR(38) not null,
AllowEditFieldValuesid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table AllowEditFieldValues add 
Name
 VARCHAR (256) null /* �������� */
;


/*����������*/
drop table ComboFields/**/ 
;
create table ComboFields/**/ (
ParentStructRowID CHAR(38) not null,
ComboFieldsid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ComboFields add 
Name
 VARCHAR (256) null /* ���� */
;
alter  table ComboFields add 
SourceName
 VARCHAR (256) null /* ���� �������� */
;


/*������*/
drop table WEBS_ANKETA/**/ 
;
create table WEBS_ANKETA/**/ (
InstanceID CHAR(38) ,
WEBS_ANKETAid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBS_ANKETA add 
Name
 VARCHAR (256) null /* �������� */
;
alter  table WEBS_ANKETA add 
the_Description
 VARCHAR (4000) null /* �������� */
;
alter  table WEBS_ANKETA add 
AnketaDef null /* ������ */
;
alter  table WEBS_ANKETA add 
Message
 VARCHAR (156) null /* ��������� */
;


/*�������*/
drop table WEBS_QUESTIONS/**/ 
;
create table WEBS_QUESTIONS/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_QUESTIONSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBS_QUESTIONS add 
the_Number
 integer null /* �����  */
;
alter  table WEBS_QUESTIONS add 
QuestionType
 uniqueidentifier null /* ��� */
;
alter  table WEBS_QUESTIONS add 
Name
 VARCHAR (1024) null /* ��� */
;
alter  table WEBS_QUESTIONS add 
Required null 
 check (Required in ( -1/* �� */
, 0/* ��� */ )) /* �������������� */
;
alter  table WEBS_QUESTIONS add 
Style
 VARCHAR (256) null /* ����� */
;


/*������*/
drop table WEBS_ANSWERS/**/ 
;
create table WEBS_ANSWERS/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_ANSWERSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBS_ANSWERS add 
the_Number
 integer null /* �����  */
;
alter  table WEBS_ANSWERS add 
Name
 VARCHAR (1024) null /* ��������  */
;
alter  table WEBS_ANSWERS add 
the_Description
 VARCHAR (4000) null /* ��������  */
;


/*��������� ��� ����������*/
drop table WEBS_DDOC/*������ ���������� ������� ����� �������*/ 
;
create table WEBS_DDOC/*������ ���������� ������� ����� �������*/ (
InstanceID CHAR(38) ,
WEBS_DDOCid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBS_DDOC add 
Name
 VARCHAR (512) null /* �������� */
;
alter  table WEBS_DDOC add 
FileName
 VARCHAR (1024) null /* ��� ����� */
;
alter  table WEBS_DDOC add 
FileContract null /* ���� */
;
alter  table WEBS_DDOC add 
 FileContract_EXT char(4) null
;
alter  table WEBS_DDOC add 
Title
 VARCHAR (512) null /* ��������� ��� ������ */
;


/*�������*/
drop table WEBS_NEWS/*����������� ������ ��������*/ 
;
create table WEBS_NEWS/*����������� ������ ��������*/ (
InstanceID CHAR(38) ,
WEBS_NEWSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
;
alter  table WEBS_NEWS add 
QueueNumber
 integer null /* ����� �/� */
;
alter  table WEBS_NEWS add 
Name
 VARCHAR (256) null /* �������� */
;
alter  table WEBS_NEWS add 
Title
 VARCHAR (256) null /* ����� */
;
alter  table WEBS_NEWS add 
ShortName
 VARCHAR (256) null /* �������� �������� */
;
alter  table WEBS_NEWS add 
the_Mode
 VARCHAR (256) null /* ����� ������ */
;
alter  table WEBS_NEWS add 
PageContent null /* C��������� */
;
alter  table WEBS_NEWS add 
the_IsLocked null 
 check (the_IsLocked in ( -1/* �� */
, 0/* ��� */ )) /* ������������� */
;
alter  table WEBS_NEWS add 
IsShowHisory null 
 check (IsShowHisory in ( -1/* �� */
, 0/* ��� */ )) /* ���������� ������� */
;
alter  table WEBS_NEWS add 
NewsDate
 DATETIME null /* ���� */
;
alter  table WEBS_NEWS add 
NewsDescription null /* �������� */
;


/*��������*/
drop table NEWS_PICS/**/ 
;
create table NEWS_PICS/**/ (
ParentStructRowID CHAR(38) not null,
NEWS_PICSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table NEWS_PICS add 
Name
 VARCHAR (512) null /* �������� */
;
alter  table NEWS_PICS add 
FileContent null /* ���� */
;
alter  table NEWS_PICS add 
 FileContent_EXT char(4) null
;


/*������ �����*/
drop table VRCPSeeAlso/*������ �����*/ 
;
create table VRCPSeeAlso/*������ �����*/ (
InstanceID CHAR(38) ,
VRCPSeeAlsoid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRCPSeeAlso add 
Document null /* �������� */
;
alter  table VRCPSeeAlso add 
the_Comment null /* ���������� */
;


/*�����*/
drop table VRCPSpecial/*�����*/ 
;
create table VRCPSpecial/*�����*/ (
InstanceID CHAR(38) ,
VRCPSpecialid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRCPSpecial add 
DateOF
 DATETIME null /* ���� */
;
alter  table VRCPSpecial add 
Info null /* �������� */
;
alter  table VRCPSpecial add 
theFile null /* ���� */
;
alter  table VRCPSpecial add 
 theFile_EXT char(4) null
;
alter  table VRCPSpecial add 
InfoSrc null /* �������� */
;


/*�������*/
drop table VRCPPresents/*�������*/ 
;
create table VRCPPresents/*�������*/ (
InstanceID CHAR(38) ,
VRCPPresentsid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRCPPresents add 
DateOF
 DATETIME null /* ���� */
;
alter  table VRCPPresents add 
Gift
 VARCHAR (255) null /* ������� */
;
alter  table VRCPPresents add 
PresentCost null /* ���� ������� */
;
alter  table VRCPPresents add 
reason null /* ����� */
;


/*������*/
drop table VRCPReports/*������*/ 
;
create table VRCPReports/*������*/ (
InstanceID CHAR(38) ,
VRCPReportsid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRCPReports add 
Report null /* ����� */
;


/*�������� ����*/
drop table VRCPDates/*�������� ����*/ 
;
create table VRCPDates/*�������� ����*/ (
InstanceID CHAR(38) ,
VRCPDatesid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRCPDates add 
DateOf
 DATETIME null /* ���� */
;
alter  table VRCPDates add 
DateEvent
 VARCHAR (255) null /* ������� */
;


/*������������*/
drop table VRCPNeigborhood/*������������*/ 
;
create table VRCPNeigborhood/*������������*/ (
InstanceID CHAR(38) ,
VRCPNeigborhoodid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRCPNeigborhood add 
the_Level
 VARCHAR (255) null /* ������� ������� */
;
alter  table VRCPNeigborhood add 
person null /* �������� */
;


/*���������*/
drop table VRCPInterest/*���������*/ 
;
create table VRCPInterest/*���������*/ (
InstanceID CHAR(38) ,
VRCPInterestid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRCPInterest add 
Info null /* �������� */
;


/*����� ����������*/
drop table VRCPCommon/*����� ����������*/ 
;
create table VRCPCommon/*����� ����������*/ (
InstanceID CHAR(38) ,
VRCPCommonid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRCPCommon add 
Family
 VARCHAR (255) null /* ������� */
;
alter  table VRCPCommon add 
Name
 VARCHAR (255) null /* ��� */
;
alter  table VRCPCommon add 
SurName
 VARCHAR (255) null /* �������� */
;
alter  table VRCPCommon add 
Privelegie null /* ������ */
;
alter  table VRCPCommon add 
phone
 VARCHAR (30) null /* ������� */
;
alter  table VRCPCommon add 
email varchar(255) null /* e-mail */
;
alter  table VRCPCommon add 
fax
 VARCHAR (30) null /* ���� */
;
alter  table VRCPCommon add 
Loyality null /* ���������� */
;
alter  table VRCPCommon add 
the_Comment null /* ���������� */
;
alter  table VRCPCommon add 
Curator null /* ������������� */
;
alter  table VRCPCommon add 
mobile
 VARCHAR (30) null /* ��������� ������� */
;
alter  table VRCPCommon add 
PersonDeYuro null 
 check (PersonDeYuro in ( -1/* �� */
, 0/* ��� */ )) /* ����������� ������������� */
;
alter  table VRCPCommon add 
ActionReason
 VARCHAR (255) null /* ��������� �� ��������� */
;
alter  table VRCPCommon add 
ActionStart
 DATETIME null /* ������ �������� ����������� */
;
alter  table VRCPCommon add 
ActionEnd
 DATETIME null /* ����� �������� ������������ */
;
alter  table VRCPCommon add 
PassportInfo null /* ���������� ������ */
;
alter  table VRCPCommon add 
Address null /* ����� */
;


/*Z-�����*/
drop table PEKZR_DATA/*������ ����������� Z ������*/ 
;
create table PEKZR_DATA/*������ ����������� Z ������*/ (
InstanceID CHAR(38) ,
PEKZR_DATAid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKZR_DATA add 
TheDept null /* ������ */
;
alter  table PEKZR_DATA add 
TheDate
 DATETIME null /* ���� */
;
alter  table PEKZR_DATA add 
TheValue null /* �������� */
;


/*��������*/
drop table WEBCRD_NUM/*��������*/ 
;
create table WEBCRD_NUM/*��������*/ (
InstanceID CHAR(38) ,
WEBCRD_NUMid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBCRD_NUM add 
TheNumber
 VARCHAR (30) null /* ����� �������� */
;
alter  table WEBCRD_NUM add 
ActivationTime
 DATETIME null /* ����� ������������ */
;
alter  table WEBCRD_NUM add 
ActivatedBy null /* ��� ������������ */
;
alter  table WEBCRD_NUM add 
Activated null 
 check (Activated in ( -1/* �� */
, 0/* ��� */ )) /* ������������ */
;


/*�������� �����*/
drop table WBCRD_DEF/*�������� �����*/ 
;
create table WBCRD_DEF/*�������� �����*/ (
InstanceID CHAR(38) ,
WBCRD_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WBCRD_DEF add 
TheDate
 DATETIME null /* ���� ������� ������ */
;
alter  table WBCRD_DEF add 
ExpDate
 DATETIME null /* ����� �������� ����� */
;
alter  table WBCRD_DEF add 
CardSumm null /* ����� �� �������� */
;
alter  table WBCRD_DEF add 
TheCurrency null /* ������ */
;


/*��������*/
drop table PEKO_DEF/*��������*/ 
;
create table PEKO_DEF/*��������*/ (
InstanceID CHAR(38) ,
PEKO_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKO_DEF add 
ToClient null /* ��������� */
;
alter  table PEKO_DEF add 
PLPNUM
 VARCHAR (20) null /* � ��������� */
;
alter  table PEKO_DEF add 
PLPDate
 DATETIME null /* ���� ��������� */
;
alter  table PEKO_DEF add 
PLPSumm null /* ����� */
;
alter  table PEKO_DEF add 
TheDept null /* � ���� ������� */
;
alter  table PEKO_DEF add 
TheComment null /* ��������� ������� */
;
alter  table PEKO_DEF add 
Code1C
 VARCHAR (40) null /* ���1� */
;


/*�������� �������*/
drop table PEKL_DEF/*�������� �������*/ 
;
create table PEKL_DEF/*�������� �������*/ (
InstanceID CHAR(38) ,
PEKL_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKL_DEF add 
TheDep null /* ������ */
;
alter  table PEKL_DEF add 
FromDate
 DATETIME null /* ������ �������� */
;
alter  table PEKL_DEF add 
ToDate
 DATETIME null /* ��������� �������� */
;


/*����������� ������*/
drop table PEKL_WDAY/*����������� ������*/ 
;
create table PEKL_WDAY/*����������� ������*/ (
InstanceID CHAR(38) ,
PEKL_WDAYid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKL_WDAY add 
Train null /* ����� */
;
alter  table PEKL_WDAY add 
GOTYPE null /* ��� ��� */
;
alter  table PEKL_WDAY add 
TheValue null /* ����� */
;
alter  table PEKL_WDAY add 
TheValueEDIZM null /* ��. ���. ������ */
;
alter  table PEKL_WDAY add 
WeightValue null /* ��� */
;
alter  table PEKL_WDAY add 
WeightEDIZM null /* ��. ���. ���� */
;
alter  table PEKL_WDAY add 
the_Description null /* �������� */
;


/*��������*/
drop table PEKD_ADDS/*�������� ��������*/ 
;
create table PEKD_ADDS/*�������� ��������*/ (
InstanceID CHAR(38) ,
PEKD_ADDSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_ADDS add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table PEKD_ADDS add 
CalcType
 integer null 
 check (CalcType in ( 1/* ����� */
, 2/* ��������� */
, 3/* ������ */
, 0/* ��� */ )) /* ��� ������� */
;


/*��� ������*/
drop table PEKD_TRAINTYPE/*��� ������*/ 
;
create table PEKD_TRAINTYPE/*��� ������*/ (
InstanceID CHAR(38) ,
PEKD_TRAINTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_TRAINTYPE add 
name
 VARCHAR (255) null /* �������� */
;


/*��� ��������������*/
drop table PEKD_AUTO/*���������� ����� ��������������*/ 
;
create table PEKD_AUTO/*���������� ����� ��������������*/ (
InstanceID CHAR(38) ,
PEKD_AUTOid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_AUTO add 
Name
 VARCHAR (255) null /* �������� */
;
alter  table PEKD_AUTO add 
TheVolume null /* ���������������� */
;
alter  table PEKD_AUTO add 
TheDimentions
 VARCHAR (80) null /* �������� */
;


/*���� ���*/
drop table PEKD_GOTYPE/*���� ���*/ 
;
create table PEKD_GOTYPE/*���� ���*/ (
InstanceID CHAR(38) ,
PEKD_GOTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_GOTYPE add 
name
 VARCHAR (255) null /* �������� */
;


/*������ �������� ����������*/
drop table PEKD_INFOSENDTYPE/*������ �������� ���������� */ 
;
create table PEKD_INFOSENDTYPE/*������ �������� ���������� */ (
InstanceID CHAR(38) ,
PEKD_INFOSENDTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_INFOSENDTYPE add 
Name
 VARCHAR (255) null /* �������� */
;


/*������� ��������*/
drop table PEKD_TRTYPE/*������� ��������*/ 
;
create table PEKD_TRTYPE/*������� ��������*/ (
InstanceID CHAR(38) ,
PEKD_TRTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_TRTYPE add 
name
 VARCHAR (255) null /* �������� */
;


/*������ ��������*/
drop table PEKD_GRPDpUSL/*��������� ������������ ��������� (PEKD_SRV)*/ 
;
create table PEKD_GRPDpUSL/*��������� ������������ ��������� (PEKD_SRV)*/ (
InstanceID CHAR(38) ,
PEKD_GRPDpUSLid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_GRPDpUSL add 
name
 VARCHAR (255) null /* �������� */
;


/*�������� �����������*/
drop table PEKD_POSTTYPE/*�������� �����������*/ 
;
create table PEKD_POSTTYPE/*�������� �����������*/ (
InstanceID CHAR(38) ,
PEKD_POSTTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_POSTTYPE add 
Name
 VARCHAR (255) null /* �������� */
;


/*������ �������*/
drop table PEKD_TRFGRP/*������ �������*/ 
;
create table PEKD_TRFGRP/*������ �������*/ (
InstanceID CHAR(38) ,
PEKD_TRFGRPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
;
alter  table PEKD_TRFGRP add 
name
 VARCHAR (255) null /* ������ */
;


/*���� �������*/
drop table PEKD_TRFTYPE/*���� �������*/ 
;
create table PEKD_TRFTYPE/*���� �������*/ (
ParentStructRowID CHAR(38) not null,
PEKD_TRFTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_TRFTYPE add 
name
 VARCHAR (255) null /* �������� */
;


/*������*/
drop table PEKD_DEPT/*������*/ 
;
create table PEKD_DEPT/*������*/ (
InstanceID CHAR(38) ,
PEKD_DEPTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_DEPT add 
name
 VARCHAR (255) null /* �������� */
;
alter  table PEKD_DEPT add 
Address null /* ����� */
;
alter  table PEKD_DEPT add 
Supplier null /* �������� ��������� */
;
alter  table PEKD_DEPT add 
DocPrefix
 VARCHAR (3) null /* ������� ������� ���������� */
;
alter  table PEKD_DEPT add 
PGDPName
 VARCHAR (255) null /* �������� ���� */
;
alter  table PEKD_DEPT add 
town null /* ����� */
;
alter  table PEKD_DEPT add 
Code1C
 VARCHAR (40) null /* ���1� */
;


/*�������������� ������*/
drop table PEKD_DEPLIMITS/*������ ����������� �������� �� ����������*/ 
;
create table PEKD_DEPLIMITS/*������ ����������� �������� �� ����������*/ (
ParentStructRowID CHAR(38) not null,
PEKD_DEPLIMITSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_DEPLIMITS add 
Supplier null /* ��������� */
;
alter  table PEKD_DEPLIMITS add 
LimitMark null /* ����������� ������� */
;
alter  table PEKD_DEPLIMITS add 
DaysToCrash
 integer null /* ����� � ���� */
;


/*�������� � ������������*/
drop table PEKD_DEPDOG/*�������� � ������ �������� ��������� ���������� ������*/ 
;
create table PEKD_DEPDOG/*�������� � ������ �������� ��������� ���������� ������*/ (
ParentStructRowID CHAR(38) not null,
PEKD_DEPDOGid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_DEPDOG add 
Supplier null /* ��������� */
;
alter  table PEKD_DEPDOG add 
TheDogovor null /* ������� */
;


/*����������� ���������*/
drop table PEKD_DIRECTION/*����������� ���������*/ 
;
create table PEKD_DIRECTION/*����������� ���������*/ (
InstanceID CHAR(38) ,
PEKD_DIRECTIONid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_DIRECTION add 
Town null /* ����� */
;
alter  table PEKD_DIRECTION add 
Name
 VARCHAR (255) null /* ����������� */
;
alter  table PEKD_DIRECTION add 
Dept null /* ������ */
;
alter  table PEKD_DIRECTION add 
Srok
 VARCHAR (255) null /* ���� �������� */
;
alter  table PEKD_DIRECTION add 
the_Rule
 VARCHAR (255) null /* �������� */
;
alter  table PEKD_DIRECTION add 
POSTINDEX
 VARCHAR (20) null /* �������� ������ */
;
alter  table PEKD_DIRECTION add 
TheTransport null /* ��������� */
;
alter  table PEKD_DIRECTION add 
TheAgent null /* ����� */
;


/*��������*/
drop table PEKD_TRAINS/*��������*/ 
;
create table PEKD_TRAINS/*��������*/ (
ParentStructRowID CHAR(38) not null,
PEKD_TRAINSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_TRAINS add 
TrainNo
 VARCHAR (50) null /* � ������ */
;
alter  table PEKD_TRAINS add 
FromStation null /* �� */
;
alter  table PEKD_TRAINS add 
ToSTATION null /* � */
;
alter  table PEKD_TRAINS add 
the_Rule
 VARCHAR (255) null /* �������� */
;
alter  table PEKD_TRAINS add 
TheDesciption
 VARCHAR (255) null /* �������� */
;
alter  table PEKD_TRAINS add 
TheComment null /* ���������� */
;
alter  table PEKD_TRAINS add 
TrainType null /* ��� ������ */
;


/*����� ��������*/
drop table PEKD_DIRSTATION/*����� ��������*/ 
;
create table PEKD_DIRSTATION/*����� ��������*/ (
ParentStructRowID CHAR(38) not null,
PEKD_DIRSTATIONid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_DIRSTATION add 
name
 VARCHAR (255) null /* �������� */
;
alter  table PEKD_DIRSTATION add 
POSTINDEX
 VARCHAR (20) null /* ������ ��������� */
;
alter  table PEKD_DIRSTATION add 
region null /* ������ */
;
alter  table PEKD_DIRSTATION add 
area
 VARCHAR (255) null /* ����� */
;
alter  table PEKD_DIRSTATION add 
TheNextTown null /* ����� */
;


/*�������������� ������*/
drop table PEKD_SRV/*�������������� ������*/ 
;
create table PEKD_SRV/*�������������� ������*/ (
InstanceID CHAR(38) ,
PEKD_SRVid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_SRV add 
name
 VARCHAR (255) null /* �������� */
;
alter  table PEKD_SRV add 
DependOnWeight null 
 check (DependOnWeight in ( -1/* �� */
, 0/* ��� */ )) /* ������� �� ���� */
;
alter  table PEKD_SRV add 
EDIZM null /* ������� ��������� */
;
alter  table PEKD_SRV add 
GRPDpUsl null /* ������ ����� */
;
alter  table PEKD_SRV add 
IsObligate null 
 check (IsObligate in ( -1/* �� */
, 0/* ��� */ )) /* �������� ������������ */
;
alter  table PEKD_SRV add 
CalcWithNDS null 
 check (CalcWithNDS in ( -1/* �� */
, 0/* ��� */ )) /* ������ � ��� */
;
alter  table PEKD_SRV add 
Code1C
 VARCHAR (40) null /* ���1� */
;




