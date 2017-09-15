
/* --MTZExt*/

 create or replace package body MTZExt as

procedure MTZExt_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='MTZExt'
then
declare cursor child_MTZExt_def is select MTZExt_def.MTZExt_defid ID from MTZExt_def where  MTZExt_def.InstanceID = ainstanceid;
row_MTZExt_def  child_MTZExt_def%ROWTYPE;
begin
--open child_MTZExt_def;
for row_MTZExt_def in child_MTZExt_def loop
 MTZExt_def_DELETE (acursession,row_MTZExt_def.id,aInstanceID);
end loop;
--close child_MTZExt_def;
end;
declare cursor child_MTZExtRel is select MTZExtRel.MTZExtRelid ID from MTZExtRel where  MTZExtRel.InstanceID = ainstanceid;
row_MTZExtRel  child_MTZExtRel%ROWTYPE;
begin
--open child_MTZExtRel;
for row_MTZExtRel in child_MTZExtRel loop
 MTZExtRel_DELETE (acursession,row_MTZExtRel.id,aInstanceID);
end loop;
--close child_MTZExtRel;
end;
return;
<<del_error>>
return;
end if;
end;
procedure MTZExt_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'MTZExt'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_MTZExt_def is select MTZExt_def.MTZExt_defid ID from MTZExt_def where  MTZExt_def.InstanceID = arowid;
ROW_MTZExt_def  lch_MTZExt_def%ROWTYPE;
begin
--open lch_MTZExt_def;
for row_MTZExt_def in lch_MTZExt_def loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from MTZExt_def where MTZExt_defid=row_MTZExt_def.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_MTZExt_def;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_MTZExt_def;
     return;
   end if; 
 end if; 
 MTZExt_def_HCL (acursession,ROW_MTZExt_def.id,aisLocked);
 if aisLocked >2 then
   close lch_MTZExt_def;
   return;
 end if;
 end loop;
--close lch_MTZExt_def;
end;
declare cursor lch_MTZExtRel is select MTZExtRel.MTZExtRelid ID from MTZExtRel where  MTZExtRel.InstanceID = arowid;
ROW_MTZExtRel  lch_MTZExtRel%ROWTYPE;
begin
--open lch_MTZExtRel;
for row_MTZExtRel in lch_MTZExtRel loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from MTZExtRel where MTZExtRelid=row_MTZExtRel.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_MTZExtRel;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_MTZExtRel;
     return;
   end if; 
 end if; 
 MTZExtRel_HCL (acursession,ROW_MTZExtRel.id,aisLocked);
 if aisLocked >2 then
   close lch_MTZExtRel;
   return;
 end if;
 end loop;
--close lch_MTZExtRel;
end;
 end if;
aIsLocked:=0;
end;
procedure MTZExt_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'MTZExt'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_MTZExt_def is select MTZExt_def.MTZExt_defid id from MTZExt_def where  MTZExt_def.InstanceID = arowid;
row_MTZExt_def  pch_MTZExt_def%ROWTYPE;
begin
--open pch_MTZExt_def;
for row_MTZExt_def in  pch_MTZExt_def loop
 MTZExt_def_SINIT( acursession,row_MTZExt_def.id,assid);
 MTZExt_def_propagate( acursession,row_MTZExt_def.id);
end loop;
--close pch_MTZExt_def;
end;
declare cursor pch_MTZExtRel is select MTZExtRel.MTZExtRelid id from MTZExtRel where  MTZExtRel.InstanceID = arowid;
row_MTZExtRel  pch_MTZExtRel%ROWTYPE;
begin
--open pch_MTZExtRel;
for row_MTZExtRel in  pch_MTZExtRel loop
 MTZExtRel_SINIT( acursession,row_MTZExtRel.id,assid);
 MTZExtRel_propagate( acursession,row_MTZExtRel.id);
end loop;
--close pch_MTZExtRel;
end;
 end if; 
end;



