
/* --dir_*/

 create or replace package body dir_ as

procedure dir__DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='dir_'
then
declare cursor child_dir_flow is select dir_flow.dir_flowid ID from dir_flow where  dir_flow.InstanceID = ainstanceid;
row_dir_flow  child_dir_flow%ROWTYPE;
begin
--open child_dir_flow;
for row_dir_flow in child_dir_flow loop
 dir_flow_DELETE (acursession,row_dir_flow.id,aInstanceID);
end loop;
--close child_dir_flow;
end;
declare cursor child_dir_ordtype is select dir_ordtype.dir_ordtypeid ID from dir_ordtype where  dir_ordtype.InstanceID = ainstanceid;
row_dir_ordtype  child_dir_ordtype%ROWTYPE;
begin
--open child_dir_ordtype;
for row_dir_ordtype in child_dir_ordtype loop
 dir_ordtype_DELETE (acursession,row_dir_ordtype.id,aInstanceID);
end loop;
--close child_dir_ordtype;
end;
declare cursor child_dir_org is select dir_org.dir_orgid ID from dir_org where  dir_org.InstanceID = ainstanceid;
row_dir_org  child_dir_org%ROWTYPE;
begin
--open child_dir_org;
for row_dir_org in child_dir_org loop
 dir_org_DELETE (acursession,row_dir_org.id,aInstanceID);
end loop;
--close child_dir_org;
end;
declare cursor child_dir_inctype is select dir_inctype.dir_inctypeid ID from dir_inctype where  dir_inctype.InstanceID = ainstanceid;
row_dir_inctype  child_dir_inctype%ROWTYPE;
begin
--open child_dir_inctype;
for row_dir_inctype in child_dir_inctype loop
 dir_inctype_DELETE (acursession,row_dir_inctype.id,aInstanceID);
end loop;
--close child_dir_inctype;
end;
declare cursor child_dir_reftype is select dir_reftype.dir_reftypeid ID from dir_reftype where  dir_reftype.InstanceID = ainstanceid;
row_dir_reftype  child_dir_reftype%ROWTYPE;
begin
--open child_dir_reftype;
for row_dir_reftype in child_dir_reftype loop
 dir_reftype_DELETE (acursession,row_dir_reftype.id,aInstanceID);
end loop;
--close child_dir_reftype;
end;
declare cursor child_dir_position is select dir_position.dir_positionid ID from dir_position where  dir_position.InstanceID = ainstanceid;
row_dir_position  child_dir_position%ROWTYPE;
begin
--open child_dir_position;
for row_dir_position in child_dir_position loop
 dir_position_DELETE (acursession,row_dir_position.id,aInstanceID);
end loop;
--close child_dir_position;
end;
declare cursor child_dir_jobstates is select dir_jobstates.dir_jobstatesid ID from dir_jobstates where  dir_jobstates.InstanceID = ainstanceid;
row_dir_jobstates  child_dir_jobstates%ROWTYPE;
begin
--open child_dir_jobstates;
for row_dir_jobstates in child_dir_jobstates loop
 dir_jobstates_DELETE (acursession,row_dir_jobstates.id,aInstanceID);
end loop;
--close child_dir_jobstates;
end;
declare cursor child_dir_outtype is select dir_outtype.dir_outtypeid ID from dir_outtype where  dir_outtype.InstanceID = ainstanceid;
row_dir_outtype  child_dir_outtype%ROWTYPE;
begin
--open child_dir_outtype;
for row_dir_outtype in child_dir_outtype loop
 dir_outtype_DELETE (acursession,row_dir_outtype.id,aInstanceID);
end loop;
--close child_dir_outtype;
end;
declare cursor child_dir_theme is select dir_theme.dir_themeid ID from dir_theme where  dir_theme.InstanceID = ainstanceid;
row_dir_theme  child_dir_theme%ROWTYPE;
begin
--open child_dir_theme;
for row_dir_theme in child_dir_theme loop
 dir_theme_DELETE (acursession,row_dir_theme.id,aInstanceID);
end loop;
--close child_dir_theme;
end;
return;
<<del_error>>
return;
end if;
end;
procedure dir__HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'dir_'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_dir_flow is select dir_flow.dir_flowid ID from dir_flow where  dir_flow.InstanceID = arowid;
ROW_dir_flow  lch_dir_flow%ROWTYPE;
begin
--open lch_dir_flow;
for row_dir_flow in lch_dir_flow loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from dir_flow where dir_flowid=row_dir_flow.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_dir_flow;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_dir_flow;
     return;
   end if; 
 end if; 
 dir_flow_HCL (acursession,ROW_dir_flow.id,aisLocked);
 if aisLocked >2 then
   close lch_dir_flow;
   return;
 end if;
 end loop;
--close lch_dir_flow;
end;
declare cursor lch_dir_ordtype is select dir_ordtype.dir_ordtypeid ID from dir_ordtype where  dir_ordtype.InstanceID = arowid;
ROW_dir_ordtype  lch_dir_ordtype%ROWTYPE;
begin
--open lch_dir_ordtype;
for row_dir_ordtype in lch_dir_ordtype loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from dir_ordtype where dir_ordtypeid=row_dir_ordtype.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_dir_ordtype;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_dir_ordtype;
     return;
   end if; 
 end if; 
 dir_ordtype_HCL (acursession,ROW_dir_ordtype.id,aisLocked);
 if aisLocked >2 then
   close lch_dir_ordtype;
   return;
 end if;
 end loop;
--close lch_dir_ordtype;
end;
declare cursor lch_dir_org is select dir_org.dir_orgid ID from dir_org where  dir_org.InstanceID = arowid;
ROW_dir_org  lch_dir_org%ROWTYPE;
begin
--open lch_dir_org;
for row_dir_org in lch_dir_org loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from dir_org where dir_orgid=row_dir_org.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_dir_org;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_dir_org;
     return;
   end if; 
 end if; 
 dir_org_HCL (acursession,ROW_dir_org.id,aisLocked);
 if aisLocked >2 then
   close lch_dir_org;
   return;
 end if;
 end loop;
--close lch_dir_org;
end;
declare cursor lch_dir_inctype is select dir_inctype.dir_inctypeid ID from dir_inctype where  dir_inctype.InstanceID = arowid;
ROW_dir_inctype  lch_dir_inctype%ROWTYPE;
begin
--open lch_dir_inctype;
for row_dir_inctype in lch_dir_inctype loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from dir_inctype where dir_inctypeid=row_dir_inctype.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_dir_inctype;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_dir_inctype;
     return;
   end if; 
 end if; 
 dir_inctype_HCL (acursession,ROW_dir_inctype.id,aisLocked);
 if aisLocked >2 then
   close lch_dir_inctype;
   return;
 end if;
 end loop;
--close lch_dir_inctype;
end;
declare cursor lch_dir_reftype is select dir_reftype.dir_reftypeid ID from dir_reftype where  dir_reftype.InstanceID = arowid;
ROW_dir_reftype  lch_dir_reftype%ROWTYPE;
begin
--open lch_dir_reftype;
for row_dir_reftype in lch_dir_reftype loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from dir_reftype where dir_reftypeid=row_dir_reftype.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_dir_reftype;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_dir_reftype;
     return;
   end if; 
 end if; 
 dir_reftype_HCL (acursession,ROW_dir_reftype.id,aisLocked);
 if aisLocked >2 then
   close lch_dir_reftype;
   return;
 end if;
 end loop;
--close lch_dir_reftype;
end;
declare cursor lch_dir_position is select dir_position.dir_positionid ID from dir_position where  dir_position.InstanceID = arowid;
ROW_dir_position  lch_dir_position%ROWTYPE;
begin
--open lch_dir_position;
for row_dir_position in lch_dir_position loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from dir_position where dir_positionid=row_dir_position.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_dir_position;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_dir_position;
     return;
   end if; 
 end if; 
 dir_position_HCL (acursession,ROW_dir_position.id,aisLocked);
 if aisLocked >2 then
   close lch_dir_position;
   return;
 end if;
 end loop;
--close lch_dir_position;
end;
declare cursor lch_dir_jobstates is select dir_jobstates.dir_jobstatesid ID from dir_jobstates where  dir_jobstates.InstanceID = arowid;
ROW_dir_jobstates  lch_dir_jobstates%ROWTYPE;
begin
--open lch_dir_jobstates;
for row_dir_jobstates in lch_dir_jobstates loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from dir_jobstates where dir_jobstatesid=row_dir_jobstates.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_dir_jobstates;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_dir_jobstates;
     return;
   end if; 
 end if; 
 dir_jobstates_HCL (acursession,ROW_dir_jobstates.id,aisLocked);
 if aisLocked >2 then
   close lch_dir_jobstates;
   return;
 end if;
 end loop;
--close lch_dir_jobstates;
end;
declare cursor lch_dir_outtype is select dir_outtype.dir_outtypeid ID from dir_outtype where  dir_outtype.InstanceID = arowid;
ROW_dir_outtype  lch_dir_outtype%ROWTYPE;
begin
--open lch_dir_outtype;
for row_dir_outtype in lch_dir_outtype loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from dir_outtype where dir_outtypeid=row_dir_outtype.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_dir_outtype;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_dir_outtype;
     return;
   end if; 
 end if; 
 dir_outtype_HCL (acursession,ROW_dir_outtype.id,aisLocked);
 if aisLocked >2 then
   close lch_dir_outtype;
   return;
 end if;
 end loop;
