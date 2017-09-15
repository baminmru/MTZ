VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "MakePart"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim m As MTZMetaModel.Application
Dim o As MTZGenerator.Response
Dim tid As String
Dim parent As Generator
Dim ot As OBJECTTYPE

Public Sub Init(atype As OBJECTTYPE, ap As Generator, am As MTZMetaModel.Application, ao As MTZGenerator.Response, ByVal atid As String)
  Set ot = atype
  Set parent = ap
  Set m = am
  Set o = ao
  tid = atid
End Sub

Public Sub Run(os As PART)
  CreateProcHdr os
  CreateBriefProc os
  CreateDelProc os
  CreateProc os
  CreateV2Proc os
  
  Dim cos As PART
  Dim mp As MakePart
  Dim j As Long
  For j = 1 To os.PART.Count
     Set cos = os.PART.Item(j)
     Set mp = New MakePart
     mp.Init ot, parent, m, o, tid
     mp.Run cos
  Next
End Sub

Private Sub CreateProcHdr(os As PART)
Dim st As PART
Set st = os
Dim chos As PART, i As Long, j As Long, f As FIELD
Dim s As Writer
Set s = New Writer

On Error GoTo bye
s.putBuf "procedure " & VF(os.Name) & "_BRIEF  ("
s.putBuf " aCURSESSION CHAR,"
s.putBuf " a" & VF(os.Name) & "id CHAR,"
s.putBuf " aBRIEF out varchar2"
s.putBuf ");"

s.putBuf "procedure " & VF(os.Name) & "_DELETE  ("
s.putBuf " aCURSESSION CHAR,"
s.putBuf " a" & VF(os.Name) & "id CHAR,"
s.putBuf " ainstanceid char"
s.putBuf "); "

s.putBuf "procedure " & VF(os.Name) & "_SAVE ("
s.putBuf " aCURSESSION CHAR,"
s.putBuf " a" & VF(os.Name) & "id CHAR,"
s.putBuf "aInstanceID CHAR "
If TypeName(os.parent.parent) <> "OBJECTTYPE" Then
  s.putBuf ", aParentStructRowID CHAR "
End If

' дерево - родительская связь
If os.PartType = PartType_Derevo Then
  s.putBuf ", aParentRowid CHAR :=null"
End If

st.FIELD.Sort = "sequence"
For i = 1 To st.FIELD.Count
  s.putBuf "," & parent.FieldForParam(st.FIELD.Item(i))
Next
s.putBuf "); "

s.putBuf "procedure " & VF(os.Name) & "_PARENT  ("
s.putBuf " aCURSESSION CHAR,"
s.putBuf " aRowID CHAR ,"
s.putBuf " aParentID out CHAR,"
s.putBuf " aParentTable out varchar2"
s.putBuf ") ;"

s.putBuf "procedure " & VF(os.Name) & "_ISLOCKED  ("
s.putBuf " aCURSESSION CHAR,"
s.putBuf " aRowID CHAR ,"
s.putBuf " aIsLocked out integer"
s.putBuf ") ;"

s.putBuf "procedure " & VF(os.Name) & "_LOCK  ("
s.putBuf " aCURSESSION CHAR,"
s.putBuf " aRowID CHAR ,"
s.putBuf " aLockMode integer "
s.putBuf ");"

s.putBuf "procedure " & VF(os.Name) & "_HCL("
s.putBuf " aCURSESSION CHAR,"
s.putBuf " aRowID CHAR ,"
s.putBuf " aIsLocked out integer"
s.putBuf ");"

s.putBuf "procedure " & VF(os.Name) & "_UNLOCK ("
s.putBuf " aCURSESSION CHAR,"
s.putBuf " aRowID CHAR "
s.putBuf ");"

s.putBuf "procedure " & VF(os.Name) & "_SINIT  ("
s.putBuf " aCURSESSION CHAR,"
s.putBuf " aRowID CHAR ,"
s.putBuf " aSecurityStyleID CHAR"
s.putBuf ");"

s.putBuf "procedure " & VF(os.Name) & "_propagate("
s.putBuf " aCURSESSION CHAR,"
s.putBuf " aRowID CHAR"
s.putBuf ");"


 o.Module = "--Procedures.Type.Header"
 o.Block = "--" & ot.Name
o.OutNL s.getBuf
Set s = Nothing
Exit Sub
bye:
'Resume
Set s = Nothing
End Sub






Private Sub CreateBriefProc(os As PART)
DebugOutput "ORAGEN.CreateBriefProc:start "
Dim st As PART
Set st = os
Dim chos As PART, i As Long, j As Long, f As FIELD
Dim s As Writer
Set s = New Writer
On Error GoTo bye
s.putBuf ""
s.putBuf "procedure " & VF(os.Name) & "_BRIEF  ("
s.putBuf " aCURSESSION CHAR,"
s.putBuf " a" & VF(os.Name) & "id CHAR,"
s.putBuf " aBRIEF out varchar2"
s.putBuf ") as "
s.putBuf " aaccess integer;"
s.putBuf " atmpStr varchar2(255);"
s.putBuf " atmpID CHAR(38);"
s.putBuf " existsCnt integer;"
s.putBuf "begin"
s.putBuf " -- checking the_session  --"
s.putBuf " select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;"
s.putBuf "if existsCnt=0"
s.putBuf "  then"
s.putBuf "    raise_application_error(-20000,'Сессия уже завершена.');"
s.putBuf "    return;"
s.putBuf "  end if;"

