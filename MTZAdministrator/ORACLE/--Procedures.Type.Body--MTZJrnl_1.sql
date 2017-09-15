
/* --MTZJrnl*/

 create or replace package body MTZJrnl as

procedure MTZJrnl_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='MTZJrnl'
then
declare cursor child_JournalColumn is select JournalColumn.JournalColumnid ID from JournalColumn where  JournalColumn.InstanceID = ainstanceid;
row_JournalColumn  child_JournalColumn%ROWTYPE;
begin
--open child_JournalColumn;
for row_JournalColumn in child_JournalColumn loop
 JournalColumn_DELETE (acursession,row_JournalColumn.id,aInstanceID);
end loop;
--close child_JournalColumn;
end;
declare cursor child_Journal is select Journal.Journalid ID from Journal where  Journal.InstanceID = ainstanceid;
row_Journal  child_Journal%ROWTYPE;
begin
--open child_Journal;
for row_Journal in child_Journal loop
 Journal_DELETE (acursession,row_Journal.id,aInstanceID);
end loop;
--close child_Journal;
end;
declare cursor child_JournalSrc is select JournalSrc.JournalSrcid ID from JournalSrc where  JournalSrc.InstanceID = ainstanceid;
row_JournalSrc  child_JournalSrc%ROWTYPE;
begin
--open child_JournalSrc;
for row_JournalSrc in child_JournalSrc loop
 JournalSrc_DELETE (acursession,row_JournalSrc.id,aInstanceID);
end loop;
--close child_JournalSrc;
end;
return;
<<del_error>>
return;
end if;
end;
procedure MTZJrnl_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'MTZJrnl'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_JournalColumn is select JournalColumn.JournalColumnid ID from JournalColumn where  JournalColumn.InstanceID = arowid;
ROW_JournalColumn  lch_JournalColumn%ROWTYPE;
begin
--open lch_JournalColumn;
for row_JournalColumn in lch_JournalColumn loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from JournalColumn where JournalColumnid=row_JournalColumn.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_JournalColumn;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_JournalColumn;
     return;
   end if; 
 end if; 
 JournalColumn_HCL (acursession,ROW_JournalColumn.id,aisLocked);
 if aisLocked >2 then
   close lch_JournalColumn;
   return;
 end if;
 end loop;
--close lch_JournalColumn;
end;
declare cursor lch_Journal is select Journal.Journalid ID from Journal where  Journal.InstanceID = arowid;
ROW_Journal  lch_Journal%ROWTYPE;
begin
--open lch_Journal;
for row_Journal in lch_Journal loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from Journal where Journalid=row_Journal.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_Journal;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_Journal;
     return;
   end if; 
 end if; 
 Journal_HCL (acursession,ROW_Journal.id,aisLocked);
 if aisLocked >2 then
   close lch_Journal;
   return;
 end if;
 end loop;
--close lch_Journal;
end;
declare cursor lch_JournalSrc is select JournalSrc.JournalSrcid ID from JournalSrc where  JournalSrc.InstanceID = arowid;
ROW_JournalSrc  lch_JournalSrc%ROWTYPE;
begin
--open lch_JournalSrc;
for row_JournalSrc in lch_JournalSrc loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from JournalSrc where JournalSrcid=row_JournalSrc.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_JournalSrc;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_JournalSrc;
     return;
   end if; 
 end if; 
 JournalSrc_HCL (acursession,ROW_JournalSrc.id,aisLocked);
 if aisLocked >2 then
   close lch_JournalSrc;
   return;
 end if;
 end loop;
--close lch_JournalSrc;
end;
 end if;
aIsLocked:=0;
end;
procedure MTZJrnl_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'MTZJrnl'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_JournalColumn is select JournalColumn.JournalColumnid id from JournalColumn where  JournalColumn.InstanceID = arowid;
row_JournalColumn  pch_JournalColumn%ROWTYPE;
begin
--open pch_JournalColumn;
for row_JournalColumn in  pch_JournalColumn loop
 JournalColumn_SINIT( acursession,row_JournalColumn.id,assid);
 JournalColumn_propagate( acursession,row_JournalColumn.id);