--close lch_dir_outtype;
end;
declare cursor lch_dir_theme is select dir_theme.dir_themeid ID from dir_theme where  dir_theme.InstanceID = arowid;
ROW_dir_theme  lch_dir_theme%ROWTYPE;
begin
--open lch_dir_theme;
for row_dir_theme in lch_dir_theme loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from dir_theme where dir_themeid=row_dir_theme.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_dir_theme;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_dir_theme;
     return;
   end if; 
 end if; 
 dir_theme_HCL (acursession,ROW_dir_theme.id,aisLocked);
 if aisLocked >2 then
   close lch_dir_theme;
   return;
 end if;
 end loop;
--close lch_dir_theme;
end;
 end if;
aIsLocked:=0;
end;
procedure dir__propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'dir_'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_dir_flow is select dir_flow.dir_flowid id from dir_flow where  dir_flow.InstanceID = arowid;
row_dir_flow  pch_dir_flow%ROWTYPE;
begin
--open pch_dir_flow;
for row_dir_flow in  pch_dir_flow loop
 dir_flow_SINIT( acursession,row_dir_flow.id,assid);
 dir_flow_propagate( acursession,row_dir_flow.id);
end loop;
--close pch_dir_flow;
end;
declare cursor pch_dir_ordtype is select dir_ordtype.dir_ordtypeid id from dir_ordtype where  dir_ordtype.InstanceID = arowid;
row_dir_ordtype  pch_dir_ordtype%ROWTYPE;
begin
--open pch_dir_ordtype;
for row_dir_ordtype in  pch_dir_ordtype loop
 dir_ordtype_SINIT( acursession,row_dir_ordtype.id,assid);
 dir_ordtype_propagate( acursession,row_dir_ordtype.id);
end loop;
--close pch_dir_ordtype;
end;
declare cursor pch_dir_org is select dir_org.dir_orgid id from dir_org where  dir_org.InstanceID = arowid;
row_dir_org  pch_dir_org%ROWTYPE;
begin
--open pch_dir_org;
for row_dir_org in  pch_dir_org loop
 dir_org_SINIT( acursession,row_dir_org.id,assid);
 dir_org_propagate( acursession,row_dir_org.id);
end loop;
--close pch_dir_org;
end;
declare cursor pch_dir_inctype is select dir_inctype.dir_inctypeid id from dir_inctype where  dir_inctype.InstanceID = arowid;
row_dir_inctype  pch_dir_inctype%ROWTYPE;
begin
--open pch_dir_inctype;
for row_dir_inctype in  pch_dir_inctype loop
 dir_inctype_SINIT( acursession,row_dir_inctype.id,assid);
 dir_inctype_propagate( acursession,row_dir_inctype.id);
end loop;
--close pch_dir_inctype;
end;
declare cursor pch_dir_reftype is select dir_reftype.dir_reftypeid id from dir_reftype where  dir_reftype.InstanceID = arowid;
row_dir_reftype  pch_dir_reftype%ROWTYPE;
begin
--open pch_dir_reftype;
for row_dir_reftype in  pch_dir_reftype loop
 dir_reftype_SINIT( acursession,row_dir_reftype.id,assid);
 dir_reftype_propagate( acursession,row_dir_reftype.id);
end loop;
--close pch_dir_reftype;
end;
declare cursor pch_dir_position is select dir_position.dir_positionid id from dir_position where  dir_position.InstanceID = arowid;
row_dir_position  pch_dir_position%ROWTYPE;
begin
--open pch_dir_position;
for row_dir_position in  pch_dir_position loop
 dir_position_SINIT( acursession,row_dir_position.id,assid);
 dir_position_propagate( acursession,row_dir_position.id);
end loop;
--close pch_dir_position;
end;
declare cursor pch_dir_jobstates is select dir_jobstates.dir_jobstatesid id from dir_jobstates where  dir_jobstates.InstanceID = arowid;
row_dir_jobstates  pch_dir_jobstates%ROWTYPE;
begin
--open pch_dir_jobstates;
for row_dir_jobstates in  pch_dir_jobstates loop
 dir_jobstates_SINIT( acursession,row_dir_jobstates.id,assid);
 dir_jobstates_propagate( acursession,row_dir_jobstates.id);
end loop;
--close pch_dir_jobstates;
end;
declare cursor pch_dir_outtype is select dir_outtype.dir_outtypeid id from dir_outtype where  dir_outtype.InstanceID = arowid;
row_dir_outtype  pch_dir_outtype%ROWTYPE;
begin
--open pch_dir_outtype;
for row_dir_outtype in  pch_dir_outtype loop
 dir_outtype_SINIT( acursession,row_dir_outtype.id,assid);
 dir_outtype_propagate( acursession,row_dir_outtype.id);
end loop;
--close pch_dir_outtype;
end;
declare cursor pch_dir_theme is select dir_theme.dir_themeid id from dir_theme where  dir_theme.InstanceID = arowid;
row_dir_theme  pch_dir_theme%ROWTYPE;
begin
--open pch_dir_theme;
for row_dir_theme in  pch_dir_theme loop
 dir_theme_SINIT( acursession,row_dir_theme.id,assid);
 dir_theme_propagate( acursession,row_dir_theme.id);
end loop;
--close pch_dir_theme;
end;
 end if; 
end;