s.putBuf "if a" & VF(os.Name) & "id is null then aBRIEF:=''; return; end if;"

s.putBuf " -- Brief body -- "
s.putBuf "select count(*)into existsCnt from " & VF(os.Name) & " where " & VF(os.Name) & "ID=a" & VF(os.Name) & "ID;"
s.putBuf "if existsCnt >0"
s.putBuf " then"
s.putBuf " --  verify access  --"
s.putBuf " select  SecurityStyleID into atmpid from " & VF(os.Name) & " where " & VF(os.Name) & "id=a" & VF(os.Name) & "ID;"
s.putBuf " CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); "
s.putBuf " if aaccess=0 "
s.putBuf "  then"
s.putBuf "    raise_application_error(-20000,'No access for BRIEF Structure=" & VF(os.Name) & "');"
s.putBuf "    return;"
s.putBuf "  end if;"
s.putBuf "  aBRIEF:=func." & VF(os.Name) & "_BRIEF_F(a" & VF(os.Name) & "id);"
s.putBuf "else"
s.putBuf "  aBRIEF:= 'неверный идентификатор';"
s.putBuf "end if;"
s.putBuf " aBRIEF:=substr(aBRIEF,1,255);"
s.putBuf "end; "

 o.Module = "--Procedures.Type.Body"
 o.Block = "--" & ot.Name
o.OutNL s.getBuf
DebugOutput "ORAGEN.CreateBriefProc:done "
Set s = Nothing
Exit Sub
bye:
'Resume
Set s = Nothing
End Sub

Private Sub CreateDelProc(os As PART)
  DebugOutput "ORAGEN.CreateDelProc:start " & os.Caption
  Dim st As PART
  Set st = os
  Dim chos As PART, i As Integer
  Dim s As Writer
  Set s = New Writer



On Error GoTo bye

  
  
  s.putBuf "procedure " & VF(os.Name) & "_DELETE /*" & os.the_comment & "*/ ("
  s.putBuf " aCURSESSION CHAR,"
  s.putBuf " a" & VF(os.Name) & "id CHAR,"
  s.putBuf " ainstanceid char"
  s.putBuf ") as "
    
  If Not os.NoLog Then s.putBuf " aSysLogID CHAR(38);"
  s.putBuf " aaccess integer;"
  s.putBuf " aSysInstID CHAR(38);"
  s.putBuf " atmpID CHAR(38);"
  s.putBuf " existsCnt integer;"
  s.putBuf " aChildListid CHAR(38);"
  s.putBuf "  begin  "
  s.putBuf " select  Instanceid into aSysInstID from instance where objtype='MTZSYSTEM';"
    
  s.putBuf " select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;"
  s.putBuf "if existsCnt=0 then"
  s.putBuf "    raise_application_error(-20000,'Сессия уже завершена.');"
  s.putBuf "    return;"
  s.putBuf "end if;"
  
  s.putBuf " -- Delete body -- "
  s.putBuf "select count(*) into existsCnt from " & VF(os.Name) & " where " & VF(os.Name) & "ID=a" & VF(os.Name) & "ID;"
  s.putBuf "if existsCnt >0 then"
  
  s.putBuf " --  verify access  --"
  s.putBuf " select   SecurityStyleID into atmpID from " & VF(os.Name) & " where " & VF(os.Name) & "id=a" & VF(os.Name) & "ID;"
  s.putBuf " CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;"
  s.putBuf " if aaccess=0 then "
  s.putBuf "    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:" & VF(os.Name) & "',aaccess=>aaccess); "
  s.putBuf "    if aaccess=0 then"
  s.putBuf "      raise_application_error(-20000,'Нет прав на удаление. Раздел=" & VF(os.Name) & "');"
  s.putBuf "      return;"
  s.putBuf "    end if;"
  s.putBuf "  end if;"
  
  s.putBuf " --  verify lock  --"
  s.putBuf " " & VF(os.Name) & "_ISLOCKED( acursession=>acursession,aROWID=>a" & VF(os.Name) & "id,aIsLocked=>aaccess); "
  s.putBuf " if aaccess>2 "
  s.putBuf "  then"
  s.putBuf "    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=" & VF(os.Name) & "');"
  s.putBuf "    return;"
  s.putBuf "  end if;"
  
  
  s.putBuf "  --begin tran--  "
  
  s.putBuf " -- erase child items --"
  
  If os.PART.Count > 0 Then
    s.putBuf "-- delete in-struct child"
  End If

  
  For i = 1 To os.PART.Count
    Set chos = os.PART.Item(i)
    s.putBuf "    declare cursor child_" & VF(chos.Name) & " is select " & VF(chos.Name) & "." & VF(chos.Name) & "id ID from " & VF(chos.Name) & " where  " & VF(chos.Name) & ".ParentStructRowID = a" & VF(os.Name) & "id;"
    s.putBuf "    child_" & VF(chos.Name) & "_rec  child_" & VF(chos.Name) & "%ROWTYPE;"
    s.putBuf "    begin"
    s.putBuf "    --open child_" & VF(chos.Name) & ";"
    s.putBuf "      for child_" & VF(chos.Name) & "_rec in child_" & VF(chos.Name) & " loop"
    s.putBuf "      " & VF(chos.Name) & "_DELETE (acursession,child_" & VF(chos.Name) & "_rec.id,aInstanceid);"
    s.putBuf "      end loop;"
    s.putBuf "      --close child_" & VF(chos.Name) & ";"
    s.putBuf "    end ;"
    
  Next
  
  
  
  If Not os.NoLog Then
    s.putBuf "select  MTZ.newid() into aSysLogid from SYS.DUAL;"
    s.putBuf " MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => '" & VF(os.Name) & "',"
    s.putBuf " aVERB=>'DELETEROW',  aThe_Resource=>a" & VF(os.Name) & "id, aLogInstanceID=>aInstanceID);"
  End If
  
  ' Удаляем зависимые документы!!!
  s.putBuf "declare cursor chld_" & VF(os.Name) & " is select  instanceid ID from instance where OwnerPartName ='" & VF(os.Name) & "' and OwnerRowID=a" & VF(os.Name) & "id;"
  s.putBuf "row_" & VF(os.Name) & "  chld_" & VF(os.Name) & "%ROWTYPE;"
  s.putBuf "begin"
  s.putBuf "--open chld_" & VF(os.Name) & ";"
  s.putBuf "for row_" & VF(os.Name) & " in chld_" & VF(os.Name) & " loop"
  s.putBuf " Kernel.INSTANCE_OWNER (acursession,row_" & VF(os.Name) & ".id,null,null);"
  s.putBuf " Kernel.INSTANCE_DELETE (acursession,row_" & VF(os.Name) & ".id);"
  s.putBuf "end loop;"
  s.putBuf "--close chld_" & VF(os.Name) & ";"
  s.putBuf "end ;"
     
  s.putBuf "  delete from  " & VF(os.Name) & " "
  s.putBuf "  where  " & VF(os.Name) & "ID = a" & VF(os.Name) & "ID; "
  
  s.putBuf " end if;"
  s.putBuf " -- close transaction --"
  s.putBuf " <<del_error>>"
  s.putBuf " existsCnt:=0;"
  s.putBuf "end;"
  o.Module = "--Procedures.Type.Body"
 o.Block = "--" & ot.Name
  o.OutNL s.getBuf
    
  Set s = Nothing
  DebugOutput "ORAGEN.CreateDelProc:done " & os.Caption
  Exit Sub
