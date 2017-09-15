
/* --VRRPT*/

 create or replace package body VRRPT as

procedure VRRPT_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='VRRPT'
then
declare cursor child_VRRPT_COSTS is select VRRPT_COSTS.VRRPT_COSTSid ID from VRRPT_COSTS where  VRRPT_COSTS.InstanceID = ainstanceid;
row_VRRPT_COSTS  child_VRRPT_COSTS%ROWTYPE;
begin
--open child_VRRPT_COSTS;
for row_VRRPT_COSTS in child_VRRPT_COSTS loop
 VRRPT_COSTS_DELETE (acursession,row_VRRPT_COSTS.id,aInstanceID);
end loop;
--close child_VRRPT_COSTS;
end;
declare cursor child_VRRPT_MeetingPlan is select VRRPT_MeetingPlan.VRRPT_MeetingPlanid ID from VRRPT_MeetingPlan where  VRRPT_MeetingPlan.InstanceID = ainstanceid;
row_VRRPT_MeetingPlan  child_VRRPT_MeetingPlan%ROWTYPE;
begin
--open child_VRRPT_MeetingPlan;
for row_VRRPT_MeetingPlan in child_VRRPT_MeetingPlan loop
 VRRPT_MeetingPlan_DELETE (acursession,row_VRRPT_MeetingPlan.id,aInstanceID);
end loop;
--close child_VRRPT_MeetingPlan;
end;
declare cursor child_VRRPT_MAIN is select VRRPT_MAIN.VRRPT_MAINid ID from VRRPT_MAIN where  VRRPT_MAIN.InstanceID = ainstanceid;
row_VRRPT_MAIN  child_VRRPT_MAIN%ROWTYPE;
begin
--open child_VRRPT_MAIN;
for row_VRRPT_MAIN in child_VRRPT_MAIN loop
 VRRPT_MAIN_DELETE (acursession,row_VRRPT_MAIN.id,aInstanceID);
end loop;
--close child_VRRPT_MAIN;
end;
return;
<<del_error>>
return;
end if;
end;
procedure VRRPT_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'VRRPT'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_VRRPT_COSTS is select VRRPT_COSTS.VRRPT_COSTSid ID from VRRPT_COSTS where  VRRPT_COSTS.InstanceID = arowid;
ROW_VRRPT_COSTS  lch_VRRPT_COSTS%ROWTYPE;
begin
--open lch_VRRPT_COSTS;
for row_VRRPT_COSTS in lch_VRRPT_COSTS loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRRPT_COSTS where VRRPT_COSTSid=row_VRRPT_COSTS.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRRPT_COSTS;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRRPT_COSTS;
     return;
   end if; 
 end if; 
 VRRPT_COSTS_HCL (acursession,ROW_VRRPT_COSTS.id,aisLocked);
 if aisLocked >2 then
   close lch_VRRPT_COSTS;
   return;
 end if;
 end loop;
--close lch_VRRPT_COSTS;
end;
declare cursor lch_VRRPT_MeetingPlan is select VRRPT_MeetingPlan.VRRPT_MeetingPlanid ID from VRRPT_MeetingPlan where  VRRPT_MeetingPlan.InstanceID = arowid;
ROW_VRRPT_MeetingPlan  lch_VRRPT_MeetingPlan%ROWTYPE;
begin
--open lch_VRRPT_MeetingPlan;
for row_VRRPT_MeetingPlan in lch_VRRPT_MeetingPlan loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRRPT_MeetingPlan where VRRPT_MeetingPlanid=row_VRRPT_MeetingPlan.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRRPT_MeetingPlan;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRRPT_MeetingPlan;
     return;
   end if; 
 end if; 
 VRRPT_MeetingPlan_HCL (acursession,ROW_VRRPT_MeetingPlan.id,aisLocked);
 if aisLocked >2 then
   close lch_VRRPT_MeetingPlan;
   return;
 end if;
 end loop;
