
/* --WFRtm*/

 create or replace package body WFRtm as

procedure WFRtm_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='WFRtm'
then
declare cursor child_WFRtm_Param is select WFRtm_Param.WFRtm_Paramid ID from WFRtm_Param where  WFRtm_Param.InstanceID = ainstanceid;
row_WFRtm_Param  child_WFRtm_Param%ROWTYPE;
begin
--open child_WFRtm_Param;
for row_WFRtm_Param in child_WFRtm_Param loop
 WFRtm_Param_DELETE (acursession,row_WFRtm_Param.id,aInstanceID);
end loop;
--close child_WFRtm_Param;
end;
declare cursor child_WFRTM_SUBPROCESS is select WFRTM_SUBPROCESS.WFRTM_SUBPROCESSid ID from WFRTM_SUBPROCESS where  WFRTM_SUBPROCESS.InstanceID = ainstanceid;
row_WFRTM_SUBPROCESS  child_WFRTM_SUBPROCESS%ROWTYPE;
begin
--open child_WFRTM_SUBPROCESS;
for row_WFRTM_SUBPROCESS in child_WFRTM_SUBPROCESS loop
 WFRTM_SUBPROCESS_DELETE (acursession,row_WFRTM_SUBPROCESS.id,aInstanceID);
end loop;
--close child_WFRTM_SUBPROCESS;
end;
declare cursor child_WFRtm_main is select WFRtm_main.WFRtm_mainid ID from WFRtm_main where  WFRtm_main.InstanceID = ainstanceid;
row_WFRtm_main  child_WFRtm_main%ROWTYPE;
begin
--open child_WFRtm_main;
for row_WFRtm_main in child_WFRtm_main loop
 WFRtm_main_DELETE (acursession,row_WFRtm_main.id,aInstanceID);
end loop;
--close child_WFRtm_main;
end;
declare cursor child_WFRtm_Doc is select WFRtm_Doc.WFRtm_Docid ID from WFRtm_Doc where  WFRtm_Doc.InstanceID = ainstanceid;
row_WFRtm_Doc  child_WFRtm_Doc%ROWTYPE;
begin
--open child_WFRtm_Doc;
for row_WFRtm_Doc in child_WFRtm_Doc loop
 WFRtm_Doc_DELETE (acursession,row_WFRtm_Doc.id,aInstanceID);
end loop;
--close child_WFRtm_Doc;
end;
declare cursor child_WFRtm_func is select WFRtm_func.WFRtm_funcid ID from WFRtm_func where  WFRtm_func.InstanceID = ainstanceid;
row_WFRtm_func  child_WFRtm_func%ROWTYPE;
begin
--open child_WFRtm_func;
for row_WFRtm_func in child_WFRtm_func loop
 WFRtm_func_DELETE (acursession,row_WFRtm_func.id,aInstanceID);
end loop;
--close child_WFRtm_func;
end;
declare cursor child_WFRtm_Pcomm is select WFRtm_Pcomm.WFRtm_Pcommid ID from WFRtm_Pcomm where  WFRtm_Pcomm.InstanceID = ainstanceid;
row_WFRtm_Pcomm  child_WFRtm_Pcomm%ROWTYPE;
begin
--open child_WFRtm_Pcomm;
for row_WFRtm_Pcomm in child_WFRtm_Pcomm loop
 WFRtm_Pcomm_DELETE (acursession,row_WFRtm_Pcomm.id,aInstanceID);
end loop;
--close child_WFRtm_Pcomm;
end;
return;
<<del_error>>
return;
end if;
end;
procedure WFRtm_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'WFRtm'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_WFRtm_Param is select WFRtm_Param.WFRtm_Paramid ID from WFRtm_Param where  WFRtm_Param.InstanceID = arowid;
ROW_WFRtm_Param  lch_WFRtm_Param%ROWTYPE;
begin
--open lch_WFRtm_Param;
for row_WFRtm_Param in lch_WFRtm_Param loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WFRtm_Param where WFRtm_Paramid=row_WFRtm_Param.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFRtm_Param;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WFRtm_Param;
     return;
   end if; 
 end if; 
 WFRtm_Param_HCL (acursession,ROW_WFRtm_Param.id,aisLocked);
 if aisLocked >2 then
   close lch_WFRtm_Param;
   return;
 end if;
 end loop;
--close lch_WFRtm_Param;
end;
declare cursor lch_WFRTM_SUBPROCESS is select WFRTM_SUBPROCESS.WFRTM_SUBPROCESSid ID from WFRTM_SUBPROCESS where  WFRTM_SUBPROCESS.InstanceID = arowid;
ROW_WFRTM_SUBPROCESS  lch_WFRTM_SUBPROCESS%ROWTYPE;
begin
--open lch_WFRTM_SUBPROCESS;
for row_WFRTM_SUBPROCESS in lch_WFRTM_SUBPROCESS loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WFRTM_SUBPROCESS where WFRTM_SUBPROCESSid=row_WFRTM_SUBPROCESS.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFRTM_SUBPROCESS;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WFRTM_SUBPROCESS;
     return;
   end if; 
 end if; 
 WFRTM_SUBPROCESS_HCL (acursession,ROW_WFRTM_SUBPROCESS.id,aisLocked);
 if aisLocked >2 then
   close lch_WFRTM_SUBPROCESS;
   return;
 end if;
 end loop;
--close lch_WFRTM_SUBPROCESS;
end;
declare cursor lch_WFRtm_main is select WFRtm_main.WFRtm_mainid ID from WFRtm_main where  WFRtm_main.InstanceID = arowid;
ROW_WFRtm_main  lch_WFRtm_main%ROWTYPE;
begin
--open lch_WFRtm_main;
for row_WFRtm_main in lch_WFRtm_main loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WFRtm_main where WFRtm_mainid=row_WFRtm_main.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFRtm_main;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WFRtm_main;
     return;
   end if; 
 end if; 
 WFRtm_main_HCL (acursession,ROW_WFRtm_main.id,aisLocked);
 if aisLocked >2 then
   close lch_WFRtm_main;
   return;
 end if;
 end loop;
