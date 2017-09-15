
/* --PEK103*/

 create or replace package body PEK103 as

procedure PEK103_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='PEK103'
then
declare cursor child_PEK103_DEF is select PEK103_DEF.PEK103_DEFid ID from PEK103_DEF where  PEK103_DEF.InstanceID = ainstanceid;
row_PEK103_DEF  child_PEK103_DEF%ROWTYPE;
begin
--open child_PEK103_DEF;
for row_PEK103_DEF in child_PEK103_DEF loop
 PEK103_DEF_DELETE (acursession,row_PEK103_DEF.id,aInstanceID);
end loop;
--close child_PEK103_DEF;
end;
declare cursor child_PEK103_LINES is select PEK103_LINES.PEK103_LINESid ID from PEK103_LINES where  PEK103_LINES.InstanceID = ainstanceid;
row_PEK103_LINES  child_PEK103_LINES%ROWTYPE;
begin
--open child_PEK103_LINES;
for row_PEK103_LINES in child_PEK103_LINES loop
 PEK103_LINES_DELETE (acursession,row_PEK103_LINES.id,aInstanceID);
end loop;
--close child_PEK103_LINES;
end;
return;
<<del_error>>
return;
end if;
end;
procedure PEK103_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'PEK103'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_PEK103_DEF is select PEK103_DEF.PEK103_DEFid ID from PEK103_DEF where  PEK103_DEF.InstanceID = arowid;
ROW_PEK103_DEF  lch_PEK103_DEF%ROWTYPE;
begin
--open lch_PEK103_DEF;
for row_PEK103_DEF in lch_PEK103_DEF loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEK103_DEF where PEK103_DEFid=row_PEK103_DEF.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEK103_DEF;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEK103_DEF;
     return;
   end if; 
 end if; 
 PEK103_DEF_HCL (acursession,ROW_PEK103_DEF.id,aisLocked);
 if aisLocked >2 then
   close lch_PEK103_DEF;
   return;
 end if;
 end loop;
--close lch_PEK103_DEF;
end;
declare cursor lch_PEK103_LINES is select PEK103_LINES.PEK103_LINESid ID from PEK103_LINES where  PEK103_LINES.InstanceID = arowid;
ROW_PEK103_LINES  lch_PEK103_LINES%ROWTYPE;
begin
--open lch_PEK103_LINES;
for row_PEK103_LINES in lch_PEK103_LINES loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEK103_LINES where PEK103_LINESid=row_PEK103_LINES.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEK103_LINES;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEK103_LINES;
     return;
   end if; 
 end if; 
 PEK103_LINES_HCL (acursession,ROW_PEK103_LINES.id,aisLocked);
 if aisLocked >2 then
   close lch_PEK103_LINES;
   return;
 end if;
 end loop;
--close lch_PEK103_LINES;
end;
 end if;
aIsLocked:=0;
end;
procedure PEK103_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'PEK103'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_PEK103_DEF is select PEK103_DEF.PEK103_DEFid id from PEK103_DEF where  PEK103_DEF.InstanceID = arowid;
row_PEK103_DEF  pch_PEK103_DEF%ROWTYPE;
begin
--open pch_PEK103_DEF;
for row_PEK103_DEF in  pch_PEK103_DEF loop
 PEK103_DEF_SINIT( acursession,row_PEK103_DEF.id,assid);
 PEK103_DEF_propagate( acursession,row_PEK103_DEF.id);
end loop;
--close pch_PEK103_DEF;
end;
declare cursor pch_PEK103_LINES is select PEK103_LINES.PEK103_LINESid id from PEK103_LINES where  PEK103_LINES.InstanceID = arowid;
row_PEK103_LINES  pch_PEK103_LINES%ROWTYPE;
begin
--open pch_PEK103_LINES;
for row_PEK103_LINES in  pch_PEK103_LINES loop
 PEK103_LINES_SINIT( acursession,row_PEK103_LINES.id,assid);
 PEK103_LINES_propagate( acursession,row_PEK103_LINES.id);
