
/* --MtzRptQry*/

 create or replace package body MtzRptQry as

procedure MtzRptQry_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='MtzRptQry'
then
declare cursor child_RptSrvMsg is select RptSrvMsg.RptSrvMsgid ID from RptSrvMsg where  RptSrvMsg.InstanceID = ainstanceid;
row_RptSrvMsg  child_RptSrvMsg%ROWTYPE;
begin
--open child_RptSrvMsg;
for row_RptSrvMsg in child_RptSrvMsg loop
 RptSrvMsg_DELETE (acursession,row_RptSrvMsg.id,aInstanceID);
end loop;
--close child_RptSrvMsg;
end;
declare cursor child_RptQuery is select RptQuery.RptQueryid ID from RptQuery where  RptQuery.InstanceID = ainstanceid;
row_RptQuery  child_RptQuery%ROWTYPE;
begin
--open child_RptQuery;
for row_RptQuery in child_RptQuery loop
 RptQuery_DELETE (acursession,row_RptQuery.id,aInstanceID);
end loop;
--close child_RptQuery;
end;
declare cursor child_RptQryParam is select RptQryParam.RptQryParamid ID from RptQryParam where  RptQryParam.InstanceID = ainstanceid;
row_RptQryParam  child_RptQryParam%ROWTYPE;
begin
--open child_RptQryParam;
for row_RptQryParam in child_RptQryParam loop
 RptQryParam_DELETE (acursession,row_RptQryParam.id,aInstanceID);
end loop;
--close child_RptQryParam;
end;
return;
<<del_error>>
return;
end if;
end;
procedure MtzRptQry_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'MtzRptQry'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_RptSrvMsg is select RptSrvMsg.RptSrvMsgid ID from RptSrvMsg where  RptSrvMsg.InstanceID = arowid;
ROW_RptSrvMsg  lch_RptSrvMsg%ROWTYPE;
begin
--open lch_RptSrvMsg;
for row_RptSrvMsg in lch_RptSrvMsg loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from RptSrvMsg where RptSrvMsgid=row_RptSrvMsg.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_RptSrvMsg;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_RptSrvMsg;
     return;
   end if; 
 end if; 
 RptSrvMsg_HCL (acursession,ROW_RptSrvMsg.id,aisLocked);
 if aisLocked >2 then
   close lch_RptSrvMsg;
   return;
 end if;
 end loop;
--close lch_RptSrvMsg;
end;
declare cursor lch_RptQuery is select RptQuery.RptQueryid ID from RptQuery where  RptQuery.InstanceID = arowid;
ROW_RptQuery  lch_RptQuery%ROWTYPE;
begin
--open lch_RptQuery;
for row_RptQuery in lch_RptQuery loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from RptQuery where RptQueryid=row_RptQuery.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_RptQuery;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_RptQuery;
     return;
   end if; 
 end if; 
 RptQuery_HCL (acursession,ROW_RptQuery.id,aisLocked);
 if aisLocked >2 then
   close lch_RptQuery;
   return;
 end if;
 end loop;
--close lch_RptQuery;
end;
declare cursor lch_RptQryParam is select RptQryParam.RptQryParamid ID from RptQryParam where  RptQryParam.InstanceID = arowid;
ROW_RptQryParam  lch_RptQryParam%ROWTYPE;
begin
--open lch_RptQryParam;
for row_RptQryParam in lch_RptQryParam loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from RptQryParam where RptQryParamid=row_RptQryParam.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_RptQryParam;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_RptQryParam;
     return;
   end if; 
 end if; 
 RptQryParam_HCL (acursession,ROW_RptQryParam.id,aisLocked);
 if aisLocked >2 then
   close lch_RptQryParam;
   return;
 end if;
 end loop;
--close lch_RptQryParam;
end;
 end if;
aIsLocked:=0;
end;
procedure MtzRptQry_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'MtzRptQry'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_RptSrvMsg is select RptSrvMsg.RptSrvMsgid id from RptSrvMsg where  RptSrvMsg.InstanceID = arowid;
row_RptSrvMsg  pch_RptSrvMsg%ROWTYPE;
begin
--open pch_RptSrvMsg;
for row_RptSrvMsg in  pch_RptSrvMsg loop
 RptSrvMsg_SINIT( acursession,row_RptSrvMsg.id,assid);
 RptSrvMsg_propagate( acursession,row_RptSrvMsg.id);
