
/* --WFDef*/

 create or replace package body WFDef as

procedure WFDef_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='WFDef'
then
declare cursor child_WFDef_param is select WFDef_param.WFDef_paramid ID from WFDef_param where  WFDef_param.InstanceID = ainstanceid;
row_WFDef_param  child_WFDef_param%ROWTYPE;
begin
--open child_WFDef_param;
for row_WFDef_param in child_WFDef_param loop
 WFDef_param_DELETE (acursession,row_WFDef_param.id,aInstanceID);
end loop;
--close child_WFDef_param;
end;
declare cursor child_WFDef_Doc is select WFDef_Doc.WFDef_Docid ID from WFDef_Doc where  WFDef_Doc.InstanceID = ainstanceid;
row_WFDef_Doc  child_WFDef_Doc%ROWTYPE;
begin
--open child_WFDef_Doc;
for row_WFDef_Doc in child_WFDef_Doc loop
 WFDef_Doc_DELETE (acursession,row_WFDef_Doc.id,aInstanceID);
end loop;
--close child_WFDef_Doc;
end;
declare cursor child_WFDef_func is select WFDef_func.WFDef_funcid ID from WFDef_func where  WFDef_func.InstanceID = ainstanceid;
row_WFDef_func  child_WFDef_func%ROWTYPE;
begin
--open child_WFDef_func;
for row_WFDef_func in child_WFDef_func loop
 WFDef_func_DELETE (acursession,row_WFDef_func.id,aInstanceID);
end loop;
--close child_WFDef_func;
end;
declare cursor child_WFDef_master is select WFDef_master.WFDef_masterid ID from WFDef_master where  WFDef_master.InstanceID = ainstanceid;
row_WFDef_master  child_WFDef_master%ROWTYPE;
begin
--open child_WFDef_master;
for row_WFDef_master in child_WFDef_master loop
 WFDef_master_DELETE (acursession,row_WFDef_master.id,aInstanceID);
end loop;
--close child_WFDef_master;
end;
declare cursor child_WFDef_INFO is select WFDef_INFO.WFDef_INFOid ID from WFDef_INFO where  WFDef_INFO.InstanceID = ainstanceid;
row_WFDef_INFO  child_WFDef_INFO%ROWTYPE;
begin
--open child_WFDef_INFO;
for row_WFDef_INFO in child_WFDef_INFO loop
 WFDef_INFO_DELETE (acursession,row_WFDef_INFO.id,aInstanceID);
end loop;
--close child_WFDef_INFO;
end;
declare cursor child_WFDef_links is select WFDef_links.WFDef_linksid ID from WFDef_links where  WFDef_links.InstanceID = ainstanceid;
row_WFDef_links  child_WFDef_links%ROWTYPE;
begin
--open child_WFDef_links;
for row_WFDef_links in child_WFDef_links loop
 WFDef_links_DELETE (acursession,row_WFDef_links.id,aInstanceID);
end loop;
--close child_WFDef_links;
end;
return;
<<del_error>>
return;
end if;
end;
procedure WFDef_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'WFDef'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_WFDef_param is select WFDef_param.WFDef_paramid ID from WFDef_param where  WFDef_param.InstanceID = arowid;
ROW_WFDef_param  lch_WFDef_param%ROWTYPE;
begin
--open lch_WFDef_param;
for row_WFDef_param in lch_WFDef_param loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WFDef_param where WFDef_paramid=row_WFDef_param.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFDef_param;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WFDef_param;
     return;
   end if; 
 end if; 
 WFDef_param_HCL (acursession,ROW_WFDef_param.id,aisLocked);
 if aisLocked >2 then
   close lch_WFDef_param;
   return;
 end if;
 end loop;
--close lch_WFDef_param;
end;
declare cursor lch_WFDef_Doc is select WFDef_Doc.WFDef_Docid ID from WFDef_Doc where  WFDef_Doc.InstanceID = arowid;
ROW_WFDef_Doc  lch_WFDef_Doc%ROWTYPE;
begin
--open lch_WFDef_Doc;
for row_WFDef_Doc in lch_WFDef_Doc loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WFDef_Doc where WFDef_Docid=row_WFDef_Doc.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFDef_Doc;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WFDef_Doc;
     return;
   end if; 
 end if; 
 WFDef_Doc_HCL (acursession,ROW_WFDef_Doc.id,aisLocked);
 if aisLocked >2 then
   close lch_WFDef_Doc;
   return;
 end if;
 end loop;
--close lch_WFDef_Doc;
end;
declare cursor lch_WFDef_func is select WFDef_func.WFDef_funcid ID from WFDef_func where  WFDef_func.InstanceID = arowid;
ROW_WFDef_func  lch_WFDef_func%ROWTYPE;
begin
--open lch_WFDef_func;
for row_WFDef_func in lch_WFDef_func loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WFDef_func where WFDef_funcid=row_WFDef_func.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFDef_func;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WFDef_func;
     return;
   end if; 
 end if; 
 WFDef_func_HCL (acursession,ROW_WFDef_func.id,aisLocked);
 if aisLocked >2 then
   close lch_WFDef_func;
   return;
 end if;
 end loop;
--close lch_WFDef_func;
end;
declare cursor lch_WFDef_master is select WFDef_master.WFDef_masterid ID from WFDef_master where  WFDef_master.InstanceID = arowid;
ROW_WFDef_master  lch_WFDef_master%ROWTYPE;
begin
--open lch_WFDef_master;
for row_WFDef_master in lch_WFDef_master loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WFDef_master where WFDef_masterid=row_WFDef_master.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFDef_master;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WFDef_master;
     return;
   end if; 
 end if; 
 WFDef_master_HCL (acursession,ROW_WFDef_master.id,aisLocked);
 if aisLocked >2 then
   close lch_WFDef_master;
   return;
 end if;
 end loop;
--close lch_WFDef_master;
end;
declare cursor lch_WFDef_INFO is select WFDef_INFO.WFDef_INFOid ID from WFDef_INFO where  WFDef_INFO.InstanceID = arowid;
ROW_WFDef_INFO  lch_WFDef_INFO%ROWTYPE;
begin
--open lch_WFDef_INFO;
for row_WFDef_INFO in lch_WFDef_INFO loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WFDef_INFO where WFDef_INFOid=row_WFDef_INFO.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFDef_INFO;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WFDef_INFO;
     return;
   end if; 
 end if; 
 WFDef_INFO_HCL (acursession,ROW_WFDef_INFO.id,aisLocked);
 if aisLocked >2 then
   close lch_WFDef_INFO;
   return;
 end if;
 end loop;
