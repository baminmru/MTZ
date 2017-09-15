Attribute VB_Name = "Utils"
Option Explicit

'Utils
Public Function TypeForStruct(ByVal s As PART) As OBJECTTYPE
Dim i As Long
Dim obj As Object
Set obj = s.parent.parent

' ищем что за тип объекта
While TypeName(obj) <> "OBJECTTYPE"
  Set obj = obj.parent.parent
Wend

Set TypeForStruct = obj
End Function


Public Function NoLF(ByVal s As String) As String
NoLF = Replace(Replace(Replace(Replace(Replace(s, vbCrLf, " "), vbTab, " "), vbCr, " "), vbLf, " "), "  ", " ")
End Function


'Count Stucts for mode
Public Function CountStructs(ByVal s As PART_COL, ByVal mode As String) As Long
Dim ot As OBJECTTYPE
Dim om As OBJECTMODE
Dim dom As OBJECTMODE
Dim i As Long
Dim obj As Object
Set obj = s.parent

' ищем что за тип объекта
While TypeName(obj) <> "OBJECTTYPE"
  Set obj = obj.parent.parent
Wend

Set ot = obj

For i = 1 To ot.OBJECTMODE.Count
  If ot.OBJECTMODE.Item(i).DefaultMode Then
    Set dom = ot.OBJECTMODE.Item(i)
    Exit For
  End If
Next

For i = 1 To ot.OBJECTMODE.Count
If ot.OBJECTMODE.Item(i).name = mode Then
  Set om = ot.OBJECTMODE.Item(i)
  Exit For
End If
Next

If om Is Nothing Then
  Set om = dom
End If

If om Is Nothing Then
  CountStructs = s.Count
  Exit Function
End If

Dim j As Long, CNT As Long, ok As Boolean
CNT = 0
For j = 1 To s.Count
  ok = True
  For i = 1 To om.STRUCTRESTRICTION.Count
    If om.STRUCTRESTRICTION.Item(i).struct.ID = s.Item(j).ID Then
      If om.STRUCTRESTRICTION.Item(i).AllowRead Then
        ok = True
      Else
        ok = False
      End If
      Exit For
    End If
  Next
  If ok Then CNT = CNT + 1
Next

CountStructs = CNT

End Function


'True if struct exists in this mode
Public Function IsPresent(ByVal st As PART, ByVal mode As String) As Boolean
Dim ot As OBJECTTYPE
Dim om As OBJECTMODE
Dim dom As OBJECTMODE


Dim i As Long
Dim obj As Object

Set obj = st.parent.parent
  
  ' ищем что за тип объекта
  While TypeName(obj) <> "OBJECTTYPE"
    Set obj = obj.parent.parent
  Wend
  
  Set ot = obj
  
  For i = 1 To ot.OBJECTMODE.Count
    If ot.OBJECTMODE.Item(i).DefaultMode Then
      Set dom = ot.OBJECTMODE.Item(i)
      Exit For
    End If
  Next
  
  
  For i = 1 To ot.OBJECTMODE.Count
  If ot.OBJECTMODE.Item(i).name = mode Then
    Set om = ot.OBJECTMODE.Item(i)
    Exit For
  End If
  Next
  
  If om Is Nothing Then
    Set om = dom
  End If
  
  If om Is Nothing Then
    IsPresent = True
    Exit Function
  End If
  
  Dim ok As Boolean
  
  ok = True
  For i = 1 To om.STRUCTRESTRICTION.Count
    If om.STRUCTRESTRICTION.Item(i).struct.ID = st.ID Then
      If om.STRUCTRESTRICTION.Item(i).AllowRead Then
        ok = True
      Else
        ok = False
      End If
      Exit For
    End If
  Next
  If ok Then IsPresent = True

End Function



'Count fields for mode
Public Function CountFields(ByVal s As PART, ByVal mode As String) As Long
Dim ot As OBJECTTYPE
Dim om As OBJECTMODE
Dim dom As OBJECTMODE
Dim i As Long
Dim obj As Object
Set obj = s.parent.parent

' ищем что за тип объекта
While TypeName(obj) <> "OBJECTTYPE"
  Set obj = obj.parent.parent
Wend

Set ot = obj


For i = 1 To ot.OBJECTMODE.Count
  If ot.OBJECTMODE.Item(i).DefaultMode Then
    Set dom = ot.OBJECTMODE.Item(i)
    Exit For
  End If
Next


For i = 1 To ot.OBJECTMODE.Count
If ot.OBJECTMODE.Item(i).name = mode Then
  Set om = ot.OBJECTMODE.Item(i)
  Exit For
