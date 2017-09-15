VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "MakeFunc"
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


Public Sub Run()
  Dim ot As OBJECTTYPE
  CreateFuncPackage
  Dim j As Long, i As Long
  Dim os As PART
  Dim mp As MakePart
  For i = 1 To m.OBJECTTYPE.Count
    Set ot = m.OBJECTTYPE.Item(i)
    For j = 1 To ot.PART.Count
      Set os = ot.PART.Item(j)
      CreateStructBriefFunc os
    Next
    o.Status "Brief Function " & os.Caption, i
  Next
  CloseFuncPackage
End Sub

Private Sub CreateFuncPackage()
 o.Module = "--Functions.Header"
 o.Block = "--body"
 o.OutNL " create or replace package Func as"
 
 
Dim SQL As Writer
Set SQL = New Writer

  SQL.putBuf "  function instance_BRIEF_F  ("
  SQL.putBuf " ainstanceid CHAR"
  SQL.putBuf ")return varchar;"
 o.out SQL.getBuf
 
 o.Module = "--Functions.Body"
 o.Block = "--body"
 o.OutNL " create or replace package body Func as"
 
  Set SQL = Nothing
  Set SQL = New Writer
  SQL.putBuf "  function instance_BRIEF_F  ("
  SQL.putBuf " ainstanceid CHAR"
  SQL.putBuf ")return varchar as  "
  SQL.putBuf " aBRIEF varchar(4000);"
  SQL.putBuf " atmpCnt numeric;"
  SQL.putBuf " begin"
  SQL.putBuf "if ainstanceid is null then aBRIEF:=''; return (aBRIEF); end if;"
  SQL.putBuf " -- Brief body --"
  SQL.putBuf "select count(*) into aTmpCnt from instance where instanceID=ainstanceID;"
  SQL.putBuf "if aTmpCnt >0 then"
  SQL.putBuf "  aBRIEF:='';"
  SQL.putBuf "  select aBRIEF"
  SQL.putBuf "  ||  nvl(Name,' ')||'; ' into aBrief"
  SQL.putBuf "  from instance where  instanceID = ainstanceID;"
  SQL.putBuf "else "
  SQL.putBuf "  aBRIEF:= 'неверный идентификатор';"
  SQL.putBuf "End if;"
  SQL.putBuf " aBRIEF:=substr(aBRIEF,1,255);"
  SQL.putBuf "  return (aBRIEF);"
  SQL.putBuf "End;"
  
  o.out SQL.getBuf

End Sub

Private Sub CloseFuncPackage()
 o.Module = "--Functions.Header"
 o.Block = "--body"
 o.OutNL " end Func;"
 o.OutNL ";"
 o.Module = "--Functions.Body"
 o.Block = "--body"
 o.OutNL " end Func;"
 o.OutNL ";"
End Sub


Private Sub CreateBriefFunc(os As PART)
DebugOutput "POSTGRESGEN.CreateBriefFunc:start " & os.Caption
Dim st As PART
Set st = os
Dim chos As PART, i As Long, j As Long, f As FIELD
Dim s As Writer
Set s = New Writer

