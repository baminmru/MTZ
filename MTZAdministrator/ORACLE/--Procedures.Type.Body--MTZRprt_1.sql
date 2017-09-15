
/* --MTZRprt*/

 create or replace package body MTZRprt as

procedure MTZRprt_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='MTZRprt'
then
declare cursor child_Reports is select Reports.Reportsid ID from Reports where  Reports.InstanceID = ainstanceid;
row_Reports  child_Reports%ROWTYPE;
begin
--open child_Reports;
for row_Reports in child_Reports loop
 Reports_DELETE (acursession,row_Reports.id,aInstanceID);
end loop;
--close child_Reports;
end;
declare cursor child_RPTStruct is select RPTStruct.RPTStructid ID from RPTStruct where  RPTStruct.InstanceID = ainstanceid;
row_RPTStruct  child_RPTStruct%ROWTYPE;
begin
--open child_RPTStruct;
for row_RPTStruct in child_RPTStruct loop
 RPTStruct_DELETE (acursession,row_RPTStruct.id,aInstanceID);
end loop;
--close child_RPTStruct;
end;
declare cursor child_RPTFormula is select RPTFormula.RPTFormulaid ID from RPTFormula where  RPTFormula.InstanceID = ainstanceid;
row_RPTFormula  child_RPTFormula%ROWTYPE;
begin
--open child_RPTFormula;
for row_RPTFormula in child_RPTFormula loop
 RPTFormula_DELETE (acursession,row_RPTFormula.id,aInstanceID);
end loop;
--close child_RPTFormula;
end;
return;
<<del_error>>
return;
end if;
end;
procedure MTZRprt_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'MTZRprt'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_Reports is select Reports.Reportsid ID from Reports where  Reports.InstanceID = arowid;
ROW_Reports  lch_Reports%ROWTYPE;
begin
--open lch_Reports;
for row_Reports in lch_Reports loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from Reports where Reportsid=row_Reports.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_Reports;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_Reports;
     return;
   end if; 
 end if; 
 Reports_HCL (acursession,ROW_Reports.id,aisLocked);
 if aisLocked >2 then
   close lch_Reports;
   return;
 end if;
 end loop;
--close lch_Reports;
end;
declare cursor lch_RPTStruct is select RPTStruct.RPTStructid ID from RPTStruct where  RPTStruct.InstanceID = arowid;
ROW_RPTStruct  lch_RPTStruct%ROWTYPE;
begin
--open lch_RPTStruct;
for row_RPTStruct in lch_RPTStruct loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from RPTStruct where RPTStructid=row_RPTStruct.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_RPTStruct;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_RPTStruct;
     return;
   end if; 
 end if; 
 RPTStruct_HCL (acursession,ROW_RPTStruct.id,aisLocked);
 if aisLocked >2 then
   close lch_RPTStruct;
   return;
 end if;
 end loop;
--close lch_RPTStruct;
end;
declare cursor lch_RPTFormula is select RPTFormula.RPTFormulaid ID from RPTFormula where  RPTFormula.InstanceID = arowid;
ROW_RPTFormula  lch_RPTFormula%ROWTYPE;
begin
--open lch_RPTFormula;
for row_RPTFormula in lch_RPTFormula loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from RPTFormula where RPTFormulaid=row_RPTFormula.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_RPTFormula;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_RPTFormula;
     return;
   end if; 
 end if; 
 RPTFormula_HCL (acursession,ROW_RPTFormula.id,aisLocked);
 if aisLocked >2 then
   close lch_RPTFormula;
   return;
 end if;
 end loop;
--close lch_RPTFormula;
end;
 end if;
aIsLocked:=0;
end;
procedure MTZRprt_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'MTZRprt'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_Reports is select Reports.Reportsid id from Reports where  Reports.InstanceID = arowid;
row_Reports  pch_Reports%ROWTYPE;
begin
--open pch_Reports;
for row_Reports in  pch_Reports loop
 Reports_SINIT( acursession,row_Reports.id,assid);
 Reports_propagate( acursession,row_Reports.id);
end loop;
--close pch_Reports;
end;
declare cursor pch_RPTStruct is select RPTStruct.RPTStructid id from RPTStruct where  RPTStruct.InstanceID = arowid;
row_RPTStruct  pch_RPTStruct%ROWTYPE;
begin
--open pch_RPTStruct;
for row_RPTStruct in  pch_RPTStruct loop
 RPTStruct_SINIT( acursession,row_RPTStruct.id,assid);
 RPTStruct_propagate( acursession,row_RPTStruct.id);