end loop;
--close pch_PEK103_LINES;
end;
 end if; 
end;



procedure PEK103_DEF_BRIEF  (
 aCURSESSION CHAR,
 aPEK103_DEFid CHAR,
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
if aPEK103_DEFid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEK103_DEF where PEK103_DEFID=aPEK103_DEFID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEK103_DEF where PEK103_DEFid=aPEK103_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEK103_DEF');
    return;
  end if;
  aBRIEF:=func.PEK103_DEF_BRIEF_F(aPEK103_DEFid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEK103_DEF_DELETE /*Описание формы*/ (
 aCURSESSION CHAR,
 aPEK103_DEFid CHAR,
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
select count(*) into existsCnt from PEK103_DEF where PEK103_DEFID=aPEK103_DEFID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEK103_DEF where PEK103_DEFid=aPEK103_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEK103_DEF',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEK103_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 PEK103_DEF_ISLOCKED( acursession=>acursession,aROWID=>aPEK103_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEK103_DEF');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEK103_DEF',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEK103_DEFid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEK103_DEF is select  instanceid ID from instance where OwnerPartName ='PEK103_DEF' and OwnerRowID=aPEK103_DEFid;
row_PEK103_DEF  chld_PEK103_DEF%ROWTYPE;
begin
--open chld_PEK103_DEF;
for row_PEK103_DEF in chld_PEK103_DEF loop
 Kernel.INSTANCE_OWNER (acursession,row_PEK103_DEF.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEK103_DEF.id);
end loop;
--close chld_PEK103_DEF;
end ;
  delete from  PEK103_DEF 
  where  PEK103_DEFID = aPEK103_DEFID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Описание формы*/
procedure PEK103_DEF_SAVE /*Описание формы*/ (
 aCURSESSION CHAR,
 aPEK103_DEFid CHAR,
aInstanceID CHAR 
,aTheNumber
 NUMBER/* Номер *//* Номер */
,aORG CHAR/* Организация *//* Организация */
,aSender VARCHAR2/* Отправитель *//* Отправитель */
,aRcvDate
 DATE/* Дата подачи заявки *//* Дата подачи заявки */
,aVOP CHAR := null /* Вид оплаты *//* Вид оплаты */
,aComent VARCHAR2 := null /* Примечание *//* Примечание */
,aNodeDate
 DATE := null /* Дата приемки  *//* Дата приемки  */
,aPEKZ CHAR/* Заявка *//* Заявка */
,aThePath CHAR/* Строка маршрута *//* Строка маршрута */
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
select count(*) into existsCnt from PEK103_DEF where PEK103_DEFID=aPEK103_DEFID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEK103_DEF where PEK103_DEFid=aPEK103_DEFID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEK103_DEF',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEK103_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 PEK103_DEF_ISLOCKED( acursession=>acursession,aROWID=>aPEK103_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEK103_DEF');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEK103_DEF',
 aVERB=>'EDITROW',  aThe_Resource=>aPEK103_DEFid,aLogInstanceID=>aInstanceID);
 update  PEK103_DEF set ChangeStamp=sysdate
,
  TheNumber=aTheNumber
,
  ORG=aORG
,
  Sender=aSender
,
  RcvDate=aRcvDate
,
  VOP=aVOP
,
  Coment=aComent
,
  NodeDate=aNodeDate
,
  PEKZ=aPEKZ
,
  ThePath=aThePath
  where  PEK103_DEFID = aPEK103_DEFID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEK103_DEF',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEK103_DEF');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEK103_DEF');
    return;
  end if;
