
/* --body*/

 
SELECT guid();



/*Суть сообщения*/
drop table MTZ.SrvMessageInfo/*Суть сообщения*/ 
/
create table MTZ.SrvMessageInfo/*Суть сообщения*/ (
InstanceID CHAR(38) ,
SrvMessageInfoid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.SrvMessageInfo add 
ForUser CHAR(38) null /* Для пользователя */
/
alter  table MTZ.SrvMessageInfo add 
msgDate
 DATE null /* Дата */
/
alter  table MTZ.SrvMessageInfo add 
MsgInfo VARCHAR2(4000) null /* Текст сообщения */
/
alter  table MTZ.SrvMessageInfo add 
TheDocument CHAR(38) null /* Документ */
/
alter  table MTZ.SrvMessageInfo add 
ReadTime
 DATE null /* Время прочтения */
/


/*Адресаты*/
drop table MTZ.STDMail_To/**/ 
/
create table MTZ.STDMail_To/**/ (
InstanceID CHAR(38) ,
STDMail_Toid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.STDMail_To add 
TheTo
 VARCHAR2 (255) null /* Адресат */
/
alter  table MTZ.STDMail_To add 
TheType
 NUMBER null 
 check (TheType in ( 0/* Кому */
, 2/* Скрытая копия */
, 1/* Копия */ )) /* Тип */
/


/*Вложения*/
drop table MTZ.STDMail_Attach/**/ 
/
create table MTZ.STDMail_Attach/**/ (
InstanceID CHAR(38) ,
STDMail_Attachid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.STDMail_Attach add 
TheName
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.STDMail_Attach add 
TheFile VARCHAR2(4000) null /* Файл */
/
alter  table MTZ.STDMail_Attach add 
 TheFile_EXT varchar2(4) null
/


/*Сообщение*/
drop table MTZ.STDMail_Info/**/ 
/
create table MTZ.STDMail_Info/**/ (
InstanceID CHAR(38) ,
STDMail_Infoid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.STDMail_Info add 
Subject
 VARCHAR2 (255) null /* Тема */
/
alter  table MTZ.STDMail_Info add 
TheBody VARCHAR2(4000) null /* Сообщение */
/
alter  table MTZ.STDMail_Info add 
TheFromName
 VARCHAR2 (255) null /* От имени */
/
alter  table MTZ.STDMail_Info add 
Sended
 NUMBER null 
 check (Sended in ( -1/* Да */
, 0/* Нет */ )) /* Отослано */
/
alter  table MTZ.STDMail_Info add 
IsDelete
 NUMBER null 
 check (IsDelete in ( -1/* Да */
, 0/* Нет */ )) /* Удалить после отправки */
/
alter  table MTZ.STDMail_Info add 
CreatedDT
 DATE null /* Создано */
/
alter  table MTZ.STDMail_Info add 
SentDT
 DATE null /* Отправлено */
/


/*Перемещения*/
drop table MTZ.ITTOPT_MOVE/*Необходимые перемещения*/ 
/
create table MTZ.ITTOPT_MOVE/*Необходимые перемещения*/ (
InstanceID CHAR(38) ,
ITTOPT_MOVEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTOPT_MOVE add 
sequence
 NUMBER null /* Номер */
/
alter  table MTZ.ITTOPT_MOVE add 
FromLocation
 VARCHAR2 (12) null /* Из ячейки */
/
alter  table MTZ.ITTOPT_MOVE add 
ToLocation
 VARCHAR2 (12) null /* В ячейку */
/
alter  table MTZ.ITTOPT_MOVE add 
ThePalletteNum
 VARCHAR2 (20) null /* Номер палеты */
/
alter  table MTZ.ITTOPT_MOVE add 
ISMoved
 NUMBER null 
 check (ISMoved in ( -1/* Да */
, 0/* Нет */ )) /* Перемещена */
/


/*Описание*/
drop table MTZ.ITTOPT_DEF/*Описание задания на оптимизацию*/ 
/
create table MTZ.ITTOPT_DEF/*Описание задания на оптимизацию*/ (
InstanceID CHAR(38) ,
ITTOPT_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTOPT_DEF add 
OptType CHAR(38) null /* Тип оптимизации */
/
alter  table MTZ.ITTOPT_DEF add 
TheClient
 VARCHAR2 (255) null /* Клиент */
/
alter  table MTZ.ITTOPT_DEF add 
good
 VARCHAR2 (255) null /* Товар */
/
alter  table MTZ.ITTOPT_DEF add 
made_country
 VARCHAR2 (255) null /* Страна производитель */
/
alter  table MTZ.ITTOPT_DEF add 
Factory
 VARCHAR2 (255) null /* Завод */
/
alter  table MTZ.ITTOPT_DEF add 
KILL_NUMBER
 VARCHAR2 (255) null /* № бойни */
/
alter  table MTZ.ITTOPT_DEF add 
IsBrak
 VARCHAR2 (20) null /* Брак */
/
alter  table MTZ.ITTOPT_DEF add 
OPtDate
 DATE null /* Дата создания заявки */
/
alter  table MTZ.ITTOPT_DEF add 
DateToOptimize
 DATE null /* Плановая дата оптимизации */
/


/*Зоны*/
drop table MTZ.Num_zones/*Зоны уникальных нумеров*/ 
/
create table MTZ.Num_zones/*Зоны уникальных нумеров*/ (
InstanceID CHAR(38) ,
Num_zonesid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.Num_zones add 
ZoneMask
 VARCHAR2 (255) null /* Маска зоны */
/


/*Номера*/
drop table MTZ.Num_Values/*уникальные номера*/ 
/
create table MTZ.Num_Values/*уникальные номера*/ (
ParentStructRowID CHAR(38) not null,
Num_Valuesid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.Num_Values add 
the_Value
 NUMBER null /* Значение */
/
alter  table MTZ.Num_Values add 
OwnerPartName
 VARCHAR2 (64) null /* Раздел */
/
alter  table MTZ.Num_Values add 
OwnerRowID CHAR(38) null /* Идентификатор строки */
/


/*Описание*/
drop table MTZ.Num_head/*Описание нумератора*/ 
/
create table MTZ.Num_head/*Описание нумератора*/ (
InstanceID CHAR(38) ,
Num_headid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.Num_head add 
Name
 VARCHAR2 (80) null /* Название */
/
alter  table MTZ.Num_head add 
Shema
 NUMBER null 
 check (Shema in ( 0/* Единая зона */
, 1/* По году */
, 4/* По дню */
, 2/* По кварталу */
, 3/* По месяцу */
, 10/* Произвольные зоны */ )) /* Схема нумерации */
/


/*Группа полей фильтра*/
drop table MTZ.FilterFieldGroup/*Группа полей фильтра*/ 
/
create table MTZ.FilterFieldGroup/*Группа полей фильтра*/ (
InstanceID CHAR(38) ,
FilterFieldGroupid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.FilterFieldGroup add 
sequence
 NUMBER null /* Последовательность */
/
alter  table MTZ.FilterFieldGroup add 
Name
 VARCHAR2 (64) null /* Название */
/
alter  table MTZ.FilterFieldGroup add 
Caption
 VARCHAR2 (255) null /* Заголовок */
/
alter  table MTZ.FilterFieldGroup add 
AllowIgnore
 NUMBER null 
 check (AllowIgnore in ( -1/* Да */
, 0/* Нет */ )) /* Можно отключать */
/


/*Поле фильтра*/
drop table MTZ.FileterField/*Поле фильтра*/ 
/
create table MTZ.FileterField/*Поле фильтра*/ (
ParentStructRowID CHAR(38) not null,
FileterFieldid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.FileterField add 
sequence
 NUMBER null /* Последовательность */
/
alter  table MTZ.FileterField add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.FileterField add 
Caption
 VARCHAR2 (255) null /* Заголовок */
/
alter  table MTZ.FileterField add 
FieldType CHAR(38) null /* Тип поля */
/
alter  table MTZ.FileterField add 
FieldSize
 NUMBER null /* Размер */
/
alter  table MTZ.FileterField add 
RefType
 NUMBER null 
 check (RefType in ( 2/* На строку раздела */
, 3/* На источник данных */
, 0/* Скалярное поле ( не ссылка) */
, 1/* На объект  */ )) /* Тип ссылки */
/
alter  table MTZ.FileterField add 
RefToType CHAR(38) null /* Тип, куда ссылаемся */
/
alter  table MTZ.FileterField add 
RefToPart CHAR(38) null /* Раздел, куда ссылаемся */
/
alter  table MTZ.FileterField add 
ValueArray
 NUMBER null 
 check (ValueArray in ( -1/* Да */
, 0/* Нет */ )) /* Массив значений */
/


/*Фильтр*/
drop table MTZ.Filters/*Фильтр*/ 
/
create table MTZ.Filters/*Фильтр*/ (
InstanceID CHAR(38) ,
Filtersid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.Filters add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.Filters add 
TheCaption
 VARCHAR2 (80) null /* Заголовок */
/
alter  table MTZ.Filters add 
TheComment VARCHAR2(4000) null /* Описание */
/


/*Дейсвие при смене*/
drop table MTZ.StateAction/*Дейсвие при смене*/ 
/
create table MTZ.StateAction/*Дейсвие при смене*/ (
InstanceID CHAR(38) ,
StateActionid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.StateAction add 
OnDocStatus CHAR(38) null /* При входе в состояие */
/
alter  table MTZ.StateAction add 
NewSecurityStyle CHAR(38) null /* Установить стиль защиты */
/
alter  table MTZ.StateAction add 
ClearSecurity
 NUMBER null 
 check (ClearSecurity in ( -1/* Да */
, 0/* Нет */ )) /* Сбросить стиль защиты */
/
alter  table MTZ.StateAction add 
LibraryFile
 VARCHAR2 (255) null /* Библиотека-обработчик */
/
alter  table MTZ.StateAction add 
ActionClass
 VARCHAR2 (255) null /* Класс для обработки */
/
alter  table MTZ.StateAction add 
ActionScript VARCHAR2(4000) null /* Скрипт для исполнения */
/


/*Тип вопроса в анкете*/
drop table MTZ.WEBSDIC_QTYPE/**/ 
/
create table MTZ.WEBSDIC_QTYPE/**/ (
InstanceID CHAR(38) ,
WEBSDIC_QTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBSDIC_QTYPE add 
Sequence
 NUMBER null /* Номер п/п */
/
alter  table MTZ.WEBSDIC_QTYPE add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.WEBSDIC_QTYPE add 
Template VARCHAR2(4000) null /* Трактовка */
/


/*Основные настройки*/
drop table MTZ.WEBSDIC_DEF/**/ 
/
create table MTZ.WEBSDIC_DEF/**/ (
InstanceID CHAR(38) ,
WEBSDIC_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBSDIC_DEF add 
WEBS CHAR(38) null /* Сайт */
/
alter  table MTZ.WEBSDIC_DEF add 
PathToFiles
 VARCHAR2 (2048) null /* Каталог для файлов */
/


/*Тип страницы*/
drop table MTZ.WEBSDIC_PAGETYPE/**/ 
/
create table MTZ.WEBSDIC_PAGETYPE/**/ (
InstanceID CHAR(38) ,
WEBSDIC_PAGETYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBSDIC_PAGETYPE add 
Sequence
 NUMBER null /* Номер п/п */
/
alter  table MTZ.WEBSDIC_PAGETYPE add 
Name
 VARCHAR2 (64) null /* Название */
/


/*Отложенное событие*/
drop table MTZ.MTZ2JOB_DEF/*Описание отложенного события*/ 
/
create table MTZ.MTZ2JOB_DEF/*Описание отложенного события*/ (
InstanceID CHAR(38) ,
MTZ2JOB_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.MTZ2JOB_DEF add 
EventDate
 DATE null /* Отложено до */
/
alter  table MTZ.MTZ2JOB_DEF add 
EvenType
 VARCHAR2 (255) null /* Тип события */
/
alter  table MTZ.MTZ2JOB_DEF add 
ThruObject CHAR(38) null /* Объект - причина события */
/
alter  table MTZ.MTZ2JOB_DEF add 
ThruState CHAR(38) null /* Состояние - причина */
/
alter  table MTZ.MTZ2JOB_DEF add 
NextState CHAR(38) null /* Состояние после обработки */
/
alter  table MTZ.MTZ2JOB_DEF add 
ProcessDate
 DATE null /* Момент обработки */
/
alter  table MTZ.MTZ2JOB_DEF add 
Processed
 NUMBER null 
 check (Processed in ( -1/* Да */
, 0/* Нет */ )) /* Обработан */
/


/*Очередь заблокированных объектов*/
drop table MTZ.REPD_LOCKED/*Очередь заблокированных объектов*/ 
/
create table MTZ.REPD_LOCKED/*Очередь заблокированных объектов*/ (
InstanceID CHAR(38) ,
REPD_LOCKEDid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.REPD_LOCKED add 
LastTry
 DATE null /* Последняя разработка */
/
alter  table MTZ.REPD_LOCKED add 
SourceFile
 VARCHAR2 (2048) null /* Файл данных */
/
alter  table MTZ.REPD_LOCKED add 
ReplicaRowID CHAR(38) null /* Идентификатор строки реплики */
/
alter  table MTZ.REPD_LOCKED add 
FirstTry
 DATE null /* Первая обработка */
/
alter  table MTZ.REPD_LOCKED add 
StructType
 VARCHAR2 (255) null /* Тип строки */
/
alter  table MTZ.REPD_LOCKED add 
ObjectType
 VARCHAR2 (255) null /* Тип объекта */
/
alter  table MTZ.REPD_LOCKED add 
The_RowID CHAR(38) null /* Идетнификатор строки */
/
alter  table MTZ.REPD_LOCKED add 
The_InstanceID CHAR(38) null /* Объект */
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


/*Запрос данных на объект\ строку*/
drop table MTZ.REPD_RequestQuery/*Запрос данных на объект\ строку*/ 
/
create table MTZ.REPD_RequestQuery/*Запрос данных на объект\ строку*/ (
InstanceID CHAR(38) ,
REPD_RequestQueryid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
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


/*Результат запроса*/
drop table MTZ.REPD_ResQueryRcv/*Результат запроса*/ 
/
create table MTZ.REPD_ResQueryRcv/*Результат запроса*/ (
ParentStructRowID CHAR(38) not null,
REPD_ResQueryRcvid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.REPD_ResQueryRcv add 
ReceiveRec CHAR(38) null /* ReceiveRec */
/


/*Провайдер репликациии*/
drop table MTZ.REPD_PROV/*Провайдер репликациии*/ 
/
create table MTZ.REPD_PROV/*Провайдер репликациии*/ (
InstanceID CHAR(38) ,
REPD_PROVid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
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


/*Узлы репликации*/
drop table MTZ.REPD_SRV/*Узлы репликации*/ 
/
create table MTZ.REPD_SRV/*Узлы репликации*/ (
InstanceID CHAR(38) ,
REPD_SRVid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
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
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.REPD_SRV add 
Obj2 CHAR(38) null /* Obj2 */
/
alter  table MTZ.REPD_SRV add 
Obj1 CHAR(38) null /* Obj1 */
/


/*Получатели реплик*/
drop table MTZ.REPD_SNDTO/*Получатели реплик*/ 
/
create table MTZ.REPD_SNDTO/*Получатели реплик*/ (
ParentStructRowID CHAR(38) not null,
REPD_SNDTOid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
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
 DATE null /* Начало работы (время) */
/
alter  table MTZ.REPD_SNDTO add 
Work_End
 DATE null /* Окончание работы (время) */
/
alter  table MTZ.REPD_SNDTO add 
The_Interval
 NUMBER null /* Интервал */
/
alter  table MTZ.REPD_SNDTO add 
IsActive
 NUMBER null 
 check (IsActive in ( -1/* Да */
, 0/* Нет */ )) /* Активен */
/
alter  table MTZ.REPD_SNDTO add 
LastApproveLog
 DATE null /* Последнее подтверждение (лог) */
/


/*Константы к запросу*/
drop table MTZ.REPD_CONST/**/ 
/
create table MTZ.REPD_CONST/**/ (
ParentStructRowID CHAR(38) not null,
REPD_CONSTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.REPD_CONST add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.REPD_CONST add 
TheValue
 VARCHAR2 (255) null /* Значение */
/


/*Тип репликации документов*/
drop table MTZ.REPD_REPTYPE/*Описание типа репликации документов для узла*/ 
/
create table MTZ.REPD_REPTYPE/*Описание типа репликации документов для узла*/ (
ParentStructRowID CHAR(38) not null,
REPD_REPTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.REPD_REPTYPE add 
ReplicaType
 NUMBER null 
 check (ReplicaType in ( 0/* Весь документ */
, 2/* Локальный */
, 1/* Построчно */ )) /* Тип репликации */
/
alter  table MTZ.REPD_REPTYPE add 
TheObjectType CHAR(38) null /* Тип объекта */
/
alter  table MTZ.REPD_REPTYPE add 
UseFilter
 NUMBER null 
 check (UseFilter in ( -1/* Да */
, 0/* Нет */ )) /* Фильтровать по условию */
/
alter  table MTZ.REPD_REPTYPE add 
RepConditonQRY VARCHAR2(4000) null /* Условие репликации */
/


/*Очередь отсылки*/
drop table MTZ.REPD_SendQ/*Очередь отсылки*/ 
/
create table MTZ.REPD_SendQ/*Очередь отсылки*/ (
InstanceID CHAR(38) ,
REPD_SendQid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
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
 check (Acknowelge in ( -1/* Да */
, 0/* Нет */ )) /* Acknowelge */
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
 NUMBER null /* Количество частей */
/
alter  table MTZ.REPD_SendQ add 
PartNumber
 NUMBER null /* Часть */
/
alter  table MTZ.REPD_SendQ add 
Sent
 NUMBER null 
 check (Sent in ( 1/* Да */
, 0/* Нет */ )) /* Sent */
/
alter  table MTZ.REPD_SendQ add 
ReplicatorPointer
 DATE null /* Указатель репликации */
/


/*Очередь полученых реплик*/
drop table MTZ.REPD_RecvQ/*Очередь полученых реплик*/ 
/
create table MTZ.REPD_RecvQ/*Очередь полученых реплик*/ (
InstanceID CHAR(38) ,
REPD_RecvQid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
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
 check (Acknowelge in ( -1/* Да */
, 0/* Нет */ )) /* Acknowelge */
/
alter  table MTZ.REPD_RecvQ add 
ReplicaPackID CHAR(38) null /* ReplicaPackID */
/
alter  table MTZ.REPD_RecvQ add 
PartCount
 NUMBER null /* Количество частей */
/
alter  table MTZ.REPD_RecvQ add 
PartNumber
 NUMBER null /* Часть */
/
alter  table MTZ.REPD_RecvQ add 
FileName
 VARCHAR2 (1024) null /* FileName */
/
alter  table MTZ.REPD_RecvQ add 
Completed
 NUMBER null 
 check (Completed in ( -1/* Да */
, 0/* Нет */ )) /* Completed */
/


/*Статистика  посещений сайта*/
drop table MTZ.ST_MAIN/**/ 
/
create table MTZ.ST_MAIN/**/ (
InstanceID CHAR(38) ,
ST_MAINid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ST_MAIN add 
AccessDate
 DATE null /* Дата */
/
alter  table MTZ.ST_MAIN add 
UrlReferer
 VARCHAR2 (1024) null /* Предыдущий адрес */
/
alter  table MTZ.ST_MAIN add 
UserAgent
 VARCHAR2 (256) null /* Интернет агент */
/
alter  table MTZ.ST_MAIN add 
UserHostAddress
 VARCHAR2 (512) null /* Адрес хоста */
/
alter  table MTZ.ST_MAIN add 
UserHostName
 VARCHAR2 (512) null /* Имя хоста */
/
alter  table MTZ.ST_MAIN add 
the_Description
 VARCHAR2 (1024) null /* Примечания */
/
alter  table MTZ.ST_MAIN add 
WEBS_Page CHAR(38) null /* Стартовая страница */
/


/*Описание*/
drop table MTZ.ST_DEF/**/ 
/
create table MTZ.ST_DEF/**/ (
InstanceID CHAR(38) ,
ST_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ST_DEF add 
Name
 VARCHAR2 (1024) null /* Имя */
/
alter  table MTZ.ST_DEF add 
WEBS CHAR(38) null /* Сайт */
/
alter  table MTZ.ST_DEF add 
the_Description
 VARCHAR2 (4000) null /* Примечания */
/
alter  table MTZ.ST_DEF add 
IsActive
 NUMBER null 
 check (IsActive in ( -1/* Да */
, 0/* Нет */ )) /* Активна */
/


/*Статистика посещений страниц сайта*/
drop table MTZ.ST_PAGES/**/ 
/
create table MTZ.ST_PAGES/**/ (
InstanceID CHAR(38) ,
ST_PAGESid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ST_PAGES add 
AccessDate
 DATE null /* Дата */
/
alter  table MTZ.ST_PAGES add 
UrlReferer
 VARCHAR2 (1024) null /* Предыдущий адрес */
/
alter  table MTZ.ST_PAGES add 
UserAgent
 VARCHAR2 (256) null /* Интернет агент */
/
alter  table MTZ.ST_PAGES add 
UserHostAddress
 VARCHAR2 (512) null /* Адрес хоста */
/
alter  table MTZ.ST_PAGES add 
UserHostName
 VARCHAR2 (512) null /* Имя хоста */
/
alter  table MTZ.ST_PAGES add 
the_Description
 VARCHAR2 (1024) null /* Примечания */
/
alter  table MTZ.ST_PAGES add 
WEBS_Page CHAR(38) null /* Стартовая страница */
/


/*Параметры выморозки*/
drop table MTZ.ITTD_MOROZ/*Параметры выморозки*/ 
/
create table MTZ.ITTD_MOROZ/*Параметры выморозки*/ (
InstanceID CHAR(38) ,
ITTD_MOROZid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_MOROZ add 
TheClient VARCHAR2(4000) null /* Клиент */
/
alter  table MTZ.ITTD_MOROZ add 
WeightConst
 NUMBER null /* Точность весов */
/
alter  table MTZ.ITTD_MOROZ add 
MorozConst
 NUMBER null /* Коэффициент выморозки */
/


/*Правило формирования партии*/
drop table MTZ.ITTD_RULE/*Правило по которому зполняются обязательные поля
и составляется код партии*/ 
/
create table MTZ.ITTD_RULE/*Правило по которому зполняются обязательные поля
и составляется код партии*/ (
InstanceID CHAR(38) ,
ITTD_RULEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_RULE add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.ITTD_RULE add 
UseProduct
 NUMBER null 
 check (UseProduct in ( -1/* Да */
, 0/* Нет */ )) /* Товар */
/
alter  table MTZ.ITTD_RULE add 
TheCountry
 NUMBER null 
 check (TheCountry in ( -1/* Да */
, 0/* Нет */ )) /* Страна */
/
alter  table MTZ.ITTD_RULE add 
TheFactory
 NUMBER null 
 check (TheFactory in ( -1/* Да */
, 0/* Нет */ )) /* Завод */
/
alter  table MTZ.ITTD_RULE add 
KillPlace
 NUMBER null 
 check (KillPlace in ( -1/* Да */
, 0/* Нет */ )) /* Бойня */
/
alter  table MTZ.ITTD_RULE add 
UseBrak
 NUMBER null 
 check (UseBrak in ( -1/* Да */
, 0/* Нет */ )) /* Брак */
/
alter  table MTZ.ITTD_RULE add 
UseExpDate
 NUMBER null 
 check (UseExpDate in ( -1/* Да */
, 0/* Нет */ )) /* Срок годности */
/


/*Тип палеты*/
drop table MTZ.ITTD_PLTYPE/**/ 
/
create table MTZ.ITTD_PLTYPE/**/ (
InstanceID CHAR(38) ,
ITTD_PLTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_PLTYPE add 
Name
 VARCHAR2 (255) null /* Название */
/


/*Завод*/
drop table MTZ.ITTD_FACTORY/**/ 
/
create table MTZ.ITTD_FACTORY/**/ (
InstanceID CHAR(38) ,
ITTD_FACTORYid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_FACTORY add 
Country CHAR(38) null /* Страна */
/
alter  table MTZ.ITTD_FACTORY add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.ITTD_FACTORY add 
Code1
 VARCHAR2 (10) null /* Код1 */
/
alter  table MTZ.ITTD_FACTORY add 
Code2
 VARCHAR2 (10) null /* Код 2 */
/


/*Тип зоны*/
drop table MTZ.ITTD_ZTYPE/**/ 
/
create table MTZ.ITTD_ZTYPE/**/ (
InstanceID CHAR(38) ,
ITTD_ZTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_ZTYPE add 
Name
 VARCHAR2 (255) null /* Название */
/


/*Тип товара*/
drop table MTZ.ITTD_GTYPE/**/ 
/
create table MTZ.ITTD_GTYPE/**/ (
InstanceID CHAR(38) ,
ITTD_GTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_GTYPE add 
Name
 VARCHAR2 (255) null /* Название */
/


/*Бойня*/
drop table MTZ.ITTD_KILLPLACE/**/ 
/
create table MTZ.ITTD_KILLPLACE/**/ (
InstanceID CHAR(38) ,
ITTD_KILLPLACEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_KILLPLACE add 
Factory CHAR(38) null /* Производитель */
/
alter  table MTZ.ITTD_KILLPLACE add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.ITTD_KILLPLACE add 
Code1
 VARCHAR2 (10) null /* Код1 */
/
alter  table MTZ.ITTD_KILLPLACE add 
Code2
 VARCHAR2 (10) null /* Код 2 */
/


/*Страна*/
drop table MTZ.ITTD_COUNTRY/**/ 
/
create table MTZ.ITTD_COUNTRY/**/ (
InstanceID CHAR(38) ,
ITTD_COUNTRYid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_COUNTRY add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.ITTD_COUNTRY add 
Code1
 VARCHAR2 (10) null /* Код1 */
/
alter  table MTZ.ITTD_COUNTRY add 
Code2
 VARCHAR2 (10) null /* Код 2 */
/
alter  table MTZ.ITTD_COUNTRY add 
TheSupplier
 VARCHAR2 (255) null /* Поставщик */
/


/*Тип заявки*/
drop table MTZ.ITTD_QTYPE/**/ 
/
create table MTZ.ITTD_QTYPE/**/ (
InstanceID CHAR(38) ,
ITTD_QTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_QTYPE add 
Name
 VARCHAR2 (255) null /* Название */
/


/*Холодильные камеры*/
drop table MTZ.ITTD_CAMERA/*Холодильные камеры*/ 
/
create table MTZ.ITTD_CAMERA/*Холодильные камеры*/ (
InstanceID CHAR(38) ,
ITTD_CAMERAid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_CAMERA add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.ITTD_CAMERA add 
CameraMask
 VARCHAR2 (12) null /* Маска номера ячеек */
/


/*Услуги*/
drop table MTZ.ITTD_SRV/**/ 
/
create table MTZ.ITTD_SRV/**/ (
InstanceID CHAR(38) ,
ITTD_SRVid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_SRV add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.ITTD_SRV add 
ForShipping
 NUMBER null 
 check (ForShipping in ( -1/* Да */
, 0/* Нет */ )) /* Для отгрузки */
/
alter  table MTZ.ITTD_SRV add 
ForReceiving
 NUMBER null 
 check (ForReceiving in ( -1/* Да */
, 0/* Нет */ )) /* Для приема товара */
/
alter  table MTZ.ITTD_SRV add 
LinkCode
 VARCHAR2 (30) null /* Код привязки */
/
alter  table MTZ.ITTD_SRV add 
AutoSetPallet
 NUMBER null 
 check (AutoSetPallet in ( -1/* Да */
, 0/* Нет */ )) /* Подставлять кол-во паллет */
/


/*Тип операции*/
drop table MTZ.ITTD_ATYPE/**/ 
/
create table MTZ.ITTD_ATYPE/**/ (
InstanceID CHAR(38) ,
ITTD_ATYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_ATYPE add 
Name
 VARCHAR2 (255) null /* Название */
/


/*Тип оптимизации*/
drop table MTZ.ITTD_OPTTYPE/*Тип оптимизации склада*/ 
/
create table MTZ.ITTD_OPTTYPE/*Тип оптимизации склада*/ (
InstanceID CHAR(38) ,
ITTD_OPTTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_OPTTYPE add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.ITTD_OPTTYPE add 
Code
 VARCHAR2 (1) null /* Код варианта */
/


/*Почтовые адреса*/
drop table MTZ.ITTD_EMAIL/*Адреса получателей информации о выморозке*/ 
/
create table MTZ.ITTD_EMAIL/*Адреса получателей информации о выморозке*/ (
InstanceID CHAR(38) ,
ITTD_EMAILid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_EMAIL add 
FIO
 VARCHAR2 (255) null /* ФИО. получателя */
/
alter  table MTZ.ITTD_EMAIL add 
EMAIL VARCHAR2(255) null /* Адрес электронной почты */
/
alter  table MTZ.ITTD_EMAIL add 
IgnoreAddress
 NUMBER null 
 check (IgnoreAddress in ( -1/* Да */
, 0/* Нет */ )) /* Отключить уведомления на этот адрес */
/


/*Партия товара*/
drop table MTZ.ITTD_PART/**/ 
/
create table MTZ.ITTD_PART/**/ (
InstanceID CHAR(38) ,
ITTD_PARTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTD_PART add 
TheGood VARCHAR2(4000) null /* Товар */
/
alter  table MTZ.ITTD_PART add 
Name
 VARCHAR2 (255) null /* Наименование партии */
/


/*Описание*/
drop table MTZ.ITTPL_DEF/**/ 
/
create table MTZ.ITTPL_DEF/**/ (
InstanceID CHAR(38) ,
ITTPL_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTPL_DEF add 
Code
 VARCHAR2 (14) null /* Код палеты */
/
alter  table MTZ.ITTPL_DEF add 
TheNumber
 NUMBER null /* Номер */
/
alter  table MTZ.ITTPL_DEF add 
PalKode
 VARCHAR2 (30) null /* Штрихкод */
/
alter  table MTZ.ITTPL_DEF add 
Weight
 NUMBER null /* Вес паддона */
/
alter  table MTZ.ITTPL_DEF add 
Pltype CHAR(38) null /* Тип палеты */
/
alter  table MTZ.ITTPL_DEF add 
WDate
 DATE null /* Дата взвешивания */
/
alter  table MTZ.ITTPL_DEF add 
CaliberQuantity
 NUMBER null /* Количество коробов на поддоне */
/
alter  table MTZ.ITTPL_DEF add 
CurrentGood VARCHAR2(4000) null /* Текущий товар */
/
alter  table MTZ.ITTPL_DEF add 
CurrentWeightBrutto
 NUMBER null /* Вес поддона с товаром */
/
alter  table MTZ.ITTPL_DEF add 
CurrentPosition
 VARCHAR2 (12) null /* Текущая ячейка склада */
/
alter  table MTZ.ITTPL_DEF add 
PackageWeight
 NUMBER null /* Вес упаковки */
/
alter  table MTZ.ITTPL_DEF add 
CorePalette_ID
 NUMBER null /* Идентификатор палеты в CoreIMS */
/
alter  table MTZ.ITTPL_DEF add 
PrivatePalet
 NUMBER null 
 check (PrivatePalet in ( -1/* Да */
, 0/* Нет */ )) /* Чужой поддон */
/


/*Операторы*/
drop table MTZ.ITTOP_OPLNK/*Привязка операторов*/ 
/
create table MTZ.ITTOP_OPLNK/*Привязка операторов*/ (
InstanceID CHAR(38) ,
ITTOP_OPLNKid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTOP_OPLNK add 
TheUser CHAR(38) null /* Пользователь */
/


/*Холодильные камеры*/
drop table MTZ.ITTOP_OPKAM/*Камеры, с которыми работает оператор*/ 
/
create table MTZ.ITTOP_OPKAM/*Камеры, с которыми работает оператор*/ (
ParentStructRowID CHAR(38) not null,
ITTOP_OPKAMid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTOP_OPKAM add 
TheKamera CHAR(38) null /* Камера */
/


/*Кладовщики*/
drop table MTZ.ITTOP_KLNK/*Привязка кладовщиков*/ 
/
create table MTZ.ITTOP_KLNK/*Привязка кладовщиков*/ (
InstanceID CHAR(38) ,
ITTOP_KLNKid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTOP_KLNK add 
TheUser CHAR(38) null /* Пользователь */
/


/*Холодильные камеры*/
drop table MTZ.ITTOP_KCAM/*Привязка кладовщика к холодильным камерам*/ 
/
create table MTZ.ITTOP_KCAM/*Привязка кладовщика к холодильным камерам*/ (
ParentStructRowID CHAR(38) not null,
ITTOP_KCAMid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTOP_KCAM add 
TheKamera CHAR(38) null /* Камера */
/


/*Клиенты*/
drop table MTZ.ITTOP_KCLI/*привязка кладвщиков к клиентам*/ 
/
create table MTZ.ITTOP_KCLI/*привязка кладвщиков к клиентам*/ (
ParentStructRowID CHAR(38) not null,
ITTOP_KCLIid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTOP_KCLI add 
TheClient VARCHAR2(4000) null /* Клиент */
/


/*Максимальные номера объектов*/
drop table MTZ.ITTFN_MAX/**/ 
/
create table MTZ.ITTFN_MAX/**/ (
InstanceID CHAR(38) ,
ITTFN_MAXid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTFN_MAX add 
PalMaxNum
 NUMBER null /* Максимальный номер поддона */
/


/*Описание расширения Журнал*/
drop table MTZ.STDJournlaExtInfo/**/ 
/
create table MTZ.STDJournlaExtInfo/**/ (
InstanceID CHAR(38) ,
STDJournlaExtInfoid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.STDJournlaExtInfo add 
TheName
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.STDJournlaExtInfo add 
TheJournalRef CHAR(38) null /* Журнал */
/


/*Параметры*/
drop table MTZ.STDJournalExtParam/**/ 
/
create table MTZ.STDJournalExtParam/**/ (
InstanceID CHAR(38) ,
STDJournalExtParamid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.STDJournalExtParam add 
FieldName
 VARCHAR2 (255) null /* Поле (значение) */
/
alter  table MTZ.STDJournalExtParam add 
ParamName
 VARCHAR2 (80) null /* Параметр */
/
alter  table MTZ.STDJournalExtParam add 
TargetPlatform CHAR(38) null /* Целевая платформа */
/


/*Фильтры журнала*/
drop table MTZ.STDJournalExtFlt/**/ 
/
create table MTZ.STDJournalExtFlt/**/ (
InstanceID CHAR(38) ,
STDJournalExtFltid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.STDJournalExtFlt add 
ViewSource
 VARCHAR2 (255) null /* Источник журнала */
/


/*Параметры фильтра*/
drop table MTZ.STDJournalExtField/**/ 
/
create table MTZ.STDJournalExtField/**/ (
ParentStructRowID CHAR(38) not null,
STDJournalExtFieldid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.STDJournalExtField add 
ViewField
 VARCHAR2 (255) null /* Колонка журнала */
/
alter  table MTZ.STDJournalExtField add 
FieldSource
 VARCHAR2 (255) null /* Поле */
/
alter  table MTZ.STDJournalExtField add 
TargetPlatform CHAR(38) null /* Целевая платформа */
/
alter  table MTZ.STDJournalExtField add 
ConstantValue
 VARCHAR2 (255) null /* Значение */
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
, 0/* none */ )) /* Условие */
/


/*Настройка*/
drop table MTZ.Ext_Photos/**/ 
/
create table MTZ.Ext_Photos/**/ (
InstanceID CHAR(38) ,
Ext_Photosid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.Ext_Photos add 
TheName
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.Ext_Photos add 
TheSourceObject
 VARCHAR2 (255) null /* Исходный объект (Тип) */
/
alter  table MTZ.Ext_Photos add 
TheJournal CHAR(38) null /* Журнал */
/
alter  table MTZ.Ext_Photos add 
TheReplacedPart
 VARCHAR2 (255) null /* Подменяемая часть */
/
alter  table MTZ.Ext_Photos add 
TheRefFieldName
 VARCHAR2 (255) null /* Поле ссылка на добавление */
/


/*Вызов изображения*/
drop table MTZ.Ext_Photo_Call/**/ 
/
create table MTZ.Ext_Photo_Call/**/ (
ParentStructRowID CHAR(38) not null,
Ext_Photo_Callid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
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
 VARCHAR2 (255) null /* Вызов */
/


/*Тип поля*/
drop table MTZ.FIELDTYPE/*Типы полей, перечисления, интервалы*/ 
/
create table MTZ.FIELDTYPE/*Типы полей, перечисления, интервалы*/ (
InstanceID CHAR(38) ,
FIELDTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.FIELDTYPE add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.FIELDTYPE add 
TypeStyle
 NUMBER null 
 check (TypeStyle in ( 3/* Интервал */
, 5/* Элемент оформления */
, 0/* Скалярный тип */
, 4/* Ссылка */
, 2/* Перечисление */
, 1/* Выражение */ )) /* Трактовка */
/
alter  table MTZ.FIELDTYPE add 
the_Comment VARCHAR2(4000) null /* Описание */
/
alter  table MTZ.FIELDTYPE add 
AllowSize
 NUMBER null 
 check (AllowSize in ( -1/* Да */
, 0/* Нет */ )) /* Нужен размер */
/
alter  table MTZ.FIELDTYPE add 
Minimum
 VARCHAR2 (64) null /* Минимум */
/
alter  table MTZ.FIELDTYPE add 
Maximum
 VARCHAR2 (64) null /* Максимум */
/
alter  table MTZ.FIELDTYPE add 
AllowLikeSearch
 NUMBER null 
 check (AllowLikeSearch in ( -1/* Да */
, 0/* Нет */ )) /* Поиск текста */
/
alter  table MTZ.FIELDTYPE add 
GridSortType
 NUMBER null 
 check (GridSortType in ( 0/* As String */
, 1/* As Numeric */
, 2/* As Date */ )) /* Вариант сортировки в табличном представлении */
/


/*Отображение*/
drop table MTZ.FIELDTYPEMAP/*Отображение типа поля на физический тип хранения*/ 
/
create table MTZ.FIELDTYPEMAP/*Отображение типа поля на физический тип хранения*/ (
ParentStructRowID CHAR(38) not null,
FIELDTYPEMAPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.FIELDTYPEMAP add 
Target CHAR(38) null /* Платформа */
/
alter  table MTZ.FIELDTYPEMAP add 
StoageType
 VARCHAR2 (255) null /* Тип хранения */
/
alter  table MTZ.FIELDTYPEMAP add 
FixedSize
 NUMBER null /* Размер */
/


/*Зачения*/
drop table MTZ.ENUMITEM/*Для описания Enum типов*/ 
/
create table MTZ.ENUMITEM/*Для описания Enum типов*/ (
ParentStructRowID CHAR(38) not null,
ENUMITEMid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ENUMITEM add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.ENUMITEM add 
NameValue
 NUMBER null /* Значение */
/
alter  table MTZ.ENUMITEM add 
NameInCode
 VARCHAR2 (100) null /* Название в коде */
/


/*Методы и процедуры*/
drop table MTZ.SHAREDMETHOD/*Методы и процедуры*/ 
/
create table MTZ.SHAREDMETHOD/*Методы и процедуры*/ (
InstanceID CHAR(38) ,
SHAREDMETHODid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.SHAREDMETHOD add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.SHAREDMETHOD add 
the_Comment VARCHAR2(4000) null /* Описание метода */
/
alter  table MTZ.SHAREDMETHOD add 
ReturnType CHAR(38) null /* Возвращаемый тип */
/


/*Реализация*/
drop table MTZ.SCRIPT/*Код метода на понятном конкретному генератору языке*/ 
/
create table MTZ.SCRIPT/*Код метода на понятном конкретному генератору языке*/ (
ParentStructRowID CHAR(38) not null,
SCRIPTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.SCRIPT add 
Target CHAR(38) null /* Целевая платформа */
/
alter  table MTZ.SCRIPT add 
Code VARCHAR2(4000) null /* Скрипт */
/


/*Параметры*/
drop table MTZ.PARAMETERS/*Параметры метода*/ 
/
create table MTZ.PARAMETERS/*Параметры метода*/ (
ParentStructRowID CHAR(38) not null,
PARAMETERSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.PARAMETERS add 
sequence
 NUMBER null /* Последовательность */
/
alter  table MTZ.PARAMETERS add 
Name
 VARCHAR2 (80) null /* Имя */
/
alter  table MTZ.PARAMETERS add 
Caption
 VARCHAR2 (80) null /* Заголовок */
/
alter  table MTZ.PARAMETERS add 
TypeOfParm CHAR(38) null /* Тип данных */
/
alter  table MTZ.PARAMETERS add 
DataSize
 NUMBER null /* Размер */
/
alter  table MTZ.PARAMETERS add 
AllowNull
 NUMBER null 
 check (AllowNull in ( -1/* Да */
, 0/* Нет */ )) /* Можно не задавать */
/
alter  table MTZ.PARAMETERS add 
OutParam
 NUMBER null 
 check (OutParam in ( -1/* Да */
, 0/* Нет */ )) /* Возвращает значение */
/
alter  table MTZ.PARAMETERS add 
ReferenceType
 NUMBER null 
 check (ReferenceType in ( 2/* На строку раздела */
, 3/* На источник данных */
, 0/* Скалярное поле ( не ссылка) */
, 1/* На объект  */ )) /* Тип ссылки */
/
alter  table MTZ.PARAMETERS add 
RefToType CHAR(38) null /* Ссылка на тип */
/
alter  table MTZ.PARAMETERS add 
RefToPart CHAR(38) null /* Ссылка на раздел */
/


/*Тип объекта*/
drop table MTZ.OBJECTTYPE/*Тип объекта (карточки)*/ 
/
create table MTZ.OBJECTTYPE/*Тип объекта (карточки)*/ (
InstanceID CHAR(38) ,
OBJECTTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.OBJECTTYPE add 
Package CHAR(38) null /* Приложение */
/
alter  table MTZ.OBJECTTYPE add 
the_Comment
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.OBJECTTYPE add 
Name
 VARCHAR2 (14) null /* Код */
/
alter  table MTZ.OBJECTTYPE add 
IsSingleInstance
 NUMBER null 
 check (IsSingleInstance in ( -1/* Да */
, 0/* Нет */ )) /* Допускается только один объект */
/
alter  table MTZ.OBJECTTYPE add 
ChooseView CHAR(38) null /* Представление для выбора */
/
alter  table MTZ.OBJECTTYPE add 
OnRun CHAR(38) null /* При запуске */
/
alter  table MTZ.OBJECTTYPE add 
OnCreate CHAR(38) null /* При создании */
/
alter  table MTZ.OBJECTTYPE add 
OnDelete CHAR(38) null /* При удалении */
/
alter  table MTZ.OBJECTTYPE add 
AllowRefToObject
 NUMBER null 
 check (AllowRefToObject in ( -1/* Да */
, 0/* Нет */ )) /* Отображать при выборе ссылки */
/
alter  table MTZ.OBJECTTYPE add 
AllowSearch
 NUMBER null 
 check (AllowSearch in ( -1/* Да */
, 0/* Нет */ )) /* Отображать при поиске */
/
alter  table MTZ.OBJECTTYPE add 
ReplicaType
 NUMBER null 
 check (ReplicaType in ( 0/* Весь документ */
, 2/* Локальный */
, 1/* Построчно */ )) /* Тип репликации */
/
alter  table MTZ.OBJECTTYPE add 
TheComment VARCHAR2(4000) null /* Описание */
/


/*Раздел*/
drop table MTZ.PART/*Раздел объекта*/ 
/
create table MTZ.PART/*Раздел объекта*/ (
ParentStructRowID CHAR(38) not null,
PARTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
/
alter  table MTZ.PART add 
Sequence
 NUMBER null /* № п/п */
/
alter  table MTZ.PART add 
PartType
 NUMBER null 
 check (PartType in ( 3/* Расширение */
, 1/* Коллекция */
, 0/* Строка */
, 2/* Дерево */
, 4/* Расширение с данными */ )) /* Тип структры  */
/
alter  table MTZ.PART add 
Caption
 VARCHAR2 (255) null /* Заголовок */
/
alter  table MTZ.PART add 
Name
 VARCHAR2 (20) null /* Название */
/
alter  table MTZ.PART add 
the_Comment VARCHAR2(4000) null /* Описание */
/
alter  table MTZ.PART add 
NoLog
 NUMBER null 
 check (NoLog in ( -1/* Да */
, 0/* Нет */ )) /* Не записывать в журнал */
/
alter  table MTZ.PART add 
ManualRegister
 NUMBER null 
 check (ManualRegister in ( -1/* Да */
, 0/* Нет */ )) /* Исключить из индексирования */
/
alter  table MTZ.PART add 
OnCreate CHAR(38) null /* При создании */
/
alter  table MTZ.PART add 
OnSave CHAR(38) null /* При сохранении */
/
alter  table MTZ.PART add 
OnRun CHAR(38) null /* При открытии */
/
alter  table MTZ.PART add 
OnDelete CHAR(38) null /* При удалении */
/
alter  table MTZ.PART add 
AddBehaivor
 NUMBER null 
 check (AddBehaivor in ( 0/* AddForm */
, 2/* RunAction */
, 1/* RefreshOnly */ )) /* Поведение при добавлении */
/
alter  table MTZ.PART add 
ExtenderObject CHAR(38) null /* Объект расширения */
/
alter  table MTZ.PART add 
shablonBrief
 VARCHAR2 (100) null /* Шаблон для краткого отображения */
/
alter  table MTZ.PART add 
ruleBrief
 VARCHAR (500) null /* Правило составления BRIEF поля */
/
alter  table MTZ.PART add 
IsJormalChange
 NUMBER null 
 check (IsJormalChange in ( -1/* Да */
, 0/* Нет */ )) /* Вести журнал изменений */
/


/*Методы раздела*/
drop table MTZ.PARTMENU/*Методы уровня раздела*/ 
/
create table MTZ.PARTMENU/*Методы уровня раздела*/ (
ParentStructRowID CHAR(38) not null,
PARTMENUid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.PARTMENU add 
Name
 VARCHAR2 (64) null /* Название */
/
alter  table MTZ.PARTMENU add 
Caption
 VARCHAR2 (80) null /* Заголовок */
/
alter  table MTZ.PARTMENU add 
ToolTip
 VARCHAR2 (80) null /* Подсказка */
/
alter  table MTZ.PARTMENU add 
the_Action CHAR(38) null /* Метод */
/
alter  table MTZ.PARTMENU add 
IsMenuItem
 NUMBER null 
 check (IsMenuItem in ( -1/* Да */
, 0/* Нет */ )) /* Включать в меню */
/
alter  table MTZ.PARTMENU add 
IsToolBarButton
 NUMBER null 
 check (IsToolBarButton in ( -1/* Да */
, 0/* Нет */ )) /* В тулбар */
/
alter  table MTZ.PARTMENU add 
HotKey
 VARCHAR2 (20) null /* Горячая клавиша */
/


/*Отображение параметров*/
drop table MTZ.PARTPARAMMAP/*отображение значений полей раздела на параметры метода*/ 
/
create table MTZ.PARTPARAMMAP/*отображение значений полей раздела на параметры метода*/ (
ParentStructRowID CHAR(38) not null,
PARTPARAMMAPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.PARTPARAMMAP add 
FieldName
 VARCHAR2 (255) null /* Поле (значение) */
/
alter  table MTZ.PARTPARAMMAP add 
ParamName
 VARCHAR2 (80) null /* Параметр */
/
alter  table MTZ.PARTPARAMMAP add 
NoEdit
 NUMBER null 
 check (NoEdit in ( -1/* Да */
, 0/* Нет */ )) /* Редактировать параметр нельзя */
/


/*Поле*/
drop table MTZ.FIELD/*Поле*/ 
/
create table MTZ.FIELD/*Поле*/ (
ParentStructRowID CHAR(38) not null,
FIELDid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.FIELD add 
Sequence
 NUMBER null /* № п/п */
/
alter  table MTZ.FIELD add 
Caption
 VARCHAR2 (80) null /* Надпись */
/
alter  table MTZ.FIELD add 
Name
 VARCHAR2 (64) null /* Имя поля */
/
alter  table MTZ.FIELD add 
FieldType CHAR(38) null /* Тип поля */
/
alter  table MTZ.FIELD add 
IsBrief
 NUMBER null 
 check (IsBrief in ( -1/* Да */
, 0/* Нет */ )) /* Краткая информация */
/
alter  table MTZ.FIELD add 
AllowNull
 NUMBER null 
 check (AllowNull in ( -1/* Да */
, 0/* Нет */ )) /* Может быть пустым */
/
alter  table MTZ.FIELD add 
DataSize
 NUMBER null /* Размер поля */
/
alter  table MTZ.FIELD add 
ReferenceType
 NUMBER null 
 check (ReferenceType in ( 2/* На строку раздела */
, 3/* На источник данных */
, 0/* Скалярное поле ( не ссылка) */
, 1/* На объект  */ )) /* Тип ссылки */
/
alter  table MTZ.FIELD add 
RefToType CHAR(38) null /* Ссылка на тип */
/
alter  table MTZ.FIELD add 
RefToPart CHAR(38) null /* Ссылка на раздел */
/
alter  table MTZ.FIELD add 
TheMask
 VARCHAR2 (255) null /* Маска ввода */
/
alter  table MTZ.FIELD add 
InternalReference
 NUMBER null 
 check (InternalReference in ( -1/* Да */
, 0/* Нет */ )) /* Ссылка в пределах объекта */
/
alter  table MTZ.FIELD add 
CreateRefOnly
 NUMBER null 
 check (CreateRefOnly in ( -1/* Да */
, 0/* Нет */ )) /* Только создание объекта */
/
alter  table MTZ.FIELD add 
IsAutoNumber
 NUMBER null 
 check (IsAutoNumber in ( -1/* Да */
, 0/* Нет */ )) /* Автонумерация */
/
alter  table MTZ.FIELD add 
TheNumerator CHAR(38) null /* Нумератор */
/
alter  table MTZ.FIELD add 
ZoneTemplate
 VARCHAR2 (255) null /* Шаблон зоны нумерации */
/
alter  table MTZ.FIELD add 
NumberDateField CHAR(38) null /* Поле для расчета даты */
/
alter  table MTZ.FIELD add 
TheComment VARCHAR2(4000) null /* Описание */
/
alter  table MTZ.FIELD add 
shablonBrief
 VARCHAR2 (100) null /* Шаблон для краткой информации */
/
alter  table MTZ.FIELD add 
theNameClass
 VARCHAR2 (100) null /* Имя класса для мастера строк */
/


/*Логика поля на форме*/
drop table MTZ.FIELDVALIDATOR/*Логика взаимосвязей на форме при изменении поля*/ 
/
create table MTZ.FIELDVALIDATOR/*Логика взаимосвязей на форме при изменении поля*/ (
ParentStructRowID CHAR(38) not null,
FIELDVALIDATORid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.FIELDVALIDATOR add 
Target CHAR(38) null /* Платформа */
/
alter  table MTZ.FIELDVALIDATOR add 
Code VARCHAR2(4000) null /* Скрипт */
/


/*Методы поля*/
drop table MTZ.FIELDMENU/*Методы, ассоциированные с полем*/ 
/
create table MTZ.FIELDMENU/*Методы, ассоциированные с полем*/ (
ParentStructRowID CHAR(38) not null,
FIELDMENUid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.FIELDMENU add 
Name
 VARCHAR2 (64) null /* Название */
/
alter  table MTZ.FIELDMENU add 
Caption
 VARCHAR2 (80) null /* Заголовок */
/
alter  table MTZ.FIELDMENU add 
ToolTip
 VARCHAR2 (80) null /* Подсказка */
/
alter  table MTZ.FIELDMENU add 
ActionID CHAR(38) null /* Идентификатор вызываемого метода */
/
alter  table MTZ.FIELDMENU add 
IsMenuItem
 NUMBER null 
 check (IsMenuItem in ( -1/* Да */
, 0/* Нет */ )) /* В меню */
/
alter  table MTZ.FIELDMENU add 
IsToolBarButton
 NUMBER null 
 check (IsToolBarButton in ( -1/* Да */
, 0/* Нет */ )) /* В тулбар */
/
alter  table MTZ.FIELDMENU add 
HotKey
 VARCHAR2 (20) null /* Горячая клавиша */
/


/*Отображение параметров*/
drop table MTZ.FIELDPARAMMAP/*Отображение значений на параметры метода*/ 
/
create table MTZ.FIELDPARAMMAP/*Отображение значений на параметры метода*/ (
ParentStructRowID CHAR(38) not null,
FIELDPARAMMAPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.FIELDPARAMMAP add 
FieldName
 VARCHAR2 (255) null /* Поле (значение) */
/
alter  table MTZ.FIELDPARAMMAP add 
ParamName
 VARCHAR2 (80) null /* Параметр */
/
alter  table MTZ.FIELDPARAMMAP add 
NoEdit
 NUMBER null 
 check (NoEdit in ( -1/* Да */
, 0/* Нет */ )) /* Редактировать параметр нельзя */
/


/*Интерфейсы расширения*/
drop table MTZ.FldExtenders/**/ 
/
create table MTZ.FldExtenders/**/ (
ParentStructRowID CHAR(38) not null,
FldExtendersid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.FldExtenders add 
TheName
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.FldExtenders add 
TargetPlatform CHAR(38) null /* Целевая платформа */
/
alter  table MTZ.FldExtenders add 
TheObject
 VARCHAR2 (255) null /* Объект */
/
alter  table MTZ.FldExtenders add 
TheConfig
 VARCHAR2 (512) null /* Конфиг */
/


/*Значение по умолчанию*/
drop table MTZ.FIELDEXPRESSION/*Выражение для вычисления поля
или значение по умолчанию*/ 
/
create table MTZ.FIELDEXPRESSION/*Выражение для вычисления поля
или значение по умолчанию*/ (
ParentStructRowID CHAR(38) not null,
FIELDEXPRESSIONid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.FIELDEXPRESSION add 
Target CHAR(38) null /* Платформа */
/
alter  table MTZ.FIELDEXPRESSION add 
Code VARCHAR2(4000) null /* Скрипт */
/


/*Динамический фильтр*/
drop table MTZ.DINAMICFILTERSCRIPT/*Выражение для построения дополнительного фильтра для ссылочных полей*/ 
/
create table MTZ.DINAMICFILTERSCRIPT/*Выражение для построения дополнительного фильтра для ссылочных полей*/ (
ParentStructRowID CHAR(38) not null,
DINAMICFILTERSCRIPTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.DINAMICFILTERSCRIPT add 
Target CHAR(38) null /* Целевая платформа */
/
alter  table MTZ.DINAMICFILTERSCRIPT add 
Code VARCHAR2(4000) null /* Скрипт */
/


/*Описание источника данных*/
drop table MTZ.FIELDSRCDEF/*Описание источника данных для полей типа ReferenceSQL */ 
/
create table MTZ.FIELDSRCDEF/*Описание источника данных для полей типа ReferenceSQL */ (
ParentStructRowID CHAR(38) not null,
FIELDSRCDEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.FIELDSRCDEF add 
Provider
 VARCHAR2 (128) null /* Провайдер */
/
alter  table MTZ.FIELDSRCDEF add 
ConnectionString
 VARCHAR2 (512) null /* Строка соединения с источником */
/
alter  table MTZ.FIELDSRCDEF add 
DataSource
 VARCHAR2 (512) null /* Источник данных */
/
alter  table MTZ.FIELDSRCDEF add 
IDField
 VARCHAR2 (128) null /* ID */
/
alter  table MTZ.FIELDSRCDEF add 
BriefString
 VARCHAR2 (512) null /* Источник краткой информации */
/
alter  table MTZ.FIELDSRCDEF add 
FilterString
 VARCHAR2 (512) null /* Фильтр источника данных */
/
alter  table MTZ.FIELDSRCDEF add 
SortField
 VARCHAR2 (512) null /* Сортировка источника данных */
/
alter  table MTZ.FIELDSRCDEF add 
DescriptionString VARCHAR2(4000) null /* Примечания */
/
alter  table MTZ.FIELDSRCDEF add 
DontShowDialog
 NUMBER null 
 check (DontShowDialog in ( 1/* Да */
, 0/* Нет */ )) /* Не показывать форму выбора */
/


/*Представление*/
drop table MTZ.PARTVIEW/*Вариант представления, который может использоваться для создания журнала*/ 
/
create table MTZ.PARTVIEW/*Вариант представления, который может использоваться для создания журнала*/ (
ParentStructRowID CHAR(38) not null,
PARTVIEWid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.PARTVIEW add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.PARTVIEW add 
the_Alias
 VARCHAR2 (64) null /* Псевдоним */
/
alter  table MTZ.PARTVIEW add 
ForChoose
 NUMBER null 
 check (ForChoose in ( -1/* Да */
, 0/* Нет */ )) /* Для поиска */
/
alter  table MTZ.PARTVIEW add 
FilterField0
 VARCHAR2 (255) null /* Поле - фильтр 0 */
/
alter  table MTZ.PARTVIEW add 
FilterField1
 VARCHAR2 (255) null /* Поле - фильтр 1 */
/
alter  table MTZ.PARTVIEW add 
FilterField2
 VARCHAR2 (255) null /* Поле - фильтр 2 */
/
alter  table MTZ.PARTVIEW add 
FilterField3
 VARCHAR2 (255) null /* Поле - фильтр 3 */
/


/*Колонка*/
drop table MTZ.ViewColumn/*Колонка пердставления*/ 
/
create table MTZ.ViewColumn/*Колонка пердставления*/ (
ParentStructRowID CHAR(38) not null,
ViewColumnid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ViewColumn add 
sequence
 NUMBER null /* №  */
/
alter  table MTZ.ViewColumn add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.ViewColumn add 
the_Alias
 VARCHAR2 (64) null /* Псвдоним */
/
alter  table MTZ.ViewColumn add 
FromPart CHAR(38) null /* Раздел */
/
alter  table MTZ.ViewColumn add 
Field CHAR(38) null /* Поле */
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
, 0/* none */ )) /* Агрегация */
/
alter  table MTZ.ViewColumn add 
Expression VARCHAR2(4000) null /* Формула */
/
alter  table MTZ.ViewColumn add 
ForCombo
 NUMBER null 
 check (ForCombo in ( -1/* Да */
, 0/* Нет */ )) /* Для комбо */
/


/*Связанные представления*/
drop table MTZ.PARTVIEW_LNK/**/ 
/
create table MTZ.PARTVIEW_LNK/**/ (
ParentStructRowID CHAR(38) not null,
PARTVIEW_LNKid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.PARTVIEW_LNK add 
TheView CHAR(38) null /* Представление */
/
alter  table MTZ.PARTVIEW_LNK add 
TheJoinSource CHAR(38) null /* Связь: Поле для join источник */
/
alter  table MTZ.PARTVIEW_LNK add 
RefType
 NUMBER null 
 check (RefType in ( 2/* Ссылка на строку */
, 1/* Ссылка на объект */
, 3/* Связка InstanceID (в передлах объекта) */
, 4/* Связка ParentStructRowID  (в передлах объекта) */
, 0/* Нет */ )) /* Связывать как */
/
alter  table MTZ.PARTVIEW_LNK add 
TheJoinDestination CHAR(38) null /* Свзяь: Поле для join приемник */
/
alter  table MTZ.PARTVIEW_LNK add 
HandJoin
 VARCHAR2 (255) null /* Ручной join */
/
alter  table MTZ.PARTVIEW_LNK add 
SEQ
 NUMBER null /* Порядок */
/


/*Интерфейсы расширения*/
drop table MTZ.ExtenderInterface/**/ 
/
create table MTZ.ExtenderInterface/**/ (
ParentStructRowID CHAR(38) not null,
ExtenderInterfaceid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ExtenderInterface add 
TheName
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.ExtenderInterface add 
TargetPlatform CHAR(38) null /* Целевая платформа */
/
alter  table MTZ.ExtenderInterface add 
TheObject
 VARCHAR2 (255) null /* Объект */
/
alter  table MTZ.ExtenderInterface add 
TheConfig
 VARCHAR2 (512) null /* Конфиг */
/


/*Логика на форме*/
drop table MTZ.VALIDATOR/*Действия в впроцессе редактирования*/ 
/
create table MTZ.VALIDATOR/*Действия в впроцессе редактирования*/ (
ParentStructRowID CHAR(38) not null,
VALIDATORid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.VALIDATOR add 
Target CHAR(38) null /* Целевая платформа */
/
alter  table MTZ.VALIDATOR add 
Code VARCHAR2(4000) null /* Скрипт */
/


/*Ограничение уникальности*/
drop table MTZ.UNIQUECONSTRAINT/*Ограничение уникальности*/ 
/
create table MTZ.UNIQUECONSTRAINT/*Ограничение уникальности*/ (
ParentStructRowID CHAR(38) not null,
UNIQUECONSTRAINTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.UNIQUECONSTRAINT add 
Name
 VARCHAR2 (80) null /* Название */
/
alter  table MTZ.UNIQUECONSTRAINT add 
PerParent
 NUMBER null 
 check (PerParent in ( -1/* Да */
, 0/* Нет */ )) /* По родителю */
/
alter  table MTZ.UNIQUECONSTRAINT add 
TheComment VARCHAR2(4000) null /* Описание */
/


/*Поля ограничения*/
drop table MTZ.CONSTRAINTFIELD/*Поля ограничения*/ 
/
create table MTZ.CONSTRAINTFIELD/*Поля ограничения*/ (
ParentStructRowID CHAR(38) not null,
CONSTRAINTFIELDid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.CONSTRAINTFIELD add 
TheField CHAR(38) null /* Поле */
/


/*Проверка правильности*/
drop table MTZ.INSTANCEVALIDATOR/*Проверка правильности для объекта в целом*/ 
/
create table MTZ.INSTANCEVALIDATOR/*Проверка правильности для объекта в целом*/ (
ParentStructRowID CHAR(38) not null,
INSTANCEVALIDATORid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.INSTANCEVALIDATOR add 
Target CHAR(38) null /* Платформа */
/
alter  table MTZ.INSTANCEVALIDATOR add 
Code VARCHAR2(4000) null /* Скрипт */
/


/*Состояния*/
drop table MTZ.OBJSTATUS/*Возможные логические состояния документа*/ 
/
create table MTZ.OBJSTATUS/*Возможные логические состояния документа*/ (
ParentStructRowID CHAR(38) not null,
OBJSTATUSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.OBJSTATUS add 
name
 VARCHAR2 (80) null /* Название */
/
alter  table MTZ.OBJSTATUS add 
isStartup
 NUMBER null 
 check (isStartup in ( -1/* Да */
, 0/* Нет */ )) /* Начальное */
/
alter  table MTZ.OBJSTATUS add 
IsArchive
 NUMBER null 
 check (IsArchive in ( -1/* Да */
, 0/* Нет */ )) /* Архивное */
/
alter  table MTZ.OBJSTATUS add 
the_comment VARCHAR2(4000) null /* Описание */
/


/*Разрешенные переходы*/
drop table MTZ.NEXTSTATE/*Матрица переходов */ 
/
create table MTZ.NEXTSTATE/*Матрица переходов */ (
ParentStructRowID CHAR(38) not null,
NEXTSTATEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.NEXTSTATE add 
TheState CHAR(38) null /* Разрешенное состояние */
/


/*Режим работы*/
drop table MTZ.OBJECTMODE/*Режим работы*/ 
/
create table MTZ.OBJECTMODE/*Режим работы*/ (
ParentStructRowID CHAR(38) not null,
OBJECTMODEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.OBJECTMODE add 
Name
 VARCHAR2 (5) null /* Название режима */
/
alter  table MTZ.OBJECTMODE add 
DefaultMode
 NUMBER null 
 check (DefaultMode in ( -1/* Да */
, 0/* Нет */ )) /* Этот режим является основным режимом работы объекта */
/
alter  table MTZ.OBJECTMODE add 
TheComment VARCHAR2(4000) null /* Описание */
/


/*Органичения разделов*/
drop table MTZ.STRUCTRESTRICTION/*Ораничения на доступ к разделу документа*/ 
/
create table MTZ.STRUCTRESTRICTION/*Ораничения на доступ к разделу документа*/ (
ParentStructRowID CHAR(38) not null,
STRUCTRESTRICTIONid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.STRUCTRESTRICTION add 
Struct CHAR(38) null /* структура, доступ к которой ограничен */
/
alter  table MTZ.STRUCTRESTRICTION add 
AllowRead
 NUMBER null 
 check (AllowRead in ( -1/* Да */
, 0/* Нет */ )) /* Разрешен просмотр */
/
alter  table MTZ.STRUCTRESTRICTION add 
AllowAdd
 NUMBER null 
 check (AllowAdd in ( -1/* Да */
, 0/* Нет */ )) /* Разрешено добавлять */
/
alter  table MTZ.STRUCTRESTRICTION add 
AllowEdit
 NUMBER null 
 check (AllowEdit in ( -1/* Да */
, 0/* Нет */ )) /* Разрешено изменять */
/
alter  table MTZ.STRUCTRESTRICTION add 
AllowDelete
 NUMBER null 
 check (AllowDelete in ( -1/* Да */
, 0/* Нет */ )) /* Разрешено удалять */
/


/*Ограничения полей*/
drop table MTZ.FIELDRESTRICTION/*Ограничения на доступ к полям раздела*/ 
/
create table MTZ.FIELDRESTRICTION/*Ограничения на доступ к полям раздела*/ (
ParentStructRowID CHAR(38) not null,
FIELDRESTRICTIONid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.FIELDRESTRICTION add 
ThePart CHAR(38) null /* Структура, которой принадлежит поле */
/
alter  table MTZ.FIELDRESTRICTION add 
TheField CHAR(38) null /* Поле, на которое накладывается ограничение */
/
alter  table MTZ.FIELDRESTRICTION add 
AllowRead
 NUMBER null 
 check (AllowRead in ( -1/* Да */
, 0/* Нет */ )) /* Разрешен просмотр */
/
alter  table MTZ.FIELDRESTRICTION add 
AllowModify
 NUMBER null 
 check (AllowModify in ( -1/* Да */
, 0/* Нет */ )) /* Разрешена модификация */
/


/*Ограничения методов*/
drop table MTZ.METHODRESTRICTION/*Ограничение на использование методов раздела*/ 
/
create table MTZ.METHODRESTRICTION/*Ограничение на использование методов раздела*/ (
ParentStructRowID CHAR(38) not null,
METHODRESTRICTIONid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.METHODRESTRICTION add 
Part CHAR(38) null /* Структура, которой принадлежит метод */
/
alter  table MTZ.METHODRESTRICTION add 
Method CHAR(38) null /* Метод */
/
alter  table MTZ.METHODRESTRICTION add 
IsRestricted
 NUMBER null 
 check (IsRestricted in ( -1/* Да */
, 0/* Нет */ )) /* Запрещено использовать */
/


/*Методы типа*/
drop table MTZ.TYPEMENU/*Методы уровня типа*/ 
/
create table MTZ.TYPEMENU/*Методы уровня типа*/ (
ParentStructRowID CHAR(38) not null,
TYPEMENUid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.TYPEMENU add 
Name
 VARCHAR2 (64) null /* Название */
/
alter  table MTZ.TYPEMENU add 
Caption
 VARCHAR2 (80) null /* Заголовок */
/
alter  table MTZ.TYPEMENU add 
ToolTip
 VARCHAR2 (80) null /* Подсказка */
/
alter  table MTZ.TYPEMENU add 
the_Action CHAR(38) null /* Метод */
/
alter  table MTZ.TYPEMENU add 
IsMenuItem
 NUMBER null 
 check (IsMenuItem in ( -1/* Да */
, 0/* Нет */ )) /* Включать в меню */
/
alter  table MTZ.TYPEMENU add 
IsToolBarButton
 NUMBER null 
 check (IsToolBarButton in ( -1/* Да */
, 0/* Нет */ )) /* Включать в тулбар */
/
alter  table MTZ.TYPEMENU add 
HotKey
 VARCHAR2 (20) null /* Горячая клавиша */
/


/*Приложение*/
drop table MTZ.MTZAPP/*Группа взаимосвязных документов*/ 
/
create table MTZ.MTZAPP/*Группа взаимосвязных документов*/ (
InstanceID CHAR(38) ,
MTZAPPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.MTZAPP add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.MTZAPP add 
DBName
 VARCHAR2 (64) null /* База данных */
/
alter  table MTZ.MTZAPP add 
TheComment VARCHAR2(4000) null /* Описание */
/


/*Обязательные приложения*/
drop table MTZ.ParentPackage/*Приложения от которых зависит данное приложение*/ 
/
create table MTZ.ParentPackage/*Приложения от которых зависит данное приложение*/ (
ParentStructRowID CHAR(38) not null,
ParentPackageid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ParentPackage add 
Package CHAR(38) null /* Приложение */
/


/*Пакет генерации*/
drop table MTZ.GENPACKAGE/*Пакет генерации*/ 
/
create table MTZ.GENPACKAGE/*Пакет генерации*/ (
InstanceID CHAR(38) ,
GENPACKAGEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.GENPACKAGE add 
Name
 VARCHAR2 (255) null /* Название */
/


/*Генераторы*/
drop table MTZ.GENERATOR_TARGET/*Генераторы*/ 
/
create table MTZ.GENERATOR_TARGET/*Генераторы*/ (
ParentStructRowID CHAR(38) not null,
GENERATOR_TARGETid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.GENERATOR_TARGET add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.GENERATOR_TARGET add 
TargetType
 NUMBER null 
 check (TargetType in ( 0/* СУБД */
, 4/* АРМ */
, 3/* Документация */
, 1/* МОДЕЛЬ */
, 2/* Приложение */ )) /* Тип платформы */
/
alter  table MTZ.GENERATOR_TARGET add 
QueueName
 VARCHAR2 (255) null /* Очередь */
/
alter  table MTZ.GENERATOR_TARGET add 
GeneratorProgID
 VARCHAR2 (255) null /* COM класс */
/
alter  table MTZ.GENERATOR_TARGET add 
GeneratorStyle
 NUMBER null 
 check (GeneratorStyle in ( 0/* Один тип */
, 1/* Все типы сразу */ )) /* Вариант */
/
alter  table MTZ.GENERATOR_TARGET add 
TheDevelopmentEnv
 NUMBER null 
 check (TheDevelopmentEnv in ( 2/* JAVA */
, 3/* OTHER */
, 1/* DOTNET */
, 0/* VB6 */ )) /* Среда разработки */
/


/*Ручной код*/
drop table MTZ.GENMANUALCODE/*Код, который не укладывается в описание модели*/ 
/
create table MTZ.GENMANUALCODE/*Код, который не укладывается в описание модели*/ (
ParentStructRowID CHAR(38) not null,
GENMANUALCODEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.GENMANUALCODE add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.GENMANUALCODE add 
the_Alias
 VARCHAR2 (80) null /* Псевдоним */
/
alter  table MTZ.GENMANUALCODE add 
Code VARCHAR2(4000) null /* Код */
/


/*Контрольные элементы*/
drop table MTZ.GENCONTROLS/*Контрольные элементы, которые используются при генерации*/ 
/
create table MTZ.GENCONTROLS/*Контрольные элементы, которые используются при генерации*/ (
ParentStructRowID CHAR(38) not null,
GENCONTROLSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.GENCONTROLS add 
ControlProgID
 VARCHAR2 (255) null /* ProgID контрольконо элемента */
/
alter  table MTZ.GENCONTROLS add 
ControlClassID
 VARCHAR2 (40) null /* Класс контрольногоэлемента */
/
alter  table MTZ.GENCONTROLS add 
VersionMajor
 NUMBER null /* Версия */
/
alter  table MTZ.GENCONTROLS add 
VersionMinor
 NUMBER null /* Подверсия */
/


/*Библиотеки*/
drop table MTZ.GENREFERENCE/*Библиотеки, которые используются при генерации*/ 
/
create table MTZ.GENREFERENCE/*Библиотеки, которые используются при генерации*/ (
ParentStructRowID CHAR(38) not null,
GENREFERENCEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.GENREFERENCE add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.GENREFERENCE add 
RefClassID
 VARCHAR2 (40) null /* Класс ссылки */
/
alter  table MTZ.GENREFERENCE add 
VersionMajor
 NUMBER null /* Номер версии */
/
alter  table MTZ.GENREFERENCE add 
VersionMinor
 NUMBER null /* Подверсия */
/


/*Локализация*/
drop table MTZ.LocalizeInfo/**/ 
/
create table MTZ.LocalizeInfo/**/ (
InstanceID CHAR(38) ,
LocalizeInfoid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.LocalizeInfo add 
LangFull
 VARCHAR2 (255) null /* Язык - название */
/
alter  table MTZ.LocalizeInfo add 
LangShort
 VARCHAR2 (255) null /* Код языка */
/


/*Y-Cost*/
drop table MTZ.ITTNO_YC/*Y-Cost*/ 
/
create table MTZ.ITTNO_YC/*Y-Cost*/ (
InstanceID CHAR(38) ,
ITTNO_YCid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTNO_YC add 
YNum
 NUMBER null /* Номер рядя по оси Y */
/
alter  table MTZ.ITTNO_YC add 
TheTime
 NUMBER null /* Время */
/


/*Общие настройки*/
drop table MTZ.ITTNO_CMN/**/ 
/
create table MTZ.ITTNO_CMN/**/ (
InstanceID CHAR(38) ,
ITTNO_CMNid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTNO_CMN add 
IN_TIME
 NUMBER null /* Время на въезд в камеру */
/
alter  table MTZ.ITTNO_CMN add 
Out_Time
 NUMBER null /* Время на выезд из камеры */
/


/*Z-Cost*/
drop table MTZ.ITTNO_ZC/*Z-Cost*/ 
/
create table MTZ.ITTNO_ZC/*Z-Cost*/ (
InstanceID CHAR(38) ,
ITTNO_ZCid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTNO_ZC add 
ZNum
 NUMBER null /* Номер яруса */
/
alter  table MTZ.ITTNO_ZC add 
TheTime
 NUMBER null /* Время */
/


/*Описание*/
drop table MTZ.InfoStoreDef/*Описание каталога*/ 
/
create table MTZ.InfoStoreDef/*Описание каталога*/ (
InstanceID CHAR(38) ,
InfoStoreDefid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.InfoStoreDef add 
TheGroup CHAR(38) null /* Группа */
/
alter  table MTZ.InfoStoreDef add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.InfoStoreDef add 
InfoStoreType
 NUMBER null 
 check (InfoStoreType in ( 2/* Групповой */
, 1/* Персональный */
, 0/*  Общий */ )) /* Тип каталога */
/
alter  table MTZ.InfoStoreDef add 
TheUser CHAR(38) null /* Пользователь */
/


/*Папка*/
drop table MTZ.Folder/*Папка каталога*/ 
/
create table MTZ.Folder/*Папка каталога*/ (
InstanceID CHAR(38) ,
Folderid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
/
alter  table MTZ.Folder add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.Folder add 
FolderType
 NUMBER null 
 check (FolderType in ( 2/* Исходящие */
, 10/* Завершенные */
, 0/* cls__ */
, 5/* Календарь */
, 1/* Входящие */
, 9/* Отложенные */
, 4/* Журнал */
, 8/* В работе */
, 7/* Черновики */
, 6/* Отправленные */
, 3/* Удаленные */ )) /* Тип папки */
/


/*Документы*/
drop table MTZ.Shortcut/*Ярлыки документов*/ 
/
create table MTZ.Shortcut/*Ярлыки документов*/ (
ParentStructRowID CHAR(38) not null,
Shortcutid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.Shortcut add 
DocItem CHAR(38) null /* Документ */
/
alter  table MTZ.Shortcut add 
StartMode
 VARCHAR2 (255) null /* Режим */
/


/*Описание*/
drop table MTZ.Reports/*Описание*/ 
/
create table MTZ.Reports/*Описание*/ (
InstanceID CHAR(38) ,
Reportsid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.Reports add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.Reports add 
ReportFile VARCHAR2(4000) null /* Файл отчета */
/
alter  table MTZ.Reports add 
 ReportFile_EXT varchar2(4) null
/
alter  table MTZ.Reports add 
Caption
 VARCHAR2 (255) null /* Заголовок */
/
alter  table MTZ.Reports add 
PrepareMethod CHAR(38) null /* Метод для формирования */
/
alter  table MTZ.Reports add 
ReportType
 NUMBER null 
 check (ReportType in ( 1/* Двумерная матрица */
, 0/* Таблица */
, 3/* Экспорт по WORD шаблону */
, 2/* Только расчет */
, 4/* Экспорт по Excel шаблону */ )) /* Тип отчета */
/
alter  table MTZ.Reports add 
TheReportExt CHAR(38) null /* Расширение для создания отчета */
/
alter  table MTZ.Reports add 
ReportView
 VARCHAR2 (255) null /* Базовый запрос */
/
alter  table MTZ.Reports add 
TheComment VARCHAR2(4000) null /* Описание */
/


/*Секции*/
drop table MTZ.RPTStruct/*Секции*/ 
/
create table MTZ.RPTStruct/*Секции*/ (
InstanceID CHAR(38) ,
RPTStructid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
/
alter  table MTZ.RPTStruct add 
Name
 VARCHAR2 (64) null /* Название */
/
alter  table MTZ.RPTStruct add 
Caption
 VARCHAR2 (255) null /* Заголовок */
/


/*Поля секции*/
drop table MTZ.RPTFields/*Поля секции*/ 
/
create table MTZ.RPTFields/*Поля секции*/ (
ParentStructRowID CHAR(38) not null,
RPTFieldsid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.RPTFields add 
Name
 VARCHAR2 (64) null /* Название */
/
alter  table MTZ.RPTFields add 
FieldType CHAR(38) null /* Тип поля */
/
alter  table MTZ.RPTFields add 
FieldSize
 NUMBER null /* Размер */
/
alter  table MTZ.RPTFields add 
Caption
 VARCHAR2 (255) null /* Заголовок */
/


/*Формулы*/
drop table MTZ.RPTFormula/*Формулы*/ 
/
create table MTZ.RPTFormula/*Формулы*/ (
InstanceID CHAR(38) ,
RPTFormulaid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.RPTFormula add 
Name
 VARCHAR2 (64) null /* Название */
/
alter  table MTZ.RPTFormula add 
Code VARCHAR2(4000) null /* Выражение */
/
alter  table MTZ.RPTFormula add 
Platform CHAR(38) null /* Платформа */
/


/*Описание*/
drop table MTZ.ITTPR_DEF/**/ 
/
create table MTZ.ITTPR_DEF/**/ (
InstanceID CHAR(38) ,
ITTPR_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTPR_DEF add 
Poddon
 VARCHAR2 (20) null /* Поддон */
/
alter  table MTZ.ITTPR_DEF add 
InWeight
 NUMBER null /* Вес при приемке */
/
alter  table MTZ.ITTPR_DEF add 
OutWeight
 NUMBER null /* Вес отгрузок */
/
alter  table MTZ.ITTPR_DEF add 
Moroz
 NUMBER null /* Расчетная выморозка */
/
alter  table MTZ.ITTPR_DEF add 
Vesi
 NUMBER null /* Погрешность весов */
/
alter  table MTZ.ITTPR_DEF add 
Good
 VARCHAR2 (20) null /* Товар */
/
alter  table MTZ.ITTPR_DEF add 
the_Description
 VARCHAR2 (255) null /* Описание товара */
/
alter  table MTZ.ITTPR_DEF add 
Country
 VARCHAR2 (255) null /* Страна */
/
alter  table MTZ.ITTPR_DEF add 
Factory
 VARCHAR2 (255) null /* Завод */
/
alter  table MTZ.ITTPR_DEF add 
KillPlace
 VARCHAR2 (255) null /* Бойня */
/
alter  table MTZ.ITTPR_DEF add 
Brak
 VARCHAR2 (30) null /* Брак */
/
alter  table MTZ.ITTPR_DEF add 
Client
 VARCHAR2 (255) null /* Поклажедатель */
/
alter  table MTZ.ITTPR_DEF add 
TheDate
 DATE null /* Дата протокола */
/
alter  table MTZ.ITTPR_DEF add 
WeightDelta
 NUMBER null /* Расхождение по весу */
/
alter  table MTZ.ITTPR_DEF add 
InBoxes
 NUMBER null /* Принято коробов */
/
alter  table MTZ.ITTPR_DEF add 
OutBoxes
 NUMBER null /* Отгружено коробов */
/


/*Описание*/
drop table MTZ.MTZExt_def/*Список зарегистрированных расширений*/ 
/
create table MTZ.MTZExt_def/*Список зарегистрированных расширений*/ (
InstanceID CHAR(38) ,
MTZExt_defid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.MTZExt_def add 
Name
 VARCHAR2 (255) null /* Название */
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
, 4/* JrnlRunExt */ )) /* Тип расширения */
/
alter  table MTZ.MTZExt_def add 
TheDescription VARCHAR2(4000) null /* Описание */
/


/*Реализации расширения*/
drop table MTZ.MTZExtRel/*Реализации расширения для разных разработческих плаформ*/ 
/
create table MTZ.MTZExtRel/*Реализации расширения для разных разработческих плаформ*/ (
InstanceID CHAR(38) ,
MTZExtRelid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
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
, 0/* VB6 */ )) /* Реализация */
/
alter  table MTZ.MTZExtRel add 
TheClassName
 VARCHAR2 (255) null /* Название класса */
/
alter  table MTZ.MTZExtRel add 
TheLibraryName
 VARCHAR2 (255) null /* Название библиотеки */
/


/*Набор услуг*/
drop table MTZ.ITTCS_LIN/**/ 
/
create table MTZ.ITTCS_LIN/**/ (
InstanceID CHAR(38) ,
ITTCS_LINid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTCS_LIN add 
SRV CHAR(38) null /* Услуга */
/
alter  table MTZ.ITTCS_LIN add 
UseSrv
 NUMBER null 
 check (UseSrv in ( -1/* Да */
, 0/* Нет */ )) /* Использовать */
/


/*Описание*/
drop table MTZ.ITTCS_DEF/**/ 
/
create table MTZ.ITTCS_DEF/**/ (
InstanceID CHAR(38) ,
ITTCS_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTCS_DEF add 
CLIENTCODE VARCHAR2(4000) null /* Код клиента */
/


/*Журнал событий*/
drop table MTZ.SysLog/*Журнал событий, которые произошли в системе*/ 
/
create table MTZ.SysLog/*Журнал событий, которые произошли в системе*/ (
InstanceID CHAR(38) ,
SysLogid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.SysLog add 
TheSession CHAR(38) null /* Сессия */
/
alter  table MTZ.SysLog add 
the_Resource
 VARCHAR2 (255) null /* Ресурс */
/
alter  table MTZ.SysLog add 
LogStructID
 VARCHAR2 (255) null /* Раздел с которым происхоит действие */
/
alter  table MTZ.SysLog add 
VERB
 VARCHAR2 (80) null /* Действие */
/
alter  table MTZ.SysLog add 
LogInstanceID CHAR(38) null /* Идентификатор документа */
/


/*Сессия пользователя*/
drop table MTZ.the_Session/*Зарегистрированные сессии пользователей*/ 
/
create table MTZ.the_Session/*Зарегистрированные сессии пользователей*/ (
InstanceID CHAR(38) ,
the_Sessionid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.the_Session add 
UserRole CHAR(38) null /* Текущая роль пользователя */
/
alter  table MTZ.the_Session add 
ClosedAt
 DATE null /* Момент закрытия */
/
alter  table MTZ.the_Session add 
Closed
 NUMBER null 
 check (Closed in ( 1/* Да */
, 0/* Нет */ )) /* Закрыта */
/
alter  table MTZ.the_Session add 
Usersid CHAR(38) null /* Пользователь */
/
alter  table MTZ.the_Session add 
LastAccess
 DATE null /* Последнее подтверждение */
/
alter  table MTZ.the_Session add 
StartAt
 DATE null /* Момент открытия */
/
alter  table MTZ.the_Session add 
Lang
 VARCHAR2 (25) null /* Локализация */
/


/*Роботы журнала событий*/
drop table MTZ.LogReader/*Программы, которые регистрируют себя как 
обработчики лога событий.*/ 
/
create table MTZ.LogReader/*Программы, которые регистрируют себя как 
обработчики лога событий.*/ (
InstanceID CHAR(38) ,
LogReaderid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.LogReader add 
Name
 VARCHAR2 (80) null /* Название */
/
alter  table MTZ.LogReader add 
AutoStart
 NUMBER null 
 check (AutoStart in ( 1/* Да */
, 0/* Нет */ )) /* Автоматизированный запуск */
/
alter  table MTZ.LogReader add 
AutoProgid
 VARCHAR2 (255) null /* Класс для автоматического запуска */
/
alter  table MTZ.LogReader add 
ReadMarker
 DATE null /* Дата последней прочитанной записи */
/
alter  table MTZ.LogReader add 
StartInterval
 NUMBER null /* Интервал запуска (мин) */
/
alter  table MTZ.LogReader add 
LastStart
 DATE null /* Дата последнего запуска */
/
alter  table MTZ.LogReader add 
LastStop
 DATE null /* Дата последне останвки */
/


/*Действия*/
drop table MTZ.Verb/*Защищаемые системой дейсвия*/ 
/
create table MTZ.Verb/*Защищаемые системой дейсвия*/ (
InstanceID CHAR(38) ,
Verbid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.Verb add 
Name
 VARCHAR2 (80) null /* Название */
/


/*Пользователи*/
drop table MTZ.Users/*Пользователи*/ 
/
create table MTZ.Users/*Пользователи*/ (
InstanceID CHAR(38) ,
Usersid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.Users add 
Family
 VARCHAR2 (255) null /* Фамилия */
/
alter  table MTZ.Users add 
Name
 VARCHAR2 (64) null /* Имя */
/
alter  table MTZ.Users add 
SurName
 VARCHAR2 (255) null /* Отчество */
/
alter  table MTZ.Users add 
Login
 VARCHAR2 (64) null /* Имя для входа */
/
alter  table MTZ.Users add 
Password VARCHAR2(80) null /* Пароль */
/
alter  table MTZ.Users add 
DomaiName
 VARCHAR2 (255) null /* Доменное имя */
/
alter  table MTZ.Users add 
EMail VARCHAR2(255) null /* e-mail */
/
alter  table MTZ.Users add 
Phone
 VARCHAR2 (20) null /* Телефон */
/
alter  table MTZ.Users add 
LocalPhone
 VARCHAR2 (20) null /* Местный телефон */
/
alter  table MTZ.Users add 
MobilePhone
 VARCHAR2 (20) null /* Мобильный телефон */
/
alter  table MTZ.Users add 
Photo VARCHAR2(4000) null /* Фото */
/
alter  table MTZ.Users add 
BirthDay
 DATE null /* Дата рождения */
/
alter  table MTZ.Users add 
Activity CHAR(38) null /* Журнал активности */
/
alter  table MTZ.Users add 
CertificateID
 VARCHAR2 (255) null /* CertificateID */
/
alter  table MTZ.Users add 
CertData VARCHAR2(4000) null /* CertData */
/
alter  table MTZ.Users add 
ClientDef CHAR(38) null /* Ассоциация с клиентом */
/
alter  table MTZ.Users add 
PersonaData CHAR(38) null /* PersonaData */
/
alter  table MTZ.Users add 
PositionU
 VARCHAR2 (255) null /* Должность */
/
alter  table MTZ.Users add 
WorkPlace
 VARCHAR2 (255) null /* Место работы */
/


/*Группы*/
drop table MTZ.Groups/*Группы*/ 
/
create table MTZ.Groups/*Группы*/ (
InstanceID CHAR(38) ,
Groupsid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.Groups add 
Name
 VARCHAR2 (80) null /* Название */
/


/*Состав группы*/
drop table MTZ.GroupUser/*Состав группы*/ 
/
create table MTZ.GroupUser/*Состав группы*/ (
ParentStructRowID CHAR(38) not null,
GroupUserid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.GroupUser add 
TheUser CHAR(38) null /* Пользователь */
/


/*Описание прав*/
drop table MTZ.MTZSEC_RIGHT/*описание прав для каждой группы*/ 
/
create table MTZ.MTZSEC_RIGHT/*описание прав для каждой группы*/ (
InstanceID CHAR(38) ,
MTZSEC_RIGHTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.MTZSEC_RIGHT add 
Piority
 NUMBER null /* Приоритет */
/
alter  table MTZ.MTZSEC_RIGHT add 
TheGroup CHAR(38) null /* Группа */
/
alter  table MTZ.MTZSEC_RIGHT add 
ProtectedItem
 VARCHAR2 (255) null /* Защищаемый элемент */
/
alter  table MTZ.MTZSEC_RIGHT add 
Allow
 NUMBER null 
 check (Allow in ( -1/* Да */
, 0/* Нет */ )) /* Разрешение */
/


/*Пользователи*/
drop table MTZ.ROLES_USER/*Пользователи*/ 
/
create table MTZ.ROLES_USER/*Пользователи*/ (
InstanceID CHAR(38) ,
ROLES_USERid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ROLES_USER add 
TheUser CHAR(38) null /* Пользователь */
/


/*Отображение на группы защиты*/
drop table MTZ.ROLES_MAP/*Отображение на группы защиты*/ 
/
create table MTZ.ROLES_MAP/*Отображение на группы защиты*/ (
InstanceID CHAR(38) ,
ROLES_MAPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ROLES_MAP add 
TheGroup CHAR(38) null /* Группа */
/


/*Доступные документы*/
drop table MTZ.ROLES_DOC/**/ 
/
create table MTZ.ROLES_DOC/**/ (
InstanceID CHAR(38) ,
ROLES_DOCid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ROLES_DOC add 
The_Document CHAR(38) null /* Тип документа */
/
alter  table MTZ.ROLES_DOC add 
The_Denied
 NUMBER null 
 check (The_Denied in ( 1/* Да */
, 0/* Нет */ )) /* Запрещен */
/
alter  table MTZ.ROLES_DOC add 
AllowDeleteDoc
 NUMBER null 
 check (AllowDeleteDoc in ( -1/* Да */
, 0/* Нет */ )) /* Разрешено удаление */
/


/*Доступные состояния*/
drop table MTZ.ROLES_DOC_STATE/**/ 
/
create table MTZ.ROLES_DOC_STATE/**/ (
ParentStructRowID CHAR(38) not null,
ROLES_DOC_STATEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ROLES_DOC_STATE add 
The_State CHAR(38) null /* Состояние */
/
alter  table MTZ.ROLES_DOC_STATE add 
The_Mode CHAR(38) null /* Режим */
/
alter  table MTZ.ROLES_DOC_STATE add 
AllowDelete
 NUMBER null 
 check (AllowDelete in ( -1/* Да */
, 0/* Нет */ )) /* Можно удалять */
/
alter  table MTZ.ROLES_DOC_STATE add 
StateChangeDisabled
 NUMBER null 
 check (StateChangeDisabled in ( -1/* Да */
, 0/* Нет */ )) /* Запрещена смена состояния */
/


/*Определение роли*/
drop table MTZ.ROLES_DEF/*Определение роли*/ 
/
create table MTZ.ROLES_DEF/*Определение роли*/ (
InstanceID CHAR(38) ,
ROLES_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ROLES_DEF add 
name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.ROLES_DEF add 
TheComment VARCHAR2(4000) null /* Описание */
/
alter  table MTZ.ROLES_DEF add 
RightsSet_Denied
 NUMBER null 
 check (RightsSet_Denied in ( -1/* Да */
, 0/* Нет */ )) /* Настройка прав запрещена */
/
alter  table MTZ.ROLES_DEF add 
FormCFG_Denied
 NUMBER null 
 check (FormCFG_Denied in ( -1/* Да */
, 0/* Нет */ )) /* Настройки форм запрещены */
/
alter  table MTZ.ROLES_DEF add 
ListCFG_Denied
 NUMBER null 
 check (ListCFG_Denied in ( -1/* Да */
, 0/* Нет */ )) /* Настройка журналов запрещена */
/
alter  table MTZ.ROLES_DEF add 
FileExch_Denied
 NUMBER null 
 check (FileExch_Denied in ( -1/* Да */
, 0/* Нет */ )) /* Файловый обмен запрещен */
/


/*Отчёты*/
drop table MTZ.ROLES_REPORTS/**/ 
/
create table MTZ.ROLES_REPORTS/**/ (
InstanceID CHAR(38) ,
ROLES_REPORTSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ROLES_REPORTS add 
The_Report CHAR(38) null /* Отчёт */
/


/*Доступные приложения*/
drop table MTZ.ROLES_WP/*Доступные приложения*/ 
/
create table MTZ.ROLES_WP/*Доступные приложения*/ (
InstanceID CHAR(38) ,
ROLES_WPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ROLES_WP add 
WP CHAR(38) null /* Приложение */
/


/*Допустимые действия*/
drop table MTZ.ROLES_ACT/*Допустимые действия*/ 
/
create table MTZ.ROLES_ACT/*Допустимые действия*/ (
ParentStructRowID CHAR(38) not null,
ROLES_ACTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
/
alter  table MTZ.ROLES_ACT add 
Accesible
 NUMBER null 
 check (Accesible in ( 1/* Да */
, 0/* Нет */ )) /* Доступность */
/
alter  table MTZ.ROLES_ACT add 
EntryPoints CHAR(38) null /* Доступные действия */
/


/*Колонки журнала*/
drop table MTZ.JournalColumn/*Колонки журнала*/ 
/
create table MTZ.JournalColumn/*Колонки журнала*/ (
InstanceID CHAR(38) ,
JournalColumnid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.JournalColumn add 
sequence
 NUMBER null /* Последовательность */
/
alter  table MTZ.JournalColumn add 
name
 VARCHAR2 (255) null /* Название */
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
, 0/* Left Top */ )) /* Выравнивание */
/
alter  table MTZ.JournalColumn add 
ColSort
 NUMBER null 
 check (ColSort in ( 0/* As String */
, 1/* As Numeric */
, 2/* As Date */ )) /* Сортировка колонки */
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
, 0/* none */ )) /* Аггрегация при группировке */
/


/*Состав колонки*/
drop table MTZ.JColumnSource/*Состав колонки*/ 
/
create table MTZ.JColumnSource/*Состав колонки*/ (
ParentStructRowID CHAR(38) not null,
JColumnSourceid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.JColumnSource add 
SrcPartView CHAR(38) null /* Представление */
/
alter  table MTZ.JColumnSource add 
ViewField
 VARCHAR2 (255) null /* Поле представления */
/


/*Журнал*/
drop table MTZ.Journal/*Журнал*/ 
/
create table MTZ.Journal/*Журнал*/ (
InstanceID CHAR(38) ,
Journalid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.Journal add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.Journal add 
the_Alias
 VARCHAR2 (32) null /* Псевдоним */
/
alter  table MTZ.Journal add 
TheComment VARCHAR2(4000) null /* Описание */
/


/*Источники журнала*/
drop table MTZ.JournalSrc/*Источники журнала*/ 
/
create table MTZ.JournalSrc/*Источники журнала*/ (
InstanceID CHAR(38) ,
JournalSrcid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.JournalSrc add 
PartView CHAR(38) null /* Представление */
/
alter  table MTZ.JournalSrc add 
OnRun
 NUMBER null 
 check (OnRun in ( 2/* Открыть документ */
, 1/* Открыть строку */
, 0/* Ничего не делать */ )) /* При открытии */
/
alter  table MTZ.JournalSrc add 
OpenMode
 VARCHAR2 (1) null /* Режим открытия */
/
alter  table MTZ.JournalSrc add 
ViewAlias
 VARCHAR2 (255) null /* Псевдоним представления */
/


/*Сборки*/
drop table MTZ.MTZ_Inst_Build/**/ 
/
create table MTZ.MTZ_Inst_Build/**/ (
InstanceID CHAR(38) ,
MTZ_Inst_Buildid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
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
 VARCHAR2 (2048) null /* Файл с лицензионным соглашением */
/
alter  table MTZ.MTZ_Inst_Build add 
MainFileRef CHAR(38) null /* Главный файл */
/
alter  table MTZ.MTZ_Inst_Build add 
InstallDir
 VARCHAR2 (1024) null /* InstallDir */
/
alter  table MTZ.MTZ_Inst_Build add 
ShortCutDir
 VARCHAR2 (255) null /* ShortCutDir */
/


/*Секции*/
drop table MTZ.MTZ_Inst_Build_Sec/**/ 
/
create table MTZ.MTZ_Inst_Build_Sec/**/ (
ParentStructRowID CHAR(38) not null,
MTZ_Inst_Build_Secid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.MTZ_Inst_Build_Sec add 
TheSection CHAR(38) null /* Секция */
/
alter  table MTZ.MTZ_Inst_Build_Sec add 
TheDescription
 VARCHAR2 (255) null /* Комментарий */
/
alter  table MTZ.MTZ_Inst_Build_Sec add 
IsRewriteSectionDesc
 NUMBER null 
 check (IsRewriteSectionDesc in ( 1/* Да */
, 0/* Нет */ )) /* Перезаписывать комментарий секции */
/
alter  table MTZ.MTZ_Inst_Build_Sec add 
SEQ
 NUMBER null /* Порядок (от 1 до ...) */
/


/*Секции*/
drop table MTZ.MTZ_Inst_Section/**/ 
/
create table MTZ.MTZ_Inst_Section/**/ (
InstanceID CHAR(38) ,
MTZ_Inst_Sectionid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.MTZ_Inst_Section add 
TheName
 VARCHAR2 (255) null /* Название (Eng) */
/
alter  table MTZ.MTZ_Inst_Section add 
IsVisible
 NUMBER null 
 check (IsVisible in ( 1/* Да */
, 0/* Нет */ )) /* Видимая */
/
alter  table MTZ.MTZ_Inst_Section add 
TheDescription
 VARCHAR2 (2048) null /* Комментарий (ToolTip) */
/
alter  table MTZ.MTZ_Inst_Section add 
IsNotDeletable
 NUMBER null 
 check (IsNotDeletable in ( 1/* Да */
, 0/* Нет */ )) /* Обязательная */
/
alter  table MTZ.MTZ_Inst_Section add 
TheTargetPlatform
 NUMBER null 
 check (TheTargetPlatform in ( 2/* JAVA */
, 3/* OTHER */
, 1/* DOTNET */
, 0/* VB6 */ )) /* Целевая платформа */
/
alter  table MTZ.MTZ_Inst_Section add 
IsCustomSection
 NUMBER null 
 check (IsCustomSection in ( 1/* Да */
, 0/* Нет */ )) /* Custom Section */
/
alter  table MTZ.MTZ_Inst_Section add 
CustomSectionInstall CHAR(38) null /* Custom Section Install */
/
alter  table MTZ.MTZ_Inst_Section add 
CustomSectionUnInstall CHAR(38) null /* Custom Section UnInstall */
/


/*Файлы секции*/
drop table MTZ.MTZ_Inst_Sec_Files/**/ 
/
create table MTZ.MTZ_Inst_Sec_Files/**/ (
ParentStructRowID CHAR(38) not null,
MTZ_Inst_Sec_Filesid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
TheSource
 VARCHAR2 (1024) null /* Файл или каталог */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
IsCOM
 NUMBER null 
 check (IsCOM in ( 1/* Да */
, 0/* Нет */ )) /* Является COM объектом */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
HaveToRun
 NUMBER null 
 check (HaveToRun in ( 1/* Да */
, 0/* Нет */ )) /* Обязательно запустить */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
CommanLineParams
 VARCHAR2 (255) null /* Ключи запуска */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
SysstemObject CHAR(38) null /* Объект системы */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
TheApplication CHAR(38) null /* Приложение системы */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
SubDir
 VARCHAR2 (255) null /* Подкаталог */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
IsShortcut
 NUMBER null 
 check (IsShortcut in ( 1/* Да */
, 0/* Нет */ )) /* Ярлык в меню */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
ShortcutName
 VARCHAR2 (255) null /* Имя ярлыка */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
ShortCutInfo
 VARCHAR2 (255) null /* Комментярий ярлыка */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
DefaultInterface
 VARCHAR2 (255) null /* Интерфейс по умолчанию */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
HaveToRunDeinst
 NUMBER null 
 check (HaveToRunDeinst in ( 1/* Да */
, 0/* Нет */ )) /* Запустить при деинсталляции */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
DeinstallComandParam
 VARCHAR2 (255) null /* Ключи деинсталляции */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
IsCustomScript
 NUMBER null 
 check (IsCustomScript in ( 1/* Да */
, 0/* Нет */ )) /* Пользовательский скрипт (см. поле Файл или каталог) */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
CustomScriptInstall CHAR(38) null /* Custom Script Install */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
CustomScriptUnInstall CHAR(38) null /* Custom Script UnInstall */
/
alter  table MTZ.MTZ_Inst_Sec_Files add 
SEQ
 NUMBER null /* Порядок */
/


/*Пользовательские скрипты*/
drop table MTZ.MTZ_Inst_Common/**/ 
/
create table MTZ.MTZ_Inst_Common/**/ (
InstanceID CHAR(38) ,
MTZ_Inst_Commonid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.MTZ_Inst_Common add 
TheName
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.MTZ_Inst_Common add 
TheInstallScript VARCHAR2(4000) null /* Секция инсталляции */
/
alter  table MTZ.MTZ_Inst_Common add 
SEQ
 NUMBER null /* Порядок (сортировка) */
/
alter  table MTZ.MTZ_Inst_Common add 
IsDeinstallUSE
 NUMBER null 
 check (IsDeinstallUSE in ( 1/* Да */
, 0/* Нет */ )) /* Использовать при деинсталляции */
/


/*Описание заказа*/
drop table MTZ.ITTTZ_DEF/*Заголовок файла ранспортного заказа*/ 
/
create table MTZ.ITTTZ_DEF/*Заголовок файла ранспортного заказа*/ (
InstanceID CHAR(38) ,
ITTTZ_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTTZ_DEF add 
Code
 VARCHAR2 (2) null /* Код документа */
/
alter  table MTZ.ITTTZ_DEF add 
Direction
 VARCHAR2 (1) null /* Направление  */
/
alter  table MTZ.ITTTZ_DEF add 
DocDate
 DATE null /* Дата документа */
/
alter  table MTZ.ITTTZ_DEF add 
TheNumber
 VARCHAR2 (8) null /* Номер документа */
/
alter  table MTZ.ITTTZ_DEF add 
SupplierCode
 VARCHAR2 (4) null /* Код поставщика */
/
alter  table MTZ.ITTTZ_DEF add 
TheClient
 VARCHAR2 (255) null /* Клиент */
/


/*Строки транспортного заказа*/
drop table MTZ.ITTTZ_LINES/**/ 
/
create table MTZ.ITTTZ_LINES/**/ (
InstanceID CHAR(38) ,
ITTTZ_LINESid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTTZ_LINES add 
Direction
 VARCHAR2 (1) null /* Направление движения товара */
/
alter  table MTZ.ITTTZ_LINES add 
FileLink
 VARCHAR2 (2) null /* Признак привязки */
/
alter  table MTZ.ITTTZ_LINES add 
TheNumber
 VARCHAR2 (8) null /* Номер накладной */
/
alter  table MTZ.ITTTZ_LINES add 
SupplierCode
 VARCHAR2 (4) null /* Код поставщика */
/
alter  table MTZ.ITTTZ_LINES add 
sequence
 NUMBER null /* Порядковый номер */
/
alter  table MTZ.ITTTZ_LINES add 
TheArticul
 VARCHAR2 (8) null /* Артикул товара */
/
alter  table MTZ.ITTTZ_LINES add 
Quantity
 NUMBER null /* Количество товаров на палете */
/
alter  table MTZ.ITTTZ_LINES add 
EDIZM
 VARCHAR2 (3) null /* Единица учета */
/
alter  table MTZ.ITTTZ_LINES add 
SSCC
 VARCHAR2 (18) null /* SSCC */
/
alter  table MTZ.ITTTZ_LINES add 
Partia
 VARCHAR2 (6) null /* Номер партии */
/


/*Описание оптимизмации*/
drop table MTZ.ITT2OPT_DEF/**/ 
/
create table MTZ.ITT2OPT_DEF/**/ (
InstanceID CHAR(38) ,
ITT2OPT_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITT2OPT_DEF add 
OptType CHAR(38) null /* Тип оптимизации */
/
alter  table MTZ.ITT2OPT_DEF add 
TheRule CHAR(38) null /* Правило формирования партий */
/
alter  table MTZ.ITT2OPT_DEF add 
OPtDate
 DATE null /* Дата создания заявки */
/
alter  table MTZ.ITT2OPT_DEF add 
DateToOptimize
 DATE null /* Плановая дата оптимизации */
/


/*Услуги к заказу*/
drop table MTZ.ITTOUT_SRV/**/ 
/
create table MTZ.ITTOUT_SRV/**/ (
InstanceID CHAR(38) ,
ITTOUT_SRVid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTOUT_SRV add 
SRV CHAR(38) null /* Услуга */
/
alter  table MTZ.ITTOUT_SRV add 
Quantity
 NUMBER null /* Кличество */
/


/*Описание*/
drop table MTZ.ITTOUT_DEF/**/ 
/
create table MTZ.ITTOUT_DEF/**/ (
InstanceID CHAR(38) ,
ITTOUT_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTOUT_DEF add 
ShipOrder VARCHAR2(4000) null /* Заказ на отгрузку */
/
alter  table MTZ.ITTOUT_DEF add 
TheClient VARCHAR2(4000) null /* Клиент */
/
alter  table MTZ.ITTOUT_DEF add 
ProcessDate
 DATE null /* Дата обработки заказа */
/
alter  table MTZ.ITTOUT_DEF add 
Supplier
 VARCHAR2 (255) null /* Поставщик */
/
alter  table MTZ.ITTOUT_DEF add 
TTN
 VARCHAR2 (30) null /* Номер ТТН */
/
alter  table MTZ.ITTOUT_DEF add 
TTNDate
 DATE null /* Дата ТТН */
/
alter  table MTZ.ITTOUT_DEF add 
TranspNumber
 VARCHAR2 (30) null /* № ТС */
/
alter  table MTZ.ITTOUT_DEF add 
Container
 VARCHAR2 (30) null /* № прицепа \ контейнера */
/
alter  table MTZ.ITTOUT_DEF add 
StampNumber
 VARCHAR2 (20) null /* Номер пломбы */
/
alter  table MTZ.ITTOUT_DEF add 
StampStatus
 VARCHAR2 (30) null /* Состояние пломбы */
/
alter  table MTZ.ITTOUT_DEF add 
Track_time_in
 DATE null /* Время прибытия машины */
/
alter  table MTZ.ITTOUT_DEF add 
track_time_out
 DATE null /* Время убытия машины */
/
alter  table MTZ.ITTOUT_DEF add 
temp_in_track
 NUMBER null /* Температура */
/
alter  table MTZ.ITTOUT_DEF add 
ThePartyRule CHAR(38) null /* Правиило формирования партии */
/


/*Поддоны к заказу*/
drop table MTZ.ITTOUT_EPL/**/ 
/
create table MTZ.ITTOUT_EPL/**/ (
InstanceID CHAR(38) ,
ITTOUT_EPLid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTOUT_EPL add 
TheNumber CHAR(38) null /* Палета */
/
alter  table MTZ.ITTOUT_EPL add 
PalWeight
 NUMBER null /* Вес палеты КГ. */
/
alter  table MTZ.ITTOUT_EPL add 
Palet_ID
 NUMBER null /* Идентификатор палеты */
/


/*Строки заказа*/
drop table MTZ.ITTOUT_LINES/**/ 
/
create table MTZ.ITTOUT_LINES/**/ (
InstanceID CHAR(38) ,
ITTOUT_LINESid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTOUT_LINES add 
sequence
 NUMBER null /* № */
/
alter  table MTZ.ITTOUT_LINES add 
LineAtQuery VARCHAR2(4000) null /* Строка в заказе */
/
alter  table MTZ.ITTOUT_LINES add 
QRY_NUM VARCHAR2(4000) null /* По заказу КГ. */
/
alter  table MTZ.ITTOUT_LINES add 
CurValue
 NUMBER null /* Факт КГ. */
/
alter  table MTZ.ITTOUT_LINES add 
articul
 VARCHAR2 (30) null /* Артикул */
/
alter  table MTZ.ITTOUT_LINES add 
edizm
 VARCHAR2 (30) null /* Ед. изм */
/
alter  table MTZ.ITTOUT_LINES add 
vetsved
 VARCHAR2 (50) null /* Номер вет. свидетельства */
/
alter  table MTZ.ITTOUT_LINES add 
made_country CHAR(38) null /* Страна производитель */
/
alter  table MTZ.ITTOUT_LINES add 
made_date_to
 DATE null /* Дата производства ПО */
/
alter  table MTZ.ITTOUT_LINES add 
Factory CHAR(38) null /* Завод */
/
alter  table MTZ.ITTOUT_LINES add 
KILL_NUMBER CHAR(38) null /* № бойни */
/
alter  table MTZ.ITTOUT_LINES add 
VidOtruba
 VARCHAR2 (64) null /* Вид отруба */
/
alter  table MTZ.ITTOUT_LINES add 
PartRef CHAR(38) null /* Партия */
/
alter  table MTZ.ITTOUT_LINES add 
Made_date
 DATE null /* Дата производства C */
/
alter  table MTZ.ITTOUT_LINES add 
exp_date
 DATE null /* Срок годности */
/
alter  table MTZ.ITTOUT_LINES add 
Quanity
 NUMBER null /* Количество коробов */
/
alter  table MTZ.ITTOUT_LINES add 
PackageWeight
 NUMBER null /* Вес одной упаковки */
/
alter  table MTZ.ITTOUT_LINES add 
FullPackageWeight
 NUMBER null /* Суммарный вес упаковки КГ. */
/
alter  table MTZ.ITTOUT_LINES add 
NumInBufZone
 VARCHAR2 (20) null /* Номер в буферной зоне */
/
alter  table MTZ.ITTOUT_LINES add 
good_ID VARCHAR2(4000) null /* Идентификатор товара */
/
alter  table MTZ.ITTOUT_LINES add 
Navalom
 NUMBER null 
 check (Navalom in ( -1/* Да */
, 0/* Нет */ )) /* Груз навалом */
/


/*Палеты к строке*/
drop table MTZ.ITTOUT_PALET/**/ 
/
create table MTZ.ITTOUT_PALET/**/ (
ParentStructRowID CHAR(38) not null,
ITTOUT_PALETid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTOUT_PALET add 
sequence
 NUMBER null /* № П\П */
/
alter  table MTZ.ITTOUT_PALET add 
TheNumber CHAR(38) null /* Палета */
/
alter  table MTZ.ITTOUT_PALET add 
made_country CHAR(38) null /* Страна производитель */
/
alter  table MTZ.ITTOUT_PALET add 
Factory CHAR(38) null /* Завод */
/
alter  table MTZ.ITTOUT_PALET add 
KILL_NUMBER CHAR(38) null /* № бойни */
/
alter  table MTZ.ITTOUT_PALET add 
VidOtruba
 VARCHAR2 (64) null /* Вид отруба */
/
alter  table MTZ.ITTOUT_PALET add 
PartRef CHAR(38) null /* Партия */
/
alter  table MTZ.ITTOUT_PALET add 
vetsved
 VARCHAR2 (50) null /* Номер вет. свидетельства */
/
alter  table MTZ.ITTOUT_PALET add 
Made_date
 DATE null /* Дата производства C */
/
alter  table MTZ.ITTOUT_PALET add 
made_date_to
 DATE null /* Дата производства ПО */
/
alter  table MTZ.ITTOUT_PALET add 
exp_date
 DATE null /* Срок годности */
/
alter  table MTZ.ITTOUT_PALET add 
CaliberQuantity
 NUMBER null /* Количство коробов */
/
alter  table MTZ.ITTOUT_PALET add 
GoodWithPaletWeight
 NUMBER null /* Вес БРУТТО с палетой КГ. */
/
alter  table MTZ.ITTOUT_PALET add 
PackageWeight
 NUMBER null /* Вес одной упаковки КГ. */
/
alter  table MTZ.ITTOUT_PALET add 
FullPackageWeight
 NUMBER null /* Суммарный вес упаковки КГ. */
/
alter  table MTZ.ITTOUT_PALET add 
IsEmpty
 NUMBER null 
 check (IsEmpty in ( -1/* Да */
, 0/* Нет */ )) /* Отгружена полностью */
/
alter  table MTZ.ITTOUT_PALET add 
BufferCell
 VARCHAR2 (20) null /* Адрес буферной ячейки */
/
alter  table MTZ.ITTOUT_PALET add 
StoreCell
 VARCHAR2 (20) null /* Адрес основной ячейки */
/
alter  table MTZ.ITTOUT_PALET add 
ReorgWeight
 NUMBER null /* Вес оставшегося груза с поддоном КГ. */
/
alter  table MTZ.ITTOUT_PALET add 
ReorgCaliberQuantity
 NUMBER null /* Количество оставшихся коробов */
/
alter  table MTZ.ITTOUT_PALET add 
ReorgPackageFullWeight
 NUMBER null /* Суммарный вес оставшейся упаковки КГ. */
/
alter  table MTZ.ITTOUT_PALET add 
IsBrak
 NUMBER null 
 check (IsBrak in ( -1/* Да */
, 0/* Нет */ )) /* Брак */
/
alter  table MTZ.ITTOUT_PALET add 
IsCalibrated
 NUMBER null 
 check (IsCalibrated in ( -1/* Да */
, 0/* Нет */ )) /* Калиброванный товар */
/
alter  table MTZ.ITTOUT_PALET add 
SSCC
 VARCHAR2 (18) null /* SSCC код */
/
alter  table MTZ.ITTOUT_PALET add 
BarCode1
 VARCHAR2 (40) null /* Bar Code 1 */
/
alter  table MTZ.ITTOUT_PALET add 
BarCode2
 VARCHAR2 (40) null /* Bar Code 2 */
/


/*Строки заказа*/
drop table MTZ.ITTIN_QLINE/**/ 
/
create table MTZ.ITTIN_QLINE/**/ (
InstanceID CHAR(38) ,
ITTIN_QLINEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTIN_QLINE add 
sequence
 NUMBER null /* № П\П */
/
alter  table MTZ.ITTIN_QLINE add 
LineAtQuery VARCHAR2(4000) null /* Строка в заказе */
/
alter  table MTZ.ITTIN_QLINE add 
QRY_NUM VARCHAR2(4000) null /* По заказу КГ. */
/
alter  table MTZ.ITTIN_QLINE add 
edizm
 VARCHAR2 (30) null /* Ед. изм */
/
alter  table MTZ.ITTIN_QLINE add 
CurValue
 NUMBER null /* Факт КГ. */
/
alter  table MTZ.ITTIN_QLINE add 
articul
 VARCHAR2 (30) null /* Артикул */
/
alter  table MTZ.ITTIN_QLINE add 
made_country CHAR(38) null /* Страна производитель */
/
alter  table MTZ.ITTIN_QLINE add 
Factory CHAR(38) null /* Завод */
/
alter  table MTZ.ITTIN_QLINE add 
KILL_NUMBER CHAR(38) null /* № бойни */
/
alter  table MTZ.ITTIN_QLINE add 
VidOtruba
 VARCHAR2 (64) null /* Вид отруба */
/
alter  table MTZ.ITTIN_QLINE add 
PartRef CHAR(38) null /* Партия */
/
alter  table MTZ.ITTIN_QLINE add 
vetsved
 VARCHAR2 (50) null /* Номер вет. свидетельства */
/
alter  table MTZ.ITTIN_QLINE add 
Made_date
 DATE null /* Дата производства C */
/
alter  table MTZ.ITTIN_QLINE add 
made_date_to
 DATE null /* Дата производства ПО */
/
alter  table MTZ.ITTIN_QLINE add 
exp_date
 DATE null /* Срок годности */
/
alter  table MTZ.ITTIN_QLINE add 
IsCalibrated
 NUMBER null 
 check (IsCalibrated in ( -1/* Да */
, 0/* Нет */ )) /* Калиброванный груз */
/
alter  table MTZ.ITTIN_QLINE add 
CaliberWeight
 NUMBER null /* Вес калиброванной единицы НЕТТО */
/
alter  table MTZ.ITTIN_QLINE add 
PackageWeight
 NUMBER null /* Вес одной упаковки КГ. */
/
alter  table MTZ.ITTIN_QLINE add 
FullPackageWeight
 NUMBER null /* Суммарный вес упаковки КГ. */
/
alter  table MTZ.ITTIN_QLINE add 
good_id VARCHAR2(4000) null /* Идентификатор товара */
/
alter  table MTZ.ITTIN_QLINE add 
KorobBrutto
 NUMBER null /* Вес брутто короба */
/
alter  table MTZ.ITTIN_QLINE add 
KorobNetto
 NUMBER null /* Вес НЕТТО короба */
/
alter  table MTZ.ITTIN_QLINE add 
Navalom
 NUMBER null 
 check (Navalom in ( -1/* Да */
, 0/* Нет */ )) /* Груз навалом */
/


/*Палеты к строке*/
drop table MTZ.ITTIN_PALET/**/ 
/
create table MTZ.ITTIN_PALET/**/ (
ParentStructRowID CHAR(38) not null,
ITTIN_PALETid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTIN_PALET add 
sequence
 NUMBER null /* № П\П */
/
alter  table MTZ.ITTIN_PALET add 
TheNumber CHAR(38) null /* Палета */
/
alter  table MTZ.ITTIN_PALET add 
made_country CHAR(38) null /* Страна производитель */
/
alter  table MTZ.ITTIN_PALET add 
Factory CHAR(38) null /* Завод */
/
alter  table MTZ.ITTIN_PALET add 
KILL_NUMBER CHAR(38) null /* № бойни */
/
alter  table MTZ.ITTIN_PALET add 
VidOtruba
 VARCHAR2 (64) null /* Вид отруба */
/
alter  table MTZ.ITTIN_PALET add 
PartRef CHAR(38) null /* Партия */
/
alter  table MTZ.ITTIN_PALET add 
vetsved
 VARCHAR2 (50) null /* Номер вет. свидетельства */
/
alter  table MTZ.ITTIN_PALET add 
Made_date
 DATE null /* Дата производства C */
/
alter  table MTZ.ITTIN_PALET add 
made_date_to
 DATE null /* Дата производства ПО */
/
alter  table MTZ.ITTIN_PALET add 
exp_date
 DATE null /* Срок годности */
/
alter  table MTZ.ITTIN_PALET add 
CaliberQuantity
 NUMBER null /* Количство коробов */
/
alter  table MTZ.ITTIN_PALET add 
PalWeight
 NUMBER null /* Вес поддона КГ. */
/
alter  table MTZ.ITTIN_PALET add 
GoodWithPaletWeight
 NUMBER null /* Вес поддона с грузом КГ. */
/
alter  table MTZ.ITTIN_PALET add 
PackageWeight
 NUMBER null /* Вес упаковки КГ. */
/
alter  table MTZ.ITTIN_PALET add 
FullPackageWeight
 NUMBER null /* Суммарный вес упаковки КГ. */
/
alter  table MTZ.ITTIN_PALET add 
BufferZonePlace
 VARCHAR2 (20) null /* Номер ячейки в буферной зоне */
/
alter  table MTZ.ITTIN_PALET add 
Stock_ID
 NUMBER null /* Идентификатор на  складе */
/
alter  table MTZ.ITTIN_PALET add 
palet_id
 NUMBER null /* Идентификатор палеты */
/
alter  table MTZ.ITTIN_PALET add 
IsBrak
 NUMBER null 
 check (IsBrak in ( -1/* Да */
, 0/* Нет */ )) /* Брак */
/
alter  table MTZ.ITTIN_PALET add 
KorobBrutto
 NUMBER null /* Вес брутто короба */
/
alter  table MTZ.ITTIN_PALET add 
KorobNetto
 NUMBER null /* Вес НЕТТО короба */
/
alter  table MTZ.ITTIN_PALET add 
IsCalibrated
 NUMBER null 
 check (IsCalibrated in ( -1/* Да */
, 0/* Нет */ )) /* Калиброванный груз */
/
alter  table MTZ.ITTIN_PALET add 
SSCC
 VARCHAR2 (18) null /* SSCC код */
/
alter  table MTZ.ITTIN_PALET add 
BarCode1
 VARCHAR2 (40) null /* Bar Code 1 */
/
alter  table MTZ.ITTIN_PALET add 
BarCode2
 VARCHAR2 (40) null /* Bar Code 2 */
/


/*Услуги к заказу*/
drop table MTZ.ITTIN_SRV/**/ 
/
create table MTZ.ITTIN_SRV/**/ (
InstanceID CHAR(38) ,
ITTIN_SRVid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTIN_SRV add 
SRV CHAR(38) null /* Услуга */
/
alter  table MTZ.ITTIN_SRV add 
Quantity
 NUMBER null /* Кличество */
/


/*Описание*/
drop table MTZ.ITTIN_DEF/**/ 
/
create table MTZ.ITTIN_DEF/**/ (
InstanceID CHAR(38) ,
ITTIN_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTIN_DEF add 
QryCode VARCHAR2(4000) null /* Код заказа */
/
alter  table MTZ.ITTIN_DEF add 
TheClient VARCHAR2(4000) null /* Клиент */
/
alter  table MTZ.ITTIN_DEF add 
ProcessDate
 DATE null /* Дата обработки заказа */
/
alter  table MTZ.ITTIN_DEF add 
Supplier
 VARCHAR2 (255) null /* Поставщик */
/
alter  table MTZ.ITTIN_DEF add 
TTN
 VARCHAR2 (30) null /* Номер ТТН */
/
alter  table MTZ.ITTIN_DEF add 
TTNDate
 DATE null /* Дата ТТН */
/
alter  table MTZ.ITTIN_DEF add 
TranspNumber
 VARCHAR2 (30) null /* № ТС */
/
alter  table MTZ.ITTIN_DEF add 
Container
 VARCHAR2 (30) null /* № прицепа \ контейнера */
/
alter  table MTZ.ITTIN_DEF add 
StampNumber
 VARCHAR2 (20) null /* Номер пломбы */
/
alter  table MTZ.ITTIN_DEF add 
StampStatus
 VARCHAR2 (30) null /* Состояние пломбы */
/
alter  table MTZ.ITTIN_DEF add 
Track_time_in
 DATE null /* Время прибытия машины */
/
alter  table MTZ.ITTIN_DEF add 
track_time_out
 DATE null /* Время убытия машины */
/
alter  table MTZ.ITTIN_DEF add 
temp_in_track
 NUMBER null /* Температура */
/
alter  table MTZ.ITTIN_DEF add 
ThePartyRule CHAR(38) null /* Правиило формирования партии */
/


/*Поддоны к заказу*/
drop table MTZ.ITTIN_EPL/*Пустые поддоны к заказу*/ 
/
create table MTZ.ITTIN_EPL/*Пустые поддоны к заказу*/ (
InstanceID CHAR(38) ,
ITTIN_EPLid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTIN_EPL add 
TheNumber CHAR(38) null /* Палета */
/
alter  table MTZ.ITTIN_EPL add 
PalWeight
 NUMBER null /* Вес палеты */
/


/*Строки привязки паллет*/
drop table MTZ.ITTSSCC_LINE/**/ 
/
create table MTZ.ITTSSCC_LINE/**/ (
InstanceID CHAR(38) ,
ITTSSCC_LINEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTSSCC_LINE add 
PalletCode
 VARCHAR2 (20) null /* Код паллетты */
/
alter  table MTZ.ITTSSCC_LINE add 
Barcode1
 VARCHAR2 (40) null /* Баркод 1 */
/
alter  table MTZ.ITTSSCC_LINE add 
Barcode2
 VARCHAR2 (40) null /* Баркод 2 */
/
alter  table MTZ.ITTSSCC_LINE add 
Processed
 NUMBER null 
 check (Processed in ( -1/* Да */
, 0/* Нет */ )) /* Обработан */
/
alter  table MTZ.ITTSSCC_LINE add 
Result VARCHAR2(4000) null /* Результат обработки */
/


/*Описание привязки*/
drop table MTZ.ITTSSCC_DEF/**/ 
/
create table MTZ.ITTSSCC_DEF/**/ (
InstanceID CHAR(38) ,
ITTSSCC_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ITTSSCC_DEF add 
TheDate
 DATE null /* Дата */
/
alter  table MTZ.ITTSSCC_DEF add 
TheUser CHAR(38) null /* Пользователь */
/
alter  table MTZ.ITTSSCC_DEF add 
TCode
 VARCHAR2 (255) null /* Код терминала */
/


/*Арм*/
drop table MTZ.WorkPlace/*Арм*/ 
/
create table MTZ.WorkPlace/*Арм*/ (
InstanceID CHAR(38) ,
WorkPlaceid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WorkPlace add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.WorkPlace add 
Caption
 VARCHAR2 (255) null /* Заголовок */
/
alter  table MTZ.WorkPlace add 
TheVersion
 VARCHAR2 (30) null /* Версия */
/
alter  table MTZ.WorkPlace add 
ThePlatform
 NUMBER null 
 check (ThePlatform in ( 2/* JAVA */
, 3/* OTHER */
, 1/* DOTNET */
, 0/* VB6 */ )) /* Платформа реализации */
/
alter  table MTZ.WorkPlace add 
TheComment VARCHAR2(4000) null /* Примечание */
/


/*Меню*/
drop table MTZ.EntryPoints/*Меню*/ 
/
create table MTZ.EntryPoints/*Меню*/ (
InstanceID CHAR(38) ,
EntryPointsid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
/
alter  table MTZ.EntryPoints add 
sequence
 NUMBER null /* Последовательность */
/
alter  table MTZ.EntryPoints add 
Name
 VARCHAR2 (38) null /* Название */
/
alter  table MTZ.EntryPoints add 
Caption
 VARCHAR2 (255) null /* Заголовок */
/
alter  table MTZ.EntryPoints add 
AsToolbarItem
 NUMBER null 
 check (AsToolbarItem in ( -1/* Да */
, 0/* Нет */ )) /* Включить в тулбар */
/
alter  table MTZ.EntryPoints add 
ActionType
 NUMBER null 
 check (ActionType in ( 5/* Открыть отчет */
, 0/* Ничего не делать */
, 2/* Выполнить метод */
, 1/* Открыть документ */
, 4/* Запустить АРМ */
, 3/* Открыть журнал */ )) /* Вариант действия */
/
alter  table MTZ.EntryPoints add 
TheFilter CHAR(38) null /* Фильтр */
/
alter  table MTZ.EntryPoints add 
Journal CHAR(38) null /* Журнал */
/
alter  table MTZ.EntryPoints add 
Report CHAR(38) null /* Отчет */
/
alter  table MTZ.EntryPoints add 
Document CHAR(38) null /* Документ */
/
alter  table MTZ.EntryPoints add 
Method CHAR(38) null /* Метод */
/
alter  table MTZ.EntryPoints add 
IconFile
 VARCHAR2 (2000) null /* Файл картинки */
/
alter  table MTZ.EntryPoints add 
TheExtention CHAR(38) null /* Расширение */
/
alter  table MTZ.EntryPoints add 
ARM CHAR(38) null /* АРМ */
/
alter  table MTZ.EntryPoints add 
TheComment VARCHAR2(4000) null /* Примечание */
/
alter  table MTZ.EntryPoints add 
ObjectType CHAR(38) null /* Тип документа */
/
alter  table MTZ.EntryPoints add 
JournalFixedQuery VARCHAR2(4000) null /* Ограничения к журналу */
/


/*Привязка фильтра*/
drop table MTZ.EPFilterLink/*Привязка фильтра к журналу*/ 
/
create table MTZ.EPFilterLink/*Привязка фильтра к журналу*/ (
ParentStructRowID CHAR(38) not null,
EPFilterLinkid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.EPFilterLink add 
RowSource
 VARCHAR2 (255) null /* Источник */
/
alter  table MTZ.EPFilterLink add 
TheExpression VARCHAR2(4000) null /* Выражение */
/
alter  table MTZ.EPFilterLink add 
FilterField
 VARCHAR2 (255) null /* Поле фильтра */
/


/*Список типов*/
drop table MTZ.ARMTypes/*Типы документов, которые подключаются в MDI режиме*/ 
/
create table MTZ.ARMTypes/*Типы документов, которые подключаются в MDI режиме*/ (
InstanceID CHAR(38) ,
ARMTypesid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ARMTypes add 
TheDocumentType CHAR(38) null /* Тип документа */
/


/*Поведение журналов*/
drop table MTZ.ARMJournal/*Описание действий журанлов*/ 
/
create table MTZ.ARMJournal/*Описание действий журанлов*/ (
InstanceID CHAR(38) ,
ARMJournalid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ARMJournal add 
TheJournal CHAR(38) null /* Журнал */
/


/*Добавление*/
drop table MTZ.ARMJRNLADD/*Варианты обработки добавления*/ 
/
create table MTZ.ARMJRNLADD/*Варианты обработки добавления*/ (
ParentStructRowID CHAR(38) not null,
ARMJRNLADDid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ARMJRNLADD add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.ARMJRNLADD add 
TheExtention CHAR(38) null /* Расширение */
/


/*Отчеты*/
drop table MTZ.ARMJRNLREP/*Отчеты из журнала*/ 
/
create table MTZ.ARMJRNLREP/*Отчеты из журнала*/ (
ParentStructRowID CHAR(38) not null,
ARMJRNLREPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ARMJRNLREP add 
repname
 VARCHAR2 (255) null /* Название отчета */
/
alter  table MTZ.ARMJRNLREP add 
TheReport CHAR(38) null /* Отчет */
/


/*Действия*/
drop table MTZ.ARMJRNLRUN/*Дополнительные действия в журнале*/ 
/
create table MTZ.ARMJRNLRUN/*Дополнительные действия в журнале*/ (
ParentStructRowID CHAR(38) not null,
ARMJRNLRUNid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ARMJRNLRUN add 
Name
 VARCHAR2 (255) null /* Название */
/
alter  table MTZ.ARMJRNLRUN add 
TheExtention CHAR(38) null /* Расширение */
/


/*Список рассылки*/
drop table MTZ.WEBS_MAILLIST/**/ 
/
create table MTZ.WEBS_MAILLIST/**/ (
InstanceID CHAR(38) ,
WEBS_MAILLISTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBS_MAILLIST add 
Email
 VARCHAR2 (512) null /* Адрес */
/


/*Roles*/
drop table MTZ.WEBS_ROLES/*Роли*/ 
/
create table MTZ.WEBS_ROLES/*Роли*/ (
InstanceID CHAR(38) ,
WEBS_ROLESid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBS_ROLES add 
Name
 VARCHAR2 (256) null /* Название */
/
alter  table MTZ.WEBS_ROLES add 
RoleDescription VARCHAR2(4000) null /* Описание */
/


/*Страница сайта*/
drop table MTZ.WEBS_PAGEDEF/**/ 
/
create table MTZ.WEBS_PAGEDEF/**/ (
InstanceID CHAR(38) ,
WEBS_PAGEDEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
/
alter  table MTZ.WEBS_PAGEDEF add 
QueueNumber
 NUMBER null /* Номер п/п */
/
alter  table MTZ.WEBS_PAGEDEF add 
Name
 VARCHAR2 (256) null /* Название */
/
alter  table MTZ.WEBS_PAGEDEF add 
Url
 VARCHAR2 (1024) null /* Урл */
/
alter  table MTZ.WEBS_PAGEDEF add 
Title
 VARCHAR2 (256) null /* Титул */
/
alter  table MTZ.WEBS_PAGEDEF add 
ShortName
 VARCHAR2 (256) null /* Короткое название */
/
alter  table MTZ.WEBS_PAGEDEF add 
ObjectName CHAR(38) null /* Имя объекта */
/
alter  table MTZ.WEBS_PAGEDEF add 
ObjectCode CHAR(38) null /* Имя раздела */
/
alter  table MTZ.WEBS_PAGEDEF add 
AllowHeader
 NUMBER null 
 check (AllowHeader in ( -1/* Да */
, 0/* Нет */ )) /* Выводить заголовок */
/
alter  table MTZ.WEBS_PAGEDEF add 
the_Mode
 VARCHAR2 (256) null /* Режим работы */
/
alter  table MTZ.WEBS_PAGEDEF add 
PageType CHAR(38) null /* Тип */
/
alter  table MTZ.WEBS_PAGEDEF add 
ControlPath
 VARCHAR2 (256) null /* Контрол */
/
alter  table MTZ.WEBS_PAGEDEF add 
SelectIDParameterName
 VARCHAR2 (256) null /* Имя параметра для передачи в форму редактирования */
/
alter  table MTZ.WEBS_PAGEDEF add 
PageContent VARCHAR2(4000) null /* Cодержимое */
/
alter  table MTZ.WEBS_PAGEDEF add 
AllowAddPage
 NUMBER null 
 check (AllowAddPage in ( -1/* Да */
, 0/* Нет */ )) /* Разрешено добавлять страницы */
/
alter  table MTZ.WEBS_PAGEDEF add 
the_IsLocked
 NUMBER null 
 check (the_IsLocked in ( -1/* Да */
, 0/* Нет */ )) /* Заблокирована */
/
alter  table MTZ.WEBS_PAGEDEF add 
IsOnMap
 NUMBER null 
 check (IsOnMap in ( -1/* Да */
, 0/* Нет */ )) /* Отображать на карте сайта */
/
alter  table MTZ.WEBS_PAGEDEF add 
IsShowHisory
 NUMBER null 
 check (IsShowHisory in ( -1/* Да */
, 0/* Нет */ )) /* Отобразить историю */
/
alter  table MTZ.WEBS_PAGEDEF add 
RedirectToFirstChild
 NUMBER null 
 check (RedirectToFirstChild in ( -1/* Да */
, 0/* Нет */ )) /* Перейти на первую дочернюю страницу */
/


/*Картинки*/
drop table MTZ.WEBS_PICS/**/ 
/
create table MTZ.WEBS_PICS/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_PICSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBS_PICS add 
Name
 VARCHAR2 (512) null /* Название */
/
alter  table MTZ.WEBS_PICS add 
FileContent VARCHAR2(4000) null /* Файл */
/
alter  table MTZ.WEBS_PICS add 
 FileContent_EXT varchar2(4) null
/


/*Отношения с меню*/
drop table MTZ.WEBS_PAGEMENU/**/ 
/
create table MTZ.WEBS_PAGEMENU/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_PAGEMENUid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBS_PAGEMENU add 
AllowInMenu
 NUMBER null 
 check (AllowInMenu in ( -1/* Да */
, 0/* Нет */ )) /* В меню */
/
alter  table MTZ.WEBS_PAGEMENU add 
AllowInBottomMenu
 NUMBER null 
 check (AllowInBottomMenu in ( -1/* Да */
, 0/* Нет */ )) /* В нижнем меню */
/
alter  table MTZ.WEBS_PAGEMENU add 
UsePartRowsInMenu
 NUMBER null 
 check (UsePartRowsInMenu in ( -1/* Да */
, 0/* Нет */ )) /* Развернуть строки в меню */
/
alter  table MTZ.WEBS_PAGEMENU add 
UsePartRowsEditForm CHAR(38) null /* Страница для редактирования */
/
alter  table MTZ.WEBS_PAGEMENU add 
UsePartRowsTextField
 VARCHAR2 (256) null /* Поле текста ссылки */
/
alter  table MTZ.WEBS_PAGEMENU add 
UsePartRowsRowIDField
 VARCHAR2 (256) null /* Поле ID */
/
alter  table MTZ.WEBS_PAGEMENU add 
UsePartRowsSort
 VARCHAR2 (256) null /* Сортировка строк части */
/


/*Содержимое*/
drop table MTZ.WEBS_PAGECONTENT/**/ 
/
create table MTZ.WEBS_PAGECONTENT/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_PAGECONTENTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBS_PAGECONTENT add 
Content
 VARCHAR2 (8000) null /* Содержимое */
/


/*Параметры*/
drop table MTZ.WEBS_PAGEPARS/**/ 
/
create table MTZ.WEBS_PAGEPARS/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_PAGEPARSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBS_PAGEPARS add 
Name
 VARCHAR2 (256) null /* Имя */
/
alter  table MTZ.WEBS_PAGEPARS add 
TheValue
 VARCHAR2 (256) null /* Значение */
/


/*Компоненты*/
drop table MTZ.WEBS_PAGECOMP/**/ 
/
create table MTZ.WEBS_PAGECOMP/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_PAGECOMPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBS_PAGECOMP add 
Name
 VARCHAR2 (256) null /* Название */
/
alter  table MTZ.WEBS_PAGECOMP add 
Title
 VARCHAR2 (256) null /* Титул */
/
alter  table MTZ.WEBS_PAGECOMP add 
Selected
 NUMBER null 
 check (Selected in ( -1/* Да */
, 0/* Нет */ )) /* Активен */
/
alter  table MTZ.WEBS_PAGECOMP add 
IsCollection
 NUMBER null 
 check (IsCollection in ( -1/* Да */
, 0/* Нет */ )) /* Коллекция */
/
alter  table MTZ.WEBS_PAGECOMP add 
the_PartName CHAR(38) null /* Раздел */
/
alter  table MTZ.WEBS_PAGECOMP add 
IDField
 VARCHAR2 (256) null /* Поле ID */
/
alter  table MTZ.WEBS_PAGECOMP add 
UserIdField
 VARCHAR2 (256) null /* поле UserID */
/
alter  table MTZ.WEBS_PAGECOMP add 
Visible
 NUMBER null 
 check (Visible in ( -1/* Да */
, 0/* Нет */ )) /* Видимость */
/


/*Табличная часть*/
drop table MTZ.TablePart/**/ 
/
create table MTZ.TablePart/**/ (
ParentStructRowID CHAR(38) not null,
TablePartid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.TablePart add 
FilterUserIDFieldName_
 VARCHAR2 (256) null /* Имя поля для фильтра UserID */
/
alter  table MTZ.TablePart add 
Filter_
 VARCHAR2 (256) null /* Фильтр */
/
alter  table MTZ.TablePart add 
SelectIDParameterName
 VARCHAR2 (256) null /* Параметр для передачи ID */
/
alter  table MTZ.TablePart add 
EditForm CHAR(38) null /* Страница для редактирования */
/
alter  table MTZ.TablePart add 
AllowDelete
 NUMBER null 
 check (AllowDelete in ( -1/* Да */
, 0/* Нет */ )) /* Разрешено удаление */
/
alter  table MTZ.TablePart add 
AllowAddNew
 NUMBER null 
 check (AllowAddNew in ( -1/* Да */
, 0/* Нет */ )) /* Разрешено добавление */
/
alter  table MTZ.TablePart add 
AddStatusColumn_
 NUMBER null 
 check (AddStatusColumn_ in ( -1/* Да */
, 0/* Нет */ )) /* Есть Status колонка */
/
alter  table MTZ.TablePart add 
AllowEditRowStatusNameValue
 VARCHAR2 (256) null /* Значение Status для редактирования */
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
 check (AllowEditUserClientDef in ( -1/* Да */
, 0/* Нет */ )) /* AllowEditUserClientDef */
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


/*Замены*/
drop table MTZ.ReplaceValues/**/ 
/
create table MTZ.ReplaceValues/**/ (
ParentStructRowID CHAR(38) not null,
ReplaceValuesid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ReplaceValues add 
Name
 VARCHAR2 (256) null /* Поле */
/
alter  table MTZ.ReplaceValues add 
SourceName
 VARCHAR2 (256) null /* Поле источник */
/


/*Запрещённые для редактирования поля*/
drop table MTZ.DenyEdit/**/ 
/
create table MTZ.DenyEdit/**/ (
ParentStructRowID CHAR(38) not null,
DenyEditid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.DenyEdit add 
Name
 VARCHAR2 (256) null /* Значение */
/


/*Невидимые поля*/
drop table MTZ.DenyVisible/**/ 
/
create table MTZ.DenyVisible/**/ (
ParentStructRowID CHAR(38) not null,
DenyVisibleid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.DenyVisible add 
Name
 VARCHAR2 (256) null /* Имя поля */
/


/*Значения поля, разрешающего редактирование*/
drop table MTZ.AllowEditFieldValues/*Значения поля, разрешающего редактирование*/ 
/
create table MTZ.AllowEditFieldValues/*Значения поля, разрешающего редактирование*/ (
ParentStructRowID CHAR(38) not null,
AllowEditFieldValuesid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.AllowEditFieldValues add 
Name
 VARCHAR2 (256) null /* Значение */
/


/*Комбобоксы*/
drop table MTZ.ComboFields/**/ 
/
create table MTZ.ComboFields/**/ (
ParentStructRowID CHAR(38) not null,
ComboFieldsid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.ComboFields add 
Name
 VARCHAR2 (256) null /* Поле */
/
alter  table MTZ.ComboFields add 
SourceName
 VARCHAR2 (256) null /* Поле источник */
/


/*Users*/
drop table MTZ.WEBS_USERS/**/ 
/
create table MTZ.WEBS_USERS/**/ (
InstanceID CHAR(38) ,
WEBS_USERSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
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
 VARCHAR2 (256) null /* Организация */
/
alter  table MTZ.WEBS_USERS add 
FirstName
 VARCHAR2 (256) null /* Имя */
/
alter  table MTZ.WEBS_USERS add 
SecondName
 VARCHAR2 (256) null /* Отчество */
/
alter  table MTZ.WEBS_USERS add 
LastName
 VARCHAR2 (256) null /* Фамилия */
/
alter  table MTZ.WEBS_USERS add 
UserDescription VARCHAR2(4000) null /* Примечания */
/


/*Анкеты*/
drop table MTZ.WEBS_ANKETA/**/ 
/
create table MTZ.WEBS_ANKETA/**/ (
InstanceID CHAR(38) ,
WEBS_ANKETAid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBS_ANKETA add 
Name
 VARCHAR2 (256) null /* Название */
/
alter  table MTZ.WEBS_ANKETA add 
the_Description
 VARCHAR2 (4000) null /* Описание */
/
alter  table MTZ.WEBS_ANKETA add 
AnketaDef CHAR(38) null /* Анкета */
/
alter  table MTZ.WEBS_ANKETA add 
Message
 VARCHAR2 (156) null /* Сообщение */
/


/*Вопросы*/
drop table MTZ.WEBS_QUESTIONS/**/ 
/
create table MTZ.WEBS_QUESTIONS/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_QUESTIONSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBS_QUESTIONS add 
the_Number
 NUMBER null /* Номер  */
/
alter  table MTZ.WEBS_QUESTIONS add 
QuestionType CHAR(38) null /* Тип */
/
alter  table MTZ.WEBS_QUESTIONS add 
Name
 VARCHAR2 (1024) null /* Имя */
/
alter  table MTZ.WEBS_QUESTIONS add 
Required
 NUMBER null 
 check (Required in ( -1/* Да */
, 0/* Нет */ )) /* Обязательность */
/
alter  table MTZ.WEBS_QUESTIONS add 
Style
 VARCHAR2 (256) null /* Стиль */
/


/*Ответы*/
drop table MTZ.WEBS_ANSWERS/**/ 
/
create table MTZ.WEBS_ANSWERS/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_ANSWERSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBS_ANSWERS add 
the_Number
 NUMBER null /* Номер  */
/
alter  table MTZ.WEBS_ANSWERS add 
Name
 VARCHAR2 (1024) null /* Значение  */
/
alter  table MTZ.WEBS_ANSWERS add 
the_Description
 VARCHAR2 (4000) null /* Описание  */
/


/*Документы для скачивания*/
drop table MTZ.WEBS_DDOC/*Список документов которые можно скачать*/ 
/
create table MTZ.WEBS_DDOC/*Список документов которые можно скачать*/ (
InstanceID CHAR(38) ,
WEBS_DDOCid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.WEBS_DDOC add 
Name
 VARCHAR2 (512) null /* Название */
/
alter  table MTZ.WEBS_DDOC add 
FileName
 VARCHAR2 (1024) null /* Имя файла */
/
alter  table MTZ.WEBS_DDOC add 
FileContract VARCHAR2(4000) null /* Файл */
/
alter  table MTZ.WEBS_DDOC add 
 FileContract_EXT varchar2(4) null
/
alter  table MTZ.WEBS_DDOC add 
Title
 VARCHAR2 (512) null /* Заголовок для ссылки */
/


/*Новости*/
drop table MTZ.WEBS_NEWS/*Древовидный список новостей*/ 
/
create table MTZ.WEBS_NEWS/*Древовидный список новостей*/ (
InstanceID CHAR(38) ,
WEBS_NEWSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
/
alter  table MTZ.WEBS_NEWS add 
QueueNumber
 NUMBER null /* Номер п/п */
/
alter  table MTZ.WEBS_NEWS add 
Name
 VARCHAR2 (256) null /* Название */
/
alter  table MTZ.WEBS_NEWS add 
Title
 VARCHAR2 (256) null /* Титул */
/
alter  table MTZ.WEBS_NEWS add 
ShortName
 VARCHAR2 (256) null /* Короткое название */
/
alter  table MTZ.WEBS_NEWS add 
the_Mode
 VARCHAR2 (256) null /* Режим работы */
/
alter  table MTZ.WEBS_NEWS add 
PageContent VARCHAR2(4000) null /* Cодержимое */
/
alter  table MTZ.WEBS_NEWS add 
the_IsLocked
 NUMBER null 
 check (the_IsLocked in ( -1/* Да */
, 0/* Нет */ )) /* Заблокирована */
/
alter  table MTZ.WEBS_NEWS add 
IsShowHisory
 NUMBER null 
 check (IsShowHisory in ( -1/* Да */
, 0/* Нет */ )) /* Отобразить историю */
/
alter  table MTZ.WEBS_NEWS add 
NewsDate
 DATE null /* Дата */
/
alter  table MTZ.WEBS_NEWS add 
NewsDescription VARCHAR2(4000) null /* Описание */
/


/*Картинки*/
drop table MTZ.NEWS_PICS/**/ 
/
create table MTZ.NEWS_PICS/**/ (
ParentStructRowID CHAR(38) not null,
NEWS_PICSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
/
alter  table MTZ.NEWS_PICS add 
Name
 VARCHAR2 (512) null /* Название */
/
alter  table MTZ.NEWS_PICS add 
FileContent VARCHAR2(4000) null /* Файл */
/
alter  table MTZ.NEWS_PICS add 
 FileContent_EXT varchar2(4) null
/




