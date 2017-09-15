
/* --WFFR*/

 create or replace package body WFFR as

procedure WFFR_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='WFFR'
then
declare cursor child_WFFR_ShortCut is select WFFR_ShortCut.WFFR_ShortCutid ID from WFFR_ShortCut where  WFFR_ShortCut.InstanceID = ainstanceid;
row_WFFR_ShortCut  child_WFFR_ShortCut%ROWTYPE;
begin
--open child_WFFR_ShortCut;
for row_WFFR_ShortCut in child_WFFR_ShortCut loop
 WFFR_ShortCut_DELETE (acursession,row_WFFR_ShortCut.id,aInstanceID);
end loop;
--close child_WFFR_ShortCut;
end;
declare cursor child_WFFR_Fcomm is select WFFR_Fcomm.WFFR_Fcommid ID from WFFR_Fcomm where  WFFR_Fcomm.InstanceID = ainstanceid;
row_WFFR_Fcomm  child_WFFR_Fcomm%ROWTYPE;
begin
--open child_WFFR_Fcomm;
for row_WFFR_Fcomm in child_WFFR_Fcomm loop
 WFFR_Fcomm_DELETE (acursession,row_WFFR_Fcomm.id,aInstanceID);
end loop;
--close child_WFFR_Fcomm;
end;
declare cursor child_WFFR_fparents is select WFFR_fparents.WFFR_fparentsid ID from WFFR_fparents where  WFFR_fparents.InstanceID = ainstanceid;
row_WFFR_fparents  child_WFFR_fparents%ROWTYPE;
begin
--open child_WFFR_fparents;
for row_WFFR_fparents in child_WFFR_fparents loop
 WFFR_fparents_DELETE (acursession,row_WFFR_fparents.id,aInstanceID);
end loop;
--close child_WFFR_fparents;
end;
declare cursor child_WFFR_func is select WFFR_func.WFFR_funcid ID from WFFR_func where  WFFR_func.InstanceID = ainstanceid;
row_WFFR_func  child_WFFR_func%ROWTYPE;
begin
--open child_WFFR_func;
for row_WFFR_func in child_WFFR_func loop
 WFFR_func_DELETE (acursession,row_WFFR_func.id,aInstanceID);
end loop;
--close child_WFFR_func;
end;
return;
<<del_error>>
return;
end if;
end;
procedure WFFR_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'WFFR'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_WFFR_ShortCut is select WFFR_ShortCut.WFFR_ShortCutid ID from WFFR_ShortCut where  WFFR_ShortCut.InstanceID = arowid;
ROW_WFFR_ShortCut  lch_WFFR_ShortCut%ROWTYPE;
begin
--open lch_WFFR_ShortCut;
for row_WFFR_ShortCut in lch_WFFR_ShortCut loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WFFR_ShortCut where WFFR_ShortCutid=row_WFFR_ShortCut.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFFR_ShortCut;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WFFR_ShortCut;
     return;
   end if; 
 end if; 
 WFFR_ShortCut_HCL (acursession,ROW_WFFR_ShortCut.id,aisLocked);
 if aisLocked >2 then
   close lch_WFFR_ShortCut;
   return;
 end if;
 end loop;
--close lch_WFFR_ShortCut;
end;
declare cursor lch_WFFR_Fcomm is select WFFR_Fcomm.WFFR_Fcommid ID from WFFR_Fcomm where  WFFR_Fcomm.InstanceID = arowid;
ROW_WFFR_Fcomm  lch_WFFR_Fcomm%ROWTYPE;
begin
--open lch_WFFR_Fcomm;
for row_WFFR_Fcomm in lch_WFFR_Fcomm loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WFFR_Fcomm where WFFR_Fcommid=row_WFFR_Fcomm.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFFR_Fcomm;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WFFR_Fcomm;
     return;
   end if; 
 end if; 
 WFFR_Fcomm_HCL (acursession,ROW_WFFR_Fcomm.id,aisLocked);
 if aisLocked >2 then
   close lch_WFFR_Fcomm;
   return;
 end if;
 end loop;