--close lch_WFRtm_main;
end;
declare cursor lch_WFRtm_Doc is select WFRtm_Doc.WFRtm_Docid ID from WFRtm_Doc where  WFRtm_Doc.InstanceID = arowid;
ROW_WFRtm_Doc  lch_WFRtm_Doc%ROWTYPE;
begin
--open lch_WFRtm_Doc;
for row_WFRtm_Doc in lch_WFRtm_Doc loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WFRtm_Doc where WFRtm_Docid=row_WFRtm_Doc.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFRtm_Doc;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WFRtm_Doc;
     return;
   end if; 
 end if; 
 WFRtm_Doc_HCL (acursession,ROW_WFRtm_Doc.id,aisLocked);
 if aisLocked >2 then
   close lch_WFRtm_Doc;
   return;
 end if;
 end loop;
--close lch_WFRtm_Doc;
end;
declare cursor lch_WFRtm_func is select WFRtm_func.WFRtm_funcid ID from WFRtm_func where  WFRtm_func.InstanceID = arowid;
ROW_WFRtm_func  lch_WFRtm_func%ROWTYPE;
begin
--open lch_WFRtm_func;
for row_WFRtm_func in lch_WFRtm_func loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WFRtm_func where WFRtm_funcid=row_WFRtm_func.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFRtm_func;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WFRtm_func;
     return;
   end if; 
 end if; 
 WFRtm_func_HCL (acursession,ROW_WFRtm_func.id,aisLocked);
 if aisLocked >2 then
   close lch_WFRtm_func;
   return;
 end if;
 end loop;
--close lch_WFRtm_func;
end;
declare cursor lch_WFRtm_Pcomm is select WFRtm_Pcomm.WFRtm_Pcommid ID from WFRtm_Pcomm where  WFRtm_Pcomm.InstanceID = arowid;
ROW_WFRtm_Pcomm  lch_WFRtm_Pcomm%ROWTYPE;
begin
--open lch_WFRtm_Pcomm;
for row_WFRtm_Pcomm in lch_WFRtm_Pcomm loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WFRtm_Pcomm where WFRtm_Pcommid=row_WFRtm_Pcomm.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFRtm_Pcomm;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WFRtm_Pcomm;
     return;
   end if; 
 end if; 
 WFRtm_Pcomm_HCL (acursession,ROW_WFRtm_Pcomm.id,aisLocked);
 if aisLocked >2 then
   close lch_WFRtm_Pcomm;
   return;
 end if;
 end loop;
--close lch_WFRtm_Pcomm;
end;
 end if;
aIsLocked:=0;
end;
procedure WFRtm_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'WFRtm'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_WFRtm_Param is select WFRtm_Param.WFRtm_Paramid id from WFRtm_Param where  WFRtm_Param.InstanceID = arowid;
row_WFRtm_Param  pch_WFRtm_Param%ROWTYPE;
begin
--open pch_WFRtm_Param;
for row_WFRtm_Param in  pch_WFRtm_Param loop
 WFRtm_Param_SINIT( acursession,row_WFRtm_Param.id,assid);
 WFRtm_Param_propagate( acursession,row_WFRtm_Param.id);
end loop;
--close pch_WFRtm_Param;
end;
declare cursor pch_WFRTM_SUBPROCESS is select WFRTM_SUBPROCESS.WFRTM_SUBPROCESSid id from WFRTM_SUBPROCESS where  WFRTM_SUBPROCESS.InstanceID = arowid;
row_WFRTM_SUBPROCESS  pch_WFRTM_SUBPROCESS%ROWTYPE;
begin
--open pch_WFRTM_SUBPROCESS;
for row_WFRTM_SUBPROCESS in  pch_WFRTM_SUBPROCESS loop
 WFRTM_SUBPROCESS_SINIT( acursession,row_WFRTM_SUBPROCESS.id,assid);
 WFRTM_SUBPROCESS_propagate( acursession,row_WFRTM_SUBPROCESS.id);
end loop;
--close pch_WFRTM_SUBPROCESS;
end;
declare cursor pch_WFRtm_main is select WFRtm_main.WFRtm_mainid id from WFRtm_main where  WFRtm_main.InstanceID = arowid;
row_WFRtm_main  pch_WFRtm_main%ROWTYPE;
begin
--open pch_WFRtm_main;
for row_WFRtm_main in  pch_WFRtm_main loop
 WFRtm_main_SINIT( acursession,row_WFRtm_main.id,assid);
 WFRtm_main_propagate( acursession,row_WFRtm_main.id);
end loop;
--close pch_WFRtm_main;
end;
declare cursor pch_WFRtm_Doc is select WFRtm_Doc.WFRtm_Docid id from WFRtm_Doc where  WFRtm_Doc.InstanceID = arowid;
row_WFRtm_Doc  pch_WFRtm_Doc%ROWTYPE;
begin
--open pch_WFRtm_Doc;
for row_WFRtm_Doc in  pch_WFRtm_Doc loop
 WFRtm_Doc_SINIT( acursession,row_WFRtm_Doc.id,assid);
 WFRtm_Doc_propagate( acursession,row_WFRtm_Doc.id);
end loop;
--close pch_WFRtm_Doc;
end;
declare cursor pch_WFRtm_func is select WFRtm_func.WFRtm_funcid id from WFRtm_func where  WFRtm_func.InstanceID = arowid;
row_WFRtm_func  pch_WFRtm_func%ROWTYPE;
begin
--open pch_WFRtm_func;
for row_WFRtm_func in  pch_WFRtm_func loop
 WFRtm_func_SINIT( acursession,row_WFRtm_func.id,assid);
 WFRtm_func_propagate( acursession,row_WFRtm_func.id);