procedure dir_flow_BRIEF  (
 aCURSESSION CHAR,
 adir_flowid CHAR,
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
if adir_flowid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from dir_flow where dir_flowID=adir_flowID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from dir_flow where dir_flowid=adir_flowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=dir_flow');
    return;
  end if;
  aBRIEF:=func.dir_flow_BRIEF_F(adir_flowid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure dir_flow_DELETE /*Поток документов*/ (
 aCURSESSION CHAR,
 adir_flowid CHAR,
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
select count(*) into existsCnt from dir_flow where dir_flowID=adir_flowID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from dir_flow where dir_flowid=adir_flowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:dir_flow',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=dir_flow');
      return;
    end if;
  end if;
 --  verify lock  --
 dir_flow_ISLOCKED( acursession=>acursession,aROWID=>adir_flowid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=dir_flow');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_dir_flowtype is select dir_flowtype.dir_flowtypeid ID from dir_flowtype where  dir_flowtype.ParentStructRowID = adir_flowid;
    child_dir_flowtype_rec  child_dir_flowtype%ROWTYPE;
    begin
    --open child_dir_flowtype;
      for child_dir_flowtype_rec in child_dir_flowtype loop
      dir_flowtype_DELETE (acursession,child_dir_flowtype_rec.id,aInstanceid);
      end loop;
      --close child_dir_flowtype;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'dir_flow',
 aVERB=>'DELETEROW',  aThe_Resource=>adir_flowid, aLogInstanceID=>aInstanceID);
declare cursor chld_dir_flow is select  instanceid ID from instance where OwnerPartName ='dir_flow' and OwnerRowID=adir_flowid;
row_dir_flow  chld_dir_flow%ROWTYPE;
begin
--open chld_dir_flow;
for row_dir_flow in chld_dir_flow loop
 Kernel.INSTANCE_OWNER (acursession,row_dir_flow.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_dir_flow.id);
end loop;
--close chld_dir_flow;
end ;
  delete from  dir_flow 
  where  dir_flowID = adir_flowID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Поток документов*/
procedure dir_flow_SAVE /*Поток документов*/ (
 aCURSESSION CHAR,
 adir_flowid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,adocNumerator CHAR/* Нумератор *//* Нумератор */
,adocPrefix
 VARCHAR2 := null /* Префикс *//* Префикс */
,adocPostfix
 VARCHAR2 := null /* Постфикс *//* Постфикс */
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
select count(*) into existsCnt from dir_flow where dir_flowID=adir_flowID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from dir_flow where dir_flowid=adir_flowID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:dir_flow',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=dir_flow');
      return;
    end if;
  end if;
 --  verify lock  --
 dir_flow_ISLOCKED( acursession=>acursession,aROWID=>adir_flowid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=dir_flow');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'dir_flow',
 aVERB=>'EDITROW',  aThe_Resource=>adir_flowid,aLogInstanceID=>aInstanceID);
 update  dir_flow set ChangeStamp=sysdate
,
  Name=aName
,
  docNumerator=adocNumerator
,
  docPrefix=adocPrefix
,
  docPostfix=adocPostfix
  where  dir_flowID = adir_flowID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:dir_flow',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=dir_flow');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=dir_flow');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'dir_flow',
 aVERB=>'CREATEROW',  aThe_Resource=>adir_flowid,aLogInstanceID=>aInstanceID);
 insert into   dir_flow
 (  dir_flowID 
,InstanceID
,Name

,docNumerator

,docPrefix

,docPostfix

 ) values ( adir_flowID 
,aInstanceID
,aName

,adocNumerator

,adocPrefix

,adocPostfix

 ); 
 dir_flow_SINIT( aCURSESSION,adir_flowid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure dir_flow_PARENT /*Поток документов*/ (
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
  select  INSTANCEID into aParentID from dir_flow where  dir_flowid=aRowID;
 end; 


procedure dir_flow_ISLOCKED /*Поток документов*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from dir_flow where dir_flowid=aRowID;
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
  dir_flow_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin dir_.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure dir_flow_LOCK /*Поток документов*/ (
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
 dir_flow_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  dir_flow_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from dir_flow where dir_flowid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=dir_flow');
    return;
  end if;
   if  aLockMode =2  
   then   
    update dir_flow set LockUserID =auserID ,LockSessionID =null where dir_flowid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update dir_flow set LockUserID =null,LockSessionID =aCURSESSION  where dir_flowid=aRowID;
     return;
   end if;
 end ;


procedure dir_flow_HCL /*Поток документов*/ (
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
declare cursor lch_dir_flowtype is select dir_flowtype.dir_flowtypeid ID from dir_flowtype where  dir_flowtype.ParentStructRowID = aRowid;
row_dir_flowtype lch_dir_flowtype%ROWTYPE;
begin  
--open lch_dir_flowtype;
for row_dir_flowtype in lch_dir_flowtype
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from dir_flowtype where dir_flowtypeid=row_dir_flowtype.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_dir_flowtype;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_dir_flowtype;
     return;
   end if; 
 end if;  
 dir_flowtype_HCL (acursession,row_dir_flowtype.id,aisLocked);
 if aisLocked >2 then
   close lch_dir_flowtype;
   return;
 end if;
end loop;
--close lch_dir_flowtype;
end;
aIsLocked :=0;
end;


procedure dir_flow_UNLOCK /*Поток документов*/ (
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
 dir_flow_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update dir_flow set LockUserID =null  where dir_flowid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update dir_flow set LockSessionID =null  where dir_flowid=aRowID;
     return;
   end if;
 end; 


procedure dir_flow_SINIT /*Поток документов*/ (
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
 select  SecurityStyleID into atmpID from dir_flow where dir_flowid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =dir_flow');
    return;
  end if;
if aSecurityStyleID is null then
 dir_flow_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update dir_flow set securitystyleid =aStyleID where dir_flowid = aRowID;
else 
 update dir_flow set securitystyleid =aSecurityStyleID where dir_flowid = aRowID;
end if; 
end ; 


procedure dir_flow_propagate /*Поток документов*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from dir_flow where dir_flowid=aRowid;
declare cursor pch_dir_flowtype  is select dir_flowtype.dir_flowtypeid ID from dir_flowtype where  dir_flowtype.ParentStructRowID = aRowid;
row_dir_flowtype  pch_dir_flowtype%ROWTYPE;
begin
--open pch_dir_flowtype;
for row_dir_flowtype in pch_dir_flowtype loop
   dir_flowtype_SINIT( acursession,row_dir_flowtype.id,assid);
   dir_flowtype_propagate( acursession,row_dir_flowtype.id);
end loop;
--close pch_dir_flowtype;
end;
end;



procedure dir_flowtype_BRIEF  (
 aCURSESSION CHAR,
 adir_flowtypeid CHAR,
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
if adir_flowtypeid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from dir_flowtype where dir_flowtypeID=adir_flowtypeID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from dir_flowtype where dir_flowtypeid=adir_flowtypeID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=dir_flowtype');
    return;
  end if;
  aBRIEF:=func.dir_flowtype_BRIEF_F(adir_flowtypeid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure dir_flowtype_DELETE /*Из чего формируется поток документов*/ (
 aCURSESSION CHAR,
 adir_flowtypeid CHAR,
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
select count(*) into existsCnt from dir_flowtype where dir_flowtypeID=adir_flowtypeID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from dir_flowtype where dir_flowtypeid=adir_flowtypeID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:dir_flowtype',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=dir_flowtype');
      return;
    end if;
  end if;
 --  verify lock  --
 dir_flowtype_ISLOCKED( acursession=>acursession,aROWID=>adir_flowtypeid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=dir_flowtype');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'dir_flowtype',
 aVERB=>'DELETEROW',  aThe_Resource=>adir_flowtypeid, aLogInstanceID=>aInstanceID);
declare cursor chld_dir_flowtype is select  instanceid ID from instance where OwnerPartName ='dir_flowtype' and OwnerRowID=adir_flowtypeid;
row_dir_flowtype  chld_dir_flowtype%ROWTYPE;
begin
--open chld_dir_flowtype;
for row_dir_flowtype in chld_dir_flowtype loop
 Kernel.INSTANCE_OWNER (acursession,row_dir_flowtype.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_dir_flowtype.id);
end loop;
--close chld_dir_flowtype;
end ;
  delete from  dir_flowtype 
  where  dir_flowtypeID = adir_flowtypeID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Состав потока*/
procedure dir_flowtype_SAVE /*Из чего формируется поток документов*/ (
 aCURSESSION CHAR,
 adir_flowtypeid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTheNumPart CHAR/* Раздел документа *//* Раздел документа */
,aNumField CHAR/* Поле для хранения номера *//* Поле для хранения номера */
,azonetemplate
 VARCHAR2/* Шаблон зоны *//* Шаблон зоны */
,aNumDateField CHAR := null /* Поле с датой регистрации *//* Поле с датой регистрации */
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
select count(*) into existsCnt from dir_flowtype where dir_flowtypeID=adir_flowtypeID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from dir_flowtype where dir_flowtypeid=adir_flowtypeID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:dir_flowtype',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=dir_flowtype');
      return;
    end if;
  end if;
 --  verify lock  --
 dir_flowtype_ISLOCKED( acursession=>acursession,aROWID=>adir_flowtypeid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=dir_flowtype');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'dir_flowtype',
 aVERB=>'EDITROW',  aThe_Resource=>adir_flowtypeid,aLogInstanceID=>aInstanceID);
 update  dir_flowtype set ChangeStamp=sysdate
,
  TheNumPart=aTheNumPart
,
  NumField=aNumField
,
  zonetemplate=azonetemplate
,
  NumDateField=aNumDateField
  where  dir_flowtypeID = adir_flowtypeID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from dir_flow where dir_flowid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:dir_flowtype',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=dir_flowtype');
      return;
    end if;
 end if;
 dir_flow_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=dir_flowtype');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'dir_flowtype',
 aVERB=>'CREATEROW',  aThe_Resource=>adir_flowtypeid,aLogInstanceID=>aInstanceID);
 insert into   dir_flowtype
 (  dir_flowtypeID 
,ParentStructRowID
,TheNumPart

,NumField

,zonetemplate

,NumDateField

 ) values ( adir_flowtypeID 
,aParentStructRowID
,aTheNumPart

,aNumField

,azonetemplate

,aNumDateField

 ); 
 dir_flowtype_SINIT( aCURSESSION,adir_flowtypeid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure dir_flowtype_PARENT /*Из чего формируется поток документов*/ (
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
  select ParentStructRowID into aParentID  from dir_flowtype where  dir_flowtypeid=aRowID;
  aParentTable := 'dir_flow';
 end; 


procedure dir_flowtype_ISLOCKED /*Из чего формируется поток документов*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from dir_flowtype where dir_flowtypeid=aRowID;
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
  dir_flowtype_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin dir_.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure dir_flowtype_LOCK /*Из чего формируется поток документов*/ (
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
 dir_flowtype_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  dir_flowtype_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from dir_flowtype where dir_flowtypeid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=dir_flowtype');
    return;
  end if;
   if  aLockMode =2  
   then   
    update dir_flowtype set LockUserID =auserID ,LockSessionID =null where dir_flowtypeid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update dir_flowtype set LockUserID =null,LockSessionID =aCURSESSION  where dir_flowtypeid=aRowID;
     return;
   end if;
 end ;


procedure dir_flowtype_HCL /*Из чего формируется поток документов*/ (
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


procedure dir_flowtype_UNLOCK /*Из чего формируется поток документов*/ (
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
 dir_flowtype_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update dir_flowtype set LockUserID =null  where dir_flowtypeid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update dir_flowtype set LockSessionID =null  where dir_flowtypeid=aRowID;
     return;
   end if;
 end; 


procedure dir_flowtype_SINIT /*Из чего формируется поток документов*/ (
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
 select  SecurityStyleID into atmpID from dir_flowtype where dir_flowtypeid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =dir_flowtype');
    return;
  end if;
if aSecurityStyleID is null then
 dir_flowtype_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update dir_flowtype set securitystyleid =aStyleID where dir_flowtypeid = aRowID;
else 
 update dir_flowtype set securitystyleid =aSecurityStyleID where dir_flowtypeid = aRowID;
end if; 
end ; 


procedure dir_flowtype_propagate /*Из чего формируется поток документов*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from dir_flowtype where dir_flowtypeid=aRowid;
end;



procedure dir_ordtype_BRIEF  (
 aCURSESSION CHAR,
 adir_ordtypeid CHAR,
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
if adir_ordtypeid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from dir_ordtype where dir_ordtypeID=adir_ordtypeID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from dir_ordtype where dir_ordtypeid=adir_ordtypeID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=dir_ordtype');
    return;
  end if;
  aBRIEF:=func.dir_ordtype_BRIEF_F(adir_ordtypeid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure dir_ordtype_DELETE /*Тип указания */ (
 aCURSESSION CHAR,
 adir_ordtypeid CHAR,
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
select count(*) into existsCnt from dir_ordtype where dir_ordtypeID=adir_ordtypeID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from dir_ordtype where dir_ordtypeid=adir_ordtypeID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:dir_ordtype',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=dir_ordtype');
      return;
    end if;
  end if;
 --  verify lock  --
 dir_ordtype_ISLOCKED( acursession=>acursession,aROWID=>adir_ordtypeid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=dir_ordtype');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'dir_ordtype',
 aVERB=>'DELETEROW',  aThe_Resource=>adir_ordtypeid, aLogInstanceID=>aInstanceID);
declare cursor chld_dir_ordtype is select  instanceid ID from instance where OwnerPartName ='dir_ordtype' and OwnerRowID=adir_ordtypeid;
row_dir_ordtype  chld_dir_ordtype%ROWTYPE;
begin
--open chld_dir_ordtype;
for row_dir_ordtype in chld_dir_ordtype loop
 Kernel.INSTANCE_OWNER (acursession,row_dir_ordtype.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_dir_ordtype.id);
end loop;
--close chld_dir_ordtype;
end ;
  delete from  dir_ordtype 
  where  dir_ordtypeID = adir_ordtypeID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Тип указания*/
procedure dir_ordtype_SAVE /*Тип указания */ (
 aCURSESSION CHAR,
 adir_ordtypeid CHAR,
aInstanceID CHAR 
,aordtype
 VARCHAR2/* Тип *//* Тип */
,aProcess CHAR := null /* Процес обработки *//* Процес обработки */
,aUseProject
 NUMBER/* Свободная обработка *//* Свободная обработка */
,aStateMachine CHAR := null /* Машина состояний *//* Машина состояний */
,aProcessDocumentName
 VARCHAR2 := null /* Название документа в процессе *//* Название документа в процессе */
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
select count(*) into existsCnt from dir_ordtype where dir_ordtypeID=adir_ordtypeID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from dir_ordtype where dir_ordtypeid=adir_ordtypeID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:dir_ordtype',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=dir_ordtype');
      return;
    end if;
  end if;
 --  verify lock  --
 dir_ordtype_ISLOCKED( acursession=>acursession,aROWID=>adir_ordtypeid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=dir_ordtype');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'dir_ordtype',
 aVERB=>'EDITROW',  aThe_Resource=>adir_ordtypeid,aLogInstanceID=>aInstanceID);
 update  dir_ordtype set ChangeStamp=sysdate
,
  ordtype=aordtype
,
  Process=aProcess
,
  UseProject=aUseProject
,
  StateMachine=aStateMachine
,
  ProcessDocumentName=aProcessDocumentName
  where  dir_ordtypeID = adir_ordtypeID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:dir_ordtype',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=dir_ordtype');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=dir_ordtype');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'dir_ordtype',
 aVERB=>'CREATEROW',  aThe_Resource=>adir_ordtypeid,aLogInstanceID=>aInstanceID);
 insert into   dir_ordtype
 (  dir_ordtypeID 
,InstanceID
,ordtype

,Process

,UseProject

,StateMachine

,ProcessDocumentName

 ) values ( adir_ordtypeID 
,aInstanceID
,aordtype

,aProcess

,aUseProject

,aStateMachine

,aProcessDocumentName

 ); 
 dir_ordtype_SINIT( aCURSESSION,adir_ordtypeid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure dir_ordtype_PARENT /*Тип указания */ (
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
  select  INSTANCEID into aParentID from dir_ordtype where  dir_ordtypeid=aRowID;
 end; 


procedure dir_ordtype_ISLOCKED /*Тип указания */ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from dir_ordtype where dir_ordtypeid=aRowID;
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
  dir_ordtype_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin dir_.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure dir_ordtype_LOCK /*Тип указания */ (
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
 dir_ordtype_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  dir_ordtype_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from dir_ordtype where dir_ordtypeid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=dir_ordtype');
    return;
  end if;
   if  aLockMode =2  
   then   
    update dir_ordtype set LockUserID =auserID ,LockSessionID =null where dir_ordtypeid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update dir_ordtype set LockUserID =null,LockSessionID =aCURSESSION  where dir_ordtypeid=aRowID;
     return;
   end if;
 end ;


procedure dir_ordtype_HCL /*Тип указания */ (
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


procedure dir_ordtype_UNLOCK /*Тип указания */ (
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
 dir_ordtype_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update dir_ordtype set LockUserID =null  where dir_ordtypeid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update dir_ordtype set LockSessionID =null  where dir_ordtypeid=aRowID;
     return;
   end if;
 end; 


procedure dir_ordtype_SINIT /*Тип указания */ (
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
 select  SecurityStyleID into atmpID from dir_ordtype where dir_ordtypeid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =dir_ordtype');
    return;
  end if;
if aSecurityStyleID is null then
 dir_ordtype_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update dir_ordtype set securitystyleid =aStyleID where dir_ordtypeid = aRowID;
else 
 update dir_ordtype set securitystyleid =aSecurityStyleID where dir_ordtypeid = aRowID;
end if; 
end ; 


procedure dir_ordtype_propagate /*Тип указания */ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from dir_ordtype where dir_ordtypeid=aRowid;
end;



procedure dir_org_BRIEF  (
 aCURSESSION CHAR,
 adir_orgid CHAR,
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
if adir_orgid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from dir_org where dir_orgID=adir_orgID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from dir_org where dir_orgid=adir_orgID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=dir_org');
    return;
  end if;
  aBRIEF:=func.dir_org_BRIEF_F(adir_orgid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure dir_org_DELETE /*Организация покоторой ведется учет*/ (
 aCURSESSION CHAR,
 adir_orgid CHAR,
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
select count(*) into existsCnt from dir_org where dir_orgID=adir_orgID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from dir_org where dir_orgid=adir_orgID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:dir_org',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=dir_org');
      return;
    end if;
  end if;
 --  verify lock  --
 dir_org_ISLOCKED( acursession=>acursession,aROWID=>adir_orgid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=dir_org');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_dir_departments is select dir_departments.dir_departmentsid ID from dir_departments where  dir_departments.ParentStructRowID = adir_orgid;
    child_dir_departments_rec  child_dir_departments%ROWTYPE;
    begin
    --open child_dir_departments;
      for child_dir_departments_rec in child_dir_departments loop
      dir_departments_DELETE (acursession,child_dir_departments_rec.id,aInstanceid);
      end loop;
      --close child_dir_departments;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'dir_org',
 aVERB=>'DELETEROW',  aThe_Resource=>adir_orgid, aLogInstanceID=>aInstanceID);
declare cursor chld_dir_org is select  instanceid ID from instance where OwnerPartName ='dir_org' and OwnerRowID=adir_orgid;
row_dir_org  chld_dir_org%ROWTYPE;
begin
--open chld_dir_org;
for row_dir_org in chld_dir_org loop
 Kernel.INSTANCE_OWNER (acursession,row_dir_org.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_dir_org.id);
end loop;
--close chld_dir_org;
end ;
  delete from  dir_org 
  where  dir_orgID = adir_orgID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Организация покоторой ведется учет*/
procedure dir_org_SAVE /*Организация покоторой ведется учет*/ (
 aCURSESSION CHAR,
 adir_orgid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* Название *//* Название */
,aInfo VARCHAR2 := null /* Информация *//* Информация */
,athe_Description CHAR := null /* Карточка описания *//* Карточка описания */
,aProfile CHAR := null /* Профиль предприятия *//* Профиль предприятия */
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
select count(*) into existsCnt from dir_org where dir_orgID=adir_orgID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from dir_org where dir_orgid=adir_orgID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:dir_org',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=dir_org');
      return;
    end if;
  end if;
 --  verify lock  --
 dir_org_ISLOCKED( acursession=>acursession,aROWID=>adir_orgid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=dir_org');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'dir_org',
 aVERB=>'EDITROW',  aThe_Resource=>adir_orgid,aLogInstanceID=>aInstanceID);
 update  dir_org set ChangeStamp=sysdate
,
  name=aname
,
  Info=aInfo
,
  the_Description=athe_Description
,
  Profile=aProfile
  where  dir_orgID = adir_orgID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:dir_org',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=dir_org');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=dir_org');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'dir_org',
 aVERB=>'CREATEROW',  aThe_Resource=>adir_orgid,aLogInstanceID=>aInstanceID);
 insert into   dir_org
 (  dir_orgID 
,InstanceID
,name

,Info

,the_Description

,Profile

 ) values ( adir_orgID 
,aInstanceID
,aname

,aInfo

,athe_Description

,aProfile

 ); 
 dir_org_SINIT( aCURSESSION,adir_orgid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure dir_org_PARENT /*Организация покоторой ведется учет*/ (
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
  select  INSTANCEID into aParentID from dir_org where  dir_orgid=aRowID;
 end; 


procedure dir_org_ISLOCKED /*Организация покоторой ведется учет*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from dir_org where dir_orgid=aRowID;
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
  dir_org_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin dir_.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure dir_org_LOCK /*Организация покоторой ведется учет*/ (
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
 dir_org_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  dir_org_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from dir_org where dir_orgid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=dir_org');
    return;
  end if;
   if  aLockMode =2  
   then   
    update dir_org set LockUserID =auserID ,LockSessionID =null where dir_orgid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update dir_org set LockUserID =null,LockSessionID =aCURSESSION  where dir_orgid=aRowID;
     return;
   end if;
 end ;


procedure dir_org_HCL /*Организация покоторой ведется учет*/ (
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
declare cursor lch_dir_departments is select dir_departments.dir_departmentsid ID from dir_departments where  dir_departments.ParentStructRowID = aRowid;
row_dir_departments lch_dir_departments%ROWTYPE;
begin  
--open lch_dir_departments;
for row_dir_departments in lch_dir_departments
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from dir_departments where dir_departmentsid=row_dir_departments.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_dir_departments;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_dir_departments;
     return;
   end if; 
 end if;  
 dir_departments_HCL (acursession,row_dir_departments.id,aisLocked);
 if aisLocked >2 then
   close lch_dir_departments;
   return;
 end if;
end loop;
--close lch_dir_departments;
end;
aIsLocked :=0;
end;


procedure dir_org_UNLOCK /*Организация покоторой ведется учет*/ (
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
 dir_org_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update dir_org set LockUserID =null  where dir_orgid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update dir_org set LockSessionID =null  where dir_orgid=aRowID;
     return;
   end if;
 end; 


procedure dir_org_SINIT /*Организация покоторой ведется учет*/ (
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
 select  SecurityStyleID into atmpID from dir_org where dir_orgid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =dir_org');
    return;
  end if;
if aSecurityStyleID is null then
 dir_org_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update dir_org set securitystyleid =aStyleID where dir_orgid = aRowID;
else 
 update dir_org set securitystyleid =aSecurityStyleID where dir_orgid = aRowID;
end if; 
end ; 


procedure dir_org_propagate /*Организация покоторой ведется учет*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from dir_org where dir_orgid=aRowid;
declare cursor pch_dir_departments  is select dir_departments.dir_departmentsid ID from dir_departments where  dir_departments.ParentStructRowID = aRowid;
row_dir_departments  pch_dir_departments%ROWTYPE;
begin
--open pch_dir_departments;
for row_dir_departments in pch_dir_departments loop
   dir_departments_SINIT( acursession,row_dir_departments.id,assid);
   dir_departments_propagate( acursession,row_dir_departments.id);
end loop;
--close pch_dir_departments;
end;
end;



procedure dir_departments_BRIEF  (
 aCURSESSION CHAR,
 adir_departmentsid CHAR,
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
if adir_departmentsid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from dir_departments where dir_departmentsID=adir_departmentsID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from dir_departments where dir_departmentsid=adir_departmentsID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=dir_departments');
    return;
  end if;
  aBRIEF:=func.dir_departments_BRIEF_F(adir_departmentsid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure dir_departments_DELETE /*Отделы*/ (
 aCURSESSION CHAR,
 adir_departmentsid CHAR,
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
select count(*) into existsCnt from dir_departments where dir_departmentsID=adir_departmentsID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from dir_departments where dir_departmentsid=adir_departmentsID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:dir_departments',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=dir_departments');
      return;
    end if;
  end if;
 --  verify lock  --
 dir_departments_ISLOCKED( acursession=>acursession,aROWID=>adir_departmentsid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=dir_departments');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'dir_departments',
 aVERB=>'DELETEROW',  aThe_Resource=>adir_departmentsid, aLogInstanceID=>aInstanceID);
declare cursor chld_dir_departments is select  instanceid ID from instance where OwnerPartName ='dir_departments' and OwnerRowID=adir_departmentsid;
row_dir_departments  chld_dir_departments%ROWTYPE;
begin
--open chld_dir_departments;
for row_dir_departments in chld_dir_departments loop
 Kernel.INSTANCE_OWNER (acursession,row_dir_departments.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_dir_departments.id);
end loop;
--close chld_dir_departments;
end ;
  delete from  dir_departments 
  where  dir_departmentsID = adir_departmentsID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Отделы*/
procedure dir_departments_SAVE /*Отделы*/ (
 aCURSESSION CHAR,
 adir_departmentsid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
, aParentRowid CHAR :=null
,adepname
 VARCHAR2/* Название отдела *//* Название отдела */
,adepgroup CHAR := null /* Группа *//* Группа */
,aincfolder CHAR := null /* Папка входящих *//* Папка входящих */
,arootfolder CHAR := null /* Корневая папка *//* Корневая папка */
,aoutprefix
 VARCHAR2 := null /* Префикс исходящего *//* Префикс исходящего */
,aincprefix
 VARCHAR2 := null /* Префикс входящего *//* Префикс входящего */
,aordprefix
 VARCHAR2 := null /* Префикс приказа *//* Префикс приказа */
,aoutpostfix
 VARCHAR2 := null /* Постфикс исходящего *//* Постфикс исходящего */
,aincpostfix
 VARCHAR2 := null /* Постфикс входящего *//* Постфикс входящего */
,aordpostfix
 VARCHAR2 := null /* Потфикс приказа *//* Потфикс приказа */
,aoutfolder CHAR := null /* Папка исходящих *//* Папка исходящих */
,aorderfolder CHAR := null /* Папка приказов *//* Папка приказов */
,aincnumerator CHAR := null /* Нумератор входящих *//* Нумератор входящих */
,aoutnumerator CHAR := null /* Нумератор исходящих *//* Нумератор исходящих */
,aordnumerator CHAR := null /* Нумератор приказов *//* Нумератор приказов */
,aIncZone
 VARCHAR2 := null /* Зона входящего *//* Зона входящего */
,aOutZone
 VARCHAR2 := null /* Зона исходящего *//* Зона исходящего */
,aEMail VARCHAR2 := null /* Почтовый адрес *//* Почтовый адрес */
,aOrdZone
 VARCHAR2 := null /* Зона приказов *//* Зона приказов */
,aUnitType CHAR/* Тип позиции *//* Тип позиции */
,aHasBudget
 NUMBER/* Есть свой бюджет *//* Есть свой бюджет */
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
select count(*) into existsCnt from dir_departments where dir_departmentsID=adir_departmentsID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from dir_departments where dir_departmentsid=adir_departmentsID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:dir_departments',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=dir_departments');
      return;
    end if;
  end if;
 --  verify lock  --
 dir_departments_ISLOCKED( acursession=>acursession,aROWID=>adir_departmentsid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=dir_departments');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'dir_departments',
 aVERB=>'EDITROW',  aThe_Resource=>adir_departmentsid,aLogInstanceID=>aInstanceID);
 update  dir_departments set ChangeStamp=sysdate
,ParentRowid= aParentRowid
,
  depname=adepname
,
  depgroup=adepgroup
,
  incfolder=aincfolder
,
  rootfolder=arootfolder
,
  outprefix=aoutprefix
,
  incprefix=aincprefix
,
  ordprefix=aordprefix
,
  outpostfix=aoutpostfix
,
  incpostfix=aincpostfix
,
  ordpostfix=aordpostfix
,
  outfolder=aoutfolder
,
  orderfolder=aorderfolder
,
  incnumerator=aincnumerator
,
  outnumerator=aoutnumerator
,
  ordnumerator=aordnumerator
,
  IncZone=aIncZone
,
  OutZone=aOutZone
,
  EMail=aEMail
,
  OrdZone=aOrdZone
,
  UnitType=aUnitType
,
  HasBudget=aHasBudget
  where  dir_departmentsID = adir_departmentsID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from dir_org where dir_orgid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:dir_departments',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=dir_departments');
      return;
    end if;
 end if;
 dir_org_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=dir_departments');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'dir_departments',
 aVERB=>'CREATEROW',  aThe_Resource=>adir_departmentsid,aLogInstanceID=>aInstanceID);
 insert into   dir_departments
 (  dir_departmentsID 
,ParentRowid
,ParentStructRowID
,depname

,depgroup

,incfolder

,rootfolder

,outprefix

,incprefix

,ordprefix

,outpostfix

,incpostfix

,ordpostfix

,outfolder

,orderfolder

,incnumerator

,outnumerator

,ordnumerator

,IncZone

,OutZone

,EMail

,OrdZone

,UnitType

,HasBudget

 ) values ( adir_departmentsID 
,aParentRowid
,aParentStructRowID
,adepname

,adepgroup

,aincfolder

,arootfolder

,aoutprefix

,aincprefix

,aordprefix

,aoutpostfix

,aincpostfix

,aordpostfix

,aoutfolder

,aorderfolder

,aincnumerator

,aoutnumerator

,aordnumerator

,aIncZone

,aOutZone

,aEMail

,aOrdZone

,aUnitType

,aHasBudget

 ); 
 dir_departments_SINIT( aCURSESSION,adir_departmentsid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure dir_departments_PARENT /*Отделы*/ (
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
  select ParentStructRowID into aParentID  from dir_departments where  dir_departmentsid=aRowID;
  aParentTable := 'dir_org';
 end; 


procedure dir_departments_ISLOCKED /*Отделы*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from dir_departments where dir_departmentsid=aRowID;
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
  dir_departments_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin dir_.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure dir_departments_LOCK /*Отделы*/ (
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
 dir_departments_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  dir_departments_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from dir_departments where dir_departmentsid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=dir_departments');
    return;
  end if;
   if  aLockMode =2  
   then   
    update dir_departments set LockUserID =auserID ,LockSessionID =null where dir_departmentsid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update dir_departments set LockUserID =null,LockSessionID =aCURSESSION  where dir_departmentsid=aRowID;
     return;
   end if;
 end ;


procedure dir_departments_HCL /*Отделы*/ (
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


procedure dir_departments_UNLOCK /*Отделы*/ (
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
 dir_departments_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update dir_departments set LockUserID =null  where dir_departmentsid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update dir_departments set LockSessionID =null  where dir_departmentsid=aRowID;
     return;
   end if;
 end; 


procedure dir_departments_SINIT /*Отделы*/ (
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
 select  SecurityStyleID into atmpID from dir_departments where dir_departmentsid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =dir_departments');
    return;
  end if;
if aSecurityStyleID is null then
 dir_departments_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update dir_departments set securitystyleid =aStyleID where dir_departmentsid = aRowID;
else 
 update dir_departments set securitystyleid =aSecurityStyleID where dir_departmentsid = aRowID;
end if; 
end ; 


procedure dir_departments_propagate /*Отделы*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from dir_departments where dir_departmentsid=aRowid;
end;



procedure dir_inctype_BRIEF  (
 aCURSESSION CHAR,
 adir_inctypeid CHAR,
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
if adir_inctypeid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from dir_inctype where dir_inctypeID=adir_inctypeID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from dir_inctype where dir_inctypeid=adir_inctypeID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=dir_inctype');
    return;
  end if;
  aBRIEF:=func.dir_inctype_BRIEF_F(adir_inctypeid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure dir_inctype_DELETE /*Тип входящего*/ (
 aCURSESSION CHAR,
 adir_inctypeid CHAR,
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
select count(*) into existsCnt from dir_inctype where dir_inctypeID=adir_inctypeID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from dir_inctype where dir_inctypeid=adir_inctypeID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:dir_inctype',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=dir_inctype');
      return;
    end if;
  end if;
 --  verify lock  --
 dir_inctype_ISLOCKED( acursession=>acursession,aROWID=>adir_inctypeid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=dir_inctype');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'dir_inctype',
 aVERB=>'DELETEROW',  aThe_Resource=>adir_inctypeid, aLogInstanceID=>aInstanceID);
declare cursor chld_dir_inctype is select  instanceid ID from instance where OwnerPartName ='dir_inctype' and OwnerRowID=adir_inctypeid;
row_dir_inctype  chld_dir_inctype%ROWTYPE;
begin
--open chld_dir_inctype;
for row_dir_inctype in chld_dir_inctype loop
 Kernel.INSTANCE_OWNER (acursession,row_dir_inctype.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_dir_inctype.id);
end loop;
--close chld_dir_inctype;
end ;
  delete from  dir_inctype 
  where  dir_inctypeID = adir_inctypeID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Тип входящего*/
procedure dir_inctype_SAVE /*Тип входящего*/ (
 aCURSESSION CHAR,
 adir_inctypeid CHAR,
aInstanceID CHAR 
,aitype
 VARCHAR2/* Тип *//* Тип */
,aProcess CHAR := null /* Процесс обработки *//* Процесс обработки */
,aUseProject
 NUMBER/* Свободная обработка *//* Свободная обработка */
,aStateMachine CHAR := null /* Машина состояний *//* Машина состояний */
,aProcessDocumentName
 VARCHAR2 := null /* Название документа в процессе *//* Название документа в процессе */
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
select count(*) into existsCnt from dir_inctype where dir_inctypeID=adir_inctypeID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from dir_inctype where dir_inctypeid=adir_inctypeID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:dir_inctype',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=dir_inctype');
      return;
    end if;
  end if;
 --  verify lock  --
 dir_inctype_ISLOCKED( acursession=>acursession,aROWID=>adir_inctypeid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=dir_inctype');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'dir_inctype',
 aVERB=>'EDITROW',  aThe_Resource=>adir_inctypeid,aLogInstanceID=>aInstanceID);
 update  dir_inctype set ChangeStamp=sysdate
,
  itype=aitype
,
  Process=aProcess
,
  UseProject=aUseProject
,
  StateMachine=aStateMachine
,
  ProcessDocumentName=aProcessDocumentName
  where  dir_inctypeID = adir_inctypeID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:dir_inctype',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=dir_inctype');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=dir_inctype');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'dir_inctype',
 aVERB=>'CREATEROW',  aThe_Resource=>adir_inctypeid,aLogInstanceID=>aInstanceID);
 insert into   dir_inctype
 (  dir_inctypeID 
,InstanceID
,itype

,Process

,UseProject

,StateMachine

,ProcessDocumentName

 ) values ( adir_inctypeID 
,aInstanceID
,aitype

,aProcess

,aUseProject

,aStateMachine

,aProcessDocumentName

 ); 
 dir_inctype_SINIT( aCURSESSION,adir_inctypeid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure dir_inctype_PARENT /*Тип входящего*/ (
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
  select  INSTANCEID into aParentID from dir_inctype where  dir_inctypeid=aRowID;
 end; 


procedure dir_inctype_ISLOCKED /*Тип входящего*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from dir_inctype where dir_inctypeid=aRowID;
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
  dir_inctype_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin dir_.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure dir_inctype_LOCK /*Тип входящего*/ (
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
 dir_inctype_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  dir_inctype_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from dir_inctype where dir_inctypeid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=dir_inctype');
    return;
  end if;
   if  aLockMode =2  
   then   
    update dir_inctype set LockUserID =auserID ,LockSessionID =null where dir_inctypeid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update dir_inctype set LockUserID =null,LockSessionID =aCURSESSION  where dir_inctypeid=aRowID;
     return;
   end if;
 end ;


procedure dir_inctype_HCL /*Тип входящего*/ (
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


procedure dir_inctype_UNLOCK /*Тип входящего*/ (
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
 dir_inctype_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update dir_inctype set LockUserID =null  where dir_inctypeid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update dir_inctype set LockSessionID =null  where dir_inctypeid=aRowID;
     return;
   end if;
 end; 


procedure dir_inctype_SINIT /*Тип входящего*/ (
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
 select  SecurityStyleID into atmpID from dir_inctype where dir_inctypeid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =dir_inctype');
    return;
  end if;
if aSecurityStyleID is null then
 dir_inctype_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update dir_inctype set securitystyleid =aStyleID where dir_inctypeid = aRowID;
else 
 update dir_inctype set securitystyleid =aSecurityStyleID where dir_inctypeid = aRowID;
end if; 
end ; 


procedure dir_inctype_propagate /*Тип входящего*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from dir_inctype where dir_inctypeid=aRowid;
end;



procedure dir_reftype_BRIEF  (
 aCURSESSION CHAR,
 adir_reftypeid CHAR,
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
if adir_reftypeid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from dir_reftype where dir_reftypeID=adir_reftypeID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from dir_reftype where dir_reftypeid=adir_reftypeID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=dir_reftype');
    return;
  end if;
  aBRIEF:=func.dir_reftype_BRIEF_F(adir_reftypeid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure dir_reftype_DELETE /*Тип ссылки*/ (
 aCURSESSION CHAR,
 adir_reftypeid CHAR,
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
select count(*) into existsCnt from dir_reftype where dir_reftypeID=adir_reftypeID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from dir_reftype where dir_reftypeid=adir_reftypeID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:dir_reftype',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=dir_reftype');
      return;
    end if;
  end if;
 --  verify lock  --
 dir_reftype_ISLOCKED( acursession=>acursession,aROWID=>adir_reftypeid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=dir_reftype');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'dir_reftype',
 aVERB=>'DELETEROW',  aThe_Resource=>adir_reftypeid, aLogInstanceID=>aInstanceID);
declare cursor chld_dir_reftype is select  instanceid ID from instance where OwnerPartName ='dir_reftype' and OwnerRowID=adir_reftypeid;
row_dir_reftype  chld_dir_reftype%ROWTYPE;
begin
--open chld_dir_reftype;
for row_dir_reftype in chld_dir_reftype loop
 Kernel.INSTANCE_OWNER (acursession,row_dir_reftype.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_dir_reftype.id);
end loop;
--close chld_dir_reftype;
end ;
  delete from  dir_reftype 
  where  dir_reftypeID = adir_reftypeID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Тип ссылки*/
procedure dir_reftype_SAVE /*Тип ссылки*/ (
 aCURSESSION CHAR,
 adir_reftypeid CHAR,
aInstanceID CHAR 
,areftypename
 VARCHAR2/* Название *//* Название */
,aBackref CHAR := null /* Обратная ссылка *//* Обратная ссылка */
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
select count(*) into existsCnt from dir_reftype where dir_reftypeID=adir_reftypeID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from dir_reftype where dir_reftypeid=adir_reftypeID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:dir_reftype',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=dir_reftype');
      return;
    end if;
  end if;
 --  verify lock  --
 dir_reftype_ISLOCKED( acursession=>acursession,aROWID=>adir_reftypeid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=dir_reftype');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'dir_reftype',
 aVERB=>'EDITROW',  aThe_Resource=>adir_reftypeid,aLogInstanceID=>aInstanceID);
 update  dir_reftype set ChangeStamp=sysdate
,
  reftypename=areftypename
,
  Backref=aBackref
  where  dir_reftypeID = adir_reftypeID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:dir_reftype',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=dir_reftype');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=dir_reftype');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'dir_reftype',
 aVERB=>'CREATEROW',  aThe_Resource=>adir_reftypeid,aLogInstanceID=>aInstanceID);
 insert into   dir_reftype
 (  dir_reftypeID 
,InstanceID
,reftypename

,Backref

 ) values ( adir_reftypeID 
,aInstanceID
,areftypename

,aBackref

 ); 
 dir_reftype_SINIT( aCURSESSION,adir_reftypeid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure dir_reftype_PARENT /*Тип ссылки*/ (
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
  select  INSTANCEID into aParentID from dir_reftype where  dir_reftypeid=aRowID;
 end; 


procedure dir_reftype_ISLOCKED /*Тип ссылки*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from dir_reftype where dir_reftypeid=aRowID;
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
  dir_reftype_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin dir_.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure dir_reftype_LOCK /*Тип ссылки*/ (
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
 dir_reftype_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  dir_reftype_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from dir_reftype where dir_reftypeid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=dir_reftype');
    return;
  end if;
   if  aLockMode =2  
   then   
    update dir_reftype set LockUserID =auserID ,LockSessionID =null where dir_reftypeid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update dir_reftype set LockUserID =null,LockSessionID =aCURSESSION  where dir_reftypeid=aRowID;
     return;
   end if;
 end ;


procedure dir_reftype_HCL /*Тип ссылки*/ (
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


procedure dir_reftype_UNLOCK /*Тип ссылки*/ (
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
 dir_reftype_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update dir_reftype set LockUserID =null  where dir_reftypeid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update dir_reftype set LockSessionID =null  where dir_reftypeid=aRowID;
     return;
   end if;
 end; 


procedure dir_reftype_SINIT /*Тип ссылки*/ (
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
 select  SecurityStyleID into atmpID from dir_reftype where dir_reftypeid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =dir_reftype');
    return;
  end if;
if aSecurityStyleID is null then
 dir_reftype_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update dir_reftype set securitystyleid =aStyleID where dir_reftypeid = aRowID;
else 
 update dir_reftype set securitystyleid =aSecurityStyleID where dir_reftypeid = aRowID;
end if; 
end ; 


procedure dir_reftype_propagate /*Тип ссылки*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from dir_reftype where dir_reftypeid=aRowid;
end;



procedure dir_position_BRIEF  (
 aCURSESSION CHAR,
 adir_positionid CHAR,
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
if adir_positionid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from dir_position where dir_positionID=adir_positionID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from dir_position where dir_positionid=adir_positionID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=dir_position');
    return;
  end if;
  aBRIEF:=func.dir_position_BRIEF_F(adir_positionid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure dir_position_DELETE /*Должности*/ (
 aCURSESSION CHAR,
 adir_positionid CHAR,
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
select count(*) into existsCnt from dir_position where dir_positionID=adir_positionID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from dir_position where dir_positionid=adir_positionID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:dir_position',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=dir_position');
      return;
    end if;
  end if;
 --  verify lock  --
 dir_position_ISLOCKED( acursession=>acursession,aROWID=>adir_positionid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=dir_position');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'dir_position',
 aVERB=>'DELETEROW',  aThe_Resource=>adir_positionid, aLogInstanceID=>aInstanceID);
declare cursor chld_dir_position is select  instanceid ID from instance where OwnerPartName ='dir_position' and OwnerRowID=adir_positionid;
row_dir_position  chld_dir_position%ROWTYPE;
begin
--open chld_dir_position;
for row_dir_position in chld_dir_position loop
 Kernel.INSTANCE_OWNER (acursession,row_dir_position.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_dir_position.id);
end loop;
--close chld_dir_position;
end ;
  delete from  dir_position 
  where  dir_positionID = adir_positionID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Должности*/
procedure dir_position_SAVE /*Должности*/ (
 aCURSESSION CHAR,
 adir_positionid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,acode
 VARCHAR2/* Код *//* Код */
,adepartment CHAR/* Отдел *//* Отдел */
,aPerson CHAR := null /* Сотрудник *//* Сотрудник */
,aTheUser CHAR := null /* Пользователь системы *//* Пользователь системы */
,aUnavailable
 NUMBER/* Отсутствует *//* Отсутствует */
,aZAMEST CHAR := null /* Заместитель *//* Заместитель */
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
select count(*) into existsCnt from dir_position where dir_positionID=adir_positionID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from dir_position where dir_positionid=adir_positionID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:dir_position',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=dir_position');
      return;
    end if;
  end if;
 --  verify lock  --
 dir_position_ISLOCKED( acursession=>acursession,aROWID=>adir_positionid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=dir_position');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'dir_position',
 aVERB=>'EDITROW',  aThe_Resource=>adir_positionid,aLogInstanceID=>aInstanceID);
 update  dir_position set ChangeStamp=sysdate
,
  Name=aName
,
  code=acode
,
  department=adepartment
,
  Person=aPerson
,
  TheUser=aTheUser
,
  Unavailable=aUnavailable
,
  ZAMEST=aZAMEST
  where  dir_positionID = adir_positionID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:dir_position',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=dir_position');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=dir_position');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'dir_position',
 aVERB=>'CREATEROW',  aThe_Resource=>adir_positionid,aLogInstanceID=>aInstanceID);
 insert into   dir_position
 (  dir_positionID 
,InstanceID
,Name

,code

,department

,Person

,TheUser

,Unavailable

,ZAMEST

 ) values ( adir_positionID 
,aInstanceID
,aName

,acode

,adepartment

,aPerson

,aTheUser

,aUnavailable

,aZAMEST

 ); 
 dir_position_SINIT( aCURSESSION,adir_positionid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure dir_position_PARENT /*Должности*/ (
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
  select  INSTANCEID into aParentID from dir_position where  dir_positionid=aRowID;
 end; 


procedure dir_position_ISLOCKED /*Должности*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from dir_position where dir_positionid=aRowID;
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
  dir_position_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin dir_.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure dir_position_LOCK /*Должности*/ (
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
 dir_position_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  dir_position_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from dir_position where dir_positionid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=dir_position');
    return;
  end if;
   if  aLockMode =2  
   then   
    update dir_position set LockUserID =auserID ,LockSessionID =null where dir_positionid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update dir_position set LockUserID =null,LockSessionID =aCURSESSION  where dir_positionid=aRowID;
     return;
   end if;
 end ;


procedure dir_position_HCL /*Должности*/ (
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


procedure dir_position_UNLOCK /*Должности*/ (
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
 dir_position_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update dir_position set LockUserID =null  where dir_positionid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update dir_position set LockSessionID =null  where dir_positionid=aRowID;
     return;
   end if;
 end; 


procedure dir_position_SINIT /*Должности*/ (
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
 select  SecurityStyleID into atmpID from dir_position where dir_positionid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =dir_position');
    return;
  end if;
if aSecurityStyleID is null then
 dir_position_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update dir_position set securitystyleid =aStyleID where dir_positionid = aRowID;
else 
 update dir_position set securitystyleid =aSecurityStyleID where dir_positionid = aRowID;
end if; 
end ; 


procedure dir_position_propagate /*Должности*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from dir_position where dir_positionid=aRowid;
end;



procedure dir_jobstates_BRIEF  (
 aCURSESSION CHAR,
 adir_jobstatesid CHAR,
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
if adir_jobstatesid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from dir_jobstates where dir_jobstatesID=adir_jobstatesID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from dir_jobstates where dir_jobstatesid=adir_jobstatesID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=dir_jobstates');
    return;
  end if;
  aBRIEF:=func.dir_jobstates_BRIEF_F(adir_jobstatesid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure dir_jobstates_DELETE /*Состояние задания*/ (
 aCURSESSION CHAR,
 adir_jobstatesid CHAR,
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
select count(*) into existsCnt from dir_jobstates where dir_jobstatesID=adir_jobstatesID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from dir_jobstates where dir_jobstatesid=adir_jobstatesID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:dir_jobstates',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=dir_jobstates');
      return;
    end if;
  end if;
 --  verify lock  --
 dir_jobstates_ISLOCKED( acursession=>acursession,aROWID=>adir_jobstatesid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=dir_jobstates');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'dir_jobstates',
 aVERB=>'DELETEROW',  aThe_Resource=>adir_jobstatesid, aLogInstanceID=>aInstanceID);
declare cursor chld_dir_jobstates is select  instanceid ID from instance where OwnerPartName ='dir_jobstates' and OwnerRowID=adir_jobstatesid;
row_dir_jobstates  chld_dir_jobstates%ROWTYPE;
begin
--open chld_dir_jobstates;
for row_dir_jobstates in chld_dir_jobstates loop
 Kernel.INSTANCE_OWNER (acursession,row_dir_jobstates.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_dir_jobstates.id);
end loop;
--close chld_dir_jobstates;
end ;
  delete from  dir_jobstates 
  where  dir_jobstatesID = adir_jobstatesID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Состояние задания*/
procedure dir_jobstates_SAVE /*Состояние задания*/ (
 aCURSESSION CHAR,
 adir_jobstatesid CHAR,
aInstanceID CHAR 
,aresstate
 VARCHAR2/* Состояние *//* Состояние */
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
select count(*) into existsCnt from dir_jobstates where dir_jobstatesID=adir_jobstatesID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from dir_jobstates where dir_jobstatesid=adir_jobstatesID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:dir_jobstates',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=dir_jobstates');
      return;
    end if;
  end if;
 --  verify lock  --
 dir_jobstates_ISLOCKED( acursession=>acursession,aROWID=>adir_jobstatesid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=dir_jobstates');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'dir_jobstates',
 aVERB=>'EDITROW',  aThe_Resource=>adir_jobstatesid,aLogInstanceID=>aInstanceID);
 update  dir_jobstates set ChangeStamp=sysdate
,
  resstate=aresstate
  where  dir_jobstatesID = adir_jobstatesID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:dir_jobstates',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=dir_jobstates');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=dir_jobstates');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'dir_jobstates',
 aVERB=>'CREATEROW',  aThe_Resource=>adir_jobstatesid,aLogInstanceID=>aInstanceID);
 insert into   dir_jobstates
 (  dir_jobstatesID 
,InstanceID
,resstate

 ) values ( adir_jobstatesID 
,aInstanceID
,aresstate

 ); 
 dir_jobstates_SINIT( aCURSESSION,adir_jobstatesid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure dir_jobstates_PARENT /*Состояние задания*/ (
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
  select  INSTANCEID into aParentID from dir_jobstates where  dir_jobstatesid=aRowID;
 end; 


procedure dir_jobstates_ISLOCKED /*Состояние задания*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from dir_jobstates where dir_jobstatesid=aRowID;
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
  dir_jobstates_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin dir_.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure dir_jobstates_LOCK /*Состояние задания*/ (
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
 dir_jobstates_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  dir_jobstates_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from dir_jobstates where dir_jobstatesid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=dir_jobstates');
    return;
  end if;
   if  aLockMode =2  
   then   
    update dir_jobstates set LockUserID =auserID ,LockSessionID =null where dir_jobstatesid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update dir_jobstates set LockUserID =null,LockSessionID =aCURSESSION  where dir_jobstatesid=aRowID;
     return;
   end if;
 end ;


procedure dir_jobstates_HCL /*Состояние задания*/ (
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


procedure dir_jobstates_UNLOCK /*Состояние задания*/ (
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
 dir_jobstates_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update dir_jobstates set LockUserID =null  where dir_jobstatesid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update dir_jobstates set LockSessionID =null  where dir_jobstatesid=aRowID;
     return;
   end if;
 end; 


procedure dir_jobstates_SINIT /*Состояние задания*/ (
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
 select  SecurityStyleID into atmpID from dir_jobstates where dir_jobstatesid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =dir_jobstates');
    return;
  end if;
if aSecurityStyleID is null then
 dir_jobstates_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update dir_jobstates set securitystyleid =aStyleID where dir_jobstatesid = aRowID;
else 
 update dir_jobstates set securitystyleid =aSecurityStyleID where dir_jobstatesid = aRowID;
end if; 
end ; 


procedure dir_jobstates_propagate /*Состояние задания*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from dir_jobstates where dir_jobstatesid=aRowid;
end;



procedure dir_outtype_BRIEF  (
 aCURSESSION CHAR,
 adir_outtypeid CHAR,
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
if adir_outtypeid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from dir_outtype where dir_outtypeID=adir_outtypeID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from dir_outtype where dir_outtypeid=adir_outtypeID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=dir_outtype');
    return;
  end if;
  aBRIEF:=func.dir_outtype_BRIEF_F(adir_outtypeid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure dir_outtype_DELETE /*Тип исходящего*/ (
 aCURSESSION CHAR,
 adir_outtypeid CHAR,
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
select count(*) into existsCnt from dir_outtype where dir_outtypeID=adir_outtypeID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from dir_outtype where dir_outtypeid=adir_outtypeID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:dir_outtype',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=dir_outtype');
      return;
    end if;
  end if;
 --  verify lock  --
 dir_outtype_ISLOCKED( acursession=>acursession,aROWID=>adir_outtypeid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=dir_outtype');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'dir_outtype',
 aVERB=>'DELETEROW',  aThe_Resource=>adir_outtypeid, aLogInstanceID=>aInstanceID);
declare cursor chld_dir_outtype is select  instanceid ID from instance where OwnerPartName ='dir_outtype' and OwnerRowID=adir_outtypeid;
row_dir_outtype  chld_dir_outtype%ROWTYPE;
begin
--open chld_dir_outtype;
for row_dir_outtype in chld_dir_outtype loop
 Kernel.INSTANCE_OWNER (acursession,row_dir_outtype.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_dir_outtype.id);
end loop;
--close chld_dir_outtype;
end ;
  delete from  dir_outtype 
  where  dir_outtypeID = adir_outtypeID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Тип исходящего*/
procedure dir_outtype_SAVE /*Тип исходящего*/ (
 aCURSESSION CHAR,
 adir_outtypeid CHAR,
aInstanceID CHAR 
,aotype
 VARCHAR2/* Тип *//* Тип */
,aProcess CHAR := null /* Процесс обработки *//* Процесс обработки */
,aStateMachine CHAR := null /* Машина состояний *//* Машина состояний */
,aProcessDocumentName
 VARCHAR2 := null /* Название документа в процессе *//* Название документа в процессе */
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
select count(*) into existsCnt from dir_outtype where dir_outtypeID=adir_outtypeID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from dir_outtype where dir_outtypeid=adir_outtypeID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:dir_outtype',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=dir_outtype');
      return;
    end if;
  end if;
 --  verify lock  --
 dir_outtype_ISLOCKED( acursession=>acursession,aROWID=>adir_outtypeid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=dir_outtype');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'dir_outtype',
 aVERB=>'EDITROW',  aThe_Resource=>adir_outtypeid,aLogInstanceID=>aInstanceID);
 update  dir_outtype set ChangeStamp=sysdate
,
  otype=aotype
,
  Process=aProcess
,
  StateMachine=aStateMachine
,
  ProcessDocumentName=aProcessDocumentName
  where  dir_outtypeID = adir_outtypeID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:dir_outtype',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=dir_outtype');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=dir_outtype');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'dir_outtype',
 aVERB=>'CREATEROW',  aThe_Resource=>adir_outtypeid,aLogInstanceID=>aInstanceID);
 insert into   dir_outtype
 (  dir_outtypeID 
,InstanceID
,otype

,Process

,StateMachine

,ProcessDocumentName

 ) values ( adir_outtypeID 
,aInstanceID
,aotype

,aProcess

,aStateMachine

,aProcessDocumentName

 ); 
 dir_outtype_SINIT( aCURSESSION,adir_outtypeid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure dir_outtype_PARENT /*Тип исходящего*/ (
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
  select  INSTANCEID into aParentID from dir_outtype where  dir_outtypeid=aRowID;
 end; 


procedure dir_outtype_ISLOCKED /*Тип исходящего*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from dir_outtype where dir_outtypeid=aRowID;
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
  dir_outtype_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin dir_.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure dir_outtype_LOCK /*Тип исходящего*/ (
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
 dir_outtype_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  dir_outtype_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from dir_outtype where dir_outtypeid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=dir_outtype');
    return;
  end if;
   if  aLockMode =2  
   then   
    update dir_outtype set LockUserID =auserID ,LockSessionID =null where dir_outtypeid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update dir_outtype set LockUserID =null,LockSessionID =aCURSESSION  where dir_outtypeid=aRowID;
     return;
   end if;
 end ;


procedure dir_outtype_HCL /*Тип исходящего*/ (
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


procedure dir_outtype_UNLOCK /*Тип исходящего*/ (
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
 dir_outtype_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update dir_outtype set LockUserID =null  where dir_outtypeid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update dir_outtype set LockSessionID =null  where dir_outtypeid=aRowID;
     return;
   end if;
 end; 


procedure dir_outtype_SINIT /*Тип исходящего*/ (
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
 select  SecurityStyleID into atmpID from dir_outtype where dir_outtypeid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =dir_outtype');
    return;
  end if;
if aSecurityStyleID is null then
 dir_outtype_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update dir_outtype set securitystyleid =aStyleID where dir_outtypeid = aRowID;
else 
 update dir_outtype set securitystyleid =aSecurityStyleID where dir_outtypeid = aRowID;
end if; 
end ; 


procedure dir_outtype_propagate /*Тип исходящего*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from dir_outtype where dir_outtypeid=aRowid;
end;



procedure dir_theme_BRIEF  (
 aCURSESSION CHAR,
 adir_themeid CHAR,
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
if adir_themeid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from dir_theme where dir_themeID=adir_themeID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from dir_theme where dir_themeid=adir_themeID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=dir_theme');
    return;
  end if;
  aBRIEF:=func.dir_theme_BRIEF_F(adir_themeid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure dir_theme_DELETE /*Классификатор тем*/ (
 aCURSESSION CHAR,
 adir_themeid CHAR,
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
select count(*) into existsCnt from dir_theme where dir_themeID=adir_themeID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from dir_theme where dir_themeid=adir_themeID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:dir_theme',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=dir_theme');
      return;
    end if;
  end if;
 --  verify lock  --
 dir_theme_ISLOCKED( acursession=>acursession,aROWID=>adir_themeid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=dir_theme');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'dir_theme',
 aVERB=>'DELETEROW',  aThe_Resource=>adir_themeid, aLogInstanceID=>aInstanceID);
declare cursor chld_dir_theme is select  instanceid ID from instance where OwnerPartName ='dir_theme' and OwnerRowID=adir_themeid;
row_dir_theme  chld_dir_theme%ROWTYPE;
begin
--open chld_dir_theme;
for row_dir_theme in chld_dir_theme loop
 Kernel.INSTANCE_OWNER (acursession,row_dir_theme.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_dir_theme.id);
end loop;
--close chld_dir_theme;
end ;
  delete from  dir_theme 
  where  dir_themeID = adir_themeID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Классификатор тем*/
procedure dir_theme_SAVE /*Классификатор тем*/ (
 aCURSESSION CHAR,
 adir_themeid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* Название *//* Название */
,aComent VARCHAR2 := null /* Комментарий *//* Комментарий */
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
select count(*) into existsCnt from dir_theme where dir_themeID=adir_themeID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from dir_theme where dir_themeid=adir_themeID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:dir_theme',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=dir_theme');
      return;
    end if;
  end if;
 --  verify lock  --
 dir_theme_ISLOCKED( acursession=>acursession,aROWID=>adir_themeid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=dir_theme');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'dir_theme',
 aVERB=>'EDITROW',  aThe_Resource=>adir_themeid,aLogInstanceID=>aInstanceID);
 update  dir_theme set ChangeStamp=sysdate
,
  name=aname
,
  Coment=aComent
  where  dir_themeID = adir_themeID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:dir_theme',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=dir_theme');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=dir_theme');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'dir_theme',
 aVERB=>'CREATEROW',  aThe_Resource=>adir_themeid,aLogInstanceID=>aInstanceID);
 insert into   dir_theme
 (  dir_themeID 
,InstanceID
,name

,Coment

 ) values ( adir_themeID 
,aInstanceID
,aname

,aComent

 ); 
 dir_theme_SINIT( aCURSESSION,adir_themeid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure dir_theme_PARENT /*Классификатор тем*/ (
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
  select  INSTANCEID into aParentID from dir_theme where  dir_themeid=aRowID;
 end; 


procedure dir_theme_ISLOCKED /*Классификатор тем*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from dir_theme where dir_themeid=aRowID;
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
  dir_theme_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin dir_.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure dir_theme_LOCK /*Классификатор тем*/ (
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
 dir_theme_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  dir_theme_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from dir_theme where dir_themeid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=dir_theme');
    return;
  end if;
   if  aLockMode =2  
   then   
    update dir_theme set LockUserID =auserID ,LockSessionID =null where dir_themeid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update dir_theme set LockUserID =null,LockSessionID =aCURSESSION  where dir_themeid=aRowID;
     return;
   end if;
 end ;


procedure dir_theme_HCL /*Классификатор тем*/ (
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


procedure dir_theme_UNLOCK /*Классификатор тем*/ (
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
 dir_theme_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update dir_theme set LockUserID =null  where dir_themeid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update dir_theme set LockSessionID =null  where dir_themeid=aRowID;
     return;
   end if;
 end; 


procedure dir_theme_SINIT /*Классификатор тем*/ (
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
 select  SecurityStyleID into atmpID from dir_theme where dir_themeid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =dir_theme');
    return;
  end if;
if aSecurityStyleID is null then
 dir_theme_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update dir_theme set securitystyleid =aStyleID where dir_themeid = aRowID;
else 
 update dir_theme set securitystyleid =aSecurityStyleID where dir_themeid = aRowID;
end if; 
end ; 


procedure dir_theme_propagate /*Классификатор тем*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from dir_theme where dir_themeid=aRowid;
end;


end dir_;

/