end loop;
--close pch_RPTStruct;
end;
declare cursor pch_RPTFormula is select RPTFormula.RPTFormulaid id from RPTFormula where  RPTFormula.InstanceID = arowid;
row_RPTFormula  pch_RPTFormula%ROWTYPE;
begin
--open pch_RPTFormula;
for row_RPTFormula in  pch_RPTFormula loop
 RPTFormula_SINIT( acursession,row_RPTFormula.id,assid);
 RPTFormula_propagate( acursession,row_RPTFormula.id);
end loop;
--close pch_RPTFormula;
end;
 end if; 
end;



procedure Reports_BRIEF  (
 aCURSESSION CHAR,
 aReportsid CHAR,
 aBRIEF out varchar2
) as 
 aaccess integer;
 atmpStr varchar2(255);
 atmpID CHAR(38);
 existsCnt integer;
begin
 -- checking the_session  --
 select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
if aReportsid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from Reports where ReportsID=aReportsID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from Reports where Reportsid=aReportsID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=Reports');
    return;
  end if;
  aBRIEF:=func.Reports_BRIEF_F(aReportsid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure Reports_DELETE /*Описание*/ (
 aCURSESSION CHAR,
 aReportsid CHAR,
 ainstanceid char
) as 
 aSysLogID CHAR(38);
 aaccess integer;
 aSysInstID CHAR(38);
 atmpID CHAR(38);
 existsCnt integer;
 aChildListid CHAR(38);
  begin  
 select  Instanceid into aSysInstID from instance where objtype='MTZSYSTEM';
 select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if existsCnt=0 then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from Reports where ReportsID=aReportsID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from Reports where Reportsid=aReportsID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:Reports',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=Reports');
      return;
    end if;
  end if;
 --  verify lock  --
 Reports_ISLOCKED( acursession=>acursession,aROWID=>aReportsid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=Reports');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'Reports',
 aVERB=>'DELETEROW',  aThe_Resource=>aReportsid, aLogInstanceID=>aInstanceID);
declare cursor chld_Reports is select  instanceid ID from instance where OwnerPartName ='Reports' and OwnerRowID=aReportsid;
row_Reports  chld_Reports%ROWTYPE;
begin
--open chld_Reports;
for row_Reports in chld_Reports loop
 Kernel.INSTANCE_OWNER (acursession,row_Reports.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_Reports.id);
end loop;
--close chld_Reports;
end ;
  delete from  Reports 
  where  ReportsID = aReportsID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Описание*/
procedure Reports_SAVE /*Описание*/ (
 aCURSESSION CHAR,
 aReportsid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aReportFile VARCHAR2 := null /* Файл отчета */
,aReportFile_EXT varchar2 /* Файл отчета */
,aCaption
 VARCHAR2 := null /* Заголовок *//* Заголовок */
,aPrepareMethod CHAR := null /* Метод для формирования *//* Метод для формирования */
,aReportType
 NUMBER/* Тип отчета *//* Тип отчета */
,aTheReportExt CHAR := null /* Расширение для создания отчета *//* Расширение для создания отчета */
,aReportView
 VARCHAR2 := null /* Базовый запрос *//* Базовый запрос */
,aTheComment VARCHAR2 := null /* Описание *//* Описание */
) as 
aSysLogid CHAR(38);
 aUniqueRowCount integer;
 atmpStr varchar2(255);
 atmpID CHAR(38);
 aaccess int;
 aSysInstID CHAR(38);
 existsCnt integer;
 begin  
 select Instanceid into aSysInstID from instance where objtype='MTZSYSTEM';
 -- checking the_session  --
 select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if existsCnt =0 
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from Reports where ReportsID=aReportsID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from Reports where Reportsid=aReportsID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:Reports',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=Reports');
      return;
    end if;
  end if;
 --  verify lock  --
 Reports_ISLOCKED( acursession=>acursession,aROWID=>aReportsid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=Reports');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'Reports',
 aVERB=>'EDITROW',  aThe_Resource=>aReportsid,aLogInstanceID=>aInstanceID);
 update  Reports set ChangeStamp=sysdate
,
  Name=aName
,
  ReportFile=aReportFile
,ReportFile_EXT=
aReportFile_EXT 
,
  Caption=aCaption
,
  PrepareMethod=aPrepareMethod
,
  ReportType=aReportType
,
  TheReportExt=aTheReportExt
,
  ReportView=aReportView
,
  TheComment=aTheComment
  where  ReportsID = aReportsID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:Reports',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=Reports');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=Reports');
    return;
  end if;