procedure MTZExt_def_BRIEF  (
 aCURSESSION CHAR,
 aMTZExt_defid CHAR,
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
if aMTZExt_defid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from MTZExt_def where MTZExt_defID=aMTZExt_defID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from MTZExt_def where MTZExt_defid=aMTZExt_defID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=MTZExt_def');
    return;
  end if;
  aBRIEF:=func.MTZExt_def_BRIEF_F(aMTZExt_defid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure MTZExt_def_DELETE /*Список зарегистрированных расширений*/ (
 aCURSESSION CHAR,
 aMTZExt_defid CHAR,
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
select count(*) into existsCnt from MTZExt_def where MTZExt_defID=aMTZExt_defID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from MTZExt_def where MTZExt_defid=aMTZExt_defID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:MTZExt_def',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=MTZExt_def');
      return;
    end if;
  end if;
 --  verify lock  --
 MTZExt_def_ISLOCKED( acursession=>acursession,aROWID=>aMTZExt_defid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=MTZExt_def');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'MTZExt_def',
 aVERB=>'DELETEROW',  aThe_Resource=>aMTZExt_defid, aLogInstanceID=>aInstanceID);
declare cursor chld_MTZExt_def is select  instanceid ID from instance where OwnerPartName ='MTZExt_def' and OwnerRowID=aMTZExt_defid;
row_MTZExt_def  chld_MTZExt_def%ROWTYPE;
begin
--open chld_MTZExt_def;
for row_MTZExt_def in chld_MTZExt_def loop
 Kernel.INSTANCE_OWNER (acursession,row_MTZExt_def.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_MTZExt_def.id);
end loop;
--close chld_MTZExt_def;
end ;
  delete from  MTZExt_def 
  where  MTZExt_defID = aMTZExt_defID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Описание*/
procedure MTZExt_def_SAVE /*Список зарегистрированных расширений*/ (
 aCURSESSION CHAR,
 aMTZExt_defid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aExtType
 NUMBER/* Тип расширения *//* Тип расширения */
,aTheDescription VARCHAR2 := null /* Описание *//* Описание */
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
select count(*) into existsCnt from MTZExt_def where MTZExt_defID=aMTZExt_defID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from MTZExt_def where MTZExt_defid=aMTZExt_defID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:MTZExt_def',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=MTZExt_def');
      return;
    end if;
  end if;
 --  verify lock  --
 MTZExt_def_ISLOCKED( acursession=>acursession,aROWID=>aMTZExt_defid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=MTZExt_def');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'MTZExt_def',
 aVERB=>'EDITROW',  aThe_Resource=>aMTZExt_defid,aLogInstanceID=>aInstanceID);
 update  MTZExt_def set ChangeStamp=sysdate
,
  Name=aName
,
  ExtType=aExtType
,
  TheDescription=aTheDescription
  where  MTZExt_defID = aMTZExt_defID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:MTZExt_def',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=MTZExt_def');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=MTZExt_def');
    return;
  end if;
select Count(*) into existsCnt from MTZExt_def where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <MTZExt_def>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'MTZExt_def',
 aVERB=>'CREATEROW',  aThe_Resource=>aMTZExt_defid,aLogInstanceID=>aInstanceID);
 insert into   MTZExt_def
 (  MTZExt_defID 
,InstanceID
,Name

,ExtType

,TheDescription

 ) values ( aMTZExt_defID 
,aInstanceID
,aName

,aExtType

,aTheDescription

 ); 
 MTZExt_def_SINIT( aCURSESSION,aMTZExt_defid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure MTZExt_def_PARENT /*Список зарегистрированных расширений*/ (
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
  select  INSTANCEID into aParentID from MTZExt_def where  MTZExt_defid=aRowID;
 end; 


procedure MTZExt_def_ISLOCKED /*Список зарегистрированных расширений*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from MTZExt_def where MTZExt_defid=aRowID;
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
  MTZExt_def_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZExt.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure MTZExt_def_LOCK /*Список зарегистрированных расширений*/ (
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
 MTZExt_def_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  MTZExt_def_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from MTZExt_def where MTZExt_defid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=MTZExt_def');
    return;
  end if;
   if  aLockMode =2  
   then   
    update MTZExt_def set LockUserID =auserID ,LockSessionID =null where MTZExt_defid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update MTZExt_def set LockUserID =null,LockSessionID =aCURSESSION  where MTZExt_defid=aRowID;
     return;
   end if;
 end ;


procedure MTZExt_def_HCL /*Список зарегистрированных расширений*/ (
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


procedure MTZExt_def_UNLOCK /*Список зарегистрированных расширений*/ (
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
 MTZExt_def_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update MTZExt_def set LockUserID =null  where MTZExt_defid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update MTZExt_def set LockSessionID =null  where MTZExt_defid=aRowID;
     return;
   end if;
 end; 


procedure MTZExt_def_SINIT /*Список зарегистрированных расширений*/ (
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
 select  SecurityStyleID into atmpID from MTZExt_def where MTZExt_defid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =MTZExt_def');
    return;
  end if;
if aSecurityStyleID is null then
 MTZExt_def_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update MTZExt_def set securitystyleid =aStyleID where MTZExt_defid = aRowID;
else 
 update MTZExt_def set securitystyleid =aSecurityStyleID where MTZExt_defid = aRowID;
end if; 
end ; 


procedure MTZExt_def_propagate /*Список зарегистрированных расширений*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from MTZExt_def where MTZExt_defid=aRowid;
end;



procedure MTZExtRel_BRIEF  (
 aCURSESSION CHAR,
 aMTZExtRelid CHAR,
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
if aMTZExtRelid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from MTZExtRel where MTZExtRelID=aMTZExtRelID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from MTZExtRel where MTZExtRelid=aMTZExtRelID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=MTZExtRel');
    return;
  end if;
  aBRIEF:=func.MTZExtRel_BRIEF_F(aMTZExtRelid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure MTZExtRel_DELETE /*Реализации расширения для разных разработческих плаформ*/ (
 aCURSESSION CHAR,
 aMTZExtRelid CHAR,
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
select count(*) into existsCnt from MTZExtRel where MTZExtRelID=aMTZExtRelID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from MTZExtRel where MTZExtRelid=aMTZExtRelID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:MTZExtRel',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=MTZExtRel');
      return;
    end if;
  end if;
 --  verify lock  --
 MTZExtRel_ISLOCKED( acursession=>acursession,aROWID=>aMTZExtRelid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=MTZExtRel');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'MTZExtRel',
 aVERB=>'DELETEROW',  aThe_Resource=>aMTZExtRelid, aLogInstanceID=>aInstanceID);
declare cursor chld_MTZExtRel is select  instanceid ID from instance where OwnerPartName ='MTZExtRel' and OwnerRowID=aMTZExtRelid;
row_MTZExtRel  chld_MTZExtRel%ROWTYPE;
begin
--open chld_MTZExtRel;
for row_MTZExtRel in chld_MTZExtRel loop
 Kernel.INSTANCE_OWNER (acursession,row_MTZExtRel.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_MTZExtRel.id);
end loop;
--close chld_MTZExtRel;
end ;
  delete from  MTZExtRel 
  where  MTZExtRelID = aMTZExtRelID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Реализации расширения*/
procedure MTZExtRel_SAVE /*Реализации расширения для разных разработческих плаформ*/ (
 aCURSESSION CHAR,
 aMTZExtRelid CHAR,
aInstanceID CHAR 
,aThePlatform
 NUMBER/* Реализация *//* Реализация */
,aTheClassName
 VARCHAR2/* Название класса *//* Название класса */
,aTheLibraryName
 VARCHAR2 := null /* Название библиотеки *//* Название библиотеки */
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
select count(*) into existsCnt from MTZExtRel where MTZExtRelID=aMTZExtRelID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from MTZExtRel where MTZExtRelid=aMTZExtRelID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:MTZExtRel',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=MTZExtRel');
      return;
    end if;
  end if;
 --  verify lock  --
 MTZExtRel_ISLOCKED( acursession=>acursession,aROWID=>aMTZExtRelid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=MTZExtRel');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'MTZExtRel',
 aVERB=>'EDITROW',  aThe_Resource=>aMTZExtRelid,aLogInstanceID=>aInstanceID);
 update  MTZExtRel set ChangeStamp=sysdate
,
  ThePlatform=aThePlatform
,
  TheClassName=aTheClassName
,
  TheLibraryName=aTheLibraryName
  where  MTZExtRelID = aMTZExtRelID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:MTZExtRel',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=MTZExtRel');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=MTZExtRel');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'MTZExtRel',
 aVERB=>'CREATEROW',  aThe_Resource=>aMTZExtRelid,aLogInstanceID=>aInstanceID);
 insert into   MTZExtRel
 (  MTZExtRelID 
,InstanceID
,ThePlatform

,TheClassName

,TheLibraryName

 ) values ( aMTZExtRelID 
,aInstanceID
,aThePlatform

,aTheClassName

,aTheLibraryName

 ); 
 MTZExtRel_SINIT( aCURSESSION,aMTZExtRelid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure MTZExtRel_PARENT /*Реализации расширения для разных разработческих плаформ*/ (
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
  select  INSTANCEID into aParentID from MTZExtRel where  MTZExtRelid=aRowID;
 end; 


procedure MTZExtRel_ISLOCKED /*Реализации расширения для разных разработческих плаформ*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from MTZExtRel where MTZExtRelid=aRowID;
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
  MTZExtRel_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZExt.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure MTZExtRel_LOCK /*Реализации расширения для разных разработческих плаформ*/ (
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
 MTZExtRel_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  MTZExtRel_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from MTZExtRel where MTZExtRelid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=MTZExtRel');
    return;
  end if;
   if  aLockMode =2  
   then   
    update MTZExtRel set LockUserID =auserID ,LockSessionID =null where MTZExtRelid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update MTZExtRel set LockUserID =null,LockSessionID =aCURSESSION  where MTZExtRelid=aRowID;
     return;
   end if;
 end ;


procedure MTZExtRel_HCL /*Реализации расширения для разных разработческих плаформ*/ (
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


procedure MTZExtRel_UNLOCK /*Реализации расширения для разных разработческих плаформ*/ (
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
 MTZExtRel_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update MTZExtRel set LockUserID =null  where MTZExtRelid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update MTZExtRel set LockSessionID =null  where MTZExtRelid=aRowID;
     return;
   end if;
 end; 


procedure MTZExtRel_SINIT /*Реализации расширения для разных разработческих плаформ*/ (
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
 select  SecurityStyleID into atmpID from MTZExtRel where MTZExtRelid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =MTZExtRel');
    return;
  end if;
if aSecurityStyleID is null then
 MTZExtRel_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update MTZExtRel set securitystyleid =aStyleID where MTZExtRelid = aRowID;
else 
 update MTZExtRel set securitystyleid =aSecurityStyleID where MTZExtRelid = aRowID;
end if; 
end ; 


procedure MTZExtRel_propagate /*Реализации расширения для разных разработческих плаформ*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from MTZExtRel where MTZExtRelid=aRowid;
end;


end MTZExt;

/



