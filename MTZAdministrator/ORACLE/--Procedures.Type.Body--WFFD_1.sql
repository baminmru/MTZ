
/* --WFFD*/

 create or replace package body WFFD as

procedure WFFD_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='WFFD'
then
declare cursor child_WFFD_ShortCut is select WFFD_ShortCut.WFFD_ShortCutid ID from WFFD_ShortCut where  WFFD_ShortCut.InstanceID = ainstanceid;
row_WFFD_ShortCut  child_WFFD_ShortCut%ROWTYPE;
begin
--open child_WFFD_ShortCut;
for row_WFFD_ShortCut in child_WFFD_ShortCut loop
 WFFD_ShortCut_DELETE (acursession,row_WFFD_ShortCut.id,aInstanceID);
end loop;
--close child_WFFD_ShortCut;
end;
declare cursor child_WFFD_Results is select WFFD_Results.WFFD_Resultsid ID from WFFD_Results where  WFFD_Results.InstanceID = ainstanceid;
row_WFFD_Results  child_WFFD_Results%ROWTYPE;
begin
--open child_WFFD_Results;
for row_WFFD_Results in child_WFFD_Results loop
 WFFD_Results_DELETE (acursession,row_WFFD_Results.id,aInstanceID);
end loop;
--close child_WFFD_Results;
end;
declare cursor child_WFFD_CustomParam is select WFFD_CustomParam.WFFD_CustomParamid ID from WFFD_CustomParam where  WFFD_CustomParam.InstanceID = ainstanceid;
row_WFFD_CustomParam  child_WFFD_CustomParam%ROWTYPE;
begin
--open child_WFFD_CustomParam;
for row_WFFD_CustomParam in child_WFFD_CustomParam loop
 WFFD_CustomParam_DELETE (acursession,row_WFFD_CustomParam.id,aInstanceID);
end loop;
--close child_WFFD_CustomParam;
end;
declare cursor child_WFFD_Doer is select WFFD_Doer.WFFD_Doerid ID from WFFD_Doer where  WFFD_Doer.InstanceID = ainstanceid;
row_WFFD_Doer  child_WFFD_Doer%ROWTYPE;
begin
--open child_WFFD_Doer;
for row_WFFD_Doer in child_WFFD_Doer loop
 WFFD_Doer_DELETE (acursession,row_WFFD_Doer.id,aInstanceID);
end loop;
--close child_WFFD_Doer;
end;
declare cursor child_WFFD_common is select WFFD_common.WFFD_commonid ID from WFFD_common where  WFFD_common.InstanceID = ainstanceid;
row_WFFD_common  child_WFFD_common%ROWTYPE;
begin
--open child_WFFD_common;
for row_WFFD_common in child_WFFD_common loop
 WFFD_common_DELETE (acursession,row_WFFD_common.id,aInstanceID);
end loop;
--close child_WFFD_common;
end;
declare cursor child_WFFD_ATTR1 is select WFFD_ATTR1.WFFD_ATTR1id ID from WFFD_ATTR1 where  WFFD_ATTR1.InstanceID = ainstanceid;
row_WFFD_ATTR1  child_WFFD_ATTR1%ROWTYPE;
begin
--open child_WFFD_ATTR1;
for row_WFFD_ATTR1 in child_WFFD_ATTR1 loop
 WFFD_ATTR1_DELETE (acursession,row_WFFD_ATTR1.id,aInstanceID);
end loop;
--close child_WFFD_ATTR1;
end;
declare cursor child_WFFD_DOCS is select WFFD_DOCS.WFFD_DOCSid ID from WFFD_DOCS where  WFFD_DOCS.InstanceID = ainstanceid;
row_WFFD_DOCS  child_WFFD_DOCS%ROWTYPE;
begin
--open child_WFFD_DOCS;
for row_WFFD_DOCS in child_WFFD_DOCS loop
 WFFD_DOCS_DELETE (acursession,row_WFFD_DOCS.id,aInstanceID);
end loop;
--close child_WFFD_DOCS;
end;
return;
<<del_error>>
return;
end if;
end;
procedure WFFD_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'WFFD'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_WFFD_ShortCut is select WFFD_ShortCut.WFFD_ShortCutid ID from WFFD_ShortCut where  WFFD_ShortCut.InstanceID = arowid;
ROW_WFFD_ShortCut  lch_WFFD_ShortCut%ROWTYPE;
begin
--open lch_WFFD_ShortCut;
for row_WFFD_ShortCut in lch_WFFD_ShortCut loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WFFD_ShortCut where WFFD_ShortCutid=row_WFFD_ShortCut.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFFD_ShortCut;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WFFD_ShortCut;
     return;
   end if; 
 end if; 
 WFFD_ShortCut_HCL (acursession,ROW_WFFD_ShortCut.id,aisLocked);
 if aisLocked >2 then
   close lch_WFFD_ShortCut;
   return;
 end if;
 end loop;
--close lch_WFFD_ShortCut;
end;
declare cursor lch_WFFD_Results is select WFFD_Results.WFFD_Resultsid ID from WFFD_Results where  WFFD_Results.InstanceID = arowid;
ROW_WFFD_Results  lch_WFFD_Results%ROWTYPE;
begin
--open lch_WFFD_Results;
for row_WFFD_Results in lch_WFFD_Results loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WFFD_Results where WFFD_Resultsid=row_WFFD_Results.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFFD_Results;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WFFD_Results;
     return;
   end if; 
 end if; 
 WFFD_Results_HCL (acursession,ROW_WFFD_Results.id,aisLocked);
 if aisLocked >2 then
   close lch_WFFD_Results;
   return;
 end if;
 end loop;
--close lch_WFFD_Results;
end;
declare cursor lch_WFFD_CustomParam is select WFFD_CustomParam.WFFD_CustomParamid ID from WFFD_CustomParam where  WFFD_CustomParam.InstanceID = arowid;
ROW_WFFD_CustomParam  lch_WFFD_CustomParam%ROWTYPE;
begin
--open lch_WFFD_CustomParam;
for row_WFFD_CustomParam in lch_WFFD_CustomParam loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WFFD_CustomParam where WFFD_CustomParamid=row_WFFD_CustomParam.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFFD_CustomParam;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WFFD_CustomParam;
     return;
   end if; 
 end if; 
 WFFD_CustomParam_HCL (acursession,ROW_WFFD_CustomParam.id,aisLocked);
 if aisLocked >2 then
   close lch_WFFD_CustomParam;
   return;
 end if;
 end loop;
--close lch_WFFD_CustomParam;
end;
declare cursor lch_WFFD_Doer is select WFFD_Doer.WFFD_Doerid ID from WFFD_Doer where  WFFD_Doer.InstanceID = arowid;
ROW_WFFD_Doer  lch_WFFD_Doer%ROWTYPE;
begin
--open lch_WFFD_Doer;
for row_WFFD_Doer in lch_WFFD_Doer loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WFFD_Doer where WFFD_Doerid=row_WFFD_Doer.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFFD_Doer;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WFFD_Doer;
     return;
   end if; 
 end if; 
 WFFD_Doer_HCL (acursession,ROW_WFFD_Doer.id,aisLocked);
 if aisLocked >2 then
   close lch_WFFD_Doer;
   return;
 end if;
 end loop;
--close lch_WFFD_Doer;
end;
declare cursor lch_WFFD_common is select WFFD_common.WFFD_commonid ID from WFFD_common where  WFFD_common.InstanceID = arowid;
ROW_WFFD_common  lch_WFFD_common%ROWTYPE;
begin
--open lch_WFFD_common;
for row_WFFD_common in lch_WFFD_common loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WFFD_common where WFFD_commonid=row_WFFD_common.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFFD_common;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WFFD_common;
     return;
   end if; 
 end if; 
 WFFD_common_HCL (acursession,ROW_WFFD_common.id,aisLocked);
 if aisLocked >2 then
   close lch_WFFD_common;
   return;
 end if;
 end loop;
--close lch_WFFD_common;
end;
declare cursor lch_WFFD_ATTR1 is select WFFD_ATTR1.WFFD_ATTR1id ID from WFFD_ATTR1 where  WFFD_ATTR1.InstanceID = arowid;
ROW_WFFD_ATTR1  lch_WFFD_ATTR1%ROWTYPE;
begin
--open lch_WFFD_ATTR1;
for row_WFFD_ATTR1 in lch_WFFD_ATTR1 loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WFFD_ATTR1 where WFFD_ATTR1id=row_WFFD_ATTR1.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFFD_ATTR1;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WFFD_ATTR1;
     return;
   end if; 
 end if; 
 WFFD_ATTR1_HCL (acursession,ROW_WFFD_ATTR1.id,aisLocked);
 if aisLocked >2 then
   close lch_WFFD_ATTR1;
   return;
 end if;
 end loop;
