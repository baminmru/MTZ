
/* --MTZMetaModel*/

 create or replace package body MTZMetaModel as

procedure MTZMetaModel_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='MTZMetaModel'
then
declare cursor child_FIELDTYPE is select FIELDTYPE.FIELDTYPEid ID from FIELDTYPE where  FIELDTYPE.InstanceID = ainstanceid;
row_FIELDTYPE  child_FIELDTYPE%ROWTYPE;
begin
--open child_FIELDTYPE;
for row_FIELDTYPE in child_FIELDTYPE loop
 FIELDTYPE_DELETE (acursession,row_FIELDTYPE.id,aInstanceID);
end loop;
--close child_FIELDTYPE;
end;
declare cursor child_SHAREDMETHOD is select SHAREDMETHOD.SHAREDMETHODid ID from SHAREDMETHOD where  SHAREDMETHOD.InstanceID = ainstanceid;
row_SHAREDMETHOD  child_SHAREDMETHOD%ROWTYPE;
begin
--open child_SHAREDMETHOD;
for row_SHAREDMETHOD in child_SHAREDMETHOD loop
 SHAREDMETHOD_DELETE (acursession,row_SHAREDMETHOD.id,aInstanceID);
end loop;
--close child_SHAREDMETHOD;
end;
declare cursor child_OBJECTTYPE is select OBJECTTYPE.OBJECTTYPEid ID from OBJECTTYPE where  OBJECTTYPE.InstanceID = ainstanceid;
row_OBJECTTYPE  child_OBJECTTYPE%ROWTYPE;
begin
--open child_OBJECTTYPE;
for row_OBJECTTYPE in child_OBJECTTYPE loop
 OBJECTTYPE_DELETE (acursession,row_OBJECTTYPE.id,aInstanceID);
end loop;
--close child_OBJECTTYPE;
end;
declare cursor child_MTZAPP is select MTZAPP.MTZAPPid ID from MTZAPP where  MTZAPP.InstanceID = ainstanceid;
row_MTZAPP  child_MTZAPP%ROWTYPE;
begin
--open child_MTZAPP;
for row_MTZAPP in child_MTZAPP loop
 MTZAPP_DELETE (acursession,row_MTZAPP.id,aInstanceID);
end loop;
--close child_MTZAPP;
end;
declare cursor child_GENPACKAGE is select GENPACKAGE.GENPACKAGEid ID from GENPACKAGE where  GENPACKAGE.InstanceID = ainstanceid;
row_GENPACKAGE  child_GENPACKAGE%ROWTYPE;
begin
--open child_GENPACKAGE;
for row_GENPACKAGE in child_GENPACKAGE loop
 GENPACKAGE_DELETE (acursession,row_GENPACKAGE.id,aInstanceID);
end loop;
--close child_GENPACKAGE;
end;
return;
<<del_error>>
return;
end if;
end;
procedure MTZMetaModel_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'MTZMetaModel'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_FIELDTYPE is select FIELDTYPE.FIELDTYPEid ID from FIELDTYPE where  FIELDTYPE.InstanceID = arowid;
ROW_FIELDTYPE  lch_FIELDTYPE%ROWTYPE;
begin
--open lch_FIELDTYPE;
for row_FIELDTYPE in lch_FIELDTYPE loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from FIELDTYPE where FIELDTYPEid=row_FIELDTYPE.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_FIELDTYPE;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_FIELDTYPE;
     return;
   end if; 
 end if; 
 FIELDTYPE_HCL (acursession,ROW_FIELDTYPE.id,aisLocked);
 if aisLocked >2 then
   close lch_FIELDTYPE;
   return;
 end if;
 end loop;
--close lch_FIELDTYPE;
end;
declare cursor lch_SHAREDMETHOD is select SHAREDMETHOD.SHAREDMETHODid ID from SHAREDMETHOD where  SHAREDMETHOD.InstanceID = arowid;
ROW_SHAREDMETHOD  lch_SHAREDMETHOD%ROWTYPE;
begin
--open lch_SHAREDMETHOD;
for row_SHAREDMETHOD in lch_SHAREDMETHOD loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from SHAREDMETHOD where SHAREDMETHODid=row_SHAREDMETHOD.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_SHAREDMETHOD;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_SHAREDMETHOD;
     return;
   end if; 
 end if; 
 SHAREDMETHOD_HCL (acursession,ROW_SHAREDMETHOD.id,aisLocked);
 if aisLocked >2 then
   close lch_SHAREDMETHOD;
   return;
 end if;
 end loop;
--close lch_SHAREDMETHOD;
end;
declare cursor lch_OBJECTTYPE is select OBJECTTYPE.OBJECTTYPEid ID from OBJECTTYPE where  OBJECTTYPE.InstanceID = arowid;
ROW_OBJECTTYPE  lch_OBJECTTYPE%ROWTYPE;
begin
--open lch_OBJECTTYPE;
for row_OBJECTTYPE in lch_OBJECTTYPE loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from OBJECTTYPE where OBJECTTYPEid=row_OBJECTTYPE.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_OBJECTTYPE;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_OBJECTTYPE;
     return;
   end if; 
 end if; 
 OBJECTTYPE_HCL (acursession,ROW_OBJECTTYPE.id,aisLocked);
 if aisLocked >2 then
   close lch_OBJECTTYPE;
   return;
 end if;
 end loop;
--close lch_OBJECTTYPE;
end;
declare cursor lch_MTZAPP is select MTZAPP.MTZAPPid ID from MTZAPP where  MTZAPP.InstanceID = arowid;
ROW_MTZAPP  lch_MTZAPP%ROWTYPE;
begin
--open lch_MTZAPP;
for row_MTZAPP in lch_MTZAPP loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from MTZAPP where MTZAPPid=row_MTZAPP.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_MTZAPP;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_MTZAPP;
     return;
   end if; 
 end if; 
 MTZAPP_HCL (acursession,ROW_MTZAPP.id,aisLocked);
 if aisLocked >2 then
   close lch_MTZAPP;
   return;
 end if;
 end loop;
--close lch_MTZAPP;
end;
declare cursor lch_GENPACKAGE is select GENPACKAGE.GENPACKAGEid ID from GENPACKAGE where  GENPACKAGE.InstanceID = arowid;
ROW_GENPACKAGE  lch_GENPACKAGE%ROWTYPE;
begin
--open lch_GENPACKAGE;
for row_GENPACKAGE in lch_GENPACKAGE loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from GENPACKAGE where GENPACKAGEid=row_GENPACKAGE.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_GENPACKAGE;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_GENPACKAGE;
     return;
   end if; 
 end if; 
 GENPACKAGE_HCL (acursession,ROW_GENPACKAGE.id,aisLocked);
 if aisLocked >2 then
   close lch_GENPACKAGE;
   return;
 end if;
 end loop;
--close lch_GENPACKAGE;
end;
 end if;
aIsLocked:=0;
end;
procedure MTZMetaModel_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'MTZMetaModel'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_FIELDTYPE is select FIELDTYPE.FIELDTYPEid id from FIELDTYPE where  FIELDTYPE.InstanceID = arowid;
row_FIELDTYPE  pch_FIELDTYPE%ROWTYPE;
begin
--open pch_FIELDTYPE;
for row_FIELDTYPE in  pch_FIELDTYPE loop
 FIELDTYPE_SINIT( acursession,row_FIELDTYPE.id,assid);
 FIELDTYPE_propagate( acursession,row_FIELDTYPE.id);
end loop;
--close pch_FIELDTYPE;
end;
declare cursor pch_SHAREDMETHOD is select SHAREDMETHOD.SHAREDMETHODid id from SHAREDMETHOD where  SHAREDMETHOD.InstanceID = arowid;
row_SHAREDMETHOD  pch_SHAREDMETHOD%ROWTYPE;
begin
--open pch_SHAREDMETHOD;
for row_SHAREDMETHOD in  pch_SHAREDMETHOD loop
 SHAREDMETHOD_SINIT( acursession,row_SHAREDMETHOD.id,assid);
 SHAREDMETHOD_propagate( acursession,row_SHAREDMETHOD.id);
end loop;
--close pch_SHAREDMETHOD;
end;
declare cursor pch_OBJECTTYPE is select OBJECTTYPE.OBJECTTYPEid id from OBJECTTYPE where  OBJECTTYPE.InstanceID = arowid;
row_OBJECTTYPE  pch_OBJECTTYPE%ROWTYPE;
begin
--open pch_OBJECTTYPE;
for row_OBJECTTYPE in  pch_OBJECTTYPE loop
 OBJECTTYPE_SINIT( acursession,row_OBJECTTYPE.id,assid);
 OBJECTTYPE_propagate( acursession,row_OBJECTTYPE.id);
end loop;
--close pch_OBJECTTYPE;
end;
declare cursor pch_MTZAPP is select MTZAPP.MTZAPPid id from MTZAPP where  MTZAPP.InstanceID = arowid;
row_MTZAPP  pch_MTZAPP%ROWTYPE;
begin
--open pch_MTZAPP;
for row_MTZAPP in  pch_MTZAPP loop
 MTZAPP_SINIT( acursession,row_MTZAPP.id,assid);
 MTZAPP_propagate( acursession,row_MTZAPP.id);
end loop;
--close pch_MTZAPP;
end;
declare cursor pch_GENPACKAGE is select GENPACKAGE.GENPACKAGEid id from GENPACKAGE where  GENPACKAGE.InstanceID = arowid;
row_GENPACKAGE  pch_GENPACKAGE%ROWTYPE;
begin
--open pch_GENPACKAGE;
for row_GENPACKAGE in  pch_GENPACKAGE loop
 GENPACKAGE_SINIT( acursession,row_GENPACKAGE.id,assid);
 GENPACKAGE_propagate( acursession,row_GENPACKAGE.id);
end loop;
--close pch_GENPACKAGE;
end;
 end if; 
end;



