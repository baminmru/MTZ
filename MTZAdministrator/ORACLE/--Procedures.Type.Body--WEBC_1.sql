
/* --WEBC*/

 create or replace package body WEBC as

procedure WEBC_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='WEBC'
then
declare cursor child_WEBC_BLOCK is select WEBC_BLOCK.WEBC_BLOCKid ID from WEBC_BLOCK where  WEBC_BLOCK.InstanceID = ainstanceid;
row_WEBC_BLOCK  child_WEBC_BLOCK%ROWTYPE;
begin
--open child_WEBC_BLOCK;
for row_WEBC_BLOCK in child_WEBC_BLOCK loop
 WEBC_BLOCK_DELETE (acursession,row_WEBC_BLOCK.id,aInstanceID);
end loop;
--close child_WEBC_BLOCK;
end;
declare cursor child_WEBC_NEWS is select WEBC_NEWS.WEBC_NEWSid ID from WEBC_NEWS where  WEBC_NEWS.InstanceID = ainstanceid;
row_WEBC_NEWS  child_WEBC_NEWS%ROWTYPE;
begin
--open child_WEBC_NEWS;
for row_WEBC_NEWS in child_WEBC_NEWS loop
 WEBC_NEWS_DELETE (acursession,row_WEBC_NEWS.id,aInstanceID);
end loop;
--close child_WEBC_NEWS;
end;
declare cursor child_WEBC_JOB is select WEBC_JOB.WEBC_JOBid ID from WEBC_JOB where  WEBC_JOB.InstanceID = ainstanceid;
row_WEBC_JOB  child_WEBC_JOB%ROWTYPE;
begin
--open child_WEBC_JOB;
for row_WEBC_JOB in child_WEBC_JOB loop
 WEBC_JOB_DELETE (acursession,row_WEBC_JOB.id,aInstanceID);
end loop;
--close child_WEBC_JOB;
end;
declare cursor child_WEBC_MESSAGES is select WEBC_MESSAGES.WEBC_MESSAGESid ID from WEBC_MESSAGES where  WEBC_MESSAGES.InstanceID = ainstanceid;
row_WEBC_MESSAGES  child_WEBC_MESSAGES%ROWTYPE;
begin
--open child_WEBC_MESSAGES;
for row_WEBC_MESSAGES in child_WEBC_MESSAGES loop
 WEBC_MESSAGES_DELETE (acursession,row_WEBC_MESSAGES.id,aInstanceID);
end loop;
--close child_WEBC_MESSAGES;
end;
declare cursor child_WEBC_DOCS is select WEBC_DOCS.WEBC_DOCSid ID from WEBC_DOCS where  WEBC_DOCS.InstanceID = ainstanceid;
row_WEBC_DOCS  child_WEBC_DOCS%ROWTYPE;
begin
--open child_WEBC_DOCS;
for row_WEBC_DOCS in child_WEBC_DOCS loop
 WEBC_DOCS_DELETE (acursession,row_WEBC_DOCS.id,aInstanceID);
end loop;
--close child_WEBC_DOCS;
end;
declare cursor child_WEBC_FILIALS is select WEBC_FILIALS.WEBC_FILIALSid ID from WEBC_FILIALS where  WEBC_FILIALS.InstanceID = ainstanceid;
row_WEBC_FILIALS  child_WEBC_FILIALS%ROWTYPE;
begin
--open child_WEBC_FILIALS;
for row_WEBC_FILIALS in child_WEBC_FILIALS loop
 WEBC_FILIALS_DELETE (acursession,row_WEBC_FILIALS.id,aInstanceID);
end loop;
--close child_WEBC_FILIALS;
end;
declare cursor child_WEBC_LINKS is select WEBC_LINKS.WEBC_LINKSid ID from WEBC_LINKS where  WEBC_LINKS.InstanceID = ainstanceid;
row_WEBC_LINKS  child_WEBC_LINKS%ROWTYPE;
begin
--open child_WEBC_LINKS;
for row_WEBC_LINKS in child_WEBC_LINKS loop
 WEBC_LINKS_DELETE (acursession,row_WEBC_LINKS.id,aInstanceID);
end loop;
--close child_WEBC_LINKS;
end;
return;
<<del_error>>
return;
end if;
end;
procedure WEBC_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'WEBC'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_WEBC_BLOCK is select WEBC_BLOCK.WEBC_BLOCKid ID from WEBC_BLOCK where  WEBC_BLOCK.InstanceID = arowid;
ROW_WEBC_BLOCK  lch_WEBC_BLOCK%ROWTYPE;
begin
--open lch_WEBC_BLOCK;
for row_WEBC_BLOCK in lch_WEBC_BLOCK loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WEBC_BLOCK where WEBC_BLOCKid=row_WEBC_BLOCK.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WEBC_BLOCK;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WEBC_BLOCK;
     return;
   end if; 
 end if; 
 WEBC_BLOCK_HCL (acursession,ROW_WEBC_BLOCK.id,aisLocked);
 if aisLocked >2 then
   close lch_WEBC_BLOCK;
   return;
 end if;
 end loop;
--close lch_WEBC_BLOCK;
end;
declare cursor lch_WEBC_NEWS is select WEBC_NEWS.WEBC_NEWSid ID from WEBC_NEWS where  WEBC_NEWS.InstanceID = arowid;
ROW_WEBC_NEWS  lch_WEBC_NEWS%ROWTYPE;
begin
--open lch_WEBC_NEWS;
for row_WEBC_NEWS in lch_WEBC_NEWS loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WEBC_NEWS where WEBC_NEWSid=row_WEBC_NEWS.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WEBC_NEWS;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WEBC_NEWS;
     return;
   end if; 
 end if; 
 WEBC_NEWS_HCL (acursession,ROW_WEBC_NEWS.id,aisLocked);
 if aisLocked >2 then
   close lch_WEBC_NEWS;
   return;
 end if;
 end loop;
--close lch_WEBC_NEWS;
end;
declare cursor lch_WEBC_JOB is select WEBC_JOB.WEBC_JOBid ID from WEBC_JOB where  WEBC_JOB.InstanceID = arowid;
ROW_WEBC_JOB  lch_WEBC_JOB%ROWTYPE;
begin
--open lch_WEBC_JOB;
for row_WEBC_JOB in lch_WEBC_JOB loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WEBC_JOB where WEBC_JOBid=row_WEBC_JOB.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WEBC_JOB;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WEBC_JOB;
     return;
   end if; 
 end if; 
 WEBC_JOB_HCL (acursession,ROW_WEBC_JOB.id,aisLocked);
 if aisLocked >2 then
   close lch_WEBC_JOB;
   return;
 end if;
 end loop;
--close lch_WEBC_JOB;
end;
declare cursor lch_WEBC_MESSAGES is select WEBC_MESSAGES.WEBC_MESSAGESid ID from WEBC_MESSAGES where  WEBC_MESSAGES.InstanceID = arowid;
ROW_WEBC_MESSAGES  lch_WEBC_MESSAGES%ROWTYPE;
begin
--open lch_WEBC_MESSAGES;
for row_WEBC_MESSAGES in lch_WEBC_MESSAGES loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WEBC_MESSAGES where WEBC_MESSAGESid=row_WEBC_MESSAGES.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WEBC_MESSAGES;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WEBC_MESSAGES;
     return;
   end if; 
 end if; 
 WEBC_MESSAGES_HCL (acursession,ROW_WEBC_MESSAGES.id,aisLocked);
 if aisLocked >2 then
   close lch_WEBC_MESSAGES;
   return;
 end if;
 end loop;