--close lch_WFFD_ATTR1;
end;
declare cursor lch_WFFD_DOCS is select WFFD_DOCS.WFFD_DOCSid ID from WFFD_DOCS where  WFFD_DOCS.InstanceID = arowid;
ROW_WFFD_DOCS  lch_WFFD_DOCS%ROWTYPE;
begin
--open lch_WFFD_DOCS;
for row_WFFD_DOCS in lch_WFFD_DOCS loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WFFD_DOCS where WFFD_DOCSid=row_WFFD_DOCS.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFFD_DOCS;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WFFD_DOCS;
     return;
   end if; 
 end if; 
 WFFD_DOCS_HCL (acursession,ROW_WFFD_DOCS.id,aisLocked);
 if aisLocked >2 then
   close lch_WFFD_DOCS;
   return;
 end if;
 end loop;
--close lch_WFFD_DOCS;
end;
 end if;
aIsLocked:=0;
end;
procedure WFFD_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'WFFD'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_WFFD_ShortCut is select WFFD_ShortCut.WFFD_ShortCutid id from WFFD_ShortCut where  WFFD_ShortCut.InstanceID = arowid;
row_WFFD_ShortCut  pch_WFFD_ShortCut%ROWTYPE;
begin
--open pch_WFFD_ShortCut;
for row_WFFD_ShortCut in  pch_WFFD_ShortCut loop
 WFFD_ShortCut_SINIT( acursession,row_WFFD_ShortCut.id,assid);
 WFFD_ShortCut_propagate( acursession,row_WFFD_ShortCut.id);
end loop;
--close pch_WFFD_ShortCut;
end;
declare cursor pch_WFFD_Results is select WFFD_Results.WFFD_Resultsid id from WFFD_Results where  WFFD_Results.InstanceID = arowid;
row_WFFD_Results  pch_WFFD_Results%ROWTYPE;
begin
--open pch_WFFD_Results;
for row_WFFD_Results in  pch_WFFD_Results loop
 WFFD_Results_SINIT( acursession,row_WFFD_Results.id,assid);
 WFFD_Results_propagate( acursession,row_WFFD_Results.id);
end loop;
--close pch_WFFD_Results;
end;
declare cursor pch_WFFD_CustomParam is select WFFD_CustomParam.WFFD_CustomParamid id from WFFD_CustomParam where  WFFD_CustomParam.InstanceID = arowid;
row_WFFD_CustomParam  pch_WFFD_CustomParam%ROWTYPE;
begin
--open pch_WFFD_CustomParam;
for row_WFFD_CustomParam in  pch_WFFD_CustomParam loop
 WFFD_CustomParam_SINIT( acursession,row_WFFD_CustomParam.id,assid);
 WFFD_CustomParam_propagate( acursession,row_WFFD_CustomParam.id);
end loop;
--close pch_WFFD_CustomParam;
end;
declare cursor pch_WFFD_Doer is select WFFD_Doer.WFFD_Doerid id from WFFD_Doer where  WFFD_Doer.InstanceID = arowid;
row_WFFD_Doer  pch_WFFD_Doer%ROWTYPE;
begin
--open pch_WFFD_Doer;
for row_WFFD_Doer in  pch_WFFD_Doer loop
 WFFD_Doer_SINIT( acursession,row_WFFD_Doer.id,assid);
 WFFD_Doer_propagate( acursession,row_WFFD_Doer.id);
end loop;
--close pch_WFFD_Doer;
end;
declare cursor pch_WFFD_common is select WFFD_common.WFFD_commonid id from WFFD_common where  WFFD_common.InstanceID = arowid;
row_WFFD_common  pch_WFFD_common%ROWTYPE;
begin
--open pch_WFFD_common;
for row_WFFD_common in  pch_WFFD_common loop
 WFFD_common_SINIT( acursession,row_WFFD_common.id,assid);
 WFFD_common_propagate( acursession,row_WFFD_common.id);
end loop;
--close pch_WFFD_common;
end;
declare cursor pch_WFFD_ATTR1 is select WFFD_ATTR1.WFFD_ATTR1id id from WFFD_ATTR1 where  WFFD_ATTR1.InstanceID = arowid;
row_WFFD_ATTR1  pch_WFFD_ATTR1%ROWTYPE;
begin
--open pch_WFFD_ATTR1;
for row_WFFD_ATTR1 in  pch_WFFD_ATTR1 loop
 WFFD_ATTR1_SINIT( acursession,row_WFFD_ATTR1.id,assid);
 WFFD_ATTR1_propagate( acursession,row_WFFD_ATTR1.id);
end loop;
--close pch_WFFD_ATTR1;
end;
declare cursor pch_WFFD_DOCS is select WFFD_DOCS.WFFD_DOCSid id from WFFD_DOCS where  WFFD_DOCS.InstanceID = arowid;
row_WFFD_DOCS  pch_WFFD_DOCS%ROWTYPE;
begin
--open pch_WFFD_DOCS;
for row_WFFD_DOCS in  pch_WFFD_DOCS loop
 WFFD_DOCS_SINIT( acursession,row_WFFD_DOCS.id,assid);
 WFFD_DOCS_propagate( acursession,row_WFFD_DOCS.id);
end loop;
--close pch_WFFD_DOCS;
end;
 end if; 
end;



