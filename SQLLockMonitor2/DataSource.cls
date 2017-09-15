VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "DataSource"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3B8F80100021"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Interface"
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Member0" ,"ConnectManager"
'{group:Data Access Service}
Option Base 0
Option Explicit
Private mADOConnection As ADODB.Connection
Private InTransaction As Boolean
Private mPrevConnectionString As String
Private mPrevProvider As String
Private mPrevTimeOut As Long

Public Server As String
Public DataBaseName As String
Public UserName As String
Public Password As String
Public Integrated As Boolean



' открыть таблицу
'Parameters:
'TableName - имя таблицы
Private Function OpenTable(ByVal TableName As String) As ADODB.RecordSet
  Dim RecordSet As ADODB.RecordSet
  
  If mADOConnection Is Nothing Then Exit Function
  If mADOConnection.State <> adStateOpen Then CheckState
  If mADOConnection.State <> adStateOpen Then Exit Function
  

  
  On Error GoTo errOpenTable
  Set RecordSet = New ADODB.RecordSet
  RecordSet.CursorType = adOpenDynamic
  RecordSet.LockType = adLockReadOnly
  Call RecordSet.Open(TableName, mADOConnection, , , adCmdTable)
  Set OpenTable = RecordSet
'  mLastCheck = Now
  Exit Function
errOpenTable:
  Dim ADOErrors As String
  Dim e As ADODB.Error
  ADOErrors = ""
  For Each e In mADOConnection.Errors
    ADOErrors = ADOErrors & "[" & e.NativeError & "]" & e.Description & vbCrLf
  Next

  Resume bye2
bye2:

  CheckState
End Function



'
'##ModelId=3B8F80100215
Private Sub Class_Terminate()
    On Error Resume Next
    CloseClass
End Sub

'
Private Sub Class_Initialize()
    On Error Resume Next
    Set mADOConnection = Nothing
End Sub

' "Деструктор"
Friend Sub CloseClass()
On Error Resume Next
    Set mADOConnection = Nothing
End Sub

' инициализировать объект соединением ADODB.Connection
Public Sub SetConnection()
    If Not mADOConnection Is Nothing Then
        mPrevConnectionString = mADOConnection.ConnectionString
        mPrevProvider = mADOConnection.Provider
        mPrevTimeOut = mADOConnection.ConnectionTimeout
    End If
'    mLastCheck = Now
End Sub


' открыть RecordSet
'Parameters:
'SqlString - запрос
'ReadOnly - открыть только для чтения
Public Function OpenRecordset(ByVal SqlString As String) As ADODB.RecordSet
  On Error Resume Next
  Dim ADORecordSet As ADODB.RecordSet
  If mADOConnection Is Nothing Then Exit Function
  If mADOConnection.State <> adStateOpen Then CheckState
  If mADOConnection.State <> adStateOpen Then Exit Function
  
  Set ADORecordSet = New ADODB.RecordSet
  ADORecordSet.CursorType = adOpenStatic 'adOpenForwardOnly
  ADORecordSet.LockType = adLockReadOnly
  ADORecordSet.CursorLocation = adUseClient
  ADORecordSet.CacheSize = 100
  ADORecordSet.PageSize = 100
  On Error GoTo bye
  Debug.Print SqlString
  Call ADORecordSet.Open(SqlString, mADOConnection)
  On Error Resume Next
  Set ADORecordSet.ActiveConnection = Nothing
  Set OpenRecordset = ADORecordSet
  Set ADORecordSet = Nothing
  Exit Function
  
bye:
  Dim ADOErrors As String
  Dim e As ADODB.Error
  ADOErrors = ""
  For Each e In mADOConnection.Errors
    ADOErrors = ADOErrors & "[" & e.NativeError & "]" & e.Description & vbCrLf
  Next
   
  Set OpenRecordset = Nothing
  Set ADORecordSet = Nothing
  
  Resume bye2
bye2:
  CheckState
  On Error GoTo 0
  Err.Raise 10000, "MTZSession.OpenRecordset", ADOErrors & vbCrLf & "[" & SqlString & "]"
End Function

' выполнить SQL запрос
'Parameters:
'SqlString - запрос
'Returns:
'true- запрос успешно выполнен
Public Function Execute(ByVal SqlString As String) As Boolean
  If mADOConnection Is Nothing Then Exit Function
  If mADOConnection.State <> adStateOpen Then CheckState
  If mADOConnection.State <> adStateOpen Then Exit Function
  
  On Error GoTo bye
  Debug.Print SqlString
  mADOConnection.Execute SqlString, , adCmdText

  Execute = True
  Exit Function
bye:
  Dim ADOErrors As String
  Dim e As ADODB.Error
  ADOErrors = ""
  For Each e In mADOConnection.Errors
    ADOErrors = ADOErrors & "[" & e.NativeError & "]" & e.Description & vbCrLf
  Next
  

  Execute = False
  Resume bye2
bye2:
  
  CheckState
  On Error GoTo 0
  Err.Raise 10000, "MTZSession.Execute", ADOErrors & vbCrLf & "[" & SqlString & "]"
End Function



' начать транзакцию
' See Also:
'InTransaction
Public Function BeginTrans() As Long
  
  On Error GoTo bye
  BeginTrans = 0
  If mADOConnection Is Nothing Then Exit Function
  If mADOConnection.State <> adStateOpen Then CheckState
  If mADOConnection.State <> adStateOpen Then Exit Function
  
  mADOConnection.BeginTrans
  
  If BeginTrans > 0 Then
    InTransaction = True
  Else
    InTransaction = False
  End If
  Exit Function