bye:
 
'Resume
  Set s = Nothing
End Sub



Private Sub CreateProc(os As PART)
Dim st As PART
Set st = os
Dim chos As PART, i As Integer
Dim s As Writer
Set s = New Writer



On Error GoTo bye

s.putBuf "/*" & os.Caption & "*/"

s.putBuf "procedure " & VF(os.Name) & "_SAVE /*" & os.the_comment & "*/ ("
s.putBuf " aCURSESSION CHAR,"
s.putBuf " a" & VF(os.Name) & "id CHAR,"
s.putBuf "aInstanceID CHAR "
If TypeName(os.parent.parent) <> "OBJECTTYPE" Then
  s.putBuf ", aParentStructRowID CHAR "
End If

' дерево - родительская связь
If os.PartType = PartType_Derevo Then
  s.putBuf ", aParentRowid CHAR :=null"
End If

st.FIELD.Sort = "sequence"
For i = 1 To st.FIELD.Count
  s.putBuf "," & parent.FieldForParam(st.FIELD.Item(i))
Next

s.putBuf ") as "

If Not os.NoLog Then s.putBuf "aSysLogid CHAR(38);"
s.putBuf " aUniqueRowCount integer;"
s.putBuf " atmpStr varchar2(255);"
s.putBuf " atmpID CHAR(38);"
s.putBuf " aaccess int;"
s.putBuf " aSysInstID CHAR(38);"
s.putBuf " existsCnt integer;"
s.putBuf " begin  "
s.putBuf " select Instanceid into aSysInstID from instance where objtype='MTZSYSTEM';"
  
s.putBuf " -- checking the_session  --"
s.putBuf " select count(*) into existsCnt from " & VF("the_session") & " where " & VF("the_session") & "id=acursession and closed=0 ;"
s.putBuf "if existsCnt =0 "
s.putBuf "  then"
s.putBuf "    raise_application_error(-20000,'Сессия уже завершена.');"
s.putBuf "    return;"
s.putBuf "  end if;"

's.putbuf " -- checking references  --" & vbCrLf
'For i = 1 To st.FIELD.Count
'  s = s & ReferenceCheck(os, st.FIELD.Item(i)) & vbCrLf
'Next

s.putBuf " -- Insert / Update body -- "

s.putBuf "select count(*) into existsCnt from " & VF(os.Name) & " where " & VF(os.Name) & "ID=a" & VF(os.Name) & "ID;"
s.putBuf "if existsCnt >0"
s.putBuf " then"

s.putBuf " --  UPDATE  --"

s.putBuf " --  verify access  --"

s.putBuf " select SecurityStyleID into atmpID from " & VF(os.Name) & " where " & VF(os.Name) & "id=a" & VF(os.Name) & "ID;"
s.putBuf " CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); "
s.putBuf " if aaccess=0 "
s.putBuf "  then"
s.putBuf "    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:" & VF(os.Name) & "',aaccess=>aaccess ); "
s.putBuf "    if aaccess=0 "
s.putBuf "    then"
s.putBuf "      raise_application_error(-20000,'Нет прав на модификацию. Раздел=" & VF(os.Name) & "');"
s.putBuf "      return;"
s.putBuf "    end if;"
s.putBuf "  end if;"