End If
Next

If om Is Nothing Then
  Set om = dom
End If

If om Is Nothing Then
  CountFields = s.FIELD.Count
  Exit Function
End If

Dim j As Long, CNT As Long, ok As Boolean
CNT = 0
For j = 1 To s.FIELD.Count
  ok = True
  For i = 1 To om.FIELDRESTRICTION.Count
    If om.FIELDRESTRICTION.Item(i).ThePart.ID = s.ID Then
      If om.FIELDRESTRICTION.Item(i).TheField.ID = s.FIELD.Item(j).ID Then
        If om.FIELDRESTRICTION.Item(i).AllowRead Then
          ok = True
        Else
          ok = False
        End If
        Exit For
      End If
    End If
  Next
  If ok Then CNT = CNT + 1
Next

CountFields = CNT

End Function



'Yes if field exists for mode
Public Function IsFieldPresent(ByVal s As PART, ByVal FieldID As String, ByVal mode As String) As Boolean
Dim ot As OBJECTTYPE
Dim om As OBJECTMODE
Dim dom As OBJECTMODE
Dim i As Long
Dim obj As Object
Set obj = s.parent.parent

' ищем что за тип объекта
While TypeName(obj) <> "OBJECTTYPE"
  Set obj = obj.parent.parent
Wend

Set ot = obj


For i = 1 To ot.OBJECTMODE.Count
  If ot.OBJECTMODE.Item(i).DefaultMode Then
    Set dom = ot.OBJECTMODE.Item(i)
    Exit For
  End If
Next


For i = 1 To ot.OBJECTMODE.Count
If ot.OBJECTMODE.Item(i).name = mode Then
  Set om = ot.OBJECTMODE.Item(i)
  Exit For
End If
Next

If om Is Nothing Then
  Set om = dom
End If

If om Is Nothing Then
  IsFieldPresent = True
  Exit Function
End If

Dim ok As Boolean

ok = True
For i = 1 To om.FIELDRESTRICTION.Count
  If om.FIELDRESTRICTION.Item(i).ThePart Is Nothing Then
  Else
    If om.FIELDRESTRICTION.Item(i).ThePart.ID = s.ID Then
      If om.FIELDRESTRICTION.Item(i).TheField.ID = FieldID Then
        If om.FIELDRESTRICTION.Item(i).AllowRead Then
          ok = True
        Else
          ok = False
        End If
        Exit For
      End If
    End If
  End If
 Next
IsFieldPresent = ok

End Function






Public Function AnalizeInterface(s As PART, ByVal mode As String) As String
Dim ot As OBJECTTYPE
Dim obj As Object
Dim nxt As PART
Dim prev As PART
Dim level As String, i As Long
Set obj = s.parent.parent
level = 1

' ищем что за тип объекта
While TypeName(obj) <> "OBJECTTYPE"
  Set obj = obj.parent.parent
  level = level + 1
Wend

Set ot = obj

If level > 2 Then
  AnalizeInterface = "common"
  Exit Function
End If


If level = 2 Then
  Set prev = s.parent.parent
  If CountStructs(prev.PART, mode) > 1 Then
    AnalizeInterface = "common"
    Exit Function
  End If
  
  If CountStructs(s.PART, mode) > 0 Then
    AnalizeInterface = "common"
    Exit Function
  End If
  
  
  If prev.PartType = 0 Or prev.PartType = 2 Then
  
    If s.PartType = 2 Then
      AnalizeInterface = "righttree"
      Exit Function
    End If
    
    If s.PartType = 1 Then
      AnalizeInterface = "rightgrid"
      Exit Function
    End If
    
    If s.PartType = 0 Then
      AnalizeInterface = "rightpanel"
      Exit Function
    End If
  Else
    If s.PartType = 2 Then
      AnalizeInterface = "bottomtree"
      Exit Function
    End If
    
    If s.PartType = 1 Then
      AnalizeInterface = "bottomgrid"
      Exit Function
    End If
    
    If s.PartType = 0 Then
      AnalizeInterface = "bottompanel"
      Exit Function
    End If

  End If
  
End If


