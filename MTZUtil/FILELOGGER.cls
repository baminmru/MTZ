VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "FILELOGGER"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 35
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
Attribute Message.VB_HelpID = 50
  Dim r As LogRecord
  r.App = mAppName
  r.Time = Now
  r.Message = s
  On Error Resume Next
  ff = FreeFile
  Open "c:\MTZ.LOG" For Append As #ff Len = Len(r)
  Print #ff, r.Time, r.App, r.Message
  Close #ff
  Debug.Print s
  Dim s1 As String
  s1 = Now & " : " & s & Chr(0)
  OutputDebugString s1
End Sub
'запись ошибки
'Parameters:
'[IN]   s , тип параметра: String  - сообщение
'See Also:
'  CreateLog
'  Message
'Example:
'  call me.Error(...параметры...)
Public Sub Error(ByVal s As String)
Attribute Error.VB_HelpID = 45
  Dim r As LogRecord
  r.App = mAppName
  r.Time = Now
  r.Message = s
  On Error Resume Next
  ff = FreeFile
  Open "c:\MTZ.LOG" For Append As #ff Len = Len(r)
  Print #ff, r.Time, r.App, "Error>>:", r.Message
  Close #ff
  Debug.Print s
  Dim s1 As String
  s1 = Now & " : " & s & Chr(0)
  OutputDebugString s1
End Sub

'создать новый лог
'Parameters:
'[IN]   Name , тип параметра: String -  название,
'[IN]   AppName , тип параметра: String  - приложение
'See Also:
'  Message
'Example:
'  call me.CreateLog(<параметры>)
Public Sub CreateLog(ByVal Name As String, ByVal AppName As String)
Attribute CreateLog.VB_HelpID = 40
  On Error Resume Next
  Dim r As LogRecord
  
  mFileName = App.path & "\" & Name
  mAppName = Name
  'Message "Log created"
End Sub

Private Sub Class_Initialize()
  ff = -1
  mAppName = ""
  mFileName = ""
End Sub

Private Sub Class_Terminate()
 'Message "Log closed"
 ff = -1
 mAppName = ""
 mFileName = ""
End Sub

