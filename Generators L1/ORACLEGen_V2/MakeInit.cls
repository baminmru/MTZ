VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "MakeInit"
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


Private Function GetMap2(ByVal s As String) As String
  Dim out As String
  out = parent.GetMap(s)
'  out = Replace(out, "{", "")
'  out = Replace(out, "}", "")
  GetMap2 = out
End Function

Private Function GetID(ByVal s As String) As String
  Dim out As String
  
'  out = Replace(s, "{", "")
'  out = Replace(out, "}", "")
  GetID = out
End Function

Public Sub Run()
DebugOutput "ORAGEN.LoadOptions:start "
Dim s As Writer
Set s = New Writer
DoEvents
Dim os As PART
Dim i As Long
Dim j As Long
s.putBuf "create or replace procedure InitBase as "
s.putBuf "aid CHAR(38);"
s.putBuf "ainstid CHAR(38);"
s.putBuf "auid CHAR(38);"
s.putBuf "aSESSION CHAR(38);"
s.putBuf "acid CHAR(38);"
s.putBuf "asecid CHAR(38);"
s.putBuf "ahid CHAR(38);"
s.putBuf "atmpstr varchar2(255);"
s.putBuf "begin"
s.putBuf "ainstid := '" & GetMap2("MTSYSTEMID") & "';"
s.putBuf "auid := '" & GetMap2("inituser") & "'; "
s.putBuf "asecid := '" & GetMap2("secid") & "'; --user security instance "
s.putBuf "ahid := '" & GetMap2("helper") & "'; -- helper id"

s.putBuf "delete from users;"
s.putBuf "delete from typelist;"
s.putBuf "delete from sysoptions;"
s.putBuf "delete from instance;"

s.putBuf "insert into instance(InstanceID,OBJTYPE,Name) values(ainstid, 'MTZSYSTEM','Системная информация');"
s.putBuf "insert into instance(InstanceID,OBJTYPE,Name) values(asecid, 'MTZUsers', 'Пользователи и группы');"
s.putBuf "insert into users(usersid,instanceid,login,password,name) values('" & GetMap2("supervisor") & "',asecid,'supervisor','bami','Администратор');"
For i = 1 To m.OBJECTTYPE.Count
   s.putBuf "insert into typelist( typelistid,name,DeleteProc, HCLProc, propagateProc) values(mtz.newid(),'" & m.OBJECTTYPE.Item(i).Name & "', '" & m.OBJECTTYPE.Item(i).Name & "_DELETE', '" & m.OBJECTTYPE.Item(i).Name & "_HCL', '" & m.OBJECTTYPE.Item(i).Name & "_propagate');"
Next

For i = 1 To m.OBJECTTYPE.Count
  
  If Not m.OBJECTTYPE.Item(i).ChooseView Is Nothing Then
     s.putBuf "MTZ.Kernel.SysOptions_SAVE ( aSysOptionsid=>'" & GetMap2(m.OBJECTTYPE.Item(i).Name & "_TDEFVIEW") & "', aName=>'" & m.OBJECTTYPE.Item(i).Name & "', aValue=>'" & m.OBJECTTYPE.Item(i).ChooseView.the_Alias & "', aOptionType=>'TDEFVIEW');"
  End If

  For j = 1 To m.OBJECTTYPE.Item(i).PART.Count
      s.putBuf MapAndParent(m.OBJECTTYPE.Item(i).PART.Item(j))
      s.putBuf MapPartView(m.OBJECTTYPE.Item(i).PART.Item(j))
  Next
Next

For i = 1 To m.SHAREDMETHOD.Count
   s.putBuf "MTZ.Kernel.SysOptions_SAVE ( aSysOptionsid=>'" & GetMap2(m.SHAREDMETHOD.Item(i).Name & "_METHOD") & "', aName=>'" & GetID(m.SHAREDMETHOD.Item(i).ID) & "', aValue=>'" & m.SHAREDMETHOD.Item(i).Name & "', aOptionType=>'METHODNAME');"
Next




s.putBuf " --Logout  (acursession=>asession);"

's.putBuf "delete from the_session;"

s.putBuf "end;"
s.putBuf "/"
s.putBuf "begin InitBase(); end;"
s.putBuf "/"
o.Module = "--Init"
o.Block = "--body"
o.OutNL s.getBuf
DebugOutput "ORAGEN.LoadOptions:done "
Set s = Nothing
End Sub


Private Function MapPartView(os As PART) As String
  Dim s As String
  Dim i As Long
  For i = 1 To os.PARTVIEW.Count
    If os.PARTVIEW.Item(i).ForChoose = Boolean_Da Then
       s = s & vbCrLf & "MTZ.Kernel.SysOptions_SAVE ( aSysOptionsid=>'" & GetMap2(os.Name & "_DEFVIEW") & "', aName=>'" & VF(os.Name) & "', aValue=>'" & os.PARTVIEW.Item(i).the_Alias & "', aOptionType=>'DEFVIEW');"
      Exit For
    End If
  Next
  For i = 1 To os.PART.Count
    s = s & vbCrLf & MapPartView(os.PART.Item(i))
  Next
  
  MapPartView = s
  DebugOutput "ORAGEN.MapPartView:done " & os.Caption
End Function


Private Function MapAndParent(os As PART) As String
DebugOutput "ORAGEN.MapAndParent:start " & os.Caption
Dim s As String
Dim tn As String
  tn = parent.TypeForStruct(os).Name

  s = s & vbCrLf & "MTZ.Kernel.SysOptions_SAVE  (aSysOptionsid=>'" & GetMap2(os.Name & "_structtype") & "', aName=>'" & VF(os.Name) & "', aValue=>'" & tn & "', aOptionType=>'STRUCT_TYPE');"
  
  If TypeName(os.parent.parent) <> "OBJECTTYPE" Then
     s = s & vbCrLf & "MTZ.Kernel.SysOptions_SAVE ( aSysOptionsid=>'" & GetMap2(os.Name & "_PARENT") & "', aName=>'" & VF(os.Name) & "', aValue=>'" & os.parent.parent.Name & "', aOptionType=>'PARENT');"
  End If
  
  Dim chos As PART
  Dim i As Long
'  For i = 1 To os.PARTVIEW.Count
'    s = s & vbCrLf & MapViews(os.PARTVIEW.Item(i))
'  Next
  
  
  For i = 1 To os.PART.Count
    s = s & vbCrLf & MapAndParent(os.PART.Item(i))
  Next
  
  MapAndParent = s
  DebugOutput "ORAGEN.MapAndParent:done " & os.Caption
End Function


Private Function MapViews(pv As PARTVIEW) As String
  Dim s As String
  s = "  MTZ.Kernel.SysOptions_SAVE  (aSysOptionsid=>'" & GetMap2(pv.the_Alias & "_map") & "', aName=>'" & GetID(pv.ID) & "', aValue=.'V_" & pv.the_Alias & "', aOptionType=.'MAP');"
  MapViews = s
End Function
