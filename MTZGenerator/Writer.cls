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
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private fname As String
Private ff As Long
Private closed As Boolean

Private Sub Class_Initialize()
  Dim mTempPath As String
  mTempPath = GetSetting("MTZ", "CONFIG", "TEMPPATH", "")
  If mTempPath = "" Then
    ChDir App.path
    On Error Resume Next
    MkDir "TMP"
    fname = App.path & "\TMP\" & CreateGUID2 & ".txt"
  Else
    fname = mTempPath & CreateGUID2 & ".txt"
  End If
  On Error GoTo bye
  ff = FreeFile
  Open fname For Output As #ff
  closed = False
  Exit Sub
bye:
  MsgBox "Проблема отрытия файла:" & fname, , "Модель хранения метакода"
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

Public Sub putBuf(s As String)
If closed Then
  ff = FreeFile
  Open fname For Append As #ff
  closed = False
End If
Print #ff, vbCrLf & s
End Sub

Public Sub putBuf2(s As String)
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

