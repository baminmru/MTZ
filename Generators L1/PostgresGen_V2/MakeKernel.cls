VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "MakeKernel"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim m As MTZMetaModel.Application
Dim o As MTZGenerator.Response
Dim tid As String
Dim parent As Generator

Public Sub Init(ap As Generator, am As MTZMetaModel.Application, ao As MTZGenerator.Response, ByVal atid As String)
  Set parent = ap
  Set m = am
  Set o = ao
  tid = atid
End Sub

Private Sub CreateKernelPackage()
  o.Module = "--Procedures.Kernel.Header"
  o.Block = "--body"
  o.OutNL " create or replace package Kernel as"
  
  o.Module = "--Procedures.Kernel.Body"
  o.Block = "--body"
  o.OutNL " create or replace package body Kernel as"
 
  
End Sub

Private Sub CloseKernelPackage()
  o.Module = "--Procedures.Kernel.Header"
  o.Block = "--body"
  o.OutNL " end Kernel;"
  o.OutNL ";"
  
  o.Module = "--Procedures.Kernel.Body"
  o.Block = "--body"
  o.OutNL " end Kernel;"
  o.OutNL ";"
End Sub




Private Sub KernelProcsHeader()
  
   Dim SQL As Writer
  Set SQL = New Writer
  
  DoEvents
  On Error GoTo bye
  
    
  SQL.putBuf "procedure INSTANCE_OWNER   ("
  SQL.putBuf "    acursession CHAR ,ainstanceid CHAR,"
  SQL.putBuf " aOwnerPartName varchar, aOwnerRowID CHAR); "
  
    
  SQL.putBuf "procedure SYSOPTIONS_SAVE    ("
  SQL.putBuf " aSysOptionsid CHAR,"
  SQL.putBuf " aName varchar,"
  SQL.putBuf " aValue varchar ,"
  SQL.putBuf " aOptionType varchar);"
  
  
  SQL.putBuf "procedure INSTANCE_SAVE      ("
  SQL.putBuf "aCURSESSION CHAR,"
  SQL.putBuf "aInstanceID CHAR,"
  SQL.putBuf "aObjType varchar,"
  SQL.putBuf "aName varchar"
  SQL.putBuf ");"
  
  SQL.putBuf "  procedure INSTANCE_DELETE    ("
  SQL.putBuf "aCURSESSION CHAR,"
  SQL.putBuf "aInstanceID Char"
  SQL.putBuf ");"
  SQL.putBuf "  procedure INSTANCE_HCL   ("
  SQL.putBuf "aCURSESSION CHAR,"
  SQL.putBuf "aRowID CHAR,"
  SQL.putBuf "aIsLocked out numeric"
  SQL.putBuf ");"
   
  SQL.putBuf "  procedure INSTANCE_PROPAGATE   ("
  SQL.putBuf "aCURSESSION CHAR,"
  SQL.putBuf "aRowID Char"
  SQL.putBuf ");"
  
  SQL.putBuf "  procedure INSTANCE_ISLOCKED   ("
  SQL.putBuf " aCURSESSION CHAR,"
  SQL.putBuf " aRowID CHAR ,"
  SQL.putBuf " aIsLocked out integer"
  SQL.putBuf ");"

  SQL.putBuf "  procedure INSTANCE_SINIT    ("
  SQL.putBuf "aCURSESSION CHAR,"
  SQL.putBuf "aRowID CHAR ,"
  SQL.putBuf " aSecurityStyleID Char"
  SQL.putBuf ");"
  SQL.putBuf "  procedure INSTANCE_LOCK     ("
  SQL.putBuf " aCURSESSION CHAR,"
  SQL.putBuf " aRowID CHAR ,"
  SQL.putBuf " aLockMode integer"
  SQL.putBuf ") ;"
  SQL.putBuf "  procedure INSTANCE_UNLOCK ("
  SQL.putBuf " aCURSESSION CHAR,"
  SQL.putBuf " aROWID Char"
  SQL.putBuf ");"
  
          
  SQL.putBuf "    procedure INSTANCE_BRIEF    ("
  SQL.putBuf " aCURSESSION CHAR,"
  SQL.putBuf " ainstanceid CHAR,"
  SQL.putBuf " aBRIEF out varchar"
  SQL.putBuf ") ;"
  SQL.putBuf "    procedure QR_AND_QR  ( aid1 CHAR, aid2"
  SQL.putBuf "    CHAR,aidout CHAR,acnt out integer );"
    
  SQL.putBuf "    procedure QR_OR_QR  ( aid1 CHAR, aid2 "
  SQL.putBuf "    CHAR,aidout CHAR,acnt out integer);"

  SQL.putBuf "  procedure ROWPARENTS"
  SQL.putBuf "(aQueryID   CHAR"
  SQL.putBuf ",aRowID CHAR/* Row */"
  SQL.putBuf ",aTable varchar /* Part Table Name */"
  SQL.putBuf ",aCURSESSION CHAR/* the_session */"
  SQL.putBuf ");"
    
  SQL.putBuf "    procedure INSTANCE_STATUS    ("
  SQL.putBuf "  acursession CHAR,"
  SQL.putBuf "  ainstanceid CHAR,"
  SQL.putBuf "  astatusid CHAR);"
    
  o.Module = "--Procedures.Kernel.Header"
  o.Block = "--body"
  o.OutNL SQL.getBuf
  
  Set SQL = Nothing
  
  DebugOutput "POSTGRESGEN.KERNELPROC:done"
  Exit Sub
