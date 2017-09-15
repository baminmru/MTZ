
/* --dir_*/

 create or replace package dir_ as

procedure dir__DELETE(acursession CHAR, aInstanceID CHAR);  
procedure dir__HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure dir__propagate(acursession CHAR, aROWID CHAR); 


procedure dir_flow_BRIEF  (
 aCURSESSION CHAR,
 adir_flowid CHAR,
 aBRIEF out varchar2
);
procedure dir_flow_DELETE  (
 aCURSESSION CHAR,
 adir_flowid CHAR,
 ainstanceid char
); 
procedure dir_flow_SAVE (
 aCURSESSION CHAR,
 adir_flowid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,adocNumerator CHAR/* Нумератор *//* Нумератор */
,adocPrefix
 VARCHAR2 := null /* Префикс *//* Префикс */
,adocPostfix
 VARCHAR2 := null /* Постфикс *//* Постфикс */
); 
procedure dir_flow_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure dir_flow_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure dir_flow_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure dir_flow_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure dir_flow_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure dir_flow_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure dir_flow_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure dir_flowtype_BRIEF  (
 aCURSESSION CHAR,
 adir_flowtypeid CHAR,
 aBRIEF out varchar2
);
procedure dir_flowtype_DELETE  (
 aCURSESSION CHAR,
 adir_flowtypeid CHAR,
 ainstanceid char
); 
procedure dir_flowtype_SAVE (
 aCURSESSION CHAR,
 adir_flowtypeid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTheNumPart CHAR/* Раздел документа *//* Раздел документа */
,aNumField CHAR/* Поле для хранения номера *//* Поле для хранения номера */
,azonetemplate
 VARCHAR2/* Шаблон зоны *//* Шаблон зоны */
,aNumDateField CHAR := null /* Поле с датой регистрации *//* Поле с датой регистрации */
); 
procedure dir_flowtype_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure dir_flowtype_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure dir_flowtype_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure dir_flowtype_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure dir_flowtype_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure dir_flowtype_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure dir_flowtype_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure dir_ordtype_BRIEF  (
 aCURSESSION CHAR,
 adir_ordtypeid CHAR,
 aBRIEF out varchar2
);
procedure dir_ordtype_DELETE  (
 aCURSESSION CHAR,
 adir_ordtypeid CHAR,
 ainstanceid char
); 
procedure dir_ordtype_SAVE (
 aCURSESSION CHAR,
 adir_ordtypeid CHAR,
aInstanceID CHAR 
,aordtype
 VARCHAR2/* Тип *//* Тип */
,aProcess CHAR := null /* Процес обработки *//* Процес обработки */
,aUseProject
 NUMBER/* Свободная обработка *//* Свободная обработка */
,aStateMachine CHAR := null /* Машина состояний *//* Машина состояний */
,aProcessDocumentName
 VARCHAR2 := null /* Название документа в процессе *//* Название документа в процессе */
); 
procedure dir_ordtype_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure dir_ordtype_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure dir_ordtype_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure dir_ordtype_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure dir_ordtype_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure dir_ordtype_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure dir_ordtype_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure dir_org_BRIEF  (
 aCURSESSION CHAR,
 adir_orgid CHAR,
 aBRIEF out varchar2
);
procedure dir_org_DELETE  (
 aCURSESSION CHAR,
 adir_orgid CHAR,
 ainstanceid char
); 
procedure dir_org_SAVE (
 aCURSESSION CHAR,
 adir_orgid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* Название *//* Название */
,aInfo VARCHAR2 := null /* Информация *//* Информация */
,athe_Description CHAR := null /* Карточка описания *//* Карточка описания */
,aProfile CHAR := null /* Профиль предприятия *//* Профиль предприятия */
); 
procedure dir_org_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure dir_org_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure dir_org_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure dir_org_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure dir_org_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure dir_org_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure dir_org_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure dir_departments_BRIEF  (
 aCURSESSION CHAR,
 adir_departmentsid CHAR,
 aBRIEF out varchar2
);
procedure dir_departments_DELETE  (
 aCURSESSION CHAR,
 adir_departmentsid CHAR,
 ainstanceid char
); 
procedure dir_departments_SAVE (
 aCURSESSION CHAR,
 adir_departmentsid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
, aParentRowid CHAR :=null
,adepname
 VARCHAR2/* Название отдела *//* Название отдела */
,adepgroup CHAR := null /* Группа *//* Группа */
,aincfolder CHAR := null /* Папка входящих *//* Папка входящих */
,arootfolder CHAR := null /* Корневая папка *//* Корневая папка */
,aoutprefix
 VARCHAR2 := null /* Префикс исходящего *//* Префикс исходящего */
,aincprefix
 VARCHAR2 := null /* Префикс входящего *//* Префикс входящего */
,aordprefix
 VARCHAR2 := null /* Префикс приказа *//* Префикс приказа */
,aoutpostfix
 VARCHAR2 := null /* Постфикс исходящего *//* Постфикс исходящего */
,aincpostfix
 VARCHAR2 := null /* Постфикс входящего *//* Постфикс входящего */
,aordpostfix
 VARCHAR2 := null /* Потфикс приказа *//* Потфикс приказа */
,aoutfolder CHAR := null /* Папка исходящих *//* Папка исходящих */
,aorderfolder CHAR := null /* Папка приказов *//* Папка приказов */
,aincnumerator CHAR := null /* Нумератор входящих *//* Нумератор входящих */
,aoutnumerator CHAR := null /* Нумератор исходящих *//* Нумератор исходящих */
,aordnumerator CHAR := null /* Нумератор приказов *//* Нумератор приказов */
,aIncZone
 VARCHAR2 := null /* Зона входящего *//* Зона входящего */
,aOutZone
 VARCHAR2 := null /* Зона исходящего *//* Зона исходящего */
,aEMail VARCHAR2 := null /* Почтовый адрес *//* Почтовый адрес */
,aOrdZone
 VARCHAR2 := null /* Зона приказов *//* Зона приказов */
,aUnitType CHAR/* Тип позиции *//* Тип позиции */
,aHasBudget
 NUMBER/* Есть свой бюджет *//* Есть свой бюджет */
); 
procedure dir_departments_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure dir_departments_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure dir_departments_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure dir_departments_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure dir_departments_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure dir_departments_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure dir_departments_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure dir_inctype_BRIEF  (
 aCURSESSION CHAR,
 adir_inctypeid CHAR,
 aBRIEF out varchar2
);
procedure dir_inctype_DELETE  (
 aCURSESSION CHAR,
 adir_inctypeid CHAR,
 ainstanceid char
); 
procedure dir_inctype_SAVE (
 aCURSESSION CHAR,
 adir_inctypeid CHAR,
aInstanceID CHAR 
,aitype
 VARCHAR2/* Тип *//* Тип */
,aProcess CHAR := null /* Процесс обработки *//* Процесс обработки */
,aUseProject
 NUMBER/* Свободная обработка *//* Свободная обработка */
,aStateMachine CHAR := null /* Машина состояний *//* Машина состояний */
,aProcessDocumentName
 VARCHAR2 := null /* Название документа в процессе *//* Название документа в процессе */
); 
procedure dir_inctype_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure dir_inctype_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure dir_inctype_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure dir_inctype_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure dir_inctype_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure dir_inctype_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure dir_inctype_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure dir_reftype_BRIEF  (
 aCURSESSION CHAR,
 adir_reftypeid CHAR,
 aBRIEF out varchar2
);
procedure dir_reftype_DELETE  (
 aCURSESSION CHAR,
 adir_reftypeid CHAR,
 ainstanceid char
); 
procedure dir_reftype_SAVE (
 aCURSESSION CHAR,
 adir_reftypeid CHAR,
aInstanceID CHAR 
,areftypename
 VARCHAR2/* Название *//* Название */
,aBackref CHAR := null /* Обратная ссылка *//* Обратная ссылка */
); 
procedure dir_reftype_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure dir_reftype_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure dir_reftype_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure dir_reftype_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure dir_reftype_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure dir_reftype_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure dir_reftype_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure dir_position_BRIEF  (
 aCURSESSION CHAR,
 adir_positionid CHAR,
 aBRIEF out varchar2
);
procedure dir_position_DELETE  (
 aCURSESSION CHAR,
 adir_positionid CHAR,
 ainstanceid char
); 
procedure dir_position_SAVE (
 aCURSESSION CHAR,
 adir_positionid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,acode
 VARCHAR2/* Код *//* Код */
,adepartment CHAR/* Отдел *//* Отдел */
,aPerson CHAR := null /* Сотрудник *//* Сотрудник */
,aTheUser CHAR := null /* Пользователь системы *//* Пользователь системы */
,aUnavailable
 NUMBER/* Отсутствует *//* Отсутствует */
,aZAMEST CHAR := null /* Заместитель *//* Заместитель */
); 
procedure dir_position_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure dir_position_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure dir_position_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure dir_position_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure dir_position_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure dir_position_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure dir_position_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure dir_jobstates_BRIEF  (
 aCURSESSION CHAR,
 adir_jobstatesid CHAR,
 aBRIEF out varchar2
);
procedure dir_jobstates_DELETE  (
 aCURSESSION CHAR,
 adir_jobstatesid CHAR,
 ainstanceid char
); 
procedure dir_jobstates_SAVE (
 aCURSESSION CHAR,
 adir_jobstatesid CHAR,
aInstanceID CHAR 
,aresstate
 VARCHAR2/* Состояние *//* Состояние */
); 
procedure dir_jobstates_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure dir_jobstates_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure dir_jobstates_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure dir_jobstates_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure dir_jobstates_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure dir_jobstates_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure dir_jobstates_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure dir_outtype_BRIEF  (
 aCURSESSION CHAR,
 adir_outtypeid CHAR,
 aBRIEF out varchar2
);
procedure dir_outtype_DELETE  (
 aCURSESSION CHAR,
 adir_outtypeid CHAR,
 ainstanceid char
); 
procedure dir_outtype_SAVE (
 aCURSESSION CHAR,
 adir_outtypeid CHAR,
aInstanceID CHAR 
,aotype
 VARCHAR2/* Тип *//* Тип */
,aProcess CHAR := null /* Процесс обработки *//* Процесс обработки */
,aStateMachine CHAR := null /* Машина состояний *//* Машина состояний */
,aProcessDocumentName
 VARCHAR2 := null /* Название документа в процессе *//* Название документа в процессе */
); 
procedure dir_outtype_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure dir_outtype_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure dir_outtype_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure dir_outtype_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure dir_outtype_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure dir_outtype_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure dir_outtype_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure dir_theme_BRIEF  (
 aCURSESSION CHAR,
 adir_themeid CHAR,
 aBRIEF out varchar2
);
procedure dir_theme_DELETE  (
 aCURSESSION CHAR,
 adir_themeid CHAR,
 ainstanceid char
); 
procedure dir_theme_SAVE (
 aCURSESSION CHAR,
 adir_themeid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* Название *//* Название */
,aComent VARCHAR2 := null /* Комментарий *//* Комментарий */
); 
procedure dir_theme_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure dir_theme_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure dir_theme_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure dir_theme_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure dir_theme_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure dir_theme_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure dir_theme_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end dir_;

/



