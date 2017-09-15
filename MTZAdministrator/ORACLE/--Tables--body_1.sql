
/* --body*/

 
SELECT guid();



/*���� ���������*/
drop table MTZ.SrvMessageInfo/*���� ���������*/ 
/
create table MTZ.SrvMessageInfo/*���� ���������*/ (
InstanceID CHAR(38) ,
SrvMessageInfoid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.SrvMessageInfo add 
ForUser CHAR(38) null /* ��� ������������ */
/
alter  table MTZ.SrvMessageInfo add 
msgDate
 DATE null /* ���� */
/
alter  table MTZ.SrvMessageInfo add 
MsgInfo VARCHAR2(4000) null /* ����� ��������� */
/
alter  table MTZ.SrvMessageInfo add 
TheDocument CHAR(38) null /* �������� */
/
alter  table MTZ.SrvMessageInfo add 
ReadTime
 DATE null /* ����� ��������� */
/


/*��������*/
drop table MTZ.STDMail_To/**/ 
/
create table MTZ.STDMail_To/**/ (
InstanceID CHAR(38) ,
STDMail_Toid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.STDMail_To add 
TheTo
 VARCHAR2 (255) null /* ������� */
/
alter  table MTZ.STDMail_To add 
TheType
 NUMBER null 
 check (TheType in ( 0/* ���� */
, 2/* ������� ����� */
, 1/* ����� */ )) /* ��� */
/


/*��������*/
drop table MTZ.STDMail_Attach/**/ 
/
create table MTZ.STDMail_Attach/**/ (
InstanceID CHAR(38) ,
STDMail_Attachid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.STDMail_Attach add 
TheName
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.STDMail_Attach add 
TheFile VARCHAR2(4000) null /* ���� */
/
alter  table MTZ.STDMail_Attach add 
 TheFile_EXT varchar2(4) null
/


/*���������*/
drop table MTZ.STDMail_Info/**/ 
/
create table MTZ.STDMail_Info/**/ (
InstanceID CHAR(38) ,
STDMail_Infoid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.STDMail_Info add 
Subject
 VARCHAR2 (255) null /* ���� */
/
alter  table MTZ.STDMail_Info add 
TheBody VARCHAR2(4000) null /* ��������� */
/
alter  table MTZ.STDMail_Info add 
TheFromName
 VARCHAR2 (255) null /* �� ����� */
/
alter  table MTZ.STDMail_Info add 
Sended
 NUMBER null 
 check (Sended in ( -1/* �� */
, 0/* ��� */ )) /* �������� */
/
alter  table MTZ.STDMail_Info add 
IsDelete
 NUMBER null 
 check (IsDelete in ( -1/* �� */
, 0/* ��� */ )) /* ������� ����� �������� */
/
alter  table MTZ.STDMail_Info add 
CreatedDT
 DATE null /* ������� */
/
alter  table MTZ.STDMail_Info add 
SentDT
 DATE null /* ���������� */
/


/*�����������*/
drop table MTZ.ITTOPT_MOVE/*����������� �����������*/ 
/
create table MTZ.ITTOPT_MOVE/*����������� �����������*/ (
InstanceID CHAR(38) ,
ITTOPT_MOVEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTOPT_MOVE add 
sequence
 NUMBER null /* ����� */
/
alter  table MTZ.ITTOPT_MOVE add 
FromLocation
 VARCHAR2 (12) null /* �� ������ */
/
alter  table MTZ.ITTOPT_MOVE add 
ToLocation
 VARCHAR2 (12) null /* � ������ */
/
alter  table MTZ.ITTOPT_MOVE add 
ThePalletteNum
 VARCHAR2 (20) null /* ����� ������ */
/
alter  table MTZ.ITTOPT_MOVE add 
ISMoved
 NUMBER null 
 check (ISMoved in ( -1/* �� */
, 0/* ��� */ )) /* ���������� */
/


/*��������*/
drop table MTZ.ITTOPT_DEF/*�������� ������� �� �����������*/ 
/
create table MTZ.ITTOPT_DEF/*�������� ������� �� �����������*/ (
InstanceID CHAR(38) ,
ITTOPT_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTOPT_DEF add 
OptType CHAR(38) null /* ��� ����������� */
/
alter  table MTZ.ITTOPT_DEF add 
TheClient
 VARCHAR2 (255) null /* ������ */
/
alter  table MTZ.ITTOPT_DEF add 
good
 VARCHAR2 (255) null /* ����� */
/
alter  table MTZ.ITTOPT_DEF add 
made_country
 VARCHAR2 (255) null /* ������ ������������� */
/
alter  table MTZ.ITTOPT_DEF add 
Factory
 VARCHAR2 (255) null /* ����� */
/
alter  table MTZ.ITTOPT_DEF add 
KILL_NUMBER
 VARCHAR2 (255) null /* � ����� */
/
alter  table MTZ.ITTOPT_DEF add 
IsBrak
 VARCHAR2 (20) null /* ���� */
/
alter  table MTZ.ITTOPT_DEF add 
OPtDate
 DATE null /* ���� �������� ������ */
/
alter  table MTZ.ITTOPT_DEF add 
DateToOptimize
 DATE null /* �������� ���� ����������� */
/


/*����*/
drop table MTZ.Num_zones/*���� ���������� �������*/ 
/
create table MTZ.Num_zones/*���� ���������� �������*/ (
InstanceID CHAR(38) ,
Num_zonesid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.Num_zones add 
ZoneMask
 VARCHAR2 (255) null /* ����� ���� */
/


/*������*/
drop table MTZ.Num_Values/*���������� ������*/ 
/
create table MTZ.Num_Values/*���������� ������*/ (
ParentStructRowID CHAR(38) not null,
Num_Valuesid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.Num_Values add 
the_Value
 NUMBER null /* �������� */
/
alter  table MTZ.Num_Values add 
OwnerPartName
 VARCHAR2 (64) null /* ������ */
/
alter  table MTZ.Num_Values add 
OwnerRowID CHAR(38) null /* ������������� ������ */
/


/*��������*/
drop table MTZ.Num_head/*�������� ����������*/ 
/
create table MTZ.Num_head/*�������� ����������*/ (
InstanceID CHAR(38) ,
Num_headid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.Num_head add 
Name
 VARCHAR2 (80) null /* �������� */
/
alter  table MTZ.Num_head add 
Shema
 NUMBER null 
 check (Shema in ( 0/* ������ ���� */
, 1/* �� ���� */
, 4/* �� ��� */
, 2/* �� �������� */
, 3/* �� ������ */
, 10/* ������������ ���� */ )) /* ����� ��������� */
/


/*������ ����� �������*/
drop table MTZ.FilterFieldGroup/*������ ����� �������*/ 
/
create table MTZ.FilterFieldGroup/*������ ����� �������*/ (
InstanceID CHAR(38) ,
FilterFieldGroupid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.FilterFieldGroup add 
sequence
 NUMBER null /* ������������������ */
/
alter  table MTZ.FilterFieldGroup add 
Name
 VARCHAR2 (64) null /* �������� */
/
alter  table MTZ.FilterFieldGroup add 
Caption
 VARCHAR2 (255) null /* ��������� */
/
alter  table MTZ.FilterFieldGroup add 
AllowIgnore
 NUMBER null 
 check (AllowIgnore in ( -1/* �� */
, 0/* ��� */ )) /* ����� ��������� */
/


/*���� �������*/
drop table MTZ.FileterField/*���� �������*/ 
/
create table MTZ.FileterField/*���� �������*/ (
ParentStructRowID CHAR(38) not null,
FileterFieldid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.FileterField add 
sequence
 NUMBER null /* ������������������ */
/
alter  table MTZ.FileterField add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.FileterField add 
Caption
 VARCHAR2 (255) null /* ��������� */
/
alter  table MTZ.FileterField add 
FieldType CHAR(38) null /* ��� ���� */
/
alter  table MTZ.FileterField add 
FieldSize
 NUMBER null /* ������ */
/
alter  table MTZ.FileterField add 
RefType
 NUMBER null 
 check (RefType in ( 2/* �� ������ ������� */
, 3/* �� �������� ������ */
, 0/* ��������� ���� ( �� ������) */
, 1/* �� ������  */ )) /* ��� ������ */
/
alter  table MTZ.FileterField add 
RefToType CHAR(38) null /* ���, ���� ��������� */
/
alter  table MTZ.FileterField add 
RefToPart CHAR(38) null /* ������, ���� ��������� */
/
alter  table MTZ.FileterField add 
ValueArray
 NUMBER null 
 check (ValueArray in ( -1/* �� */
, 0/* ��� */ )) /* ������ �������� */
/


/*������*/
drop table MTZ.Filters/*������*/ 
/
create table MTZ.Filters/*������*/ (
InstanceID CHAR(38) ,
Filtersid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.Filters add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.Filters add 
TheCaption
 VARCHAR2 (80) null /* ��������� */
/
alter  table MTZ.Filters add 
TheComment VARCHAR2(4000) null /* �������� */
/


/*������� ��� �����*/
drop table MTZ.StateAction/*������� ��� �����*/ 
/
create table MTZ.StateAction/*������� ��� �����*/ (
InstanceID CHAR(38) ,
StateActionid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.StateAction add 
OnDocStatus CHAR(38) null /* ��� ����� � �������� */
/
alter  table MTZ.StateAction add 
NewSecurityStyle CHAR(38) null /* ���������� ����� ������ */
/
alter  table MTZ.StateAction add 
ClearSecurity
 NUMBER null 
 check (ClearSecurity in ( -1/* �� */
, 0/* ��� */ )) /* �������� ����� ������ */
/
alter  table MTZ.StateAction add 
LibraryFile
 VARCHAR2 (255) null /* ����������-���������� */
/
alter  table MTZ.StateAction add 
ActionClass
 VARCHAR2 (255) null /* ����� ��� ��������� */
/
alter  table MTZ.StateAction add 
ActionScript VARCHAR2(4000) null /* ������ ��� ���������� */
/


/*��� ������� � ������*/
drop table MTZ.WEBSDIC_QTYPE/**/ 
/
create table MTZ.WEBSDIC_QTYPE/**/ (
InstanceID CHAR(38) ,
WEBSDIC_QTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBSDIC_QTYPE add 
Sequence
 NUMBER null /* ����� �/� */
/
alter  table MTZ.WEBSDIC_QTYPE add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.WEBSDIC_QTYPE add 
Template VARCHAR2(4000) null /* ��������� */
/


/*�������� ���������*/
drop table MTZ.WEBSDIC_DEF/**/ 
/
create table MTZ.WEBSDIC_DEF/**/ (
InstanceID CHAR(38) ,
WEBSDIC_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBSDIC_DEF add 
WEBS CHAR(38) null /* ���� */
/
alter  table MTZ.WEBSDIC_DEF add 
PathToFiles
 VARCHAR2 (2048) null /* ������� ��� ������ */
/


/*��� ��������*/
drop table MTZ.WEBSDIC_PAGETYPE/**/ 
/
create table MTZ.WEBSDIC_PAGETYPE/**/ (
InstanceID CHAR(38) ,
WEBSDIC_PAGETYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBSDIC_PAGETYPE add 
Sequence
 NUMBER null /* ����� �/� */
/
alter  table MTZ.WEBSDIC_PAGETYPE add 
Name
 VARCHAR2 (64) null /* �������� */
/


/*���������� �������*/
drop table MTZ.MTZ2JOB_DEF/*�������� ����������� �������*/ 
/
create table MTZ.MTZ2JOB_DEF/*�������� ����������� �������*/ (
InstanceID CHAR(38) ,
MTZ2JOB_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.MTZ2JOB_DEF add 
EventDate
 DATE null /* �������� �� */
/
alter  table MTZ.MTZ2JOB_DEF add 
EvenType
 VARCHAR2 (255) null /* ��� ������� */
/
alter  table MTZ.MTZ2JOB_DEF add 
ThruObject CHAR(38) null /* ������ - ������� ������� */
/
alter  table MTZ.MTZ2JOB_DEF add 
ThruState CHAR(38) null /* ��������� - ������� */
/
alter  table MTZ.MTZ2JOB_DEF add 
NextState CHAR(38) null /* ��������� ����� ��������� */
/
alter  table MTZ.MTZ2JOB_DEF add 
ProcessDate
 DATE null /* ������ ��������� */
/
alter  table MTZ.MTZ2JOB_DEF add 
Processed
 NUMBER null 
 check (Processed in ( -1/* �� */
, 0/* ��� */ )) /* ��������� */
/


/*������� ��������������� ��������*/
drop table MTZ.REPD_LOCKED/*������� ��������������� ��������*/ 
/
create table MTZ.REPD_LOCKED/*������� ��������������� ��������*/ (
InstanceID CHAR(38) ,
REPD_LOCKEDid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.REPD_LOCKED add 
LastTry
 DATE null /* ��������� ���������� */
/
alter  table MTZ.REPD_LOCKED add 
SourceFile
 VARCHAR2 (2048) null /* ���� ������ */
/
alter  table MTZ.REPD_LOCKED add 
ReplicaRowID CHAR(38) null /* ������������� ������ ������� */
/
alter  table MTZ.REPD_LOCKED add 
FirstTry
 DATE null /* ������ ��������� */
/
alter  table MTZ.REPD_LOCKED add 
StructType
 VARCHAR2 (255) null /* ��� ������ */
/
alter  table MTZ.REPD_LOCKED add 
ObjectType
 VARCHAR2 (255) null /* ��� ������� */
/
alter  table MTZ.REPD_LOCKED add 
The_RowID CHAR(38) null /* ������������� ������ */
/
alter  table MTZ.REPD_LOCKED add 
The_InstanceID CHAR(38) null /* ������ */
/
alter  table MTZ.REPD_LOCKED add 
ReplicaPackID CHAR(38) null /* ReplicaPackID */
/
alter  table MTZ.REPD_LOCKED add 
PartCount
 NUMBER null /* PartCount */
/
alter  table MTZ.REPD_LOCKED add 
PartNumber
 NUMBER null /* PartNumber */
/


/*������ ������ �� ������\ ������*/
drop table MTZ.REPD_RequestQuery/*������ ������ �� ������\ ������*/ 
/
create table MTZ.REPD_RequestQuery/*������ ������ �� ������\ ������*/ (
InstanceID CHAR(38) ,
REPD_RequestQueryid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.REPD_RequestQuery add 
TheRowID CHAR(38) null /* TheRowID */
/
alter  table MTZ.REPD_RequestQuery add 
ReqPartName
 VARCHAR2 (255) null /* ReqPartName */
/
alter  table MTZ.REPD_RequestQuery add 
ObjectID CHAR(38) null /* ObjectID */
/
alter  table MTZ.REPD_RequestQuery add 
SourceSrv CHAR(38) null /* SourceSrv */
/
alter  table MTZ.REPD_RequestQuery add 
SendRecord CHAR(38) null /* SendRecord */
/
alter  table MTZ.REPD_RequestQuery add 
DestSrv CHAR(38) null /* DestSrv */
/
alter  table MTZ.REPD_RequestQuery add 
Provider CHAR(38) null /* Provider */
/
alter  table MTZ.REPD_RequestQuery add 
ReqTypeName
 VARCHAR2 (255) null /* ReqTypeName */
/


/*��������� �������*/
drop table MTZ.REPD_ResQueryRcv/*��������� �������*/ 
/
create table MTZ.REPD_ResQueryRcv/*��������� �������*/ (
ParentStructRowID CHAR(38) not null,
REPD_ResQueryRcvid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.REPD_ResQueryRcv add 
ReceiveRec CHAR(38) null /* ReceiveRec */
/


/*��������� �����������*/
drop table MTZ.REPD_PROV/*��������� �����������*/ 
/
create table MTZ.REPD_PROV/*��������� �����������*/ (
InstanceID CHAR(38) ,
REPD_PROVid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.REPD_PROV add 
AssemblyName
 VARCHAR2 (255) null /* AssemblyName */
/
alter  table MTZ.REPD_PROV add 
ClassName
 VARCHAR2 (255) null /* ClassName */
/
alter  table MTZ.REPD_PROV add 
Name
 VARCHAR2 (255) null /* Name */
/


/*���� ����������*/
drop table MTZ.REPD_SRV/*���� ����������*/ 
/
create table MTZ.REPD_SRV/*���� ����������*/ (
InstanceID CHAR(38) ,
REPD_SRVid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.REPD_SRV add 
Obj3 CHAR(38) null /* Obj3 */
/
alter  table MTZ.REPD_SRV add 
name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.REPD_SRV add 
Obj2 CHAR(38) null /* Obj2 */
/
alter  table MTZ.REPD_SRV add 
Obj1 CHAR(38) null /* Obj1 */
/


/*���������� ������*/
drop table MTZ.REPD_SNDTO/*���������� ������*/ 
/
create table MTZ.REPD_SNDTO/*���������� ������*/ (
ParentStructRowID CHAR(38) not null,
REPD_SNDTOid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.REPD_SNDTO add 
DestSrv CHAR(38) null /* DestSrv */
/
alter  table MTZ.REPD_SNDTO add 
LastScan
 DATE null /* Last scan */
/
alter  table MTZ.REPD_SNDTO add 
Config VARCHAR2(4000) null /* Config */
/
alter  table MTZ.REPD_SNDTO add 
LastReceive
 DATE null /* Last Receive */
/
alter  table MTZ.REPD_SNDTO add 
Provider CHAR(38) null /* Provider */
/
alter  table MTZ.REPD_SNDTO add 
Work_Start
 DATE null /* ������ ������ (�����) */
/
alter  table MTZ.REPD_SNDTO add 
Work_End
 DATE null /* ��������� ������ (�����) */
/
alter  table MTZ.REPD_SNDTO add 
The_Interval
 NUMBER null /* �������� */
/
alter  table MTZ.REPD_SNDTO add 
IsActive
 NUMBER null 
 check (IsActive in ( -1/* �� */
, 0/* ��� */ )) /* ������� */
/
alter  table MTZ.REPD_SNDTO add 
LastApproveLog
 DATE null /* ��������� ������������� (���) */
/


/*��������� � �������*/
drop table MTZ.REPD_CONST/**/ 
/
create table MTZ.REPD_CONST/**/ (
ParentStructRowID CHAR(38) not null,
REPD_CONSTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.REPD_CONST add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.REPD_CONST add 
TheValue
 VARCHAR2 (255) null /* �������� */
/


/*��� ���������� ����������*/
drop table MTZ.REPD_REPTYPE/*�������� ���� ���������� ���������� ��� ����*/ 
/
create table MTZ.REPD_REPTYPE/*�������� ���� ���������� ���������� ��� ����*/ (
ParentStructRowID CHAR(38) not null,
REPD_REPTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.REPD_REPTYPE add 
ReplicaType
 NUMBER null 
 check (ReplicaType in ( 0/* ���� �������� */
, 2/* ��������� */
, 1/* ��������� */ )) /* ��� ���������� */
/
alter  table MTZ.REPD_REPTYPE add 
TheObjectType CHAR(38) null /* ��� ������� */
/
alter  table MTZ.REPD_REPTYPE add 
UseFilter
 NUMBER null 
 check (UseFilter in ( -1/* �� */
, 0/* ��� */ )) /* ����������� �� ������� */
/
alter  table MTZ.REPD_REPTYPE add 
RepConditonQRY VARCHAR2(4000) null /* ������� ���������� */
/


/*������� �������*/
drop table MTZ.REPD_SendQ/*������� �������*/ 
/
create table MTZ.REPD_SendQ/*������� �������*/ (
InstanceID CHAR(38) ,
REPD_SendQid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.REPD_SendQ add 
SourceSrv CHAR(38) null /* SourceSrv */
/
alter  table MTZ.REPD_SendQ add 
Config VARCHAR2(4000) null /* Config */
/
alter  table MTZ.REPD_SendQ add 
SentDate
 DATE null /* SentDate */
/
alter  table MTZ.REPD_SendQ add 
DestSrv CHAR(38) null /* DestSrv */
/
alter  table MTZ.REPD_SendQ add 
Provider CHAR(38) null /* Provider */
/
alter  table MTZ.REPD_SendQ add 
Acknowelge
 NUMBER null 
 check (Acknowelge in ( -1/* �� */
, 0/* ��� */ )) /* Acknowelge */
/
alter  table MTZ.REPD_SendQ add 
SendSize
 NUMBER null /* SendSize */
/
alter  table MTZ.REPD_SendQ add 
CheckDate
 DATE null /* CheckDate */
/
alter  table MTZ.REPD_SendQ add 
ReplicaPackID CHAR(38) null /* ReplicaPackID */
/
alter  table MTZ.REPD_SendQ add 
FileName
 VARCHAR2 (1024) null /* FileName */
/
alter  table MTZ.REPD_SendQ add 
PartCount
 NUMBER null /* ���������� ������ */
/
alter  table MTZ.REPD_SendQ add 
PartNumber
 NUMBER null /* ����� */
/
alter  table MTZ.REPD_SendQ add 
Sent
 NUMBER null 
 check (Sent in ( 1/* �� */
, 0/* ��� */ )) /* Sent */
/
alter  table MTZ.REPD_SendQ add 
ReplicatorPointer
 DATE null /* ��������� ���������� */
/


/*������� ��������� ������*/
drop table MTZ.REPD_RecvQ/*������� ��������� ������*/ 
/
create table MTZ.REPD_RecvQ/*������� ��������� ������*/ (
InstanceID CHAR(38) ,
REPD_RecvQid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.REPD_RecvQ add 
TheRowID CHAR(38) null /* TheRowID */
/
alter  table MTZ.REPD_RecvQ add 
Received
 DATE null /* Received */
/
alter  table MTZ.REPD_RecvQ add 
Provider CHAR(38) null /* Provider */
/
alter  table MTZ.REPD_RecvQ add 
RecvSize
 NUMBER null /* RecvSize */
/
alter  table MTZ.REPD_RecvQ add 
SourceSrv CHAR(38) null /* SourceSrv */
/
alter  table MTZ.REPD_RecvQ add 
DestSrv CHAR(38) null /* DestSrv */
/
alter  table MTZ.REPD_RecvQ add 
Acknowelge
 NUMBER null 
 check (Acknowelge in ( -1/* �� */
, 0/* ��� */ )) /* Acknowelge */
/
alter  table MTZ.REPD_RecvQ add 
ReplicaPackID CHAR(38) null /* ReplicaPackID */
/
alter  table MTZ.REPD_RecvQ add 
PartCount
 NUMBER null /* ���������� ������ */
/
alter  table MTZ.REPD_RecvQ add 
PartNumber
 NUMBER null /* ����� */
/
alter  table MTZ.REPD_RecvQ add 
FileName
 VARCHAR2 (1024) null /* FileName */
/
alter  table MTZ.REPD_RecvQ add 
Completed
 NUMBER null 
 check (Completed in ( -1/* �� */
, 0/* ��� */ )) /* Completed */
/


/*����������  ��������� �����*/
drop table MTZ.ST_MAIN/**/ 
/
create table MTZ.ST_MAIN/**/ (
InstanceID CHAR(38) ,
ST_MAINid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ST_MAIN add 
AccessDate
 DATE null /* ���� */
/
alter  table MTZ.ST_MAIN add 
UrlReferer
 VARCHAR2 (1024) null /* ���������� ����� */
/
alter  table MTZ.ST_MAIN add 
UserAgent
 VARCHAR2 (256) null /* �������� ����� */
/
alter  table MTZ.ST_MAIN add 
UserHostAddress
 VARCHAR2 (512) null /* ����� ����� */
/
alter  table MTZ.ST_MAIN add 
UserHostName
 VARCHAR2 (512) null /* ��� ����� */
/
alter  table MTZ.ST_MAIN add 
the_Description
 VARCHAR2 (1024) null /* ���������� */
/
alter  table MTZ.ST_MAIN add 
WEBS_Page CHAR(38) null /* ��������� �������� */
/


/*��������*/
drop table MTZ.ST_DEF/**/ 
/
create table MTZ.ST_DEF/**/ (
InstanceID CHAR(38) ,
ST_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ST_DEF add 
Name
 VARCHAR2 (1024) null /* ��� */
/
alter  table MTZ.ST_DEF add 
WEBS CHAR(38) null /* ���� */
/
alter  table MTZ.ST_DEF add 
the_Description
 VARCHAR2 (4000) null /* ���������� */
/
alter  table MTZ.ST_DEF add 
IsActive
 NUMBER null 
 check (IsActive in ( -1/* �� */
, 0/* ��� */ )) /* ������� */
/


/*���������� ��������� ������� �����*/
drop table MTZ.ST_PAGES/**/ 
/
create table MTZ.ST_PAGES/**/ (
InstanceID CHAR(38) ,
ST_PAGESid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ST_PAGES add 
AccessDate
 DATE null /* ���� */
/
alter  table MTZ.ST_PAGES add 
UrlReferer
 VARCHAR2 (1024) null /* ���������� ����� */
/
alter  table MTZ.ST_PAGES add 
UserAgent
 VARCHAR2 (256) null /* �������� ����� */
/
alter  table MTZ.ST_PAGES add 
UserHostAddress
 VARCHAR2 (512) null /* ����� ����� */
/
alter  table MTZ.ST_PAGES add 
UserHostName
 VARCHAR2 (512) null /* ��� ����� */
/
alter  table MTZ.ST_PAGES add 
the_Description
 VARCHAR2 (1024) null /* ���������� */
/
alter  table MTZ.ST_PAGES add 
WEBS_Page CHAR(38) null /* ��������� �������� */
/


/*��������� ���������*/
drop table MTZ.ITTD_MOROZ/*��������� ���������*/ 
/
create table MTZ.ITTD_MOROZ/*��������� ���������*/ (
InstanceID CHAR(38) ,
ITTD_MOROZid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_MOROZ add 
TheClient VARCHAR2(4000) null /* ������ */
/
alter  table MTZ.ITTD_MOROZ add 
WeightConst
 NUMBER null /* �������� ����� */
/
alter  table MTZ.ITTD_MOROZ add 
MorozConst
 NUMBER null /* ����������� ��������� */
/


/*������� ������������ ������*/
drop table MTZ.ITTD_RULE/*������� �� �������� ���������� ������������ ����
� ������������ ��� ������*/ 
/
create table MTZ.ITTD_RULE/*������� �� �������� ���������� ������������ ����
� ������������ ��� ������*/ (
InstanceID CHAR(38) ,
ITTD_RULEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_RULE add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.ITTD_RULE add 
UseProduct
 NUMBER null 
 check (UseProduct in ( -1/* �� */
, 0/* ��� */ )) /* ����� */
/
alter  table MTZ.ITTD_RULE add 
TheCountry
 NUMBER null 
 check (TheCountry in ( -1/* �� */
, 0/* ��� */ )) /* ������ */
/
alter  table MTZ.ITTD_RULE add 
TheFactory
 NUMBER null 
 check (TheFactory in ( -1/* �� */
, 0/* ��� */ )) /* ����� */
/
alter  table MTZ.ITTD_RULE add 
KillPlace
 NUMBER null 
 check (KillPlace in ( -1/* �� */
, 0/* ��� */ )) /* ����� */
/
alter  table MTZ.ITTD_RULE add 
UseBrak
 NUMBER null 
 check (UseBrak in ( -1/* �� */
, 0/* ��� */ )) /* ���� */
/
alter  table MTZ.ITTD_RULE add 
UseExpDate
 NUMBER null 
 check (UseExpDate in ( -1/* �� */
, 0/* ��� */ )) /* ���� �������� */
/


/*��� ������*/
drop table MTZ.ITTD_PLTYPE/**/ 
/
create table MTZ.ITTD_PLTYPE/**/ (
InstanceID CHAR(38) ,
ITTD_PLTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_PLTYPE add 
Name
 VARCHAR2 (255) null /* �������� */
/


/*�����*/
drop table MTZ.ITTD_FACTORY/**/ 
/
create table MTZ.ITTD_FACTORY/**/ (
InstanceID CHAR(38) ,
ITTD_FACTORYid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_FACTORY add 
Country CHAR(38) null /* ������ */
/
alter  table MTZ.ITTD_FACTORY add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.ITTD_FACTORY add 
Code1
 VARCHAR2 (10) null /* ���1 */
/
alter  table MTZ.ITTD_FACTORY add 
Code2
 VARCHAR2 (10) null /* ��� 2 */
/


/*��� ����*/
drop table MTZ.ITTD_ZTYPE/**/ 
/
create table MTZ.ITTD_ZTYPE/**/ (
InstanceID CHAR(38) ,
ITTD_ZTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_ZTYPE add 
Name
 VARCHAR2 (255) null /* �������� */
/


/*��� ������*/
drop table MTZ.ITTD_GTYPE/**/ 
/
create table MTZ.ITTD_GTYPE/**/ (
InstanceID CHAR(38) ,
ITTD_GTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_GTYPE add 
Name
 VARCHAR2 (255) null /* �������� */
/


/*�����*/
drop table MTZ.ITTD_KILLPLACE/**/ 
/
create table MTZ.ITTD_KILLPLACE/**/ (
InstanceID CHAR(38) ,
ITTD_KILLPLACEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_KILLPLACE add 
Factory CHAR(38) null /* ������������� */
/
alter  table MTZ.ITTD_KILLPLACE add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.ITTD_KILLPLACE add 
Code1
 VARCHAR2 (10) null /* ���1 */
/
alter  table MTZ.ITTD_KILLPLACE add 
Code2
 VARCHAR2 (10) null /* ��� 2 */
/


/*������*/
drop table MTZ.ITTD_COUNTRY/**/ 
/
create table MTZ.ITTD_COUNTRY/**/ (
InstanceID CHAR(38) ,
ITTD_COUNTRYid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_COUNTRY add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.ITTD_COUNTRY add 
Code1
 VARCHAR2 (10) null /* ���1 */
/
alter  table MTZ.ITTD_COUNTRY add 
Code2
 VARCHAR2 (10) null /* ��� 2 */
/
alter  table MTZ.ITTD_COUNTRY add 
TheSupplier
 VARCHAR2 (255) null /* ��������� */
/


/*��� ������*/
drop table MTZ.ITTD_QTYPE/**/ 
/
create table MTZ.ITTD_QTYPE/**/ (
InstanceID CHAR(38) ,
ITTD_QTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_QTYPE add 
Name
 VARCHAR2 (255) null /* �������� */
/


/*����������� ������*/
drop table MTZ.ITTD_CAMERA/*����������� ������*/ 
/
create table MTZ.ITTD_CAMERA/*����������� ������*/ (
InstanceID CHAR(38) ,
ITTD_CAMERAid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_CAMERA add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.ITTD_CAMERA add 
CameraMask
 VARCHAR2 (12) null /* ����� ������ ����� */
/


/*������*/
drop table MTZ.ITTD_SRV/**/ 
/
create table MTZ.ITTD_SRV/**/ (
InstanceID CHAR(38) ,
ITTD_SRVid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_SRV add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.ITTD_SRV add 
ForShipping
 NUMBER null 
 check (ForShipping in ( -1/* �� */
, 0/* ��� */ )) /* ��� �������� */
/
alter  table MTZ.ITTD_SRV add 
ForReceiving
 NUMBER null 
 check (ForReceiving in ( -1/* �� */
, 0/* ��� */ )) /* ��� ������ ������ */
/
alter  table MTZ.ITTD_SRV add 
LinkCode
 VARCHAR2 (30) null /* ��� �������� */
/
alter  table MTZ.ITTD_SRV add 
AutoSetPallet
 NUMBER null 
 check (AutoSetPallet in ( -1/* �� */
, 0/* ��� */ )) /* ����������� ���-�� ������ */
/


/*��� ��������*/
drop table MTZ.ITTD_ATYPE/**/ 
/
create table MTZ.ITTD_ATYPE/**/ (
InstanceID CHAR(38) ,
ITTD_ATYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_ATYPE add 
Name
 VARCHAR2 (255) null /* �������� */
/


/*��� �����������*/
drop table MTZ.ITTD_OPTTYPE/*��� ����������� ������*/ 
/
create table MTZ.ITTD_OPTTYPE/*��� ����������� ������*/ (
InstanceID CHAR(38) ,
ITTD_OPTTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_OPTTYPE add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.ITTD_OPTTYPE add 
Code
 VARCHAR2 (1) null /* ��� �������� */
/


/*�������� ������*/
drop table MTZ.ITTD_EMAIL/*������ ����������� ���������� � ���������*/ 
/
create table MTZ.ITTD_EMAIL/*������ ����������� ���������� � ���������*/ (
InstanceID CHAR(38) ,
ITTD_EMAILid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_EMAIL add 
FIO
 VARCHAR2 (255) null /* ���. ���������� */
/
alter  table MTZ.ITTD_EMAIL add 
EMAIL VARCHAR2(255) null /* ����� ����������� ����� */
/
alter  table MTZ.ITTD_EMAIL add 
IgnoreAddress
 NUMBER null 
 check (IgnoreAddress in ( -1/* �� */
, 0/* ��� */ )) /* ��������� ����������� �� ���� ����� */
/


/*������ ������*/
drop table MTZ.ITTD_PART/**/ 
/
create table MTZ.ITTD_PART/**/ (
InstanceID CHAR(38) ,
ITTD_PARTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_PART add 
TheGood VARCHAR2(4000) null /* ����� */
/
alter  table MTZ.ITTD_PART add 
Name
 VARCHAR2 (255) null /* ������������ ������ */
/


/*��������*/
drop table MTZ.ITTPL_DEF/**/ 
/
create table MTZ.ITTPL_DEF/**/ (
InstanceID CHAR(38) ,
ITTPL_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTPL_DEF add 
Code
 VARCHAR2 (14) null /* ��� ������ */
/
alter  table MTZ.ITTPL_DEF add 
TheNumber
 NUMBER null /* ����� */
/
alter  table MTZ.ITTPL_DEF add 
PalKode
 VARCHAR2 (30) null /* �������� */
/
alter  table MTZ.ITTPL_DEF add 
Weight
 NUMBER null /* ��� ������� */
/
alter  table MTZ.ITTPL_DEF add 
Pltype CHAR(38) null /* ��� ������ */
/
alter  table MTZ.ITTPL_DEF add 
WDate
 DATE null /* ���� ����������� */
/
alter  table MTZ.ITTPL_DEF add 
CaliberQuantity
 NUMBER null /* ���������� ������� �� ������� */
/
alter  table MTZ.ITTPL_DEF add 
CurrentGood VARCHAR2(4000) null /* ������� ����� */
/
alter  table MTZ.ITTPL_DEF add 
CurrentWeightBrutto
 NUMBER null /* ��� ������� � ������� */
/
alter  table MTZ.ITTPL_DEF add 
CurrentPosition
 VARCHAR2 (12) null /* ������� ������ ������ */
/
alter  table MTZ.ITTPL_DEF add 
PackageWeight
 NUMBER null /* ��� �������� */
/
alter  table MTZ.ITTPL_DEF add 
CorePalette_ID
 NUMBER null /* ������������� ������ � CoreIMS */
/
alter  table MTZ.ITTPL_DEF add 
PrivatePalet
 NUMBER null 
 check (PrivatePalet in ( -1/* �� */
, 0/* ��� */ )) /* ����� ������ */
/


/*���������*/
drop table MTZ.ITTOP_OPLNK/*�������� ����������*/ 
/
create table MTZ.ITTOP_OPLNK/*�������� ����������*/ (
InstanceID CHAR(38) ,
ITTOP_OPLNKid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTOP_OPLNK add 
TheUser CHAR(38) null /* ������������ */
/


/*����������� ������*/
drop table MTZ.ITTOP_OPKAM/*������, � �������� �������� ��������*/ 
/
create table MTZ.ITTOP_OPKAM/*������, � �������� �������� ��������*/ (
ParentStructRowID CHAR(38) not null,
ITTOP_OPKAMid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTOP_OPKAM add 
TheKamera CHAR(38) null /* ������ */
/


/*����������*/
drop table MTZ.ITTOP_KLNK/*�������� �����������*/ 
/
create table MTZ.ITTOP_KLNK/*�������� �����������*/ (
InstanceID CHAR(38) ,
ITTOP_KLNKid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTOP_KLNK add 
TheUser CHAR(38) null /* ������������ */
/


/*����������� ������*/
drop table MTZ.ITTOP_KCAM/*�������� ���������� � ����������� �������*/ 
/
create table MTZ.ITTOP_KCAM/*�������� ���������� � ����������� �������*/ (
ParentStructRowID CHAR(38) not null,
ITTOP_KCAMid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTOP_KCAM add 
TheKamera CHAR(38) null /* ������ */
/


/*�������*/
drop table MTZ.ITTOP_KCLI/*�������� ���������� � ��������*/ 
/
create table MTZ.ITTOP_KCLI/*�������� ���������� � ��������*/ (
ParentStructRowID CHAR(38) not null,
ITTOP_KCLIid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTOP_KCLI add 
TheClient VARCHAR2(4000) null /* ������ */
/


/*������������ ������ ��������*/
drop table MTZ.ITTFN_MAX/**/ 
/
create table MTZ.ITTFN_MAX/**/ (
InstanceID CHAR(38) ,
ITTFN_MAXid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTFN_MAX add 
PalMaxNum
 NUMBER null /* ������������ ����� ������� */
/


/*�������� ���������� ������*/
drop table MTZ.STDJournlaExtInfo/**/ 
/
create table MTZ.STDJournlaExtInfo/**/ (
InstanceID CHAR(38) ,
STDJournlaExtInfoid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.STDJournlaExtInfo add 
TheName
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.STDJournlaExtInfo add 
TheJournalRef CHAR(38) null /* ������ */
/


/*���������*/
drop table MTZ.STDJournalExtParam/**/ 
/
create table MTZ.STDJournalExtParam/**/ (
InstanceID CHAR(38) ,
STDJournalExtParamid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.STDJournalExtParam add 
FieldName
 VARCHAR2 (255) null /* ���� (��������) */
/
alter  table MTZ.STDJournalExtParam add 
ParamName
 VARCHAR2 (80) null /* �������� */
/
alter  table MTZ.STDJournalExtParam add 
TargetPlatform CHAR(38) null /* ������� ��������� */
/


/*������� �������*/
drop table MTZ.STDJournalExtFlt/**/ 
/
create table MTZ.STDJournalExtFlt/**/ (
InstanceID CHAR(38) ,
STDJournalExtFltid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.STDJournalExtFlt add 
ViewSource
 VARCHAR2 (255) null /* �������� ������� */
/


/*��������� �������*/
drop table MTZ.STDJournalExtField/**/ 
/
create table MTZ.STDJournalExtField/**/ (
ParentStructRowID CHAR(38) not null,
STDJournalExtFieldid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.STDJournalExtField add 
ViewField
 VARCHAR2 (255) null /* ������� ������� */
/
alter  table MTZ.STDJournalExtField add 
FieldSource
 VARCHAR2 (255) null /* ���� */
/
alter  table MTZ.STDJournalExtField add 
TargetPlatform CHAR(38) null /* ������� ��������� */
/
alter  table MTZ.STDJournalExtField add 
ConstantValue
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.STDJournalExtField add 
ConditionType
 NUMBER null 
 check (ConditionType in ( 2/* <> */
, 3/* > */
, 1/* = */
, 4/* >= */
, 7/* <= */
, 8/* like */
, 6/* < */
, 0/* none */ )) /* ������� */
/


/*���������*/
drop table MTZ.Ext_Photos/**/ 
/
create table MTZ.Ext_Photos/**/ (
InstanceID CHAR(38) ,
Ext_Photosid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.Ext_Photos add 
TheName
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.Ext_Photos add 
TheSourceObject
 VARCHAR2 (255) null /* �������� ������ (���) */
/
alter  table MTZ.Ext_Photos add 
TheJournal CHAR(38) null /* ������ */
/
alter  table MTZ.Ext_Photos add 
TheReplacedPart
 VARCHAR2 (255) null /* ����������� ����� */
/
alter  table MTZ.Ext_Photos add 
TheRefFieldName
 VARCHAR2 (255) null /* ���� ������ �� ���������� */
/


/*����� �����������*/
drop table MTZ.Ext_Photo_Call/**/ 
/
create table MTZ.Ext_Photo_Call/**/ (
ParentStructRowID CHAR(38) not null,
Ext_Photo_Callid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.Ext_Photo_Call add 
TargetPlatform CHAR(38) null /* TargetPlatform */
/
alter  table MTZ.Ext_Photo_Call add 
TheCallString
 VARCHAR2 (255) null /* ����� */
/


/*��� ����*/
drop table MTZ.FIELDTYPE/*���� �����, ������������, ���������*/ 
/
create table MTZ.FIELDTYPE/*���� �����, ������������, ���������*/ (
InstanceID CHAR(38) ,
FIELDTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.FIELDTYPE add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.FIELDTYPE add 
TypeStyle
 NUMBER null 
 check (TypeStyle in ( 3/* �������� */
, 5/* ������� ���������� */
, 0/* ��������� ��� */
, 4/* ������ */
, 2/* ������������ */
, 1/* ��������� */ )) /* ��������� */
/
alter  table MTZ.FIELDTYPE add 
the_Comment VARCHAR2(4000) null /* �������� */
/
alter  table MTZ.FIELDTYPE add 
AllowSize
 NUMBER null 
 check (AllowSize in ( -1/* �� */
, 0/* ��� */ )) /* ����� ������ */
/
alter  table MTZ.FIELDTYPE add 
Minimum
 VARCHAR2 (64) null /* ������� */
/
alter  table MTZ.FIELDTYPE add 
Maximum
 VARCHAR2 (64) null /* �������� */
/
alter  table MTZ.FIELDTYPE add 
AllowLikeSearch
 NUMBER null 
 check (AllowLikeSearch in ( -1/* �� */
, 0/* ��� */ )) /* ����� ������ */
/
alter  table MTZ.FIELDTYPE add 
GridSortType
 NUMBER null 
 check (GridSortType in ( 0/* As String */
, 1/* As Numeric */
, 2/* As Date */ )) /* ������� ���������� � ��������� ������������� */
/


/*�����������*/
drop table MTZ.FIELDTYPEMAP/*����������� ���� ���� �� ���������� ��� ��������*/ 
/
create table MTZ.FIELDTYPEMAP/*����������� ���� ���� �� ���������� ��� ��������*/ (
ParentStructRowID CHAR(38) not null,
FIELDTYPEMAPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.FIELDTYPEMAP add 
Target CHAR(38) null /* ��������� */
/
alter  table MTZ.FIELDTYPEMAP add 
StoageType
 VARCHAR2 (255) null /* ��� �������� */
/
alter  table MTZ.FIELDTYPEMAP add 
FixedSize
 NUMBER null /* ������ */
/


/*�������*/
drop table MTZ.ENUMITEM/*��� �������� Enum �����*/ 
/
create table MTZ.ENUMITEM/*��� �������� Enum �����*/ (
ParentStructRowID CHAR(38) not null,
ENUMITEMid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ENUMITEM add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.ENUMITEM add 
NameValue
 NUMBER null /* �������� */
/
alter  table MTZ.ENUMITEM add 
NameInCode
 VARCHAR2 (100) null /* �������� � ���� */
/


/*������ � ���������*/
drop table MTZ.SHAREDMETHOD/*������ � ���������*/ 
/
create table MTZ.SHAREDMETHOD/*������ � ���������*/ (
InstanceID CHAR(38) ,
SHAREDMETHODid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.SHAREDMETHOD add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.SHAREDMETHOD add 
the_Comment VARCHAR2(4000) null /* �������� ������ */
/
alter  table MTZ.SHAREDMETHOD add 
ReturnType CHAR(38) null /* ������������ ��� */
/


/*����������*/
drop table MTZ.SCRIPT/*��� ������ �� �������� ����������� ���������� �����*/ 
/
create table MTZ.SCRIPT/*��� ������ �� �������� ����������� ���������� �����*/ (
ParentStructRowID CHAR(38) not null,
SCRIPTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.SCRIPT add 
Target CHAR(38) null /* ������� ��������� */
/
alter  table MTZ.SCRIPT add 
Code VARCHAR2(4000) null /* ������ */
/


/*���������*/
drop table MTZ.PARAMETERS/*��������� ������*/ 
/
create table MTZ.PARAMETERS/*��������� ������*/ (
ParentStructRowID CHAR(38) not null,
PARAMETERSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.PARAMETERS add 
sequence
 NUMBER null /* ������������������ */
/
alter  table MTZ.PARAMETERS add 
Name
 VARCHAR2 (80) null /* ��� */
/
alter  table MTZ.PARAMETERS add 
Caption
 VARCHAR2 (80) null /* ��������� */
/
alter  table MTZ.PARAMETERS add 
TypeOfParm CHAR(38) null /* ��� ������ */
/
alter  table MTZ.PARAMETERS add 
DataSize
 NUMBER null /* ������ */
/
alter  table MTZ.PARAMETERS add 
AllowNull
 NUMBER null 
 check (AllowNull in ( -1/* �� */
, 0/* ��� */ )) /* ����� �� �������� */
/
alter  table MTZ.PARAMETERS add 
OutParam
 NUMBER null 
 check (OutParam in ( -1/* �� */
, 0/* ��� */ )) /* ���������� �������� */
/
alter  table MTZ.PARAMETERS add 
ReferenceType
 NUMBER null 
 check (ReferenceType in ( 2/* �� ������ ������� */
, 3/* �� �������� ������ */
, 0/* ��������� ���� ( �� ������) */
, 1/* �� ������  */ )) /* ��� ������ */
/
alter  table MTZ.PARAMETERS add 
RefToType CHAR(38) null /* ������ �� ��� */
/
alter  table MTZ.PARAMETERS add 
RefToPart CHAR(38) null /* ������ �� ������ */
/


/*��� �������*/
drop table MTZ.OBJECTTYPE/*��� ������� (��������)*/ 
/
create table MTZ.OBJECTTYPE/*��� ������� (��������)*/ (
InstanceID CHAR(38) ,
OBJECTTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.OBJECTTYPE add 
Package CHAR(38) null /* ���������� */
/
alter  table MTZ.OBJECTTYPE add 
the_Comment
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.OBJECTTYPE add 
Name
 VARCHAR2 (14) null /* ��� */
/
alter  table MTZ.OBJECTTYPE add 
IsSingleInstance
 NUMBER null 
 check (IsSingleInstance in ( -1/* �� */
, 0/* ��� */ )) /* ����������� ������ ���� ������ */
/
alter  table MTZ.OBJECTTYPE add 
ChooseView CHAR(38) null /* ������������� ��� ������ */
/
alter  table MTZ.OBJECTTYPE add 
OnRun CHAR(38) null /* ��� ������� */
/
alter  table MTZ.OBJECTTYPE add 
OnCreate CHAR(38) null /* ��� �������� */
/
alter  table MTZ.OBJECTTYPE add 
OnDelete CHAR(38) null /* ��� �������� */
/
alter  table MTZ.OBJECTTYPE add 
AllowRefToObject
 NUMBER null 
 check (AllowRefToObject in ( -1/* �� */
, 0/* ��� */ )) /* ���������� ��� ������ ������ */
/
alter  table MTZ.OBJECTTYPE add 
AllowSearch
 NUMBER null 
 check (AllowSearch in ( -1/* �� */
, 0/* ��� */ )) /* ���������� ��� ������ */
/
alter  table MTZ.OBJECTTYPE add 
ReplicaType
 NUMBER null 
 check (ReplicaType in ( 0/* ���� �������� */
, 2/* ��������� */
, 1/* ��������� */ )) /* ��� ���������� */
/
alter  table MTZ.OBJECTTYPE add 
TheComment VARCHAR2(4000) null /* �������� */
/


/*������*/
drop table MTZ.PART/*������ �������*/ 
/
create table MTZ.PART/*������ �������*/ (
ParentStructRowID CHAR(38) not null,
PARTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
/
alter  table MTZ.PART add 
Sequence
 NUMBER null /* � �/� */
/
alter  table MTZ.PART add 
PartType
 NUMBER null 
 check (PartType in ( 3/* ���������� */
, 1/* ��������� */
, 0/* ������ */
, 2/* ������ */
, 4/* ���������� � ������� */ )) /* ��� ��������  */
/
alter  table MTZ.PART add 
Caption
 VARCHAR2 (255) null /* ��������� */
/
alter  table MTZ.PART add 
Name
 VARCHAR2 (20) null /* �������� */
/
alter  table MTZ.PART add 
the_Comment VARCHAR2(4000) null /* �������� */
/
alter  table MTZ.PART add 
NoLog
 NUMBER null 
 check (NoLog in ( -1/* �� */
, 0/* ��� */ )) /* �� ���������� � ������ */
/
alter  table MTZ.PART add 
ManualRegister
 NUMBER null 
 check (ManualRegister in ( -1/* �� */
, 0/* ��� */ )) /* ��������� �� �������������� */
/
alter  table MTZ.PART add 
OnCreate CHAR(38) null /* ��� �������� */
/
alter  table MTZ.PART add 
OnSave CHAR(38) null /* ��� ���������� */
/
alter  table MTZ.PART add 
OnRun CHAR(38) null /* ��� �������� */
/
alter  table MTZ.PART add 
OnDelete CHAR(38) null /* ��� �������� */
/
alter  table MTZ.PART add 
AddBehaivor
 NUMBER null 
 check (AddBehaivor in ( 0/* AddForm */
, 2/* RunAction */
, 1/* RefreshOnly */ )) /* ��������� ��� ���������� */
/
alter  table MTZ.PART add 
ExtenderObject CHAR(38) null /* ������ ���������� */
/
alter  table MTZ.PART add 
shablonBrief
 VARCHAR2 (100) null /* ������ ��� �������� ����������� */
/
alter  table MTZ.PART add 
ruleBrief
 VARCHAR (500) null /* ������� ����������� BRIEF ���� */
/
alter  table MTZ.PART add 
IsJormalChange
 NUMBER null 
 check (IsJormalChange in ( -1/* �� */
, 0/* ��� */ )) /* ����� ������ ��������� */
/


/*������ �������*/
drop table MTZ.PARTMENU/*������ ������ �������*/ 
/
create table MTZ.PARTMENU/*������ ������ �������*/ (
ParentStructRowID CHAR(38) not null,
PARTMENUid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.PARTMENU add 
Name
 VARCHAR2 (64) null /* �������� */
/
alter  table MTZ.PARTMENU add 
Caption
 VARCHAR2 (80) null /* ��������� */
/
alter  table MTZ.PARTMENU add 
ToolTip
 VARCHAR2 (80) null /* ��������� */
/
alter  table MTZ.PARTMENU add 
the_Action CHAR(38) null /* ����� */
/
alter  table MTZ.PARTMENU add 
IsMenuItem
 NUMBER null 
 check (IsMenuItem in ( -1/* �� */
, 0/* ��� */ )) /* �������� � ���� */
/
alter  table MTZ.PARTMENU add 
IsToolBarButton
 NUMBER null 
 check (IsToolBarButton in ( -1/* �� */
, 0/* ��� */ )) /* � ������ */
/
alter  table MTZ.PARTMENU add 
HotKey
 VARCHAR2 (20) null /* ������� ������� */
/


/*����������� ����������*/
drop table MTZ.PARTPARAMMAP/*����������� �������� ����� ������� �� ��������� ������*/ 
/
create table MTZ.PARTPARAMMAP/*����������� �������� ����� ������� �� ��������� ������*/ (
ParentStructRowID CHAR(38) not null,
PARTPARAMMAPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.PARTPARAMMAP add 
FieldName
 VARCHAR2 (255) null /* ���� (��������) */
/
alter  table MTZ.PARTPARAMMAP add 
ParamName
 VARCHAR2 (80) null /* �������� */
/
alter  table MTZ.PARTPARAMMAP add 
NoEdit
 NUMBER null 
 check (NoEdit in ( -1/* �� */
, 0/* ��� */ )) /* ������������� �������� ������ */
/


/*����*/
drop table MTZ.FIELD/*����*/ 
/
create table MTZ.FIELD/*����*/ (
ParentStructRowID CHAR(38) not null,
FIELDid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.FIELD add 
Sequence
 NUMBER null /* � �/� */
/
alter  table MTZ.FIELD add 
Caption
 VARCHAR2 (80) null /* ������� */
/
alter  table MTZ.FIELD add 
Name
 VARCHAR2 (64) null /* ��� ���� */
/
alter  table MTZ.FIELD add 
FieldType CHAR(38) null /* ��� ���� */
/
alter  table MTZ.FIELD add 
IsBrief
 NUMBER null 
 check (IsBrief in ( -1/* �� */
, 0/* ��� */ )) /* ������� ���������� */
/
alter  table MTZ.FIELD add 
AllowNull
 NUMBER null 
 check (AllowNull in ( -1/* �� */
, 0/* ��� */ )) /* ����� ���� ������ */
/
alter  table MTZ.FIELD add 
DataSize
 NUMBER null /* ������ ���� */
/
alter  table MTZ.FIELD add 
ReferenceType
 NUMBER null 
 check (ReferenceType in ( 2/* �� ������ ������� */
, 3/* �� �������� ������ */
, 0/* ��������� ���� ( �� ������) */
, 1/* �� ������  */ )) /* ��� ������ */
/
alter  table MTZ.FIELD add 
RefToType CHAR(38) null /* ������ �� ��� */
/
alter  table MTZ.FIELD add 
RefToPart CHAR(38) null /* ������ �� ������ */
/
alter  table MTZ.FIELD add 
TheMask
 VARCHAR2 (255) null /* ����� ����� */
/
alter  table MTZ.FIELD add 
InternalReference
 NUMBER null 
 check (InternalReference in ( -1/* �� */
, 0/* ��� */ )) /* ������ � �������� ������� */
/
alter  table MTZ.FIELD add 
CreateRefOnly
 NUMBER null 
 check (CreateRefOnly in ( -1/* �� */
, 0/* ��� */ )) /* ������ �������� ������� */
/
alter  table MTZ.FIELD add 
IsAutoNumber
 NUMBER null 
 check (IsAutoNumber in ( -1/* �� */
, 0/* ��� */ )) /* ������������� */
/
alter  table MTZ.FIELD add 
TheNumerator CHAR(38) null /* ��������� */
/
alter  table MTZ.FIELD add 
ZoneTemplate
 VARCHAR2 (255) null /* ������ ���� ��������� */
/
alter  table MTZ.FIELD add 
NumberDateField CHAR(38) null /* ���� ��� ������� ���� */
/
alter  table MTZ.FIELD add 
TheComment VARCHAR2(4000) null /* �������� */
/
alter  table MTZ.FIELD add 
shablonBrief
 VARCHAR2 (100) null /* ������ ��� ������� ���������� */
/
alter  table MTZ.FIELD add 
theNameClass
 VARCHAR2 (100) null /* ��� ������ ��� ������� ����� */
/


/*������ ���� �� �����*/
drop table MTZ.FIELDVALIDATOR/*������ ������������ �� ����� ��� ��������� ����*/ 
/
create table MTZ.FIELDVALIDATOR/*������ ������������ �� ����� ��� ��������� ����*/ (
ParentStructRowID CHAR(38) not null,
FIELDVALIDATORid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.FIELDVALIDATOR add 
Target CHAR(38) null /* ��������� */
/
alter  table MTZ.FIELDVALIDATOR add 
Code VARCHAR2(4000) null /* ������ */
/


/*������ ����*/
drop table MTZ.FIELDMENU/*������, ��������������� � �����*/ 
/
create table MTZ.FIELDMENU/*������, ��������������� � �����*/ (
ParentStructRowID CHAR(38) not null,
FIELDMENUid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.FIELDMENU add 
Name
 VARCHAR2 (64) null /* �������� */
/
alter  table MTZ.FIELDMENU add 
Caption
 VARCHAR2 (80) null /* ��������� */
/
alter  table MTZ.FIELDMENU add 
ToolTip
 VARCHAR2 (80) null /* ��������� */
/
alter  table MTZ.FIELDMENU add 
ActionID CHAR(38) null /* ������������� ����������� ������ */
/
alter  table MTZ.FIELDMENU add 
IsMenuItem
 NUMBER null 
 check (IsMenuItem in ( -1/* �� */
, 0/* ��� */ )) /* � ���� */
/
alter  table MTZ.FIELDMENU add 
IsToolBarButton
 NUMBER null 
 check (IsToolBarButton in ( -1/* �� */
, 0/* ��� */ )) /* � ������ */
/
alter  table MTZ.FIELDMENU add 
HotKey
 VARCHAR2 (20) null /* ������� ������� */
/


/*����������� ����������*/
drop table MTZ.FIELDPARAMMAP/*����������� �������� �� ��������� ������*/ 
/
create table MTZ.FIELDPARAMMAP/*����������� �������� �� ��������� ������*/ (
ParentStructRowID CHAR(38) not null,
FIELDPARAMMAPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.FIELDPARAMMAP add 
FieldName
 VARCHAR2 (255) null /* ���� (��������) */
/
alter  table MTZ.FIELDPARAMMAP add 
ParamName
 VARCHAR2 (80) null /* �������� */
/
alter  table MTZ.FIELDPARAMMAP add 
NoEdit
 NUMBER null 
 check (NoEdit in ( -1/* �� */
, 0/* ��� */ )) /* ������������� �������� ������ */
/


/*���������� ����������*/
drop table MTZ.FldExtenders/**/ 
/
create table MTZ.FldExtenders/**/ (
ParentStructRowID CHAR(38) not null,
FldExtendersid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.FldExtenders add 
TheName
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.FldExtenders add 
TargetPlatform CHAR(38) null /* ������� ��������� */
/
alter  table MTZ.FldExtenders add 
TheObject
 VARCHAR2 (255) null /* ������ */
/
alter  table MTZ.FldExtenders add 
TheConfig
 VARCHAR2 (512) null /* ������ */
/


/*�������� �� ���������*/
drop table MTZ.FIELDEXPRESSION/*��������� ��� ���������� ����
��� �������� �� ���������*/ 
/
create table MTZ.FIELDEXPRESSION/*��������� ��� ���������� ����
��� �������� �� ���������*/ (
ParentStructRowID CHAR(38) not null,
FIELDEXPRESSIONid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.FIELDEXPRESSION add 
Target CHAR(38) null /* ��������� */
/
alter  table MTZ.FIELDEXPRESSION add 
Code VARCHAR2(4000) null /* ������ */
/


/*������������ ������*/
drop table MTZ.DINAMICFILTERSCRIPT/*��������� ��� ���������� ��������������� ������� ��� ��������� �����*/ 
/
create table MTZ.DINAMICFILTERSCRIPT/*��������� ��� ���������� ��������������� ������� ��� ��������� �����*/ (
ParentStructRowID CHAR(38) not null,
DINAMICFILTERSCRIPTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.DINAMICFILTERSCRIPT add 
Target CHAR(38) null /* ������� ��������� */
/
alter  table MTZ.DINAMICFILTERSCRIPT add 
Code VARCHAR2(4000) null /* ������ */
/


/*�������� ��������� ������*/
drop table MTZ.FIELDSRCDEF/*�������� ��������� ������ ��� ����� ���� ReferenceSQL */ 
/
create table MTZ.FIELDSRCDEF/*�������� ��������� ������ ��� ����� ���� ReferenceSQL */ (
ParentStructRowID CHAR(38) not null,
FIELDSRCDEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.FIELDSRCDEF add 
Provider
 VARCHAR2 (128) null /* ��������� */
/
alter  table MTZ.FIELDSRCDEF add 
ConnectionString
 VARCHAR2 (512) null /* ������ ���������� � ���������� */
/
alter  table MTZ.FIELDSRCDEF add 
DataSource
 VARCHAR2 (512) null /* �������� ������ */
/
alter  table MTZ.FIELDSRCDEF add 
IDField
 VARCHAR2 (128) null /* ID */
/
alter  table MTZ.FIELDSRCDEF add 
BriefString
 VARCHAR2 (512) null /* �������� ������� ���������� */
/
alter  table MTZ.FIELDSRCDEF add 
FilterString
 VARCHAR2 (512) null /* ������ ��������� ������ */
/
alter  table MTZ.FIELDSRCDEF add 
SortField
 VARCHAR2 (512) null /* ���������� ��������� ������ */
/
alter  table MTZ.FIELDSRCDEF add 
DescriptionString VARCHAR2(4000) null /* ���������� */
/
alter  table MTZ.FIELDSRCDEF add 
DontShowDialog
 NUMBER null 
 check (DontShowDialog in ( 1/* �� */
, 0/* ��� */ )) /* �� ���������� ����� ������ */
/


/*�������������*/
drop table MTZ.PARTVIEW/*������� �������������, ������� ����� �������������� ��� �������� �������*/ 
/
create table MTZ.PARTVIEW/*������� �������������, ������� ����� �������������� ��� �������� �������*/ (
ParentStructRowID CHAR(38) not null,
PARTVIEWid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.PARTVIEW add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.PARTVIEW add 
the_Alias
 VARCHAR2 (64) null /* ��������� */
/
alter  table MTZ.PARTVIEW add 
ForChoose
 NUMBER null 
 check (ForChoose in ( -1/* �� */
, 0/* ��� */ )) /* ��� ������ */
/
alter  table MTZ.PARTVIEW add 
FilterField0
 VARCHAR2 (255) null /* ���� - ������ 0 */
/
alter  table MTZ.PARTVIEW add 
FilterField1
 VARCHAR2 (255) null /* ���� - ������ 1 */
/
alter  table MTZ.PARTVIEW add 
FilterField2
 VARCHAR2 (255) null /* ���� - ������ 2 */
/
alter  table MTZ.PARTVIEW add 
FilterField3
 VARCHAR2 (255) null /* ���� - ������ 3 */
/


/*�������*/
drop table MTZ.ViewColumn/*������� �������������*/ 
/
create table MTZ.ViewColumn/*������� �������������*/ (
ParentStructRowID CHAR(38) not null,
ViewColumnid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ViewColumn add 
sequence
 NUMBER null /* �  */
/
alter  table MTZ.ViewColumn add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.ViewColumn add 
the_Alias
 VARCHAR2 (64) null /* �������� */
/
alter  table MTZ.ViewColumn add 
FromPart CHAR(38) null /* ������ */
/
alter  table MTZ.ViewColumn add 
Field CHAR(38) null /* ���� */
/
alter  table MTZ.ViewColumn add 
Aggregation
 NUMBER null 
 check (Aggregation in ( 5/* MAX */
, 1/* AVG */
, 3/* SUM */
, 2/* COUNT */
, 4/* MIN */
, 6/* CUSTOM */
, 0/* none */ )) /* ��������� */
/
alter  table MTZ.ViewColumn add 
Expression VARCHAR2(4000) null /* ������� */
/
alter  table MTZ.ViewColumn add 
ForCombo
 NUMBER null 
 check (ForCombo in ( -1/* �� */
, 0/* ��� */ )) /* ��� ����� */
/


/*��������� �������������*/
drop table MTZ.PARTVIEW_LNK/**/ 
/
create table MTZ.PARTVIEW_LNK/**/ (
ParentStructRowID CHAR(38) not null,
PARTVIEW_LNKid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.PARTVIEW_LNK add 
TheView CHAR(38) null /* ������������� */
/
alter  table MTZ.PARTVIEW_LNK add 
TheJoinSource CHAR(38) null /* �����: ���� ��� join �������� */
/
alter  table MTZ.PARTVIEW_LNK add 
RefType
 NUMBER null 
 check (RefType in ( 2/* ������ �� ������ */
, 1/* ������ �� ������ */
, 3/* ������ InstanceID (� �������� �������) */
, 4/* ������ ParentStructRowID  (� �������� �������) */
, 0/* ��� */ )) /* ��������� ��� */
/
alter  table MTZ.PARTVIEW_LNK add 
TheJoinDestination CHAR(38) null /* �����: ���� ��� join �������� */
/
alter  table MTZ.PARTVIEW_LNK add 
HandJoin
 VARCHAR2 (255) null /* ������ join */
/
alter  table MTZ.PARTVIEW_LNK add 
SEQ
 NUMBER null /* ������� */
/


/*���������� ����������*/
drop table MTZ.ExtenderInterface/**/ 
/
create table MTZ.ExtenderInterface/**/ (
ParentStructRowID CHAR(38) not null,
ExtenderInterfaceid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ExtenderInterface add 
TheName
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.ExtenderInterface add 
TargetPlatform CHAR(38) null /* ������� ��������� */
/
alter  table MTZ.ExtenderInterface add 
TheObject
 VARCHAR2 (255) null /* ������ */
/
alter  table MTZ.ExtenderInterface add 
TheConfig
 VARCHAR2 (512) null /* ������ */
/


/*������ �� �����*/
drop table MTZ.VALIDATOR/*�������� � ��������� ��������������*/ 
/
create table MTZ.VALIDATOR/*�������� � ��������� ��������������*/ (
ParentStructRowID CHAR(38) not null,
VALIDATORid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.VALIDATOR add 
Target CHAR(38) null /* ������� ��������� */
/
alter  table MTZ.VALIDATOR add 
Code VARCHAR2(4000) null /* ������ */
/


/*����������� ������������*/
drop table MTZ.UNIQUECONSTRAINT/*����������� ������������*/ 
/
create table MTZ.UNIQUECONSTRAINT/*����������� ������������*/ (
ParentStructRowID CHAR(38) not null,
UNIQUECONSTRAINTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.UNIQUECONSTRAINT add 
Name
 VARCHAR2 (80) null /* �������� */
/
alter  table MTZ.UNIQUECONSTRAINT add 
PerParent
 NUMBER null 
 check (PerParent in ( -1/* �� */
, 0/* ��� */ )) /* �� �������� */
/
alter  table MTZ.UNIQUECONSTRAINT add 
TheComment VARCHAR2(4000) null /* �������� */
/


/*���� �����������*/
drop table MTZ.CONSTRAINTFIELD/*���� �����������*/ 
/
create table MTZ.CONSTRAINTFIELD/*���� �����������*/ (
ParentStructRowID CHAR(38) not null,
CONSTRAINTFIELDid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.CONSTRAINTFIELD add 
TheField CHAR(38) null /* ���� */
/


/*�������� ������������*/
drop table MTZ.INSTANCEVALIDATOR/*�������� ������������ ��� ������� � �����*/ 
/
create table MTZ.INSTANCEVALIDATOR/*�������� ������������ ��� ������� � �����*/ (
ParentStructRowID CHAR(38) not null,
INSTANCEVALIDATORid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.INSTANCEVALIDATOR add 
Target CHAR(38) null /* ��������� */
/
alter  table MTZ.INSTANCEVALIDATOR add 
Code VARCHAR2(4000) null /* ������ */
/


/*���������*/
drop table MTZ.OBJSTATUS/*��������� ���������� ��������� ���������*/ 
/
create table MTZ.OBJSTATUS/*��������� ���������� ��������� ���������*/ (
ParentStructRowID CHAR(38) not null,
OBJSTATUSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.OBJSTATUS add 
name
 VARCHAR2 (80) null /* �������� */
/
alter  table MTZ.OBJSTATUS add 
isStartup
 NUMBER null 
 check (isStartup in ( -1/* �� */
, 0/* ��� */ )) /* ��������� */
/
alter  table MTZ.OBJSTATUS add 
IsArchive
 NUMBER null 
 check (IsArchive in ( -1/* �� */
, 0/* ��� */ )) /* �������� */
/
alter  table MTZ.OBJSTATUS add 
the_comment VARCHAR2(4000) null /* �������� */
/


/*����������� ��������*/
drop table MTZ.NEXTSTATE/*������� ��������� */ 
/
create table MTZ.NEXTSTATE/*������� ��������� */ (
ParentStructRowID CHAR(38) not null,
NEXTSTATEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.NEXTSTATE add 
TheState CHAR(38) null /* ����������� ��������� */
/


/*����� ������*/
drop table MTZ.OBJECTMODE/*����� ������*/ 
/
create table MTZ.OBJECTMODE/*����� ������*/ (
ParentStructRowID CHAR(38) not null,
OBJECTMODEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.OBJECTMODE add 
Name
 VARCHAR2 (5) null /* �������� ������ */
/
alter  table MTZ.OBJECTMODE add 
DefaultMode
 NUMBER null 
 check (DefaultMode in ( -1/* �� */
, 0/* ��� */ )) /* ���� ����� �������� �������� ������� ������ ������� */
/
alter  table MTZ.OBJECTMODE add 
TheComment VARCHAR2(4000) null /* �������� */
/


/*����������� ��������*/
drop table MTZ.STRUCTRESTRICTION/*���������� �� ������ � ������� ���������*/ 
/
create table MTZ.STRUCTRESTRICTION/*���������� �� ������ � ������� ���������*/ (
ParentStructRowID CHAR(38) not null,
STRUCTRESTRICTIONid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.STRUCTRESTRICTION add 
Struct CHAR(38) null /* ���������, ������ � ������� ��������� */
/
alter  table MTZ.STRUCTRESTRICTION add 
AllowRead
 NUMBER null 
 check (AllowRead in ( -1/* �� */
, 0/* ��� */ )) /* �������� �������� */
/
alter  table MTZ.STRUCTRESTRICTION add 
AllowAdd
 NUMBER null 
 check (AllowAdd in ( -1/* �� */
, 0/* ��� */ )) /* ��������� ��������� */
/
alter  table MTZ.STRUCTRESTRICTION add 
AllowEdit
 NUMBER null 
 check (AllowEdit in ( -1/* �� */
, 0/* ��� */ )) /* ��������� �������� */
/
alter  table MTZ.STRUCTRESTRICTION add 
AllowDelete
 NUMBER null 
 check (AllowDelete in ( -1/* �� */
, 0/* ��� */ )) /* ��������� ������� */
/


/*����������� �����*/
drop table MTZ.FIELDRESTRICTION/*����������� �� ������ � ����� �������*/ 
/
create table MTZ.FIELDRESTRICTION/*����������� �� ������ � ����� �������*/ (
ParentStructRowID CHAR(38) not null,
FIELDRESTRICTIONid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.FIELDRESTRICTION add 
ThePart CHAR(38) null /* ���������, ������� ����������� ���� */
/
alter  table MTZ.FIELDRESTRICTION add 
TheField CHAR(38) null /* ����, �� ������� ������������� ����������� */
/
alter  table MTZ.FIELDRESTRICTION add 
AllowRead
 NUMBER null 
 check (AllowRead in ( -1/* �� */
, 0/* ��� */ )) /* �������� �������� */
/
alter  table MTZ.FIELDRESTRICTION add 
AllowModify
 NUMBER null 
 check (AllowModify in ( -1/* �� */
, 0/* ��� */ )) /* ��������� ����������� */
/


/*����������� �������*/
drop table MTZ.METHODRESTRICTION/*����������� �� ������������� ������� �������*/ 
/
create table MTZ.METHODRESTRICTION/*����������� �� ������������� ������� �������*/ (
ParentStructRowID CHAR(38) not null,
METHODRESTRICTIONid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.METHODRESTRICTION add 
Part CHAR(38) null /* ���������, ������� ����������� ����� */
/
alter  table MTZ.METHODRESTRICTION add 
Method CHAR(38) null /* ����� */
/
alter  table MTZ.METHODRESTRICTION add 
IsRestricted
 NUMBER null 
 check (IsRestricted in ( -1/* �� */
, 0/* ��� */ )) /* ��������� ������������ */
/


/*������ ����*/
drop table MTZ.TYPEMENU/*������ ������ ����*/ 
/
create table MTZ.TYPEMENU/*������ ������ ����*/ (
ParentStructRowID CHAR(38) not null,
TYPEMENUid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.TYPEMENU add 
Name
 VARCHAR2 (64) null /* �������� */
/
alter  table MTZ.TYPEMENU add 
Caption
 VARCHAR2 (80) null /* ��������� */
/
alter  table MTZ.TYPEMENU add 
ToolTip
 VARCHAR2 (80) null /* ��������� */
/
alter  table MTZ.TYPEMENU add 
the_Action CHAR(38) null /* ����� */
/
alter  table MTZ.TYPEMENU add 
IsMenuItem
 NUMBER null 
 check (IsMenuItem in ( -1/* �� */
, 0/* ��� */ )) /* �������� � ���� */
/
alter  table MTZ.TYPEMENU add 
IsToolBarButton
 NUMBER null 
 check (IsToolBarButton in ( -1/* �� */
, 0/* ��� */ )) /* �������� � ������ */
/
alter  table MTZ.TYPEMENU add 
HotKey
 VARCHAR2 (20) null /* ������� ������� */
/


/*����������*/
drop table MTZ.MTZAPP/*������ ������������� ����������*/ 
/
create table MTZ.MTZAPP/*������ ������������� ����������*/ (
InstanceID CHAR(38) ,
MTZAPPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.MTZAPP add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.MTZAPP add 
DBName
 VARCHAR2 (64) null /* ���� ������ */
/
alter  table MTZ.MTZAPP add 
TheComment VARCHAR2(4000) null /* �������� */
/


/*������������ ����������*/
drop table MTZ.ParentPackage/*���������� �� ������� ������� ������ ����������*/ 
/
create table MTZ.ParentPackage/*���������� �� ������� ������� ������ ����������*/ (
ParentStructRowID CHAR(38) not null,
ParentPackageid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ParentPackage add 
Package CHAR(38) null /* ���������� */
/


/*����� ���������*/
drop table MTZ.GENPACKAGE/*����� ���������*/ 
/
create table MTZ.GENPACKAGE/*����� ���������*/ (
InstanceID CHAR(38) ,
GENPACKAGEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.GENPACKAGE add 
Name
 VARCHAR2 (255) null /* �������� */
/


/*����������*/
drop table MTZ.GENERATOR_TARGET/*����������*/ 
/
create table MTZ.GENERATOR_TARGET/*����������*/ (
ParentStructRowID CHAR(38) not null,
GENERATOR_TARGETid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.GENERATOR_TARGET add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.GENERATOR_TARGET add 
TargetType
 NUMBER null 
 check (TargetType in ( 0/* ���� */
, 4/* ��� */
, 3/* ������������ */
, 1/* ������ */
, 2/* ���������� */ )) /* ��� ��������� */
/
alter  table MTZ.GENERATOR_TARGET add 
QueueName
 VARCHAR2 (255) null /* ������� */
/
alter  table MTZ.GENERATOR_TARGET add 
GeneratorProgID
 VARCHAR2 (255) null /* COM ����� */
/
alter  table MTZ.GENERATOR_TARGET add 
GeneratorStyle
 NUMBER null 
 check (GeneratorStyle in ( 0/* ���� ��� */
, 1/* ��� ���� ����� */ )) /* ������� */
/
alter  table MTZ.GENERATOR_TARGET add 
TheDevelopmentEnv
 NUMBER null 
 check (TheDevelopmentEnv in ( 2/* JAVA */
, 3/* OTHER */
, 1/* DOTNET */
, 0/* VB6 */ )) /* ����� ���������� */
/


/*������ ���*/
drop table MTZ.GENMANUALCODE/*���, ������� �� ������������ � �������� ������*/ 
/
create table MTZ.GENMANUALCODE/*���, ������� �� ������������ � �������� ������*/ (
ParentStructRowID CHAR(38) not null,
GENMANUALCODEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.GENMANUALCODE add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.GENMANUALCODE add 
the_Alias
 VARCHAR2 (80) null /* ��������� */
/
alter  table MTZ.GENMANUALCODE add 
Code VARCHAR2(4000) null /* ��� */
/


/*����������� ��������*/
drop table MTZ.GENCONTROLS/*����������� ��������, ������� ������������ ��� ���������*/ 
/
create table MTZ.GENCONTROLS/*����������� ��������, ������� ������������ ��� ���������*/ (
ParentStructRowID CHAR(38) not null,
GENCONTROLSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.GENCONTROLS add 
ControlProgID
 VARCHAR2 (255) null /* ProgID ������������ �������� */
/
alter  table MTZ.GENCONTROLS add 
ControlClassID
 VARCHAR2 (40) null /* ����� �������������������� */
/
alter  table MTZ.GENCONTROLS add 
VersionMajor
 NUMBER null /* ������ */
/
alter  table MTZ.GENCONTROLS add 
VersionMinor
 NUMBER null /* ��������� */
/


/*����������*/
drop table MTZ.GENREFERENCE/*����������, ������� ������������ ��� ���������*/ 
/
create table MTZ.GENREFERENCE/*����������, ������� ������������ ��� ���������*/ (
ParentStructRowID CHAR(38) not null,
GENREFERENCEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.GENREFERENCE add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.GENREFERENCE add 
RefClassID
 VARCHAR2 (40) null /* ����� ������ */
/
alter  table MTZ.GENREFERENCE add 
VersionMajor
 NUMBER null /* ����� ������ */
/
alter  table MTZ.GENREFERENCE add 
VersionMinor
 NUMBER null /* ��������� */
/


/*�����������*/
drop table MTZ.LocalizeInfo/**/ 
/
create table MTZ.LocalizeInfo/**/ (
InstanceID CHAR(38) ,
LocalizeInfoid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.LocalizeInfo add 
LangFull
 VARCHAR2 (255) null /* ���� - �������� */
/
alter  table MTZ.LocalizeInfo add 
LangShort
 VARCHAR2 (255) null /* ��� ����� */
/


/*Y-Cost*/
drop table MTZ.ITTNO_YC/*Y-Cost*/ 
/
create table MTZ.ITTNO_YC/*Y-Cost*/ (
InstanceID CHAR(38) ,
ITTNO_YCid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTNO_YC add 
YNum
 NUMBER null /* ����� ���� �� ��� Y */
/
alter  table MTZ.ITTNO_YC add 
TheTime
 NUMBER null /* ����� */
/


/*����� ���������*/
drop table MTZ.ITTNO_CMN/**/ 
/
create table MTZ.ITTNO_CMN/**/ (
InstanceID CHAR(38) ,
ITTNO_CMNid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTNO_CMN add 
IN_TIME
 NUMBER null /* ����� �� ����� � ������ */
/
alter  table MTZ.ITTNO_CMN add 
Out_Time
 NUMBER null /* ����� �� ����� �� ������ */
/


/*Z-Cost*/
drop table MTZ.ITTNO_ZC/*Z-Cost*/ 
/
create table MTZ.ITTNO_ZC/*Z-Cost*/ (
InstanceID CHAR(38) ,
ITTNO_ZCid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTNO_ZC add 
ZNum
 NUMBER null /* ����� ����� */
/
alter  table MTZ.ITTNO_ZC add 
TheTime
 NUMBER null /* ����� */
/


/*��������*/
drop table MTZ.InfoStoreDef/*�������� ��������*/ 
/
create table MTZ.InfoStoreDef/*�������� ��������*/ (
InstanceID CHAR(38) ,
InfoStoreDefid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.InfoStoreDef add 
TheGroup CHAR(38) null /* ������ */
/
alter  table MTZ.InfoStoreDef add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.InfoStoreDef add 
InfoStoreType
 NUMBER null 
 check (InfoStoreType in ( 2/* ��������� */
, 1/* ������������ */
, 0/*  ����� */ )) /* ��� �������� */
/
alter  table MTZ.InfoStoreDef add 
TheUser CHAR(38) null /* ������������ */
/


/*�����*/
drop table MTZ.Folder/*����� ��������*/ 
/
create table MTZ.Folder/*����� ��������*/ (
InstanceID CHAR(38) ,
Folderid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
/
alter  table MTZ.Folder add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.Folder add 
FolderType
 NUMBER null 
 check (FolderType in ( 2/* ��������� */
, 10/* ����������� */
, 0/* cls__ */
, 5/* ��������� */
, 1/* �������� */
, 9/* ���������� */
, 4/* ������ */
, 8/* � ������ */
, 7/* ��������� */
, 6/* ������������ */
, 3/* ��������� */ )) /* ��� ����� */
/


/*���������*/
drop table MTZ.Shortcut/*������ ����������*/ 
/
create table MTZ.Shortcut/*������ ����������*/ (
ParentStructRowID CHAR(38) not null,
Shortcutid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.Shortcut add 
DocItem CHAR(38) null /* �������� */
/
alter  table MTZ.Shortcut add 
StartMode
 VARCHAR2 (255) null /* ����� */
/


/*��������*/
drop table MTZ.Reports/*��������*/ 
/
create table MTZ.Reports/*��������*/ (
InstanceID CHAR(38) ,
Reportsid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.Reports add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.Reports add 
ReportFile VARCHAR2(4000) null /* ���� ������ */
/
alter  table MTZ.Reports add 
 ReportFile_EXT varchar2(4) null
/
alter  table MTZ.Reports add 
Caption
 VARCHAR2 (255) null /* ��������� */
/
alter  table MTZ.Reports add 
PrepareMethod CHAR(38) null /* ����� ��� ������������ */
/
alter  table MTZ.Reports add 
ReportType
 NUMBER null 
 check (ReportType in ( 1/* ��������� ������� */
, 0/* ������� */
, 3/* ������� �� WORD ������� */
, 2/* ������ ������ */
, 4/* ������� �� Excel ������� */ )) /* ��� ������ */
/
alter  table MTZ.Reports add 
TheReportExt CHAR(38) null /* ���������� ��� �������� ������ */
/
alter  table MTZ.Reports add 
ReportView
 VARCHAR2 (255) null /* ������� ������ */
/
alter  table MTZ.Reports add 
TheComment VARCHAR2(4000) null /* �������� */
/


/*������*/
drop table MTZ.RPTStruct/*������*/ 
/
create table MTZ.RPTStruct/*������*/ (
InstanceID CHAR(38) ,
RPTStructid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
/
alter  table MTZ.RPTStruct add 
Name
 VARCHAR2 (64) null /* �������� */
/
alter  table MTZ.RPTStruct add 
Caption
 VARCHAR2 (255) null /* ��������� */
/


/*���� ������*/
drop table MTZ.RPTFields/*���� ������*/ 
/
create table MTZ.RPTFields/*���� ������*/ (
ParentStructRowID CHAR(38) not null,
RPTFieldsid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.RPTFields add 
Name
 VARCHAR2 (64) null /* �������� */
/
alter  table MTZ.RPTFields add 
FieldType CHAR(38) null /* ��� ���� */
/
alter  table MTZ.RPTFields add 
FieldSize
 NUMBER null /* ������ */
/
alter  table MTZ.RPTFields add 
Caption
 VARCHAR2 (255) null /* ��������� */
/


/*�������*/
drop table MTZ.RPTFormula/*�������*/ 
/
create table MTZ.RPTFormula/*�������*/ (
InstanceID CHAR(38) ,
RPTFormulaid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.RPTFormula add 
Name
 VARCHAR2 (64) null /* �������� */
/
alter  table MTZ.RPTFormula add 
Code VARCHAR2(4000) null /* ��������� */
/
alter  table MTZ.RPTFormula add 
Platform CHAR(38) null /* ��������� */
/


/*��������*/
drop table MTZ.ITTPR_DEF/**/ 
/
create table MTZ.ITTPR_DEF/**/ (
InstanceID CHAR(38) ,
ITTPR_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTPR_DEF add 
Poddon
 VARCHAR2 (20) null /* ������ */
/
alter  table MTZ.ITTPR_DEF add 
InWeight
 NUMBER null /* ��� ��� ������� */
/
alter  table MTZ.ITTPR_DEF add 
OutWeight
 NUMBER null /* ��� �������� */
/
alter  table MTZ.ITTPR_DEF add 
Moroz
 NUMBER null /* ��������� ��������� */
/
alter  table MTZ.ITTPR_DEF add 
Vesi
 NUMBER null /* ����������� ����� */
/
alter  table MTZ.ITTPR_DEF add 
Good
 VARCHAR2 (20) null /* ����� */
/
alter  table MTZ.ITTPR_DEF add 
the_Description
 VARCHAR2 (255) null /* �������� ������ */
/
alter  table MTZ.ITTPR_DEF add 
Country
 VARCHAR2 (255) null /* ������ */
/
alter  table MTZ.ITTPR_DEF add 
Factory
 VARCHAR2 (255) null /* ����� */
/
alter  table MTZ.ITTPR_DEF add 
KillPlace
 VARCHAR2 (255) null /* ����� */
/
alter  table MTZ.ITTPR_DEF add 
Brak
 VARCHAR2 (30) null /* ���� */
/
alter  table MTZ.ITTPR_DEF add 
Client
 VARCHAR2 (255) null /* ������������� */
/
alter  table MTZ.ITTPR_DEF add 
TheDate
 DATE null /* ���� ��������� */
/
alter  table MTZ.ITTPR_DEF add 
WeightDelta
 NUMBER null /* ����������� �� ���� */
/
alter  table MTZ.ITTPR_DEF add 
InBoxes
 NUMBER null /* ������� ������� */
/
alter  table MTZ.ITTPR_DEF add 
OutBoxes
 NUMBER null /* ��������� ������� */
/


/*��������*/
drop table MTZ.MTZExt_def/*������ ������������������ ����������*/ 
/
create table MTZ.MTZExt_def/*������ ������������������ ����������*/ (
InstanceID CHAR(38) ,
MTZExt_defid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.MTZExt_def add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.MTZExt_def add 
ExtType
 NUMBER null 
 check (ExtType in ( 1/* OnFormExt */
, 7/* CodeGenerator */
, 3/* JrnlAddExt */
, 6/* VerifyRowExt */
, 0/* StatusExt */
, 8/* ARMGenerator */
, 5/* DefaultExt */
, 2/* CustomExt */
, 4/* JrnlRunExt */ )) /* ��� ���������� */
/
alter  table MTZ.MTZExt_def add 
TheDescription VARCHAR2(4000) null /* �������� */
/


/*���������� ����������*/
drop table MTZ.MTZExtRel/*���������� ���������� ��� ������ �������������� �������*/ 
/
create table MTZ.MTZExtRel/*���������� ���������� ��� ������ �������������� �������*/ (
InstanceID CHAR(38) ,
MTZExtRelid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.MTZExtRel add 
ThePlatform
 NUMBER null 
 check (ThePlatform in ( 2/* JAVA */
, 3/* OTHER */
, 1/* DOTNET */
, 0/* VB6 */ )) /* ���������� */
/
alter  table MTZ.MTZExtRel add 
TheClassName
 VARCHAR2 (255) null /* �������� ������ */
/
alter  table MTZ.MTZExtRel add 
TheLibraryName
 VARCHAR2 (255) null /* �������� ���������� */
/


/*����� �����*/
drop table MTZ.ITTCS_LIN/**/ 
/
create table MTZ.ITTCS_LIN/**/ (
InstanceID CHAR(38) ,
ITTCS_LINid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTCS_LIN add 
SRV CHAR(38) null /* ������ */
/
alter  table MTZ.ITTCS_LIN add 
UseSrv
 NUMBER null 
 check (UseSrv in ( -1/* �� */
, 0/* ��� */ )) /* ������������ */
/


/*��������*/
drop table MTZ.ITTCS_DEF/**/ 
/
create table MTZ.ITTCS_DEF/**/ (
InstanceID CHAR(38) ,
ITTCS_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTCS_DEF add 
CLIENTCODE VARCHAR2(4000) null /* ��� ������� */
/


/*������ �������*/
drop table MTZ.SysLog/*������ �������, ������� ��������� � �������*/ 
/
create table MTZ.SysLog/*������ �������, ������� ��������� � �������*/ (
InstanceID CHAR(38) ,
SysLogid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.SysLog add 
TheSession CHAR(38) null /* ������ */
/
alter  table MTZ.SysLog add 
the_Resource
 VARCHAR2 (255) null /* ������ */
/
alter  table MTZ.SysLog add 
LogStructID
 VARCHAR2 (255) null /* ������ � ������� ��������� �������� */
/
alter  table MTZ.SysLog add 
VERB
 VARCHAR2 (80) null /* �������� */
/
alter  table MTZ.SysLog add 
LogInstanceID CHAR(38) null /* ������������� ��������� */
/


/*������ ������������*/
drop table MTZ.the_Session/*������������������ ������ �������������*/ 
/
create table MTZ.the_Session/*������������������ ������ �������������*/ (
InstanceID CHAR(38) ,
the_Sessionid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.the_Session add 
UserRole CHAR(38) null /* ������� ���� ������������ */
/
alter  table MTZ.the_Session add 
ClosedAt
 DATE null /* ������ �������� */
/
alter  table MTZ.the_Session add 
Closed
 NUMBER null 
 check (Closed in ( 1/* �� */
, 0/* ��� */ )) /* ������� */
/
alter  table MTZ.the_Session add 
Usersid CHAR(38) null /* ������������ */
/
alter  table MTZ.the_Session add 
LastAccess
 DATE null /* ��������� ������������� */
/
alter  table MTZ.the_Session add 
StartAt
 DATE null /* ������ �������� */
/
alter  table MTZ.the_Session add 
Lang
 VARCHAR2 (25) null /* ����������� */
/


/*������ ������� �������*/
drop table MTZ.LogReader/*���������, ������� ������������ ���� ��� 
����������� ���� �������.*/ 
/
create table MTZ.LogReader/*���������, ������� ������������ ���� ��� 
����������� ���� �������.*/ (
InstanceID CHAR(38) ,
LogReaderid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.LogReader add 
Name
 VARCHAR2 (80) null /* �������� */
/
alter  table MTZ.LogReader add 
AutoStart
 NUMBER null 
 check (AutoStart in ( 1/* �� */
, 0/* ��� */ )) /* ������������������ ������ */
/
alter  table MTZ.LogReader add 
AutoProgid
 VARCHAR2 (255) null /* ����� ��� ��������������� ������� */
/
alter  table MTZ.LogReader add 
ReadMarker
 DATE null /* ���� ��������� ����������� ������ */
/
alter  table MTZ.LogReader add 
StartInterval
 NUMBER null /* �������� ������� (���) */
/
alter  table MTZ.LogReader add 
LastStart
 DATE null /* ���� ���������� ������� */
/
alter  table MTZ.LogReader add 
LastStop
 DATE null /* ���� �������� �������� */
/


/*��������*/
drop table MTZ.Verb/*���������� �������� �������*/ 
/
create table MTZ.Verb/*���������� �������� �������*/ (
InstanceID CHAR(38) ,
Verbid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.Verb add 
Name
 VARCHAR2 (80) null /* �������� */
/


/*������������*/
drop table MTZ.Users/*������������*/ 
/
create table MTZ.Users/*������������*/ (
InstanceID CHAR(38) ,
Usersid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.Users add 
Family
 VARCHAR2 (255) null /* ������� */
/
alter  table MTZ.Users add 
Name
 VARCHAR2 (64) null /* ��� */
/
alter  table MTZ.Users add 
SurName
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.Users add 
Login
 VARCHAR2 (64) null /* ��� ��� ����� */
/
alter  table MTZ.Users add 
Password VARCHAR2(80) null /* ������ */
/
alter  table MTZ.Users add 
DomaiName
 VARCHAR2 (255) null /* �������� ��� */
/
alter  table MTZ.Users add 
EMail VARCHAR2(255) null /* e-mail */
/
alter  table MTZ.Users add 
Phone
 VARCHAR2 (20) null /* ������� */
/
alter  table MTZ.Users add 
LocalPhone
 VARCHAR2 (20) null /* ������� ������� */
/
alter  table MTZ.Users add 
MobilePhone
 VARCHAR2 (20) null /* ��������� ������� */
/
alter  table MTZ.Users add 
Photo VARCHAR2(4000) null /* ���� */
/
alter  table MTZ.Users add 
BirthDay
 DATE null /* ���� �������� */
/
alter  table MTZ.Users add 
Activity CHAR(38) null /* ������ ���������� */
/
alter  table MTZ.Users add 
CertificateID
 VARCHAR2 (255) null /* CertificateID */
/
alter  table MTZ.Users add 
CertData VARCHAR2(4000) null /* CertData */
/
alter  table MTZ.Users add 
ClientDef CHAR(38) null /* ���������� � �������� */
/
alter  table MTZ.Users add 
PersonaData CHAR(38) null /* PersonaData */
/
alter  table MTZ.Users add 
PositionU
 VARCHAR2 (255) null /* ��������� */
/
alter  table MTZ.Users add 
WorkPlace
 VARCHAR2 (255) null /* ����� ������ */
/


/*������*/
drop table MTZ.Groups/*������*/ 
/
create table MTZ.Groups/*������*/ (
InstanceID CHAR(38) ,
Groupsid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.Groups add 
Name
 VARCHAR2 (80) null /* �������� */
/


/*������ ������*/
drop table MTZ.GroupUser/*������ ������*/ 
/
create table MTZ.GroupUser/*������ ������*/ (
ParentStructRowID CHAR(38) not null,
GroupUserid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.GroupUser add 
TheUser CHAR(38) null /* ������������ */
/


/*�������� ����*/
drop table MTZ.MTZSEC_RIGHT/*�������� ���� ��� ������ ������*/ 
/
create table MTZ.MTZSEC_RIGHT/*�������� ���� ��� ������ ������*/ (
InstanceID CHAR(38) ,
MTZSEC_RIGHTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.MTZSEC_RIGHT add 
Piority
 NUMBER null /* ��������� */
/
alter  table MTZ.MTZSEC_RIGHT add 
TheGroup CHAR(38) null /* ������ */
/
alter  table MTZ.MTZSEC_RIGHT add 
ProtectedItem
 VARCHAR2 (255) null /* ���������� ������� */
/
alter  table MTZ.MTZSEC_RIGHT add 
Allow
 NUMBER null 
 check (Allow in ( -1/* �� */
, 0/* ��� */ )) /* ���������� */
/


/*������������*/
drop table MTZ.ROLES_USER/*������������*/ 
/
create table MTZ.ROLES_USER/*������������*/ (
InstanceID CHAR(38) ,
ROLES_USERid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ROLES_USER add 
TheUser CHAR(38) null /* ������������ */
/


/*����������� �� ������ ������*/
drop table MTZ.ROLES_MAP/*����������� �� ������ ������*/ 
/
create table MTZ.ROLES_MAP/*����������� �� ������ ������*/ (
InstanceID CHAR(38) ,
ROLES_MAPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ROLES_MAP add 
TheGroup CHAR(38) null /* ������ */
/


/*��������� ���������*/
drop table MTZ.ROLES_DOC/**/ 
/
create table MTZ.ROLES_DOC/**/ (
InstanceID CHAR(38) ,
ROLES_DOCid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ROLES_DOC add 
The_Document CHAR(38) null /* ��� ��������� */
/
alter  table MTZ.ROLES_DOC add 
The_Denied
 NUMBER null 
 check (The_Denied in ( 1/* �� */
, 0/* ��� */ )) /* �������� */
/
alter  table MTZ.ROLES_DOC add 
AllowDeleteDoc
 NUMBER null 
 check (AllowDeleteDoc in ( -1/* �� */
, 0/* ��� */ )) /* ��������� �������� */
/


/*��������� ���������*/
drop table MTZ.ROLES_DOC_STATE/**/ 
/
create table MTZ.ROLES_DOC_STATE/**/ (
ParentStructRowID CHAR(38) not null,
ROLES_DOC_STATEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ROLES_DOC_STATE add 
The_State CHAR(38) null /* ��������� */
/
alter  table MTZ.ROLES_DOC_STATE add 
The_Mode CHAR(38) null /* ����� */
/
alter  table MTZ.ROLES_DOC_STATE add 
AllowDelete
 NUMBER null 
 check (AllowDelete in ( -1/* �� */
, 0/* ��� */ )) /* ����� ������� */
/
alter  table MTZ.ROLES_DOC_STATE add 
StateChangeDisabled
 NUMBER null 
 check (StateChangeDisabled in ( -1/* �� */
, 0/* ��� */ )) /* ��������� ����� ��������� */
/


/*����������� ����*/
drop table MTZ.ROLES_DEF/*����������� ����*/ 
/
create table MTZ.ROLES_DEF/*����������� ����*/ (
InstanceID CHAR(38) ,
ROLES_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ROLES_DEF add 
name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.ROLES_DEF add 
TheComment VARCHAR2(4000) null /* �������� */
/
alter  table MTZ.ROLES_DEF add 
RightsSet_Denied
 NUMBER null 
 check (RightsSet_Denied in ( -1/* �� */
, 0/* ��� */ )) /* ��������� ���� ��������� */
/
alter  table MTZ.ROLES_DEF add 
FormCFG_Denied
 NUMBER null 
 check (FormCFG_Denied in ( -1/* �� */
, 0/* ��� */ )) /* ��������� ���� ��������� */
/
alter  table MTZ.ROLES_DEF add 
ListCFG_Denied
 NUMBER null 
 check (ListCFG_Denied in ( -1/* �� */
, 0/* ��� */ )) /* ��������� �������� ��������� */
/
alter  table MTZ.ROLES_DEF add 
FileExch_Denied
 NUMBER null 
 check (FileExch_Denied in ( -1/* �� */
, 0/* ��� */ )) /* �������� ����� �������� */
/


/*������*/
drop table MTZ.ROLES_REPORTS/**/ 
/
create table MTZ.ROLES_REPORTS/**/ (
InstanceID CHAR(38) ,
ROLES_REPORTSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ROLES_REPORTS add 
The_Report CHAR(38) null /* ����� */
/


/*��������� ����������*/
drop table MTZ.ROLES_WP/*��������� ����������*/ 
/
create table MTZ.ROLES_WP/*��������� ����������*/ (
InstanceID CHAR(38) ,
ROLES_WPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ROLES_WP add 
WP CHAR(38) null /* ���������� */
/


/*���������� ��������*/
drop table MTZ.ROLES_ACT/*���������� ��������*/ 
/
create table MTZ.ROLES_ACT/*���������� ��������*/ (
ParentStructRowID CHAR(38) not null,
ROLES_ACTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
/
alter  table MTZ.ROLES_ACT add 
Accesible
 NUMBER null 
 check (Accesible in ( 1/* �� */
, 0/* ��� */ )) /* ����������� */
/
alter  table MTZ.ROLES_ACT add 
EntryPoints CHAR(38) null /* ��������� �������� */
/


/*������� �������*/
drop table MTZ.JournalColumn/*������� �������*/ 
/
create table MTZ.JournalColumn/*������� �������*/ (
InstanceID CHAR(38) ,
JournalColumnid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.JournalColumn add 
sequence
 NUMBER null /* ������������������ */
/
alter  table MTZ.JournalColumn add 
name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.JournalColumn add 
ColumnAlignment
 NUMBER null 
 check (ColumnAlignment in ( 4/* Center Center */
, 3/* Center Top */
, 6/* Right Top */
, 8/* Right Bottom */
, 2/* Left Bottom */
, 7/* Right Center */
, 5/* Center Bottom */
, 1/* Left Center */
, 0/* Left Top */ )) /* ������������ */
/
alter  table MTZ.JournalColumn add 
ColSort
 NUMBER null 
 check (ColSort in ( 0/* As String */
, 1/* As Numeric */
, 2/* As Date */ )) /* ���������� ������� */
/
alter  table MTZ.JournalColumn add 
GroupAggregation
 NUMBER null 
 check (GroupAggregation in ( 5/* MAX */
, 1/* AVG */
, 3/* SUM */
, 2/* COUNT */
, 4/* MIN */
, 6/* CUSTOM */
, 0/* none */ )) /* ���������� ��� ����������� */
/


/*������ �������*/
drop table MTZ.JColumnSource/*������ �������*/ 
/
create table MTZ.JColumnSource/*������ �������*/ (
ParentStructRowID CHAR(38) not null,
JColumnSourceid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.JColumnSource add 
SrcPartView CHAR(38) null /* ������������� */
/
alter  table MTZ.JColumnSource add 
ViewField
 VARCHAR2 (255) null /* ���� ������������� */
/


/*������*/
drop table MTZ.Journal/*������*/ 
/
create table MTZ.Journal/*������*/ (
InstanceID CHAR(38) ,
Journalid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.Journal add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.Journal add 
the_Alias
 VARCHAR2 (32) null /* ��������� */
/
alter  table MTZ.Journal add 
TheComment VARCHAR2(4000) null /* �������� */
/


/*��������� �������*/
drop table MTZ.JournalSrc/*��������� �������*/ 
/
create table MTZ.JournalSrc/*��������� �������*/ (
InstanceID CHAR(38) ,
JournalSrcid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.JournalSrc add 
PartView CHAR(38) null /* ������������� */
/
alter  table MTZ.JournalSrc add 
OnRun
 NUMBER null 
 check (OnRun in ( 2/* ������� �������� */
, 1/* ������� ������ */
, 0/* ������ �� ������ */ )) /* ��� �������� */
/
alter  table MTZ.JournalSrc add 
OpenMode
 VARCHAR2 (1) null /* ����� �������� */
/
alter  table MTZ.JournalSrc add 
ViewAlias
 VARCHAR2 (255) null /* ��������� ������������� */
/


/*������*/
drop table MTZ.MTZ_Inst_Build/**/ 
/
create table MTZ.MTZ_Inst_Build/**/ (
InstanceID CHAR(38) ,
MTZ_Inst_Buildid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.MTZ_Inst_Build add 
PRODUCT_NAME
 VARCHAR2 (255) null /* PRODUCT_NAME */
/
alter  table MTZ.MTZ_Inst_Build add 
PRODUCT_VERSION
 VARCHAR2 (255) null /* PRODUCT_VERSION */
/
alter  table MTZ.MTZ_Inst_Build add 
PRODUCT_PUBLISHER
 VARCHAR2 (255) null /* PRODUCT_PUBLISHER */
/
alter  table MTZ.MTZ_Inst_Build add 
PRODUCT_WEB_SITE
 VARCHAR2 (255) null /* PRODUCT_WEB_SITE */
/
alter  table MTZ.MTZ_Inst_Build add 
LicensFilePath
 VARCHAR2 (2048) null /* ���� � ������������ ����������� */
/
alter  table MTZ.MTZ_Inst_Build add 
MainFileRef CHAR(38) null /* ������� ���� */
/
alter  table MTZ.MTZ_Inst_Build add 
InstallDir
 VARCHAR2 (1024) null /* InstallDir */
/
alter  table MTZ.MTZ_Inst_Build add 
ShortCutDir
 VARCHAR2 (255) null /* ShortCutDir */
/


/*������*/
drop table MTZ.MTZ_Inst_Build_Sec/**/ 
/
create table MTZ.MTZ_Inst_Build_Sec/**/ (
ParentStructRowID CHAR(38) not null,
MTZ_Inst_Build_Secid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.MTZ_Inst_Build_Sec add 
TheSection CHAR(38) null /* ������ */
/
alter  table MTZ.MTZ_Inst_Build_Sec add 
TheDescription
 VARCHAR2 (255) null /* ����������� */
/
alter  table MTZ.MTZ_Inst_Build_Sec add 
IsRewriteSectionDesc
 NUMBER null 
 check (IsRewriteSectionDesc in ( 1/* �� */
, 0/* ��� */ )) /* �������������� ����������� ������ */
/
alter  table MTZ.MTZ_Inst_Build_Sec add 
SEQ
 NUMBER null /* ������� (�� 1 �� ...) */
/


/*������*/
drop table MTZ.MTZ_Inst_Section/**/ 
/
create table MTZ.MTZ_Inst_Section/**/ (
InstanceID CHAR(38) ,
MTZ_Inst_Sectionid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.MTZ_Inst_Section add 
TheName
 VARCHAR2 (255) null /* �������� (Eng) */
/
alter  table MTZ.MTZ_Inst_Section add 
IsVisible
 NUMBER null 
 check (IsVisible in ( 1/* �� */
, 0/* ��� */ )) /* ������� */
/
alter  table MTZ.MTZ_Inst_Section add 
TheDescription
 VARCHAR2 (2048) null /* ����������� (ToolTip) */
/
alter  table MTZ.MTZ_Inst_Section add 
IsNotDeletable
 NUMBER null 
 check (IsNotDeletable in ( 1/* �� */
, 0/* ��� */ )) /* ������������ */
/
alter  table MTZ.MTZ_Inst_Section add 
TheTargetPlatform
 NUMBER null 
 check (TheTargetPlatform in ( 2/* JAVA */
, 3/* OTHER */
, 1/* DOTNET */
, 0/* VB6 */ )) /* ������� ��������� */
/
alter  table MTZ.MTZ_Inst_Section add 
IsCustomSection
 NUMBER null 
 check (IsCustomSection in ( 1/* �� */
, 0/* ��� */ )) /* Custom Section */
/
alter  table MTZ.MTZ_Inst_Section add 
CustomSectionInstall CHAR(38) null /* Custom Section Install */
/
alter  table MTZ.MTZ_Inst_Section add 
CustomSectionUnInstall CHAR(38) null /* Custom Section UnInstall */
/


/*����� ������*/
drop table MTZ.MTZ_Inst_Sec_Files/**/ 
/
create table MTZ.MTZ_Inst_Sec_Files/**/ (
ParentStructRowID CHAR(38) not null,
MTZ_Inst_Sec_Filesid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
TheSource
 VARCHAR2 (1024) null /* ���� ��� ������� */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
IsCOM
 NUMBER null 
 check (IsCOM in ( 1/* �� */
, 0/* ��� */ )) /* �������� COM �������� */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
HaveToRun
 NUMBER null 
 check (HaveToRun in ( 1/* �� */
, 0/* ��� */ )) /* ����������� ��������� */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
CommanLineParams
 VARCHAR2 (255) null /* ����� ������� */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
SysstemObject CHAR(38) null /* ������ ������� */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
TheApplication CHAR(38) null /* ���������� ������� */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
SubDir
 VARCHAR2 (255) null /* ���������� */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
IsShortcut
 NUMBER null 
 check (IsShortcut in ( 1/* �� */
, 0/* ��� */ )) /* ����� � ���� */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
ShortcutName
 VARCHAR2 (255) null /* ��� ������ */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
ShortCutInfo
 VARCHAR2 (255) null /* ����������� ������ */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
DefaultInterface
 VARCHAR2 (255) null /* ��������� �� ��������� */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
HaveToRunDeinst
 NUMBER null 
 check (HaveToRunDeinst in ( 1/* �� */
, 0/* ��� */ )) /* ��������� ��� ������������� */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
DeinstallComandParam
 VARCHAR2 (255) null /* ����� ������������� */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
IsCustomScript
 NUMBER null 
 check (IsCustomScript in ( 1/* �� */
, 0/* ��� */ )) /* ���������������� ������ (��. ���� ���� ��� �������) */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
CustomScriptInstall CHAR(38) null /* Custom Script Install */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
CustomScriptUnInstall CHAR(38) null /* Custom Script UnInstall */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
SEQ
 NUMBER null /* ������� */
/


/*���������������� �������*/
drop table MTZ.MTZ_Inst_Common/**/ 
/
create table MTZ.MTZ_Inst_Common/**/ (
InstanceID CHAR(38) ,
MTZ_Inst_Commonid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.MTZ_Inst_Common add 
TheName
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.MTZ_Inst_Common add 
TheInstallScript VARCHAR2(4000) null /* ������ ����������� */
/
alter  table MTZ.MTZ_Inst_Common add 
SEQ
 NUMBER null /* ������� (����������) */
/
alter  table MTZ.MTZ_Inst_Common add 
IsDeinstallUSE
 NUMBER null 
 check (IsDeinstallUSE in ( 1/* �� */
, 0/* ��� */ )) /* ������������ ��� ������������� */
/


/*�������� ������*/
drop table MTZ.ITTTZ_DEF/*��������� ����� ������������ ������*/ 
/
create table MTZ.ITTTZ_DEF/*��������� ����� ������������ ������*/ (
InstanceID CHAR(38) ,
ITTTZ_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTTZ_DEF add 
Code
 VARCHAR2 (2) null /* ��� ��������� */
/
alter  table MTZ.ITTTZ_DEF add 
Direction
 VARCHAR2 (1) null /* �����������  */
/
alter  table MTZ.ITTTZ_DEF add 
DocDate
 DATE null /* ���� ��������� */
/
alter  table MTZ.ITTTZ_DEF add 
TheNumber
 VARCHAR2 (8) null /* ����� ��������� */
/
alter  table MTZ.ITTTZ_DEF add 
SupplierCode
 VARCHAR2 (4) null /* ��� ���������� */
/
alter  table MTZ.ITTTZ_DEF add 
TheClient
 VARCHAR2 (255) null /* ������ */
/


/*������ ������������� ������*/
drop table MTZ.ITTTZ_LINES/**/ 
/
create table MTZ.ITTTZ_LINES/**/ (
InstanceID CHAR(38) ,
ITTTZ_LINESid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTTZ_LINES add 
Direction
 VARCHAR2 (1) null /* ����������� �������� ������ */
/
alter  table MTZ.ITTTZ_LINES add 
FileLink
 VARCHAR2 (2) null /* ������� �������� */
/
alter  table MTZ.ITTTZ_LINES add 
TheNumber
 VARCHAR2 (8) null /* ����� ��������� */
/
alter  table MTZ.ITTTZ_LINES add 
SupplierCode
 VARCHAR2 (4) null /* ��� ���������� */
/
alter  table MTZ.ITTTZ_LINES add 
sequence
 NUMBER null /* ���������� ����� */
/
alter  table MTZ.ITTTZ_LINES add 
TheArticul
 VARCHAR2 (8) null /* ������� ������ */
/
alter  table MTZ.ITTTZ_LINES add 
Quantity
 NUMBER null /* ���������� ������� �� ������ */
/
alter  table MTZ.ITTTZ_LINES add 
EDIZM
 VARCHAR2 (3) null /* ������� ����� */
/
alter  table MTZ.ITTTZ_LINES add 
SSCC
 VARCHAR2 (18) null /* SSCC */
/
alter  table MTZ.ITTTZ_LINES add 
Partia
 VARCHAR2 (6) null /* ����� ������ */
/


/*�������� ������������*/
drop table MTZ.ITT2OPT_DEF/**/ 
/
create table MTZ.ITT2OPT_DEF/**/ (
InstanceID CHAR(38) ,
ITT2OPT_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITT2OPT_DEF add 
OptType CHAR(38) null /* ��� ����������� */
/
alter  table MTZ.ITT2OPT_DEF add 
TheRule CHAR(38) null /* ������� ������������ ������ */
/
alter  table MTZ.ITT2OPT_DEF add 
OPtDate
 DATE null /* ���� �������� ������ */
/
alter  table MTZ.ITT2OPT_DEF add 
DateToOptimize
 DATE null /* �������� ���� ����������� */
/


/*������ � ������*/
drop table MTZ.ITTOUT_SRV/**/ 
/
create table MTZ.ITTOUT_SRV/**/ (
InstanceID CHAR(38) ,
ITTOUT_SRVid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTOUT_SRV add 
SRV CHAR(38) null /* ������ */
/
alter  table MTZ.ITTOUT_SRV add 
Quantity
 NUMBER null /* ��������� */
/


/*��������*/
drop table MTZ.ITTOUT_DEF/**/ 
/
create table MTZ.ITTOUT_DEF/**/ (
InstanceID CHAR(38) ,
ITTOUT_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTOUT_DEF add 
ShipOrder VARCHAR2(4000) null /* ����� �� �������� */
/
alter  table MTZ.ITTOUT_DEF add 
TheClient VARCHAR2(4000) null /* ������ */
/
alter  table MTZ.ITTOUT_DEF add 
ProcessDate
 DATE null /* ���� ��������� ������ */
/
alter  table MTZ.ITTOUT_DEF add 
Supplier
 VARCHAR2 (255) null /* ��������� */
/
alter  table MTZ.ITTOUT_DEF add 
TTN
 VARCHAR2 (30) null /* ����� ��� */
/
alter  table MTZ.ITTOUT_DEF add 
TTNDate
 DATE null /* ���� ��� */
/
alter  table MTZ.ITTOUT_DEF add 
TranspNumber
 VARCHAR2 (30) null /* � �� */
/
alter  table MTZ.ITTOUT_DEF add 
Container
 VARCHAR2 (30) null /* � ������� \ ���������� */
/
alter  table MTZ.ITTOUT_DEF add 
StampNumber
 VARCHAR2 (20) null /* ����� ������ */
/
alter  table MTZ.ITTOUT_DEF add 
StampStatus
 VARCHAR2 (30) null /* ��������� ������ */
/
alter  table MTZ.ITTOUT_DEF add 
Track_time_in
 DATE null /* ����� �������� ������ */
/
alter  table MTZ.ITTOUT_DEF add 
track_time_out
 DATE null /* ����� ������ ������ */
/
alter  table MTZ.ITTOUT_DEF add 
temp_in_track
 NUMBER null /* ����������� */
/
alter  table MTZ.ITTOUT_DEF add 
ThePartyRule CHAR(38) null /* �������� ������������ ������ */
/


/*������� � ������*/
drop table MTZ.ITTOUT_EPL/**/ 
/
create table MTZ.ITTOUT_EPL/**/ (
InstanceID CHAR(38) ,
ITTOUT_EPLid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTOUT_EPL add 
TheNumber CHAR(38) null /* ������ */
/
alter  table MTZ.ITTOUT_EPL add 
PalWeight
 NUMBER null /* ��� ������ ��. */
/
alter  table MTZ.ITTOUT_EPL add 
Palet_ID
 NUMBER null /* ������������� ������ */
/


/*������ ������*/
drop table MTZ.ITTOUT_LINES/**/ 
/
create table MTZ.ITTOUT_LINES/**/ (
InstanceID CHAR(38) ,
ITTOUT_LINESid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTOUT_LINES add 
sequence
 NUMBER null /* � */
/
alter  table MTZ.ITTOUT_LINES add 
LineAtQuery VARCHAR2(4000) null /* ������ � ������ */
/
alter  table MTZ.ITTOUT_LINES add 
QRY_NUM VARCHAR2(4000) null /* �� ������ ��. */
/
alter  table MTZ.ITTOUT_LINES add 
CurValue
 NUMBER null /* ���� ��. */
/
alter  table MTZ.ITTOUT_LINES add 
articul
 VARCHAR2 (30) null /* ������� */
/
alter  table MTZ.ITTOUT_LINES add 
edizm
 VARCHAR2 (30) null /* ��. ��� */
/
alter  table MTZ.ITTOUT_LINES add 
vetsved
 VARCHAR2 (50) null /* ����� ���. ������������� */
/
alter  table MTZ.ITTOUT_LINES add 
made_country CHAR(38) null /* ������ ������������� */
/
alter  table MTZ.ITTOUT_LINES add 
made_date_to
 DATE null /* ���� ������������ �� */
/
alter  table MTZ.ITTOUT_LINES add 
Factory CHAR(38) null /* ����� */
/
alter  table MTZ.ITTOUT_LINES add 
KILL_NUMBER CHAR(38) null /* � ����� */
/
alter  table MTZ.ITTOUT_LINES add 
VidOtruba
 VARCHAR2 (64) null /* ��� ������ */
/
alter  table MTZ.ITTOUT_LINES add 
PartRef CHAR(38) null /* ������ */
/
alter  table MTZ.ITTOUT_LINES add 
Made_date
 DATE null /* ���� ������������ C */
/
alter  table MTZ.ITTOUT_LINES add 
exp_date
 DATE null /* ���� �������� */
/
alter  table MTZ.ITTOUT_LINES add 
Quanity
 NUMBER null /* ���������� ������� */
/
alter  table MTZ.ITTOUT_LINES add 
PackageWeight
 NUMBER null /* ��� ����� �������� */
/
alter  table MTZ.ITTOUT_LINES add 
FullPackageWeight
 NUMBER null /* ��������� ��� �������� ��. */
/
alter  table MTZ.ITTOUT_LINES add 
NumInBufZone
 VARCHAR2 (20) null /* ����� � �������� ���� */
/
alter  table MTZ.ITTOUT_LINES add 
good_ID VARCHAR2(4000) null /* ������������� ������ */
/
alter  table MTZ.ITTOUT_LINES add 
Navalom
 NUMBER null 
 check (Navalom in ( -1/* �� */
, 0/* ��� */ )) /* ���� ������� */
/


/*������ � ������*/
drop table MTZ.ITTOUT_PALET/**/ 
/
create table MTZ.ITTOUT_PALET/**/ (
ParentStructRowID CHAR(38) not null,
ITTOUT_PALETid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTOUT_PALET add 
sequence
 NUMBER null /* � �\� */
/
alter  table MTZ.ITTOUT_PALET add 
TheNumber CHAR(38) null /* ������ */
/
alter  table MTZ.ITTOUT_PALET add 
made_country CHAR(38) null /* ������ ������������� */
/
alter  table MTZ.ITTOUT_PALET add 
Factory CHAR(38) null /* ����� */
/
alter  table MTZ.ITTOUT_PALET add 
KILL_NUMBER CHAR(38) null /* � ����� */
/
alter  table MTZ.ITTOUT_PALET add 
VidOtruba
 VARCHAR2 (64) null /* ��� ������ */
/
alter  table MTZ.ITTOUT_PALET add 
PartRef CHAR(38) null /* ������ */
/
alter  table MTZ.ITTOUT_PALET add 
vetsved
 VARCHAR2 (50) null /* ����� ���. ������������� */
/
alter  table MTZ.ITTOUT_PALET add 
Made_date
 DATE null /* ���� ������������ C */
/
alter  table MTZ.ITTOUT_PALET add 
made_date_to
 DATE null /* ���� ������������ �� */
/
alter  table MTZ.ITTOUT_PALET add 
exp_date
 DATE null /* ���� �������� */
/
alter  table MTZ.ITTOUT_PALET add 
CaliberQuantity
 NUMBER null /* ��������� ������� */
/
alter  table MTZ.ITTOUT_PALET add 
GoodWithPaletWeight
 NUMBER null /* ��� ������ � ������� ��. */
/
alter  table MTZ.ITTOUT_PALET add 
PackageWeight
 NUMBER null /* ��� ����� �������� ��. */
/
alter  table MTZ.ITTOUT_PALET add 
FullPackageWeight
 NUMBER null /* ��������� ��� �������� ��. */
/
alter  table MTZ.ITTOUT_PALET add 
IsEmpty
 NUMBER null 
 check (IsEmpty in ( -1/* �� */
, 0/* ��� */ )) /* ��������� ��������� */
/
alter  table MTZ.ITTOUT_PALET add 
BufferCell
 VARCHAR2 (20) null /* ����� �������� ������ */
/
alter  table MTZ.ITTOUT_PALET add 
StoreCell
 VARCHAR2 (20) null /* ����� �������� ������ */
/
alter  table MTZ.ITTOUT_PALET add 
ReorgWeight
 NUMBER null /* ��� ����������� ����� � �������� ��. */
/
alter  table MTZ.ITTOUT_PALET add 
ReorgCaliberQuantity
 NUMBER null /* ���������� ���������� ������� */
/
alter  table MTZ.ITTOUT_PALET add 
ReorgPackageFullWeight
 NUMBER null /* ��������� ��� ���������� �������� ��. */
/
alter  table MTZ.ITTOUT_PALET add 
IsBrak
 NUMBER null 
 check (IsBrak in ( -1/* �� */
, 0/* ��� */ )) /* ���� */
/
alter  table MTZ.ITTOUT_PALET add 
IsCalibrated
 NUMBER null 
 check (IsCalibrated in ( -1/* �� */
, 0/* ��� */ )) /* ������������� ����� */
/
alter  table MTZ.ITTOUT_PALET add 
SSCC
 VARCHAR2 (18) null /* SSCC ��� */
/
alter  table MTZ.ITTOUT_PALET add 
BarCode1
 VARCHAR2 (40) null /* Bar Code 1 */
/
alter  table MTZ.ITTOUT_PALET add 
BarCode2
 VARCHAR2 (40) null /* Bar Code 2 */
/


/*������ ������*/
drop table MTZ.ITTIN_QLINE/**/ 
/
create table MTZ.ITTIN_QLINE/**/ (
InstanceID CHAR(38) ,
ITTIN_QLINEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTIN_QLINE add 
sequence
 NUMBER null /* � �\� */
/
alter  table MTZ.ITTIN_QLINE add 
LineAtQuery VARCHAR2(4000) null /* ������ � ������ */
/
alter  table MTZ.ITTIN_QLINE add 
QRY_NUM VARCHAR2(4000) null /* �� ������ ��. */
/
alter  table MTZ.ITTIN_QLINE add 
edizm
 VARCHAR2 (30) null /* ��. ��� */
/
alter  table MTZ.ITTIN_QLINE add 
CurValue
 NUMBER null /* ���� ��. */
/
alter  table MTZ.ITTIN_QLINE add 
articul
 VARCHAR2 (30) null /* ������� */
/
alter  table MTZ.ITTIN_QLINE add 
made_country CHAR(38) null /* ������ ������������� */
/
alter  table MTZ.ITTIN_QLINE add 
Factory CHAR(38) null /* ����� */
/
alter  table MTZ.ITTIN_QLINE add 
KILL_NUMBER CHAR(38) null /* � ����� */
/
alter  table MTZ.ITTIN_QLINE add 
VidOtruba
 VARCHAR2 (64) null /* ��� ������ */
/
alter  table MTZ.ITTIN_QLINE add 
PartRef CHAR(38) null /* ������ */
/
alter  table MTZ.ITTIN_QLINE add 
vetsved
 VARCHAR2 (50) null /* ����� ���. ������������� */
/
alter  table MTZ.ITTIN_QLINE add 
Made_date
 DATE null /* ���� ������������ C */
/
alter  table MTZ.ITTIN_QLINE add 
made_date_to
 DATE null /* ���� ������������ �� */
/
alter  table MTZ.ITTIN_QLINE add 
exp_date
 DATE null /* ���� �������� */
/
alter  table MTZ.ITTIN_QLINE add 
IsCalibrated
 NUMBER null 
 check (IsCalibrated in ( -1/* �� */
, 0/* ��� */ )) /* ������������� ���� */
/
alter  table MTZ.ITTIN_QLINE add 
CaliberWeight
 NUMBER null /* ��� ������������� ������� ����� */
/
alter  table MTZ.ITTIN_QLINE add 
PackageWeight
 NUMBER null /* ��� ����� �������� ��. */
/
alter  table MTZ.ITTIN_QLINE add 
FullPackageWeight
 NUMBER null /* ��������� ��� �������� ��. */
/
alter  table MTZ.ITTIN_QLINE add 
good_id VARCHAR2(4000) null /* ������������� ������ */
/
alter  table MTZ.ITTIN_QLINE add 
KorobBrutto
 NUMBER null /* ��� ������ ������ */
/
alter  table MTZ.ITTIN_QLINE add 
KorobNetto
 NUMBER null /* ��� ����� ������ */
/
alter  table MTZ.ITTIN_QLINE add 
Navalom
 NUMBER null 
 check (Navalom in ( -1/* �� */
, 0/* ��� */ )) /* ���� ������� */
/


/*������ � ������*/
drop table MTZ.ITTIN_PALET/**/ 
/
create table MTZ.ITTIN_PALET/**/ (
ParentStructRowID CHAR(38) not null,
ITTIN_PALETid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTIN_PALET add 
sequence
 NUMBER null /* � �\� */
/
alter  table MTZ.ITTIN_PALET add 
TheNumber CHAR(38) null /* ������ */
/
alter  table MTZ.ITTIN_PALET add 
made_country CHAR(38) null /* ������ ������������� */
/
alter  table MTZ.ITTIN_PALET add 
Factory CHAR(38) null /* ����� */
/
alter  table MTZ.ITTIN_PALET add 
KILL_NUMBER CHAR(38) null /* � ����� */
/
alter  table MTZ.ITTIN_PALET add 
VidOtruba
 VARCHAR2 (64) null /* ��� ������ */
/
alter  table MTZ.ITTIN_PALET add 
PartRef CHAR(38) null /* ������ */
/
alter  table MTZ.ITTIN_PALET add 
vetsved
 VARCHAR2 (50) null /* ����� ���. ������������� */
/
alter  table MTZ.ITTIN_PALET add 
Made_date
 DATE null /* ���� ������������ C */
/
alter  table MTZ.ITTIN_PALET add 
made_date_to
 DATE null /* ���� ������������ �� */
/
alter  table MTZ.ITTIN_PALET add 
exp_date
 DATE null /* ���� �������� */
/
alter  table MTZ.ITTIN_PALET add 
CaliberQuantity
 NUMBER null /* ��������� ������� */
/
alter  table MTZ.ITTIN_PALET add 
PalWeight
 NUMBER null /* ��� ������� ��. */
/
alter  table MTZ.ITTIN_PALET add 
GoodWithPaletWeight
 NUMBER null /* ��� ������� � ������ ��. */
/
alter  table MTZ.ITTIN_PALET add 
PackageWeight
 NUMBER null /* ��� �������� ��. */
/
alter  table MTZ.ITTIN_PALET add 
FullPackageWeight
 NUMBER null /* ��������� ��� �������� ��. */
/
alter  table MTZ.ITTIN_PALET add 
BufferZonePlace
 VARCHAR2 (20) null /* ����� ������ � �������� ���� */
/
alter  table MTZ.ITTIN_PALET add 
Stock_ID
 NUMBER null /* ������������� ��  ������ */
/
alter  table MTZ.ITTIN_PALET add 
palet_id
 NUMBER null /* ������������� ������ */
/
alter  table MTZ.ITTIN_PALET add 
IsBrak
 NUMBER null 
 check (IsBrak in ( -1/* �� */
, 0/* ��� */ )) /* ���� */
/
alter  table MTZ.ITTIN_PALET add 
KorobBrutto
 NUMBER null /* ��� ������ ������ */
/
alter  table MTZ.ITTIN_PALET add 
KorobNetto
 NUMBER null /* ��� ����� ������ */
/
alter  table MTZ.ITTIN_PALET add 
IsCalibrated
 NUMBER null 
 check (IsCalibrated in ( -1/* �� */
, 0/* ��� */ )) /* ������������� ���� */
/
alter  table MTZ.ITTIN_PALET add 
SSCC
 VARCHAR2 (18) null /* SSCC ��� */
/
alter  table MTZ.ITTIN_PALET add 
BarCode1
 VARCHAR2 (40) null /* Bar Code 1 */
/
alter  table MTZ.ITTIN_PALET add 
BarCode2
 VARCHAR2 (40) null /* Bar Code 2 */
/


/*������ � ������*/
drop table MTZ.ITTIN_SRV/**/ 
/
create table MTZ.ITTIN_SRV/**/ (
InstanceID CHAR(38) ,
ITTIN_SRVid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTIN_SRV add 
SRV CHAR(38) null /* ������ */
/
alter  table MTZ.ITTIN_SRV add 
Quantity
 NUMBER null /* ��������� */
/


/*��������*/
drop table MTZ.ITTIN_DEF/**/ 
/
create table MTZ.ITTIN_DEF/**/ (
InstanceID CHAR(38) ,
ITTIN_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTIN_DEF add 
QryCode VARCHAR2(4000) null /* ��� ������ */
/
alter  table MTZ.ITTIN_DEF add 
TheClient VARCHAR2(4000) null /* ������ */
/
alter  table MTZ.ITTIN_DEF add 
ProcessDate
 DATE null /* ���� ��������� ������ */
/
alter  table MTZ.ITTIN_DEF add 
Supplier
 VARCHAR2 (255) null /* ��������� */
/
alter  table MTZ.ITTIN_DEF add 
TTN
 VARCHAR2 (30) null /* ����� ��� */
/
alter  table MTZ.ITTIN_DEF add 
TTNDate
 DATE null /* ���� ��� */
/
alter  table MTZ.ITTIN_DEF add 
TranspNumber
 VARCHAR2 (30) null /* � �� */
/
alter  table MTZ.ITTIN_DEF add 
Container
 VARCHAR2 (30) null /* � ������� \ ���������� */
/
alter  table MTZ.ITTIN_DEF add 
StampNumber
 VARCHAR2 (20) null /* ����� ������ */
/
alter  table MTZ.ITTIN_DEF add 
StampStatus
 VARCHAR2 (30) null /* ��������� ������ */
/
alter  table MTZ.ITTIN_DEF add 
Track_time_in
 DATE null /* ����� �������� ������ */
/
alter  table MTZ.ITTIN_DEF add 
track_time_out
 DATE null /* ����� ������ ������ */
/
alter  table MTZ.ITTIN_DEF add 
temp_in_track
 NUMBER null /* ����������� */
/
alter  table MTZ.ITTIN_DEF add 
ThePartyRule CHAR(38) null /* �������� ������������ ������ */
/


/*������� � ������*/
drop table MTZ.ITTIN_EPL/*������ ������� � ������*/ 
/
create table MTZ.ITTIN_EPL/*������ ������� � ������*/ (
InstanceID CHAR(38) ,
ITTIN_EPLid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTIN_EPL add 
TheNumber CHAR(38) null /* ������ */
/
alter  table MTZ.ITTIN_EPL add 
PalWeight
 NUMBER null /* ��� ������ */
/


/*������ �������� ������*/
drop table MTZ.ITTSSCC_LINE/**/ 
/
create table MTZ.ITTSSCC_LINE/**/ (
InstanceID CHAR(38) ,
ITTSSCC_LINEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTSSCC_LINE add 
PalletCode
 VARCHAR2 (20) null /* ��� �������� */
/
alter  table MTZ.ITTSSCC_LINE add 
Barcode1
 VARCHAR2 (40) null /* ������ 1 */
/
alter  table MTZ.ITTSSCC_LINE add 
Barcode2
 VARCHAR2 (40) null /* ������ 2 */
/
alter  table MTZ.ITTSSCC_LINE add 
Processed
 NUMBER null 
 check (Processed in ( -1/* �� */
, 0/* ��� */ )) /* ��������� */
/
alter  table MTZ.ITTSSCC_LINE add 
Result VARCHAR2(4000) null /* ��������� ��������� */
/


/*�������� ��������*/
drop table MTZ.ITTSSCC_DEF/**/ 
/
create table MTZ.ITTSSCC_DEF/**/ (
InstanceID CHAR(38) ,
ITTSSCC_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTSSCC_DEF add 
TheDate
 DATE null /* ���� */
/
alter  table MTZ.ITTSSCC_DEF add 
TheUser CHAR(38) null /* ������������ */
/
alter  table MTZ.ITTSSCC_DEF add 
TCode
 VARCHAR2 (255) null /* ��� ��������� */
/


/*���*/
drop table MTZ.WorkPlace/*���*/ 
/
create table MTZ.WorkPlace/*���*/ (
InstanceID CHAR(38) ,
WorkPlaceid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WorkPlace add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.WorkPlace add 
Caption
 VARCHAR2 (255) null /* ��������� */
/
alter  table MTZ.WorkPlace add 
TheVersion
 VARCHAR2 (30) null /* ������ */
/
alter  table MTZ.WorkPlace add 
ThePlatform
 NUMBER null 
 check (ThePlatform in ( 2/* JAVA */
, 3/* OTHER */
, 1/* DOTNET */
, 0/* VB6 */ )) /* ��������� ���������� */
/
alter  table MTZ.WorkPlace add 
TheComment VARCHAR2(4000) null /* ���������� */
/


/*����*/
drop table MTZ.EntryPoints/*����*/ 
/
create table MTZ.EntryPoints/*����*/ (
InstanceID CHAR(38) ,
EntryPointsid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
/
alter  table MTZ.EntryPoints add 
sequence
 NUMBER null /* ������������������ */
/
alter  table MTZ.EntryPoints add 
Name
 VARCHAR2 (38) null /* �������� */
/
alter  table MTZ.EntryPoints add 
Caption
 VARCHAR2 (255) null /* ��������� */
/
alter  table MTZ.EntryPoints add 
AsToolbarItem
 NUMBER null 
 check (AsToolbarItem in ( -1/* �� */
, 0/* ��� */ )) /* �������� � ������ */
/
alter  table MTZ.EntryPoints add 
ActionType
 NUMBER null 
 check (ActionType in ( 5/* ������� ����� */
, 0/* ������ �� ������ */
, 2/* ��������� ����� */
, 1/* ������� �������� */
, 4/* ��������� ��� */
, 3/* ������� ������ */ )) /* ������� �������� */
/
alter  table MTZ.EntryPoints add 
TheFilter CHAR(38) null /* ������ */
/
alter  table MTZ.EntryPoints add 
Journal CHAR(38) null /* ������ */
/
alter  table MTZ.EntryPoints add 
Report CHAR(38) null /* ����� */
/
alter  table MTZ.EntryPoints add 
Document CHAR(38) null /* �������� */
/
alter  table MTZ.EntryPoints add 
Method CHAR(38) null /* ����� */
/
alter  table MTZ.EntryPoints add 
IconFile
 VARCHAR2 (2000) null /* ���� �������� */
/
alter  table MTZ.EntryPoints add 
TheExtention CHAR(38) null /* ���������� */
/
alter  table MTZ.EntryPoints add 
ARM CHAR(38) null /* ��� */
/
alter  table MTZ.EntryPoints add 
TheComment VARCHAR2(4000) null /* ���������� */
/
alter  table MTZ.EntryPoints add 
ObjectType CHAR(38) null /* ��� ��������� */
/
alter  table MTZ.EntryPoints add 
JournalFixedQuery VARCHAR2(4000) null /* ����������� � ������� */
/


/*�������� �������*/
drop table MTZ.EPFilterLink/*�������� ������� � �������*/ 
/
create table MTZ.EPFilterLink/*�������� ������� � �������*/ (
ParentStructRowID CHAR(38) not null,
EPFilterLinkid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.EPFilterLink add 
RowSource
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.EPFilterLink add 
TheExpression VARCHAR2(4000) null /* ��������� */
/
alter  table MTZ.EPFilterLink add 
FilterField
 VARCHAR2 (255) null /* ���� ������� */
/


/*������ �����*/
drop table MTZ.ARMTypes/*���� ����������, ������� ������������ � MDI ������*/ 
/
create table MTZ.ARMTypes/*���� ����������, ������� ������������ � MDI ������*/ (
InstanceID CHAR(38) ,
ARMTypesid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ARMTypes add 
TheDocumentType CHAR(38) null /* ��� ��������� */
/


/*��������� ��������*/
drop table MTZ.ARMJournal/*�������� �������� ��������*/ 
/
create table MTZ.ARMJournal/*�������� �������� ��������*/ (
InstanceID CHAR(38) ,
ARMJournalid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ARMJournal add 
TheJournal CHAR(38) null /* ������ */
/


/*����������*/
drop table MTZ.ARMJRNLADD/*�������� ��������� ����������*/ 
/
create table MTZ.ARMJRNLADD/*�������� ��������� ����������*/ (
ParentStructRowID CHAR(38) not null,
ARMJRNLADDid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ARMJRNLADD add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.ARMJRNLADD add 
TheExtention CHAR(38) null /* ���������� */
/


/*������*/
drop table MTZ.ARMJRNLREP/*������ �� �������*/ 
/
create table MTZ.ARMJRNLREP/*������ �� �������*/ (
ParentStructRowID CHAR(38) not null,
ARMJRNLREPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ARMJRNLREP add 
repname
 VARCHAR2 (255) null /* �������� ������ */
/
alter  table MTZ.ARMJRNLREP add 
TheReport CHAR(38) null /* ����� */
/


/*��������*/
drop table MTZ.ARMJRNLRUN/*�������������� �������� � �������*/ 
/
create table MTZ.ARMJRNLRUN/*�������������� �������� � �������*/ (
ParentStructRowID CHAR(38) not null,
ARMJRNLRUNid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ARMJRNLRUN add 
Name
 VARCHAR2 (255) null /* �������� */
/
alter  table MTZ.ARMJRNLRUN add 
TheExtention CHAR(38) null /* ���������� */
/


/*������ ��������*/
drop table MTZ.WEBS_MAILLIST/**/ 
/
create table MTZ.WEBS_MAILLIST/**/ (
InstanceID CHAR(38) ,
WEBS_MAILLISTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBS_MAILLIST add 
Email
 VARCHAR2 (512) null /* ����� */
/


/*Roles*/
drop table MTZ.WEBS_ROLES/*����*/ 
/
create table MTZ.WEBS_ROLES/*����*/ (
InstanceID CHAR(38) ,
WEBS_ROLESid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBS_ROLES add 
Name
 VARCHAR2 (256) null /* �������� */
/
alter  table MTZ.WEBS_ROLES add 
RoleDescription VARCHAR2(4000) null /* �������� */
/


/*�������� �����*/
drop table MTZ.WEBS_PAGEDEF/**/ 
/
create table MTZ.WEBS_PAGEDEF/**/ (
InstanceID CHAR(38) ,
WEBS_PAGEDEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
/
alter  table MTZ.WEBS_PAGEDEF add 
QueueNumber
 NUMBER null /* ����� �/� */
/
alter  table MTZ.WEBS_PAGEDEF add 
Name
 VARCHAR2 (256) null /* �������� */
/
alter  table MTZ.WEBS_PAGEDEF add 
Url
 VARCHAR2 (1024) null /* ��� */
/
alter  table MTZ.WEBS_PAGEDEF add 
Title
 VARCHAR2 (256) null /* ����� */
/
alter  table MTZ.WEBS_PAGEDEF add 
ShortName
 VARCHAR2 (256) null /* �������� �������� */
/
alter  table MTZ.WEBS_PAGEDEF add 
ObjectName CHAR(38) null /* ��� ������� */
/
alter  table MTZ.WEBS_PAGEDEF add 
ObjectCode CHAR(38) null /* ��� ������� */
/
alter  table MTZ.WEBS_PAGEDEF add 
AllowHeader
 NUMBER null 
 check (AllowHeader in ( -1/* �� */
, 0/* ��� */ )) /* �������� ��������� */
/
alter  table MTZ.WEBS_PAGEDEF add 
the_Mode
 VARCHAR2 (256) null /* ����� ������ */
/
alter  table MTZ.WEBS_PAGEDEF add 
PageType CHAR(38) null /* ��� */
/
alter  table MTZ.WEBS_PAGEDEF add 
ControlPath
 VARCHAR2 (256) null /* ������� */
/
alter  table MTZ.WEBS_PAGEDEF add 
SelectIDParameterName
 VARCHAR2 (256) null /* ��� ��������� ��� �������� � ����� �������������� */
/
alter  table MTZ.WEBS_PAGEDEF add 
PageContent VARCHAR2(4000) null /* C��������� */
/
alter  table MTZ.WEBS_PAGEDEF add 
AllowAddPage
 NUMBER null 
 check (AllowAddPage in ( -1/* �� */
, 0/* ��� */ )) /* ��������� ��������� �������� */
/
alter  table MTZ.WEBS_PAGEDEF add 
the_IsLocked
 NUMBER null 
 check (the_IsLocked in ( -1/* �� */
, 0/* ��� */ )) /* ������������� */
/
alter  table MTZ.WEBS_PAGEDEF add 
IsOnMap
 NUMBER null 
 check (IsOnMap in ( -1/* �� */
, 0/* ��� */ )) /* ���������� �� ����� ����� */
/
alter  table MTZ.WEBS_PAGEDEF add 
IsShowHisory
 NUMBER null 
 check (IsShowHisory in ( -1/* �� */
, 0/* ��� */ )) /* ���������� ������� */
/
alter  table MTZ.WEBS_PAGEDEF add 
RedirectToFirstChild
 NUMBER null 
 check (RedirectToFirstChild in ( -1/* �� */
, 0/* ��� */ )) /* ������� �� ������ �������� �������� */
/


/*��������*/
drop table MTZ.WEBS_PICS/**/ 
/
create table MTZ.WEBS_PICS/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_PICSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBS_PICS add 
Name
 VARCHAR2 (512) null /* �������� */
/
alter  table MTZ.WEBS_PICS add 
FileContent VARCHAR2(4000) null /* ���� */
/
alter  table MTZ.WEBS_PICS add 
 FileContent_EXT varchar2(4) null
/


/*��������� � ����*/
drop table MTZ.WEBS_PAGEMENU/**/ 
/
create table MTZ.WEBS_PAGEMENU/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_PAGEMENUid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBS_PAGEMENU add 
AllowInMenu
 NUMBER null 
 check (AllowInMenu in ( -1/* �� */
, 0/* ��� */ )) /* � ���� */
/
alter  table MTZ.WEBS_PAGEMENU add 
AllowInBottomMenu
 NUMBER null 
 check (AllowInBottomMenu in ( -1/* �� */
, 0/* ��� */ )) /* � ������ ���� */
/
alter  table MTZ.WEBS_PAGEMENU add 
UsePartRowsInMenu
 NUMBER null 
 check (UsePartRowsInMenu in ( -1/* �� */
, 0/* ��� */ )) /* ���������� ������ � ���� */
/
alter  table MTZ.WEBS_PAGEMENU add 
UsePartRowsEditForm CHAR(38) null /* �������� ��� �������������� */
/
alter  table MTZ.WEBS_PAGEMENU add 
UsePartRowsTextField
 VARCHAR2 (256) null /* ���� ������ ������ */
/
alter  table MTZ.WEBS_PAGEMENU add 
UsePartRowsRowIDField
 VARCHAR2 (256) null /* ���� ID */
/
alter  table MTZ.WEBS_PAGEMENU add 
UsePartRowsSort
 VARCHAR2 (256) null /* ���������� ����� ����� */
/


/*����������*/
drop table MTZ.WEBS_PAGECONTENT/**/ 
/
create table MTZ.WEBS_PAGECONTENT/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_PAGECONTENTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBS_PAGECONTENT add 
Content
 VARCHAR2 (8000) null /* ���������� */
/


/*���������*/
drop table MTZ.WEBS_PAGEPARS/**/ 
/
create table MTZ.WEBS_PAGEPARS/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_PAGEPARSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBS_PAGEPARS add 
Name
 VARCHAR2 (256) null /* ��� */
/
alter  table MTZ.WEBS_PAGEPARS add 
TheValue
 VARCHAR2 (256) null /* �������� */
/


/*����������*/
drop table MTZ.WEBS_PAGECOMP/**/ 
/
create table MTZ.WEBS_PAGECOMP/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_PAGECOMPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBS_PAGECOMP add 
Name
 VARCHAR2 (256) null /* �������� */
/
alter  table MTZ.WEBS_PAGECOMP add 
Title
 VARCHAR2 (256) null /* ����� */
/
alter  table MTZ.WEBS_PAGECOMP add 
Selected
 NUMBER null 
 check (Selected in ( -1/* �� */
, 0/* ��� */ )) /* ������� */
/
alter  table MTZ.WEBS_PAGECOMP add 
IsCollection
 NUMBER null 
 check (IsCollection in ( -1/* �� */
, 0/* ��� */ )) /* ��������� */
/
alter  table MTZ.WEBS_PAGECOMP add 
the_PartName CHAR(38) null /* ������ */
/
alter  table MTZ.WEBS_PAGECOMP add 
IDField
 VARCHAR2 (256) null /* ���� ID */
/
alter  table MTZ.WEBS_PAGECOMP add 
UserIdField
 VARCHAR2 (256) null /* ���� UserID */
/
alter  table MTZ.WEBS_PAGECOMP add 
Visible
 NUMBER null 
 check (Visible in ( -1/* �� */
, 0/* ��� */ )) /* ��������� */
/


/*��������� �����*/
drop table MTZ.TablePart/**/ 
/
create table MTZ.TablePart/**/ (
ParentStructRowID CHAR(38) not null,
TablePartid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.TablePart add 
FilterUserIDFieldName_
 VARCHAR2 (256) null /* ��� ���� ��� ������� UserID */
/
alter  table MTZ.TablePart add 
Filter_
 VARCHAR2 (256) null /* ������ */
/
alter  table MTZ.TablePart add 
SelectIDParameterName
 VARCHAR2 (256) null /* �������� ��� �������� ID */
/
alter  table MTZ.TablePart add 
EditForm CHAR(38) null /* �������� ��� �������������� */
/
alter  table MTZ.TablePart add 
AllowDelete
 NUMBER null 
 check (AllowDelete in ( -1/* �� */
, 0/* ��� */ )) /* ��������� �������� */
/
alter  table MTZ.TablePart add 
AllowAddNew
 NUMBER null 
 check (AllowAddNew in ( -1/* �� */
, 0/* ��� */ )) /* ��������� ���������� */
/
alter  table MTZ.TablePart add 
AddStatusColumn_
 NUMBER null 
 check (AddStatusColumn_ in ( -1/* �� */
, 0/* ��� */ )) /* ���� Status ������� */
/
alter  table MTZ.TablePart add 
AllowEditRowStatusNameValue
 VARCHAR2 (256) null /* �������� Status ��� �������������� */
/
alter  table MTZ.TablePart add 
AllowEditField
 VARCHAR2 (256) null /* AllowEditField */
/
alter  table MTZ.TablePart add 
JournalID CHAR(38) null /* JournalID */
/
alter  table MTZ.TablePart add 
FilterUserClientDef
 VARCHAR2 (256) null /* FilterUserClientDef */
/
alter  table MTZ.TablePart add 
AllowEditUserClientDef
 NUMBER null 
 check (AllowEditUserClientDef in ( -1/* �� */
, 0/* ��� */ )) /* AllowEditUserClientDef */
/
alter  table MTZ.TablePart add 
ClientDefField
 VARCHAR2 (256) null /* ClientDefField */
/
alter  table MTZ.TablePart add 
DataNavigateUrlField
 VARCHAR2 (256) null /* DataNavigateUrlField */
/
alter  table MTZ.TablePart add 
PagerSize
 NUMBER null /* PagerSize */
/
alter  table MTZ.TablePart add 
EditCaption
 VARCHAR2 (256) null /* EditCaption */
/
alter  table MTZ.TablePart add 
ViewCaption
 VARCHAR2 (256) null /* ViewCaption */
/
alter  table MTZ.TablePart add 
DeleteCaption
 VARCHAR2 (256) null /* DeleteCaption */
/


/*������*/
drop table MTZ.ReplaceValues/**/ 
/
create table MTZ.ReplaceValues/**/ (
ParentStructRowID CHAR(38) not null,
ReplaceValuesid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ReplaceValues add 
Name
 VARCHAR2 (256) null /* ���� */
/
alter  table MTZ.ReplaceValues add 
SourceName
 VARCHAR2 (256) null /* ���� �������� */
/


/*����������� ��� �������������� ����*/
drop table MTZ.DenyEdit/**/ 
/
create table MTZ.DenyEdit/**/ (
ParentStructRowID CHAR(38) not null,
DenyEditid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.DenyEdit add 
Name
 VARCHAR2 (256) null /* �������� */
/


/*��������� ����*/
drop table MTZ.DenyVisible/**/ 
/
create table MTZ.DenyVisible/**/ (
ParentStructRowID CHAR(38) not null,
DenyVisibleid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.DenyVisible add 
Name
 VARCHAR2 (256) null /* ��� ���� */
/


/*�������� ����, ������������ ��������������*/
drop table MTZ.AllowEditFieldValues/*�������� ����, ������������ ��������������*/ 
/
create table MTZ.AllowEditFieldValues/*�������� ����, ������������ ��������������*/ (
ParentStructRowID CHAR(38) not null,
AllowEditFieldValuesid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.AllowEditFieldValues add 
Name
 VARCHAR2 (256) null /* �������� */
/


/*����������*/
drop table MTZ.ComboFields/**/ 
/
create table MTZ.ComboFields/**/ (
ParentStructRowID CHAR(38) not null,
ComboFieldsid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ComboFields add 
Name
 VARCHAR2 (256) null /* ���� */
/
alter  table MTZ.ComboFields add 
SourceName
 VARCHAR2 (256) null /* ���� �������� */
/


/*Users*/
drop table MTZ.WEBS_USERS/**/ 
/
create table MTZ.WEBS_USERS/**/ (
InstanceID CHAR(38) ,
WEBS_USERSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBS_USERS add 
LoginName
 VARCHAR2 (256) null /* Login */
/
alter  table MTZ.WEBS_USERS add 
Organisation
 VARCHAR2 (256) null /* ����������� */
/
alter  table MTZ.WEBS_USERS add 
FirstName
 VARCHAR2 (256) null /* ��� */
/
alter  table MTZ.WEBS_USERS add 
SecondName
 VARCHAR2 (256) null /* �������� */
/
alter  table MTZ.WEBS_USERS add 
LastName
 VARCHAR2 (256) null /* ������� */
/
alter  table MTZ.WEBS_USERS add 
UserDescription VARCHAR2(4000) null /* ���������� */
/


/*������*/
drop table MTZ.WEBS_ANKETA/**/ 
/
create table MTZ.WEBS_ANKETA/**/ (
InstanceID CHAR(38) ,
WEBS_ANKETAid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBS_ANKETA add 
Name
 VARCHAR2 (256) null /* �������� */
/
alter  table MTZ.WEBS_ANKETA add 
the_Description
 VARCHAR2 (4000) null /* �������� */
/
alter  table MTZ.WEBS_ANKETA add 
AnketaDef CHAR(38) null /* ������ */
/
alter  table MTZ.WEBS_ANKETA add 
Message
 VARCHAR2 (156) null /* ��������� */
/


/*�������*/
drop table MTZ.WEBS_QUESTIONS/**/ 
/
create table MTZ.WEBS_QUESTIONS/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_QUESTIONSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBS_QUESTIONS add 
the_Number
 NUMBER null /* �����  */
/
alter  table MTZ.WEBS_QUESTIONS add 
QuestionType CHAR(38) null /* ��� */
/
alter  table MTZ.WEBS_QUESTIONS add 
Name
 VARCHAR2 (1024) null /* ��� */
/
alter  table MTZ.WEBS_QUESTIONS add 
Required
 NUMBER null 
 check (Required in ( -1/* �� */
, 0/* ��� */ )) /* �������������� */
/
alter  table MTZ.WEBS_QUESTIONS add 
Style
 VARCHAR2 (256) null /* ����� */
/


/*������*/
drop table MTZ.WEBS_ANSWERS/**/ 
/
create table MTZ.WEBS_ANSWERS/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_ANSWERSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBS_ANSWERS add 
the_Number
 NUMBER null /* �����  */
/
alter  table MTZ.WEBS_ANSWERS add 
Name
 VARCHAR2 (1024) null /* ��������  */
/
alter  table MTZ.WEBS_ANSWERS add 
the_Description
 VARCHAR2 (4000) null /* ��������  */
/


/*��������� ��� ����������*/
drop table MTZ.WEBS_DDOC/*������ ���������� ������� ����� �������*/ 
/
create table MTZ.WEBS_DDOC/*������ ���������� ������� ����� �������*/ (
InstanceID CHAR(38) ,
WEBS_DDOCid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBS_DDOC add 
Name
 VARCHAR2 (512) null /* �������� */
/
alter  table MTZ.WEBS_DDOC add 
FileName
 VARCHAR2 (1024) null /* ��� ����� */
/
alter  table MTZ.WEBS_DDOC add 
FileContract VARCHAR2(4000) null /* ���� */
/
alter  table MTZ.WEBS_DDOC add 
 FileContract_EXT varchar2(4) null
/
alter  table MTZ.WEBS_DDOC add 
Title
 VARCHAR2 (512) null /* ��������� ��� ������ */
/


/*�������*/
drop table MTZ.WEBS_NEWS/*����������� ������ ��������*/ 
/
create table MTZ.WEBS_NEWS/*����������� ������ ��������*/ (
InstanceID CHAR(38) ,
WEBS_NEWSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
/
alter  table MTZ.WEBS_NEWS add 
QueueNumber
 NUMBER null /* ����� �/� */
/
alter  table MTZ.WEBS_NEWS add 
Name
 VARCHAR2 (256) null /* �������� */
/
alter  table MTZ.WEBS_NEWS add 
Title
 VARCHAR2 (256) null /* ����� */
/
alter  table MTZ.WEBS_NEWS add 
ShortName
 VARCHAR2 (256) null /* �������� �������� */
/
alter  table MTZ.WEBS_NEWS add 
the_Mode
 VARCHAR2 (256) null /* ����� ������ */
/
alter  table MTZ.WEBS_NEWS add 
PageContent VARCHAR2(4000) null /* C��������� */
/
alter  table MTZ.WEBS_NEWS add 
the_IsLocked
 NUMBER null 
 check (the_IsLocked in ( -1/* �� */
, 0/* ��� */ )) /* ������������� */
/
alter  table MTZ.WEBS_NEWS add 
IsShowHisory
 NUMBER null 
 check (IsShowHisory in ( -1/* �� */
, 0/* ��� */ )) /* ���������� ������� */
/
alter  table MTZ.WEBS_NEWS add 
NewsDate
 DATE null /* ���� */
/
alter  table MTZ.WEBS_NEWS add 
NewsDescription VARCHAR2(4000) null /* �������� */
/


/*��������*/
drop table MTZ.NEWS_PICS/**/ 
/
create table MTZ.NEWS_PICS/**/ (
ParentStructRowID CHAR(38) not null,
NEWS_PICSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* ����� ���������� ��������� */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.NEWS_PICS add 
Name
 VARCHAR2 (512) null /* �������� */
/
alter  table MTZ.NEWS_PICS add 
FileContent VARCHAR2(4000) null /* ���� */
/
alter  table MTZ.NEWS_PICS add 
 FileContent_EXT varchar2(4) null
/




