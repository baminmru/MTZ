
/* --MTZSrvMsg*/

 create or replace package body MTZSrvMsg as

procedure MTZSrvMsg_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='MTZSrvMsg'
then
declare cursor child_SrvMessageInfo is select SrvMessageInfo.SrvMessageInfoid ID from SrvMessageInfo where  SrvMessageInfo.InstanceID = ainstanceid;
row_SrvMessageInfo  child_SrvMessageInfo%ROWTYPE;
begin
--open child_SrvMessageInfo;
for row_SrvMessageInfo in child_SrvMessageInfo loop
 SrvMessageInfo_DELETE (acursession,row_SrvMessageInfo.id,aInstanceID);
end loop;
--close child_SrvMessageInfo;
end;
return;
<<del_error>>
return;
end if;
end;
procedure MTZSrvMsg_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'MTZSrvMsg'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_SrvMessageInfo is select SrvMessageInfo.SrvMessageInfoid ID from SrvMessageInfo where  SrvMessageInfo.InstanceID = arowid;
ROW_SrvMessageInfo  lch_SrvMessageInfo%ROWTYPE;
begin
--open lch_SrvMessageInfo;
for row_SrvMessageInfo in lch_SrvMessageInfo loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from SrvMessageInfo where SrvMessageInfoid=row_SrvMessageInfo.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_SrvMessageInfo;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_SrvMessageInfo;
     return;
   end if; 
 end if; 
 SrvMessageInfo_HCL (acursession,ROW_SrvMessageInfo.id,aisLocked);
 if aisLocked >2 then
   close lch_SrvMessageInfo;
   return;
 end if;
 end loop;
--close lch_SrvMessageInfo;
end;
 end if;
aIsLocked:=0;
end;
procedure MTZSrvMsg_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'MTZSrvMsg'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_SrvMessageInfo is select SrvMessageInfo.SrvMessageInfoid id from SrvMessageInfo where  SrvMessageInfo.InstanceID = arowid;
row_SrvMessageInfo  pch_SrvMessageInfo%ROWTYPE;
begin
--open pch_SrvMessageInfo;
for row_SrvMessageInfo in  pch_SrvMessageInfo loop
 SrvMessageInfo_SINIT( acursession,row_SrvMessageInfo.id,assid);
 SrvMessageInfo_propagate( acursession,row_SrvMessageInfo.id);
end loop;
--close pch_SrvMessageInfo;
end;
 end if; 
end;