select Count(*) into existsCnt from Reports where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <Reports>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'Reports',
 aVERB=>'CREATEROW',  aThe_Resource=>aReportsid,aLogInstanceID=>aInstanceID);
 insert into   Reports
 (  ReportsID 
,InstanceID
,Name

,ReportFile

,ReportFile_EXT
,Caption

,PrepareMethod

,ReportType

,TheReportExt

,ReportView

,TheComment

 ) values ( aReportsID 
,aInstanceID
,aName

,aReportFile

,aReportFile_EXT
,aCaption

,aPrepareMethod

,aReportType

,aTheReportExt

,aReportView

,aTheComment

 ); 
 Reports_SINIT( aCURSESSION,aReportsid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure Reports_PARENT /*Описание*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR ,
 aParentTable out varchar2
) as 
existsCnt integer;
 begin  
 -- checking the_session  --
select count(*)into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
  aParentTable := 'INSTANCE';
  select  INSTANCEID into aParentID from Reports where  Reportsid=aRowID;
 end; 


procedure Reports_ISLOCKED /*Описание*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) as 
 aParentID CHAR(38);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 aParentTable varchar2(255); 
 existsCnt integer; 
  astr varchar2(4000);
begin
 aisLocked := 0;
 -- checking the_session  --
select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0;
if existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from Reports where Reportsid=aRowID;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     return;
   else 
     aisLocked := 2; /* CheckOut by caller */
     return;
   end  if; 
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     return;
   else 
     aisLocked := 1; /* Locked by caller */
     return;
   end if;  
 end if;  
 aisLocked := 0; 
  Reports_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZRprt.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure Reports_LOCK /*Описание*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
) as 
 aParentID CHAR(38);
 aUserID CHAR(38);
 atmpID CHAR(38);
 aaccess integer;
 aIsLocked integer;
 aParentTable varchar2(255); 
 existsCnt integer; 
 begin  
 select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0;
 -- checking the_session  --
if existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 Reports_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  Reports_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from Reports where Reportsid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=Reports');
    return;
  end if;
   if  aLockMode =2  
   then   
    update Reports set LockUserID =auserID ,LockSessionID =null where Reportsid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update Reports set LockUserID =null,LockSessionID =aCURSESSION  where Reportsid=aRowID;
     return;
   end if;
 end ;


procedure Reports_HCL /*Описание*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) as 
achildlistid CHAR(38);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin  
 select usersid into auserID from the_session where the_sessionid=acursession;
aIsLocked :=0;
end;


procedure Reports_UNLOCK /*Описание*/ (
 aCURSESSION CHAR,
 aRowID CHAR 
) as 
 aParentID CHAR(38);
 aUserID CHAR(38);
 aIsLocked integer;
 aParentTable varchar2(255); 
 existsCnt integer;
 begin  
 -- checking the_session  --
select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if  existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 Reports_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update Reports set LockUserID =null  where Reportsid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update Reports set LockSessionID =null  where Reportsid=aRowID;
     return;
   end if;
 end; 


procedure Reports_SINIT /*Описание*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
) as 
 aParentID CHAR(38);
 aParentTable varchar2(255); 
 aStr varchar2(4000);
 aStyleID CHAR(38);
 atmpID CHAR(38);
 aaccess integer; 
begin
 select  SecurityStyleID into atmpID from Reports where Reportsid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =Reports');
    return;
  end if;
if aSecurityStyleID is null then
 Reports_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update Reports set securitystyleid =aStyleID where Reportsid = aRowID;
else 
 update Reports set securitystyleid =aSecurityStyleID where Reportsid = aRowID;
end if; 
end ; 


procedure Reports_propagate /*Описание*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from Reports where Reportsid=aRowid;
end;



procedure RPTStruct_BRIEF  (
 aCURSESSION CHAR,
 aRPTStructid CHAR,
 aBRIEF out varchar2
) as 
 aaccess integer;
 atmpStr varchar2(255);
 atmpID CHAR(38);
 existsCnt integer;
begin
 -- checking the_session  --
 select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
if aRPTStructid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from RPTStruct where RPTStructID=aRPTStructID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from RPTStruct where RPTStructid=aRPTStructID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=RPTStruct');
    return;
  end if;
  aBRIEF:=func.RPTStruct_BRIEF_F(aRPTStructid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure RPTStruct_DELETE /*Секции*/ (
 aCURSESSION CHAR,
 aRPTStructid CHAR,
 ainstanceid char
) as 
 aSysLogID CHAR(38);
 aaccess integer;
 aSysInstID CHAR(38);
 atmpID CHAR(38);
 existsCnt integer;
 aChildListid CHAR(38);
  begin  
 select  Instanceid into aSysInstID from instance where objtype='MTZSYSTEM';
 select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if existsCnt=0 then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from RPTStruct where RPTStructID=aRPTStructID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from RPTStruct where RPTStructid=aRPTStructID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:RPTStruct',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=RPTStruct');
      return;
    end if;
  end if;
 --  verify lock  --
 RPTStruct_ISLOCKED( acursession=>acursession,aROWID=>aRPTStructid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=RPTStruct');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_RPTFields is select RPTFields.RPTFieldsid ID from RPTFields where  RPTFields.ParentStructRowID = aRPTStructid;
    child_RPTFields_rec  child_RPTFields%ROWTYPE;
    begin
    --open child_RPTFields;
      for child_RPTFields_rec in child_RPTFields loop
      RPTFields_DELETE (acursession,child_RPTFields_rec.id,aInstanceid);
      end loop;
      --close child_RPTFields;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'RPTStruct',
 aVERB=>'DELETEROW',  aThe_Resource=>aRPTStructid, aLogInstanceID=>aInstanceID);