select Count(*) into existsCnt from PEK103_DEF where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <PEK103_DEF>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEK103_DEF',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEK103_DEFid,aLogInstanceID=>aInstanceID);
 insert into   PEK103_DEF
 (  PEK103_DEFID 
,InstanceID
,TheNumber

,ORG

,Sender

,RcvDate

,VOP

,Coment

,NodeDate

,PEKZ

,ThePath

 ) values ( aPEK103_DEFID 
,aInstanceID
,aTheNumber

,aORG

,aSender

,aRcvDate

,aVOP

,aComent

,aNodeDate

,aPEKZ

,aThePath

 ); 
 PEK103_DEF_SINIT( aCURSESSION,aPEK103_DEFid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEK103_DEF_PARENT /*Описание формы*/ (
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
  select  INSTANCEID into aParentID from PEK103_DEF where  PEK103_DEFid=aRowID;
 end; 


procedure PEK103_DEF_ISLOCKED /*Описание формы*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEK103_DEF where PEK103_DEFid=aRowID;
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
  PEK103_DEF_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEK103.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEK103_DEF_LOCK /*Описание формы*/ (
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
 PEK103_DEF_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEK103_DEF_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEK103_DEF where PEK103_DEFid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEK103_DEF');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEK103_DEF set LockUserID =auserID ,LockSessionID =null where PEK103_DEFid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEK103_DEF set LockUserID =null,LockSessionID =aCURSESSION  where PEK103_DEFid=aRowID;
     return;
   end if;
 end ;


procedure PEK103_DEF_HCL /*Описание формы*/ (
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


procedure PEK103_DEF_UNLOCK /*Описание формы*/ (
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
 PEK103_DEF_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEK103_DEF set LockUserID =null  where PEK103_DEFid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEK103_DEF set LockSessionID =null  where PEK103_DEFid=aRowID;
     return;
   end if;
 end; 


procedure PEK103_DEF_SINIT /*Описание формы*/ (
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
 select  SecurityStyleID into atmpID from PEK103_DEF where PEK103_DEFid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEK103_DEF');
    return;
  end if;
if aSecurityStyleID is null then
 PEK103_DEF_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEK103_DEF set securitystyleid =aStyleID where PEK103_DEFid = aRowID;
else 
 update PEK103_DEF set securitystyleid =aSecurityStyleID where PEK103_DEFid = aRowID;
end if; 
end ; 


procedure PEK103_DEF_propagate /*Описание формы*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEK103_DEF where PEK103_DEFid=aRowid;
end;



procedure PEK103_LINES_BRIEF  (
 aCURSESSION CHAR,
 aPEK103_LINESid CHAR,
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
if aPEK103_LINESid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEK103_LINES where PEK103_LINESID=aPEK103_LINESID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEK103_LINES where PEK103_LINESid=aPEK103_LINESID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEK103_LINES');
    return;
  end if;
  aBRIEF:=func.PEK103_LINES_BRIEF_F(aPEK103_LINESid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEK103_LINES_DELETE /*Cтроки формы*/ (
 aCURSESSION CHAR,
 aPEK103_LINESid CHAR,
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
select count(*) into existsCnt from PEK103_LINES where PEK103_LINESID=aPEK103_LINESID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEK103_LINES where PEK103_LINESid=aPEK103_LINESID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEK103_LINES',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEK103_LINES');
      return;
    end if;
  end if;
 --  verify lock  --
 PEK103_LINES_ISLOCKED( acursession=>acursession,aROWID=>aPEK103_LINESid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEK103_LINES');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEK103_LINES',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEK103_LINESid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEK103_LINES is select  instanceid ID from instance where OwnerPartName ='PEK103_LINES' and OwnerRowID=aPEK103_LINESid;
row_PEK103_LINES  chld_PEK103_LINES%ROWTYPE;
begin
--open chld_PEK103_LINES;
for row_PEK103_LINES in chld_PEK103_LINES loop
 Kernel.INSTANCE_OWNER (acursession,row_PEK103_LINES.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEK103_LINES.id);
end loop;
--close chld_PEK103_LINES;
end ;
  delete from  PEK103_LINES 
  where  PEK103_LINESID = aPEK103_LINESID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Cтроки формы*/
procedure PEK103_LINES_SAVE /*Cтроки формы*/ (
 aCURSESSION CHAR,
 aPEK103_LINESid CHAR,
aInstanceID CHAR 
,aSeqence
 NUMBER/* № п\п *//* № п\п */
,aIndexTo CHAR/* Станция назначения *//* Станция назначения */
,aReciever
 VARCHAR2/* Получатель *//* Получатель */
,aWeight
 NUMBER/* Вес *//* Вес */
,aWeightEDIZM CHAR := null /* Ед. изм. веса *//* Ед. изм. веса */
,aQuantity
 NUMBER/* Количество *//* Количество */
,aCost
 NUMBER/* Стоимость перевозки *//* Стоимость перевозки */
,aPPOCode
 VARCHAR2/* Код отправления *//* Код отправления */
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
select count(*) into existsCnt from PEK103_LINES where PEK103_LINESID=aPEK103_LINESID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEK103_LINES where PEK103_LINESid=aPEK103_LINESID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEK103_LINES',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEK103_LINES');
      return;
    end if;
  end if;
 --  verify lock  --
 PEK103_LINES_ISLOCKED( acursession=>acursession,aROWID=>aPEK103_LINESid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEK103_LINES');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEK103_LINES',
 aVERB=>'EDITROW',  aThe_Resource=>aPEK103_LINESid,aLogInstanceID=>aInstanceID);
 update  PEK103_LINES set ChangeStamp=sysdate
,
  Seqence=aSeqence
,
  IndexTo=aIndexTo
,
  Reciever=aReciever
,
  Weight=aWeight
,
  WeightEDIZM=aWeightEDIZM
,
  Quantity=aQuantity
,
  Cost=aCost
,
  PPOCode=aPPOCode
  where  PEK103_LINESID = aPEK103_LINESID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEK103_LINES',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEK103_LINES');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEK103_LINES');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEK103_LINES',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEK103_LINESid,aLogInstanceID=>aInstanceID);
 insert into   PEK103_LINES
 (  PEK103_LINESID 
,InstanceID
,Seqence

,IndexTo

,Reciever

,Weight

,WeightEDIZM

,Quantity

,Cost

,PPOCode

 ) values ( aPEK103_LINESID 
,aInstanceID
,aSeqence

,aIndexTo

,aReciever

,aWeight

,aWeightEDIZM

,aQuantity

,aCost

,aPPOCode

 ); 
 PEK103_LINES_SINIT( aCURSESSION,aPEK103_LINESid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEK103_LINES_PARENT /*Cтроки формы*/ (
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
  select  INSTANCEID into aParentID from PEK103_LINES where  PEK103_LINESid=aRowID;
 end; 


procedure PEK103_LINES_ISLOCKED /*Cтроки формы*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEK103_LINES where PEK103_LINESid=aRowID;
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
  PEK103_LINES_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEK103.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEK103_LINES_LOCK /*Cтроки формы*/ (
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
 PEK103_LINES_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEK103_LINES_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEK103_LINES where PEK103_LINESid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEK103_LINES');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEK103_LINES set LockUserID =auserID ,LockSessionID =null where PEK103_LINESid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEK103_LINES set LockUserID =null,LockSessionID =aCURSESSION  where PEK103_LINESid=aRowID;
     return;
   end if;
 end ;


procedure PEK103_LINES_HCL /*Cтроки формы*/ (
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


procedure PEK103_LINES_UNLOCK /*Cтроки формы*/ (
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
 PEK103_LINES_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEK103_LINES set LockUserID =null  where PEK103_LINESid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEK103_LINES set LockSessionID =null  where PEK103_LINESid=aRowID;
     return;
   end if;
 end; 


procedure PEK103_LINES_SINIT /*Cтроки формы*/ (
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
 select  SecurityStyleID into atmpID from PEK103_LINES where PEK103_LINESid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEK103_LINES');
    return;
  end if;
if aSecurityStyleID is null then
 PEK103_LINES_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEK103_LINES set securitystyleid =aStyleID where PEK103_LINESid = aRowID;
else 
 update PEK103_LINES set securitystyleid =aSecurityStyleID where PEK103_LINESid = aRowID;
end if; 
end ; 


procedure PEK103_LINES_propagate /*Cтроки формы*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEK103_LINES where PEK103_LINESid=aRowid;
end;


end PEK103;

/



