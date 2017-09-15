
/* --PEKZ*/

 create or replace package body PEKZ as

procedure PEKZ_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='PEKZ'
then
declare cursor child_pekz_path is select pekz_path.pekz_pathid ID from pekz_path where  pekz_path.InstanceID = ainstanceid;
row_pekz_path  child_pekz_path%ROWTYPE;
begin
--open child_pekz_path;
for row_pekz_path in child_pekz_path loop
 pekz_path_DELETE (acursession,row_pekz_path.id,aInstanceID);
end loop;
--close child_pekz_path;
end;
declare cursor child_PEKZ_DOCS is select PEKZ_DOCS.PEKZ_DOCSid ID from PEKZ_DOCS where  PEKZ_DOCS.InstanceID = ainstanceid;
row_PEKZ_DOCS  child_PEKZ_DOCS%ROWTYPE;
begin
--open child_PEKZ_DOCS;
for row_PEKZ_DOCS in child_PEKZ_DOCS loop
 PEKZ_DOCS_DELETE (acursession,row_PEKZ_DOCS.id,aInstanceID);
end loop;
--close child_PEKZ_DOCS;
end;
declare cursor child_pekz_def is select pekz_def.pekz_defid ID from pekz_def where  pekz_def.InstanceID = ainstanceid;
row_pekz_def  child_pekz_def%ROWTYPE;
begin
--open child_pekz_def;
for row_pekz_def in child_pekz_def loop
 pekz_def_DELETE (acursession,row_pekz_def.id,aInstanceID);
end loop;
--close child_pekz_def;
end;
declare cursor child_pekz_dop is select pekz_dop.pekz_dopid ID from pekz_dop where  pekz_dop.InstanceID = ainstanceid;
row_pekz_dop  child_pekz_dop%ROWTYPE;
begin
--open child_pekz_dop;
for row_pekz_dop in child_pekz_dop loop
 pekz_dop_DELETE (acursession,row_pekz_dop.id,aInstanceID);
end loop;
--close child_pekz_dop;
end;
return;
<<del_error>>
return;
end if;
end;
procedure PEKZ_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'PEKZ'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_pekz_path is select pekz_path.pekz_pathid ID from pekz_path where  pekz_path.InstanceID = arowid;
ROW_pekz_path  lch_pekz_path%ROWTYPE;
begin
--open lch_pekz_path;
for row_pekz_path in lch_pekz_path loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from pekz_path where pekz_pathid=row_pekz_path.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_pekz_path;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_pekz_path;
     return;
   end if; 
 end if; 
 pekz_path_HCL (acursession,ROW_pekz_path.id,aisLocked);
 if aisLocked >2 then
   close lch_pekz_path;
   return;
 end if;
 end loop;