declare cursor chld_RPTStruct is select  instanceid ID from instance where OwnerPartName ='RPTStruct' and OwnerRowID=aRPTStructid;
row_RPTStruct  chld_RPTStruct%ROWTYPE;
begin
--open chld_RPTStruct;
for row_RPTStruct in chld_RPTStruct loop
 Kernel.INSTANCE_OWNER (acursession,row_RPTStruct.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_RPTStruct.id);
end loop;
--close chld_RPTStruct;
end ;
  delete from  RPTStruct 
  where  RPTStructID = aRPTStructID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Секции*/
procedure RPTStruct_SAVE /*Секции*/ (
 aCURSESSION CHAR,
 aRPTStructid CHAR,
aInstanceID CHAR 
, aParentRowid CHAR :=null
,aName
 VARCHAR2/* Название *//* Название */
,aCaption
 VARCHAR2 := null /* Заголовок *//* Заголовок */
) as 
aSysLogid CHAR(38);
 aUniqueRowCount integer;
 atmpStr varchar2(255);
 atmpID CHAR(38);
 aaccess int;
 aSysInstID CHAR(38);
 existsCnt integer;
 begin  
 select Instanceid into aSysInstID from instance where objtype='MTZSYSTEM';
 -- checking the_session  --
 select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if existsCnt =0 
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from RPTStruct where RPTStructID=aRPTStructID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from RPTStruct where RPTStructid=aRPTStructID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:RPTStruct',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=RPTStruct');
      return;
    end if;
  end if;
 --  verify lock  --
 RPTStruct_ISLOCKED( acursession=>acursession,aROWID=>aRPTStructid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=RPTStruct');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'RPTStruct',
 aVERB=>'EDITROW',  aThe_Resource=>aRPTStructid,aLogInstanceID=>aInstanceID);
 update  RPTStruct set ChangeStamp=sysdate
,ParentRowid= aParentRowid
,
  Name=aName