--close lch_VRRPT_MeetingPlan;
end;
declare cursor lch_VRRPT_MAIN is select VRRPT_MAIN.VRRPT_MAINid ID from VRRPT_MAIN where  VRRPT_MAIN.InstanceID = arowid;
ROW_VRRPT_MAIN  lch_VRRPT_MAIN%ROWTYPE;
begin
--open lch_VRRPT_MAIN;
for row_VRRPT_MAIN in lch_VRRPT_MAIN loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRRPT_MAIN where VRRPT_MAINid=row_VRRPT_MAIN.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRRPT_MAIN;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRRPT_MAIN;
     return;
   end if; 
 end if; 
 VRRPT_MAIN_HCL (acursession,ROW_VRRPT_MAIN.id,aisLocked);
 if aisLocked >2 then
   close lch_VRRPT_MAIN;
   return;
 end if;
 end loop;
--close lch_VRRPT_MAIN;
end;
 end if;
aIsLocked:=0;
end;
procedure VRRPT_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'VRRPT'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_VRRPT_COSTS is select VRRPT_COSTS.VRRPT_COSTSid id from VRRPT_COSTS where  VRRPT_COSTS.InstanceID = arowid;
row_VRRPT_COSTS  pch_VRRPT_COSTS%ROWTYPE;
begin
--open pch_VRRPT_COSTS;
for row_VRRPT_COSTS in  pch_VRRPT_COSTS loop
 VRRPT_COSTS_SINIT( acursession,row_VRRPT_COSTS.id,assid);
 VRRPT_COSTS_propagate( acursession,row_VRRPT_COSTS.id);
end loop;
--close pch_VRRPT_COSTS;
end;
declare cursor pch_VRRPT_MeetingPlan is select VRRPT_MeetingPlan.VRRPT_MeetingPlanid id from VRRPT_MeetingPlan where  VRRPT_MeetingPlan.InstanceID = arowid;
row_VRRPT_MeetingPlan  pch_VRRPT_MeetingPlan%ROWTYPE;
begin
--open pch_VRRPT_MeetingPlan;
for row_VRRPT_MeetingPlan in  pch_VRRPT_MeetingPlan loop
 VRRPT_MeetingPlan_SINIT( acursession,row_VRRPT_MeetingPlan.id,assid);
 VRRPT_MeetingPlan_propagate( acursession,row_VRRPT_MeetingPlan.id);
end loop;
--close pch_VRRPT_MeetingPlan;
end;
declare cursor pch_VRRPT_MAIN is select VRRPT_MAIN.VRRPT_MAINid id from VRRPT_MAIN where  VRRPT_MAIN.InstanceID = arowid;
row_VRRPT_MAIN  pch_VRRPT_MAIN%ROWTYPE;
begin
--open pch_VRRPT_MAIN;
for row_VRRPT_MAIN in  pch_VRRPT_MAIN loop
 VRRPT_MAIN_SINIT( acursession,row_VRRPT_MAIN.id,assid);
 VRRPT_MAIN_propagate( acursession,row_VRRPT_MAIN.id);
end loop;
--close pch_VRRPT_MAIN;
end;
 end if; 
end;