s.putBuf " --  verify lock  --"

s.putBuf " " & VF(os.Name) & "_ISLOCKED( acursession=>acursession,aROWID=>a" & VF(os.Name) & "id,aIsLocked=>aaccess); "
s.putBuf " if aaccess>2 "
s.putBuf "  then"
s.putBuf "    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=" & VF(os.Name) & "');"
s.putBuf "    return;"
s.putBuf "  end if;"


's.putBuf " begin tran  "

s.putBuf " -- update row  --"


If Not os.NoLog Then
  s.putBuf "select mtz.newid() into asyslogid from sys.dual;"
  s.putBuf " MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => '" & VF(os.Name) & "',"
  s.putBuf " aVERB=>'EDITROW',  aThe_Resource=>a" & VF(os.Name) & "id,aLogInstanceID=>aInstanceID);"
End If
s.putBuf " update  " & VF(os.Name) & " set ChangeStamp=sysdate"

' дерево модификация связи
If os.PartType = 2 Then
  s.putBuf ",ParentRowid= aParentRowid"
End If

st.FIELD.Sort = "sequence"
For i = 1 To st.FIELD.Count
    s.putBuf ","
    s.putBuf "  " & VF(st.FIELD.Item(i).Name) & "=a" & VF(st.FIELD.Item(i).Name)
    
   'support extention field if file type used
   If UCase(st.FIELD.Item(i).FIELDTYPE.Name) = "FILE" Then
     s.putBuf "," & VF(st.FIELD.Item(i).Name) & "_EXT="
     s.putBuf "a" & VF(st.FIELD.Item(i).Name) & "_EXT "
   End If
Next

s.putBuf "  where  " & VF(os.Name) & "ID = a" & VF(os.Name) & "ID; "

s.putBuf " -- checking unique constraints  --"
s.putBuf parent.UniqueCheck(os) & vbCrLf


s.putBuf " else"

s.putBuf " --  INSERT  --"


s.putBuf " --  verify access  --"




If TypeName(os.parent.parent) = "OBJECTTYPE" Then
    s.putBuf " select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;"
Else
    s.putBuf " select  SecurityStyleID into atmpID from " & os.parent.parent.Name & " where " & os.parent.parent.Name & "id=aParentStructRowID;"
End If

s.putBuf " CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );"
s.putBuf " if aaccess=0 "
s.putBuf "  then"
s.putBuf "    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:" & VF(os.Name) & "',aaccess=>aaccess); "
s.putBuf "    if aaccess=0 "
s.putBuf "    then"
s.putBuf "      raise_application_error(-20000,'Нет прав на создание строк. Раздел=" & VF(os.Name) & "');"
s.putBuf "      return;"
s.putBuf "    end if;"
s.putBuf " end if;"

If TypeName(os.parent.parent) = "OBJECTTYPE" Then
  s.putBuf " MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); "
Else
  s.putBuf " " & os.parent.parent.Name & "_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); "
End If


s.putBuf " if aaccess>2 "
s.putBuf "  then"
s.putBuf "    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=" & VF(os.Name) & "');"
s.putBuf "    return;"
s.putBuf "  end if;"



' check for single row part
If os.PartType = 0 Then

    s.putBuf "select Count(*) into existsCnt from " & VF(os.Name) & " where "
    If TypeName(os.parent.parent) = "OBJECTTYPE" Then
      s.putBuf "InstanceID=aInstanceID;"
    Else
      s.putBuf "ParentStructRowID=aParentStructRowID;"
    End If
    s.putBuf "if existsCnt >0 "
    s.putBuf " then"
    s.putBuf "    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <" & VF(os.Name) & ">');"
    s.putBuf "    return;"
    s.putBuf " End if;"
End If

's.putBuf " begin tran  "

If Not os.NoLog Then
  s.putBuf "select MTZ.newid() into aSysLogID from sys.dual;"
  s.putBuf " MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => '" & VF(os.Name) & "',"
  s.putBuf " aVERB=>'CREATEROW',  aThe_Resource=>a" & VF(os.Name) & "id,aLogInstanceID=>aInstanceID);"
End If

s.putBuf " insert into   " & VF(os.Name) & vbCrLf & " (  " & VF(os.Name) & "ID "


' дерево  - поле
If os.PartType = 2 Then
  s.putBuf ",ParentRowid"
End If

If TypeName(os.parent.parent) = "OBJECTTYPE" Then
  s.putBuf ",InstanceID"
Else
  s.putBuf ",ParentStructRowID"
End If


st.FIELD.Sort = "sequence"
For i = 1 To st.FIELD.Count
  s.putBuf "," & VF(st.FIELD.Item(i).Name) & vbCrLf
  
  'support extention field if file type used
   If UCase(st.FIELD.Item(i).FIELDTYPE.Name) = "FILE" Then
     s.putBuf "," & VF(st.FIELD.Item(i).Name) & "_EXT"
   End If
Next

s.putBuf " ) values " & "( a" & VF(os.Name) & "ID "


' дерево  - значение поля
If os.PartType = 2 Then
  s.putBuf ",aParentRowid"
End If


If TypeName(os.parent.parent) = "OBJECTTYPE" Then
  s.putBuf ",aInstanceID"
Else
  s.putBuf ",aParentStructRowID"
End If

