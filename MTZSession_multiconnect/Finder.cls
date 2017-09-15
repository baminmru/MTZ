VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Finder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 80
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit
'Утилиты для поиска


'операции допустимые при поиске
Public Enum FinderOP
  OpEQ 'равно
  OpNE 'не равно
  OpLE 'меньше или равно
  OpLT 'меньше
  OpGE 'больше или равно
  OpGT 'больше
  OpLIKE 'строка включает значение
  OpNULL 'поле содержит пустое значение
  OpNOT_NULL 'поле содержит не пустое значение
  OpLIKE_LEFT 'строка начинается с значения
  OpLIKE_RIGHT 'строка заканчивается значением
  OpSTR_EQ 'равно строковому значению
  OpSTR_NE 'не равно строковому значению
  OpSTR_LT 'меньше строкового значения
  OpSTR_LE 'меньше или равно строкового значения
  OpSTR_GE 'больше или равно строкового значения
  OpSTR_GT 'больше или равно строкового значения
  OpIN_NUMBERS 'значение входит в множество чисел
  OpIN_DATES 'значение входит в множество дат
  OpIN_STRINGS 'значение входит в множество строк
  OpIN_RESULT 'значения находятся в подмножестве QUERYRESULT
  OpLIKE_EXACT 'строка соответствует маске
  OpNOT_IN_NUMBERS 'значение не входит в множество чисел
  OpNOT_IN_DATES 'значение не входит в множество дат
  OpNOT_IN_STRINGS 'значение не входит в множество строк
  OpNOT_IN_RESULT 'значения не находятся в подмножестве QUERYRESULT
  OpLEFT_BRACKET 'левая скобка
  OpRIGHT_BRACKET 'правая скобка
End Enum

Private m_session As Session
Friend Property Get Application() As Session
  Set Application = m_session
End Property

Friend Property Set Application(v As Session)
  Set m_session = v
End Property

' получить идентификаторы строк, которые удовлетворяют условию
'Parameters:
'[IN]   IDOut , тип параметра: String,
'[IN]   Table , тип параметра: String,
'[IN]   Field , тип параметра: String,
'[IN]   OP , тип параметра: FinderOP,
'[IN]   Value , тип параметра: Variant  - ...
'Returns:
'  значение типа Long
'See Also:
'  DropResults
'  FullTextSearch
'  GetResults
'  QR_AND_QR
'  QR_OR_QR
'  RowsToInstances
'  RowsToParents
'  USDate
'Example:
' dim variable as Long
' variable = me.FIND_IDS(<параметры>)
Public Function FIND_IDS(ByVal IDOut As String, ByVal Table As String, ByVal Field As String, ByVal OP As FinderOP, ByVal Value As Variant) As Long
Attribute FIND_IDS.VB_HelpID = 90
  Dim cond As String
  Dim cnt As Long
  
  cond = PackCondition(OP, Value, Field)
nxt:
  If cond <> "" Then
    cond = "insert into QUERYRESULT (QUERYRESULTID,RESULT) select distinct '" & IDOut & "'," & Table & "id from " & Table & " where " & cond
    If Application.TheDataSource.Execute(cond) Then
     Dim rs As RecordSet
     Set rs = Application.TheDataSource.OpenRecordset("select count(*) cnt from QUERYRESULT where QUERYRESULTID='" & IDOut & "'")
     cnt = rs!cnt
    End If
  End If
  FIND_IDS = cnt
  Exit Function
bye:
End Function