procedure FIELDTYPE_BRIEF  (
 aCURSESSION CHAR,
 aFIELDTYPEid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aFIELDTYPEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from FIELDTYPE where FIELDTYPEID=aFIELDTYPEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from FIELDTYPE where FIELDTYPEid=aFIELDTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=FIELDTYPE');
    return;
  end if;
  aBRIEF:=func.FIELDTYPE_BRIEF_F(aFIELDTYPEid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure FIELDTYPE_DELETE /*���� �����, ������������, ���������*/ (
 aCURSESSION CHAR,
 aFIELDTYPEid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from FIELDTYPE where FIELDTYPEID=aFIELDTYPEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from FIELDTYPE where FIELDTYPEid=aFIELDTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:FIELDTYPE',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=FIELDTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 FIELDTYPE_ISLOCKED( acursession=>acursession,aROWID=>aFIELDTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=FIELDTYPE');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_FIELDTYPEMAP is select FIELDTYPEMAP.FIELDTYPEMAPid ID from FIELDTYPEMAP where  FIELDTYPEMAP.ParentStructRowID = aFIELDTYPEid;
    child_FIELDTYPEMAP_rec  child_FIELDTYPEMAP%ROWTYPE;
    begin
    --open child_FIELDTYPEMAP;
      for child_FIELDTYPEMAP_rec in child_FIELDTYPEMAP loop
      FIELDTYPEMAP_DELETE (acursession,child_FIELDTYPEMAP_rec.id,aInstanceid);
      end loop;
      --close child_FIELDTYPEMAP;
    end ;
    declare cursor child_ENUMITEM is select ENUMITEM.ENUMITEMid ID from ENUMITEM where  ENUMITEM.ParentStructRowID = aFIELDTYPEid;
    child_ENUMITEM_rec  child_ENUMITEM%ROWTYPE;
    begin
    --open child_ENUMITEM;
      for child_ENUMITEM_rec in child_ENUMITEM loop
      ENUMITEM_DELETE (acursession,child_ENUMITEM_rec.id,aInstanceid);
      end loop;
      --close child_ENUMITEM;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'FIELDTYPE',
 aVERB=>'DELETEROW',  aThe_Resource=>aFIELDTYPEid, aLogInstanceID=>aInstanceID);
declare cursor chld_FIELDTYPE is select  instanceid ID from instance where OwnerPartName ='FIELDTYPE' and OwnerRowID=aFIELDTYPEid;
row_FIELDTYPE  chld_FIELDTYPE%ROWTYPE;
begin
--open chld_FIELDTYPE;
for row_FIELDTYPE in chld_FIELDTYPE loop
 Kernel.INSTANCE_OWNER (acursession,row_FIELDTYPE.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_FIELDTYPE.id);
end loop;
--close chld_FIELDTYPE;
end ;
  delete from  FIELDTYPE 
  where  FIELDTYPEID = aFIELDTYPEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*��� ����*/
procedure FIELDTYPE_SAVE /*���� �����, ������������, ���������*/ (
 aCURSESSION CHAR,
 aFIELDTYPEid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
,aTypeStyle
 NUMBER/* ��������� *//* ��������� */
,athe_Comment VARCHAR2 := null /* �������� *//* �������� */
,aAllowSize
 NUMBER/* ����� ������ *//* ����� ������ */
,aMinimum
 VARCHAR2 := null /* ������� *//* ������� */
,aMaximum
 VARCHAR2 := null /* �������� *//* �������� */
,aAllowLikeSearch
 NUMBER := null /* ����� ������ *//* ����� ������ */
,aGridSortType
 NUMBER := null /* ������� ���������� � ��������� ������������� *//* ������� ���������� � ��������� ������������� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from FIELDTYPE where FIELDTYPEID=aFIELDTYPEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from FIELDTYPE where FIELDTYPEid=aFIELDTYPEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:FIELDTYPE',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=FIELDTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 FIELDTYPE_ISLOCKED( acursession=>acursession,aROWID=>aFIELDTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=FIELDTYPE');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'FIELDTYPE',
 aVERB=>'EDITROW',  aThe_Resource=>aFIELDTYPEid,aLogInstanceID=>aInstanceID);
 update  FIELDTYPE set ChangeStamp=sysdate
,
  Name=aName
,
  TypeStyle=aTypeStyle
,
  the_Comment=athe_Comment
,
  AllowSize=aAllowSize
,
  Minimum=aMinimum
,
  Maximum=aMaximum
,
  AllowLikeSearch=aAllowLikeSearch
,
  GridSortType=aGridSortType
  where  FIELDTYPEID = aFIELDTYPEID; 
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from FIELDTYPE where 1=1  
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'��������� ������������ ��������� �����. ������=FIELDTYPE');
 return;
end if;

 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:FIELDTYPE',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=FIELDTYPE');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=FIELDTYPE');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'FIELDTYPE',
 aVERB=>'CREATEROW',  aThe_Resource=>aFIELDTYPEid,aLogInstanceID=>aInstanceID);
 insert into   FIELDTYPE
 (  FIELDTYPEID 
,InstanceID
,Name

,TypeStyle

,the_Comment

,AllowSize

,Minimum

,Maximum

,AllowLikeSearch

,GridSortType

 ) values ( aFIELDTYPEID 
,aInstanceID
,aName

,aTypeStyle

,athe_Comment

,aAllowSize

,aMinimum

,aMaximum

,aAllowLikeSearch

,aGridSortType

 ); 
 FIELDTYPE_SINIT( aCURSESSION,aFIELDTYPEid,atmpid);
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from FIELDTYPE where 1=1  
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'��������� ������������ ��������� �����. ������=FIELDTYPE');
 return;
end if;

 end if;
 -- close transaction --
 end; 


procedure FIELDTYPE_PARENT /*���� �����, ������������, ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  aParentTable := 'INSTANCE';
  select  INSTANCEID into aParentID from FIELDTYPE where  FIELDTYPEid=aRowID;
 end; 


procedure FIELDTYPE_ISLOCKED /*���� �����, ������������, ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from FIELDTYPE where FIELDTYPEid=aRowID;
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
  FIELDTYPE_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure FIELDTYPE_LOCK /*���� �����, ������������, ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 FIELDTYPE_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  FIELDTYPE_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from FIELDTYPE where FIELDTYPEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=FIELDTYPE');
    return;
  end if;
   if  aLockMode =2  
   then   
    update FIELDTYPE set LockUserID =auserID ,LockSessionID =null where FIELDTYPEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update FIELDTYPE set LockUserID =null,LockSessionID =aCURSESSION  where FIELDTYPEid=aRowID;
     return;
   end if;
 end ;


procedure FIELDTYPE_HCL /*���� �����, ������������, ���������*/ (
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
declare cursor lch_FIELDTYPEMAP is select FIELDTYPEMAP.FIELDTYPEMAPid ID from FIELDTYPEMAP where  FIELDTYPEMAP.ParentStructRowID = aRowid;
row_FIELDTYPEMAP lch_FIELDTYPEMAP%ROWTYPE;
begin  
--open lch_FIELDTYPEMAP;
for row_FIELDTYPEMAP in lch_FIELDTYPEMAP
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from FIELDTYPEMAP where FIELDTYPEMAPid=row_FIELDTYPEMAP.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_FIELDTYPEMAP;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_FIELDTYPEMAP;
     return;
   end if; 
 end if;  
 FIELDTYPEMAP_HCL (acursession,row_FIELDTYPEMAP.id,aisLocked);
 if aisLocked >2 then
   close lch_FIELDTYPEMAP;
   return;
 end if;
end loop;
--close lch_FIELDTYPEMAP;
end;
declare cursor lch_ENUMITEM is select ENUMITEM.ENUMITEMid ID from ENUMITEM where  ENUMITEM.ParentStructRowID = aRowid;
row_ENUMITEM lch_ENUMITEM%ROWTYPE;
begin  
--open lch_ENUMITEM;
for row_ENUMITEM in lch_ENUMITEM
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from ENUMITEM where ENUMITEMid=row_ENUMITEM.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENUMITEM;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_ENUMITEM;
     return;
   end if; 
 end if;  
 ENUMITEM_HCL (acursession,row_ENUMITEM.id,aisLocked);
 if aisLocked >2 then
   close lch_ENUMITEM;
   return;
 end if;
end loop;
--close lch_ENUMITEM;
end;
aIsLocked :=0;
end;


procedure FIELDTYPE_UNLOCK /*���� �����, ������������, ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 FIELDTYPE_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update FIELDTYPE set LockUserID =null  where FIELDTYPEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update FIELDTYPE set LockSessionID =null  where FIELDTYPEid=aRowID;
     return;
   end if;
 end; 


procedure FIELDTYPE_SINIT /*���� �����, ������������, ���������*/ (
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
 select  SecurityStyleID into atmpID from FIELDTYPE where FIELDTYPEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =FIELDTYPE');
    return;
  end if;
if aSecurityStyleID is null then
 FIELDTYPE_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update FIELDTYPE set securitystyleid =aStyleID where FIELDTYPEid = aRowID;
else 
 update FIELDTYPE set securitystyleid =aSecurityStyleID where FIELDTYPEid = aRowID;
end if; 
end ; 


procedure FIELDTYPE_propagate /*���� �����, ������������, ���������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from FIELDTYPE where FIELDTYPEid=aRowid;
declare cursor pch_FIELDTYPEMAP  is select FIELDTYPEMAP.FIELDTYPEMAPid ID from FIELDTYPEMAP where  FIELDTYPEMAP.ParentStructRowID = aRowid;
row_FIELDTYPEMAP  pch_FIELDTYPEMAP%ROWTYPE;
begin
--open pch_FIELDTYPEMAP;
for row_FIELDTYPEMAP in pch_FIELDTYPEMAP loop
   FIELDTYPEMAP_SINIT( acursession,row_FIELDTYPEMAP.id,assid);
   FIELDTYPEMAP_propagate( acursession,row_FIELDTYPEMAP.id);
end loop;
--close pch_FIELDTYPEMAP;
end;
declare cursor pch_ENUMITEM  is select ENUMITEM.ENUMITEMid ID from ENUMITEM where  ENUMITEM.ParentStructRowID = aRowid;
row_ENUMITEM  pch_ENUMITEM%ROWTYPE;
begin
--open pch_ENUMITEM;
for row_ENUMITEM in pch_ENUMITEM loop
   ENUMITEM_SINIT( acursession,row_ENUMITEM.id,assid);
   ENUMITEM_propagate( acursession,row_ENUMITEM.id);
end loop;
--close pch_ENUMITEM;
end;
end;



procedure FIELDTYPEMAP_BRIEF  (
 aCURSESSION CHAR,
 aFIELDTYPEMAPid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aFIELDTYPEMAPid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from FIELDTYPEMAP where FIELDTYPEMAPID=aFIELDTYPEMAPID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from FIELDTYPEMAP where FIELDTYPEMAPid=aFIELDTYPEMAPID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=FIELDTYPEMAP');
    return;
  end if;
  aBRIEF:=func.FIELDTYPEMAP_BRIEF_F(aFIELDTYPEMAPid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure FIELDTYPEMAP_DELETE /*����������� ���� ���� �� ���������� ��� ��������*/ (
 aCURSESSION CHAR,
 aFIELDTYPEMAPid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from FIELDTYPEMAP where FIELDTYPEMAPID=aFIELDTYPEMAPID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from FIELDTYPEMAP where FIELDTYPEMAPid=aFIELDTYPEMAPID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:FIELDTYPEMAP',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=FIELDTYPEMAP');
      return;
    end if;
  end if;
 --  verify lock  --
 FIELDTYPEMAP_ISLOCKED( acursession=>acursession,aROWID=>aFIELDTYPEMAPid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=FIELDTYPEMAP');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'FIELDTYPEMAP',
 aVERB=>'DELETEROW',  aThe_Resource=>aFIELDTYPEMAPid, aLogInstanceID=>aInstanceID);
declare cursor chld_FIELDTYPEMAP is select  instanceid ID from instance where OwnerPartName ='FIELDTYPEMAP' and OwnerRowID=aFIELDTYPEMAPid;
row_FIELDTYPEMAP  chld_FIELDTYPEMAP%ROWTYPE;
begin
--open chld_FIELDTYPEMAP;
for row_FIELDTYPEMAP in chld_FIELDTYPEMAP loop
 Kernel.INSTANCE_OWNER (acursession,row_FIELDTYPEMAP.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_FIELDTYPEMAP.id);
end loop;
--close chld_FIELDTYPEMAP;
end ;
  delete from  FIELDTYPEMAP 
  where  FIELDTYPEMAPID = aFIELDTYPEMAPID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*�����������*/
procedure FIELDTYPEMAP_SAVE /*����������� ���� ���� �� ���������� ��� ��������*/ (
 aCURSESSION CHAR,
 aFIELDTYPEMAPid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTarget CHAR/* ��������� *//* ��������� */
,aStoageType
 VARCHAR2/* ��� �������� *//* ��� �������� */
,aFixedSize
 NUMBER := null /* ������ *//* ������ */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from FIELDTYPEMAP where FIELDTYPEMAPID=aFIELDTYPEMAPID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from FIELDTYPEMAP where FIELDTYPEMAPid=aFIELDTYPEMAPID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:FIELDTYPEMAP',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=FIELDTYPEMAP');
      return;
    end if;
  end if;
 --  verify lock  --
 FIELDTYPEMAP_ISLOCKED( acursession=>acursession,aROWID=>aFIELDTYPEMAPid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=FIELDTYPEMAP');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'FIELDTYPEMAP',
 aVERB=>'EDITROW',  aThe_Resource=>aFIELDTYPEMAPid,aLogInstanceID=>aInstanceID);
 update  FIELDTYPEMAP set ChangeStamp=sysdate
,
  Target=aTarget
,
  StoageType=aStoageType
,
  FixedSize=aFixedSize
  where  FIELDTYPEMAPID = aFIELDTYPEMAPID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from FIELDTYPE where FIELDTYPEid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:FIELDTYPEMAP',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=FIELDTYPEMAP');
      return;
    end if;
 end if;
 FIELDTYPE_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=FIELDTYPEMAP');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'FIELDTYPEMAP',
 aVERB=>'CREATEROW',  aThe_Resource=>aFIELDTYPEMAPid,aLogInstanceID=>aInstanceID);
 insert into   FIELDTYPEMAP
 (  FIELDTYPEMAPID 
,ParentStructRowID
,Target

,StoageType

,FixedSize

 ) values ( aFIELDTYPEMAPID 
,aParentStructRowID
,aTarget

,aStoageType

,aFixedSize

 ); 
 FIELDTYPEMAP_SINIT( aCURSESSION,aFIELDTYPEMAPid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure FIELDTYPEMAP_PARENT /*����������� ���� ���� �� ���������� ��� ��������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from FIELDTYPEMAP where  FIELDTYPEMAPid=aRowID;
  aParentTable := 'FIELDTYPE';
 end; 


procedure FIELDTYPEMAP_ISLOCKED /*����������� ���� ���� �� ���������� ��� ��������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from FIELDTYPEMAP where FIELDTYPEMAPid=aRowID;
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
  FIELDTYPEMAP_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure FIELDTYPEMAP_LOCK /*����������� ���� ���� �� ���������� ��� ��������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 FIELDTYPEMAP_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  FIELDTYPEMAP_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from FIELDTYPEMAP where FIELDTYPEMAPid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=FIELDTYPEMAP');
    return;
  end if;
   if  aLockMode =2  
   then   
    update FIELDTYPEMAP set LockUserID =auserID ,LockSessionID =null where FIELDTYPEMAPid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update FIELDTYPEMAP set LockUserID =null,LockSessionID =aCURSESSION  where FIELDTYPEMAPid=aRowID;
     return;
   end if;
 end ;


procedure FIELDTYPEMAP_HCL /*����������� ���� ���� �� ���������� ��� ��������*/ (
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


procedure FIELDTYPEMAP_UNLOCK /*����������� ���� ���� �� ���������� ��� ��������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 FIELDTYPEMAP_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update FIELDTYPEMAP set LockUserID =null  where FIELDTYPEMAPid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update FIELDTYPEMAP set LockSessionID =null  where FIELDTYPEMAPid=aRowID;
     return;
   end if;
 end; 


procedure FIELDTYPEMAP_SINIT /*����������� ���� ���� �� ���������� ��� ��������*/ (
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
 select  SecurityStyleID into atmpID from FIELDTYPEMAP where FIELDTYPEMAPid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =FIELDTYPEMAP');
    return;
  end if;
if aSecurityStyleID is null then
 FIELDTYPEMAP_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update FIELDTYPEMAP set securitystyleid =aStyleID where FIELDTYPEMAPid = aRowID;
else 
 update FIELDTYPEMAP set securitystyleid =aSecurityStyleID where FIELDTYPEMAPid = aRowID;
end if; 
end ; 


procedure FIELDTYPEMAP_propagate /*����������� ���� ���� �� ���������� ��� ��������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from FIELDTYPEMAP where FIELDTYPEMAPid=aRowid;
end;



procedure ENUMITEM_BRIEF  (
 aCURSESSION CHAR,
 aENUMITEMid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aENUMITEMid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENUMITEM where ENUMITEMID=aENUMITEMID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENUMITEM where ENUMITEMid=aENUMITEMID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENUMITEM');
    return;
  end if;
  aBRIEF:=func.ENUMITEM_BRIEF_F(aENUMITEMid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENUMITEM_DELETE /*��� �������� Enum �����*/ (
 aCURSESSION CHAR,
 aENUMITEMid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from ENUMITEM where ENUMITEMID=aENUMITEMID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENUMITEM where ENUMITEMid=aENUMITEMID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENUMITEM',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=ENUMITEM');
      return;
    end if;
  end if;
 --  verify lock  --
 ENUMITEM_ISLOCKED( acursession=>acursession,aROWID=>aENUMITEMid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=ENUMITEM');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENUMITEM',
 aVERB=>'DELETEROW',  aThe_Resource=>aENUMITEMid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENUMITEM is select  instanceid ID from instance where OwnerPartName ='ENUMITEM' and OwnerRowID=aENUMITEMid;
row_ENUMITEM  chld_ENUMITEM%ROWTYPE;
begin
--open chld_ENUMITEM;
for row_ENUMITEM in chld_ENUMITEM loop
 Kernel.INSTANCE_OWNER (acursession,row_ENUMITEM.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENUMITEM.id);
end loop;
--close chld_ENUMITEM;
end ;
  delete from  ENUMITEM 
  where  ENUMITEMID = aENUMITEMID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*�������*/
procedure ENUMITEM_SAVE /*��� �������� Enum �����*/ (
 aCURSESSION CHAR,
 aENUMITEMid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
,aNameValue
 NUMBER/* �������� *//* �������� */
,aNameInCode
 VARCHAR2 := null /* �������� � ���� *//* �������� � ���� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from ENUMITEM where ENUMITEMID=aENUMITEMID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENUMITEM where ENUMITEMid=aENUMITEMID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENUMITEM',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=ENUMITEM');
      return;
    end if;
  end if;
 --  verify lock  --
 ENUMITEM_ISLOCKED( acursession=>acursession,aROWID=>aENUMITEMid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=ENUMITEM');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENUMITEM',
 aVERB=>'EDITROW',  aThe_Resource=>aENUMITEMid,aLogInstanceID=>aInstanceID);
 update  ENUMITEM set ChangeStamp=sysdate
,
  Name=aName
,
  NameValue=aNameValue
,
  NameInCode=aNameInCode
  where  ENUMITEMID = aENUMITEMID; 
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from ENUMITEM where ParentStructRowID=aParentStructRowID 
 and NameValue=aNameValue;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'��������� ������������ ��������� �����. ������=ENUMITEM');
 return;
end if;
select Count(*) into aUniqueRowCount from ENUMITEM where ParentStructRowID=aParentStructRowID 
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'��������� ������������ ��������� �����. ������=ENUMITEM');
 return;
end if;

 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from FIELDTYPE where FIELDTYPEid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENUMITEM',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=ENUMITEM');
      return;
    end if;
 end if;
 FIELDTYPE_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=ENUMITEM');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENUMITEM',
 aVERB=>'CREATEROW',  aThe_Resource=>aENUMITEMid,aLogInstanceID=>aInstanceID);
 insert into   ENUMITEM
 (  ENUMITEMID 
,ParentStructRowID
,Name

,NameValue

,NameInCode

 ) values ( aENUMITEMID 
,aParentStructRowID
,aName

,aNameValue

,aNameInCode

 ); 
 ENUMITEM_SINIT( aCURSESSION,aENUMITEMid,atmpid);
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from ENUMITEM where ParentStructRowID=aParentStructRowID 
 and NameValue=aNameValue;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'��������� ������������ ��������� �����. ������=ENUMITEM');
 return;
end if;
select Count(*) into aUniqueRowCount from ENUMITEM where ParentStructRowID=aParentStructRowID 
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'��������� ������������ ��������� �����. ������=ENUMITEM');
 return;
end if;

 end if;
 -- close transaction --
 end; 


procedure ENUMITEM_PARENT /*��� �������� Enum �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from ENUMITEM where  ENUMITEMid=aRowID;
  aParentTable := 'FIELDTYPE';
 end; 


procedure ENUMITEM_ISLOCKED /*��� �������� Enum �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENUMITEM where ENUMITEMid=aRowID;
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
  ENUMITEM_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENUMITEM_LOCK /*��� �������� Enum �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 ENUMITEM_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  ENUMITEM_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENUMITEM where ENUMITEMid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=ENUMITEM');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENUMITEM set LockUserID =auserID ,LockSessionID =null where ENUMITEMid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENUMITEM set LockUserID =null,LockSessionID =aCURSESSION  where ENUMITEMid=aRowID;
     return;
   end if;
 end ;


procedure ENUMITEM_HCL /*��� �������� Enum �����*/ (
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


procedure ENUMITEM_UNLOCK /*��� �������� Enum �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 ENUMITEM_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENUMITEM set LockUserID =null  where ENUMITEMid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENUMITEM set LockSessionID =null  where ENUMITEMid=aRowID;
     return;
   end if;
 end; 


procedure ENUMITEM_SINIT /*��� �������� Enum �����*/ (
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
 select  SecurityStyleID into atmpID from ENUMITEM where ENUMITEMid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =ENUMITEM');
    return;
  end if;
if aSecurityStyleID is null then
 ENUMITEM_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENUMITEM set securitystyleid =aStyleID where ENUMITEMid = aRowID;
else 
 update ENUMITEM set securitystyleid =aSecurityStyleID where ENUMITEMid = aRowID;
end if; 
end ; 


procedure ENUMITEM_propagate /*��� �������� Enum �����*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENUMITEM where ENUMITEMid=aRowid;
end;



procedure SHAREDMETHOD_BRIEF  (
 aCURSESSION CHAR,
 aSHAREDMETHODid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aSHAREDMETHODid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from SHAREDMETHOD where SHAREDMETHODID=aSHAREDMETHODID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from SHAREDMETHOD where SHAREDMETHODid=aSHAREDMETHODID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=SHAREDMETHOD');
    return;
  end if;
  aBRIEF:=func.SHAREDMETHOD_BRIEF_F(aSHAREDMETHODid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure SHAREDMETHOD_DELETE /*������ � ���������*/ (
 aCURSESSION CHAR,
 aSHAREDMETHODid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from SHAREDMETHOD where SHAREDMETHODID=aSHAREDMETHODID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from SHAREDMETHOD where SHAREDMETHODid=aSHAREDMETHODID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:SHAREDMETHOD',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=SHAREDMETHOD');
      return;
    end if;
  end if;
 --  verify lock  --
 SHAREDMETHOD_ISLOCKED( acursession=>acursession,aROWID=>aSHAREDMETHODid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=SHAREDMETHOD');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_SCRIPT is select SCRIPT.SCRIPTid ID from SCRIPT where  SCRIPT.ParentStructRowID = aSHAREDMETHODid;
    child_SCRIPT_rec  child_SCRIPT%ROWTYPE;
    begin
    --open child_SCRIPT;
      for child_SCRIPT_rec in child_SCRIPT loop
      SCRIPT_DELETE (acursession,child_SCRIPT_rec.id,aInstanceid);
      end loop;
      --close child_SCRIPT;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'SHAREDMETHOD',
 aVERB=>'DELETEROW',  aThe_Resource=>aSHAREDMETHODid, aLogInstanceID=>aInstanceID);
declare cursor chld_SHAREDMETHOD is select  instanceid ID from instance where OwnerPartName ='SHAREDMETHOD' and OwnerRowID=aSHAREDMETHODid;
row_SHAREDMETHOD  chld_SHAREDMETHOD%ROWTYPE;
begin
--open chld_SHAREDMETHOD;
for row_SHAREDMETHOD in chld_SHAREDMETHOD loop
 Kernel.INSTANCE_OWNER (acursession,row_SHAREDMETHOD.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_SHAREDMETHOD.id);
end loop;
--close chld_SHAREDMETHOD;
end ;
  delete from  SHAREDMETHOD 
  where  SHAREDMETHODID = aSHAREDMETHODID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*������ � ���������*/
procedure SHAREDMETHOD_SAVE /*������ � ���������*/ (
 aCURSESSION CHAR,
 aSHAREDMETHODid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2 := null /* �������� *//* �������� */
,athe_Comment VARCHAR2 := null /* �������� ������ *//* �������� ������ */
,aReturnType CHAR := null /* ������������ ��� *//* ������������ ��� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from SHAREDMETHOD where SHAREDMETHODID=aSHAREDMETHODID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from SHAREDMETHOD where SHAREDMETHODid=aSHAREDMETHODID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:SHAREDMETHOD',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=SHAREDMETHOD');
      return;
    end if;
  end if;
 --  verify lock  --
 SHAREDMETHOD_ISLOCKED( acursession=>acursession,aROWID=>aSHAREDMETHODid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=SHAREDMETHOD');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'SHAREDMETHOD',
 aVERB=>'EDITROW',  aThe_Resource=>aSHAREDMETHODid,aLogInstanceID=>aInstanceID);
 update  SHAREDMETHOD set ChangeStamp=sysdate
,
  Name=aName
,
  the_Comment=athe_Comment
,
  ReturnType=aReturnType
  where  SHAREDMETHODID = aSHAREDMETHODID; 
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from SHAREDMETHOD where 1=1  
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'��������� ������������ ��������� �����. ������=SHAREDMETHOD');
 return;
end if;

 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:SHAREDMETHOD',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=SHAREDMETHOD');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=SHAREDMETHOD');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'SHAREDMETHOD',
 aVERB=>'CREATEROW',  aThe_Resource=>aSHAREDMETHODid,aLogInstanceID=>aInstanceID);
 insert into   SHAREDMETHOD
 (  SHAREDMETHODID 
,InstanceID
,Name

,the_Comment

,ReturnType

 ) values ( aSHAREDMETHODID 
,aInstanceID
,aName

,athe_Comment

,aReturnType

 ); 
 SHAREDMETHOD_SINIT( aCURSESSION,aSHAREDMETHODid,atmpid);
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from SHAREDMETHOD where 1=1  
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'��������� ������������ ��������� �����. ������=SHAREDMETHOD');
 return;
end if;

 end if;
 -- close transaction --
 end; 


procedure SHAREDMETHOD_PARENT /*������ � ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  aParentTable := 'INSTANCE';
  select  INSTANCEID into aParentID from SHAREDMETHOD where  SHAREDMETHODid=aRowID;
 end; 


procedure SHAREDMETHOD_ISLOCKED /*������ � ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from SHAREDMETHOD where SHAREDMETHODid=aRowID;
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
  SHAREDMETHOD_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure SHAREDMETHOD_LOCK /*������ � ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 SHAREDMETHOD_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  SHAREDMETHOD_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from SHAREDMETHOD where SHAREDMETHODid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=SHAREDMETHOD');
    return;
  end if;
   if  aLockMode =2  
   then   
    update SHAREDMETHOD set LockUserID =auserID ,LockSessionID =null where SHAREDMETHODid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update SHAREDMETHOD set LockUserID =null,LockSessionID =aCURSESSION  where SHAREDMETHODid=aRowID;
     return;
   end if;
 end ;


procedure SHAREDMETHOD_HCL /*������ � ���������*/ (
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
declare cursor lch_SCRIPT is select SCRIPT.SCRIPTid ID from SCRIPT where  SCRIPT.ParentStructRowID = aRowid;
row_SCRIPT lch_SCRIPT%ROWTYPE;
begin  
--open lch_SCRIPT;
for row_SCRIPT in lch_SCRIPT
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from SCRIPT where SCRIPTid=row_SCRIPT.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_SCRIPT;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_SCRIPT;
     return;
   end if; 
 end if;  
 SCRIPT_HCL (acursession,row_SCRIPT.id,aisLocked);
 if aisLocked >2 then
   close lch_SCRIPT;
   return;
 end if;
end loop;
--close lch_SCRIPT;
end;
aIsLocked :=0;
end;


procedure SHAREDMETHOD_UNLOCK /*������ � ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 SHAREDMETHOD_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update SHAREDMETHOD set LockUserID =null  where SHAREDMETHODid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update SHAREDMETHOD set LockSessionID =null  where SHAREDMETHODid=aRowID;
     return;
   end if;
 end; 


procedure SHAREDMETHOD_SINIT /*������ � ���������*/ (
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
 select  SecurityStyleID into atmpID from SHAREDMETHOD where SHAREDMETHODid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =SHAREDMETHOD');
    return;
  end if;
if aSecurityStyleID is null then
 SHAREDMETHOD_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update SHAREDMETHOD set securitystyleid =aStyleID where SHAREDMETHODid = aRowID;
else 
 update SHAREDMETHOD set securitystyleid =aSecurityStyleID where SHAREDMETHODid = aRowID;
end if; 
end ; 


procedure SHAREDMETHOD_propagate /*������ � ���������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from SHAREDMETHOD where SHAREDMETHODid=aRowid;
declare cursor pch_SCRIPT  is select SCRIPT.SCRIPTid ID from SCRIPT where  SCRIPT.ParentStructRowID = aRowid;
row_SCRIPT  pch_SCRIPT%ROWTYPE;
begin
--open pch_SCRIPT;
for row_SCRIPT in pch_SCRIPT loop
   SCRIPT_SINIT( acursession,row_SCRIPT.id,assid);
   SCRIPT_propagate( acursession,row_SCRIPT.id);
end loop;
--close pch_SCRIPT;
end;
end;



procedure SCRIPT_BRIEF  (
 aCURSESSION CHAR,
 aSCRIPTid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aSCRIPTid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from SCRIPT where SCRIPTID=aSCRIPTID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from SCRIPT where SCRIPTid=aSCRIPTID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=SCRIPT');
    return;
  end if;
  aBRIEF:=func.SCRIPT_BRIEF_F(aSCRIPTid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure SCRIPT_DELETE /*��� ������ �� �������� ����������� ���������� �����*/ (
 aCURSESSION CHAR,
 aSCRIPTid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from SCRIPT where SCRIPTID=aSCRIPTID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from SCRIPT where SCRIPTid=aSCRIPTID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:SCRIPT',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=SCRIPT');
      return;
    end if;
  end if;
 --  verify lock  --
 SCRIPT_ISLOCKED( acursession=>acursession,aROWID=>aSCRIPTid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=SCRIPT');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_PARAMETERS is select PARAMETERS.PARAMETERSid ID from PARAMETERS where  PARAMETERS.ParentStructRowID = aSCRIPTid;
    child_PARAMETERS_rec  child_PARAMETERS%ROWTYPE;
    begin
    --open child_PARAMETERS;
      for child_PARAMETERS_rec in child_PARAMETERS loop
      PARAMETERS_DELETE (acursession,child_PARAMETERS_rec.id,aInstanceid);
      end loop;
      --close child_PARAMETERS;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'SCRIPT',
 aVERB=>'DELETEROW',  aThe_Resource=>aSCRIPTid, aLogInstanceID=>aInstanceID);
declare cursor chld_SCRIPT is select  instanceid ID from instance where OwnerPartName ='SCRIPT' and OwnerRowID=aSCRIPTid;
row_SCRIPT  chld_SCRIPT%ROWTYPE;
begin
--open chld_SCRIPT;
for row_SCRIPT in chld_SCRIPT loop
 Kernel.INSTANCE_OWNER (acursession,row_SCRIPT.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_SCRIPT.id);
end loop;
--close chld_SCRIPT;
end ;
  delete from  SCRIPT 
  where  SCRIPTID = aSCRIPTID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*����������*/
procedure SCRIPT_SAVE /*��� ������ �� �������� ����������� ���������� �����*/ (
 aCURSESSION CHAR,
 aSCRIPTid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTarget CHAR := null /* ������� ��������� *//* ������� ��������� */
,aCode VARCHAR2 := null /* ������ *//* ������ */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from SCRIPT where SCRIPTID=aSCRIPTID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from SCRIPT where SCRIPTid=aSCRIPTID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:SCRIPT',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=SCRIPT');
      return;
    end if;
  end if;
 --  verify lock  --
 SCRIPT_ISLOCKED( acursession=>acursession,aROWID=>aSCRIPTid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=SCRIPT');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'SCRIPT',
 aVERB=>'EDITROW',  aThe_Resource=>aSCRIPTid,aLogInstanceID=>aInstanceID);
 update  SCRIPT set ChangeStamp=sysdate
,
  Target=aTarget
,
  Code=aCode
  where  SCRIPTID = aSCRIPTID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from SHAREDMETHOD where SHAREDMETHODid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:SCRIPT',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=SCRIPT');
      return;
    end if;
 end if;
 SHAREDMETHOD_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=SCRIPT');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'SCRIPT',
 aVERB=>'CREATEROW',  aThe_Resource=>aSCRIPTid,aLogInstanceID=>aInstanceID);
 insert into   SCRIPT
 (  SCRIPTID 
,ParentStructRowID
,Target

,Code

 ) values ( aSCRIPTID 
,aParentStructRowID
,aTarget

,aCode

 ); 
 SCRIPT_SINIT( aCURSESSION,aSCRIPTid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure SCRIPT_PARENT /*��� ������ �� �������� ����������� ���������� �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from SCRIPT where  SCRIPTid=aRowID;
  aParentTable := 'SHAREDMETHOD';
 end; 


procedure SCRIPT_ISLOCKED /*��� ������ �� �������� ����������� ���������� �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from SCRIPT where SCRIPTid=aRowID;
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
  SCRIPT_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure SCRIPT_LOCK /*��� ������ �� �������� ����������� ���������� �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 SCRIPT_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  SCRIPT_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from SCRIPT where SCRIPTid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=SCRIPT');
    return;
  end if;
   if  aLockMode =2  
   then   
    update SCRIPT set LockUserID =auserID ,LockSessionID =null where SCRIPTid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update SCRIPT set LockUserID =null,LockSessionID =aCURSESSION  where SCRIPTid=aRowID;
     return;
   end if;
 end ;


procedure SCRIPT_HCL /*��� ������ �� �������� ����������� ���������� �����*/ (
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
declare cursor lch_PARAMETERS is select PARAMETERS.PARAMETERSid ID from PARAMETERS where  PARAMETERS.ParentStructRowID = aRowid;
row_PARAMETERS lch_PARAMETERS%ROWTYPE;
begin  
--open lch_PARAMETERS;
for row_PARAMETERS in lch_PARAMETERS
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from PARAMETERS where PARAMETERSid=row_PARAMETERS.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PARAMETERS;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_PARAMETERS;
     return;
   end if; 
 end if;  
 PARAMETERS_HCL (acursession,row_PARAMETERS.id,aisLocked);
 if aisLocked >2 then
   close lch_PARAMETERS;
   return;
 end if;
end loop;
--close lch_PARAMETERS;
end;
aIsLocked :=0;
end;


procedure SCRIPT_UNLOCK /*��� ������ �� �������� ����������� ���������� �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 SCRIPT_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update SCRIPT set LockUserID =null  where SCRIPTid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update SCRIPT set LockSessionID =null  where SCRIPTid=aRowID;
     return;
   end if;
 end; 


procedure SCRIPT_SINIT /*��� ������ �� �������� ����������� ���������� �����*/ (
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
 select  SecurityStyleID into atmpID from SCRIPT where SCRIPTid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =SCRIPT');
    return;
  end if;
if aSecurityStyleID is null then
 SCRIPT_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update SCRIPT set securitystyleid =aStyleID where SCRIPTid = aRowID;
else 
 update SCRIPT set securitystyleid =aSecurityStyleID where SCRIPTid = aRowID;
end if; 
end ; 


procedure SCRIPT_propagate /*��� ������ �� �������� ����������� ���������� �����*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from SCRIPT where SCRIPTid=aRowid;
declare cursor pch_PARAMETERS  is select PARAMETERS.PARAMETERSid ID from PARAMETERS where  PARAMETERS.ParentStructRowID = aRowid;
row_PARAMETERS  pch_PARAMETERS%ROWTYPE;
begin
--open pch_PARAMETERS;
for row_PARAMETERS in pch_PARAMETERS loop
   PARAMETERS_SINIT( acursession,row_PARAMETERS.id,assid);
   PARAMETERS_propagate( acursession,row_PARAMETERS.id);
end loop;
--close pch_PARAMETERS;
end;
end;



procedure PARAMETERS_BRIEF  (
 aCURSESSION CHAR,
 aPARAMETERSid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aPARAMETERSid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PARAMETERS where PARAMETERSID=aPARAMETERSID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PARAMETERS where PARAMETERSid=aPARAMETERSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PARAMETERS');
    return;
  end if;
  aBRIEF:=func.PARAMETERS_BRIEF_F(aPARAMETERSid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PARAMETERS_DELETE /*��������� ������*/ (
 aCURSESSION CHAR,
 aPARAMETERSid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from PARAMETERS where PARAMETERSID=aPARAMETERSID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PARAMETERS where PARAMETERSid=aPARAMETERSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PARAMETERS',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=PARAMETERS');
      return;
    end if;
  end if;
 --  verify lock  --
 PARAMETERS_ISLOCKED( acursession=>acursession,aROWID=>aPARAMETERSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=PARAMETERS');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PARAMETERS',
 aVERB=>'DELETEROW',  aThe_Resource=>aPARAMETERSid, aLogInstanceID=>aInstanceID);
declare cursor chld_PARAMETERS is select  instanceid ID from instance where OwnerPartName ='PARAMETERS' and OwnerRowID=aPARAMETERSid;
row_PARAMETERS  chld_PARAMETERS%ROWTYPE;
begin
--open chld_PARAMETERS;
for row_PARAMETERS in chld_PARAMETERS loop
 Kernel.INSTANCE_OWNER (acursession,row_PARAMETERS.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PARAMETERS.id);
end loop;
--close chld_PARAMETERS;
end ;
  delete from  PARAMETERS 
  where  PARAMETERSID = aPARAMETERSID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*���������*/
procedure PARAMETERS_SAVE /*��������� ������*/ (
 aCURSESSION CHAR,
 aPARAMETERSid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,asequence
 NUMBER/* ������������������ *//* ������������������ */
,aName
 VARCHAR2/* ��� *//* ��� */
,aCaption
 VARCHAR2 := null /* ��������� *//* ��������� */
,aTypeOfParm CHAR/* ��� ������ *//* ��� ������ */
,aDataSize
 NUMBER := null /* ������ *//* ������ */
,aAllowNull
 NUMBER/* ����� �� �������� *//* ����� �� �������� */
,aOutParam
 NUMBER/* ���������� �������� *//* ���������� �������� */
,aReferenceType
 NUMBER/* ��� ������ *//* ��� ������ */
,aRefToType CHAR := null /* ������ �� ��� *//* ������ �� ��� */
,aRefToPart CHAR := null /* ������ �� ������ *//* ������ �� ������ */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from PARAMETERS where PARAMETERSID=aPARAMETERSID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PARAMETERS where PARAMETERSid=aPARAMETERSID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PARAMETERS',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=PARAMETERS');
      return;
    end if;
  end if;
 --  verify lock  --
 PARAMETERS_ISLOCKED( acursession=>acursession,aROWID=>aPARAMETERSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=PARAMETERS');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PARAMETERS',
 aVERB=>'EDITROW',  aThe_Resource=>aPARAMETERSid,aLogInstanceID=>aInstanceID);
 update  PARAMETERS set ChangeStamp=sysdate
,
  sequence=asequence
,
  Name=aName
,
  Caption=aCaption
,
  TypeOfParm=aTypeOfParm
,
  DataSize=aDataSize
,
  AllowNull=aAllowNull
,
  OutParam=aOutParam
,
  ReferenceType=aReferenceType
,
  RefToType=aRefToType
,
  RefToPart=aRefToPart
  where  PARAMETERSID = aPARAMETERSID; 
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from PARAMETERS where ParentStructRowID=aParentStructRowID 
 and sequence=asequence;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'��������� ������������ ��������� �����. ������=PARAMETERS');
 return;
end if;
select Count(*) into aUniqueRowCount from PARAMETERS where ParentStructRowID=aParentStructRowID 
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'��������� ������������ ��������� �����. ������=PARAMETERS');
 return;
end if;

 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from SCRIPT where SCRIPTid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PARAMETERS',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=PARAMETERS');
      return;
    end if;
 end if;
 SCRIPT_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=PARAMETERS');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PARAMETERS',
 aVERB=>'CREATEROW',  aThe_Resource=>aPARAMETERSid,aLogInstanceID=>aInstanceID);
 insert into   PARAMETERS
 (  PARAMETERSID 
,ParentStructRowID
,sequence

,Name

,Caption

,TypeOfParm

,DataSize

,AllowNull

,OutParam

,ReferenceType

,RefToType

,RefToPart

 ) values ( aPARAMETERSID 
,aParentStructRowID
,asequence

,aName

,aCaption

,aTypeOfParm

,aDataSize

,aAllowNull

,aOutParam

,aReferenceType

,aRefToType

,aRefToPart

 ); 
 PARAMETERS_SINIT( aCURSESSION,aPARAMETERSid,atmpid);
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from PARAMETERS where ParentStructRowID=aParentStructRowID 
 and sequence=asequence;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'��������� ������������ ��������� �����. ������=PARAMETERS');
 return;
end if;
select Count(*) into aUniqueRowCount from PARAMETERS where ParentStructRowID=aParentStructRowID 
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'��������� ������������ ��������� �����. ������=PARAMETERS');
 return;
end if;

 end if;
 -- close transaction --
 end; 


procedure PARAMETERS_PARENT /*��������� ������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from PARAMETERS where  PARAMETERSid=aRowID;
  aParentTable := 'SCRIPT';
 end; 


procedure PARAMETERS_ISLOCKED /*��������� ������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PARAMETERS where PARAMETERSid=aRowID;
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
  PARAMETERS_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PARAMETERS_LOCK /*��������� ������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 PARAMETERS_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  PARAMETERS_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PARAMETERS where PARAMETERSid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=PARAMETERS');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PARAMETERS set LockUserID =auserID ,LockSessionID =null where PARAMETERSid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PARAMETERS set LockUserID =null,LockSessionID =aCURSESSION  where PARAMETERSid=aRowID;
     return;
   end if;
 end ;


procedure PARAMETERS_HCL /*��������� ������*/ (
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


procedure PARAMETERS_UNLOCK /*��������� ������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 PARAMETERS_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PARAMETERS set LockUserID =null  where PARAMETERSid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PARAMETERS set LockSessionID =null  where PARAMETERSid=aRowID;
     return;
   end if;
 end; 


procedure PARAMETERS_SINIT /*��������� ������*/ (
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
 select  SecurityStyleID into atmpID from PARAMETERS where PARAMETERSid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =PARAMETERS');
    return;
  end if;
if aSecurityStyleID is null then
 PARAMETERS_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PARAMETERS set securitystyleid =aStyleID where PARAMETERSid = aRowID;
else 
 update PARAMETERS set securitystyleid =aSecurityStyleID where PARAMETERSid = aRowID;
end if; 
end ; 


procedure PARAMETERS_propagate /*��������� ������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PARAMETERS where PARAMETERSid=aRowid;
end;



procedure OBJECTTYPE_BRIEF  (
 aCURSESSION CHAR,
 aOBJECTTYPEid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aOBJECTTYPEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from OBJECTTYPE where OBJECTTYPEID=aOBJECTTYPEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from OBJECTTYPE where OBJECTTYPEid=aOBJECTTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=OBJECTTYPE');
    return;
  end if;
  aBRIEF:=func.OBJECTTYPE_BRIEF_F(aOBJECTTYPEid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure OBJECTTYPE_DELETE /*��� ������� (��������)*/ (
 aCURSESSION CHAR,
 aOBJECTTYPEid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from OBJECTTYPE where OBJECTTYPEID=aOBJECTTYPEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from OBJECTTYPE where OBJECTTYPEid=aOBJECTTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:OBJECTTYPE',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=OBJECTTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 OBJECTTYPE_ISLOCKED( acursession=>acursession,aROWID=>aOBJECTTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=OBJECTTYPE');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_PART is select PART.PARTid ID from PART where  PART.ParentStructRowID = aOBJECTTYPEid;
    child_PART_rec  child_PART%ROWTYPE;
    begin
    --open child_PART;
      for child_PART_rec in child_PART loop
      PART_DELETE (acursession,child_PART_rec.id,aInstanceid);
      end loop;
      --close child_PART;
    end ;
    declare cursor child_INSTANCEVALIDATOR is select INSTANCEVALIDATOR.INSTANCEVALIDATORid ID from INSTANCEVALIDATOR where  INSTANCEVALIDATOR.ParentStructRowID = aOBJECTTYPEid;
    child_INSTANCEVALIDATOR_rec  child_INSTANCEVALIDATOR%ROWTYPE;
    begin
    --open child_INSTANCEVALIDATOR;
      for child_INSTANCEVALIDATOR_rec in child_INSTANCEVALIDATOR loop
      INSTANCEVALIDATOR_DELETE (acursession,child_INSTANCEVALIDATOR_rec.id,aInstanceid);
      end loop;
      --close child_INSTANCEVALIDATOR;
    end ;
    declare cursor child_OBJSTATUS is select OBJSTATUS.OBJSTATUSid ID from OBJSTATUS where  OBJSTATUS.ParentStructRowID = aOBJECTTYPEid;
    child_OBJSTATUS_rec  child_OBJSTATUS%ROWTYPE;
    begin
    --open child_OBJSTATUS;
      for child_OBJSTATUS_rec in child_OBJSTATUS loop
      OBJSTATUS_DELETE (acursession,child_OBJSTATUS_rec.id,aInstanceid);
      end loop;
      --close child_OBJSTATUS;
    end ;
    declare cursor child_OBJECTMODE is select OBJECTMODE.OBJECTMODEid ID from OBJECTMODE where  OBJECTMODE.ParentStructRowID = aOBJECTTYPEid;
    child_OBJECTMODE_rec  child_OBJECTMODE%ROWTYPE;
    begin
    --open child_OBJECTMODE;
      for child_OBJECTMODE_rec in child_OBJECTMODE loop
      OBJECTMODE_DELETE (acursession,child_OBJECTMODE_rec.id,aInstanceid);
      end loop;
      --close child_OBJECTMODE;
    end ;
    declare cursor child_TYPEMENU is select TYPEMENU.TYPEMENUid ID from TYPEMENU where  TYPEMENU.ParentStructRowID = aOBJECTTYPEid;
    child_TYPEMENU_rec  child_TYPEMENU%ROWTYPE;
    begin
    --open child_TYPEMENU;
      for child_TYPEMENU_rec in child_TYPEMENU loop
      TYPEMENU_DELETE (acursession,child_TYPEMENU_rec.id,aInstanceid);
      end loop;
      --close child_TYPEMENU;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'OBJECTTYPE',
 aVERB=>'DELETEROW',  aThe_Resource=>aOBJECTTYPEid, aLogInstanceID=>aInstanceID);
declare cursor chld_OBJECTTYPE is select  instanceid ID from instance where OwnerPartName ='OBJECTTYPE' and OwnerRowID=aOBJECTTYPEid;
row_OBJECTTYPE  chld_OBJECTTYPE%ROWTYPE;
begin
--open chld_OBJECTTYPE;
for row_OBJECTTYPE in chld_OBJECTTYPE loop
 Kernel.INSTANCE_OWNER (acursession,row_OBJECTTYPE.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_OBJECTTYPE.id);
end loop;
--close chld_OBJECTTYPE;
end ;
  delete from  OBJECTTYPE 
  where  OBJECTTYPEID = aOBJECTTYPEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*��� �������*/
procedure OBJECTTYPE_SAVE /*��� ������� (��������)*/ (
 aCURSESSION CHAR,
 aOBJECTTYPEid CHAR,
aInstanceID CHAR 
,aPackage CHAR/* ���������� *//* ���������� */
,athe_Comment
 VARCHAR2 := null /* �������� *//* �������� */
,aName
 VARCHAR2/* ��� *//* ��� */
,aIsSingleInstance
 NUMBER/* ����������� ������ ���� ������ *//* ����������� ������ ���� ������ */
,aChooseView CHAR := null /* ������������� ��� ������ *//* ������������� ��� ������ */
,aOnRun CHAR := null /* ��� ������� *//* ��� ������� */
,aOnCreate CHAR := null /* ��� �������� *//* ��� �������� */
,aOnDelete CHAR := null /* ��� �������� *//* ��� �������� */
,aAllowRefToObject
 NUMBER := null /* ���������� ��� ������ ������ *//* ���������� ��� ������ ������ */
,aAllowSearch
 NUMBER := null /* ���������� ��� ������ *//* ���������� ��� ������ */
,aReplicaType
 NUMBER := null /* ��� ���������� *//* ��� ���������� */
,aTheComment VARCHAR2 := null /* �������� *//* �������� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from OBJECTTYPE where OBJECTTYPEID=aOBJECTTYPEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from OBJECTTYPE where OBJECTTYPEid=aOBJECTTYPEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:OBJECTTYPE',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=OBJECTTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 OBJECTTYPE_ISLOCKED( acursession=>acursession,aROWID=>aOBJECTTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=OBJECTTYPE');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'OBJECTTYPE',
 aVERB=>'EDITROW',  aThe_Resource=>aOBJECTTYPEid,aLogInstanceID=>aInstanceID);
 update  OBJECTTYPE set ChangeStamp=sysdate
,
  Package=aPackage
,
  the_Comment=athe_Comment
,
  Name=aName
,
  IsSingleInstance=aIsSingleInstance
,
  ChooseView=aChooseView
,
  OnRun=aOnRun
,
  OnCreate=aOnCreate
,
  OnDelete=aOnDelete
,
  AllowRefToObject=aAllowRefToObject
,
  AllowSearch=aAllowSearch
,
  ReplicaType=aReplicaType
,
  TheComment=aTheComment
  where  OBJECTTYPEID = aOBJECTTYPEID; 
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from OBJECTTYPE where 1=1  
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'��������� ������������ ��������� �����. ������=OBJECTTYPE');
 return;
end if;

 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:OBJECTTYPE',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=OBJECTTYPE');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=OBJECTTYPE');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'OBJECTTYPE',
 aVERB=>'CREATEROW',  aThe_Resource=>aOBJECTTYPEid,aLogInstanceID=>aInstanceID);
 insert into   OBJECTTYPE
 (  OBJECTTYPEID 
,InstanceID
,Package

,the_Comment

,Name

,IsSingleInstance

,ChooseView

,OnRun

,OnCreate

,OnDelete

,AllowRefToObject

,AllowSearch

,ReplicaType

,TheComment

 ) values ( aOBJECTTYPEID 
,aInstanceID
,aPackage

,athe_Comment

,aName

,aIsSingleInstance

,aChooseView

,aOnRun

,aOnCreate

,aOnDelete

,aAllowRefToObject

,aAllowSearch

,aReplicaType

,aTheComment

 ); 
 OBJECTTYPE_SINIT( aCURSESSION,aOBJECTTYPEid,atmpid);
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from OBJECTTYPE where 1=1  
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'��������� ������������ ��������� �����. ������=OBJECTTYPE');
 return;
end if;

 end if;
 -- close transaction --
 end; 


procedure OBJECTTYPE_PARENT /*��� ������� (��������)*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  aParentTable := 'INSTANCE';
  select  INSTANCEID into aParentID from OBJECTTYPE where  OBJECTTYPEid=aRowID;
 end; 


procedure OBJECTTYPE_ISLOCKED /*��� ������� (��������)*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from OBJECTTYPE where OBJECTTYPEid=aRowID;
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
  OBJECTTYPE_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure OBJECTTYPE_LOCK /*��� ������� (��������)*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 OBJECTTYPE_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  OBJECTTYPE_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from OBJECTTYPE where OBJECTTYPEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=OBJECTTYPE');
    return;
  end if;
   if  aLockMode =2  
   then   
    update OBJECTTYPE set LockUserID =auserID ,LockSessionID =null where OBJECTTYPEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update OBJECTTYPE set LockUserID =null,LockSessionID =aCURSESSION  where OBJECTTYPEid=aRowID;
     return;
   end if;
 end ;


procedure OBJECTTYPE_HCL /*��� ������� (��������)*/ (
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
declare cursor lch_PART is select PART.PARTid ID from PART where  PART.ParentStructRowID = aRowid;
row_PART lch_PART%ROWTYPE;
begin  
--open lch_PART;
for row_PART in lch_PART
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from PART where PARTid=row_PART.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PART;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_PART;
     return;
   end if; 
 end if;  
 PART_HCL (acursession,row_PART.id,aisLocked);
 if aisLocked >2 then
   close lch_PART;
   return;
 end if;
end loop;
--close lch_PART;
end;
declare cursor lch_INSTANCEVALIDATOR is select INSTANCEVALIDATOR.INSTANCEVALIDATORid ID from INSTANCEVALIDATOR where  INSTANCEVALIDATOR.ParentStructRowID = aRowid;
row_INSTANCEVALIDATOR lch_INSTANCEVALIDATOR%ROWTYPE;
begin  
--open lch_INSTANCEVALIDATOR;
for row_INSTANCEVALIDATOR in lch_INSTANCEVALIDATOR
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from INSTANCEVALIDATOR where INSTANCEVALIDATORid=row_INSTANCEVALIDATOR.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_INSTANCEVALIDATOR;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_INSTANCEVALIDATOR;
     return;
   end if; 
 end if;  
 INSTANCEVALIDATOR_HCL (acursession,row_INSTANCEVALIDATOR.id,aisLocked);
 if aisLocked >2 then
   close lch_INSTANCEVALIDATOR;
   return;
 end if;
end loop;
--close lch_INSTANCEVALIDATOR;
end;
declare cursor lch_OBJSTATUS is select OBJSTATUS.OBJSTATUSid ID from OBJSTATUS where  OBJSTATUS.ParentStructRowID = aRowid;
row_OBJSTATUS lch_OBJSTATUS%ROWTYPE;
begin  
--open lch_OBJSTATUS;
for row_OBJSTATUS in lch_OBJSTATUS
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from OBJSTATUS where OBJSTATUSid=row_OBJSTATUS.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_OBJSTATUS;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_OBJSTATUS;
     return;
   end if; 
 end if;  
 OBJSTATUS_HCL (acursession,row_OBJSTATUS.id,aisLocked);
 if aisLocked >2 then
   close lch_OBJSTATUS;
   return;
 end if;
end loop;
--close lch_OBJSTATUS;
end;
declare cursor lch_OBJECTMODE is select OBJECTMODE.OBJECTMODEid ID from OBJECTMODE where  OBJECTMODE.ParentStructRowID = aRowid;
row_OBJECTMODE lch_OBJECTMODE%ROWTYPE;
begin  
--open lch_OBJECTMODE;
for row_OBJECTMODE in lch_OBJECTMODE
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from OBJECTMODE where OBJECTMODEid=row_OBJECTMODE.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_OBJECTMODE;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_OBJECTMODE;
     return;
   end if; 
 end if;  
 OBJECTMODE_HCL (acursession,row_OBJECTMODE.id,aisLocked);
 if aisLocked >2 then
   close lch_OBJECTMODE;
   return;
 end if;
end loop;
--close lch_OBJECTMODE;
end;
declare cursor lch_TYPEMENU is select TYPEMENU.TYPEMENUid ID from TYPEMENU where  TYPEMENU.ParentStructRowID = aRowid;
row_TYPEMENU lch_TYPEMENU%ROWTYPE;
begin  
--open lch_TYPEMENU;
for row_TYPEMENU in lch_TYPEMENU
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from TYPEMENU where TYPEMENUid=row_TYPEMENU.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_TYPEMENU;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_TYPEMENU;
     return;
   end if; 
 end if;  
 TYPEMENU_HCL (acursession,row_TYPEMENU.id,aisLocked);
 if aisLocked >2 then
   close lch_TYPEMENU;
   return;
 end if;
end loop;
--close lch_TYPEMENU;
end;
aIsLocked :=0;
end;


procedure OBJECTTYPE_UNLOCK /*��� ������� (��������)*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 OBJECTTYPE_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update OBJECTTYPE set LockUserID =null  where OBJECTTYPEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update OBJECTTYPE set LockSessionID =null  where OBJECTTYPEid=aRowID;
     return;
   end if;
 end; 


procedure OBJECTTYPE_SINIT /*��� ������� (��������)*/ (
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
 select  SecurityStyleID into atmpID from OBJECTTYPE where OBJECTTYPEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =OBJECTTYPE');
    return;
  end if;
if aSecurityStyleID is null then
 OBJECTTYPE_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update OBJECTTYPE set securitystyleid =aStyleID where OBJECTTYPEid = aRowID;
else 
 update OBJECTTYPE set securitystyleid =aSecurityStyleID where OBJECTTYPEid = aRowID;
end if; 
end ; 


procedure OBJECTTYPE_propagate /*��� ������� (��������)*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from OBJECTTYPE where OBJECTTYPEid=aRowid;
declare cursor pch_PART  is select PART.PARTid ID from PART where  PART.ParentStructRowID = aRowid;
row_PART  pch_PART%ROWTYPE;
begin
--open pch_PART;
for row_PART in pch_PART loop
   PART_SINIT( acursession,row_PART.id,assid);
   PART_propagate( acursession,row_PART.id);
end loop;
--close pch_PART;
end;
declare cursor pch_INSTANCEVALIDATOR  is select INSTANCEVALIDATOR.INSTANCEVALIDATORid ID from INSTANCEVALIDATOR where  INSTANCEVALIDATOR.ParentStructRowID = aRowid;
row_INSTANCEVALIDATOR  pch_INSTANCEVALIDATOR%ROWTYPE;
begin
--open pch_INSTANCEVALIDATOR;
for row_INSTANCEVALIDATOR in pch_INSTANCEVALIDATOR loop
   INSTANCEVALIDATOR_SINIT( acursession,row_INSTANCEVALIDATOR.id,assid);
   INSTANCEVALIDATOR_propagate( acursession,row_INSTANCEVALIDATOR.id);
end loop;
--close pch_INSTANCEVALIDATOR;
end;
declare cursor pch_OBJSTATUS  is select OBJSTATUS.OBJSTATUSid ID from OBJSTATUS where  OBJSTATUS.ParentStructRowID = aRowid;
row_OBJSTATUS  pch_OBJSTATUS%ROWTYPE;
begin
--open pch_OBJSTATUS;
for row_OBJSTATUS in pch_OBJSTATUS loop
   OBJSTATUS_SINIT( acursession,row_OBJSTATUS.id,assid);
   OBJSTATUS_propagate( acursession,row_OBJSTATUS.id);
end loop;
--close pch_OBJSTATUS;
end;
declare cursor pch_OBJECTMODE  is select OBJECTMODE.OBJECTMODEid ID from OBJECTMODE where  OBJECTMODE.ParentStructRowID = aRowid;
row_OBJECTMODE  pch_OBJECTMODE%ROWTYPE;
begin
--open pch_OBJECTMODE;
for row_OBJECTMODE in pch_OBJECTMODE loop
   OBJECTMODE_SINIT( acursession,row_OBJECTMODE.id,assid);
   OBJECTMODE_propagate( acursession,row_OBJECTMODE.id);
end loop;
--close pch_OBJECTMODE;
end;
declare cursor pch_TYPEMENU  is select TYPEMENU.TYPEMENUid ID from TYPEMENU where  TYPEMENU.ParentStructRowID = aRowid;
row_TYPEMENU  pch_TYPEMENU%ROWTYPE;
begin
--open pch_TYPEMENU;
for row_TYPEMENU in pch_TYPEMENU loop
   TYPEMENU_SINIT( acursession,row_TYPEMENU.id,assid);
   TYPEMENU_propagate( acursession,row_TYPEMENU.id);
end loop;
--close pch_TYPEMENU;
end;
end;



procedure PART_BRIEF  (
 aCURSESSION CHAR,
 aPARTid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aPARTid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PART where PARTID=aPARTID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PART where PARTid=aPARTID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PART');
    return;
  end if;
  aBRIEF:=func.PART_BRIEF_F(aPARTid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PART_DELETE /*������ �������*/ (
 aCURSESSION CHAR,
 aPARTid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from PART where PARTID=aPARTID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PART where PARTid=aPARTID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PART',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=PART');
      return;
    end if;
  end if;
 --  verify lock  --
 PART_ISLOCKED( acursession=>acursession,aROWID=>aPARTid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=PART');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_PARTMENU is select PARTMENU.PARTMENUid ID from PARTMENU where  PARTMENU.ParentStructRowID = aPARTid;
    child_PARTMENU_rec  child_PARTMENU%ROWTYPE;
    begin
    --open child_PARTMENU;
      for child_PARTMENU_rec in child_PARTMENU loop
      PARTMENU_DELETE (acursession,child_PARTMENU_rec.id,aInstanceid);
      end loop;
      --close child_PARTMENU;
    end ;
    declare cursor child_FIELD is select FIELD.FIELDid ID from FIELD where  FIELD.ParentStructRowID = aPARTid;
    child_FIELD_rec  child_FIELD%ROWTYPE;
    begin
    --open child_FIELD;
      for child_FIELD_rec in child_FIELD loop
      FIELD_DELETE (acursession,child_FIELD_rec.id,aInstanceid);
      end loop;
      --close child_FIELD;
    end ;
    declare cursor child_PARTVIEW is select PARTVIEW.PARTVIEWid ID from PARTVIEW where  PARTVIEW.ParentStructRowID = aPARTid;
    child_PARTVIEW_rec  child_PARTVIEW%ROWTYPE;
    begin
    --open child_PARTVIEW;
      for child_PARTVIEW_rec in child_PARTVIEW loop
      PARTVIEW_DELETE (acursession,child_PARTVIEW_rec.id,aInstanceid);
      end loop;
      --close child_PARTVIEW;
    end ;
    declare cursor child_VALIDATOR is select VALIDATOR.VALIDATORid ID from VALIDATOR where  VALIDATOR.ParentStructRowID = aPARTid;
    child_VALIDATOR_rec  child_VALIDATOR%ROWTYPE;
    begin
    --open child_VALIDATOR;
      for child_VALIDATOR_rec in child_VALIDATOR loop
      VALIDATOR_DELETE (acursession,child_VALIDATOR_rec.id,aInstanceid);
      end loop;
      --close child_VALIDATOR;
    end ;
    declare cursor child_UNIQUECONSTRAINT is select UNIQUECONSTRAINT.UNIQUECONSTRAINTid ID from UNIQUECONSTRAINT where  UNIQUECONSTRAINT.ParentStructRowID = aPARTid;
    child_UNIQUECONSTRAINT_rec  child_UNIQUECONSTRAINT%ROWTYPE;
    begin
    --open child_UNIQUECONSTRAINT;
      for child_UNIQUECONSTRAINT_rec in child_UNIQUECONSTRAINT loop
      UNIQUECONSTRAINT_DELETE (acursession,child_UNIQUECONSTRAINT_rec.id,aInstanceid);
      end loop;
      --close child_UNIQUECONSTRAINT;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PART',
 aVERB=>'DELETEROW',  aThe_Resource=>aPARTid, aLogInstanceID=>aInstanceID);
declare cursor chld_PART is select  instanceid ID from instance where OwnerPartName ='PART' and OwnerRowID=aPARTid;
row_PART  chld_PART%ROWTYPE;
begin
--open chld_PART;
for row_PART in chld_PART loop
 Kernel.INSTANCE_OWNER (acursession,row_PART.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PART.id);
end loop;
--close chld_PART;
end ;
  delete from  PART 
  where  PARTID = aPARTID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*������*/
procedure PART_SAVE /*������ �������*/ (
 aCURSESSION CHAR,
 aPARTid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
, aParentRowid CHAR :=null
,aSequence
 NUMBER/* � �/� *//* � �/� */
,aPartType
 NUMBER/* ��� ��������  *//* ��� ��������  */
,aCaption
 VARCHAR2/* ��������� *//* ��������� */
,aName
 VARCHAR2/* �������� *//* �������� */
,athe_Comment VARCHAR2 := null /* �������� *//* �������� */
,aNoLog
 NUMBER/* �� ���������� � ������ *//* �� ���������� � ������ */
,aManualRegister
 NUMBER/* ��������� �� �������������� *//* ��������� �� �������������� */
,aOnCreate CHAR := null /* ��� �������� *//* ��� �������� */
,aOnSave CHAR := null /* ��� ���������� *//* ��� ���������� */
,aOnRun CHAR := null /* ��� �������� *//* ��� �������� */
,aOnDelete CHAR := null /* ��� �������� *//* ��� �������� */
,aAddBehaivor
 NUMBER := null /* ��������� ��� ���������� *//* ��������� ��� ���������� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from PART where PARTID=aPARTID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PART where PARTid=aPARTID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PART',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=PART');
      return;
    end if;
  end if;
 --  verify lock  --
 PART_ISLOCKED( acursession=>acursession,aROWID=>aPARTid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=PART');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PART',
 aVERB=>'EDITROW',  aThe_Resource=>aPARTid,aLogInstanceID=>aInstanceID);
 update  PART set ChangeStamp=sysdate
,ParentRowid= aParentRowid
,
  Sequence=aSequence
,
  PartType=aPartType
,
  Caption=aCaption
,
  Name=aName
,
  the_Comment=athe_Comment
,
  NoLog=aNoLog
,
  ManualRegister=aManualRegister
,
  OnCreate=aOnCreate
,
  OnSave=aOnSave
,
  OnRun=aOnRun
,
  OnDelete=aOnDelete
,
  AddBehaivor=aAddBehaivor
  where  PARTID = aPARTID; 
 -- checking unique constraints  --

 if aParentRowID is null then
   select Count(*) into aUniqueRowCount from PART where ParentStructRowID=aParentStructRowID and ParentRowID is null 
 and Sequence=aSequence;
 else 
   select Count(*) into aUniqueRowCount from PART where ParentStructRowID=aParentStructRowID and ParentRowID =aParentRowID 
 and Sequence=aSequence;
 end if;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'��������� ������������ ��������� �����. ������=PART');
 return;
end if;
select Count(*) into aUniqueRowCount from PART where 1=1  
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'��������� ������������ ��������� �����. ������=PART');
 return;
end if;

 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from OBJECTTYPE where OBJECTTYPEid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PART',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=PART');
      return;
    end if;
 end if;
 OBJECTTYPE_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=PART');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PART',
 aVERB=>'CREATEROW',  aThe_Resource=>aPARTid,aLogInstanceID=>aInstanceID);
 insert into   PART
 (  PARTID 
,ParentRowid
,ParentStructRowID
,Sequence

,PartType

,Caption

,Name

,the_Comment

,NoLog

,ManualRegister

,OnCreate

,OnSave

,OnRun

,OnDelete

,AddBehaivor

 ) values ( aPARTID 
,aParentRowid
,aParentStructRowID
,aSequence

,aPartType

,aCaption

,aName

,athe_Comment

,aNoLog

,aManualRegister

,aOnCreate

,aOnSave

,aOnRun

,aOnDelete

,aAddBehaivor

 ); 
 PART_SINIT( aCURSESSION,aPARTid,atmpid);
 -- checking unique constraints  --

 if aParentRowID is null then
   select Count(*) into aUniqueRowCount from PART where ParentStructRowID=aParentStructRowID and ParentRowID is null 
 and Sequence=aSequence;
 else 
   select Count(*) into aUniqueRowCount from PART where ParentStructRowID=aParentStructRowID and ParentRowID =aParentRowID 
 and Sequence=aSequence;
 end if;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'��������� ������������ ��������� �����. ������=PART');
 return;
end if;
select Count(*) into aUniqueRowCount from PART where 1=1  
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'��������� ������������ ��������� �����. ������=PART');
 return;
end if;

 end if;
 -- close transaction --
 end; 


procedure PART_PARENT /*������ �������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from PART where  PARTid=aRowID;
  aParentTable := 'OBJECTTYPE';
 end; 


procedure PART_ISLOCKED /*������ �������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PART where PARTid=aRowID;
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
  PART_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PART_LOCK /*������ �������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 PART_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  PART_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PART where PARTid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=PART');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PART set LockUserID =auserID ,LockSessionID =null where PARTid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PART set LockUserID =null,LockSessionID =aCURSESSION  where PARTid=aRowID;
     return;
   end if;
 end ;


procedure PART_HCL /*������ �������*/ (
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
declare cursor lch_PARTMENU is select PARTMENU.PARTMENUid ID from PARTMENU where  PARTMENU.ParentStructRowID = aRowid;
row_PARTMENU lch_PARTMENU%ROWTYPE;
begin  
--open lch_PARTMENU;
for row_PARTMENU in lch_PARTMENU
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from PARTMENU where PARTMENUid=row_PARTMENU.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PARTMENU;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_PARTMENU;
     return;
   end if; 
 end if;  
 PARTMENU_HCL (acursession,row_PARTMENU.id,aisLocked);
 if aisLocked >2 then
   close lch_PARTMENU;
   return;
 end if;
end loop;
--close lch_PARTMENU;
end;
declare cursor lch_FIELD is select FIELD.FIELDid ID from FIELD where  FIELD.ParentStructRowID = aRowid;
row_FIELD lch_FIELD%ROWTYPE;
begin  
--open lch_FIELD;
for row_FIELD in lch_FIELD
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from FIELD where FIELDid=row_FIELD.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_FIELD;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_FIELD;
     return;
   end if; 
 end if;  
 FIELD_HCL (acursession,row_FIELD.id,aisLocked);
 if aisLocked >2 then
   close lch_FIELD;
   return;
 end if;
end loop;
--close lch_FIELD;
end;
declare cursor lch_PARTVIEW is select PARTVIEW.PARTVIEWid ID from PARTVIEW where  PARTVIEW.ParentStructRowID = aRowid;
row_PARTVIEW lch_PARTVIEW%ROWTYPE;
begin  
--open lch_PARTVIEW;
for row_PARTVIEW in lch_PARTVIEW
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from PARTVIEW where PARTVIEWid=row_PARTVIEW.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PARTVIEW;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_PARTVIEW;
     return;
   end if; 
 end if;  
 PARTVIEW_HCL (acursession,row_PARTVIEW.id,aisLocked);
 if aisLocked >2 then
   close lch_PARTVIEW;
   return;
 end if;
end loop;
--close lch_PARTVIEW;
end;
declare cursor lch_VALIDATOR is select VALIDATOR.VALIDATORid ID from VALIDATOR where  VALIDATOR.ParentStructRowID = aRowid;
row_VALIDATOR lch_VALIDATOR%ROWTYPE;
begin  
--open lch_VALIDATOR;
for row_VALIDATOR in lch_VALIDATOR
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from VALIDATOR where VALIDATORid=row_VALIDATOR.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VALIDATOR;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_VALIDATOR;
     return;
   end if; 
 end if;  
 VALIDATOR_HCL (acursession,row_VALIDATOR.id,aisLocked);
 if aisLocked >2 then
   close lch_VALIDATOR;
   return;
 end if;
end loop;
--close lch_VALIDATOR;
end;
declare cursor lch_UNIQUECONSTRAINT is select UNIQUECONSTRAINT.UNIQUECONSTRAINTid ID from UNIQUECONSTRAINT where  UNIQUECONSTRAINT.ParentStructRowID = aRowid;
row_UNIQUECONSTRAINT lch_UNIQUECONSTRAINT%ROWTYPE;
begin  
--open lch_UNIQUECONSTRAINT;
for row_UNIQUECONSTRAINT in lch_UNIQUECONSTRAINT
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from UNIQUECONSTRAINT where UNIQUECONSTRAINTid=row_UNIQUECONSTRAINT.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_UNIQUECONSTRAINT;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_UNIQUECONSTRAINT;
     return;
   end if; 
 end if;  
 UNIQUECONSTRAINT_HCL (acursession,row_UNIQUECONSTRAINT.id,aisLocked);
 if aisLocked >2 then
   close lch_UNIQUECONSTRAINT;
   return;
 end if;
end loop;
--close lch_UNIQUECONSTRAINT;
end;
aIsLocked :=0;
end;


procedure PART_UNLOCK /*������ �������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 PART_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PART set LockUserID =null  where PARTid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PART set LockSessionID =null  where PARTid=aRowID;
     return;
   end if;
 end; 


procedure PART_SINIT /*������ �������*/ (
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
 select  SecurityStyleID into atmpID from PART where PARTid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =PART');
    return;
  end if;
if aSecurityStyleID is null then
 PART_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PART set securitystyleid =aStyleID where PARTid = aRowID;
else 
 update PART set securitystyleid =aSecurityStyleID where PARTid = aRowID;
end if; 
end ; 


procedure PART_propagate /*������ �������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PART where PARTid=aRowid;
declare cursor pch_PARTMENU  is select PARTMENU.PARTMENUid ID from PARTMENU where  PARTMENU.ParentStructRowID = aRowid;
row_PARTMENU  pch_PARTMENU%ROWTYPE;
begin
--open pch_PARTMENU;
for row_PARTMENU in pch_PARTMENU loop
   PARTMENU_SINIT( acursession,row_PARTMENU.id,assid);
   PARTMENU_propagate( acursession,row_PARTMENU.id);
end loop;
--close pch_PARTMENU;
end;
declare cursor pch_FIELD  is select FIELD.FIELDid ID from FIELD where  FIELD.ParentStructRowID = aRowid;
row_FIELD  pch_FIELD%ROWTYPE;
begin
--open pch_FIELD;
for row_FIELD in pch_FIELD loop
   FIELD_SINIT( acursession,row_FIELD.id,assid);
   FIELD_propagate( acursession,row_FIELD.id);
end loop;
--close pch_FIELD;
end;
declare cursor pch_PARTVIEW  is select PARTVIEW.PARTVIEWid ID from PARTVIEW where  PARTVIEW.ParentStructRowID = aRowid;
row_PARTVIEW  pch_PARTVIEW%ROWTYPE;
begin
--open pch_PARTVIEW;
for row_PARTVIEW in pch_PARTVIEW loop
   PARTVIEW_SINIT( acursession,row_PARTVIEW.id,assid);
   PARTVIEW_propagate( acursession,row_PARTVIEW.id);
end loop;
--close pch_PARTVIEW;
end;
declare cursor pch_VALIDATOR  is select VALIDATOR.VALIDATORid ID from VALIDATOR where  VALIDATOR.ParentStructRowID = aRowid;
row_VALIDATOR  pch_VALIDATOR%ROWTYPE;
begin
--open pch_VALIDATOR;
for row_VALIDATOR in pch_VALIDATOR loop
   VALIDATOR_SINIT( acursession,row_VALIDATOR.id,assid);
   VALIDATOR_propagate( acursession,row_VALIDATOR.id);
end loop;
--close pch_VALIDATOR;
end;
declare cursor pch_UNIQUECONSTRAINT  is select UNIQUECONSTRAINT.UNIQUECONSTRAINTid ID from UNIQUECONSTRAINT where  UNIQUECONSTRAINT.ParentStructRowID = aRowid;
row_UNIQUECONSTRAINT  pch_UNIQUECONSTRAINT%ROWTYPE;
begin
--open pch_UNIQUECONSTRAINT;
for row_UNIQUECONSTRAINT in pch_UNIQUECONSTRAINT loop
   UNIQUECONSTRAINT_SINIT( acursession,row_UNIQUECONSTRAINT.id,assid);
   UNIQUECONSTRAINT_propagate( acursession,row_UNIQUECONSTRAINT.id);
end loop;
--close pch_UNIQUECONSTRAINT;
end;
end;



procedure PARTMENU_BRIEF  (
 aCURSESSION CHAR,
 aPARTMENUid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aPARTMENUid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PARTMENU where PARTMENUID=aPARTMENUID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PARTMENU where PARTMENUid=aPARTMENUID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PARTMENU');
    return;
  end if;
  aBRIEF:=func.PARTMENU_BRIEF_F(aPARTMENUid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PARTMENU_DELETE /*������ ������ �������*/ (
 aCURSESSION CHAR,
 aPARTMENUid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from PARTMENU where PARTMENUID=aPARTMENUID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PARTMENU where PARTMENUid=aPARTMENUID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PARTMENU',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=PARTMENU');
      return;
    end if;
  end if;
 --  verify lock  --
 PARTMENU_ISLOCKED( acursession=>acursession,aROWID=>aPARTMENUid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=PARTMENU');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_PARTPARAMMAP is select PARTPARAMMAP.PARTPARAMMAPid ID from PARTPARAMMAP where  PARTPARAMMAP.ParentStructRowID = aPARTMENUid;
    child_PARTPARAMMAP_rec  child_PARTPARAMMAP%ROWTYPE;
    begin
    --open child_PARTPARAMMAP;
      for child_PARTPARAMMAP_rec in child_PARTPARAMMAP loop
      PARTPARAMMAP_DELETE (acursession,child_PARTPARAMMAP_rec.id,aInstanceid);
      end loop;
      --close child_PARTPARAMMAP;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PARTMENU',
 aVERB=>'DELETEROW',  aThe_Resource=>aPARTMENUid, aLogInstanceID=>aInstanceID);
declare cursor chld_PARTMENU is select  instanceid ID from instance where OwnerPartName ='PARTMENU' and OwnerRowID=aPARTMENUid;
row_PARTMENU  chld_PARTMENU%ROWTYPE;
begin
--open chld_PARTMENU;
for row_PARTMENU in chld_PARTMENU loop
 Kernel.INSTANCE_OWNER (acursession,row_PARTMENU.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PARTMENU.id);
end loop;
--close chld_PARTMENU;
end ;
  delete from  PARTMENU 
  where  PARTMENUID = aPARTMENUID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*������ �������*/
procedure PARTMENU_SAVE /*������ ������ �������*/ (
 aCURSESSION CHAR,
 aPARTMENUid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2 := null /* �������� *//* �������� */
,aCaption
 VARCHAR2 := null /* ��������� *//* ��������� */
,aToolTip
 VARCHAR2 := null /* ��������� *//* ��������� */
,athe_Action CHAR := null /* ����� *//* ����� */
,aIsMenuItem
 NUMBER := null /* �������� � ���� *//* �������� � ���� */
,aIsToolBarButton
 NUMBER := null /* � ������ *//* � ������ */
,aHotKey
 VARCHAR2 := null /* ������� ������� *//* ������� ������� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from PARTMENU where PARTMENUID=aPARTMENUID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PARTMENU where PARTMENUid=aPARTMENUID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PARTMENU',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=PARTMENU');
      return;
    end if;
  end if;
 --  verify lock  --
 PARTMENU_ISLOCKED( acursession=>acursession,aROWID=>aPARTMENUid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=PARTMENU');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PARTMENU',
 aVERB=>'EDITROW',  aThe_Resource=>aPARTMENUid,aLogInstanceID=>aInstanceID);
 update  PARTMENU set ChangeStamp=sysdate
,
  Name=aName
,
  Caption=aCaption
,
  ToolTip=aToolTip
,
  the_Action=athe_Action
,
  IsMenuItem=aIsMenuItem
,
  IsToolBarButton=aIsToolBarButton
,
  HotKey=aHotKey
  where  PARTMENUID = aPARTMENUID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from PART where PARTid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PARTMENU',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=PARTMENU');
      return;
    end if;
 end if;
 PART_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=PARTMENU');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PARTMENU',
 aVERB=>'CREATEROW',  aThe_Resource=>aPARTMENUid,aLogInstanceID=>aInstanceID);
 insert into   PARTMENU
 (  PARTMENUID 
,ParentStructRowID
,Name

,Caption

,ToolTip

,the_Action

,IsMenuItem

,IsToolBarButton

,HotKey

 ) values ( aPARTMENUID 
,aParentStructRowID
,aName

,aCaption

,aToolTip

,athe_Action

,aIsMenuItem

,aIsToolBarButton

,aHotKey

 ); 
 PARTMENU_SINIT( aCURSESSION,aPARTMENUid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PARTMENU_PARENT /*������ ������ �������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from PARTMENU where  PARTMENUid=aRowID;
  aParentTable := 'PART';
 end; 


procedure PARTMENU_ISLOCKED /*������ ������ �������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PARTMENU where PARTMENUid=aRowID;
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
  PARTMENU_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PARTMENU_LOCK /*������ ������ �������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 PARTMENU_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  PARTMENU_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PARTMENU where PARTMENUid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=PARTMENU');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PARTMENU set LockUserID =auserID ,LockSessionID =null where PARTMENUid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PARTMENU set LockUserID =null,LockSessionID =aCURSESSION  where PARTMENUid=aRowID;
     return;
   end if;
 end ;


procedure PARTMENU_HCL /*������ ������ �������*/ (
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
declare cursor lch_PARTPARAMMAP is select PARTPARAMMAP.PARTPARAMMAPid ID from PARTPARAMMAP where  PARTPARAMMAP.ParentStructRowID = aRowid;
row_PARTPARAMMAP lch_PARTPARAMMAP%ROWTYPE;
begin  
--open lch_PARTPARAMMAP;
for row_PARTPARAMMAP in lch_PARTPARAMMAP
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from PARTPARAMMAP where PARTPARAMMAPid=row_PARTPARAMMAP.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PARTPARAMMAP;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_PARTPARAMMAP;
     return;
   end if; 
 end if;  
 PARTPARAMMAP_HCL (acursession,row_PARTPARAMMAP.id,aisLocked);
 if aisLocked >2 then
   close lch_PARTPARAMMAP;
   return;
 end if;
end loop;
--close lch_PARTPARAMMAP;
end;
aIsLocked :=0;
end;


procedure PARTMENU_UNLOCK /*������ ������ �������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 PARTMENU_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PARTMENU set LockUserID =null  where PARTMENUid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PARTMENU set LockSessionID =null  where PARTMENUid=aRowID;
     return;
   end if;
 end; 


procedure PARTMENU_SINIT /*������ ������ �������*/ (
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
 select  SecurityStyleID into atmpID from PARTMENU where PARTMENUid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =PARTMENU');
    return;
  end if;
if aSecurityStyleID is null then
 PARTMENU_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PARTMENU set securitystyleid =aStyleID where PARTMENUid = aRowID;
else 
 update PARTMENU set securitystyleid =aSecurityStyleID where PARTMENUid = aRowID;
end if; 
end ; 


procedure PARTMENU_propagate /*������ ������ �������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PARTMENU where PARTMENUid=aRowid;
declare cursor pch_PARTPARAMMAP  is select PARTPARAMMAP.PARTPARAMMAPid ID from PARTPARAMMAP where  PARTPARAMMAP.ParentStructRowID = aRowid;
row_PARTPARAMMAP  pch_PARTPARAMMAP%ROWTYPE;
begin
--open pch_PARTPARAMMAP;
for row_PARTPARAMMAP in pch_PARTPARAMMAP loop
   PARTPARAMMAP_SINIT( acursession,row_PARTPARAMMAP.id,assid);
   PARTPARAMMAP_propagate( acursession,row_PARTPARAMMAP.id);
end loop;
--close pch_PARTPARAMMAP;
end;
end;



procedure PARTPARAMMAP_BRIEF  (
 aCURSESSION CHAR,
 aPARTPARAMMAPid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aPARTPARAMMAPid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PARTPARAMMAP where PARTPARAMMAPID=aPARTPARAMMAPID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PARTPARAMMAP where PARTPARAMMAPid=aPARTPARAMMAPID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PARTPARAMMAP');
    return;
  end if;
  aBRIEF:=func.PARTPARAMMAP_BRIEF_F(aPARTPARAMMAPid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PARTPARAMMAP_DELETE /*����������� �������� ����� ������� �� ��������� ������*/ (
 aCURSESSION CHAR,
 aPARTPARAMMAPid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from PARTPARAMMAP where PARTPARAMMAPID=aPARTPARAMMAPID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PARTPARAMMAP where PARTPARAMMAPid=aPARTPARAMMAPID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PARTPARAMMAP',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=PARTPARAMMAP');
      return;
    end if;
  end if;
 --  verify lock  --
 PARTPARAMMAP_ISLOCKED( acursession=>acursession,aROWID=>aPARTPARAMMAPid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=PARTPARAMMAP');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PARTPARAMMAP',
 aVERB=>'DELETEROW',  aThe_Resource=>aPARTPARAMMAPid, aLogInstanceID=>aInstanceID);
declare cursor chld_PARTPARAMMAP is select  instanceid ID from instance where OwnerPartName ='PARTPARAMMAP' and OwnerRowID=aPARTPARAMMAPid;
row_PARTPARAMMAP  chld_PARTPARAMMAP%ROWTYPE;
begin
--open chld_PARTPARAMMAP;
for row_PARTPARAMMAP in chld_PARTPARAMMAP loop
 Kernel.INSTANCE_OWNER (acursession,row_PARTPARAMMAP.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PARTPARAMMAP.id);
end loop;
--close chld_PARTPARAMMAP;
end ;
  delete from  PARTPARAMMAP 
  where  PARTPARAMMAPID = aPARTPARAMMAPID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*����������� ����������*/
procedure PARTPARAMMAP_SAVE /*����������� �������� ����� ������� �� ��������� ������*/ (
 aCURSESSION CHAR,
 aPARTPARAMMAPid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aFieldName
 VARCHAR2/* ���� (��������) *//* ���� (��������) */
,aParamName
 VARCHAR2/* �������� *//* �������� */
,aNoEdit
 NUMBER/* ������������� �������� ������ *//* ������������� �������� ������ */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from PARTPARAMMAP where PARTPARAMMAPID=aPARTPARAMMAPID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PARTPARAMMAP where PARTPARAMMAPid=aPARTPARAMMAPID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PARTPARAMMAP',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=PARTPARAMMAP');
      return;
    end if;
  end if;
 --  verify lock  --
 PARTPARAMMAP_ISLOCKED( acursession=>acursession,aROWID=>aPARTPARAMMAPid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=PARTPARAMMAP');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PARTPARAMMAP',
 aVERB=>'EDITROW',  aThe_Resource=>aPARTPARAMMAPid,aLogInstanceID=>aInstanceID);
 update  PARTPARAMMAP set ChangeStamp=sysdate
,
  FieldName=aFieldName
,
  ParamName=aParamName
,
  NoEdit=aNoEdit
  where  PARTPARAMMAPID = aPARTPARAMMAPID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from PARTMENU where PARTMENUid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PARTPARAMMAP',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=PARTPARAMMAP');
      return;
    end if;
 end if;
 PARTMENU_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=PARTPARAMMAP');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PARTPARAMMAP',
 aVERB=>'CREATEROW',  aThe_Resource=>aPARTPARAMMAPid,aLogInstanceID=>aInstanceID);
 insert into   PARTPARAMMAP
 (  PARTPARAMMAPID 
,ParentStructRowID
,FieldName

,ParamName

,NoEdit

 ) values ( aPARTPARAMMAPID 
,aParentStructRowID
,aFieldName

,aParamName

,aNoEdit

 ); 
 PARTPARAMMAP_SINIT( aCURSESSION,aPARTPARAMMAPid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PARTPARAMMAP_PARENT /*����������� �������� ����� ������� �� ��������� ������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from PARTPARAMMAP where  PARTPARAMMAPid=aRowID;
  aParentTable := 'PARTMENU';
 end; 


procedure PARTPARAMMAP_ISLOCKED /*����������� �������� ����� ������� �� ��������� ������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PARTPARAMMAP where PARTPARAMMAPid=aRowID;
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
  PARTPARAMMAP_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PARTPARAMMAP_LOCK /*����������� �������� ����� ������� �� ��������� ������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 PARTPARAMMAP_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  PARTPARAMMAP_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PARTPARAMMAP where PARTPARAMMAPid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=PARTPARAMMAP');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PARTPARAMMAP set LockUserID =auserID ,LockSessionID =null where PARTPARAMMAPid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PARTPARAMMAP set LockUserID =null,LockSessionID =aCURSESSION  where PARTPARAMMAPid=aRowID;
     return;
   end if;
 end ;


procedure PARTPARAMMAP_HCL /*����������� �������� ����� ������� �� ��������� ������*/ (
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


procedure PARTPARAMMAP_UNLOCK /*����������� �������� ����� ������� �� ��������� ������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 PARTPARAMMAP_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PARTPARAMMAP set LockUserID =null  where PARTPARAMMAPid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PARTPARAMMAP set LockSessionID =null  where PARTPARAMMAPid=aRowID;
     return;
   end if;
 end; 


procedure PARTPARAMMAP_SINIT /*����������� �������� ����� ������� �� ��������� ������*/ (
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
 select  SecurityStyleID into atmpID from PARTPARAMMAP where PARTPARAMMAPid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =PARTPARAMMAP');
    return;
  end if;
if aSecurityStyleID is null then
 PARTPARAMMAP_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PARTPARAMMAP set securitystyleid =aStyleID where PARTPARAMMAPid = aRowID;
else 
 update PARTPARAMMAP set securitystyleid =aSecurityStyleID where PARTPARAMMAPid = aRowID;
end if; 
end ; 


procedure PARTPARAMMAP_propagate /*����������� �������� ����� ������� �� ��������� ������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PARTPARAMMAP where PARTPARAMMAPid=aRowid;
end;



procedure FIELD_BRIEF  (
 aCURSESSION CHAR,
 aFIELDid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aFIELDid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from FIELD where FIELDID=aFIELDID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from FIELD where FIELDid=aFIELDID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=FIELD');
    return;
  end if;
  aBRIEF:=func.FIELD_BRIEF_F(aFIELDid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure FIELD_DELETE /*����*/ (
 aCURSESSION CHAR,
 aFIELDid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from FIELD where FIELDID=aFIELDID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from FIELD where FIELDid=aFIELDID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:FIELD',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=FIELD');
      return;
    end if;
  end if;
 --  verify lock  --
 FIELD_ISLOCKED( acursession=>acursession,aROWID=>aFIELDid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=FIELD');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_FIELDVALIDATOR is select FIELDVALIDATOR.FIELDVALIDATORid ID from FIELDVALIDATOR where  FIELDVALIDATOR.ParentStructRowID = aFIELDid;
    child_FIELDVALIDATOR_rec  child_FIELDVALIDATOR%ROWTYPE;
    begin
    --open child_FIELDVALIDATOR;
      for child_FIELDVALIDATOR_rec in child_FIELDVALIDATOR loop
      FIELDVALIDATOR_DELETE (acursession,child_FIELDVALIDATOR_rec.id,aInstanceid);
      end loop;
      --close child_FIELDVALIDATOR;
    end ;
    declare cursor child_FIELDMENU is select FIELDMENU.FIELDMENUid ID from FIELDMENU where  FIELDMENU.ParentStructRowID = aFIELDid;
    child_FIELDMENU_rec  child_FIELDMENU%ROWTYPE;
    begin
    --open child_FIELDMENU;
      for child_FIELDMENU_rec in child_FIELDMENU loop
      FIELDMENU_DELETE (acursession,child_FIELDMENU_rec.id,aInstanceid);
      end loop;
      --close child_FIELDMENU;
    end ;
    declare cursor child_FIELDEXPRESSION is select FIELDEXPRESSION.FIELDEXPRESSIONid ID from FIELDEXPRESSION where  FIELDEXPRESSION.ParentStructRowID = aFIELDid;
    child_FIELDEXPRESSION_rec  child_FIELDEXPRESSION%ROWTYPE;
    begin
    --open child_FIELDEXPRESSION;
      for child_FIELDEXPRESSION_rec in child_FIELDEXPRESSION loop
      FIELDEXPRESSION_DELETE (acursession,child_FIELDEXPRESSION_rec.id,aInstanceid);
      end loop;
      --close child_FIELDEXPRESSION;
    end ;
    declare cursor child_DINAMICFILTERSCRIPT is select DINAMICFILTERSCRIPT.DINAMICFILTERSCRIPTid ID from DINAMICFILTERSCRIPT where  DINAMICFILTERSCRIPT.ParentStructRowID = aFIELDid;
    child_DINAMICFILTERSCRIPT_rec  child_DINAMICFILTERSCRIPT%ROWTYPE;
    begin
    --open child_DINAMICFILTERSCRIPT;
      for child_DINAMICFILTERSCRIPT_rec in child_DINAMICFILTERSCRIPT loop
      DINAMICFILTERSCRIPT_DELETE (acursession,child_DINAMICFILTERSCRIPT_rec.id,aInstanceid);
      end loop;
      --close child_DINAMICFILTERSCRIPT;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'FIELD',
 aVERB=>'DELETEROW',  aThe_Resource=>aFIELDid, aLogInstanceID=>aInstanceID);
declare cursor chld_FIELD is select  instanceid ID from instance where OwnerPartName ='FIELD' and OwnerRowID=aFIELDid;
row_FIELD  chld_FIELD%ROWTYPE;
begin
--open chld_FIELD;
for row_FIELD in chld_FIELD loop
 Kernel.INSTANCE_OWNER (acursession,row_FIELD.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_FIELD.id);
end loop;
--close chld_FIELD;
end ;
  delete from  FIELD 
  where  FIELDID = aFIELDID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*����*/
procedure FIELD_SAVE /*����*/ (
 aCURSESSION CHAR,
 aFIELDid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aSequence
 NUMBER/* � �/� *//* � �/� */
,aCaption
 VARCHAR2/* ������� *//* ������� */
,aName
 VARCHAR2/* ��� ���� *//* ��� ���� */
,aFieldType CHAR/* ��� ���� *//* ��� ���� */
,aIsBrief
 NUMBER/* ������� ���������� *//* ������� ���������� */
,aAllowNull
 NUMBER/* ����� ���� ������ *//* ����� ���� ������ */
,aDataSize
 NUMBER := null /* ������ ���� *//* ������ ���� */
,aReferenceType
 NUMBER/* ��� ������ *//* ��� ������ */
,aRefToType CHAR := null /* ������ �� ��� *//* ������ �� ��� */
,aRefToPart CHAR := null /* ������ �� ������ *//* ������ �� ������ */
,aInternalReference
 NUMBER := null /* ������ � �������� ������� *//* ������ � �������� ������� */
,aCreateRefOnly
 NUMBER := null /* ������ �������� ������� *//* ������ �������� ������� */
,aIsAutoNumber
 NUMBER := null /* ������������� *//* ������������� */
,aTheNumerator CHAR := null /* ��������� *//* ��������� */
,aZoneTemplate
 VARCHAR2 := null /* ������ ���� ��������� *//* ������ ���� ��������� */
,aNumberDateField CHAR := null /* ���� ��� ������� ���� *//* ���� ��� ������� ���� */
,aTheComment VARCHAR2 := null /* �������� *//* �������� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from FIELD where FIELDID=aFIELDID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from FIELD where FIELDid=aFIELDID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:FIELD',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=FIELD');
      return;
    end if;
  end if;
 --  verify lock  --
 FIELD_ISLOCKED( acursession=>acursession,aROWID=>aFIELDid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=FIELD');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'FIELD',
 aVERB=>'EDITROW',  aThe_Resource=>aFIELDid,aLogInstanceID=>aInstanceID);
 update  FIELD set ChangeStamp=sysdate
,
  Sequence=aSequence
,
  Caption=aCaption
,
  Name=aName
,
  FieldType=aFieldType
,
  IsBrief=aIsBrief
,
  AllowNull=aAllowNull
,
  DataSize=aDataSize
,
  ReferenceType=aReferenceType
,
  RefToType=aRefToType
,
  RefToPart=aRefToPart
,
  InternalReference=aInternalReference
,
  CreateRefOnly=aCreateRefOnly
,
  IsAutoNumber=aIsAutoNumber
,
  TheNumerator=aTheNumerator
,
  ZoneTemplate=aZoneTemplate
,
  NumberDateField=aNumberDateField
,
  TheComment=aTheComment
  where  FIELDID = aFIELDID; 
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from FIELD where ParentStructRowID=aParentStructRowID 
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'��������� ������������ ��������� �����. ������=FIELD');
 return;
end if;
select Count(*) into aUniqueRowCount from FIELD where ParentStructRowID=aParentStructRowID 
 and Sequence=aSequence;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'��������� ������������ ��������� �����. ������=FIELD');
 return;
end if;

 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from PART where PARTid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:FIELD',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=FIELD');
      return;
    end if;
 end if;
 PART_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=FIELD');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'FIELD',
 aVERB=>'CREATEROW',  aThe_Resource=>aFIELDid,aLogInstanceID=>aInstanceID);
 insert into   FIELD
 (  FIELDID 
,ParentStructRowID
,Sequence

,Caption

,Name

,FieldType

,IsBrief

,AllowNull

,DataSize

,ReferenceType

,RefToType

,RefToPart

,InternalReference

,CreateRefOnly

,IsAutoNumber

,TheNumerator

,ZoneTemplate

,NumberDateField

,TheComment

 ) values ( aFIELDID 
,aParentStructRowID
,aSequence

,aCaption

,aName

,aFieldType

,aIsBrief

,aAllowNull

,aDataSize

,aReferenceType

,aRefToType

,aRefToPart

,aInternalReference

,aCreateRefOnly

,aIsAutoNumber

,aTheNumerator

,aZoneTemplate

,aNumberDateField

,aTheComment

 ); 
 FIELD_SINIT( aCURSESSION,aFIELDid,atmpid);
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from FIELD where ParentStructRowID=aParentStructRowID 
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'��������� ������������ ��������� �����. ������=FIELD');
 return;
end if;
select Count(*) into aUniqueRowCount from FIELD where ParentStructRowID=aParentStructRowID 
 and Sequence=aSequence;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'��������� ������������ ��������� �����. ������=FIELD');
 return;
end if;

 end if;
 -- close transaction --
 end; 


procedure FIELD_PARENT /*����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from FIELD where  FIELDid=aRowID;
  aParentTable := 'PART';
 end; 


procedure FIELD_ISLOCKED /*����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from FIELD where FIELDid=aRowID;
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
  FIELD_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure FIELD_LOCK /*����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 FIELD_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  FIELD_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from FIELD where FIELDid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=FIELD');
    return;
  end if;
   if  aLockMode =2  
   then   
    update FIELD set LockUserID =auserID ,LockSessionID =null where FIELDid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update FIELD set LockUserID =null,LockSessionID =aCURSESSION  where FIELDid=aRowID;
     return;
   end if;
 end ;


procedure FIELD_HCL /*����*/ (
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
declare cursor lch_FIELDVALIDATOR is select FIELDVALIDATOR.FIELDVALIDATORid ID from FIELDVALIDATOR where  FIELDVALIDATOR.ParentStructRowID = aRowid;
row_FIELDVALIDATOR lch_FIELDVALIDATOR%ROWTYPE;
begin  
--open lch_FIELDVALIDATOR;
for row_FIELDVALIDATOR in lch_FIELDVALIDATOR
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from FIELDVALIDATOR where FIELDVALIDATORid=row_FIELDVALIDATOR.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_FIELDVALIDATOR;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_FIELDVALIDATOR;
     return;
   end if; 
 end if;  
 FIELDVALIDATOR_HCL (acursession,row_FIELDVALIDATOR.id,aisLocked);
 if aisLocked >2 then
   close lch_FIELDVALIDATOR;
   return;
 end if;
end loop;
--close lch_FIELDVALIDATOR;
end;
declare cursor lch_FIELDMENU is select FIELDMENU.FIELDMENUid ID from FIELDMENU where  FIELDMENU.ParentStructRowID = aRowid;
row_FIELDMENU lch_FIELDMENU%ROWTYPE;
begin  
--open lch_FIELDMENU;
for row_FIELDMENU in lch_FIELDMENU
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from FIELDMENU where FIELDMENUid=row_FIELDMENU.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_FIELDMENU;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_FIELDMENU;
     return;
   end if; 
 end if;  
 FIELDMENU_HCL (acursession,row_FIELDMENU.id,aisLocked);
 if aisLocked >2 then
   close lch_FIELDMENU;
   return;
 end if;
end loop;
--close lch_FIELDMENU;
end;
declare cursor lch_FIELDEXPRESSION is select FIELDEXPRESSION.FIELDEXPRESSIONid ID from FIELDEXPRESSION where  FIELDEXPRESSION.ParentStructRowID = aRowid;
row_FIELDEXPRESSION lch_FIELDEXPRESSION%ROWTYPE;
begin  
--open lch_FIELDEXPRESSION;
for row_FIELDEXPRESSION in lch_FIELDEXPRESSION
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from FIELDEXPRESSION where FIELDEXPRESSIONid=row_FIELDEXPRESSION.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_FIELDEXPRESSION;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_FIELDEXPRESSION;
     return;
   end if; 
 end if;  
 FIELDEXPRESSION_HCL (acursession,row_FIELDEXPRESSION.id,aisLocked);
 if aisLocked >2 then
   close lch_FIELDEXPRESSION;
   return;
 end if;
end loop;
--close lch_FIELDEXPRESSION;
end;
declare cursor lch_DINAMICFILTERSCRIPT is select DINAMICFILTERSCRIPT.DINAMICFILTERSCRIPTid ID from DINAMICFILTERSCRIPT where  DINAMICFILTERSCRIPT.ParentStructRowID = aRowid;
row_DINAMICFILTERSCRIPT lch_DINAMICFILTERSCRIPT%ROWTYPE;
begin  
--open lch_DINAMICFILTERSCRIPT;
for row_DINAMICFILTERSCRIPT in lch_DINAMICFILTERSCRIPT
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from DINAMICFILTERSCRIPT where DINAMICFILTERSCRIPTid=row_DINAMICFILTERSCRIPT.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_DINAMICFILTERSCRIPT;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_DINAMICFILTERSCRIPT;
     return;
   end if; 
 end if;  
 DINAMICFILTERSCRIPT_HCL (acursession,row_DINAMICFILTERSCRIPT.id,aisLocked);
 if aisLocked >2 then
   close lch_DINAMICFILTERSCRIPT;
   return;
 end if;
end loop;
--close lch_DINAMICFILTERSCRIPT;
end;
aIsLocked :=0;
end;


procedure FIELD_UNLOCK /*����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 FIELD_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update FIELD set LockUserID =null  where FIELDid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update FIELD set LockSessionID =null  where FIELDid=aRowID;
     return;
   end if;
 end; 


procedure FIELD_SINIT /*����*/ (
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
 select  SecurityStyleID into atmpID from FIELD where FIELDid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =FIELD');
    return;
  end if;
if aSecurityStyleID is null then
 FIELD_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update FIELD set securitystyleid =aStyleID where FIELDid = aRowID;
else 
 update FIELD set securitystyleid =aSecurityStyleID where FIELDid = aRowID;
end if; 
end ; 


procedure FIELD_propagate /*����*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from FIELD where FIELDid=aRowid;
declare cursor pch_FIELDVALIDATOR  is select FIELDVALIDATOR.FIELDVALIDATORid ID from FIELDVALIDATOR where  FIELDVALIDATOR.ParentStructRowID = aRowid;
row_FIELDVALIDATOR  pch_FIELDVALIDATOR%ROWTYPE;
begin
--open pch_FIELDVALIDATOR;
for row_FIELDVALIDATOR in pch_FIELDVALIDATOR loop
   FIELDVALIDATOR_SINIT( acursession,row_FIELDVALIDATOR.id,assid);
   FIELDVALIDATOR_propagate( acursession,row_FIELDVALIDATOR.id);
end loop;
--close pch_FIELDVALIDATOR;
end;
declare cursor pch_FIELDMENU  is select FIELDMENU.FIELDMENUid ID from FIELDMENU where  FIELDMENU.ParentStructRowID = aRowid;
row_FIELDMENU  pch_FIELDMENU%ROWTYPE;
begin
--open pch_FIELDMENU;
for row_FIELDMENU in pch_FIELDMENU loop
   FIELDMENU_SINIT( acursession,row_FIELDMENU.id,assid);
   FIELDMENU_propagate( acursession,row_FIELDMENU.id);
end loop;
--close pch_FIELDMENU;
end;
declare cursor pch_FIELDEXPRESSION  is select FIELDEXPRESSION.FIELDEXPRESSIONid ID from FIELDEXPRESSION where  FIELDEXPRESSION.ParentStructRowID = aRowid;
row_FIELDEXPRESSION  pch_FIELDEXPRESSION%ROWTYPE;
begin
--open pch_FIELDEXPRESSION;
for row_FIELDEXPRESSION in pch_FIELDEXPRESSION loop
   FIELDEXPRESSION_SINIT( acursession,row_FIELDEXPRESSION.id,assid);
   FIELDEXPRESSION_propagate( acursession,row_FIELDEXPRESSION.id);
end loop;
--close pch_FIELDEXPRESSION;
end;
declare cursor pch_DINAMICFILTERSCRIPT  is select DINAMICFILTERSCRIPT.DINAMICFILTERSCRIPTid ID from DINAMICFILTERSCRIPT where  DINAMICFILTERSCRIPT.ParentStructRowID = aRowid;
row_DINAMICFILTERSCRIPT  pch_DINAMICFILTERSCRIPT%ROWTYPE;
begin
--open pch_DINAMICFILTERSCRIPT;
for row_DINAMICFILTERSCRIPT in pch_DINAMICFILTERSCRIPT loop
   DINAMICFILTERSCRIPT_SINIT( acursession,row_DINAMICFILTERSCRIPT.id,assid);
   DINAMICFILTERSCRIPT_propagate( acursession,row_DINAMICFILTERSCRIPT.id);
end loop;
--close pch_DINAMICFILTERSCRIPT;
end;
end;



procedure FIELDVALIDATOR_BRIEF  (
 aCURSESSION CHAR,
 aFIELDVALIDATORid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aFIELDVALIDATORid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from FIELDVALIDATOR where FIELDVALIDATORID=aFIELDVALIDATORID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from FIELDVALIDATOR where FIELDVALIDATORid=aFIELDVALIDATORID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=FIELDVALIDATOR');
    return;
  end if;
  aBRIEF:=func.FIELDVALIDATOR_BRIEF_F(aFIELDVALIDATORid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure FIELDVALIDATOR_DELETE /*������ ������������ �� ����� ��� ��������� ����*/ (
 aCURSESSION CHAR,
 aFIELDVALIDATORid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from FIELDVALIDATOR where FIELDVALIDATORID=aFIELDVALIDATORID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from FIELDVALIDATOR where FIELDVALIDATORid=aFIELDVALIDATORID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:FIELDVALIDATOR',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=FIELDVALIDATOR');
      return;
    end if;
  end if;
 --  verify lock  --
 FIELDVALIDATOR_ISLOCKED( acursession=>acursession,aROWID=>aFIELDVALIDATORid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=FIELDVALIDATOR');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'FIELDVALIDATOR',
 aVERB=>'DELETEROW',  aThe_Resource=>aFIELDVALIDATORid, aLogInstanceID=>aInstanceID);
declare cursor chld_FIELDVALIDATOR is select  instanceid ID from instance where OwnerPartName ='FIELDVALIDATOR' and OwnerRowID=aFIELDVALIDATORid;
row_FIELDVALIDATOR  chld_FIELDVALIDATOR%ROWTYPE;
begin
--open chld_FIELDVALIDATOR;
for row_FIELDVALIDATOR in chld_FIELDVALIDATOR loop
 Kernel.INSTANCE_OWNER (acursession,row_FIELDVALIDATOR.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_FIELDVALIDATOR.id);
end loop;
--close chld_FIELDVALIDATOR;
end ;
  delete from  FIELDVALIDATOR 
  where  FIELDVALIDATORID = aFIELDVALIDATORID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*������ ���� �� �����*/
procedure FIELDVALIDATOR_SAVE /*������ ������������ �� ����� ��� ��������� ����*/ (
 aCURSESSION CHAR,
 aFIELDVALIDATORid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTarget CHAR := null /* ��������� *//* ��������� */
,aCode VARCHAR2 := null /* ������ *//* ������ */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from FIELDVALIDATOR where FIELDVALIDATORID=aFIELDVALIDATORID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from FIELDVALIDATOR where FIELDVALIDATORid=aFIELDVALIDATORID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:FIELDVALIDATOR',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=FIELDVALIDATOR');
      return;
    end if;
  end if;
 --  verify lock  --
 FIELDVALIDATOR_ISLOCKED( acursession=>acursession,aROWID=>aFIELDVALIDATORid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=FIELDVALIDATOR');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'FIELDVALIDATOR',
 aVERB=>'EDITROW',  aThe_Resource=>aFIELDVALIDATORid,aLogInstanceID=>aInstanceID);
 update  FIELDVALIDATOR set ChangeStamp=sysdate
,
  Target=aTarget
,
  Code=aCode
  where  FIELDVALIDATORID = aFIELDVALIDATORID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from FIELD where FIELDid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:FIELDVALIDATOR',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=FIELDVALIDATOR');
      return;
    end if;
 end if;
 FIELD_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=FIELDVALIDATOR');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'FIELDVALIDATOR',
 aVERB=>'CREATEROW',  aThe_Resource=>aFIELDVALIDATORid,aLogInstanceID=>aInstanceID);
 insert into   FIELDVALIDATOR
 (  FIELDVALIDATORID 
,ParentStructRowID
,Target

,Code

 ) values ( aFIELDVALIDATORID 
,aParentStructRowID
,aTarget

,aCode

 ); 
 FIELDVALIDATOR_SINIT( aCURSESSION,aFIELDVALIDATORid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure FIELDVALIDATOR_PARENT /*������ ������������ �� ����� ��� ��������� ����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from FIELDVALIDATOR where  FIELDVALIDATORid=aRowID;
  aParentTable := 'FIELD';
 end; 


procedure FIELDVALIDATOR_ISLOCKED /*������ ������������ �� ����� ��� ��������� ����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from FIELDVALIDATOR where FIELDVALIDATORid=aRowID;
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
  FIELDVALIDATOR_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure FIELDVALIDATOR_LOCK /*������ ������������ �� ����� ��� ��������� ����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 FIELDVALIDATOR_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  FIELDVALIDATOR_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from FIELDVALIDATOR where FIELDVALIDATORid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=FIELDVALIDATOR');
    return;
  end if;
   if  aLockMode =2  
   then   
    update FIELDVALIDATOR set LockUserID =auserID ,LockSessionID =null where FIELDVALIDATORid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update FIELDVALIDATOR set LockUserID =null,LockSessionID =aCURSESSION  where FIELDVALIDATORid=aRowID;
     return;
   end if;
 end ;


procedure FIELDVALIDATOR_HCL /*������ ������������ �� ����� ��� ��������� ����*/ (
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


procedure FIELDVALIDATOR_UNLOCK /*������ ������������ �� ����� ��� ��������� ����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 FIELDVALIDATOR_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update FIELDVALIDATOR set LockUserID =null  where FIELDVALIDATORid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update FIELDVALIDATOR set LockSessionID =null  where FIELDVALIDATORid=aRowID;
     return;
   end if;
 end; 


procedure FIELDVALIDATOR_SINIT /*������ ������������ �� ����� ��� ��������� ����*/ (
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
 select  SecurityStyleID into atmpID from FIELDVALIDATOR where FIELDVALIDATORid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =FIELDVALIDATOR');
    return;
  end if;
if aSecurityStyleID is null then
 FIELDVALIDATOR_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update FIELDVALIDATOR set securitystyleid =aStyleID where FIELDVALIDATORid = aRowID;
else 
 update FIELDVALIDATOR set securitystyleid =aSecurityStyleID where FIELDVALIDATORid = aRowID;
end if; 
end ; 


procedure FIELDVALIDATOR_propagate /*������ ������������ �� ����� ��� ��������� ����*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from FIELDVALIDATOR where FIELDVALIDATORid=aRowid;
end;



procedure FIELDMENU_BRIEF  (
 aCURSESSION CHAR,
 aFIELDMENUid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aFIELDMENUid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from FIELDMENU where FIELDMENUID=aFIELDMENUID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from FIELDMENU where FIELDMENUid=aFIELDMENUID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=FIELDMENU');
    return;
  end if;
  aBRIEF:=func.FIELDMENU_BRIEF_F(aFIELDMENUid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure FIELDMENU_DELETE /*������, ��������������� � �����*/ (
 aCURSESSION CHAR,
 aFIELDMENUid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from FIELDMENU where FIELDMENUID=aFIELDMENUID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from FIELDMENU where FIELDMENUid=aFIELDMENUID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:FIELDMENU',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=FIELDMENU');
      return;
    end if;
  end if;
 --  verify lock  --
 FIELDMENU_ISLOCKED( acursession=>acursession,aROWID=>aFIELDMENUid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=FIELDMENU');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_FIELDPARAMMAP is select FIELDPARAMMAP.FIELDPARAMMAPid ID from FIELDPARAMMAP where  FIELDPARAMMAP.ParentStructRowID = aFIELDMENUid;
    child_FIELDPARAMMAP_rec  child_FIELDPARAMMAP%ROWTYPE;
    begin
    --open child_FIELDPARAMMAP;
      for child_FIELDPARAMMAP_rec in child_FIELDPARAMMAP loop
      FIELDPARAMMAP_DELETE (acursession,child_FIELDPARAMMAP_rec.id,aInstanceid);
      end loop;
      --close child_FIELDPARAMMAP;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'FIELDMENU',
 aVERB=>'DELETEROW',  aThe_Resource=>aFIELDMENUid, aLogInstanceID=>aInstanceID);
declare cursor chld_FIELDMENU is select  instanceid ID from instance where OwnerPartName ='FIELDMENU' and OwnerRowID=aFIELDMENUid;
row_FIELDMENU  chld_FIELDMENU%ROWTYPE;
begin
--open chld_FIELDMENU;
for row_FIELDMENU in chld_FIELDMENU loop
 Kernel.INSTANCE_OWNER (acursession,row_FIELDMENU.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_FIELDMENU.id);
end loop;
--close chld_FIELDMENU;
end ;
  delete from  FIELDMENU 
  where  FIELDMENUID = aFIELDMENUID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*������ ����*/
procedure FIELDMENU_SAVE /*������, ��������������� � �����*/ (
 aCURSESSION CHAR,
 aFIELDMENUid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2 := null /* �������� *//* �������� */
,aCaption
 VARCHAR2 := null /* ��������� *//* ��������� */
,aToolTip
 VARCHAR2 := null /* ��������� *//* ��������� */
,aActionID CHAR/* ������������� ����������� ������ *//* ������������� ����������� ������ */
,aIsMenuItem
 NUMBER := null /* � ���� *//* � ���� */
,aIsToolBarButton
 NUMBER := null /* � ������ *//* � ������ */
,aHotKey
 VARCHAR2 := null /* ������� ������� *//* ������� ������� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from FIELDMENU where FIELDMENUID=aFIELDMENUID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from FIELDMENU where FIELDMENUid=aFIELDMENUID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:FIELDMENU',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=FIELDMENU');
      return;
    end if;
  end if;
 --  verify lock  --
 FIELDMENU_ISLOCKED( acursession=>acursession,aROWID=>aFIELDMENUid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=FIELDMENU');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'FIELDMENU',
 aVERB=>'EDITROW',  aThe_Resource=>aFIELDMENUid,aLogInstanceID=>aInstanceID);
 update  FIELDMENU set ChangeStamp=sysdate
,
  Name=aName
,
  Caption=aCaption
,
  ToolTip=aToolTip
,
  ActionID=aActionID
,
  IsMenuItem=aIsMenuItem
,
  IsToolBarButton=aIsToolBarButton
,
  HotKey=aHotKey
  where  FIELDMENUID = aFIELDMENUID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from FIELD where FIELDid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:FIELDMENU',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=FIELDMENU');
      return;
    end if;
 end if;
 FIELD_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=FIELDMENU');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'FIELDMENU',
 aVERB=>'CREATEROW',  aThe_Resource=>aFIELDMENUid,aLogInstanceID=>aInstanceID);
 insert into   FIELDMENU
 (  FIELDMENUID 
,ParentStructRowID
,Name

,Caption

,ToolTip

,ActionID

,IsMenuItem

,IsToolBarButton

,HotKey

 ) values ( aFIELDMENUID 
,aParentStructRowID
,aName

,aCaption

,aToolTip

,aActionID

,aIsMenuItem

,aIsToolBarButton

,aHotKey

 ); 
 FIELDMENU_SINIT( aCURSESSION,aFIELDMENUid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure FIELDMENU_PARENT /*������, ��������������� � �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from FIELDMENU where  FIELDMENUid=aRowID;
  aParentTable := 'FIELD';
 end; 


procedure FIELDMENU_ISLOCKED /*������, ��������������� � �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from FIELDMENU where FIELDMENUid=aRowID;
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
  FIELDMENU_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure FIELDMENU_LOCK /*������, ��������������� � �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 FIELDMENU_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  FIELDMENU_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from FIELDMENU where FIELDMENUid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=FIELDMENU');
    return;
  end if;
   if  aLockMode =2  
   then   
    update FIELDMENU set LockUserID =auserID ,LockSessionID =null where FIELDMENUid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update FIELDMENU set LockUserID =null,LockSessionID =aCURSESSION  where FIELDMENUid=aRowID;
     return;
   end if;
 end ;


procedure FIELDMENU_HCL /*������, ��������������� � �����*/ (
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
declare cursor lch_FIELDPARAMMAP is select FIELDPARAMMAP.FIELDPARAMMAPid ID from FIELDPARAMMAP where  FIELDPARAMMAP.ParentStructRowID = aRowid;
row_FIELDPARAMMAP lch_FIELDPARAMMAP%ROWTYPE;
begin  
--open lch_FIELDPARAMMAP;
for row_FIELDPARAMMAP in lch_FIELDPARAMMAP
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from FIELDPARAMMAP where FIELDPARAMMAPid=row_FIELDPARAMMAP.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_FIELDPARAMMAP;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_FIELDPARAMMAP;
     return;
   end if; 
 end if;  
 FIELDPARAMMAP_HCL (acursession,row_FIELDPARAMMAP.id,aisLocked);
 if aisLocked >2 then
   close lch_FIELDPARAMMAP;
   return;
 end if;
end loop;
--close lch_FIELDPARAMMAP;
end;
aIsLocked :=0;
end;


procedure FIELDMENU_UNLOCK /*������, ��������������� � �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 FIELDMENU_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update FIELDMENU set LockUserID =null  where FIELDMENUid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update FIELDMENU set LockSessionID =null  where FIELDMENUid=aRowID;
     return;
   end if;
 end; 


procedure FIELDMENU_SINIT /*������, ��������������� � �����*/ (
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
 select  SecurityStyleID into atmpID from FIELDMENU where FIELDMENUid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =FIELDMENU');
    return;
  end if;
if aSecurityStyleID is null then
 FIELDMENU_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update FIELDMENU set securitystyleid =aStyleID where FIELDMENUid = aRowID;
else 
 update FIELDMENU set securitystyleid =aSecurityStyleID where FIELDMENUid = aRowID;
end if; 
end ; 


procedure FIELDMENU_propagate /*������, ��������������� � �����*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from FIELDMENU where FIELDMENUid=aRowid;
declare cursor pch_FIELDPARAMMAP  is select FIELDPARAMMAP.FIELDPARAMMAPid ID from FIELDPARAMMAP where  FIELDPARAMMAP.ParentStructRowID = aRowid;
row_FIELDPARAMMAP  pch_FIELDPARAMMAP%ROWTYPE;
begin
--open pch_FIELDPARAMMAP;
for row_FIELDPARAMMAP in pch_FIELDPARAMMAP loop
   FIELDPARAMMAP_SINIT( acursession,row_FIELDPARAMMAP.id,assid);
   FIELDPARAMMAP_propagate( acursession,row_FIELDPARAMMAP.id);
end loop;
--close pch_FIELDPARAMMAP;
end;
end;



procedure FIELDPARAMMAP_BRIEF  (
 aCURSESSION CHAR,
 aFIELDPARAMMAPid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aFIELDPARAMMAPid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from FIELDPARAMMAP where FIELDPARAMMAPID=aFIELDPARAMMAPID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from FIELDPARAMMAP where FIELDPARAMMAPid=aFIELDPARAMMAPID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=FIELDPARAMMAP');
    return;
  end if;
  aBRIEF:=func.FIELDPARAMMAP_BRIEF_F(aFIELDPARAMMAPid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure FIELDPARAMMAP_DELETE /*����������� �������� �� ��������� ������*/ (
 aCURSESSION CHAR,
 aFIELDPARAMMAPid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from FIELDPARAMMAP where FIELDPARAMMAPID=aFIELDPARAMMAPID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from FIELDPARAMMAP where FIELDPARAMMAPid=aFIELDPARAMMAPID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:FIELDPARAMMAP',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=FIELDPARAMMAP');
      return;
    end if;
  end if;
 --  verify lock  --
 FIELDPARAMMAP_ISLOCKED( acursession=>acursession,aROWID=>aFIELDPARAMMAPid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=FIELDPARAMMAP');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'FIELDPARAMMAP',
 aVERB=>'DELETEROW',  aThe_Resource=>aFIELDPARAMMAPid, aLogInstanceID=>aInstanceID);
declare cursor chld_FIELDPARAMMAP is select  instanceid ID from instance where OwnerPartName ='FIELDPARAMMAP' and OwnerRowID=aFIELDPARAMMAPid;
row_FIELDPARAMMAP  chld_FIELDPARAMMAP%ROWTYPE;
begin
--open chld_FIELDPARAMMAP;
for row_FIELDPARAMMAP in chld_FIELDPARAMMAP loop
 Kernel.INSTANCE_OWNER (acursession,row_FIELDPARAMMAP.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_FIELDPARAMMAP.id);
end loop;
--close chld_FIELDPARAMMAP;
end ;
  delete from  FIELDPARAMMAP 
  where  FIELDPARAMMAPID = aFIELDPARAMMAPID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*����������� ����������*/
procedure FIELDPARAMMAP_SAVE /*����������� �������� �� ��������� ������*/ (
 aCURSESSION CHAR,
 aFIELDPARAMMAPid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aFieldName
 VARCHAR2/* ���� (��������) *//* ���� (��������) */
,aParamName
 VARCHAR2/* �������� *//* �������� */
,aNoEdit
 NUMBER/* ������������� �������� ������ *//* ������������� �������� ������ */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from FIELDPARAMMAP where FIELDPARAMMAPID=aFIELDPARAMMAPID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from FIELDPARAMMAP where FIELDPARAMMAPid=aFIELDPARAMMAPID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:FIELDPARAMMAP',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=FIELDPARAMMAP');
      return;
    end if;
  end if;
 --  verify lock  --
 FIELDPARAMMAP_ISLOCKED( acursession=>acursession,aROWID=>aFIELDPARAMMAPid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=FIELDPARAMMAP');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'FIELDPARAMMAP',
 aVERB=>'EDITROW',  aThe_Resource=>aFIELDPARAMMAPid,aLogInstanceID=>aInstanceID);
 update  FIELDPARAMMAP set ChangeStamp=sysdate
,
  FieldName=aFieldName
,
  ParamName=aParamName
,
  NoEdit=aNoEdit
  where  FIELDPARAMMAPID = aFIELDPARAMMAPID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from FIELDMENU where FIELDMENUid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:FIELDPARAMMAP',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=FIELDPARAMMAP');
      return;
    end if;
 end if;
 FIELDMENU_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=FIELDPARAMMAP');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'FIELDPARAMMAP',
 aVERB=>'CREATEROW',  aThe_Resource=>aFIELDPARAMMAPid,aLogInstanceID=>aInstanceID);
 insert into   FIELDPARAMMAP
 (  FIELDPARAMMAPID 
,ParentStructRowID
,FieldName

,ParamName

,NoEdit

 ) values ( aFIELDPARAMMAPID 
,aParentStructRowID
,aFieldName

,aParamName

,aNoEdit

 ); 
 FIELDPARAMMAP_SINIT( aCURSESSION,aFIELDPARAMMAPid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure FIELDPARAMMAP_PARENT /*����������� �������� �� ��������� ������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from FIELDPARAMMAP where  FIELDPARAMMAPid=aRowID;
  aParentTable := 'FIELDMENU';
 end; 


procedure FIELDPARAMMAP_ISLOCKED /*����������� �������� �� ��������� ������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from FIELDPARAMMAP where FIELDPARAMMAPid=aRowID;
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
  FIELDPARAMMAP_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure FIELDPARAMMAP_LOCK /*����������� �������� �� ��������� ������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 FIELDPARAMMAP_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  FIELDPARAMMAP_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from FIELDPARAMMAP where FIELDPARAMMAPid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=FIELDPARAMMAP');
    return;
  end if;
   if  aLockMode =2  
   then   
    update FIELDPARAMMAP set LockUserID =auserID ,LockSessionID =null where FIELDPARAMMAPid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update FIELDPARAMMAP set LockUserID =null,LockSessionID =aCURSESSION  where FIELDPARAMMAPid=aRowID;
     return;
   end if;
 end ;


procedure FIELDPARAMMAP_HCL /*����������� �������� �� ��������� ������*/ (
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


procedure FIELDPARAMMAP_UNLOCK /*����������� �������� �� ��������� ������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 FIELDPARAMMAP_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update FIELDPARAMMAP set LockUserID =null  where FIELDPARAMMAPid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update FIELDPARAMMAP set LockSessionID =null  where FIELDPARAMMAPid=aRowID;
     return;
   end if;
 end; 


procedure FIELDPARAMMAP_SINIT /*����������� �������� �� ��������� ������*/ (
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
 select  SecurityStyleID into atmpID from FIELDPARAMMAP where FIELDPARAMMAPid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =FIELDPARAMMAP');
    return;
  end if;
if aSecurityStyleID is null then
 FIELDPARAMMAP_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update FIELDPARAMMAP set securitystyleid =aStyleID where FIELDPARAMMAPid = aRowID;
else 
 update FIELDPARAMMAP set securitystyleid =aSecurityStyleID where FIELDPARAMMAPid = aRowID;
end if; 
end ; 


procedure FIELDPARAMMAP_propagate /*����������� �������� �� ��������� ������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from FIELDPARAMMAP where FIELDPARAMMAPid=aRowid;
end;



procedure FIELDEXPRESSION_BRIEF  (
 aCURSESSION CHAR,
 aFIELDEXPRESSIONid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aFIELDEXPRESSIONid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from FIELDEXPRESSION where FIELDEXPRESSIONID=aFIELDEXPRESSIONID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from FIELDEXPRESSION where FIELDEXPRESSIONid=aFIELDEXPRESSIONID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=FIELDEXPRESSION');
    return;
  end if;
  aBRIEF:=func.FIELDEXPRESSION_BRIEF_F(aFIELDEXPRESSIONid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure FIELDEXPRESSION_DELETE /*��������� ��� ���������� ����
��� �������� �� ���������*/ (
 aCURSESSION CHAR,
 aFIELDEXPRESSIONid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from FIELDEXPRESSION where FIELDEXPRESSIONID=aFIELDEXPRESSIONID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from FIELDEXPRESSION where FIELDEXPRESSIONid=aFIELDEXPRESSIONID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:FIELDEXPRESSION',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=FIELDEXPRESSION');
      return;
    end if;
  end if;
 --  verify lock  --
 FIELDEXPRESSION_ISLOCKED( acursession=>acursession,aROWID=>aFIELDEXPRESSIONid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=FIELDEXPRESSION');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'FIELDEXPRESSION',
 aVERB=>'DELETEROW',  aThe_Resource=>aFIELDEXPRESSIONid, aLogInstanceID=>aInstanceID);
declare cursor chld_FIELDEXPRESSION is select  instanceid ID from instance where OwnerPartName ='FIELDEXPRESSION' and OwnerRowID=aFIELDEXPRESSIONid;
row_FIELDEXPRESSION  chld_FIELDEXPRESSION%ROWTYPE;
begin
--open chld_FIELDEXPRESSION;
for row_FIELDEXPRESSION in chld_FIELDEXPRESSION loop
 Kernel.INSTANCE_OWNER (acursession,row_FIELDEXPRESSION.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_FIELDEXPRESSION.id);
end loop;
--close chld_FIELDEXPRESSION;
end ;
  delete from  FIELDEXPRESSION 
  where  FIELDEXPRESSIONID = aFIELDEXPRESSIONID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*�������� �� ���������*/
procedure FIELDEXPRESSION_SAVE /*��������� ��� ���������� ����
��� �������� �� ���������*/ (
 aCURSESSION CHAR,
 aFIELDEXPRESSIONid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTarget CHAR := null /* ��������� *//* ��������� */
,aCode VARCHAR2 := null /* ������ *//* ������ */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from FIELDEXPRESSION where FIELDEXPRESSIONID=aFIELDEXPRESSIONID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from FIELDEXPRESSION where FIELDEXPRESSIONid=aFIELDEXPRESSIONID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:FIELDEXPRESSION',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=FIELDEXPRESSION');
      return;
    end if;
  end if;
 --  verify lock  --
 FIELDEXPRESSION_ISLOCKED( acursession=>acursession,aROWID=>aFIELDEXPRESSIONid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=FIELDEXPRESSION');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'FIELDEXPRESSION',
 aVERB=>'EDITROW',  aThe_Resource=>aFIELDEXPRESSIONid,aLogInstanceID=>aInstanceID);
 update  FIELDEXPRESSION set ChangeStamp=sysdate
,
  Target=aTarget
,
  Code=aCode
  where  FIELDEXPRESSIONID = aFIELDEXPRESSIONID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from FIELD where FIELDid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:FIELDEXPRESSION',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=FIELDEXPRESSION');
      return;
    end if;
 end if;
 FIELD_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=FIELDEXPRESSION');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'FIELDEXPRESSION',
 aVERB=>'CREATEROW',  aThe_Resource=>aFIELDEXPRESSIONid,aLogInstanceID=>aInstanceID);
 insert into   FIELDEXPRESSION
 (  FIELDEXPRESSIONID 
,ParentStructRowID
,Target

,Code

 ) values ( aFIELDEXPRESSIONID 
,aParentStructRowID
,aTarget

,aCode

 ); 
 FIELDEXPRESSION_SINIT( aCURSESSION,aFIELDEXPRESSIONid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure FIELDEXPRESSION_PARENT /*��������� ��� ���������� ����
��� �������� �� ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from FIELDEXPRESSION where  FIELDEXPRESSIONid=aRowID;
  aParentTable := 'FIELD';
 end; 


procedure FIELDEXPRESSION_ISLOCKED /*��������� ��� ���������� ����
��� �������� �� ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from FIELDEXPRESSION where FIELDEXPRESSIONid=aRowID;
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
  FIELDEXPRESSION_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure FIELDEXPRESSION_LOCK /*��������� ��� ���������� ����
��� �������� �� ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 FIELDEXPRESSION_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  FIELDEXPRESSION_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from FIELDEXPRESSION where FIELDEXPRESSIONid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=FIELDEXPRESSION');
    return;
  end if;
   if  aLockMode =2  
   then   
    update FIELDEXPRESSION set LockUserID =auserID ,LockSessionID =null where FIELDEXPRESSIONid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update FIELDEXPRESSION set LockUserID =null,LockSessionID =aCURSESSION  where FIELDEXPRESSIONid=aRowID;
     return;
   end if;
 end ;


procedure FIELDEXPRESSION_HCL /*��������� ��� ���������� ����
��� �������� �� ���������*/ (
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


procedure FIELDEXPRESSION_UNLOCK /*��������� ��� ���������� ����
��� �������� �� ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 FIELDEXPRESSION_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update FIELDEXPRESSION set LockUserID =null  where FIELDEXPRESSIONid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update FIELDEXPRESSION set LockSessionID =null  where FIELDEXPRESSIONid=aRowID;
     return;
   end if;
 end; 


procedure FIELDEXPRESSION_SINIT /*��������� ��� ���������� ����
��� �������� �� ���������*/ (
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
 select  SecurityStyleID into atmpID from FIELDEXPRESSION where FIELDEXPRESSIONid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =FIELDEXPRESSION');
    return;
  end if;
if aSecurityStyleID is null then
 FIELDEXPRESSION_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update FIELDEXPRESSION set securitystyleid =aStyleID where FIELDEXPRESSIONid = aRowID;
else 
 update FIELDEXPRESSION set securitystyleid =aSecurityStyleID where FIELDEXPRESSIONid = aRowID;
end if; 
end ; 


procedure FIELDEXPRESSION_propagate /*��������� ��� ���������� ����
��� �������� �� ���������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from FIELDEXPRESSION where FIELDEXPRESSIONid=aRowid;
end;



procedure DINAMICFILTERSCRIPT_BRIEF  (
 aCURSESSION CHAR,
 aDINAMICFILTERSCRIPTid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aDINAMICFILTERSCRIPTid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from DINAMICFILTERSCRIPT where DINAMICFILTERSCRIPTID=aDINAMICFILTERSCRIPTID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from DINAMICFILTERSCRIPT where DINAMICFILTERSCRIPTid=aDINAMICFILTERSCRIPTID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=DINAMICFILTERSCRIPT');
    return;
  end if;
  aBRIEF:=func.DINAMICFILTERSCRIPT_BRIEF_F(aDINAMICFILTERSCRIPTid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure DINAMICFILTERSCRIPT_DELETE /*��������� ��� ���������� ��������������� ������� ��� ��������� �����*/ (
 aCURSESSION CHAR,
 aDINAMICFILTERSCRIPTid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from DINAMICFILTERSCRIPT where DINAMICFILTERSCRIPTID=aDINAMICFILTERSCRIPTID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from DINAMICFILTERSCRIPT where DINAMICFILTERSCRIPTid=aDINAMICFILTERSCRIPTID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:DINAMICFILTERSCRIPT',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=DINAMICFILTERSCRIPT');
      return;
    end if;
  end if;
 --  verify lock  --
 DINAMICFILTERSCRIPT_ISLOCKED( acursession=>acursession,aROWID=>aDINAMICFILTERSCRIPTid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=DINAMICFILTERSCRIPT');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'DINAMICFILTERSCRIPT',
 aVERB=>'DELETEROW',  aThe_Resource=>aDINAMICFILTERSCRIPTid, aLogInstanceID=>aInstanceID);
declare cursor chld_DINAMICFILTERSCRIPT is select  instanceid ID from instance where OwnerPartName ='DINAMICFILTERSCRIPT' and OwnerRowID=aDINAMICFILTERSCRIPTid;
row_DINAMICFILTERSCRIPT  chld_DINAMICFILTERSCRIPT%ROWTYPE;
begin
--open chld_DINAMICFILTERSCRIPT;
for row_DINAMICFILTERSCRIPT in chld_DINAMICFILTERSCRIPT loop
 Kernel.INSTANCE_OWNER (acursession,row_DINAMICFILTERSCRIPT.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_DINAMICFILTERSCRIPT.id);
end loop;
--close chld_DINAMICFILTERSCRIPT;
end ;
  delete from  DINAMICFILTERSCRIPT 
  where  DINAMICFILTERSCRIPTID = aDINAMICFILTERSCRIPTID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*������������ ������*/
procedure DINAMICFILTERSCRIPT_SAVE /*��������� ��� ���������� ��������������� ������� ��� ��������� �����*/ (
 aCURSESSION CHAR,
 aDINAMICFILTERSCRIPTid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTarget CHAR := null /* ������� ��������� *//* ������� ��������� */
,aCode VARCHAR2 := null /* ������ *//* ������ */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from DINAMICFILTERSCRIPT where DINAMICFILTERSCRIPTID=aDINAMICFILTERSCRIPTID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from DINAMICFILTERSCRIPT where DINAMICFILTERSCRIPTid=aDINAMICFILTERSCRIPTID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:DINAMICFILTERSCRIPT',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=DINAMICFILTERSCRIPT');
      return;
    end if;
  end if;
 --  verify lock  --
 DINAMICFILTERSCRIPT_ISLOCKED( acursession=>acursession,aROWID=>aDINAMICFILTERSCRIPTid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=DINAMICFILTERSCRIPT');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'DINAMICFILTERSCRIPT',
 aVERB=>'EDITROW',  aThe_Resource=>aDINAMICFILTERSCRIPTid,aLogInstanceID=>aInstanceID);
 update  DINAMICFILTERSCRIPT set ChangeStamp=sysdate
,
  Target=aTarget
,
  Code=aCode
  where  DINAMICFILTERSCRIPTID = aDINAMICFILTERSCRIPTID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from FIELD where FIELDid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:DINAMICFILTERSCRIPT',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=DINAMICFILTERSCRIPT');
      return;
    end if;
 end if;
 FIELD_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=DINAMICFILTERSCRIPT');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'DINAMICFILTERSCRIPT',
 aVERB=>'CREATEROW',  aThe_Resource=>aDINAMICFILTERSCRIPTid,aLogInstanceID=>aInstanceID);
 insert into   DINAMICFILTERSCRIPT
 (  DINAMICFILTERSCRIPTID 
,ParentStructRowID
,Target

,Code

 ) values ( aDINAMICFILTERSCRIPTID 
,aParentStructRowID
,aTarget

,aCode

 ); 
 DINAMICFILTERSCRIPT_SINIT( aCURSESSION,aDINAMICFILTERSCRIPTid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure DINAMICFILTERSCRIPT_PARENT /*��������� ��� ���������� ��������������� ������� ��� ��������� �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from DINAMICFILTERSCRIPT where  DINAMICFILTERSCRIPTid=aRowID;
  aParentTable := 'FIELD';
 end; 


procedure DINAMICFILTERSCRIPT_ISLOCKED /*��������� ��� ���������� ��������������� ������� ��� ��������� �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from DINAMICFILTERSCRIPT where DINAMICFILTERSCRIPTid=aRowID;
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
  DINAMICFILTERSCRIPT_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure DINAMICFILTERSCRIPT_LOCK /*��������� ��� ���������� ��������������� ������� ��� ��������� �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 DINAMICFILTERSCRIPT_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  DINAMICFILTERSCRIPT_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from DINAMICFILTERSCRIPT where DINAMICFILTERSCRIPTid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=DINAMICFILTERSCRIPT');
    return;
  end if;
   if  aLockMode =2  
   then   
    update DINAMICFILTERSCRIPT set LockUserID =auserID ,LockSessionID =null where DINAMICFILTERSCRIPTid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update DINAMICFILTERSCRIPT set LockUserID =null,LockSessionID =aCURSESSION  where DINAMICFILTERSCRIPTid=aRowID;
     return;
   end if;
 end ;


procedure DINAMICFILTERSCRIPT_HCL /*��������� ��� ���������� ��������������� ������� ��� ��������� �����*/ (
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


procedure DINAMICFILTERSCRIPT_UNLOCK /*��������� ��� ���������� ��������������� ������� ��� ��������� �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 DINAMICFILTERSCRIPT_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update DINAMICFILTERSCRIPT set LockUserID =null  where DINAMICFILTERSCRIPTid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update DINAMICFILTERSCRIPT set LockSessionID =null  where DINAMICFILTERSCRIPTid=aRowID;
     return;
   end if;
 end; 


procedure DINAMICFILTERSCRIPT_SINIT /*��������� ��� ���������� ��������������� ������� ��� ��������� �����*/ (
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
 select  SecurityStyleID into atmpID from DINAMICFILTERSCRIPT where DINAMICFILTERSCRIPTid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =DINAMICFILTERSCRIPT');
    return;
  end if;
if aSecurityStyleID is null then
 DINAMICFILTERSCRIPT_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update DINAMICFILTERSCRIPT set securitystyleid =aStyleID where DINAMICFILTERSCRIPTid = aRowID;
else 
 update DINAMICFILTERSCRIPT set securitystyleid =aSecurityStyleID where DINAMICFILTERSCRIPTid = aRowID;
end if; 
end ; 


procedure DINAMICFILTERSCRIPT_propagate /*��������� ��� ���������� ��������������� ������� ��� ��������� �����*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from DINAMICFILTERSCRIPT where DINAMICFILTERSCRIPTid=aRowid;
end;



procedure PARTVIEW_BRIEF  (
 aCURSESSION CHAR,
 aPARTVIEWid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aPARTVIEWid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PARTVIEW where PARTVIEWID=aPARTVIEWID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PARTVIEW where PARTVIEWid=aPARTVIEWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PARTVIEW');
    return;
  end if;
  aBRIEF:=func.PARTVIEW_BRIEF_F(aPARTVIEWid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PARTVIEW_DELETE /*������� �������������, ������� ����� �������������� ��� �������� �������*/ (
 aCURSESSION CHAR,
 aPARTVIEWid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from PARTVIEW where PARTVIEWID=aPARTVIEWID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PARTVIEW where PARTVIEWid=aPARTVIEWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PARTVIEW',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=PARTVIEW');
      return;
    end if;
  end if;
 --  verify lock  --
 PARTVIEW_ISLOCKED( acursession=>acursession,aROWID=>aPARTVIEWid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=PARTVIEW');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_ViewColumn is select ViewColumn.ViewColumnid ID from ViewColumn where  ViewColumn.ParentStructRowID = aPARTVIEWid;
    child_ViewColumn_rec  child_ViewColumn%ROWTYPE;
    begin
    --open child_ViewColumn;
      for child_ViewColumn_rec in child_ViewColumn loop
      ViewColumn_DELETE (acursession,child_ViewColumn_rec.id,aInstanceid);
      end loop;
      --close child_ViewColumn;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PARTVIEW',
 aVERB=>'DELETEROW',  aThe_Resource=>aPARTVIEWid, aLogInstanceID=>aInstanceID);
declare cursor chld_PARTVIEW is select  instanceid ID from instance where OwnerPartName ='PARTVIEW' and OwnerRowID=aPARTVIEWid;
row_PARTVIEW  chld_PARTVIEW%ROWTYPE;
begin
--open chld_PARTVIEW;
for row_PARTVIEW in chld_PARTVIEW loop
 Kernel.INSTANCE_OWNER (acursession,row_PARTVIEW.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PARTVIEW.id);
end loop;
--close chld_PARTVIEW;
end ;
  delete from  PARTVIEW 
  where  PARTVIEWID = aPARTVIEWID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*�������������*/
procedure PARTVIEW_SAVE /*������� �������������, ������� ����� �������������� ��� �������� �������*/ (
 aCURSESSION CHAR,
 aPARTVIEWid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
,athe_Alias
 VARCHAR2/* ��������� *//* ��������� */
,aForChoose
 NUMBER/* ��� ������ *//* ��� ������ */
,aFilterField0
 VARCHAR2 := null /* ���� - ������ 0 *//* ���� - ������ 0 */
,aFilterField1
 VARCHAR2 := null /* ���� - ������ 1 *//* ���� - ������ 1 */
,aFilterField2
 VARCHAR2 := null /* ���� - ������ 2 *//* ���� - ������ 2 */
,aFilterField3
 VARCHAR2 := null /* ���� - ������ 3 *//* ���� - ������ 3 */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from PARTVIEW where PARTVIEWID=aPARTVIEWID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PARTVIEW where PARTVIEWid=aPARTVIEWID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PARTVIEW',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=PARTVIEW');
      return;
    end if;
  end if;
 --  verify lock  --
 PARTVIEW_ISLOCKED( acursession=>acursession,aROWID=>aPARTVIEWid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=PARTVIEW');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PARTVIEW',
 aVERB=>'EDITROW',  aThe_Resource=>aPARTVIEWid,aLogInstanceID=>aInstanceID);
 update  PARTVIEW set ChangeStamp=sysdate
,
  Name=aName
,
  the_Alias=athe_Alias
,
  ForChoose=aForChoose
,
  FilterField0=aFilterField0
,
  FilterField1=aFilterField1
,
  FilterField2=aFilterField2
,
  FilterField3=aFilterField3
  where  PARTVIEWID = aPARTVIEWID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from PART where PARTid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PARTVIEW',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=PARTVIEW');
      return;
    end if;
 end if;
 PART_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=PARTVIEW');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PARTVIEW',
 aVERB=>'CREATEROW',  aThe_Resource=>aPARTVIEWid,aLogInstanceID=>aInstanceID);
 insert into   PARTVIEW
 (  PARTVIEWID 
,ParentStructRowID
,Name

,the_Alias

,ForChoose

,FilterField0

,FilterField1

,FilterField2

,FilterField3

 ) values ( aPARTVIEWID 
,aParentStructRowID
,aName

,athe_Alias

,aForChoose

,aFilterField0

,aFilterField1

,aFilterField2

,aFilterField3

 ); 
 PARTVIEW_SINIT( aCURSESSION,aPARTVIEWid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PARTVIEW_PARENT /*������� �������������, ������� ����� �������������� ��� �������� �������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from PARTVIEW where  PARTVIEWid=aRowID;
  aParentTable := 'PART';
 end; 


procedure PARTVIEW_ISLOCKED /*������� �������������, ������� ����� �������������� ��� �������� �������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PARTVIEW where PARTVIEWid=aRowID;
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
  PARTVIEW_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PARTVIEW_LOCK /*������� �������������, ������� ����� �������������� ��� �������� �������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 PARTVIEW_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  PARTVIEW_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PARTVIEW where PARTVIEWid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=PARTVIEW');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PARTVIEW set LockUserID =auserID ,LockSessionID =null where PARTVIEWid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PARTVIEW set LockUserID =null,LockSessionID =aCURSESSION  where PARTVIEWid=aRowID;
     return;
   end if;
 end ;


procedure PARTVIEW_HCL /*������� �������������, ������� ����� �������������� ��� �������� �������*/ (
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
declare cursor lch_ViewColumn is select ViewColumn.ViewColumnid ID from ViewColumn where  ViewColumn.ParentStructRowID = aRowid;
row_ViewColumn lch_ViewColumn%ROWTYPE;
begin  
--open lch_ViewColumn;
for row_ViewColumn in lch_ViewColumn
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from ViewColumn where ViewColumnid=row_ViewColumn.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ViewColumn;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_ViewColumn;
     return;
   end if; 
 end if;  
 ViewColumn_HCL (acursession,row_ViewColumn.id,aisLocked);
 if aisLocked >2 then
   close lch_ViewColumn;
   return;
 end if;
end loop;
--close lch_ViewColumn;
end;
aIsLocked :=0;
end;


procedure PARTVIEW_UNLOCK /*������� �������������, ������� ����� �������������� ��� �������� �������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 PARTVIEW_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PARTVIEW set LockUserID =null  where PARTVIEWid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PARTVIEW set LockSessionID =null  where PARTVIEWid=aRowID;
     return;
   end if;
 end; 


procedure PARTVIEW_SINIT /*������� �������������, ������� ����� �������������� ��� �������� �������*/ (
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
 select  SecurityStyleID into atmpID from PARTVIEW where PARTVIEWid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =PARTVIEW');
    return;
  end if;
if aSecurityStyleID is null then
 PARTVIEW_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PARTVIEW set securitystyleid =aStyleID where PARTVIEWid = aRowID;
else 
 update PARTVIEW set securitystyleid =aSecurityStyleID where PARTVIEWid = aRowID;
end if; 
end ; 


procedure PARTVIEW_propagate /*������� �������������, ������� ����� �������������� ��� �������� �������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PARTVIEW where PARTVIEWid=aRowid;
declare cursor pch_ViewColumn  is select ViewColumn.ViewColumnid ID from ViewColumn where  ViewColumn.ParentStructRowID = aRowid;
row_ViewColumn  pch_ViewColumn%ROWTYPE;
begin
--open pch_ViewColumn;
for row_ViewColumn in pch_ViewColumn loop
   ViewColumn_SINIT( acursession,row_ViewColumn.id,assid);
   ViewColumn_propagate( acursession,row_ViewColumn.id);
end loop;
--close pch_ViewColumn;
end;
end;



procedure ViewColumn_BRIEF  (
 aCURSESSION CHAR,
 aViewColumnid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aViewColumnid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ViewColumn where ViewColumnID=aViewColumnID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ViewColumn where ViewColumnid=aViewColumnID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ViewColumn');
    return;
  end if;
  aBRIEF:=func.ViewColumn_BRIEF_F(aViewColumnid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ViewColumn_DELETE /*������� �������������*/ (
 aCURSESSION CHAR,
 aViewColumnid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from ViewColumn where ViewColumnID=aViewColumnID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ViewColumn where ViewColumnid=aViewColumnID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ViewColumn',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=ViewColumn');
      return;
    end if;
  end if;
 --  verify lock  --
 ViewColumn_ISLOCKED( acursession=>acursession,aROWID=>aViewColumnid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=ViewColumn');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ViewColumn',
 aVERB=>'DELETEROW',  aThe_Resource=>aViewColumnid, aLogInstanceID=>aInstanceID);
declare cursor chld_ViewColumn is select  instanceid ID from instance where OwnerPartName ='ViewColumn' and OwnerRowID=aViewColumnid;
row_ViewColumn  chld_ViewColumn%ROWTYPE;
begin
--open chld_ViewColumn;
for row_ViewColumn in chld_ViewColumn loop
 Kernel.INSTANCE_OWNER (acursession,row_ViewColumn.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ViewColumn.id);
end loop;
--close chld_ViewColumn;
end ;
  delete from  ViewColumn 
  where  ViewColumnID = aViewColumnID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*�������*/
procedure ViewColumn_SAVE /*������� �������������*/ (
 aCURSESSION CHAR,
 aViewColumnid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,asequence
 NUMBER := null /* �  *//* �  */
,aName
 VARCHAR2/* �������� *//* �������� */
,athe_Alias
 VARCHAR2/* �������� *//* �������� */
,aFromPart CHAR/* ������ *//* ������ */
,aField CHAR/* ���� *//* ���� */
,aAggregation
 NUMBER/* ��������� *//* ��������� */
,aExpression VARCHAR2 := null /* ������� *//* ������� */
,aForCombo
 NUMBER := null /* ��� ����� *//* ��� ����� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from ViewColumn where ViewColumnID=aViewColumnID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ViewColumn where ViewColumnid=aViewColumnID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ViewColumn',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=ViewColumn');
      return;
    end if;
  end if;
 --  verify lock  --
 ViewColumn_ISLOCKED( acursession=>acursession,aROWID=>aViewColumnid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=ViewColumn');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ViewColumn',
 aVERB=>'EDITROW',  aThe_Resource=>aViewColumnid,aLogInstanceID=>aInstanceID);
 update  ViewColumn set ChangeStamp=sysdate
,
  sequence=asequence
,
  Name=aName
,
  the_Alias=athe_Alias
,
  FromPart=aFromPart
,
  Field=aField
,
  Aggregation=aAggregation
,
  Expression=aExpression
,
  ForCombo=aForCombo
  where  ViewColumnID = aViewColumnID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from PARTVIEW where PARTVIEWid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ViewColumn',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=ViewColumn');
      return;
    end if;
 end if;
 PARTVIEW_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=ViewColumn');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ViewColumn',
 aVERB=>'CREATEROW',  aThe_Resource=>aViewColumnid,aLogInstanceID=>aInstanceID);
 insert into   ViewColumn
 (  ViewColumnID 
,ParentStructRowID
,sequence

,Name

,the_Alias

,FromPart

,Field

,Aggregation

,Expression

,ForCombo

 ) values ( aViewColumnID 
,aParentStructRowID
,asequence

,aName

,athe_Alias

,aFromPart

,aField

,aAggregation

,aExpression

,aForCombo

 ); 
 ViewColumn_SINIT( aCURSESSION,aViewColumnid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ViewColumn_PARENT /*������� �������������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from ViewColumn where  ViewColumnid=aRowID;
  aParentTable := 'PARTVIEW';
 end; 


procedure ViewColumn_ISLOCKED /*������� �������������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ViewColumn where ViewColumnid=aRowID;
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
  ViewColumn_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ViewColumn_LOCK /*������� �������������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 ViewColumn_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  ViewColumn_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ViewColumn where ViewColumnid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=ViewColumn');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ViewColumn set LockUserID =auserID ,LockSessionID =null where ViewColumnid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ViewColumn set LockUserID =null,LockSessionID =aCURSESSION  where ViewColumnid=aRowID;
     return;
   end if;
 end ;


procedure ViewColumn_HCL /*������� �������������*/ (
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


procedure ViewColumn_UNLOCK /*������� �������������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 ViewColumn_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ViewColumn set LockUserID =null  where ViewColumnid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ViewColumn set LockSessionID =null  where ViewColumnid=aRowID;
     return;
   end if;
 end; 


procedure ViewColumn_SINIT /*������� �������������*/ (
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
 select  SecurityStyleID into atmpID from ViewColumn where ViewColumnid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =ViewColumn');
    return;
  end if;
if aSecurityStyleID is null then
 ViewColumn_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ViewColumn set securitystyleid =aStyleID where ViewColumnid = aRowID;
else 
 update ViewColumn set securitystyleid =aSecurityStyleID where ViewColumnid = aRowID;
end if; 
end ; 


procedure ViewColumn_propagate /*������� �������������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ViewColumn where ViewColumnid=aRowid;
end;



procedure VALIDATOR_BRIEF  (
 aCURSESSION CHAR,
 aVALIDATORid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aVALIDATORid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VALIDATOR where VALIDATORID=aVALIDATORID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VALIDATOR where VALIDATORid=aVALIDATORID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VALIDATOR');
    return;
  end if;
  aBRIEF:=func.VALIDATOR_BRIEF_F(aVALIDATORid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VALIDATOR_DELETE /*�������� � ��������� ��������������*/ (
 aCURSESSION CHAR,
 aVALIDATORid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from VALIDATOR where VALIDATORID=aVALIDATORID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VALIDATOR where VALIDATORid=aVALIDATORID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VALIDATOR',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=VALIDATOR');
      return;
    end if;
  end if;
 --  verify lock  --
 VALIDATOR_ISLOCKED( acursession=>acursession,aROWID=>aVALIDATORid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=VALIDATOR');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VALIDATOR',
 aVERB=>'DELETEROW',  aThe_Resource=>aVALIDATORid, aLogInstanceID=>aInstanceID);
declare cursor chld_VALIDATOR is select  instanceid ID from instance where OwnerPartName ='VALIDATOR' and OwnerRowID=aVALIDATORid;
row_VALIDATOR  chld_VALIDATOR%ROWTYPE;
begin
--open chld_VALIDATOR;
for row_VALIDATOR in chld_VALIDATOR loop
 Kernel.INSTANCE_OWNER (acursession,row_VALIDATOR.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VALIDATOR.id);
end loop;
--close chld_VALIDATOR;
end ;
  delete from  VALIDATOR 
  where  VALIDATORID = aVALIDATORID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*������ �� �����*/
procedure VALIDATOR_SAVE /*�������� � ��������� ��������������*/ (
 aCURSESSION CHAR,
 aVALIDATORid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTarget CHAR := null /* ������� ��������� *//* ������� ��������� */
,aCode VARCHAR2 := null /* ������ *//* ������ */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from VALIDATOR where VALIDATORID=aVALIDATORID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VALIDATOR where VALIDATORid=aVALIDATORID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VALIDATOR',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=VALIDATOR');
      return;
    end if;
  end if;
 --  verify lock  --
 VALIDATOR_ISLOCKED( acursession=>acursession,aROWID=>aVALIDATORid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=VALIDATOR');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VALIDATOR',
 aVERB=>'EDITROW',  aThe_Resource=>aVALIDATORid,aLogInstanceID=>aInstanceID);
 update  VALIDATOR set ChangeStamp=sysdate
,
  Target=aTarget
,
  Code=aCode
  where  VALIDATORID = aVALIDATORID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from PART where PARTid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VALIDATOR',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=VALIDATOR');
      return;
    end if;
 end if;
 PART_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=VALIDATOR');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VALIDATOR',
 aVERB=>'CREATEROW',  aThe_Resource=>aVALIDATORid,aLogInstanceID=>aInstanceID);
 insert into   VALIDATOR
 (  VALIDATORID 
,ParentStructRowID
,Target

,Code

 ) values ( aVALIDATORID 
,aParentStructRowID
,aTarget

,aCode

 ); 
 VALIDATOR_SINIT( aCURSESSION,aVALIDATORid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VALIDATOR_PARENT /*�������� � ��������� ��������������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from VALIDATOR where  VALIDATORid=aRowID;
  aParentTable := 'PART';
 end; 


procedure VALIDATOR_ISLOCKED /*�������� � ��������� ��������������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VALIDATOR where VALIDATORid=aRowID;
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
  VALIDATOR_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VALIDATOR_LOCK /*�������� � ��������� ��������������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 VALIDATOR_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  VALIDATOR_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VALIDATOR where VALIDATORid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=VALIDATOR');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VALIDATOR set LockUserID =auserID ,LockSessionID =null where VALIDATORid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VALIDATOR set LockUserID =null,LockSessionID =aCURSESSION  where VALIDATORid=aRowID;
     return;
   end if;
 end ;


procedure VALIDATOR_HCL /*�������� � ��������� ��������������*/ (
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


procedure VALIDATOR_UNLOCK /*�������� � ��������� ��������������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 VALIDATOR_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VALIDATOR set LockUserID =null  where VALIDATORid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VALIDATOR set LockSessionID =null  where VALIDATORid=aRowID;
     return;
   end if;
 end; 


procedure VALIDATOR_SINIT /*�������� � ��������� ��������������*/ (
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
 select  SecurityStyleID into atmpID from VALIDATOR where VALIDATORid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =VALIDATOR');
    return;
  end if;
if aSecurityStyleID is null then
 VALIDATOR_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VALIDATOR set securitystyleid =aStyleID where VALIDATORid = aRowID;
else 
 update VALIDATOR set securitystyleid =aSecurityStyleID where VALIDATORid = aRowID;
end if; 
end ; 


procedure VALIDATOR_propagate /*�������� � ��������� ��������������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VALIDATOR where VALIDATORid=aRowid;
end;



procedure UNIQUECONSTRAINT_BRIEF  (
 aCURSESSION CHAR,
 aUNIQUECONSTRAINTid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aUNIQUECONSTRAINTid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from UNIQUECONSTRAINT where UNIQUECONSTRAINTID=aUNIQUECONSTRAINTID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from UNIQUECONSTRAINT where UNIQUECONSTRAINTid=aUNIQUECONSTRAINTID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=UNIQUECONSTRAINT');
    return;
  end if;
  aBRIEF:=func.UNIQUECONSTRAINT_BRIEF_F(aUNIQUECONSTRAINTid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure UNIQUECONSTRAINT_DELETE /*����������� ������������*/ (
 aCURSESSION CHAR,
 aUNIQUECONSTRAINTid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from UNIQUECONSTRAINT where UNIQUECONSTRAINTID=aUNIQUECONSTRAINTID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from UNIQUECONSTRAINT where UNIQUECONSTRAINTid=aUNIQUECONSTRAINTID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:UNIQUECONSTRAINT',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=UNIQUECONSTRAINT');
      return;
    end if;
  end if;
 --  verify lock  --
 UNIQUECONSTRAINT_ISLOCKED( acursession=>acursession,aROWID=>aUNIQUECONSTRAINTid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=UNIQUECONSTRAINT');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_CONSTRAINTFIELD is select CONSTRAINTFIELD.CONSTRAINTFIELDid ID from CONSTRAINTFIELD where  CONSTRAINTFIELD.ParentStructRowID = aUNIQUECONSTRAINTid;
    child_CONSTRAINTFIELD_rec  child_CONSTRAINTFIELD%ROWTYPE;
    begin
    --open child_CONSTRAINTFIELD;
      for child_CONSTRAINTFIELD_rec in child_CONSTRAINTFIELD loop
      CONSTRAINTFIELD_DELETE (acursession,child_CONSTRAINTFIELD_rec.id,aInstanceid);
      end loop;
      --close child_CONSTRAINTFIELD;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'UNIQUECONSTRAINT',
 aVERB=>'DELETEROW',  aThe_Resource=>aUNIQUECONSTRAINTid, aLogInstanceID=>aInstanceID);
declare cursor chld_UNIQUECONSTRAINT is select  instanceid ID from instance where OwnerPartName ='UNIQUECONSTRAINT' and OwnerRowID=aUNIQUECONSTRAINTid;
row_UNIQUECONSTRAINT  chld_UNIQUECONSTRAINT%ROWTYPE;
begin
--open chld_UNIQUECONSTRAINT;
for row_UNIQUECONSTRAINT in chld_UNIQUECONSTRAINT loop
 Kernel.INSTANCE_OWNER (acursession,row_UNIQUECONSTRAINT.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_UNIQUECONSTRAINT.id);
end loop;
--close chld_UNIQUECONSTRAINT;
end ;
  delete from  UNIQUECONSTRAINT 
  where  UNIQUECONSTRAINTID = aUNIQUECONSTRAINTID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*����������� ������������*/
procedure UNIQUECONSTRAINT_SAVE /*����������� ������������*/ (
 aCURSESSION CHAR,
 aUNIQUECONSTRAINTid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2 := null /* �������� *//* �������� */
,aPerParent
 NUMBER/* �� �������� *//* �� �������� */
,aTheComment VARCHAR2 := null /* �������� *//* �������� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from UNIQUECONSTRAINT where UNIQUECONSTRAINTID=aUNIQUECONSTRAINTID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from UNIQUECONSTRAINT where UNIQUECONSTRAINTid=aUNIQUECONSTRAINTID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:UNIQUECONSTRAINT',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=UNIQUECONSTRAINT');
      return;
    end if;
  end if;
 --  verify lock  --
 UNIQUECONSTRAINT_ISLOCKED( acursession=>acursession,aROWID=>aUNIQUECONSTRAINTid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=UNIQUECONSTRAINT');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'UNIQUECONSTRAINT',
 aVERB=>'EDITROW',  aThe_Resource=>aUNIQUECONSTRAINTid,aLogInstanceID=>aInstanceID);
 update  UNIQUECONSTRAINT set ChangeStamp=sysdate
,
  Name=aName
,
  PerParent=aPerParent
,
  TheComment=aTheComment
  where  UNIQUECONSTRAINTID = aUNIQUECONSTRAINTID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from PART where PARTid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:UNIQUECONSTRAINT',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=UNIQUECONSTRAINT');
      return;
    end if;
 end if;
 PART_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=UNIQUECONSTRAINT');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'UNIQUECONSTRAINT',
 aVERB=>'CREATEROW',  aThe_Resource=>aUNIQUECONSTRAINTid,aLogInstanceID=>aInstanceID);
 insert into   UNIQUECONSTRAINT
 (  UNIQUECONSTRAINTID 
,ParentStructRowID
,Name

,PerParent

,TheComment

 ) values ( aUNIQUECONSTRAINTID 
,aParentStructRowID
,aName

,aPerParent

,aTheComment

 ); 
 UNIQUECONSTRAINT_SINIT( aCURSESSION,aUNIQUECONSTRAINTid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure UNIQUECONSTRAINT_PARENT /*����������� ������������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from UNIQUECONSTRAINT where  UNIQUECONSTRAINTid=aRowID;
  aParentTable := 'PART';
 end; 


procedure UNIQUECONSTRAINT_ISLOCKED /*����������� ������������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from UNIQUECONSTRAINT where UNIQUECONSTRAINTid=aRowID;
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
  UNIQUECONSTRAINT_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure UNIQUECONSTRAINT_LOCK /*����������� ������������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 UNIQUECONSTRAINT_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  UNIQUECONSTRAINT_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from UNIQUECONSTRAINT where UNIQUECONSTRAINTid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=UNIQUECONSTRAINT');
    return;
  end if;
   if  aLockMode =2  
   then   
    update UNIQUECONSTRAINT set LockUserID =auserID ,LockSessionID =null where UNIQUECONSTRAINTid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update UNIQUECONSTRAINT set LockUserID =null,LockSessionID =aCURSESSION  where UNIQUECONSTRAINTid=aRowID;
     return;
   end if;
 end ;


procedure UNIQUECONSTRAINT_HCL /*����������� ������������*/ (
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
declare cursor lch_CONSTRAINTFIELD is select CONSTRAINTFIELD.CONSTRAINTFIELDid ID from CONSTRAINTFIELD where  CONSTRAINTFIELD.ParentStructRowID = aRowid;
row_CONSTRAINTFIELD lch_CONSTRAINTFIELD%ROWTYPE;
begin  
--open lch_CONSTRAINTFIELD;
for row_CONSTRAINTFIELD in lch_CONSTRAINTFIELD
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from CONSTRAINTFIELD where CONSTRAINTFIELDid=row_CONSTRAINTFIELD.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_CONSTRAINTFIELD;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_CONSTRAINTFIELD;
     return;
   end if; 
 end if;  
 CONSTRAINTFIELD_HCL (acursession,row_CONSTRAINTFIELD.id,aisLocked);
 if aisLocked >2 then
   close lch_CONSTRAINTFIELD;
   return;
 end if;
end loop;
--close lch_CONSTRAINTFIELD;
end;
aIsLocked :=0;
end;


procedure UNIQUECONSTRAINT_UNLOCK /*����������� ������������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 UNIQUECONSTRAINT_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update UNIQUECONSTRAINT set LockUserID =null  where UNIQUECONSTRAINTid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update UNIQUECONSTRAINT set LockSessionID =null  where UNIQUECONSTRAINTid=aRowID;
     return;
   end if;
 end; 


procedure UNIQUECONSTRAINT_SINIT /*����������� ������������*/ (
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
 select  SecurityStyleID into atmpID from UNIQUECONSTRAINT where UNIQUECONSTRAINTid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =UNIQUECONSTRAINT');
    return;
  end if;
if aSecurityStyleID is null then
 UNIQUECONSTRAINT_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update UNIQUECONSTRAINT set securitystyleid =aStyleID where UNIQUECONSTRAINTid = aRowID;
else 
 update UNIQUECONSTRAINT set securitystyleid =aSecurityStyleID where UNIQUECONSTRAINTid = aRowID;
end if; 
end ; 


procedure UNIQUECONSTRAINT_propagate /*����������� ������������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from UNIQUECONSTRAINT where UNIQUECONSTRAINTid=aRowid;
declare cursor pch_CONSTRAINTFIELD  is select CONSTRAINTFIELD.CONSTRAINTFIELDid ID from CONSTRAINTFIELD where  CONSTRAINTFIELD.ParentStructRowID = aRowid;
row_CONSTRAINTFIELD  pch_CONSTRAINTFIELD%ROWTYPE;
begin
--open pch_CONSTRAINTFIELD;
for row_CONSTRAINTFIELD in pch_CONSTRAINTFIELD loop
   CONSTRAINTFIELD_SINIT( acursession,row_CONSTRAINTFIELD.id,assid);
   CONSTRAINTFIELD_propagate( acursession,row_CONSTRAINTFIELD.id);
end loop;
--close pch_CONSTRAINTFIELD;
end;
end;



procedure CONSTRAINTFIELD_BRIEF  (
 aCURSESSION CHAR,
 aCONSTRAINTFIELDid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aCONSTRAINTFIELDid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from CONSTRAINTFIELD where CONSTRAINTFIELDID=aCONSTRAINTFIELDID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from CONSTRAINTFIELD where CONSTRAINTFIELDid=aCONSTRAINTFIELDID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=CONSTRAINTFIELD');
    return;
  end if;
  aBRIEF:=func.CONSTRAINTFIELD_BRIEF_F(aCONSTRAINTFIELDid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure CONSTRAINTFIELD_DELETE /*���� �����������*/ (
 aCURSESSION CHAR,
 aCONSTRAINTFIELDid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from CONSTRAINTFIELD where CONSTRAINTFIELDID=aCONSTRAINTFIELDID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from CONSTRAINTFIELD where CONSTRAINTFIELDid=aCONSTRAINTFIELDID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:CONSTRAINTFIELD',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=CONSTRAINTFIELD');
      return;
    end if;
  end if;
 --  verify lock  --
 CONSTRAINTFIELD_ISLOCKED( acursession=>acursession,aROWID=>aCONSTRAINTFIELDid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=CONSTRAINTFIELD');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'CONSTRAINTFIELD',
 aVERB=>'DELETEROW',  aThe_Resource=>aCONSTRAINTFIELDid, aLogInstanceID=>aInstanceID);
declare cursor chld_CONSTRAINTFIELD is select  instanceid ID from instance where OwnerPartName ='CONSTRAINTFIELD' and OwnerRowID=aCONSTRAINTFIELDid;
row_CONSTRAINTFIELD  chld_CONSTRAINTFIELD%ROWTYPE;
begin
--open chld_CONSTRAINTFIELD;
for row_CONSTRAINTFIELD in chld_CONSTRAINTFIELD loop
 Kernel.INSTANCE_OWNER (acursession,row_CONSTRAINTFIELD.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_CONSTRAINTFIELD.id);
end loop;
--close chld_CONSTRAINTFIELD;
end ;
  delete from  CONSTRAINTFIELD 
  where  CONSTRAINTFIELDID = aCONSTRAINTFIELDID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*���� �����������*/
procedure CONSTRAINTFIELD_SAVE /*���� �����������*/ (
 aCURSESSION CHAR,
 aCONSTRAINTFIELDid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTheField CHAR/* ���� *//* ���� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from CONSTRAINTFIELD where CONSTRAINTFIELDID=aCONSTRAINTFIELDID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from CONSTRAINTFIELD where CONSTRAINTFIELDid=aCONSTRAINTFIELDID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:CONSTRAINTFIELD',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=CONSTRAINTFIELD');
      return;
    end if;
  end if;
 --  verify lock  --
 CONSTRAINTFIELD_ISLOCKED( acursession=>acursession,aROWID=>aCONSTRAINTFIELDid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=CONSTRAINTFIELD');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'CONSTRAINTFIELD',
 aVERB=>'EDITROW',  aThe_Resource=>aCONSTRAINTFIELDid,aLogInstanceID=>aInstanceID);
 update  CONSTRAINTFIELD set ChangeStamp=sysdate
,
  TheField=aTheField
  where  CONSTRAINTFIELDID = aCONSTRAINTFIELDID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from UNIQUECONSTRAINT where UNIQUECONSTRAINTid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:CONSTRAINTFIELD',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=CONSTRAINTFIELD');
      return;
    end if;
 end if;
 UNIQUECONSTRAINT_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=CONSTRAINTFIELD');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'CONSTRAINTFIELD',
 aVERB=>'CREATEROW',  aThe_Resource=>aCONSTRAINTFIELDid,aLogInstanceID=>aInstanceID);
 insert into   CONSTRAINTFIELD
 (  CONSTRAINTFIELDID 
,ParentStructRowID
,TheField

 ) values ( aCONSTRAINTFIELDID 
,aParentStructRowID
,aTheField

 ); 
 CONSTRAINTFIELD_SINIT( aCURSESSION,aCONSTRAINTFIELDid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure CONSTRAINTFIELD_PARENT /*���� �����������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from CONSTRAINTFIELD where  CONSTRAINTFIELDid=aRowID;
  aParentTable := 'UNIQUECONSTRAINT';
 end; 


procedure CONSTRAINTFIELD_ISLOCKED /*���� �����������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from CONSTRAINTFIELD where CONSTRAINTFIELDid=aRowID;
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
  CONSTRAINTFIELD_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure CONSTRAINTFIELD_LOCK /*���� �����������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 CONSTRAINTFIELD_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  CONSTRAINTFIELD_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from CONSTRAINTFIELD where CONSTRAINTFIELDid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=CONSTRAINTFIELD');
    return;
  end if;
   if  aLockMode =2  
   then   
    update CONSTRAINTFIELD set LockUserID =auserID ,LockSessionID =null where CONSTRAINTFIELDid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update CONSTRAINTFIELD set LockUserID =null,LockSessionID =aCURSESSION  where CONSTRAINTFIELDid=aRowID;
     return;
   end if;
 end ;


procedure CONSTRAINTFIELD_HCL /*���� �����������*/ (
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


procedure CONSTRAINTFIELD_UNLOCK /*���� �����������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 CONSTRAINTFIELD_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update CONSTRAINTFIELD set LockUserID =null  where CONSTRAINTFIELDid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update CONSTRAINTFIELD set LockSessionID =null  where CONSTRAINTFIELDid=aRowID;
     return;
   end if;
 end; 


procedure CONSTRAINTFIELD_SINIT /*���� �����������*/ (
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
 select  SecurityStyleID into atmpID from CONSTRAINTFIELD where CONSTRAINTFIELDid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =CONSTRAINTFIELD');
    return;
  end if;
if aSecurityStyleID is null then
 CONSTRAINTFIELD_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update CONSTRAINTFIELD set securitystyleid =aStyleID where CONSTRAINTFIELDid = aRowID;
else 
 update CONSTRAINTFIELD set securitystyleid =aSecurityStyleID where CONSTRAINTFIELDid = aRowID;
end if; 
end ; 


procedure CONSTRAINTFIELD_propagate /*���� �����������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from CONSTRAINTFIELD where CONSTRAINTFIELDid=aRowid;
end;



procedure INSTANCEVALIDATOR_BRIEF  (
 aCURSESSION CHAR,
 aINSTANCEVALIDATORid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aINSTANCEVALIDATORid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from INSTANCEVALIDATOR where INSTANCEVALIDATORID=aINSTANCEVALIDATORID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from INSTANCEVALIDATOR where INSTANCEVALIDATORid=aINSTANCEVALIDATORID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=INSTANCEVALIDATOR');
    return;
  end if;
  aBRIEF:=func.INSTANCEVALIDATOR_BRIEF_F(aINSTANCEVALIDATORid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure INSTANCEVALIDATOR_DELETE /*�������� ������������ ��� ������� � �����*/ (
 aCURSESSION CHAR,
 aINSTANCEVALIDATORid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from INSTANCEVALIDATOR where INSTANCEVALIDATORID=aINSTANCEVALIDATORID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from INSTANCEVALIDATOR where INSTANCEVALIDATORid=aINSTANCEVALIDATORID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:INSTANCEVALIDATOR',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=INSTANCEVALIDATOR');
      return;
    end if;
  end if;
 --  verify lock  --
 INSTANCEVALIDATOR_ISLOCKED( acursession=>acursession,aROWID=>aINSTANCEVALIDATORid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=INSTANCEVALIDATOR');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'INSTANCEVALIDATOR',
 aVERB=>'DELETEROW',  aThe_Resource=>aINSTANCEVALIDATORid, aLogInstanceID=>aInstanceID);
declare cursor chld_INSTANCEVALIDATOR is select  instanceid ID from instance where OwnerPartName ='INSTANCEVALIDATOR' and OwnerRowID=aINSTANCEVALIDATORid;
row_INSTANCEVALIDATOR  chld_INSTANCEVALIDATOR%ROWTYPE;
begin
--open chld_INSTANCEVALIDATOR;
for row_INSTANCEVALIDATOR in chld_INSTANCEVALIDATOR loop
 Kernel.INSTANCE_OWNER (acursession,row_INSTANCEVALIDATOR.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_INSTANCEVALIDATOR.id);
end loop;
--close chld_INSTANCEVALIDATOR;
end ;
  delete from  INSTANCEVALIDATOR 
  where  INSTANCEVALIDATORID = aINSTANCEVALIDATORID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*�������� ������������*/
procedure INSTANCEVALIDATOR_SAVE /*�������� ������������ ��� ������� � �����*/ (
 aCURSESSION CHAR,
 aINSTANCEVALIDATORid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTarget CHAR := null /* ��������� *//* ��������� */
,aCode VARCHAR2 := null /* ������ *//* ������ */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from INSTANCEVALIDATOR where INSTANCEVALIDATORID=aINSTANCEVALIDATORID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from INSTANCEVALIDATOR where INSTANCEVALIDATORid=aINSTANCEVALIDATORID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:INSTANCEVALIDATOR',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=INSTANCEVALIDATOR');
      return;
    end if;
  end if;
 --  verify lock  --
 INSTANCEVALIDATOR_ISLOCKED( acursession=>acursession,aROWID=>aINSTANCEVALIDATORid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=INSTANCEVALIDATOR');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'INSTANCEVALIDATOR',
 aVERB=>'EDITROW',  aThe_Resource=>aINSTANCEVALIDATORid,aLogInstanceID=>aInstanceID);
 update  INSTANCEVALIDATOR set ChangeStamp=sysdate
,
  Target=aTarget
,
  Code=aCode
  where  INSTANCEVALIDATORID = aINSTANCEVALIDATORID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from OBJECTTYPE where OBJECTTYPEid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:INSTANCEVALIDATOR',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=INSTANCEVALIDATOR');
      return;
    end if;
 end if;
 OBJECTTYPE_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=INSTANCEVALIDATOR');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'INSTANCEVALIDATOR',
 aVERB=>'CREATEROW',  aThe_Resource=>aINSTANCEVALIDATORid,aLogInstanceID=>aInstanceID);
 insert into   INSTANCEVALIDATOR
 (  INSTANCEVALIDATORID 
,ParentStructRowID
,Target

,Code

 ) values ( aINSTANCEVALIDATORID 
,aParentStructRowID
,aTarget

,aCode

 ); 
 INSTANCEVALIDATOR_SINIT( aCURSESSION,aINSTANCEVALIDATORid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure INSTANCEVALIDATOR_PARENT /*�������� ������������ ��� ������� � �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from INSTANCEVALIDATOR where  INSTANCEVALIDATORid=aRowID;
  aParentTable := 'OBJECTTYPE';
 end; 


procedure INSTANCEVALIDATOR_ISLOCKED /*�������� ������������ ��� ������� � �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from INSTANCEVALIDATOR where INSTANCEVALIDATORid=aRowID;
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
  INSTANCEVALIDATOR_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure INSTANCEVALIDATOR_LOCK /*�������� ������������ ��� ������� � �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 INSTANCEVALIDATOR_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  INSTANCEVALIDATOR_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from INSTANCEVALIDATOR where INSTANCEVALIDATORid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=INSTANCEVALIDATOR');
    return;
  end if;
   if  aLockMode =2  
   then   
    update INSTANCEVALIDATOR set LockUserID =auserID ,LockSessionID =null where INSTANCEVALIDATORid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update INSTANCEVALIDATOR set LockUserID =null,LockSessionID =aCURSESSION  where INSTANCEVALIDATORid=aRowID;
     return;
   end if;
 end ;


procedure INSTANCEVALIDATOR_HCL /*�������� ������������ ��� ������� � �����*/ (
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


procedure INSTANCEVALIDATOR_UNLOCK /*�������� ������������ ��� ������� � �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 INSTANCEVALIDATOR_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update INSTANCEVALIDATOR set LockUserID =null  where INSTANCEVALIDATORid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update INSTANCEVALIDATOR set LockSessionID =null  where INSTANCEVALIDATORid=aRowID;
     return;
   end if;
 end; 


procedure INSTANCEVALIDATOR_SINIT /*�������� ������������ ��� ������� � �����*/ (
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
 select  SecurityStyleID into atmpID from INSTANCEVALIDATOR where INSTANCEVALIDATORid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =INSTANCEVALIDATOR');
    return;
  end if;
if aSecurityStyleID is null then
 INSTANCEVALIDATOR_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update INSTANCEVALIDATOR set securitystyleid =aStyleID where INSTANCEVALIDATORid = aRowID;
else 
 update INSTANCEVALIDATOR set securitystyleid =aSecurityStyleID where INSTANCEVALIDATORid = aRowID;
end if; 
end ; 


procedure INSTANCEVALIDATOR_propagate /*�������� ������������ ��� ������� � �����*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from INSTANCEVALIDATOR where INSTANCEVALIDATORid=aRowid;
end;



procedure OBJSTATUS_BRIEF  (
 aCURSESSION CHAR,
 aOBJSTATUSid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aOBJSTATUSid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from OBJSTATUS where OBJSTATUSID=aOBJSTATUSID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from OBJSTATUS where OBJSTATUSid=aOBJSTATUSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=OBJSTATUS');
    return;
  end if;
  aBRIEF:=func.OBJSTATUS_BRIEF_F(aOBJSTATUSid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure OBJSTATUS_DELETE /*��������� ���������� ��������� ���������*/ (
 aCURSESSION CHAR,
 aOBJSTATUSid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from OBJSTATUS where OBJSTATUSID=aOBJSTATUSID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from OBJSTATUS where OBJSTATUSid=aOBJSTATUSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:OBJSTATUS',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=OBJSTATUS');
      return;
    end if;
  end if;
 --  verify lock  --
 OBJSTATUS_ISLOCKED( acursession=>acursession,aROWID=>aOBJSTATUSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=OBJSTATUS');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_NEXTSTATE is select NEXTSTATE.NEXTSTATEid ID from NEXTSTATE where  NEXTSTATE.ParentStructRowID = aOBJSTATUSid;
    child_NEXTSTATE_rec  child_NEXTSTATE%ROWTYPE;
    begin
    --open child_NEXTSTATE;
      for child_NEXTSTATE_rec in child_NEXTSTATE loop
      NEXTSTATE_DELETE (acursession,child_NEXTSTATE_rec.id,aInstanceid);
      end loop;
      --close child_NEXTSTATE;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'OBJSTATUS',
 aVERB=>'DELETEROW',  aThe_Resource=>aOBJSTATUSid, aLogInstanceID=>aInstanceID);
declare cursor chld_OBJSTATUS is select  instanceid ID from instance where OwnerPartName ='OBJSTATUS' and OwnerRowID=aOBJSTATUSid;
row_OBJSTATUS  chld_OBJSTATUS%ROWTYPE;
begin
--open chld_OBJSTATUS;
for row_OBJSTATUS in chld_OBJSTATUS loop
 Kernel.INSTANCE_OWNER (acursession,row_OBJSTATUS.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_OBJSTATUS.id);
end loop;
--close chld_OBJSTATUS;
end ;
  delete from  OBJSTATUS 
  where  OBJSTATUSID = aOBJSTATUSID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*���������*/
procedure OBJSTATUS_SAVE /*��������� ���������� ��������� ���������*/ (
 aCURSESSION CHAR,
 aOBJSTATUSid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aname
 VARCHAR2/* �������� *//* �������� */
,aisStartup
 NUMBER/* ��������� *//* ��������� */
,aIsArchive
 NUMBER/* �������� *//* �������� */
,athe_comment VARCHAR2 := null /* �������� *//* �������� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from OBJSTATUS where OBJSTATUSID=aOBJSTATUSID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from OBJSTATUS where OBJSTATUSid=aOBJSTATUSID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:OBJSTATUS',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=OBJSTATUS');
      return;
    end if;
  end if;
 --  verify lock  --
 OBJSTATUS_ISLOCKED( acursession=>acursession,aROWID=>aOBJSTATUSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=OBJSTATUS');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'OBJSTATUS',
 aVERB=>'EDITROW',  aThe_Resource=>aOBJSTATUSid,aLogInstanceID=>aInstanceID);
 update  OBJSTATUS set ChangeStamp=sysdate
,
  name=aname
,
  isStartup=aisStartup
,
  IsArchive=aIsArchive
,
  the_comment=athe_comment
  where  OBJSTATUSID = aOBJSTATUSID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from OBJECTTYPE where OBJECTTYPEid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:OBJSTATUS',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=OBJSTATUS');
      return;
    end if;
 end if;
 OBJECTTYPE_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=OBJSTATUS');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'OBJSTATUS',
 aVERB=>'CREATEROW',  aThe_Resource=>aOBJSTATUSid,aLogInstanceID=>aInstanceID);
 insert into   OBJSTATUS
 (  OBJSTATUSID 
,ParentStructRowID
,name

,isStartup

,IsArchive

,the_comment

 ) values ( aOBJSTATUSID 
,aParentStructRowID
,aname

,aisStartup

,aIsArchive

,athe_comment

 ); 
 OBJSTATUS_SINIT( aCURSESSION,aOBJSTATUSid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure OBJSTATUS_PARENT /*��������� ���������� ��������� ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from OBJSTATUS where  OBJSTATUSid=aRowID;
  aParentTable := 'OBJECTTYPE';
 end; 


procedure OBJSTATUS_ISLOCKED /*��������� ���������� ��������� ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from OBJSTATUS where OBJSTATUSid=aRowID;
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
  OBJSTATUS_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure OBJSTATUS_LOCK /*��������� ���������� ��������� ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 OBJSTATUS_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  OBJSTATUS_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from OBJSTATUS where OBJSTATUSid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=OBJSTATUS');
    return;
  end if;
   if  aLockMode =2  
   then   
    update OBJSTATUS set LockUserID =auserID ,LockSessionID =null where OBJSTATUSid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update OBJSTATUS set LockUserID =null,LockSessionID =aCURSESSION  where OBJSTATUSid=aRowID;
     return;
   end if;
 end ;


procedure OBJSTATUS_HCL /*��������� ���������� ��������� ���������*/ (
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
declare cursor lch_NEXTSTATE is select NEXTSTATE.NEXTSTATEid ID from NEXTSTATE where  NEXTSTATE.ParentStructRowID = aRowid;
row_NEXTSTATE lch_NEXTSTATE%ROWTYPE;
begin  
--open lch_NEXTSTATE;
for row_NEXTSTATE in lch_NEXTSTATE
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from NEXTSTATE where NEXTSTATEid=row_NEXTSTATE.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_NEXTSTATE;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_NEXTSTATE;
     return;
   end if; 
 end if;  
 NEXTSTATE_HCL (acursession,row_NEXTSTATE.id,aisLocked);
 if aisLocked >2 then
   close lch_NEXTSTATE;
   return;
 end if;
end loop;
--close lch_NEXTSTATE;
end;
aIsLocked :=0;
end;


procedure OBJSTATUS_UNLOCK /*��������� ���������� ��������� ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 OBJSTATUS_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update OBJSTATUS set LockUserID =null  where OBJSTATUSid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update OBJSTATUS set LockSessionID =null  where OBJSTATUSid=aRowID;
     return;
   end if;
 end; 


procedure OBJSTATUS_SINIT /*��������� ���������� ��������� ���������*/ (
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
 select  SecurityStyleID into atmpID from OBJSTATUS where OBJSTATUSid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =OBJSTATUS');
    return;
  end if;
if aSecurityStyleID is null then
 OBJSTATUS_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update OBJSTATUS set securitystyleid =aStyleID where OBJSTATUSid = aRowID;
else 
 update OBJSTATUS set securitystyleid =aSecurityStyleID where OBJSTATUSid = aRowID;
end if; 
end ; 


procedure OBJSTATUS_propagate /*��������� ���������� ��������� ���������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from OBJSTATUS where OBJSTATUSid=aRowid;
declare cursor pch_NEXTSTATE  is select NEXTSTATE.NEXTSTATEid ID from NEXTSTATE where  NEXTSTATE.ParentStructRowID = aRowid;
row_NEXTSTATE  pch_NEXTSTATE%ROWTYPE;
begin
--open pch_NEXTSTATE;
for row_NEXTSTATE in pch_NEXTSTATE loop
   NEXTSTATE_SINIT( acursession,row_NEXTSTATE.id,assid);
   NEXTSTATE_propagate( acursession,row_NEXTSTATE.id);
end loop;
--close pch_NEXTSTATE;
end;
end;



procedure NEXTSTATE_BRIEF  (
 aCURSESSION CHAR,
 aNEXTSTATEid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aNEXTSTATEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from NEXTSTATE where NEXTSTATEID=aNEXTSTATEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from NEXTSTATE where NEXTSTATEid=aNEXTSTATEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=NEXTSTATE');
    return;
  end if;
  aBRIEF:=func.NEXTSTATE_BRIEF_F(aNEXTSTATEid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure NEXTSTATE_DELETE /*������� ��������� */ (
 aCURSESSION CHAR,
 aNEXTSTATEid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from NEXTSTATE where NEXTSTATEID=aNEXTSTATEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from NEXTSTATE where NEXTSTATEid=aNEXTSTATEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:NEXTSTATE',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=NEXTSTATE');
      return;
    end if;
  end if;
 --  verify lock  --
 NEXTSTATE_ISLOCKED( acursession=>acursession,aROWID=>aNEXTSTATEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=NEXTSTATE');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'NEXTSTATE',
 aVERB=>'DELETEROW',  aThe_Resource=>aNEXTSTATEid, aLogInstanceID=>aInstanceID);
declare cursor chld_NEXTSTATE is select  instanceid ID from instance where OwnerPartName ='NEXTSTATE' and OwnerRowID=aNEXTSTATEid;
row_NEXTSTATE  chld_NEXTSTATE%ROWTYPE;
begin
--open chld_NEXTSTATE;
for row_NEXTSTATE in chld_NEXTSTATE loop
 Kernel.INSTANCE_OWNER (acursession,row_NEXTSTATE.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_NEXTSTATE.id);
end loop;
--close chld_NEXTSTATE;
end ;
  delete from  NEXTSTATE 
  where  NEXTSTATEID = aNEXTSTATEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*����������� ��������*/
procedure NEXTSTATE_SAVE /*������� ��������� */ (
 aCURSESSION CHAR,
 aNEXTSTATEid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTheState CHAR/* ����������� ��������� *//* ����������� ��������� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from NEXTSTATE where NEXTSTATEID=aNEXTSTATEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from NEXTSTATE where NEXTSTATEid=aNEXTSTATEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:NEXTSTATE',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=NEXTSTATE');
      return;
    end if;
  end if;
 --  verify lock  --
 NEXTSTATE_ISLOCKED( acursession=>acursession,aROWID=>aNEXTSTATEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=NEXTSTATE');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'NEXTSTATE',
 aVERB=>'EDITROW',  aThe_Resource=>aNEXTSTATEid,aLogInstanceID=>aInstanceID);
 update  NEXTSTATE set ChangeStamp=sysdate
,
  TheState=aTheState
  where  NEXTSTATEID = aNEXTSTATEID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from OBJSTATUS where OBJSTATUSid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:NEXTSTATE',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=NEXTSTATE');
      return;
    end if;
 end if;
 OBJSTATUS_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=NEXTSTATE');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'NEXTSTATE',
 aVERB=>'CREATEROW',  aThe_Resource=>aNEXTSTATEid,aLogInstanceID=>aInstanceID);
 insert into   NEXTSTATE
 (  NEXTSTATEID 
,ParentStructRowID
,TheState

 ) values ( aNEXTSTATEID 
,aParentStructRowID
,aTheState

 ); 
 NEXTSTATE_SINIT( aCURSESSION,aNEXTSTATEid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure NEXTSTATE_PARENT /*������� ��������� */ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from NEXTSTATE where  NEXTSTATEid=aRowID;
  aParentTable := 'OBJSTATUS';
 end; 


procedure NEXTSTATE_ISLOCKED /*������� ��������� */ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from NEXTSTATE where NEXTSTATEid=aRowID;
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
  NEXTSTATE_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure NEXTSTATE_LOCK /*������� ��������� */ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 NEXTSTATE_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  NEXTSTATE_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from NEXTSTATE where NEXTSTATEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=NEXTSTATE');
    return;
  end if;
   if  aLockMode =2  
   then   
    update NEXTSTATE set LockUserID =auserID ,LockSessionID =null where NEXTSTATEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update NEXTSTATE set LockUserID =null,LockSessionID =aCURSESSION  where NEXTSTATEid=aRowID;
     return;
   end if;
 end ;


procedure NEXTSTATE_HCL /*������� ��������� */ (
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


procedure NEXTSTATE_UNLOCK /*������� ��������� */ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 NEXTSTATE_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update NEXTSTATE set LockUserID =null  where NEXTSTATEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update NEXTSTATE set LockSessionID =null  where NEXTSTATEid=aRowID;
     return;
   end if;
 end; 


procedure NEXTSTATE_SINIT /*������� ��������� */ (
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
 select  SecurityStyleID into atmpID from NEXTSTATE where NEXTSTATEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =NEXTSTATE');
    return;
  end if;
if aSecurityStyleID is null then
 NEXTSTATE_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update NEXTSTATE set securitystyleid =aStyleID where NEXTSTATEid = aRowID;
else 
 update NEXTSTATE set securitystyleid =aSecurityStyleID where NEXTSTATEid = aRowID;
end if; 
end ; 


procedure NEXTSTATE_propagate /*������� ��������� */ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from NEXTSTATE where NEXTSTATEid=aRowid;
end;



procedure OBJECTMODE_BRIEF  (
 aCURSESSION CHAR,
 aOBJECTMODEid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aOBJECTMODEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from OBJECTMODE where OBJECTMODEID=aOBJECTMODEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from OBJECTMODE where OBJECTMODEid=aOBJECTMODEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=OBJECTMODE');
    return;
  end if;
  aBRIEF:=func.OBJECTMODE_BRIEF_F(aOBJECTMODEid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure OBJECTMODE_DELETE /*����� ������*/ (
 aCURSESSION CHAR,
 aOBJECTMODEid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from OBJECTMODE where OBJECTMODEID=aOBJECTMODEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from OBJECTMODE where OBJECTMODEid=aOBJECTMODEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:OBJECTMODE',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=OBJECTMODE');
      return;
    end if;
  end if;
 --  verify lock  --
 OBJECTMODE_ISLOCKED( acursession=>acursession,aROWID=>aOBJECTMODEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=OBJECTMODE');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_STRUCTRESTRICTION is select STRUCTRESTRICTION.STRUCTRESTRICTIONid ID from STRUCTRESTRICTION where  STRUCTRESTRICTION.ParentStructRowID = aOBJECTMODEid;
    child_STRUCTRESTRICTION_rec  child_STRUCTRESTRICTION%ROWTYPE;
    begin
    --open child_STRUCTRESTRICTION;
      for child_STRUCTRESTRICTION_rec in child_STRUCTRESTRICTION loop
      STRUCTRESTRICTION_DELETE (acursession,child_STRUCTRESTRICTION_rec.id,aInstanceid);
      end loop;
      --close child_STRUCTRESTRICTION;
    end ;
    declare cursor child_FIELDRESTRICTION is select FIELDRESTRICTION.FIELDRESTRICTIONid ID from FIELDRESTRICTION where  FIELDRESTRICTION.ParentStructRowID = aOBJECTMODEid;
    child_FIELDRESTRICTION_rec  child_FIELDRESTRICTION%ROWTYPE;
    begin
    --open child_FIELDRESTRICTION;
      for child_FIELDRESTRICTION_rec in child_FIELDRESTRICTION loop
      FIELDRESTRICTION_DELETE (acursession,child_FIELDRESTRICTION_rec.id,aInstanceid);
      end loop;
      --close child_FIELDRESTRICTION;
    end ;
    declare cursor child_METHODRESTRICTION is select METHODRESTRICTION.METHODRESTRICTIONid ID from METHODRESTRICTION where  METHODRESTRICTION.ParentStructRowID = aOBJECTMODEid;
    child_METHODRESTRICTION_rec  child_METHODRESTRICTION%ROWTYPE;
    begin
    --open child_METHODRESTRICTION;
      for child_METHODRESTRICTION_rec in child_METHODRESTRICTION loop
      METHODRESTRICTION_DELETE (acursession,child_METHODRESTRICTION_rec.id,aInstanceid);
      end loop;
      --close child_METHODRESTRICTION;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'OBJECTMODE',
 aVERB=>'DELETEROW',  aThe_Resource=>aOBJECTMODEid, aLogInstanceID=>aInstanceID);
declare cursor chld_OBJECTMODE is select  instanceid ID from instance where OwnerPartName ='OBJECTMODE' and OwnerRowID=aOBJECTMODEid;
row_OBJECTMODE  chld_OBJECTMODE%ROWTYPE;
begin
--open chld_OBJECTMODE;
for row_OBJECTMODE in chld_OBJECTMODE loop
 Kernel.INSTANCE_OWNER (acursession,row_OBJECTMODE.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_OBJECTMODE.id);
end loop;
--close chld_OBJECTMODE;
end ;
  delete from  OBJECTMODE 
  where  OBJECTMODEID = aOBJECTMODEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*����� ������*/
procedure OBJECTMODE_SAVE /*����� ������*/ (
 aCURSESSION CHAR,
 aOBJECTMODEid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2/* �������� ������ *//* �������� ������ */
,aDefaultMode
 NUMBER := null /* ���� ����� �������� �������� ������� ������ ������� *//* ���� ����� �������� �������� ������� ������ ������� */
,aTheComment VARCHAR2 := null /* �������� *//* �������� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from OBJECTMODE where OBJECTMODEID=aOBJECTMODEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from OBJECTMODE where OBJECTMODEid=aOBJECTMODEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:OBJECTMODE',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=OBJECTMODE');
      return;
    end if;
  end if;
 --  verify lock  --
 OBJECTMODE_ISLOCKED( acursession=>acursession,aROWID=>aOBJECTMODEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=OBJECTMODE');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'OBJECTMODE',
 aVERB=>'EDITROW',  aThe_Resource=>aOBJECTMODEid,aLogInstanceID=>aInstanceID);
 update  OBJECTMODE set ChangeStamp=sysdate
,
  Name=aName
,
  DefaultMode=aDefaultMode
,
  TheComment=aTheComment
  where  OBJECTMODEID = aOBJECTMODEID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from OBJECTTYPE where OBJECTTYPEid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:OBJECTMODE',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=OBJECTMODE');
      return;
    end if;
 end if;
 OBJECTTYPE_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=OBJECTMODE');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'OBJECTMODE',
 aVERB=>'CREATEROW',  aThe_Resource=>aOBJECTMODEid,aLogInstanceID=>aInstanceID);
 insert into   OBJECTMODE
 (  OBJECTMODEID 
,ParentStructRowID
,Name

,DefaultMode

,TheComment

 ) values ( aOBJECTMODEID 
,aParentStructRowID
,aName

,aDefaultMode

,aTheComment

 ); 
 OBJECTMODE_SINIT( aCURSESSION,aOBJECTMODEid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure OBJECTMODE_PARENT /*����� ������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from OBJECTMODE where  OBJECTMODEid=aRowID;
  aParentTable := 'OBJECTTYPE';
 end; 


procedure OBJECTMODE_ISLOCKED /*����� ������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from OBJECTMODE where OBJECTMODEid=aRowID;
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
  OBJECTMODE_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure OBJECTMODE_LOCK /*����� ������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 OBJECTMODE_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  OBJECTMODE_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from OBJECTMODE where OBJECTMODEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=OBJECTMODE');
    return;
  end if;
   if  aLockMode =2  
   then   
    update OBJECTMODE set LockUserID =auserID ,LockSessionID =null where OBJECTMODEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update OBJECTMODE set LockUserID =null,LockSessionID =aCURSESSION  where OBJECTMODEid=aRowID;
     return;
   end if;
 end ;


procedure OBJECTMODE_HCL /*����� ������*/ (
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
declare cursor lch_STRUCTRESTRICTION is select STRUCTRESTRICTION.STRUCTRESTRICTIONid ID from STRUCTRESTRICTION where  STRUCTRESTRICTION.ParentStructRowID = aRowid;
row_STRUCTRESTRICTION lch_STRUCTRESTRICTION%ROWTYPE;
begin  
--open lch_STRUCTRESTRICTION;
for row_STRUCTRESTRICTION in lch_STRUCTRESTRICTION
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from STRUCTRESTRICTION where STRUCTRESTRICTIONid=row_STRUCTRESTRICTION.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_STRUCTRESTRICTION;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_STRUCTRESTRICTION;
     return;
   end if; 
 end if;  
 STRUCTRESTRICTION_HCL (acursession,row_STRUCTRESTRICTION.id,aisLocked);
 if aisLocked >2 then
   close lch_STRUCTRESTRICTION;
   return;
 end if;
end loop;
--close lch_STRUCTRESTRICTION;
end;
declare cursor lch_FIELDRESTRICTION is select FIELDRESTRICTION.FIELDRESTRICTIONid ID from FIELDRESTRICTION where  FIELDRESTRICTION.ParentStructRowID = aRowid;
row_FIELDRESTRICTION lch_FIELDRESTRICTION%ROWTYPE;
begin  
--open lch_FIELDRESTRICTION;
for row_FIELDRESTRICTION in lch_FIELDRESTRICTION
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from FIELDRESTRICTION where FIELDRESTRICTIONid=row_FIELDRESTRICTION.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_FIELDRESTRICTION;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_FIELDRESTRICTION;
     return;
   end if; 
 end if;  
 FIELDRESTRICTION_HCL (acursession,row_FIELDRESTRICTION.id,aisLocked);
 if aisLocked >2 then
   close lch_FIELDRESTRICTION;
   return;
 end if;
end loop;
--close lch_FIELDRESTRICTION;
end;
declare cursor lch_METHODRESTRICTION is select METHODRESTRICTION.METHODRESTRICTIONid ID from METHODRESTRICTION where  METHODRESTRICTION.ParentStructRowID = aRowid;
row_METHODRESTRICTION lch_METHODRESTRICTION%ROWTYPE;
begin  
--open lch_METHODRESTRICTION;
for row_METHODRESTRICTION in lch_METHODRESTRICTION
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from METHODRESTRICTION where METHODRESTRICTIONid=row_METHODRESTRICTION.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_METHODRESTRICTION;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_METHODRESTRICTION;
     return;
   end if; 
 end if;  
 METHODRESTRICTION_HCL (acursession,row_METHODRESTRICTION.id,aisLocked);
 if aisLocked >2 then
   close lch_METHODRESTRICTION;
   return;
 end if;
end loop;
--close lch_METHODRESTRICTION;
end;
aIsLocked :=0;
end;


procedure OBJECTMODE_UNLOCK /*����� ������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 OBJECTMODE_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update OBJECTMODE set LockUserID =null  where OBJECTMODEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update OBJECTMODE set LockSessionID =null  where OBJECTMODEid=aRowID;
     return;
   end if;
 end; 


procedure OBJECTMODE_SINIT /*����� ������*/ (
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
 select  SecurityStyleID into atmpID from OBJECTMODE where OBJECTMODEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =OBJECTMODE');
    return;
  end if;
if aSecurityStyleID is null then
 OBJECTMODE_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update OBJECTMODE set securitystyleid =aStyleID where OBJECTMODEid = aRowID;
else 
 update OBJECTMODE set securitystyleid =aSecurityStyleID where OBJECTMODEid = aRowID;
end if; 
end ; 


procedure OBJECTMODE_propagate /*����� ������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from OBJECTMODE where OBJECTMODEid=aRowid;
declare cursor pch_STRUCTRESTRICTION  is select STRUCTRESTRICTION.STRUCTRESTRICTIONid ID from STRUCTRESTRICTION where  STRUCTRESTRICTION.ParentStructRowID = aRowid;
row_STRUCTRESTRICTION  pch_STRUCTRESTRICTION%ROWTYPE;
begin
--open pch_STRUCTRESTRICTION;
for row_STRUCTRESTRICTION in pch_STRUCTRESTRICTION loop
   STRUCTRESTRICTION_SINIT( acursession,row_STRUCTRESTRICTION.id,assid);
   STRUCTRESTRICTION_propagate( acursession,row_STRUCTRESTRICTION.id);
end loop;
--close pch_STRUCTRESTRICTION;
end;
declare cursor pch_FIELDRESTRICTION  is select FIELDRESTRICTION.FIELDRESTRICTIONid ID from FIELDRESTRICTION where  FIELDRESTRICTION.ParentStructRowID = aRowid;
row_FIELDRESTRICTION  pch_FIELDRESTRICTION%ROWTYPE;
begin
--open pch_FIELDRESTRICTION;
for row_FIELDRESTRICTION in pch_FIELDRESTRICTION loop
   FIELDRESTRICTION_SINIT( acursession,row_FIELDRESTRICTION.id,assid);
   FIELDRESTRICTION_propagate( acursession,row_FIELDRESTRICTION.id);
end loop;
--close pch_FIELDRESTRICTION;
end;
declare cursor pch_METHODRESTRICTION  is select METHODRESTRICTION.METHODRESTRICTIONid ID from METHODRESTRICTION where  METHODRESTRICTION.ParentStructRowID = aRowid;
row_METHODRESTRICTION  pch_METHODRESTRICTION%ROWTYPE;
begin
--open pch_METHODRESTRICTION;
for row_METHODRESTRICTION in pch_METHODRESTRICTION loop
   METHODRESTRICTION_SINIT( acursession,row_METHODRESTRICTION.id,assid);
   METHODRESTRICTION_propagate( acursession,row_METHODRESTRICTION.id);
end loop;
--close pch_METHODRESTRICTION;
end;
end;



procedure STRUCTRESTRICTION_BRIEF  (
 aCURSESSION CHAR,
 aSTRUCTRESTRICTIONid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aSTRUCTRESTRICTIONid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from STRUCTRESTRICTION where STRUCTRESTRICTIONID=aSTRUCTRESTRICTIONID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from STRUCTRESTRICTION where STRUCTRESTRICTIONid=aSTRUCTRESTRICTIONID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=STRUCTRESTRICTION');
    return;
  end if;
  aBRIEF:=func.STRUCTRESTRICTION_BRIEF_F(aSTRUCTRESTRICTIONid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure STRUCTRESTRICTION_DELETE /*���������� �� ������ � ������� ���������*/ (
 aCURSESSION CHAR,
 aSTRUCTRESTRICTIONid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from STRUCTRESTRICTION where STRUCTRESTRICTIONID=aSTRUCTRESTRICTIONID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from STRUCTRESTRICTION where STRUCTRESTRICTIONid=aSTRUCTRESTRICTIONID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:STRUCTRESTRICTION',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=STRUCTRESTRICTION');
      return;
    end if;
  end if;
 --  verify lock  --
 STRUCTRESTRICTION_ISLOCKED( acursession=>acursession,aROWID=>aSTRUCTRESTRICTIONid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=STRUCTRESTRICTION');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'STRUCTRESTRICTION',
 aVERB=>'DELETEROW',  aThe_Resource=>aSTRUCTRESTRICTIONid, aLogInstanceID=>aInstanceID);
declare cursor chld_STRUCTRESTRICTION is select  instanceid ID from instance where OwnerPartName ='STRUCTRESTRICTION' and OwnerRowID=aSTRUCTRESTRICTIONid;
row_STRUCTRESTRICTION  chld_STRUCTRESTRICTION%ROWTYPE;
begin
--open chld_STRUCTRESTRICTION;
for row_STRUCTRESTRICTION in chld_STRUCTRESTRICTION loop
 Kernel.INSTANCE_OWNER (acursession,row_STRUCTRESTRICTION.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_STRUCTRESTRICTION.id);
end loop;
--close chld_STRUCTRESTRICTION;
end ;
  delete from  STRUCTRESTRICTION 
  where  STRUCTRESTRICTIONID = aSTRUCTRESTRICTIONID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*����������� ��������*/
procedure STRUCTRESTRICTION_SAVE /*���������� �� ������ � ������� ���������*/ (
 aCURSESSION CHAR,
 aSTRUCTRESTRICTIONid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aStruct CHAR := null /* ���������, ������ � ������� ��������� *//* ���������, ������ � ������� ��������� */
,aAllowRead
 NUMBER := null /* �������� �������� *//* �������� �������� */
,aAllowAdd
 NUMBER := null /* ��������� ��������� *//* ��������� ��������� */
,aAllowEdit
 NUMBER := null /* ��������� �������� *//* ��������� �������� */
,aAllowDelete
 NUMBER := null /* ��������� ������� *//* ��������� ������� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from STRUCTRESTRICTION where STRUCTRESTRICTIONID=aSTRUCTRESTRICTIONID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from STRUCTRESTRICTION where STRUCTRESTRICTIONid=aSTRUCTRESTRICTIONID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:STRUCTRESTRICTION',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=STRUCTRESTRICTION');
      return;
    end if;
  end if;
 --  verify lock  --
 STRUCTRESTRICTION_ISLOCKED( acursession=>acursession,aROWID=>aSTRUCTRESTRICTIONid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=STRUCTRESTRICTION');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'STRUCTRESTRICTION',
 aVERB=>'EDITROW',  aThe_Resource=>aSTRUCTRESTRICTIONid,aLogInstanceID=>aInstanceID);
 update  STRUCTRESTRICTION set ChangeStamp=sysdate
,
  Struct=aStruct
,
  AllowRead=aAllowRead
,
  AllowAdd=aAllowAdd
,
  AllowEdit=aAllowEdit
,
  AllowDelete=aAllowDelete
  where  STRUCTRESTRICTIONID = aSTRUCTRESTRICTIONID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from OBJECTMODE where OBJECTMODEid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:STRUCTRESTRICTION',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=STRUCTRESTRICTION');
      return;
    end if;
 end if;
 OBJECTMODE_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=STRUCTRESTRICTION');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'STRUCTRESTRICTION',
 aVERB=>'CREATEROW',  aThe_Resource=>aSTRUCTRESTRICTIONid,aLogInstanceID=>aInstanceID);
 insert into   STRUCTRESTRICTION
 (  STRUCTRESTRICTIONID 
,ParentStructRowID
,Struct

,AllowRead

,AllowAdd

,AllowEdit

,AllowDelete

 ) values ( aSTRUCTRESTRICTIONID 
,aParentStructRowID
,aStruct

,aAllowRead

,aAllowAdd

,aAllowEdit

,aAllowDelete

 ); 
 STRUCTRESTRICTION_SINIT( aCURSESSION,aSTRUCTRESTRICTIONid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure STRUCTRESTRICTION_PARENT /*���������� �� ������ � ������� ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from STRUCTRESTRICTION where  STRUCTRESTRICTIONid=aRowID;
  aParentTable := 'OBJECTMODE';
 end; 


procedure STRUCTRESTRICTION_ISLOCKED /*���������� �� ������ � ������� ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from STRUCTRESTRICTION where STRUCTRESTRICTIONid=aRowID;
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
  STRUCTRESTRICTION_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure STRUCTRESTRICTION_LOCK /*���������� �� ������ � ������� ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 STRUCTRESTRICTION_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  STRUCTRESTRICTION_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from STRUCTRESTRICTION where STRUCTRESTRICTIONid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=STRUCTRESTRICTION');
    return;
  end if;
   if  aLockMode =2  
   then   
    update STRUCTRESTRICTION set LockUserID =auserID ,LockSessionID =null where STRUCTRESTRICTIONid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update STRUCTRESTRICTION set LockUserID =null,LockSessionID =aCURSESSION  where STRUCTRESTRICTIONid=aRowID;
     return;
   end if;
 end ;


procedure STRUCTRESTRICTION_HCL /*���������� �� ������ � ������� ���������*/ (
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


procedure STRUCTRESTRICTION_UNLOCK /*���������� �� ������ � ������� ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 STRUCTRESTRICTION_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update STRUCTRESTRICTION set LockUserID =null  where STRUCTRESTRICTIONid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update STRUCTRESTRICTION set LockSessionID =null  where STRUCTRESTRICTIONid=aRowID;
     return;
   end if;
 end; 


procedure STRUCTRESTRICTION_SINIT /*���������� �� ������ � ������� ���������*/ (
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
 select  SecurityStyleID into atmpID from STRUCTRESTRICTION where STRUCTRESTRICTIONid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =STRUCTRESTRICTION');
    return;
  end if;
if aSecurityStyleID is null then
 STRUCTRESTRICTION_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update STRUCTRESTRICTION set securitystyleid =aStyleID where STRUCTRESTRICTIONid = aRowID;
else 
 update STRUCTRESTRICTION set securitystyleid =aSecurityStyleID where STRUCTRESTRICTIONid = aRowID;
end if; 
end ; 


procedure STRUCTRESTRICTION_propagate /*���������� �� ������ � ������� ���������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from STRUCTRESTRICTION where STRUCTRESTRICTIONid=aRowid;
end;



procedure FIELDRESTRICTION_BRIEF  (
 aCURSESSION CHAR,
 aFIELDRESTRICTIONid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aFIELDRESTRICTIONid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from FIELDRESTRICTION where FIELDRESTRICTIONID=aFIELDRESTRICTIONID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from FIELDRESTRICTION where FIELDRESTRICTIONid=aFIELDRESTRICTIONID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=FIELDRESTRICTION');
    return;
  end if;
  aBRIEF:=func.FIELDRESTRICTION_BRIEF_F(aFIELDRESTRICTIONid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure FIELDRESTRICTION_DELETE /*����������� �� ������ � ����� �������*/ (
 aCURSESSION CHAR,
 aFIELDRESTRICTIONid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from FIELDRESTRICTION where FIELDRESTRICTIONID=aFIELDRESTRICTIONID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from FIELDRESTRICTION where FIELDRESTRICTIONid=aFIELDRESTRICTIONID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:FIELDRESTRICTION',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=FIELDRESTRICTION');
      return;
    end if;
  end if;
 --  verify lock  --
 FIELDRESTRICTION_ISLOCKED( acursession=>acursession,aROWID=>aFIELDRESTRICTIONid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=FIELDRESTRICTION');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'FIELDRESTRICTION',
 aVERB=>'DELETEROW',  aThe_Resource=>aFIELDRESTRICTIONid, aLogInstanceID=>aInstanceID);
declare cursor chld_FIELDRESTRICTION is select  instanceid ID from instance where OwnerPartName ='FIELDRESTRICTION' and OwnerRowID=aFIELDRESTRICTIONid;
row_FIELDRESTRICTION  chld_FIELDRESTRICTION%ROWTYPE;
begin
--open chld_FIELDRESTRICTION;
for row_FIELDRESTRICTION in chld_FIELDRESTRICTION loop
 Kernel.INSTANCE_OWNER (acursession,row_FIELDRESTRICTION.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_FIELDRESTRICTION.id);
end loop;
--close chld_FIELDRESTRICTION;
end ;
  delete from  FIELDRESTRICTION 
  where  FIELDRESTRICTIONID = aFIELDRESTRICTIONID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*����������� �����*/
procedure FIELDRESTRICTION_SAVE /*����������� �� ������ � ����� �������*/ (
 aCURSESSION CHAR,
 aFIELDRESTRICTIONid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aThePart CHAR := null /* ���������, ������� ����������� ���� *//* ���������, ������� ����������� ���� */
,aTheField CHAR := null /* ����, �� ������� ������������� ����������� *//* ����, �� ������� ������������� ����������� */
,aAllowRead
 NUMBER := null /* �������� �������� *//* �������� �������� */
,aAllowModify
 NUMBER := null /* ��������� ����������� *//* ��������� ����������� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from FIELDRESTRICTION where FIELDRESTRICTIONID=aFIELDRESTRICTIONID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from FIELDRESTRICTION where FIELDRESTRICTIONid=aFIELDRESTRICTIONID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:FIELDRESTRICTION',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=FIELDRESTRICTION');
      return;
    end if;
  end if;
 --  verify lock  --
 FIELDRESTRICTION_ISLOCKED( acursession=>acursession,aROWID=>aFIELDRESTRICTIONid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=FIELDRESTRICTION');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'FIELDRESTRICTION',
 aVERB=>'EDITROW',  aThe_Resource=>aFIELDRESTRICTIONid,aLogInstanceID=>aInstanceID);
 update  FIELDRESTRICTION set ChangeStamp=sysdate
,
  ThePart=aThePart
,
  TheField=aTheField
,
  AllowRead=aAllowRead
,
  AllowModify=aAllowModify
  where  FIELDRESTRICTIONID = aFIELDRESTRICTIONID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from OBJECTMODE where OBJECTMODEid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:FIELDRESTRICTION',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=FIELDRESTRICTION');
      return;
    end if;
 end if;
 OBJECTMODE_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=FIELDRESTRICTION');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'FIELDRESTRICTION',
 aVERB=>'CREATEROW',  aThe_Resource=>aFIELDRESTRICTIONid,aLogInstanceID=>aInstanceID);
 insert into   FIELDRESTRICTION
 (  FIELDRESTRICTIONID 
,ParentStructRowID
,ThePart

,TheField

,AllowRead

,AllowModify

 ) values ( aFIELDRESTRICTIONID 
,aParentStructRowID
,aThePart

,aTheField

,aAllowRead

,aAllowModify

 ); 
 FIELDRESTRICTION_SINIT( aCURSESSION,aFIELDRESTRICTIONid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure FIELDRESTRICTION_PARENT /*����������� �� ������ � ����� �������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from FIELDRESTRICTION where  FIELDRESTRICTIONid=aRowID;
  aParentTable := 'OBJECTMODE';
 end; 


procedure FIELDRESTRICTION_ISLOCKED /*����������� �� ������ � ����� �������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from FIELDRESTRICTION where FIELDRESTRICTIONid=aRowID;
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
  FIELDRESTRICTION_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure FIELDRESTRICTION_LOCK /*����������� �� ������ � ����� �������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 FIELDRESTRICTION_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  FIELDRESTRICTION_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from FIELDRESTRICTION where FIELDRESTRICTIONid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=FIELDRESTRICTION');
    return;
  end if;
   if  aLockMode =2  
   then   
    update FIELDRESTRICTION set LockUserID =auserID ,LockSessionID =null where FIELDRESTRICTIONid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update FIELDRESTRICTION set LockUserID =null,LockSessionID =aCURSESSION  where FIELDRESTRICTIONid=aRowID;
     return;
   end if;
 end ;


procedure FIELDRESTRICTION_HCL /*����������� �� ������ � ����� �������*/ (
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


procedure FIELDRESTRICTION_UNLOCK /*����������� �� ������ � ����� �������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 FIELDRESTRICTION_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update FIELDRESTRICTION set LockUserID =null  where FIELDRESTRICTIONid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update FIELDRESTRICTION set LockSessionID =null  where FIELDRESTRICTIONid=aRowID;
     return;
   end if;
 end; 


procedure FIELDRESTRICTION_SINIT /*����������� �� ������ � ����� �������*/ (
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
 select  SecurityStyleID into atmpID from FIELDRESTRICTION where FIELDRESTRICTIONid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =FIELDRESTRICTION');
    return;
  end if;
if aSecurityStyleID is null then
 FIELDRESTRICTION_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update FIELDRESTRICTION set securitystyleid =aStyleID where FIELDRESTRICTIONid = aRowID;
else 
 update FIELDRESTRICTION set securitystyleid =aSecurityStyleID where FIELDRESTRICTIONid = aRowID;
end if; 
end ; 


procedure FIELDRESTRICTION_propagate /*����������� �� ������ � ����� �������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from FIELDRESTRICTION where FIELDRESTRICTIONid=aRowid;
end;



procedure METHODRESTRICTION_BRIEF  (
 aCURSESSION CHAR,
 aMETHODRESTRICTIONid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aMETHODRESTRICTIONid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from METHODRESTRICTION where METHODRESTRICTIONID=aMETHODRESTRICTIONID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from METHODRESTRICTION where METHODRESTRICTIONid=aMETHODRESTRICTIONID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=METHODRESTRICTION');
    return;
  end if;
  aBRIEF:=func.METHODRESTRICTION_BRIEF_F(aMETHODRESTRICTIONid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure METHODRESTRICTION_DELETE /*����������� �� ������������� ������� �������*/ (
 aCURSESSION CHAR,
 aMETHODRESTRICTIONid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from METHODRESTRICTION where METHODRESTRICTIONID=aMETHODRESTRICTIONID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from METHODRESTRICTION where METHODRESTRICTIONid=aMETHODRESTRICTIONID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:METHODRESTRICTION',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=METHODRESTRICTION');
      return;
    end if;
  end if;
 --  verify lock  --
 METHODRESTRICTION_ISLOCKED( acursession=>acursession,aROWID=>aMETHODRESTRICTIONid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=METHODRESTRICTION');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'METHODRESTRICTION',
 aVERB=>'DELETEROW',  aThe_Resource=>aMETHODRESTRICTIONid, aLogInstanceID=>aInstanceID);
declare cursor chld_METHODRESTRICTION is select  instanceid ID from instance where OwnerPartName ='METHODRESTRICTION' and OwnerRowID=aMETHODRESTRICTIONid;
row_METHODRESTRICTION  chld_METHODRESTRICTION%ROWTYPE;
begin
--open chld_METHODRESTRICTION;
for row_METHODRESTRICTION in chld_METHODRESTRICTION loop
 Kernel.INSTANCE_OWNER (acursession,row_METHODRESTRICTION.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_METHODRESTRICTION.id);
end loop;
--close chld_METHODRESTRICTION;
end ;
  delete from  METHODRESTRICTION 
  where  METHODRESTRICTIONID = aMETHODRESTRICTIONID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*����������� �������*/
procedure METHODRESTRICTION_SAVE /*����������� �� ������������� ������� �������*/ (
 aCURSESSION CHAR,
 aMETHODRESTRICTIONid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aPart CHAR := null /* ���������, ������� ����������� ����� *//* ���������, ������� ����������� ����� */
,aMethod CHAR := null /* ����� *//* ����� */
,aIsRestricted
 NUMBER := null /* ��������� ������������ *//* ��������� ������������ */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from METHODRESTRICTION where METHODRESTRICTIONID=aMETHODRESTRICTIONID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from METHODRESTRICTION where METHODRESTRICTIONid=aMETHODRESTRICTIONID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:METHODRESTRICTION',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=METHODRESTRICTION');
      return;
    end if;
  end if;
 --  verify lock  --
 METHODRESTRICTION_ISLOCKED( acursession=>acursession,aROWID=>aMETHODRESTRICTIONid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=METHODRESTRICTION');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'METHODRESTRICTION',
 aVERB=>'EDITROW',  aThe_Resource=>aMETHODRESTRICTIONid,aLogInstanceID=>aInstanceID);
 update  METHODRESTRICTION set ChangeStamp=sysdate
,
  Part=aPart
,
  Method=aMethod
,
  IsRestricted=aIsRestricted
  where  METHODRESTRICTIONID = aMETHODRESTRICTIONID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from OBJECTMODE where OBJECTMODEid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:METHODRESTRICTION',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=METHODRESTRICTION');
      return;
    end if;
 end if;
 OBJECTMODE_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=METHODRESTRICTION');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'METHODRESTRICTION',
 aVERB=>'CREATEROW',  aThe_Resource=>aMETHODRESTRICTIONid,aLogInstanceID=>aInstanceID);
 insert into   METHODRESTRICTION
 (  METHODRESTRICTIONID 
,ParentStructRowID
,Part

,Method

,IsRestricted

 ) values ( aMETHODRESTRICTIONID 
,aParentStructRowID
,aPart

,aMethod

,aIsRestricted

 ); 
 METHODRESTRICTION_SINIT( aCURSESSION,aMETHODRESTRICTIONid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure METHODRESTRICTION_PARENT /*����������� �� ������������� ������� �������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from METHODRESTRICTION where  METHODRESTRICTIONid=aRowID;
  aParentTable := 'OBJECTMODE';
 end; 


procedure METHODRESTRICTION_ISLOCKED /*����������� �� ������������� ������� �������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from METHODRESTRICTION where METHODRESTRICTIONid=aRowID;
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
  METHODRESTRICTION_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure METHODRESTRICTION_LOCK /*����������� �� ������������� ������� �������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 METHODRESTRICTION_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  METHODRESTRICTION_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from METHODRESTRICTION where METHODRESTRICTIONid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=METHODRESTRICTION');
    return;
  end if;
   if  aLockMode =2  
   then   
    update METHODRESTRICTION set LockUserID =auserID ,LockSessionID =null where METHODRESTRICTIONid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update METHODRESTRICTION set LockUserID =null,LockSessionID =aCURSESSION  where METHODRESTRICTIONid=aRowID;
     return;
   end if;
 end ;


procedure METHODRESTRICTION_HCL /*����������� �� ������������� ������� �������*/ (
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


procedure METHODRESTRICTION_UNLOCK /*����������� �� ������������� ������� �������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 METHODRESTRICTION_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update METHODRESTRICTION set LockUserID =null  where METHODRESTRICTIONid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update METHODRESTRICTION set LockSessionID =null  where METHODRESTRICTIONid=aRowID;
     return;
   end if;
 end; 


procedure METHODRESTRICTION_SINIT /*����������� �� ������������� ������� �������*/ (
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
 select  SecurityStyleID into atmpID from METHODRESTRICTION where METHODRESTRICTIONid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =METHODRESTRICTION');
    return;
  end if;
if aSecurityStyleID is null then
 METHODRESTRICTION_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update METHODRESTRICTION set securitystyleid =aStyleID where METHODRESTRICTIONid = aRowID;
else 
 update METHODRESTRICTION set securitystyleid =aSecurityStyleID where METHODRESTRICTIONid = aRowID;
end if; 
end ; 


procedure METHODRESTRICTION_propagate /*����������� �� ������������� ������� �������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from METHODRESTRICTION where METHODRESTRICTIONid=aRowid;
end;



procedure TYPEMENU_BRIEF  (
 aCURSESSION CHAR,
 aTYPEMENUid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aTYPEMENUid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from TYPEMENU where TYPEMENUID=aTYPEMENUID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from TYPEMENU where TYPEMENUid=aTYPEMENUID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=TYPEMENU');
    return;
  end if;
  aBRIEF:=func.TYPEMENU_BRIEF_F(aTYPEMENUid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure TYPEMENU_DELETE /*������ ������ ����*/ (
 aCURSESSION CHAR,
 aTYPEMENUid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from TYPEMENU where TYPEMENUID=aTYPEMENUID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from TYPEMENU where TYPEMENUid=aTYPEMENUID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:TYPEMENU',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=TYPEMENU');
      return;
    end if;
  end if;
 --  verify lock  --
 TYPEMENU_ISLOCKED( acursession=>acursession,aROWID=>aTYPEMENUid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=TYPEMENU');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'TYPEMENU',
 aVERB=>'DELETEROW',  aThe_Resource=>aTYPEMENUid, aLogInstanceID=>aInstanceID);
declare cursor chld_TYPEMENU is select  instanceid ID from instance where OwnerPartName ='TYPEMENU' and OwnerRowID=aTYPEMENUid;
row_TYPEMENU  chld_TYPEMENU%ROWTYPE;
begin
--open chld_TYPEMENU;
for row_TYPEMENU in chld_TYPEMENU loop
 Kernel.INSTANCE_OWNER (acursession,row_TYPEMENU.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_TYPEMENU.id);
end loop;
--close chld_TYPEMENU;
end ;
  delete from  TYPEMENU 
  where  TYPEMENUID = aTYPEMENUID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*������ ����*/
procedure TYPEMENU_SAVE /*������ ������ ����*/ (
 aCURSESSION CHAR,
 aTYPEMENUid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2 := null /* �������� *//* �������� */
,aCaption
 VARCHAR2 := null /* ��������� *//* ��������� */
,aToolTip
 VARCHAR2 := null /* ��������� *//* ��������� */
,athe_Action CHAR := null /* ����� *//* ����� */
,aIsMenuItem
 NUMBER := null /* �������� � ���� *//* �������� � ���� */
,aIsToolBarButton
 NUMBER := null /* �������� � ������ *//* �������� � ������ */
,aHotKey
 VARCHAR2 := null /* ������� ������� *//* ������� ������� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from TYPEMENU where TYPEMENUID=aTYPEMENUID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from TYPEMENU where TYPEMENUid=aTYPEMENUID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:TYPEMENU',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=TYPEMENU');
      return;
    end if;
  end if;
 --  verify lock  --
 TYPEMENU_ISLOCKED( acursession=>acursession,aROWID=>aTYPEMENUid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=TYPEMENU');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'TYPEMENU',
 aVERB=>'EDITROW',  aThe_Resource=>aTYPEMENUid,aLogInstanceID=>aInstanceID);
 update  TYPEMENU set ChangeStamp=sysdate
,
  Name=aName
,
  Caption=aCaption
,
  ToolTip=aToolTip
,
  the_Action=athe_Action
,
  IsMenuItem=aIsMenuItem
,
  IsToolBarButton=aIsToolBarButton
,
  HotKey=aHotKey
  where  TYPEMENUID = aTYPEMENUID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from OBJECTTYPE where OBJECTTYPEid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:TYPEMENU',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=TYPEMENU');
      return;
    end if;
 end if;
 OBJECTTYPE_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=TYPEMENU');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'TYPEMENU',
 aVERB=>'CREATEROW',  aThe_Resource=>aTYPEMENUid,aLogInstanceID=>aInstanceID);
 insert into   TYPEMENU
 (  TYPEMENUID 
,ParentStructRowID
,Name

,Caption

,ToolTip

,the_Action

,IsMenuItem

,IsToolBarButton

,HotKey

 ) values ( aTYPEMENUID 
,aParentStructRowID
,aName

,aCaption

,aToolTip

,athe_Action

,aIsMenuItem

,aIsToolBarButton

,aHotKey

 ); 
 TYPEMENU_SINIT( aCURSESSION,aTYPEMENUid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure TYPEMENU_PARENT /*������ ������ ����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from TYPEMENU where  TYPEMENUid=aRowID;
  aParentTable := 'OBJECTTYPE';
 end; 


procedure TYPEMENU_ISLOCKED /*������ ������ ����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from TYPEMENU where TYPEMENUid=aRowID;
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
  TYPEMENU_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure TYPEMENU_LOCK /*������ ������ ����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 TYPEMENU_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  TYPEMENU_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from TYPEMENU where TYPEMENUid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=TYPEMENU');
    return;
  end if;
   if  aLockMode =2  
   then   
    update TYPEMENU set LockUserID =auserID ,LockSessionID =null where TYPEMENUid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update TYPEMENU set LockUserID =null,LockSessionID =aCURSESSION  where TYPEMENUid=aRowID;
     return;
   end if;
 end ;


procedure TYPEMENU_HCL /*������ ������ ����*/ (
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


procedure TYPEMENU_UNLOCK /*������ ������ ����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 TYPEMENU_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update TYPEMENU set LockUserID =null  where TYPEMENUid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update TYPEMENU set LockSessionID =null  where TYPEMENUid=aRowID;
     return;
   end if;
 end; 


procedure TYPEMENU_SINIT /*������ ������ ����*/ (
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
 select  SecurityStyleID into atmpID from TYPEMENU where TYPEMENUid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =TYPEMENU');
    return;
  end if;
if aSecurityStyleID is null then
 TYPEMENU_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update TYPEMENU set securitystyleid =aStyleID where TYPEMENUid = aRowID;
else 
 update TYPEMENU set securitystyleid =aSecurityStyleID where TYPEMENUid = aRowID;
end if; 
end ; 


procedure TYPEMENU_propagate /*������ ������ ����*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from TYPEMENU where TYPEMENUid=aRowid;
end;



procedure MTZAPP_BRIEF  (
 aCURSESSION CHAR,
 aMTZAPPid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aMTZAPPid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from MTZAPP where MTZAPPID=aMTZAPPID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from MTZAPP where MTZAPPid=aMTZAPPID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=MTZAPP');
    return;
  end if;
  aBRIEF:=func.MTZAPP_BRIEF_F(aMTZAPPid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure MTZAPP_DELETE /*������ ������������� ����������*/ (
 aCURSESSION CHAR,
 aMTZAPPid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from MTZAPP where MTZAPPID=aMTZAPPID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from MTZAPP where MTZAPPid=aMTZAPPID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:MTZAPP',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=MTZAPP');
      return;
    end if;
  end if;
 --  verify lock  --
 MTZAPP_ISLOCKED( acursession=>acursession,aROWID=>aMTZAPPid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=MTZAPP');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_ParentPackage is select ParentPackage.ParentPackageid ID from ParentPackage where  ParentPackage.ParentStructRowID = aMTZAPPid;
    child_ParentPackage_rec  child_ParentPackage%ROWTYPE;
    begin
    --open child_ParentPackage;
      for child_ParentPackage_rec in child_ParentPackage loop
      ParentPackage_DELETE (acursession,child_ParentPackage_rec.id,aInstanceid);
      end loop;
      --close child_ParentPackage;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'MTZAPP',
 aVERB=>'DELETEROW',  aThe_Resource=>aMTZAPPid, aLogInstanceID=>aInstanceID);
declare cursor chld_MTZAPP is select  instanceid ID from instance where OwnerPartName ='MTZAPP' and OwnerRowID=aMTZAPPid;
row_MTZAPP  chld_MTZAPP%ROWTYPE;
begin
--open chld_MTZAPP;
for row_MTZAPP in chld_MTZAPP loop
 Kernel.INSTANCE_OWNER (acursession,row_MTZAPP.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_MTZAPP.id);
end loop;
--close chld_MTZAPP;
end ;
  delete from  MTZAPP 
  where  MTZAPPID = aMTZAPPID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*����������*/
procedure MTZAPP_SAVE /*������ ������������� ����������*/ (
 aCURSESSION CHAR,
 aMTZAPPid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
,aDBName
 VARCHAR2 := null /* ���� ������ *//* ���� ������ */
,aTheComment VARCHAR2 := null /* �������� *//* �������� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from MTZAPP where MTZAPPID=aMTZAPPID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from MTZAPP where MTZAPPid=aMTZAPPID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:MTZAPP',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=MTZAPP');
      return;
    end if;
  end if;
 --  verify lock  --
 MTZAPP_ISLOCKED( acursession=>acursession,aROWID=>aMTZAPPid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=MTZAPP');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'MTZAPP',
 aVERB=>'EDITROW',  aThe_Resource=>aMTZAPPid,aLogInstanceID=>aInstanceID);
 update  MTZAPP set ChangeStamp=sysdate
,
  Name=aName
,
  DBName=aDBName
,
  TheComment=aTheComment
  where  MTZAPPID = aMTZAPPID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:MTZAPP',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=MTZAPP');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=MTZAPP');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'MTZAPP',
 aVERB=>'CREATEROW',  aThe_Resource=>aMTZAPPid,aLogInstanceID=>aInstanceID);
 insert into   MTZAPP
 (  MTZAPPID 
,InstanceID
,Name

,DBName

,TheComment

 ) values ( aMTZAPPID 
,aInstanceID
,aName

,aDBName

,aTheComment

 ); 
 MTZAPP_SINIT( aCURSESSION,aMTZAPPid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure MTZAPP_PARENT /*������ ������������� ����������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  aParentTable := 'INSTANCE';
  select  INSTANCEID into aParentID from MTZAPP where  MTZAPPid=aRowID;
 end; 


procedure MTZAPP_ISLOCKED /*������ ������������� ����������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from MTZAPP where MTZAPPid=aRowID;
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
  MTZAPP_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure MTZAPP_LOCK /*������ ������������� ����������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 MTZAPP_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  MTZAPP_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from MTZAPP where MTZAPPid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=MTZAPP');
    return;
  end if;
   if  aLockMode =2  
   then   
    update MTZAPP set LockUserID =auserID ,LockSessionID =null where MTZAPPid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update MTZAPP set LockUserID =null,LockSessionID =aCURSESSION  where MTZAPPid=aRowID;
     return;
   end if;
 end ;


procedure MTZAPP_HCL /*������ ������������� ����������*/ (
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
declare cursor lch_ParentPackage is select ParentPackage.ParentPackageid ID from ParentPackage where  ParentPackage.ParentStructRowID = aRowid;
row_ParentPackage lch_ParentPackage%ROWTYPE;
begin  
--open lch_ParentPackage;
for row_ParentPackage in lch_ParentPackage
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from ParentPackage where ParentPackageid=row_ParentPackage.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ParentPackage;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_ParentPackage;
     return;
   end if; 
 end if;  
 ParentPackage_HCL (acursession,row_ParentPackage.id,aisLocked);
 if aisLocked >2 then
   close lch_ParentPackage;
   return;
 end if;
end loop;
--close lch_ParentPackage;
end;
aIsLocked :=0;
end;


procedure MTZAPP_UNLOCK /*������ ������������� ����������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 MTZAPP_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update MTZAPP set LockUserID =null  where MTZAPPid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update MTZAPP set LockSessionID =null  where MTZAPPid=aRowID;
     return;
   end if;
 end; 


procedure MTZAPP_SINIT /*������ ������������� ����������*/ (
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
 select  SecurityStyleID into atmpID from MTZAPP where MTZAPPid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =MTZAPP');
    return;
  end if;
if aSecurityStyleID is null then
 MTZAPP_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update MTZAPP set securitystyleid =aStyleID where MTZAPPid = aRowID;
else 
 update MTZAPP set securitystyleid =aSecurityStyleID where MTZAPPid = aRowID;
end if; 
end ; 


procedure MTZAPP_propagate /*������ ������������� ����������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from MTZAPP where MTZAPPid=aRowid;
declare cursor pch_ParentPackage  is select ParentPackage.ParentPackageid ID from ParentPackage where  ParentPackage.ParentStructRowID = aRowid;
row_ParentPackage  pch_ParentPackage%ROWTYPE;
begin
--open pch_ParentPackage;
for row_ParentPackage in pch_ParentPackage loop
   ParentPackage_SINIT( acursession,row_ParentPackage.id,assid);
   ParentPackage_propagate( acursession,row_ParentPackage.id);
end loop;
--close pch_ParentPackage;
end;
end;



procedure ParentPackage_BRIEF  (
 aCURSESSION CHAR,
 aParentPackageid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aParentPackageid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ParentPackage where ParentPackageID=aParentPackageID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ParentPackage where ParentPackageid=aParentPackageID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ParentPackage');
    return;
  end if;
  aBRIEF:=func.ParentPackage_BRIEF_F(aParentPackageid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ParentPackage_DELETE /*���������� �� ������� ������� ������ ����������*/ (
 aCURSESSION CHAR,
 aParentPackageid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from ParentPackage where ParentPackageID=aParentPackageID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ParentPackage where ParentPackageid=aParentPackageID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ParentPackage',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=ParentPackage');
      return;
    end if;
  end if;
 --  verify lock  --
 ParentPackage_ISLOCKED( acursession=>acursession,aROWID=>aParentPackageid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=ParentPackage');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ParentPackage',
 aVERB=>'DELETEROW',  aThe_Resource=>aParentPackageid, aLogInstanceID=>aInstanceID);
declare cursor chld_ParentPackage is select  instanceid ID from instance where OwnerPartName ='ParentPackage' and OwnerRowID=aParentPackageid;
row_ParentPackage  chld_ParentPackage%ROWTYPE;
begin
--open chld_ParentPackage;
for row_ParentPackage in chld_ParentPackage loop
 Kernel.INSTANCE_OWNER (acursession,row_ParentPackage.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ParentPackage.id);
end loop;
--close chld_ParentPackage;
end ;
  delete from  ParentPackage 
  where  ParentPackageID = aParentPackageID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*������������ ����������*/
procedure ParentPackage_SAVE /*���������� �� ������� ������� ������ ����������*/ (
 aCURSESSION CHAR,
 aParentPackageid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aPackage CHAR/* ���������� *//* ���������� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from ParentPackage where ParentPackageID=aParentPackageID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ParentPackage where ParentPackageid=aParentPackageID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ParentPackage',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=ParentPackage');
      return;
    end if;
  end if;
 --  verify lock  --
 ParentPackage_ISLOCKED( acursession=>acursession,aROWID=>aParentPackageid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=ParentPackage');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ParentPackage',
 aVERB=>'EDITROW',  aThe_Resource=>aParentPackageid,aLogInstanceID=>aInstanceID);
 update  ParentPackage set ChangeStamp=sysdate
,
  Package=aPackage
  where  ParentPackageID = aParentPackageID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from MTZAPP where MTZAPPid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ParentPackage',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=ParentPackage');
      return;
    end if;
 end if;
 MTZAPP_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=ParentPackage');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ParentPackage',
 aVERB=>'CREATEROW',  aThe_Resource=>aParentPackageid,aLogInstanceID=>aInstanceID);
 insert into   ParentPackage
 (  ParentPackageID 
,ParentStructRowID
,Package

 ) values ( aParentPackageID 
,aParentStructRowID
,aPackage

 ); 
 ParentPackage_SINIT( aCURSESSION,aParentPackageid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ParentPackage_PARENT /*���������� �� ������� ������� ������ ����������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from ParentPackage where  ParentPackageid=aRowID;
  aParentTable := 'MTZAPP';
 end; 


procedure ParentPackage_ISLOCKED /*���������� �� ������� ������� ������ ����������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ParentPackage where ParentPackageid=aRowID;
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
  ParentPackage_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ParentPackage_LOCK /*���������� �� ������� ������� ������ ����������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 ParentPackage_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  ParentPackage_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ParentPackage where ParentPackageid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=ParentPackage');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ParentPackage set LockUserID =auserID ,LockSessionID =null where ParentPackageid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ParentPackage set LockUserID =null,LockSessionID =aCURSESSION  where ParentPackageid=aRowID;
     return;
   end if;
 end ;


procedure ParentPackage_HCL /*���������� �� ������� ������� ������ ����������*/ (
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


procedure ParentPackage_UNLOCK /*���������� �� ������� ������� ������ ����������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 ParentPackage_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ParentPackage set LockUserID =null  where ParentPackageid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ParentPackage set LockSessionID =null  where ParentPackageid=aRowID;
     return;
   end if;
 end; 


procedure ParentPackage_SINIT /*���������� �� ������� ������� ������ ����������*/ (
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
 select  SecurityStyleID into atmpID from ParentPackage where ParentPackageid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =ParentPackage');
    return;
  end if;
if aSecurityStyleID is null then
 ParentPackage_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ParentPackage set securitystyleid =aStyleID where ParentPackageid = aRowID;
else 
 update ParentPackage set securitystyleid =aSecurityStyleID where ParentPackageid = aRowID;
end if; 
end ; 


procedure ParentPackage_propagate /*���������� �� ������� ������� ������ ����������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ParentPackage where ParentPackageid=aRowid;
end;



procedure GENPACKAGE_BRIEF  (
 aCURSESSION CHAR,
 aGENPACKAGEid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aGENPACKAGEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from GENPACKAGE where GENPACKAGEID=aGENPACKAGEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from GENPACKAGE where GENPACKAGEid=aGENPACKAGEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=GENPACKAGE');
    return;
  end if;
  aBRIEF:=func.GENPACKAGE_BRIEF_F(aGENPACKAGEid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure GENPACKAGE_DELETE /*����� ���������*/ (
 aCURSESSION CHAR,
 aGENPACKAGEid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from GENPACKAGE where GENPACKAGEID=aGENPACKAGEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from GENPACKAGE where GENPACKAGEid=aGENPACKAGEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:GENPACKAGE',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=GENPACKAGE');
      return;
    end if;
  end if;
 --  verify lock  --
 GENPACKAGE_ISLOCKED( acursession=>acursession,aROWID=>aGENPACKAGEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=GENPACKAGE');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_GENERATOR_TARGET is select GENERATOR_TARGET.GENERATOR_TARGETid ID from GENERATOR_TARGET where  GENERATOR_TARGET.ParentStructRowID = aGENPACKAGEid;
    child_GENERATOR_TARGET_rec  child_GENERATOR_TARGET%ROWTYPE;
    begin
    --open child_GENERATOR_TARGET;
      for child_GENERATOR_TARGET_rec in child_GENERATOR_TARGET loop
      GENERATOR_TARGET_DELETE (acursession,child_GENERATOR_TARGET_rec.id,aInstanceid);
      end loop;
      --close child_GENERATOR_TARGET;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'GENPACKAGE',
 aVERB=>'DELETEROW',  aThe_Resource=>aGENPACKAGEid, aLogInstanceID=>aInstanceID);
declare cursor chld_GENPACKAGE is select  instanceid ID from instance where OwnerPartName ='GENPACKAGE' and OwnerRowID=aGENPACKAGEid;
row_GENPACKAGE  chld_GENPACKAGE%ROWTYPE;
begin
--open chld_GENPACKAGE;
for row_GENPACKAGE in chld_GENPACKAGE loop
 Kernel.INSTANCE_OWNER (acursession,row_GENPACKAGE.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_GENPACKAGE.id);
end loop;
--close chld_GENPACKAGE;
end ;
  delete from  GENPACKAGE 
  where  GENPACKAGEID = aGENPACKAGEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*����� ���������*/
procedure GENPACKAGE_SAVE /*����� ���������*/ (
 aCURSESSION CHAR,
 aGENPACKAGEid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2 := null /* �������� *//* �������� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from GENPACKAGE where GENPACKAGEID=aGENPACKAGEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from GENPACKAGE where GENPACKAGEid=aGENPACKAGEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:GENPACKAGE',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=GENPACKAGE');
      return;
    end if;
  end if;
 --  verify lock  --
 GENPACKAGE_ISLOCKED( acursession=>acursession,aROWID=>aGENPACKAGEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=GENPACKAGE');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'GENPACKAGE',
 aVERB=>'EDITROW',  aThe_Resource=>aGENPACKAGEid,aLogInstanceID=>aInstanceID);
 update  GENPACKAGE set ChangeStamp=sysdate
,
  Name=aName
  where  GENPACKAGEID = aGENPACKAGEID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:GENPACKAGE',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=GENPACKAGE');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=GENPACKAGE');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'GENPACKAGE',
 aVERB=>'CREATEROW',  aThe_Resource=>aGENPACKAGEid,aLogInstanceID=>aInstanceID);
 insert into   GENPACKAGE
 (  GENPACKAGEID 
,InstanceID
,Name

 ) values ( aGENPACKAGEID 
,aInstanceID
,aName

 ); 
 GENPACKAGE_SINIT( aCURSESSION,aGENPACKAGEid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure GENPACKAGE_PARENT /*����� ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  aParentTable := 'INSTANCE';
  select  INSTANCEID into aParentID from GENPACKAGE where  GENPACKAGEid=aRowID;
 end; 


procedure GENPACKAGE_ISLOCKED /*����� ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from GENPACKAGE where GENPACKAGEid=aRowID;
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
  GENPACKAGE_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure GENPACKAGE_LOCK /*����� ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 GENPACKAGE_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  GENPACKAGE_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from GENPACKAGE where GENPACKAGEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=GENPACKAGE');
    return;
  end if;
   if  aLockMode =2  
   then   
    update GENPACKAGE set LockUserID =auserID ,LockSessionID =null where GENPACKAGEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update GENPACKAGE set LockUserID =null,LockSessionID =aCURSESSION  where GENPACKAGEid=aRowID;
     return;
   end if;
 end ;


procedure GENPACKAGE_HCL /*����� ���������*/ (
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
declare cursor lch_GENERATOR_TARGET is select GENERATOR_TARGET.GENERATOR_TARGETid ID from GENERATOR_TARGET where  GENERATOR_TARGET.ParentStructRowID = aRowid;
row_GENERATOR_TARGET lch_GENERATOR_TARGET%ROWTYPE;
begin  
--open lch_GENERATOR_TARGET;
for row_GENERATOR_TARGET in lch_GENERATOR_TARGET
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from GENERATOR_TARGET where GENERATOR_TARGETid=row_GENERATOR_TARGET.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_GENERATOR_TARGET;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_GENERATOR_TARGET;
     return;
   end if; 
 end if;  
 GENERATOR_TARGET_HCL (acursession,row_GENERATOR_TARGET.id,aisLocked);
 if aisLocked >2 then
   close lch_GENERATOR_TARGET;
   return;
 end if;
end loop;
--close lch_GENERATOR_TARGET;
end;
aIsLocked :=0;
end;


procedure GENPACKAGE_UNLOCK /*����� ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 GENPACKAGE_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update GENPACKAGE set LockUserID =null  where GENPACKAGEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update GENPACKAGE set LockSessionID =null  where GENPACKAGEid=aRowID;
     return;
   end if;
 end; 


procedure GENPACKAGE_SINIT /*����� ���������*/ (
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
 select  SecurityStyleID into atmpID from GENPACKAGE where GENPACKAGEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =GENPACKAGE');
    return;
  end if;
if aSecurityStyleID is null then
 GENPACKAGE_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update GENPACKAGE set securitystyleid =aStyleID where GENPACKAGEid = aRowID;
else 
 update GENPACKAGE set securitystyleid =aSecurityStyleID where GENPACKAGEid = aRowID;
end if; 
end ; 


procedure GENPACKAGE_propagate /*����� ���������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from GENPACKAGE where GENPACKAGEid=aRowid;
declare cursor pch_GENERATOR_TARGET  is select GENERATOR_TARGET.GENERATOR_TARGETid ID from GENERATOR_TARGET where  GENERATOR_TARGET.ParentStructRowID = aRowid;
row_GENERATOR_TARGET  pch_GENERATOR_TARGET%ROWTYPE;
begin
--open pch_GENERATOR_TARGET;
for row_GENERATOR_TARGET in pch_GENERATOR_TARGET loop
   GENERATOR_TARGET_SINIT( acursession,row_GENERATOR_TARGET.id,assid);
   GENERATOR_TARGET_propagate( acursession,row_GENERATOR_TARGET.id);
end loop;
--close pch_GENERATOR_TARGET;
end;
end;



procedure GENERATOR_TARGET_BRIEF  (
 aCURSESSION CHAR,
 aGENERATOR_TARGETid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aGENERATOR_TARGETid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from GENERATOR_TARGET where GENERATOR_TARGETID=aGENERATOR_TARGETID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from GENERATOR_TARGET where GENERATOR_TARGETid=aGENERATOR_TARGETID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=GENERATOR_TARGET');
    return;
  end if;
  aBRIEF:=func.GENERATOR_TARGET_BRIEF_F(aGENERATOR_TARGETid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure GENERATOR_TARGET_DELETE /*����������*/ (
 aCURSESSION CHAR,
 aGENERATOR_TARGETid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from GENERATOR_TARGET where GENERATOR_TARGETID=aGENERATOR_TARGETID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from GENERATOR_TARGET where GENERATOR_TARGETid=aGENERATOR_TARGETID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:GENERATOR_TARGET',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=GENERATOR_TARGET');
      return;
    end if;
  end if;
 --  verify lock  --
 GENERATOR_TARGET_ISLOCKED( acursession=>acursession,aROWID=>aGENERATOR_TARGETid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=GENERATOR_TARGET');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_GENMANUALCODE is select GENMANUALCODE.GENMANUALCODEid ID from GENMANUALCODE where  GENMANUALCODE.ParentStructRowID = aGENERATOR_TARGETid;
    child_GENMANUALCODE_rec  child_GENMANUALCODE%ROWTYPE;
    begin
    --open child_GENMANUALCODE;
      for child_GENMANUALCODE_rec in child_GENMANUALCODE loop
      GENMANUALCODE_DELETE (acursession,child_GENMANUALCODE_rec.id,aInstanceid);
      end loop;
      --close child_GENMANUALCODE;
    end ;
    declare cursor child_GENCONTROLS is select GENCONTROLS.GENCONTROLSid ID from GENCONTROLS where  GENCONTROLS.ParentStructRowID = aGENERATOR_TARGETid;
    child_GENCONTROLS_rec  child_GENCONTROLS%ROWTYPE;
    begin
    --open child_GENCONTROLS;
      for child_GENCONTROLS_rec in child_GENCONTROLS loop
      GENCONTROLS_DELETE (acursession,child_GENCONTROLS_rec.id,aInstanceid);
      end loop;
      --close child_GENCONTROLS;
    end ;
    declare cursor child_GENREFERENCE is select GENREFERENCE.GENREFERENCEid ID from GENREFERENCE where  GENREFERENCE.ParentStructRowID = aGENERATOR_TARGETid;
    child_GENREFERENCE_rec  child_GENREFERENCE%ROWTYPE;
    begin
    --open child_GENREFERENCE;
      for child_GENREFERENCE_rec in child_GENREFERENCE loop
      GENREFERENCE_DELETE (acursession,child_GENREFERENCE_rec.id,aInstanceid);
      end loop;
      --close child_GENREFERENCE;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'GENERATOR_TARGET',
 aVERB=>'DELETEROW',  aThe_Resource=>aGENERATOR_TARGETid, aLogInstanceID=>aInstanceID);
declare cursor chld_GENERATOR_TARGET is select  instanceid ID from instance where OwnerPartName ='GENERATOR_TARGET' and OwnerRowID=aGENERATOR_TARGETid;
row_GENERATOR_TARGET  chld_GENERATOR_TARGET%ROWTYPE;
begin
--open chld_GENERATOR_TARGET;
for row_GENERATOR_TARGET in chld_GENERATOR_TARGET loop
 Kernel.INSTANCE_OWNER (acursession,row_GENERATOR_TARGET.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_GENERATOR_TARGET.id);
end loop;
--close chld_GENERATOR_TARGET;
end ;
  delete from  GENERATOR_TARGET 
  where  GENERATOR_TARGETID = aGENERATOR_TARGETID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*����������*/
procedure GENERATOR_TARGET_SAVE /*����������*/ (
 aCURSESSION CHAR,
 aGENERATOR_TARGETid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2 := null /* �������� *//* �������� */
,aTargetType
 NUMBER := null /* ��� ��������� *//* ��� ��������� */
,aQueueName
 VARCHAR2 := null /* ������� *//* ������� */
,aGeneratorProgID
 VARCHAR2 := null /* COM ����� *//* COM ����� */
,aGeneratorStyle
 NUMBER := null /* ������� *//* ������� */
,aTheDevelopmentEnv
 NUMBER := null /* ����� ���������� *//* ����� ���������� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from GENERATOR_TARGET where GENERATOR_TARGETID=aGENERATOR_TARGETID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from GENERATOR_TARGET where GENERATOR_TARGETid=aGENERATOR_TARGETID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:GENERATOR_TARGET',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=GENERATOR_TARGET');
      return;
    end if;
  end if;
 --  verify lock  --
 GENERATOR_TARGET_ISLOCKED( acursession=>acursession,aROWID=>aGENERATOR_TARGETid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=GENERATOR_TARGET');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'GENERATOR_TARGET',
 aVERB=>'EDITROW',  aThe_Resource=>aGENERATOR_TARGETid,aLogInstanceID=>aInstanceID);
 update  GENERATOR_TARGET set ChangeStamp=sysdate
,
  Name=aName
,
  TargetType=aTargetType
,
  QueueName=aQueueName
,
  GeneratorProgID=aGeneratorProgID
,
  GeneratorStyle=aGeneratorStyle
,
  TheDevelopmentEnv=aTheDevelopmentEnv
  where  GENERATOR_TARGETID = aGENERATOR_TARGETID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from GENPACKAGE where GENPACKAGEid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:GENERATOR_TARGET',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=GENERATOR_TARGET');
      return;
    end if;
 end if;
 GENPACKAGE_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=GENERATOR_TARGET');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'GENERATOR_TARGET',
 aVERB=>'CREATEROW',  aThe_Resource=>aGENERATOR_TARGETid,aLogInstanceID=>aInstanceID);
 insert into   GENERATOR_TARGET
 (  GENERATOR_TARGETID 
,ParentStructRowID
,Name

,TargetType

,QueueName

,GeneratorProgID

,GeneratorStyle

,TheDevelopmentEnv

 ) values ( aGENERATOR_TARGETID 
,aParentStructRowID
,aName

,aTargetType

,aQueueName

,aGeneratorProgID

,aGeneratorStyle

,aTheDevelopmentEnv

 ); 
 GENERATOR_TARGET_SINIT( aCURSESSION,aGENERATOR_TARGETid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure GENERATOR_TARGET_PARENT /*����������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from GENERATOR_TARGET where  GENERATOR_TARGETid=aRowID;
  aParentTable := 'GENPACKAGE';
 end; 


procedure GENERATOR_TARGET_ISLOCKED /*����������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from GENERATOR_TARGET where GENERATOR_TARGETid=aRowID;
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
  GENERATOR_TARGET_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure GENERATOR_TARGET_LOCK /*����������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 GENERATOR_TARGET_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  GENERATOR_TARGET_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from GENERATOR_TARGET where GENERATOR_TARGETid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=GENERATOR_TARGET');
    return;
  end if;
   if  aLockMode =2  
   then   
    update GENERATOR_TARGET set LockUserID =auserID ,LockSessionID =null where GENERATOR_TARGETid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update GENERATOR_TARGET set LockUserID =null,LockSessionID =aCURSESSION  where GENERATOR_TARGETid=aRowID;
     return;
   end if;
 end ;


procedure GENERATOR_TARGET_HCL /*����������*/ (
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
declare cursor lch_GENMANUALCODE is select GENMANUALCODE.GENMANUALCODEid ID from GENMANUALCODE where  GENMANUALCODE.ParentStructRowID = aRowid;
row_GENMANUALCODE lch_GENMANUALCODE%ROWTYPE;
begin  
--open lch_GENMANUALCODE;
for row_GENMANUALCODE in lch_GENMANUALCODE
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from GENMANUALCODE where GENMANUALCODEid=row_GENMANUALCODE.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_GENMANUALCODE;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_GENMANUALCODE;
     return;
   end if; 
 end if;  
 GENMANUALCODE_HCL (acursession,row_GENMANUALCODE.id,aisLocked);
 if aisLocked >2 then
   close lch_GENMANUALCODE;
   return;
 end if;
end loop;
--close lch_GENMANUALCODE;
end;
declare cursor lch_GENCONTROLS is select GENCONTROLS.GENCONTROLSid ID from GENCONTROLS where  GENCONTROLS.ParentStructRowID = aRowid;
row_GENCONTROLS lch_GENCONTROLS%ROWTYPE;
begin  
--open lch_GENCONTROLS;
for row_GENCONTROLS in lch_GENCONTROLS
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from GENCONTROLS where GENCONTROLSid=row_GENCONTROLS.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_GENCONTROLS;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_GENCONTROLS;
     return;
   end if; 
 end if;  
 GENCONTROLS_HCL (acursession,row_GENCONTROLS.id,aisLocked);
 if aisLocked >2 then
   close lch_GENCONTROLS;
   return;
 end if;
end loop;
--close lch_GENCONTROLS;
end;
declare cursor lch_GENREFERENCE is select GENREFERENCE.GENREFERENCEid ID from GENREFERENCE where  GENREFERENCE.ParentStructRowID = aRowid;
row_GENREFERENCE lch_GENREFERENCE%ROWTYPE;
begin  
--open lch_GENREFERENCE;
for row_GENREFERENCE in lch_GENREFERENCE
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from GENREFERENCE where GENREFERENCEid=row_GENREFERENCE.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_GENREFERENCE;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_GENREFERENCE;
     return;
   end if; 
 end if;  
 GENREFERENCE_HCL (acursession,row_GENREFERENCE.id,aisLocked);
 if aisLocked >2 then
   close lch_GENREFERENCE;
   return;
 end if;
end loop;
--close lch_GENREFERENCE;
end;
aIsLocked :=0;
end;


procedure GENERATOR_TARGET_UNLOCK /*����������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 GENERATOR_TARGET_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update GENERATOR_TARGET set LockUserID =null  where GENERATOR_TARGETid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update GENERATOR_TARGET set LockSessionID =null  where GENERATOR_TARGETid=aRowID;
     return;
   end if;
 end; 


procedure GENERATOR_TARGET_SINIT /*����������*/ (
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
 select  SecurityStyleID into atmpID from GENERATOR_TARGET where GENERATOR_TARGETid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =GENERATOR_TARGET');
    return;
  end if;
if aSecurityStyleID is null then
 GENERATOR_TARGET_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update GENERATOR_TARGET set securitystyleid =aStyleID where GENERATOR_TARGETid = aRowID;
else 
 update GENERATOR_TARGET set securitystyleid =aSecurityStyleID where GENERATOR_TARGETid = aRowID;
end if; 
end ; 


procedure GENERATOR_TARGET_propagate /*����������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from GENERATOR_TARGET where GENERATOR_TARGETid=aRowid;
declare cursor pch_GENMANUALCODE  is select GENMANUALCODE.GENMANUALCODEid ID from GENMANUALCODE where  GENMANUALCODE.ParentStructRowID = aRowid;
row_GENMANUALCODE  pch_GENMANUALCODE%ROWTYPE;
begin
--open pch_GENMANUALCODE;
for row_GENMANUALCODE in pch_GENMANUALCODE loop
   GENMANUALCODE_SINIT( acursession,row_GENMANUALCODE.id,assid);
   GENMANUALCODE_propagate( acursession,row_GENMANUALCODE.id);
end loop;
--close pch_GENMANUALCODE;
end;
declare cursor pch_GENCONTROLS  is select GENCONTROLS.GENCONTROLSid ID from GENCONTROLS where  GENCONTROLS.ParentStructRowID = aRowid;
row_GENCONTROLS  pch_GENCONTROLS%ROWTYPE;
begin
--open pch_GENCONTROLS;
for row_GENCONTROLS in pch_GENCONTROLS loop
   GENCONTROLS_SINIT( acursession,row_GENCONTROLS.id,assid);
   GENCONTROLS_propagate( acursession,row_GENCONTROLS.id);
end loop;
--close pch_GENCONTROLS;
end;
declare cursor pch_GENREFERENCE  is select GENREFERENCE.GENREFERENCEid ID from GENREFERENCE where  GENREFERENCE.ParentStructRowID = aRowid;
row_GENREFERENCE  pch_GENREFERENCE%ROWTYPE;
begin
--open pch_GENREFERENCE;
for row_GENREFERENCE in pch_GENREFERENCE loop
   GENREFERENCE_SINIT( acursession,row_GENREFERENCE.id,assid);
   GENREFERENCE_propagate( acursession,row_GENREFERENCE.id);
end loop;
--close pch_GENREFERENCE;
end;
end;



procedure GENMANUALCODE_BRIEF  (
 aCURSESSION CHAR,
 aGENMANUALCODEid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aGENMANUALCODEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from GENMANUALCODE where GENMANUALCODEID=aGENMANUALCODEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from GENMANUALCODE where GENMANUALCODEid=aGENMANUALCODEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=GENMANUALCODE');
    return;
  end if;
  aBRIEF:=func.GENMANUALCODE_BRIEF_F(aGENMANUALCODEid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure GENMANUALCODE_DELETE /*���, ������� �� ������������ � �������� ������*/ (
 aCURSESSION CHAR,
 aGENMANUALCODEid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from GENMANUALCODE where GENMANUALCODEID=aGENMANUALCODEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from GENMANUALCODE where GENMANUALCODEid=aGENMANUALCODEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:GENMANUALCODE',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=GENMANUALCODE');
      return;
    end if;
  end if;
 --  verify lock  --
 GENMANUALCODE_ISLOCKED( acursession=>acursession,aROWID=>aGENMANUALCODEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=GENMANUALCODE');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'GENMANUALCODE',
 aVERB=>'DELETEROW',  aThe_Resource=>aGENMANUALCODEid, aLogInstanceID=>aInstanceID);
declare cursor chld_GENMANUALCODE is select  instanceid ID from instance where OwnerPartName ='GENMANUALCODE' and OwnerRowID=aGENMANUALCODEid;
row_GENMANUALCODE  chld_GENMANUALCODE%ROWTYPE;
begin
--open chld_GENMANUALCODE;
for row_GENMANUALCODE in chld_GENMANUALCODE loop
 Kernel.INSTANCE_OWNER (acursession,row_GENMANUALCODE.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_GENMANUALCODE.id);
end loop;
--close chld_GENMANUALCODE;
end ;
  delete from  GENMANUALCODE 
  where  GENMANUALCODEID = aGENMANUALCODEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*������ ���*/
procedure GENMANUALCODE_SAVE /*���, ������� �� ������������ � �������� ������*/ (
 aCURSESSION CHAR,
 aGENMANUALCODEid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
,athe_Alias
 VARCHAR2 := null /* ��������� *//* ��������� */
,aCode VARCHAR2/* ��� *//* ��� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from GENMANUALCODE where GENMANUALCODEID=aGENMANUALCODEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from GENMANUALCODE where GENMANUALCODEid=aGENMANUALCODEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:GENMANUALCODE',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=GENMANUALCODE');
      return;
    end if;
  end if;
 --  verify lock  --
 GENMANUALCODE_ISLOCKED( acursession=>acursession,aROWID=>aGENMANUALCODEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=GENMANUALCODE');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'GENMANUALCODE',
 aVERB=>'EDITROW',  aThe_Resource=>aGENMANUALCODEid,aLogInstanceID=>aInstanceID);
 update  GENMANUALCODE set ChangeStamp=sysdate
,
  Name=aName
,
  the_Alias=athe_Alias
,
  Code=aCode
  where  GENMANUALCODEID = aGENMANUALCODEID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from GENERATOR_TARGET where GENERATOR_TARGETid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:GENMANUALCODE',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=GENMANUALCODE');
      return;
    end if;
 end if;
 GENERATOR_TARGET_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=GENMANUALCODE');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'GENMANUALCODE',
 aVERB=>'CREATEROW',  aThe_Resource=>aGENMANUALCODEid,aLogInstanceID=>aInstanceID);
 insert into   GENMANUALCODE
 (  GENMANUALCODEID 
,ParentStructRowID
,Name

,the_Alias

,Code

 ) values ( aGENMANUALCODEID 
,aParentStructRowID
,aName

,athe_Alias

,aCode

 ); 
 GENMANUALCODE_SINIT( aCURSESSION,aGENMANUALCODEid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure GENMANUALCODE_PARENT /*���, ������� �� ������������ � �������� ������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from GENMANUALCODE where  GENMANUALCODEid=aRowID;
  aParentTable := 'GENERATOR_TARGET';
 end; 


procedure GENMANUALCODE_ISLOCKED /*���, ������� �� ������������ � �������� ������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from GENMANUALCODE where GENMANUALCODEid=aRowID;
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
  GENMANUALCODE_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure GENMANUALCODE_LOCK /*���, ������� �� ������������ � �������� ������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 GENMANUALCODE_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  GENMANUALCODE_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from GENMANUALCODE where GENMANUALCODEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=GENMANUALCODE');
    return;
  end if;
   if  aLockMode =2  
   then   
    update GENMANUALCODE set LockUserID =auserID ,LockSessionID =null where GENMANUALCODEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update GENMANUALCODE set LockUserID =null,LockSessionID =aCURSESSION  where GENMANUALCODEid=aRowID;
     return;
   end if;
 end ;


procedure GENMANUALCODE_HCL /*���, ������� �� ������������ � �������� ������*/ (
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


procedure GENMANUALCODE_UNLOCK /*���, ������� �� ������������ � �������� ������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 GENMANUALCODE_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update GENMANUALCODE set LockUserID =null  where GENMANUALCODEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update GENMANUALCODE set LockSessionID =null  where GENMANUALCODEid=aRowID;
     return;
   end if;
 end; 


procedure GENMANUALCODE_SINIT /*���, ������� �� ������������ � �������� ������*/ (
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
 select  SecurityStyleID into atmpID from GENMANUALCODE where GENMANUALCODEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =GENMANUALCODE');
    return;
  end if;
if aSecurityStyleID is null then
 GENMANUALCODE_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update GENMANUALCODE set securitystyleid =aStyleID where GENMANUALCODEid = aRowID;
else 
 update GENMANUALCODE set securitystyleid =aSecurityStyleID where GENMANUALCODEid = aRowID;
end if; 
end ; 


procedure GENMANUALCODE_propagate /*���, ������� �� ������������ � �������� ������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from GENMANUALCODE where GENMANUALCODEid=aRowid;
end;



procedure GENCONTROLS_BRIEF  (
 aCURSESSION CHAR,
 aGENCONTROLSid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aGENCONTROLSid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from GENCONTROLS where GENCONTROLSID=aGENCONTROLSID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from GENCONTROLS where GENCONTROLSid=aGENCONTROLSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=GENCONTROLS');
    return;
  end if;
  aBRIEF:=func.GENCONTROLS_BRIEF_F(aGENCONTROLSid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure GENCONTROLS_DELETE /*����������� ��������, ������� ������������ ��� ���������*/ (
 aCURSESSION CHAR,
 aGENCONTROLSid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from GENCONTROLS where GENCONTROLSID=aGENCONTROLSID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from GENCONTROLS where GENCONTROLSid=aGENCONTROLSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:GENCONTROLS',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=GENCONTROLS');
      return;
    end if;
  end if;
 --  verify lock  --
 GENCONTROLS_ISLOCKED( acursession=>acursession,aROWID=>aGENCONTROLSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=GENCONTROLS');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'GENCONTROLS',
 aVERB=>'DELETEROW',  aThe_Resource=>aGENCONTROLSid, aLogInstanceID=>aInstanceID);
declare cursor chld_GENCONTROLS is select  instanceid ID from instance where OwnerPartName ='GENCONTROLS' and OwnerRowID=aGENCONTROLSid;
row_GENCONTROLS  chld_GENCONTROLS%ROWTYPE;
begin
--open chld_GENCONTROLS;
for row_GENCONTROLS in chld_GENCONTROLS loop
 Kernel.INSTANCE_OWNER (acursession,row_GENCONTROLS.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_GENCONTROLS.id);
end loop;
--close chld_GENCONTROLS;
end ;
  delete from  GENCONTROLS 
  where  GENCONTROLSID = aGENCONTROLSID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*����������� ��������*/
procedure GENCONTROLS_SAVE /*����������� ��������, ������� ������������ ��� ���������*/ (
 aCURSESSION CHAR,
 aGENCONTROLSid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aControlProgID
 VARCHAR2 := null /* ProgID ������������ �������� *//* ProgID ������������ �������� */
,aControlClassID
 VARCHAR2 := null /* ����� �������������������� *//* ����� �������������������� */
,aVersionMajor
 NUMBER := null /* ������ *//* ������ */
,aVersionMinor
 NUMBER := null /* ��������� *//* ��������� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from GENCONTROLS where GENCONTROLSID=aGENCONTROLSID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from GENCONTROLS where GENCONTROLSid=aGENCONTROLSID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:GENCONTROLS',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=GENCONTROLS');
      return;
    end if;
  end if;
 --  verify lock  --
 GENCONTROLS_ISLOCKED( acursession=>acursession,aROWID=>aGENCONTROLSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=GENCONTROLS');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'GENCONTROLS',
 aVERB=>'EDITROW',  aThe_Resource=>aGENCONTROLSid,aLogInstanceID=>aInstanceID);
 update  GENCONTROLS set ChangeStamp=sysdate
,
  ControlProgID=aControlProgID
,
  ControlClassID=aControlClassID
,
  VersionMajor=aVersionMajor
,
  VersionMinor=aVersionMinor
  where  GENCONTROLSID = aGENCONTROLSID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from GENERATOR_TARGET where GENERATOR_TARGETid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:GENCONTROLS',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=GENCONTROLS');
      return;
    end if;
 end if;
 GENERATOR_TARGET_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=GENCONTROLS');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'GENCONTROLS',
 aVERB=>'CREATEROW',  aThe_Resource=>aGENCONTROLSid,aLogInstanceID=>aInstanceID);
 insert into   GENCONTROLS
 (  GENCONTROLSID 
,ParentStructRowID
,ControlProgID

,ControlClassID

,VersionMajor

,VersionMinor

 ) values ( aGENCONTROLSID 
,aParentStructRowID
,aControlProgID

,aControlClassID

,aVersionMajor

,aVersionMinor

 ); 
 GENCONTROLS_SINIT( aCURSESSION,aGENCONTROLSid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure GENCONTROLS_PARENT /*����������� ��������, ������� ������������ ��� ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from GENCONTROLS where  GENCONTROLSid=aRowID;
  aParentTable := 'GENERATOR_TARGET';
 end; 


procedure GENCONTROLS_ISLOCKED /*����������� ��������, ������� ������������ ��� ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from GENCONTROLS where GENCONTROLSid=aRowID;
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
  GENCONTROLS_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure GENCONTROLS_LOCK /*����������� ��������, ������� ������������ ��� ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 GENCONTROLS_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  GENCONTROLS_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from GENCONTROLS where GENCONTROLSid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=GENCONTROLS');
    return;
  end if;
   if  aLockMode =2  
   then   
    update GENCONTROLS set LockUserID =auserID ,LockSessionID =null where GENCONTROLSid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update GENCONTROLS set LockUserID =null,LockSessionID =aCURSESSION  where GENCONTROLSid=aRowID;
     return;
   end if;
 end ;


procedure GENCONTROLS_HCL /*����������� ��������, ������� ������������ ��� ���������*/ (
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


procedure GENCONTROLS_UNLOCK /*����������� ��������, ������� ������������ ��� ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 GENCONTROLS_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update GENCONTROLS set LockUserID =null  where GENCONTROLSid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update GENCONTROLS set LockSessionID =null  where GENCONTROLSid=aRowID;
     return;
   end if;
 end; 


procedure GENCONTROLS_SINIT /*����������� ��������, ������� ������������ ��� ���������*/ (
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
 select  SecurityStyleID into atmpID from GENCONTROLS where GENCONTROLSid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =GENCONTROLS');
    return;
  end if;
if aSecurityStyleID is null then
 GENCONTROLS_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update GENCONTROLS set securitystyleid =aStyleID where GENCONTROLSid = aRowID;
else 
 update GENCONTROLS set securitystyleid =aSecurityStyleID where GENCONTROLSid = aRowID;
end if; 
end ; 


procedure GENCONTROLS_propagate /*����������� ��������, ������� ������������ ��� ���������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from GENCONTROLS where GENCONTROLSid=aRowid;
end;



procedure GENREFERENCE_BRIEF  (
 aCURSESSION CHAR,
 aGENREFERENCEid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aGENREFERENCEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from GENREFERENCE where GENREFERENCEID=aGENREFERENCEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from GENREFERENCE where GENREFERENCEid=aGENREFERENCEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=GENREFERENCE');
    return;
  end if;
  aBRIEF:=func.GENREFERENCE_BRIEF_F(aGENREFERENCEid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure GENREFERENCE_DELETE /*����������, ������� ������������ ��� ���������*/ (
 aCURSESSION CHAR,
 aGENREFERENCEid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from GENREFERENCE where GENREFERENCEID=aGENREFERENCEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from GENREFERENCE where GENREFERENCEid=aGENREFERENCEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:GENREFERENCE',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=GENREFERENCE');
      return;
    end if;
  end if;
 --  verify lock  --
 GENREFERENCE_ISLOCKED( acursession=>acursession,aROWID=>aGENREFERENCEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=GENREFERENCE');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'GENREFERENCE',
 aVERB=>'DELETEROW',  aThe_Resource=>aGENREFERENCEid, aLogInstanceID=>aInstanceID);
declare cursor chld_GENREFERENCE is select  instanceid ID from instance where OwnerPartName ='GENREFERENCE' and OwnerRowID=aGENREFERENCEid;
row_GENREFERENCE  chld_GENREFERENCE%ROWTYPE;
begin
--open chld_GENREFERENCE;
for row_GENREFERENCE in chld_GENREFERENCE loop
 Kernel.INSTANCE_OWNER (acursession,row_GENREFERENCE.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_GENREFERENCE.id);
end loop;
--close chld_GENREFERENCE;
end ;
  delete from  GENREFERENCE 
  where  GENREFERENCEID = aGENREFERENCEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*����������*/
procedure GENREFERENCE_SAVE /*����������, ������� ������������ ��� ���������*/ (
 aCURSESSION CHAR,
 aGENREFERENCEid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2 := null /* �������� *//* �������� */
,aRefClassID
 VARCHAR2 := null /* ����� ������ *//* ����� ������ */
,aVersionMajor
 NUMBER := null /* ����� ������ *//* ����� ������ */
,aVersionMinor
 NUMBER := null /* ��������� *//* ��������� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from GENREFERENCE where GENREFERENCEID=aGENREFERENCEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from GENREFERENCE where GENREFERENCEid=aGENREFERENCEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:GENREFERENCE',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=GENREFERENCE');
      return;
    end if;
  end if;
 --  verify lock  --
 GENREFERENCE_ISLOCKED( acursession=>acursession,aROWID=>aGENREFERENCEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=GENREFERENCE');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'GENREFERENCE',
 aVERB=>'EDITROW',  aThe_Resource=>aGENREFERENCEid,aLogInstanceID=>aInstanceID);
 update  GENREFERENCE set ChangeStamp=sysdate
,
  Name=aName
,
  RefClassID=aRefClassID
,
  VersionMajor=aVersionMajor
,
  VersionMinor=aVersionMinor
  where  GENREFERENCEID = aGENREFERENCEID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from GENERATOR_TARGET where GENERATOR_TARGETid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:GENREFERENCE',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=GENREFERENCE');
      return;
    end if;
 end if;
 GENERATOR_TARGET_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=GENREFERENCE');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'GENREFERENCE',
 aVERB=>'CREATEROW',  aThe_Resource=>aGENREFERENCEid,aLogInstanceID=>aInstanceID);
 insert into   GENREFERENCE
 (  GENREFERENCEID 
,ParentStructRowID
,Name

,RefClassID

,VersionMajor

,VersionMinor

 ) values ( aGENREFERENCEID 
,aParentStructRowID
,aName

,aRefClassID

,aVersionMajor

,aVersionMinor

 ); 
 GENREFERENCE_SINIT( aCURSESSION,aGENREFERENCEid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure GENREFERENCE_PARENT /*����������, ������� ������������ ��� ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  select ParentStructRowID into aParentID  from GENREFERENCE where  GENREFERENCEid=aRowID;
  aParentTable := 'GENERATOR_TARGET';
 end; 


procedure GENREFERENCE_ISLOCKED /*����������, ������� ������������ ��� ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from GENREFERENCE where GENREFERENCEid=aRowID;
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
  GENREFERENCE_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZMetaModel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure GENREFERENCE_LOCK /*����������, ������� ������������ ��� ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 GENREFERENCE_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  GENREFERENCE_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from GENREFERENCE where GENREFERENCEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=GENREFERENCE');
    return;
  end if;
   if  aLockMode =2  
   then   
    update GENREFERENCE set LockUserID =auserID ,LockSessionID =null where GENREFERENCEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update GENREFERENCE set LockUserID =null,LockSessionID =aCURSESSION  where GENREFERENCEid=aRowID;
     return;
   end if;
 end ;


procedure GENREFERENCE_HCL /*����������, ������� ������������ ��� ���������*/ (
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


procedure GENREFERENCE_UNLOCK /*����������, ������� ������������ ��� ���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 GENREFERENCE_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update GENREFERENCE set LockUserID =null  where GENREFERENCEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update GENREFERENCE set LockSessionID =null  where GENREFERENCEid=aRowID;
     return;
   end if;
 end; 


procedure GENREFERENCE_SINIT /*����������, ������� ������������ ��� ���������*/ (
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
 select  SecurityStyleID into atmpID from GENREFERENCE where GENREFERENCEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =GENREFERENCE');
    return;
  end if;
if aSecurityStyleID is null then
 GENREFERENCE_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update GENREFERENCE set securitystyleid =aStyleID where GENREFERENCEid = aRowID;
else 
 update GENREFERENCE set securitystyleid =aSecurityStyleID where GENREFERENCEid = aRowID;
end if; 
end ; 


procedure GENREFERENCE_propagate /*����������, ������� ������������ ��� ���������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from GENREFERENCE where GENREFERENCEid=aRowid;
end;


end MTZMetaModel;

/