,
  Caption=aCaption
  where  RPTStructID = aRPTStructID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:RPTStruct',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=RPTStruct');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=RPTStruct');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'RPTStruct',
 aVERB=>'CREATEROW',  aThe_Resource=>aRPTStructid,aLogInstanceID=>aInstanceID);
 insert into   RPTStruct
 (  RPTStructID 
,ParentRowid
,InstanceID
,Name

,Caption

 ) values ( aRPTStructID 
,aParentRowid
,aInstanceID
,aName

,aCaption

 ); 
 RPTStruct_SINIT( aCURSESSION,aRPTStructid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure RPTStruct_PARENT /*Секции*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR ,
 aParentTable out varchar2
) as 
existsCnt integer;
 begin  
 -- checking the_session  --
select count(*)into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
  aParentTable := 'INSTANCE';
  select  INSTANCEID into aParentID from RPTStruct where  RPTStructid=aRowID;
 end; 


procedure RPTStruct_ISLOCKED /*Секции*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) as 
 aParentID CHAR(38);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 aParentTable varchar2(255); 
 existsCnt integer; 
  astr varchar2(4000);
begin
 aisLocked := 0;
 -- checking the_session  --
select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0;
if existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from RPTStruct where RPTStructid=aRowID;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     return;
   else 
     aisLocked := 2; /* CheckOut by caller */
     return;
   end  if; 
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     return;
   else 
     aisLocked := 1; /* Locked by caller */
     return;
   end if;  
 end if;  
 aisLocked := 0; 
  RPTStruct_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZRprt.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure RPTStruct_LOCK /*Секции*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
) as 
 aParentID CHAR(38);
 aUserID CHAR(38);
 atmpID CHAR(38);
 aaccess integer;
 aIsLocked integer;
 aParentTable varchar2(255); 
 existsCnt integer; 
 begin  
 select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0;
 -- checking the_session  --
if existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 RPTStruct_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  RPTStruct_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from RPTStruct where RPTStructid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=RPTStruct');
    return;
  end if;
   if  aLockMode =2  
   then   
    update RPTStruct set LockUserID =auserID ,LockSessionID =null where RPTStructid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update RPTStruct set LockUserID =null,LockSessionID =aCURSESSION  where RPTStructid=aRowID;
     return;
   end if;
 end ;


procedure RPTStruct_HCL /*Секции*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) as 
achildlistid CHAR(38);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin  
 select usersid into auserID from the_session where the_sessionid=acursession;
-- verify child locks
declare cursor lch_RPTFields is select RPTFields.RPTFieldsid ID from RPTFields where  RPTFields.ParentStructRowID = aRowid;
row_RPTFields lch_RPTFields%ROWTYPE;
begin  
--open lch_RPTFields;
for row_RPTFields in lch_RPTFields
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from RPTFields where RPTFieldsid=row_RPTFields.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_RPTFields;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_RPTFields;
     return;
   end if; 
 end if;  
 RPTFields_HCL (acursession,row_RPTFields.id,aisLocked);
 if aisLocked >2 then
   close lch_RPTFields;
   return;
 end if;
end loop;
--close lch_RPTFields;
end;
aIsLocked :=0;
end;


procedure RPTStruct_UNLOCK /*Секции*/ (
 aCURSESSION CHAR,
 aRowID CHAR 
) as 
 aParentID CHAR(38);
 aUserID CHAR(38);
 aIsLocked integer;
 aParentTable varchar2(255); 
 existsCnt integer;
 begin  
 -- checking the_session  --
select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if  existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 RPTStruct_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update RPTStruct set LockUserID =null  where RPTStructid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update RPTStruct set LockSessionID =null  where RPTStructid=aRowID;
     return;
   end if;
 end; 


procedure RPTStruct_SINIT /*Секции*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
) as 
 aParentID CHAR(38);
 aParentTable varchar2(255); 
 aStr varchar2(4000);
 aStyleID CHAR(38);
 atmpID CHAR(38);
 aaccess integer; 
begin
 select  SecurityStyleID into atmpID from RPTStruct where RPTStructid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =RPTStruct');
    return;
  end if;
if aSecurityStyleID is null then
 RPTStruct_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update RPTStruct set securitystyleid =aStyleID where RPTStructid = aRowID;
else 
 update RPTStruct set securitystyleid =aSecurityStyleID where RPTStructid = aRowID;
end if; 
end ; 


procedure RPTStruct_propagate /*Секции*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from RPTStruct where RPTStructid=aRowid;
declare cursor pch_RPTFields  is select RPTFields.RPTFieldsid ID from RPTFields where  RPTFields.ParentStructRowID = aRowid;
row_RPTFields  pch_RPTFields%ROWTYPE;
begin
--open pch_RPTFields;
for row_RPTFields in pch_RPTFields loop
   RPTFields_SINIT( acursession,row_RPTFields.id,assid);
   RPTFields_propagate( acursession,row_RPTFields.id);
end loop;
--close pch_RPTFields;
end;
end;



procedure RPTFields_BRIEF  (
 aCURSESSION CHAR,
 aRPTFieldsid CHAR,
 aBRIEF out varchar2
) as 
 aaccess integer;
 atmpStr varchar2(255);
 atmpID CHAR(38);
 existsCnt integer;
begin
 -- checking the_session  --
 select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
if aRPTFieldsid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from RPTFields where RPTFieldsID=aRPTFieldsID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from RPTFields where RPTFieldsid=aRPTFieldsID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=RPTFields');
    return;
  end if;
  aBRIEF:=func.RPTFields_BRIEF_F(aRPTFieldsid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure RPTFields_DELETE /*Поля секции*/ (
 aCURSESSION CHAR,
 aRPTFieldsid CHAR,
 ainstanceid char
) as 
 aSysLogID CHAR(38);
 aaccess integer;
 aSysInstID CHAR(38);
 atmpID CHAR(38);
 existsCnt integer;
 aChildListid CHAR(38);
  begin  
 select  Instanceid into aSysInstID from instance where objtype='MTZSYSTEM';
 select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if existsCnt=0 then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from RPTFields where RPTFieldsID=aRPTFieldsID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from RPTFields where RPTFieldsid=aRPTFieldsID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:RPTFields',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=RPTFields');
      return;
    end if;
  end if;
 --  verify lock  --
 RPTFields_ISLOCKED( acursession=>acursession,aROWID=>aRPTFieldsid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=RPTFields');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'RPTFields',
 aVERB=>'DELETEROW',  aThe_Resource=>aRPTFieldsid, aLogInstanceID=>aInstanceID);