procedure WFFD_ShortCut_BRIEF  (
 aCURSESSION CHAR,
 aWFFD_ShortCutid CHAR,
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
if aWFFD_ShortCutid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFFD_ShortCut where WFFD_ShortCutID=aWFFD_ShortCutID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFFD_ShortCut where WFFD_ShortCutid=aWFFD_ShortCutID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFFD_ShortCut');
    return;
  end if;
  aBRIEF:=func.WFFD_ShortCut_BRIEF_F(aWFFD_ShortCutid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFFD_ShortCut_DELETE /*Куда выставлять ярлыки*/ (
 aCURSESSION CHAR,
 aWFFD_ShortCutid CHAR,
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
select count(*) into existsCnt from WFFD_ShortCut where WFFD_ShortCutID=aWFFD_ShortCutID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFFD_ShortCut where WFFD_ShortCutid=aWFFD_ShortCutID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFFD_ShortCut',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFFD_ShortCut');
      return;
    end if;
  end if;
 --  verify lock  --
 WFFD_ShortCut_ISLOCKED( acursession=>acursession,aROWID=>aWFFD_ShortCutid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFFD_ShortCut');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFFD_ShortCut',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFFD_ShortCutid, aLogInstanceID=>aInstanceID);
declare cursor chld_WFFD_ShortCut is select  instanceid ID from instance where OwnerPartName ='WFFD_ShortCut' and OwnerRowID=aWFFD_ShortCutid;
row_WFFD_ShortCut  chld_WFFD_ShortCut%ROWTYPE;
begin
--open chld_WFFD_ShortCut;
for row_WFFD_ShortCut in chld_WFFD_ShortCut loop
 Kernel.INSTANCE_OWNER (acursession,row_WFFD_ShortCut.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFFD_ShortCut.id);
end loop;
--close chld_WFFD_ShortCut;
end ;
  delete from  WFFD_ShortCut 
  where  WFFD_ShortCutID = aWFFD_ShortCutID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Ярлыки*/
procedure WFFD_ShortCut_SAVE /*Куда выставлять ярлыки*/ (
 aCURSESSION CHAR,
 aWFFD_ShortCutid CHAR,
aInstanceID CHAR 
,aFolder CHAR/* Папка *//* Папка */
,aDocName
 VARCHAR2/* Название документа *//* Название документа */
,aStartMode
 VARCHAR2 := null /* Режим запуска *//* Режим запуска */
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
select count(*) into existsCnt from WFFD_ShortCut where WFFD_ShortCutID=aWFFD_ShortCutID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFFD_ShortCut where WFFD_ShortCutid=aWFFD_ShortCutID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFFD_ShortCut',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFFD_ShortCut');
      return;
    end if;
  end if;
 --  verify lock  --
 WFFD_ShortCut_ISLOCKED( acursession=>acursession,aROWID=>aWFFD_ShortCutid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFFD_ShortCut');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFFD_ShortCut',
 aVERB=>'EDITROW',  aThe_Resource=>aWFFD_ShortCutid,aLogInstanceID=>aInstanceID);
 update  WFFD_ShortCut set ChangeStamp=sysdate
,
  Folder=aFolder
,
  DocName=aDocName
,
  StartMode=aStartMode
  where  WFFD_ShortCutID = aWFFD_ShortCutID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFFD_ShortCut',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFFD_ShortCut');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFFD_ShortCut');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFFD_ShortCut',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFFD_ShortCutid,aLogInstanceID=>aInstanceID);
 insert into   WFFD_ShortCut
 (  WFFD_ShortCutID 
,InstanceID
,Folder

,DocName

,StartMode

 ) values ( aWFFD_ShortCutID 
,aInstanceID
,aFolder

,aDocName

,aStartMode

 ); 
 WFFD_ShortCut_SINIT( aCURSESSION,aWFFD_ShortCutid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WFFD_ShortCut_PARENT /*Куда выставлять ярлыки*/ (
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
  select  INSTANCEID into aParentID from WFFD_ShortCut where  WFFD_ShortCutid=aRowID;
 end; 


procedure WFFD_ShortCut_ISLOCKED /*Куда выставлять ярлыки*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFFD_ShortCut where WFFD_ShortCutid=aRowID;
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
  WFFD_ShortCut_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFFD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFFD_ShortCut_LOCK /*Куда выставлять ярлыки*/ (
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
 WFFD_ShortCut_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFFD_ShortCut_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFFD_ShortCut where WFFD_ShortCutid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFFD_ShortCut');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFFD_ShortCut set LockUserID =auserID ,LockSessionID =null where WFFD_ShortCutid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFFD_ShortCut set LockUserID =null,LockSessionID =aCURSESSION  where WFFD_ShortCutid=aRowID;
     return;
   end if;
 end ;


procedure WFFD_ShortCut_HCL /*Куда выставлять ярлыки*/ (
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


procedure WFFD_ShortCut_UNLOCK /*Куда выставлять ярлыки*/ (
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
 WFFD_ShortCut_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFFD_ShortCut set LockUserID =null  where WFFD_ShortCutid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFFD_ShortCut set LockSessionID =null  where WFFD_ShortCutid=aRowID;
     return;
   end if;
 end; 


procedure WFFD_ShortCut_SINIT /*Куда выставлять ярлыки*/ (
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
 select  SecurityStyleID into atmpID from WFFD_ShortCut where WFFD_ShortCutid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFFD_ShortCut');
    return;
  end if;
if aSecurityStyleID is null then
 WFFD_ShortCut_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFFD_ShortCut set securitystyleid =aStyleID where WFFD_ShortCutid = aRowID;
else 
 update WFFD_ShortCut set securitystyleid =aSecurityStyleID where WFFD_ShortCutid = aRowID;
end if; 
end ; 


procedure WFFD_ShortCut_propagate /*Куда выставлять ярлыки*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFFD_ShortCut where WFFD_ShortCutid=aRowid;
end;



procedure WFFD_Results_BRIEF  (
 aCURSESSION CHAR,
 aWFFD_Resultsid CHAR,
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
if aWFFD_Resultsid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFFD_Results where WFFD_ResultsID=aWFFD_ResultsID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFFD_Results where WFFD_Resultsid=aWFFD_ResultsID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFFD_Results');
    return;
  end if;
  aBRIEF:=func.WFFD_Results_BRIEF_F(aWFFD_Resultsid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFFD_Results_DELETE /*Функция может закончится с 
некоторым результатом:
Принять
Оплатить и т.п.
*/ (
 aCURSESSION CHAR,
 aWFFD_Resultsid CHAR,
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
select count(*) into existsCnt from WFFD_Results where WFFD_ResultsID=aWFFD_ResultsID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFFD_Results where WFFD_Resultsid=aWFFD_ResultsID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFFD_Results',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFFD_Results');
      return;
    end if;
  end if;
 --  verify lock  --
 WFFD_Results_ISLOCKED( acursession=>acursession,aROWID=>aWFFD_Resultsid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFFD_Results');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_WFFD_DOCSTOPS is select WFFD_DOCSTOPS.WFFD_DOCSTOPSid ID from WFFD_DOCSTOPS where  WFFD_DOCSTOPS.ParentStructRowID = aWFFD_Resultsid;
    child_WFFD_DOCSTOPS_rec  child_WFFD_DOCSTOPS%ROWTYPE;
    begin
    --open child_WFFD_DOCSTOPS;
      for child_WFFD_DOCSTOPS_rec in child_WFFD_DOCSTOPS loop
      WFFD_DOCSTOPS_DELETE (acursession,child_WFFD_DOCSTOPS_rec.id,aInstanceid);
      end loop;
      --close child_WFFD_DOCSTOPS;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFFD_Results',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFFD_Resultsid, aLogInstanceID=>aInstanceID);
declare cursor chld_WFFD_Results is select  instanceid ID from instance where OwnerPartName ='WFFD_Results' and OwnerRowID=aWFFD_Resultsid;
row_WFFD_Results  chld_WFFD_Results%ROWTYPE;
begin
--open chld_WFFD_Results;
for row_WFFD_Results in chld_WFFD_Results loop
 Kernel.INSTANCE_OWNER (acursession,row_WFFD_Results.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFFD_Results.id);
end loop;
--close chld_WFFD_Results;
end ;
  delete from  WFFD_Results 
  where  WFFD_ResultsID = aWFFD_ResultsID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Возможные результаты*/
procedure WFFD_Results_SAVE /*Функция может закончится с 
некоторым результатом:
Принять
Оплатить и т.п.
*/ (
 aCURSESSION CHAR,
 aWFFD_Resultsid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Наименование *//* Наименование */
,aResultWeight
 NUMBER := null /* Весовой коэффицент *//* Весовой коэффицент */
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
select count(*) into existsCnt from WFFD_Results where WFFD_ResultsID=aWFFD_ResultsID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFFD_Results where WFFD_Resultsid=aWFFD_ResultsID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFFD_Results',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFFD_Results');
      return;
    end if;
  end if;
 --  verify lock  --
 WFFD_Results_ISLOCKED( acursession=>acursession,aROWID=>aWFFD_Resultsid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFFD_Results');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFFD_Results',
 aVERB=>'EDITROW',  aThe_Resource=>aWFFD_Resultsid,aLogInstanceID=>aInstanceID);
 update  WFFD_Results set ChangeStamp=sysdate
,
  Name=aName
,
  ResultWeight=aResultWeight
  where  WFFD_ResultsID = aWFFD_ResultsID; 
 -- checking unique constraints  --

 select Count(*) into aUniqueRowCount from WFFD_Results where InstanceID=aInstanceID 
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=WFFD_Results');
 return;
end if;

 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFFD_Results',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFFD_Results');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFFD_Results');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFFD_Results',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFFD_Resultsid,aLogInstanceID=>aInstanceID);
 insert into   WFFD_Results
 (  WFFD_ResultsID 
,InstanceID
,Name

,ResultWeight

 ) values ( aWFFD_ResultsID 
,aInstanceID
,aName

,aResultWeight

 ); 
 WFFD_Results_SINIT( aCURSESSION,aWFFD_Resultsid,atmpid);
 -- checking unique constraints  --

 select Count(*) into aUniqueRowCount from WFFD_Results where InstanceID=aInstanceID 
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=WFFD_Results');
 return;
end if;

 end if;
 -- close transaction --
 end; 


procedure WFFD_Results_PARENT /*Функция может закончится с 
некоторым результатом:
Принять
Оплатить и т.п.
*/ (
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
  select  INSTANCEID into aParentID from WFFD_Results where  WFFD_Resultsid=aRowID;
 end; 


procedure WFFD_Results_ISLOCKED /*Функция может закончится с 
некоторым результатом:
Принять
Оплатить и т.п.
*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFFD_Results where WFFD_Resultsid=aRowID;
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
  WFFD_Results_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFFD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFFD_Results_LOCK /*Функция может закончится с 
некоторым результатом:
Принять
Оплатить и т.п.
*/ (
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
 WFFD_Results_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFFD_Results_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFFD_Results where WFFD_Resultsid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFFD_Results');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFFD_Results set LockUserID =auserID ,LockSessionID =null where WFFD_Resultsid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFFD_Results set LockUserID =null,LockSessionID =aCURSESSION  where WFFD_Resultsid=aRowID;
     return;
   end if;
 end ;


procedure WFFD_Results_HCL /*Функция может закончится с 
некоторым результатом:
Принять
Оплатить и т.п.
*/ (
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
declare cursor lch_WFFD_DOCSTOPS is select WFFD_DOCSTOPS.WFFD_DOCSTOPSid ID from WFFD_DOCSTOPS where  WFFD_DOCSTOPS.ParentStructRowID = aRowid;
row_WFFD_DOCSTOPS lch_WFFD_DOCSTOPS%ROWTYPE;
begin  
--open lch_WFFD_DOCSTOPS;
for row_WFFD_DOCSTOPS in lch_WFFD_DOCSTOPS
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from WFFD_DOCSTOPS where WFFD_DOCSTOPSid=row_WFFD_DOCSTOPS.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFFD_DOCSTOPS;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_WFFD_DOCSTOPS;
     return;
   end if; 
 end if;  
 WFFD_DOCSTOPS_HCL (acursession,row_WFFD_DOCSTOPS.id,aisLocked);
 if aisLocked >2 then
   close lch_WFFD_DOCSTOPS;
   return;
 end if;
end loop;
--close lch_WFFD_DOCSTOPS;
end;
aIsLocked :=0;
end;


procedure WFFD_Results_UNLOCK /*Функция может закончится с 
некоторым результатом:
Принять
Оплатить и т.п.
*/ (
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
 WFFD_Results_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFFD_Results set LockUserID =null  where WFFD_Resultsid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFFD_Results set LockSessionID =null  where WFFD_Resultsid=aRowID;
     return;
   end if;
 end; 


procedure WFFD_Results_SINIT /*Функция может закончится с 
некоторым результатом:
Принять
Оплатить и т.п.
*/ (
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
 select  SecurityStyleID into atmpID from WFFD_Results where WFFD_Resultsid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFFD_Results');
    return;
  end if;
if aSecurityStyleID is null then
 WFFD_Results_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFFD_Results set securitystyleid =aStyleID where WFFD_Resultsid = aRowID;
else 
 update WFFD_Results set securitystyleid =aSecurityStyleID where WFFD_Resultsid = aRowID;
end if; 
end ; 


procedure WFFD_Results_propagate /*Функция может закончится с 
некоторым результатом:
Принять
Оплатить и т.п.
*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFFD_Results where WFFD_Resultsid=aRowid;
declare cursor pch_WFFD_DOCSTOPS  is select WFFD_DOCSTOPS.WFFD_DOCSTOPSid ID from WFFD_DOCSTOPS where  WFFD_DOCSTOPS.ParentStructRowID = aRowid;
row_WFFD_DOCSTOPS  pch_WFFD_DOCSTOPS%ROWTYPE;
begin
--open pch_WFFD_DOCSTOPS;
for row_WFFD_DOCSTOPS in pch_WFFD_DOCSTOPS loop
   WFFD_DOCSTOPS_SINIT( acursession,row_WFFD_DOCSTOPS.id,assid);
   WFFD_DOCSTOPS_propagate( acursession,row_WFFD_DOCSTOPS.id);
end loop;
--close pch_WFFD_DOCSTOPS;
end;
end;



procedure WFFD_DOCSTOPS_BRIEF  (
 aCURSESSION CHAR,
 aWFFD_DOCSTOPSid CHAR,
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
if aWFFD_DOCSTOPSid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFFD_DOCSTOPS where WFFD_DOCSTOPSID=aWFFD_DOCSTOPSID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFFD_DOCSTOPS where WFFD_DOCSTOPSid=aWFFD_DOCSTOPSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFFD_DOCSTOPS');
    return;
  end if;
  aBRIEF:=func.WFFD_DOCSTOPS_BRIEF_F(aWFFD_DOCSTOPSid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFFD_DOCSTOPS_DELETE /*Раздел описывает следующую ситуацию:
если документ процесса переведен в определенное состояние, то функция автоматически завершается с некоторым результатом*/ (
 aCURSESSION CHAR,
 aWFFD_DOCSTOPSid CHAR,
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
select count(*) into existsCnt from WFFD_DOCSTOPS where WFFD_DOCSTOPSID=aWFFD_DOCSTOPSID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFFD_DOCSTOPS where WFFD_DOCSTOPSid=aWFFD_DOCSTOPSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFFD_DOCSTOPS',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFFD_DOCSTOPS');
      return;
    end if;
  end if;
 --  verify lock  --
 WFFD_DOCSTOPS_ISLOCKED( acursession=>acursession,aROWID=>aWFFD_DOCSTOPSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFFD_DOCSTOPS');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFFD_DOCSTOPS',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFFD_DOCSTOPSid, aLogInstanceID=>aInstanceID);
declare cursor chld_WFFD_DOCSTOPS is select  instanceid ID from instance where OwnerPartName ='WFFD_DOCSTOPS' and OwnerRowID=aWFFD_DOCSTOPSid;
row_WFFD_DOCSTOPS  chld_WFFD_DOCSTOPS%ROWTYPE;
begin
--open chld_WFFD_DOCSTOPS;
for row_WFFD_DOCSTOPS in chld_WFFD_DOCSTOPS loop
 Kernel.INSTANCE_OWNER (acursession,row_WFFD_DOCSTOPS.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFFD_DOCSTOPS.id);
end loop;
--close chld_WFFD_DOCSTOPS;
end ;
  delete from  WFFD_DOCSTOPS 
  where  WFFD_DOCSTOPSID = aWFFD_DOCSTOPSID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Завершение по состоянию документа*/
procedure WFFD_DOCSTOPS_SAVE /*Раздел описывает следующую ситуацию:
если документ процесса переведен в определенное состояние, то функция автоматически завершается с некоторым результатом*/ (
 aCURSESSION CHAR,
 aWFFD_DOCSTOPSid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aProcessDocument CHAR/* Документ процеса *//* Документ процеса */
,aDocStateName
 VARCHAR2/* Название состояния *//* Название состояния */
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
select count(*) into existsCnt from WFFD_DOCSTOPS where WFFD_DOCSTOPSID=aWFFD_DOCSTOPSID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFFD_DOCSTOPS where WFFD_DOCSTOPSid=aWFFD_DOCSTOPSID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFFD_DOCSTOPS',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFFD_DOCSTOPS');
      return;
    end if;
  end if;
 --  verify lock  --
 WFFD_DOCSTOPS_ISLOCKED( acursession=>acursession,aROWID=>aWFFD_DOCSTOPSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFFD_DOCSTOPS');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFFD_DOCSTOPS',
 aVERB=>'EDITROW',  aThe_Resource=>aWFFD_DOCSTOPSid,aLogInstanceID=>aInstanceID);
 update  WFFD_DOCSTOPS set ChangeStamp=sysdate
,
  ProcessDocument=aProcessDocument
,
  DocStateName=aDocStateName
  where  WFFD_DOCSTOPSID = aWFFD_DOCSTOPSID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from WFFD_Results where WFFD_Resultsid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFFD_DOCSTOPS',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFFD_DOCSTOPS');
      return;
    end if;
 end if;
 WFFD_Results_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFFD_DOCSTOPS');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFFD_DOCSTOPS',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFFD_DOCSTOPSid,aLogInstanceID=>aInstanceID);
 insert into   WFFD_DOCSTOPS
 (  WFFD_DOCSTOPSID 
,ParentStructRowID
,ProcessDocument

,DocStateName

 ) values ( aWFFD_DOCSTOPSID 
,aParentStructRowID
,aProcessDocument

,aDocStateName

 ); 
 WFFD_DOCSTOPS_SINIT( aCURSESSION,aWFFD_DOCSTOPSid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WFFD_DOCSTOPS_PARENT /*Раздел описывает следующую ситуацию:
если документ процесса переведен в определенное состояние, то функция автоматически завершается с некоторым результатом*/ (
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
  select ParentStructRowID into aParentID  from WFFD_DOCSTOPS where  WFFD_DOCSTOPSid=aRowID;
  aParentTable := 'WFFD_Results';
 end; 


procedure WFFD_DOCSTOPS_ISLOCKED /*Раздел описывает следующую ситуацию:
если документ процесса переведен в определенное состояние, то функция автоматически завершается с некоторым результатом*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFFD_DOCSTOPS where WFFD_DOCSTOPSid=aRowID;
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
  WFFD_DOCSTOPS_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFFD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFFD_DOCSTOPS_LOCK /*Раздел описывает следующую ситуацию:
если документ процесса переведен в определенное состояние, то функция автоматически завершается с некоторым результатом*/ (
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
 WFFD_DOCSTOPS_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFFD_DOCSTOPS_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFFD_DOCSTOPS where WFFD_DOCSTOPSid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFFD_DOCSTOPS');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFFD_DOCSTOPS set LockUserID =auserID ,LockSessionID =null where WFFD_DOCSTOPSid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFFD_DOCSTOPS set LockUserID =null,LockSessionID =aCURSESSION  where WFFD_DOCSTOPSid=aRowID;
     return;
   end if;
 end ;


procedure WFFD_DOCSTOPS_HCL /*Раздел описывает следующую ситуацию:
если документ процесса переведен в определенное состояние, то функция автоматически завершается с некоторым результатом*/ (
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


procedure WFFD_DOCSTOPS_UNLOCK /*Раздел описывает следующую ситуацию:
если документ процесса переведен в определенное состояние, то функция автоматически завершается с некоторым результатом*/ (
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
 WFFD_DOCSTOPS_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFFD_DOCSTOPS set LockUserID =null  where WFFD_DOCSTOPSid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFFD_DOCSTOPS set LockSessionID =null  where WFFD_DOCSTOPSid=aRowID;
     return;
   end if;
 end; 


procedure WFFD_DOCSTOPS_SINIT /*Раздел описывает следующую ситуацию:
если документ процесса переведен в определенное состояние, то функция автоматически завершается с некоторым результатом*/ (
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
 select  SecurityStyleID into atmpID from WFFD_DOCSTOPS where WFFD_DOCSTOPSid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFFD_DOCSTOPS');
    return;
  end if;
if aSecurityStyleID is null then
 WFFD_DOCSTOPS_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFFD_DOCSTOPS set securitystyleid =aStyleID where WFFD_DOCSTOPSid = aRowID;
else 
 update WFFD_DOCSTOPS set securitystyleid =aSecurityStyleID where WFFD_DOCSTOPSid = aRowID;
end if; 
end ; 


procedure WFFD_DOCSTOPS_propagate /*Раздел описывает следующую ситуацию:
если документ процесса переведен в определенное состояние, то функция автоматически завершается с некоторым результатом*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFFD_DOCSTOPS where WFFD_DOCSTOPSid=aRowid;
end;



procedure WFFD_CustomParam_BRIEF  (
 aCURSESSION CHAR,
 aWFFD_CustomParamid CHAR,
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
if aWFFD_CustomParamid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFFD_CustomParam where WFFD_CustomParamID=aWFFD_CustomParamID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFFD_CustomParam where WFFD_CustomParamid=aWFFD_CustomParamID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFFD_CustomParam');
    return;
  end if;
  aBRIEF:=func.WFFD_CustomParam_BRIEF_F(aWFFD_CustomParamid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFFD_CustomParam_DELETE /*Дополнительные параметры, зависящие от типа функции*/ (
 aCURSESSION CHAR,
 aWFFD_CustomParamid CHAR,
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
select count(*) into existsCnt from WFFD_CustomParam where WFFD_CustomParamID=aWFFD_CustomParamID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFFD_CustomParam where WFFD_CustomParamid=aWFFD_CustomParamID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFFD_CustomParam',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFFD_CustomParam');
      return;
    end if;
  end if;
 --  verify lock  --
 WFFD_CustomParam_ISLOCKED( acursession=>acursession,aROWID=>aWFFD_CustomParamid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFFD_CustomParam');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFFD_CustomParam',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFFD_CustomParamid, aLogInstanceID=>aInstanceID);
declare cursor chld_WFFD_CustomParam is select  instanceid ID from instance where OwnerPartName ='WFFD_CustomParam' and OwnerRowID=aWFFD_CustomParamid;
row_WFFD_CustomParam  chld_WFFD_CustomParam%ROWTYPE;
begin
--open chld_WFFD_CustomParam;
for row_WFFD_CustomParam in chld_WFFD_CustomParam loop
 Kernel.INSTANCE_OWNER (acursession,row_WFFD_CustomParam.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFFD_CustomParam.id);
end loop;
--close chld_WFFD_CustomParam;
end ;
  delete from  WFFD_CustomParam 
  where  WFFD_CustomParamID = aWFFD_CustomParamID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Дополнительные параметры*/
procedure WFFD_CustomParam_SAVE /*Дополнительные параметры, зависящие от типа функции*/ (
 aCURSESSION CHAR,
 aWFFD_CustomParamid CHAR,
aInstanceID CHAR 
,aParamName
 VARCHAR2/* Имя параметра *//* Имя параметра */
,athe_Value VARCHAR2 := null /* Значение *//* Значение */
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
select count(*) into existsCnt from WFFD_CustomParam where WFFD_CustomParamID=aWFFD_CustomParamID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFFD_CustomParam where WFFD_CustomParamid=aWFFD_CustomParamID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFFD_CustomParam',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFFD_CustomParam');
      return;
    end if;
  end if;
 --  verify lock  --
 WFFD_CustomParam_ISLOCKED( acursession=>acursession,aROWID=>aWFFD_CustomParamid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFFD_CustomParam');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFFD_CustomParam',
 aVERB=>'EDITROW',  aThe_Resource=>aWFFD_CustomParamid,aLogInstanceID=>aInstanceID);
 update  WFFD_CustomParam set ChangeStamp=sysdate
,
  ParamName=aParamName
,
  the_Value=athe_Value
  where  WFFD_CustomParamID = aWFFD_CustomParamID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFFD_CustomParam',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFFD_CustomParam');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFFD_CustomParam');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFFD_CustomParam',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFFD_CustomParamid,aLogInstanceID=>aInstanceID);
 insert into   WFFD_CustomParam
 (  WFFD_CustomParamID 
,InstanceID
,ParamName

,the_Value

 ) values ( aWFFD_CustomParamID 
,aInstanceID
,aParamName

,athe_Value

 ); 
 WFFD_CustomParam_SINIT( aCURSESSION,aWFFD_CustomParamid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WFFD_CustomParam_PARENT /*Дополнительные параметры, зависящие от типа функции*/ (
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
  select  INSTANCEID into aParentID from WFFD_CustomParam where  WFFD_CustomParamid=aRowID;
 end; 


procedure WFFD_CustomParam_ISLOCKED /*Дополнительные параметры, зависящие от типа функции*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFFD_CustomParam where WFFD_CustomParamid=aRowID;
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
  WFFD_CustomParam_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFFD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFFD_CustomParam_LOCK /*Дополнительные параметры, зависящие от типа функции*/ (
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
 WFFD_CustomParam_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFFD_CustomParam_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFFD_CustomParam where WFFD_CustomParamid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFFD_CustomParam');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFFD_CustomParam set LockUserID =auserID ,LockSessionID =null where WFFD_CustomParamid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFFD_CustomParam set LockUserID =null,LockSessionID =aCURSESSION  where WFFD_CustomParamid=aRowID;
     return;
   end if;
 end ;


procedure WFFD_CustomParam_HCL /*Дополнительные параметры, зависящие от типа функции*/ (
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


procedure WFFD_CustomParam_UNLOCK /*Дополнительные параметры, зависящие от типа функции*/ (
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
 WFFD_CustomParam_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFFD_CustomParam set LockUserID =null  where WFFD_CustomParamid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFFD_CustomParam set LockSessionID =null  where WFFD_CustomParamid=aRowID;
     return;
   end if;
 end; 


procedure WFFD_CustomParam_SINIT /*Дополнительные параметры, зависящие от типа функции*/ (
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
 select  SecurityStyleID into atmpID from WFFD_CustomParam where WFFD_CustomParamid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFFD_CustomParam');
    return;
  end if;
if aSecurityStyleID is null then
 WFFD_CustomParam_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFFD_CustomParam set securitystyleid =aStyleID where WFFD_CustomParamid = aRowID;
else 
 update WFFD_CustomParam set securitystyleid =aSecurityStyleID where WFFD_CustomParamid = aRowID;
end if; 
end ; 


procedure WFFD_CustomParam_propagate /*Дополнительные параметры, зависящие от типа функции*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFFD_CustomParam where WFFD_CustomParamid=aRowid;
end;



procedure WFFD_Doer_BRIEF  (
 aCURSESSION CHAR,
 aWFFD_Doerid CHAR,
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
if aWFFD_Doerid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFFD_Doer where WFFD_DoerID=aWFFD_DoerID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFFD_Doer where WFFD_Doerid=aWFFD_DoerID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFFD_Doer');
    return;
  end if;
  aBRIEF:=func.WFFD_Doer_BRIEF_F(aWFFD_Doerid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFFD_Doer_DELETE /*Исполнители данной функции*/ (
 aCURSESSION CHAR,
 aWFFD_Doerid CHAR,
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
select count(*) into existsCnt from WFFD_Doer where WFFD_DoerID=aWFFD_DoerID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFFD_Doer where WFFD_Doerid=aWFFD_DoerID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFFD_Doer',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFFD_Doer');
      return;
    end if;
  end if;
 --  verify lock  --
 WFFD_Doer_ISLOCKED( acursession=>acursession,aROWID=>aWFFD_Doerid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFFD_Doer');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFFD_Doer',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFFD_Doerid, aLogInstanceID=>aInstanceID);
declare cursor chld_WFFD_Doer is select  instanceid ID from instance where OwnerPartName ='WFFD_Doer' and OwnerRowID=aWFFD_Doerid;
row_WFFD_Doer  chld_WFFD_Doer%ROWTYPE;
begin
--open chld_WFFD_Doer;
for row_WFFD_Doer in chld_WFFD_Doer loop
 Kernel.INSTANCE_OWNER (acursession,row_WFFD_Doer.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFFD_Doer.id);
end loop;
--close chld_WFFD_Doer;
end ;
  delete from  WFFD_Doer 
  where  WFFD_DoerID = aWFFD_DoerID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Исполнители*/
procedure WFFD_Doer_SAVE /*Исполнители данной функции*/ (
 aCURSESSION CHAR,
 aWFFD_Doerid CHAR,
aInstanceID CHAR 
,aDoerGroup CHAR/* Группа *//* Группа */
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
select count(*) into existsCnt from WFFD_Doer where WFFD_DoerID=aWFFD_DoerID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFFD_Doer where WFFD_Doerid=aWFFD_DoerID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFFD_Doer',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFFD_Doer');
      return;
    end if;
  end if;
 --  verify lock  --
 WFFD_Doer_ISLOCKED( acursession=>acursession,aROWID=>aWFFD_Doerid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFFD_Doer');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFFD_Doer',
 aVERB=>'EDITROW',  aThe_Resource=>aWFFD_Doerid,aLogInstanceID=>aInstanceID);
 update  WFFD_Doer set ChangeStamp=sysdate
,
  DoerGroup=aDoerGroup
  where  WFFD_DoerID = aWFFD_DoerID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFFD_Doer',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFFD_Doer');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFFD_Doer');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFFD_Doer',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFFD_Doerid,aLogInstanceID=>aInstanceID);
 insert into   WFFD_Doer
 (  WFFD_DoerID 
,InstanceID
,DoerGroup

 ) values ( aWFFD_DoerID 
,aInstanceID
,aDoerGroup

 ); 
 WFFD_Doer_SINIT( aCURSESSION,aWFFD_Doerid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WFFD_Doer_PARENT /*Исполнители данной функции*/ (
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
  select  INSTANCEID into aParentID from WFFD_Doer where  WFFD_Doerid=aRowID;
 end; 


procedure WFFD_Doer_ISLOCKED /*Исполнители данной функции*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFFD_Doer where WFFD_Doerid=aRowID;
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
  WFFD_Doer_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFFD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFFD_Doer_LOCK /*Исполнители данной функции*/ (
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
 WFFD_Doer_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFFD_Doer_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFFD_Doer where WFFD_Doerid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFFD_Doer');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFFD_Doer set LockUserID =auserID ,LockSessionID =null where WFFD_Doerid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFFD_Doer set LockUserID =null,LockSessionID =aCURSESSION  where WFFD_Doerid=aRowID;
     return;
   end if;
 end ;


procedure WFFD_Doer_HCL /*Исполнители данной функции*/ (
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


procedure WFFD_Doer_UNLOCK /*Исполнители данной функции*/ (
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
 WFFD_Doer_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFFD_Doer set LockUserID =null  where WFFD_Doerid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFFD_Doer set LockSessionID =null  where WFFD_Doerid=aRowID;
     return;
   end if;
 end; 


procedure WFFD_Doer_SINIT /*Исполнители данной функции*/ (
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
 select  SecurityStyleID into atmpID from WFFD_Doer where WFFD_Doerid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFFD_Doer');
    return;
  end if;
if aSecurityStyleID is null then
 WFFD_Doer_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFFD_Doer set securitystyleid =aStyleID where WFFD_Doerid = aRowID;
else 
 update WFFD_Doer set securitystyleid =aSecurityStyleID where WFFD_Doerid = aRowID;
end if; 
end ; 


procedure WFFD_Doer_propagate /*Исполнители данной функции*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFFD_Doer where WFFD_Doerid=aRowid;
end;



procedure WFFD_common_BRIEF  (
 aCURSESSION CHAR,
 aWFFD_commonid CHAR,
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
if aWFFD_commonid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFFD_common where WFFD_commonID=aWFFD_commonID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFFD_common where WFFD_commonid=aWFFD_commonID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFFD_common');
    return;
  end if;
  aBRIEF:=func.WFFD_common_BRIEF_F(aWFFD_commonid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFFD_common_DELETE /*Шаг процесса*/ (
 aCURSESSION CHAR,
 aWFFD_commonid CHAR,
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
select count(*) into existsCnt from WFFD_common where WFFD_commonID=aWFFD_commonID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFFD_common where WFFD_commonid=aWFFD_commonID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFFD_common',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFFD_common');
      return;
    end if;
  end if;
 --  verify lock  --
 WFFD_common_ISLOCKED( acursession=>acursession,aROWID=>aWFFD_commonid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFFD_common');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFFD_common',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFFD_commonid, aLogInstanceID=>aInstanceID);
declare cursor chld_WFFD_common is select  instanceid ID from instance where OwnerPartName ='WFFD_common' and OwnerRowID=aWFFD_commonid;
row_WFFD_common  chld_WFFD_common%ROWTYPE;
begin
--open chld_WFFD_common;
for row_WFFD_common in chld_WFFD_common loop
 Kernel.INSTANCE_OWNER (acursession,row_WFFD_common.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFFD_common.id);
end loop;
--close chld_WFFD_common;
end ;
  delete from  WFFD_common 
  where  WFFD_commonID = aWFFD_commonID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Функция процесса*/
procedure WFFD_common_SAVE /*Шаг процесса*/ (
 aCURSESSION CHAR,
 aWFFD_commonid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aStepType CHAR/* Тип шага *//* Тип шага */
,aReuseStep
 NUMBER/* Использовать незавершенный шаг *//* Использовать незавершенный шаг */
,aAutoCheckState
 NUMBER/* Проверять состояние *//* Проверять состояние */
,aReStartInterval
 NUMBER := null /* Интервал перезапуска (мин.) *//* Интервал перезапуска (мин.) */
,aStateCeckInterval
 NUMBER := null /* Инетрвал проверки состояния (мин.) *//* Инетрвал проверки состояния (мин.) */
,aMinPriority
 NUMBER := null /* Минимальный приоритет *//* Минимальный приоритет */
,aMaxPriority
 NUMBER := null /* Максимальный приоритет *//* Максимальный приоритет */
,aIncPriority
 NUMBER := null /* Прирост приоритета *//* Прирост приоритета */
,aGrowPriorityInterval
 NUMBER := null /* Интервал роста приоритета (мин.) *//* Интервал роста приоритета (мин.) */
,aMaxPassNumber
 NUMBER := null /* Максимальный номер прохода *//* Максимальный номер прохода */
,aTaskDescription VARCHAR2 := null /* Описание задания *//* Описание задания */
,aAttachment VARCHAR2 := null /* Вложение */
,aAttachment_EXT varchar2 /* Вложение */
,aWorkTime
 NUMBER := null /* Срок исполнения (ч.) *//* Срок исполнения (ч.) */
,aIntegrationData1
 VARCHAR2 := null /* Данные для интеграции 1 *//* Данные для интеграции 1 */
,aIntegrationData2
 VARCHAR2 := null /* Данные для интеграции 2 *//* Данные для интеграции 2 */
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
select count(*) into existsCnt from WFFD_common where WFFD_commonID=aWFFD_commonID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFFD_common where WFFD_commonid=aWFFD_commonID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFFD_common',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFFD_common');
      return;
    end if;
  end if;
 --  verify lock  --
 WFFD_common_ISLOCKED( acursession=>acursession,aROWID=>aWFFD_commonid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFFD_common');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFFD_common',
 aVERB=>'EDITROW',  aThe_Resource=>aWFFD_commonid,aLogInstanceID=>aInstanceID);
 update  WFFD_common set ChangeStamp=sysdate
,
  Name=aName
,
  StepType=aStepType
,
  ReuseStep=aReuseStep
,
  AutoCheckState=aAutoCheckState
,
  ReStartInterval=aReStartInterval
,
  StateCeckInterval=aStateCeckInterval
,
  MinPriority=aMinPriority
,
  MaxPriority=aMaxPriority
,
  IncPriority=aIncPriority
,
  GrowPriorityInterval=aGrowPriorityInterval
,
  MaxPassNumber=aMaxPassNumber
,
  TaskDescription=aTaskDescription
,
  Attachment=aAttachment
,Attachment_EXT=
aAttachment_EXT 
,
  WorkTime=aWorkTime
,
  IntegrationData1=aIntegrationData1
,
  IntegrationData2=aIntegrationData2
  where  WFFD_commonID = aWFFD_commonID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFFD_common',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFFD_common');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFFD_common');
    return;
  end if;
select Count(*) into existsCnt from WFFD_common where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <WFFD_common>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFFD_common',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFFD_commonid,aLogInstanceID=>aInstanceID);
 insert into   WFFD_common
 (  WFFD_commonID 
,InstanceID
,Name

,StepType

,ReuseStep

,AutoCheckState

,ReStartInterval

,StateCeckInterval

,MinPriority

,MaxPriority

,IncPriority

,GrowPriorityInterval

,MaxPassNumber

,TaskDescription

,Attachment

,Attachment_EXT
,WorkTime

,IntegrationData1

,IntegrationData2

 ) values ( aWFFD_commonID 
,aInstanceID
,aName

,aStepType

,aReuseStep

,aAutoCheckState

,aReStartInterval

,aStateCeckInterval

,aMinPriority

,aMaxPriority

,aIncPriority

,aGrowPriorityInterval

,aMaxPassNumber

,aTaskDescription

,aAttachment

,aAttachment_EXT
,aWorkTime

,aIntegrationData1

,aIntegrationData2

 ); 
 WFFD_common_SINIT( aCURSESSION,aWFFD_commonid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WFFD_common_PARENT /*Шаг процесса*/ (
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
  select  INSTANCEID into aParentID from WFFD_common where  WFFD_commonid=aRowID;
 end; 


procedure WFFD_common_ISLOCKED /*Шаг процесса*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFFD_common where WFFD_commonid=aRowID;
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
  WFFD_common_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFFD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFFD_common_LOCK /*Шаг процесса*/ (
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
 WFFD_common_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFFD_common_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFFD_common where WFFD_commonid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFFD_common');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFFD_common set LockUserID =auserID ,LockSessionID =null where WFFD_commonid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFFD_common set LockUserID =null,LockSessionID =aCURSESSION  where WFFD_commonid=aRowID;
     return;
   end if;
 end ;


procedure WFFD_common_HCL /*Шаг процесса*/ (
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


procedure WFFD_common_UNLOCK /*Шаг процесса*/ (
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
 WFFD_common_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFFD_common set LockUserID =null  where WFFD_commonid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFFD_common set LockSessionID =null  where WFFD_commonid=aRowID;
     return;
   end if;
 end; 


procedure WFFD_common_SINIT /*Шаг процесса*/ (
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
 select  SecurityStyleID into atmpID from WFFD_common where WFFD_commonid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFFD_common');
    return;
  end if;
if aSecurityStyleID is null then
 WFFD_common_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFFD_common set securitystyleid =aStyleID where WFFD_commonid = aRowID;
else 
 update WFFD_common set securitystyleid =aSecurityStyleID where WFFD_commonid = aRowID;
end if; 
end ; 


procedure WFFD_common_propagate /*Шаг процесса*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFFD_common where WFFD_commonid=aRowid;
end;



procedure WFFD_ATTR1_BRIEF  (
 aCURSESSION CHAR,
 aWFFD_ATTR1id CHAR,
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
if aWFFD_ATTR1id is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFFD_ATTR1 where WFFD_ATTR1ID=aWFFD_ATTR1ID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFFD_ATTR1 where WFFD_ATTR1id=aWFFD_ATTR1ID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFFD_ATTR1');
    return;
  end if;
  aBRIEF:=func.WFFD_ATTR1_BRIEF_F(aWFFD_ATTR1id);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFFD_ATTR1_DELETE /*Дополнительные атрибуты для описания функции*/ (
 aCURSESSION CHAR,
 aWFFD_ATTR1id CHAR,
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
select count(*) into existsCnt from WFFD_ATTR1 where WFFD_ATTR1ID=aWFFD_ATTR1ID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFFD_ATTR1 where WFFD_ATTR1id=aWFFD_ATTR1ID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFFD_ATTR1',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFFD_ATTR1');
      return;
    end if;
  end if;
 --  verify lock  --
 WFFD_ATTR1_ISLOCKED( acursession=>acursession,aROWID=>aWFFD_ATTR1id,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFFD_ATTR1');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFFD_ATTR1',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFFD_ATTR1id, aLogInstanceID=>aInstanceID);
declare cursor chld_WFFD_ATTR1 is select  instanceid ID from instance where OwnerPartName ='WFFD_ATTR1' and OwnerRowID=aWFFD_ATTR1id;
row_WFFD_ATTR1  chld_WFFD_ATTR1%ROWTYPE;
begin
--open chld_WFFD_ATTR1;
for row_WFFD_ATTR1 in chld_WFFD_ATTR1 loop
 Kernel.INSTANCE_OWNER (acursession,row_WFFD_ATTR1.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFFD_ATTR1.id);
end loop;
--close chld_WFFD_ATTR1;
end ;
  delete from  WFFD_ATTR1 
  where  WFFD_ATTR1ID = aWFFD_ATTR1ID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Дополнительные атрибуты*/
procedure WFFD_ATTR1_SAVE /*Дополнительные атрибуты для описания функции*/ (
 aCURSESSION CHAR,
 aWFFD_ATTR1id CHAR,
aInstanceID CHAR 
,aObjectType CHAR := null /* Тип документа *//* Тип документа */
,aProcessDocument CHAR := null /* Документ процеса *//* Документ процеса */
,aSubProcDocument
 VARCHAR2 := null /* Название документа в подпроцессе *//* Название документа в подпроцессе */
,aDocumentPart CHAR := null /* Раздел документа *//* Раздел документа */
,aPartField CHAR := null /* Поле в разделе *//* Поле в разделе */
,aFolder CHAR := null /* Папка в каталоге *//* Папка в каталоге */
,aProcessParameter CHAR := null /* Переменная 1 *//* Переменная 1 */
,aProcessParameter2 CHAR := null /* Переменная 2 *//* Переменная 2 */
,athe_Value
 VARCHAR2 := null /* Значение *//* Значение */
,aValue2
 VARCHAR2 := null /* Значение2 *//* Значение2 */
,aPath VARCHAR2 := null /* Директория *//* Директория */
,aPath2 VARCHAR2 := null /* Директория для размещения *//* Директория для размещения */
,aFlag
 NUMBER := null /* Флаг *//* Флаг */
,aFlag2
 NUMBER := null /* Флаг 2 *//* Флаг 2 */
,aSubProcessType CHAR := null /* Тип подпроцесса *//* Тип подпроцесса */
,aProcessParameter3 CHAR := null /* Переменная 3 *//* Переменная 3 */
,aProcessParameter4 CHAR := null /* Переменная 4 *//* Переменная 4 */
,aDocState1 CHAR := null /* Состояние 1 *//* Состояние 1 */
,aDocState2 CHAR := null /* Состояние 2 *//* Состояние 2 */
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
select count(*) into existsCnt from WFFD_ATTR1 where WFFD_ATTR1ID=aWFFD_ATTR1ID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFFD_ATTR1 where WFFD_ATTR1id=aWFFD_ATTR1ID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFFD_ATTR1',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFFD_ATTR1');
      return;
    end if;
  end if;
 --  verify lock  --
 WFFD_ATTR1_ISLOCKED( acursession=>acursession,aROWID=>aWFFD_ATTR1id,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFFD_ATTR1');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFFD_ATTR1',
 aVERB=>'EDITROW',  aThe_Resource=>aWFFD_ATTR1id,aLogInstanceID=>aInstanceID);
 update  WFFD_ATTR1 set ChangeStamp=sysdate
,
  ObjectType=aObjectType
,
  ProcessDocument=aProcessDocument
,
  SubProcDocument=aSubProcDocument
,
  DocumentPart=aDocumentPart
,
  PartField=aPartField
,
  Folder=aFolder
,
  ProcessParameter=aProcessParameter
,
  ProcessParameter2=aProcessParameter2
,
  the_Value=athe_Value
,
  Value2=aValue2
,
  Path=aPath
,
  Path2=aPath2
,
  Flag=aFlag
,
  Flag2=aFlag2
,
  SubProcessType=aSubProcessType
,
  ProcessParameter3=aProcessParameter3
,
  ProcessParameter4=aProcessParameter4
,
  DocState1=aDocState1
,
  DocState2=aDocState2
  where  WFFD_ATTR1ID = aWFFD_ATTR1ID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFFD_ATTR1',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFFD_ATTR1');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFFD_ATTR1');
    return;
  end if;
select Count(*) into existsCnt from WFFD_ATTR1 where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <WFFD_ATTR1>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFFD_ATTR1',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFFD_ATTR1id,aLogInstanceID=>aInstanceID);
 insert into   WFFD_ATTR1
 (  WFFD_ATTR1ID 
,InstanceID
,ObjectType

,ProcessDocument

,SubProcDocument

,DocumentPart

,PartField

,Folder

,ProcessParameter

,ProcessParameter2

,the_Value

,Value2

,Path

,Path2

,Flag

,Flag2

,SubProcessType

,ProcessParameter3

,ProcessParameter4

,DocState1

,DocState2

 ) values ( aWFFD_ATTR1ID 
,aInstanceID
,aObjectType

,aProcessDocument

,aSubProcDocument

,aDocumentPart

,aPartField

,aFolder

,aProcessParameter

,aProcessParameter2

,athe_Value

,aValue2

,aPath

,aPath2

,aFlag

,aFlag2

,aSubProcessType

,aProcessParameter3

,aProcessParameter4

,aDocState1

,aDocState2

 ); 
 WFFD_ATTR1_SINIT( aCURSESSION,aWFFD_ATTR1id,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WFFD_ATTR1_PARENT /*Дополнительные атрибуты для описания функции*/ (
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
  select  INSTANCEID into aParentID from WFFD_ATTR1 where  WFFD_ATTR1id=aRowID;
 end; 


procedure WFFD_ATTR1_ISLOCKED /*Дополнительные атрибуты для описания функции*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFFD_ATTR1 where WFFD_ATTR1id=aRowID;
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
  WFFD_ATTR1_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFFD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFFD_ATTR1_LOCK /*Дополнительные атрибуты для описания функции*/ (
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
 WFFD_ATTR1_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFFD_ATTR1_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFFD_ATTR1 where WFFD_ATTR1id=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFFD_ATTR1');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFFD_ATTR1 set LockUserID =auserID ,LockSessionID =null where WFFD_ATTR1id=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFFD_ATTR1 set LockUserID =null,LockSessionID =aCURSESSION  where WFFD_ATTR1id=aRowID;
     return;
   end if;
 end ;


procedure WFFD_ATTR1_HCL /*Дополнительные атрибуты для описания функции*/ (
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


procedure WFFD_ATTR1_UNLOCK /*Дополнительные атрибуты для описания функции*/ (
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
 WFFD_ATTR1_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFFD_ATTR1 set LockUserID =null  where WFFD_ATTR1id=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFFD_ATTR1 set LockSessionID =null  where WFFD_ATTR1id=aRowID;
     return;
   end if;
 end; 


procedure WFFD_ATTR1_SINIT /*Дополнительные атрибуты для описания функции*/ (
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
 select  SecurityStyleID into atmpID from WFFD_ATTR1 where WFFD_ATTR1id=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFFD_ATTR1');
    return;
  end if;
if aSecurityStyleID is null then
 WFFD_ATTR1_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFFD_ATTR1 set securitystyleid =aStyleID where WFFD_ATTR1id = aRowID;
else 
 update WFFD_ATTR1 set securitystyleid =aSecurityStyleID where WFFD_ATTR1id = aRowID;
end if; 
end ; 


procedure WFFD_ATTR1_propagate /*Дополнительные атрибуты для описания функции*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFFD_ATTR1 where WFFD_ATTR1id=aRowid;
end;



procedure WFFD_DOCS_BRIEF  (
 aCURSESSION CHAR,
 aWFFD_DOCSid CHAR,
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
if aWFFD_DOCSid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFFD_DOCS where WFFD_DOCSID=aWFFD_DOCSID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFFD_DOCS where WFFD_DOCSid=aWFFD_DOCSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFFD_DOCS');
    return;
  end if;
  aBRIEF:=func.WFFD_DOCS_BRIEF_F(aWFFD_DOCSid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFFD_DOCS_DELETE /*Документы. которые необходимо обработать в рамках шага*/ (
 aCURSESSION CHAR,
 aWFFD_DOCSid CHAR,
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
select count(*) into existsCnt from WFFD_DOCS where WFFD_DOCSID=aWFFD_DOCSID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFFD_DOCS where WFFD_DOCSid=aWFFD_DOCSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFFD_DOCS',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFFD_DOCS');
      return;
    end if;
  end if;
 --  verify lock  --
 WFFD_DOCS_ISLOCKED( acursession=>acursession,aROWID=>aWFFD_DOCSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFFD_DOCS');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFFD_DOCS',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFFD_DOCSid, aLogInstanceID=>aInstanceID);
declare cursor chld_WFFD_DOCS is select  instanceid ID from instance where OwnerPartName ='WFFD_DOCS' and OwnerRowID=aWFFD_DOCSid;
row_WFFD_DOCS  chld_WFFD_DOCS%ROWTYPE;
begin
--open chld_WFFD_DOCS;
for row_WFFD_DOCS in chld_WFFD_DOCS loop
 Kernel.INSTANCE_OWNER (acursession,row_WFFD_DOCS.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFFD_DOCS.id);
end loop;
--close chld_WFFD_DOCS;
end ;
  delete from  WFFD_DOCS 
  where  WFFD_DOCSID = aWFFD_DOCSID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Документы для шага*/
procedure WFFD_DOCS_SAVE /*Документы. которые необходимо обработать в рамках шага*/ (
 aCURSESSION CHAR,
 aWFFD_DOCSid CHAR,
aInstanceID CHAR 
,aProcessDocument CHAR/* Документ процеса *//* Документ процеса */
,aAllowCreate
 NUMBER := null /* Ожидается создание *//* Ожидается создание */
,aAllowWrite
 NUMBER := null /* Ожидается модификация *//* Ожидается модификация */
,aDocMode
 VARCHAR2 := null /* Режим открытия документа *//* Режим открытия документа */
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
select count(*) into existsCnt from WFFD_DOCS where WFFD_DOCSID=aWFFD_DOCSID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFFD_DOCS where WFFD_DOCSid=aWFFD_DOCSID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFFD_DOCS',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFFD_DOCS');
      return;
    end if;
  end if;
 --  verify lock  --
 WFFD_DOCS_ISLOCKED( acursession=>acursession,aROWID=>aWFFD_DOCSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFFD_DOCS');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFFD_DOCS',
 aVERB=>'EDITROW',  aThe_Resource=>aWFFD_DOCSid,aLogInstanceID=>aInstanceID);
 update  WFFD_DOCS set ChangeStamp=sysdate
,
  ProcessDocument=aProcessDocument
,
  AllowCreate=aAllowCreate
,
  AllowWrite=aAllowWrite
,
  DocMode=aDocMode
  where  WFFD_DOCSID = aWFFD_DOCSID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFFD_DOCS',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFFD_DOCS');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFFD_DOCS');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFFD_DOCS',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFFD_DOCSid,aLogInstanceID=>aInstanceID);
 insert into   WFFD_DOCS
 (  WFFD_DOCSID 
,InstanceID
,ProcessDocument

,AllowCreate

,AllowWrite

,DocMode

 ) values ( aWFFD_DOCSID 
,aInstanceID
,aProcessDocument

,aAllowCreate

,aAllowWrite

,aDocMode

 ); 
 WFFD_DOCS_SINIT( aCURSESSION,aWFFD_DOCSid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WFFD_DOCS_PARENT /*Документы. которые необходимо обработать в рамках шага*/ (
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
  select  INSTANCEID into aParentID from WFFD_DOCS where  WFFD_DOCSid=aRowID;
 end; 


procedure WFFD_DOCS_ISLOCKED /*Документы. которые необходимо обработать в рамках шага*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFFD_DOCS where WFFD_DOCSid=aRowID;
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
  WFFD_DOCS_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFFD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFFD_DOCS_LOCK /*Документы. которые необходимо обработать в рамках шага*/ (
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
 WFFD_DOCS_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFFD_DOCS_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFFD_DOCS where WFFD_DOCSid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFFD_DOCS');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFFD_DOCS set LockUserID =auserID ,LockSessionID =null where WFFD_DOCSid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFFD_DOCS set LockUserID =null,LockSessionID =aCURSESSION  where WFFD_DOCSid=aRowID;
     return;
   end if;
 end ;


procedure WFFD_DOCS_HCL /*Документы. которые необходимо обработать в рамках шага*/ (
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


procedure WFFD_DOCS_UNLOCK /*Документы. которые необходимо обработать в рамках шага*/ (
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
 WFFD_DOCS_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFFD_DOCS set LockUserID =null  where WFFD_DOCSid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFFD_DOCS set LockSessionID =null  where WFFD_DOCSid=aRowID;
     return;
   end if;
 end; 


procedure WFFD_DOCS_SINIT /*Документы. которые необходимо обработать в рамках шага*/ (
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
 select  SecurityStyleID into atmpID from WFFD_DOCS where WFFD_DOCSid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFFD_DOCS');
    return;
  end if;
if aSecurityStyleID is null then
 WFFD_DOCS_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFFD_DOCS set securitystyleid =aStyleID where WFFD_DOCSid = aRowID;
else 
 update WFFD_DOCS set securitystyleid =aSecurityStyleID where WFFD_DOCSid = aRowID;
end if; 
end ; 


procedure WFFD_DOCS_propagate /*Документы. которые необходимо обработать в рамках шага*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFFD_DOCS where WFFD_DOCSid=aRowid;
end;


end WFFD;

/