end loop;
--close pch_WFRtm_func;
end;
declare cursor pch_WFRtm_Pcomm is select WFRtm_Pcomm.WFRtm_Pcommid id from WFRtm_Pcomm where  WFRtm_Pcomm.InstanceID = arowid;
row_WFRtm_Pcomm  pch_WFRtm_Pcomm%ROWTYPE;
begin
--open pch_WFRtm_Pcomm;
for row_WFRtm_Pcomm in  pch_WFRtm_Pcomm loop
 WFRtm_Pcomm_SINIT( acursession,row_WFRtm_Pcomm.id,assid);
 WFRtm_Pcomm_propagate( acursession,row_WFRtm_Pcomm.id);
end loop;
--close pch_WFRtm_Pcomm;
end;
 end if; 
end;



procedure WFRtm_Param_BRIEF  (
 aCURSESSION CHAR,
 aWFRtm_Paramid CHAR,
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
if aWFRtm_Paramid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFRtm_Param where WFRtm_ParamID=aWFRtm_ParamID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFRtm_Param where WFRtm_Paramid=aWFRtm_ParamID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFRtm_Param');
    return;
  end if;
  aBRIEF:=func.WFRtm_Param_BRIEF_F(aWFRtm_Paramid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFRtm_Param_DELETE /*Назначенные значения параметров*/ (
 aCURSESSION CHAR,
 aWFRtm_Paramid CHAR,
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
select count(*) into existsCnt from WFRtm_Param where WFRtm_ParamID=aWFRtm_ParamID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFRtm_Param where WFRtm_Paramid=aWFRtm_ParamID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFRtm_Param',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFRtm_Param');
      return;
    end if;
  end if;
 --  verify lock  --
 WFRtm_Param_ISLOCKED( acursession=>acursession,aROWID=>aWFRtm_Paramid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFRtm_Param');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFRtm_Param',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFRtm_Paramid, aLogInstanceID=>aInstanceID);
declare cursor chld_WFRtm_Param is select  instanceid ID from instance where OwnerPartName ='WFRtm_Param' and OwnerRowID=aWFRtm_Paramid;
row_WFRtm_Param  chld_WFRtm_Param%ROWTYPE;
begin
--open chld_WFRtm_Param;
for row_WFRtm_Param in chld_WFRtm_Param loop
 Kernel.INSTANCE_OWNER (acursession,row_WFRtm_Param.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFRtm_Param.id);
end loop;
--close chld_WFRtm_Param;
end ;
  delete from  WFRtm_Param 
  where  WFRtm_ParamID = aWFRtm_ParamID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Параметры*/
procedure WFRtm_Param_SAVE /*Назначенные значения параметров*/ (
 aCURSESSION CHAR,
 aWFRtm_Paramid CHAR,
aInstanceID CHAR 
,aBasedOn CHAR/* Реализует *//* Реализует */
,athe_Value
 VARCHAR2/* Значение *//* Значение */
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
select count(*) into existsCnt from WFRtm_Param where WFRtm_ParamID=aWFRtm_ParamID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFRtm_Param where WFRtm_Paramid=aWFRtm_ParamID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFRtm_Param',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFRtm_Param');
      return;
    end if;
  end if;
 --  verify lock  --
 WFRtm_Param_ISLOCKED( acursession=>acursession,aROWID=>aWFRtm_Paramid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFRtm_Param');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFRtm_Param',
 aVERB=>'EDITROW',  aThe_Resource=>aWFRtm_Paramid,aLogInstanceID=>aInstanceID);
 update  WFRtm_Param set ChangeStamp=sysdate
,
  BasedOn=aBasedOn
,
  the_Value=athe_Value
  where  WFRtm_ParamID = aWFRtm_ParamID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFRtm_Param',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFRtm_Param');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFRtm_Param');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFRtm_Param',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFRtm_Paramid,aLogInstanceID=>aInstanceID);
 insert into   WFRtm_Param
 (  WFRtm_ParamID 
,InstanceID
,BasedOn

,the_Value

 ) values ( aWFRtm_ParamID 
,aInstanceID
,aBasedOn

,athe_Value

 ); 
 WFRtm_Param_SINIT( aCURSESSION,aWFRtm_Paramid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WFRtm_Param_PARENT /*Назначенные значения параметров*/ (
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
  select  INSTANCEID into aParentID from WFRtm_Param where  WFRtm_Paramid=aRowID;
 end; 


procedure WFRtm_Param_ISLOCKED /*Назначенные значения параметров*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFRtm_Param where WFRtm_Paramid=aRowID;
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
  WFRtm_Param_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFRtm.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFRtm_Param_LOCK /*Назначенные значения параметров*/ (
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
 WFRtm_Param_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFRtm_Param_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFRtm_Param where WFRtm_Paramid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFRtm_Param');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFRtm_Param set LockUserID =auserID ,LockSessionID =null where WFRtm_Paramid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFRtm_Param set LockUserID =null,LockSessionID =aCURSESSION  where WFRtm_Paramid=aRowID;
     return;
   end if;
 end ;


procedure WFRtm_Param_HCL /*Назначенные значения параметров*/ (
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


procedure WFRtm_Param_UNLOCK /*Назначенные значения параметров*/ (
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
 WFRtm_Param_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFRtm_Param set LockUserID =null  where WFRtm_Paramid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFRtm_Param set LockSessionID =null  where WFRtm_Paramid=aRowID;
     return;
   end if;
 end; 


procedure WFRtm_Param_SINIT /*Назначенные значения параметров*/ (
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
 select  SecurityStyleID into atmpID from WFRtm_Param where WFRtm_Paramid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFRtm_Param');
    return;
  end if;
if aSecurityStyleID is null then
 WFRtm_Param_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFRtm_Param set securitystyleid =aStyleID where WFRtm_Paramid = aRowID;
else 
 update WFRtm_Param set securitystyleid =aSecurityStyleID where WFRtm_Paramid = aRowID;
end if; 
end ; 


procedure WFRtm_Param_propagate /*Назначенные значения параметров*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFRtm_Param where WFRtm_Paramid=aRowid;
end;



procedure WFRTM_SUBPROCESS_BRIEF  (
 aCURSESSION CHAR,
 aWFRTM_SUBPROCESSid CHAR,
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
if aWFRTM_SUBPROCESSid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFRTM_SUBPROCESS where WFRTM_SUBPROCESSID=aWFRTM_SUBPROCESSID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFRTM_SUBPROCESS where WFRTM_SUBPROCESSid=aWFRTM_SUBPROCESSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFRTM_SUBPROCESS');
    return;
  end if;
  aBRIEF:=func.WFRTM_SUBPROCESS_BRIEF_F(aWFRTM_SUBPROCESSid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFRTM_SUBPROCESS_DELETE /*Дочерние процессы */ (
 aCURSESSION CHAR,
 aWFRTM_SUBPROCESSid CHAR,
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
select count(*) into existsCnt from WFRTM_SUBPROCESS where WFRTM_SUBPROCESSID=aWFRTM_SUBPROCESSID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFRTM_SUBPROCESS where WFRTM_SUBPROCESSid=aWFRTM_SUBPROCESSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFRTM_SUBPROCESS',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFRTM_SUBPROCESS');
      return;
    end if;
  end if;
 --  verify lock  --
 WFRTM_SUBPROCESS_ISLOCKED( acursession=>acursession,aROWID=>aWFRTM_SUBPROCESSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFRTM_SUBPROCESS');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFRTM_SUBPROCESS',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFRTM_SUBPROCESSid, aLogInstanceID=>aInstanceID);
declare cursor chld_WFRTM_SUBPROCESS is select  instanceid ID from instance where OwnerPartName ='WFRTM_SUBPROCESS' and OwnerRowID=aWFRTM_SUBPROCESSid;
row_WFRTM_SUBPROCESS  chld_WFRTM_SUBPROCESS%ROWTYPE;
begin
--open chld_WFRTM_SUBPROCESS;
for row_WFRTM_SUBPROCESS in chld_WFRTM_SUBPROCESS loop
 Kernel.INSTANCE_OWNER (acursession,row_WFRTM_SUBPROCESS.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFRTM_SUBPROCESS.id);
end loop;
--close chld_WFRTM_SUBPROCESS;
end ;
  delete from  WFRTM_SUBPROCESS 
  where  WFRTM_SUBPROCESSID = aWFRTM_SUBPROCESSID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Подпроцессы*/
procedure WFRTM_SUBPROCESS_SAVE /*Дочерние процессы */ (
 aCURSESSION CHAR,
 aWFRTM_SUBPROCESSid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Имя процесса *//* Имя процесса */
,aProcess CHAR/* Процесс *//* Процесс */
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
select count(*) into existsCnt from WFRTM_SUBPROCESS where WFRTM_SUBPROCESSID=aWFRTM_SUBPROCESSID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFRTM_SUBPROCESS where WFRTM_SUBPROCESSid=aWFRTM_SUBPROCESSID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFRTM_SUBPROCESS',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFRTM_SUBPROCESS');
      return;
    end if;
  end if;
 --  verify lock  --
 WFRTM_SUBPROCESS_ISLOCKED( acursession=>acursession,aROWID=>aWFRTM_SUBPROCESSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFRTM_SUBPROCESS');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFRTM_SUBPROCESS',
 aVERB=>'EDITROW',  aThe_Resource=>aWFRTM_SUBPROCESSid,aLogInstanceID=>aInstanceID);
 update  WFRTM_SUBPROCESS set ChangeStamp=sysdate
,
  Name=aName
,
  Process=aProcess
  where  WFRTM_SUBPROCESSID = aWFRTM_SUBPROCESSID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFRTM_SUBPROCESS',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFRTM_SUBPROCESS');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFRTM_SUBPROCESS');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFRTM_SUBPROCESS',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFRTM_SUBPROCESSid,aLogInstanceID=>aInstanceID);
 insert into   WFRTM_SUBPROCESS
 (  WFRTM_SUBPROCESSID 
,InstanceID
,Name

,Process

 ) values ( aWFRTM_SUBPROCESSID 
,aInstanceID
,aName

,aProcess

 ); 
 WFRTM_SUBPROCESS_SINIT( aCURSESSION,aWFRTM_SUBPROCESSid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WFRTM_SUBPROCESS_PARENT /*Дочерние процессы */ (
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
  select  INSTANCEID into aParentID from WFRTM_SUBPROCESS where  WFRTM_SUBPROCESSid=aRowID;
 end; 


procedure WFRTM_SUBPROCESS_ISLOCKED /*Дочерние процессы */ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFRTM_SUBPROCESS where WFRTM_SUBPROCESSid=aRowID;
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
  WFRTM_SUBPROCESS_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFRtm.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFRTM_SUBPROCESS_LOCK /*Дочерние процессы */ (
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
 WFRTM_SUBPROCESS_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFRTM_SUBPROCESS_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFRTM_SUBPROCESS where WFRTM_SUBPROCESSid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFRTM_SUBPROCESS');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFRTM_SUBPROCESS set LockUserID =auserID ,LockSessionID =null where WFRTM_SUBPROCESSid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFRTM_SUBPROCESS set LockUserID =null,LockSessionID =aCURSESSION  where WFRTM_SUBPROCESSid=aRowID;
     return;
   end if;
 end ;


procedure WFRTM_SUBPROCESS_HCL /*Дочерние процессы */ (
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


procedure WFRTM_SUBPROCESS_UNLOCK /*Дочерние процессы */ (
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
 WFRTM_SUBPROCESS_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFRTM_SUBPROCESS set LockUserID =null  where WFRTM_SUBPROCESSid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFRTM_SUBPROCESS set LockSessionID =null  where WFRTM_SUBPROCESSid=aRowID;
     return;
   end if;
 end; 


procedure WFRTM_SUBPROCESS_SINIT /*Дочерние процессы */ (
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
 select  SecurityStyleID into atmpID from WFRTM_SUBPROCESS where WFRTM_SUBPROCESSid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFRTM_SUBPROCESS');
    return;
  end if;
if aSecurityStyleID is null then
 WFRTM_SUBPROCESS_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFRTM_SUBPROCESS set securitystyleid =aStyleID where WFRTM_SUBPROCESSid = aRowID;
else 
 update WFRTM_SUBPROCESS set securitystyleid =aSecurityStyleID where WFRTM_SUBPROCESSid = aRowID;
end if; 
end ; 


procedure WFRTM_SUBPROCESS_propagate /*Дочерние процессы */ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFRTM_SUBPROCESS where WFRTM_SUBPROCESSid=aRowid;
end;



procedure WFRtm_main_BRIEF  (
 aCURSESSION CHAR,
 aWFRtm_mainid CHAR,
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
if aWFRtm_mainid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFRtm_main where WFRtm_mainID=aWFRtm_mainID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFRtm_main where WFRtm_mainid=aWFRtm_mainID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFRtm_main');
    return;
  end if;
  aBRIEF:=func.WFRtm_main_BRIEF_F(aWFRtm_mainid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFRtm_main_DELETE /*Общие данные процесса*/ (
 aCURSESSION CHAR,
 aWFRtm_mainid CHAR,
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
select count(*) into existsCnt from WFRtm_main where WFRtm_mainID=aWFRtm_mainID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFRtm_main where WFRtm_mainid=aWFRtm_mainID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFRtm_main',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFRtm_main');
      return;
    end if;
  end if;
 --  verify lock  --
 WFRtm_main_ISLOCKED( acursession=>acursession,aROWID=>aWFRtm_mainid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFRtm_main');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFRtm_main',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFRtm_mainid, aLogInstanceID=>aInstanceID);
declare cursor chld_WFRtm_main is select  instanceid ID from instance where OwnerPartName ='WFRtm_main' and OwnerRowID=aWFRtm_mainid;
row_WFRtm_main  chld_WFRtm_main%ROWTYPE;
begin
--open chld_WFRtm_main;
for row_WFRtm_main in chld_WFRtm_main loop
 Kernel.INSTANCE_OWNER (acursession,row_WFRtm_main.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFRtm_main.id);
end loop;
--close chld_WFRtm_main;
end ;
  delete from  WFRtm_main 
  where  WFRtm_mainID = aWFRtm_mainID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Общие данные*/
procedure WFRtm_main_SAVE /*Общие данные процесса*/ (
 aCURSESSION CHAR,
 aWFRtm_mainid CHAR,
aInstanceID CHAR 
,aProcessState
 NUMBER/* Состояние процесса *//* Состояние процесса */
,aBasedOn CHAR/* Реализует *//* Реализует */
,athe_Description VARCHAR2 := null /* Сопровоительная информация *//* Сопровоительная информация */
,aAttachment VARCHAR2 := null /* Приложение */
,aAttachment_EXT varchar2 /* Приложение */
,aModerator CHAR := null /* Отвественный *//* Отвественный */
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
select count(*) into existsCnt from WFRtm_main where WFRtm_mainID=aWFRtm_mainID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFRtm_main where WFRtm_mainid=aWFRtm_mainID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFRtm_main',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFRtm_main');
      return;
    end if;
  end if;
 --  verify lock  --
 WFRtm_main_ISLOCKED( acursession=>acursession,aROWID=>aWFRtm_mainid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFRtm_main');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFRtm_main',
 aVERB=>'EDITROW',  aThe_Resource=>aWFRtm_mainid,aLogInstanceID=>aInstanceID);
 update  WFRtm_main set ChangeStamp=sysdate
,
  ProcessState=aProcessState
,
  BasedOn=aBasedOn
,
  the_Description=athe_Description
,
  Attachment=aAttachment
,Attachment_EXT=
aAttachment_EXT 
,
  Moderator=aModerator
  where  WFRtm_mainID = aWFRtm_mainID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFRtm_main',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFRtm_main');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFRtm_main');
    return;
  end if;
select Count(*) into existsCnt from WFRtm_main where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <WFRtm_main>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFRtm_main',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFRtm_mainid,aLogInstanceID=>aInstanceID);
 insert into   WFRtm_main
 (  WFRtm_mainID 
,InstanceID
,ProcessState

,BasedOn

,the_Description

,Attachment

,Attachment_EXT
,Moderator

 ) values ( aWFRtm_mainID 
,aInstanceID
,aProcessState

,aBasedOn

,athe_Description

,aAttachment

,aAttachment_EXT
,aModerator

 ); 
 WFRtm_main_SINIT( aCURSESSION,aWFRtm_mainid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WFRtm_main_PARENT /*Общие данные процесса*/ (
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
  select  INSTANCEID into aParentID from WFRtm_main where  WFRtm_mainid=aRowID;
 end; 


procedure WFRtm_main_ISLOCKED /*Общие данные процесса*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFRtm_main where WFRtm_mainid=aRowID;
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
  WFRtm_main_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFRtm.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFRtm_main_LOCK /*Общие данные процесса*/ (
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
 WFRtm_main_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFRtm_main_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFRtm_main where WFRtm_mainid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFRtm_main');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFRtm_main set LockUserID =auserID ,LockSessionID =null where WFRtm_mainid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFRtm_main set LockUserID =null,LockSessionID =aCURSESSION  where WFRtm_mainid=aRowID;
     return;
   end if;
 end ;


procedure WFRtm_main_HCL /*Общие данные процесса*/ (
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


procedure WFRtm_main_UNLOCK /*Общие данные процесса*/ (
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
 WFRtm_main_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFRtm_main set LockUserID =null  where WFRtm_mainid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFRtm_main set LockSessionID =null  where WFRtm_mainid=aRowID;
     return;
   end if;
 end; 


procedure WFRtm_main_SINIT /*Общие данные процесса*/ (
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
 select  SecurityStyleID into atmpID from WFRtm_main where WFRtm_mainid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFRtm_main');
    return;
  end if;
if aSecurityStyleID is null then
 WFRtm_main_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFRtm_main set securitystyleid =aStyleID where WFRtm_mainid = aRowID;
else 
 update WFRtm_main set securitystyleid =aSecurityStyleID where WFRtm_mainid = aRowID;
end if; 
end ; 


procedure WFRtm_main_propagate /*Общие данные процесса*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFRtm_main where WFRtm_mainid=aRowid;
end;



procedure WFRtm_Doc_BRIEF  (
 aCURSESSION CHAR,
 aWFRtm_Docid CHAR,
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
if aWFRtm_Docid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFRtm_Doc where WFRtm_DocID=aWFRtm_DocID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFRtm_Doc where WFRtm_Docid=aWFRtm_DocID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFRtm_Doc');
    return;
  end if;
  aBRIEF:=func.WFRtm_Doc_BRIEF_F(aWFRtm_Docid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFRtm_Doc_DELETE /*Экземпляры документов в данном процессе*/ (
 aCURSESSION CHAR,
 aWFRtm_Docid CHAR,
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
select count(*) into existsCnt from WFRtm_Doc where WFRtm_DocID=aWFRtm_DocID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFRtm_Doc where WFRtm_Docid=aWFRtm_DocID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFRtm_Doc',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFRtm_Doc');
      return;
    end if;
  end if;
 --  verify lock  --
 WFRtm_Doc_ISLOCKED( acursession=>acursession,aROWID=>aWFRtm_Docid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFRtm_Doc');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFRtm_Doc',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFRtm_Docid, aLogInstanceID=>aInstanceID);
declare cursor chld_WFRtm_Doc is select  instanceid ID from instance where OwnerPartName ='WFRtm_Doc' and OwnerRowID=aWFRtm_Docid;
row_WFRtm_Doc  chld_WFRtm_Doc%ROWTYPE;
begin
--open chld_WFRtm_Doc;
for row_WFRtm_Doc in chld_WFRtm_Doc loop
 Kernel.INSTANCE_OWNER (acursession,row_WFRtm_Doc.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFRtm_Doc.id);
end loop;
--close chld_WFRtm_Doc;
end ;
  delete from  WFRtm_Doc 
  where  WFRtm_DocID = aWFRtm_DocID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Документы*/
procedure WFRtm_Doc_SAVE /*Экземпляры документов в данном процессе*/ (
 aCURSESSION CHAR,
 aWFRtm_Docid CHAR,
aInstanceID CHAR 
,aBasedOn CHAR/* Реализует *//* Реализует */
,aDocument CHAR/* Документ *//* Документ */
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
select count(*) into existsCnt from WFRtm_Doc where WFRtm_DocID=aWFRtm_DocID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFRtm_Doc where WFRtm_Docid=aWFRtm_DocID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFRtm_Doc',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFRtm_Doc');
      return;
    end if;
  end if;
 --  verify lock  --
 WFRtm_Doc_ISLOCKED( acursession=>acursession,aROWID=>aWFRtm_Docid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFRtm_Doc');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFRtm_Doc',
 aVERB=>'EDITROW',  aThe_Resource=>aWFRtm_Docid,aLogInstanceID=>aInstanceID);
 update  WFRtm_Doc set ChangeStamp=sysdate
,
  BasedOn=aBasedOn
,
  Document=aDocument
  where  WFRtm_DocID = aWFRtm_DocID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFRtm_Doc',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFRtm_Doc');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFRtm_Doc');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFRtm_Doc',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFRtm_Docid,aLogInstanceID=>aInstanceID);
 insert into   WFRtm_Doc
 (  WFRtm_DocID 
,InstanceID
,BasedOn

,Document

 ) values ( aWFRtm_DocID 
,aInstanceID
,aBasedOn

,aDocument

 ); 
 WFRtm_Doc_SINIT( aCURSESSION,aWFRtm_Docid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WFRtm_Doc_PARENT /*Экземпляры документов в данном процессе*/ (
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
  select  INSTANCEID into aParentID from WFRtm_Doc where  WFRtm_Docid=aRowID;
 end; 


procedure WFRtm_Doc_ISLOCKED /*Экземпляры документов в данном процессе*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFRtm_Doc where WFRtm_Docid=aRowID;
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
  WFRtm_Doc_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFRtm.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFRtm_Doc_LOCK /*Экземпляры документов в данном процессе*/ (
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
 WFRtm_Doc_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFRtm_Doc_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFRtm_Doc where WFRtm_Docid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFRtm_Doc');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFRtm_Doc set LockUserID =auserID ,LockSessionID =null where WFRtm_Docid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFRtm_Doc set LockUserID =null,LockSessionID =aCURSESSION  where WFRtm_Docid=aRowID;
     return;
   end if;
 end ;


procedure WFRtm_Doc_HCL /*Экземпляры документов в данном процессе*/ (
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


procedure WFRtm_Doc_UNLOCK /*Экземпляры документов в данном процессе*/ (
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
 WFRtm_Doc_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFRtm_Doc set LockUserID =null  where WFRtm_Docid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFRtm_Doc set LockSessionID =null  where WFRtm_Docid=aRowID;
     return;
   end if;
 end; 


procedure WFRtm_Doc_SINIT /*Экземпляры документов в данном процессе*/ (
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
 select  SecurityStyleID into atmpID from WFRtm_Doc where WFRtm_Docid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFRtm_Doc');
    return;
  end if;
if aSecurityStyleID is null then
 WFRtm_Doc_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFRtm_Doc set securitystyleid =aStyleID where WFRtm_Docid = aRowID;
else 
 update WFRtm_Doc set securitystyleid =aSecurityStyleID where WFRtm_Docid = aRowID;
end if; 
end ; 


procedure WFRtm_Doc_propagate /*Экземпляры документов в данном процессе*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFRtm_Doc where WFRtm_Docid=aRowid;
end;



procedure WFRtm_func_BRIEF  (
 aCURSESSION CHAR,
 aWFRtm_funcid CHAR,
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
if aWFRtm_funcid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFRtm_func where WFRtm_funcID=aWFRtm_funcID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFRtm_func where WFRtm_funcid=aWFRtm_funcID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFRtm_func');
    return;
  end if;
  aBRIEF:=func.WFRtm_func_BRIEF_F(aWFRtm_funcid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFRtm_func_DELETE /*функции процесса*/ (
 aCURSESSION CHAR,
 aWFRtm_funcid CHAR,
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
select count(*) into existsCnt from WFRtm_func where WFRtm_funcID=aWFRtm_funcID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFRtm_func where WFRtm_funcid=aWFRtm_funcID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFRtm_func',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFRtm_func');
      return;
    end if;
  end if;
 --  verify lock  --
 WFRtm_func_ISLOCKED( acursession=>acursession,aROWID=>aWFRtm_funcid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFRtm_func');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFRtm_func',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFRtm_funcid, aLogInstanceID=>aInstanceID);
declare cursor chld_WFRtm_func is select  instanceid ID from instance where OwnerPartName ='WFRtm_func' and OwnerRowID=aWFRtm_funcid;
row_WFRtm_func  chld_WFRtm_func%ROWTYPE;
begin
--open chld_WFRtm_func;
for row_WFRtm_func in chld_WFRtm_func loop
 Kernel.INSTANCE_OWNER (acursession,row_WFRtm_func.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFRtm_func.id);
end loop;
--close chld_WFRtm_func;
end ;
  delete from  WFRtm_func 
  where  WFRtm_funcID = aWFRtm_funcID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Функции*/
procedure WFRtm_func_SAVE /*функции процесса*/ (
 aCURSESSION CHAR,
 aWFRtm_funcid CHAR,
aInstanceID CHAR 
,aFunc CHAR/* Функция *//* Функция */
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
select count(*) into existsCnt from WFRtm_func where WFRtm_funcID=aWFRtm_funcID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFRtm_func where WFRtm_funcid=aWFRtm_funcID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFRtm_func',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFRtm_func');
      return;
    end if;
  end if;
 --  verify lock  --
 WFRtm_func_ISLOCKED( acursession=>acursession,aROWID=>aWFRtm_funcid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFRtm_func');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFRtm_func',
 aVERB=>'EDITROW',  aThe_Resource=>aWFRtm_funcid,aLogInstanceID=>aInstanceID);
 update  WFRtm_func set ChangeStamp=sysdate
,
  Func=aFunc
  where  WFRtm_funcID = aWFRtm_funcID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFRtm_func',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFRtm_func');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFRtm_func');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFRtm_func',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFRtm_funcid,aLogInstanceID=>aInstanceID);
 insert into   WFRtm_func
 (  WFRtm_funcID 
,InstanceID
,Func

 ) values ( aWFRtm_funcID 
,aInstanceID
,aFunc

 ); 
 WFRtm_func_SINIT( aCURSESSION,aWFRtm_funcid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WFRtm_func_PARENT /*функции процесса*/ (
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
  select  INSTANCEID into aParentID from WFRtm_func where  WFRtm_funcid=aRowID;
 end; 


procedure WFRtm_func_ISLOCKED /*функции процесса*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFRtm_func where WFRtm_funcid=aRowID;
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
  WFRtm_func_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFRtm.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFRtm_func_LOCK /*функции процесса*/ (
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
 WFRtm_func_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFRtm_func_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFRtm_func where WFRtm_funcid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFRtm_func');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFRtm_func set LockUserID =auserID ,LockSessionID =null where WFRtm_funcid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFRtm_func set LockUserID =null,LockSessionID =aCURSESSION  where WFRtm_funcid=aRowID;
     return;
   end if;
 end ;


procedure WFRtm_func_HCL /*функции процесса*/ (
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


procedure WFRtm_func_UNLOCK /*функции процесса*/ (
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
 WFRtm_func_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFRtm_func set LockUserID =null  where WFRtm_funcid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFRtm_func set LockSessionID =null  where WFRtm_funcid=aRowID;
     return;
   end if;
 end; 


procedure WFRtm_func_SINIT /*функции процесса*/ (
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
 select  SecurityStyleID into atmpID from WFRtm_func where WFRtm_funcid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFRtm_func');
    return;
  end if;
if aSecurityStyleID is null then
 WFRtm_func_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFRtm_func set securitystyleid =aStyleID where WFRtm_funcid = aRowID;
else 
 update WFRtm_func set securitystyleid =aSecurityStyleID where WFRtm_funcid = aRowID;
end if; 
end ; 


procedure WFRtm_func_propagate /*функции процесса*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFRtm_func where WFRtm_funcid=aRowid;
end;



procedure WFRtm_Pcomm_BRIEF  (
 aCURSESSION CHAR,
 aWFRtm_Pcommid CHAR,
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
if aWFRtm_Pcommid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFRtm_Pcomm where WFRtm_PcommID=aWFRtm_PcommID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFRtm_Pcomm where WFRtm_Pcommid=aWFRtm_PcommID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFRtm_Pcomm');
    return;
  end if;
  aBRIEF:=func.WFRtm_Pcomm_BRIEF_F(aWFRtm_Pcommid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFRtm_Pcomm_DELETE /*Комментарии к процессу в целом*/ (
 aCURSESSION CHAR,
 aWFRtm_Pcommid CHAR,
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
select count(*) into existsCnt from WFRtm_Pcomm where WFRtm_PcommID=aWFRtm_PcommID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFRtm_Pcomm where WFRtm_Pcommid=aWFRtm_PcommID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFRtm_Pcomm',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFRtm_Pcomm');
      return;
    end if;
  end if;
 --  verify lock  --
 WFRtm_Pcomm_ISLOCKED( acursession=>acursession,aROWID=>aWFRtm_Pcommid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFRtm_Pcomm');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFRtm_Pcomm',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFRtm_Pcommid, aLogInstanceID=>aInstanceID);
declare cursor chld_WFRtm_Pcomm is select  instanceid ID from instance where OwnerPartName ='WFRtm_Pcomm' and OwnerRowID=aWFRtm_Pcommid;
row_WFRtm_Pcomm  chld_WFRtm_Pcomm%ROWTYPE;
begin
--open chld_WFRtm_Pcomm;
for row_WFRtm_Pcomm in chld_WFRtm_Pcomm loop
 Kernel.INSTANCE_OWNER (acursession,row_WFRtm_Pcomm.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFRtm_Pcomm.id);
end loop;
--close chld_WFRtm_Pcomm;
end ;
  delete from  WFRtm_Pcomm 
  where  WFRtm_PcommID = aWFRtm_PcommID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Комментарии*/
procedure WFRtm_Pcomm_SAVE /*Комментарии к процессу в целом*/ (
 aCURSESSION CHAR,
 aWFRtm_Pcommid CHAR,
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
select count(*) into existsCnt from WFRtm_Pcomm where WFRtm_PcommID=aWFRtm_PcommID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFRtm_Pcomm where WFRtm_Pcommid=aWFRtm_PcommID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFRtm_Pcomm',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFRtm_Pcomm');
      return;
    end if;
  end if;
 --  verify lock  --
 WFRtm_Pcomm_ISLOCKED( acursession=>acursession,aROWID=>aWFRtm_Pcommid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFRtm_Pcomm');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFRtm_Pcomm',
 aVERB=>'EDITROW',  aThe_Resource=>aWFRtm_Pcommid,aLogInstanceID=>aInstanceID);
 update  WFRtm_Pcomm set ChangeStamp=sysdate
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
  where  WFRtm_PcommID = aWFRtm_PcommID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFRtm_Pcomm',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFRtm_Pcomm');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFRtm_Pcomm');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFRtm_Pcomm',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFRtm_Pcommid,aLogInstanceID=>aInstanceID);
 insert into   WFRtm_Pcomm
 (  WFRtm_PcommID 
,ParentRowid
,InstanceID
,Author

,Subject

,Message

,Attachment

,Attachment_EXT
 ) values ( aWFRtm_PcommID 
,aParentRowid
,aInstanceID
,aAuthor

,aSubject

,aMessage

,aAttachment

,aAttachment_EXT
 ); 
 WFRtm_Pcomm_SINIT( aCURSESSION,aWFRtm_Pcommid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WFRtm_Pcomm_PARENT /*Комментарии к процессу в целом*/ (
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
  select  INSTANCEID into aParentID from WFRtm_Pcomm where  WFRtm_Pcommid=aRowID;
 end; 


procedure WFRtm_Pcomm_ISLOCKED /*Комментарии к процессу в целом*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFRtm_Pcomm where WFRtm_Pcommid=aRowID;
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
  WFRtm_Pcomm_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFRtm.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFRtm_Pcomm_LOCK /*Комментарии к процессу в целом*/ (
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
 WFRtm_Pcomm_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFRtm_Pcomm_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFRtm_Pcomm where WFRtm_Pcommid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFRtm_Pcomm');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFRtm_Pcomm set LockUserID =auserID ,LockSessionID =null where WFRtm_Pcommid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFRtm_Pcomm set LockUserID =null,LockSessionID =aCURSESSION  where WFRtm_Pcommid=aRowID;
     return;
   end if;
 end ;


procedure WFRtm_Pcomm_HCL /*Комментарии к процессу в целом*/ (
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


procedure WFRtm_Pcomm_UNLOCK /*Комментарии к процессу в целом*/ (
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
 WFRtm_Pcomm_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFRtm_Pcomm set LockUserID =null  where WFRtm_Pcommid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFRtm_Pcomm set LockSessionID =null  where WFRtm_Pcommid=aRowID;
     return;
   end if;
 end; 


procedure WFRtm_Pcomm_SINIT /*Комментарии к процессу в целом*/ (
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
 select  SecurityStyleID into atmpID from WFRtm_Pcomm where WFRtm_Pcommid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFRtm_Pcomm');
    return;
  end if;
if aSecurityStyleID is null then
 WFRtm_Pcomm_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFRtm_Pcomm set securitystyleid =aStyleID where WFRtm_Pcommid = aRowID;
else 
 update WFRtm_Pcomm set securitystyleid =aSecurityStyleID where WFRtm_Pcommid = aRowID;
end if; 
end ; 


procedure WFRtm_Pcomm_propagate /*Комментарии к процессу в целом*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFRtm_Pcomm where WFRtm_Pcommid=aRowid;
end;


end WFRtm;

/



