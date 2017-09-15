Attribute VB_Name = "Commenter"
Option Explicit
Public Function CommentItem(ByVal src As String, ByVal name As String) As String
CommentItem = Preparse("'" & Replace(name, vbCrLf, vbCrLf & "'") & vbCrLf & src)
End Function
Public Function Preparse(ByVal src As String) As String
Dim s As String, def As String
Dim prev As Long, cur As Long
prev = 1
cur = 1
s = vbCrLf
  If src <> "" Then
    Do
    cur = InStr(prev, src, vbCrLf, vbTextCompare)
    If cur = 0 Then
          def = Mid(src, prev, Len(src) - prev + 1)
          MakeParams s, def
          MakeReturns s, def
          MakeSeeAlso s
          MakeExapmle s, def
          If Right(s, 2) <> vbCrLf Then
            s = s & vbCrLf
          End If
          s = s & def
          GoTo rdy
    Else
      If Trim(Mid(src, prev, cur - prev)) <> "" Then
        If Left(Trim(Mid(src, prev, cur - prev)), 1) = "'" Then
          s = s & Trim(Mid(src, prev, cur - prev)) & vbCrLf
        End If
      End If
    End If
    prev = cur + 2
    Loop While cur > 0
rdy:
  End If
Preparse = s
End Function


Private Sub MakeSeeAlso(ByRef s As String)
  If InStr(1, s, "'See Also:", vbTextCompare) <= 0 Then
'    If lstSeeAlso.SelCount <> 0 Then
      If Right(s, 2) <> vbCrLf Then s = s & vbCrLf
      s = s & "'See Also:" & vbCrLf
'      Dim i As Integer
'      For i = 0 To lstSeeAlso.ListCount - 1
'        If lstSeeAlso.Selected(i) Then
'          s = s & vbCrLf & "'  " & lstSeeAlso.List(i)
'        End If
'      Next
'    End If
  End If
End Sub
Private Sub MakeParams(ByRef s As String, ByVal def As String)
   If InStr(1, s, "'Parameters:", vbTextCompare) <= 0 Then
   
     If Right(s, 2) <> vbCrLf Then s = s & vbCrLf
     s = s & "'Parameters:"
     
     If InStr(1, def, "()") > 0 Then
       s = s & vbCrLf & "' параметров нет"
     Else
       Dim lBracePos As Long
       Dim rBracePos As Long
       Dim comaPos As Long
       Dim prevPos As Long
       lBracePos = InStr(1, def, "(")
       rBracePos = InStr(1, def, ")")
       If lBracePos > 0 And rBracePos > 0 Then
        prevPos = lBracePos + 1
        comaPos = prevPos
        While comaPos > 0
         comaPos = InStr(prevPos, def, ",")
         If comaPos > 0 Then
           s = s & vbCrLf & MakeOneParameter(Mid(def, prevPos, comaPos - prevPos + 1))
           prevPos = comaPos + 1
         Else
           s = s & vbCrLf & MakeOneParameter(Mid(def, prevPos, rBracePos - prevPos)) & " - ..."
         End If
        Wend
       Else
         s = s & vbCrLf & "' параметров нет"
       End If
     End If
   End If
End Sub
Private Sub MakeReturns(ByRef s As String, ByVal def As String)
  If InStr(1, s, "'Returns:", vbTextCompare) <= 0 Then
    If InStr(1, def, " SUB ", vbTextCompare) > 0 Or InStr(1, def, vbCrLf & "SUB ", vbTextCompare) > 0 Then
      Exit Sub
    End If
    If InStr(1, def, "property Let", vbTextCompare) > 0 Or InStr(1, def, "property set", vbTextCompare) > 0 Then
      Exit Sub
    End If
    
    If Right(s, 2) <> vbCrLf Then s = s & vbCrLf
    s = s & "'Returns:"
    
    If InStr(1, def, ") As Boolean", vbTextCompare) > 0 Then
      s = s & vbCrLf & "' Boolean, семантика результата:"
      s = s & vbCrLf & "'   true  -"
      s = s & vbCrLf & "'   false -"
    Else
      s = s & vbCrLf & "' " & MakeValues(MakeResultType(def))
    End If
  End If