' преобразование условия в строку запроса
Friend Function PackCondition(ByVal OP As FinderOP, ByVal Value As Variant, ByVal FieldName As String) As String
    Dim cond As String
    Dim I As Long
    cond = ""
    Select Case OP
    Case OpEQ
      If IsNull(Value) Then
        cond = cond & "( " & FieldName & " is  null)"
      ElseIf IsDate(Value) Then
        cond = cond & "( " & FieldName & " = " & USDate(Value) & ")"
      ElseIf IsNumeric(Value) Then
        cond = cond & "( " & FieldName & " = " & Value & ")"
      Else
        cond = cond & "( " & FieldName & " = " & StrOrNull(Value) & ")"
      End If
      
    Case OpNE
    
      If IsNull(Value) Then
        cond = cond & "( not " & FieldName & " is  null)"
      ElseIf IsDate(Value) Then
        cond = cond & "( not " & FieldName & " = " & USDate(Value) & ")"
      ElseIf IsNumeric(Value) Then
        cond = cond & "( not " & FieldName & " = " & Value & ")"
      Else
        cond = cond & "( not " & FieldName & " = " & StrOrNull(Value) & ")"
      End If

    Case OpLT
      If IsNull(Value) Then
        cond = cond & "( " & FieldName & " is  null)"
      ElseIf IsDate(Value) Then
        cond = cond & "( " & FieldName & " < " & USDate(Value) & ")"
      ElseIf IsNumeric(Value) Then
        cond = cond & "( " & FieldName & " < " & Value & ")"
      Else
        cond = cond & "( " & FieldName & " < " & StrOrNull(Value) & ")"
      End If
      
    Case OpLE
      If IsNull(Value) Then
        cond = cond & "( " & FieldName & " is  null)"
      ElseIf IsDate(Value) Then
        cond = cond & "( " & FieldName & " <= " & USDate(Value) & ")"
      ElseIf IsNumeric(Value) Then
        cond = cond & "( " & FieldName & " <= " & Value & ")"
      Else
        cond = cond & "( " & FieldName & " <= " & StrOrNull(Value) & ")"
      End If

    Case OpGT
      If IsNull(Value) Then
        cond = cond & "( " & FieldName & " is  null)"
      ElseIf IsDate(Value) Then
        cond = cond & "( " & FieldName & " > " & USDate(Value) & ")"
      ElseIf IsNumeric(Value) Then
        cond = cond & "( " & FieldName & " > " & Value & ")"
      Else
        cond = cond & "( " & FieldName & " > " & StrOrNull(Value) & ")"
      End If

    Case OpGE
      If IsNull(Value) Then
        cond = cond & "( " & FieldName & " is  null)"
      ElseIf IsDate(Value) Then
        cond = cond & "( " & FieldName & " >= " & USDate(Value) & ")"
      ElseIf IsNumeric(Value) Then
        cond = cond & "( " & FieldName & " >= " & Value & ")"
      Else
        cond = cond & "( " & FieldName & " >= " & StrOrNull(Value) & ")"
      End If

    Case OpLIKE
      If IsNull(Value) Then
        cond = cond & "( " & FieldName & " is  null)"
      Else
        cond = cond & "( " & FieldName & " like '%" & Value & "%')"
      End If

    Case OpLIKE_EXACT
      If IsNull(Value) Then
        cond = cond & "( " & FieldName & " is  null)"
      Else
        cond = cond & "( " & FieldName & " like '" & Value & "')"
      End If

    Case OpNULL
      cond = cond & "( " & FieldName & " is null )"
    Case OpNOT_NULL
      cond = cond & "( not " & FieldName & " is null )"
    Case OpLIKE_LEFT
      If IsNull(Value) Then
          cond = cond & "( " & FieldName & " is  null)"
      Else
          cond = cond & "( " & FieldName & " like '" & Value & "%')"
      End If
    Case OpLIKE_RIGHT
      If IsNull(Value) Then
        cond = cond & "( " & FieldName & " is  null)"
      Else
        cond = cond & "( " & FieldName & " like '%" & Value & "')"
      End If
    Case OpSTR_EQ
          cond = cond & "( " & FieldName & " = " & StrOrNull(Value) & ")"
    Case OpSTR_NE
          cond = cond & "( not " & FieldName & " = " & StrOrNull(Value) & ")"
    Case OpSTR_LT
          cond = cond & "( " & FieldName & " < " & StrOrNull(Value) & ")"
    Case OpSTR_LE
          cond = cond & "( " & FieldName & " <= " & StrOrNull(Value) & ")"
    Case OpSTR_GE
          cond = cond & "( " & FieldName & " >= " & StrOrNull(Value) & ")"
    Case OpSTR_GT
          cond = cond & "( " & FieldName & " > " & StrOrNull(Value) & ")"
    Case OpIN_NUMBERS
     If IsArray(Value) Then
        On Error GoTo arr_n
        I = LBound(Value)
        On Error Resume Next

        cond = cond & "( " & FieldName & " in ("
        For I = LBound(Value) To UBound(Value)
          If I > LBound(Value) Then
            cond = cond & " , "
          End If
          cond = cond & Value(I)
        Next
        cond = cond & " ) )"