st.FIELD.Sort = "sequence"
For i = 1 To st.FIELD.Count
  s.putBuf ",a" & VF(st.FIELD.Item(i).Name) & vbCrLf
   'support extention field if file type used
  If UCase(st.FIELD.Item(i).FIELDTYPE.Name) = "FILE" Then
    s.putBuf ",a" & VF(st.FIELD.Item(i).Name) & "_EXT"
  End If

Next

s.putBuf " ); "


s.putBuf " " & VF(os.Name) & "_SINIT( aCURSESSION,a" & VF(os.Name) & "id,atmpid);"

s.putBuf " -- checking unique constraints  --"
s.putBuf parent.UniqueCheck(os) & vbCrLf

s.putBuf " end if;"


s.putBuf " -- close transaction --"

's.putBuf " if aaerror <>0  if aatrancount>0 rollback tran  "
's.putBuf " if aatrancount>0 commit tran  "

s.putBuf " end; "
 o.Module = "--Procedures.Type.Body"
 o.Block = "--" & ot.Name
o.OutNL s.getBuf

'DebugOutput "ORAGEN.CreateProc:children " & os.Caption
'For i = 1 To os.PART.Count
'  Set chos = os.PART.Item(i)
'  CreateProc chos
'Next
Set s = Nothing
DebugOutput "ORAGEN.CreateProc:done " & os.Caption
Exit Sub
bye:

'Resume
Set s = Nothing
End Sub

Private Sub CreateV2Proc(os As PART)
DebugOutput "ORAGEN.CreateV2Proc:start " & os.Caption
Dim st As PART
Set st = os
Dim chos As PART, i As Integer
Dim s As Writer
Set s = New Writer

DoEvents


On Error GoTo bye


s.putBuf "procedure " & VF(os.Name) & "_PARENT /*" & os.the_comment & "*/ ("
s.putBuf " aCURSESSION CHAR,"
s.putBuf " aRowID CHAR ,"
s.putBuf " aParentID out CHAR ,"
s.putBuf " aParentTable out varchar2"

s.putBuf ") as "
s.putBuf "existsCnt integer;"
s.putBuf " begin  "
s.putBuf " -- checking the_session  --"
s.putBuf "select count(*)into existsCnt from the_session where the_sessionid=acursession and closed=0 ;"
s.putBuf "if existsCnt=0"
s.putBuf "  then"
s.putBuf "    raise_application_error(-20000,'Сессия уже завершена.');"
s.putBuf "    return;"
s.putBuf "  end if;"

'  If os.PartType = PartType_Derevo Then
'      ' дерево - родительская связь
'      s.putbuf "  select aParentID = ParentRowid from " & vf(os.name) & " where  " & vf(os.name) & "id=aRowID"
'      s.putbuf "  IF aParentID IS NULL"
'      s.putbuf "  then"
'
'      ' переходим границы раздела
'      If TypeName(os.Parent.Parent) = "OBJECTTYPE" Then
'        s.putbuf "  set aParentTable = 'INSTANCE'"
'        s.putbuf "  select aParentID = INSTANCEID from " & vf(os.name) & " where  " & vf(os.name) & "id=aRowID"
'      Else
'        s.putbuf "  select aParentID = ParentStructRowID from " & vf(os.name) & " where  " & vf(os.name) & "id=aRowID"
'        s.putbuf "  set aParentTable = '" & os.Parent.Parent.Name & "'"
'      End If
'
'      s.putbuf "  END"
'      s.putbuf "  else"
'      s.putbuf "  BEGIN"
'      s.putbuf "    set aParentTable = '" & vf(os.name) & "'"
'      s.putbuf "  END"
'  Else
    If TypeName(os.parent.parent) = "OBJECTTYPE" Then
      s.putBuf "  aParentTable := 'INSTANCE';"
      s.putBuf "  select  INSTANCEID into aParentID from " & VF(os.Name) & " where  " & VF(os.Name) & "id=aRowID;"
    Else
  
      s.putBuf "  select ParentStructRowID into aParentID  from " & VF(os.Name) & " where  " & VF(os.Name) & "id=aRowID;"
      s.putBuf "  aParentTable := '" & os.parent.parent.Name & "';"
    End If
 ' End If

s.putBuf " end; "




 o.Module = "--Procedures.Type.Body"
 o.Block = "--" & ot.Name
o.OutNL s.getBuf



'------------------------------- IsLockED ----------------------------------------------
Set s = Nothing
Set s = New Writer

s.putBuf "procedure " & VF(os.Name) & "_ISLOCKED /*" & os.the_comment & "*/ ("
s.putBuf " aCURSESSION CHAR,"
s.putBuf " aRowID CHAR ,"
s.putBuf " aIsLocked out integer"
s.putBuf ") as "
s.putBuf " aParentID CHAR(38);"
s.putBuf " aUserID CHAR(38);"
s.putBuf " aLockUserID CHAR(38);"
s.putBuf " aLockSessionID CHAR(38);"
s.putBuf " aParentTable varchar2(255); "
s.putBuf " existsCnt integer; "
s.putBuf "  astr varchar2(4000);"
s.putBuf "begin"

s.putBuf " aisLocked := 0;"
s.putBuf " -- checking the_session  --"
s.putBuf "select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0;"
s.putBuf "if existsCnt=0"
s.putBuf "  then"
s.putBuf "    raise_application_error(-20000,'Сессия уже завершена.');"
s.putBuf "    return;"
s.putBuf "  end if;"