' делаем отдельно заголовки функций
CreateBriefFuncHdr os
''' "-->CreateBriefFunc " & VF(os.Name)
On Error GoTo bye

s.putBuf ""
s.putBuf "function " & VF(os.Name) & "_BRIEF_F  ("
s.putBuf " a" & VF(os.Name) & "id CHAR"
s.putBuf ") return varchar as "
s.putBuf " aBRIEF varchar(255);"
s.putBuf " atmpStr varchar(255);"
s.putBuf " atmpBrief varchar(2000);"
s.putBuf " atmpID CHAR(38);"
s.putBuf " atmpCnt Numeric;"
s.putBuf " begin  "

s.putBuf "if a" & VF(os.Name) & "id is null  then  aBRIEF:=' '; return (aBRIEF); end if;"
s.putBuf " -- Brief body -- "
s.putBuf "select count(*) into aTmpCnt from " & VF(os.Name) & " where " & VF(os.Name) & "ID=a" & VF(os.Name) & "ID;"
s.putBuf "if aTmpCnt >0 then"
s.putBuf "  aBRIEF:='';"

st.FIELD.Sort = "sequence"
For i = 1 To st.FIELD.Count
  If st.FIELD.Item(i).IsBrief Then
    Set f = st.FIELD.Item(i)
    's.putbuf "  set aBRIEF= aBRIEF || '" & F.Caption & "='"
    
    'enum
    If st.FIELD.Item(i).FIELDTYPE.TypeStyle = TypeStyle_Perecislenie Then
      
      s.putBuf "  select  aBRIEF ||"
      s.putBuf "  Decode( " & VF(f.Name)
      For j = 1 To st.FIELD.Item(i).FIELDTYPE.ENUMITEM.Count
        s.putBuf " ," & st.FIELD.Item(i).FIELDTYPE.ENUMITEM.Item(j).NameValue
        s.putBuf " ,'" & st.FIELD.Item(i).FIELDTYPE.ENUMITEM.Item(j).Name & "'"
      Next
     s.putBuf ",'.') into aBrief from " & VF(st.Name) & " where " & VF(os.Name) & "ID=a" & VF(os.Name) & "ID;"
    
    ElseIf st.FIELD.Item(i).FIELDTYPE.TypeStyle = TypeStyle_Ssilka Then
      s.putBuf "select " & VF(f.Name)
      s.putBuf " into atmpID  from " & VF(os.Name) & "  where  " & VF(os.Name) & "ID = a" & VF(os.Name) & "ID ;"
      If f.ReferenceType = ReferenceType_Na_ob_ekt_ Then
          s.putBuf " atmpBrief:=  Instance_BRIEF_F( atmpID);"
      End If
      If f.ReferenceType = ReferenceType_Na_stroku_razdela Then
        s.putBuf " atmpBrief :=  " & VF(f.RefToPart.Name) & "_BRIEF_F(atmpID);"
      End If
      s.putBuf "  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';"
    Else
      s.putBuf " select aBRIEF "
      s.putBuf "  ||  nvl(to_char(" & VF(st.FIELD.Item(i).Name) & "),' ') ||'; '"
      s.putBuf "  into aBrief from " & VF(os.Name) & "  where  " & VF(os.Name) & "ID = a" & VF(os.Name) & "ID; "
    End If
  End If
Next
s.putBuf " else "
s.putBuf "  aBRIEF:= '-';"
s.putBuf "end if;"
s.putBuf " aBRIEF:=substr(aBRIEF,1,255);"
s.putBuf "return (aBRIEF);"
s.putBuf "end;"


'Debug.Print os.Name

o.Module = "--Functions.Body"
 o.Block = "--body"
o.OutNL s.getBuf

DebugOutput "POSTGRESGEN.CreateBriefFunc:done " & os.Caption
Set s = Nothing
Exit Sub
bye:
''' "ERROR-->" & Err.Description & "<--ERROR"
'Resume
Set s = Nothing
End Sub


Private Sub CreateBriefFuncHdr(os As PART)
DebugOutput "POSTGRESGEN.CreateBriefFuncHdr:start " & os.Caption
Dim st As PART
Set st = os
Dim chos As PART, i As Long, j As Long, f As FIELD
Dim s As String

''' "-->CreateBriefFuncHdr " & VF(os.Name)

On Error GoTo bye
s = ""
s = s & vbCrLf & " function " & VF(os.Name) & "_BRIEF_F  ("
s = s & vbCrLf & " a" & VF(os.Name) & "id CHAR"
s = s & vbCrLf & ") return varchar;"

Debug.Print os.Name

o.Module = "--Functions.Header"
o.Block = "--body"
o.OutNL s

DebugOutput "POSTGRESGEN.CreateBriefFuncHdr:done " & os.Caption
Exit Sub
bye:
''' "ERROR-->" & Err.Description & "<--ERROR"
'Resume

End Sub


Private Sub CreateStructBriefFunc(os As PART)

  Dim st As PART
  Set st = os
  DoEvents
  Dim chos As PART, i As Integer
  
  
   
  CreateBriefFunc os
 
  For i = 1 To os.PART.Count
    Set chos = os.PART.Item(i)
    CreateStructBriefFunc chos
  Next
  
  
  Exit Sub
bye:
 

End Sub
