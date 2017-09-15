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
Attribute VB_Exposed = True
Attribute VB_HelpID = 10
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
Private mvarApplication As Session
Private InTransaction As Boolean
Private mPrevConnectionString As String
Private mPrevProvider As String
Private mPrevTimeOut As Long

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
  Application.Logger.Message ADOErrors & " >>select * from " & TableName
  Resume bye2
bye2:

  CheckState
End Function

' ссылка на Session
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  BeginTrans
'  CheckConnection
'  CheckState
'  CommitTrans
'  Execute
'  ExecuteProc
'  Init
'  IsInTransaction
'  IsolationLevel
'  OpenRecordset
'  RollbackTrans
'  SetConnection
'Example:
' dim variable as Object
' Set variable = me.Application
Property Get Application() As Session
Attribute Application.VB_HelpID = 15
   Set Application = mvarApplication
End Property

' инициализация
'Parameters:
'Application - ссылка на Session
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'  Application
'  BeginTrans
'  CheckConnection
'  CheckState
'  CommitTrans
'  Execute
'  ExecuteProc
'  IsInTransaction
'  IsolationLevel
'  OpenRecordset
'  RollbackTrans
'  SetConnection
'Example:
' dim variable as Variant
' variable = me.Init(<параметры>)
' Set variable = me.Init(<параметры>)
Function Init(Application As Session)
Attribute Init.VB_HelpID = 60
   Set mvarApplication = Application
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
    Set mvarApplication = Nothing
End Sub

' инициализировать объект соединением ADODB.Connection
'Parameters:
'[IN][OUT]  cn , тип параметра: ADODB.Connection  - ...
'See Also:
'  Application
'  BeginTrans
'  CheckConnection
'  CheckState
'  CommitTrans
'  Execute
'  ExecuteProc
'  Init
'  IsInTransaction
'  IsolationLevel
'  OpenRecordset
'  RollbackTrans
'Example:
'  call me.SetConnection(<параметры>)
Public Sub SetConnection(cn As ADODB.Connection)
Attribute SetConnection.VB_HelpID = 90
    Set mADOConnection = cn
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
'Returns:
'  объект класса ADODB.RecordSet
'  ,или Nothing
'See Also:
'  Application
'  BeginTrans
'  CheckConnection
'  CheckState
'  CommitTrans
'  Execute
'  ExecuteProc
'  Init
'  IsInTransaction
'  IsolationLevel
'  RollbackTrans
'  SetConnection
'Example:
' dim variable as ADODB.RecordSet
' Set variable = me.OpenRecordset(<параметры>)
Public Function OpenRecordset(ByVal SqlString As String) As ADODB.RecordSet
Attribute OpenRecordset.VB_HelpID = 80
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
  
  On Error GoTo tryProc
  DebugOutput SqlString
  Call ADORecordSet.Open(SqlString, mADOConnection)
  GoTo NormalFlow
  
  
tryProc:
  
  CheckState

  If InStr(1, SqlString, "select", vbTextCompare) = 0 Then
    On Error GoTo bye
    Dim nv As NamedValues
    Set nv = New NamedValues
    Set OpenRecordset = ExecuteRSProc(SqlString, nv)
    Exit Function
  Else
    GoTo bye
  End If
  
NormalFlow:
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
  Debug.Print ADOErrors
  'Application.Logger.Message ADOErrors & vbCrLf & "[" & SqlString & "]"
   
  Set OpenRecordset = Nothing
  Set ADORecordSet = Nothing
  
  Resume bye2
bye2:
  CheckState
  On Error GoTo 0
  DebugOutput ADOErrors
  Err.Raise 10000, "MTZSession.OpenRecordset", ADOErrors & vbCrLf & "[" & SqlString & "]"
End Function