declare cursor chld_RPTFields is select  instanceid ID from instance where OwnerPartName ='RPTFields' and OwnerRowID=aRPTFieldsid;
row_RPTFields  chld_RPTFields%ROWTYPE;
begin
--open chld_RPTFields;
for row_RPTFields in chld_RPTFields loop
 Kernel.INSTANCE_OWNER (acursession,row_RPTFields.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_RPTFields.id);
end loop;
--close chld_RPTFields;
end ;
  delete from  RPTFields 
  where  RPTFieldsID = aRPTFieldsID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Поля секции*/
procedure RPTFields_SAVE /*Поля секции*/ (
 aCURSESSION CHAR,
 aRPTFieldsid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aFieldType CHAR/* Тип поля *//* Тип поля */
,aFieldSize
 NUMBER := null /* Размер *//* Размер */
,aCaption
 VARCHAR2 := null /* Заголовок *//* Заголовок */
) as 
aSysLogid CHAR(38);
 aUniqueRowCount integer;
 atmpStr varchar2(255);
 atmpID CHAR(38);
 aaccess int;
 aSysInstID CHAR(38);
 existsCnt integer;
 begin  
 select Instanceid into aSysInstID from instance where objtype='MTZSYSTEM';
 -- checking the_session  --
 select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if existsCnt =0 
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from RPTFields where RPTFieldsID=aRPTFieldsID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from RPTFields where RPTFieldsid=aRPTFieldsID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:RPTFields',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=RPTFields');
      return;
    end if;
  end if;
 --  verify lock  --
 RPTFields_ISLOCKED( acursession=>acursession,aROWID=>aRPTFieldsid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=RPTFields');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'RPTFields',
 aVERB=>'EDITROW',  aThe_Resource=>aRPTFieldsid,aLogInstanceID=>aInstanceID);
 update  RPTFields set ChangeStamp=sysdate
,
  Name=aName
,
  FieldType=aFieldType
,
  FieldSize=aFieldSize