--close lch_WFDef_INFO;
end;
declare cursor lch_WFDef_links is select WFDef_links.WFDef_linksid ID from WFDef_links where  WFDef_links.InstanceID = arowid;
ROW_WFDef_links  lch_WFDef_links%ROWTYPE;
begin
--open lch_WFDef_links;
for row_WFDef_links in lch_WFDef_links loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WFDef_links where WFDef_linksid=row_WFDef_links.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFDef_links;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WFDef_links;
     return;
   end if; 
 end if; 
 WFDef_links_HCL (acursession,ROW_WFDef_links.id,aisLocked);
 if aisLocked >2 then
   close lch_WFDef_links;
   return;
 end if;
 end loop;
--close lch_WFDef_links;
end;
 end if;
aIsLocked:=0;
end;
procedure WFDef_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'WFDef'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_WFDef_param is select WFDef_param.WFDef_paramid id from WFDef_param where  WFDef_param.InstanceID = arowid;
row_WFDef_param  pch_WFDef_param%ROWTYPE;
begin
--open pch_WFDef_param;
for row_WFDef_param in  pch_WFDef_param loop
 WFDef_param_SINIT( acursession,row_WFDef_param.id,assid);
 WFDef_param_propagate( acursession,row_WFDef_param.id);
end loop;
--close pch_WFDef_param;
end;
declare cursor pch_WFDef_Doc is select WFDef_Doc.WFDef_Docid id from WFDef_Doc where  WFDef_Doc.InstanceID = arowid;
row_WFDef_Doc  pch_WFDef_Doc%ROWTYPE;
begin
--open pch_WFDef_Doc;
for row_WFDef_Doc in  pch_WFDef_Doc loop
 WFDef_Doc_SINIT( acursession,row_WFDef_Doc.id,assid);
 WFDef_Doc_propagate( acursession,row_WFDef_Doc.id);
end loop;
--close pch_WFDef_Doc;
end;
declare cursor pch_WFDef_func is select WFDef_func.WFDef_funcid id from WFDef_func where  WFDef_func.InstanceID = arowid;
row_WFDef_func  pch_WFDef_func%ROWTYPE;
begin
--open pch_WFDef_func;
for row_WFDef_func in  pch_WFDef_func loop
 WFDef_func_SINIT( acursession,row_WFDef_func.id,assid);
 WFDef_func_propagate( acursession,row_WFDef_func.id);
end loop;
--close pch_WFDef_func;
end;
declare cursor pch_WFDef_master is select WFDef_master.WFDef_masterid id from WFDef_master where  WFDef_master.InstanceID = arowid;
row_WFDef_master  pch_WFDef_master%ROWTYPE;
begin
--open pch_WFDef_master;
for row_WFDef_master in  pch_WFDef_master loop
 WFDef_master_SINIT( acursession,row_WFDef_master.id,assid);
 WFDef_master_propagate( acursession,row_WFDef_master.id);
end loop;
--close pch_WFDef_master;
end;
declare cursor pch_WFDef_INFO is select WFDef_INFO.WFDef_INFOid id from WFDef_INFO where  WFDef_INFO.InstanceID = arowid;
row_WFDef_INFO  pch_WFDef_INFO%ROWTYPE;
begin
--open pch_WFDef_INFO;
for row_WFDef_INFO in  pch_WFDef_INFO loop
 WFDef_INFO_SINIT( acursession,row_WFDef_INFO.id,assid);
 WFDef_INFO_propagate( acursession,row_WFDef_INFO.id);
end loop;
--close pch_WFDef_INFO;
end;
declare cursor pch_WFDef_links is select WFDef_links.WFDef_linksid id from WFDef_links where  WFDef_links.InstanceID = arowid;
row_WFDef_links  pch_WFDef_links%ROWTYPE;
begin
--open pch_WFDef_links;
for row_WFDef_links in  pch_WFDef_links loop
 WFDef_links_SINIT( acursession,row_WFDef_links.id,assid);
 WFDef_links_propagate( acursession,row_WFDef_links.id);
end loop;
--close pch_WFDef_links;
end;
 end if; 
end;



