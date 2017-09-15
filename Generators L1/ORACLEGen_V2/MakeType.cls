VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "MakeType"
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

Public Sub Run(ot As OBJECTTYPE)
CreateProcPackage ot
CreateTypeProcsHdr ot
CreateTypeProcs ot

Dim j As Long
Dim os As PART
Dim mp As MakePart

For j = 1 To ot.PART.Count
     Set os = ot.PART.Item(j)
     Set mp = New MakePart
     mp.Init ot, parent, m, o, tid
     mp.Run os
Next
   



CloseProcPackage ot
End Sub

Private Sub CreateProcPackage(ot As OBJECTTYPE)
o.Module = "--Procedures.Type.Header"
 o.Block = "--" & ot.Name
 o.OutNL " create or replace package " & ot.Name & " as"
 
 o.Module = "--Procedures.Type.Body"
 o.Block = "--" & ot.Name
 o.OutNL " create or replace package body " & ot.Name & " as"
End Sub

Private Sub CloseProcPackage(ot As OBJECTTYPE)
 o.Module = "--Procedures.Type.Header"
 o.Block = "--" & ot.Name
 o.OutNL "end " & ot.Name & ";"
 o.OutNL "/"
 
 o.Module = "--Procedures.Type.Body"
 o.Block = "--" & ot.Name
 o.OutNL "end " & ot.Name & ";"
 o.OutNL "/"
End Sub