arr_n:
        Resume nxt
     Else
      cond = cond & "( " & FieldName & " = " & Value & ")"
     End If
     
     
     
    Case OpIN_DATES
      If IsArray(Value) Then
        On Error GoTo arr_d
        I = LBound(Value)
        On Error Resume Next
        cond = cond & "( " & FieldName & " in ("

        For I = LBound(Value) To UBound(Value)
          If I > LBound(Value) Then
            cond = cond & " , "
          End If
          cond = cond & USDate(Value(I))
        Next
        cond = cond & " ) )"
arr_d:
        Resume nxt
     Else
      cond = cond & "( " & FieldName & " = " & USDate(Value) & ")"
     End If
     
     
    Case OpIN_STRINGS
      If IsArray(Value) Then
        On Error GoTo arr_s
        I = LBound(Value)
        On Error Resume Next
        cond = cond & "( " & FieldName & " in ("
        On Error Resume Next
        For I = LBound(Value) To UBound(Value)
          If I > LBound(Value) Then
            cond = cond & " , "
          End If
          cond = cond & StrOrNull(Value(I))
        Next
        cond = cond & " ) )"
arr_s:
        Resume nxt

     Else
      cond = cond & "( " & FieldName & " = " & StrOrNull(Value) & ")"
     End If


    Case OpLEFT_BRACKET
      cond = cond & " ( "
      
    Case OpRIGHT_BRACKET
      cond = cond & " ) "


    Case OpIN_RESULT
      cond = cond & "( " & FieldName & " in ( select RESULT from QUERYRESULT where QUERYRESULTID=" & StrOrNull(Value) & "))"

    Case OpNOT_IN_DATES
      If IsArray(Value) Then
        On Error GoTo n_arr_d
        I = LBound(Value)
        On Error Resume Next
        cond = cond & "( " & FieldName & " not in ("

        For I = LBound(Value) To UBound(Value)
          If I > LBound(Value) Then
            cond = cond & " , "
          End If
          cond = cond & MakeMSSQLDate(Value(I))
        Next
        cond = cond & " ) )"
n_arr_d:
        Resume nxt
     Else
      cond = cond & "( " & FieldName & " <> " & MakeMSSQLDate(Value) & ")"
     End If

Case OpNOT_IN_STRINGS
      If IsArray(Value) Then
        On Error GoTo n_arr_s
        I = LBound(Value)
        On Error Resume Next
        cond = cond & "( " & FieldName & " not in ("
        On Error Resume Next
        For I = LBound(Value) To UBound(Value)
          If I > LBound(Value) Then
            cond = cond & " , "
          End If
          cond = cond & StrOrNull(Value(I))
        Next
        cond = cond & " ) )"
n_arr_s:
        Resume nxt
     Else
      cond = cond & "( " & FieldName & " <> " & StrOrNull(Value) & ")"
     End If
    
    Case OpNOT_IN_NUMBERS
     If IsArray(Value) Then
        On Error GoTo n_arr_n
        I = LBound(Value)
        On Error Resume Next

        cond = cond & "( " & FieldName & " not in ("
        For I = LBound(Value) To UBound(Value)
          If I > LBound(Value) Then
            cond = cond & " , "
          End If
          cond = cond & Value(I)
        Next
        cond = cond & " ) )"
n_arr_n:
        Resume nxt
     Else
      cond = cond & "( " & FieldName & " <> " & Value & ")"
     End If

    Case OpNOT_IN_RESULT
      cond = cond & "( " & FieldName & " not in ( select RESULT from QUERYRESULT where QUERYRESULTID='" & Value & "')"
    End Select
nxt:
   PackCondition = cond
End Function


Private Function StrOrNull(ByVal Value As String) As String
If Value = "" Then
  StrOrNull = " null"
Else
  StrOrNull = "'" & Replace(Value, "'", "''") & "'"
End If
End Function