' открыть RecordSet
'Parameters:
'SqlString - запрос
'Returns:
'Returns:
'  объект класса ADODB.RecordSet
'  ,или Nothing
'See Also:
'  Application
'  BeginTrans
'  CheckConnection
'  CheckState
'  CheckState2
'  CommitTrans
'  Execute
'  ExecuteProc
'  ExecuteRSProc
'  Init
'  IsInTransaction
'  IsolationLevel
'  OpenRecordset
'  RollbackTrans
'  SetConnection
'Example:
' dim variable as ADODB.RecordSet
' Set variable = me.OpenProcRecordset(...параметры...)
Public Function OpenProcRecordset(ByVal SqlString As String) As ADODB.RecordSet
Attribute OpenProcRecordset.VB_HelpID = 75
  On Error Resume Next
  Dim ADORecordSet As ADODB.RecordSet
  If mADOConnection Is Nothing Then Exit Function
  If mADOConnection.State <> adStateOpen Then CheckState
  If mADOConnection.State <> adStateOpen Then Exit Function
  
  On Error GoTo bye
  
  DebugOutput SqlString
  On Error Resume Next
  
  Dim ADOCommand As New ADODB.Command
  Dim ADOPar As ADODB.Parameter
  Set ADOCommand.ActiveConnection = mADOConnection
  ADOCommand.CommandType = adCmdStoredProc
  ADOCommand.CommandText = "GetMTZData"
  
  Dim I As Long
  For I = 1 To ADOCommand.Parameters.Count
    If (ADOCommand.Parameters.Item(I).Name = "@Query") Then
      ADOCommand.Parameters.Item(I).Value = SqlString
      Exit For
    End If
  Next
  
  Set ADORecordSet = ADOCommand.Execute
  Set OpenProcRecordset = ADORecordSet
  Set ADORecordSet = Nothing
  Exit Function
bye:
  Dim ADOErrors As String
  Dim e As ADODB.Error
  ADOErrors = ""
  For Each e In mADOConnection.Errors
    ADOErrors = ADOErrors & "[" & e.NativeError & "]" & e.Description & vbCrLf
  Next
  Debug.Print ADOErrors
  'Application.Logger.Message ADOErrors & vbCrLf & "[" & SqlString & "]"
   
  Set OpenProcRecordset = Nothing
  Set ADORecordSet = Nothing
  
  Resume bye2
bye2:
  CheckState
  On Error GoTo 0
  DebugOutput ADOErrors
  Err.Raise 10000, "MTZSession.OpenRecordset", ADOErrors & vbCrLf & "[" & SqlString & "]"
End Function

' выполнить SQL запрос
'Parameters:
'SqlString - запрос
'Returns:
'true- запрос успешно выполнен
'See Also:
'  Application
'  BeginTrans
'  CheckConnection
'  CheckState
'  CommitTrans
'  ExecuteProc
'  Init
'  IsInTransaction
'  IsolationLevel
'  OpenRecordset
'  RollbackTrans
'  SetConnection
'Example:
' dim variable as Boolean
' variable = me.Execute(<параметры>)
Public Function Execute(ByVal SqlString As String) As Boolean
Attribute Execute.VB_HelpID = 45
  If mADOConnection Is Nothing Then Exit Function
  If mADOConnection.State <> adStateOpen Then CheckState
  If mADOConnection.State <> adStateOpen Then Exit Function
  
  On Error GoTo bye
  DebugOutput SqlString
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
  Application.Logger.Message ADOErrors & vbCrLf & "[" & SqlString & "]"

  Execute = False
  Resume bye2
bye2:
  
  CheckState
  On Error GoTo 0
  Err.Raise 10000, "MTZSession.Execute", ADOErrors & vbCrLf & "[" & SqlString & "]"
End Function

' выполнить хранимую процедуру
'Parameters:
'SqlString - команда
'Parameter - параметры хранимой процедуры, если есть параметр CURRENTUSER , то
'его значение будет установлено в Main.CurrentUser
'Returns:
'true - хранимая процедура успешно выполнена
'See Also:
'  Application
'  BeginTrans
'  CheckConnection
'  CheckState
'  CommitTrans
'  Execute
'  Init
'  IsInTransaction
'  IsolationLevel
'  OpenRecordset
'  RollbackTrans
'  SetConnection
'Example:
' dim variable as Boolean
' variable = me.ExecuteProc(<параметры>)
Public Function ExecuteProc(ByVal SqlString As String, Parameter As NamedValues) As Boolean
Attribute ExecuteProc.VB_HelpID = 50
  Dim ADOCommand As New ADODB.Command
  Dim NumRecs As Integer
  Dim Value  As Variant
  Dim n As String
  Dim I As Long
  Dim ADOErrors As String
  Dim e As ADODB.Error
'  Dim mADOConnection As ADODB.Connection
  
  On Error Resume Next
    