procedure SrvMessageInfo_BRIEF  (
 aCURSESSION CHAR,
 aSrvMessageInfoid CHAR,
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
if aSrvMessageInfoid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from SrvMessageInfo where SrvMessageInfoID=aSrvMessageInfoID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from SrvMessageInfo where SrvMessageInfoid=aSrvMessageInfoID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=SrvMessageInfo');
    return;
  end if;
  aBRIEF:=func.SrvMessageInfo_BRIEF_F(aSrvMessageInfoid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure SrvMessageInfo_DELETE /*Суть сообщения*/ (
 aCURSESSION CHAR,
 aSrvMessageInfoid CHAR,
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
select count(*) into existsCnt from SrvMessageInfo where SrvMessageInfoID=aSrvMessageInfoID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from SrvMessageInfo where SrvMessageInfoid=aSrvMessageInfoID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:SrvMessageInfo',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=SrvMessageInfo');
      return;
    end if;
  end if;
 --  verify lock  --
 SrvMessageInfo_ISLOCKED( acursession=>acursession,aROWID=>aSrvMessageInfoid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=SrvMessageInfo');
    return;
  end if;
  --begin tran--  
 -- erase child items --
declare cursor chld_SrvMessageInfo is select  instanceid ID from instance where OwnerPartName ='SrvMessageInfo' and OwnerRowID=aSrvMessageInfoid;
row_SrvMessageInfo  chld_SrvMessageInfo%ROWTYPE;
begin
--open chld_SrvMessageInfo;
for row_SrvMessageInfo in chld_SrvMessageInfo loop
 Kernel.INSTANCE_OWNER (acursession,row_SrvMessageInfo.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_SrvMessageInfo.id);
end loop;
--close chld_SrvMessageInfo;
end ;
  delete from  SrvMessageInfo 
  where  SrvMessageInfoID = aSrvMessageInfoID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Суть сообщения*/
procedure SrvMessageInfo_SAVE /*Суть сообщения*/ (
 aCURSESSION CHAR,
 aSrvMessageInfoid CHAR,
aInstanceID CHAR 
,aForUser CHAR/* Для пользователя *//* Для пользователя */
,amsgDate
 DATE/* Дата *//* Дата */
,aMsgInfo VARCHAR2/* Текст сообщения *//* Текст сообщения */
,aTheDocument CHAR := null /* Документ *//* Документ */
,aReadTime
 DATE := null /* Время прочтения *//* Время прочтения */
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
select count(*) into existsCnt from SrvMessageInfo where SrvMessageInfoID=aSrvMessageInfoID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from SrvMessageInfo where SrvMessageInfoid=aSrvMessageInfoID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:SrvMessageInfo',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=SrvMessageInfo');
      return;
    end if;
  end if;
 --  verify lock  --
 SrvMessageInfo_ISLOCKED( acursession=>acursession,aROWID=>aSrvMessageInfoid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=SrvMessageInfo');
    return;
  end if;
 -- update row  --
 update  SrvMessageInfo set ChangeStamp=sysdate
,
  ForUser=aForUser
,
  msgDate=amsgDate
,
  MsgInfo=aMsgInfo
,
  TheDocument=aTheDocument
,
  ReadTime=aReadTime
  where  SrvMessageInfoID = aSrvMessageInfoID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:SrvMessageInfo',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=SrvMessageInfo');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=SrvMessageInfo');
    return;
  end if;
select Count(*) into existsCnt from SrvMessageInfo where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <SrvMessageInfo>');
    return;
 End if;
 insert into   SrvMessageInfo
 (  SrvMessageInfoID 
,InstanceID
,ForUser

,msgDate

,MsgInfo

,TheDocument

,ReadTime

 ) values ( aSrvMessageInfoID 
,aInstanceID
,aForUser

,amsgDate

,aMsgInfo

,aTheDocument

,aReadTime

 ); 
 SrvMessageInfo_SINIT( aCURSESSION,aSrvMessageInfoid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure SrvMessageInfo_PARENT /*Суть сообщения*/ (
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
  select  INSTANCEID into aParentID from SrvMessageInfo where  SrvMessageInfoid=aRowID;
 end; 


procedure SrvMessageInfo_ISLOCKED /*Суть сообщения*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from SrvMessageInfo where SrvMessageInfoid=aRowID;
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
  SrvMessageInfo_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZSrvMsg.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure SrvMessageInfo_LOCK /*Суть сообщения*/ (
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
 SrvMessageInfo_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  SrvMessageInfo_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from SrvMessageInfo where SrvMessageInfoid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=SrvMessageInfo');
    return;
  end if;
   if  aLockMode =2  
   then   
    update SrvMessageInfo set LockUserID =auserID ,LockSessionID =null where SrvMessageInfoid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update SrvMessageInfo set LockUserID =null,LockSessionID =aCURSESSION  where SrvMessageInfoid=aRowID;
     return;
   end if;
 end ;


procedure SrvMessageInfo_HCL /*Суть сообщения*/ (
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


procedure SrvMessageInfo_UNLOCK /*Суть сообщения*/ (
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
 SrvMessageInfo_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update SrvMessageInfo set LockUserID =null  where SrvMessageInfoid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update SrvMessageInfo set LockSessionID =null  where SrvMessageInfoid=aRowID;
     return;
   end if;
 end; 


procedure SrvMessageInfo_SINIT /*Суть сообщения*/ (
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
 select  SecurityStyleID into atmpID from SrvMessageInfo where SrvMessageInfoid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =SrvMessageInfo');
    return;
  end if;
if aSecurityStyleID is null then
 SrvMessageInfo_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update SrvMessageInfo set securitystyleid =aStyleID where SrvMessageInfoid = aRowID;
else 
 update SrvMessageInfo set securitystyleid =aSecurityStyleID where SrvMessageInfoid = aRowID;
end if; 
end ; 


procedure SrvMessageInfo_propagate /*Суть сообщения*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from SrvMessageInfo where SrvMessageInfoid=aRowid;
end;


end MTZSrvMsg;

/