end loop;
--close pch_RptSrvMsg;
end;
declare cursor pch_RptQuery is select RptQuery.RptQueryid id from RptQuery where  RptQuery.InstanceID = arowid;
row_RptQuery  pch_RptQuery%ROWTYPE;
begin
--open pch_RptQuery;
for row_RptQuery in  pch_RptQuery loop
 RptQuery_SINIT( acursession,row_RptQuery.id,assid);
 RptQuery_propagate( acursession,row_RptQuery.id);
end loop;
--close pch_RptQuery;
end;
declare cursor pch_RptQryParam is select RptQryParam.RptQryParamid id from RptQryParam where  RptQryParam.InstanceID = arowid;
row_RptQryParam  pch_RptQryParam%ROWTYPE;
begin
--open pch_RptQryParam;
for row_RptQryParam in  pch_RptQryParam loop
 RptQryParam_SINIT( acursession,row_RptQryParam.id,assid);
 RptQryParam_propagate( acursession,row_RptQryParam.id);
end loop;
--close pch_RptQryParam;
end;
 end if; 
end;



procedure RptSrvMsg_BRIEF  (
 aCURSESSION CHAR,
 aRptSrvMsgid CHAR,
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
if aRptSrvMsgid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from RptSrvMsg where RptSrvMsgID=aRptSrvMsgID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from RptSrvMsg where RptSrvMsgid=aRptSrvMsgID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=RptSrvMsg');
    return;
  end if;
  aBRIEF:=func.RptSrvMsg_BRIEF_F(aRptSrvMsgid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure RptSrvMsg_DELETE /*Сообщения от сервера*/ (
 aCURSESSION CHAR,
 aRptSrvMsgid CHAR,
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
select count(*) into existsCnt from RptSrvMsg where RptSrvMsgID=aRptSrvMsgID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from RptSrvMsg where RptSrvMsgid=aRptSrvMsgID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:RptSrvMsg',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=RptSrvMsg');
      return;
    end if;
  end if;
 --  verify lock  --
 RptSrvMsg_ISLOCKED( acursession=>acursession,aROWID=>aRptSrvMsgid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=RptSrvMsg');
    return;
  end if;
  --begin tran--  
 -- erase child items --
declare cursor chld_RptSrvMsg is select  instanceid ID from instance where OwnerPartName ='RptSrvMsg' and OwnerRowID=aRptSrvMsgid;
row_RptSrvMsg  chld_RptSrvMsg%ROWTYPE;
begin
--open chld_RptSrvMsg;
for row_RptSrvMsg in chld_RptSrvMsg loop
 Kernel.INSTANCE_OWNER (acursession,row_RptSrvMsg.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_RptSrvMsg.id);
end loop;
--close chld_RptSrvMsg;
end ;
  delete from  RptSrvMsg 
  where  RptSrvMsgID = aRptSrvMsgID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Сообщения от сервера*/
procedure RptSrvMsg_SAVE /*Сообщения от сервера*/ (
 aCURSESSION CHAR,
 aRptSrvMsgid CHAR,
aInstanceID CHAR 
,aMsgdate
 DATE/* Дата сообщения *//* Дата сообщения */
,aInfo VARCHAR2 := null /* Информация *//* Информация */
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
select count(*) into existsCnt from RptSrvMsg where RptSrvMsgID=aRptSrvMsgID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from RptSrvMsg where RptSrvMsgid=aRptSrvMsgID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:RptSrvMsg',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=RptSrvMsg');
      return;
    end if;
  end if;
 --  verify lock  --
 RptSrvMsg_ISLOCKED( acursession=>acursession,aROWID=>aRptSrvMsgid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=RptSrvMsg');
    return;
  end if;
 -- update row  --
 update  RptSrvMsg set ChangeStamp=sysdate
,
  Msgdate=aMsgdate
,
  Info=aInfo
  where  RptSrvMsgID = aRptSrvMsgID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:RptSrvMsg',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=RptSrvMsg');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=RptSrvMsg');
    return;
  end if;
 insert into   RptSrvMsg
 (  RptSrvMsgID 
,InstanceID
,Msgdate

,Info

 ) values ( aRptSrvMsgID 
,aInstanceID
,aMsgdate

,aInfo

 ); 
 RptSrvMsg_SINIT( aCURSESSION,aRptSrvMsgid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure RptSrvMsg_PARENT /*Сообщения от сервера*/ (
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
  select  INSTANCEID into aParentID from RptSrvMsg where  RptSrvMsgid=aRowID;
 end; 


procedure RptSrvMsg_ISLOCKED /*Сообщения от сервера*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from RptSrvMsg where RptSrvMsgid=aRowID;
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
  RptSrvMsg_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MtzRptQry.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure RptSrvMsg_LOCK /*Сообщения от сервера*/ (
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
 RptSrvMsg_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  RptSrvMsg_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from RptSrvMsg where RptSrvMsgid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=RptSrvMsg');
    return;
  end if;
   if  aLockMode =2  
   then   
    update RptSrvMsg set LockUserID =auserID ,LockSessionID =null where RptSrvMsgid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update RptSrvMsg set LockUserID =null,LockSessionID =aCURSESSION  where RptSrvMsgid=aRowID;
     return;
   end if;
 end ;


procedure RptSrvMsg_HCL /*Сообщения от сервера*/ (
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


procedure RptSrvMsg_UNLOCK /*Сообщения от сервера*/ (
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
 RptSrvMsg_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update RptSrvMsg set LockUserID =null  where RptSrvMsgid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update RptSrvMsg set LockSessionID =null  where RptSrvMsgid=aRowID;
     return;
   end if;
 end; 


procedure RptSrvMsg_SINIT /*Сообщения от сервера*/ (
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
 select  SecurityStyleID into atmpID from RptSrvMsg where RptSrvMsgid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =RptSrvMsg');
    return;
  end if;
if aSecurityStyleID is null then
 RptSrvMsg_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update RptSrvMsg set securitystyleid =aStyleID where RptSrvMsgid = aRowID;
else 
 update RptSrvMsg set securitystyleid =aSecurityStyleID where RptSrvMsgid = aRowID;
end if; 
end ; 


procedure RptSrvMsg_propagate /*Сообщения от сервера*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from RptSrvMsg where RptSrvMsgid=aRowid;
end;



procedure RptQuery_BRIEF  (
 aCURSESSION CHAR,
 aRptQueryid CHAR,
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
if aRptQueryid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from RptQuery where RptQueryID=aRptQueryID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from RptQuery where RptQueryid=aRptQueryID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=RptQuery');
    return;
  end if;
  aBRIEF:=func.RptQuery_BRIEF_F(aRptQueryid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure RptQuery_DELETE /*Заявка*/ (
 aCURSESSION CHAR,
 aRptQueryid CHAR,
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
select count(*) into existsCnt from RptQuery where RptQueryID=aRptQueryID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from RptQuery where RptQueryid=aRptQueryID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:RptQuery',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=RptQuery');
      return;
    end if;
  end if;
 --  verify lock  --
 RptQuery_ISLOCKED( acursession=>acursession,aROWID=>aRptQueryid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=RptQuery');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'RptQuery',
 aVERB=>'DELETEROW',  aThe_Resource=>aRptQueryid, aLogInstanceID=>aInstanceID);
declare cursor chld_RptQuery is select  instanceid ID from instance where OwnerPartName ='RptQuery' and OwnerRowID=aRptQueryid;
row_RptQuery  chld_RptQuery%ROWTYPE;
begin
--open chld_RptQuery;
for row_RptQuery in chld_RptQuery loop
 Kernel.INSTANCE_OWNER (acursession,row_RptQuery.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_RptQuery.id);
end loop;
--close chld_RptQuery;
end ;
  delete from  RptQuery 
  where  RptQueryID = aRptQueryID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Заявка*/
procedure RptQuery_SAVE /*Заявка*/ (
 aCURSESSION CHAR,
 aRptQueryid CHAR,
aInstanceID CHAR 
,aReportType CHAR/* Тип отчета *//* Тип отчета */
,aQueryUser CHAR/* Автор заявки *//* Автор заявки */
,aQryDate
 DATE/* Дата заявки *//* Дата заявки */
,aAcceptDate
 DATE := null /* Дата приема заявки сервером *//* Дата приема заявки сервером */
,aFinDate
 DATE := null /* Момент завершения обработки *//* Момент завершения обработки */
,aResultID CHAR := null /* Идентификатор результата *//* Идентификатор результата */
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
select count(*) into existsCnt from RptQuery where RptQueryID=aRptQueryID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from RptQuery where RptQueryid=aRptQueryID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:RptQuery',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=RptQuery');
      return;
    end if;
  end if;
 --  verify lock  --
 RptQuery_ISLOCKED( acursession=>acursession,aROWID=>aRptQueryid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=RptQuery');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'RptQuery',
 aVERB=>'EDITROW',  aThe_Resource=>aRptQueryid,aLogInstanceID=>aInstanceID);
 update  RptQuery set ChangeStamp=sysdate
,
  ReportType=aReportType
,
  QueryUser=aQueryUser
,
  QryDate=aQryDate
,
  AcceptDate=aAcceptDate
,
  FinDate=aFinDate
,
  ResultID=aResultID
  where  RptQueryID = aRptQueryID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:RptQuery',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=RptQuery');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=RptQuery');
    return;
  end if;
select Count(*) into existsCnt from RptQuery where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <RptQuery>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'RptQuery',
 aVERB=>'CREATEROW',  aThe_Resource=>aRptQueryid,aLogInstanceID=>aInstanceID);
 insert into   RptQuery
 (  RptQueryID 
,InstanceID
,ReportType

,QueryUser

,QryDate

,AcceptDate

,FinDate

,ResultID

 ) values ( aRptQueryID 
,aInstanceID
,aReportType

,aQueryUser

,aQryDate

,aAcceptDate

,aFinDate

,aResultID

 ); 
 RptQuery_SINIT( aCURSESSION,aRptQueryid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure RptQuery_PARENT /*Заявка*/ (
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
  select  INSTANCEID into aParentID from RptQuery where  RptQueryid=aRowID;
 end; 


procedure RptQuery_ISLOCKED /*Заявка*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from RptQuery where RptQueryid=aRowID;
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
  RptQuery_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MtzRptQry.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure RptQuery_LOCK /*Заявка*/ (
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
 RptQuery_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  RptQuery_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from RptQuery where RptQueryid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=RptQuery');
    return;
  end if;
   if  aLockMode =2  
   then   
    update RptQuery set LockUserID =auserID ,LockSessionID =null where RptQueryid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update RptQuery set LockUserID =null,LockSessionID =aCURSESSION  where RptQueryid=aRowID;
     return;
   end if;
 end ;


procedure RptQuery_HCL /*Заявка*/ (
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


procedure RptQuery_UNLOCK /*Заявка*/ (
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
 RptQuery_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update RptQuery set LockUserID =null  where RptQueryid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update RptQuery set LockSessionID =null  where RptQueryid=aRowID;
     return;
   end if;
 end; 


procedure RptQuery_SINIT /*Заявка*/ (
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
 select  SecurityStyleID into atmpID from RptQuery where RptQueryid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =RptQuery');
    return;
  end if;
if aSecurityStyleID is null then
 RptQuery_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update RptQuery set securitystyleid =aStyleID where RptQueryid = aRowID;
else 
 update RptQuery set securitystyleid =aSecurityStyleID where RptQueryid = aRowID;
end if; 
end ; 


procedure RptQuery_propagate /*Заявка*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from RptQuery where RptQueryid=aRowid;
end;



procedure RptQryParam_BRIEF  (
 aCURSESSION CHAR,
 aRptQryParamid CHAR,
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
if aRptQryParamid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from RptQryParam where RptQryParamID=aRptQryParamID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from RptQryParam where RptQryParamid=aRptQryParamID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=RptQryParam');
    return;
  end if;
  aBRIEF:=func.RptQryParam_BRIEF_F(aRptQryParamid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure RptQryParam_DELETE /*Параметры отчета*/ (
 aCURSESSION CHAR,
 aRptQryParamid CHAR,
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
select count(*) into existsCnt from RptQryParam where RptQryParamID=aRptQryParamID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from RptQryParam where RptQryParamid=aRptQryParamID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:RptQryParam',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=RptQryParam');
      return;
    end if;
  end if;
 --  verify lock  --
 RptQryParam_ISLOCKED( acursession=>acursession,aROWID=>aRptQryParamid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=RptQryParam');
    return;
  end if;
  --begin tran--  
 -- erase child items --
declare cursor chld_RptQryParam is select  instanceid ID from instance where OwnerPartName ='RptQryParam' and OwnerRowID=aRptQryParamid;
row_RptQryParam  chld_RptQryParam%ROWTYPE;
begin
--open chld_RptQryParam;
for row_RptQryParam in chld_RptQryParam loop
 Kernel.INSTANCE_OWNER (acursession,row_RptQryParam.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_RptQryParam.id);
end loop;
--close chld_RptQryParam;
end ;
  delete from  RptQryParam 
  where  RptQryParamID = aRptQryParamID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Параметры отчета*/
procedure RptQryParam_SAVE /*Параметры отчета*/ (
 aCURSESSION CHAR,
 aRptQryParamid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aTheValue VARCHAR2 := null /* Значение *//* Значение */
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
select count(*) into existsCnt from RptQryParam where RptQryParamID=aRptQryParamID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from RptQryParam where RptQryParamid=aRptQryParamID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:RptQryParam',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=RptQryParam');
      return;
    end if;
  end if;
 --  verify lock  --
 RptQryParam_ISLOCKED( acursession=>acursession,aROWID=>aRptQryParamid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=RptQryParam');
    return;
  end if;
 -- update row  --
 update  RptQryParam set ChangeStamp=sysdate
,
  Name=aName
,
  TheValue=aTheValue
  where  RptQryParamID = aRptQryParamID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:RptQryParam',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=RptQryParam');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=RptQryParam');
    return;
  end if;
 insert into   RptQryParam
 (  RptQryParamID 
,InstanceID
,Name

,TheValue

 ) values ( aRptQryParamID 
,aInstanceID
,aName

,aTheValue

 ); 
 RptQryParam_SINIT( aCURSESSION,aRptQryParamid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure RptQryParam_PARENT /*Параметры отчета*/ (
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
  select  INSTANCEID into aParentID from RptQryParam where  RptQryParamid=aRowID;
 end; 


procedure RptQryParam_ISLOCKED /*Параметры отчета*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from RptQryParam where RptQryParamid=aRowID;
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
  RptQryParam_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MtzRptQry.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure RptQryParam_LOCK /*Параметры отчета*/ (
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
 RptQryParam_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  RptQryParam_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from RptQryParam where RptQryParamid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=RptQryParam');
    return;
  end if;
   if  aLockMode =2  
   then   
    update RptQryParam set LockUserID =auserID ,LockSessionID =null where RptQryParamid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update RptQryParam set LockUserID =null,LockSessionID =aCURSESSION  where RptQryParamid=aRowID;
     return;
   end if;
 end ;


procedure RptQryParam_HCL /*Параметры отчета*/ (
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


procedure RptQryParam_UNLOCK /*Параметры отчета*/ (
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
 RptQryParam_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update RptQryParam set LockUserID =null  where RptQryParamid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update RptQryParam set LockSessionID =null  where RptQryParamid=aRowID;
     return;
   end if;
 end; 


procedure RptQryParam_SINIT /*Параметры отчета*/ (
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
 select  SecurityStyleID into atmpID from RptQryParam where RptQryParamid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =RptQryParam');
    return;
  end if;
if aSecurityStyleID is null then
 RptQryParam_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update RptQryParam set securitystyleid =aStyleID where RptQryParamid = aRowID;
else 
 update RptQryParam set securitystyleid =aSecurityStyleID where RptQryParamid = aRowID;
end if; 
end ; 


procedure RptQryParam_propagate /*Параметры отчета*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from RptQryParam where RptQryParamid=aRowid;
end;


end MtzRptQry;

/



