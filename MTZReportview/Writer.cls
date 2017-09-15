VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Writer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Private fname As String
Private ff As Long
Private closed As Boolean

Public Function FileName() As String
  FileName = fname
End Function

Private Sub Class_Initialize()
  closed = True
  
  
  Dim mTempPath As String
  mTempPath = GetSetting("MTZ", "CONFIG", "TEMPPATH", "")
  If mTempPath = "" Then
    ChDir App.Path
    On Error Resume Next
    MkDir "TMP"
    fname = App.Path & "\TMP\" & CreateGUID2 & ".htm"
  Else
    fname = mTempPath & CreateGUID2 & ".htm"
  End If
  On Error GoTo bye
  ff = FreeFile
  Open fname For Output As #ff
  closed = False
  Exit Sub
bye:
  MsgBox "Проблема отрытия файла:" & fname, , "ReportView"
  closed = True
End Sub

Private Sub Class_Terminate()
  On Error Resume Next
  If Not closed Then
    Close #ff
    closed = True
  End If
  Kill fname
End Sub

Public Sub OutNL(ByVal s As String)
If closed Then
  ff = FreeFile
  Open fname For Append As #ff
  closed = False
End If
Print #ff, vbCrLf & s
End Sub

Public Sub Out(ByVal s As String)
If closed Then
  ff = FreeFile
  Open fname For Append As #ff
  closed = False
End If
Print #ff, s
End Sub

Public Sub Flush()
  If Not closed Then
    Close #ff
    closed = True
  End If
End Sub


Public Function getBuf() As String
  Dim s As String
  Close #ff
  ff = FreeFile
  Open fname For Input As #ff
  s = Input(LOF(ff), #ff)
  Close #ff
  closed = True
  getBuf = s
End Function

