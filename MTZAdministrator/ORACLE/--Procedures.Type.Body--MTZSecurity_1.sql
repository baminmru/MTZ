
/* --MTZSecurity*/

 create or replace package body MTZSecurity as

procedure MTZSecurity_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='MTZSecurity'
then
declare cursor child_MTZSEC_RIGHT is select MTZSEC_RIGHT.MTZSEC_RIGHTid ID from MTZSEC_RIGHT where  MTZSEC_RIGHT.InstanceID = ainstanceid;
row_MTZSEC_RIGHT  child_MTZSEC_RIGHT%ROWTYPE;
begin
--open child_MTZSEC_RIGHT;
for row_MTZSEC_RIGHT in child_MTZSEC_RIGHT loop
 MTZSEC_RIGHT_DELETE (acursession,row_MTZSEC_RIGHT.id,aInstanceID);
end loop;
--close child_MTZSEC_RIGHT;
end;
return;
<<del_error>>
return;
end if;
end;
procedure MTZSecurity_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'MTZSecurity'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_MTZSEC_RIGHT is select MTZSEC_RIGHT.MTZSEC_RIGHTid ID from MTZSEC_RIGHT where  MTZSEC_RIGHT.InstanceID = arowid;
ROW_MTZSEC_RIGHT  lch_MTZSEC_RIGHT%ROWTYPE;
begin
--open lch_MTZSEC_RIGHT;
for row_MTZSEC_RIGHT in lch_MTZSEC_RIGHT loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from MTZSEC_RIGHT where MTZSEC_RIGHTid=row_MTZSEC_RIGHT.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_MTZSEC_RIGHT;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_MTZSEC_RIGHT;
     return;
   end if; 
 end if; 
 MTZSEC_RIGHT_HCL (acursession,ROW_MTZSEC_RIGHT.id,aisLocked);
 if aisLocked >2 then
   close lch_MTZSEC_RIGHT;
   return;
 end if;
 end loop;
--close lch_MTZSEC_RIGHT;
end;
 end if;
aIsLocked:=0;
end;
procedure MTZSecurity_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'MTZSecurity'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_MTZSEC_RIGHT is select MTZSEC_RIGHT.MTZSEC_RIGHTid id from MTZSEC_RIGHT where  MTZSEC_RIGHT.InstanceID = arowid;
row_MTZSEC_RIGHT  pch_MTZSEC_RIGHT%ROWTYPE;
begin
--open pch_MTZSEC_RIGHT;
for row_MTZSEC_RIGHT in  pch_MTZSEC_RIGHT loop
 MTZSEC_RIGHT_SINIT( acursession,row_MTZSEC_RIGHT.id,assid);
 MTZSEC_RIGHT_propagate( acursession,row_MTZSEC_RIGHT.id);
end loop;
--close pch_MTZSEC_RIGHT;
end;
 end if; 
end;



