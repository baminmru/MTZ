VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "MakeCustom"
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
   Dim i As Long
    For i = 1 To m.SHAREDMETHOD.Count
       CreateMethod m.SHAREDMETHOD.Item(i)
      
     Next
     
    'ManualCode
    o.Module = "--Custom"
    o.Block = "--body"
    
    Dim targ As MTZMetaModel.GENERATOR_TARGET
    Dim mc As MTZMetaModel.GENMANUALCODE
    Set targ = m.FindRowObject("GENERATOR_TARGET", tid)
    For i = 1 To targ.GENMANUALCODE.Count
     Set mc = targ.GENMANUALCODE.Item(i)
     o.OutNL "/*" & mc.Name & " (" & mc.the_Alias & ")*/"
     o.OutNL mc.Code
     o.OutNL "/"
    Next
End Sub


Private Sub CreateMethod(m As SHAREDMETHOD)
  DebugOutput "ORAGEN.CreateMethod:start"
  On Error GoTo bye
  Dim p As Parameters
  Dim i As Long
  Dim s As String, s1 As String
  Dim ftm As FIELDTYPEMAP
  Dim Parameters As PARAMETERS_COL
  s1 = GetScript(m.SCRIPT)
  
  If s1 = "" Then Exit Sub
  
 
  Set Parameters = GetParameters(m.SCRIPT)
  s = "/* " & m.Name & "  " & m.the_comment & "*/"
  If m.ReturnType Is Nothing Then
    s = s & vbCrLf & "create or replace procedure " & m.Name & vbCrLf
    If Parameters.Count > 0 Then
      s = s & vbCrLf & "("
    End If
  Else
    s = "create or replace function " & m.Name & vbCrLf
  End If
    
  
  
  Parameters.Sort = "sequence"
  For i = 1 To Parameters.Count
    Set p = Parameters.Item(i)
    If i > 1 Then s = s & vbCrLf & ","
    s = s & MethodParam(p) & vbCrLf
  Next
 
  If Not m.ReturnType Is Nothing Then
    s = s & vbCrLf & ") "
    s = s & vbCrLf & " return " & parent.MapFTObj(m.ReturnType.ID).StoageType & vbCrLf
  Else
    If Parameters.Count > 0 Then
      s = s & vbCrLf & ")"
    End If
  End If
  
  
  s = s & vbCrLf & " as "
  
  
  
  o.Module = "--Custom"
  o.Block = "--Body"
  o.OutNL s
  s = ""
  
  s1 = GetScript(m.SCRIPT)
  
  If s1 = "" Then
    s1 = "print 'to do'"
'  Else
'    s1
'    's1 = ""
  End If
  
  s = s & s1 & vbCrLf
  s = s & vbCrLf & "/"
  
  o.Module = "--Custom"
  o.Block = "--body"
  o.OutNL s

  DebugOutput "ORAGEN.CreateMethod:done"
  Exit Sub
bye:
 
  'Resume
End Sub

Friend Function GetScript(scol As SCRIPT_COL) As String
  Dim i As Long
  
  On Error GoTo bye
  For i = 1 To scol.Count
    If scol.Item(i).Target.ID = tid Then
      GetScript = scol.Item(i).Code
      Exit Function
    End If
  Next
  Exit Function
bye:
''' "ERROR-->" & Err.Description & "<--ERROR"


End Function


Friend Function GetParameters(scol As SCRIPT_COL) As PARAMETERS_COL
  Dim i As Long
  
  On Error GoTo bye
  For i = 1 To scol.Count
    If scol.Item(i).Target.ID = tid Then
      Set GetParameters = scol.Item(i).Parameters
      Exit Function
    End If
  Next
  Exit Function
bye:
''' "ERROR-->" & Err.Description & "<--ERROR"

End Function

Private Function MethodParam(f As Parameters) As String
DebugOutput "ORAGEN.MethodParam:start"
On Error GoTo bye
 
  Dim s As String, ftm As FIELDTYPEMAP
  s = "a" & VF(f.Name)
  
  If f.OutParam Then
    s = s & " out "
  End If
  
  Set ftm = parent.MapFTObj(f.TypeOfParm.ID)
  If ftm.FixedSize <> 0 Then
   s = s & " " & ftm.StoageType  '& "(" & ftm.FixedSize & ")"
  Else
    s = s & " " & ftm.StoageType
    If f.TypeOfParm.AllowSize Then
      If f.DataSize <> 0 Then
        s = s ' & " (" & f.DataSize & ")"
      Else
        s = s '& " (1)"
      End If
    End If
  End If
  
  If f.OutParam = Boolean_Net Then
    If f.AllowNull Then
     s = s & " := null "
    End If
  End If
  
  MethodParam = s & "/* " & f.Caption & " */"
  DebugOutput "ORAGEN.MethodParam:done"
  Exit Function
bye:
 
 'Resume
End Function