procedure WFDef_param_BRIEF  (
 aCURSESSION CHAR,
 aWFDef_paramid CHAR,
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
if aWFDef_paramid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFDef_param where WFDef_paramID=aWFDef_paramID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFDef_param where WFDef_paramid=aWFDef_paramID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFDef_param');
    return;
  end if;
  aBRIEF:=func.WFDef_param_BRIEF_F(aWFDef_paramid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFDef_param_DELETE /*Парамеры и переменные процесса*/ (
 aCURSESSION CHAR,
 aWFDef_paramid CHAR,
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
select count(*) into existsCnt from WFDef_param where WFDef_paramID=aWFDef_paramID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFDef_param where WFDef_paramid=aWFDef_paramID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFDef_param',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFDef_param');
      return;
    end if;
  end if;
 --  verify lock  --
 WFDef_param_ISLOCKED( acursession=>acursession,aROWID=>aWFDef_paramid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFDef_param');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFDef_param',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFDef_paramid, aLogInstanceID=>aInstanceID);
declare cursor chld_WFDef_param is select  instanceid ID from instance where OwnerPartName ='WFDef_param' and OwnerRowID=aWFDef_paramid;
row_WFDef_param  chld_WFDef_param%ROWTYPE;
begin
--open chld_WFDef_param;
for row_WFDef_param in chld_WFDef_param loop
 Kernel.INSTANCE_OWNER (acursession,row_WFDef_param.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFDef_param.id);
end loop;
--close chld_WFDef_param;
end ;
  delete from  WFDef_param 
  where  WFDef_paramID = aWFDef_paramID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Параметры и переменные*/
procedure WFDef_param_SAVE /*Парамеры и переменные процесса*/ (
 aCURSESSION CHAR,
 aWFDef_paramid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,athe_Value
 VARCHAR2/* Значение *//* Значение */
,aNoChange
 NUMBER/* Не менять после старта *//* Не менять после старта */
,aSetBeforStart
 NUMBER/* Задать до старта процесса *//* Задать до старта процесса */
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
select count(*) into existsCnt from WFDef_param where WFDef_paramID=aWFDef_paramID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFDef_param where WFDef_paramid=aWFDef_paramID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFDef_param',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFDef_param');
      return;
    end if;
  end if;
 --  verify lock  --
 WFDef_param_ISLOCKED( acursession=>acursession,aROWID=>aWFDef_paramid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFDef_param');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFDef_param',
 aVERB=>'EDITROW',  aThe_Resource=>aWFDef_paramid,aLogInstanceID=>aInstanceID);
 update  WFDef_param set ChangeStamp=sysdate
,
  Name=aName
,
  the_Value=athe_Value
,
  NoChange=aNoChange
,
  SetBeforStart=aSetBeforStart
  where  WFDef_paramID = aWFDef_paramID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFDef_param',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFDef_param');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFDef_param');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFDef_param',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFDef_paramid,aLogInstanceID=>aInstanceID);
 insert into   WFDef_param
 (  WFDef_paramID 
,InstanceID
,Name

,the_Value

,NoChange

,SetBeforStart

 ) values ( aWFDef_paramID 
,aInstanceID
,aName

,athe_Value

,aNoChange

,aSetBeforStart

 ); 
 WFDef_param_SINIT( aCURSESSION,aWFDef_paramid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WFDef_param_PARENT /*Парамеры и переменные процесса*/ (
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
  select  INSTANCEID into aParentID from WFDef_param where  WFDef_paramid=aRowID;
 end; 


procedure WFDef_param_ISLOCKED /*Парамеры и переменные процесса*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFDef_param where WFDef_paramid=aRowID;
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
  WFDef_param_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFDef.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFDef_param_LOCK /*Парамеры и переменные процесса*/ (
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
 WFDef_param_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFDef_param_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFDef_param where WFDef_paramid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFDef_param');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFDef_param set LockUserID =auserID ,LockSessionID =null where WFDef_paramid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFDef_param set LockUserID =null,LockSessionID =aCURSESSION  where WFDef_paramid=aRowID;
     return;
   end if;
 end ;


procedure WFDef_param_HCL /*Парамеры и переменные процесса*/ (
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


procedure WFDef_param_UNLOCK /*Парамеры и переменные процесса*/ (
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
 WFDef_param_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFDef_param set LockUserID =null  where WFDef_paramid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFDef_param set LockSessionID =null  where WFDef_paramid=aRowID;
     return;
   end if;
 end; 


procedure WFDef_param_SINIT /*Парамеры и переменные процесса*/ (
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
 select  SecurityStyleID into atmpID from WFDef_param where WFDef_paramid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFDef_param');
    return;
  end if;
if aSecurityStyleID is null then
 WFDef_param_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFDef_param set securitystyleid =aStyleID where WFDef_paramid = aRowID;
else 
 update WFDef_param set securitystyleid =aSecurityStyleID where WFDef_paramid = aRowID;
end if; 
end ; 


procedure WFDef_param_propagate /*Парамеры и переменные процесса*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFDef_param where WFDef_paramid=aRowid;
end;



procedure WFDef_Doc_BRIEF  (
 aCURSESSION CHAR,
 aWFDef_Docid CHAR,
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
if aWFDef_Docid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFDef_Doc where WFDef_DocID=aWFDef_DocID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFDef_Doc where WFDef_Docid=aWFDef_DocID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFDef_Doc');
    return;
  end if;
  aBRIEF:=func.WFDef_Doc_BRIEF_F(aWFDef_Docid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFDef_Doc_DELETE /*Документы, которые используются в процессе*/ (
 aCURSESSION CHAR,
 aWFDef_Docid CHAR,
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
select count(*) into existsCnt from WFDef_Doc where WFDef_DocID=aWFDef_DocID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFDef_Doc where WFDef_Docid=aWFDef_DocID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFDef_Doc',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFDef_Doc');
      return;
    end if;
  end if;
 --  verify lock  --
 WFDef_Doc_ISLOCKED( acursession=>acursession,aROWID=>aWFDef_Docid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFDef_Doc');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFDef_Doc',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFDef_Docid, aLogInstanceID=>aInstanceID);
declare cursor chld_WFDef_Doc is select  instanceid ID from instance where OwnerPartName ='WFDef_Doc' and OwnerRowID=aWFDef_Docid;
row_WFDef_Doc  chld_WFDef_Doc%ROWTYPE;
begin
--open chld_WFDef_Doc;
for row_WFDef_Doc in chld_WFDef_Doc loop
 Kernel.INSTANCE_OWNER (acursession,row_WFDef_Doc.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFDef_Doc.id);
end loop;
--close chld_WFDef_Doc;
end ;
  delete from  WFDef_Doc 
  where  WFDef_DocID = aWFDef_DocID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Документы*/
procedure WFDef_Doc_SAVE /*Документы, которые используются в процессе*/ (
 aCURSESSION CHAR,
 aWFDef_Docid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aSetBeforStart
 NUMBER/* Задать до начала процесса *//* Задать до начала процесса */
,aCreateInRuntime
 NUMBER/* Создается в ходе процесса *//* Создается в ходе процесса */
,aDocTemplate CHAR := null /* Шаблон документа *//* Шаблон документа */
,aArchveFolder CHAR := null /* Папка для архивной копии *//* Папка для архивной копии */
,aArchiveMode
 VARCHAR2 := null /* Режим архивного запуска *//* Режим архивного запуска */
,aDocType CHAR := null /* Тип документа *//* Тип документа */
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
select count(*) into existsCnt from WFDef_Doc where WFDef_DocID=aWFDef_DocID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFDef_Doc where WFDef_Docid=aWFDef_DocID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFDef_Doc',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFDef_Doc');
      return;
    end if;
  end if;
 --  verify lock  --
 WFDef_Doc_ISLOCKED( acursession=>acursession,aROWID=>aWFDef_Docid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFDef_Doc');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFDef_Doc',
 aVERB=>'EDITROW',  aThe_Resource=>aWFDef_Docid,aLogInstanceID=>aInstanceID);
 update  WFDef_Doc set ChangeStamp=sysdate
,
  Name=aName
,
  SetBeforStart=aSetBeforStart
,
  CreateInRuntime=aCreateInRuntime
,
  DocTemplate=aDocTemplate
,
  ArchveFolder=aArchveFolder
,
  ArchiveMode=aArchiveMode
,
  DocType=aDocType
  where  WFDef_DocID = aWFDef_DocID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFDef_Doc',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFDef_Doc');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFDef_Doc');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFDef_Doc',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFDef_Docid,aLogInstanceID=>aInstanceID);
 insert into   WFDef_Doc
 (  WFDef_DocID 
,InstanceID
,Name

,SetBeforStart

,CreateInRuntime

,DocTemplate

,ArchveFolder

,ArchiveMode

,DocType

 ) values ( aWFDef_DocID 
,aInstanceID
,aName

,aSetBeforStart

,aCreateInRuntime

,aDocTemplate

,aArchveFolder

,aArchiveMode

,aDocType

 ); 
 WFDef_Doc_SINIT( aCURSESSION,aWFDef_Docid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WFDef_Doc_PARENT /*Документы, которые используются в процессе*/ (
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
  select  INSTANCEID into aParentID from WFDef_Doc where  WFDef_Docid=aRowID;
 end; 


procedure WFDef_Doc_ISLOCKED /*Документы, которые используются в процессе*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFDef_Doc where WFDef_Docid=aRowID;
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
  WFDef_Doc_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFDef.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFDef_Doc_LOCK /*Документы, которые используются в процессе*/ (
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
 WFDef_Doc_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFDef_Doc_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFDef_Doc where WFDef_Docid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFDef_Doc');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFDef_Doc set LockUserID =auserID ,LockSessionID =null where WFDef_Docid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFDef_Doc set LockUserID =null,LockSessionID =aCURSESSION  where WFDef_Docid=aRowID;
     return;
   end if;
 end ;


procedure WFDef_Doc_HCL /*Документы, которые используются в процессе*/ (
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


procedure WFDef_Doc_UNLOCK /*Документы, которые используются в процессе*/ (
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
 WFDef_Doc_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFDef_Doc set LockUserID =null  where WFDef_Docid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFDef_Doc set LockSessionID =null  where WFDef_Docid=aRowID;
     return;
   end if;
 end; 


procedure WFDef_Doc_SINIT /*Документы, которые используются в процессе*/ (
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
 select  SecurityStyleID into atmpID from WFDef_Doc where WFDef_Docid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFDef_Doc');
    return;
  end if;
if aSecurityStyleID is null then
 WFDef_Doc_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFDef_Doc set securitystyleid =aStyleID where WFDef_Docid = aRowID;
else 
 update WFDef_Doc set securitystyleid =aSecurityStyleID where WFDef_Docid = aRowID;
end if; 
end ; 


procedure WFDef_Doc_propagate /*Документы, которые используются в процессе*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFDef_Doc where WFDef_Docid=aRowid;
end;



procedure WFDef_func_BRIEF  (
 aCURSESSION CHAR,
 aWFDef_funcid CHAR,
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
if aWFDef_funcid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFDef_func where WFDef_funcID=aWFDef_funcID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFDef_func where WFDef_funcid=aWFDef_funcID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFDef_func');
    return;
  end if;
  aBRIEF:=func.WFDef_func_BRIEF_F(aWFDef_funcid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFDef_func_DELETE /*Список шагов процесса*/ (
 aCURSESSION CHAR,
 aWFDef_funcid CHAR,
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
select count(*) into existsCnt from WFDef_func where WFDef_funcID=aWFDef_funcID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFDef_func where WFDef_funcid=aWFDef_funcID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFDef_func',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFDef_func');
      return;
    end if;
  end if;
 --  verify lock  --
 WFDef_func_ISLOCKED( acursession=>acursession,aROWID=>aWFDef_funcid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFDef_func');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFDef_func',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFDef_funcid, aLogInstanceID=>aInstanceID);
declare cursor chld_WFDef_func is select  instanceid ID from instance where OwnerPartName ='WFDef_func' and OwnerRowID=aWFDef_funcid;
row_WFDef_func  chld_WFDef_func%ROWTYPE;
begin
--open chld_WFDef_func;
for row_WFDef_func in chld_WFDef_func loop
 Kernel.INSTANCE_OWNER (acursession,row_WFDef_func.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFDef_func.id);
end loop;
--close chld_WFDef_func;
end ;
  delete from  WFDef_func 
  where  WFDef_funcID = aWFDef_funcID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Функции процесса*/
procedure WFDef_func_SAVE /*Список шагов процесса*/ (
 aCURSESSION CHAR,
 aWFDef_funcid CHAR,
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
select count(*) into existsCnt from WFDef_func where WFDef_funcID=aWFDef_funcID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFDef_func where WFDef_funcid=aWFDef_funcID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFDef_func',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFDef_func');
      return;
    end if;
  end if;
 --  verify lock  --
 WFDef_func_ISLOCKED( acursession=>acursession,aROWID=>aWFDef_funcid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFDef_func');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFDef_func',
 aVERB=>'EDITROW',  aThe_Resource=>aWFDef_funcid,aLogInstanceID=>aInstanceID);
 update  WFDef_func set ChangeStamp=sysdate
,
  Func=aFunc
  where  WFDef_funcID = aWFDef_funcID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFDef_func',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFDef_func');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFDef_func');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFDef_func',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFDef_funcid,aLogInstanceID=>aInstanceID);
 insert into   WFDef_func
 (  WFDef_funcID 
,InstanceID
,Func

 ) values ( aWFDef_funcID 
,aInstanceID
,aFunc

 ); 
 WFDef_func_SINIT( aCURSESSION,aWFDef_funcid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WFDef_func_PARENT /*Список шагов процесса*/ (
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
  select  INSTANCEID into aParentID from WFDef_func where  WFDef_funcid=aRowID;
 end; 


procedure WFDef_func_ISLOCKED /*Список шагов процесса*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFDef_func where WFDef_funcid=aRowID;
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
  WFDef_func_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFDef.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFDef_func_LOCK /*Список шагов процесса*/ (
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
 WFDef_func_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFDef_func_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFDef_func where WFDef_funcid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFDef_func');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFDef_func set LockUserID =auserID ,LockSessionID =null where WFDef_funcid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFDef_func set LockUserID =null,LockSessionID =aCURSESSION  where WFDef_funcid=aRowID;
     return;
   end if;
 end ;


procedure WFDef_func_HCL /*Список шагов процесса*/ (
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


procedure WFDef_func_UNLOCK /*Список шагов процесса*/ (
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
 WFDef_func_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFDef_func set LockUserID =null  where WFDef_funcid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFDef_func set LockSessionID =null  where WFDef_funcid=aRowID;
     return;
   end if;
 end; 


procedure WFDef_func_SINIT /*Список шагов процесса*/ (
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
 select  SecurityStyleID into atmpID from WFDef_func where WFDef_funcid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFDef_func');
    return;
  end if;
if aSecurityStyleID is null then
 WFDef_func_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFDef_func set securitystyleid =aStyleID where WFDef_funcid = aRowID;
else 
 update WFDef_func set securitystyleid =aSecurityStyleID where WFDef_funcid = aRowID;
end if; 
end ; 


procedure WFDef_func_propagate /*Список шагов процесса*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFDef_func where WFDef_funcid=aRowid;
end;



procedure WFDef_master_BRIEF  (
 aCURSESSION CHAR,
 aWFDef_masterid CHAR,
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
if aWFDef_masterid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFDef_master where WFDef_masterID=aWFDef_masterID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFDef_master where WFDef_masterid=aWFDef_masterID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFDef_master');
    return;
  end if;
  aBRIEF:=func.WFDef_master_BRIEF_F(aWFDef_masterid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFDef_master_DELETE /*Группы, которым разрешен запуск*/ (
 aCURSESSION CHAR,
 aWFDef_masterid CHAR,
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
select count(*) into existsCnt from WFDef_master where WFDef_masterID=aWFDef_masterID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFDef_master where WFDef_masterid=aWFDef_masterID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFDef_master',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFDef_master');
      return;
    end if;
  end if;
 --  verify lock  --
 WFDef_master_ISLOCKED( acursession=>acursession,aROWID=>aWFDef_masterid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFDef_master');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFDef_master',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFDef_masterid, aLogInstanceID=>aInstanceID);
declare cursor chld_WFDef_master is select  instanceid ID from instance where OwnerPartName ='WFDef_master' and OwnerRowID=aWFDef_masterid;
row_WFDef_master  chld_WFDef_master%ROWTYPE;
begin
--open chld_WFDef_master;
for row_WFDef_master in chld_WFDef_master loop
 Kernel.INSTANCE_OWNER (acursession,row_WFDef_master.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFDef_master.id);
end loop;
--close chld_WFDef_master;
end ;
  delete from  WFDef_master 
  where  WFDef_masterID = aWFDef_masterID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Управляющие*/
procedure WFDef_master_SAVE /*Группы, которым разрешен запуск*/ (
 aCURSESSION CHAR,
 aWFDef_masterid CHAR,
aInstanceID CHAR 
,aTheGroup CHAR/* Группа *//* Группа */
,aAllowStart
 NUMBER := null /* Разрешен запуск *//* Разрешен запуск */
,aAllowCheckState
 NUMBER := null /* Разрешен промотр состояния *//* Разрешен промотр состояния */
,aAllowAnaliz
 NUMBER/* Разрешен детальный анализ *//* Разрешен детальный анализ */
,aAllowControl
 NUMBER := null /* Разрешено управление *//* Разрешено управление */
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
select count(*) into existsCnt from WFDef_master where WFDef_masterID=aWFDef_masterID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFDef_master where WFDef_masterid=aWFDef_masterID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFDef_master',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFDef_master');
      return;
    end if;
  end if;
 --  verify lock  --
 WFDef_master_ISLOCKED( acursession=>acursession,aROWID=>aWFDef_masterid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFDef_master');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFDef_master',
 aVERB=>'EDITROW',  aThe_Resource=>aWFDef_masterid,aLogInstanceID=>aInstanceID);
 update  WFDef_master set ChangeStamp=sysdate
,
  TheGroup=aTheGroup
,
  AllowStart=aAllowStart
,
  AllowCheckState=aAllowCheckState
,
  AllowAnaliz=aAllowAnaliz
,
  AllowControl=aAllowControl
  where  WFDef_masterID = aWFDef_masterID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFDef_master',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFDef_master');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFDef_master');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFDef_master',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFDef_masterid,aLogInstanceID=>aInstanceID);
 insert into   WFDef_master
 (  WFDef_masterID 
,InstanceID
,TheGroup

,AllowStart

,AllowCheckState

,AllowAnaliz

,AllowControl

 ) values ( aWFDef_masterID 
,aInstanceID
,aTheGroup

,aAllowStart

,aAllowCheckState

,aAllowAnaliz

,aAllowControl

 ); 
 WFDef_master_SINIT( aCURSESSION,aWFDef_masterid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WFDef_master_PARENT /*Группы, которым разрешен запуск*/ (
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
  select  INSTANCEID into aParentID from WFDef_master where  WFDef_masterid=aRowID;
 end; 


procedure WFDef_master_ISLOCKED /*Группы, которым разрешен запуск*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFDef_master where WFDef_masterid=aRowID;
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
  WFDef_master_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFDef.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFDef_master_LOCK /*Группы, которым разрешен запуск*/ (
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
 WFDef_master_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFDef_master_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFDef_master where WFDef_masterid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFDef_master');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFDef_master set LockUserID =auserID ,LockSessionID =null where WFDef_masterid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFDef_master set LockUserID =null,LockSessionID =aCURSESSION  where WFDef_masterid=aRowID;
     return;
   end if;
 end ;


procedure WFDef_master_HCL /*Группы, которым разрешен запуск*/ (
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


procedure WFDef_master_UNLOCK /*Группы, которым разрешен запуск*/ (
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
 WFDef_master_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFDef_master set LockUserID =null  where WFDef_masterid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFDef_master set LockSessionID =null  where WFDef_masterid=aRowID;
     return;
   end if;
 end; 


procedure WFDef_master_SINIT /*Группы, которым разрешен запуск*/ (
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
 select  SecurityStyleID into atmpID from WFDef_master where WFDef_masterid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFDef_master');
    return;
  end if;
if aSecurityStyleID is null then
 WFDef_master_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFDef_master set securitystyleid =aStyleID where WFDef_masterid = aRowID;
else 
 update WFDef_master set securitystyleid =aSecurityStyleID where WFDef_masterid = aRowID;
end if; 
end ; 


procedure WFDef_master_propagate /*Группы, которым разрешен запуск*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFDef_master where WFDef_masterid=aRowid;
end;



procedure WFDef_INFO_BRIEF  (
 aCURSESSION CHAR,
 aWFDef_INFOid CHAR,
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
if aWFDef_INFOid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFDef_INFO where WFDef_INFOID=aWFDef_INFOID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFDef_INFO where WFDef_INFOid=aWFDef_INFOID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFDef_INFO');
    return;
  end if;
  aBRIEF:=func.WFDef_INFO_BRIEF_F(aWFDef_INFOid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFDef_INFO_DELETE /*Общая информация о процессе*/ (
 aCURSESSION CHAR,
 aWFDef_INFOid CHAR,
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
select count(*) into existsCnt from WFDef_INFO where WFDef_INFOID=aWFDef_INFOID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFDef_INFO where WFDef_INFOid=aWFDef_INFOID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFDef_INFO',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFDef_INFO');
      return;
    end if;
  end if;
 --  verify lock  --
 WFDef_INFO_ISLOCKED( acursession=>acursession,aROWID=>aWFDef_INFOid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFDef_INFO');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFDef_INFO',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFDef_INFOid, aLogInstanceID=>aInstanceID);
declare cursor chld_WFDef_INFO is select  instanceid ID from instance where OwnerPartName ='WFDef_INFO' and OwnerRowID=aWFDef_INFOid;
row_WFDef_INFO  chld_WFDef_INFO%ROWTYPE;
begin
--open chld_WFDef_INFO;
for row_WFDef_INFO in chld_WFDef_INFO loop
 Kernel.INSTANCE_OWNER (acursession,row_WFDef_INFO.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFDef_INFO.id);
end loop;
--close chld_WFDef_INFO;
end ;
  delete from  WFDef_INFO 
  where  WFDef_INFOID = aWFDef_INFOID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Описание процесса*/
procedure WFDef_INFO_SAVE /*Общая информация о процессе*/ (
 aCURSESSION CHAR,
 aWFDef_INFOid CHAR,
aInstanceID CHAR 
,aDiagram VARCHAR2 := null /* Диаграмма процесса *//* Диаграмма процесса */
,athe_Description VARCHAR2 := null /* Описание *//* Описание */
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
select count(*) into existsCnt from WFDef_INFO where WFDef_INFOID=aWFDef_INFOID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFDef_INFO where WFDef_INFOid=aWFDef_INFOID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFDef_INFO',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFDef_INFO');
      return;
    end if;
  end if;
 --  verify lock  --
 WFDef_INFO_ISLOCKED( acursession=>acursession,aROWID=>aWFDef_INFOid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFDef_INFO');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFDef_INFO',
 aVERB=>'EDITROW',  aThe_Resource=>aWFDef_INFOid,aLogInstanceID=>aInstanceID);
 update  WFDef_INFO set ChangeStamp=sysdate
,
  Diagram=aDiagram
,
  the_Description=athe_Description
  where  WFDef_INFOID = aWFDef_INFOID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFDef_INFO',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFDef_INFO');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFDef_INFO');
    return;
  end if;
select Count(*) into existsCnt from WFDef_INFO where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <WFDef_INFO>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFDef_INFO',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFDef_INFOid,aLogInstanceID=>aInstanceID);
 insert into   WFDef_INFO
 (  WFDef_INFOID 
,InstanceID
,Diagram

,the_Description

 ) values ( aWFDef_INFOID 
,aInstanceID
,aDiagram

,athe_Description

 ); 
 WFDef_INFO_SINIT( aCURSESSION,aWFDef_INFOid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WFDef_INFO_PARENT /*Общая информация о процессе*/ (
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
  select  INSTANCEID into aParentID from WFDef_INFO where  WFDef_INFOid=aRowID;
 end; 


procedure WFDef_INFO_ISLOCKED /*Общая информация о процессе*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFDef_INFO where WFDef_INFOid=aRowID;
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
  WFDef_INFO_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFDef.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFDef_INFO_LOCK /*Общая информация о процессе*/ (
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
 WFDef_INFO_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFDef_INFO_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFDef_INFO where WFDef_INFOid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFDef_INFO');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFDef_INFO set LockUserID =auserID ,LockSessionID =null where WFDef_INFOid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFDef_INFO set LockUserID =null,LockSessionID =aCURSESSION  where WFDef_INFOid=aRowID;
     return;
   end if;
 end ;


procedure WFDef_INFO_HCL /*Общая информация о процессе*/ (
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


procedure WFDef_INFO_UNLOCK /*Общая информация о процессе*/ (
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
 WFDef_INFO_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFDef_INFO set LockUserID =null  where WFDef_INFOid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFDef_INFO set LockSessionID =null  where WFDef_INFOid=aRowID;
     return;
   end if;
 end; 


procedure WFDef_INFO_SINIT /*Общая информация о процессе*/ (
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
 select  SecurityStyleID into atmpID from WFDef_INFO where WFDef_INFOid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFDef_INFO');
    return;
  end if;
if aSecurityStyleID is null then
 WFDef_INFO_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFDef_INFO set securitystyleid =aStyleID where WFDef_INFOid = aRowID;
else 
 update WFDef_INFO set securitystyleid =aSecurityStyleID where WFDef_INFOid = aRowID;
end if; 
end ; 


procedure WFDef_INFO_propagate /*Общая информация о процессе*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFDef_INFO where WFDef_INFOid=aRowid;
end;



procedure WFDef_links_BRIEF  (
 aCURSESSION CHAR,
 aWFDef_linksid CHAR,
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
if aWFDef_linksid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFDef_links where WFDef_linksID=aWFDef_linksID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFDef_links where WFDef_linksid=aWFDef_linksID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFDef_links');
    return;
  end if;
  aBRIEF:=func.WFDef_links_BRIEF_F(aWFDef_linksid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFDef_links_DELETE /*Описание переходов процесса*/ (
 aCURSESSION CHAR,
 aWFDef_linksid CHAR,
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
select count(*) into existsCnt from WFDef_links where WFDef_linksID=aWFDef_linksID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFDef_links where WFDef_linksid=aWFDef_linksID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFDef_links',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFDef_links');
      return;
    end if;
  end if;
 --  verify lock  --
 WFDef_links_ISLOCKED( acursession=>acursession,aROWID=>aWFDef_linksid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFDef_links');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_WFDef_linkres is select WFDef_linkres.WFDef_linkresid ID from WFDef_linkres where  WFDef_linkres.ParentStructRowID = aWFDef_linksid;
    child_WFDef_linkres_rec  child_WFDef_linkres%ROWTYPE;
    begin
    --open child_WFDef_linkres;
      for child_WFDef_linkres_rec in child_WFDef_linkres loop
      WFDef_linkres_DELETE (acursession,child_WFDef_linkres_rec.id,aInstanceid);
      end loop;
      --close child_WFDef_linkres;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFDef_links',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFDef_linksid, aLogInstanceID=>aInstanceID);
declare cursor chld_WFDef_links is select  instanceid ID from instance where OwnerPartName ='WFDef_links' and OwnerRowID=aWFDef_linksid;
row_WFDef_links  chld_WFDef_links%ROWTYPE;
begin
--open chld_WFDef_links;
for row_WFDef_links in chld_WFDef_links loop
 Kernel.INSTANCE_OWNER (acursession,row_WFDef_links.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFDef_links.id);
end loop;
--close chld_WFDef_links;
end ;
  delete from  WFDef_links 
  where  WFDef_linksID = aWFDef_linksID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Переходы*/
procedure WFDef_links_SAVE /*Описание переходов процесса*/ (
 aCURSESSION CHAR,
 aWFDef_linksid CHAR,
aInstanceID CHAR 
,aFromFunction CHAR/* От *//* От */
,aToFunc CHAR/* К *//* К */
,aAcceptAnyResults
 NUMBER/* При любом результате завершения *//* При любом результате завершения */
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
select count(*) into existsCnt from WFDef_links where WFDef_linksID=aWFDef_linksID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFDef_links where WFDef_linksid=aWFDef_linksID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFDef_links',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFDef_links');
      return;
    end if;
  end if;
 --  verify lock  --
 WFDef_links_ISLOCKED( acursession=>acursession,aROWID=>aWFDef_linksid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFDef_links');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFDef_links',
 aVERB=>'EDITROW',  aThe_Resource=>aWFDef_linksid,aLogInstanceID=>aInstanceID);
 update  WFDef_links set ChangeStamp=sysdate
,
  FromFunction=aFromFunction
,
  ToFunc=aToFunc
,
  AcceptAnyResults=aAcceptAnyResults
  where  WFDef_linksID = aWFDef_linksID; 
 -- checking unique constraints  --

 select Count(*) into aUniqueRowCount from WFDef_links where InstanceID=aInstanceID 
 and FromFunction=aFromFunction
 and ToFunc=aToFunc;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=WFDef_links');
 return;
end if;

 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFDef_links',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFDef_links');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFDef_links');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFDef_links',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFDef_linksid,aLogInstanceID=>aInstanceID);
 insert into   WFDef_links
 (  WFDef_linksID 
,InstanceID
,FromFunction

,ToFunc

,AcceptAnyResults

 ) values ( aWFDef_linksID 
,aInstanceID
,aFromFunction

,aToFunc

,aAcceptAnyResults

 ); 
 WFDef_links_SINIT( aCURSESSION,aWFDef_linksid,atmpid);
 -- checking unique constraints  --

 select Count(*) into aUniqueRowCount from WFDef_links where InstanceID=aInstanceID 
 and FromFunction=aFromFunction
 and ToFunc=aToFunc;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=WFDef_links');
 return;
end if;

 end if;
 -- close transaction --
 end; 


procedure WFDef_links_PARENT /*Описание переходов процесса*/ (
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
  select  INSTANCEID into aParentID from WFDef_links where  WFDef_linksid=aRowID;
 end; 


procedure WFDef_links_ISLOCKED /*Описание переходов процесса*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFDef_links where WFDef_linksid=aRowID;
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
  WFDef_links_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFDef.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFDef_links_LOCK /*Описание переходов процесса*/ (
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
 WFDef_links_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFDef_links_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFDef_links where WFDef_linksid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFDef_links');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFDef_links set LockUserID =auserID ,LockSessionID =null where WFDef_linksid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFDef_links set LockUserID =null,LockSessionID =aCURSESSION  where WFDef_linksid=aRowID;
     return;
   end if;
 end ;


procedure WFDef_links_HCL /*Описание переходов процесса*/ (
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
declare cursor lch_WFDef_linkres is select WFDef_linkres.WFDef_linkresid ID from WFDef_linkres where  WFDef_linkres.ParentStructRowID = aRowid;
row_WFDef_linkres lch_WFDef_linkres%ROWTYPE;
begin  
--open lch_WFDef_linkres;
for row_WFDef_linkres in lch_WFDef_linkres
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from WFDef_linkres where WFDef_linkresid=row_WFDef_linkres.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFDef_linkres;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_WFDef_linkres;
     return;
   end if; 
 end if;  
 WFDef_linkres_HCL (acursession,row_WFDef_linkres.id,aisLocked);
 if aisLocked >2 then
   close lch_WFDef_linkres;
   return;
 end if;
end loop;
--close lch_WFDef_linkres;
end;
aIsLocked :=0;
end;


procedure WFDef_links_UNLOCK /*Описание переходов процесса*/ (
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
 WFDef_links_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFDef_links set LockUserID =null  where WFDef_linksid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFDef_links set LockSessionID =null  where WFDef_linksid=aRowID;
     return;
   end if;
 end; 


procedure WFDef_links_SINIT /*Описание переходов процесса*/ (
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
 select  SecurityStyleID into atmpID from WFDef_links where WFDef_linksid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFDef_links');
    return;
  end if;
if aSecurityStyleID is null then
 WFDef_links_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFDef_links set securitystyleid =aStyleID where WFDef_linksid = aRowID;
else 
 update WFDef_links set securitystyleid =aSecurityStyleID where WFDef_linksid = aRowID;
end if; 
end ; 


procedure WFDef_links_propagate /*Описание переходов процесса*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFDef_links where WFDef_linksid=aRowid;
declare cursor pch_WFDef_linkres  is select WFDef_linkres.WFDef_linkresid ID from WFDef_linkres where  WFDef_linkres.ParentStructRowID = aRowid;
row_WFDef_linkres  pch_WFDef_linkres%ROWTYPE;
begin
--open pch_WFDef_linkres;
for row_WFDef_linkres in pch_WFDef_linkres loop
   WFDef_linkres_SINIT( acursession,row_WFDef_linkres.id,assid);
   WFDef_linkres_propagate( acursession,row_WFDef_linkres.id);
end loop;
--close pch_WFDef_linkres;
end;
end;



procedure WFDef_linkres_BRIEF  (
 aCURSESSION CHAR,
 aWFDef_linkresid CHAR,
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
if aWFDef_linkresid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFDef_linkres where WFDef_linkresID=aWFDef_linkresID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFDef_linkres where WFDef_linkresid=aWFDef_linkresID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFDef_linkres');
    return;
  end if;
  aBRIEF:=func.WFDef_linkres_BRIEF_F(aWFDef_linkresid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFDef_linkres_DELETE /*Результаты завершения функции, 
которые вызывают активацию данного перехода*/ (
 aCURSESSION CHAR,
 aWFDef_linkresid CHAR,
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
select count(*) into existsCnt from WFDef_linkres where WFDef_linkresID=aWFDef_linkresID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFDef_linkres where WFDef_linkresid=aWFDef_linkresID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFDef_linkres',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFDef_linkres');
      return;
    end if;
  end if;
 --  verify lock  --
 WFDef_linkres_ISLOCKED( acursession=>acursession,aROWID=>aWFDef_linkresid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFDef_linkres');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFDef_linkres',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFDef_linkresid, aLogInstanceID=>aInstanceID);
declare cursor chld_WFDef_linkres is select  instanceid ID from instance where OwnerPartName ='WFDef_linkres' and OwnerRowID=aWFDef_linkresid;
row_WFDef_linkres  chld_WFDef_linkres%ROWTYPE;
begin
--open chld_WFDef_linkres;
for row_WFDef_linkres in chld_WFDef_linkres loop
 Kernel.INSTANCE_OWNER (acursession,row_WFDef_linkres.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFDef_linkres.id);
end loop;
--close chld_WFDef_linkres;
end ;
  delete from  WFDef_linkres 
  where  WFDef_linkresID = aWFDef_linkresID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Допустимые результаты*/
procedure WFDef_linkres_SAVE /*Результаты завершения функции, 
которые вызывают активацию данного перехода*/ (
 aCURSESSION CHAR,
 aWFDef_linkresid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2/* Результат *//* Результат */
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
select count(*) into existsCnt from WFDef_linkres where WFDef_linkresID=aWFDef_linkresID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFDef_linkres where WFDef_linkresid=aWFDef_linkresID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFDef_linkres',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFDef_linkres');
      return;
    end if;
  end if;
 --  verify lock  --
 WFDef_linkres_ISLOCKED( acursession=>acursession,aROWID=>aWFDef_linkresid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFDef_linkres');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFDef_linkres',
 aVERB=>'EDITROW',  aThe_Resource=>aWFDef_linkresid,aLogInstanceID=>aInstanceID);
 update  WFDef_linkres set ChangeStamp=sysdate
,
  Name=aName
  where  WFDef_linkresID = aWFDef_linkresID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from WFDef_links where WFDef_linksid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFDef_linkres',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFDef_linkres');
      return;
    end if;
 end if;
 WFDef_links_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFDef_linkres');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFDef_linkres',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFDef_linkresid,aLogInstanceID=>aInstanceID);
 insert into   WFDef_linkres
 (  WFDef_linkresID 
,ParentStructRowID
,Name

 ) values ( aWFDef_linkresID 
,aParentStructRowID
,aName

 ); 
 WFDef_linkres_SINIT( aCURSESSION,aWFDef_linkresid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WFDef_linkres_PARENT /*Результаты завершения функции, 
которые вызывают активацию данного перехода*/ (
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
  select ParentStructRowID into aParentID  from WFDef_linkres where  WFDef_linkresid=aRowID;
  aParentTable := 'WFDef_links';
 end; 


procedure WFDef_linkres_ISLOCKED /*Результаты завершения функции, 
которые вызывают активацию данного перехода*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFDef_linkres where WFDef_linkresid=aRowID;
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
  WFDef_linkres_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFDef.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFDef_linkres_LOCK /*Результаты завершения функции, 
которые вызывают активацию данного перехода*/ (
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
 WFDef_linkres_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFDef_linkres_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFDef_linkres where WFDef_linkresid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFDef_linkres');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFDef_linkres set LockUserID =auserID ,LockSessionID =null where WFDef_linkresid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFDef_linkres set LockUserID =null,LockSessionID =aCURSESSION  where WFDef_linkresid=aRowID;
     return;
   end if;
 end ;


procedure WFDef_linkres_HCL /*Результаты завершения функции, 
которые вызывают активацию данного перехода*/ (
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


procedure WFDef_linkres_UNLOCK /*Результаты завершения функции, 
которые вызывают активацию данного перехода*/ (
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
 WFDef_linkres_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFDef_linkres set LockUserID =null  where WFDef_linkresid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFDef_linkres set LockSessionID =null  where WFDef_linkresid=aRowID;
     return;
   end if;
 end; 


procedure WFDef_linkres_SINIT /*Результаты завершения функции, 
которые вызывают активацию данного перехода*/ (
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
 select  SecurityStyleID into atmpID from WFDef_linkres where WFDef_linkresid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFDef_linkres');
    return;
  end if;
if aSecurityStyleID is null then
 WFDef_linkres_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFDef_linkres set securitystyleid =aStyleID where WFDef_linkresid = aRowID;
else 
 update WFDef_linkres set securitystyleid =aSecurityStyleID where WFDef_linkresid = aRowID;
end if; 
end ; 


procedure WFDef_linkres_propagate /*Результаты завершения функции, 
которые вызывают активацию данного перехода*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFDef_linkres where WFDef_linkresid=aRowid;
end;


end WFDef;

/