If level = 1 Then
    
  If CountStructs(s.PART, mode) > 1 Then
    AnalizeInterface = "common"
    Exit Function
  End If
  
  
  For i = 1 To s.PART.Count
   If IsPresent(s.PART.Item(i), mode) Then
      If CountStructs(s.PART.Item(1).PART, mode) > 0 Then
        AnalizeInterface = "common"
        Exit Function
      End If
   End If
  Next
    
  If CountStructs(s.PART, mode) = 1 Then
    
    If s.PartType = 2 Then
      AnalizeInterface = "lefttree"
      Exit Function
    End If
    
    If s.PartType = 1 Then
      AnalizeInterface = "topgrid"
      Exit Function
    End If
    
    If s.PartType = 0 Then
      AnalizeInterface = "leftpanel"
      Exit Function
    End If
  Else
    If s.PartType = 2 Then
      AnalizeInterface = "tree"
      Exit Function
    End If
    
    If s.PartType = 1 Then
      AnalizeInterface = "grid"
      Exit Function
    End If
    
    If s.PartType = 0 Then
      AnalizeInterface = "panel"
      Exit Function
    End If
  End If
End If
End Function



' Util function
Public Function CommentSplit(ByVal Prefix As String, ByVal c As String) As String
  Dim out As String, i As Integer
  Dim ss
  On Error Resume Next
  ss = Split(c, vbCrLf)
  For i = 0 To UBound(ss)
    out = Prefix & ss(i)
  Next
  CommentSplit = out

End Function

'Util function for transliteration
Public Function MakeValidName(ByVal name As String) As String
  Dim s As String
  Dim out As String
  Dim changes As String
  Dim arr As Variant
  Dim transfr As String, transto As String
  Dim i As Long, j As Long
  Dim begs As String
  begs = "_1234567890"
  
  transfr = "йцукенгшщзхъфывапролджэ€чсмитьбюЄ…÷” ≈Ќ√Ўў«’Џ‘џ¬јѕ–ќЋƒ∆Ёя„—ћ»“№Ѕё®"
  transto = "ycukengsszh_fivaproldgeycsmit_buyYCUKENGSSZH_FIVAPROLDGEYCSMIT_BUE"
  
  
  changes = " +-`~'""/\|*:.,<>?][{}!@#$%^&()="
  arr = Array("_", "PLS", "MNS", "LAPS", "WAV", "APS", "DAPS", "SLASH", "BSLASH", _
  "FENCE", "STAR", "DDOT", "DOT", "COMA", "LS", "GT", "QMARK", "BCLS", "BOPN", _
  "WOPN", "WCLS", "IMARK", "AT", "SHARP", "DOLL", "PCNT", "ROOF", "AND", "OPN", "CLS", "EQ", "XX", "XX", "XX", "XX")
  
  
  s = name
  
  
  Dim changeIt As Long
  For i = 1 To Len(transfr)
    s = Replace(s, Mid(transfr, i, 1), Mid(transto, i, 1))
  Next
  
  For i = 1 To Len(s)
    changeIt = -1
    For j = 1 To Len(changes)
      If Mid(s, i, 1) = Mid(changes, j, 1) Then
      changeIt = j
        Exit For
      End If
    Next
    If changeIt = -1 Then
      out = out & Mid(s, i, 1)
    Else
     out = out & arr(changeIt - 1)
    End If
  Next
  s = out
  
  
  
  
  
  If InStr(1, begs, Left(s, 1)) > 0 Then
    s = "cls_" & s
  End If
  'If Not IsValidFieldName2(s) Then
  '  s = "n_" & s
  'End If
  MakeValidName = s
End Function


' return phisical type for fieldtypeid
Public Function MapFT(ByVal m As Object, ByVal TypeID As String, ByVal tid As String) As String
On Error GoTo bye

  Dim i, s
  Dim ft As FIELDTYPE
  MapFT = "TEXTBOX"
  Set ft = m.FIELDTYPE.Item(TypeID)
  If ft Is Nothing Then Exit Function
  For i = 1 To ft.FIELDTYPEMAP.Count
    If ft.FIELDTYPEMAP.Item(i).Target.ID = tid Then
'      If ft.TypeStyle = TypeStyle_Perecislenie Then
'        s = "enum" & MakeValidName(ft.name)
'      Else
        s = ft.FIELDTYPEMAP.Item(i).StoageType
'      End If
      Exit For
    End If
  Next
  MapFT = s
  Exit Function
bye:
'log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
'Stop
'Resume
End Function


Public Function GetParameters(scol As SCRIPT_COL, ByVal tid As String) As PARAMETERS_COL
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
End Function

Public Sub AddProp(ctl As ControlData, ByVal name As String, ByVal value As String)
  With ctl.Properties.Add()
    .name = name
    .PropValue = value
  End With
End Sub


Public Sub AddFProp(frm As FormData, ByVal name As String, ByVal value As String)
  With frm.PropertyData.Add()
    .name = name
    .PropValue = value
  End With
End Sub