'  Set mADOConnection = Nothing
'  Set mADOConnection = New ADODB.Connection
'  mADOConnection.Provider = mPrevProvider
'
'  mADOConnection.ConnectionTimeout = mPrevTimeOut
'  mADOConnection.CommandTimeout = mPrevTimeOut
'  Call mADOConnection.Open(Application.GetCNString)
'
  
  If mADOConnection Is Nothing Then Exit Function
  
  If mADOConnection.State <> adStateOpen Then CheckState2 mADOConnection
  If mADOConnection.State <> adStateOpen Then Exit Function
  
  'Debug.Print SqlString & "(" & vbCrLf
  On Error GoTo bye
  
  ADOCommand.CommandType = adCmdStoredProc
  ADOCommand.CommandText = SqlString
  
  Set ADOCommand.ActiveConnection = mADOConnection
  On Error Resume Next
  
  If Not Application.IsORACLE Then
    If Not ADOCommand Is Nothing Then
      If Not ADOCommand.Parameters Is Nothing Then
          Err.Clear
          I = 0
          For I = 1 To ADOCommand.Parameters.Count - 1 'Step 1
            If I = 0 Then Exit For
            n = UCase(ADOCommand.Parameters.Item(I).Name)
            If n = UCase(Application.SymbolAt & "CURSESSION") Then
               If Application.sessionid <> "" Then
                ADOCommand.Parameters.Item(I).Value = Application.sessionid
               Else
               ADOCommand.Parameters.Item(I).Value = Null
               End If
            Else
              If Parameter.Item(n) Is Nothing Then
                Err.Clear
              Else
                If ADOCommand.Parameters.Item(I).Direction <> adParamReturnValue Then
                  If IsEmpty(Parameter.Item(n).Value) Then
                    Parameter.Item(n).Value = Null
                  Else
                    On Error Resume Next
                    Err.Clear
                    If Parameter.Item(n).Value = "" Then
                      If Err = 0 Then
                        Parameter.Item(n).Value = Null
                      End If
                    End If
                    Err.Clear
                  End If
                  ADOCommand.Parameters.Item(I).Value = Parameter.Item(n).Value
                  Select Case ADOCommand.Parameters.Item(I).Type
                  Case adVarChar, adChar, adVarWChar, adWChar
                    If Not IsNull(ADOCommand.Parameters.Item(I).Value) Then
                      If Len(ADOCommand.Parameters.Item(I).Value) > ADOCommand.Parameters.Item(I).Size Then
                        ADOCommand.Parameters.Item(I).Value = Left(ADOCommand.Parameters.Item(I).Value, ADOCommand.Parameters.Item(I).Size)
                      End If
                    End If
                  End Select
                  If Err.Number > 0 Then
                    Application.Logger.Message Err.Description
                  End If
                End If
              End If
            End If
            Err.Clear
            
          Next
      End If
    End If
  Else
        'ORALCE
      Dim param As ADODB.Parameter
      Dim bNeedAppendChunk As Boolean
      bNeedAppendChunk = False
      