Private Sub CreateTypeProcs(obt As OBJECTTYPE)
  
  
  
  Dim chos As PART
  Dim s As Writer
  Set s = New Writer
  DoEvents
  
 
  s.putBuf "procedure " & obt.Name & "_DELETE(acursession CHAR, aInstanceID CHAR) as  "
    Dim tos   As Integer
  
  s.putBuf "aObjType  varchar2(255);"
  s.putBuf "begin"
  s.putBuf "select  objtype into aObjType from instance where instanceid=ainstanceid;"
  s.putBuf "if  aObjType ='" & obt.Name & "'"
  s.putBuf "then"
  If obt.PART.Count > 0 Then
      For tos = 1 To obt.PART.Count
          Set chos = obt.PART.Item(tos)
          s.putBuf "declare cursor child_" & VF(chos.Name) & " is select " & VF(chos.Name) & "." & VF(chos.Name) & "id ID from " & VF(chos.Name) & " where  " & VF(chos.Name) & ".InstanceID = ainstanceid;"
          s.putBuf "row_" & VF(chos.Name) & "  child_" & VF(chos.Name) & "%ROWTYPE;"
          s.putBuf "begin"
          s.putBuf "--open child_" & VF(chos.Name) & ";"
          s.putBuf "for row_" & VF(chos.Name) & " in child_" & VF(chos.Name) & " loop"
          s.putBuf " " & VF(chos.Name) & "_DELETE (acursession,row_" & VF(chos.Name) & ".id,aInstanceID);"
          s.putBuf "end loop;"
          s.putBuf "--close child_" & VF(chos.Name) & ";"
          s.putBuf "end;"
      Next
    End If
  s.putBuf "return;"
  s.putBuf "<<del_error>>"
  s.putBuf "return;"
  s.putBuf "end if;"
  s.putBuf "end;"
  
  ' register root structure of object as child of instance
  s.putBuf "procedure " & obt.Name & "_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  "
  s.putBuf "aObjType  varchar2(255);"
  s.putBuf "atmpStr  varchar2(255);"
  
  s.putBuf " aUserID CHAR(38);"
  s.putBuf " aLockUserID CHAR(38);"
  s.putBuf " aLockSessionID CHAR(38);"
  s.putBuf " begin"
  s.putBuf "select  objtype into aObjtype from instance where instanceid=aRowid;"
  s.putBuf "if aobjtype = '" & obt.Name & "'"
  s.putBuf " then"
  
  If obt.PART.Count = 0 Then
    s.putBuf " aIsLocked :=0;"
  Else
   '---- проверяем, что нет заблокированных записей в  дочерних разделах
   
   s.putBuf " select usersid into auserID from  the_session where the_sessionid=acursession;"
    Dim i As Long
    For i = 1 To obt.PART.Count
      Set chos = obt.PART.Item(i)
      s.putBuf "declare cursor lch_" & VF(chos.Name) & " is select " & VF(chos.Name) & "." & VF(chos.Name) & "id ID from " & VF(chos.Name) & " where  " & VF(chos.Name) & ".InstanceID = arowid;"
      s.putBuf "ROW_" & VF(chos.Name) & "  lch_" & VF(chos.Name) & "%ROWTYPE;"
      s.putBuf "begin"
      s.putBuf "--open lch_" & VF(chos.Name) & ";"
      s.putBuf "for row_" & VF(chos.Name) & " in lch_" & VF(chos.Name) & " loop"
      
      ' если в дочернем разделе есть заблокированная строка
      s.putBuf " select LockUserID,LockSessionID into aLockUserID,aLockSessionID from " & VF(chos.Name) & " where " & VF(chos.Name) & "id=row_" & VF(chos.Name) & ".id;"
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
      s.putBuf "     aisLocked:= 3; /* Lockes by another user */"
      s.putBuf "     close lch_" & VF(chos.Name) & ";"
      s.putBuf "     return;"
      s.putBuf "   end if; "
      s.putBuf " end if; "
      
      ' или еще глубже
      s.putBuf " " & VF(chos.Name) & "_HCL (acursession,ROW_" & VF(chos.Name) & ".id,aisLocked);"
      s.putBuf " if aisLocked >2 then"
      s.putBuf "   close lch_" & VF(chos.Name) & ";"
      s.putBuf "   return;"
      s.putBuf " end if;"
      
      s.putBuf " end loop;"
      s.putBuf "--close lch_" & VF(chos.Name) & ";"
      s.putBuf "end;"
    Next
    s.putBuf " end if;"
    s.putBuf "aIsLocked:=0;"
  End If
  s.putBuf "end;"
   
    
  ' register root structure of object as child of instance
  
  s.putBuf "procedure " & obt.Name & "_propagate(acursession CHAR, aROWID CHAR) as  "
  s.putBuf "aObjType  varchar2(255);"
  s.putBuf "atmpStr  varchar2(255);"
  s.putBuf "achildlistid CHAR(38);"
  s.putBuf "assid CHAR(38);"
  s.putBuf "begin"
  s.putBuf "select  objtype into aObjType from instance where instanceid=aRowid;"
  s.putBuf "if aobjtype = '" & obt.Name & "'"
  s.putBuf " then"
  
  If obt.PART.Count = 0 Then
    s.putBuf "   assid:= 'do nothing';"
    s.putBuf " end if;"
  Else
    
    s.putBuf " select securitystyleid into aSSID from instance where instanceid=aRowID;"
    For i = 1 To obt.PART.Count
      Set chos = obt.PART.Item(i)
      s.putBuf "declare cursor pch_" & VF(chos.Name) & " is select " & VF(chos.Name) & "." & VF(chos.Name) & "id id from " & VF(chos.Name) & " where  " & VF(chos.Name) & ".InstanceID = arowid;"
      s.putBuf "row_" & VF(chos.Name) & "  pch_" & VF(chos.Name) & "%ROWTYPE;"
      s.putBuf "begin"
      s.putBuf "--open pch_" & VF(chos.Name) & ";"
      s.putBuf "for row_" & VF(chos.Name) & " in  pch_" & VF(chos.Name) & " loop"
      
      s.putBuf " " & VF(chos.Name) & "_SINIT( acursession,row_" & VF(chos.Name) & ".id,assid);"
      s.putBuf " " & VF(chos.Name) & "_propagate( acursession,row_" & VF(chos.Name) & ".id);"
      
      s.putBuf "end loop;"
      s.putBuf "--close pch_" & VF(chos.Name) & ";"
      s.putBuf "end;"
    Next
    s.putBuf " end if; "
  End If
  
  s.putBuf "end;"
    
   o.Module = "--Procedures.Type.Body"
 o.Block = "--" & obt.Name
  o.OutNL s.getBuf
  Set s = Nothing
End Sub

Private Sub CreateTypeProcsHdr(obt As OBJECTTYPE)
  DebugOutput "ORAGEN.CreateTypeProcs:start " & obt.the_comment
  Dim chos As PART
  Dim s As Writer
  Set s = New Writer
  DoEvents
  s.putBuf "procedure " & obt.Name & "_DELETE(acursession CHAR, aInstanceID CHAR);  "
  s.putBuf "procedure " & obt.Name & "_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);"
  s.putBuf "procedure " & obt.Name & "_propagate(acursession CHAR, aROWID CHAR); "
  o.Module = "--Procedures.Type.Header"
  o.Block = "--" & obt.Name
  o.OutNL s.getBuf
  Set s = Nothing
End Sub