,
  Caption=aCaption
  where  RPTFieldsID = aRPTFieldsID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from RPTStruct where RPTStructid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:RPTFields',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=RPTFields');
      return;
    end if;
 end if;
 RPTStruct_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=RPTFields');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'RPTFields',
 aVERB=>'CREATEROW',  aThe_Resource=>aRPTFieldsid,aLogInstanceID=>aInstanceID);
 insert into   RPTFields
 (  RPTFieldsID 
,ParentStructRowID
,Name

,FieldType

,FieldSize

,Caption

 ) values ( aRPTFieldsID 
,aParentStructRowID
,aName

,aFieldType

,aFieldSize

,aCaption

 ); 
 RPTFields_SINIT( aCURSESSION,aRPTFieldsid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure RPTFields_PARENT /*Поля секции*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR ,
 aParentTable out varchar2
) as 
existsCnt integer;
 begin  
 -- checking the_session  --
select count(*)into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
  select ParentStructRowID into aParentID  from RPTFields where  RPTFieldsid=aRowID;
  aParentTable := 'RPTStruct';
 end; 


procedure RPTFields_ISLOCKED /*Поля секции*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) as 
 aParentID CHAR(38);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 aParentTable varchar2(255); 
 existsCnt integer; 
  astr varchar2(4000);
begin
 aisLocked := 0;
 -- checking the_session  --
select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0;
if existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from RPTFields where RPTFieldsid=aRowID;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     return;
   else 
     aisLocked := 2; /* CheckOut by caller */
     return;
   end  if; 
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     return;
   else 
     aisLocked := 1; /* Locked by caller */
     return;
   end if;  
 end if;  
 aisLocked := 0; 
  RPTFields_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZRprt.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure RPTFields_LOCK /*Поля секции*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
) as 
 aParentID CHAR(38);
 aUserID CHAR(38);
 atmpID CHAR(38);
 aaccess integer;
 aIsLocked integer;
 aParentTable varchar2(255); 
 existsCnt integer; 
 begin  
 select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0;
 -- checking the_session  --
if existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 RPTFields_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  RPTFields_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from RPTFields where RPTFieldsid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=RPTFields');
    return;
  end if;
   if  aLockMode =2  
   then   
    update RPTFields set LockUserID =auserID ,LockSessionID =null where RPTFieldsid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update RPTFields set LockUserID =null,LockSessionID =aCURSESSION  where RPTFieldsid=aRowID;
     return;
   end if;
 end ;


procedure RPTFields_HCL /*Поля секции*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) as 
achildlistid CHAR(38);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin  
 select usersid into auserID from the_session where the_sessionid=acursession;
aIsLocked :=0;
end;


procedure RPTFields_UNLOCK /*Поля секции*/ (
 aCURSESSION CHAR,
 aRowID CHAR 
) as 
 aParentID CHAR(38);
 aUserID CHAR(38);
 aIsLocked integer;
 aParentTable varchar2(255); 
 existsCnt integer;
 begin  
 -- checking the_session  --
select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if  existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 RPTFields_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update RPTFields set LockUserID =null  where RPTFieldsid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update RPTFields set LockSessionID =null  where RPTFieldsid=aRowID;
     return;
   end if;
 end; 


procedure RPTFields_SINIT /*Поля секции*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
) as 
 aParentID CHAR(38);
 aParentTable varchar2(255); 
 aStr varchar2(4000);
 aStyleID CHAR(38);
 atmpID CHAR(38);
 aaccess integer; 
begin
 select  SecurityStyleID into atmpID from RPTFields where RPTFieldsid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =RPTFields');
    return;
  end if;
if aSecurityStyleID is null then
 RPTFields_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update RPTFields set securitystyleid =aStyleID where RPTFieldsid = aRowID;
else 
 update RPTFields set securitystyleid =aSecurityStyleID where RPTFieldsid = aRowID;
end if; 
end ; 


procedure RPTFields_propagate /*Поля секции*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from RPTFields where RPTFieldsid=aRowid;
end;



procedure RPTFormula_BRIEF  (
 aCURSESSION CHAR,
 aRPTFormulaid CHAR,
 aBRIEF out varchar2
) as 
 aaccess integer;
 atmpStr varchar2(255);
 atmpID CHAR(38);
 existsCnt integer;
begin
 -- checking the_session  --
 select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
if aRPTFormulaid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from RPTFormula where RPTFormulaID=aRPTFormulaID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from RPTFormula where RPTFormulaid=aRPTFormulaID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=RPTFormula');
    return;
  end if;
  aBRIEF:=func.RPTFormula_BRIEF_F(aRPTFormulaid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure RPTFormula_DELETE /*Формулы*/ (
 aCURSESSION CHAR,
 aRPTFormulaid CHAR,
 ainstanceid char
) as 
 aSysLogID CHAR(38);
 aaccess integer;
 aSysInstID CHAR(38);
 atmpID CHAR(38);
 existsCnt integer;
 aChildListid CHAR(38);
  begin  
 select  Instanceid into aSysInstID from instance where objtype='MTZSYSTEM';
 select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if existsCnt=0 then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from RPTFormula where RPTFormulaID=aRPTFormulaID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from RPTFormula where RPTFormulaid=aRPTFormulaID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:RPTFormula',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=RPTFormula');
      return;
    end if;
  end if;
 --  verify lock  --
 RPTFormula_ISLOCKED( acursession=>acursession,aROWID=>aRPTFormulaid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=RPTFormula');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'RPTFormula',
 aVERB=>'DELETEROW',  aThe_Resource=>aRPTFormulaid, aLogInstanceID=>aInstanceID);
declare cursor chld_RPTFormula is select  instanceid ID from instance where OwnerPartName ='RPTFormula' and OwnerRowID=aRPTFormulaid;
row_RPTFormula  chld_RPTFormula%ROWTYPE;
begin
--open chld_RPTFormula;
for row_RPTFormula in chld_RPTFormula loop
 Kernel.INSTANCE_OWNER (acursession,row_RPTFormula.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_RPTFormula.id);
end loop;
--close chld_RPTFormula;
end ;
  delete from  RPTFormula 
  where  RPTFormulaID = aRPTFormulaID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Формулы*/
procedure RPTFormula_SAVE /*Формулы*/ (
 aCURSESSION CHAR,
 aRPTFormulaid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aCode VARCHAR2 := null /* Выражение *//* Выражение */
,aPlatform CHAR := null /* Платформа *//* Платформа */
) as 
aSysLogid CHAR(38);
 aUniqueRowCount integer;
 atmpStr varchar2(255);
 atmpID CHAR(38);
 aaccess int;
 aSysInstID CHAR(38);
 existsCnt integer;
 begin  
 select Instanceid into aSysInstID from instance where objtype='MTZSYSTEM';
 -- checking the_session  --
 select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if existsCnt =0 
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from RPTFormula where RPTFormulaID=aRPTFormulaID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from RPTFormula where RPTFormulaid=aRPTFormulaID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:RPTFormula',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=RPTFormula');
      return;
    end if;
  end if;
 --  verify lock  --
 RPTFormula_ISLOCKED( acursession=>acursession,aROWID=>aRPTFormulaid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=RPTFormula');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'RPTFormula',
 aVERB=>'EDITROW',  aThe_Resource=>aRPTFormulaid,aLogInstanceID=>aInstanceID);
 update  RPTFormula set ChangeStamp=sysdate