bye:
 
  DebugOutput "POSTGRESGEN.KERNELPROC:" & Err.Description
  'Resume
  'Stop
  Set SQL = Nothing
End Sub

Private Sub PreInstall()
  Dim SQL As Writer
  Set SQL = New Writer
  
  DoEvents
  On Error GoTo bye

  
  SQL.putBuf "CREATE SEQUENCE GUIDA INCREMENT BY 1 START WITH 1"
  SQL.putBuf "  MAXVALUE 4000000 MINVALUE 1 NOCYCLE"
  SQL.putBuf "  CACHE 20 NOORDER"
  SQL.putBuf ";"
  
  SQL.putBuf "CREATE SEQUENCE GUIDB INCREMENT BY 1 START WITH 1"
  SQL.putBuf "  MAXVALUE 65534 MINVALUE 1 CYCLE"
  SQL.putBuf "  CACHE 20 NOORDER"
  SQL.putBuf ";"
  
  SQL.putBuf "CREATE SEQUENCE GUIDC INCREMENT BY 1 START WITH 1"
  SQL.putBuf "  MAXVALUE 65534 MINVALUE 1 CYCLE"
  SQL.putBuf "  CACHE 20 NOORDER"
  SQL.putBuf ";"
  
  SQL.putBuf "CREATE SEQUENCE GUIDD INCREMENT BY 1 START WITH 1"
  SQL.putBuf "  MAXVALUE 65534 MINVALUE 1 CYCLE"
  SQL.putBuf "  CACHE 20 NOORDER"
  SQL.putBuf ";"
  
  SQL.putBuf "CREATE SEQUENCE GUIDE INCREMENT BY 1 START WITH 1"
  SQL.putBuf "  MAXVALUE 2.00000001E14 MINVALUE 1 CYCLE"
  SQL.putBuf "  CACHE 20 NOORDER"
  SQL.putBuf ";"
  
  SQL.putBuf "  CREATE OR REPLACE  FUNCTION NEWID return char"
  SQL.putBuf "  as"
  SQL.putBuf "  ga numeric;"
  SQL.putBuf "  gb numeric;"
  SQL.putBuf "  gc numeric;"
  SQL.putBuf "  gd numeric;"
  SQL.putBuf "  ge numeric;"
  SQL.putBuf "  res char(38);"
  SQL.putBuf "  begin"
  SQL.putBuf "  select guide.nextval into ge from dual;"
  SQL.putBuf "  select guidd.nextval into gd from dual;"
  SQL.putBuf "  select guidc.nextval into gc from dual;"
  SQL.putBuf "  select guidb.nextval into gb from dual;"
  SQL.putBuf "  select guida.nextval into ga from dual;"
  SQL.putBuf "  res:='{' || replace( to_char(ga,'XXXXXXX'),' ','0') || '-' ||"
  SQL.putBuf "   replace( to_char(gb,'XXX'),' ','0') || '-' ||"
  SQL.putBuf "   replace( to_char(gc,'XXX'),' ','0') || '-' ||"
  SQL.putBuf "   replace( to_char(gd,'XXX'),' ','0') || '-' ||"
  SQL.putBuf "   replace( to_char(ge,'XXXXXXXXXXX'),' ','0') ||'}';"
  SQL.putBuf "  return res;"
  SQL.putBuf "  end;"
  SQL.putBuf ";"
  
  
  
  
  o.Module = "--PreInstall"
  o.Block = "--body"
  o.OutNL SQL.getBuf
  
  Set SQL = Nothing

bye:
End Sub


