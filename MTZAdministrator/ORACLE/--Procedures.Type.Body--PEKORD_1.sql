
/* --PEKORD*/

 create or replace package body PEKORD as

procedure PEKORD_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='PEKORD'
then
declare cursor child_PEKORD_DEF is select PEKORD_DEF.PEKORD_DEFid ID from PEKORD_DEF where  PEKORD_DEF.InstanceID = ainstanceid;
row_PEKORD_DEF  child_PEKORD_DEF%ROWTYPE;
begin
--open child_PEKORD_DEF;
for row_PEKORD_DEF in child_PEKORD_DEF loop
 PEKORD_DEF_DELETE (acursession,row_PEKORD_DEF.id,aInstanceID);
end loop;
--close child_PEKORD_DEF;
end;
declare cursor child_PEKORD_DATA is select PEKORD_DATA.PEKORD_DATAid ID from PEKORD_DATA where  PEKORD_DATA.InstanceID = ainstanceid;
row_PEKORD_DATA  child_PEKORD_DATA%ROWTYPE;
begin
--open child_PEKORD_DATA;
for row_PEKORD_DATA in child_PEKORD_DATA loop
 PEKORD_DATA_DELETE (acursession,row_PEKORD_DATA.id,aInstanceID);
end loop;
--close child_PEKORD_DATA;
end;
return;
<<del_error>>
return;
end if;
end;
procedure PEKORD_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'PEKORD'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_PEKORD_DEF is select PEKORD_DEF.PEKORD_DEFid ID from PEKORD_DEF where  PEKORD_DEF.InstanceID = arowid;
ROW_PEKORD_DEF  lch_PEKORD_DEF%ROWTYPE;
begin
--open lch_PEKORD_DEF;
for row_PEKORD_DEF in lch_PEKORD_DEF loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKORD_DEF where PEKORD_DEFid=row_PEKORD_DEF.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKORD_DEF;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKORD_DEF;
     return;
   end if; 
 end if; 
 PEKORD_DEF_HCL (acursession,ROW_PEKORD_DEF.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKORD_DEF;
   return;
 end if;
 end loop;
--close lch_PEKORD_DEF;
end;
declare cursor lch_PEKORD_DATA is select PEKORD_DATA.PEKORD_DATAid ID from PEKORD_DATA where  PEKORD_DATA.InstanceID = arowid;
ROW_PEKORD_DATA  lch_PEKORD_DATA%ROWTYPE;
begin
--open lch_PEKORD_DATA;
for row_PEKORD_DATA in lch_PEKORD_DATA loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKORD_DATA where PEKORD_DATAid=row_PEKORD_DATA.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKORD_DATA;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKORD_DATA;
     return;
   end if; 
 end if; 
 PEKORD_DATA_HCL (acursession,ROW_PEKORD_DATA.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKORD_DATA;
   return;
 end if;
 end loop;
--close lch_PEKORD_DATA;
end;
 end if;
aIsLocked:=0;
end;
procedure PEKORD_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'PEKORD'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_PEKORD_DEF is select PEKORD_DEF.PEKORD_DEFid id from PEKORD_DEF where  PEKORD_DEF.InstanceID = arowid;
row_PEKORD_DEF  pch_PEKORD_DEF%ROWTYPE;
begin
--open pch_PEKORD_DEF;
for row_PEKORD_DEF in  pch_PEKORD_DEF loop
 PEKORD_DEF_SINIT( acursession,row_PEKORD_DEF.id,assid);
 PEKORD_DEF_propagate( acursession,row_PEKORD_DEF.id);
end loop;
--close pch_PEKORD_DEF;
end;
declare cursor pch_PEKORD_DATA is select PEKORD_DATA.PEKORD_DATAid id from PEKORD_DATA where  PEKORD_DATA.InstanceID = arowid;
row_PEKORD_DATA  pch_PEKORD_DATA%ROWTYPE;
begin
--open pch_PEKORD_DATA;
for row_PEKORD_DATA in  pch_PEKORD_DATA loop
 PEKORD_DATA_SINIT( acursession,row_PEKORD_DATA.id,assid);
 PEKORD_DATA_propagate( acursession,row_PEKORD_DATA.id);
end loop;
--close pch_PEKORD_DATA;
end;
 end if; 
end;



procedure PEKORD_DEF_BRIEF  (
 aCURSESSION CHAR,
 aPEKORD_DEFid CHAR,
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
if aPEKORD_DEFid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKORD_DEF where PEKORD_DEFID=aPEKORD_DEFID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKORD_DEF where PEKORD_DEFid=aPEKORD_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKORD_DEF');
    return;
  end if;
  aBRIEF:=func.PEKORD_DEF_BRIEF_F(aPEKORD_DEFid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKORD_DEF_DELETE /*Описание приказа*/ (
 aCURSESSION CHAR,
 aPEKORD_DEFid CHAR,
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
select count(*) into existsCnt from PEKORD_DEF where PEKORD_DEFID=aPEKORD_DEFID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKORD_DEF where PEKORD_DEFid=aPEKORD_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKORD_DEF',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKORD_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKORD_DEF_ISLOCKED( acursession=>acursession,aROWID=>aPEKORD_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKORD_DEF');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKORD_DEF',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKORD_DEFid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKORD_DEF is select  instanceid ID from instance where OwnerPartName ='PEKORD_DEF' and OwnerRowID=aPEKORD_DEFid;
row_PEKORD_DEF  chld_PEKORD_DEF%ROWTYPE;
begin
--open chld_PEKORD_DEF;
for row_PEKORD_DEF in chld_PEKORD_DEF loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKORD_DEF.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKORD_DEF.id);
end loop;
--close chld_PEKORD_DEF;
end ;
  delete from  PEKORD_DEF 
  where  PEKORD_DEFID = aPEKORD_DEFID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Описание приказа*/
procedure PEKORD_DEF_SAVE /*Описание приказа*/ (
 aCURSESSION CHAR,
 aPEKORD_DEFid CHAR,
aInstanceID CHAR 
,adocnumber
 NUMBER := null /* Номер приказа *//* Номер приказа */
,aauthor CHAR/* Автор *//* Автор */
,adocname
 VARCHAR2/* Название *//* Название */
,aOrg CHAR/* Наша организация *//* Наша организация */
,aregdate
 DATE := null /* Дата регистрации *//* Дата регистрации */
,acomments VARCHAR2 := null /* Содержание *//* Содержание */
,aTarifStartDate
 DATE/* Дата начала действия тарифа *//* Дата начала действия тарифа */
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
select count(*) into existsCnt from PEKORD_DEF where PEKORD_DEFID=aPEKORD_DEFID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKORD_DEF where PEKORD_DEFid=aPEKORD_DEFID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKORD_DEF',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKORD_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKORD_DEF_ISLOCKED( acursession=>acursession,aROWID=>aPEKORD_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKORD_DEF');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKORD_DEF',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKORD_DEFid,aLogInstanceID=>aInstanceID);
 update  PEKORD_DEF set ChangeStamp=sysdate
,
  docnumber=adocnumber
,
  author=aauthor
,
  docname=adocname
,
  Org=aOrg
,
  regdate=aregdate
,
  comments=acomments
,
  TarifStartDate=aTarifStartDate
  where  PEKORD_DEFID = aPEKORD_DEFID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKORD_DEF',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKORD_DEF');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKORD_DEF');
    return;
  end if;
select Count(*) into existsCnt from PEKORD_DEF where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <PEKORD_DEF>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKORD_DEF',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKORD_DEFid,aLogInstanceID=>aInstanceID);
 insert into   PEKORD_DEF
 (  PEKORD_DEFID 
,InstanceID
,docnumber

,author

,docname

,Org

,regdate

,comments

,TarifStartDate

 ) values ( aPEKORD_DEFID 
,aInstanceID
,adocnumber

,aauthor

,adocname

,aOrg

,aregdate

,acomments

,aTarifStartDate

 ); 
 PEKORD_DEF_SINIT( aCURSESSION,aPEKORD_DEFid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKORD_DEF_PARENT /*Описание приказа*/ (
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
  select  INSTANCEID into aParentID from PEKORD_DEF where  PEKORD_DEFid=aRowID;
 end; 


procedure PEKORD_DEF_ISLOCKED /*Описание приказа*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKORD_DEF where PEKORD_DEFid=aRowID;
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
  PEKORD_DEF_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKORD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKORD_DEF_LOCK /*Описание приказа*/ (
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
 PEKORD_DEF_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKORD_DEF_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKORD_DEF where PEKORD_DEFid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKORD_DEF');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKORD_DEF set LockUserID =auserID ,LockSessionID =null where PEKORD_DEFid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKORD_DEF set LockUserID =null,LockSessionID =aCURSESSION  where PEKORD_DEFid=aRowID;
     return;
   end if;
 end ;


procedure PEKORD_DEF_HCL /*Описание приказа*/ (
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


procedure PEKORD_DEF_UNLOCK /*Описание приказа*/ (
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
 PEKORD_DEF_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKORD_DEF set LockUserID =null  where PEKORD_DEFid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKORD_DEF set LockSessionID =null  where PEKORD_DEFid=aRowID;
     return;
   end if;
 end; 


procedure PEKORD_DEF_SINIT /*Описание приказа*/ (
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
 select  SecurityStyleID into atmpID from PEKORD_DEF where PEKORD_DEFid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKORD_DEF');
    return;
  end if;
if aSecurityStyleID is null then
 PEKORD_DEF_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKORD_DEF set securitystyleid =aStyleID where PEKORD_DEFid = aRowID;
else 
 update PEKORD_DEF set securitystyleid =aSecurityStyleID where PEKORD_DEFid = aRowID;
end if; 
end ; 


procedure PEKORD_DEF_propagate /*Описание приказа*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKORD_DEF where PEKORD_DEFid=aRowid;
end;



procedure PEKORD_DATA_BRIEF  (
 aCURSESSION CHAR,
 aPEKORD_DATAid CHAR,
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
if aPEKORD_DATAid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKORD_DATA where PEKORD_DATAID=aPEKORD_DATAID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKORD_DATA where PEKORD_DATAid=aPEKORD_DATAID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKORD_DATA');
    return;
  end if;
  aBRIEF:=func.PEKORD_DATA_BRIEF_F(aPEKORD_DATAid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKORD_DATA_DELETE /*Таблица тарифов*/ (
 aCURSESSION CHAR,
 aPEKORD_DATAid CHAR,
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
select count(*) into existsCnt from PEKORD_DATA where PEKORD_DATAID=aPEKORD_DATAID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKORD_DATA where PEKORD_DATAid=aPEKORD_DATAID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKORD_DATA',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKORD_DATA');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKORD_DATA_ISLOCKED( acursession=>acursession,aROWID=>aPEKORD_DATAid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKORD_DATA');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKORD_DATA',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKORD_DATAid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKORD_DATA is select  instanceid ID from instance where OwnerPartName ='PEKORD_DATA' and OwnerRowID=aPEKORD_DATAid;
row_PEKORD_DATA  chld_PEKORD_DATA%ROWTYPE;
begin
--open chld_PEKORD_DATA;
for row_PEKORD_DATA in chld_PEKORD_DATA loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKORD_DATA.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKORD_DATA.id);
end loop;
--close chld_PEKORD_DATA;
end ;
  delete from  PEKORD_DATA 
  where  PEKORD_DATAID = aPEKORD_DATAID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Таблица тарифов*/
procedure PEKORD_DATA_SAVE /*Таблица тарифов*/ (
 aCURSESSION CHAR,
 aPEKORD_DATAid CHAR,
aInstanceID CHAR 
,aCient CHAR/* Клиент *//* Клиент */
,aNewTarifType CHAR/* Тип тарифа *//* Тип тарифа */
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
select count(*) into existsCnt from PEKORD_DATA where PEKORD_DATAID=aPEKORD_DATAID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKORD_DATA where PEKORD_DATAid=aPEKORD_DATAID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKORD_DATA',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKORD_DATA');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKORD_DATA_ISLOCKED( acursession=>acursession,aROWID=>aPEKORD_DATAid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKORD_DATA');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKORD_DATA',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKORD_DATAid,aLogInstanceID=>aInstanceID);
 update  PEKORD_DATA set ChangeStamp=sysdate
,
  Cient=aCient
,
  NewTarifType=aNewTarifType
  where  PEKORD_DATAID = aPEKORD_DATAID; 
 -- checking unique constraints  --

 select Count(*) into aUniqueRowCount from PEKORD_DATA where InstanceID=aInstanceID 
 and Cient=aCient;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=PEKORD_DATA');
 return;
end if;

 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKORD_DATA',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKORD_DATA');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKORD_DATA');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKORD_DATA',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKORD_DATAid,aLogInstanceID=>aInstanceID);
 insert into   PEKORD_DATA
 (  PEKORD_DATAID 
,InstanceID
,Cient

,NewTarifType

 ) values ( aPEKORD_DATAID 
,aInstanceID
,aCient

,aNewTarifType

 ); 
 PEKORD_DATA_SINIT( aCURSESSION,aPEKORD_DATAid,atmpid);
 -- checking unique constraints  --

 select Count(*) into aUniqueRowCount from PEKORD_DATA where InstanceID=aInstanceID 
 and Cient=aCient;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=PEKORD_DATA');
 return;
end if;

 end if;
 -- close transaction --
 end; 


procedure PEKORD_DATA_PARENT /*Таблица тарифов*/ (
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
  select  INSTANCEID into aParentID from PEKORD_DATA where  PEKORD_DATAid=aRowID;
 end; 


procedure PEKORD_DATA_ISLOCKED /*Таблица тарифов*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKORD_DATA where PEKORD_DATAid=aRowID;
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
  PEKORD_DATA_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKORD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKORD_DATA_LOCK /*Таблица тарифов*/ (
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
 PEKORD_DATA_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKORD_DATA_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKORD_DATA where PEKORD_DATAid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKORD_DATA');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKORD_DATA set LockUserID =auserID ,LockSessionID =null where PEKORD_DATAid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKORD_DATA set LockUserID =null,LockSessionID =aCURSESSION  where PEKORD_DATAid=aRowID;
     return;
   end if;
 end ;


procedure PEKORD_DATA_HCL /*Таблица тарифов*/ (
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


procedure PEKORD_DATA_UNLOCK /*Таблица тарифов*/ (
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
 PEKORD_DATA_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKORD_DATA set LockUserID =null  where PEKORD_DATAid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKORD_DATA set LockSessionID =null  where PEKORD_DATAid=aRowID;
     return;
   end if;
 end; 


procedure PEKORD_DATA_SINIT /*Таблица тарифов*/ (
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
 select  SecurityStyleID into atmpID from PEKORD_DATA where PEKORD_DATAid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKORD_DATA');
    return;
  end if;
if aSecurityStyleID is null then
 PEKORD_DATA_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKORD_DATA set securitystyleid =aStyleID where PEKORD_DATAid = aRowID;
else 
 update PEKORD_DATA set securitystyleid =aSecurityStyleID where PEKORD_DATAid = aRowID;
end if; 
end ; 


procedure PEKORD_DATA_propagate /*Таблица тарифов*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKORD_DATA where PEKORD_DATAid=aRowid;
end;


end PEKORD;

/



