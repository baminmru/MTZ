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
    ChDir App.Path
    On Error Resume Next
    MkDir "TMP"
    fname = App.Path & "\TMP\" & CreateGUID2 & ".txt"
  Else
    fname = mTempPath & CreateGUID2 & ".txt"
  End If
  ff = FreeFile
  Open fname For Output As #ff
  closed = False
End Sub

Private Sub Class_Terminate()
  On Error Resume Next
  If Not closed Then
    Close #ff
  End If
  Kill fname
End Sub

Public Sub putBuf(s As String)
If closed Then
  ff = FreeFile
  Open fname For Append As #ff
End If
Print #ff, s
End Sub

Public Sub putBuf2(s As String)
If closed Then
  ff = FreeFile
  Open fname For Append As #ff
End If
Print #ff, s
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