--close lch_WEBC_MESSAGES;
end;
declare cursor lch_WEBC_DOCS is select WEBC_DOCS.WEBC_DOCSid ID from WEBC_DOCS where  WEBC_DOCS.InstanceID = arowid;
ROW_WEBC_DOCS  lch_WEBC_DOCS%ROWTYPE;
begin
--open lch_WEBC_DOCS;
for row_WEBC_DOCS in lch_WEBC_DOCS loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WEBC_DOCS where WEBC_DOCSid=row_WEBC_DOCS.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WEBC_DOCS;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WEBC_DOCS;
     return;
   end if; 
 end if; 
 WEBC_DOCS_HCL (acursession,ROW_WEBC_DOCS.id,aisLocked);
 if aisLocked >2 then
   close lch_WEBC_DOCS;
   return;
 end if;
 end loop;
--close lch_WEBC_DOCS;
end;
declare cursor lch_WEBC_FILIALS is select WEBC_FILIALS.WEBC_FILIALSid ID from WEBC_FILIALS where  WEBC_FILIALS.InstanceID = arowid;
ROW_WEBC_FILIALS  lch_WEBC_FILIALS%ROWTYPE;
begin
--open lch_WEBC_FILIALS;
for row_WEBC_FILIALS in lch_WEBC_FILIALS loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WEBC_FILIALS where WEBC_FILIALSid=row_WEBC_FILIALS.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WEBC_FILIALS;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WEBC_FILIALS;
     return;
   end if; 
 end if; 
 WEBC_FILIALS_HCL (acursession,ROW_WEBC_FILIALS.id,aisLocked);
 if aisLocked >2 then
   close lch_WEBC_FILIALS;
   return;
 end if;
 end loop;
--close lch_WEBC_FILIALS;
end;
declare cursor lch_WEBC_LINKS is select WEBC_LINKS.WEBC_LINKSid ID from WEBC_LINKS where  WEBC_LINKS.InstanceID = arowid;
ROW_WEBC_LINKS  lch_WEBC_LINKS%ROWTYPE;
begin
--open lch_WEBC_LINKS;
for row_WEBC_LINKS in lch_WEBC_LINKS loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WEBC_LINKS where WEBC_LINKSid=row_WEBC_LINKS.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WEBC_LINKS;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WEBC_LINKS;
     return;
   end if; 
 end if; 
 WEBC_LINKS_HCL (acursession,ROW_WEBC_LINKS.id,aisLocked);
 if aisLocked >2 then
   close lch_WEBC_LINKS;
   return;
 end if;
 end loop;
--close lch_WEBC_LINKS;
end;
 end if;
aIsLocked:=0;
end;
procedure WEBC_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'WEBC'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_WEBC_BLOCK is select WEBC_BLOCK.WEBC_BLOCKid id from WEBC_BLOCK where  WEBC_BLOCK.InstanceID = arowid;
row_WEBC_BLOCK  pch_WEBC_BLOCK%ROWTYPE;
begin
--open pch_WEBC_BLOCK;
for row_WEBC_BLOCK in  pch_WEBC_BLOCK loop
 WEBC_BLOCK_SINIT( acursession,row_WEBC_BLOCK.id,assid);
 WEBC_BLOCK_propagate( acursession,row_WEBC_BLOCK.id);
end loop;
--close pch_WEBC_BLOCK;
end;
declare cursor pch_WEBC_NEWS is select WEBC_NEWS.WEBC_NEWSid id from WEBC_NEWS where  WEBC_NEWS.InstanceID = arowid;
row_WEBC_NEWS  pch_WEBC_NEWS%ROWTYPE;
begin
--open pch_WEBC_NEWS;
for row_WEBC_NEWS in  pch_WEBC_NEWS loop
 WEBC_NEWS_SINIT( acursession,row_WEBC_NEWS.id,assid);
 WEBC_NEWS_propagate( acursession,row_WEBC_NEWS.id);
end loop;
--close pch_WEBC_NEWS;
end;
declare cursor pch_WEBC_JOB is select WEBC_JOB.WEBC_JOBid id from WEBC_JOB where  WEBC_JOB.InstanceID = arowid;
row_WEBC_JOB  pch_WEBC_JOB%ROWTYPE;
begin
--open pch_WEBC_JOB;
for row_WEBC_JOB in  pch_WEBC_JOB loop
 WEBC_JOB_SINIT( acursession,row_WEBC_JOB.id,assid);
 WEBC_JOB_propagate( acursession,row_WEBC_JOB.id);
end loop;
--close pch_WEBC_JOB;
end;
declare cursor pch_WEBC_MESSAGES is select WEBC_MESSAGES.WEBC_MESSAGESid id from WEBC_MESSAGES where  WEBC_MESSAGES.InstanceID = arowid;
row_WEBC_MESSAGES  pch_WEBC_MESSAGES%ROWTYPE;
begin
--open pch_WEBC_MESSAGES;
for row_WEBC_MESSAGES in  pch_WEBC_MESSAGES loop
 WEBC_MESSAGES_SINIT( acursession,row_WEBC_MESSAGES.id,assid);
 WEBC_MESSAGES_propagate( acursession,row_WEBC_MESSAGES.id);
end loop;
--close pch_WEBC_MESSAGES;
end;
declare cursor pch_WEBC_DOCS is select WEBC_DOCS.WEBC_DOCSid id from WEBC_DOCS where  WEBC_DOCS.InstanceID = arowid;
row_WEBC_DOCS  pch_WEBC_DOCS%ROWTYPE;
begin
--open pch_WEBC_DOCS;
for row_WEBC_DOCS in  pch_WEBC_DOCS loop
 WEBC_DOCS_SINIT( acursession,row_WEBC_DOCS.id,assid);
 WEBC_DOCS_propagate( acursession,row_WEBC_DOCS.id);
end loop;
--close pch_WEBC_DOCS;
end;
declare cursor pch_WEBC_FILIALS is select WEBC_FILIALS.WEBC_FILIALSid id from WEBC_FILIALS where  WEBC_FILIALS.InstanceID = arowid;
row_WEBC_FILIALS  pch_WEBC_FILIALS%ROWTYPE;
begin
--open pch_WEBC_FILIALS;
for row_WEBC_FILIALS in  pch_WEBC_FILIALS loop
 WEBC_FILIALS_SINIT( acursession,row_WEBC_FILIALS.id,assid);
 WEBC_FILIALS_propagate( acursession,row_WEBC_FILIALS.id);
end loop;
--close pch_WEBC_FILIALS;
end;
declare cursor pch_WEBC_LINKS is select WEBC_LINKS.WEBC_LINKSid id from WEBC_LINKS where  WEBC_LINKS.InstanceID = arowid;
row_WEBC_LINKS  pch_WEBC_LINKS%ROWTYPE;
begin
--open pch_WEBC_LINKS;
for row_WEBC_LINKS in  pch_WEBC_LINKS loop
 WEBC_LINKS_SINIT( acursession,row_WEBC_LINKS.id,assid);
 WEBC_LINKS_propagate( acursession,row_WEBC_LINKS.id);
end loop;
--close pch_WEBC_LINKS;
end;
 end if; 
end;