--close lch_WFFR_Fcomm;
end;
declare cursor lch_WFFR_fparents is select WFFR_fparents.WFFR_fparentsid ID from WFFR_fparents where  WFFR_fparents.InstanceID = arowid;
ROW_WFFR_fparents  lch_WFFR_fparents%ROWTYPE;
begin
--open lch_WFFR_fparents;
for row_WFFR_fparents in lch_WFFR_fparents loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WFFR_fparents where WFFR_fparentsid=row_WFFR_fparents.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFFR_fparents;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WFFR_fparents;
     return;
   end if; 
 end if; 
 WFFR_fparents_HCL (acursession,ROW_WFFR_fparents.id,aisLocked);
 if aisLocked >2 then
   close lch_WFFR_fparents;
   return;
 end if;
 end loop;
--close lch_WFFR_fparents;
end;
declare cursor lch_WFFR_func is select WFFR_func.WFFR_funcid ID from WFFR_func where  WFFR_func.InstanceID = arowid;
ROW_WFFR_func  lch_WFFR_func%ROWTYPE;
begin
--open lch_WFFR_func;
for row_WFFR_func in lch_WFFR_func loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WFFR_func where WFFR_funcid=row_WFFR_func.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFFR_func;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WFFR_func;
     return;
   end if; 
 end if; 
 WFFR_func_HCL (acursession,ROW_WFFR_func.id,aisLocked);
 if aisLocked >2 then
   close lch_WFFR_func;
   return;
 end if;
 end loop;
--close lch_WFFR_func;
end;
 end if;
aIsLocked:=0;
end;
procedure WFFR_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'WFFR'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_WFFR_ShortCut is select WFFR_ShortCut.WFFR_ShortCutid id from WFFR_ShortCut where  WFFR_ShortCut.InstanceID = arowid;
row_WFFR_ShortCut  pch_WFFR_ShortCut%ROWTYPE;
begin
--open pch_WFFR_ShortCut;
for row_WFFR_ShortCut in  pch_WFFR_ShortCut loop
 WFFR_ShortCut_SINIT( acursession,row_WFFR_ShortCut.id,assid);
 WFFR_ShortCut_propagate( acursession,row_WFFR_ShortCut.id);
end loop;
--close pch_WFFR_ShortCut;
end;
declare cursor pch_WFFR_Fcomm is select WFFR_Fcomm.WFFR_Fcommid id from WFFR_Fcomm where  WFFR_Fcomm.InstanceID = arowid;
row_WFFR_Fcomm  pch_WFFR_Fcomm%ROWTYPE;
begin
--open pch_WFFR_Fcomm;
for row_WFFR_Fcomm in  pch_WFFR_Fcomm loop
 WFFR_Fcomm_SINIT( acursession,row_WFFR_Fcomm.id,assid);
 WFFR_Fcomm_propagate( acursession,row_WFFR_Fcomm.id);
end loop;
--close pch_WFFR_Fcomm;
end;
declare cursor pch_WFFR_fparents is select WFFR_fparents.WFFR_fparentsid id from WFFR_fparents where  WFFR_fparents.InstanceID = arowid;
row_WFFR_fparents  pch_WFFR_fparents%ROWTYPE;
begin
--open pch_WFFR_fparents;
for row_WFFR_fparents in  pch_WFFR_fparents loop
 WFFR_fparents_SINIT( acursession,row_WFFR_fparents.id,assid);
 WFFR_fparents_propagate( acursession,row_WFFR_fparents.id);
end loop;
--close pch_WFFR_fparents;
end;
declare cursor pch_WFFR_func is select WFFR_func.WFFR_funcid id from WFFR_func where  WFFR_func.InstanceID = arowid;
row_WFFR_func  pch_WFFR_func%ROWTYPE;
begin
--open pch_WFFR_func;
for row_WFFR_func in  pch_WFFR_func loop
 WFFR_func_SINIT( acursession,row_WFFR_func.id,assid);
 WFFR_func_propagate( acursession,row_WFFR_func.id);