'      If InStr(1, SqlString, "Photo") Then
'        Debug.Assert False
'        Debug.Assert True
'      End If
      
      'Choose work style, depends on ADO DB Provider
      ADOCommand.Parameters.Refresh
      If ADOCommand.Parameters.Count > 0 Then
        'We use new style
        Dim tmpParam As Object
        For I = 1 To Parameter.Count
            Set param = Nothing
            If Parameter.Item(I).ValueType = adLongVarBinary And Parameter.Item(I).ValueSize > 0 Then
                For Each tmpParam In ADOCommand.Parameters
                    If tmpParam.Name = Parameter.Item(I).TheName Then
                        Set param = tmpParam
                        Exit For
                    End If
                Next
                param.Value = ""
                bNeedAppendChunk = True
            Else
                For Each tmpParam In ADOCommand.Parameters
                    If tmpParam.Name = Parameter.Item(I).TheName Then
                        Set param = tmpParam
                        Exit For
                    End If
                Next
                If Not param Is Nothing Then
                    param.Value = Parameter.Item(I).Value
                End If
            End If
        Next
      Else
        'We use old style, dosn't work some features on empty blob fields
         I = 0
         For I = 1 To Parameter.Count
           If I = 0 Then Exit For
           Dim c() As Byte
           Dim VarEmpty As Variant
           If Parameter.Item(I).ValueType = adLongVarBinary And Parameter.Item(I).ValueSize > 32000 Then
               Set param = ADOCommand.CreateParameter(Parameter.Item(I).TheName, Parameter.Item(I).ValueType, Parameter.Item(I).ValueDirection, 0, "")
               ' Делаем пометку о том, что нужен AppendChunk для строки позже...
               bNeedAppendChunk = True
           Else
               Set param = ADOCommand.CreateParameter(Parameter.Item(I).TheName, Parameter.Item(I).ValueType, Parameter.Item(I).ValueDirection, Parameter.Item(I).ValueSize, Parameter.Item(I).Value)
           End If
           'Debug.Print Parameter.Item(I).TheName & "=>'" & Parameter.Item(I).Value & "',"
           ADOCommand.Parameters.Append param
           Err.Clear
        Next
    End If

     
  End If
  On Error GoTo bye
  
 ' Debug.Print ");" & vbCrLf
  ADOCommand.Execute
 
  On Error Resume Next
  
    If bNeedAppendChunk And UCase(Right(SqlString, 5)) = "_SAVE" Then
    
        'если не Save, то нафиг нужно...
        Dim sTableName As String
        Dim sFiledName As String
        'Перебираем параметры, ищем те, что нужно обновить...
        ' имя таблицы: =left(SqlString, instr(1,SqlString,"_save",vbTextCompare)-1)
        ' имя поля: =Right(Parameter.Item(I).TheName, len(Parameter.Item(I).TheName)-len(Application.SymbolAt))
        If InStrRev(SqlString, ".", -1, vbTextCompare) > 0 Then
            sTableName = Mid(SqlString, InStrRev(SqlString, ".", -1, vbTextCompare) + 1, Len(SqlString) - InStrRev(SqlString, ".", -1, vbTextCompare) - Len("_save"))
        Else
            sTableName = Left(SqlString, InStr(1, SqlString, "_save", vbTextCompare) - 1)
        End If
        I = 0
        Dim bUse
        For I = 1 To Parameter.Count
            If I = 0 Then Exit For
            If Parameter.Item(I).ValueType = adLongVarBinary And Parameter.Item(I).ValueSize > 0 Then
                'Этот тот самый параметр, теперь ищем строку и чанкаем...
                'идентификатор строки: Application.SymbolAt + имя таблицы + "id"
                Dim j As Long
                Dim RowID As String
                RowID = ""
                For j = 1 To Parameter.Count
                    If UCase(Parameter.Item(j).TheName) = UCase(Application.SymbolAt + sTableName + "id") Then
                        RowID = Parameter.Item(j).Value
                        Exit For
                    End If
                Next
                If RowID <> "" Then
                    Dim objChunkRS As ADODB.RecordSet
                    Set objChunkRS = Nothing
                    Set objChunkRS = New ADODB.RecordSet
                    Set objChunkRS.ActiveConnection = mADOConnection
                    objChunkRS.CursorLocation = adUseClient
                    objChunkRS.CursorType = adOpenKeyset ' = adOpenStatic
                    objChunkRS.LockType = adLockOptimistic '  adLockBatchOptimistic
                    objChunkRS.Open "select * from " + sTableName + " where " + sTableName + "id='" + RowID + "'"
                    
                    If Not objChunkRS Is Nothing Then
                        If Not objChunkRS.EOF And Not objChunkRS.BOF Then
                            Call objChunkRS.Fields(Right(Parameter.Item(I).TheName, Len(Parameter.Item(I).TheName) - Len(Application.SymbolAt))).AppendChunk(Parameter.Item(I).Value)
                            objChunkRS.Update '"TheImage"
                            
                            objChunkRS.Close