End Sub


Private Function IsObjectType(ByVal stype As String) As Integer
Dim s As String
Select Case UCase(stype)
Case "DATE", "INTEGER", "CURRENCY", "SINGLE", "MONEY", "STRING", "BYTE", "DECIMAL", "DOUBLE", "LONG", "BOOLEAN"
  IsObjectType = 1
Case "OBJECT"
  IsObjectType = 2
Case "VARIANT"
  IsObjectType = 3
Case Else
  IsObjectType = 2
End Select

End Function


Private Function MakeValues(ByVal stype As String) As String
Dim s As String
Select Case UCase(stype)
Case "DATE", "INTEGER", "CURRENCY", "SINGLE", "MONEY", "STRING", "BYTE", "DECIMAL", "DOUBLE", "LONG"
  MakeValues = " значение типа " & stype
Case "VARIANT"
  MakeValues = " объект любого класса Visual Basic" & vbCrLf & "'  ,или Nothing" & vbCrLf & "'  ,или значение любого скал€рного типа "
Case "OBJECT"
  MakeValues = " объект любого класса Visual Basic" & vbCrLf & "'  ,или Nothing "
Case Else
  MakeValues = " объект класса " & stype & vbCrLf & "'  ,или Nothing"
End Select

End Function


Private Function MakeResultType(ByVal def As String) As String
    Dim aspos As Long
    Dim rBracePos As Long
    Dim stype As String
    stype = "Variant"
    rBracePos = InStr(1, def, ")")
    If rBracePos > 0 Then
        aspos = InStr(rBracePos, def, " As ", vbTextCompare)
        If aspos > 0 Then
           stype = Mid(def, aspos + 4, Len(def) - aspos + 1)
        End If
    End If
    MakeResultType = stype
End Function
Private Function getname(ByVal s As String, ByVal start As Integer) As String
Dim s1 As String
Dim arr() As String
s1 = Mid(s, start)
arr = Split(s1, "(")
getname = arr(0)
End Function

