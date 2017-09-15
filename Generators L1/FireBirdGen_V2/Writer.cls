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

Private mWN_VIEW As Boolean
Private mWN_SYSPROC As Boolean
Private mWN_PROC As Boolean
Private mWN_FUNC As Boolean

Private mNOTRAN As Boolean

Private Property Get OptNOTRAN() As Boolean
  OptNOTRAN = mNOTRAN
End Property
Private Property Let OptNOTRAN(v As Boolean)
  mNOTRAN = v
End Property

Private Property Get OptWN_FUNC() As Boolean
  OptWN_FUNC = mWN_FUNC
End Property
Private Property Let OptWN_FUNC(v As Boolean)
  mWN_FUNC = v
End Property

Private Property Get OptWN_PROC() As Boolean
  OptWN_PROC = mWN_PROC
End Property
Private Property Let OptWN_PROC(v As Boolean)
  mWN_PROC = v
End Property

Private Property Get OptWN_SYSPROC() As Boolean
  OptWN_SYSPROC = mWN_SYSPROC
End Property
Private Property Let OptWN_SYSPROC(v As Boolean)
  mWN_SYSPROC = v
End Property

Private Property Get OptWN_VIEW() As Boolean
  OptWN_VIEW = mWN_VIEW
End Property
Private Property Let OptWN_VIEW(v As Boolean)
  mWN_VIEW = v
End Property


Private Sub Class_Initialize()
  OptWN_VIEW = GetSetting(App.Title, "SQLGEN", "WN_VIEW", vbChecked) = 1
  OptWN_SYSPROC = GetSetting(App.Title, "SQLGEN", "WN_SYSPROC", vbChecked) = 1
  OptWN_PROC = GetSetting(App.Title, "SQLGEN", "WN_PROC", vbChecked) = 1
  OptWN_FUNC = GetSetting(App.Title, "SQLGEN", "WN_FUNC", vbChecked) = 1
  
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
  Open fname For Output Lock Read Write As #ff
  closed = False
End Sub

Private Sub Class_Terminate()
  On Error Resume Next
  If Not closed Then
    Close #ff
  End If
  Kill fname
  
  If Err.Number <> 0 Then Stop
End Sub

Public Sub putBuf(s As String)
  If closed Then
    ff = FreeFile
    Open fname For Append As #ff
  End If
  
  s = Replace(s, "$VIEW$", IIf(OptWN_VIEW, " WITH(NOLOCK) ", ""))
  s = Replace(s, "$SYSPROC$", IIf(OptWN_SYSPROC, " WITH(NOLOCK) ", ""))
  s = Replace(s, "$PROC$", IIf(OptWN_PROC, " WITH(NOLOCK) ", ""))
  s = Replace(s, "$FUNC$", IIf(OptWN_FUNC, " WITH(NOLOCK) ", ""))
  
  Print #ff, s
End Sub

Public Sub putBufTRAN(s As String)
  If OptNOTRAN Then Exit Sub

  If closed Then
    ff = FreeFile
    Open fname For Append As #ff
  End If
  
  Print #ff, s
End Sub

Public Sub putBuf2(s As String)
  If closed Then
    ff = FreeFile
    Open fname For Append Lock Read Write As #ff
  End If
  Print #ff, s
End Sub

Public Function getBuf() As String
  Dim s As String
  Close #ff
  ff = FreeFile
  Open fname For Input Lock Read Write As #ff
  s = Input(LOF(ff), #ff)
  Close #ff
  closed = True
  getBuf = s
End Function