'                            Else
'                                Dim sStream As ADODB.Stream
'                                Set sStream = New ADODB.Stream
'                                sStream.Type = adTypeBinary
'                                sStream.Open '(Parameter.Item(I).Value)
'                                'sStream.Write (Parameter.Item(I).Value)
'                                sStream.LoadFromFile ("c:\1a2a.jpg")
'                                objChunkRS.Fields(Right(Parameter.Item(I).TheName, Len(Parameter.Item(I).TheName) - Len(Application.SymbolAt))).Value = sStream.Read
'                                objChunkRS.Update
'                                objChunkRS.Close
'                                sStream.Close
''                                Dim lngOffset As Long
''                                Dim iSize As Long
''                                Dim conChunkSize As Long
'                                Dim varChunk As Variant
'                                Dim sFieldName As String
'                                sFieldName = Right(Parameter.Item(I).TheName, Len(Parameter.Item(I).TheName) - Len(Application.SymbolAt))
'                                iSize = Parameter.Item(I).ValueSize
'                                lngOffset = 0 ' Reset offset
'                                conChunkSize = 6000
'                                Do While lngOffset < iSize
'                                   varChunk = LeftB(RightB(Parameter.Item(I).Value, Parameter.Item(I).ValueSize - lngOffset), conChunkSize)
'                                   Debug.Print Err.Description
'                                   objChunkRS.Fields(sFieldName).AppendChunk varChunk
'                                   Debug.Print Err.Description
'                                   lngOffset = lngOffset + conChunkSize
'                                   'objChunkRS.Update
'                                   'Debug.Print Err.Description
'                                Loop
'                                objChunkRS.Update
'                                objChunkRS.Update sFieldName, Parameter.Item(I).Value
'                                objChunkRS.Close
'                                Debug.Print Err.Description

'                            End If
                        End If
                    End If
                    
                    
                End If
            End If
        Next I
    End If
  
  For I = 0 To ADOCommand.Parameters.Count - 1
     If Err.Number > 0 Then Exit For
    If ADOCommand.Parameters.Item(I).Direction <> adParamReturnValue Then
      n = ADOCommand.Parameters.Item(I).Name
      If Parameter.Item(n) Is Nothing Then
       'debugoutput n
      Else
        Parameter.Item(n).Value = ADOCommand.Parameters(I).Value
      End If
    End If
    Err.Clear
  Next
  ExecuteProc = True
  ADOErrors = ""
  For Each e In mADOConnection.Errors
    ADOErrors = ADOErrors & "[" & e.NativeError & "]" & e.Description & vbCrLf
  Next
  
  Dim ret As NamedValue
  
  Set ADOCommand.ActiveConnection = Nothing
  Set ADOCommand = Nothing
  Exit Function
bye:
  'Resume
  Set ADOCommand = Nothing
  
  ADOErrors = Err.Description
  For Each e In mADOConnection.Errors
    ADOErrors = ADOErrors & "[" & e.NativeError & "]" & e.Description & vbCrLf
  Next
  Application.Logger.Message ADOErrors & vbCrLf & "[" & SqlString & "]"
  Debug.Print ADOErrors
  ExecuteProc = False
  
  Resume bye2
bye2:
  CheckState2 mADOConnection
  On Error GoTo 0
  Err.Raise 10000, "MTZSession.ExecuteProc", ADOErrors & vbCrLf & "[" & SqlString & "]", 1
  Exit Function
  Resume