Private Sub MakeExapmle(ByRef s As String, ByVal def As String)
  If InStr(1, s, "'Example:", vbTextCompare) <= 0 Then
    Dim objtype As Integer
    Dim stype As String
    Dim name As String

    stype = MakeResultType(def)
    objtype = IsObjectType(stype)
    
    If Right(s, 2) <> vbCrLf Then s = s & vbCrLf
    s = s & "'Example:"
    
    If UCase(Left(def, 3)) = "SUB" Or InStr(1, def, " SUB ", vbTextCompare) > 0 Or InStr(1, def, vbCrLf & "SUB ", vbTextCompare) > 0 Then
      If InStr(1, def, "()", vbTextCompare) > 0 Then
        s = s & vbCrLf & "'  call me." & getname(def, 4 + InStr(1, def, "SUB ", vbTextCompare)) & "()"
      Else
        s = s & vbCrLf & "'  call me." & getname(def, 4 + InStr(1, def, "SUB ", vbTextCompare)) & "({параметры})"
      End If
    End If
    If UCase(Left(def, 8)) = "FUNCTION" Or InStr(1, def, " function ", vbTextCompare) > 0 Or InStr(1, def, vbCrLf & "function ", vbTextCompare) > 0 Then
      s = s & vbCrLf & "' dim variable as " & stype
      If InStr(1, def, "()", vbTextCompare) > 0 Then
        If (objtype And 1) = 1 Then
          s = s & vbCrLf & "'  variable = me." & getname(def, 9 + InStr(1, def, "function ", vbTextCompare)) & "() "
        End If
        If (objtype And 2) = 2 Then
          s = s & vbCrLf & "' Set variable = me." & getname(def, 9 + InStr(1, def, "function ", vbTextCompare)) & "()"
        End If
      Else
        If (objtype And 1) = 1 Then
          s = s & vbCrLf & "' variable = me." & getname(def, 9 + InStr(1, def, "function ", vbTextCompare)) & "(...параметры...) "
        End If
        If (objtype And 2) = 2 Then
          s = s & vbCrLf & "' Set variable = me." & getname(def, 9 + InStr(1, def, "function ", vbTextCompare)) & "(...параметры...)"
        End If
      End If
    End If
    
    If InStr(1, def, "property let", vbTextCompare) > 0 Then
      s = s & vbCrLf & "' dim value as " & stype
      s = s & vbCrLf & "' value = ...значение..."
      If InStr(1, def, ",", vbTextCompare) > 0 Then
        s = s & vbCrLf & "' me." & getname(def, 12 + InStr(1, def, "property let", vbTextCompare)) & "(...параметры...) = value"
      Else
        s = s & vbCrLf & "' me." & getname(def, 12 + InStr(1, def, "property let", vbTextCompare)) & " = value"
      End If
    End If
    If InStr(1, def, "property set", vbTextCompare) > 0 Then
      s = s & vbCrLf & "' dim value as " & stype
      s = s & vbCrLf & "' set value = new " & stype
      If InStr(1, def, ",", vbTextCompare) > 0 Then
        s = s & vbCrLf & "' set me." & getname(def, 12 + InStr(1, def, "property set", vbTextCompare)) & "(...параметры...) = value"
      Else
        s = s & vbCrLf & "' set me." & getname(def, 12 + InStr(1, def, "property set", vbTextCompare)) & " = value"
      End If
    End If
    
    If InStr(1, def, "property get", vbTextCompare) > 0 Then
      s = s & vbCrLf & "' dim variable as " & stype
      
      If InStr(1, def, "()", vbTextCompare) > 0 Then
        If (objtype And 1) = 1 Then
          s = s & vbCrLf & "' variable = me." & getname(def, 12 + InStr(1, def, "property get", vbTextCompare))
        End If
        If (objtype And 2) = 2 Then
          s = s & vbCrLf & "' Set variable = me." & getname(def, 12 + InStr(1, def, "property get", vbTextCompare))
        End If
      Else
        If (objtype And 1) = 1 Then
          s = s & vbCrLf & "' variable = me." & getname(def, 12 + InStr(1, def, "property get", vbTextCompare)) & "(...параметры...)"
        End If
        If (objtype And 2) = 2 Then
          s = s & vbCrLf & "' Set variable = me." & getname(def, 12 + InStr(1, def, "property get", vbTextCompare)) & "(...параметры...)"
        End If
      End If
    End If
  End If
End Sub

Private Function MakeOneParameter(ByVal P As String) As String
  Dim pos As Long, namepos As Long, aspos As Long
  Dim s As String, stype As String
  
  pos = InStr(1, P, "BYVAL", vbTextCompare)
  If pos > 0 Then
   s = "'[IN] "
  Else
   pos = InStr(1, P, "BYREF", vbTextCompare)
   s = "'[IN][OUT] "
  End If
  If pos <= 0 Then
    pos = 1
  End If
  aspos = InStr(1, P, " AS ", vbTextCompare)
  If aspos <= 0 Then
    stype = "Variant"
    aspos = Len(P)
  Else
    stype = Mid(P, aspos + 4, Len(P) - aspos - 3)
  End If
  
  namepos = InStr(pos, P, " ")
  If namepos <= 0 Then
    namepos = 1
  End If
  If namepos = aspos Then
    namepos = pos
  End If
  s = s & " " & Mid(P, namepos, aspos - namepos + 1) & ", тип параметра: " & stype & " "
  MakeOneParameter = s
End Function