bye:
  Resume bye2
bye2:
  CheckState
End Function

' завершить транзакцию
' See Also:
'InTransaction
Public Sub CommitTrans()
  If mADOConnection Is Nothing Then Exit Sub
  If mADOConnection.State <> adStateOpen Then CheckState
  If mADOConnection.State <> adStateOpen Then Exit Sub
  
  
  On Error GoTo bye
  
  If Not mADOConnection Is Nothing Then mADOConnection.CommitTrans
  InTransaction = False
  Exit Sub
bye:
  Resume bye2
bye2:
  CheckState
End Sub

' отменить транзакцию
Public Sub RollbackTrans()
  If mADOConnection Is Nothing Then Exit Sub
  If mADOConnection.State <> adStateOpen Then CheckState
  If mADOConnection.State <> adStateOpen Then Exit Sub
  
  On Error GoTo bye
  
  If Not mADOConnection Is Nothing Then mADOConnection.RollbackTrans
  InTransaction = False
  Exit Sub
bye:
  Resume bye2
bye2:
  CheckState

End Sub

' есть ли активные транзакции
Public Function IsInTransaction() As Boolean
  IsInTransaction = InTransaction
End Function

' проверить состояние соединения с БД
Public Sub CheckState()
  Static attempts As Integer
  
  'attempts = 0
  Dim ADORecordSet As RecordSet
  Set ADORecordSet = New ADODB.RecordSet
  On Error GoTo errCheck
  ADORecordSet.CursorType = adOpenForwardOnly
  ADORecordSet.LockType = adLockReadOnly
  Call ADORecordSet.Open("SELECT 'OK' SRV_TEST", mADOConnection)
  If ADORecordSet!SRV_TEST = "OK" Then
    mPrevConnectionString = mADOConnection.ConnectionString
    mPrevProvider = mADOConnection.Provider
    mPrevTimeOut = mADOConnection.ConnectionTimeout
    attempts = 0
    Exit Sub
  End If
errCheck:
  If attempts > 10 Then
    Exit Sub
  End If
  attempts = attempts + 1
  Resume ErrClear
ErrClear:
    If mPrevConnectionString <> "" Then
      If mADOConnection.State <> adStateClosed Then
        mADOConnection.Close
      End If
      Set mADOConnection = Nothing
      Set mADOConnection = New ADODB.Connection
      mADOConnection.Provider = mPrevProvider
      mADOConnection.ConnectionTimeout = mPrevTimeOut
      mADOConnection.CommandTimeout = mPrevTimeOut
      Call mADOConnection.Open(mPrevConnectionString)

    End If
End Sub


Public Function CheckConnection() As Boolean
  Dim ADORecordSet As RecordSet
  Set ADORecordSet = New ADODB.RecordSet
  If mADOConnection Is Nothing Then
    CheckConnection = False
    Exit Function
  End If
  If mADOConnection.State = adStateClosed Then
    CheckConnection = False
    Exit Function
  End If
  On Error GoTo errCheck
  ADORecordSet.CursorType = adOpenForwardOnly
  ADORecordSet.LockType = adLockReadOnly
  Call ADORecordSet.Open("SELECT 'OK' SRV_TEST", mADOConnection)
  If ADORecordSet!SRV_TEST = "OK" Then
    CheckConnection = True
    ADORecordSet.Close
    Set ADORecordSet = Nothing
    Exit Function
  End If
errCheck:
  Resume ErrClear
ErrClear:
  On Error Resume Next
  ADORecordSet.Close
  Set ADORecordSet = Nothing
  CheckConnection = False
End Function


Public Property Get IsolationLevel() As Long
  If mADOConnection Is Nothing Then
    IsolationLevel = adXactUnspecified
  Else
    IsolationLevel = mADOConnection.IsolationLevel
  End If
End Property

Public Property Let IsolationLevel(ByVal v As Long)
  If Not mADOConnection Is Nothing Then
     mADOConnection.IsolationLevel = v
  End If
End Property

Public Function ServerLogIn() As Boolean
   If mADOConnection Is Nothing Then
       On Error Resume Next
       If ADOLogin(Server, DataBaseName, UserName, Password, 100, Integrated) Then
          SetConnection
       End If
   End If
   ServerLogIn = Not (mADOConnection Is Nothing)
End Function


Private Function ADOLogin(ByVal Server As String, ByVal DataBase As String, ByVal User As String, ByVal Pass As String, ByVal aLoginTimeOut As Integer, ByVal Integrated As Boolean) As Boolean
  Dim mConnectString As String
  On Error GoTo bye
  ADOLogin = False
  Set mADOConnection = New ADODB.Connection
  
  If Integrated Then
    mConnectString = "Server=" + Server + ";DataBase=" + DataBase + ";Trusted_Connection=yes"
  Else
    mConnectString = "Server=" + Server + ";DataBase=" + DataBase + ";UID=" + User + ";Pwd=" + Pass + ";"
  End If
  
  mADOConnection.Provider = "sqloledb"
  mADOConnection.ConnectionTimeout = aLoginTimeOut
  mADOConnection.CommandTimeout = aLoginTimeOut
  Call mADOConnection.Open(mConnectString)
  ADOLogin = (mADOConnection.State = adStateOpen)
  Exit Function
bye:
   Set mADOConnection = Nothing
   App.LogEvent Err.Description, 1
   'Err.Raise Err.Number, Err.Source, Err.Description
End Function

'phisical ADO connection close
'##ModelId=3B8F800E019A
Private Sub ADOLogOff()
   On Error Resume Next
    mADOConnection.Close
    Set mADOConnection = Nothing
End Sub