s.putBuf " select usersid into auserID from the_session where the_sessionid=acursession;"
s.putBuf " select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from " & VF(os.Name) & " where " & VF(os.Name) & "id=aRowID;"
s.putBuf " /* verify this row */"
s.putBuf " if not aLockUserID is null  "
s.putBuf " then   "
s.putBuf "   if  aLockUserID <> auserID  "
s.putBuf "   then   "
s.putBuf "     aisLocked := 4; /* CheckOut by another user */"
s.putBuf "     return;"
s.putBuf "   else "
s.putBuf "     aisLocked := 2; /* CheckOut by caller */"
s.putBuf "     return;"
s.putBuf "   end  if; "
s.putBuf " end if;  "

s.putBuf " if not aLockSessionID is null  "
s.putBuf " then   "
s.putBuf "   if  aLockSessionID <> aCURSESSION  "
s.putBuf "   then   "
s.putBuf "     aisLocked := 3; /* Lockes by another user */"
s.putBuf "     return;"
s.putBuf "   else "
s.putBuf "     aisLocked := 1; /* Locked by caller */"
s.putBuf "     return;"
s.putBuf "   end if;  "
s.putBuf " end if;  "

s.putBuf " aisLocked := 0; "
s.putBuf "  " & VF(os.Name) & "_parent (aCURSESSION,aROWID,aParentID,aParentTable);"
s.putBuf "  if aparenttable='INSTANCE' then"
s.putBuf "      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';"
s.putBuf "    Else"
s.putBuf "      astr := 'begin " & ot.Name & ".' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';"
s.putBuf "    end if;"
s.putBuf "  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;"
s.putBuf " end; "


o.Module = "--Procedures.Type.Body"
o.Block = "--" & ot.Name
o.OutNL s.getBuf


'--------------------------- Блокируем запись
Set s = Nothing
Set s = New Writer
s.putBuf "procedure " & VF(os.Name) & "_LOCK /*" & os.the_comment & "*/ ("
s.putBuf " aCURSESSION CHAR,"
s.putBuf " aRowID CHAR ,"
s.putBuf " aLockMode integer "
s.putBuf ") as "

s.putBuf " aParentID CHAR(38);"
s.putBuf " aUserID CHAR(38);"
s.putBuf " atmpID CHAR(38);"
s.putBuf " aaccess integer;"
s.putBuf " aIsLocked integer;"
s.putBuf " aParentTable varchar2(255); "
s.putBuf " existsCnt integer; "
s.putBuf " begin  "
s.putBuf " select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0;"
s.putBuf " -- checking the_session  --"
s.putBuf "if existsCnt=0"
s.putBuf "  then"
s.putBuf "    raise_application_error(-20000,'Сессия уже завершена.');"
s.putBuf "    return;"
s.putBuf "  end if;"

s.putBuf " select usersid into auserid from  the_session where the_sessionid=acursession;"
s.putBuf " " & VF(os.Name) & "_ISLOCKED (aCURSESSION,aROWID,aISLocked );"
s.putBuf " if aIsLocked >=3  "
s.putBuf "  then"
s.putBuf "    raise_application_error(-20000,'Строка заблокирована другим пользователем');"
s.putBuf "    return;"
s.putBuf "  end if;"

s.putBuf " if aIsLocked =0  "
s.putBuf " then"
s.putBuf "  " & VF(os.Name) & "_HCL (acursession,aRowID,aisLocked);"
s.putBuf "  if aIsLocked >=3  "
s.putBuf "  then"
s.putBuf "     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');"
s.putBuf "     return;"
s.putBuf "   end if;"
s.putBuf " end if;"

s.putBuf " select  SecurityStyleID into atmpID from " & VF(os.Name) & " where " & VF(os.Name) & "id=aROWID;"
s.putBuf " CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); "
s.putBuf " if aaccess=0 "
s.putBuf " then"
s.putBuf "    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=" & VF(os.Name) & "');"
s.putBuf "    return;"
s.putBuf "  end if;"

s.putBuf "   if  aLockMode =2  "
s.putBuf "   then   "
s.putBuf "    update " & VF(os.Name) & " set LockUserID =auserID ,LockSessionID =null where " & VF(os.Name) & "id=aRowID;"
s.putBuf "     return;"
s.putBuf "   end if;"

s.putBuf "   if  aLockMode =1  "
s.putBuf "   then   "
s.putBuf "    update " & VF(os.Name) & " set LockUserID =null,LockSessionID =aCURSESSION  where " & VF(os.Name) & "id=aRowID;"
s.putBuf "     return;"
s.putBuf "   end if;"

s.putBuf " end ;"


o.Module = "--Procedures.Type.Body"
o.Block = "--" & ot.Name
o.OutNL s.getBuf



'--------------------------- HCL - Has Children Locked

Set s = Nothing
Set s = New Writer
s.putBuf "procedure " & VF(os.Name) & "_HCL /*" & os.the_comment & "*/ ("
s.putBuf " aCURSESSION CHAR,"
s.putBuf " aRowID CHAR ,"
s.putBuf " aIsLocked out integer"
s.putBuf ") as "