Private Sub KernelProcs()
  
  Dim SQL As Writer
  Set SQL = New Writer
  
  DoEvents
  On Error GoTo bye
    
    
  
  SQL.putBuf "procedure INSTANCE_OWNER   ("
  SQL.putBuf "    acursession CHAR ,ainstanceid CHAR,"
  SQL.putBuf " aOwnerPartName varchar, aOwnerRowID CHAR) as"
  SQL.putBuf " existsCnt integer;"
  SQL.putBuf "begin"
  SQL.putBuf "select count(*)into existscnt from instance"
  SQL.putBuf "where instanceid=ainstanceid;"
  SQL.putBuf "If existsCnt > 0 Then"
  SQL.putBuf "  if aOwnerPartName is null or aownerRowID is null"
  SQL.putBuf "  then"
  SQL.putBuf "     update instance set OwnerPartName=null, OwnerRowid = null where instanceid=ainstanceid ;"
  SQL.putBuf "  Else"
  SQL.putBuf "     update instance set OwnerPartName=aOwnerPartName, OwnerRowid = aOwnerRowID where instanceid=ainstanceid ;"
  SQL.putBuf "  End if;"
  SQL.putBuf "End if;"
  SQL.putBuf "end;"
  
  
    
  SQL.putBuf "procedure SYSOPTIONS_SAVE    ("
  SQL.putBuf "   aSysOptionsid CHAR,"
  SQL.putBuf "aName varchar,"
  SQL.putBuf "aValue varchar ,"
  SQL.putBuf "aOptionType varchar) as"
  SQL.putBuf "existsCnt numeric;"
  SQL.putBuf "begin"
  SQL.putBuf " select count(*) into existsCnt from sysoptions where sysoptionsid=asysoptionsid;"
  SQL.putBuf " If existsCnt > 0 Then"
  SQL.putBuf "  update sysoptions set Name=aName, theValue=aValue, OptionType=aOptionType where sysoptionsid=asysoptionsid ;"
  SQL.putBuf " Else"
  SQL.putBuf "  insert into sysoptions (sysoptionsid, Name, theValue, OptionType)values(asysoptionsid,aName,aValue,aOptionType) ;"
  SQL.putBuf " End if;"
  SQL.putBuf "end;"
  
  
  SQL.putBuf "procedure INSTANCE_SAVE      ("
  SQL.putBuf "aCURSESSION CHAR,"
  SQL.putBuf "aInstanceID CHAR,"
  SQL.putBuf "aObjType varchar,"
  SQL.putBuf "aName varchar"
  SQL.putBuf ") as"
  SQL.putBuf " atmpStr varchar(255) ;"
  SQL.putBuf " aSSID CHAR(38) ;"
  SQL.putBuf " atmpID CHAR(38) ;"
  SQL.putBuf " aSysLogID CHAR(38) ;"
  SQL.putBuf " aaccess numeric ;"
  SQL.putBuf " aSysInstID CHAR(38) ;"
  SQL.putBuf " aStatusID CHAR(38) ;"
  SQL.putBuf " existsCnt numeric;"
  SQL.putBuf " theObjType varchar(255);"
  SQL.putBuf "begin"
  SQL.putBuf " select  Instanceid into aSysInstID from instance where objtype='MTZSYSTEM';"
  SQL.putBuf " select  count(*) into existsCnt  from instance where instanceid=ainstanceid;"
  SQL.putBuf " If existsCnt > 0 Then"
  SQL.putBuf "   select  SecurityStyleID into atmpID from INSTANCE where INSTANCEid=aINSTANCEid ;"
  SQL.putBuf "   CheckVerbRight (acursession=>acursession,athe_resource=>atmpID,averb=>'EDIT',aaccess=>aaccess  );"
  SQL.putBuf "   If aaccess = 0 Then"
  SQL.putBuf "     raise_application_error(-20000,'Нет прав на изменение объекта.') ;"
  SQL.putBuf "     return ;"
  SQL.putBuf "   end if;"
  SQL.putBuf "   Kernel.instance_ISLOCKED (acursession=>acursession,aROWID=>ainstanceid,aIsLocked=>aaccess  );"
  SQL.putBuf "   If aaccess > 2 Then"
  SQL.putBuf "     raise_application_error(-20000,'Объект заблокирован другим пользователем.') ;"
  SQL.putBuf "     return;"
  SQL.putBuf "   end if;"
  SQL.putBuf "   select objtype into TheObjType from instance  where  instanceid=ainstanceid ;"
  SQL.putBuf "   update instance set name = aname where  instanceid=ainstanceid;"
  SQL.putBuf "   select newid() into aSysLogID from sys.DUAL ;"
  SQL.putBuf "   MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid,"
  SQL.putBuf "   aLogStructID => TheOBJTYPE ,"
  SQL.putBuf "   aVERB=>'EDIT',  aThe_Resource=>aInstanceID, aLogInstanceID=>aInstanceID );"
  SQL.putBuf " Else"
  SQL.putBuf "    select count(*) into existsCnt from typelist where name = aobjtype;"
  SQL.putBuf "    If existsCnt > 0 Then"
  SQL.putBuf "      select SecurityStyleid,RegisterProc into aSSID,atmpstr  from typelist where name = aobjtype;"
  SQL.putBuf "      CheckVerbRight (acursession=>acursession,aThe_Resource=>aSSID,averb=>'CREATE',aaccess=>aaccess  );"
  SQL.putBuf "      If aaccess = 0 Then"
  SQL.putBuf "         raise_application_error(-20000,'Нет прав на создание объекта.') ;"
  SQL.putBuf "         return;"
  SQL.putBuf "      end if;"
 
  SQL.putBuf "    end if;"
  SQL.putBuf "   begin"
  SQL.putBuf "   select objstatusid into astatusid from objstatus join objecttype on"
  SQL.putBuf "         objecttype.objecttypeid=objstatus.parentstructrowid and objecttype.name=aobjtype and isStartup<>0;"
  SQL.putBuf "   exception when others then"
  SQL.putBuf "      astatusid:=null ;"
  SQL.putBuf "    end;"
  SQL.putBuf "   If astatusid Is Null Then"
  SQL.putBuf "     insert into instance(instanceid,name,objtype,SecurityStyleID) values(ainstanceid,aname,aobjtype,aSSID)         ;"
  SQL.putBuf "   Else"
  SQL.putBuf "     insert into instance(instanceid,name,objtype,SecurityStyleID,STATUS) values(ainstanceid,aname,aobjtype,aSSID,aSTATUSID) ;"
  SQL.putBuf "   end if;"
  SQL.putBuf "   If Not atmpstr Is Null Then"
  SQL.putBuf "      execute immediate atmpstr using  acursession, ainstanceid;"
  SQL.putBuf "   end if;"
  SQL.putBuf "   select newid() into aSysLogid from sys.dual ;"
  SQL.putBuf "   "
  SQL.putBuf "   MTZSystem.SysLog_SAVE ("
  SQL.putBuf "     aCURSESSION=>acursession ,aTheSession=>acursession,"
  SQL.putBuf "     aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => aOBJTYPE ,"
  SQL.putBuf "     aVERB=>'CREATE',  aThe_Resource=>aInstanceID , aLogInstanceID=>aInstanceID);"
  SQL.putBuf " End  if;"
  SQL.putBuf "End;"
  
  
  
  SQL.putBuf "  procedure INSTANCE_DELETE    ("
  SQL.putBuf "aCURSESSION CHAR,"
  SQL.putBuf "aInstanceID Char"
  SQL.putBuf ") as"
  SQL.putBuf " atmpStr varchar(255) ;"
  SQL.putBuf "  aStr varchar(4000) ;"
  SQL.putBuf "  aObjType varchar(255) ;"
  SQL.putBuf " aSysInstID CHAR(38) ;"
  SQL.putBuf "    atmpID CHAR(38) ;"
  SQL.putBuf "   aaccess integer;"
  SQL.putBuf "   aOwnerPartName varchar(255) ;"
  SQL.putBuf "   aOwnerRowID CHAR(38) ;"
  SQL.putBuf "   aSysLogid CHAR(38) ;"
  SQL.putBuf "    existsCnt integer;"
  SQL.putBuf "begin"
  SQL.putBuf "  select Instanceid into aSysInstID from instance where objtype='MTZSYSTEM' ;"
  SQL.putBuf "  select count(*) into existsCnt from instance where instanceid=ainstanceid;"
  SQL.putBuf "  If existsCnt > 0 Then"
  SQL.putBuf "   select  SecurityStyleID, OwnerPartName,OWnerRowID"
  SQL.putBuf "        Into atmpid, aOwnerpartname, aownerrowid"
  SQL.putBuf "        from INSTANCE where INSTANCEid=aINSTANCEid ;"
  SQL.putBuf "   CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETE',aaccess=>aaccess);"
  SQL.putBuf "   If aaccess = 0 Then"
  SQL.putBuf "       raise_application_error(-20000,'Нет прав на удаление.');"
  SQL.putBuf "       Return ;"
  SQL.putBuf "   End if;"
  SQL.putBuf "   If aOwnerpartname Is Null Or aownerrowid Is Null Then"
  SQL.putBuf "        select  objtype into aobjtype from instance where instanceid=ainstanceid;"
  SQL.putBuf "        select 'begin ' || aobjtype || '.' || DeleteProc ||'(:1,:2); end;' into atmpstr from typelist where name = aobjtype;"
  SQL.putBuf "        If Not atmpstr Is Null Then"
  SQL.putBuf "            EXECUTE IMMEDIATE atmpstr USING acursession,ainstanceid;"
  SQL.putBuf "        end if;"
  SQL.putBuf "        delete from instance where instanceid=ainstanceid ;"
  SQL.putBuf "        select newid() into aSysLogID from SYS.DUAL;"
  SQL.putBuf "        MTZSystem.SysLog_SAVE( aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => aobjtype ,"
  SQL.putBuf "        aVERB=>'DELETE',  aThe_Resource=>aInstanceID, aLogInstanceID=>aInstanceID);"
  SQL.putBuf "        Else"
  SQL.putBuf "        -- Owner exists"
  SQL.putBuf "         astr :='select '|| aownerpartname || 'id  from ' || aownerpartname || ' where ' || aownerpartname ||'id=:1';"
  SQL.putBuf "         execute immediate  astr into atmpid using aownerrowid;"
  SQL.putBuf "         If atmpid = aownerrowid Then"
  SQL.putBuf "           raise_application_error(-20000,'Этот документ принадлежит другому документу и не может быть удален отдельно.');"
  SQL.putBuf "           return;"
  SQL.putBuf "         End if;"
  SQL.putBuf "         select  objtype into aObjType from instance where instanceid=ainstanceid;"
  SQL.putBuf "         select 'begin ' || aobjtype || '.' || DeleteProc ||'(:1,:2); end;' into atmpstr from typelist where name = aobjtype ;"
  SQL.putBuf "         If Not atmpstr Is Null Then"
  SQL.putBuf "           execute immediate atmpstr using acursession, ainstanceid ;"
  SQL.putBuf "           delete from instance where instanceid=ainstanceid ;"
  SQL.putBuf "         select newid() into aSysLogID from SYS.DUAL;"
  
  SQL.putBuf "         MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession,"
  SQL.putBuf "                      aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => aobjtype ,"
  SQL.putBuf "                      aVERB=>'DELETE',  aThe_Resource=>aInstanceID, aLogInstanceID=>aInstanceID );"
  SQL.putBuf "        End if;"
  SQL.putBuf "     End if;"
  SQL.putBuf "End if;"
  SQL.putBuf "end;"
  
  

  SQL.putBuf "  procedure INSTANCE_HCL   ("
  SQL.putBuf "aCURSESSION CHAR,"
  SQL.putBuf "aRowID CHAR,"
  SQL.putBuf "aIsLocked out numeric"
  SQL.putBuf ") as"
  SQL.putBuf "atmpStr varchar(255) ;"
  SQL.putBuf "aObjType varchar(255) ;"
  SQL.putBuf "existscnt integer;"
  SQL.putBuf "begin"
  SQL.putBuf "select count(*) into existsCnt from instance where instanceid=arowid ;"
  SQL.putBuf "if existscnt=1"
  SQL.putBuf "    then"
  SQL.putBuf "      select objtype into aobjtype  from instance where instanceid=arowid ;"
  SQL.putBuf "      select 'begin ' || aobjtype || '.' || HCLProc || '(:1,:2,:3); end;' into atmpstr from typelist where name = aobjtype;"
  SQL.putBuf "      If Not atmpstr Is Null Then"
  SQL.putBuf "        execute immediate atmpstr using acursession, arowid,out aIsLocked ;"
  SQL.putBuf "      End if;"
  SQL.putBuf "end if;"
  SQL.putBuf "End;"
  
   
  SQL.putBuf "  procedure INSTANCE_PROPAGATE   ("
  SQL.putBuf "aCURSESSION CHAR,"
  SQL.putBuf "aRowID Char"
  SQL.putBuf ") as"
  
  SQL.putBuf "atmpStr varchar(255) ;"
  SQL.putBuf "aObjType varchar(255);"
  SQL.putBuf "existsCnt integer;"
  SQL.putBuf "begin"
  
  SQL.putBuf "select count(*) into existsCnt from instance where instanceid=arowid ;"
  SQL.putBuf "if existsCnt=1"
  SQL.putBuf "    then"
  SQL.putBuf "      select  objtype into aobjtype from instance where instanceid=arowid ;"
  SQL.putBuf "      select  'begin ' || aobjtype || '.' || propagateProc || '(:1,:2); end;' into atmpstr from typelist where name = aobjtype;"
  SQL.putBuf "      If Not atmpstr Is Null Then"
  SQL.putBuf "        execute immediate atmpstr using  acursession, arowid ;"
  SQL.putBuf "    End if;"
  SQL.putBuf "End if;"
  SQL.putBuf "End;"
  
  
  
  
  SQL.putBuf "  procedure INSTANCE_ISLOCKED   ("
  SQL.putBuf " aCURSESSION CHAR,"
  SQL.putBuf " aRowID CHAR ,"
  SQL.putBuf " aIsLocked out integer"
  SQL.putBuf ") as"
  SQL.putBuf " aUserID CHAR(38) ;"
  SQL.putBuf " aLockUserID CHAR(38) ;"
  SQL.putBuf " aLockSessionID CHAR(38) ;"
  SQL.putBuf " existsCnt integer;"
  SQL.putBuf " begin"
  
  SQL.putBuf " aisLocked := 0 ;"
  SQL.putBuf " -- checking the_session  --"
  SQL.putBuf " select count(*) into existsCnt from  the_session where the_sessionid=acursession and closed=0;"
  SQL.putBuf " If existsCnt = 0 Then"
  SQL.putBuf "   raise_APPLICATION_Error(-20000,'Сессия уже завершена');"
  SQL.putBuf "   Return ;"
  SQL.putBuf " End if;"
  SQL.putBuf " select  usersid into auserID from  the_session where the_sessionid=acursession ;"
  SQL.putBuf " select LockUserID, LockSessionID"
  SQL.putBuf " Into aLockUserID, aLockSessionID"
  SQL.putBuf " from INSTANCE where INSTANCEid=aRowID ;"
  SQL.putBuf " If Not aLockUserID Is Null Then"
  SQL.putBuf "   If aLockUserID <> auserID Then"
  SQL.putBuf "     aisLocked := 4; /* CheckOut by another user */"
  SQL.putBuf "     Return ;"
  SQL.putBuf "   Else"
  SQL.putBuf "     aisLocked := 2; /* CheckOut by caller */"
  SQL.putBuf "     Return;"
  SQL.putBuf "   end if;"
  SQL.putBuf " End if;"
  SQL.putBuf " If Not aLockSessionID Is Null Then"
  SQL.putBuf "   If aLockSessionID <> aCURSESSION Then"
  
  SQL.putBuf "     aisLocked := 3 ;/* Lockes by another user */"
  SQL.putBuf "     Return ;"
  SQL.putBuf "   Else"
  SQL.putBuf "     aisLocked := 1; /* Locked by caller */"
  SQL.putBuf "     Return ;"
  SQL.putBuf "   end if;"
  SQL.putBuf " End if;"
  SQL.putBuf " aisLocked := 0 ;"
  SQL.putBuf " End;"
  
    

  SQL.putBuf "  procedure INSTANCE_SINIT    ("
  SQL.putBuf "aCURSESSION CHAR,"
  SQL.putBuf "aRowID CHAR ,"
  SQL.putBuf " aSecurityStyleID Char"
  SQL.putBuf ")as"
  SQL.putBuf "aParentTable varchar(255) ;"
  SQL.putBuf " aStyleID CHAR(38) ;"
  SQL.putBuf " atmpID CHAR(38) ;"
  SQL.putBuf " aaccess integer ;"
  SQL.putBuf " begin"
  SQL.putBuf "  select  SecurityStyleID into atmpID from INSTANCE where INSTANCEid=aROWID;"
  SQL.putBuf " CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess);"
  SQL.putBuf " if aaccess=0"
  SQL.putBuf "  then"
  SQL.putBuf "    raise_application_error(-20000,'Нет прав на управление защитой.');"
  SQL.putBuf "    return ;"
  SQL.putBuf "  end if;"
  SQL.putBuf "  If aSecurityStyleID Is Null Then"
  SQL.putBuf "    select  objtype into aParentTable from instance where instanceid=aRowID ;"
  SQL.putBuf "    select SecurityStyleID  into aStyleID from typelist where name =aParentTable ;"
  SQL.putBuf "    update Instance set securitystyleid =aStyleID where Instanceid = aRowID;"
  SQL.putBuf "  Else"
  SQL.putBuf "    update Instance set securitystyleid =aSecurityStyleID where Instanceid = aRowID ;"
  SQL.putBuf "  End if;"
  SQL.putBuf "End;"
    
  SQL.putBuf "  procedure INSTANCE_LOCK     ("
  SQL.putBuf " aCURSESSION CHAR,"
  SQL.putBuf " aRowID CHAR ,"
  SQL.putBuf " aLockMode integer"
  SQL.putBuf ") as"
  
  SQL.putBuf "aUserID CHAR(38);"
  SQL.putBuf " atmpID CHAR(38);"
  SQL.putBuf " aaccess integer ;"
  SQL.putBuf " aIsLocked integer ;"
  SQL.putBuf " existsCnt integer;"
  SQL.putBuf "  begin"
  SQL.putBuf " select count(*) into existsCnt from  the_session where the_sessionid=acursession and closed=0;"
  SQL.putBuf " -- checking the_session  --"
  SQL.putBuf "If existsCnt = 0 Then"
  SQL.putBuf "    raise_application_error(-20000,'Сессия уже завершена.') ;"
  SQL.putBuf "    Return ;"
  SQL.putBuf "End if;"
  SQL.putBuf " select  usersid into auserID from  the_session where the_sessionid=acursession;"
  SQL.putBuf " Kernel.Instance_ISLOCKED (aCURSESSION,aROWID,aISLocked);"
  SQL.putBuf " if aIsLocked >=3"
  SQL.putBuf "  then"
  SQL.putBuf "    raise_application_error(-20000,'Объект заблокирован другим пользователем');"
  SQL.putBuf "    Return ;"
  SQL.putBuf "  End if;"
  SQL.putBuf " if aIsLocked =0"
  SQL.putBuf " then"
  SQL.putBuf "  Kernel.Instance_HCL( acursession,aRowID,aisLocked);"
  SQL.putBuf "  if aIsLocked >=3"
  SQL.putBuf "  then"
  SQL.putBuf "     raise_application_error(-20000,'У данного объекта имеются дочерние строки, которые заблокированы другим пользователем');"
  SQL.putBuf "     Return ;"
  SQL.putBuf "  End if;"
  SQL.putBuf " End if;"
  SQL.putBuf " select  SecurityStyleID into atmpid from INSTANCE where INSTANCEid=aROWID ;"
  SQL.putBuf " CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKINSTANCE',aaccess=>aaccess);"
  SQL.putBuf " if aaccess=0"
  SQL.putBuf "  then"
  SQL.putBuf "    raise_application_error(-20000,'Нет прав на блокировку объекта.');"
  
  SQL.putBuf "    return ;"
  SQL.putBuf "  end if;"
  SQL.putBuf "   if  aLockMode =2"
  SQL.putBuf "   then"
  SQL.putBuf "    update INSTANCE  set LockUserID =auserID ,LockSessionID =null where Instanceid=aRowID ;"
  SQL.putBuf "     Return ;"
  SQL.putBuf "   End if ;"
  SQL.putBuf "   if  aLockMode =1"
  SQL.putBuf "   then"
  SQL.putBuf "    update INSTANCE  set LockUserID =null,LockSessionID =aCURSESSION  where Instanceid=aRowID ;"
  SQL.putBuf "     Return ;"
  SQL.putBuf "   End if;"
  SQL.putBuf " End;"
    
  
  SQL.putBuf "  procedure INSTANCE_UNLOCK ("
  SQL.putBuf " aCURSESSION CHAR,"
  SQL.putBuf " aROWID Char"
  SQL.putBuf ") as"
  SQL.putBuf " aParentID CHAR(38);"
  SQL.putBuf " aUserID CHAR(38) ;"
  SQL.putBuf " aIsLocked integer ;"
  SQL.putBuf " aParentTable varchar(255);"
  SQL.putBuf " existsCnt integer;"
  SQL.putBuf " begin"
  SQL.putBuf " -- checking the_session  --"
  SQL.putBuf " select count(*) into existsCnt from  the_session where the_sessionid=acursession and closed=0;"
  SQL.putBuf "if  existsCnt =0"
  SQL.putBuf "  then"
  SQL.putBuf "    raise_application_error(-20000,'Сессия уже завершена.');"
  SQL.putBuf "    Return ;"
  SQL.putBuf "  End if;"
  SQL.putBuf "  Kernel.Instance_ISLOCKED( aCURSESSION,aROWID,aISLocked  );"
  SQL.putBuf " if aIsLocked >=3"
  SQL.putBuf "  then"
  SQL.putBuf "    raise_application_error(-20000,'Объект заблокирован другим пользователем');"
  SQL.putBuf "    Return ;"
  SQL.putBuf "  End if;"
  SQL.putBuf "   if  aIsLocked =2"
  SQL.putBuf "   then"
  SQL.putBuf "    update INSTANCE set LockUserID =null  where Instanceid=aRowID ;"
  SQL.putBuf "     Return ;"
  SQL.putBuf "   End if;"
  SQL.putBuf "   if  aIsLocked =1"
  SQL.putBuf "   then"
  SQL.putBuf "    update INSTANCE set LockSessionID =null  where Instanceid=aRowID;"
  SQL.putBuf "     Return ;"
  SQL.putBuf "   End if;"
  SQL.putBuf " End; "
  
  
          
  SQL.putBuf "    procedure INSTANCE_BRIEF    ("
  SQL.putBuf " aCURSESSION CHAR,"
  SQL.putBuf " ainstanceid CHAR,"
  SQL.putBuf " aBRIEF out varchar"
  SQL.putBuf ") as"
  SQL.putBuf " atmpStr varchar(255);"
  SQL.putBuf " aaccess int ;"
  SQL.putBuf " atmpBrief varchar(4000) ;"
  SQL.putBuf " atmpID CHAR(38) ;"
  SQL.putBuf " existsCnt integer;"
  SQL.putBuf " begin"
  SQL.putBuf " -- checking the_session  --"
  SQL.putBuf " select count(*) into existsCnt  from  the_session where the_sessionid=acursession and closed=0;"
  SQL.putBuf "If existsCnt = 0 Then"
  SQL.putBuf "    raise_application_error(-20000,'Сессия уже завершена.') ;"
  SQL.putBuf "    Return ;"
  SQL.putBuf "  End if;"
  SQL.putBuf "If ainstanceid Is Null Then"
  SQL.putBuf "     aBRIEF:='';"
  SQL.putBuf "    return;"
  SQL.putBuf "end if;"
 
 
  SQL.putBuf " -- Brief body --"
  SQL.putBuf "  select count(*) into existsCnt  from instance where instanceID=ainstanceID;"
  SQL.putBuf "If existsCnt = 1 Then"
  SQL.putBuf " --  verify access  --"
  SQL.putBuf " select  SecurityStyleID into atmpID from instance where instanceid=ainstanceID ;"
  SQL.putBuf " CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,"
  SQL.putBuf "     averb=>'BRIEF',aaccess=>aaccess);"
  SQL.putBuf " If aaccess = 0 Then"
  SQL.putBuf "    raise_application_error(-20000,'Нет прав на получение краткого наименования. Раздел=instance') ;"
  SQL.putBuf "    Return ;"
  SQL.putBuf " End  if;"
 
  SQL.putBuf "  select  instance_brief_F(instanceid) into aBrief from instance where instanceid=ainstanceid;"
 
  SQL.putBuf " Else"
  SQL.putBuf "   aBRIEF:= 'неверный идентификатор';"
  SQL.putBuf "End if;"
  SQL.putBuf "    aBRIEF:=substr(aBRIEF,1,255);"
  SQL.putBuf "End;"
  
  

  SQL.putBuf "    procedure QR_AND_QR  ( aid1 CHAR, aid2"
  SQL.putBuf "    CHAR,aidout CHAR,acnt out integer )"
  SQL.putBuf "as"
  SQL.putBuf "begin"
  SQL.putBuf "delete from QueryResult where QueryResultid=aidout ;"
  SQL.putBuf "insert into QueryResult(QueryResultid,result)"
  SQL.putBuf "select distinct aidout, a.result"
  SQL.putBuf "from QueryResult a"
  SQL.putBuf "join QueryResult b on b.QueryResultid=aid2 and a.result=b.result"
  SQL.putBuf "where a.QueryResultid=aid1 ;"
  SQL.putBuf "select count(*) into acnt from QueryResult where QueryResultid=aidout;"
  SQL.putBuf "end;"
  
    
  SQL.putBuf "    procedure QR_OR_QR  ( aid1 CHAR, aid2 "
  SQL.putBuf "    CHAR,aidout CHAR,acnt out integer)"
  SQL.putBuf "as"
  SQL.putBuf "begin"
  SQL.putBuf "delete from QueryResult where QueryResultid=aidout ;"
  SQL.putBuf "insert into QueryResult(QueryResultid,result)"
  SQL.putBuf "select distinct aidout, result from QueryResult where QueryResultid in (aid1,aid2);"
  SQL.putBuf "select count(*) into acnt from QueryResult where QueryResultid=aidout;"
  SQL.putBuf "End;"
  
  

  SQL.putBuf "  procedure ROWPARENTS"
  SQL.putBuf "(aQueryID   CHAR"
  SQL.putBuf ",aRowID CHAR/* Row */"
  SQL.putBuf ",aTable varchar /* Part Table Name */"
  SQL.putBuf ",aCURSESSION CHAR/* the_session */"
  SQL.putBuf ") as"
  SQL.putBuf "astr varchar(4000);"
  SQL.putBuf "aplevel integer ;"
  SQL.putBuf "aparent varchar(255) ;"
  SQL.putBuf "aprev varchar(255) ;"
  SQL.putBuf "atmpID  CHAR(38) ;"
  SQL.putBuf "atmpRowID  CHAR(38) ;"
  SQL.putBuf "existsCnt integer;"
  SQL.putBuf "begin"
  SQL.putBuf " select count(*) into existsCnt from  the_session where the_sessionid=acursession and closed=0;"
  SQL.putBuf " -- checking the_session  --"
  SQL.putBuf "if existsCnt=0"
  SQL.putBuf "  then"
  SQL.putBuf "    raise_application_error(-20000,'the_session expired') ;"
  SQL.putBuf "    Return ;"
  SQL.putBuf "  End if;"
  SQL.putBuf "aparent :=atable ;"
  SQL.putBuf "atmpID := aROWID ;"
  SQL.putBuf "aplevel :=0 ;"
  SQL.putBuf "delete from RPRESULT where RPRESULTID"
  SQL.putBuf "  =aQUERYID;"
  SQL.putBuf "insert into RPRESULT(RPRESULTID,PARENTLEVEL,PARTNAME,theROWID)"
  SQL.putBuf "   values(aQUERYID,aPLEVEL,atable,aRowID) ;"
  SQL.putBuf "<<again>>"
  SQL.putBuf " aplevel :=aplevel + 1 ;"
  SQL.putBuf " aprev := aparent ;"
  
  SQL.putBuf " begin"
  SQL.putBuf "   select thevalue into aparent from sysoptions where optiontype ='PARENT' and  name=aprev ;"
  SQL.putBuf " exception when others then"
  SQL.putBuf "   aparent := null ;"
  SQL.putBuf " end;"
  
  SQL.putBuf " if aparent is null"
  SQL.putBuf " then"
  SQL.putBuf "     astr := 'select InstanceID  from ' || aprev || ' where ' || aprev || 'id=:1' ;"
  SQL.putBuf "    execute immediate astr into atmpRowID using atmpid ;"
  SQL.putBuf "   insert into RPRESULT(RPRESULTID,PARENTLEVEL,PARTNAME,theROWID)"
  SQL.putBuf "   values(aQUERYID,aPLEVEL,'INSTANCE',atmpRowID);"
  SQL.putBuf " Else"
  SQL.putBuf "    astr := 'select ParentStructRowID  from ' || aprev || ' where '  || aprev || 'id=:1' ;"
  SQL.putBuf "    execute immediate astr into atmpRowID using atmpid ;"
  SQL.putBuf "    atmpID := atmpROWID ;"
  SQL.putBuf "   insert into RPRESULT(RPRESULTID,PARENTLEVEL,PARTNAME,theROWID)"
  SQL.putBuf "   values(aQUERYID,aPLEVEL,aparent,atmpRowID) ;"
  SQL.putBuf "    GoTo again ;"
  SQL.putBuf " End if;"
  SQL.putBuf "End;"
  
  
    
  SQL.putBuf "    procedure INSTANCE_STATUS    ("
  SQL.putBuf "  acursession CHAR,"
  SQL.putBuf "  ainstanceid CHAR,"
  SQL.putBuf "  astatusid CHAR)"
  SQL.putBuf "as"
  SQL.putBuf "   aSSID CHAR(38);"
  SQL.putBuf "   atmpID CHAR(38);"
  SQL.putBuf "   aSysLogID CHAR(38) ;"
  SQL.putBuf "   aaccess integer;"
  SQL.putBuf "   aSysInstID CHAR(38) ;"
  SQL.putBuf "   aObjType varchar(255) ;"
  SQL.putBuf "   existsCnt integer;"
  SQL.putBuf "  begin"
  SQL.putBuf "   select Instanceid into aSysInstID from instance where objtype='MTZSYSTEM' ;"
  SQL.putBuf "   select count(*) into existsCnt from instance where instanceid=ainstanceid;"
  SQL.putBuf " If existsCnt = 1 Then"
  SQL.putBuf "   select  SecurityStyleID into atmpID from INSTANCE where INSTANCEid=aINSTANCEid ;"
  SQL.putBuf "   CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'STATUS',aaccess=>aaccess );"
  SQL.putBuf "   If aaccess = 0 Then"
  SQL.putBuf "    raise_application_error(-20000,'Нет прав на изменение состояния объекта.');"
  SQL.putBuf "    Return ;"
  SQL.putBuf "   End if;"
  SQL.putBuf "    Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>ainstanceid,aIsLocked=>aaccess);"
  SQL.putBuf "   If aaccess > 2 Then"
  SQL.putBuf "     raise_application_error(-20000,'Документ заблокирован другим пльзователем.') ;"
  SQL.putBuf "     Return ;"
  SQL.putBuf "   End if;"
  SQL.putBuf "   select objtype into aObjType from instance  where  instanceid=ainstanceid ;"
  SQL.putBuf "   select count(*) into existsCnt from objstatus"
  SQL.putBuf "  join objecttype on objstatus.parentstructrowid=objecttype.objecttypeid"
  SQL.putBuf "  where objecttype.name=aobjtype and objstatusid=astatusid ;"
  SQL.putBuf "   If existsCnt = 1 Then"
  SQL.putBuf "     update instance set status = astatusid where  instanceid=ainstanceid ;"
  SQL.putBuf "     select newid() into aSysLogid from sys.dual;"
  SQL.putBuf "     MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => aSTATUSID ,"
  SQL.putBuf "     aVERB=>'STATUS',  aThe_Resource=>aInstanceID , aLogInstanceID=>aInstanceID); "
  SQL.putBuf "   End if;"
  SQL.putBuf " End if;"
  SQL.putBuf "End;"
  
    
  o.Module = "--Procedures.Kernel.Body"
  o.Block = "--body"
  o.OutNL SQL.getBuf
  
  Set SQL = Nothing
 
  Exit Sub
bye:
 
  
  'Resume
  'Stop
  Set SQL = Nothing
End Sub

Public Sub Run()
  PreInstall

  CreateKernelPackage
  KernelProcsHeader
  KernelProcs
  CloseKernelPackage
End Sub