procedure VRRPT_COSTS_BRIEF  (
 aCURSESSION CHAR,
 aVRRPT_COSTSid CHAR,
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
if aVRRPT_COSTSid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRRPT_COSTS where VRRPT_COSTSID=aVRRPT_COSTSID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRRPT_COSTS where VRRPT_COSTSid=aVRRPT_COSTSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRRPT_COSTS');
    return;
  end if;
  aBRIEF:=func.VRRPT_COSTS_BRIEF_F(aVRRPT_COSTSid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRRPT_COSTS_DELETE /*Затраты*/ (
 aCURSESSION CHAR,
 aVRRPT_COSTSid CHAR,
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
select count(*) into existsCnt from VRRPT_COSTS where VRRPT_COSTSID=aVRRPT_COSTSID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRRPT_COSTS where VRRPT_COSTSid=aVRRPT_COSTSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRRPT_COSTS',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRRPT_COSTS');
      return;
    end if;
  end if;
 --  verify lock  --
 VRRPT_COSTS_ISLOCKED( acursession=>acursession,aROWID=>aVRRPT_COSTSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRRPT_COSTS');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRRPT_COSTS',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRRPT_COSTSid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRRPT_COSTS is select  instanceid ID from instance where OwnerPartName ='VRRPT_COSTS' and OwnerRowID=aVRRPT_COSTSid;
row_VRRPT_COSTS  chld_VRRPT_COSTS%ROWTYPE;
begin
--open chld_VRRPT_COSTS;
for row_VRRPT_COSTS in chld_VRRPT_COSTS loop
 Kernel.INSTANCE_OWNER (acursession,row_VRRPT_COSTS.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRRPT_COSTS.id);
end loop;
--close chld_VRRPT_COSTS;
end ;
  delete from  VRRPT_COSTS 
  where  VRRPT_COSTSID = aVRRPT_COSTSID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Затраты*/
procedure VRRPT_COSTS_SAVE /*Затраты*/ (
 aCURSESSION CHAR,
 aVRRPT_COSTSid CHAR,
aInstanceID CHAR 
,aDescrtiption VARCHAR2/* Описание *//* Описание */
,aCost
 NUMBER := null /* Стоимость *//* Стоимость */
,aDuration
 NUMBER := null /* Длительность (час.) *//* Длительность (час.) */
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
select count(*) into existsCnt from VRRPT_COSTS where VRRPT_COSTSID=aVRRPT_COSTSID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRRPT_COSTS where VRRPT_COSTSid=aVRRPT_COSTSID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRRPT_COSTS',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRRPT_COSTS');
      return;
    end if;
  end if;
 --  verify lock  --
 VRRPT_COSTS_ISLOCKED( acursession=>acursession,aROWID=>aVRRPT_COSTSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRRPT_COSTS');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRRPT_COSTS',
 aVERB=>'EDITROW',  aThe_Resource=>aVRRPT_COSTSid,aLogInstanceID=>aInstanceID);
 update  VRRPT_COSTS set ChangeStamp=sysdate
,
  Descrtiption=aDescrtiption
,
  Cost=aCost
,
  Duration=aDuration
  where  VRRPT_COSTSID = aVRRPT_COSTSID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRRPT_COSTS',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRRPT_COSTS');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRRPT_COSTS');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRRPT_COSTS',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRRPT_COSTSid,aLogInstanceID=>aInstanceID);
 insert into   VRRPT_COSTS
 (  VRRPT_COSTSID 
,InstanceID
,Descrtiption

,Cost

,Duration

 ) values ( aVRRPT_COSTSID 
,aInstanceID
,aDescrtiption

,aCost

,aDuration

 ); 
 VRRPT_COSTS_SINIT( aCURSESSION,aVRRPT_COSTSid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRRPT_COSTS_PARENT /*Затраты*/ (
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
  select  INSTANCEID into aParentID from VRRPT_COSTS where  VRRPT_COSTSid=aRowID;
 end; 


procedure VRRPT_COSTS_ISLOCKED /*Затраты*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRRPT_COSTS where VRRPT_COSTSid=aRowID;
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
  VRRPT_COSTS_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRRPT.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRRPT_COSTS_LOCK /*Затраты*/ (
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
 VRRPT_COSTS_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRRPT_COSTS_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRRPT_COSTS where VRRPT_COSTSid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRRPT_COSTS');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRRPT_COSTS set LockUserID =auserID ,LockSessionID =null where VRRPT_COSTSid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRRPT_COSTS set LockUserID =null,LockSessionID =aCURSESSION  where VRRPT_COSTSid=aRowID;
     return;
   end if;
 end ;


procedure VRRPT_COSTS_HCL /*Затраты*/ (
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


procedure VRRPT_COSTS_UNLOCK /*Затраты*/ (
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
 VRRPT_COSTS_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRRPT_COSTS set LockUserID =null  where VRRPT_COSTSid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRRPT_COSTS set LockSessionID =null  where VRRPT_COSTSid=aRowID;
     return;
   end if;
 end; 


procedure VRRPT_COSTS_SINIT /*Затраты*/ (
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
 select  SecurityStyleID into atmpID from VRRPT_COSTS where VRRPT_COSTSid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRRPT_COSTS');
    return;
  end if;
if aSecurityStyleID is null then
 VRRPT_COSTS_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRRPT_COSTS set securitystyleid =aStyleID where VRRPT_COSTSid = aRowID;
else 
 update VRRPT_COSTS set securitystyleid =aSecurityStyleID where VRRPT_COSTSid = aRowID;
end if; 
end ; 


procedure VRRPT_COSTS_propagate /*Затраты*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRRPT_COSTS where VRRPT_COSTSid=aRowid;
end;



procedure VRRPT_MeetingPlan_BRIEF  (
 aCURSESSION CHAR,
 aVRRPT_MeetingPlanid CHAR,
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
if aVRRPT_MeetingPlanid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRRPT_MeetingPlan where VRRPT_MeetingPlanID=aVRRPT_MeetingPlanID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRRPT_MeetingPlan where VRRPT_MeetingPlanid=aVRRPT_MeetingPlanID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRRPT_MeetingPlan');
    return;
  end if;
  aBRIEF:=func.VRRPT_MeetingPlan_BRIEF_F(aVRRPT_MeetingPlanid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRRPT_MeetingPlan_DELETE /*Планируемые встречи*/ (
 aCURSESSION CHAR,
 aVRRPT_MeetingPlanid CHAR,
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
select count(*) into existsCnt from VRRPT_MeetingPlan where VRRPT_MeetingPlanID=aVRRPT_MeetingPlanID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRRPT_MeetingPlan where VRRPT_MeetingPlanid=aVRRPT_MeetingPlanID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRRPT_MeetingPlan',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRRPT_MeetingPlan');
      return;
    end if;
  end if;
 --  verify lock  --
 VRRPT_MeetingPlan_ISLOCKED( acursession=>acursession,aROWID=>aVRRPT_MeetingPlanid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRRPT_MeetingPlan');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_VRRPT_Meeters is select VRRPT_Meeters.VRRPT_Meetersid ID from VRRPT_Meeters where  VRRPT_Meeters.ParentStructRowID = aVRRPT_MeetingPlanid;
    child_VRRPT_Meeters_rec  child_VRRPT_Meeters%ROWTYPE;
    begin
    --open child_VRRPT_Meeters;
      for child_VRRPT_Meeters_rec in child_VRRPT_Meeters loop
      VRRPT_Meeters_DELETE (acursession,child_VRRPT_Meeters_rec.id,aInstanceid);
      end loop;
      --close child_VRRPT_Meeters;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRRPT_MeetingPlan',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRRPT_MeetingPlanid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRRPT_MeetingPlan is select  instanceid ID from instance where OwnerPartName ='VRRPT_MeetingPlan' and OwnerRowID=aVRRPT_MeetingPlanid;
row_VRRPT_MeetingPlan  chld_VRRPT_MeetingPlan%ROWTYPE;
begin
--open chld_VRRPT_MeetingPlan;
for row_VRRPT_MeetingPlan in chld_VRRPT_MeetingPlan loop
 Kernel.INSTANCE_OWNER (acursession,row_VRRPT_MeetingPlan.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRRPT_MeetingPlan.id);
end loop;
--close chld_VRRPT_MeetingPlan;
end ;
  delete from  VRRPT_MeetingPlan 
  where  VRRPT_MeetingPlanID = aVRRPT_MeetingPlanID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Планируемые встречи*/
procedure VRRPT_MeetingPlan_SAVE /*Планируемые встречи*/ (
 aCURSESSION CHAR,
 aVRRPT_MeetingPlanid CHAR,
aInstanceID CHAR 
,aDateOF
 DATE/* Время встречи *//* Время встречи */
,aPlaceOf VARCHAR2/* Место проведения *//* Место проведения */
,atheme VARCHAR2/* Тема *//* Тема */
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
select count(*) into existsCnt from VRRPT_MeetingPlan where VRRPT_MeetingPlanID=aVRRPT_MeetingPlanID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRRPT_MeetingPlan where VRRPT_MeetingPlanid=aVRRPT_MeetingPlanID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRRPT_MeetingPlan',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRRPT_MeetingPlan');
      return;
    end if;
  end if;
 --  verify lock  --
 VRRPT_MeetingPlan_ISLOCKED( acursession=>acursession,aROWID=>aVRRPT_MeetingPlanid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRRPT_MeetingPlan');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRRPT_MeetingPlan',
 aVERB=>'EDITROW',  aThe_Resource=>aVRRPT_MeetingPlanid,aLogInstanceID=>aInstanceID);
 update  VRRPT_MeetingPlan set ChangeStamp=sysdate
,
  DateOF=aDateOF
,
  PlaceOf=aPlaceOf
,
  theme=atheme
  where  VRRPT_MeetingPlanID = aVRRPT_MeetingPlanID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRRPT_MeetingPlan',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRRPT_MeetingPlan');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRRPT_MeetingPlan');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRRPT_MeetingPlan',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRRPT_MeetingPlanid,aLogInstanceID=>aInstanceID);
 insert into   VRRPT_MeetingPlan
 (  VRRPT_MeetingPlanID 
,InstanceID
,DateOF

,PlaceOf

,theme

 ) values ( aVRRPT_MeetingPlanID 
,aInstanceID
,aDateOF

,aPlaceOf

,atheme

 ); 
 VRRPT_MeetingPlan_SINIT( aCURSESSION,aVRRPT_MeetingPlanid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRRPT_MeetingPlan_PARENT /*Планируемые встречи*/ (
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
  select  INSTANCEID into aParentID from VRRPT_MeetingPlan where  VRRPT_MeetingPlanid=aRowID;
 end; 


procedure VRRPT_MeetingPlan_ISLOCKED /*Планируемые встречи*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRRPT_MeetingPlan where VRRPT_MeetingPlanid=aRowID;
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
  VRRPT_MeetingPlan_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRRPT.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRRPT_MeetingPlan_LOCK /*Планируемые встречи*/ (
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
 VRRPT_MeetingPlan_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRRPT_MeetingPlan_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRRPT_MeetingPlan where VRRPT_MeetingPlanid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRRPT_MeetingPlan');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRRPT_MeetingPlan set LockUserID =auserID ,LockSessionID =null where VRRPT_MeetingPlanid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRRPT_MeetingPlan set LockUserID =null,LockSessionID =aCURSESSION  where VRRPT_MeetingPlanid=aRowID;
     return;
   end if;
 end ;


procedure VRRPT_MeetingPlan_HCL /*Планируемые встречи*/ (
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
declare cursor lch_VRRPT_Meeters is select VRRPT_Meeters.VRRPT_Meetersid ID from VRRPT_Meeters where  VRRPT_Meeters.ParentStructRowID = aRowid;
row_VRRPT_Meeters lch_VRRPT_Meeters%ROWTYPE;
begin  
--open lch_VRRPT_Meeters;
for row_VRRPT_Meeters in lch_VRRPT_Meeters
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from VRRPT_Meeters where VRRPT_Meetersid=row_VRRPT_Meeters.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRRPT_Meeters;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_VRRPT_Meeters;
     return;
   end if; 
 end if;  
 VRRPT_Meeters_HCL (acursession,row_VRRPT_Meeters.id,aisLocked);
 if aisLocked >2 then
   close lch_VRRPT_Meeters;
   return;
 end if;
end loop;
--close lch_VRRPT_Meeters;
end;
aIsLocked :=0;
end;


procedure VRRPT_MeetingPlan_UNLOCK /*Планируемые встречи*/ (
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
 VRRPT_MeetingPlan_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRRPT_MeetingPlan set LockUserID =null  where VRRPT_MeetingPlanid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRRPT_MeetingPlan set LockSessionID =null  where VRRPT_MeetingPlanid=aRowID;
     return;
   end if;
 end; 


procedure VRRPT_MeetingPlan_SINIT /*Планируемые встречи*/ (
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
 select  SecurityStyleID into atmpID from VRRPT_MeetingPlan where VRRPT_MeetingPlanid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRRPT_MeetingPlan');
    return;
  end if;
if aSecurityStyleID is null then
 VRRPT_MeetingPlan_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRRPT_MeetingPlan set securitystyleid =aStyleID where VRRPT_MeetingPlanid = aRowID;
else 
 update VRRPT_MeetingPlan set securitystyleid =aSecurityStyleID where VRRPT_MeetingPlanid = aRowID;
end if; 
end ; 


procedure VRRPT_MeetingPlan_propagate /*Планируемые встречи*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRRPT_MeetingPlan where VRRPT_MeetingPlanid=aRowid;
declare cursor pch_VRRPT_Meeters  is select VRRPT_Meeters.VRRPT_Meetersid ID from VRRPT_Meeters where  VRRPT_Meeters.ParentStructRowID = aRowid;
row_VRRPT_Meeters  pch_VRRPT_Meeters%ROWTYPE;
begin
--open pch_VRRPT_Meeters;
for row_VRRPT_Meeters in pch_VRRPT_Meeters loop
   VRRPT_Meeters_SINIT( acursession,row_VRRPT_Meeters.id,assid);
   VRRPT_Meeters_propagate( acursession,row_VRRPT_Meeters.id);
end loop;
--close pch_VRRPT_Meeters;
end;
end;



procedure VRRPT_Meeters_BRIEF  (
 aCURSESSION CHAR,
 aVRRPT_Meetersid CHAR,
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
if aVRRPT_Meetersid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRRPT_Meeters where VRRPT_MeetersID=aVRRPT_MeetersID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRRPT_Meeters where VRRPT_Meetersid=aVRRPT_MeetersID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRRPT_Meeters');
    return;
  end if;
  aBRIEF:=func.VRRPT_Meeters_BRIEF_F(aVRRPT_Meetersid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRRPT_Meeters_DELETE /*Участники*/ (
 aCURSESSION CHAR,
 aVRRPT_Meetersid CHAR,
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
select count(*) into existsCnt from VRRPT_Meeters where VRRPT_MeetersID=aVRRPT_MeetersID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRRPT_Meeters where VRRPT_Meetersid=aVRRPT_MeetersID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRRPT_Meeters',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRRPT_Meeters');
      return;
    end if;
  end if;
 --  verify lock  --
 VRRPT_Meeters_ISLOCKED( acursession=>acursession,aROWID=>aVRRPT_Meetersid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRRPT_Meeters');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRRPT_Meeters',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRRPT_Meetersid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRRPT_Meeters is select  instanceid ID from instance where OwnerPartName ='VRRPT_Meeters' and OwnerRowID=aVRRPT_Meetersid;
row_VRRPT_Meeters  chld_VRRPT_Meeters%ROWTYPE;
begin
--open chld_VRRPT_Meeters;
for row_VRRPT_Meeters in chld_VRRPT_Meeters loop
 Kernel.INSTANCE_OWNER (acursession,row_VRRPT_Meeters.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRRPT_Meeters.id);
end loop;
--close chld_VRRPT_Meeters;
end ;
  delete from  VRRPT_Meeters 
  where  VRRPT_MeetersID = aVRRPT_MeetersID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Участники*/
procedure VRRPT_Meeters_SAVE /*Участники*/ (
 aCURSESSION CHAR,
 aVRRPT_Meetersid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aWorker CHAR := null /* Сотрудник *//* Сотрудник */
,aContact CHAR := null /* Контактное лицо *//* Контактное лицо */
,aMandatory
 NUMBER/* Обязательно *//* Обязательно */
,aReminderTime
 NUMBER := null /* Оповещать за (час.) *//* Оповещать за (час.) */
,aReminderSent
 NUMBER := null /* Оповещен *//* Оповещен */
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
select count(*) into existsCnt from VRRPT_Meeters where VRRPT_MeetersID=aVRRPT_MeetersID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRRPT_Meeters where VRRPT_Meetersid=aVRRPT_MeetersID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRRPT_Meeters',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRRPT_Meeters');
      return;
    end if;
  end if;
 --  verify lock  --
 VRRPT_Meeters_ISLOCKED( acursession=>acursession,aROWID=>aVRRPT_Meetersid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRRPT_Meeters');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRRPT_Meeters',
 aVERB=>'EDITROW',  aThe_Resource=>aVRRPT_Meetersid,aLogInstanceID=>aInstanceID);
 update  VRRPT_Meeters set ChangeStamp=sysdate
,
  Worker=aWorker
,
  Contact=aContact
,
  Mandatory=aMandatory
,
  ReminderTime=aReminderTime
,
  ReminderSent=aReminderSent
  where  VRRPT_MeetersID = aVRRPT_MeetersID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from VRRPT_MeetingPlan where VRRPT_MeetingPlanid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRRPT_Meeters',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRRPT_Meeters');
      return;
    end if;
 end if;
 VRRPT_MeetingPlan_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRRPT_Meeters');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRRPT_Meeters',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRRPT_Meetersid,aLogInstanceID=>aInstanceID);
 insert into   VRRPT_Meeters
 (  VRRPT_MeetersID 
,ParentStructRowID
,Worker

,Contact

,Mandatory

,ReminderTime

,ReminderSent

 ) values ( aVRRPT_MeetersID 
,aParentStructRowID
,aWorker

,aContact

,aMandatory

,aReminderTime

,aReminderSent

 ); 
 VRRPT_Meeters_SINIT( aCURSESSION,aVRRPT_Meetersid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRRPT_Meeters_PARENT /*Участники*/ (
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
  select ParentStructRowID into aParentID  from VRRPT_Meeters where  VRRPT_Meetersid=aRowID;
  aParentTable := 'VRRPT_MeetingPlan';
 end; 


procedure VRRPT_Meeters_ISLOCKED /*Участники*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRRPT_Meeters where VRRPT_Meetersid=aRowID;
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
  VRRPT_Meeters_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRRPT.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRRPT_Meeters_LOCK /*Участники*/ (
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
 VRRPT_Meeters_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRRPT_Meeters_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRRPT_Meeters where VRRPT_Meetersid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRRPT_Meeters');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRRPT_Meeters set LockUserID =auserID ,LockSessionID =null where VRRPT_Meetersid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRRPT_Meeters set LockUserID =null,LockSessionID =aCURSESSION  where VRRPT_Meetersid=aRowID;
     return;
   end if;
 end ;


procedure VRRPT_Meeters_HCL /*Участники*/ (
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


procedure VRRPT_Meeters_UNLOCK /*Участники*/ (
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
 VRRPT_Meeters_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRRPT_Meeters set LockUserID =null  where VRRPT_Meetersid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRRPT_Meeters set LockSessionID =null  where VRRPT_Meetersid=aRowID;
     return;
   end if;
 end; 


procedure VRRPT_Meeters_SINIT /*Участники*/ (
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
 select  SecurityStyleID into atmpID from VRRPT_Meeters where VRRPT_Meetersid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRRPT_Meeters');
    return;
  end if;
if aSecurityStyleID is null then
 VRRPT_Meeters_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRRPT_Meeters set securitystyleid =aStyleID where VRRPT_Meetersid = aRowID;
else 
 update VRRPT_Meeters set securitystyleid =aSecurityStyleID where VRRPT_Meetersid = aRowID;
end if; 
end ; 


procedure VRRPT_Meeters_propagate /*Участники*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRRPT_Meeters where VRRPT_Meetersid=aRowid;
end;



procedure VRRPT_MAIN_BRIEF  (
 aCURSESSION CHAR,
 aVRRPT_MAINid CHAR,
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
if aVRRPT_MAINid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRRPT_MAIN where VRRPT_MAINID=aVRRPT_MAINID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRRPT_MAIN where VRRPT_MAINid=aVRRPT_MAINID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRRPT_MAIN');
    return;
  end if;
  aBRIEF:=func.VRRPT_MAIN_BRIEF_F(aVRRPT_MAINid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRRPT_MAIN_DELETE /*Отчет*/ (
 aCURSESSION CHAR,
 aVRRPT_MAINid CHAR,
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
select count(*) into existsCnt from VRRPT_MAIN where VRRPT_MAINID=aVRRPT_MAINID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRRPT_MAIN where VRRPT_MAINid=aVRRPT_MAINID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRRPT_MAIN',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRRPT_MAIN');
      return;
    end if;
  end if;
 --  verify lock  --
 VRRPT_MAIN_ISLOCKED( acursession=>acursession,aROWID=>aVRRPT_MAINid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRRPT_MAIN');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRRPT_MAIN',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRRPT_MAINid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRRPT_MAIN is select  instanceid ID from instance where OwnerPartName ='VRRPT_MAIN' and OwnerRowID=aVRRPT_MAINid;
row_VRRPT_MAIN  chld_VRRPT_MAIN%ROWTYPE;
begin
--open chld_VRRPT_MAIN;
for row_VRRPT_MAIN in chld_VRRPT_MAIN loop
 Kernel.INSTANCE_OWNER (acursession,row_VRRPT_MAIN.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRRPT_MAIN.id);
end loop;
--close chld_VRRPT_MAIN;
end ;
  delete from  VRRPT_MAIN 
  where  VRRPT_MAINID = aVRRPT_MAINID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Отчет*/
procedure VRRPT_MAIN_SAVE /*Отчет*/ (
 aCURSESSION CHAR,
 aVRRPT_MAINid CHAR,
aInstanceID CHAR 
,aOrg CHAR/* Наша организация *//* Наша организация */
,aAuthor CHAR/* Автор *//* Автор */
,aTheDate
 DATE/* Дата отчета *//* Дата отчета */
,aClient CHAR := null /* Клиент *//* Клиент */
,aProject CHAR := null /* Проект *//* Проект */
,aContract CHAR := null /* Договор *//* Договор */
,aPerson CHAR := null /* Контактное лицо *//* Контактное лицо */
,aName
 VARCHAR2 := null /* Название отчета *//* Название отчета */
,aInfo VARCHAR2 := null /* Информация *//* Информация */
,aAttrachment VARCHAR2 := null /* Вложение */
,aAttrachment_EXT varchar2 /* Вложение */
,aReportType CHAR := null /* Тип отчета *//* Тип отчета */
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
select count(*) into existsCnt from VRRPT_MAIN where VRRPT_MAINID=aVRRPT_MAINID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRRPT_MAIN where VRRPT_MAINid=aVRRPT_MAINID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRRPT_MAIN',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRRPT_MAIN');
      return;
    end if;
  end if;
 --  verify lock  --
 VRRPT_MAIN_ISLOCKED( acursession=>acursession,aROWID=>aVRRPT_MAINid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRRPT_MAIN');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRRPT_MAIN',
 aVERB=>'EDITROW',  aThe_Resource=>aVRRPT_MAINid,aLogInstanceID=>aInstanceID);
 update  VRRPT_MAIN set ChangeStamp=sysdate
,
  Org=aOrg
,
  Author=aAuthor
,
  TheDate=aTheDate
,
  Client=aClient
,
  Project=aProject
,
  Contract=aContract
,
  Person=aPerson
,
  Name=aName
,
  Info=aInfo
,
  Attrachment=aAttrachment
,Attrachment_EXT=
aAttrachment_EXT 
,
  ReportType=aReportType
  where  VRRPT_MAINID = aVRRPT_MAINID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRRPT_MAIN',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRRPT_MAIN');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRRPT_MAIN');
    return;
  end if;
select Count(*) into existsCnt from VRRPT_MAIN where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <VRRPT_MAIN>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRRPT_MAIN',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRRPT_MAINid,aLogInstanceID=>aInstanceID);
 insert into   VRRPT_MAIN
 (  VRRPT_MAINID 
,InstanceID
,Org

,Author

,TheDate

,Client

,Project

,Contract

,Person

,Name

,Info

,Attrachment

,Attrachment_EXT
,ReportType

 ) values ( aVRRPT_MAINID 
,aInstanceID
,aOrg

,aAuthor

,aTheDate

,aClient

,aProject

,aContract

,aPerson

,aName

,aInfo

,aAttrachment

,aAttrachment_EXT
,aReportType

 ); 
 VRRPT_MAIN_SINIT( aCURSESSION,aVRRPT_MAINid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRRPT_MAIN_PARENT /*Отчет*/ (
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
  select  INSTANCEID into aParentID from VRRPT_MAIN where  VRRPT_MAINid=aRowID;
 end; 


procedure VRRPT_MAIN_ISLOCKED /*Отчет*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRRPT_MAIN where VRRPT_MAINid=aRowID;
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
  VRRPT_MAIN_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRRPT.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRRPT_MAIN_LOCK /*Отчет*/ (
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
 VRRPT_MAIN_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRRPT_MAIN_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRRPT_MAIN where VRRPT_MAINid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRRPT_MAIN');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRRPT_MAIN set LockUserID =auserID ,LockSessionID =null where VRRPT_MAINid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRRPT_MAIN set LockUserID =null,LockSessionID =aCURSESSION  where VRRPT_MAINid=aRowID;
     return;
   end if;
 end ;


procedure VRRPT_MAIN_HCL /*Отчет*/ (
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


procedure VRRPT_MAIN_UNLOCK /*Отчет*/ (
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
 VRRPT_MAIN_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRRPT_MAIN set LockUserID =null  where VRRPT_MAINid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRRPT_MAIN set LockSessionID =null  where VRRPT_MAINid=aRowID;
     return;
   end if;
 end; 


procedure VRRPT_MAIN_SINIT /*Отчет*/ (
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
 select  SecurityStyleID into atmpID from VRRPT_MAIN where VRRPT_MAINid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRRPT_MAIN');
    return;
  end if;
if aSecurityStyleID is null then
 VRRPT_MAIN_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRRPT_MAIN set securitystyleid =aStyleID where VRRPT_MAINid = aRowID;
else 
 update VRRPT_MAIN set securitystyleid =aSecurityStyleID where VRRPT_MAINid = aRowID;
end if; 
end ; 


procedure VRRPT_MAIN_propagate /*Отчет*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRRPT_MAIN where VRRPT_MAINid=aRowid;
end;


end VRRPT;

/