end loop;
--close pch_WFFR_func;
end;
 end if; 
end;



procedure WFFR_ShortCut_BRIEF  (
 aCURSESSION CHAR,
 aWFFR_ShortCutid CHAR,
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
if aWFFR_ShortCutid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFFR_ShortCut where WFFR_ShortCutID=aWFFR_ShortCutID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFFR_ShortCut where WFFR_ShortCutid=aWFFR_ShortCutID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFFR_ShortCut');
    return;
  end if;
  aBRIEF:=func.WFFR_ShortCut_BRIEF_F(aWFFR_ShortCutid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFFR_ShortCut_DELETE /*Установленные ярлыки*/ (
 aCURSESSION CHAR,
 aWFFR_ShortCutid CHAR,
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
select count(*) into existsCnt from WFFR_ShortCut where WFFR_ShortCutID=aWFFR_ShortCutID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFFR_ShortCut where WFFR_ShortCutid=aWFFR_ShortCutID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFFR_ShortCut',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFFR_ShortCut');
      return;
    end if;
  end if;
 --  verify lock  --
 WFFR_ShortCut_ISLOCKED( acursession=>acursession,aROWID=>aWFFR_ShortCutid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFFR_ShortCut');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFFR_ShortCut',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFFR_ShortCutid, aLogInstanceID=>aInstanceID);
declare cursor chld_WFFR_ShortCut is select  instanceid ID from instance where OwnerPartName ='WFFR_ShortCut' and OwnerRowID=aWFFR_ShortCutid;
row_WFFR_ShortCut  chld_WFFR_ShortCut%ROWTYPE;
begin
--open chld_WFFR_ShortCut;
for row_WFFR_ShortCut in chld_WFFR_ShortCut loop
 Kernel.INSTANCE_OWNER (acursession,row_WFFR_ShortCut.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFFR_ShortCut.id);
end loop;
--close chld_WFFR_ShortCut;
end ;
  delete from  WFFR_ShortCut 
  where  WFFR_ShortCutID = aWFFR_ShortCutID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Ярлыки*/
procedure WFFR_ShortCut_SAVE /*Установленные ярлыки*/ (
 aCURSESSION CHAR,
 aWFFR_ShortCutid CHAR,
aInstanceID CHAR 
,aBasedOn CHAR/* На основании *//* На основании */
,aShortCut CHAR := null /* Ярлык *//* Ярлык */
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
select count(*) into existsCnt from WFFR_ShortCut where WFFR_ShortCutID=aWFFR_ShortCutID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFFR_ShortCut where WFFR_ShortCutid=aWFFR_ShortCutID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFFR_ShortCut',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFFR_ShortCut');
      return;
    end if;
  end if;
 --  verify lock  --
 WFFR_ShortCut_ISLOCKED( acursession=>acursession,aROWID=>aWFFR_ShortCutid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFFR_ShortCut');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFFR_ShortCut',
 aVERB=>'EDITROW',  aThe_Resource=>aWFFR_ShortCutid,aLogInstanceID=>aInstanceID);
 update  WFFR_ShortCut set ChangeStamp=sysdate
,
  BasedOn=aBasedOn
,
  ShortCut=aShortCut
  where  WFFR_ShortCutID = aWFFR_ShortCutID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFFR_ShortCut',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFFR_ShortCut');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFFR_ShortCut');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFFR_ShortCut',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFFR_ShortCutid,aLogInstanceID=>aInstanceID);
 insert into   WFFR_ShortCut
 (  WFFR_ShortCutID 
,InstanceID
,BasedOn

,ShortCut

 ) values ( aWFFR_ShortCutID 
,aInstanceID
,aBasedOn

,aShortCut

 ); 
 WFFR_ShortCut_SINIT( aCURSESSION,aWFFR_ShortCutid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WFFR_ShortCut_PARENT /*Установленные ярлыки*/ (
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
  select  INSTANCEID into aParentID from WFFR_ShortCut where  WFFR_ShortCutid=aRowID;
 end; 


procedure WFFR_ShortCut_ISLOCKED /*Установленные ярлыки*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFFR_ShortCut where WFFR_ShortCutid=aRowID;
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
  WFFR_ShortCut_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFFR.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFFR_ShortCut_LOCK /*Установленные ярлыки*/ (
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
 WFFR_ShortCut_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFFR_ShortCut_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFFR_ShortCut where WFFR_ShortCutid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFFR_ShortCut');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFFR_ShortCut set LockUserID =auserID ,LockSessionID =null where WFFR_ShortCutid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFFR_ShortCut set LockUserID =null,LockSessionID =aCURSESSION  where WFFR_ShortCutid=aRowID;
     return;
   end if;
 end ;


procedure WFFR_ShortCut_HCL /*Установленные ярлыки*/ (
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


procedure WFFR_ShortCut_UNLOCK /*Установленные ярлыки*/ (
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
 WFFR_ShortCut_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFFR_ShortCut set LockUserID =null  where WFFR_ShortCutid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFFR_ShortCut set LockSessionID =null  where WFFR_ShortCutid=aRowID;
     return;
   end if;
 end; 


procedure WFFR_ShortCut_SINIT /*Установленные ярлыки*/ (
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
 select  SecurityStyleID into atmpID from WFFR_ShortCut where WFFR_ShortCutid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFFR_ShortCut');
    return;
  end if;
if aSecurityStyleID is null then
 WFFR_ShortCut_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFFR_ShortCut set securitystyleid =aStyleID where WFFR_ShortCutid = aRowID;
else 
 update WFFR_ShortCut set securitystyleid =aSecurityStyleID where WFFR_ShortCutid = aRowID;
end if; 
end ; 


procedure WFFR_ShortCut_propagate /*Установленные ярлыки*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFFR_ShortCut where WFFR_ShortCutid=aRowid;
end;



procedure WFFR_Fcomm_BRIEF  (
 aCURSESSION CHAR,
 aWFFR_Fcommid CHAR,
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
if aWFFR_Fcommid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFFR_Fcomm where WFFR_FcommID=aWFFR_FcommID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFFR_Fcomm where WFFR_Fcommid=aWFFR_FcommID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFFR_Fcomm');
    return;
  end if;
  aBRIEF:=func.WFFR_Fcomm_BRIEF_F(aWFFR_Fcommid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFFR_Fcomm_DELETE /*Комментарии к функции*/ (
 aCURSESSION CHAR,
 aWFFR_Fcommid CHAR,
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
select count(*) into existsCnt from WFFR_Fcomm where WFFR_FcommID=aWFFR_FcommID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFFR_Fcomm where WFFR_Fcommid=aWFFR_FcommID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFFR_Fcomm',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFFR_Fcomm');
      return;
    end if;
  end if;
 --  verify lock  --
 WFFR_Fcomm_ISLOCKED( acursession=>acursession,aROWID=>aWFFR_Fcommid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFFR_Fcomm');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFFR_Fcomm',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFFR_Fcommid, aLogInstanceID=>aInstanceID);
declare cursor chld_WFFR_Fcomm is select  instanceid ID from instance where OwnerPartName ='WFFR_Fcomm' and OwnerRowID=aWFFR_Fcommid;
row_WFFR_Fcomm  chld_WFFR_Fcomm%ROWTYPE;
begin
--open chld_WFFR_Fcomm;
for row_WFFR_Fcomm in chld_WFFR_Fcomm loop
 Kernel.INSTANCE_OWNER (acursession,row_WFFR_Fcomm.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFFR_Fcomm.id);
end loop;
--close chld_WFFR_Fcomm;
end ;
  delete from  WFFR_Fcomm 
  where  WFFR_FcommID = aWFFR_FcommID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Комментарии*/
procedure WFFR_Fcomm_SAVE /*Комментарии к функции*/ (
 aCURSESSION CHAR,
 aWFFR_Fcommid CHAR,
aInstanceID CHAR 
, aParentRowid CHAR :=null
,aAuthor CHAR/* Автор *//* Автор */
,aSubject
 VARCHAR2/* Тема *//* Тема */
,aMessage VARCHAR2 := null /* Сообщение *//* Сообщение */
,aAttachment VARCHAR2 := null /* Вложение */
,aAttachment_EXT varchar2 /* Вложение */
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
select count(*) into existsCnt from WFFR_Fcomm where WFFR_FcommID=aWFFR_FcommID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFFR_Fcomm where WFFR_Fcommid=aWFFR_FcommID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFFR_Fcomm',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFFR_Fcomm');
      return;
    end if;
  end if;
 --  verify lock  --
 WFFR_Fcomm_ISLOCKED( acursession=>acursession,aROWID=>aWFFR_Fcommid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFFR_Fcomm');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFFR_Fcomm',
 aVERB=>'EDITROW',  aThe_Resource=>aWFFR_Fcommid,aLogInstanceID=>aInstanceID);
 update  WFFR_Fcomm set ChangeStamp=sysdate
,ParentRowid= aParentRowid
,
  Author=aAuthor
,
  Subject=aSubject
,
  Message=aMessage
,
  Attachment=aAttachment
,Attachment_EXT=
aAttachment_EXT 
  where  WFFR_FcommID = aWFFR_FcommID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFFR_Fcomm',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFFR_Fcomm');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFFR_Fcomm');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFFR_Fcomm',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFFR_Fcommid,aLogInstanceID=>aInstanceID);
 insert into   WFFR_Fcomm
 (  WFFR_FcommID 
,ParentRowid
,InstanceID
,Author

,Subject

,Message

,Attachment

,Attachment_EXT
 ) values ( aWFFR_FcommID 
,aParentRowid
,aInstanceID
,aAuthor

,aSubject

,aMessage

,aAttachment

,aAttachment_EXT
 ); 
 WFFR_Fcomm_SINIT( aCURSESSION,aWFFR_Fcommid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WFFR_Fcomm_PARENT /*Комментарии к функции*/ (
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
  select  INSTANCEID into aParentID from WFFR_Fcomm where  WFFR_Fcommid=aRowID;
 end; 


procedure WFFR_Fcomm_ISLOCKED /*Комментарии к функции*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFFR_Fcomm where WFFR_Fcommid=aRowID;
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
  WFFR_Fcomm_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFFR.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFFR_Fcomm_LOCK /*Комментарии к функции*/ (
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
 WFFR_Fcomm_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFFR_Fcomm_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFFR_Fcomm where WFFR_Fcommid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFFR_Fcomm');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFFR_Fcomm set LockUserID =auserID ,LockSessionID =null where WFFR_Fcommid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFFR_Fcomm set LockUserID =null,LockSessionID =aCURSESSION  where WFFR_Fcommid=aRowID;
     return;
   end if;
 end ;


procedure WFFR_Fcomm_HCL /*Комментарии к функции*/ (
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


procedure WFFR_Fcomm_UNLOCK /*Комментарии к функции*/ (
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
 WFFR_Fcomm_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFFR_Fcomm set LockUserID =null  where WFFR_Fcommid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFFR_Fcomm set LockSessionID =null  where WFFR_Fcommid=aRowID;
     return;
   end if;
 end; 


procedure WFFR_Fcomm_SINIT /*Комментарии к функции*/ (
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
 select  SecurityStyleID into atmpID from WFFR_Fcomm where WFFR_Fcommid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFFR_Fcomm');
    return;
  end if;
if aSecurityStyleID is null then
 WFFR_Fcomm_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFFR_Fcomm set securitystyleid =aStyleID where WFFR_Fcommid = aRowID;
else 
 update WFFR_Fcomm set securitystyleid =aSecurityStyleID where WFFR_Fcommid = aRowID;
end if; 
end ; 


procedure WFFR_Fcomm_propagate /*Комментарии к функции*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFFR_Fcomm where WFFR_Fcommid=aRowid;
end;



procedure WFFR_fparents_BRIEF  (
 aCURSESSION CHAR,
 aWFFR_fparentsid CHAR,
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
if aWFFR_fparentsid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFFR_fparents where WFFR_fparentsID=aWFFR_fparentsID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFFR_fparents where WFFR_fparentsid=aWFFR_fparentsID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFFR_fparents');
    return;
  end if;
  aBRIEF:=func.WFFR_fparents_BRIEF_F(aWFFR_fparentsid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFFR_fparents_DELETE /*Функции, которыеявляются непосредственными предественниками данной функции.*/ (
 aCURSESSION CHAR,
 aWFFR_fparentsid CHAR,
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
select count(*) into existsCnt from WFFR_fparents where WFFR_fparentsID=aWFFR_fparentsID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFFR_fparents where WFFR_fparentsid=aWFFR_fparentsID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFFR_fparents',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFFR_fparents');
      return;
    end if;
  end if;
 --  verify lock  --
 WFFR_fparents_ISLOCKED( acursession=>acursession,aROWID=>aWFFR_fparentsid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFFR_fparents');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFFR_fparents',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFFR_fparentsid, aLogInstanceID=>aInstanceID);
declare cursor chld_WFFR_fparents is select  instanceid ID from instance where OwnerPartName ='WFFR_fparents' and OwnerRowID=aWFFR_fparentsid;
row_WFFR_fparents  chld_WFFR_fparents%ROWTYPE;
begin
--open chld_WFFR_fparents;
for row_WFFR_fparents in chld_WFFR_fparents loop
 Kernel.INSTANCE_OWNER (acursession,row_WFFR_fparents.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFFR_fparents.id);
end loop;
--close chld_WFFR_fparents;
end ;
  delete from  WFFR_fparents 
  where  WFFR_fparentsID = aWFFR_fparentsID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Предшествующие шаги*/
procedure WFFR_fparents_SAVE /*Функции, которыеявляются непосредственными предественниками данной функции.*/ (
 aCURSESSION CHAR,
 aWFFR_fparentsid CHAR,
aInstanceID CHAR 
,aPrevFunc CHAR/* Предыдущая функция *//* Предыдущая функция */
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
select count(*) into existsCnt from WFFR_fparents where WFFR_fparentsID=aWFFR_fparentsID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFFR_fparents where WFFR_fparentsid=aWFFR_fparentsID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFFR_fparents',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFFR_fparents');
      return;
    end if;
  end if;
 --  verify lock  --
 WFFR_fparents_ISLOCKED( acursession=>acursession,aROWID=>aWFFR_fparentsid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFFR_fparents');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFFR_fparents',
 aVERB=>'EDITROW',  aThe_Resource=>aWFFR_fparentsid,aLogInstanceID=>aInstanceID);
 update  WFFR_fparents set ChangeStamp=sysdate
,
  PrevFunc=aPrevFunc
  where  WFFR_fparentsID = aWFFR_fparentsID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFFR_fparents',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFFR_fparents');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFFR_fparents');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFFR_fparents',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFFR_fparentsid,aLogInstanceID=>aInstanceID);
 insert into   WFFR_fparents
 (  WFFR_fparentsID 
,InstanceID
,PrevFunc

 ) values ( aWFFR_fparentsID 
,aInstanceID
,aPrevFunc

 ); 
 WFFR_fparents_SINIT( aCURSESSION,aWFFR_fparentsid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WFFR_fparents_PARENT /*Функции, которыеявляются непосредственными предественниками данной функции.*/ (
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
  select  INSTANCEID into aParentID from WFFR_fparents where  WFFR_fparentsid=aRowID;
 end; 


procedure WFFR_fparents_ISLOCKED /*Функции, которыеявляются непосредственными предественниками данной функции.*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFFR_fparents where WFFR_fparentsid=aRowID;
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
  WFFR_fparents_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFFR.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFFR_fparents_LOCK /*Функции, которыеявляются непосредственными предественниками данной функции.*/ (
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
 WFFR_fparents_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFFR_fparents_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFFR_fparents where WFFR_fparentsid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFFR_fparents');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFFR_fparents set LockUserID =auserID ,LockSessionID =null where WFFR_fparentsid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFFR_fparents set LockUserID =null,LockSessionID =aCURSESSION  where WFFR_fparentsid=aRowID;
     return;
   end if;
 end ;


procedure WFFR_fparents_HCL /*Функции, которыеявляются непосредственными предественниками данной функции.*/ (
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


procedure WFFR_fparents_UNLOCK /*Функции, которыеявляются непосредственными предественниками данной функции.*/ (
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
 WFFR_fparents_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFFR_fparents set LockUserID =null  where WFFR_fparentsid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFFR_fparents set LockSessionID =null  where WFFR_fparentsid=aRowID;
     return;
   end if;
 end; 


procedure WFFR_fparents_SINIT /*Функции, которыеявляются непосредственными предественниками данной функции.*/ (
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
 select  SecurityStyleID into atmpID from WFFR_fparents where WFFR_fparentsid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFFR_fparents');
    return;
  end if;
if aSecurityStyleID is null then
 WFFR_fparents_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFFR_fparents set securitystyleid =aStyleID where WFFR_fparentsid = aRowID;
else 
 update WFFR_fparents set securitystyleid =aSecurityStyleID where WFFR_fparentsid = aRowID;
end if; 
end ; 


procedure WFFR_fparents_propagate /*Функции, которыеявляются непосредственными предественниками данной функции.*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFFR_fparents where WFFR_fparentsid=aRowid;
end;



procedure WFFR_func_BRIEF  (
 aCURSESSION CHAR,
 aWFFR_funcid CHAR,
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
if aWFFR_funcid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFFR_func where WFFR_funcID=aWFFR_funcID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFFR_func where WFFR_funcid=aWFFR_funcID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFFR_func');
    return;
  end if;
  aBRIEF:=func.WFFR_func_BRIEF_F(aWFFR_funcid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFFR_func_DELETE /*экземпляр функции*/ (
 aCURSESSION CHAR,
 aWFFR_funcid CHAR,
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
select count(*) into existsCnt from WFFR_func where WFFR_funcID=aWFFR_funcID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFFR_func where WFFR_funcid=aWFFR_funcID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFFR_func',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFFR_func');
      return;
    end if;
  end if;
 --  verify lock  --
 WFFR_func_ISLOCKED( acursession=>acursession,aROWID=>aWFFR_funcid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFFR_func');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFFR_func',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFFR_funcid, aLogInstanceID=>aInstanceID);
declare cursor chld_WFFR_func is select  instanceid ID from instance where OwnerPartName ='WFFR_func' and OwnerRowID=aWFFR_funcid;
row_WFFR_func  chld_WFFR_func%ROWTYPE;
begin
--open chld_WFFR_func;
for row_WFFR_func in chld_WFFR_func loop
 Kernel.INSTANCE_OWNER (acursession,row_WFFR_func.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFFR_func.id);
end loop;
--close chld_WFFR_func;
end ;
  delete from  WFFR_func 
  where  WFFR_funcID = aWFFR_funcID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Описание*/
procedure WFFR_func_SAVE /*экземпляр функции*/ (
 aCURSESSION CHAR,
 aWFFR_funcid CHAR,
aInstanceID CHAR 
,aState
 NUMBER/* Состояние *//* Состояние */
,aBasedOn CHAR/* Реализует *//* Реализует */
,aPassNo
 NUMBER/* Проход *//* Проход */
,aCreateAt
 DATE := null /* Момент создания *//* Момент создания */
,aLastStart
 DATE := null /* Последний запуск *//* Последний запуск */
,aLastStateScan
 DATE := null /* Последний контроль состояния *//* Последний контроль состояния */
,aPriority
 NUMBER := null /* Текущий приоритет *//* Текущий приоритет */
,aChangePriorityTime
 DATE := null /* Момент пересчета приоритета *//* Момент пересчета приоритета */
,aWorkPercent
 NUMBER := null /* Готовность *//* Готовность */
,aInfo VARCHAR2 := null /* Текущее задание *//* Текущее задание */
,aFuncResult
 VARCHAR2 := null /* Результат *//* Результат */
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
select count(*) into existsCnt from WFFR_func where WFFR_funcID=aWFFR_funcID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFFR_func where WFFR_funcid=aWFFR_funcID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFFR_func',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFFR_func');
      return;
    end if;
  end if;
 --  verify lock  --
 WFFR_func_ISLOCKED( acursession=>acursession,aROWID=>aWFFR_funcid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFFR_func');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFFR_func',
 aVERB=>'EDITROW',  aThe_Resource=>aWFFR_funcid,aLogInstanceID=>aInstanceID);
 update  WFFR_func set ChangeStamp=sysdate
,
  State=aState
,
  BasedOn=aBasedOn
,
  PassNo=aPassNo
,
  CreateAt=aCreateAt
,
  LastStart=aLastStart
,
  LastStateScan=aLastStateScan
,
  Priority=aPriority
,
  ChangePriorityTime=aChangePriorityTime
,
  WorkPercent=aWorkPercent
,
  Info=aInfo
,
  FuncResult=aFuncResult
  where  WFFR_funcID = aWFFR_funcID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFFR_func',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFFR_func');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFFR_func');
    return;
  end if;
select Count(*) into existsCnt from WFFR_func where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <WFFR_func>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFFR_func',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFFR_funcid,aLogInstanceID=>aInstanceID);
 insert into   WFFR_func
 (  WFFR_funcID 
,InstanceID
,State

,BasedOn

,PassNo

,CreateAt

,LastStart

,LastStateScan

,Priority

,ChangePriorityTime

,WorkPercent

,Info

,FuncResult

 ) values ( aWFFR_funcID 
,aInstanceID
,aState

,aBasedOn

,aPassNo

,aCreateAt

,aLastStart

,aLastStateScan

,aPriority

,aChangePriorityTime

,aWorkPercent

,aInfo

,aFuncResult

 ); 
 WFFR_func_SINIT( aCURSESSION,aWFFR_funcid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WFFR_func_PARENT /*экземпляр функции*/ (
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
  select  INSTANCEID into aParentID from WFFR_func where  WFFR_funcid=aRowID;
 end; 


procedure WFFR_func_ISLOCKED /*экземпляр функции*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFFR_func where WFFR_funcid=aRowID;
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
  WFFR_func_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFFR.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFFR_func_LOCK /*экземпляр функции*/ (
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
 WFFR_func_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFFR_func_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFFR_func where WFFR_funcid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFFR_func');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFFR_func set LockUserID =auserID ,LockSessionID =null where WFFR_funcid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFFR_func set LockUserID =null,LockSessionID =aCURSESSION  where WFFR_funcid=aRowID;
     return;
   end if;
 end ;


procedure WFFR_func_HCL /*экземпляр функции*/ (
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


procedure WFFR_func_UNLOCK /*экземпляр функции*/ (
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
 WFFR_func_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFFR_func set LockUserID =null  where WFFR_funcid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFFR_func set LockSessionID =null  where WFFR_funcid=aRowID;
     return;
   end if;
 end; 


procedure WFFR_func_SINIT /*экземпляр функции*/ (
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
 select  SecurityStyleID into atmpID from WFFR_func where WFFR_funcid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFFR_func');
    return;
  end if;
if aSecurityStyleID is null then
 WFFR_func_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFFR_func set securitystyleid =aStyleID where WFFR_funcid = aRowID;
else 
 update WFFR_func set securitystyleid =aSecurityStyleID where WFFR_funcid = aRowID;
end if; 
end ; 


procedure WFFR_func_propagate /*экземпляр функции*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFFR_func where WFFR_funcid=aRowid;
end;


end WFFR;

/