procedure MTZSEC_RIGHT_BRIEF  (
 aCURSESSION CHAR,
 aMTZSEC_RIGHTid CHAR,
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
if aMTZSEC_RIGHTid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from MTZSEC_RIGHT where MTZSEC_RIGHTID=aMTZSEC_RIGHTID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from MTZSEC_RIGHT where MTZSEC_RIGHTid=aMTZSEC_RIGHTID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=MTZSEC_RIGHT');
    return;
  end if;
  aBRIEF:=func.MTZSEC_RIGHT_BRIEF_F(aMTZSEC_RIGHTid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure MTZSEC_RIGHT_DELETE /*описание прав для каждой группы*/ (
 aCURSESSION CHAR,
 aMTZSEC_RIGHTid CHAR,
 ainstanceid char
) as 
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
select count(*) into existsCnt from MTZSEC_RIGHT where MTZSEC_RIGHTID=aMTZSEC_RIGHTID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from MTZSEC_RIGHT where MTZSEC_RIGHTid=aMTZSEC_RIGHTID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:MTZSEC_RIGHT',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=MTZSEC_RIGHT');
      return;
    end if;
  end if;
 --  verify lock  --
 MTZSEC_RIGHT_ISLOCKED( acursession=>acursession,aROWID=>aMTZSEC_RIGHTid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=MTZSEC_RIGHT');
    return;
  end if;
  --begin tran--  
 -- erase child items --
declare cursor chld_MTZSEC_RIGHT is select  instanceid ID from instance where OwnerPartName ='MTZSEC_RIGHT' and OwnerRowID=aMTZSEC_RIGHTid;
row_MTZSEC_RIGHT  chld_MTZSEC_RIGHT%ROWTYPE;
begin
--open chld_MTZSEC_RIGHT;
for row_MTZSEC_RIGHT in chld_MTZSEC_RIGHT loop
 Kernel.INSTANCE_OWNER (acursession,row_MTZSEC_RIGHT.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_MTZSEC_RIGHT.id);
end loop;
--close chld_MTZSEC_RIGHT;
end ;
  delete from  MTZSEC_RIGHT 
  where  MTZSEC_RIGHTID = aMTZSEC_RIGHTID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Описание прав*/
procedure MTZSEC_RIGHT_SAVE /*описание прав для каждой группы*/ (
 aCURSESSION CHAR,
 aMTZSEC_RIGHTid CHAR,
aInstanceID CHAR 
,aPiority
 NUMBER/* Приоритет *//* Приоритет */
,aTheGroup CHAR/* Группа *//* Группа */
,aProtectedItem
 VARCHAR2/* Защищаемый элемент *//* Защищаемый элемент */
,aAllow
 NUMBER/* Разрешение *//* Разрешение */
) as 
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
select count(*) into existsCnt from MTZSEC_RIGHT where MTZSEC_RIGHTID=aMTZSEC_RIGHTID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from MTZSEC_RIGHT where MTZSEC_RIGHTid=aMTZSEC_RIGHTID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:MTZSEC_RIGHT',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=MTZSEC_RIGHT');
      return;
    end if;
  end if;
 --  verify lock  --
 MTZSEC_RIGHT_ISLOCKED( acursession=>acursession,aROWID=>aMTZSEC_RIGHTid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=MTZSEC_RIGHT');
    return;
  end if;
 -- update row  --
 update  MTZSEC_RIGHT set ChangeStamp=sysdate
,
  Piority=aPiority
,
  TheGroup=aTheGroup
,
  ProtectedItem=aProtectedItem
,
  Allow=aAllow
  where  MTZSEC_RIGHTID = aMTZSEC_RIGHTID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:MTZSEC_RIGHT',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=MTZSEC_RIGHT');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=MTZSEC_RIGHT');
    return;
  end if;
 insert into   MTZSEC_RIGHT
 (  MTZSEC_RIGHTID 
,InstanceID
,Piority

,TheGroup

,ProtectedItem

,Allow

 ) values ( aMTZSEC_RIGHTID 
,aInstanceID
,aPiority

,aTheGroup

,aProtectedItem

,aAllow

 ); 
 MTZSEC_RIGHT_SINIT( aCURSESSION,aMTZSEC_RIGHTid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure MTZSEC_RIGHT_PARENT /*описание прав для каждой группы*/ (
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
  select  INSTANCEID into aParentID from MTZSEC_RIGHT where  MTZSEC_RIGHTid=aRowID;
 end; 


procedure MTZSEC_RIGHT_ISLOCKED /*описание прав для каждой группы*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from MTZSEC_RIGHT where MTZSEC_RIGHTid=aRowID;
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
  MTZSEC_RIGHT_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZSecurity.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure MTZSEC_RIGHT_LOCK /*описание прав для каждой группы*/ (
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
 MTZSEC_RIGHT_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  MTZSEC_RIGHT_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from MTZSEC_RIGHT where MTZSEC_RIGHTid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=MTZSEC_RIGHT');
    return;
  end if;
   if  aLockMode =2  
   then   
    update MTZSEC_RIGHT set LockUserID =auserID ,LockSessionID =null where MTZSEC_RIGHTid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update MTZSEC_RIGHT set LockUserID =null,LockSessionID =aCURSESSION  where MTZSEC_RIGHTid=aRowID;
     return;
   end if;
 end ;


procedure MTZSEC_RIGHT_HCL /*описание прав для каждой группы*/ (
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


procedure MTZSEC_RIGHT_UNLOCK /*описание прав для каждой группы*/ (
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
 MTZSEC_RIGHT_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update MTZSEC_RIGHT set LockUserID =null  where MTZSEC_RIGHTid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update MTZSEC_RIGHT set LockSessionID =null  where MTZSEC_RIGHTid=aRowID;
     return;
   end if;
 end; 


procedure MTZSEC_RIGHT_SINIT /*описание прав для каждой группы*/ (
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
 select  SecurityStyleID into atmpID from MTZSEC_RIGHT where MTZSEC_RIGHTid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =MTZSEC_RIGHT');
    return;
  end if;
if aSecurityStyleID is null then
 MTZSEC_RIGHT_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update MTZSEC_RIGHT set securitystyleid =aStyleID where MTZSEC_RIGHTid = aRowID;
else 
 update MTZSEC_RIGHT set securitystyleid =aSecurityStyleID where MTZSEC_RIGHTid = aRowID;
end if; 
end ; 


procedure MTZSEC_RIGHT_propagate /*описание прав для каждой группы*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from MTZSEC_RIGHT where MTZSEC_RIGHTid=aRowid;
end;


end MTZSecurity;

/



