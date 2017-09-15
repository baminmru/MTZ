
/* --body*/

 

/*Группа полей фильтра*/
drop table FilterFieldGroup/*Группа полей фильтра*/ 
;
create table FilterFieldGroup/*Группа полей фильтра*/ (
InstanceID CHAR(38) ,
FilterFieldGroupid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table FilterFieldGroup add 
sequence
 integer null /* Последовательность */
;
alter  table FilterFieldGroup add 
Name
 VARCHAR (64) null /* Название */
;
alter  table FilterFieldGroup add 
Caption
 VARCHAR (255) null /* Заголовок */
;
alter  table FilterFieldGroup add 
AllowIgnore null 
 check (AllowIgnore in ( -1/* Да */
, 0/* Нет */ )) /* Можно отключать */
;


/*Поле фильтра*/
drop table FileterField/*Поле фильтра*/ 
;
create table FileterField/*Поле фильтра*/ (
ParentStructRowID CHAR(38) not null,
FileterFieldid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table FileterField add 
sequence
 integer null /* Последовательность */
;
alter  table FileterField add 
Name
 VARCHAR (255) null /* Название */
;
alter  table FileterField add 
Caption
 VARCHAR (255) null /* Заголовок */
;
alter  table FileterField add 
FieldType null /* Тип поля */
;
alter  table FileterField add 
FieldSize
 integer null /* Размер */
;
alter  table FileterField add 
RefType
 INTEGER null 
 check (RefType in ( 2/* На строку раздела */
, 3/* На источник данных */
, 0/* Скалярное поле ( не ссылка) */
, 1/* На объект  */ )) /* Тип ссылки */
;
alter  table FileterField add 
RefToType null /* Тип, куда ссылаемся */
;
alter  table FileterField add 
RefToPart null /* Раздел, куда ссылаемся */
;
alter  table FileterField add 
ValueArray null 
 check (ValueArray in ( -1/* Да */
, 0/* Нет */ )) /* Массив значений */
;


/*Фильтр*/
drop table Filters/*Фильтр*/ 
;
create table Filters/*Фильтр*/ (
InstanceID CHAR(38) ,
Filtersid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table Filters add 
Name
 VARCHAR (255) null /* Название */
;
alter  table Filters add 
TheCaption
 VARCHAR (80) null /* Заголовок */
;
alter  table Filters add 
TheComment null /* Описание */
;


/*Описание формы*/
drop table PEK103_DEF/*Описание формы*/ 
;
create table PEK103_DEF/*Описание формы*/ (
InstanceID CHAR(38) ,
PEK103_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEK103_DEF add 
TheNumber
 integer null /* Номер */
;
alter  table PEK103_DEF add 
Sender null /* Отправитель */
;
alter  table PEK103_DEF add 
RcvDate
 DATETIME null /* Дата подачи заявки */
;
alter  table PEK103_DEF add 
Coment null /* Примечание */
;
alter  table PEK103_DEF add 
NodeDate
 DATETIME null /* Дата приемки  */
;
alter  table PEK103_DEF add 
PEKZ null /* Заявка */
;
alter  table PEK103_DEF add 
ThePath null /* Строка маршрута */
;


/*Cтроки формы*/
drop table PEK103_LINES/*Cтроки формы*/ 
;
create table PEK103_LINES/*Cтроки формы*/ (
InstanceID CHAR(38) ,
PEK103_LINESid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEK103_LINES add 
Seqence
 integer null /* № п\п */
;
alter  table PEK103_LINES add 
IndexTo null /* Станция назначения */
;
alter  table PEK103_LINES add 
Reciever
 VARCHAR (255) null /* Получатель */
;
alter  table PEK103_LINES add 
Weight null /* Вес */
;
alter  table PEK103_LINES add 
WeightEDIZM null /* Ед. изм. веса */
;
alter  table PEK103_LINES add 
Quantity null /* Количество */
;
alter  table PEK103_LINES add 
Cost null /* Стоимость перевозки */
;
alter  table PEK103_LINES add 
PPOCode
 VARCHAR (14) null /* Код отправления */
;


/*Блоки сообщений*/
drop table WEBC_BLOCK/*Блоки сообщений*/ 
;
create table WEBC_BLOCK/*Блоки сообщений*/ (
InstanceID CHAR(38) ,
WEBC_BLOCKid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBC_BLOCK add 
name
 VARCHAR (255) null /* Название блока */
;
alter  table WEBC_BLOCK add 
Info null /* Содержание */
;


/*Новости*/
drop table WEBC_NEWS/*Новости*/ 
;
create table WEBC_NEWS/*Новости*/ (
InstanceID CHAR(38) ,
WEBC_NEWSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBC_NEWS add 
TheDate
 DATETIME null /* Дата */
;
alter  table WEBC_NEWS add 
ShortName
 VARCHAR (128) null /* Краткое название */
;
alter  table WEBC_NEWS add 
Info null /* Содержание */
;
alter  table WEBC_NEWS add 
Accept null 
 check (Accept in ( -1/* Да */
, 0/* Нет */ )) /* Разрешена публикация */
;
alter  table WEBC_NEWS add 
Annotation
 VARCHAR (255) null /* Краткое сообщение */
;


/*Вакансии*/
drop table WEBC_JOB/*Вакансии*/ 
;
create table WEBC_JOB/*Вакансии*/ (
InstanceID CHAR(38) ,
WEBC_JOBid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBC_JOB add 
JobDate
 DATETIME null /* Дата */
;
alter  table WEBC_JOB add 
JobName
 VARCHAR (256) null /* Название */
;
alter  table WEBC_JOB add 
JobCity
 VARCHAR (1024) null /* Город */
;
alter  table WEBC_JOB add 
JobSex
 INTEGER null 
 check (JobSex in ( 1/* Мужской */
, 0/* Не существенно */
, -1/* Женский */ )) /* Пол */
;
alter  table WEBC_JOB add 
JobAge
 VARCHAR (64) null /* Возраст */
;
alter  table WEBC_JOB add 
JobEducation null 
 check (JobEducation in ( 2/* Среднее специальное */
, 1/* Среднее */
, -1/* Не важно */
, 4/* Высшее */
, 0/* Неполное среднее */
, 3/* Неполное высшее */
, 5/* Несколько высших */ )) /* Образование */
;
alter  table WEBC_JOB add 
JobExperience
 VARCHAR (1024) null /* Опыт работы */
;
alter  table WEBC_JOB add 
JobEmployment null 
 check (JobEmployment in ( 0/* Полная */
, 1/* Частичная */
, -1/* Не важно */ )) /* Занятость */
;
alter  table WEBC_JOB add 
JobCompensation
 VARCHAR (256) null /* Зарплата */
;
alter  table WEBC_JOB add 
JobDescription
 VARCHAR (2000) null /* Описание */
;
alter  table WEBC_JOB add 
JobActual
 integer null 
 check (JobActual in ( 1/* Да */
, 0/* Нет */ )) /* Актуальность */
;


/*Сообщения*/
drop table WEBC_MESSAGES/*Сообщения от посетителей*/ 
;
create table WEBC_MESSAGES/*Сообщения от посетителей*/ (
InstanceID CHAR(38) ,
WEBC_MESSAGESid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBC_MESSAGES add 
MESSAGES_FIO
 VARCHAR (256) null /* Фамилия, имя, отчество */
;
alter  table WEBC_MESSAGES add 
MESSAGES_Email
 VARCHAR (256) null /* Адрес электронной почты */
;
alter  table WEBC_MESSAGES add 
MESSAGES_TEL
 VARCHAR (256) null /* Телефон */
;
alter  table WEBC_MESSAGES add 
MESSAGES_City
 VARCHAR (256) null /* Город */
;
alter  table WEBC_MESSAGES add 
MESSAGES_Org
 VARCHAR (256) null /* Название организации */
;
alter  table WEBC_MESSAGES add 
MESSAGES_Position
 VARCHAR (256) null /* Специальность/должность */
;
alter  table WEBC_MESSAGES add 
MESSAGES_Text
 VARCHAR (2000) null /* Сообщение */
;


/*Документы*/
drop table WEBC_DOCS/*Документы*/ 
;
create table WEBC_DOCS/*Документы*/ (
InstanceID CHAR(38) ,
WEBC_DOCSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBC_DOCS add 
DocsNum
 integer null /* № */
;
alter  table WEBC_DOCS add 
DocsName
 VARCHAR (1024) null /* Название */
;
alter  table WEBC_DOCS add 
DocsFileName
 VARCHAR (1024) null /* Имя файла */
;
alter  table WEBC_DOCS add 
DocsFileSize null /* Размер */
;
alter  table WEBC_DOCS add 
DocsFileDate
 DATETIME null /* Дата  */
;
alter  table WEBC_DOCS add 
DocsDescription
 VARCHAR (1024) null /* Примечания */
;
alter  table WEBC_DOCS add 
DocsActual
 integer null 
 check (DocsActual in ( 1/* Да */
, 0/* Нет */ )) /* Актуальность */
;


/*Офис и филиалы*/
drop table WEBC_FILIALS/*Офис и филиалы*/ 
;
create table WEBC_FILIALS/*Офис и филиалы*/ (
InstanceID CHAR(38) ,
WEBC_FILIALSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBC_FILIALS add 
OfficeName
 VARCHAR (1024) null /* Название */
;
alter  table WEBC_FILIALS add 
OfficeCity
 VARCHAR (1024) null /* Город */
;
alter  table WEBC_FILIALS add 
OfficeAddress
 VARCHAR (1024) null /* Адрес */
;
alter  table WEBC_FILIALS add 
OfficeTelefons
 VARCHAR (1024) null /* Телефоны */
;
alter  table WEBC_FILIALS add 
OfficeSmallImage
 VARCHAR (1024) null /* URL картинки со схемой */
;
alter  table WEBC_FILIALS add 
OfficeBigImage
 VARCHAR (1024) null /* URL картинки увеличенной */
;
alter  table WEBC_FILIALS add 
OfficeNum
 integer null /* № */
;
alter  table WEBC_FILIALS add 
ReferFilial null /* Ссылка на филиал */
;
alter  table WEBC_FILIALS add 
EMailManag varchar(255) null /* EMail менеджера */
;
alter  table WEBC_FILIALS add 
EMailAddit varchar(255) null /* Дополнительный EMail */
;


/*Ссылки*/
drop table WEBC_LINKS/*Ссылки*/ 
;
create table WEBC_LINKS/*Ссылки*/ (
InstanceID CHAR(38) ,
WEBC_LINKSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBC_LINKS add 
LinkName
 VARCHAR (1024) null /* Название */
;
alter  table WEBC_LINKS add 
LinkURL
 VARCHAR (1024) null /* Ссылка */
;
alter  table WEBC_LINKS add 
LinkDescription
 VARCHAR (2048) null /* Описание */
;


/*Затраты*/
drop table VRRPT_COSTS/*Затраты*/ 
;
create table VRRPT_COSTS/*Затраты*/ (
InstanceID CHAR(38) ,
VRRPT_COSTSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRRPT_COSTS add 
Descrtiption null /* Описание */
;
alter  table VRRPT_COSTS add 
Cost null /* Стоимость */
;
alter  table VRRPT_COSTS add 
Duration null /* Длительность (час.) */
;


/*Планируемые встречи*/
drop table VRRPT_MeetingPlan/*Планируемые встречи*/ 
;
create table VRRPT_MeetingPlan/*Планируемые встречи*/ (
InstanceID CHAR(38) ,
VRRPT_MeetingPlanid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRRPT_MeetingPlan add 
DateOF
 DATETIME null /* Время встречи */
;
alter  table VRRPT_MeetingPlan add 
PlaceOf null /* Место проведения */
;
alter  table VRRPT_MeetingPlan add 
theme null /* Тема */
;


/*Участники*/
drop table VRRPT_Meeters/*Участники*/ 
;
create table VRRPT_Meeters/*Участники*/ (
ParentStructRowID CHAR(38) not null,
VRRPT_Meetersid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRRPT_Meeters add 
Worker null /* Сотрудник */
;
alter  table VRRPT_Meeters add 
Contact null /* Контактное лицо */
;
alter  table VRRPT_Meeters add 
Mandatory null 
 check (Mandatory in ( -1/* Да */
, 0/* Нет */ )) /* Обязательно */
;
alter  table VRRPT_Meeters add 
ReminderTime
 integer null /* Оповещать за (час.) */
;
alter  table VRRPT_Meeters add 
ReminderSent null 
 check (ReminderSent in ( -1/* Да */
, 0/* Нет */ )) /* Оповещен */
;


/*Отчет*/
drop table VRRPT_MAIN/*Отчет*/ 
;
create table VRRPT_MAIN/*Отчет*/ (
InstanceID CHAR(38) ,
VRRPT_MAINid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRRPT_MAIN add 
Author null /* Автор */
;
alter  table VRRPT_MAIN add 
TheDate
 DATETIME null /* Дата отчета */
;
alter  table VRRPT_MAIN add 
Client null /* Клиент */
;
alter  table VRRPT_MAIN add 
Project null /* Проект */
;
alter  table VRRPT_MAIN add 
Contract null /* Договор */
;
alter  table VRRPT_MAIN add 
Person null /* Контактное лицо */
;
alter  table VRRPT_MAIN add 
Name
 VARCHAR (255) null /* Название отчета */
;
alter  table VRRPT_MAIN add 
Info null /* Информация */
;
alter  table VRRPT_MAIN add 
Attrachment null /* Вложение */
;
alter  table VRRPT_MAIN add 
 Attrachment_EXT char(4) null
;
alter  table VRRPT_MAIN add 
ReportType null /* Тип отчета */
;


/*Общая информация*/
drop table VRDGCommon/*Общая информация*/ 
;
create table VRDGCommon/*Общая информация*/ (
InstanceID CHAR(38) ,
VRDGCommonid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRDGCommon add 
DogNum
 VARCHAR (255) null /* Номер договора */
;
alter  table VRDGCommon add 
DogDate
 DATETIME null /* Дата договора */
;
alter  table VRDGCommon add 
Name
 VARCHAR (255) null /* Название */
;
alter  table VRDGCommon add 
Curator null /* Ответственный */
;
alter  table VRDGCommon add 
Info null /* Примечание */
;
alter  table VRDGCommon add 
Client null /* Контрагент */
;
alter  table VRDGCommon add 
PZDog null 
 check (PZDog in ( -1/* Да */
, 0/* Нет */ )) /* Договор к разовой заявке */
;
alter  table VRDGCommon add 
StartDate
 DATETIME null /* Начало действия */
;
alter  table VRDGCommon add 
EndDate
 DATETIME null /* Окончание действия договора */
;
alter  table VRDGCommon add 
Code1C
 VARCHAR (40) null /* Код1С */
;


/*Отчеты*/
drop table VRDGReport/*Отчеты*/ 
;
create table VRDGReport/*Отчеты*/ (
InstanceID CHAR(38) ,
VRDGReportid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRDGReport add 
Report null /* Отчет */
;


/*Дополнительные соглашения*/
drop table VRDGContractChanges/*Дополнительные соглашения*/ 
;
create table VRDGContractChanges/*Дополнительные соглашения*/ (
InstanceID CHAR(38) ,
VRDGContractChangesid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRDGContractChanges add 
Code
 VARCHAR (80) null /* Номер соглашения */
;
alter  table VRDGContractChanges add 
DateOf
 DATETIME null /* Дата соглашения */
;
alter  table VRDGContractChanges add 
theFile null /* Файл соглашения */
;
alter  table VRDGContractChanges add 
 theFile_EXT char(4) null
;
alter  table VRDGContractChanges add 
the_Comment null /* Примечание */
;


/*Версия договора*/
drop table VRDGContractVersion/*Версия договора*/ 
;
create table VRDGContractVersion/*Версия договора*/ (
InstanceID CHAR(38) ,
VRDGContractVersionid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRDGContractVersion add 
DateOf
 DATETIME null /* Дата версии */
;
alter  table VRDGContractVersion add 
theFile null /* Файл */
;
alter  table VRDGContractVersion add 
 theFile_EXT char(4) null
;
alter  table VRDGContractVersion add 
Actual null 
 check (Actual in ( -1/* Да */
, 0/* Нет */ )) /* Актуальная версия */
;
alter  table VRDGContractVersion add 
the_Comment null /* Примечание */
;


/*Специальные условие*/
drop table VRDGContractSpesial/*Специальные условие*/ 
;
create table VRDGContractSpesial/*Специальные условие*/ (
InstanceID CHAR(38) ,
VRDGContractSpesialid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRDGContractSpesial add 
DateOf
 DATETIME null /* Дата */
;
alter  table VRDGContractSpesial add 
IsDone null 
 check (IsDone in ( -1/* Да */
, 0/* Нет */ )) /* Исполнено */
;
alter  table VRDGContractSpesial add 
the_Comment null /* Суть условия */
;


/*Поезд*/
drop table PEKSH_DATA/*Поезд*/ 
;
create table PEKSH_DATA/*Поезд*/ (
InstanceID CHAR(38) ,
PEKSH_DATAid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKSH_DATA add 
Train null /* Поезд */
;
alter  table PEKSH_DATA add 
StartTime
 datetime null /* Время отправления */
;
alter  table PEKSH_DATA add 
Duration
 integer null /* Время доставки */
;


/*День и время отправления*/
drop table PEKSH_START/*День и время отправления*/ 
;
create table PEKSH_START/*День и время отправления*/ (
ParentStructRowID CHAR(38) not null,
PEKSH_STARTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKSH_START add 
DayInYear
 integer null /* Номер дня в году */
;
alter  table PEKSH_START add 
StartTime
 datetime null /* Время отправления */
;


/*Описание расписания*/
drop table PEKSH_DEF/*Описание расписания*/ 
;
create table PEKSH_DEF/*Описание расписания*/ (
InstanceID CHAR(38) ,
PEKSH_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKSH_DEF add 
DIRECTION null /* Направление */
;
alter  table PEKSH_DEF add 
TheYear
 integer null /* Год */
;


/*Отложенное событие*/
drop table MTZ2JOB_DEF/*Описание отложенного события*/ 
;
create table MTZ2JOB_DEF/*Описание отложенного события*/ (
InstanceID CHAR(38) ,
MTZ2JOB_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table MTZ2JOB_DEF add 
EventDate
 DATETIME null /* Отложено до */
;
alter  table MTZ2JOB_DEF add 
EvenType
 VARCHAR (255) null /* Тип события */
;
alter  table MTZ2JOB_DEF add 
ThruObject null /* Объект - причина события */
;
alter  table MTZ2JOB_DEF add 
ThruState
 uniqueidentifier null /* Состояние - причина */
;
alter  table MTZ2JOB_DEF add 
NextState
 uniqueidentifier null /* Состояние после обработки */
;
alter  table MTZ2JOB_DEF add 
ProcessDate
 DATETIME null /* Момент обработки */
;
alter  table MTZ2JOB_DEF add 
Processed null 
 check (Processed in ( -1/* Да */
, 0/* Нет */ )) /* Обработан */
;


/*Описание*/
drop table PEKPAY_DEF/*Докумен для учета внутренних затрат*/ 
;
create table PEKPAY_DEF/*Докумен для учета внутренних затрат*/ (
InstanceID CHAR(38) ,
PEKPAY_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKPAY_DEF add 
ToClient null /* Поставщик */
;
alter  table PEKPAY_DEF add 
PLPNUM
 VARCHAR (20) null /* № документа */
;
alter  table PEKPAY_DEF add 
PLPDate
 DATETIME null /* Дата документа */
;
alter  table PEKPAY_DEF add 
PLPSumm null /* Сумма */
;
alter  table PEKPAY_DEF add 
TheDept null /* В счет филиала */
;
alter  table PEKPAY_DEF add 
TheComment null /* Назначеие платежа */
;
alter  table PEKPAY_DEF add 
Code1C
 VARCHAR (40) null /* Код1С */
;


/*Основные настройки*/
drop table WEBSDIC_DEF/**/ 
;
create table WEBSDIC_DEF/**/ (
InstanceID CHAR(38) ,
WEBSDIC_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBSDIC_DEF add 
WEBS null /* Сайт */
;
alter  table WEBSDIC_DEF add 
PathToFiles
 VARCHAR (2048) null /* Каталог для файлов */
;


/*WEB пользователи*/
drop table PWUUSERS/*WEB пользователи защищённого портала*/ 
;
create table PWUUSERS/*WEB пользователи защищённого портала*/ (
InstanceID CHAR(38) ,
PWUUSERSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PWUUSERS add 
PWUUSERSOrderNum
 integer null /* Номер п/п */
;
alter  table PWUUSERS add 
PWUUSERSLogin
 VARCHAR (256) null /* Имя для входа */
;
alter  table PWUUSERS add 
PWUUSERSPassword
 VARCHAR (256) null /* Пароль */
;
alter  table PWUUSERS add 
PWUUSERSEMail
 VARCHAR (256) null /* Адрес электронной почты */
;
alter  table PWUUSERS add 
PWUUSERSClient null /* Клиент */
;
alter  table PWUUSERS add 
PWUUSERSIsBanned null 
 check (PWUUSERSIsBanned in ( -1/* Да */
, 0/* Нет */ )) /* Заблокирован */
;
alter  table PWUUSERS add 
PWUUSERSRegDate
 DATETIME null /* Дата регистрации */
;


/*Маршрут доставки*/
drop table pekz_path/*Маршрут доставки*/ 
;
create table pekz_path/*Маршрут доставки*/ (
InstanceID CHAR(38) ,
pekz_pathid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table pekz_path add 
sequence
 integer null /* № */
;
alter  table pekz_path add 
IsTranzit null 
 check (IsTranzit in ( -1/* Да */
, 0/* Нет */ )) /* Транзит */
;
alter  table pekz_path add 
PathFilial null /* Филиал */
;
alter  table pekz_path add 
TransSupplier null /* Поставщик */
;
alter  table pekz_path add 
TheDirection null /* Направление */
;
alter  table pekz_path add 
PPONum
 integer null /* Кол-во ПО */
;
alter  table pekz_path add 
DestStation null /* Станция назначения */
;
alter  table pekz_path add 
PPODescription null /* Характер груза */
;
alter  table pekz_path add 
Receiver null /* Получатель */
;
alter  table pekz_path add 
PPOWeight null /* Вес ПО */
;
alter  table pekz_path add 
WeightEDIZM null /* Ед. изм. веса */
;
alter  table pekz_path add 
PPOVol null /* Объем ПО */
;
alter  table pekz_path add 
ValueEDIZM null /* Ед.изм. объема */
;
alter  table pekz_path add 
RCVInfo null /* Данные получателя */
;
alter  table pekz_path add 
PathPlanedDate
 DATETIME null /* Дата предполагаемой отправки */
;
alter  table pekz_path add 
RcvWaitDate
 DATETIME null /* Ориентировочная дата получения */
;
alter  table pekz_path add 
trainNo null /* Поезд */
;
alter  table pekz_path add 
vagNo
 VARCHAR (8) null /* Вагон № */
;
alter  table pekz_path add 
SendDate
 DATETIME null /* Дата отправки */
;
alter  table pekz_path add 
PassFIO
 VARCHAR (255) null /* ФИО Кладовщика */
;
alter  table pekz_path add 
PassDate
 DATETIME null /* Дата передачи груза в вагон */
;
alter  table pekz_path add 
RcvFIO
 VARCHAR (255) null /* ФИО ВПН */
;
alter  table pekz_path add 
RcvDate
 DATETIME null /* Дата получения груза в ПО */
;
alter  table pekz_path add 
InforRcvFIO
 VARCHAR (255) null /* Кому передана информация */
;
alter  table pekz_path add 
InfoDate
 DATETIME null /* Дата передачи информации */
;
alter  table pekz_path add 
InfoSendType null /* Способ передачи информации */
;
alter  table pekz_path add 
CalcWithNDS null 
 check (CalcWithNDS in ( -1/* Да */
, 0/* Нет */ )) /* Расчет с НДС */
;
alter  table pekz_path add 
TheCurrency null /* Валюта */
;
alter  table pekz_path add 
TRF null /* Тариф */
;
alter  table pekz_path add 
SummNDS null /* Сумма с НДС */
;
alter  table pekz_path add 
Summ null /* Сумма без НДС */
;
alter  table pekz_path add 
SupTRF null /* Тариф поставщика */
;
alter  table pekz_path add 
SupSumm null /* Сумма поставщику без НДС */
;
alter  table pekz_path add 
SupSummNDS null /* Сумма поставщику с НДС */
;


/*Весовой список ППО*/
drop table PEKZ_WLIST/*Весовой список ППО*/ 
;
create table PEKZ_WLIST/*Весовой список ППО*/ (
ParentStructRowID CHAR(38) not null,
PEKZ_WLISTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKZ_WLIST add 
sequence
 integer null /* № */
;
alter  table PEKZ_WLIST add 
theWeight null /* Вес */
;
alter  table PEKZ_WLIST add 
shCode
 VARCHAR (14) null /* Штрих Код */
;
alter  table PEKZ_WLIST add 
NettoWeight null /* Вес нетто */
;
alter  table PEKZ_WLIST add 
TNBED
 VARCHAR (40) null /* Код ТНВЭД */
;
alter  table PEKZ_WLIST add 
TheCountry null /* Страна происхождения */
;
alter  table PEKZ_WLIST add 
ItemPrice null /* Стоимость посылки */
;
alter  table PEKZ_WLIST add 
VozmCost null /* Стоимость возмщения */
;
alter  table PEKZ_WLIST add 
TheCurrency null /* Валюта стоимости */
;
alter  table PEKZ_WLIST add 
IsPodarok null 
 check (IsPodarok in ( -1/* Да */
, 0/* Нет */ )) /* Подарок */
;
alter  table PEKZ_WLIST add 
IsDocument null 
 check (IsDocument in ( -1/* Да */
, 0/* Нет */ )) /* Документ */
;
alter  table PEKZ_WLIST add 
IsObrazec null 
 check (IsObrazec in ( -1/* Да */
, 0/* Нет */ )) /* Коммерческий образец */
;
alter  table PEKZ_WLIST add 
IsVozvrat null 
 check (IsVozvrat in ( -1/* Да */
, 0/* Нет */ )) /* Возврат товара */
;
alter  table PEKZ_WLIST add 
IsProchee null 
 check (IsProchee in ( -1/* Да */
, 0/* Нет */ )) /* Прочее отправление */
;
alter  table PEKZ_WLIST add 
ItemDescription
 VARCHAR (60) null /* Описание отправления */
;
alter  table PEKZ_WLIST add 
QLicense
 integer null /* Количество лицензий */
;
alter  table PEKZ_WLIST add 
QSertif
 integer null /* Количество сертификатов */
;
alter  table PEKZ_WLIST add 
OrderNum
 VARCHAR (30) null /* № счета */
;
alter  table PEKZ_WLIST add 
QDocs
 integer null /* Количество сопроводительных документов */
;


/*Надбавки*/
drop table PEKZ_WLADDS/*Надбавки для посылки*/ 
;
create table PEKZ_WLADDS/*Надбавки для посылки*/ (
ParentStructRowID CHAR(38) not null,
PEKZ_WLADDSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKZ_WLADDS add 
TheAdds null /* Надбавка */
;


/*Почтовые документы*/
drop table PEKZ_DOCS/*Почтовые документы*/ 
;
create table PEKZ_DOCS/*Почтовые документы*/ (
InstanceID CHAR(38) ,
PEKZ_DOCSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKZ_DOCS add 
TheDoc null /* Документ */
;


/*Описание заявки*/
drop table pekz_def/*Раздел описывает  основные данные о заявке.*/ 
;
create table pekz_def/*Раздел описывает  основные данные о заявке.*/ (
InstanceID CHAR(38) ,
pekz_defid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table pekz_def add 
QueryDate
 DATETIME null /* Дата запроса */
;
alter  table pekz_def add 
Fillial null /* Принята в */
;
alter  table pekz_def add 
PEKCode
 VARCHAR (50) null /* № заявки */
;
alter  table pekz_def add 
PlatType
 INTEGER null 
 check (PlatType in ( 0/* Отправитель */
, 1/* Получатель */
, 2/* Другой */ )) /* Платит */
;
alter  table pekz_def add 
TRType null /* Тип доставки */
;
alter  table pekz_def add 
PlanedDate
 DATETIME null /* Дата предполагаемой отправки */
;
alter  table pekz_def add 
ClientFrom null /* Отправитель */
;
alter  table pekz_def add 
ClientTo null /* Получатель */
;
alter  table pekz_def add 
ClientPayed null /* Плательщик */
;
alter  table pekz_def add 
AcceptDate
 DATETIME null /* Дата приема заявки */
;
alter  table pekz_def add 
VRCFinfo null /* Данные отправителя */
;
alter  table pekz_def add 
Supplier null /* Поставщик */
;
alter  table pekz_def add 
PayDept null /* Оплачивается в  */
;
alter  table pekz_def add 
TheDogovor null /* Договор */
;
alter  table pekz_def add 
IsPayed null 
 check (IsPayed in ( -1/* Да */
, 0/* Нет */ )) /* Оплачена */
;
alter  table pekz_def add 
RcvInfo null /* Данные получателя */
;
alter  table pekz_def add 
IsNal null 
 check (IsNal in ( -1/* Да */
, 0/* Нет */ )) /* Наличная оплата */
;
alter  table pekz_def add 
TheComment null /* Примечания */
;
alter  table pekz_def add 
AcceptTime
 datetime null /* Время приема заявки */
;
alter  table pekz_def add 
LoadTime
 datetime null /* Время приема груза на склад */
;
alter  table pekz_def add 
LoadDate
 DATETIME null /* Дата приема груза на склад */
;
alter  table pekz_def add 
TRF null /* Тариф */
;
alter  table pekz_def add 
Code1C
 VARCHAR (40) null /* Код1С */
;
alter  table pekz_def add 
IncludeInOrder null 
 check (IncludeInOrder in ( -1/* Да */
, 0/* Нет */ )) /* Включен в ордер */
;
alter  table pekz_def add 
IncludeInAct null 
 check (IncludeInAct in ( -1/* Да */
, 0/* Нет */ )) /* Включена в акт */
;
alter  table pekz_def add 
SummNDS null /* Сумма с НДС */
;
alter  table pekz_def add 
Summ null /* Сумма без НДС */
;
alter  table pekz_def add 
SummDop null /* Сумма доп. услуг без НДС */
;
alter  table pekz_def add 
SummDopNDS null /* Сумма доп. услуг с НДС */
;
alter  table pekz_def add 
theActWork null /* акт выполненных работ */
;


/*Сбор груза*/
drop table PEKZ_ACLCT/*Сбор груза для отправки автотранспортом*/ 
;
create table PEKZ_ACLCT/*Сбор груза для отправки автотранспортом*/ (
InstanceID CHAR(38) ,
PEKZ_ACLCTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKZ_ACLCT add 
TheFilial null /* Филиал */
;
alter  table PEKZ_ACLCT add 
AutoType null /* Тип автотранспорта */
;
alter  table PEKZ_ACLCT add 
CollectDate
 DATETIME null /* Дата получения груза */
;
alter  table PEKZ_ACLCT add 
TheAddress null /* Адрес  */
;
alter  table PEKZ_ACLCT add 
CollectTimeFrom
 datetime null /* Начиная с */
;
alter  table PEKZ_ACLCT add 
CollectTimeTo
 datetime null /* По */
;
alter  table PEKZ_ACLCT add 
ThePerson
 VARCHAR (255) null /* Контактное лицо */
;
alter  table PEKZ_ACLCT add 
Phone
 VARCHAR (20) null /* Контактный телефон */
;
alter  table PEKZ_ACLCT add 
TheComment null /* Примечание */
;
alter  table PEKZ_ACLCT add 
TheLength null /* Километраж */
;
alter  table PEKZ_ACLCT add 
TheDuration null /* Длительность (час) */
;
alter  table PEKZ_ACLCT add 
Info null /* Данные о грузе */
;
alter  table PEKZ_ACLCT add 
AutoSuplier null /* Поставщик */
;
alter  table PEKZ_ACLCT add 
SummNDS null /* Сумма с НДС */
;
alter  table PEKZ_ACLCT add 
Summ null /* Сумма без НДС */
;
alter  table PEKZ_ACLCT add 
SupSumm null /* Сумма поставщику без НДС */
;
alter  table PEKZ_ACLCT add 
SupSummNDS null /* Сумма поставщику с НДС */
;


/*Авто доставка*/
drop table PEKZ_ADLVR/*Доставка груза получателю автотранспортом*/ 
;
create table PEKZ_ADLVR/*Доставка груза получателю автотранспортом*/ (
InstanceID CHAR(38) ,
PEKZ_ADLVRid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKZ_ADLVR add 
TheFilial null /* Филиал */
;
alter  table PEKZ_ADLVR add 
AutoType null /* Тип автотранспорта */
;
alter  table PEKZ_ADLVR add 
TheAddress null /* Адрес  */
;
alter  table PEKZ_ADLVR add 
CollectDate
 DATETIME null /* Дата получения груза */
;
alter  table PEKZ_ADLVR add 
CollectTimeFrom
 datetime null /* Начиная с */
;
alter  table PEKZ_ADLVR add 
CollectTimeTo
 datetime null /* По */
;
alter  table PEKZ_ADLVR add 
ThePerson
 VARCHAR (255) null /* Контактное лицо */
;
alter  table PEKZ_ADLVR add 
Phone
 VARCHAR (20) null /* Контактный телефон */
;
alter  table PEKZ_ADLVR add 
TheComment null /* Примечание */
;
alter  table PEKZ_ADLVR add 
TheLength null /* Километраж */
;
alter  table PEKZ_ADLVR add 
TheDuration null /* Длительность (час) */
;
alter  table PEKZ_ADLVR add 
Info null /* Данные о грузе */
;
alter  table PEKZ_ADLVR add 
AutoSuplier null /* Поставщик */
;
alter  table PEKZ_ADLVR add 
CalcWithNDS null 
 check (CalcWithNDS in ( -1/* Да */
, 0/* Нет */ )) /* Расчет с НДС */
;
alter  table PEKZ_ADLVR add 
SummNDS null /* Сумма с НДС */
;
alter  table PEKZ_ADLVR add 
Summ null /* Сумма без НДС */
;
alter  table PEKZ_ADLVR add 
SupSumm null /* Сумма поставщику без НДС */
;
alter  table PEKZ_ADLVR add 
SupSummNDS null /* Сумма поставщику с НДС */
;


/*Дополнительные услуги*/
drop table pekz_dop/*Дополнительные услуги*/ 
;
create table pekz_dop/*Дополнительные услуги*/ (
InstanceID CHAR(38) ,
pekz_dopid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table pekz_dop add 
sequence
 integer null /* № */
;
alter  table pekz_dop add 
SRV null /* Услуга */
;
alter  table pekz_dop add 
Quantity null /* Количество */
;
alter  table pekz_dop add 
EDIZM null /* Ед. измерения */
;
alter  table pekz_dop add 
PathFilial null /* Филиал */
;
alter  table pekz_dop add 
TheComment null /* Примечание */
;
alter  table pekz_dop add 
DopSupplier null /* Поставщик */
;
alter  table pekz_dop add 
TheCurrency null /* Валюта */
;
alter  table pekz_dop add 
TRF null /* Тариф */
;
alter  table pekz_dop add 
Summ null /* Сумма без НДС */
;
alter  table pekz_dop add 
SummNDS null /* Сумма с НДС */
;
alter  table pekz_dop add 
SupTRF null /* Тариф поставщика */
;
alter  table pekz_dop add 
SupSumm null /* Сумма поставщику без НДС */
;
alter  table pekz_dop add 
SupSummNDS null /* Сумма поставщику с НДС */
;
alter  table pekz_dop add 
CalcWithNDS null 
 check (CalcWithNDS in ( -1/* Да */
, 0/* Нет */ )) /* Расчет с НДС */
;


/*Очередь заблокированных объектов*/
drop table REPD_LOCKED/*Очередь заблокированных объектов*/ 
;
create table REPD_LOCKED/*Очередь заблокированных объектов*/ (
InstanceID CHAR(38) ,
REPD_LOCKEDid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table REPD_LOCKED add 
LastTry
 DATETIME null /* Последняя разработка */
;
alter  table REPD_LOCKED add 
SourceFile
 VARCHAR (2048) null /* Файл данных */
;
alter  table REPD_LOCKED add 
ReplicaRowID
 uniqueidentifier null /* Идентификатор строки реплики */
;
alter  table REPD_LOCKED add 
FirstTry
 DATETIME null /* Первая обработка */
;
alter  table REPD_LOCKED add 
StructType
 VARCHAR (255) null /* Тип строки */
;
alter  table REPD_LOCKED add 
ObjectType
 VARCHAR (255) null /* Тип объекта */
;
alter  table REPD_LOCKED add 
The_RowID
 uniqueidentifier null /* Идетнификатор строки */
;
alter  table REPD_LOCKED add 
The_InstanceID
 uniqueidentifier null /* Объект */
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


/*Запрос данных на объект\ строку*/
drop table REPD_RequestQuery/*Запрос данных на объект\ строку*/ 
;
create table REPD_RequestQuery/*Запрос данных на объект\ строку*/ (
InstanceID CHAR(38) ,
REPD_RequestQueryid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
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


/*Результат запроса*/
drop table REPD_ResQueryRcv/*Результат запроса*/ 
;
create table REPD_ResQueryRcv/*Результат запроса*/ (
ParentStructRowID CHAR(38) not null,
REPD_ResQueryRcvid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table REPD_ResQueryRcv add 
ReceiveRec null /* ReceiveRec */
;


/*Провайдер репликациии*/
drop table REPD_PROV/*Провайдер репликациии*/ 
;
create table REPD_PROV/*Провайдер репликациии*/ (
InstanceID CHAR(38) ,
REPD_PROVid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
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


/*Узлы репликации*/
drop table REPD_SRV/*Узлы репликации*/ 
;
create table REPD_SRV/*Узлы репликации*/ (
InstanceID CHAR(38) ,
REPD_SRVid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
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
 VARCHAR (255) null /* Название */
;
alter  table REPD_SRV add 
Obj2 null /* Obj2 */
;
alter  table REPD_SRV add 
Obj1 null /* Obj1 */
;


/*Получатели реплик*/
drop table REPD_SNDTO/*Получатели реплик*/ 
;
create table REPD_SNDTO/*Получатели реплик*/ (
ParentStructRowID CHAR(38) not null,
REPD_SNDTOid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
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
 datetime null /* Начало работы (время) */
;
alter  table REPD_SNDTO add 
Work_End
 datetime null /* Окончание работы (время) */
;
alter  table REPD_SNDTO add 
The_Interval
 integer null /* Интервал */
;


/*Константы к запросу*/
drop table REPD_CONST/**/ 
;
create table REPD_CONST/**/ (
ParentStructRowID CHAR(38) not null,
REPD_CONSTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table REPD_CONST add 
Name
 VARCHAR (255) null /* Название */
;
alter  table REPD_CONST add 
TheValue
 VARCHAR (255) null /* Значение */
;


/*Тип репликации документов*/
drop table REPD_REPTYPE/*Описание типа репликации документов для узла*/ 
;
create table REPD_REPTYPE/*Описание типа репликации документов для узла*/ (
ParentStructRowID CHAR(38) not null,
REPD_REPTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table REPD_REPTYPE add 
ReplicaType null 
 check (ReplicaType in ( 0/* Весь документ */
, 2/* Локальный */
, 1/* Построчно */ )) /* Тип репликации */
;
alter  table REPD_REPTYPE add 
TheObjectType null /* Тип объекта */
;
alter  table REPD_REPTYPE add 
UseFilter null 
 check (UseFilter in ( -1/* Да */
, 0/* Нет */ )) /* Фильтровать по условию */
;
alter  table REPD_REPTYPE add 
RepConditonQRY null /* Условие репликации */
;


/*Очередь отсылки*/
drop table REPD_SendQ/*Очередь отсылки*/ 
;
create table REPD_SendQ/*Очередь отсылки*/ (
InstanceID CHAR(38) ,
REPD_SendQid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
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
 check (Acknowelge in ( -1/* Да */
, 0/* Нет */ )) /* Acknowelge */
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
 integer null /* Количество частей */
;
alter  table REPD_SendQ add 
PartNumber
 integer null /* Часть */
;
alter  table REPD_SendQ add 
Sent
 integer null 
 check (Sent in ( 1/* Да */
, 0/* Нет */ )) /* Sent */
;
alter  table REPD_SendQ add 
ReplicatorPointer
 DATETIME null /* Указатель репликации */
;


/*Очередь полученых реплик*/
drop table REPD_RecvQ/*Очередь полученых реплик*/ 
;
create table REPD_RecvQ/*Очередь полученых реплик*/ (
InstanceID CHAR(38) ,
REPD_RecvQid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
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
 check (Acknowelge in ( -1/* Да */
, 0/* Нет */ )) /* Acknowelge */
;
alter  table REPD_RecvQ add 
ReplicaPackID
 uniqueidentifier null /* ReplicaPackID */
;
alter  table REPD_RecvQ add 
PartCount
 integer null /* Количество частей */
;
alter  table REPD_RecvQ add 
PartNumber
 integer null /* Часть */
;
alter  table REPD_RecvQ add 
FileName
 VARCHAR (1024) null /* FileName */
;
alter  table REPD_RecvQ add 
Completed null 
 check (Completed in ( -1/* Да */
, 0/* Нет */ )) /* Completed */
;


/*Дейсвие при смене*/
drop table StateAction/*Дейсвие при смене*/ 
;
create table StateAction/*Дейсвие при смене*/ (
InstanceID CHAR(38) ,
StateActionid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table StateAction add 
OnDocStatus null /* При входе в состояие */
;
alter  table StateAction add 
NewSecurityStyle null /* Установить стиль защиты */
;
alter  table StateAction add 
ClearSecurity null 
 check (ClearSecurity in ( -1/* Да */
, 0/* Нет */ )) /* Сбросить стиль защиты */
;
alter  table StateAction add 
LibraryFile
 VARCHAR (255) null /* Библиотека-обработчик */
;
alter  table StateAction add 
ActionClass
 VARCHAR (255) null /* Класс для обработки */
;
alter  table StateAction add 
ActionScript null /* Скрипт для исполнения */
;


/*Элементы маршрута*/
drop table TheDiffPath/**/ 
;
create table TheDiffPath/**/ (
InstanceID CHAR(38) ,
TheDiffPathid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table TheDiffPath add 
TheNumber
 integer null /* Номер сегмента в Сложном Маршруте */
;
alter  table TheDiffPath add 
TempTownFrom null /* Промежуточный пункт отправления */
;
alter  table TheDiffPath add 
Direction null /* Направление */
;
alter  table TheDiffPath add 
TempDirStation null /* Промежуточный пункт прибытия */
;
alter  table TheDiffPath add 
Transporter null /* Перевозчик */
;
alter  table TheDiffPath add 
Transport null /* Транспорт */
;


/*Доп. услуги в точке прибытия*/
drop table DopUslTo/**/ 
;
create table DopUslTo/**/ (
ParentStructRowID CHAR(38) not null,
DopUslToid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table DopUslTo add 
DopUsluga null /* Доп. услуга */
;


/*Доп. услуги в точке отправления*/
drop table DopUslFrom/**/ 
;
create table DopUslFrom/**/ (
ParentStructRowID CHAR(38) not null,
DopUslFromid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table DopUslFrom add 
DopUsluga null /* Доп. услуга */
;


/*Описание сложного маршрута*/
drop table TheDefenitionDiffP/**/ 
;
create table TheDefenitionDiffP/**/ (
InstanceID CHAR(38) ,
TheDefenitionDiffPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table TheDefenitionDiffP add 
TheNumeric
 integer null /* Номер сложного маршрута */
;
alter  table TheDefenitionDiffP add 
TownFrom null /* Город отправления */
;
alter  table TheDefenitionDiffP add 
DirStation null /* Станция назначения */
;
alter  table TheDefenitionDiffP add 
CountParticles null /* Количество участков */
;
alter  table TheDefenitionDiffP add 
TheComment null /* Примечание */
;


/*Описание акта*/
drop table PEKACT_DEF/*Акт сверки*/ 
;
create table PEKACT_DEF/*Акт сверки*/ (
InstanceID CHAR(38) ,
PEKACT_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKACT_DEF add 
Podrazdelenie null /* Подразделение */
;
alter  table PEKACT_DEF add 
Client null /* Клиент */
;
alter  table PEKACT_DEF add 
Number_of_akt
 integer null /* Номер_акта */
;
alter  table PEKACT_DEF add 
Date_FROM
 DATETIME null /* Дата С */
;
alter  table PEKACT_DEF add 
Date_TO
 DATETIME null /* Дата ПО */
;
alter  table PEKACT_DEF add 
TheDgovor null /* Договор */
;
alter  table PEKACT_DEF add 
dateCreate
 DATETIME null /* Дата оформления акта */
;
alter  table PEKACT_DEF add 
dateSend
 DATETIME null /* Дата передачи акта клиенту */
;
alter  table PEKACT_DEF add 
dateReceive
 DATETIME null /* Дата возврата подписанного акта клиент */
;
alter  table PEKACT_DEF add 
FIO
 VARCHAR (100) null /* ФИО получившего акт */
;
alter  table PEKACT_DEF add 
Code1C
 VARCHAR (40) null /* Код 1С */
;


/*Итоги по акту*/
drop table PEKACT_ITOG/*Подводятся итоги по акту в разрезе услуг*/ 
;
create table PEKACT_ITOG/*Подводятся итоги по акту в разрезе услуг*/ (
InstanceID CHAR(38) ,
PEKACT_ITOGid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKACT_ITOG add 
SRV null /* Услуга */
;
alter  table PEKACT_ITOG add 
Summ null /* Сумма */
;
alter  table PEKACT_ITOG add 
SummNDS null /* Сумма с НДС */
;
alter  table PEKACT_ITOG add 
SupSUMM null /* Сумма поставщику */
;
alter  table PEKACT_ITOG add 
SupSummNDS null /* Сумма поставщику с НДС */
;
alter  table PEKACT_ITOG add 
Quantity null /* Количество */
;
alter  table PEKACT_ITOG add 
edizm null /* Единица измерения */
;


/*Строки акта*/
drop table PEKACT_LINES/*Строки акта сверки */ 
;
create table PEKACT_LINES/*Строки акта сверки */ (
InstanceID CHAR(38) ,
PEKACT_LINESid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKACT_LINES add 
Zayavka null /* Заявка */
;


/*Тип поля*/
drop table FIELDTYPE/*Типы полей, перечисления, интервалы*/ 
;
create table FIELDTYPE/*Типы полей, перечисления, интервалы*/ (
InstanceID CHAR(38) ,
FIELDTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table FIELDTYPE add 
Name
 VARCHAR (255) null /* Название */
;
alter  table FIELDTYPE add 
TypeStyle
 INTEGER null 
 check (TypeStyle in ( 3/* Интервал */
, 0/* Скалярный тип */
, 4/* Ссылка */
, 2/* Перечисление */
, 1/* Выражение */
, 5/* Элемент оформления */ )) /* Трактовка */
;
alter  table FIELDTYPE add 
the_Comment null /* Описание */
;
alter  table FIELDTYPE add 
AllowSize null 
 check (AllowSize in ( -1/* Да */
, 0/* Нет */ )) /* Нужен размер */
;
alter  table FIELDTYPE add 
Minimum
 VARCHAR (64) null /* Минимум */
;
alter  table FIELDTYPE add 
Maximum
 VARCHAR (64) null /* Максимум */
;
alter  table FIELDTYPE add 
AllowLikeSearch null 
 check (AllowLikeSearch in ( -1/* Да */
, 0/* Нет */ )) /* Поиск текста */
;
alter  table FIELDTYPE add 
GridSortType
 INTEGER null 
 check (GridSortType in ( 0/* As String */
, 1/* As Numeric */
, 2/* As Date */ )) /* Вариант сортировки в табличном представлении */
;


/*Отображение*/
drop table FIELDTYPEMAP/*Отображение типа поля на физический тип хранения*/ 
;
create table FIELDTYPEMAP/*Отображение типа поля на физический тип хранения*/ (
ParentStructRowID CHAR(38) not null,
FIELDTYPEMAPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table FIELDTYPEMAP add 
Target null /* Платформа */
;
alter  table FIELDTYPEMAP add 
StoageType
 VARCHAR (255) null /* Тип хранения */
;
alter  table FIELDTYPEMAP add 
FixedSize
 integer null /* Размер */
;


/*Зачения*/
drop table ENUMITEM/*Для описания Enum типов*/ 
;
create table ENUMITEM/*Для описания Enum типов*/ (
ParentStructRowID CHAR(38) not null,
ENUMITEMid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ENUMITEM add 
Name
 VARCHAR (255) null /* Название */
;
alter  table ENUMITEM add 
NameValue
 integer null /* Значение */
;
alter  table ENUMITEM add 
NameInCode
 VARCHAR (100) null /* Название в коде */
;


/*Методы и процедуры*/
drop table SHAREDMETHOD/*Методы и процедуры*/ 
;
create table SHAREDMETHOD/*Методы и процедуры*/ (
InstanceID CHAR(38) ,
SHAREDMETHODid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table SHAREDMETHOD add 
Name
 VARCHAR (255) null /* Название */
;
alter  table SHAREDMETHOD add 
the_Comment null /* Описание метода */
;
alter  table SHAREDMETHOD add 
ReturnType null /* Возвращаемый тип */
;


/*Реализация*/
drop table SCRIPT/*Код метода на понятном конкретному генератору языке*/ 
;
create table SCRIPT/*Код метода на понятном конкретному генератору языке*/ (
ParentStructRowID CHAR(38) not null,
SCRIPTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table SCRIPT add 
Target null /* Целевая платформа */
;
alter  table SCRIPT add 
Code null /* Скрипт */
;


/*Параметры*/
drop table PARAMETERS/*Параметры метода*/ 
;
create table PARAMETERS/*Параметры метода*/ (
ParentStructRowID CHAR(38) not null,
PARAMETERSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PARAMETERS add 
sequence
 integer null /* Последовательность */
;
alter  table PARAMETERS add 
Name
 VARCHAR (80) null /* Имя */
;
alter  table PARAMETERS add 
Caption
 VARCHAR (80) null /* Заголовок */
;
alter  table PARAMETERS add 
TypeOfParm null /* Тип данных */
;
alter  table PARAMETERS add 
DataSize
 integer null /* Размер */
;
alter  table PARAMETERS add 
AllowNull null 
 check (AllowNull in ( -1/* Да */
, 0/* Нет */ )) /* Можно не задавать */
;
alter  table PARAMETERS add 
OutParam null 
 check (OutParam in ( -1/* Да */
, 0/* Нет */ )) /* Возвращает значение */
;
alter  table PARAMETERS add 
ReferenceType
 INTEGER null 
 check (ReferenceType in ( 2/* На строку раздела */
, 3/* На источник данных */
, 0/* Скалярное поле ( не ссылка) */
, 1/* На объект  */ )) /* Тип ссылки */
;
alter  table PARAMETERS add 
RefToType null /* Ссылка на тип */
;
alter  table PARAMETERS add 
RefToPart null /* Ссылка на раздел */
;


/*Тип объекта*/
drop table OBJECTTYPE/*Тип объекта (карточки)*/ 
;
create table OBJECTTYPE/*Тип объекта (карточки)*/ (
InstanceID CHAR(38) ,
OBJECTTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table OBJECTTYPE add 
Package null /* Приложение */
;
alter  table OBJECTTYPE add 
the_Comment
 VARCHAR (255) null /* Название */
;
alter  table OBJECTTYPE add 
Name
 VARCHAR (14) null /* Код */
;
alter  table OBJECTTYPE add 
IsSingleInstance null 
 check (IsSingleInstance in ( -1/* Да */
, 0/* Нет */ )) /* Допускается только один объект */
;
alter  table OBJECTTYPE add 
ChooseView null /* Представление для выбора */
;
alter  table OBJECTTYPE add 
OnRun null /* При запуске */
;
alter  table OBJECTTYPE add 
OnCreate null /* При создании */
;
alter  table OBJECTTYPE add 
OnDelete null /* При удалении */
;
alter  table OBJECTTYPE add 
AllowRefToObject null 
 check (AllowRefToObject in ( -1/* Да */
, 0/* Нет */ )) /* Отображать при выборе ссылки */
;
alter  table OBJECTTYPE add 
AllowSearch null 
 check (AllowSearch in ( -1/* Да */
, 0/* Нет */ )) /* Отображать при поиске */
;
alter  table OBJECTTYPE add 
ReplicaType null 
 check (ReplicaType in ( 0/* Весь документ */
, 2/* Локальный */
, 1/* Построчно */ )) /* Тип репликации */
;
alter  table OBJECTTYPE add 
TheComment null /* Описание */
;


/*Раздел*/
drop table PART/*Раздел объекта*/ 
;
create table PART/*Раздел объекта*/ (
ParentStructRowID CHAR(38) not null,
PARTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
;
alter  table PART add 
Sequence
 integer null /* № п/п */
;
alter  table PART add 
PartType null 
 check (PartType in ( 1/* Коллекция */
, 3/* Расширение */
, 0/* Строка */
, 2/* Дерево */
, 4/* Расширение с данными */ )) /* Тип структры  */
;
alter  table PART add 
Caption
 VARCHAR (255) null /* Заголовок */
;
alter  table PART add 
Name
 VARCHAR (20) null /* Название */
;
alter  table PART add 
the_Comment null /* Описание */
;
alter  table PART add 
NoLog null 
 check (NoLog in ( -1/* Да */
, 0/* Нет */ )) /* Не записывать в журнал */
;
alter  table PART add 
ManualRegister null 
 check (ManualRegister in ( -1/* Да */
, 0/* Нет */ )) /* Исключить из индексирования */
;
alter  table PART add 
OnCreate null /* При создании */
;
alter  table PART add 
OnSave null /* При сохранении */
;
alter  table PART add 
OnRun null /* При открытии */
;
alter  table PART add 
OnDelete null /* При удалении */
;
alter  table PART add 
AddBehaivor
 INTEGER null 
 check (AddBehaivor in ( 0/* AddForm */
, 2/* RunAction */
, 1/* RefreshOnly */ )) /* Поведение при добавлении */
;
alter  table PART add 
ExtenderObject null /* Объект расширения */
;
alter  table PART add 
shablonBrief
 VARCHAR (100) null /* Шаблон для краткого отображения */
;
alter  table PART add 
ruleBrief null /* Правило составления BRIEF поля */
;
alter  table PART add 
IsJormalChange null 
 check (IsJormalChange in ( -1/* Да */
, 0/* Нет */ )) /* Вести журнал изменений */
;


/*Методы раздела*/
drop table PARTMENU/*Методы уровня раздела*/ 
;
create table PARTMENU/*Методы уровня раздела*/ (
ParentStructRowID CHAR(38) not null,
PARTMENUid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PARTMENU add 
Name
 VARCHAR (64) null /* Название */
;
alter  table PARTMENU add 
Caption
 VARCHAR (80) null /* Заголовок */
;
alter  table PARTMENU add 
ToolTip
 VARCHAR (80) null /* Подсказка */
;
alter  table PARTMENU add 
the_Action null /* Метод */
;
alter  table PARTMENU add 
IsMenuItem null 
 check (IsMenuItem in ( -1/* Да */
, 0/* Нет */ )) /* Включать в меню */
;
alter  table PARTMENU add 
IsToolBarButton null 
 check (IsToolBarButton in ( -1/* Да */
, 0/* Нет */ )) /* В тулбар */
;
alter  table PARTMENU add 
HotKey
 VARCHAR (20) null /* Горячая клавиша */
;


/*Отображение параметров*/
drop table PARTPARAMMAP/*отображение значений полей раздела на параметры метода*/ 
;
create table PARTPARAMMAP/*отображение значений полей раздела на параметры метода*/ (
ParentStructRowID CHAR(38) not null,
PARTPARAMMAPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PARTPARAMMAP add 
FieldName
 VARCHAR (255) null /* Поле (значение) */
;
alter  table PARTPARAMMAP add 
ParamName
 VARCHAR (80) null /* Параметр */
;
alter  table PARTPARAMMAP add 
NoEdit null 
 check (NoEdit in ( -1/* Да */
, 0/* Нет */ )) /* Редактировать параметр нельзя */
;


/*Поле*/
drop table FIELD/*Поле*/ 
;
create table FIELD/*Поле*/ (
ParentStructRowID CHAR(38) not null,
FIELDid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table FIELD add 
Sequence
 integer null /* № п/п */
;
alter  table FIELD add 
Caption
 VARCHAR (80) null /* Надпись */
;
alter  table FIELD add 
Name
 VARCHAR (64) null /* Имя поля */
;
alter  table FIELD add 
FieldType null /* Тип поля */
;
alter  table FIELD add 
IsBrief null 
 check (IsBrief in ( -1/* Да */
, 0/* Нет */ )) /* Краткая информация */
;
alter  table FIELD add 
AllowNull null 
 check (AllowNull in ( -1/* Да */
, 0/* Нет */ )) /* Может быть пустым */
;
alter  table FIELD add 
DataSize
 integer null /* Размер поля */
;
alter  table FIELD add 
ReferenceType
 INTEGER null 
 check (ReferenceType in ( 2/* На строку раздела */
, 3/* На источник данных */
, 0/* Скалярное поле ( не ссылка) */
, 1/* На объект  */ )) /* Тип ссылки */
;
alter  table FIELD add 
RefToType null /* Ссылка на тип */
;
alter  table FIELD add 
RefToPart null /* Ссылка на раздел */
;
alter  table FIELD add 
InternalReference null 
 check (InternalReference in ( -1/* Да */
, 0/* Нет */ )) /* Ссылка в пределах объекта */
;
alter  table FIELD add 
CreateRefOnly null 
 check (CreateRefOnly in ( -1/* Да */
, 0/* Нет */ )) /* Только создание объекта */
;
alter  table FIELD add 
IsAutoNumber null 
 check (IsAutoNumber in ( -1/* Да */
, 0/* Нет */ )) /* Автонумерация */
;
alter  table FIELD add 
TheNumerator null /* Нумератор */
;
alter  table FIELD add 
ZoneTemplate
 VARCHAR (255) null /* Шаблон зоны нумерации */
;
alter  table FIELD add 
NumberDateField null /* Поле для расчета даты */
;
alter  table FIELD add 
TheComment null /* Описание */
;
alter  table FIELD add 
shablonBrief
 VARCHAR (100) null /* Шаблон для краткого отображения */
;
alter  table FIELD add 
theNameClass
 VARCHAR (100) null /* Имя класса для мастера строк */
;


/*Логика поля на форме*/
drop table FIELDVALIDATOR/*Логика взаимосвязей на форме при изменении поля*/ 
;
create table FIELDVALIDATOR/*Логика взаимосвязей на форме при изменении поля*/ (
ParentStructRowID CHAR(38) not null,
FIELDVALIDATORid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table FIELDVALIDATOR add 
Target null /* Платформа */
;
alter  table FIELDVALIDATOR add 
Code null /* Скрипт */
;


/*Методы поля*/
drop table FIELDMENU/*Методы, ассоциированные с полем*/ 
;
create table FIELDMENU/*Методы, ассоциированные с полем*/ (
ParentStructRowID CHAR(38) not null,
FIELDMENUid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table FIELDMENU add 
Name
 VARCHAR (64) null /* Название */
;
alter  table FIELDMENU add 
Caption
 VARCHAR (80) null /* Заголовок */
;
alter  table FIELDMENU add 
ToolTip
 VARCHAR (80) null /* Подсказка */
;
alter  table FIELDMENU add 
ActionID null /* Идентификатор вызываемого метода */
;
alter  table FIELDMENU add 
IsMenuItem null 
 check (IsMenuItem in ( -1/* Да */
, 0/* Нет */ )) /* В меню */
;
alter  table FIELDMENU add 
IsToolBarButton null 
 check (IsToolBarButton in ( -1/* Да */
, 0/* Нет */ )) /* В тулбар */
;
alter  table FIELDMENU add 
HotKey
 VARCHAR (20) null /* Горячая клавиша */
;


/*Отображение параметров*/
drop table FIELDPARAMMAP/*Отображение значений на параметры метода*/ 
;
create table FIELDPARAMMAP/*Отображение значений на параметры метода*/ (
ParentStructRowID CHAR(38) not null,
FIELDPARAMMAPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table FIELDPARAMMAP add 
FieldName
 VARCHAR (255) null /* Поле (значение) */
;
alter  table FIELDPARAMMAP add 
ParamName
 VARCHAR (80) null /* Параметр */
;
alter  table FIELDPARAMMAP add 
NoEdit null 
 check (NoEdit in ( -1/* Да */
, 0/* Нет */ )) /* Редактировать параметр нельзя */
;


/*Интерфейсы расширения*/
drop table FldExtenders/**/ 
;
create table FldExtenders/**/ (
ParentStructRowID CHAR(38) not null,
FldExtendersid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table FldExtenders add 
TheName
 VARCHAR (255) null /* Название */
;
alter  table FldExtenders add 
TargetPlatform null /* Целевая платформа */
;
alter  table FldExtenders add 
TheObject
 VARCHAR (255) null /* Объект */
;
alter  table FldExtenders add 
TheConfig
 VARCHAR (512) null /* Конфиг */
;


/*Значение по умолчанию*/
drop table FIELDEXPRESSION/*Выражение для вычисления поля
или значение по умолчанию*/ 
;
create table FIELDEXPRESSION/*Выражение для вычисления поля
или значение по умолчанию*/ (
ParentStructRowID CHAR(38) not null,
FIELDEXPRESSIONid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table FIELDEXPRESSION add 
Target null /* Платформа */
;
alter  table FIELDEXPRESSION add 
Code null /* Скрипт */
;


/*Динамический фильтр*/
drop table DINAMICFILTERSCRIPT/*Выражение для построения дополнительного фильтра для ссылочных полей*/ 
;
create table DINAMICFILTERSCRIPT/*Выражение для построения дополнительного фильтра для ссылочных полей*/ (
ParentStructRowID CHAR(38) not null,
DINAMICFILTERSCRIPTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table DINAMICFILTERSCRIPT add 
Target null /* Целевая платформа */
;
alter  table DINAMICFILTERSCRIPT add 
Code null /* Скрипт */
;


/*Описание источника данных*/
drop table FIELDSRCDEF/*Описание источника данных для полей типа ReferenceSQL */ 
;
create table FIELDSRCDEF/*Описание источника данных для полей типа ReferenceSQL */ (
ParentStructRowID CHAR(38) not null,
FIELDSRCDEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table FIELDSRCDEF add 
Provider
 VARCHAR (128) null /* Провайдер */
;
alter  table FIELDSRCDEF add 
ConnectionString
 VARCHAR (512) null /* Строка соединения с источником */
;
alter  table FIELDSRCDEF add 
DataSource
 VARCHAR (512) null /* Источник данных */
;
alter  table FIELDSRCDEF add 
IDField
 VARCHAR (128) null /* ID */
;
alter  table FIELDSRCDEF add 
BriefString
 VARCHAR (512) null /* Источник краткой информации */
;
alter  table FIELDSRCDEF add 
FilterString
 VARCHAR (512) null /* Фильтр источника данных */
;
alter  table FIELDSRCDEF add 
SortField
 VARCHAR (512) null /* Сортировка источника данных */
;
alter  table FIELDSRCDEF add 
DescriptionString null /* Примечания */
;
alter  table FIELDSRCDEF add 
DontShowDialog
 integer null 
 check (DontShowDialog in ( 1/* Да */
, 0/* Нет */ )) /* Не показывать форму выбора */
;


/*Представление*/
drop table PARTVIEW/*Вариант представления, который может использоваться для создания журнала*/ 
;
create table PARTVIEW/*Вариант представления, который может использоваться для создания журнала*/ (
ParentStructRowID CHAR(38) not null,
PARTVIEWid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PARTVIEW add 
Name
 VARCHAR (255) null /* Название */
;
alter  table PARTVIEW add 
the_Alias
 VARCHAR (64) null /* Псевдоним */
;
alter  table PARTVIEW add 
ForChoose null 
 check (ForChoose in ( -1/* Да */
, 0/* Нет */ )) /* Для поиска */
;
alter  table PARTVIEW add 
FilterField0
 VARCHAR (255) null /* Поле - фильтр 0 */
;
alter  table PARTVIEW add 
FilterField1
 VARCHAR (255) null /* Поле - фильтр 1 */
;
alter  table PARTVIEW add 
FilterField2
 VARCHAR (255) null /* Поле - фильтр 2 */
;
alter  table PARTVIEW add 
FilterField3
 VARCHAR (255) null /* Поле - фильтр 3 */
;


/*Колонка*/
drop table ViewColumn/*Колонка пердставления*/ 
;
create table ViewColumn/*Колонка пердставления*/ (
ParentStructRowID CHAR(38) not null,
ViewColumnid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ViewColumn add 
sequence
 integer null /* №  */
;
alter  table ViewColumn add 
Name
 VARCHAR (255) null /* Название */
;
alter  table ViewColumn add 
the_Alias
 VARCHAR (64) null /* Псвдоним */
;
alter  table ViewColumn add 
FromPart null /* Раздел */
;
alter  table ViewColumn add 
Field null /* Поле */
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
, 0/* none */ )) /* Агрегация */
;
alter  table ViewColumn add 
Expression null /* Формула */
;
alter  table ViewColumn add 
ForCombo null 
 check (ForCombo in ( -1/* Да */
, 0/* Нет */ )) /* Для комбо */
;


/*Связанные представления*/
drop table PARTVIEW_LNK/**/ 
;
create table PARTVIEW_LNK/**/ (
ParentStructRowID CHAR(38) not null,
PARTVIEW_LNKid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PARTVIEW_LNK add 
TheView null /* Представление */
;
alter  table PARTVIEW_LNK add 
TheJoinSource null /* Связь: Поле для join источник */
;
alter  table PARTVIEW_LNK add 
RefType
 integer null 
 check (RefType in ( 2/* Ссылка на строку */
, 1/* Ссылка на объект */
, 3/* Связка InstanceID (в передлах объекта) */
, 4/* Связка ParentStructRowID  (в передлах объекта) */
, 0/* Нет */ )) /* Связывать как */
;
alter  table PARTVIEW_LNK add 
TheJoinDestination null /* Свзяь: Поле для join приемник */
;
alter  table PARTVIEW_LNK add 
HandJoin
 VARCHAR (255) null /* Ручной join */
;
alter  table PARTVIEW_LNK add 
SEQ
 integer null /* Порядок */
;


/*Интерфейсы расширения*/
drop table ExtenderInterface/**/ 
;
create table ExtenderInterface/**/ (
ParentStructRowID CHAR(38) not null,
ExtenderInterfaceid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ExtenderInterface add 
TheName
 VARCHAR (255) null /* Название */
;
alter  table ExtenderInterface add 
TargetPlatform null /* Целевая платформа */
;
alter  table ExtenderInterface add 
TheObject
 VARCHAR (255) null /* Объект */
;
alter  table ExtenderInterface add 
TheConfig
 VARCHAR (512) null /* Конфиг */
;


/*Логика на форме*/
drop table VALIDATOR/*Действия в впроцессе редактирования*/ 
;
create table VALIDATOR/*Действия в впроцессе редактирования*/ (
ParentStructRowID CHAR(38) not null,
VALIDATORid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VALIDATOR add 
Target null /* Целевая платформа */
;
alter  table VALIDATOR add 
Code null /* Скрипт */
;


/*Ограничение уникальности*/
drop table UNIQUECONSTRAINT/*Ограничение уникальности*/ 
;
create table UNIQUECONSTRAINT/*Ограничение уникальности*/ (
ParentStructRowID CHAR(38) not null,
UNIQUECONSTRAINTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table UNIQUECONSTRAINT add 
Name
 VARCHAR (80) null /* Название */
;
alter  table UNIQUECONSTRAINT add 
PerParent null 
 check (PerParent in ( -1/* Да */
, 0/* Нет */ )) /* По родителю */
;
alter  table UNIQUECONSTRAINT add 
TheComment null /* Описание */
;


/*Поля ограничения*/
drop table CONSTRAINTFIELD/*Поля ограничения*/ 
;
create table CONSTRAINTFIELD/*Поля ограничения*/ (
ParentStructRowID CHAR(38) not null,
CONSTRAINTFIELDid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table CONSTRAINTFIELD add 
TheField null /* Поле */
;


/*Проверка правильности*/
drop table INSTANCEVALIDATOR/*Проверка правильности для объекта в целом*/ 
;
create table INSTANCEVALIDATOR/*Проверка правильности для объекта в целом*/ (
ParentStructRowID CHAR(38) not null,
INSTANCEVALIDATORid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table INSTANCEVALIDATOR add 
Target null /* Платформа */
;
alter  table INSTANCEVALIDATOR add 
Code null /* Скрипт */
;


/*Состояния*/
drop table OBJSTATUS/*Возможные логические состояния документа*/ 
;
create table OBJSTATUS/*Возможные логические состояния документа*/ (
ParentStructRowID CHAR(38) not null,
OBJSTATUSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table OBJSTATUS add 
name
 VARCHAR (80) null /* Название */
;
alter  table OBJSTATUS add 
isStartup null 
 check (isStartup in ( -1/* Да */
, 0/* Нет */ )) /* Начальное */
;
alter  table OBJSTATUS add 
IsArchive null 
 check (IsArchive in ( -1/* Да */
, 0/* Нет */ )) /* Архивное */
;
alter  table OBJSTATUS add 
the_comment null /* Описание */
;


/*Разрешенные переходы*/
drop table NEXTSTATE/*Матрица переходов */ 
;
create table NEXTSTATE/*Матрица переходов */ (
ParentStructRowID CHAR(38) not null,
NEXTSTATEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table NEXTSTATE add 
TheState null /* Разрешенное состояние */
;


/*Режим работы*/
drop table OBJECTMODE/*Режим работы*/ 
;
create table OBJECTMODE/*Режим работы*/ (
ParentStructRowID CHAR(38) not null,
OBJECTMODEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table OBJECTMODE add 
Name
 VARCHAR (5) null /* Название режима */
;
alter  table OBJECTMODE add 
DefaultMode null 
 check (DefaultMode in ( -1/* Да */
, 0/* Нет */ )) /* Этот режим является основным режимом работы объекта */
;
alter  table OBJECTMODE add 
TheComment null /* Описание */
;


/*Органичения разделов*/
drop table STRUCTRESTRICTION/*Ораничения на доступ к разделу документа*/ 
;
create table STRUCTRESTRICTION/*Ораничения на доступ к разделу документа*/ (
ParentStructRowID CHAR(38) not null,
STRUCTRESTRICTIONid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table STRUCTRESTRICTION add 
Struct null /* структура, доступ к которой ограничен */
;
alter  table STRUCTRESTRICTION add 
AllowRead null 
 check (AllowRead in ( -1/* Да */
, 0/* Нет */ )) /* Разрешен просмотр */
;
alter  table STRUCTRESTRICTION add 
AllowAdd null 
 check (AllowAdd in ( -1/* Да */
, 0/* Нет */ )) /* Разрешено добавлять */
;
alter  table STRUCTRESTRICTION add 
AllowEdit null 
 check (AllowEdit in ( -1/* Да */
, 0/* Нет */ )) /* Разрешено изменять */
;
alter  table STRUCTRESTRICTION add 
AllowDelete null 
 check (AllowDelete in ( -1/* Да */
, 0/* Нет */ )) /* Разрешено удалять */
;


/*Ограничения полей*/
drop table FIELDRESTRICTION/*Ограничения на доступ к полям раздела*/ 
;
create table FIELDRESTRICTION/*Ограничения на доступ к полям раздела*/ (
ParentStructRowID CHAR(38) not null,
FIELDRESTRICTIONid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table FIELDRESTRICTION add 
ThePart null /* Структура, которой принадлежит поле */
;
alter  table FIELDRESTRICTION add 
TheField null /* Поле, на которое накладывается ограничение */
;
alter  table FIELDRESTRICTION add 
AllowRead null 
 check (AllowRead in ( -1/* Да */
, 0/* Нет */ )) /* Разрешен просмотр */
;
alter  table FIELDRESTRICTION add 
AllowModify null 
 check (AllowModify in ( -1/* Да */
, 0/* Нет */ )) /* Разрешена модификация */
;
alter  table FIELDRESTRICTION add 
MandatoryField null 
 check (MandatoryField in ( 0/* Нет */
, -1/* Не существенно */
, 1/* Да */ )) /* Обязательное поле */
;


/*Ограничения методов*/
drop table METHODRESTRICTION/*Ограничение на использование методов раздела*/ 
;
create table METHODRESTRICTION/*Ограничение на использование методов раздела*/ (
ParentStructRowID CHAR(38) not null,
METHODRESTRICTIONid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table METHODRESTRICTION add 
Part null /* Структура, которой принадлежит метод */
;
alter  table METHODRESTRICTION add 
Method null /* Метод */
;
alter  table METHODRESTRICTION add 
IsRestricted null 
 check (IsRestricted in ( -1/* Да */
, 0/* Нет */ )) /* Запрещено использовать */
;


/*Методы типа*/
drop table TYPEMENU/*Методы уровня типа*/ 
;
create table TYPEMENU/*Методы уровня типа*/ (
ParentStructRowID CHAR(38) not null,
TYPEMENUid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table TYPEMENU add 
Name
 VARCHAR (64) null /* Название */
;
alter  table TYPEMENU add 
Caption
 VARCHAR (80) null /* Заголовок */
;
alter  table TYPEMENU add 
ToolTip
 VARCHAR (80) null /* Подсказка */
;
alter  table TYPEMENU add 
the_Action null /* Метод */
;
alter  table TYPEMENU add 
IsMenuItem null 
 check (IsMenuItem in ( -1/* Да */
, 0/* Нет */ )) /* Включать в меню */
;
alter  table TYPEMENU add 
IsToolBarButton null 
 check (IsToolBarButton in ( -1/* Да */
, 0/* Нет */ )) /* Включать в тулбар */
;
alter  table TYPEMENU add 
HotKey
 VARCHAR (20) null /* Горячая клавиша */
;


/*Приложение*/
drop table MTZAPP/*Группа взаимосвязных документов*/ 
;
create table MTZAPP/*Группа взаимосвязных документов*/ (
InstanceID CHAR(38) ,
MTZAPPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table MTZAPP add 
Name
 VARCHAR (255) null /* Название */
;
alter  table MTZAPP add 
DBName
 VARCHAR (64) null /* База данных */
;
alter  table MTZAPP add 
TheComment null /* Описание */
;


/*Обязательные приложения*/
drop table ParentPackage/*Приложения от которых зависит данное приложение*/ 
;
create table ParentPackage/*Приложения от которых зависит данное приложение*/ (
ParentStructRowID CHAR(38) not null,
ParentPackageid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ParentPackage add 
Package null /* Приложение */
;


/*Пакет генерации*/
drop table GENPACKAGE/*Пакет генерации*/ 
;
create table GENPACKAGE/*Пакет генерации*/ (
InstanceID CHAR(38) ,
GENPACKAGEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table GENPACKAGE add 
Name
 VARCHAR (255) null /* Название */
;


/*Генераторы*/
drop table GENERATOR_TARGET/*Генераторы*/ 
;
create table GENERATOR_TARGET/*Генераторы*/ (
ParentStructRowID CHAR(38) not null,
GENERATOR_TARGETid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table GENERATOR_TARGET add 
Name
 VARCHAR (255) null /* Название */
;
alter  table GENERATOR_TARGET add 
TargetType null 
 check (TargetType in ( 0/* СУБД */
, 4/* АРМ */
, 3/* Документация */
, 1/* МОДЕЛЬ */
, 2/* Приложение */ )) /* Тип платформы */
;
alter  table GENERATOR_TARGET add 
QueueName
 VARCHAR (255) null /* Очередь */
;
alter  table GENERATOR_TARGET add 
GeneratorProgID
 VARCHAR (255) null /* COM класс */
;
alter  table GENERATOR_TARGET add 
GeneratorStyle
 INTEGER null 
 check (GeneratorStyle in ( 0/* Один тип */
, 1/* Все типы сразу */ )) /* Вариант */
;
alter  table GENERATOR_TARGET add 
TheDevelopmentEnv null 
 check (TheDevelopmentEnv in ( 2/* JAVA */
, 3/* OTHER */
, 1/* DOTNET */
, 0/* VB6 */ )) /* Среда разработки */
;


/*Ручной код*/
drop table GENMANUALCODE/*Код, который не укладывается в описание модели*/ 
;
create table GENMANUALCODE/*Код, который не укладывается в описание модели*/ (
ParentStructRowID CHAR(38) not null,
GENMANUALCODEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table GENMANUALCODE add 
Name
 VARCHAR (255) null /* Название */
;
alter  table GENMANUALCODE add 
the_Alias
 VARCHAR (80) null /* Псевдоним */
;
alter  table GENMANUALCODE add 
Code null /* Код */
;


/*Контрольные элементы*/
drop table GENCONTROLS/*Контрольные элементы, которые используются при генерации*/ 
;
create table GENCONTROLS/*Контрольные элементы, которые используются при генерации*/ (
ParentStructRowID CHAR(38) not null,
GENCONTROLSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table GENCONTROLS add 
ControlProgID
 VARCHAR (255) null /* ProgID контрольконо элемента */
;
alter  table GENCONTROLS add 
ControlClassID
 VARCHAR (40) null /* Класс контрольногоэлемента */
;
alter  table GENCONTROLS add 
VersionMajor
 integer null /* Версия */
;
alter  table GENCONTROLS add 
VersionMinor
 integer null /* Подверсия */
;


/*Библиотеки*/
drop table GENREFERENCE/*Библиотеки, которые используются при генерации*/ 
;
create table GENREFERENCE/*Библиотеки, которые используются при генерации*/ (
ParentStructRowID CHAR(38) not null,
GENREFERENCEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table GENREFERENCE add 
Name
 VARCHAR (255) null /* Название */
;
alter  table GENREFERENCE add 
RefClassID
 VARCHAR (40) null /* Класс ссылки */
;
alter  table GENREFERENCE add 
VersionMajor
 integer null /* Номер версии */
;
alter  table GENREFERENCE add 
VersionMinor
 integer null /* Подверсия */
;


/*Локализация*/
drop table LocalizeInfo/**/ 
;
create table LocalizeInfo/**/ (
InstanceID CHAR(38) ,
LocalizeInfoid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table LocalizeInfo add 
LangFull
 VARCHAR (255) null /* Язык - название */
;
alter  table LocalizeInfo add 
LangShort
 VARCHAR (255) null /* Код языка */
;


/*Требование*/
drop table PEKPQ_DEF/*Описание требования на оплату*/ 
;
create table PEKPQ_DEF/*Описание требования на оплату*/ (
InstanceID CHAR(38) ,
PEKPQ_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKPQ_DEF add 
sequence
 integer null /* № */
;
alter  table PEKPQ_DEF add 
TheDate
 DATETIME null /* Дата требования */
;
alter  table PEKPQ_DEF add 
TheDept null /* Подразделение */
;
alter  table PEKPQ_DEF add 
TheComment null /* Назначение платежа */
;
alter  table PEKPQ_DEF add 
TheSumm null /* Сума платежа */
;
alter  table PEKPQ_DEF add 
ToSuplier null /* Контрагент */
;
alter  table PEKPQ_DEF add 
TheDescription null /* Примечание */
;
alter  table PEKPQ_DEF add 
TheDogovor null /* Договор */
;
alter  table PEKPQ_DEF add 
Code1C
 VARCHAR (40) null /* Код1С */
;


/*Банки*/
drop table ENTDIC_BANK/*Банки*/ 
;
create table ENTDIC_BANK/*Банки*/ (
InstanceID CHAR(38) ,
ENTDIC_BANKid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ENTDIC_BANK add 
BIC
 VARCHAR (11) null /* БИК */
;
alter  table ENTDIC_BANK add 
RKC
 VARCHAR (11) null /* РКЦ */
;
alter  table ENTDIC_BANK add 
ACC
 VARCHAR (20) null /* Счет */
;
alter  table ENTDIC_BANK add 
KORACC
 VARCHAR (20) null /* Кор. счет */
;
alter  table ENTDIC_BANK add 
SUBKORACC
 VARCHAR (20) null /* Суб кор счет */
;
alter  table ENTDIC_BANK add 
name
 VARCHAR (255) null /* Название */
;
alter  table ENTDIC_BANK add 
Addr
 VARCHAR (255) null /* Адрес */
;
alter  table ENTDIC_BANK add 
Code1C
 VARCHAR (40) null /* Код1С */
;


/*Тип доставки*/
drop table ENTDIC_DOST/*Тип доставки*/ 
;
create table ENTDIC_DOST/*Тип доставки*/ (
InstanceID CHAR(38) ,
ENTDIC_DOSTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ENTDIC_DOST add 
Code
 VARCHAR (10) null /* Код */
;
alter  table ENTDIC_DOST add 
name
 VARCHAR (255) null /* Название */
;


/*Города*/
drop table ENTDIC_TOWN/*Города*/ 
;
create table ENTDIC_TOWN/*Города*/ (
InstanceID CHAR(38) ,
ENTDIC_TOWNid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ENTDIC_TOWN add 
name
 VARCHAR (255) null /* Название */
;
alter  table ENTDIC_TOWN add 
country null /* Страна */
;


/*Тип транспорта*/
drop table ENTDIC_TransportType/*Типы транспорта*/ 
;
create table ENTDIC_TransportType/*Типы транспорта*/ (
InstanceID CHAR(38) ,
ENTDIC_TransportTypeid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ENTDIC_TransportType add 
TheName
 VARCHAR (255) null /* Название типа */
;


/*Организационно-правовая форма*/
drop table ENTDIC_OPF/*Организационно-правовая форма*/ 
;
create table ENTDIC_OPF/*Организационно-правовая форма*/ (
InstanceID CHAR(38) ,
ENTDIC_OPFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ENTDIC_OPF add 
name
 VARCHAR (255) null /* Название */
;


/*Единицы измерения*/
drop table ENTDIC_EDIZM/*Единицы измерения*/ 
;
create table ENTDIC_EDIZM/*Единицы измерения*/ (
InstanceID CHAR(38) ,
ENTDIC_EDIZMid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ENTDIC_EDIZM add 
code
 VARCHAR (10) null /* Код */
;
alter  table ENTDIC_EDIZM add 
name
 VARCHAR (255) null /* Название */
;
alter  table ENTDIC_EDIZM add 
Netto null /* Базовых единиц */
;
alter  table ENTDIC_EDIZM add 
baseEDIZM null /* Базовая единица изм. */
;


/*Валюта*/
drop table ENTDIC_CURRENCY/*Валюта*/ 
;
create table ENTDIC_CURRENCY/*Валюта*/ (
InstanceID CHAR(38) ,
ENTDIC_CURRENCYid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ENTDIC_CURRENCY add 
name
 VARCHAR (255) null /* Название */
;
alter  table ENTDIC_CURRENCY add 
Code
 VARCHAR (10) null /* Код */
;


/*Курс валюты*/
drop table ENTDIC_CURCOURCE/*Курс валюты*/ 
;
create table ENTDIC_CURCOURCE/*Курс валюты*/ (
ParentStructRowID CHAR(38) not null,
ENTDIC_CURCOURCEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ENTDIC_CURCOURCE add 
CourceDate
 DATETIME null /* Дата */
;
alter  table ENTDIC_CURCOURCE add 
the_Value null /* Курс */
;
alter  table ENTDIC_CURCOURCE add 
Quantity null /* Количество */
;


/*Страны*/
drop table ENTDIC_COUNTRY/*Страны*/ 
;
create table ENTDIC_COUNTRY/*Страны*/ (
InstanceID CHAR(38) ,
ENTDIC_COUNTRYid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ENTDIC_COUNTRY add 
Code
 VARCHAR (10) null /* Код */
;
alter  table ENTDIC_COUNTRY add 
name
 VARCHAR (255) null /* Название */
;


/*Название областей*/
drop table ENTDIC_REGION/*Название областей*/ 
;
create table ENTDIC_REGION/*Название областей*/ (
InstanceID CHAR(38) ,
ENTDIC_REGIONid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ENTDIC_REGION add 
Code
 VARCHAR (10) null /* Код */
;
alter  table ENTDIC_REGION add 
name
 VARCHAR (255) null /* Название */
;


/*Статистика  посещений сайта*/
drop table ST_MAIN/**/ 
;
create table ST_MAIN/**/ (
InstanceID CHAR(38) ,
ST_MAINid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ST_MAIN add 
AccessDate
 DATETIME null /* Дата */
;
alter  table ST_MAIN add 
UrlReferer
 VARCHAR (1024) null /* Предыдущий адрес */
;
alter  table ST_MAIN add 
UserAgent
 VARCHAR (256) null /* Интернет агент */
;
alter  table ST_MAIN add 
UserHostAddress
 VARCHAR (512) null /* Адрес хоста */
;
alter  table ST_MAIN add 
UserHostName
 VARCHAR (512) null /* Имя хоста */
;
alter  table ST_MAIN add 
the_Description
 VARCHAR (1024) null /* Примечания */
;
alter  table ST_MAIN add 
WEBS_Page null /* Стартовая страница */
;


/*Описание*/
drop table ST_DEF/**/ 
;
create table ST_DEF/**/ (
InstanceID CHAR(38) ,
ST_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ST_DEF add 
Name
 VARCHAR (1024) null /* Имя */
;
alter  table ST_DEF add 
WEBS null /* Сайт */
;
alter  table ST_DEF add 
the_Description
 VARCHAR (4000) null /* Примечания */
;
alter  table ST_DEF add 
IsActive null 
 check (IsActive in ( -1/* Да */
, 0/* Нет */ )) /* Активна */
;


/*Статистика посещений страниц сайта*/
drop table ST_PAGES/**/ 
;
create table ST_PAGES/**/ (
InstanceID CHAR(38) ,
ST_PAGESid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ST_PAGES add 
AccessDate
 DATETIME null /* Дата */
;
alter  table ST_PAGES add 
UrlReferer
 VARCHAR (1024) null /* Предыдущий адрес */
;
alter  table ST_PAGES add 
UserAgent
 VARCHAR (256) null /* Интернет агент */
;
alter  table ST_PAGES add 
UserHostAddress
 VARCHAR (512) null /* Адрес хоста */
;
alter  table ST_PAGES add 
UserHostName
 VARCHAR (512) null /* Имя хоста */
;
alter  table ST_PAGES add 
the_Description
 VARCHAR (1024) null /* Примечания */
;
alter  table ST_PAGES add 
WEBS_Page null /* Стартовая страница */
;


/*Описание расширения Журнал*/
drop table STDJournlaExtInfo/**/ 
;
create table STDJournlaExtInfo/**/ (
InstanceID CHAR(38) ,
STDJournlaExtInfoid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table STDJournlaExtInfo add 
TheName
 VARCHAR (255) null /* Название */
;
alter  table STDJournlaExtInfo add 
TheJournalRef null /* Журнал */
;


/*Параметры*/
drop table STDJournalExtParam/**/ 
;
create table STDJournalExtParam/**/ (
InstanceID CHAR(38) ,
STDJournalExtParamid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table STDJournalExtParam add 
FieldName
 VARCHAR (255) null /* Поле (значение) */
;
alter  table STDJournalExtParam add 
ParamName
 VARCHAR (80) null /* Параметр */
;
alter  table STDJournalExtParam add 
TargetPlatform null /* Целевая платформа */
;


/*Фильтры журнала*/
drop table STDJournalExtFlt/**/ 
;
create table STDJournalExtFlt/**/ (
InstanceID CHAR(38) ,
STDJournalExtFltid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table STDJournalExtFlt add 
ViewSource
 VARCHAR (255) null /* Запрос журнала */
;


/*Поля фильтра*/
drop table STDJournalExtField/**/ 
;
create table STDJournalExtField/**/ (
ParentStructRowID CHAR(38) not null,
STDJournalExtFieldid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table STDJournalExtField add 
ViewField
 VARCHAR (255) null /* Колонка журнала */
;
alter  table STDJournalExtField add 
FieldSource
 VARCHAR (255) null /* Поле (значение) */
;
alter  table STDJournalExtField add 
TargetPlatform null /* Целевая платформа */
;
alter  table STDJournalExtField add 
ConstantValue
 VARCHAR (255) null /* Значение */
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
, 0/* none */ )) /* Условие на поле */
;


/*Дни*/
drop table CAL_DAYS/*День календаря*/ 
;
create table CAL_DAYS/*День календаря*/ (
InstanceID CHAR(38) ,
CAL_DAYSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table CAL_DAYS add 
TheDate
 DATETIME null /* Дата */
;
alter  table CAL_DAYS add 
IsHoliday null 
 check (IsHoliday in ( -1/* Да */
, 0/* Нет */ )) /* Выходной */
;


/*Рабочие часы*/
drop table CAL_TIME/*Рабочее время в пределах дня*/ 
;
create table CAL_TIME/*Рабочее время в пределах дня*/ (
ParentStructRowID CHAR(38) not null,
CAL_TIMEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table CAL_TIME add 
FromTime
 datetime null /* Начало периода */
;
alter  table CAL_TIME add 
ToTime
 datetime null /* Конец периода */
;


/*Описание*/
drop table CAL_HEAD/*Описание календаря*/ 
;
create table CAL_HEAD/*Описание календаря*/ (
InstanceID CHAR(38) ,
CAL_HEADid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table CAL_HEAD add 
Name
 VARCHAR (255) null /* Название */
;
alter  table CAL_HEAD add 
FillStyle
 VARCHAR (255) null /* Вариант заполнения */
;


/*Суть сообщения*/
drop table SrvMessageInfo/*Суть сообщения*/ 
;
create table SrvMessageInfo/*Суть сообщения*/ (
InstanceID CHAR(38) ,
SrvMessageInfoid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table SrvMessageInfo add 
ForUser null /* Для пользователя */
;
alter  table SrvMessageInfo add 
msgDate
 DATETIME null /* Дата */
;
alter  table SrvMessageInfo add 
MsgInfo null /* Текст сообщения */
;
alter  table SrvMessageInfo add 
TheDocument null /* Документ */
;
alter  table SrvMessageInfo add 
ReadTime
 DATETIME null /* Время прочтения */
;


/*Описание*/
drop table PEKNAL_DEF/*Раздел описывает факт наличной оплаты*/ 
;
create table PEKNAL_DEF/*Раздел описывает факт наличной оплаты*/ (
InstanceID CHAR(38) ,
PEKNAL_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKNAL_DEF add 
TheNumber
 VARCHAR (20) null /* Номер */
;
alter  table PEKNAL_DEF add 
TheDate
 DATETIME null /* Дата оплаты */
;
alter  table PEKNAL_DEF add 
TheSumm null /* Сумма оплаты */
;
alter  table PEKNAL_DEF add 
ThePEKZ null /* Заявка */
;
alter  table PEKNAL_DEF add 
TheDept null /* Из подразделения */
;
alter  table PEKNAL_DEF add 
FromClient null /* От клиента */
;
alter  table PEKNAL_DEF add 
TheComment null /* Назначение платежа */
;
alter  table PEKNAL_DEF add 
RceivedBy null /* Кто получил */
;
alter  table PEKNAL_DEF add 
Code1C
 VARCHAR (40) null /* Код1С */
;


/*Привязка к заявкам*/
drop table PEKNAL_PZ/*Привязка оплаты к заявкам*/ 
;
create table PEKNAL_PZ/*Привязка оплаты к заявкам*/ (
InstanceID CHAR(38) ,
PEKNAL_PZid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKNAL_PZ add 
PZ null /* Заявка */
;
alter  table PEKNAL_PZ add 
TheSumm null /* Сумма */
;


/*Раскладка по филиалам*/
drop table PEKNAL_ROWS/*Разбивка стоимости наличной оплаты по филиалам*/ 
;
create table PEKNAL_ROWS/*Разбивка стоимости наличной оплаты по филиалам*/ (
InstanceID CHAR(38) ,
PEKNAL_ROWSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKNAL_ROWS add 
TheNumber
 VARCHAR (20) null /* Номер */
;
alter  table PEKNAL_ROWS add 
TheDate
 DATETIME null /* Дата оплаты */
;
alter  table PEKNAL_ROWS add 
TheSumm null /* Сумма оплаты */
;
alter  table PEKNAL_ROWS add 
TheDept null /* Подразделение */
;
alter  table PEKNAL_ROWS add 
FromClient null /* От клиента */
;
alter  table PEKNAL_ROWS add 
TheDogovor null /* Договор */
;


/*Файл*/
drop table FileDef/*Файл*/ 
;
create table FileDef/*Файл*/ (
InstanceID CHAR(38) ,
FileDefid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table FileDef add 
Name
 VARCHAR (255) null /* Название */
;
alter  table FileDef add 
the_Comment null /* Пояснение */
;


/*Версии*/
drop table FileVersion/*Версии файла*/ 
;
create table FileVersion/*Версии файла*/ (
InstanceID CHAR(38) ,
FileVersionid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
;
alter  table FileVersion add 
Version
 VARCHAR (20) null /* Номер версии */
;
alter  table FileVersion add 
Ext
 VARCHAR (5) null /* Расширение */
;
alter  table FileVersion add 
CurrentVersion null 
 check (CurrentVersion in ( -1/* Да */
, 0/* Нет */ )) /* Текущая версия */
;
alter  table FileVersion add 
the_Comment null /* Пояснение */
;
alter  table FileVersion add 
FileData null /* Данные */
;
alter  table FileVersion add 
 FileData_EXT char(4) null
;


/*Зоны*/
drop table Num_zones/*Зоны уникальных нумеров*/ 
;
create table Num_zones/*Зоны уникальных нумеров*/ (
InstanceID CHAR(38) ,
Num_zonesid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table Num_zones add 
ZoneMask
 VARCHAR (255) null /* Маска зоны */
;


/*Номера*/
drop table Num_Values/*уникальные номера*/ 
;
create table Num_Values/*уникальные номера*/ (
ParentStructRowID CHAR(38) not null,
Num_Valuesid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table Num_Values add 
the_Value
 integer null /* Значение */
;
alter  table Num_Values add 
OwnerPartName
 VARCHAR (64) null /* Раздел */
;
alter  table Num_Values add 
OwnerRowID
 uniqueidentifier null /* Идентификатор строки */
;


/*Описание*/
drop table Num_head/*Описание нумератора*/ 
;
create table Num_head/*Описание нумератора*/ (
InstanceID CHAR(38) ,
Num_headid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table Num_head add 
Name
 VARCHAR (80) null /* Название */
;
alter  table Num_head add 
Shema
 INTEGER null 
 check (Shema in ( 0/* Единая зона */
, 1/* По году */
, 4/* По дню */
, 2/* По кварталу */
, 3/* По месяцу */
, 10/* Произвольные зоны */ )) /* Схема нумерации */
;


/*Текущие настройки*/
drop table BaseSetting/**/ 
;
create table BaseSetting/**/ (
InstanceID CHAR(38) ,
BaseSettingid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table BaseSetting add 
FIL null /* Филиал */
;
alter  table BaseSetting add 
NDS
 VARCHAR (10) null /* Ставка НДС */
;
alter  table BaseSetting add 
NewClientTRF null /* Тариф для нового клиента */
;
alter  table BaseSetting add 
SingleSendTRF null /* Тариф для разовой отправки */
;
alter  table BaseSetting add 
SingleSendCli null /* Клиент для всех разовых заявок */
;
alter  table BaseSetting add 
Passport
 VARCHAR (200) null /* Данные паспорта для Ф116 */
;
alter  table BaseSetting add 
NDS103 null 
 check (NDS103 in ( -1/* Да */
, 0/* Нет */ )) /* Ф103 с НДС */
;
alter  table BaseSetting add 
Count103
 VARCHAR (5) null /* Кол-во Ф103 */
;
alter  table BaseSetting add 
TrTypeDef null /* Тип доставки по умолчанию */
;
alter  table BaseSetting add 
Direction null /* Направление по умолчанию */
;
alter  table BaseSetting add 
WED null /* Ед. изм. веса по умолчанию */
;
alter  table BaseSetting add 
VED null /* Ед. изм. объема по умолчанию */
;
alter  table BaseSetting add 
Code null 
 check (Code in ( -1/* Да */
, 0/* Нет */ )) /* Присваивать номер при взвешивании */
;
alter  table BaseSetting add 
IDX
 VARCHAR (10) null /* Индекс почтового отделения */
;
alter  table BaseSetting add 
DateSHCode
 VARCHAR (10) null /* Явный код месяца для штрих-кода */
;
alter  table BaseSetting add 
Round500 null 
 check (Round500 in ( -1/* Да */
, 0/* Нет */ )) /* Округление до 500 гр. */
;
alter  table BaseSetting add 
AccountGeneral
 VARCHAR (100) null /* Главный бухгалтер */
;
alter  table BaseSetting add 
CashMan
 VARCHAR (255) null /* Кассир */
;
alter  table BaseSetting add 
addInvoiceInfo null /* Доверенность (для счет-фактуры) */
;
alter  table BaseSetting add 
genDirector
 VARCHAR (255) null /* Руководитель организации */
;


/*Описание*/
drop table Reports/*Описание*/ 
;
create table Reports/*Описание*/ (
InstanceID CHAR(38) ,
Reportsid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table Reports add 
Name
 VARCHAR (255) null /* Название */
;
alter  table Reports add 
ReportFile null /* Файл отчета */
;
alter  table Reports add 
 ReportFile_EXT char(4) null
;
alter  table Reports add 
Caption
 VARCHAR (255) null /* Заголовок */
;
alter  table Reports add 
PrepareMethod null /* Метод для формирования */
;
alter  table Reports add 
ReportType
 INTEGER null 
 check (ReportType in ( 1/* Двумерная матрица */
, 0/* Таблица */
, 3/* Экспорт по WORD шаблону */
, 2/* Только расчет */
, 4/* Экспорт по Excel шаблону */ )) /* Тип отчета */
;
alter  table Reports add 
TheReportExt null /* Расширение для создания отчета */
;
alter  table Reports add 
ReportView
 VARCHAR (255) null /* Базовый запрос */
;
alter  table Reports add 
TheComment null /* Описание */
;


/*Секции*/
drop table RPTStruct/*Секции*/ 
;
create table RPTStruct/*Секции*/ (
InstanceID CHAR(38) ,
RPTStructid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
;
alter  table RPTStruct add 
Name
 VARCHAR (64) null /* Название */
;
alter  table RPTStruct add 
Caption
 VARCHAR (255) null /* Заголовок */
;


/*Поля секции*/
drop table RPTFields/*Поля секции*/ 
;
create table RPTFields/*Поля секции*/ (
ParentStructRowID CHAR(38) not null,
RPTFieldsid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table RPTFields add 
Name
 VARCHAR (64) null /* Название */
;
alter  table RPTFields add 
FieldType null /* Тип поля */
;
alter  table RPTFields add 
FieldSize
 integer null /* Размер */
;
alter  table RPTFields add 
Caption
 VARCHAR (255) null /* Заголовок */
;


/*Формулы*/
drop table RPTFormula/*Формулы*/ 
;
create table RPTFormula/*Формулы*/ (
InstanceID CHAR(38) ,
RPTFormulaid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table RPTFormula add 
Name
 VARCHAR (64) null /* Название */
;
alter  table RPTFormula add 
Code null /* Выражение */
;
alter  table RPTFormula add 
Platform null /* Платформа */
;


/*Описание*/
drop table PEKRKO_DEF/*Раздел описывает факт возварта наличных из кассы*/ 
;
create table PEKRKO_DEF/*Раздел описывает факт возварта наличных из кассы*/ (
InstanceID CHAR(38) ,
PEKRKO_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKRKO_DEF add 
TheNumber
 VARCHAR (20) null /* Номер */
;
alter  table PEKRKO_DEF add 
TheDate
 DATETIME null /* Дата оплаты */
;
alter  table PEKRKO_DEF add 
TheSumm null /* Сумма оплаты */
;
alter  table PEKRKO_DEF add 
ThePEKZ null /* Заявка */
;
alter  table PEKRKO_DEF add 
TheDept null /* Из подразделения */
;
alter  table PEKRKO_DEF add 
FromClient null /* Клиент-получатель */
;
alter  table PEKRKO_DEF add 
TheComment null /* Назначение платежа */
;
alter  table PEKRKO_DEF add 
EmpPayed null /* Кто выдал */
;
alter  table PEKRKO_DEF add 
Code1C
 VARCHAR (40) null /* Код1С */
;


/*Раскладка по филиалам*/
drop table PEKRKO_ROWS/*Разбивка стоимости возврата наличных по филиалам*/ 
;
create table PEKRKO_ROWS/*Разбивка стоимости возврата наличных по филиалам*/ (
InstanceID CHAR(38) ,
PEKRKO_ROWSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKRKO_ROWS add 
TheNumber
 VARCHAR (20) null /* Номер */
;
alter  table PEKRKO_ROWS add 
TheDate
 DATETIME null /* Дата оплаты */
;
alter  table PEKRKO_ROWS add 
TheSumm null /* Сумма оплаты */
;
alter  table PEKRKO_ROWS add 
TheDept null /* Подразделение */
;
alter  table PEKRKO_ROWS add 
FromClient null /* От клиента */
;
alter  table PEKRKO_ROWS add 
TheDogovor null /* Договор */
;


/*Регресс по общему весу*/
drop table PEKTRF_REGALL/*Регресс по общему весу*/ 
;
create table PEKTRF_REGALL/*Регресс по общему весу*/ (
InstanceID CHAR(38) ,
PEKTRF_REGALLid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKTRF_REGALL add 
WeightFrom null /* Суммарный вес от */
;
alter  table PEKTRF_REGALL add 
WeightTo null /* Суммарный вес по */
;
alter  table PEKTRF_REGALL add 
WeightEDIZM null /* Ед. изм. веса */
;
alter  table PEKTRF_REGALL add 
PricePercent null /* Процент от тарифа */
;
alter  table PEKTRF_REGALL add 
FixedPrice null /* Фиксированная цена */
;
alter  table PEKTRF_REGALL add 
PriceCurrency null /* Валюта фиксированной цены */
;


/*Скидки*/
drop table PEKTRF_DECR/*Скидки*/ 
;
create table PEKTRF_DECR/*Скидки*/ (
InstanceID CHAR(38) ,
PEKTRF_DECRid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKTRF_DECR add 
Name
 VARCHAR (255) null /* Название скидки */
;
alter  table PEKTRF_DECR add 
DecrPercent null /* Процент к тарифу */
;


/*Надбавки*/
drop table PEKTRF_ADDS/*Надбавки*/ 
;
create table PEKTRF_ADDS/*Надбавки*/ (
InstanceID CHAR(38) ,
PEKTRF_ADDSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKTRF_ADDS add 
Name null /* Название надбавки */
;
alter  table PEKTRF_ADDS add 
AddPercent null /* Процент к тарифной ставке */
;
alter  table PEKTRF_ADDS add 
MinValue null /* Минимальное значение */
;
alter  table PEKTRF_ADDS add 
MaxValue null /* Максимальное значение */
;


/*Общее описание*/
drop table PEKTRF_DEF/*Общее описание*/ 
;
create table PEKTRF_DEF/*Общее описание*/ (
InstanceID CHAR(38) ,
PEKTRF_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKTRF_DEF add 
VolumeTarif null 
 check (VolumeTarif in ( -1/* Да */
, 0/* Нет */ )) /* Тариф по объему */
;
alter  table PEKTRF_DEF add 
StartDate
 DATETIME null /* Начало действия */
;
alter  table PEKTRF_DEF add 
TType null /* Тип тарифа */
;
alter  table PEKTRF_DEF add 
TRType null /* Тип доставки */
;
alter  table PEKTRF_DEF add 
IncludeNDS null 
 check (IncludeNDS in ( -1/* Да */
, 0/* Нет */ )) /* Цены с НДС */
;
alter  table PEKTRF_DEF add 
MinPPOWeight null /* Минимальный расчетный вес */
;
alter  table PEKTRF_DEF add 
SupplierTarif null 
 check (SupplierTarif in ( -1/* Да */
, 0/* Нет */ )) /* Тариф поставщика */
;
alter  table PEKTRF_DEF add 
Supplier null /* Поставщик */
;
alter  table PEKTRF_DEF add 
EndDate
 DATETIME null /* Конец действия тарифа */
;
alter  table PEKTRF_DEF add 
TheFilial null /* Филиал */
;
alter  table PEKTRF_DEF add 
NalAdds null /* Надбавка за наличную оплату */
;


/*Автодоставка*/
drop table PEKTRF_AUTO/*Стоимость автодоставки груза*/ 
;
create table PEKTRF_AUTO/*Стоимость автодоставки груза*/ (
InstanceID CHAR(38) ,
PEKTRF_AUTOid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKTRF_AUTO add 
AutoType null /* Тип автотранспорта */
;
alter  table PEKTRF_AUTO add 
ForTime null 
 check (ForTime in ( -1/* Да */
, 0/* Нет */ )) /* За время */
;
alter  table PEKTRF_AUTO add 
ByLength null 
 check (ByLength in ( -1/* Да */
, 0/* Нет */ )) /* От расстояния */
;
alter  table PEKTRF_AUTO add 
LengthPrice null /* Стоимость за км */
;
alter  table PEKTRF_AUTO add 
HourPrice null /* Стоимость часа */
;


/*Тарифы на услуги*/
drop table PEKTRF_SRV/*Тарифы на услуги*/ 
;
create table PEKTRF_SRV/*Тарифы на услуги*/ (
InstanceID CHAR(38) ,
PEKTRF_SRVid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKTRF_SRV add 
SrvTYPE null /* Услуга */
;
alter  table PEKTRF_SRV add 
Price null /* Цена */
;
alter  table PEKTRF_SRV add 
TheCurrency null /* Валюта */
;
alter  table PEKTRF_SRV add 
EDIZM null /* Ед. изм. */
;
alter  table PEKTRF_SRV add 
Quant null /* Количество */
;


/*Транспортировка*/
drop table PEKTRF_TR/*Транспортировка*/ 
;
create table PEKTRF_TR/*Транспортировка*/ (
InstanceID CHAR(38) ,
PEKTRF_TRid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKTRF_TR add 
Train null /* Направление */
;
alter  table PEKTRF_TR add 
ToST null /* До станции */
;
alter  table PEKTRF_TR add 
Price null /* Цена */
;
alter  table PEKTRF_TR add 
TheCurrency null /* Валюта */
;
alter  table PEKTRF_TR add 
TheQuantity null /* Количество */
;
alter  table PEKTRF_TR add 
EDIZM null /* Единица измерения */
;


/*Регресс по весу*/
drop table PEKTRF_REGRTR/*Регресс по весу*/ 
;
create table PEKTRF_REGRTR/*Регресс по весу*/ (
ParentStructRowID CHAR(38) not null,
PEKTRF_REGRTRid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKTRF_REGRTR add 
WeightFrom null /* Суммарный вес от */
;
alter  table PEKTRF_REGRTR add 
WeightTo null /* Суммарный вес по */
;
alter  table PEKTRF_REGRTR add 
WeightEDIZM null /* Ед. изм. веса */
;
alter  table PEKTRF_REGRTR add 
PricePercent null /* Процент от тарифа */
;
alter  table PEKTRF_REGRTR add 
FixedPrice null /* Фиксированная цена */
;
alter  table PEKTRF_REGRTR add 
PriceCurrency null /* Валюта фиксированной цены */
;


/*Описание лимита*/
drop table PEKCL_DEF/*Описание лимита*/ 
;
create table PEKCL_DEF/*Описание лимита*/ (
InstanceID CHAR(38) ,
PEKCL_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKCL_DEF add 
TheDep null /* Филиал */
;
alter  table PEKCL_DEF add 
LimDate
 DATETIME null /* Дата */
;


/*Текущие лимиты*/
drop table PEKCL_DAYLY/*Текущие лимиты*/ 
;
create table PEKCL_DAYLY/*Текущие лимиты*/ (
InstanceID CHAR(38) ,
PEKCL_DAYLYid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKCL_DAYLY add 
Train null /* Поезд */
;
alter  table PEKCL_DAYLY add 
GOTYPE null /* Тип СГО */
;
alter  table PEKCL_DAYLY add 
TheValue null /* Объем */
;
alter  table PEKCL_DAYLY add 
ValueEDIZM null /* Ед. изм. объема */
;
alter  table PEKCL_DAYLY add 
WeightValue null /* Вес */
;
alter  table PEKCL_DAYLY add 
WeightEDIZM null /* Ед. изм.веса */
;
alter  table PEKCL_DAYLY add 
the_Description null /* Описание */
;


/*Обемы под загрузку*/
drop table PEKL_TOLOAD/*Обемы под загрузку*/ 
;
create table PEKL_TOLOAD/*Обемы под загрузку*/ (
ParentStructRowID CHAR(38) not null,
PEKL_TOLOADid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKL_TOLOAD add 
SRCPekZ null /* По заявке */
;
alter  table PEKL_TOLOAD add 
TheValue null /* Объем */
;
alter  table PEKL_TOLOAD add 
ValueEDIZM null /* Ед. изм. объема */
;
alter  table PEKL_TOLOAD add 
WeightValue null /* Вес */
;
alter  table PEKL_TOLOAD add 
WeightEDIZM null /* Ед. изм.веса */
;


/*Описание*/
drop table MTZExt_def/*Список зарегистрированных расширений*/ 
;
create table MTZExt_def/*Список зарегистрированных расширений*/ (
InstanceID CHAR(38) ,
MTZExt_defid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table MTZExt_def add 
Name
 VARCHAR (255) null /* Название */
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
, 4/* JrnlRunExt */ )) /* Тип расширения */
;
alter  table MTZExt_def add 
TheDescription null /* Описание */
;


/*Реализации расширения*/
drop table MTZExtRel/*Реализации расширения для разных разработческих плаформ*/ 
;
create table MTZExtRel/*Реализации расширения для разных разработческих плаформ*/ (
InstanceID CHAR(38) ,
MTZExtRelid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
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
, 0/* VB6 */ )) /* Реализация */
;
alter  table MTZExtRel add 
TheClassName
 VARCHAR (255) null /* Название класса */
;
alter  table MTZExtRel add 
TheLibraryName
 VARCHAR (255) null /* Название библиотеки */
;


/*Описание*/
drop table InfoStoreDef/*Описание каталога*/ 
;
create table InfoStoreDef/*Описание каталога*/ (
InstanceID CHAR(38) ,
InfoStoreDefid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table InfoStoreDef add 
TheGroup null /* Группа */
;
alter  table InfoStoreDef add 
Name
 VARCHAR (255) null /* Название */
;
alter  table InfoStoreDef add 
InfoStoreType
 INTEGER null 
 check (InfoStoreType in ( 2/* Групповой */
, 1/* Персональный */
, 0/*  Общий */ )) /* Тип каталога */
;
alter  table InfoStoreDef add 
TheUser null /* Пользователь */
;


/*Папка*/
drop table Folder/*Папка каталога*/ 
;
create table Folder/*Папка каталога*/ (
InstanceID CHAR(38) ,
Folderid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
;
alter  table Folder add 
Name
 VARCHAR (255) null /* Название */
;
alter  table Folder add 
FolderType null 
 check (FolderType in ( 2/* Исходящие */
, 10/* Завершенные */
, 5/* Календарь */
, 0/*   */
, 1/* Входящие */
, 9/* Отложенные */
, 4/* Журнал */
, 8/* В работе */
, 7/* Черновики */
, 6/* Отправленные */
, 3/* Удаленные */ )) /* Тип папки */
;


/*Документы*/
drop table Shortcut/*Ярлыки документов*/ 
;
create table Shortcut/*Ярлыки документов*/ (
ParentStructRowID CHAR(38) not null,
Shortcutid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table Shortcut add 
DocItem null /* Документ */
;
alter  table Shortcut add 
StartMode
 VARCHAR (255) null /* Режим */
;


/*Описание платежа*/
drop table PEKP_DEF/*Описание платежа*/ 
;
create table PEKP_DEF/*Описание платежа*/ (
InstanceID CHAR(38) ,
PEKP_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKP_DEF add 
FromClient null /* Клиент */
;
alter  table PEKP_DEF add 
PLPNUM
 VARCHAR (20) null /* № документа */
;
alter  table PEKP_DEF add 
PLPDate
 DATETIME null /* Дата документа */
;
alter  table PEKP_DEF add 
PLPSumm null /* Сумма */
;
alter  table PEKP_DEF add 
TheCurrncy null /* Валюта */
;
alter  table PEKP_DEF add 
TheDogovor null /* К договору */
;
alter  table PEKP_DEF add 
TheComment null /* Назначение платежа */
;
alter  table PEKP_DEF add 
TheDept null /* Подразделение */
;
alter  table PEKP_DEF add 
Code1C
 VARCHAR (40) null /* Код1С */
;


/*Заявки к платежному поручению*/
drop table PEKP_PZ/*привязка заявок к платежному поручению*/ 
;
create table PEKP_PZ/*привязка заявок к платежному поручению*/ (
InstanceID CHAR(38) ,
PEKP_PZid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKP_PZ add 
PZ null /* Заявка */
;
alter  table PEKP_PZ add 
TheSumm null /* Сумма */
;


/*Журнал событий*/
drop table SysLog/*Журнал событий, которые произошли в системе*/ 
;
create table SysLog/*Журнал событий, которые произошли в системе*/ (
InstanceID CHAR(38) ,
SysLogid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table SysLog add 
TheSession null /* Сессия */
;
alter  table SysLog add 
the_Resource
 VARCHAR (255) null /* Ресурс */
;
alter  table SysLog add 
LogStructID
 VARCHAR (255) null /* Раздел с которым происхоит действие */
;
alter  table SysLog add 
VERB
 VARCHAR (80) null /* Действие */
;
alter  table SysLog add 
LogInstanceID
 uniqueidentifier null /* Идентификатор документа */
;


/*Сессия пользователя*/
drop table the_Session/*Зарегистрированные сессии пользователей*/ 
;
create table the_Session/*Зарегистрированные сессии пользователей*/ (
InstanceID CHAR(38) ,
the_Sessionid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table the_Session add 
UserRole null /* Текущая роль пользователя */
;
alter  table the_Session add 
ClosedAt
 DATETIME null /* Момент закрытия */
;
alter  table the_Session add 
Closed
 integer null 
 check (Closed in ( 1/* Да */
, 0/* Нет */ )) /* Закрыта */
;
alter  table the_Session add 
Usersid null /* Пользователь */
;
alter  table the_Session add 
LastAccess
 DATETIME null /* Последнее подтверждение */
;
alter  table the_Session add 
StartAt
 DATETIME null /* Момент открытия */
;
alter  table the_Session add 
Lang
 VARCHAR (25) null /* Язык */
;


/*Роботы журнала событий*/
drop table LogReader/*Программы, которые регистрируют себя как 
обработчики лога событий.*/ 
;
create table LogReader/*Программы, которые регистрируют себя как 
обработчики лога событий.*/ (
InstanceID CHAR(38) ,
LogReaderid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table LogReader add 
Name
 VARCHAR (80) null /* Название */
;
alter  table LogReader add 
AutoStart
 integer null 
 check (AutoStart in ( 1/* Да */
, 0/* Нет */ )) /* Автоматизированный запуск */
;
alter  table LogReader add 
AutoProgid
 VARCHAR (255) null /* Класс для автоматического запуска */
;
alter  table LogReader add 
ReadMarker
 DATETIME null /* Дата последней прочитанной записи */
;
alter  table LogReader add 
StartInterval
 integer null /* Интервал запуска (мин) */
;
alter  table LogReader add 
LastStart
 DATETIME null /* Дата последнего запуска */
;
alter  table LogReader add 
LastStop
 DATETIME null /* Дата последне останвки */
;


/*Действия*/
drop table Verb/*Защищаемые системой дейсвия*/ 
;
create table Verb/*Защищаемые системой дейсвия*/ (
InstanceID CHAR(38) ,
Verbid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table Verb add 
Name
 VARCHAR (80) null /* Название */
;


/*Пользователи*/
drop table Users/*Пользователи*/ 
;
create table Users/*Пользователи*/ (
InstanceID CHAR(38) ,
Usersid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table Users add 
Family
 VARCHAR (255) null /* Фамилия */
;
alter  table Users add 
Name
 VARCHAR (64) null /* Имя */
;
alter  table Users add 
SurName
 VARCHAR (255) null /* Отчество */
;
alter  table Users add 
Login
 VARCHAR (64) null /* Имя для входа */
;
alter  table Users add 
Password varchar(80) null /* Пароль */
;
alter  table Users add 
DomaiName
 VARCHAR (255) null /* Доменное имя */
;
alter  table Users add 
EMail varchar(255) null /* e-mail */
;
alter  table Users add 
Phone
 VARCHAR (20) null /* Телефон */
;
alter  table Users add 
LocalPhone
 VARCHAR (20) null /* Местный телефон */
;
alter  table Users add 
MobilePhone
 VARCHAR (20) null /* Мобильный телефон */
;
alter  table Users add 
Photo null /* Фото */
;
alter  table Users add 
BirthDay
 DATETIME null /* Дата рождения */
;
alter  table Users add 
Activity null /* Журнал активности */
;
alter  table Users add 
CertificateID
 VARCHAR (255) null /* CertificateID */
;
alter  table Users add 
CertData null /* CertData */
;
alter  table Users add 
ClientDef null /* Ассоциация с клиентом */
;
alter  table Users add 
PersonaData null /* PersonaData */
;


/*Группы*/
drop table Groups/*Группы*/ 
;
create table Groups/*Группы*/ (
InstanceID CHAR(38) ,
Groupsid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table Groups add 
Name
 VARCHAR (80) null /* Название */
;


/*Состав группы*/
drop table GroupUser/*Состав группы*/ 
;
create table GroupUser/*Состав группы*/ (
ParentStructRowID CHAR(38) not null,
GroupUserid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table GroupUser add 
TheUser null /* Пользователь */
;


/*Стадия договора*/
drop table VRDContractStage/*Стадия договора*/ 
;
create table VRDContractStage/*Стадия договора*/ (
InstanceID CHAR(38) ,
VRDContractStageid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRDContractStage add 
Name
 VARCHAR (255) null /* Название */
;


/*Тип отчета*/
drop table VRDRreportType/*Тип отчета*/ 
;
create table VRDRreportType/*Тип отчета*/ (
InstanceID CHAR(38) ,
VRDRreportTypeid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRDRreportType add 
Name
 VARCHAR (255) null /* Название */
;


/*Типы проектов*/
drop table VRDPrjType/*Типы проектов*/ 
;
create table VRDPrjType/*Типы проектов*/ (
InstanceID CHAR(38) ,
VRDPrjTypeid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRDPrjType add 
Name
 VARCHAR (255) null /* Название */
;


/*Направление деятельности*/
drop table VRDStream/*Направление деятельности*/ 
;
create table VRDStream/*Направление деятельности*/ (
InstanceID CHAR(38) ,
VRDStreamid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRDStream add 
Name
 VARCHAR (255) null /* Назввание */
;


/*Заинтересованность*/
drop table VRDInterest/*Заинтересованность*/ 
;
create table VRDInterest/*Заинтересованность*/ (
InstanceID CHAR(38) ,
VRDInterestid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRDInterest add 
Name
 VARCHAR (255) null /* Название */
;


/*Тип документа*/
drop table VRDDocType/*Тип документа*/ 
;
create table VRDDocType/*Тип документа*/ (
InstanceID CHAR(38) ,
VRDDocTypeid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRDDocType add 
Name
 VARCHAR (255) null /* Название */
;


/*Лояльность*/
drop table VRDLoyalty/*Лояльность*/ 
;
create table VRDLoyalty/*Лояльность*/ (
InstanceID CHAR(38) ,
VRDLoyaltyid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRDLoyalty add 
the_Level
 VARCHAR (255) null /* Степень */
;


/*Рынки*/
drop table VRDMarket/*Рынки*/ 
;
create table VRDMarket/*Рынки*/ (
InstanceID CHAR(38) ,
VRDMarketid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
;
alter  table VRDMarket add 
Name
 VARCHAR (255) null /* Название */
;


/*Описание прав*/
drop table MTZSEC_RIGHT/*описание прав для каждой группы*/ 
;
create table MTZSEC_RIGHT/*описание прав для каждой группы*/ (
InstanceID CHAR(38) ,
MTZSEC_RIGHTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table MTZSEC_RIGHT add 
Piority
 integer null /* Приоритет */
;
alter  table MTZSEC_RIGHT add 
TheGroup null /* Группа */
;
alter  table MTZSEC_RIGHT add 
ProtectedItem
 VARCHAR (255) null /* Защищаемый элемент */
;
alter  table MTZSEC_RIGHT add 
Allow null 
 check (Allow in ( -1/* Да */
, 0/* Нет */ )) /* Разрешение */
;


/*Банковские реквизиты*/
drop table VRCAccounts/*Банковские реквизиты*/ 
;
create table VRCAccounts/*Банковские реквизиты*/ (
InstanceID CHAR(38) ,
VRCAccountsid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRCAccounts add 
BANK null /* Банк */
;
alter  table VRCAccounts add 
acc
 VARCHAR (20) null /* № счета */
;
alter  table VRCAccounts add 
fillial null /* Название филиала */
;
alter  table VRCAccounts add 
DefaultAccount null 
 check (DefaultAccount in ( -1/* Да */
, 0/* Нет */ )) /* Основной счет для расчетов */
;
alter  table VRCAccounts add 
Code1C
 VARCHAR (40) null /* Код1С */
;


/*Точки доставки*/
drop table VRCTorg/*Точки доставки*/ 
;
create table VRCTorg/*Точки доставки*/ (
InstanceID CHAR(38) ,
VRCTorgid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRCTorg add 
Address null /* Адрес */
;
alter  table VRCTorg add 
name
 VARCHAR (255) null /* Название */
;
alter  table VRCTorg add 
Town null /* Город */
;


/*Доп. информация*/
drop table VRCAditional/*Доп. информация*/ 
;
create table VRCAditional/*Доп. информация*/ (
InstanceID CHAR(38) ,
VRCAditionalid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRCAditional add 
KPP
 VARCHAR (9) null /* КПП */
;
alter  table VRCAditional add 
Country null /* Страна */
;
alter  table VRCAditional add 
town null /* Город */
;
alter  table VRCAditional add 
district
 VARCHAR (255) null /* Район */
;
alter  table VRCAditional add 
uraddr null /* Юридический адрес */
;
alter  table VRCAditional add 
urphone
 VARCHAR (20) null /* Телефон по юр. адресу */
;
alter  table VRCAditional add 
regdate
 DATETIME null /* Дата регистрации */
;
alter  table VRCAditional add 
regby null /* Кем зарегистрирован */
;
alter  table VRCAditional add 
Stream null /* Направление деяельности */
;
alter  table VRCAditional add 
WEBSite varchar(255) null /* WEB узел */
;
alter  table VRCAditional add 
creditlimit null /* Лимит кредита */
;
alter  table VRCAditional add 
maxcreditlen
 integer null /* Длительность кредита */
;
alter  table VRCAditional add 
townphonecode
 VARCHAR (10) null /* Телефонный код  */
;
alter  table VRCAditional add 
POSTINDEX
 VARCHAR (20) null /* Почтовый индекс */
;
alter  table VRCAditional add 
phone2
 VARCHAR (20) null /* Телефон 2 */
;
alter  table VRCAditional add 
OKONH
 VARCHAR (20) null /* ОКОНХ */
;
alter  table VRCAditional add 
OKPO
 VARCHAR (20) null /* ОКПО */
;
alter  table VRCAditional add 
regsved
 VARCHAR (30) null /* Номер свидетельства орегистрации */
;
alter  table VRCAditional add 
Concurent null 
 check (Concurent in ( -1/* Да */
, 0/* Нет */ )) /* Конкурент */
;
alter  table VRCAditional add 
eMail varchar(255) null /* Электронная почта */
;
alter  table VRCAditional add 
mobTelephone
 VARCHAR (20) null /* Мобильный телефон */
;
alter  table VRCAditional add 
prnActWork null 
 check (prnActWork in ( -1/* Да */
, 0/* Нет */ )) /* Печать акта выполненных работ */
;


/*Тарифы клиента*/
drop table VRCTarif/*Тарифы клиента по филиалам*/ 
;
create table VRCTarif/*Тарифы клиента по филиалам*/ (
InstanceID CHAR(38) ,
VRCTarifid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRCTarif add 
TheDept null /* Филиал */
;
alter  table VRCTarif add 
TheTarifType null /* Текущий тариф */
;


/*Описание*/
drop table VRCCommonInfo/*Общая информация*/ 
;
create table VRCCommonInfo/*Общая информация*/ (
InstanceID CHAR(38) ,
VRCCommonInfoid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRCCommonInfo add 
IsPhizical null 
 check (IsPhizical in ( -1/* Да */
, 0/* Нет */ )) /* Физическое лицо */
;
alter  table VRCCommonInfo add 
Name
 VARCHAR (255) null /* Название */
;
alter  table VRCCommonInfo add 
fullname null /* Полное наименование */
;
alter  table VRCCommonInfo add 
Address
 VARCHAR (255) null /* Почтовый адрес */
;
alter  table VRCCommonInfo add 
fax
 VARCHAR (20) null /* Факс */
;
alter  table VRCCommonInfo add 
Phone
 VARCHAR (25) null /* Телефон */
;
alter  table VRCCommonInfo add 
the_Comment null /* Примечание */
;
alter  table VRCCommonInfo add 
INN
 VARCHAR (12) null /* ИНН */
;
alter  table VRCCommonInfo add 
KPP
 VARCHAR (9) null /* КПП */
;
alter  table VRCCommonInfo add 
Curator null /* Ответственный */
;
alter  table VRCCommonInfo add 
Transporter null 
 check (Transporter in ( -1/* Да */
, 0/* Нет */ )) /* Поставщик тр. услуг */
;
alter  table VRCCommonInfo add 
PassportInfo null /* Паспортные данные */
;
alter  table VRCCommonInfo add 
Code1C
 VARCHAR (40) null /* Код1С */
;
alter  table VRCCommonInfo add 
MarkToDelete null 
 check (MarkToDelete in ( -1/* Да */
, 0/* Нет */ )) /* Помечен на даление */
;


/*Пользователи*/
drop table ROLES_USER/*Пользователи*/ 
;
create table ROLES_USER/*Пользователи*/ (
InstanceID CHAR(38) ,
ROLES_USERid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ROLES_USER add 
TheUser null /* Пользователь */
;


/*Отображение на группы защиты*/
drop table ROLES_MAP/*Отображение на группы защиты*/ 
;
create table ROLES_MAP/*Отображение на группы защиты*/ (
InstanceID CHAR(38) ,
ROLES_MAPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ROLES_MAP add 
TheGroup null /* Группа */
;


/*Доступные документы*/
drop table ROLES_DOC/**/ 
;
create table ROLES_DOC/**/ (
InstanceID CHAR(38) ,
ROLES_DOCid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ROLES_DOC add 
The_Document null /* Тип документа */
;
alter  table ROLES_DOC add 
The_Denied
 integer null 
 check (The_Denied in ( 1/* Да */
, 0/* Нет */ )) /* Запрещен */
;
alter  table ROLES_DOC add 
AllowDeleteDoc null 
 check (AllowDeleteDoc in ( -1/* Да */
, 0/* Нет */ )) /* Разрешено удаление */
;


/*Доступные состояния*/
drop table ROLES_DOC_STATE/**/ 
;
create table ROLES_DOC_STATE/**/ (
ParentStructRowID CHAR(38) not null,
ROLES_DOC_STATEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ROLES_DOC_STATE add 
The_State null /* Состояние */
;
alter  table ROLES_DOC_STATE add 
The_Mode null /* Режим */
;
alter  table ROLES_DOC_STATE add 
AllowDelete null 
 check (AllowDelete in ( -1/* Да */
, 0/* Нет */ )) /* Можно удалять */
;
alter  table ROLES_DOC_STATE add 
StateChangeDisabled null 
 check (StateChangeDisabled in ( -1/* Да */
, 0/* Нет */ )) /* Запрещена смена состояния */
;


/*Определение роли*/
drop table ROLES_DEF/*Определение роли*/ 
;
create table ROLES_DEF/*Определение роли*/ (
InstanceID CHAR(38) ,
ROLES_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ROLES_DEF add 
name
 VARCHAR (255) null /* Название */
;
alter  table ROLES_DEF add 
TheComment null /* Описание */
;
alter  table ROLES_DEF add 
RightsSet_Denied null 
 check (RightsSet_Denied in ( -1/* Да */
, 0/* Нет */ )) /* Настройка прав запрещена */
;
alter  table ROLES_DEF add 
FormCFG_Denied null 
 check (FormCFG_Denied in ( -1/* Да */
, 0/* Нет */ )) /* Настройки форм запрещены */
;
alter  table ROLES_DEF add 
ListCFG_Denied null 
 check (ListCFG_Denied in ( -1/* Да */
, 0/* Нет */ )) /* Настройка журналов запрещена */
;
alter  table ROLES_DEF add 
FileExch_Denied null 
 check (FileExch_Denied in ( -1/* Да */
, 0/* Нет */ )) /* Файловый обмен запрещен */
;


/*Отчёты*/
drop table ROLES_REPORTS/**/ 
;
create table ROLES_REPORTS/**/ (
InstanceID CHAR(38) ,
ROLES_REPORTSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ROLES_REPORTS add 
The_Report null /* Отчёт */
;


/*Доступные приложения*/
drop table ROLES_WP/*Доступные приложения*/ 
;
create table ROLES_WP/*Доступные приложения*/ (
InstanceID CHAR(38) ,
ROLES_WPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ROLES_WP add 
WP null /* Приложение */
;


/*Допустимые действия*/
drop table ROLES_ACT/*Допустимые действия*/ 
;
create table ROLES_ACT/*Допустимые действия*/ (
ParentStructRowID CHAR(38) not null,
ROLES_ACTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
;
alter  table ROLES_ACT add 
Accesible
 integer null 
 check (Accesible in ( 1/* Да */
, 0/* Нет */ )) /* Доступность */
;
alter  table ROLES_ACT add 
EntryPoints null /* Доступные действия */
;


/*Сообщения от сервера*/
drop table RptSrvMsg/*Сообщения от сервера*/ 
;
create table RptSrvMsg/*Сообщения от сервера*/ (
InstanceID CHAR(38) ,
RptSrvMsgid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table RptSrvMsg add 
Msgdate
 DATETIME null /* Дата сообщения */
;
alter  table RptSrvMsg add 
Info null /* Информация */
;


/*Заявка*/
drop table RptQuery/*Заявка*/ 
;
create table RptQuery/*Заявка*/ (
InstanceID CHAR(38) ,
RptQueryid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table RptQuery add 
ReportType null /* Тип отчета */
;
alter  table RptQuery add 
QueryUser null /* Автор заявки */
;
alter  table RptQuery add 
QryDate
 DATETIME null /* Дата заявки */
;
alter  table RptQuery add 
AcceptDate
 DATETIME null /* Дата приема заявки сервером */
;
alter  table RptQuery add 
FinDate
 DATETIME null /* Момент завершения обработки */
;
alter  table RptQuery add 
ResultID
 uniqueidentifier null /* Идентификатор результата */
;


/*Параметры отчета*/
drop table RptQryParam/*Параметры отчета*/ 
;
create table RptQryParam/*Параметры отчета*/ (
InstanceID CHAR(38) ,
RptQryParamid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table RptQryParam add 
Name
 VARCHAR (255) null /* Название */
;
alter  table RptQryParam add 
TheValue null /* Значение */
;


/*Описание приказа*/
drop table PEKORD_DEF/*Описание приказа*/ 
;
create table PEKORD_DEF/*Описание приказа*/ (
InstanceID CHAR(38) ,
PEKORD_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKORD_DEF add 
docnumber
 integer null /* Номер приказа */
;
alter  table PEKORD_DEF add 
author null /* Автор */
;
alter  table PEKORD_DEF add 
docname
 VARCHAR (80) null /* Название */
;
alter  table PEKORD_DEF add 
regdate
 DATETIME null /* Дата регистрации */
;
alter  table PEKORD_DEF add 
comments null /* Содержание */
;
alter  table PEKORD_DEF add 
TarifStartDate
 DATETIME null /* Дата начала действия тарифа */
;


/*Таблица тарифов*/
drop table PEKORD_DATA/*Таблица тарифов*/ 
;
create table PEKORD_DATA/*Таблица тарифов*/ (
InstanceID CHAR(38) ,
PEKORD_DATAid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKORD_DATA add 
Cient null /* Клиент */
;
alter  table PEKORD_DATA add 
NewTarifType null /* Тип тарифа */
;
alter  table PEKORD_DATA add 
TheDept null /* Филиал */
;


/*Арм*/
drop table WorkPlace/*Арм*/ 
;
create table WorkPlace/*Арм*/ (
InstanceID CHAR(38) ,
WorkPlaceid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WorkPlace add 
Name
 VARCHAR (255) null /* Название */
;
alter  table WorkPlace add 
Caption
 VARCHAR (255) null /* Заголовок */
;
alter  table WorkPlace add 
TheVersion
 VARCHAR (30) null /* Версия */
;
alter  table WorkPlace add 
ThePlatform null 
 check (ThePlatform in ( 2/* JAVA */
, 3/* OTHER */
, 1/* DOTNET */
, 0/* VB6 */ )) /* Платформа реализации */
;
alter  table WorkPlace add 
TheComment null /* Примечание */
;


/*Меню*/
drop table EntryPoints/*Меню*/ 
;
create table EntryPoints/*Меню*/ (
InstanceID CHAR(38) ,
EntryPointsid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
;
alter  table EntryPoints add 
sequence
 integer null /* Последовательность */
;
alter  table EntryPoints add 
Name
 VARCHAR (38) null /* Название */
;
alter  table EntryPoints add 
Caption
 VARCHAR (255) null /* Заголовок */
;
alter  table EntryPoints add 
AsToolbarItem null 
 check (AsToolbarItem in ( -1/* Да */
, 0/* Нет */ )) /* Включить в тулбар */
;
alter  table EntryPoints add 
ActionType null 
 check (ActionType in ( 5/* Открыть отчет */
, 0/* Ничего не делать */
, 2/* Выполнить метод */
, 1/* Открыть документ */
, 4/* Запустить АРМ */
, 3/* Открыть журнал */ )) /* Вариант действия */
;
alter  table EntryPoints add 
TheFilter null /* Фильтр */
;
alter  table EntryPoints add 
Journal null /* Журнал */
;
alter  table EntryPoints add 
Report null /* Отчет */
;
alter  table EntryPoints add 
Document null /* Документ */
;
alter  table EntryPoints add 
Method null /* Метод */
;
alter  table EntryPoints add 
IconFile
 VARCHAR (2000) null /* Файл картинки */
;
alter  table EntryPoints add 
TheExtention null /* Расширение */
;
alter  table EntryPoints add 
ARM null /* АРМ */
;
alter  table EntryPoints add 
TheComment null /* Примечание */
;
alter  table EntryPoints add 
ObjectType null /* Тип документа */
;
alter  table EntryPoints add 
JournalFixedQuery null /* Ограничения к журналу */
;


/*Привязка фильтра*/
drop table EPFilterLink/*Привязка фильтра к журналу*/ 
;
create table EPFilterLink/*Привязка фильтра к журналу*/ (
ParentStructRowID CHAR(38) not null,
EPFilterLinkid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table EPFilterLink add 
RowSource
 VARCHAR (255) null /* Источник */
;
alter  table EPFilterLink add 
TheExpression null /* Выражение */
;
alter  table EPFilterLink add 
FilterField
 VARCHAR (255) null /* Поле фильтра */
;


/*Список типов*/
drop table ARMTypes/*Типы документов, которые подключаются в MDI режиме*/ 
;
create table ARMTypes/*Типы документов, которые подключаются в MDI режиме*/ (
InstanceID CHAR(38) ,
ARMTypesid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ARMTypes add 
TheDocumentType null /* Тип документа */
;


/*Поведение журналов*/
drop table ARMJournal/*Описание действий журанлов*/ 
;
create table ARMJournal/*Описание действий журанлов*/ (
InstanceID CHAR(38) ,
ARMJournalid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ARMJournal add 
TheJournal null /* Журнал */
;


/*Добавление*/
drop table ARMJRNLADD/*Варианты обработки добавления*/ 
;
create table ARMJRNLADD/*Варианты обработки добавления*/ (
ParentStructRowID CHAR(38) not null,
ARMJRNLADDid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ARMJRNLADD add 
Name
 VARCHAR (255) null /* Название */
;
alter  table ARMJRNLADD add 
TheExtention null /* Расширение */
;


/*Отчеты*/
drop table ARMJRNLREP/*Отчеты из журнала*/ 
;
create table ARMJRNLREP/*Отчеты из журнала*/ (
ParentStructRowID CHAR(38) not null,
ARMJRNLREPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ARMJRNLREP add 
repname
 VARCHAR (255) null /* Название отчета */
;
alter  table ARMJRNLREP add 
TheReport null /* Отчет */
;


/*Действия*/
drop table ARMJRNLRUN/*Дополнительные действия в журнале*/ 
;
create table ARMJRNLRUN/*Дополнительные действия в журнале*/ (
ParentStructRowID CHAR(38) not null,
ARMJRNLRUNid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ARMJRNLRUN add 
Name
 VARCHAR (255) null /* Название */
;
alter  table ARMJRNLRUN add 
TheExtention null /* Расширение */
;


/*Зоны номеров ППО*/
drop table PEKD_NZONE/*Зоны номеров ППО*/ 
;
create table PEKD_NZONE/*Зоны номеров ППО*/ (
InstanceID CHAR(38) ,
PEKD_NZONEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_NZONE add 
Dept null /* Филиал */
;
alter  table PEKD_NZONE add 
TheYear
 integer null /* Год */
;
alter  table PEKD_NZONE add 
TheMonth null 
 check (TheMonth in ( 11/* Ноябрь */
, 2/* Февраль */
, 12/* Декабрь */
, 3/* Март */
, 1/* Январь */
, 9/* Сентябрь */
, 6/* Июнь */
, 10/* Октябрь */
, 5/* Май */
, 8/* Август */
, 7/* Июль */
, 4/* Апрель */ )) /* Месяц */
;
alter  table PEKD_NZONE add 
FromPPOIDX
 integer null /* Начиная с */
;
alter  table PEKD_NZONE add 
ToPPOIdx
 integer null /* По */
;
alter  table PEKD_NZONE add 
POIDX
 VARCHAR (6) null /* Индекс отделения */
;


/*Занятые номера*/
drop table PEKD_USEDNUM/*Занятые номера*/ 
;
create table PEKD_USEDNUM/*Занятые номера*/ (
InstanceID CHAR(38) ,
PEKD_USEDNUMid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_USEDNUM add 
UsedNumber
 integer null /* Номер */
;


/*Колонки журнала*/
drop table JournalColumn/*Колонки журнала*/ 
;
create table JournalColumn/*Колонки журнала*/ (
InstanceID CHAR(38) ,
JournalColumnid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table JournalColumn add 
sequence
 integer null /* Последовательность */
;
alter  table JournalColumn add 
name
 VARCHAR (255) null /* Название */
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
, 0/* Left Top */ )) /* Выравнивание */
;
alter  table JournalColumn add 
ColSort
 INTEGER null 
 check (ColSort in ( 0/* As String */
, 1/* As Numeric */
, 2/* As Date */ )) /* Сортировка колонки */
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
, 0/* none */ )) /* Аггрегация при группировке */
;


/*Состав колонки*/
drop table JColumnSource/*Состав колонки*/ 
;
create table JColumnSource/*Состав колонки*/ (
ParentStructRowID CHAR(38) not null,
JColumnSourceid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table JColumnSource add 
SrcPartView null /* Представление */
;
alter  table JColumnSource add 
ViewField
 VARCHAR (255) null /* Поле представления */
;


/*Журнал*/
drop table Journal/*Журнал*/ 
;
create table Journal/*Журнал*/ (
InstanceID CHAR(38) ,
Journalid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table Journal add 
Name
 VARCHAR (255) null /* Название */
;
alter  table Journal add 
the_Alias
 VARCHAR (32) null /* Псевдоним */
;
alter  table Journal add 
TheComment null /* Описание */
;


/*Источники журнала*/
drop table JournalSrc/*Источники журнала*/ 
;
create table JournalSrc/*Источники журнала*/ (
InstanceID CHAR(38) ,
JournalSrcid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table JournalSrc add 
PartView
 uniqueidentifier null /* Представление */
;
alter  table JournalSrc add 
OnRun
 INTEGER null 
 check (OnRun in ( 2/* Открыть документ */
, 1/* Открыть строку */
, 0/* Ничего не делать */ )) /* При открытии */
;
alter  table JournalSrc add 
OpenMode
 VARCHAR (1) null /* Режим открытия */
;
alter  table JournalSrc add 
ViewAlias
 VARCHAR (255) null /* Псевдоним представления */
;


/*Ожидаемые грузы*/
drop table pekmsg_path/*Маршрут доставки*/ 
;
create table pekmsg_path/*Маршрут доставки*/ (
InstanceID CHAR(38) ,
pekmsg_pathid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table pekmsg_path add 
SendDate
 DATETIME null /* Дата отправки */
;
alter  table pekmsg_path add 
RcvWaitDate
 DATETIME null /* Ориентировочная дата получения */
;
alter  table pekmsg_path add 
trainNo null /* Поезд */
;
alter  table pekmsg_path add 
vagNo
 VARCHAR (8) null /* Вагон № */
;
alter  table pekmsg_path add 
PathFilial null /* Филиал */
;
alter  table pekmsg_path add 
TransSupplier null /* Поставщик */
;
alter  table pekmsg_path add 
TheDirection null /* Направление */
;
alter  table pekmsg_path add 
PPONum
 integer null /* Кол-во ПО */
;
alter  table pekmsg_path add 
DestStation null /* Станция назначения */
;
alter  table pekmsg_path add 
PPODescription null /* Характер груза */
;
alter  table pekmsg_path add 
Receiver null /* Получатель */
;
alter  table pekmsg_path add 
PPOWeight null /* Вес ПО */
;
alter  table pekmsg_path add 
WeightEDIZM null /* Ед. изм. веса */
;
alter  table pekmsg_path add 
PPOVol null /* Объем ПО */
;
alter  table pekmsg_path add 
ValueEDIZM null /* Ед.изм. объема */
;
alter  table pekmsg_path add 
PassFIO
 VARCHAR (255) null /* ФИО Кладовщика */
;
alter  table pekmsg_path add 
PassDate
 DATETIME null /* Дата передачи груза в вагон */
;
alter  table pekmsg_path add 
RcvFIO
 VARCHAR (255) null /* ФИО ВПН */
;
alter  table pekmsg_path add 
RcvDate
 DATETIME null /* Дата получения груза в ПО */
;
alter  table pekmsg_path add 
InforRcvFIO
 VARCHAR (255) null /* Кому передана информация */
;
alter  table pekmsg_path add 
InfoDate
 DATETIME null /* Дата передачи информации */
;
alter  table pekmsg_path add 
InfoSendType null /* Способ передачи информации */
;


/*Список рассылки*/
drop table WEBS_MAILLIST/**/ 
;
create table WEBS_MAILLIST/**/ (
InstanceID CHAR(38) ,
WEBS_MAILLISTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBS_MAILLIST add 
Email
 VARCHAR (512) null /* Адрес */
;


/*Рекламируемые маршруты*/
drop table WEBS_RECLAME/**/ 
;
create table WEBS_RECLAME/**/ (
InstanceID CHAR(38) ,
WEBS_RECLAMEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBS_RECLAME add 
queque
 integer null /* Номер п/п */
;
alter  table WEBS_RECLAME add 
Path null /* Маршрут */
;


/*Страница сайта*/
drop table WEBS_PAGEDEF/**/ 
;
create table WEBS_PAGEDEF/**/ (
InstanceID CHAR(38) ,
WEBS_PAGEDEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
;
alter  table WEBS_PAGEDEF add 
QueueNumber
 integer null /* Номер п/п */
;
alter  table WEBS_PAGEDEF add 
Name
 VARCHAR (256) null /* Название */
;
alter  table WEBS_PAGEDEF add 
Url
 VARCHAR (1024) null /* Урл */
;
alter  table WEBS_PAGEDEF add 
Title
 VARCHAR (256) null /* Титул */
;
alter  table WEBS_PAGEDEF add 
ShortName
 VARCHAR (256) null /* Короткое название */
;
alter  table WEBS_PAGEDEF add 
ObjectName null /* Имя объекта */
;
alter  table WEBS_PAGEDEF add 
ObjectCode null /* Имя раздела */
;
alter  table WEBS_PAGEDEF add 
AllowHeader null 
 check (AllowHeader in ( -1/* Да */
, 0/* Нет */ )) /* Выводить заголовок */
;
alter  table WEBS_PAGEDEF add 
the_Mode
 VARCHAR (256) null /* Режим работы */
;
alter  table WEBS_PAGEDEF add 
PageType
 INTEGER null 
 check (PageType in ( 0/* Не существенно */
, 1/* Объект */
, 3/* Раздел */
, 2/* Таблица */ )) /* Тип */
;
alter  table WEBS_PAGEDEF add 
ControlPath
 VARCHAR (256) null /* Контрол */
;
alter  table WEBS_PAGEDEF add 
SelectIDParameterName
 VARCHAR (256) null /* Имя параметра для передачи в форму редактирования */
;
alter  table WEBS_PAGEDEF add 
PageContent null /* Cодержимое */
;
alter  table WEBS_PAGEDEF add 
AllowAddPage null 
 check (AllowAddPage in ( -1/* Да */
, 0/* Нет */ )) /* Разрешено добавлять страницы */
;
alter  table WEBS_PAGEDEF add 
the_IsLocked null 
 check (the_IsLocked in ( -1/* Да */
, 0/* Нет */ )) /* Заблокирована */
;
alter  table WEBS_PAGEDEF add 
IsOnMap null 
 check (IsOnMap in ( -1/* Да */
, 0/* Нет */ )) /* Отображать на карте сайта */
;
alter  table WEBS_PAGEDEF add 
IsShowHisory null 
 check (IsShowHisory in ( -1/* Да */
, 0/* Нет */ )) /* Отобразить историю */
;
alter  table WEBS_PAGEDEF add 
RedirectToFirstChild null 
 check (RedirectToFirstChild in ( -1/* Да */
, 0/* Нет */ )) /* Перейти на первую дочернюю страницу */
;


/*Картинки*/
drop table WEBS_PICS/**/ 
;
create table WEBS_PICS/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_PICSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBS_PICS add 
Name
 VARCHAR (512) null /* Название */
;
alter  table WEBS_PICS add 
FileContent null /* Файл */
;
alter  table WEBS_PICS add 
 FileContent_EXT char(4) null
;


/*Отношения с меню*/
drop table WEBS_PAGEMENU/**/ 
;
create table WEBS_PAGEMENU/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_PAGEMENUid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBS_PAGEMENU add 
AllowInMenu null 
 check (AllowInMenu in ( -1/* Да */
, 0/* Нет */ )) /* В меню */
;
alter  table WEBS_PAGEMENU add 
AllowInBottomMenu null 
 check (AllowInBottomMenu in ( -1/* Да */
, 0/* Нет */ )) /* В нижнем меню */
;
alter  table WEBS_PAGEMENU add 
UsePartRowsInMenu null 
 check (UsePartRowsInMenu in ( -1/* Да */
, 0/* Нет */ )) /* Развернуть строки в меню */
;
alter  table WEBS_PAGEMENU add 
UsePartRowsEditForm null /* Страница для редактирования */
;
alter  table WEBS_PAGEMENU add 
UsePartRowsTextField
 VARCHAR (256) null /* Поле текста ссылки */
;
alter  table WEBS_PAGEMENU add 
UsePartRowsRowIDField
 VARCHAR (256) null /* Поле ID */
;
alter  table WEBS_PAGEMENU add 
UsePartRowsSort
 VARCHAR (256) null /* Сортировка строк части */
;


/*Содержимое*/
drop table WEBS_PAGECONTENT/**/ 
;
create table WEBS_PAGECONTENT/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_PAGECONTENTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBS_PAGECONTENT add 
Content
 VARCHAR (8000) null /* Содержимое */
;


/*Параметры*/
drop table WEBS_PAGEPARS/**/ 
;
create table WEBS_PAGEPARS/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_PAGEPARSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBS_PAGEPARS add 
Name
 VARCHAR (256) null /* Имя */
;
alter  table WEBS_PAGEPARS add 
TheValue
 VARCHAR (256) null /* Значение */
;


/*Компоненты*/
drop table WEBS_PAGECOMP/**/ 
;
create table WEBS_PAGECOMP/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_PAGECOMPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBS_PAGECOMP add 
Name
 VARCHAR (256) null /* Название */
;
alter  table WEBS_PAGECOMP add 
Title
 VARCHAR (256) null /* Титул */
;
alter  table WEBS_PAGECOMP add 
Selected null 
 check (Selected in ( -1/* Да */
, 0/* Нет */ )) /* Активен */
;
alter  table WEBS_PAGECOMP add 
IsCollection null 
 check (IsCollection in ( -1/* Да */
, 0/* Нет */ )) /* Коллекция */
;
alter  table WEBS_PAGECOMP add 
the_PartName null /* Раздел */
;
alter  table WEBS_PAGECOMP add 
IDField
 VARCHAR (256) null /* Поле ID */
;
alter  table WEBS_PAGECOMP add 
UserIdField
 VARCHAR (256) null /* поле UserID */
;
alter  table WEBS_PAGECOMP add 
Visible null 
 check (Visible in ( -1/* Да */
, 0/* Нет */ )) /* Видимость */
;


/*Табличная часть*/
drop table TablePart/**/ 
;
create table TablePart/**/ (
ParentStructRowID CHAR(38) not null,
TablePartid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table TablePart add 
FilterUserIDFieldName_
 VARCHAR (256) null /* Имя поля для фильтра UserID */
;
alter  table TablePart add 
Filter_
 VARCHAR (256) null /* Фильтр */
;
alter  table TablePart add 
SelectIDParameterName
 VARCHAR (256) null /* Параметр для передачи ID */
;
alter  table TablePart add 
EditForm null /* Страница для редактирования */
;
alter  table TablePart add 
AllowDelete null 
 check (AllowDelete in ( -1/* Да */
, 0/* Нет */ )) /* Разрешено удаление */
;
alter  table TablePart add 
AllowAddNew null 
 check (AllowAddNew in ( -1/* Да */
, 0/* Нет */ )) /* Разрешено добавление */
;
alter  table TablePart add 
AddStatusColumn_ null 
 check (AddStatusColumn_ in ( -1/* Да */
, 0/* Нет */ )) /* Есть Status колонка */
;
alter  table TablePart add 
AllowEditRowStatusNameValue
 VARCHAR (256) null /* Значение Status для редактирования */
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
 check (AllowEditUserClientDef in ( -1/* Да */
, 0/* Нет */ )) /* AllowEditUserClientDef */
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


/*Замены*/
drop table ReplaceValues/**/ 
;
create table ReplaceValues/**/ (
ParentStructRowID CHAR(38) not null,
ReplaceValuesid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ReplaceValues add 
Name
 VARCHAR (256) null /* Поле */
;
alter  table ReplaceValues add 
SourceName
 VARCHAR (256) null /* Поле источник */
;


/*Запрещённые для редактирования поля*/
drop table DenyEdit/**/ 
;
create table DenyEdit/**/ (
ParentStructRowID CHAR(38) not null,
DenyEditid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table DenyEdit add 
Name
 VARCHAR (256) null /* Значение */
;


/*Невидимые поля*/
drop table DenyVisible/**/ 
;
create table DenyVisible/**/ (
ParentStructRowID CHAR(38) not null,
DenyVisibleid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table DenyVisible add 
Name
 VARCHAR (256) null /* Имя поля */
;


/*Значения поля, разрешающего редактирование*/
drop table AllowEditFieldValues/*Значения поля, разрешающего редактирование*/ 
;
create table AllowEditFieldValues/*Значения поля, разрешающего редактирование*/ (
ParentStructRowID CHAR(38) not null,
AllowEditFieldValuesid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table AllowEditFieldValues add 
Name
 VARCHAR (256) null /* Значение */
;


/*Комбобоксы*/
drop table ComboFields/**/ 
;
create table ComboFields/**/ (
ParentStructRowID CHAR(38) not null,
ComboFieldsid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table ComboFields add 
Name
 VARCHAR (256) null /* Поле */
;
alter  table ComboFields add 
SourceName
 VARCHAR (256) null /* Поле источник */
;


/*Анкеты*/
drop table WEBS_ANKETA/**/ 
;
create table WEBS_ANKETA/**/ (
InstanceID CHAR(38) ,
WEBS_ANKETAid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBS_ANKETA add 
Name
 VARCHAR (256) null /* Название */
;
alter  table WEBS_ANKETA add 
the_Description
 VARCHAR (4000) null /* Описание */
;
alter  table WEBS_ANKETA add 
AnketaDef null /* Анкета */
;
alter  table WEBS_ANKETA add 
Message
 VARCHAR (156) null /* Сообщение */
;


/*Вопросы*/
drop table WEBS_QUESTIONS/**/ 
;
create table WEBS_QUESTIONS/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_QUESTIONSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBS_QUESTIONS add 
the_Number
 integer null /* Номер  */
;
alter  table WEBS_QUESTIONS add 
QuestionType
 uniqueidentifier null /* Тип */
;
alter  table WEBS_QUESTIONS add 
Name
 VARCHAR (1024) null /* Имя */
;
alter  table WEBS_QUESTIONS add 
Required null 
 check (Required in ( -1/* Да */
, 0/* Нет */ )) /* Обязательность */
;
alter  table WEBS_QUESTIONS add 
Style
 VARCHAR (256) null /* Стиль */
;


/*Ответы*/
drop table WEBS_ANSWERS/**/ 
;
create table WEBS_ANSWERS/**/ (
ParentStructRowID CHAR(38) not null,
WEBS_ANSWERSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBS_ANSWERS add 
the_Number
 integer null /* Номер  */
;
alter  table WEBS_ANSWERS add 
Name
 VARCHAR (1024) null /* Значение  */
;
alter  table WEBS_ANSWERS add 
the_Description
 VARCHAR (4000) null /* Описание  */
;


/*Документы для скачивания*/
drop table WEBS_DDOC/*Список документов которые можно скачать*/ 
;
create table WEBS_DDOC/*Список документов которые можно скачать*/ (
InstanceID CHAR(38) ,
WEBS_DDOCid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBS_DDOC add 
Name
 VARCHAR (512) null /* Название */
;
alter  table WEBS_DDOC add 
FileName
 VARCHAR (1024) null /* Имя файла */
;
alter  table WEBS_DDOC add 
FileContract null /* Файл */
;
alter  table WEBS_DDOC add 
 FileContract_EXT char(4) null
;
alter  table WEBS_DDOC add 
Title
 VARCHAR (512) null /* Заголовок для ссылки */
;


/*Новости*/
drop table WEBS_NEWS/*Древовидный список новостей*/ 
;
create table WEBS_NEWS/*Древовидный список новостей*/ (
InstanceID CHAR(38) ,
WEBS_NEWSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
;
alter  table WEBS_NEWS add 
QueueNumber
 integer null /* Номер п/п */
;
alter  table WEBS_NEWS add 
Name
 VARCHAR (256) null /* Название */
;
alter  table WEBS_NEWS add 
Title
 VARCHAR (256) null /* Титул */
;
alter  table WEBS_NEWS add 
ShortName
 VARCHAR (256) null /* Короткое название */
;
alter  table WEBS_NEWS add 
the_Mode
 VARCHAR (256) null /* Режим работы */
;
alter  table WEBS_NEWS add 
PageContent null /* Cодержимое */
;
alter  table WEBS_NEWS add 
the_IsLocked null 
 check (the_IsLocked in ( -1/* Да */
, 0/* Нет */ )) /* Заблокирована */
;
alter  table WEBS_NEWS add 
IsShowHisory null 
 check (IsShowHisory in ( -1/* Да */
, 0/* Нет */ )) /* Отобразить историю */
;
alter  table WEBS_NEWS add 
NewsDate
 DATETIME null /* Дата */
;
alter  table WEBS_NEWS add 
NewsDescription null /* Описание */
;


/*Картинки*/
drop table NEWS_PICS/**/ 
;
create table NEWS_PICS/**/ (
ParentStructRowID CHAR(38) not null,
NEWS_PICSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table NEWS_PICS add 
Name
 VARCHAR (512) null /* Название */
;
alter  table NEWS_PICS add 
FileContent null /* Файл */
;
alter  table NEWS_PICS add 
 FileContent_EXT char(4) null
;


/*Смотри также*/
drop table VRCPSeeAlso/*Смотри также*/ 
;
create table VRCPSeeAlso/*Смотри также*/ (
InstanceID CHAR(38) ,
VRCPSeeAlsoid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRCPSeeAlso add 
Document null /* Документ */
;
alter  table VRCPSeeAlso add 
the_Comment null /* Примечание */
;


/*Факты*/
drop table VRCPSpecial/*Факты*/ 
;
create table VRCPSpecial/*Факты*/ (
InstanceID CHAR(38) ,
VRCPSpecialid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRCPSpecial add 
DateOF
 DATETIME null /* Дата */
;
alter  table VRCPSpecial add 
Info null /* Описание */
;
alter  table VRCPSpecial add 
theFile null /* Файл */
;
alter  table VRCPSpecial add 
 theFile_EXT char(4) null
;
alter  table VRCPSpecial add 
InfoSrc null /* Источник */
;


/*Подарки*/
drop table VRCPPresents/*Подарки*/ 
;
create table VRCPPresents/*Подарки*/ (
InstanceID CHAR(38) ,
VRCPPresentsid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRCPPresents add 
DateOF
 DATETIME null /* Дата */
;
alter  table VRCPPresents add 
Gift
 VARCHAR (255) null /* Подарок */
;
alter  table VRCPPresents add 
PresentCost null /* Цена подарка */
;
alter  table VRCPPresents add 
reason null /* Повод */
;


/*Отчеты*/
drop table VRCPReports/*Отчеты*/ 
;
create table VRCPReports/*Отчеты*/ (
InstanceID CHAR(38) ,
VRCPReportsid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRCPReports add 
Report null /* Отчет */
;


/*Памятные даты*/
drop table VRCPDates/*Памятные даты*/ 
;
create table VRCPDates/*Памятные даты*/ (
InstanceID CHAR(38) ,
VRCPDatesid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRCPDates add 
DateOf
 DATETIME null /* Дата */
;
alter  table VRCPDates add 
DateEvent
 VARCHAR (255) null /* Событие */
;


/*Родственники*/
drop table VRCPNeigborhood/*Родственники*/ 
;
create table VRCPNeigborhood/*Родственники*/ (
InstanceID CHAR(38) ,
VRCPNeigborhoodid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRCPNeigborhood add 
the_Level
 VARCHAR (255) null /* Степень родства */
;
alter  table VRCPNeigborhood add 
person null /* Описание */
;


/*Увлечения*/
drop table VRCPInterest/*Увлечения*/ 
;
create table VRCPInterest/*Увлечения*/ (
InstanceID CHAR(38) ,
VRCPInterestid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRCPInterest add 
Info null /* Описание */
;


/*Общая информация*/
drop table VRCPCommon/*Общая информация*/ 
;
create table VRCPCommon/*Общая информация*/ (
InstanceID CHAR(38) ,
VRCPCommonid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table VRCPCommon add 
Family
 VARCHAR (255) null /* Фамилия */
;
alter  table VRCPCommon add 
Name
 VARCHAR (255) null /* Имя */
;
alter  table VRCPCommon add 
SurName
 VARCHAR (255) null /* Отчество */
;
alter  table VRCPCommon add 
Privelegie null /* Звание */
;
alter  table VRCPCommon add 
phone
 VARCHAR (30) null /* Телефон */
;
alter  table VRCPCommon add 
email varchar(255) null /* e-mail */
;
alter  table VRCPCommon add 
fax
 VARCHAR (30) null /* Факс */
;
alter  table VRCPCommon add 
Loyality null /* Лояльность */
;
alter  table VRCPCommon add 
the_Comment null /* Примечания */
;
alter  table VRCPCommon add 
Curator null /* Ответственный */
;
alter  table VRCPCommon add 
mobile
 VARCHAR (30) null /* Мобильный телефон */
;
alter  table VRCPCommon add 
PersonDeYuro null 
 check (PersonDeYuro in ( -1/* Да */
, 0/* Нет */ )) /* Официальный представитель */
;
alter  table VRCPCommon add 
ActionReason
 VARCHAR (255) null /* Действует на основании */
;
alter  table VRCPCommon add 
ActionStart
 DATETIME null /* Начало действия доверености */
;
alter  table VRCPCommon add 
ActionEnd
 DATETIME null /* Конец действия доверенности */
;
alter  table VRCPCommon add 
PassportInfo null /* Паспортные данные */
;
alter  table VRCPCommon add 
Address null /* Адрес */
;


/*Z-Отчет*/
drop table PEKZR_DATA/*Данные ежедневного Z отчета*/ 
;
create table PEKZR_DATA/*Данные ежедневного Z отчета*/ (
InstanceID CHAR(38) ,
PEKZR_DATAid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKZR_DATA add 
TheDept null /* Филиал */
;
alter  table PEKZR_DATA add 
TheDate
 DATETIME null /* Дата */
;
alter  table PEKZR_DATA add 
TheValue null /* Значение */
;


/*Карточки*/
drop table WEBCRD_NUM/*Карточки*/ 
;
create table WEBCRD_NUM/*Карточки*/ (
InstanceID CHAR(38) ,
WEBCRD_NUMid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WEBCRD_NUM add 
TheNumber
 VARCHAR (30) null /* Номер карточки */
;
alter  table WEBCRD_NUM add 
ActivationTime
 DATETIME null /* Когда активирована */
;
alter  table WEBCRD_NUM add 
ActivatedBy null /* Кем активирована */
;
alter  table WEBCRD_NUM add 
Activated null 
 check (Activated in ( -1/* Да */
, 0/* Нет */ )) /* Активирована */
;


/*Описание серии*/
drop table WBCRD_DEF/*Описание серии*/ 
;
create table WBCRD_DEF/*Описание серии*/ (
InstanceID CHAR(38) ,
WBCRD_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table WBCRD_DEF add 
TheDate
 DATETIME null /* Дата выпуска сериии */
;
alter  table WBCRD_DEF add 
ExpDate
 DATETIME null /* Конец действия серии */
;
alter  table WBCRD_DEF add 
CardSumm null /* Сумма на карточке */
;
alter  table WBCRD_DEF add 
TheCurrency null /* Валюта */
;


/*Описание*/
drop table PEKO_DEF/*Описание*/ 
;
create table PEKO_DEF/*Описание*/ (
InstanceID CHAR(38) ,
PEKO_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKO_DEF add 
ToClient null /* Поставщик */
;
alter  table PEKO_DEF add 
PLPNUM
 VARCHAR (20) null /* № документа */
;
alter  table PEKO_DEF add 
PLPDate
 DATETIME null /* Дата документа */
;
alter  table PEKO_DEF add 
PLPSumm null /* Сумма */
;
alter  table PEKO_DEF add 
TheDept null /* В счет филиала */
;
alter  table PEKO_DEF add 
TheComment null /* Назначеие платежа */
;
alter  table PEKO_DEF add 
Code1C
 VARCHAR (40) null /* Код1С */
;


/*Описание лимитов*/
drop table PEKL_DEF/*Описание лимитов*/ 
;
create table PEKL_DEF/*Описание лимитов*/ (
InstanceID CHAR(38) ,
PEKL_DEFid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKL_DEF add 
TheDep null /* Филиал */
;
alter  table PEKL_DEF add 
FromDate
 DATETIME null /* Начало действия */
;
alter  table PEKL_DEF add 
ToDate
 DATETIME null /* Окончание действия */
;


/*Стандартные лимиты*/
drop table PEKL_WDAY/*Стандартные лимиты*/ 
;
create table PEKL_WDAY/*Стандартные лимиты*/ (
InstanceID CHAR(38) ,
PEKL_WDAYid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKL_WDAY add 
Train null /* Поезд */
;
alter  table PEKL_WDAY add 
GOTYPE null /* Тип СГО */
;
alter  table PEKL_WDAY add 
TheValue null /* Объем */
;
alter  table PEKL_WDAY add 
TheValueEDIZM null /* Ед. изм. Объема */
;
alter  table PEKL_WDAY add 
WeightValue null /* Вес */
;
alter  table PEKL_WDAY add 
WeightEDIZM null /* Ед. изм. веса */
;
alter  table PEKL_WDAY add 
the_Description null /* Описание */
;


/*Надбавки*/
drop table PEKD_ADDS/*Варианты надбавок*/ 
;
create table PEKD_ADDS/*Варианты надбавок*/ (
InstanceID CHAR(38) ,
PEKD_ADDSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_ADDS add 
Name
 VARCHAR (255) null /* Название */
;
alter  table PEKD_ADDS add 
CalcType
 integer null 
 check (CalcType in ( 1/* Объем */
, 2/* Плотность */
, 3/* Прочее */
, 0/* Вес */ )) /* Тип расчета */
;


/*Тип поезда*/
drop table PEKD_TRAINTYPE/*Тип поезда*/ 
;
create table PEKD_TRAINTYPE/*Тип поезда*/ (
InstanceID CHAR(38) ,
PEKD_TRAINTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_TRAINTYPE add 
name
 VARCHAR (255) null /* Название */
;


/*Тип автотранспорта*/
drop table PEKD_AUTO/*Справочник типов автотранспорта*/ 
;
create table PEKD_AUTO/*Справочник типов автотранспорта*/ (
InstanceID CHAR(38) ,
PEKD_AUTOid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_AUTO add 
Name
 VARCHAR (255) null /* Название */
;
alter  table PEKD_AUTO add 
TheVolume null /* Грузоподъемность */
;
alter  table PEKD_AUTO add 
TheDimentions
 VARCHAR (80) null /* Габариты */
;


/*Типы СГО*/
drop table PEKD_GOTYPE/*Типы СГО*/ 
;
create table PEKD_GOTYPE/*Типы СГО*/ (
InstanceID CHAR(38) ,
PEKD_GOTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_GOTYPE add 
name
 VARCHAR (255) null /* Название */
;


/*Способ передачи информации*/
drop table PEKD_INFOSENDTYPE/*Способ передачи информации */ 
;
create table PEKD_INFOSENDTYPE/*Способ передачи информации */ (
InstanceID CHAR(38) ,
PEKD_INFOSENDTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_INFOSENDTYPE add 
Name
 VARCHAR (255) null /* Название */
;


/*Система отправки*/
drop table PEKD_TRTYPE/*Система отправки*/ 
;
create table PEKD_TRTYPE/*Система отправки*/ (
InstanceID CHAR(38) ,
PEKD_TRTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_TRTYPE add 
name
 VARCHAR (255) null /* Название */
;


/*Группы ДопУслуг*/
drop table PEKD_GRPDpUSL/*позволяет группировать ДопУслуги (PEKD_SRV)*/ 
;
create table PEKD_GRPDpUSL/*позволяет группировать ДопУслуги (PEKD_SRV)*/ (
InstanceID CHAR(38) ,
PEKD_GRPDpUSLid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_GRPDpUSL add 
name
 VARCHAR (255) null /* Название */
;


/*Характер отправления*/
drop table PEKD_POSTTYPE/*Характер отправления*/ 
;
create table PEKD_POSTTYPE/*Характер отправления*/ (
InstanceID CHAR(38) ,
PEKD_POSTTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_POSTTYPE add 
Name
 VARCHAR (255) null /* Название */
;


/*Группы тарифов*/
drop table PEKD_TRFGRP/*Группы тарифов*/ 
;
create table PEKD_TRFGRP/*Группы тарифов*/ (
InstanceID CHAR(38) ,
PEKD_TRFGRPid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
,ParentRowid CHAR(38) 
)
;
alter  table PEKD_TRFGRP add 
name
 VARCHAR (255) null /* Группа */
;


/*Типы тарифов*/
drop table PEKD_TRFTYPE/*Типы тарифов*/ 
;
create table PEKD_TRFTYPE/*Типы тарифов*/ (
ParentStructRowID CHAR(38) not null,
PEKD_TRFTYPEid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_TRFTYPE add 
name
 VARCHAR (255) null /* Название */
;


/*Филиал*/
drop table PEKD_DEPT/*Филиал*/ 
;
create table PEKD_DEPT/*Филиал*/ (
InstanceID CHAR(38) ,
PEKD_DEPTid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_DEPT add 
name
 VARCHAR (255) null /* Название */
;
alter  table PEKD_DEPT add 
Address null /* Адрес */
;
alter  table PEKD_DEPT add 
Supplier null /* Основной поставщик */
;
alter  table PEKD_DEPT add 
DocPrefix
 VARCHAR (3) null /* Префикс номеров документов */
;
alter  table PEKD_DEPT add 
PGDPName
 VARCHAR (255) null /* Название ПЖДП */
;
alter  table PEKD_DEPT add 
town null /* Город */
;
alter  table PEKD_DEPT add 
Code1C
 VARCHAR (40) null /* Код1С */
;


/*Контролируемые лимиты*/
drop table PEKD_DEPLIMITS/*Уровни неснижаемых остатков по постащикам*/ 
;
create table PEKD_DEPLIMITS/*Уровни неснижаемых остатков по постащикам*/ (
ParentStructRowID CHAR(38) not null,
PEKD_DEPLIMITSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_DEPLIMITS add 
Supplier null /* Поставщик */
;
alter  table PEKD_DEPLIMITS add 
LimitMark null /* Необходимый остаток */
;
alter  table PEKD_DEPLIMITS add 
DaysToCrash
 integer null /* Запас в днях */
;


/*Договора с поставщиками*/
drop table PEKD_DEPDOG/*Договора в рамках которого поставщик поставляет услуги*/ 
;
create table PEKD_DEPDOG/*Договора в рамках которого поставщик поставляет услуги*/ (
ParentStructRowID CHAR(38) not null,
PEKD_DEPDOGid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_DEPDOG add 
Supplier null /* Поставщик */
;
alter  table PEKD_DEPDOG add 
TheDogovor null /* Договор */
;


/*Направление перевозки*/
drop table PEKD_DIRECTION/*Направление перевозки*/ 
;
create table PEKD_DIRECTION/*Направление перевозки*/ (
InstanceID CHAR(38) ,
PEKD_DIRECTIONid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_DIRECTION add 
Town null /* Город */
;
alter  table PEKD_DIRECTION add 
Name
 VARCHAR (255) null /* Направление */
;
alter  table PEKD_DIRECTION add 
Dept null /* Филиал */
;
alter  table PEKD_DIRECTION add 
Srok
 VARCHAR (255) null /* Срок доставки */
;
alter  table PEKD_DIRECTION add 
the_Rule
 VARCHAR (255) null /* Отправка */
;
alter  table PEKD_DIRECTION add 
POSTINDEX
 VARCHAR (20) null /* Почтовый индекс */
;
alter  table PEKD_DIRECTION add 
TheTransport null /* Транспорт */
;
alter  table PEKD_DIRECTION add 
TheAgent null /* Агент */
;


/*Маршруты*/
drop table PEKD_TRAINS/*Маршруты*/ 
;
create table PEKD_TRAINS/*Маршруты*/ (
ParentStructRowID CHAR(38) not null,
PEKD_TRAINSid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_TRAINS add 
TrainNo
 VARCHAR (50) null /* № поезда */
;
alter  table PEKD_TRAINS add 
FromStation null /* Из */
;
alter  table PEKD_TRAINS add 
ToSTATION null /* В */
;
alter  table PEKD_TRAINS add 
the_Rule
 VARCHAR (255) null /* Отправка */
;
alter  table PEKD_TRAINS add 
TheDesciption
 VARCHAR (255) null /* Описание */
;
alter  table PEKD_TRAINS add 
TheComment null /* Примечание */
;
alter  table PEKD_TRAINS add 
TrainType null /* Тип поезда */
;


/*Точки доставки*/
drop table PEKD_DIRSTATION/*Точки доставки*/ 
;
create table PEKD_DIRSTATION/*Точки доставки*/ (
ParentStructRowID CHAR(38) not null,
PEKD_DIRSTATIONid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_DIRSTATION add 
name
 VARCHAR (255) null /* Название */
;
alter  table PEKD_DIRSTATION add 
POSTINDEX
 VARCHAR (20) null /* Индекс отделения */
;
alter  table PEKD_DIRSTATION add 
region null /* Регион */
;
alter  table PEKD_DIRSTATION add 
area
 VARCHAR (255) null /* Район */
;
alter  table PEKD_DIRSTATION add 
TheNextTown null /* Город */
;


/*Дополнительные услуги*/
drop table PEKD_SRV/*Дополнительные услуги*/ 
;
create table PEKD_SRV/*Дополнительные услуги*/ (
InstanceID CHAR(38) ,
PEKD_SRVid CHAR(38) not null primary key  
,ChangeStamp date default (sysdate)  /* Время последнего изменения */
,LockSessionID CHAR(38) null  /* temporary lock */
,LockUserID CHAR(38) null /* checkout lock */
,SecurityStyleID CHAR(38) null /* security formula */
)
;
alter  table PEKD_SRV add 
name
 VARCHAR (255) null /* Название */
;
alter  table PEKD_SRV add 
DependOnWeight null 
 check (DependOnWeight in ( -1/* Да */
, 0/* Нет */ )) /* Зависит от веса */
;
alter  table PEKD_SRV add 
EDIZM null /* Единица измерения */
;
alter  table PEKD_SRV add 
GRPDpUsl null /* Группа Услуг */
;
alter  table PEKD_SRV add 
IsObligate null 
 check (IsObligate in ( -1/* Да */
, 0/* Нет */ )) /* Является обязательной */
;
alter  table PEKD_SRV add 
CalcWithNDS null 
 check (CalcWithNDS in ( -1/* Да */
, 0/* Нет */ )) /* Расчет с НДС */
;
alter  table PEKD_SRV add 
Code1C
 VARCHAR (40) null /* Код1С */
;