,
  Name=aName
,
  Code=aCode
,
  Platform=aPlatform
  where  RPTFormulaID = aRPTFormulaID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:RPTFormula',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=RPTFormula');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=RPTFormula');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'RPTFormula',
 aVERB=>'CREATEROW',  aThe_Resource=>aRPTFormulaid,aLogInstanceID=>aInstanceID);
 insert into   RPTFormula
 (  RPTFormulaID 
,InstanceID
,Name

,Code

,Platform

 ) values ( aRPTFormulaID 
,aInstanceID
,aName

,aCode

,aPlatform

 ); 
 RPTFormula_SINIT( aCURSESSION,aRPTFormulaid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure RPTFormula_PARENT /*Формулы*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR ,
 aParentTable out varchar2
) as 
existsCnt integer;
 begin  
 -- checking the_session  --
select count(*)into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
  aParentTable := 'INSTANCE';
  select  INSTANCEID into aParentID from RPTFormula where  RPTFormulaid=aRowID;
 end; 


procedure RPTFormula_ISLOCKED /*Формулы*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) as 
 aParentID CHAR(38);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 aParentTable varchar2(255); 
 existsCnt integer; 
  astr varchar2(4000);
begin
 aisLocked := 0;
 -- checking the_session  --
select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0;
if existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from RPTFormula where RPTFormulaid=aRowID;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     return;
   else 
     aisLocked := 2; /* CheckOut by caller */
     return;
   end  if; 
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     return;
   else 
     aisLocked := 1; /* Locked by caller */
     return;
   end if;  
 end if;  
 aisLocked := 0; 
  RPTFormula_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZRprt.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure RPTFormula_LOCK /*Формулы*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
) as 
 aParentID CHAR(38);
 aUserID CHAR(38);
 atmpID CHAR(38);
 aaccess integer;
 aIsLocked integer;
 aParentTable varchar2(255); 
 existsCnt integer; 
 begin  
 select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0;
 -- checking the_session  --
if existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 RPTFormula_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  RPTFormula_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from RPTFormula where RPTFormulaid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=RPTFormula');
    return;
  end if;
   if  aLockMode =2  
   then   
    update RPTFormula set LockUserID =auserID ,LockSessionID =null where RPTFormulaid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update RPTFormula set LockUserID =null,LockSessionID =aCURSESSION  where RPTFormulaid=aRowID;
     return;
   end if;
 end ;


procedure RPTFormula_HCL /*Формулы*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) as 
achildlistid CHAR(38);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin  
 select usersid into auserID from the_session where the_sessionid=acursession;
aIsLocked :=0;
end;


procedure RPTFormula_UNLOCK /*Формулы*/ (
 aCURSESSION CHAR,
 aRowID CHAR 
) as 
 aParentID CHAR(38);
 aUserID CHAR(38);
 aIsLocked integer;
 aParentTable varchar2(255); 
 existsCnt integer;
 begin  
 -- checking the_session  --
select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if  existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 RPTFormula_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update RPTFormula set LockUserID =null  where RPTFormulaid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update RPTFormula set LockSessionID =null  where RPTFormulaid=aRowID;
     return;
   end if;
 end; 


procedure RPTFormula_SINIT /*Формулы*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
) as 
 aParentID CHAR(38);
 aParentTable varchar2(255); 
 aStr varchar2(4000);
 aStyleID CHAR(38);
 atmpID CHAR(38);
 aaccess integer; 
begin
 select  SecurityStyleID into atmpID from RPTFormula where RPTFormulaid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =RPTFormula');
    return;
  end if;
if aSecurityStyleID is null then
 RPTFormula_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update RPTFormula set securitystyleid =aStyleID where RPTFormulaid = aRowID;
else 
 update RPTFormula set securitystyleid =aSecurityStyleID where RPTFormulaid = aRowID;
end if; 
end ; 


procedure RPTFormula_propagate /*Формулы*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from RPTFormula where RPTFormulaid=aRowid;
end;


end MTZRprt;

/