'---- проверяем, что нет заблокированных записей в  дочерних разделах
  s.putBuf "achildlistid CHAR(38);"
  s.putBuf " aUserID CHAR(38);"
  s.putBuf " aLockUserID CHAR(38);"
  s.putBuf " aLockSessionID CHAR(38);"
  s.putBuf " begin  "
  s.putBuf " select usersid into auserID from the_session where the_sessionid=acursession;"
  
  If os.PART.Count > 0 Then
    s.putBuf "-- verify child locks"
  End If

  For i = 1 To os.PART.Count
    Set chos = os.PART.Item(i)
    s.putBuf "declare cursor lch_" & VF(chos.Name) & " is select " & VF(chos.Name) & "." & VF(chos.Name) & "id ID from " & VF(chos.Name) & " where  " & VF(chos.Name) & ".ParentStructRowID = aRowid;"
    s.putBuf "row_" & VF(chos.Name) & " lch_" & VF(chos.Name) & "%ROWTYPE;"
    s.putBuf "begin  "
    s.putBuf "--open lch_" & VF(chos.Name) & ";"
    s.putBuf "for row_" & VF(chos.Name) & " in lch_" & chos.Name
    s.putBuf "loop"
        
    ' если в дочернем разделе есть заблокированная строка
    s.putBuf " select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from " & VF(chos.Name) & " where " & VF(chos.Name) & "id=row_" & VF(chos.Name) & ".id;"
    s.putBuf " /* verify this row */"
    s.putBuf " if not aLockUserID is null  "
    s.putBuf " then   "
    s.putBuf "   if  aLockUserID <> auserID  "
    s.putBuf "   then   "
    s.putBuf "     aisLocked := 4; /* CheckOut by another user */"
    s.putBuf "     close lch_" & VF(chos.Name) & ";"
    s.putBuf "     return;"
    s.putBuf "   end if;  "
    s.putBuf " end if;  "
    s.putBuf " if not aLockSessionID is null  "
    s.putBuf " then   "
    s.putBuf "   if  aLockSessionID <> aCURSESSION  "
    s.putBuf "   then   "
    s.putBuf "     aisLocked := 3; /* Lockes by another user */"
    s.putBuf "     close lch_" & VF(chos.Name) & ";"
    s.putBuf "     return;"
    s.putBuf "   end if; "
    s.putBuf " end if;  "
    
    ' или еще глубже
    
    s.putBuf " " & VF(chos.Name) & "_HCL (acursession,row_" & VF(chos.Name) & ".id,aisLocked);"
    s.putBuf " if aisLocked >2 then"
    s.putBuf "   close lch_" & VF(chos.Name) & ";"
    s.putBuf "   return;"
    s.putBuf " end if;"
    
    s.putBuf "end loop;"
    s.putBuf "--close lch_" & VF(chos.Name) & ";"
    s.putBuf "end;"
    Next
    s.putBuf "aIsLocked :=0;"
    s.putBuf "end;"
  
    o.Module = "--Procedures.Type.Body"
    o.Block = "--" & ot.Name
    o.OutNL s.getBuf



'--------------------------- Разблокируем запись
Set s = Nothing
Set s = New Writer
s.putBuf "procedure " & VF(os.Name) & "_UNLOCK /*" & os.the_comment & "*/ ("
s.putBuf " aCURSESSION CHAR,"
s.putBuf " aRowID CHAR "
s.putBuf ") as "

s.putBuf " aParentID CHAR(38);"
s.putBuf " aUserID CHAR(38);"
s.putBuf " aIsLocked integer;"
s.putBuf " aParentTable varchar2(255); "
s.putBuf " existsCnt integer;"
s.putBuf " begin  "
s.putBuf " -- checking the_session  --"
s.putBuf "select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;"
s.putBuf "if  existsCnt=0"
s.putBuf "  then"
s.putBuf "    raise_application_error(-20000,'Сессия уже завершена.');"
s.putBuf "    return;"
s.putBuf "  end if;"

s.putBuf " select usersid into auserID from the_session where the_sessionid=acursession;"
s.putBuf " " & VF(os.Name) & "_ISLOCKED( aCURSESSION,aROWID,aISLocked);"
s.putBuf " if aIsLocked >=3  "
s.putBuf "  then"
s.putBuf "    raise_application_error(-20000,'Строка заблоирована другим пользователем');"
s.putBuf "    return;"
s.putBuf "  end if;"

s.putBuf "   if  aIsLocked =2  "
s.putBuf "   then   "
s.putBuf "    update " & VF(os.Name) & " set LockUserID =null  where " & VF(os.Name) & "id=aRowID;"
s.putBuf "     return;"
s.putBuf "   end if;"

s.putBuf "   if  aIsLocked =1  "
s.putBuf "   then   "
s.putBuf "    update " & VF(os.Name) & " set LockSessionID =null  where " & VF(os.Name) & "id=aRowID;"
s.putBuf "     return;"
s.putBuf "   end if;"

s.putBuf " end; "

 o.Module = "--Procedures.Type.Body"
 o.Block = "--" & ot.Name
o.OutNL s.getBuf




'--------------------------- Наследуем установки Security
Set s = Nothing
Set s = New Writer

s.putBuf "procedure " & VF(os.Name) & "_SINIT /*" & os.the_comment & "*/ ("
s.putBuf " aCURSESSION CHAR,"
s.putBuf " aRowID CHAR ,"
s.putBuf " aSecurityStyleID CHAR"
s.putBuf ") as "
s.putBuf " aParentID CHAR(38);"
s.putBuf " aParentTable varchar2(255); "
s.putBuf " aStr varchar2(4000);"
s.putBuf " aStyleID CHAR(38);"