procedure WEBC_BLOCK_BRIEF  (
 aCURSESSION CHAR,
 aWEBC_BLOCKid CHAR,
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
if aWEBC_BLOCKid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WEBC_BLOCK where WEBC_BLOCKID=aWEBC_BLOCKID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WEBC_BLOCK where WEBC_BLOCKid=aWEBC_BLOCKID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WEBC_BLOCK');
    return;
  end if;
  aBRIEF:=func.WEBC_BLOCK_BRIEF_F(aWEBC_BLOCKid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WEBC_BLOCK_DELETE /*Блоки сообщений*/ (
 aCURSESSION CHAR,
 aWEBC_BLOCKid CHAR,
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
select count(*) into existsCnt from WEBC_BLOCK where WEBC_BLOCKID=aWEBC_BLOCKID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WEBC_BLOCK where WEBC_BLOCKid=aWEBC_BLOCKID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WEBC_BLOCK',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WEBC_BLOCK');
      return;
    end if;
  end if;
 --  verify lock  --
 WEBC_BLOCK_ISLOCKED( acursession=>acursession,aROWID=>aWEBC_BLOCKid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WEBC_BLOCK');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WEBC_BLOCK',
 aVERB=>'DELETEROW',  aThe_Resource=>aWEBC_BLOCKid, aLogInstanceID=>aInstanceID);
declare cursor chld_WEBC_BLOCK is select  instanceid ID from instance where OwnerPartName ='WEBC_BLOCK' and OwnerRowID=aWEBC_BLOCKid;
row_WEBC_BLOCK  chld_WEBC_BLOCK%ROWTYPE;
begin
--open chld_WEBC_BLOCK;
for row_WEBC_BLOCK in chld_WEBC_BLOCK loop
 Kernel.INSTANCE_OWNER (acursession,row_WEBC_BLOCK.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WEBC_BLOCK.id);
end loop;
--close chld_WEBC_BLOCK;
end ;
  delete from  WEBC_BLOCK 
  where  WEBC_BLOCKID = aWEBC_BLOCKID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Блоки сообщений*/
procedure WEBC_BLOCK_SAVE /*Блоки сообщений*/ (
 aCURSESSION CHAR,
 aWEBC_BLOCKid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* Название блока *//* Название блока */
,aInfo VARCHAR2/* Содержание *//* Содержание */
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
select count(*) into existsCnt from WEBC_BLOCK where WEBC_BLOCKID=aWEBC_BLOCKID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WEBC_BLOCK where WEBC_BLOCKid=aWEBC_BLOCKID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WEBC_BLOCK',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WEBC_BLOCK');
      return;
    end if;
  end if;
 --  verify lock  --
 WEBC_BLOCK_ISLOCKED( acursession=>acursession,aROWID=>aWEBC_BLOCKid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WEBC_BLOCK');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WEBC_BLOCK',
 aVERB=>'EDITROW',  aThe_Resource=>aWEBC_BLOCKid,aLogInstanceID=>aInstanceID);
 update  WEBC_BLOCK set ChangeStamp=sysdate
,
  name=aname
,
  Info=aInfo
  where  WEBC_BLOCKID = aWEBC_BLOCKID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WEBC_BLOCK',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WEBC_BLOCK');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WEBC_BLOCK');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WEBC_BLOCK',
 aVERB=>'CREATEROW',  aThe_Resource=>aWEBC_BLOCKid,aLogInstanceID=>aInstanceID);
 insert into   WEBC_BLOCK
 (  WEBC_BLOCKID 
,InstanceID
,name

,Info

 ) values ( aWEBC_BLOCKID 
,aInstanceID
,aname

,aInfo

 ); 
 WEBC_BLOCK_SINIT( aCURSESSION,aWEBC_BLOCKid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WEBC_BLOCK_PARENT /*Блоки сообщений*/ (
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
  select  INSTANCEID into aParentID from WEBC_BLOCK where  WEBC_BLOCKid=aRowID;
 end; 


procedure WEBC_BLOCK_ISLOCKED /*Блоки сообщений*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WEBC_BLOCK where WEBC_BLOCKid=aRowID;
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
  WEBC_BLOCK_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WEBC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WEBC_BLOCK_LOCK /*Блоки сообщений*/ (
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
 WEBC_BLOCK_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WEBC_BLOCK_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WEBC_BLOCK where WEBC_BLOCKid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WEBC_BLOCK');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WEBC_BLOCK set LockUserID =auserID ,LockSessionID =null where WEBC_BLOCKid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WEBC_BLOCK set LockUserID =null,LockSessionID =aCURSESSION  where WEBC_BLOCKid=aRowID;
     return;
   end if;
 end ;


procedure WEBC_BLOCK_HCL /*Блоки сообщений*/ (
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


procedure WEBC_BLOCK_UNLOCK /*Блоки сообщений*/ (
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
 WEBC_BLOCK_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WEBC_BLOCK set LockUserID =null  where WEBC_BLOCKid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WEBC_BLOCK set LockSessionID =null  where WEBC_BLOCKid=aRowID;
     return;
   end if;
 end; 


procedure WEBC_BLOCK_SINIT /*Блоки сообщений*/ (
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
 select  SecurityStyleID into atmpID from WEBC_BLOCK where WEBC_BLOCKid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WEBC_BLOCK');
    return;
  end if;
if aSecurityStyleID is null then
 WEBC_BLOCK_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WEBC_BLOCK set securitystyleid =aStyleID where WEBC_BLOCKid = aRowID;
else 
 update WEBC_BLOCK set securitystyleid =aSecurityStyleID where WEBC_BLOCKid = aRowID;
end if; 
end ; 


procedure WEBC_BLOCK_propagate /*Блоки сообщений*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WEBC_BLOCK where WEBC_BLOCKid=aRowid;
end;



procedure WEBC_NEWS_BRIEF  (
 aCURSESSION CHAR,
 aWEBC_NEWSid CHAR,
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
if aWEBC_NEWSid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WEBC_NEWS where WEBC_NEWSID=aWEBC_NEWSID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WEBC_NEWS where WEBC_NEWSid=aWEBC_NEWSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WEBC_NEWS');
    return;
  end if;
  aBRIEF:=func.WEBC_NEWS_BRIEF_F(aWEBC_NEWSid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WEBC_NEWS_DELETE /*Новости*/ (
 aCURSESSION CHAR,
 aWEBC_NEWSid CHAR,
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
select count(*) into existsCnt from WEBC_NEWS where WEBC_NEWSID=aWEBC_NEWSID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WEBC_NEWS where WEBC_NEWSid=aWEBC_NEWSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WEBC_NEWS',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WEBC_NEWS');
      return;
    end if;
  end if;
 --  verify lock  --
 WEBC_NEWS_ISLOCKED( acursession=>acursession,aROWID=>aWEBC_NEWSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WEBC_NEWS');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WEBC_NEWS',
 aVERB=>'DELETEROW',  aThe_Resource=>aWEBC_NEWSid, aLogInstanceID=>aInstanceID);
declare cursor chld_WEBC_NEWS is select  instanceid ID from instance where OwnerPartName ='WEBC_NEWS' and OwnerRowID=aWEBC_NEWSid;
row_WEBC_NEWS  chld_WEBC_NEWS%ROWTYPE;
begin
--open chld_WEBC_NEWS;
for row_WEBC_NEWS in chld_WEBC_NEWS loop
 Kernel.INSTANCE_OWNER (acursession,row_WEBC_NEWS.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WEBC_NEWS.id);
end loop;
--close chld_WEBC_NEWS;
end ;
  delete from  WEBC_NEWS 
  where  WEBC_NEWSID = aWEBC_NEWSID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Новости*/
procedure WEBC_NEWS_SAVE /*Новости*/ (
 aCURSESSION CHAR,
 aWEBC_NEWSid CHAR,
aInstanceID CHAR 
,aTheDate
 DATE/* Дата *//* Дата */
,aShortName
 VARCHAR2/* Краткое название *//* Краткое название */
,aInfo VARCHAR2/* Содержание *//* Содержание */
,aAccept
 NUMBER/* Разрешена публикация *//* Разрешена публикация */
,aAnnotation
 VARCHAR2 := null /* Краткое сообщение *//* Краткое сообщение */
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
select count(*) into existsCnt from WEBC_NEWS where WEBC_NEWSID=aWEBC_NEWSID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WEBC_NEWS where WEBC_NEWSid=aWEBC_NEWSID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WEBC_NEWS',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WEBC_NEWS');
      return;
    end if;
  end if;
 --  verify lock  --
 WEBC_NEWS_ISLOCKED( acursession=>acursession,aROWID=>aWEBC_NEWSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WEBC_NEWS');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WEBC_NEWS',
 aVERB=>'EDITROW',  aThe_Resource=>aWEBC_NEWSid,aLogInstanceID=>aInstanceID);
 update  WEBC_NEWS set ChangeStamp=sysdate
,
  TheDate=aTheDate
,
  ShortName=aShortName
,
  Info=aInfo
,
  Accept=aAccept
,
  Annotation=aAnnotation
  where  WEBC_NEWSID = aWEBC_NEWSID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WEBC_NEWS',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WEBC_NEWS');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WEBC_NEWS');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WEBC_NEWS',
 aVERB=>'CREATEROW',  aThe_Resource=>aWEBC_NEWSid,aLogInstanceID=>aInstanceID);
 insert into   WEBC_NEWS
 (  WEBC_NEWSID 
,InstanceID
,TheDate

,ShortName

,Info

,Accept

,Annotation

 ) values ( aWEBC_NEWSID 
,aInstanceID
,aTheDate

,aShortName

,aInfo

,aAccept

,aAnnotation

 ); 
 WEBC_NEWS_SINIT( aCURSESSION,aWEBC_NEWSid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WEBC_NEWS_PARENT /*Новости*/ (
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
  select  INSTANCEID into aParentID from WEBC_NEWS where  WEBC_NEWSid=aRowID;
 end; 


procedure WEBC_NEWS_ISLOCKED /*Новости*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WEBC_NEWS where WEBC_NEWSid=aRowID;
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
  WEBC_NEWS_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WEBC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WEBC_NEWS_LOCK /*Новости*/ (
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
 WEBC_NEWS_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WEBC_NEWS_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WEBC_NEWS where WEBC_NEWSid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WEBC_NEWS');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WEBC_NEWS set LockUserID =auserID ,LockSessionID =null where WEBC_NEWSid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WEBC_NEWS set LockUserID =null,LockSessionID =aCURSESSION  where WEBC_NEWSid=aRowID;
     return;
   end if;
 end ;


procedure WEBC_NEWS_HCL /*Новости*/ (
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


procedure WEBC_NEWS_UNLOCK /*Новости*/ (
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
 WEBC_NEWS_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WEBC_NEWS set LockUserID =null  where WEBC_NEWSid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WEBC_NEWS set LockSessionID =null  where WEBC_NEWSid=aRowID;
     return;
   end if;
 end; 


procedure WEBC_NEWS_SINIT /*Новости*/ (
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
 select  SecurityStyleID into atmpID from WEBC_NEWS where WEBC_NEWSid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WEBC_NEWS');
    return;
  end if;
if aSecurityStyleID is null then
 WEBC_NEWS_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WEBC_NEWS set securitystyleid =aStyleID where WEBC_NEWSid = aRowID;
else 
 update WEBC_NEWS set securitystyleid =aSecurityStyleID where WEBC_NEWSid = aRowID;
end if; 
end ; 


procedure WEBC_NEWS_propagate /*Новости*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WEBC_NEWS where WEBC_NEWSid=aRowid;
end;



procedure WEBC_JOB_BRIEF  (
 aCURSESSION CHAR,
 aWEBC_JOBid CHAR,
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
if aWEBC_JOBid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WEBC_JOB where WEBC_JOBID=aWEBC_JOBID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WEBC_JOB where WEBC_JOBid=aWEBC_JOBID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WEBC_JOB');
    return;
  end if;
  aBRIEF:=func.WEBC_JOB_BRIEF_F(aWEBC_JOBid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WEBC_JOB_DELETE /*Вакансии*/ (
 aCURSESSION CHAR,
 aWEBC_JOBid CHAR,
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
select count(*) into existsCnt from WEBC_JOB where WEBC_JOBID=aWEBC_JOBID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WEBC_JOB where WEBC_JOBid=aWEBC_JOBID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WEBC_JOB',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WEBC_JOB');
      return;
    end if;
  end if;
 --  verify lock  --
 WEBC_JOB_ISLOCKED( acursession=>acursession,aROWID=>aWEBC_JOBid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WEBC_JOB');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WEBC_JOB',
 aVERB=>'DELETEROW',  aThe_Resource=>aWEBC_JOBid, aLogInstanceID=>aInstanceID);
declare cursor chld_WEBC_JOB is select  instanceid ID from instance where OwnerPartName ='WEBC_JOB' and OwnerRowID=aWEBC_JOBid;
row_WEBC_JOB  chld_WEBC_JOB%ROWTYPE;
begin
--open chld_WEBC_JOB;
for row_WEBC_JOB in chld_WEBC_JOB loop
 Kernel.INSTANCE_OWNER (acursession,row_WEBC_JOB.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WEBC_JOB.id);
end loop;
--close chld_WEBC_JOB;
end ;
  delete from  WEBC_JOB 
  where  WEBC_JOBID = aWEBC_JOBID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Вакансии*/
procedure WEBC_JOB_SAVE /*Вакансии*/ (
 aCURSESSION CHAR,
 aWEBC_JOBid CHAR,
aInstanceID CHAR 
,aJobDate
 DATE/* Дата *//* Дата */
,aJobName
 VARCHAR2/* Название *//* Название */
,aJobCity
 VARCHAR2 := null /* Город *//* Город */
,aJobSex
 NUMBER := null /* Пол *//* Пол */
,aJobAge
 VARCHAR2 := null /* Возраст *//* Возраст */
,aJobEducation
 NUMBER := null /* Образование *//* Образование */
,aJobExperience
 VARCHAR2 := null /* Опыт работы *//* Опыт работы */
,aJobEmployment
 NUMBER := null /* Занятость *//* Занятость */
,aJobCompensation
 VARCHAR2 := null /* Зарплата *//* Зарплата */
,aJobDescription
 VARCHAR2/* Описание *//* Описание */
,aJobActual
 NUMBER/* Актуальность *//* Актуальность */
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
select count(*) into existsCnt from WEBC_JOB where WEBC_JOBID=aWEBC_JOBID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WEBC_JOB where WEBC_JOBid=aWEBC_JOBID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WEBC_JOB',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WEBC_JOB');
      return;
    end if;
  end if;
 --  verify lock  --
 WEBC_JOB_ISLOCKED( acursession=>acursession,aROWID=>aWEBC_JOBid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WEBC_JOB');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WEBC_JOB',
 aVERB=>'EDITROW',  aThe_Resource=>aWEBC_JOBid,aLogInstanceID=>aInstanceID);
 update  WEBC_JOB set ChangeStamp=sysdate
,
  JobDate=aJobDate
,
  JobName=aJobName
,
  JobCity=aJobCity
,
  JobSex=aJobSex
,
  JobAge=aJobAge
,
  JobEducation=aJobEducation
,
  JobExperience=aJobExperience
,
  JobEmployment=aJobEmployment
,
  JobCompensation=aJobCompensation
,
  JobDescription=aJobDescription
,
  JobActual=aJobActual
  where  WEBC_JOBID = aWEBC_JOBID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WEBC_JOB',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WEBC_JOB');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WEBC_JOB');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WEBC_JOB',
 aVERB=>'CREATEROW',  aThe_Resource=>aWEBC_JOBid,aLogInstanceID=>aInstanceID);
 insert into   WEBC_JOB
 (  WEBC_JOBID 
,InstanceID
,JobDate

,JobName

,JobCity

,JobSex

,JobAge

,JobEducation

,JobExperience

,JobEmployment

,JobCompensation

,JobDescription

,JobActual

 ) values ( aWEBC_JOBID 
,aInstanceID
,aJobDate

,aJobName

,aJobCity

,aJobSex

,aJobAge

,aJobEducation

,aJobExperience

,aJobEmployment

,aJobCompensation

,aJobDescription

,aJobActual

 ); 
 WEBC_JOB_SINIT( aCURSESSION,aWEBC_JOBid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WEBC_JOB_PARENT /*Вакансии*/ (
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
  select  INSTANCEID into aParentID from WEBC_JOB where  WEBC_JOBid=aRowID;
 end; 


procedure WEBC_JOB_ISLOCKED /*Вакансии*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WEBC_JOB where WEBC_JOBid=aRowID;
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
  WEBC_JOB_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WEBC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WEBC_JOB_LOCK /*Вакансии*/ (
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
 WEBC_JOB_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WEBC_JOB_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WEBC_JOB where WEBC_JOBid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WEBC_JOB');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WEBC_JOB set LockUserID =auserID ,LockSessionID =null where WEBC_JOBid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WEBC_JOB set LockUserID =null,LockSessionID =aCURSESSION  where WEBC_JOBid=aRowID;
     return;
   end if;
 end ;


procedure WEBC_JOB_HCL /*Вакансии*/ (
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


procedure WEBC_JOB_UNLOCK /*Вакансии*/ (
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
 WEBC_JOB_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WEBC_JOB set LockUserID =null  where WEBC_JOBid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WEBC_JOB set LockSessionID =null  where WEBC_JOBid=aRowID;
     return;
   end if;
 end; 


procedure WEBC_JOB_SINIT /*Вакансии*/ (
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
 select  SecurityStyleID into atmpID from WEBC_JOB where WEBC_JOBid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WEBC_JOB');
    return;
  end if;
if aSecurityStyleID is null then
 WEBC_JOB_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WEBC_JOB set securitystyleid =aStyleID where WEBC_JOBid = aRowID;
else 
 update WEBC_JOB set securitystyleid =aSecurityStyleID where WEBC_JOBid = aRowID;
end if; 
end ; 


procedure WEBC_JOB_propagate /*Вакансии*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WEBC_JOB where WEBC_JOBid=aRowid;
end;



procedure WEBC_MESSAGES_BRIEF  (
 aCURSESSION CHAR,
 aWEBC_MESSAGESid CHAR,
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
if aWEBC_MESSAGESid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WEBC_MESSAGES where WEBC_MESSAGESID=aWEBC_MESSAGESID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WEBC_MESSAGES where WEBC_MESSAGESid=aWEBC_MESSAGESID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WEBC_MESSAGES');
    return;
  end if;
  aBRIEF:=func.WEBC_MESSAGES_BRIEF_F(aWEBC_MESSAGESid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WEBC_MESSAGES_DELETE /*Сообщения от посетителей*/ (
 aCURSESSION CHAR,
 aWEBC_MESSAGESid CHAR,
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
select count(*) into existsCnt from WEBC_MESSAGES where WEBC_MESSAGESID=aWEBC_MESSAGESID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WEBC_MESSAGES where WEBC_MESSAGESid=aWEBC_MESSAGESID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WEBC_MESSAGES',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WEBC_MESSAGES');
      return;
    end if;
  end if;
 --  verify lock  --
 WEBC_MESSAGES_ISLOCKED( acursession=>acursession,aROWID=>aWEBC_MESSAGESid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WEBC_MESSAGES');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WEBC_MESSAGES',
 aVERB=>'DELETEROW',  aThe_Resource=>aWEBC_MESSAGESid, aLogInstanceID=>aInstanceID);
declare cursor chld_WEBC_MESSAGES is select  instanceid ID from instance where OwnerPartName ='WEBC_MESSAGES' and OwnerRowID=aWEBC_MESSAGESid;
row_WEBC_MESSAGES  chld_WEBC_MESSAGES%ROWTYPE;
begin
--open chld_WEBC_MESSAGES;
for row_WEBC_MESSAGES in chld_WEBC_MESSAGES loop
 Kernel.INSTANCE_OWNER (acursession,row_WEBC_MESSAGES.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WEBC_MESSAGES.id);
end loop;
--close chld_WEBC_MESSAGES;
end ;
  delete from  WEBC_MESSAGES 
  where  WEBC_MESSAGESID = aWEBC_MESSAGESID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Сообщения*/
procedure WEBC_MESSAGES_SAVE /*Сообщения от посетителей*/ (
 aCURSESSION CHAR,
 aWEBC_MESSAGESid CHAR,
aInstanceID CHAR 
,aMESSAGES_FIO
 VARCHAR2/* Фамилия, имя, отчество *//* Фамилия, имя, отчество */
,aMESSAGES_Email
 VARCHAR2/* Адрес электронной почты *//* Адрес электронной почты */
,aMESSAGES_TEL
 VARCHAR2 := null /* Телефон *//* Телефон */
,aMESSAGES_City
 VARCHAR2 := null /* Город *//* Город */
,aMESSAGES_Org
 VARCHAR2 := null /* Название организации *//* Название организации */
,aMESSAGES_Position
 VARCHAR2 := null /* Специальность/должность *//* Специальность/должность */
,aMESSAGES_Text
 VARCHAR2/* Сообщение *//* Сообщение */
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
select count(*) into existsCnt from WEBC_MESSAGES where WEBC_MESSAGESID=aWEBC_MESSAGESID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WEBC_MESSAGES where WEBC_MESSAGESid=aWEBC_MESSAGESID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WEBC_MESSAGES',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WEBC_MESSAGES');
      return;
    end if;
  end if;
 --  verify lock  --
 WEBC_MESSAGES_ISLOCKED( acursession=>acursession,aROWID=>aWEBC_MESSAGESid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WEBC_MESSAGES');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WEBC_MESSAGES',
 aVERB=>'EDITROW',  aThe_Resource=>aWEBC_MESSAGESid,aLogInstanceID=>aInstanceID);
 update  WEBC_MESSAGES set ChangeStamp=sysdate
,
  MESSAGES_FIO=aMESSAGES_FIO
,
  MESSAGES_Email=aMESSAGES_Email
,
  MESSAGES_TEL=aMESSAGES_TEL
,
  MESSAGES_City=aMESSAGES_City
,
  MESSAGES_Org=aMESSAGES_Org
,
  MESSAGES_Position=aMESSAGES_Position
,
  MESSAGES_Text=aMESSAGES_Text
  where  WEBC_MESSAGESID = aWEBC_MESSAGESID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WEBC_MESSAGES',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WEBC_MESSAGES');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WEBC_MESSAGES');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WEBC_MESSAGES',
 aVERB=>'CREATEROW',  aThe_Resource=>aWEBC_MESSAGESid,aLogInstanceID=>aInstanceID);
 insert into   WEBC_MESSAGES
 (  WEBC_MESSAGESID 
,InstanceID
,MESSAGES_FIO

,MESSAGES_Email

,MESSAGES_TEL

,MESSAGES_City

,MESSAGES_Org

,MESSAGES_Position

,MESSAGES_Text

 ) values ( aWEBC_MESSAGESID 
,aInstanceID
,aMESSAGES_FIO

,aMESSAGES_Email

,aMESSAGES_TEL

,aMESSAGES_City

,aMESSAGES_Org

,aMESSAGES_Position

,aMESSAGES_Text

 ); 
 WEBC_MESSAGES_SINIT( aCURSESSION,aWEBC_MESSAGESid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WEBC_MESSAGES_PARENT /*Сообщения от посетителей*/ (
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
  select  INSTANCEID into aParentID from WEBC_MESSAGES where  WEBC_MESSAGESid=aRowID;
 end; 


procedure WEBC_MESSAGES_ISLOCKED /*Сообщения от посетителей*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WEBC_MESSAGES where WEBC_MESSAGESid=aRowID;
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
  WEBC_MESSAGES_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WEBC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WEBC_MESSAGES_LOCK /*Сообщения от посетителей*/ (
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
 WEBC_MESSAGES_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WEBC_MESSAGES_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WEBC_MESSAGES where WEBC_MESSAGESid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WEBC_MESSAGES');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WEBC_MESSAGES set LockUserID =auserID ,LockSessionID =null where WEBC_MESSAGESid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WEBC_MESSAGES set LockUserID =null,LockSessionID =aCURSESSION  where WEBC_MESSAGESid=aRowID;
     return;
   end if;
 end ;


procedure WEBC_MESSAGES_HCL /*Сообщения от посетителей*/ (
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


procedure WEBC_MESSAGES_UNLOCK /*Сообщения от посетителей*/ (
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
 WEBC_MESSAGES_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WEBC_MESSAGES set LockUserID =null  where WEBC_MESSAGESid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WEBC_MESSAGES set LockSessionID =null  where WEBC_MESSAGESid=aRowID;
     return;
   end if;
 end; 


procedure WEBC_MESSAGES_SINIT /*Сообщения от посетителей*/ (
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
 select  SecurityStyleID into atmpID from WEBC_MESSAGES where WEBC_MESSAGESid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WEBC_MESSAGES');
    return;
  end if;
if aSecurityStyleID is null then
 WEBC_MESSAGES_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WEBC_MESSAGES set securitystyleid =aStyleID where WEBC_MESSAGESid = aRowID;
else 
 update WEBC_MESSAGES set securitystyleid =aSecurityStyleID where WEBC_MESSAGESid = aRowID;
end if; 
end ; 


procedure WEBC_MESSAGES_propagate /*Сообщения от посетителей*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WEBC_MESSAGES where WEBC_MESSAGESid=aRowid;
end;



procedure WEBC_DOCS_BRIEF  (
 aCURSESSION CHAR,
 aWEBC_DOCSid CHAR,
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
if aWEBC_DOCSid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WEBC_DOCS where WEBC_DOCSID=aWEBC_DOCSID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WEBC_DOCS where WEBC_DOCSid=aWEBC_DOCSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WEBC_DOCS');
    return;
  end if;
  aBRIEF:=func.WEBC_DOCS_BRIEF_F(aWEBC_DOCSid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WEBC_DOCS_DELETE /*Документы*/ (
 aCURSESSION CHAR,
 aWEBC_DOCSid CHAR,
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
select count(*) into existsCnt from WEBC_DOCS where WEBC_DOCSID=aWEBC_DOCSID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WEBC_DOCS where WEBC_DOCSid=aWEBC_DOCSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WEBC_DOCS',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WEBC_DOCS');
      return;
    end if;
  end if;
 --  verify lock  --
 WEBC_DOCS_ISLOCKED( acursession=>acursession,aROWID=>aWEBC_DOCSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WEBC_DOCS');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WEBC_DOCS',
 aVERB=>'DELETEROW',  aThe_Resource=>aWEBC_DOCSid, aLogInstanceID=>aInstanceID);
declare cursor chld_WEBC_DOCS is select  instanceid ID from instance where OwnerPartName ='WEBC_DOCS' and OwnerRowID=aWEBC_DOCSid;
row_WEBC_DOCS  chld_WEBC_DOCS%ROWTYPE;
begin
--open chld_WEBC_DOCS;
for row_WEBC_DOCS in chld_WEBC_DOCS loop
 Kernel.INSTANCE_OWNER (acursession,row_WEBC_DOCS.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WEBC_DOCS.id);
end loop;
--close chld_WEBC_DOCS;
end ;
  delete from  WEBC_DOCS 
  where  WEBC_DOCSID = aWEBC_DOCSID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Документы*/
procedure WEBC_DOCS_SAVE /*Документы*/ (
 aCURSESSION CHAR,
 aWEBC_DOCSid CHAR,
aInstanceID CHAR 
,aDocsNum
 NUMBER/* № *//* № */
,aDocsName
 VARCHAR2/* Название *//* Название */
,aDocsFileName
 VARCHAR2/* Имя файла *//* Имя файла */
,aDocsFileSize
 NUMBER := null /* Размер *//* Размер */
,aDocsFileDate
 DATE := null /* Дата  *//* Дата  */
,aDocsDescription
 VARCHAR2 := null /* Примечания *//* Примечания */
,aDocsActual
 NUMBER/* Актуальность *//* Актуальность */
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
select count(*) into existsCnt from WEBC_DOCS where WEBC_DOCSID=aWEBC_DOCSID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WEBC_DOCS where WEBC_DOCSid=aWEBC_DOCSID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WEBC_DOCS',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WEBC_DOCS');
      return;
    end if;
  end if;
 --  verify lock  --
 WEBC_DOCS_ISLOCKED( acursession=>acursession,aROWID=>aWEBC_DOCSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WEBC_DOCS');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WEBC_DOCS',
 aVERB=>'EDITROW',  aThe_Resource=>aWEBC_DOCSid,aLogInstanceID=>aInstanceID);
 update  WEBC_DOCS set ChangeStamp=sysdate
,
  DocsNum=aDocsNum
,
  DocsName=aDocsName
,
  DocsFileName=aDocsFileName
,
  DocsFileSize=aDocsFileSize
,
  DocsFileDate=aDocsFileDate
,
  DocsDescription=aDocsDescription
,
  DocsActual=aDocsActual
  where  WEBC_DOCSID = aWEBC_DOCSID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WEBC_DOCS',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WEBC_DOCS');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WEBC_DOCS');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WEBC_DOCS',
 aVERB=>'CREATEROW',  aThe_Resource=>aWEBC_DOCSid,aLogInstanceID=>aInstanceID);
 insert into   WEBC_DOCS
 (  WEBC_DOCSID 
,InstanceID
,DocsNum

,DocsName

,DocsFileName

,DocsFileSize

,DocsFileDate

,DocsDescription

,DocsActual

 ) values ( aWEBC_DOCSID 
,aInstanceID
,aDocsNum

,aDocsName

,aDocsFileName

,aDocsFileSize

,aDocsFileDate

,aDocsDescription

,aDocsActual

 ); 
 WEBC_DOCS_SINIT( aCURSESSION,aWEBC_DOCSid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WEBC_DOCS_PARENT /*Документы*/ (
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
  select  INSTANCEID into aParentID from WEBC_DOCS where  WEBC_DOCSid=aRowID;
 end; 


procedure WEBC_DOCS_ISLOCKED /*Документы*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WEBC_DOCS where WEBC_DOCSid=aRowID;
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
  WEBC_DOCS_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WEBC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WEBC_DOCS_LOCK /*Документы*/ (
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
 WEBC_DOCS_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WEBC_DOCS_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WEBC_DOCS where WEBC_DOCSid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WEBC_DOCS');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WEBC_DOCS set LockUserID =auserID ,LockSessionID =null where WEBC_DOCSid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WEBC_DOCS set LockUserID =null,LockSessionID =aCURSESSION  where WEBC_DOCSid=aRowID;
     return;
   end if;
 end ;


procedure WEBC_DOCS_HCL /*Документы*/ (
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


procedure WEBC_DOCS_UNLOCK /*Документы*/ (
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
 WEBC_DOCS_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WEBC_DOCS set LockUserID =null  where WEBC_DOCSid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WEBC_DOCS set LockSessionID =null  where WEBC_DOCSid=aRowID;
     return;
   end if;
 end; 


procedure WEBC_DOCS_SINIT /*Документы*/ (
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
 select  SecurityStyleID into atmpID from WEBC_DOCS where WEBC_DOCSid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WEBC_DOCS');
    return;
  end if;
if aSecurityStyleID is null then
 WEBC_DOCS_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WEBC_DOCS set securitystyleid =aStyleID where WEBC_DOCSid = aRowID;
else 
 update WEBC_DOCS set securitystyleid =aSecurityStyleID where WEBC_DOCSid = aRowID;
end if; 
end ; 


procedure WEBC_DOCS_propagate /*Документы*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WEBC_DOCS where WEBC_DOCSid=aRowid;
end;



procedure WEBC_FILIALS_BRIEF  (
 aCURSESSION CHAR,
 aWEBC_FILIALSid CHAR,
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
if aWEBC_FILIALSid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WEBC_FILIALS where WEBC_FILIALSID=aWEBC_FILIALSID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WEBC_FILIALS where WEBC_FILIALSid=aWEBC_FILIALSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WEBC_FILIALS');
    return;
  end if;
  aBRIEF:=func.WEBC_FILIALS_BRIEF_F(aWEBC_FILIALSid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WEBC_FILIALS_DELETE /*Офис и филиалы*/ (
 aCURSESSION CHAR,
 aWEBC_FILIALSid CHAR,
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
select count(*) into existsCnt from WEBC_FILIALS where WEBC_FILIALSID=aWEBC_FILIALSID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WEBC_FILIALS where WEBC_FILIALSid=aWEBC_FILIALSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WEBC_FILIALS',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WEBC_FILIALS');
      return;
    end if;
  end if;
 --  verify lock  --
 WEBC_FILIALS_ISLOCKED( acursession=>acursession,aROWID=>aWEBC_FILIALSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WEBC_FILIALS');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WEBC_FILIALS',
 aVERB=>'DELETEROW',  aThe_Resource=>aWEBC_FILIALSid, aLogInstanceID=>aInstanceID);
declare cursor chld_WEBC_FILIALS is select  instanceid ID from instance where OwnerPartName ='WEBC_FILIALS' and OwnerRowID=aWEBC_FILIALSid;
row_WEBC_FILIALS  chld_WEBC_FILIALS%ROWTYPE;
begin
--open chld_WEBC_FILIALS;
for row_WEBC_FILIALS in chld_WEBC_FILIALS loop
 Kernel.INSTANCE_OWNER (acursession,row_WEBC_FILIALS.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WEBC_FILIALS.id);
end loop;
--close chld_WEBC_FILIALS;
end ;
  delete from  WEBC_FILIALS 
  where  WEBC_FILIALSID = aWEBC_FILIALSID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Офис и филиалы*/
procedure WEBC_FILIALS_SAVE /*Офис и филиалы*/ (
 aCURSESSION CHAR,
 aWEBC_FILIALSid CHAR,
aInstanceID CHAR 
,aOfficeName
 VARCHAR2/* Название *//* Название */
,aOfficeCity
 VARCHAR2 := null /* Город *//* Город */
,aOfficeAddress
 VARCHAR2/* Адрес *//* Адрес */
,aOfficeTelefons
 VARCHAR2 := null /* Телефоны *//* Телефоны */
,aOfficeSmallImage
 VARCHAR2 := null /* URL картинки со схемой *//* URL картинки со схемой */
,aOfficeBigImage
 VARCHAR2 := null /* URL картинки увеличенной *//* URL картинки увеличенной */
,aOfficeNum
 NUMBER/* № *//* № */
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
select count(*) into existsCnt from WEBC_FILIALS where WEBC_FILIALSID=aWEBC_FILIALSID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WEBC_FILIALS where WEBC_FILIALSid=aWEBC_FILIALSID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WEBC_FILIALS',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WEBC_FILIALS');
      return;
    end if;
  end if;
 --  verify lock  --
 WEBC_FILIALS_ISLOCKED( acursession=>acursession,aROWID=>aWEBC_FILIALSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WEBC_FILIALS');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WEBC_FILIALS',
 aVERB=>'EDITROW',  aThe_Resource=>aWEBC_FILIALSid,aLogInstanceID=>aInstanceID);
 update  WEBC_FILIALS set ChangeStamp=sysdate
,
  OfficeName=aOfficeName
,
  OfficeCity=aOfficeCity
,
  OfficeAddress=aOfficeAddress
,
  OfficeTelefons=aOfficeTelefons
,
  OfficeSmallImage=aOfficeSmallImage
,
  OfficeBigImage=aOfficeBigImage
,
  OfficeNum=aOfficeNum
  where  WEBC_FILIALSID = aWEBC_FILIALSID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WEBC_FILIALS',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WEBC_FILIALS');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WEBC_FILIALS');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WEBC_FILIALS',
 aVERB=>'CREATEROW',  aThe_Resource=>aWEBC_FILIALSid,aLogInstanceID=>aInstanceID);
 insert into   WEBC_FILIALS
 (  WEBC_FILIALSID 
,InstanceID
,OfficeName

,OfficeCity

,OfficeAddress

,OfficeTelefons

,OfficeSmallImage

,OfficeBigImage

,OfficeNum

 ) values ( aWEBC_FILIALSID 
,aInstanceID
,aOfficeName

,aOfficeCity

,aOfficeAddress

,aOfficeTelefons

,aOfficeSmallImage

,aOfficeBigImage

,aOfficeNum

 ); 
 WEBC_FILIALS_SINIT( aCURSESSION,aWEBC_FILIALSid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WEBC_FILIALS_PARENT /*Офис и филиалы*/ (
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
  select  INSTANCEID into aParentID from WEBC_FILIALS where  WEBC_FILIALSid=aRowID;
 end; 


procedure WEBC_FILIALS_ISLOCKED /*Офис и филиалы*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WEBC_FILIALS where WEBC_FILIALSid=aRowID;
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
  WEBC_FILIALS_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WEBC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WEBC_FILIALS_LOCK /*Офис и филиалы*/ (
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
 WEBC_FILIALS_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WEBC_FILIALS_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WEBC_FILIALS where WEBC_FILIALSid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WEBC_FILIALS');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WEBC_FILIALS set LockUserID =auserID ,LockSessionID =null where WEBC_FILIALSid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WEBC_FILIALS set LockUserID =null,LockSessionID =aCURSESSION  where WEBC_FILIALSid=aRowID;
     return;
   end if;
 end ;


procedure WEBC_FILIALS_HCL /*Офис и филиалы*/ (
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


procedure WEBC_FILIALS_UNLOCK /*Офис и филиалы*/ (
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
 WEBC_FILIALS_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WEBC_FILIALS set LockUserID =null  where WEBC_FILIALSid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WEBC_FILIALS set LockSessionID =null  where WEBC_FILIALSid=aRowID;
     return;
   end if;
 end; 


procedure WEBC_FILIALS_SINIT /*Офис и филиалы*/ (
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
 select  SecurityStyleID into atmpID from WEBC_FILIALS where WEBC_FILIALSid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WEBC_FILIALS');
    return;
  end if;
if aSecurityStyleID is null then
 WEBC_FILIALS_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WEBC_FILIALS set securitystyleid =aStyleID where WEBC_FILIALSid = aRowID;
else 
 update WEBC_FILIALS set securitystyleid =aSecurityStyleID where WEBC_FILIALSid = aRowID;
end if; 
end ; 


procedure WEBC_FILIALS_propagate /*Офис и филиалы*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WEBC_FILIALS where WEBC_FILIALSid=aRowid;
end;



procedure WEBC_LINKS_BRIEF  (
 aCURSESSION CHAR,
 aWEBC_LINKSid CHAR,
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
if aWEBC_LINKSid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WEBC_LINKS where WEBC_LINKSID=aWEBC_LINKSID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WEBC_LINKS where WEBC_LINKSid=aWEBC_LINKSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WEBC_LINKS');
    return;
  end if;
  aBRIEF:=func.WEBC_LINKS_BRIEF_F(aWEBC_LINKSid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WEBC_LINKS_DELETE /*Ссылки*/ (
 aCURSESSION CHAR,
 aWEBC_LINKSid CHAR,
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
select count(*) into existsCnt from WEBC_LINKS where WEBC_LINKSID=aWEBC_LINKSID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WEBC_LINKS where WEBC_LINKSid=aWEBC_LINKSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WEBC_LINKS',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WEBC_LINKS');
      return;
    end if;
  end if;
 --  verify lock  --
 WEBC_LINKS_ISLOCKED( acursession=>acursession,aROWID=>aWEBC_LINKSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WEBC_LINKS');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WEBC_LINKS',
 aVERB=>'DELETEROW',  aThe_Resource=>aWEBC_LINKSid, aLogInstanceID=>aInstanceID);
declare cursor chld_WEBC_LINKS is select  instanceid ID from instance where OwnerPartName ='WEBC_LINKS' and OwnerRowID=aWEBC_LINKSid;
row_WEBC_LINKS  chld_WEBC_LINKS%ROWTYPE;
begin
--open chld_WEBC_LINKS;
for row_WEBC_LINKS in chld_WEBC_LINKS loop
 Kernel.INSTANCE_OWNER (acursession,row_WEBC_LINKS.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WEBC_LINKS.id);
end loop;
--close chld_WEBC_LINKS;
end ;
  delete from  WEBC_LINKS 
  where  WEBC_LINKSID = aWEBC_LINKSID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Ссылки*/
procedure WEBC_LINKS_SAVE /*Ссылки*/ (
 aCURSESSION CHAR,
 aWEBC_LINKSid CHAR,
aInstanceID CHAR 
,aLinkName
 VARCHAR2/* Название *//* Название */
,aLinkURL
 VARCHAR2/* Ссылка *//* Ссылка */
,aLinkDescription
 VARCHAR2/* Описание *//* Описание */
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
select count(*) into existsCnt from WEBC_LINKS where WEBC_LINKSID=aWEBC_LINKSID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WEBC_LINKS where WEBC_LINKSid=aWEBC_LINKSID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WEBC_LINKS',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WEBC_LINKS');
      return;
    end if;
  end if;
 --  verify lock  --
 WEBC_LINKS_ISLOCKED( acursession=>acursession,aROWID=>aWEBC_LINKSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WEBC_LINKS');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WEBC_LINKS',
 aVERB=>'EDITROW',  aThe_Resource=>aWEBC_LINKSid,aLogInstanceID=>aInstanceID);
 update  WEBC_LINKS set ChangeStamp=sysdate
,
  LinkName=aLinkName
,
  LinkURL=aLinkURL
,
  LinkDescription=aLinkDescription
  where  WEBC_LINKSID = aWEBC_LINKSID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WEBC_LINKS',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WEBC_LINKS');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WEBC_LINKS');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WEBC_LINKS',
 aVERB=>'CREATEROW',  aThe_Resource=>aWEBC_LINKSid,aLogInstanceID=>aInstanceID);
 insert into   WEBC_LINKS
 (  WEBC_LINKSID 
,InstanceID
,LinkName

,LinkURL

,LinkDescription

 ) values ( aWEBC_LINKSID 
,aInstanceID
,aLinkName

,aLinkURL

,aLinkDescription

 ); 
 WEBC_LINKS_SINIT( aCURSESSION,aWEBC_LINKSid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WEBC_LINKS_PARENT /*Ссылки*/ (
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
  select  INSTANCEID into aParentID from WEBC_LINKS where  WEBC_LINKSid=aRowID;
 end; 


procedure WEBC_LINKS_ISLOCKED /*Ссылки*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WEBC_LINKS where WEBC_LINKSid=aRowID;
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
  WEBC_LINKS_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WEBC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WEBC_LINKS_LOCK /*Ссылки*/ (
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
 WEBC_LINKS_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WEBC_LINKS_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WEBC_LINKS where WEBC_LINKSid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WEBC_LINKS');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WEBC_LINKS set LockUserID =auserID ,LockSessionID =null where WEBC_LINKSid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WEBC_LINKS set LockUserID =null,LockSessionID =aCURSESSION  where WEBC_LINKSid=aRowID;
     return;
   end if;
 end ;


procedure WEBC_LINKS_HCL /*Ссылки*/ (
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


procedure WEBC_LINKS_UNLOCK /*Ссылки*/ (
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
 WEBC_LINKS_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WEBC_LINKS set LockUserID =null  where WEBC_LINKSid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WEBC_LINKS set LockSessionID =null  where WEBC_LINKSid=aRowID;
     return;
   end if;
 end; 


procedure WEBC_LINKS_SINIT /*Ссылки*/ (
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
 select  SecurityStyleID into atmpID from WEBC_LINKS where WEBC_LINKSid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WEBC_LINKS');
    return;
  end if;
if aSecurityStyleID is null then
 WEBC_LINKS_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WEBC_LINKS set securitystyleid =aStyleID where WEBC_LINKSid = aRowID;
else 
 update WEBC_LINKS set securitystyleid =aSecurityStyleID where WEBC_LINKSid = aRowID;
end if; 
end ; 


procedure WEBC_LINKS_propagate /*Ссылки*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WEBC_LINKS where WEBC_LINKSid=aRowid;
end;


end WEBC;

/