'Дата в американском формате
'Parameters:
'[IN]   vArg , тип параметра: Variant  - дата
'Returns:
'  значение типа String
'See Also:
'  DropResults
'  FIND_IDS
'  FullTextSearch
'  GetResults
'  QR_AND_QR
'  QR_OR_QR
'  RowsToInstances
'  RowsToParents
'Example:
' dim variable as String
' variable = me.USDate(<параметры>)
Public Function USDate(ByVal vArg As Variant) As String
Attribute USDate.VB_HelpID = 125
On Error GoTo USDateErr
   Dim dtTemp As Date
        
    If IsDate(vArg) Then
        dtTemp = CDate(vArg)
        USDate = "'" & Format(Month(dtTemp), "00") & "/" & _
                 Format(Day(dtTemp), "00") & "/" & _
                 Format(Year(dtTemp), "0000") & " " & _
                 Format(Hour(dtTemp), "00") & ":" & _
                 Format(Minute(dtTemp), "00") & ":" & _
                 Format(Second(dtTemp), "00") & "'"
    Else
        dtTemp = Now
        USDate = "'" & Format(Month(dtTemp), "00") & "/" & _
                 Format(Day(dtTemp), "00") & "/" & _
                 Format(Year(dtTemp), "00") & "' " & _
                 Format(Hour(dtTemp), "00") & ":" & _
                 Format(Minute(dtTemp), "00") & ":" & _
                 Format(Second(dtTemp), "00") & "'"
    End If
    Exit Function
USDateErr:
    
End Function

'Удалить результаты поиска
'Parameters:
'[IN]   QueryID , тип параметра: String  - идентификатор результата
'See Also:
'  FIND_IDS
'  FullTextSearch
'  GetResults
'  QR_AND_QR
'  QR_OR_QR
'  RowsToInstances
'  RowsToParents
'  USDate
'Example:
'  call me.DropResults(<параметры>)
Public Sub DropResults(ByVal queryid As String)
Attribute DropResults.VB_HelpID = 85
  Application.TheDataSource.Execute ("delete from QUERYRESULT where QUERYRESULTID='" & queryid & "'")
End Sub

'Получить результаты запроса
'Parameters:
'[IN]   QueryID , тип параметра: String  - идентификатор результата
'Returns:
'  объект класса ADODB.RecordSet
'  ,или Nothing
'See Also:
'  DropResults
'  FIND_IDS
'  FullTextSearch
'  QR_AND_QR
'  QR_OR_QR
'  RowsToInstances
'  RowsToParents
'  USDate
'Example:
' dim variable as ADODB.RecordSet
' Set variable = me.GetResults(<параметры>)
Public Function GetResults(ByVal queryid As String) As ADODB.RecordSet
Attribute GetResults.VB_HelpID = 100
On Error GoTo bye

  Dim rs As RecordSet
  Set rs = Application.TheDataSource.OpenRecordset("select RESULT from QUERYRESULT where QUERYRESULTID='" & queryid & "'")
  Set rs.ActiveConnection = Nothing
  Set GetResults = rs
  Exit Function
bye:
End Function

'получить пересечение запросов
'Parameters:
'[IN]   QueryID1 , тип параметра: String идентификатор первого результата,
'[IN]   QueryID2 , тип параметра: String идентификатор второго результата,
'[IN]   QueryIDOut , тип параметра: String  - идентификатор пересечения
'Returns:
'  значение типа Long
'See Also:
'  DropResults
'  FIND_IDS
'  FullTextSearch
'  GetResults
'  QR_OR_QR
'  RowsToInstances
'  RowsToParents
'  USDate
'Example:
' dim variable as Long
' variable = me.QR_AND_QR(<параметры>)
Public Function QR_AND_QR(ByVal QueryID1 As String, ByVal QueryID2 As String, ByVal QueryIDOut As String) As Long
Attribute QR_AND_QR.VB_HelpID = 105
       Dim cursession As String
       On Error GoTo q_err

       Dim p As NamedValues
       Dim nvi As NamedValue
       Dim cnt As Long
       Set p = New NamedValues
       Set nvi = p.Add(Application.SymbolAt & "ID1", QueryID1)
       nvi.ORACLE_GUID
       Set nvi = p.Add(Application.SymbolAt & "ID2", QueryID2)
       nvi.ORACLE_GUID
       Set nvi = p.Add(Application.SymbolAt & "IDOUT", QueryIDOut)
       nvi.ORACLE_GUID
       Set nvi = p.Add(Application.SymbolAt & "CNT", cnt)
       nvi.ValueDirection = adParamOutput
       nvi.ValueType = adInteger

       Application.TheDataSource.ExecuteProc Application.KernelPrefix & "QR_and_QR", p

       QR_AND_QR = p.Item(Application.SymbolAt & "CNT").Value

       
       Exit Function