end loop;
--close pch_JournalColumn;
end;
declare cursor pch_Journal is select Journal.Journalid id from Journal where  Journal.InstanceID = arowid;
row_Journal  pch_Journal%ROWTYPE;
begin
--open pch_Journal;
for row_Journal in  pch_Journal loop
 Journal_SINIT( acursession,row_Journal.id,assid);
 Journal_propagate( acursession,row_Journal.id);
end loop;
--close pch_Journal;
end;
declare cursor pch_JournalSrc is select JournalSrc.JournalSrcid id from JournalSrc where  JournalSrc.InstanceID = arowid;
row_JournalSrc  pch_JournalSrc%ROWTYPE;
begin
--open pch_JournalSrc;
for row_JournalSrc in  pch_JournalSrc loop
 JournalSrc_SINIT( acursession,row_JournalSrc.id,assid);
 JournalSrc_propagate( acursession,row_JournalSrc.id);
end loop;
--close pch_JournalSrc;
end;
 end if; 
end;



procedure JournalColumn_BRIEF  (
 aCURSESSION CHAR,
 aJournalColumnid CHAR,
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
if aJournalColumnid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from JournalColumn where JournalColumnID=aJournalColumnID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from JournalColumn where JournalColumnid=aJournalColumnID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=JournalColumn');
    return;
  end if;
  aBRIEF:=func.JournalColumn_BRIEF_F(aJournalColumnid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure JournalColumn_DELETE /*Колонки журнала*/ (
 aCURSESSION CHAR,
 aJournalColumnid CHAR,
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
select count(*) into existsCnt from JournalColumn where JournalColumnID=aJournalColumnID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from JournalColumn where JournalColumnid=aJournalColumnID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:JournalColumn',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=JournalColumn');
      return;
    end if;
  end if;
 --  verify lock  --
 JournalColumn_ISLOCKED( acursession=>acursession,aROWID=>aJournalColumnid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=JournalColumn');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_JColumnSource is select JColumnSource.JColumnSourceid ID from JColumnSource where  JColumnSource.ParentStructRowID = aJournalColumnid;
    child_JColumnSource_rec  child_JColumnSource%ROWTYPE;
    begin
    --open child_JColumnSource;
      for child_JColumnSource_rec in child_JColumnSource loop
      JColumnSource_DELETE (acursession,child_JColumnSource_rec.id,aInstanceid);
      end loop;
      --close child_JColumnSource;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'JournalColumn',
 aVERB=>'DELETEROW',  aThe_Resource=>aJournalColumnid, aLogInstanceID=>aInstanceID);
declare cursor chld_JournalColumn is select  instanceid ID from instance where OwnerPartName ='JournalColumn' and OwnerRowID=aJournalColumnid;
row_JournalColumn  chld_JournalColumn%ROWTYPE;
begin
--open chld_JournalColumn;
for row_JournalColumn in chld_JournalColumn loop
 Kernel.INSTANCE_OWNER (acursession,row_JournalColumn.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_JournalColumn.id);
end loop;
--close chld_JournalColumn;
end ;
  delete from  JournalColumn 
  where  JournalColumnID = aJournalColumnID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Колонки журнала*/
procedure JournalColumn_SAVE /*Колонки журнала*/ (
 aCURSESSION CHAR,
 aJournalColumnid CHAR,
aInstanceID CHAR 
,asequence
 NUMBER := null /* Последовательность *//* Последовательность */
,aname
 VARCHAR2/* Название *//* Название */
,aColumnAlignment
 NUMBER/* Выравнивание *//* Выравнивание */
,aColSort
 NUMBER/* Сортировка колонки *//* Сортировка колонки */
,aGroupAggregation
 NUMBER/* Аггрегация при группировке *//* Аггрегация при группировке */
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
select count(*) into existsCnt from JournalColumn where JournalColumnID=aJournalColumnID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from JournalColumn where JournalColumnid=aJournalColumnID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:JournalColumn',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=JournalColumn');
      return;
    end if;
  end if;
 --  verify lock  --
 JournalColumn_ISLOCKED( acursession=>acursession,aROWID=>aJournalColumnid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=JournalColumn');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'JournalColumn',
 aVERB=>'EDITROW',  aThe_Resource=>aJournalColumnid,aLogInstanceID=>aInstanceID);
 update  JournalColumn set ChangeStamp=sysdate
,
  sequence=asequence
,
  name=aname
,
  ColumnAlignment=aColumnAlignment
,
  ColSort=aColSort
,
  GroupAggregation=aGroupAggregation
  where  JournalColumnID = aJournalColumnID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:JournalColumn',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=JournalColumn');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=JournalColumn');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'JournalColumn',
 aVERB=>'CREATEROW',  aThe_Resource=>aJournalColumnid,aLogInstanceID=>aInstanceID);
 insert into   JournalColumn
 (  JournalColumnID 
,InstanceID
,sequence

,name

,ColumnAlignment

,ColSort

,GroupAggregation

 ) values ( aJournalColumnID 
,aInstanceID
,asequence

,aname

,aColumnAlignment

,aColSort

,aGroupAggregation

 ); 
 JournalColumn_SINIT( aCURSESSION,aJournalColumnid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure JournalColumn_PARENT /*Колонки журнала*/ (
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
  select  INSTANCEID into aParentID from JournalColumn where  JournalColumnid=aRowID;
 end; 


procedure JournalColumn_ISLOCKED /*Колонки журнала*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from JournalColumn where JournalColumnid=aRowID;
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
  JournalColumn_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZJrnl.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure JournalColumn_LOCK /*Колонки журнала*/ (
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
 JournalColumn_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  JournalColumn_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from JournalColumn where JournalColumnid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=JournalColumn');
    return;
  end if;
   if  aLockMode =2  
   then   
    update JournalColumn set LockUserID =auserID ,LockSessionID =null where JournalColumnid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update JournalColumn set LockUserID =null,LockSessionID =aCURSESSION  where JournalColumnid=aRowID;
     return;
   end if;
 end ;


procedure JournalColumn_HCL /*Колонки журнала*/ (
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
declare cursor lch_JColumnSource is select JColumnSource.JColumnSourceid ID from JColumnSource where  JColumnSource.ParentStructRowID = aRowid;
row_JColumnSource lch_JColumnSource%ROWTYPE;
begin  
--open lch_JColumnSource;
for row_JColumnSource in lch_JColumnSource
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from JColumnSource where JColumnSourceid=row_JColumnSource.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_JColumnSource;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_JColumnSource;
     return;
   end if; 
 end if;  
 JColumnSource_HCL (acursession,row_JColumnSource.id,aisLocked);
 if aisLocked >2 then
   close lch_JColumnSource;
   return;
 end if;
end loop;
--close lch_JColumnSource;
end;
aIsLocked :=0;
end;


procedure JournalColumn_UNLOCK /*Колонки журнала*/ (
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
 JournalColumn_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update JournalColumn set LockUserID =null  where JournalColumnid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update JournalColumn set LockSessionID =null  where JournalColumnid=aRowID;
     return;
   end if;
 end; 


procedure JournalColumn_SINIT /*Колонки журнала*/ (
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
 select  SecurityStyleID into atmpID from JournalColumn where JournalColumnid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =JournalColumn');
    return;
  end if;
if aSecurityStyleID is null then
 JournalColumn_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update JournalColumn set securitystyleid =aStyleID where JournalColumnid = aRowID;
else 
 update JournalColumn set securitystyleid =aSecurityStyleID where JournalColumnid = aRowID;
end if; 
end ; 


procedure JournalColumn_propagate /*Колонки журнала*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from JournalColumn where JournalColumnid=aRowid;
declare cursor pch_JColumnSource  is select JColumnSource.JColumnSourceid ID from JColumnSource where  JColumnSource.ParentStructRowID = aRowid;
row_JColumnSource  pch_JColumnSource%ROWTYPE;
begin
--open pch_JColumnSource;
for row_JColumnSource in pch_JColumnSource loop
   JColumnSource_SINIT( acursession,row_JColumnSource.id,assid);
   JColumnSource_propagate( acursession,row_JColumnSource.id);
end loop;
--close pch_JColumnSource;
end;
end;



procedure JColumnSource_BRIEF  (
 aCURSESSION CHAR,
 aJColumnSourceid CHAR,
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
if aJColumnSourceid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from JColumnSource where JColumnSourceID=aJColumnSourceID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from JColumnSource where JColumnSourceid=aJColumnSourceID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=JColumnSource');
    return;
  end if;
  aBRIEF:=func.JColumnSource_BRIEF_F(aJColumnSourceid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure JColumnSource_DELETE /*Состав колонки*/ (
 aCURSESSION CHAR,
 aJColumnSourceid CHAR,
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
select count(*) into existsCnt from JColumnSource where JColumnSourceID=aJColumnSourceID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from JColumnSource where JColumnSourceid=aJColumnSourceID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:JColumnSource',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=JColumnSource');
      return;
    end if;
  end if;
 --  verify lock  --
 JColumnSource_ISLOCKED( acursession=>acursession,aROWID=>aJColumnSourceid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=JColumnSource');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'JColumnSource',
 aVERB=>'DELETEROW',  aThe_Resource=>aJColumnSourceid, aLogInstanceID=>aInstanceID);
declare cursor chld_JColumnSource is select  instanceid ID from instance where OwnerPartName ='JColumnSource' and OwnerRowID=aJColumnSourceid;
row_JColumnSource  chld_JColumnSource%ROWTYPE;
begin
--open chld_JColumnSource;
for row_JColumnSource in chld_JColumnSource loop
 Kernel.INSTANCE_OWNER (acursession,row_JColumnSource.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_JColumnSource.id);
end loop;
--close chld_JColumnSource;
end ;
  delete from  JColumnSource 
  where  JColumnSourceID = aJColumnSourceID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Состав колонки*/
procedure JColumnSource_SAVE /*Состав колонки*/ (
 aCURSESSION CHAR,
 aJColumnSourceid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aSrcPartView CHAR/* Представление *//* Представление */
,aViewField
 VARCHAR2/* Поле представления *//* Поле представления */
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
select count(*) into existsCnt from JColumnSource where JColumnSourceID=aJColumnSourceID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from JColumnSource where JColumnSourceid=aJColumnSourceID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:JColumnSource',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=JColumnSource');
      return;
    end if;
  end if;
 --  verify lock  --
 JColumnSource_ISLOCKED( acursession=>acursession,aROWID=>aJColumnSourceid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=JColumnSource');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'JColumnSource',
 aVERB=>'EDITROW',  aThe_Resource=>aJColumnSourceid,aLogInstanceID=>aInstanceID);
 update  JColumnSource set ChangeStamp=sysdate
,
  SrcPartView=aSrcPartView
,
  ViewField=aViewField
  where  JColumnSourceID = aJColumnSourceID; 
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from JColumnSource where ParentStructRowID=aParentStructRowID 
 and SrcPartView=aSrcPartView;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=JColumnSource');
 return;
end if;

 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from JournalColumn where JournalColumnid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:JColumnSource',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=JColumnSource');
      return;
    end if;
 end if;
 JournalColumn_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=JColumnSource');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'JColumnSource',
 aVERB=>'CREATEROW',  aThe_Resource=>aJColumnSourceid,aLogInstanceID=>aInstanceID);
 insert into   JColumnSource
 (  JColumnSourceID 
,ParentStructRowID
,SrcPartView

,ViewField

 ) values ( aJColumnSourceID 
,aParentStructRowID
,aSrcPartView

,aViewField

 ); 
 JColumnSource_SINIT( aCURSESSION,aJColumnSourceid,atmpid);
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from JColumnSource where ParentStructRowID=aParentStructRowID 
 and SrcPartView=aSrcPartView;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=JColumnSource');
 return;
end if;

 end if;
 -- close transaction --
 end; 


procedure JColumnSource_PARENT /*Состав колонки*/ (
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
  select ParentStructRowID into aParentID  from JColumnSource where  JColumnSourceid=aRowID;
  aParentTable := 'JournalColumn';
 end; 


procedure JColumnSource_ISLOCKED /*Состав колонки*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from JColumnSource where JColumnSourceid=aRowID;
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
  JColumnSource_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZJrnl.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure JColumnSource_LOCK /*Состав колонки*/ (
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
 JColumnSource_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  JColumnSource_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from JColumnSource where JColumnSourceid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=JColumnSource');
    return;
  end if;
   if  aLockMode =2  
   then   
    update JColumnSource set LockUserID =auserID ,LockSessionID =null where JColumnSourceid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update JColumnSource set LockUserID =null,LockSessionID =aCURSESSION  where JColumnSourceid=aRowID;
     return;
   end if;
 end ;


procedure JColumnSource_HCL /*Состав колонки*/ (
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


procedure JColumnSource_UNLOCK /*Состав колонки*/ (
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
 JColumnSource_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update JColumnSource set LockUserID =null  where JColumnSourceid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update JColumnSource set LockSessionID =null  where JColumnSourceid=aRowID;
     return;
   end if;
 end; 


procedure JColumnSource_SINIT /*Состав колонки*/ (
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
 select  SecurityStyleID into atmpID from JColumnSource where JColumnSourceid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =JColumnSource');
    return;
  end if;
if aSecurityStyleID is null then
 JColumnSource_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update JColumnSource set securitystyleid =aStyleID where JColumnSourceid = aRowID;
else 
 update JColumnSource set securitystyleid =aSecurityStyleID where JColumnSourceid = aRowID;
end if; 
end ; 


procedure JColumnSource_propagate /*Состав колонки*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from JColumnSource where JColumnSourceid=aRowid;
end;



procedure Journal_BRIEF  (
 aCURSESSION CHAR,
 aJournalid CHAR,
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
if aJournalid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from Journal where JournalID=aJournalID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from Journal where Journalid=aJournalID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=Journal');
    return;
  end if;
  aBRIEF:=func.Journal_BRIEF_F(aJournalid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure Journal_DELETE /*Журнал*/ (
 aCURSESSION CHAR,
 aJournalid CHAR,
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
select count(*) into existsCnt from Journal where JournalID=aJournalID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from Journal where Journalid=aJournalID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:Journal',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=Journal');
      return;
    end if;
  end if;
 --  verify lock  --
 Journal_ISLOCKED( acursession=>acursession,aROWID=>aJournalid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=Journal');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'Journal',
 aVERB=>'DELETEROW',  aThe_Resource=>aJournalid, aLogInstanceID=>aInstanceID);
declare cursor chld_Journal is select  instanceid ID from instance where OwnerPartName ='Journal' and OwnerRowID=aJournalid;
row_Journal  chld_Journal%ROWTYPE;
begin
--open chld_Journal;
for row_Journal in chld_Journal loop
 Kernel.INSTANCE_OWNER (acursession,row_Journal.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_Journal.id);
end loop;
--close chld_Journal;
end ;
  delete from  Journal 
  where  JournalID = aJournalID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Журнал*/
procedure Journal_SAVE /*Журнал*/ (
 aCURSESSION CHAR,
 aJournalid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,athe_Alias
 VARCHAR2 := null /* Псевдоним *//* Псевдоним */
,aTheComment VARCHAR2 := null /* Описание *//* Описание */
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
select count(*) into existsCnt from Journal where JournalID=aJournalID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from Journal where Journalid=aJournalID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:Journal',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=Journal');
      return;
    end if;
  end if;
 --  verify lock  --
 Journal_ISLOCKED( acursession=>acursession,aROWID=>aJournalid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=Journal');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'Journal',
 aVERB=>'EDITROW',  aThe_Resource=>aJournalid,aLogInstanceID=>aInstanceID);
 update  Journal set ChangeStamp=sysdate
,
  Name=aName
,
  the_Alias=athe_Alias
,
  TheComment=aTheComment
  where  JournalID = aJournalID; 
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from Journal where 1=1  
 and the_Alias=athe_Alias;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=Journal');
 return;
end if;
select Count(*) into aUniqueRowCount from Journal where 1=1  
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=Journal');
 return;
end if;

 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:Journal',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=Journal');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=Journal');
    return;
  end if;
select Count(*) into existsCnt from Journal where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <Journal>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'Journal',
 aVERB=>'CREATEROW',  aThe_Resource=>aJournalid,aLogInstanceID=>aInstanceID);
 insert into   Journal
 (  JournalID 
,InstanceID
,Name

,the_Alias

,TheComment

 ) values ( aJournalID 
,aInstanceID
,aName

,athe_Alias

,aTheComment

 ); 
 Journal_SINIT( aCURSESSION,aJournalid,atmpid);
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from Journal where 1=1  
 and the_Alias=athe_Alias;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=Journal');
 return;
end if;
select Count(*) into aUniqueRowCount from Journal where 1=1  
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=Journal');
 return;
end if;

 end if;
 -- close transaction --
 end; 


procedure Journal_PARENT /*Журнал*/ (
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
  select  INSTANCEID into aParentID from Journal where  Journalid=aRowID;
 end; 


procedure Journal_ISLOCKED /*Журнал*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from Journal where Journalid=aRowID;
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
  Journal_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZJrnl.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure Journal_LOCK /*Журнал*/ (
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
 Journal_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  Journal_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from Journal where Journalid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=Journal');
    return;
  end if;
   if  aLockMode =2  
   then   
    update Journal set LockUserID =auserID ,LockSessionID =null where Journalid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update Journal set LockUserID =null,LockSessionID =aCURSESSION  where Journalid=aRowID;
     return;
   end if;
 end ;


procedure Journal_HCL /*Журнал*/ (
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


procedure Journal_UNLOCK /*Журнал*/ (
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
 Journal_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update Journal set LockUserID =null  where Journalid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update Journal set LockSessionID =null  where Journalid=aRowID;
     return;
   end if;
 end; 


procedure Journal_SINIT /*Журнал*/ (
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
 select  SecurityStyleID into atmpID from Journal where Journalid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =Journal');
    return;
  end if;
if aSecurityStyleID is null then
 Journal_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update Journal set securitystyleid =aStyleID where Journalid = aRowID;
else 
 update Journal set securitystyleid =aSecurityStyleID where Journalid = aRowID;
end if; 
end ; 


procedure Journal_propagate /*Журнал*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from Journal where Journalid=aRowid;
end;



procedure JournalSrc_BRIEF  (
 aCURSESSION CHAR,
 aJournalSrcid CHAR,
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
if aJournalSrcid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from JournalSrc where JournalSrcID=aJournalSrcID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from JournalSrc where JournalSrcid=aJournalSrcID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=JournalSrc');
    return;
  end if;
  aBRIEF:=func.JournalSrc_BRIEF_F(aJournalSrcid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure JournalSrc_DELETE /*Источники журнала*/ (
 aCURSESSION CHAR,
 aJournalSrcid CHAR,
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
select count(*) into existsCnt from JournalSrc where JournalSrcID=aJournalSrcID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from JournalSrc where JournalSrcid=aJournalSrcID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:JournalSrc',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=JournalSrc');
      return;
    end if;
  end if;
 --  verify lock  --
 JournalSrc_ISLOCKED( acursession=>acursession,aROWID=>aJournalSrcid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=JournalSrc');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'JournalSrc',
 aVERB=>'DELETEROW',  aThe_Resource=>aJournalSrcid, aLogInstanceID=>aInstanceID);
declare cursor chld_JournalSrc is select  instanceid ID from instance where OwnerPartName ='JournalSrc' and OwnerRowID=aJournalSrcid;
row_JournalSrc  chld_JournalSrc%ROWTYPE;
begin
--open chld_JournalSrc;
for row_JournalSrc in chld_JournalSrc loop
 Kernel.INSTANCE_OWNER (acursession,row_JournalSrc.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_JournalSrc.id);
end loop;
--close chld_JournalSrc;
end ;
  delete from  JournalSrc 
  where  JournalSrcID = aJournalSrcID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Источники журнала*/
procedure JournalSrc_SAVE /*Источники журнала*/ (
 aCURSESSION CHAR,
 aJournalSrcid CHAR,
aInstanceID CHAR 
,aPartView CHAR/* Представление *//* Представление */
,aOnRun
 NUMBER/* При открытии *//* При открытии */
,aOpenMode
 VARCHAR2 := null /* Режим открытия *//* Режим открытия */
,aViewAlias
 VARCHAR2 := null /* Псевдоним представления *//* Псевдоним представления */
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
select count(*) into existsCnt from JournalSrc where JournalSrcID=aJournalSrcID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from JournalSrc where JournalSrcid=aJournalSrcID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:JournalSrc',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=JournalSrc');
      return;
    end if;
  end if;
 --  verify lock  --
 JournalSrc_ISLOCKED( acursession=>acursession,aROWID=>aJournalSrcid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=JournalSrc');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'JournalSrc',
 aVERB=>'EDITROW',  aThe_Resource=>aJournalSrcid,aLogInstanceID=>aInstanceID);
 update  JournalSrc set ChangeStamp=sysdate
,
  PartView=aPartView
,
  OnRun=aOnRun
,
  OpenMode=aOpenMode
,
  ViewAlias=aViewAlias
  where  JournalSrcID = aJournalSrcID; 
 -- checking unique constraints  --

 select Count(*) into aUniqueRowCount from JournalSrc where InstanceID=aInstanceID 
 and PartView=aPartView;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=JournalSrc');
 return;
end if;

 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:JournalSrc',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=JournalSrc');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=JournalSrc');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'JournalSrc',
 aVERB=>'CREATEROW',  aThe_Resource=>aJournalSrcid,aLogInstanceID=>aInstanceID);
 insert into   JournalSrc
 (  JournalSrcID 
,InstanceID
,PartView

,OnRun

,OpenMode

,ViewAlias

 ) values ( aJournalSrcID 
,aInstanceID
,aPartView

,aOnRun

,aOpenMode

,aViewAlias

 ); 
 JournalSrc_SINIT( aCURSESSION,aJournalSrcid,atmpid);
 -- checking unique constraints  --

 select Count(*) into aUniqueRowCount from JournalSrc where InstanceID=aInstanceID 
 and PartView=aPartView;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=JournalSrc');
 return;
end if;

 end if;
 -- close transaction --
 end; 


procedure JournalSrc_PARENT /*Источники журнала*/ (
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
  select  INSTANCEID into aParentID from JournalSrc where  JournalSrcid=aRowID;
 end; 


procedure JournalSrc_ISLOCKED /*Источники журнала*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from JournalSrc where JournalSrcid=aRowID;
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
  JournalSrc_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZJrnl.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure JournalSrc_LOCK /*Источники журнала*/ (
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
 JournalSrc_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  JournalSrc_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from JournalSrc where JournalSrcid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=JournalSrc');
    return;
  end if;
   if  aLockMode =2  
   then   
    update JournalSrc set LockUserID =auserID ,LockSessionID =null where JournalSrcid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update JournalSrc set LockUserID =null,LockSessionID =aCURSESSION  where JournalSrcid=aRowID;
     return;
   end if;
 end ;


procedure JournalSrc_HCL /*Источники журнала*/ (
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


procedure JournalSrc_UNLOCK /*Источники журнала*/ (
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
 JournalSrc_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update JournalSrc set LockUserID =null  where JournalSrcid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update JournalSrc set LockSessionID =null  where JournalSrcid=aRowID;
     return;
   end if;
 end; 


procedure JournalSrc_SINIT /*Источники журнала*/ (
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
 select  SecurityStyleID into atmpID from JournalSrc where JournalSrcid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =JournalSrc');
    return;
  end if;
if aSecurityStyleID is null then
 JournalSrc_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update JournalSrc set securitystyleid =aStyleID where JournalSrcid = aRowID;
else 
 update JournalSrc set securitystyleid =aSecurityStyleID where JournalSrcid = aRowID;
end if; 
end ; 


procedure JournalSrc_propagate /*Источники журнала*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from JournalSrc where JournalSrcid=aRowid;
end;


end MTZJrnl;

/