End Function
' выполнить процедуру с  возвратом рекодсета
'Parameters:
'[IN]   SqlString , тип параметра: String - запрос,
'[IN][OUT]   Parameter , тип параметра: NamedValues  - параметры
'Returns:
'  объект класса RecordSet - результирующие записи
'  ,или Nothing
'See Also:
'  Application
'  BeginTrans
'  CheckConnection
'  CheckState
'  CheckState2
'  CommitTrans
'  Execute
'  ExecuteProc
'  Init
'  IsInTransaction
'  IsolationLevel
'  OpenProcRecordset
'  OpenRecordset
'  RollbackTrans
'  SetConnection
'Example:
' dim variable as RecordSet
' Set variable = me.ExecuteRSProc(...параметры...)
Public Function ExecuteRSProc(ByVal SqlString As String, Parameter As NamedValues) As RecordSet
Attribute ExecuteRSProc.VB_HelpID = 55
  Dim result As ADODB.RecordSet
  Dim ADOCommand As New ADODB.Command
  Dim NumRecs As Integer
  Dim Value  As Variant
  Dim n As String
  Dim I As Long
  Dim ADOErrors As String
  Dim e As ADODB.Error
  On Error Resume Next
  If mADOConnection Is Nothing Then Exit Function
  
  If mADOConnection.State <> adStateOpen Then CheckState
  If mADOConnection.State <> adStateOpen Then Exit Function
  
  'Debug.Print SqlString & "(" & vbCrLf
  On Error GoTo bye
  
  ADOCommand.CommandType = adCmdStoredProc
  ADOCommand.CommandText = Trim(SqlString)
  
  
  Set ADOCommand.ActiveConnection = mADOConnection
  
  On Error Resume Next
  
  If Not Application.IsORACLE Then
    If Not ADOCommand Is Nothing Then
      If Not ADOCommand.Parameters Is Nothing Then
          Err.Clear
          I = 0
          For I = 1 To ADOCommand.Parameters.Count - 1 'Step 1
            If I = 0 Then Exit For
            n = UCase(ADOCommand.Parameters.Item(I).Name)
            If n = UCase(Application.SymbolAt & "CURSESSION") Then
               If Application.sessionid <> "" Then
                ADOCommand.Parameters.Item(I).Value = Application.sessionid
               Else
               ADOCommand.Parameters.Item(I).Value = Null
               End If
            Else
              If Parameter.Item(n) Is Nothing Then
                Err.Clear
              Else
                If ADOCommand.Parameters.Item(I).Direction <> adParamReturnValue Then
                  If IsEmpty(Parameter.Item(n).Value) Then
                    Parameter.Item(n).Value = Null
                  Else
                    On Error Resume Next
                    Err.Clear
                    If Parameter.Item(n).Value = "" Then
                      If Err = 0 Then
                        Parameter.Item(n).Value = Null
                      End If
                    End If
                    Err.Clear
                  End If
                  ADOCommand.Parameters.Item(I).Value = Parameter.Item(n).Value
                  Select Case ADOCommand.Parameters.Item(I).Type
                  Case adVarChar, adChar, adVarWChar, adWChar
                    If Not IsNull(ADOCommand.Parameters.Item(I).Value) Then
                      If Len(ADOCommand.Parameters.Item(I).Value) > ADOCommand.Parameters.Item(I).Size Then
                        ADOCommand.Parameters.Item(I).Value = Left(ADOCommand.Parameters.Item(I).Value, ADOCommand.Parameters.Item(I).Size)
                      End If
                    End If
                  End Select
                  If Err.Number > 0 Then
                    Application.Logger.Message Err.Description
                  End If
                End If
              End If
            End If
            Err.Clear
            
          Next
      End If
    End If
  Else
      Dim param As ADODB.Parameter
      I = 0
      For I = 1 To Parameter.Count
        If I = 0 Then Exit For
        Set param = ADOCommand.CreateParameter(Parameter.Item(I).TheName, Parameter.Item(I).ValueType, Parameter.Item(I).ValueDirection, Parameter.Item(I).ValueSize, Parameter.Item(I).Value)
        Debug.Print Parameter.Item(I).TheName & "=>'" & Parameter.Item(I).Value & "',"
        ADOCommand.Parameters.Append param
        Err.Clear
     Next
  End If
  On Error GoTo bye
  
 ' Debug.Print ");" & vbCrLf
  Set result = ADOCommand.Execute
 
  On Error Resume Next
  
  For I = 0 To ADOCommand.Parameters.Count - 1
     If Err.Number > 0 Then Exit For
    If ADOCommand.Parameters.Item(I).Direction <> adParamReturnValue Then
      n = ADOCommand.Parameters.Item(I).Name
      If Parameter.Item(n) Is Nothing Then
       'debugoutput n
      Else
        Parameter.Item(n).Value = ADOCommand.Parameters(I).Value
      End If
    End If
    Err.Clear
  Next
  ADOErrors = ""
  For Each e In mADOConnection.Errors
    ADOErrors = ADOErrors & "[" & e.NativeError & "]" & e.Description & vbCrLf
  Next
  
  Dim ret As NamedValue
  
  Set ADOCommand.ActiveConnection = Nothing
  Set ADOCommand = Nothing
  
  Set ExecuteRSProc = result
  Exit Function
bye:
  'Resume
  Set ADOCommand = Nothing
  
  ADOErrors = Err.Description
  For Each e In mADOConnection.Errors
    ADOErrors = ADOErrors & "[" & e.NativeError & "]" & e.Description & vbCrLf
  Next
  Application.Logger.Message ADOErrors & vbCrLf & "[" & SqlString & "]"
  Debug.Print ADOErrors
  
  Resume bye2
bye2:
  CheckState
  On Error GoTo 0
  Err.Raise 10000, "MTZSession.ExecuteProc", ADOErrors & vbCrLf & "[" & SqlString & "]", 1
End Function