q_err:
       QR_AND_QR = 0
End Function

'объединение запросов
'Parameters:
'[IN]   QueryID1 , тип параметра: String идентификатор первого результата,
'[IN]   QueryID2 , тип параметра: String идентификатор второго результата,
'[IN]   QueryIDOut , тип параметра: String  - идентификатор объединения
'Returns:
'  значение типа Long
'See Also:
'  DropResults
'  FIND_IDS
'  FullTextSearch
'  GetResults
'  QR_AND_QR
'  RowsToInstances
'  RowsToParents
'  USDate
'Example:
' dim variable as Long
' variable = me.QR_OR_QR(<параметры>)
Public Function QR_OR_QR(ByVal QueryID1 As String, ByVal QueryID2 As String, ByVal QueryIDOut As String) As Long
Attribute QR_OR_QR.VB_HelpID = 110
       On Error GoTo q_err

       Dim p As NamedValues
       Dim nvi As NamedValue
       Dim cnt As Long
       Set p = New NamedValues
       Set nvi = p.Add(Application.SymbolAt & "ID1", QueryID1)
       nvi.ORACLE_GUID
       Set nvi = p.Add(Application.SymbolAt & "ID2", QueryID2)
       nvi.ORACLE_GUID
       Set nvi = p.Add(Application.SymbolAt & "IDOUT", QueryIDOut)
       nvi.ORACLE_GUID
       Set nvi = p.Add(Application.SymbolAt & "CNT", cnt)
       nvi.ValueDirection = adParamOutput
       nvi.ValueType = adInteger

       Application.TheDataSource.ExecuteProc Application.KernelPrefix & "QR_or_QR", p

       QR_OR_QR = p.Item(Application.SymbolAt & "CNT").Value
       Exit Function
q_err:
       QR_OR_QR = 0

End Function

'преобразовать идентификаторы строк в идентификаторы объектов
'Parameters:
'[IN]   TableName , тип параметра: String раздел,
'[IN]   RowQueryID , тип параметра: String идентификатор списка строк,
'[IN]   QueryIDOut , тип параметра: String  - идентификатор списка объектов
'See Also:
'  DropResults
'  FIND_IDS
'  FullTextSearch
'  GetResults
'  QR_AND_QR
'  QR_OR_QR
'  RowsToParents
'  USDate
'Example:
'  call me.RowsToInstances(<параметры>)
Public Sub RowsToInstances(ByVal TableName As String, ByVal RowQueryID As String, ByVal QueryIDOut As String)
Attribute RowsToInstances.VB_HelpID = 115
       Dim p As NamedValues
       Dim cnt As Long
       Set p = New NamedValues
       Dim nvi As NamedValue
       
       Set nvi = p.Add(Application.SymbolAt & "RowQueryID", RowQueryID)
       nvi.ORACLE_GUID
       Set nvi = p.Add(Application.SymbolAt & "OutputQueryID", QueryIDOut)
       nvi.ORACLE_GUID
       Set nvi = p.Add(Application.SymbolAt & "the_TABLE", TableName)
       If Application.IsORACLE Then
        Set nvi = p.Add(Application.SymbolAt & "CURSESSION", Application.sessionid)
        nvi.ORACLE_GUID
       End If
       
       Application.TheDataSource.ExecuteProc "RowsToInstances", p
End Sub

'преобразовать идентификаторы строк в идентификаторы строк родительских разделов
'Parameters:
'[IN]   TableName , тип параметра: String - исходный раздел,
'[IN]   RowQueryID , тип параметра: String идентификатор списка строк,
'[IN]   QueryIDOut , тип параметра: String  - идентификатор списка родительских строк
'See Also:
'  DropResults
'  FIND_IDS
'  FullTextSearch
'  GetResults
'  QR_AND_QR
'  QR_OR_QR
'  RowsToInstances
'  USDate
'Example:
'  call me.RowsToParents(<параметры>)
Public Sub RowsToParents(ByVal TableName As String, ByVal RowQueryID As String, ByVal QueryIDOut As String)
Attribute RowsToParents.VB_HelpID = 120
       Dim s As String
       s = "insert into QUERYRESULT(QUERYRESULTID,RESULT) select distinct " & StrOrNull(QueryIDOut) & ",PARENTSTRUCTROWID from " & TableName & " where " & TableName & "id in (select result from QUERYRESULT where QUERYRESULTID=" & StrOrNull(RowQueryID) & ")"
       DebugOutput s
       Application.TheDataSource.Execute s
       