--close lch_pekz_path;
end;
declare cursor lch_PEKZ_DOCS is select PEKZ_DOCS.PEKZ_DOCSid ID from PEKZ_DOCS where  PEKZ_DOCS.InstanceID = arowid;
ROW_PEKZ_DOCS  lch_PEKZ_DOCS%ROWTYPE;
begin
--open lch_PEKZ_DOCS;
for row_PEKZ_DOCS in lch_PEKZ_DOCS loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKZ_DOCS where PEKZ_DOCSid=row_PEKZ_DOCS.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKZ_DOCS;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKZ_DOCS;
     return;
   end if; 
 end if; 
 PEKZ_DOCS_HCL (acursession,ROW_PEKZ_DOCS.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKZ_DOCS;
   return;
 end if;
 end loop;
--close lch_PEKZ_DOCS;
end;
declare cursor lch_pekz_def is select pekz_def.pekz_defid ID from pekz_def where  pekz_def.InstanceID = arowid;
ROW_pekz_def  lch_pekz_def%ROWTYPE;
begin
--open lch_pekz_def;
for row_pekz_def in lch_pekz_def loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from pekz_def where pekz_defid=row_pekz_def.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_pekz_def;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_pekz_def;
     return;
   end if; 
 end if; 
 pekz_def_HCL (acursession,ROW_pekz_def.id,aisLocked);
 if aisLocked >2 then
   close lch_pekz_def;
   return;
 end if;
 end loop;
--close lch_pekz_def;
end;
declare cursor lch_pekz_dop is select pekz_dop.pekz_dopid ID from pekz_dop where  pekz_dop.InstanceID = arowid;
ROW_pekz_dop  lch_pekz_dop%ROWTYPE;
begin
--open lch_pekz_dop;
for row_pekz_dop in lch_pekz_dop loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from pekz_dop where pekz_dopid=row_pekz_dop.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_pekz_dop;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_pekz_dop;
     return;
   end if; 
 end if; 
 pekz_dop_HCL (acursession,ROW_pekz_dop.id,aisLocked);
 if aisLocked >2 then
   close lch_pekz_dop;
   return;
 end if;
 end loop;
--close lch_pekz_dop;
end;
 end if;
aIsLocked:=0;
end;
procedure PEKZ_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'PEKZ'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_pekz_path is select pekz_path.pekz_pathid id from pekz_path where  pekz_path.InstanceID = arowid;
row_pekz_path  pch_pekz_path%ROWTYPE;
begin
--open pch_pekz_path;
for row_pekz_path in  pch_pekz_path loop
 pekz_path_SINIT( acursession,row_pekz_path.id,assid);
 pekz_path_propagate( acursession,row_pekz_path.id);
end loop;
--close pch_pekz_path;
end;
declare cursor pch_PEKZ_DOCS is select PEKZ_DOCS.PEKZ_DOCSid id from PEKZ_DOCS where  PEKZ_DOCS.InstanceID = arowid;
row_PEKZ_DOCS  pch_PEKZ_DOCS%ROWTYPE;
begin
--open pch_PEKZ_DOCS;
for row_PEKZ_DOCS in  pch_PEKZ_DOCS loop
 PEKZ_DOCS_SINIT( acursession,row_PEKZ_DOCS.id,assid);
 PEKZ_DOCS_propagate( acursession,row_PEKZ_DOCS.id);
end loop;
--close pch_PEKZ_DOCS;
end;
declare cursor pch_pekz_def is select pekz_def.pekz_defid id from pekz_def where  pekz_def.InstanceID = arowid;
row_pekz_def  pch_pekz_def%ROWTYPE;
begin
--open pch_pekz_def;
for row_pekz_def in  pch_pekz_def loop
 pekz_def_SINIT( acursession,row_pekz_def.id,assid);
 pekz_def_propagate( acursession,row_pekz_def.id);
end loop;
--close pch_pekz_def;
end;
declare cursor pch_pekz_dop is select pekz_dop.pekz_dopid id from pekz_dop where  pekz_dop.InstanceID = arowid;
row_pekz_dop  pch_pekz_dop%ROWTYPE;
begin
--open pch_pekz_dop;
for row_pekz_dop in  pch_pekz_dop loop
 pekz_dop_SINIT( acursession,row_pekz_dop.id,assid);
 pekz_dop_propagate( acursession,row_pekz_dop.id);
end loop;
--close pch_pekz_dop;
end;
 end if; 
end;



procedure pekz_path_BRIEF  (
 aCURSESSION CHAR,
 apekz_pathid CHAR,
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
if apekz_pathid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from pekz_path where pekz_pathID=apekz_pathID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from pekz_path where pekz_pathid=apekz_pathID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=pekz_path');
    return;
  end if;
  aBRIEF:=func.pekz_path_BRIEF_F(apekz_pathid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure pekz_path_DELETE /*Маршрут доставки*/ (
 aCURSESSION CHAR,
 apekz_pathid CHAR,
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
select count(*) into existsCnt from pekz_path where pekz_pathID=apekz_pathID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from pekz_path where pekz_pathid=apekz_pathID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:pekz_path',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=pekz_path');
      return;
    end if;
  end if;
 --  verify lock  --
 pekz_path_ISLOCKED( acursession=>acursession,aROWID=>apekz_pathid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=pekz_path');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_PEKZ_WLIST is select PEKZ_WLIST.PEKZ_WLISTid ID from PEKZ_WLIST where  PEKZ_WLIST.ParentStructRowID = apekz_pathid;
    child_PEKZ_WLIST_rec  child_PEKZ_WLIST%ROWTYPE;
    begin
    --open child_PEKZ_WLIST;
      for child_PEKZ_WLIST_rec in child_PEKZ_WLIST loop
      PEKZ_WLIST_DELETE (acursession,child_PEKZ_WLIST_rec.id,aInstanceid);
      end loop;
      --close child_PEKZ_WLIST;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'pekz_path',
 aVERB=>'DELETEROW',  aThe_Resource=>apekz_pathid, aLogInstanceID=>aInstanceID);
declare cursor chld_pekz_path is select  instanceid ID from instance where OwnerPartName ='pekz_path' and OwnerRowID=apekz_pathid;
row_pekz_path  chld_pekz_path%ROWTYPE;
begin
--open chld_pekz_path;
for row_pekz_path in chld_pekz_path loop
 Kernel.INSTANCE_OWNER (acursession,row_pekz_path.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_pekz_path.id);
end loop;
--close chld_pekz_path;
end ;
  delete from  pekz_path 
  where  pekz_pathID = apekz_pathID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Маршрут доставки*/
procedure pekz_path_SAVE /*Маршрут доставки*/ (
 aCURSESSION CHAR,
 apekz_pathid CHAR,
aInstanceID CHAR 
,asequence
 NUMBER/* № *//* № */
,aTheDirection CHAR/* Направление *//* Направление */
,aPPONum
 NUMBER/* Кол-во ПО *//* Кол-во ПО */
,aDestStation CHAR/* Станция назначения *//* Станция назначения */
,aPPODescription CHAR := null /* Характер груза *//* Характер груза */
,aReceiver CHAR := null /* Получатель *//* Получатель */
,aPPOWeight
 NUMBER/* Вес ПО *//* Вес ПО */
,aWeightEDIZM CHAR := null /* Ед. изм. веса *//* Ед. изм. веса */
,aPPOVol
 NUMBER := null /* Объем ПО *//* Объем ПО */
,aValueEDIZM CHAR := null /* Ед.изм. объема *//* Ед.изм. объема */
,aPathPlanedDate
 DATE := null /* Дата предполагаемой отправки *//* Дата предполагаемой отправки */
,aSendDate
 DATE := null /* Дата отправки *//* Дата отправки */
,aRcvWaitDate
 DATE := null /* Ориентировочная дата получения *//* Ориентировочная дата получения */
,atrainNo CHAR := null /* Поезд *//* Поезд */
,avagNo
 VARCHAR2 := null /* Вагон № *//* Вагон № */
,aPassFIO
 VARCHAR2 := null /* ФИО Кладовщика *//* ФИО Кладовщика */
,aPassDate
 DATE := null /* Дата передачи груза в вагон *//* Дата передачи груза в вагон */
,aRcvFIO
 VARCHAR2 := null /* ФИО ВПН *//* ФИО ВПН */
,aRcvDate
 DATE := null /* Дата получения груза в ПО *//* Дата получения груза в ПО */
,aInforRcvFIO
 VARCHAR2 := null /* Кому передана информация *//* Кому передана информация */
,aInfoDate
 DATE := null /* Дата передачи информации *//* Дата передачи информации */
,aInfoSendType CHAR := null /* Способ передачи информации *//* Способ передачи информации */
,aTheCurrency CHAR := null /* Валюта *//* Валюта */
,aTRF
 NUMBER := null /* Тариф *//* Тариф */
,aSummNDS
 NUMBER := null /* Сумма с НДС *//* Сумма с НДС */
,aSumm
 NUMBER := null /* Сумма без НДС *//* Сумма без НДС */
,aSupTRF
 NUMBER := null /* Тариф поставщика *//* Тариф поставщика */
,aSupSumm
 NUMBER := null /* Сумма поставщику без НДС *//* Сумма поставщику без НДС */
,aSupSummNDS
 NUMBER := null /* Сумма поставщику с НДС *//* Сумма поставщику с НДС */
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
select count(*) into existsCnt from pekz_path where pekz_pathID=apekz_pathID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from pekz_path where pekz_pathid=apekz_pathID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:pekz_path',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=pekz_path');
      return;
    end if;
  end if;
 --  verify lock  --
 pekz_path_ISLOCKED( acursession=>acursession,aROWID=>apekz_pathid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=pekz_path');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'pekz_path',
 aVERB=>'EDITROW',  aThe_Resource=>apekz_pathid,aLogInstanceID=>aInstanceID);
 update  pekz_path set ChangeStamp=sysdate
,
  sequence=asequence
,
  TheDirection=aTheDirection
,
  PPONum=aPPONum
,
  DestStation=aDestStation
,
  PPODescription=aPPODescription
,
  Receiver=aReceiver
,
  PPOWeight=aPPOWeight
,
  WeightEDIZM=aWeightEDIZM
,
  PPOVol=aPPOVol
,
  ValueEDIZM=aValueEDIZM
,
  PathPlanedDate=aPathPlanedDate
,
  SendDate=aSendDate
,
  RcvWaitDate=aRcvWaitDate
,
  trainNo=atrainNo
,
  vagNo=avagNo
,
  PassFIO=aPassFIO
,
  PassDate=aPassDate
,
  RcvFIO=aRcvFIO
,
  RcvDate=aRcvDate
,
  InforRcvFIO=aInforRcvFIO
,
  InfoDate=aInfoDate
,
  InfoSendType=aInfoSendType
,
  TheCurrency=aTheCurrency
,
  TRF=aTRF
,
  SummNDS=aSummNDS
,
  Summ=aSumm
,
  SupTRF=aSupTRF
,
  SupSumm=aSupSumm
,
  SupSummNDS=aSupSummNDS
  where  pekz_pathID = apekz_pathID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:pekz_path',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=pekz_path');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=pekz_path');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'pekz_path',
 aVERB=>'CREATEROW',  aThe_Resource=>apekz_pathid,aLogInstanceID=>aInstanceID);
 insert into   pekz_path
 (  pekz_pathID 
,InstanceID
,sequence

,TheDirection

,PPONum

,DestStation

,PPODescription

,Receiver

,PPOWeight

,WeightEDIZM

,PPOVol

,ValueEDIZM

,PathPlanedDate

,SendDate

,RcvWaitDate

,trainNo

,vagNo

,PassFIO

,PassDate

,RcvFIO

,RcvDate

,InforRcvFIO

,InfoDate

,InfoSendType

,TheCurrency

,TRF

,SummNDS

,Summ

,SupTRF

,SupSumm

,SupSummNDS

 ) values ( apekz_pathID 
,aInstanceID
,asequence

,aTheDirection

,aPPONum

,aDestStation

,aPPODescription

,aReceiver

,aPPOWeight

,aWeightEDIZM

,aPPOVol

,aValueEDIZM

,aPathPlanedDate

,aSendDate

,aRcvWaitDate

,atrainNo

,avagNo

,aPassFIO

,aPassDate

,aRcvFIO

,aRcvDate

,aInforRcvFIO

,aInfoDate

,aInfoSendType

,aTheCurrency

,aTRF

,aSummNDS

,aSumm

,aSupTRF

,aSupSumm

,aSupSummNDS

 ); 
 pekz_path_SINIT( aCURSESSION,apekz_pathid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure pekz_path_PARENT /*Маршрут доставки*/ (
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
  select  INSTANCEID into aParentID from pekz_path where  pekz_pathid=aRowID;
 end; 


procedure pekz_path_ISLOCKED /*Маршрут доставки*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from pekz_path where pekz_pathid=aRowID;
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
  pekz_path_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKZ.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure pekz_path_LOCK /*Маршрут доставки*/ (
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
 pekz_path_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  pekz_path_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from pekz_path where pekz_pathid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=pekz_path');
    return;
  end if;
   if  aLockMode =2  
   then   
    update pekz_path set LockUserID =auserID ,LockSessionID =null where pekz_pathid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update pekz_path set LockUserID =null,LockSessionID =aCURSESSION  where pekz_pathid=aRowID;
     return;
   end if;
 end ;


procedure pekz_path_HCL /*Маршрут доставки*/ (
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
declare cursor lch_PEKZ_WLIST is select PEKZ_WLIST.PEKZ_WLISTid ID from PEKZ_WLIST where  PEKZ_WLIST.ParentStructRowID = aRowid;
row_PEKZ_WLIST lch_PEKZ_WLIST%ROWTYPE;
begin  
--open lch_PEKZ_WLIST;
for row_PEKZ_WLIST in lch_PEKZ_WLIST
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from PEKZ_WLIST where PEKZ_WLISTid=row_PEKZ_WLIST.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKZ_WLIST;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_PEKZ_WLIST;
     return;
   end if; 
 end if;  
 PEKZ_WLIST_HCL (acursession,row_PEKZ_WLIST.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKZ_WLIST;
   return;
 end if;
end loop;
--close lch_PEKZ_WLIST;
end;
aIsLocked :=0;
end;


procedure pekz_path_UNLOCK /*Маршрут доставки*/ (
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
 pekz_path_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update pekz_path set LockUserID =null  where pekz_pathid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update pekz_path set LockSessionID =null  where pekz_pathid=aRowID;
     return;
   end if;
 end; 


procedure pekz_path_SINIT /*Маршрут доставки*/ (
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
 select  SecurityStyleID into atmpID from pekz_path where pekz_pathid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =pekz_path');
    return;
  end if;
if aSecurityStyleID is null then
 pekz_path_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update pekz_path set securitystyleid =aStyleID where pekz_pathid = aRowID;
else 
 update pekz_path set securitystyleid =aSecurityStyleID where pekz_pathid = aRowID;
end if; 
end ; 


procedure pekz_path_propagate /*Маршрут доставки*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from pekz_path where pekz_pathid=aRowid;
declare cursor pch_PEKZ_WLIST  is select PEKZ_WLIST.PEKZ_WLISTid ID from PEKZ_WLIST where  PEKZ_WLIST.ParentStructRowID = aRowid;
row_PEKZ_WLIST  pch_PEKZ_WLIST%ROWTYPE;
begin
--open pch_PEKZ_WLIST;
for row_PEKZ_WLIST in pch_PEKZ_WLIST loop
   PEKZ_WLIST_SINIT( acursession,row_PEKZ_WLIST.id,assid);
   PEKZ_WLIST_propagate( acursession,row_PEKZ_WLIST.id);
end loop;
--close pch_PEKZ_WLIST;
end;
end;



procedure PEKZ_WLIST_BRIEF  (
 aCURSESSION CHAR,
 aPEKZ_WLISTid CHAR,
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
if aPEKZ_WLISTid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKZ_WLIST where PEKZ_WLISTID=aPEKZ_WLISTID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKZ_WLIST where PEKZ_WLISTid=aPEKZ_WLISTID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKZ_WLIST');
    return;
  end if;
  aBRIEF:=func.PEKZ_WLIST_BRIEF_F(aPEKZ_WLISTid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKZ_WLIST_DELETE /*Весовой список ППО*/ (
 aCURSESSION CHAR,
 aPEKZ_WLISTid CHAR,
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
select count(*) into existsCnt from PEKZ_WLIST where PEKZ_WLISTID=aPEKZ_WLISTID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKZ_WLIST where PEKZ_WLISTid=aPEKZ_WLISTID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKZ_WLIST',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKZ_WLIST');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKZ_WLIST_ISLOCKED( acursession=>acursession,aROWID=>aPEKZ_WLISTid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKZ_WLIST');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_PEKZ_WLADDS is select PEKZ_WLADDS.PEKZ_WLADDSid ID from PEKZ_WLADDS where  PEKZ_WLADDS.ParentStructRowID = aPEKZ_WLISTid;
    child_PEKZ_WLADDS_rec  child_PEKZ_WLADDS%ROWTYPE;
    begin
    --open child_PEKZ_WLADDS;
      for child_PEKZ_WLADDS_rec in child_PEKZ_WLADDS loop
      PEKZ_WLADDS_DELETE (acursession,child_PEKZ_WLADDS_rec.id,aInstanceid);
      end loop;
      --close child_PEKZ_WLADDS;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKZ_WLIST',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKZ_WLISTid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKZ_WLIST is select  instanceid ID from instance where OwnerPartName ='PEKZ_WLIST' and OwnerRowID=aPEKZ_WLISTid;
row_PEKZ_WLIST  chld_PEKZ_WLIST%ROWTYPE;
begin
--open chld_PEKZ_WLIST;
for row_PEKZ_WLIST in chld_PEKZ_WLIST loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKZ_WLIST.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKZ_WLIST.id);
end loop;
--close chld_PEKZ_WLIST;
end ;
  delete from  PEKZ_WLIST 
  where  PEKZ_WLISTID = aPEKZ_WLISTID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Весовой список ППО*/
procedure PEKZ_WLIST_SAVE /*Весовой список ППО*/ (
 aCURSESSION CHAR,
 aPEKZ_WLISTid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,asequence
 NUMBER/* № *//* № */
,atheWeight
 NUMBER/* Вес *//* Вес */
,ashCode
 VARCHAR2 := null /* Штрих Код *//* Штрих Код */
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
select count(*) into existsCnt from PEKZ_WLIST where PEKZ_WLISTID=aPEKZ_WLISTID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKZ_WLIST where PEKZ_WLISTid=aPEKZ_WLISTID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKZ_WLIST',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKZ_WLIST');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKZ_WLIST_ISLOCKED( acursession=>acursession,aROWID=>aPEKZ_WLISTid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKZ_WLIST');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKZ_WLIST',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKZ_WLISTid,aLogInstanceID=>aInstanceID);
 update  PEKZ_WLIST set ChangeStamp=sysdate
,
  sequence=asequence
,
  theWeight=atheWeight
,
  shCode=ashCode
  where  PEKZ_WLISTID = aPEKZ_WLISTID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from pekz_path where pekz_pathid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKZ_WLIST',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKZ_WLIST');
      return;
    end if;
 end if;
 pekz_path_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKZ_WLIST');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKZ_WLIST',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKZ_WLISTid,aLogInstanceID=>aInstanceID);
 insert into   PEKZ_WLIST
 (  PEKZ_WLISTID 
,ParentStructRowID
,sequence

,theWeight

,shCode

 ) values ( aPEKZ_WLISTID 
,aParentStructRowID
,asequence

,atheWeight

,ashCode

 ); 
 PEKZ_WLIST_SINIT( aCURSESSION,aPEKZ_WLISTid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKZ_WLIST_PARENT /*Весовой список ППО*/ (
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
  select ParentStructRowID into aParentID  from PEKZ_WLIST where  PEKZ_WLISTid=aRowID;
  aParentTable := 'pekz_path';
 end; 


procedure PEKZ_WLIST_ISLOCKED /*Весовой список ППО*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKZ_WLIST where PEKZ_WLISTid=aRowID;
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
  PEKZ_WLIST_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKZ.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKZ_WLIST_LOCK /*Весовой список ППО*/ (
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
 PEKZ_WLIST_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKZ_WLIST_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKZ_WLIST where PEKZ_WLISTid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKZ_WLIST');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKZ_WLIST set LockUserID =auserID ,LockSessionID =null where PEKZ_WLISTid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKZ_WLIST set LockUserID =null,LockSessionID =aCURSESSION  where PEKZ_WLISTid=aRowID;
     return;
   end if;
 end ;


procedure PEKZ_WLIST_HCL /*Весовой список ППО*/ (
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
declare cursor lch_PEKZ_WLADDS is select PEKZ_WLADDS.PEKZ_WLADDSid ID from PEKZ_WLADDS where  PEKZ_WLADDS.ParentStructRowID = aRowid;
row_PEKZ_WLADDS lch_PEKZ_WLADDS%ROWTYPE;
begin  
--open lch_PEKZ_WLADDS;
for row_PEKZ_WLADDS in lch_PEKZ_WLADDS
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from PEKZ_WLADDS where PEKZ_WLADDSid=row_PEKZ_WLADDS.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKZ_WLADDS;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_PEKZ_WLADDS;
     return;
   end if; 
 end if;  
 PEKZ_WLADDS_HCL (acursession,row_PEKZ_WLADDS.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKZ_WLADDS;
   return;
 end if;
end loop;
--close lch_PEKZ_WLADDS;
end;
aIsLocked :=0;
end;


procedure PEKZ_WLIST_UNLOCK /*Весовой список ППО*/ (
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
 PEKZ_WLIST_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKZ_WLIST set LockUserID =null  where PEKZ_WLISTid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKZ_WLIST set LockSessionID =null  where PEKZ_WLISTid=aRowID;
     return;
   end if;
 end; 


procedure PEKZ_WLIST_SINIT /*Весовой список ППО*/ (
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
 select  SecurityStyleID into atmpID from PEKZ_WLIST where PEKZ_WLISTid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKZ_WLIST');
    return;
  end if;
if aSecurityStyleID is null then
 PEKZ_WLIST_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKZ_WLIST set securitystyleid =aStyleID where PEKZ_WLISTid = aRowID;
else 
 update PEKZ_WLIST set securitystyleid =aSecurityStyleID where PEKZ_WLISTid = aRowID;
end if; 
end ; 


procedure PEKZ_WLIST_propagate /*Весовой список ППО*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKZ_WLIST where PEKZ_WLISTid=aRowid;
declare cursor pch_PEKZ_WLADDS  is select PEKZ_WLADDS.PEKZ_WLADDSid ID from PEKZ_WLADDS where  PEKZ_WLADDS.ParentStructRowID = aRowid;
row_PEKZ_WLADDS  pch_PEKZ_WLADDS%ROWTYPE;
begin
--open pch_PEKZ_WLADDS;
for row_PEKZ_WLADDS in pch_PEKZ_WLADDS loop
   PEKZ_WLADDS_SINIT( acursession,row_PEKZ_WLADDS.id,assid);
   PEKZ_WLADDS_propagate( acursession,row_PEKZ_WLADDS.id);
end loop;
--close pch_PEKZ_WLADDS;
end;
end;



procedure PEKZ_WLADDS_BRIEF  (
 aCURSESSION CHAR,
 aPEKZ_WLADDSid CHAR,
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
if aPEKZ_WLADDSid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKZ_WLADDS where PEKZ_WLADDSID=aPEKZ_WLADDSID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKZ_WLADDS where PEKZ_WLADDSid=aPEKZ_WLADDSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKZ_WLADDS');
    return;
  end if;
  aBRIEF:=func.PEKZ_WLADDS_BRIEF_F(aPEKZ_WLADDSid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKZ_WLADDS_DELETE /*Надбавки для посылки*/ (
 aCURSESSION CHAR,
 aPEKZ_WLADDSid CHAR,
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
select count(*) into existsCnt from PEKZ_WLADDS where PEKZ_WLADDSID=aPEKZ_WLADDSID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKZ_WLADDS where PEKZ_WLADDSid=aPEKZ_WLADDSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKZ_WLADDS',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKZ_WLADDS');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKZ_WLADDS_ISLOCKED( acursession=>acursession,aROWID=>aPEKZ_WLADDSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKZ_WLADDS');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKZ_WLADDS',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKZ_WLADDSid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKZ_WLADDS is select  instanceid ID from instance where OwnerPartName ='PEKZ_WLADDS' and OwnerRowID=aPEKZ_WLADDSid;
row_PEKZ_WLADDS  chld_PEKZ_WLADDS%ROWTYPE;
begin
--open chld_PEKZ_WLADDS;
for row_PEKZ_WLADDS in chld_PEKZ_WLADDS loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKZ_WLADDS.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKZ_WLADDS.id);
end loop;
--close chld_PEKZ_WLADDS;
end ;
  delete from  PEKZ_WLADDS 
  where  PEKZ_WLADDSID = aPEKZ_WLADDSID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Надбавки*/
procedure PEKZ_WLADDS_SAVE /*Надбавки для посылки*/ (
 aCURSESSION CHAR,
 aPEKZ_WLADDSid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTheAdds CHAR/* Надбавка *//* Надбавка */
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
select count(*) into existsCnt from PEKZ_WLADDS where PEKZ_WLADDSID=aPEKZ_WLADDSID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKZ_WLADDS where PEKZ_WLADDSid=aPEKZ_WLADDSID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKZ_WLADDS',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKZ_WLADDS');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKZ_WLADDS_ISLOCKED( acursession=>acursession,aROWID=>aPEKZ_WLADDSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKZ_WLADDS');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKZ_WLADDS',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKZ_WLADDSid,aLogInstanceID=>aInstanceID);
 update  PEKZ_WLADDS set ChangeStamp=sysdate
,
  TheAdds=aTheAdds
  where  PEKZ_WLADDSID = aPEKZ_WLADDSID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from PEKZ_WLIST where PEKZ_WLISTid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKZ_WLADDS',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKZ_WLADDS');
      return;
    end if;
 end if;
 PEKZ_WLIST_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKZ_WLADDS');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKZ_WLADDS',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKZ_WLADDSid,aLogInstanceID=>aInstanceID);
 insert into   PEKZ_WLADDS
 (  PEKZ_WLADDSID 
,ParentStructRowID
,TheAdds

 ) values ( aPEKZ_WLADDSID 
,aParentStructRowID
,aTheAdds

 ); 
 PEKZ_WLADDS_SINIT( aCURSESSION,aPEKZ_WLADDSid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKZ_WLADDS_PARENT /*Надбавки для посылки*/ (
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
  select ParentStructRowID into aParentID  from PEKZ_WLADDS where  PEKZ_WLADDSid=aRowID;
  aParentTable := 'PEKZ_WLIST';
 end; 


procedure PEKZ_WLADDS_ISLOCKED /*Надбавки для посылки*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKZ_WLADDS where PEKZ_WLADDSid=aRowID;
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
  PEKZ_WLADDS_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKZ.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKZ_WLADDS_LOCK /*Надбавки для посылки*/ (
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
 PEKZ_WLADDS_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKZ_WLADDS_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKZ_WLADDS where PEKZ_WLADDSid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKZ_WLADDS');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKZ_WLADDS set LockUserID =auserID ,LockSessionID =null where PEKZ_WLADDSid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKZ_WLADDS set LockUserID =null,LockSessionID =aCURSESSION  where PEKZ_WLADDSid=aRowID;
     return;
   end if;
 end ;


procedure PEKZ_WLADDS_HCL /*Надбавки для посылки*/ (
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


procedure PEKZ_WLADDS_UNLOCK /*Надбавки для посылки*/ (
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
 PEKZ_WLADDS_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKZ_WLADDS set LockUserID =null  where PEKZ_WLADDSid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKZ_WLADDS set LockSessionID =null  where PEKZ_WLADDSid=aRowID;
     return;
   end if;
 end; 


procedure PEKZ_WLADDS_SINIT /*Надбавки для посылки*/ (
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
 select  SecurityStyleID into atmpID from PEKZ_WLADDS where PEKZ_WLADDSid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKZ_WLADDS');
    return;
  end if;
if aSecurityStyleID is null then
 PEKZ_WLADDS_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKZ_WLADDS set securitystyleid =aStyleID where PEKZ_WLADDSid = aRowID;
else 
 update PEKZ_WLADDS set securitystyleid =aSecurityStyleID where PEKZ_WLADDSid = aRowID;
end if; 
end ; 


procedure PEKZ_WLADDS_propagate /*Надбавки для посылки*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKZ_WLADDS where PEKZ_WLADDSid=aRowid;
end;



procedure PEKZ_DOCS_BRIEF  (
 aCURSESSION CHAR,
 aPEKZ_DOCSid CHAR,
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
if aPEKZ_DOCSid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKZ_DOCS where PEKZ_DOCSID=aPEKZ_DOCSID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKZ_DOCS where PEKZ_DOCSid=aPEKZ_DOCSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKZ_DOCS');
    return;
  end if;
  aBRIEF:=func.PEKZ_DOCS_BRIEF_F(aPEKZ_DOCSid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKZ_DOCS_DELETE /*Почтовые документы*/ (
 aCURSESSION CHAR,
 aPEKZ_DOCSid CHAR,
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
select count(*) into existsCnt from PEKZ_DOCS where PEKZ_DOCSID=aPEKZ_DOCSID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKZ_DOCS where PEKZ_DOCSid=aPEKZ_DOCSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKZ_DOCS',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKZ_DOCS');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKZ_DOCS_ISLOCKED( acursession=>acursession,aROWID=>aPEKZ_DOCSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKZ_DOCS');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKZ_DOCS',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKZ_DOCSid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKZ_DOCS is select  instanceid ID from instance where OwnerPartName ='PEKZ_DOCS' and OwnerRowID=aPEKZ_DOCSid;
row_PEKZ_DOCS  chld_PEKZ_DOCS%ROWTYPE;
begin
--open chld_PEKZ_DOCS;
for row_PEKZ_DOCS in chld_PEKZ_DOCS loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKZ_DOCS.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKZ_DOCS.id);
end loop;
--close chld_PEKZ_DOCS;
end ;
  delete from  PEKZ_DOCS 
  where  PEKZ_DOCSID = aPEKZ_DOCSID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Почтовые документы*/
procedure PEKZ_DOCS_SAVE /*Почтовые документы*/ (
 aCURSESSION CHAR,
 aPEKZ_DOCSid CHAR,
aInstanceID CHAR 
,aTheDoc CHAR/* Документ *//* Документ */
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
select count(*) into existsCnt from PEKZ_DOCS where PEKZ_DOCSID=aPEKZ_DOCSID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKZ_DOCS where PEKZ_DOCSid=aPEKZ_DOCSID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKZ_DOCS',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKZ_DOCS');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKZ_DOCS_ISLOCKED( acursession=>acursession,aROWID=>aPEKZ_DOCSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKZ_DOCS');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKZ_DOCS',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKZ_DOCSid,aLogInstanceID=>aInstanceID);
 update  PEKZ_DOCS set ChangeStamp=sysdate
,
  TheDoc=aTheDoc
  where  PEKZ_DOCSID = aPEKZ_DOCSID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKZ_DOCS',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKZ_DOCS');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKZ_DOCS');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKZ_DOCS',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKZ_DOCSid,aLogInstanceID=>aInstanceID);
 insert into   PEKZ_DOCS
 (  PEKZ_DOCSID 
,InstanceID
,TheDoc

 ) values ( aPEKZ_DOCSID 
,aInstanceID
,aTheDoc

 ); 
 PEKZ_DOCS_SINIT( aCURSESSION,aPEKZ_DOCSid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKZ_DOCS_PARENT /*Почтовые документы*/ (
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
  select  INSTANCEID into aParentID from PEKZ_DOCS where  PEKZ_DOCSid=aRowID;
 end; 


procedure PEKZ_DOCS_ISLOCKED /*Почтовые документы*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKZ_DOCS where PEKZ_DOCSid=aRowID;
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
  PEKZ_DOCS_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKZ.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKZ_DOCS_LOCK /*Почтовые документы*/ (
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
 PEKZ_DOCS_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKZ_DOCS_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKZ_DOCS where PEKZ_DOCSid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKZ_DOCS');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKZ_DOCS set LockUserID =auserID ,LockSessionID =null where PEKZ_DOCSid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKZ_DOCS set LockUserID =null,LockSessionID =aCURSESSION  where PEKZ_DOCSid=aRowID;
     return;
   end if;
 end ;


procedure PEKZ_DOCS_HCL /*Почтовые документы*/ (
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


procedure PEKZ_DOCS_UNLOCK /*Почтовые документы*/ (
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
 PEKZ_DOCS_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKZ_DOCS set LockUserID =null  where PEKZ_DOCSid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKZ_DOCS set LockSessionID =null  where PEKZ_DOCSid=aRowID;
     return;
   end if;
 end; 


procedure PEKZ_DOCS_SINIT /*Почтовые документы*/ (
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
 select  SecurityStyleID into atmpID from PEKZ_DOCS where PEKZ_DOCSid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKZ_DOCS');
    return;
  end if;
if aSecurityStyleID is null then
 PEKZ_DOCS_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKZ_DOCS set securitystyleid =aStyleID where PEKZ_DOCSid = aRowID;
else 
 update PEKZ_DOCS set securitystyleid =aSecurityStyleID where PEKZ_DOCSid = aRowID;
end if; 
end ; 


procedure PEKZ_DOCS_propagate /*Почтовые документы*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKZ_DOCS where PEKZ_DOCSid=aRowid;
end;



procedure pekz_def_BRIEF  (
 aCURSESSION CHAR,
 apekz_defid CHAR,
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
if apekz_defid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from pekz_def where pekz_defID=apekz_defID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from pekz_def where pekz_defid=apekz_defID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=pekz_def');
    return;
  end if;
  aBRIEF:=func.pekz_def_BRIEF_F(apekz_defid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure pekz_def_DELETE /*Раздел описывает  основные данные о заявке.*/ (
 aCURSESSION CHAR,
 apekz_defid CHAR,
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
select count(*) into existsCnt from pekz_def where pekz_defID=apekz_defID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from pekz_def where pekz_defid=apekz_defID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:pekz_def',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=pekz_def');
      return;
    end if;
  end if;
 --  verify lock  --
 pekz_def_ISLOCKED( acursession=>acursession,aROWID=>apekz_defid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=pekz_def');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'pekz_def',
 aVERB=>'DELETEROW',  aThe_Resource=>apekz_defid, aLogInstanceID=>aInstanceID);
declare cursor chld_pekz_def is select  instanceid ID from instance where OwnerPartName ='pekz_def' and OwnerRowID=apekz_defid;
row_pekz_def  chld_pekz_def%ROWTYPE;
begin
--open chld_pekz_def;
for row_pekz_def in chld_pekz_def loop
 Kernel.INSTANCE_OWNER (acursession,row_pekz_def.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_pekz_def.id);
end loop;
--close chld_pekz_def;
end ;
  delete from  pekz_def 
  where  pekz_defID = apekz_defID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Описание заявки*/
procedure pekz_def_SAVE /*Раздел описывает  основные данные о заявке.*/ (
 aCURSESSION CHAR,
 apekz_defid CHAR,
aInstanceID CHAR 
,aQueryDate
 DATE/* Дата запроса *//* Дата запроса */
,aFillial CHAR/* Принята в *//* Принята в */
,aPEKCode
 VARCHAR2 := null /* № заявки *//* № заявки */
,aPlatType
 NUMBER/* Платит *//* Платит */
,aTRType CHAR/* Тип доставки *//* Тип доставки */
,aPlanedDate
 DATE := null /* Дата предполагаемой отправки *//* Дата предполагаемой отправки */
,aClientFrom CHAR := null /* Отправитель *//* Отправитель */
,aClientTo CHAR := null /* Получатель *//* Получатель */
,aClientPayed CHAR := null /* Плательщик *//* Плательщик */
,aAcceptDate
 DATE := null /* Дата приема заявки *//* Дата приема заявки */
,aIsNal
 NUMBER/* Наличная оплата *//* Наличная оплата */
,aSupplier CHAR := null /* Поставщик *//* Поставщик */
,aTheComment VARCHAR2 := null /* Примечания *//* Примечания */
,aTheDogovor CHAR := null /* Договор *//* Договор */
,aAcceptTime
 DATE := null /* Время приема заявки *//* Время приема заявки */
,aLoadTime
 DATE := null /* Время приема груза на склад *//* Время приема груза на склад */
,aORG CHAR := null /* Организация *//* Организация */
,aLoadDate
 DATE := null /* Дата приема груза на склад *//* Дата приема груза на склад */
,aTRF CHAR := null /* Тариф *//* Тариф */
,aCode1C
 VARCHAR2 := null /* Код1С *//* Код1С */
,aIncludeInOrder
 NUMBER := null /* Включен в ордер *//* Включен в ордер */
,aIncludeInAct
 NUMBER := null /* Включена в акт *//* Включена в акт */
,aSummNDS
 NUMBER := null /* Сумма с НДС *//* Сумма с НДС */
,aSumm
 NUMBER := null /* Сумма без НДС *//* Сумма без НДС */
,aSummDop
 NUMBER := null /* Сумма доп. услуг без НДС *//* Сумма доп. услуг без НДС */
,aSummDopNDS
 NUMBER := null /* Сумма доп. услуг с НДС *//* Сумма доп. услуг с НДС */
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
select count(*) into existsCnt from pekz_def where pekz_defID=apekz_defID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from pekz_def where pekz_defid=apekz_defID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:pekz_def',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=pekz_def');
      return;
    end if;
  end if;
 --  verify lock  --
 pekz_def_ISLOCKED( acursession=>acursession,aROWID=>apekz_defid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=pekz_def');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'pekz_def',
 aVERB=>'EDITROW',  aThe_Resource=>apekz_defid,aLogInstanceID=>aInstanceID);
 update  pekz_def set ChangeStamp=sysdate
,
  QueryDate=aQueryDate
,
  Fillial=aFillial
,
  PEKCode=aPEKCode
,
  PlatType=aPlatType
,
  TRType=aTRType
,
  PlanedDate=aPlanedDate
,
  ClientFrom=aClientFrom
,
  ClientTo=aClientTo
,
  ClientPayed=aClientPayed
,
  AcceptDate=aAcceptDate
,
  IsNal=aIsNal
,
  Supplier=aSupplier
,
  TheComment=aTheComment
,
  TheDogovor=aTheDogovor
,
  AcceptTime=aAcceptTime
,
  LoadTime=aLoadTime
,
  ORG=aORG
,
  LoadDate=aLoadDate
,
  TRF=aTRF
,
  Code1C=aCode1C
,
  IncludeInOrder=aIncludeInOrder
,
  IncludeInAct=aIncludeInAct
,
  SummNDS=aSummNDS
,
  Summ=aSumm
,
  SummDop=aSummDop
,
  SummDopNDS=aSummDopNDS
  where  pekz_defID = apekz_defID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:pekz_def',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=pekz_def');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=pekz_def');
    return;
  end if;
select Count(*) into existsCnt from pekz_def where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <pekz_def>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'pekz_def',
 aVERB=>'CREATEROW',  aThe_Resource=>apekz_defid,aLogInstanceID=>aInstanceID);
 insert into   pekz_def
 (  pekz_defID 
,InstanceID
,QueryDate

,Fillial

,PEKCode

,PlatType

,TRType

,PlanedDate

,ClientFrom

,ClientTo

,ClientPayed

,AcceptDate

,IsNal

,Supplier

,TheComment

,TheDogovor

,AcceptTime

,LoadTime

,ORG

,LoadDate

,TRF

,Code1C

,IncludeInOrder

,IncludeInAct

,SummNDS

,Summ

,SummDop

,SummDopNDS

 ) values ( apekz_defID 
,aInstanceID
,aQueryDate

,aFillial

,aPEKCode

,aPlatType

,aTRType

,aPlanedDate

,aClientFrom

,aClientTo

,aClientPayed

,aAcceptDate

,aIsNal

,aSupplier

,aTheComment

,aTheDogovor

,aAcceptTime

,aLoadTime

,aORG

,aLoadDate

,aTRF

,aCode1C

,aIncludeInOrder

,aIncludeInAct

,aSummNDS

,aSumm

,aSummDop

,aSummDopNDS

 ); 
 pekz_def_SINIT( aCURSESSION,apekz_defid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure pekz_def_PARENT /*Раздел описывает  основные данные о заявке.*/ (
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
  select  INSTANCEID into aParentID from pekz_def where  pekz_defid=aRowID;
 end; 


procedure pekz_def_ISLOCKED /*Раздел описывает  основные данные о заявке.*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from pekz_def where pekz_defid=aRowID;
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
  pekz_def_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKZ.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure pekz_def_LOCK /*Раздел описывает  основные данные о заявке.*/ (
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
 pekz_def_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  pekz_def_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from pekz_def where pekz_defid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=pekz_def');
    return;
  end if;
   if  aLockMode =2  
   then   
    update pekz_def set LockUserID =auserID ,LockSessionID =null where pekz_defid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update pekz_def set LockUserID =null,LockSessionID =aCURSESSION  where pekz_defid=aRowID;
     return;
   end if;
 end ;


procedure pekz_def_HCL /*Раздел описывает  основные данные о заявке.*/ (
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


procedure pekz_def_UNLOCK /*Раздел описывает  основные данные о заявке.*/ (
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
 pekz_def_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update pekz_def set LockUserID =null  where pekz_defid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update pekz_def set LockSessionID =null  where pekz_defid=aRowID;
     return;
   end if;
 end; 


procedure pekz_def_SINIT /*Раздел описывает  основные данные о заявке.*/ (
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
 select  SecurityStyleID into atmpID from pekz_def where pekz_defid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =pekz_def');
    return;
  end if;
if aSecurityStyleID is null then
 pekz_def_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update pekz_def set securitystyleid =aStyleID where pekz_defid = aRowID;
else 
 update pekz_def set securitystyleid =aSecurityStyleID where pekz_defid = aRowID;
end if; 
end ; 


procedure pekz_def_propagate /*Раздел описывает  основные данные о заявке.*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from pekz_def where pekz_defid=aRowid;
end;



procedure pekz_dop_BRIEF  (
 aCURSESSION CHAR,
 apekz_dopid CHAR,
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
if apekz_dopid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from pekz_dop where pekz_dopID=apekz_dopID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from pekz_dop where pekz_dopid=apekz_dopID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=pekz_dop');
    return;
  end if;
  aBRIEF:=func.pekz_dop_BRIEF_F(apekz_dopid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure pekz_dop_DELETE /*Дополнительные услуги*/ (
 aCURSESSION CHAR,
 apekz_dopid CHAR,
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
select count(*) into existsCnt from pekz_dop where pekz_dopID=apekz_dopID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from pekz_dop where pekz_dopid=apekz_dopID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:pekz_dop',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=pekz_dop');
      return;
    end if;
  end if;
 --  verify lock  --
 pekz_dop_ISLOCKED( acursession=>acursession,aROWID=>apekz_dopid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=pekz_dop');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'pekz_dop',
 aVERB=>'DELETEROW',  aThe_Resource=>apekz_dopid, aLogInstanceID=>aInstanceID);
declare cursor chld_pekz_dop is select  instanceid ID from instance where OwnerPartName ='pekz_dop' and OwnerRowID=apekz_dopid;
row_pekz_dop  chld_pekz_dop%ROWTYPE;
begin
--open chld_pekz_dop;
for row_pekz_dop in chld_pekz_dop loop
 Kernel.INSTANCE_OWNER (acursession,row_pekz_dop.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_pekz_dop.id);
end loop;
--close chld_pekz_dop;
end ;
  delete from  pekz_dop 
  where  pekz_dopID = apekz_dopID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Дополнительные услуги*/
procedure pekz_dop_SAVE /*Дополнительные услуги*/ (
 aCURSESSION CHAR,
 apekz_dopid CHAR,
aInstanceID CHAR 
,asequence
 NUMBER/* № *//* № */
,aSRV CHAR/* Услуга *//* Услуга */
,aQuantity
 NUMBER/* Количество *//* Количество */
,aEDIZM CHAR := null /* Ед. измерения *//* Ед. измерения */
,aPathFilial CHAR := null /* Филиал *//* Филиал */
,aDopSupplier CHAR := null /* Поставщик *//* Поставщик */
,aTheCurrency CHAR := null /* Валюта *//* Валюта */
,aTRF
 NUMBER := null /* Тариф *//* Тариф */
,aSumm
 NUMBER := null /* Сумма без НДС *//* Сумма без НДС */
,aSummNDS
 NUMBER := null /* Сумма с НДС *//* Сумма с НДС */
,aSupTRF
 NUMBER := null /* Тариф поставщика *//* Тариф поставщика */
,aSupSumm
 NUMBER := null /* Сумма поставщику без НДС *//* Сумма поставщику без НДС */
,aSupSummNDS
 NUMBER := null /* Сумма поставщику с НДС *//* Сумма поставщику с НДС */
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
select count(*) into existsCnt from pekz_dop where pekz_dopID=apekz_dopID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from pekz_dop where pekz_dopid=apekz_dopID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:pekz_dop',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=pekz_dop');
      return;
    end if;
  end if;
 --  verify lock  --
 pekz_dop_ISLOCKED( acursession=>acursession,aROWID=>apekz_dopid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=pekz_dop');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'pekz_dop',
 aVERB=>'EDITROW',  aThe_Resource=>apekz_dopid,aLogInstanceID=>aInstanceID);
 update  pekz_dop set ChangeStamp=sysdate
,
  sequence=asequence
,
  SRV=aSRV
,
  Quantity=aQuantity
,
  EDIZM=aEDIZM
,
  PathFilial=aPathFilial
,
  DopSupplier=aDopSupplier
,
  TheCurrency=aTheCurrency
,
  TRF=aTRF
,
  Summ=aSumm
,
  SummNDS=aSummNDS
,
  SupTRF=aSupTRF
,
  SupSumm=aSupSumm
,
  SupSummNDS=aSupSummNDS
  where  pekz_dopID = apekz_dopID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:pekz_dop',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=pekz_dop');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=pekz_dop');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'pekz_dop',
 aVERB=>'CREATEROW',  aThe_Resource=>apekz_dopid,aLogInstanceID=>aInstanceID);
 insert into   pekz_dop
 (  pekz_dopID 
,InstanceID
,sequence

,SRV

,Quantity

,EDIZM

,PathFilial

,DopSupplier

,TheCurrency

,TRF

,Summ

,SummNDS

,SupTRF

,SupSumm

,SupSummNDS

 ) values ( apekz_dopID 
,aInstanceID
,asequence

,aSRV

,aQuantity

,aEDIZM

,aPathFilial

,aDopSupplier

,aTheCurrency

,aTRF

,aSumm

,aSummNDS

,aSupTRF

,aSupSumm

,aSupSummNDS

 ); 
 pekz_dop_SINIT( aCURSESSION,apekz_dopid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure pekz_dop_PARENT /*Дополнительные услуги*/ (
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
  select  INSTANCEID into aParentID from pekz_dop where  pekz_dopid=aRowID;
 end; 


procedure pekz_dop_ISLOCKED /*Дополнительные услуги*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from pekz_dop where pekz_dopid=aRowID;
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
  pekz_dop_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKZ.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure pekz_dop_LOCK /*Дополнительные услуги*/ (
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
 pekz_dop_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  pekz_dop_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from pekz_dop where pekz_dopid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=pekz_dop');
    return;
  end if;
   if  aLockMode =2  
   then   
    update pekz_dop set LockUserID =auserID ,LockSessionID =null where pekz_dopid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update pekz_dop set LockUserID =null,LockSessionID =aCURSESSION  where pekz_dopid=aRowID;
     return;
   end if;
 end ;


procedure pekz_dop_HCL /*Дополнительные услуги*/ (
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


procedure pekz_dop_UNLOCK /*Дополнительные услуги*/ (
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
 pekz_dop_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update pekz_dop set LockUserID =null  where pekz_dopid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update pekz_dop set LockSessionID =null  where pekz_dopid=aRowID;
     return;
   end if;
 end; 


procedure pekz_dop_SINIT /*Дополнительные услуги*/ (
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
 select  SecurityStyleID into atmpID from pekz_dop where pekz_dopid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =pekz_dop');
    return;
  end if;
if aSecurityStyleID is null then
 pekz_dop_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update pekz_dop set securitystyleid =aStyleID where pekz_dopid = aRowID;
else 
 update pekz_dop set securitystyleid =aSecurityStyleID where pekz_dopid = aRowID;
end if; 
end ; 


procedure pekz_dop_propagate /*Дополнительные услуги*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from pekz_dop where pekz_dopid=aRowid;
end;


end PEKZ;

/