s.putBuf " atmpID CHAR(38);"
s.putBuf " aaccess integer; " & vbCrLf & "begin"
s.putBuf " select  SecurityStyleID into atmpID from " & VF(os.Name) & " where " & VF(os.Name) & "id=aROWID;"
s.putBuf "  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); "
s.putBuf " if aaccess=0 "
s.putBuf "  then"
s.putBuf "    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =" & VF(os.Name) & "');"
s.putBuf "    return;"
s.putBuf "  end if;"

s.putBuf "if aSecurityStyleID is null then"

s.putBuf " " & VF(os.Name) & "_parent( aCURSESSION,aROWID,aParentID ,aParentTable);"
s.putBuf "  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;"
s.putBuf "  execute immediate astr into aStyleID using aParentid;"
s.putBuf " update " & VF(os.Name) & " set securitystyleid =aStyleID where " & VF(os.Name) & "id = aRowID;"
s.putBuf "else "
s.putBuf " update " & VF(os.Name) & " set securitystyleid =aSecurityStyleID where " & VF(os.Name) & "id = aRowID;"
s.putBuf "end if; "
s.putBuf "end ; "

 o.Module = "--Procedures.Type.Body"
 o.Block = "--" & ot.Name
o.OutNL s.getBuf


'--------------------------- распространение прав на дочерние объекты
Set s = Nothing
Set s = New Writer

s.putBuf "procedure " & VF(os.Name) & "_propagate /*" & os.the_comment & "*/ ("
s.putBuf " aCURSESSION CHAR,"
s.putBuf " aRowID CHAR"
s.putBuf ") as "
s.putBuf "achildlistid CHAR(38);"
s.putBuf "aSSID CHAR(38);"
s.putBuf "begin"
s.putBuf "select securityStyleid into aSSID from " & VF(os.Name) & " where " & VF(os.Name) & "id=aRowid;"

  For i = 1 To os.PART.Count
    Set chos = os.PART.Item(i)
    s.putBuf "declare cursor pch_" & VF(chos.Name) & "  is select " & VF(chos.Name) & "." & VF(chos.Name) & "id ID from " & VF(chos.Name) & " where  " & VF(chos.Name) & ".ParentStructRowID = aRowid;"
    s.putBuf "row_" & VF(chos.Name) & "  pch_" & VF(chos.Name) & "%ROWTYPE;"
    s.putBuf "begin"
    s.putBuf "--open pch_" & VF(chos.Name) & ";"
    s.putBuf "for row_" & VF(chos.Name) & " in pch_" & VF(chos.Name) & " loop"
    s.putBuf "   " & VF(chos.Name) & "_SINIT( acursession,row_" & VF(chos.Name) & ".id,assid);"
    s.putBuf "   " & VF(chos.Name) & "_propagate( acursession,row_" & VF(chos.Name) & ".id);"
    s.putBuf "end loop;"
    s.putBuf "--close pch_" & VF(chos.Name) & ";"
    s.putBuf "end;"
  Next
  s.putBuf "end;"
  
 o.Module = "--Procedures.Type.Body"
 o.Block = "--" & ot.Name
o.OutNL s.getBuf

Set s = Nothing

Exit Sub
bye:

'Resume
Set s = Nothing
End Sub


' make
Private Function ReferenceCheck(os As PART, f As FIELD) As String
DebugOutput "ORAGEN.ReferenceCheck:start " & os.Caption & " Filed:" & f.Caption
On Error GoTo bye
  Dim s As Writer
  Set s = New Writer
 

  'не ссылка
  'объект
  'строка
  
'RAISERROR   ('The current database ID is:%d, the database name is: %s.',    16, 1, aDBID, aDBNAME)


  If f.ReferenceType = ReferenceType_Skalyrnoe_pole_OPN_ne_ssilkaCLS Then
    s.putBuf ""
  End If

  If f.ReferenceType = ReferenceType_Na_ob_ekt_ Then
    s.putBuf "if(not exists( select  1 from instance where instanceid=a" & VF(f.Name) & " )) "
    s.putBuf "  then"
    s.putBuf "    raise_application_error(-20000,'Не обнаружен объект, на который установлена ссылка. Раздел=" & VF(os.Name) & " field=" & VF(f.Name) & "');"
    s.putBuf "    if aatrancount>0 rollback tran"
    s.putBuf "    return"
    s.putBuf "  end"
  End If
  
  
  If f.ReferenceType = ReferenceType_Na_stroku_razdela Then
    s.putBuf "if(not a" & VF(f.Name) & " is null ) "
    s.putBuf "if(not exists( select  1 from " & VF(f.RefToPart.Name) & " where " & VF(f.RefToPart.Name) & "id=a" & VF(f.Name) & " )) "
    s.putBuf "  then"
    s.putBuf "    raise_application_error(-20000,'Отсутствует строка в таблице (" & VF(f.RefToPart.Name) & "), на которую установлена ссылка.  Раздел=" & VF(os.Name) & " поле=" & VF(f.Name) & "');"
    s.putBuf "    if aatrancount>0 rollback tran"
    s.putBuf "    return"
    s.putBuf "  end"
  End If

  ReferenceCheck = s.getBuf
  DebugOutput "ORAGEN.ReferenceCheck:done " & os.Caption & " Filed:" & f.Caption
  Set s = Nothing
  Exit Function
bye:
 
  Set s = Nothing
End Function