' начать транзакцию
' See Also:
'InTransaction
'Parameters:
' параметров нет
'Returns:
'  значение типа Long
'See Also:
'  Application
'  CheckConnection
'  CheckState
'  CommitTrans
'  Execute
'  ExecuteProc
'  Init
'  IsInTransaction
'  IsolationLevel
'  OpenRecordset
'  RollbackTrans
'  SetConnection
'Example:
' dim variable as Long
'  variable = me.BeginTrans()
Public Function BeginTrans() As Long
Attribute BeginTrans.VB_HelpID = 20
  
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
'Parameters:
' параметров нет
'See Also:
'  Application
'  BeginTrans
'  CheckConnection
'  CheckState
'  Execute
'  ExecuteProc
'  Init
'  IsInTransaction
'  IsolationLevel
'  OpenRecordset
'  RollbackTrans
'  SetConnection
'Example:
'  call me.CommitTrans()
Public Sub CommitTrans()
Attribute CommitTrans.VB_HelpID = 40
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
'Parameters:
' параметров нет
'See Also:
'  Application
'  BeginTrans
'  CheckConnection
'  CheckState
'  CommitTrans
'  Execute
'  ExecuteProc
'  Init
'  IsInTransaction
'  IsolationLevel
'  OpenRecordset
'  SetConnection
'Example:
'  call me.RollbackTrans()
Public Sub RollbackTrans()
Attribute RollbackTrans.VB_HelpID = 85
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
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'  Application
'  BeginTrans
'  CheckConnection
'  CheckState
'  CommitTrans
'  Execute
'  ExecuteProc
'  Init
'  IsolationLevel
'  OpenRecordset
'  RollbackTrans
'  SetConnection
'Example:
' dim variable as Boolean
'  variable = me.IsInTransaction()
Public Function IsInTransaction() As Boolean
Attribute IsInTransaction.VB_HelpID = 65
  IsInTransaction = InTransaction
End Function

' проверить состояние соединения с БД
'Parameters:
' параметров нет
'See Also:
'  Application
'  BeginTrans
'  CheckConnection
'  CommitTrans
'  Execute
'  ExecuteProc
'  Init
'  IsInTransaction
'  IsolationLevel
'  OpenRecordset
'  RollbackTrans
'  SetConnection
'Example:
'  call me.CheckState()
Public Sub CheckState()
Attribute CheckState.VB_HelpID = 30
  Static attempts As Integer
  
  'attempts = 0
  Dim ADORecordSet As RecordSet
  Set ADORecordSet = New ADODB.RecordSet
  On Error GoTo errCheck
  ADORecordSet.CursorType = adOpenForwardOnly
  ADORecordSet.LockType = adLockReadOnly
  If UCase(Application.GetProvider) = "SQLOLEDB" Then
    Call ADORecordSet.Open("SELECT 'OK' SRV_TEST", mADOConnection)
  Else
    Call ADORecordSet.Open("SELECT 'OK' SRV_TEST from sys.dual", mADOConnection)
  End If
  If ADORecordSet!SRV_TEST = "OK" Then
    mPrevConnectionString = mADOConnection.ConnectionString
    mPrevProvider = mADOConnection.Provider
    mPrevTimeOut = mADOConnection.ConnectionTimeout
    attempts = 0
    
     ADORecordSet.Close
     
    Call ADORecordSet.Open("SELECT @@TRANCOUNT CNT", mADOConnection)
    
     If ADORecordSet!cnt > 0 Then
        On Error Resume Next
        mADOConnection.Execute ("ROLLBACK TRAN")
      End If
    
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
      Call mADOConnection.Open(Application.GetCNString)
      
      On Error Resume Next
      
      Execute ("CREATE TABLE [#Pager] (" & _
        "[PagerID] [uniqueidentifier] NOT NULL ," & _
        "[ViewID] [uniqueidentifier] NOT NULL ," & _
        "[Sequence] [numeric](18, 0) IDENTITY (1, 1) NOT NULL ," & _
        "[SessionID] [uniqueidentifier] NULL ," & _
        "PRIMARY KEY  CLUSTERED" & _
        "(" & _
        "  [PagerID]," & _
        "  [ViewID]" & _
        ")" & _
        ")")
        
        MsgBox Now & ": Соединение с базой установлено повторно." & vbCrLf & "Необходимо обновить журналы и списки в окнах поиска.", vbInformation, "Внимание"

    End If
End Sub

