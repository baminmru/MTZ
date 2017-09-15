VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "LOGGER"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 230
Option Explicit
'отладочные сообщения

Private Declare Sub OutputDebugString Lib "kernel32" Alias "OutputDebugStringA" (ByVal lpOutputString As String)

Private Type LogRecord
  App As String
  Message As String
  Time As Date
End Type

Private ff As Integer
Private mAppName As String
Private mFileName As String

'Записать сообщение
'Parameters:
'[IN]   s , тип параметра: String  - сообщение
'See Also:
'  CreateLog
'Example:
'  call me.Message(<параметры>)
Public Sub Message(ByVal s As String)
Attribute Message.VB_HelpID = 240
'  Dim r As LogRecord
'  r.App = mAppName
'  r.Time = Now
'  r.Message = s
'  On Error Resume Next
'  ff = FreeFile
'  Open "c:\MTZ.LOG" For Append As #ff Len = Len(r)
'  Print #ff, r.Time, r.App, r.Message
'  Close #ff
  Debug.Print s
  Dim s1 As String
  s1 = Now & " LOG: " & s & Chr(0)
  OutputDebugString s1
End Sub

'создать новый лог
'Parameters:
'[IN]   Name , тип параметра: String,
'[IN]   AppName , тип параметра: String  - ...
'See Also:
'  Message
'Example:
'  call me.CreateLog(<параметры>)
Public Sub CreateLog(ByVal Name As String, ByVal AppName As String)
Attribute CreateLog.VB_HelpID = 235
  On Error Resume Next
 
  
  mFileName = App.path & "\" & Name
  mAppName = Name
  Message "Log created"
End Sub

Private Sub Class_Initialize()
  ff = -1
  mAppName = ""
  mFileName = ""
End Sub

Private Sub Class_Terminate()
 Message "Log closed"
 ff = -1
 mAppName = ""
 mFileName = ""
End Sub
