Attribute VB_Name = "wordcheck"
Public words() As String

Public Function IsValidFieldName2(ByVal Name As String) As Boolean
  If Len(Name) = 0 Then IsValidFieldName2 = False: Exit Function
  If Asc(Name) >= Asc("0") And Asc(Name) <= Asc("9") Then IsValidFieldName2 = False: Exit Function
  If IsValidFieldName(Name) Then
    If Not IsKeyword(Name) Then
     IsValidFieldName2 = True
    End If
  End If
End Function

Public Sub LoadWords()
  Dim ff As Integer, s As String, cnt As Long
  ff = FreeFile
  On Error Resume Next
  Erase words
  Open App.path & "\words.txt" For Input As #ff
  Input #ff, s
  cnt = 0
  While s <> ""
    cnt = cnt + 1
    ReDim Preserve words(cnt)
    words(cnt) = s
    s = ""
    Input #ff, s
  Wend
  Close #ff
End Sub

Public Function IsKeyword(ByVal Name As String) As Boolean
Dim ustr As String, i As Long
ustr = UCase(Name)
IsKeyword = False
On Error Resume Next
For i = 1 To UBound(words)
  If ustr = words(i) Then IsKeyword = True: Exit Function
Next
End Function



Public Function IsValidName(ByVal Name As String) As Boolean
  Dim m As String, i As Long
  IsValidName = True
  If InStr(1, "_", Left(Name, 1), vbTextCompare) > 0 Then IsValidName = False: Exit Function
  For i = 1 To Len(Name)
    m = Mid(Name, i, 1)
    If Asc(m) < Asc("0") Then IsValidName = False: Exit Function
    If Asc(m) > Asc("z") Then IsValidName = False: Exit Function
    If InStr(1, ":;<=>?@[\]^`", m) > 0 Then IsValidName = False: Exit Function
  Next
End Function

Public Function IsValidFieldName(ByVal Name As String) As Boolean
  Dim m As String, i As Long
  IsValidFieldName = True
  For i = 1 To Len(Name)
    m = Mid(Name, i, 1)
    If Asc(m) < Asc("0") Then IsValidFieldName = False: Exit Function
    If Asc(m) > Asc("z") Then IsValidFieldName = False: Exit Function
    If InStr(1, ":;<=>?@[\]^`", m) > 0 Then IsValidFieldName = False: Exit Function
  Next
End Function

Public Function MakeValidName(ByVal Name As String) As String
  Dim s As String
  Dim changes As String
  Dim transfr As String, transto As String
  Dim i As Long
  Dim begs As String
  begs = "_1234567890"
  changes = " +-`~'""/\|*:.,<>?][{}!@#$%^&()"
  transfr = "éöóêåíãøùçõúôûâàïðîëäæýÿ÷ñìèòüáþ¸ÉÖÓÊÅÍÃØÙÇÕÚÔÛÂÀÏÐÎËÄÆÝß×ÑÌÈÒÜÁÞ¨"
  transto = "ycukengsszh_fivaproldgeycsmit_buyYCUKENGSSZH_FIVAPROLDGEYCSMIT_BUE"
  
  s = Name
  For i = 1 To Len(changes)
    s = Replace(s, Mid(changes, i, 1), "_")
  Next
  
  For i = 1 To Len(transfr)
    s = Replace(s, Mid(transfr, i, 1), Mid(transto, i, 1))
  Next
  If InStr(1, begs, Left(s, 1)) > 0 Then
    s = "cls_" & s
  End If
  If Not IsValidFieldName2(s) Then
    s = "n_" & s
  End If
  MakeValidName = s
End Function
