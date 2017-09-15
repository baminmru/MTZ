VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "HTMLHelper"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Sub HTMLSave(fname As String, htmlcont As String)
  On Error GoTo oops
  Dim fn As Integer
  fn = FreeFile
  Open fname For Output Access Write As #fn
  Print #fn, htmlcont
  Close #fn
oops:
End Sub

Public Function HTML(hd As String, bdy As String) As String
  HTML = "<HTML>" & vbCrLf & HEAD(hd) & vbCrLf & BODY(bdy) & vbCrLf & "</HTML>"
End Function

Public Function BODY(txt As String) As String
  BODY = "<BODY>" & vbCrLf & txt & vbCrLf & "</BODY>"
End Function

Public Function HEAD(txt As String) As String
  HEAD = "<HEAD>" & vbCrLf & _
  "<META HTTP-EQUIV=""Content-Type"" CONTENT=""text/html; charset=windows-1251"">" & vbCrLf & _
  "<TITLE>" & txt & "</TITLE>" & vbCrLf & "</HEAD>"
End Function

Public Function TITLE(txt As String) As String
  TITLE = "<TITLE>" & txt & "</TITLE>" & vbCrLf
End Function

Public Function H(txt As String, Optional level As Integer = 1) As String
  H = "<H" & level & " > " & txt & "</H" & level & ">" & vbCrLf
End Function

Public Function TABLE(txt As String, Optional param As String = "") As String
  TABLE = "<TABLE " & param & ">" & txt & "</TABLE>" & vbCrLf
End Function

Public Function OBJ(txt As String, Optional param As String = "") As String
  If param <> "" Then
    OBJ = "<OBJECT " & param & ">" & txt & "</OBJECT>" & vbCrLf
  Else
   OBJ = "<OBJECT>" & txt & "</OBJECT>" & vbCrLf
  End If
End Function


Public Function ROW(txt As String, Optional param As String = "") As String
  ROW = "<TR " & param & ">" & txt & "</TR> " & vbCrLf
End Function

Public Function CELL(txt As String, Optional param As String = "") As String
  CELL = "<TD " & param & ">" & txt & "</TD> "
End Function

Public Function HCELL(txt As String, Optional param As String = "") As String
  HCELL = "<TH " & param & ">" & txt & "</TH> "
End Function


Public Function TCAPTION(txt As String, Optional param As String = "") As String
  TCAPTION = "<CAPTION" & param & ">" & txt & "</CAPTION> " & vbCrLf
End Function

Public Function Tag(txtTag As String, name As String) As String
  Tag = "<A NAME=""" & txtTag & """>" & name & "</A> "
End Function

Public Function HREF(txtURL As String, name As String) As String
  HREF = "<A HREF=""" & txtURL & """>" & name & "</A> "
End Function

Public Function Bold(txt As String) As String
  Bold = "<B>" & txt & "</B>"
End Function

Public Function Italic(txt As String) As String
  Italic = "<I>" & txt & "</I>"
End Function

Public Function UL(txt As String) As String
  UL = "<UL>" & txt & "</UL>" & vbCrLf
End Function

Public Function OL(txt As String) As String
  OL = "<OL>" & txt & "</OL>" & vbCrLf
End Function

Public Function LI(txt As String) As String
  LI = "<LI>" & txt & vbCrLf
End Function

Public Function HR() As String
  HR = "<HR>" & vbCrLf
End Function

Public Function P(txt As String) As String
  P = "<P>" & txt & vbCrLf
End Function

Public Function BR(txt As String) As String
  BR = "<BR>" & txt & vbCrLf
End Function

Public Function Plain(txt As String) As String
  Plain = "<PLAINTEXT>" & txt & "</PLAINTEXT>" & vbCrLf
End Function


Public Function Pre(txt As String) As String
  Pre = "<PRE>" & txt & "</PRE>" & vbCrLf
End Function