' проверить состояние соединения с БД
'Parameters:
'[IN][OUT]  mADOConnection , тип параметра: ADODB.Connection  - ...
'See Also:
'  Application
'  BeginTrans
'  CheckConnection
'  CheckState
'  CommitTrans
'  Execute
'  ExecuteProc
'  ExecuteRSProc
'  Init
'  IsInTransaction
'  IsolationLevel
'  OpenProcRecordset
'  OpenRecordset
'  RollbackTrans
'  SetConnection
'Example:
'  call me.CheckState2(...параметры...)
Public Sub CheckState2(mADOConnection As ADODB.Connection)
Attribute CheckState2.VB_HelpID = 35
  Static attempts As Integer
  
  'attempts = 0
  Dim ADORecordSet As RecordSet
  Set ADORecordSet = New ADODB.RecordSet
  On Error GoTo errCheck
  ADORecordSet.CursorType = adOpenForwardOnly
  ADORecordSet.LockType = adLockReadOnly
  If UCase(Application.GetProvider) = "SQLOLEDB" Then
    Call ADORecordSet.Open("SELECT 'OK' SRV_TEST", mADOConnection)
  Else
    Call ADORecordSet.Open("SELECT 'OK' SRV_TEST from sys.dual", mADOConnection)
  End If
  If ADORecordSet!SRV_TEST = "OK" Then
    mPrevConnectionString = mADOConnection.ConnectionString
    mPrevProvider = mADOConnection.Provider
    mPrevTimeOut = mADOConnection.ConnectionTimeout
    attempts = 0
    
    ADORecordSet.Close
    Call ADORecordSet.Open("SELECT @@TRANCOUNT CNT", mADOConnection)
    
      If ADORecordSet!cnt > 0 Then
        On Error Resume Next
            mADOConnection.Execute ("ROLLBACK TRAN")
      End If
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
      Call mADOConnection.Open(Application.GetCNString)
      
      On Error Resume Next
      
'      Execute ("CREATE TABLE [#Pager] (" & _
'        "[PagerID] [uniqueidentifier] NOT NULL ," & _
'        "[ViewID] [uniqueidentifier] NOT NULL ," & _
'        "[Sequence] [numeric](18, 0) IDENTITY (1, 1) NOT NULL ," & _
'        "[SessionID] [uniqueidentifier] NULL ," & _
'        "PRIMARY KEY  CLUSTERED" & _
'        "(" & _
'        "  [PagerID]," & _
'        "  [ViewID]" & _
'        ")" & _
'        ")")
'
'        MsgBox Now & ": Соединение с базой установлено повторно." & vbCrLf & "Необходимо обновить журналы и списки в окнах поиска.", vbInformation, "Внимание"

    End If
End Sub

'проверка соединения
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  - есть
'   false -
'See Also:
'  Application
'  BeginTrans
'  CheckState
'  CommitTrans
'  Execute
'  ExecuteProc
'  Init
'  IsInTransaction
'  IsolationLevel
'  OpenRecordset
'  RollbackTrans
'  SetConnection
'Example:
' dim variable as Boolean
'  variable = me.CheckConnection()
Public Function CheckConnection() As Boolean
Attribute CheckConnection.VB_HelpID = 25
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
'уровень изоляции для сесии
'Parameters:
' параметров нет
'Returns:
'  значение типа Long
'See Also:
'  Application
'  BeginTrans
'  CheckConnection
'  CheckState
'  CommitTrans
'  Execute
'  ExecuteProc
'  Init
'  IsInTransaction
'  OpenRecordset
'  RollbackTrans
'  SetConnection
'Example:
' dim variable as Long
' variable = me.IsolationLevel
Public Property Get IsolationLevel() As Long
Attribute IsolationLevel.VB_HelpID = 70
  If mADOConnection Is Nothing Then
    IsolationLevel = adXactUnspecified
  Else
    IsolationLevel = mADOConnection.IsolationLevel
  End If
End Property
'уровень изоляции для сесии
'Parameters:
'[IN]   v , тип параметра: Long  - уровень
'See Also:
'  Application
'  BeginTrans
'  CheckConnection
'  CheckState
'  CommitTrans
'  Execute
'  ExecuteProc
'  Init
'  IsInTransaction
'  OpenRecordset
'  RollbackTrans
'  SetConnection
'Example:
' dim value as Variant
' value = <значение>
' me.IsolationLevel = value
Public Property Let IsolationLevel(ByVal v As Long)
  If Not mADOConnection Is Nothing Then
     mADOConnection.IsolationLevel = v
  End If
End Property