End Sub

'список объектов по результатам полнотекстового запроса
'Parameters:
'[IN]   Filter , тип параметра: String  - запрос,
'[IN]   TypeName , тип параметра: String - имя типа,
'[IN][OUT]   ResultID , тип параметра: String  - идентификатор результата
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'  DropResults
'  FIND_IDS
'  GetResults
'  QR_AND_QR
'  QR_OR_QR
'  RowsToInstances
'  RowsToParents
'  USDate
'Example:
' dim variable as Boolean
' variable = me.FullTextSearch(<параметры>)
Public Function FullTextSearch(ByVal Filter As String, ByVal TypeName As String, ResultID As String) As Boolean
Attribute FullTextSearch.VB_HelpID = 95
  If Application.IsORACLE Then Exit Function
  Dim nv As NamedValues
  Set nv = New NamedValues
  nv.Add Application.SymbolAt & "QueryResultID", ResultID
  nv.Add Application.SymbolAt & "Filter", Filter
  FullTextSearch = Application.TheDataSource.ExecuteProc(Replace(Application.ProcPrefix, "%Type%", TypeName, , , vbTextCompare) & TypeName & "_search", nv)
End Function


Public Function RowParents(ByVal TableName As String, ByVal RowID As String) As RowParentList
  Dim rs As ADODB.RecordSet
  Dim queryid As String
  Dim rpl As RowParentList
  Set rpl = New RowParentList
  queryid = CreateGUID2
  Dim p As NamedValues
  Dim nvi As NamedValue
  Set p = New NamedValues
  Set nvi = p.Add(Application.SymbolAt & "QueryID", queryid)
    nvi.ORACLE_GUID
  Set nvi = p.Add(Application.SymbolAt & "RowID", RowID)
    nvi.ORACLE_GUID
  Set nvi = p.Add(Application.SymbolAt & "TABLE", TableName)
    
  If Application.IsORACLE Then
    Set nvi = p.Add(Application.SymbolAt & "CURSESSION", Application.sessionid)
    nvi.ORACLE_GUID
  End If
  
  On Error GoTo bye
  Application.TheDataSource.ExecuteProc Application.KernelPrefix & "RowParents", p
  Dim Parameters As NamedValues
  If Application.IsORACLE Then
    Set rs = Application.TheDataSource.OpenRecordset("select PARTNAME,theROWID,PARENTLEVEL from RPRESULT where RPRESULTID='" & queryid & "' order by parentlevel desc")
  Else
    Set rs = Application.TheDataSource.OpenRecordset("select PARTNAME,ROWID,PARENTLEVEL from RPRESULT where RPRESULTID='" & queryid & "' order by parentlevel desc")
    If (rs Is Nothing) Then
      Set Parameters = New NamedValues
      Call Parameters.Add("RPRESULTID", queryid)
      Set rs = Application.ExecRS("MTZGetRPRESULT", Parameters)
    End If
  End If
  If rs Is Nothing Then Exit Function
  While Not rs.EOF
    If Application.IsORACLE Then
     rpl.Add rs!theRowID, rs!PartName
    Else
        rpl.Add rs!RowID, rs!PartName
    End If
    rs.MoveNext
  Wend
  rs.Close
  Set rs = Nothing
  On Error Resume Next
  Err.Clear
  Application.TheDataSource.Execute "delete from RPRESULT where RPRESULTID='" & queryid & "'"
  If (Err <> 0) Then
      Set Parameters = New NamedValues
      Call Parameters.Add("RPRESULTID", queryid)
      Set rs = Application.ExecRS("MTZDeleteRPRESULT", Parameters)
  End If
  
bye:
  Set RowParents = rpl
End Function
