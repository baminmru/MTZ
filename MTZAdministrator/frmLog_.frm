VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Begin VB.Form frmLog_ 
   Caption         =   "Журнал активности"
   ClientHeight    =   5055
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9345
   Icon            =   "frmLog_.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   5055
   ScaleWidth      =   9345
   Begin VB.Timer menuTimer 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   3600
      Top             =   0
   End
   Begin VB.Timer RefreshTimer 
      Enabled         =   0   'False
      Interval        =   2000
      Left            =   2520
      Top             =   0
   End
   Begin VB.CommandButton cmdMode 
      Height          =   330
      Left            =   1680
      Style           =   1  'Graphical
      TabIndex        =   5
      Tag             =   "switch.ico"
      ToolTipText     =   "Режим таблицы или карточки"
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   330
   End
   Begin VB.CommandButton cmdFnd 
      Height          =   330
      Left            =   1320
      Style           =   1  'Graphical
      TabIndex        =   4
      Tag             =   "find.ico"
      ToolTipText     =   "Поиск"
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   330
   End
   Begin VB.CommandButton cmdCfg 
      Height          =   330
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   3
      Tag             =   "config.ico"
      ToolTipText     =   "Настройка внешнего вида"
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   330
   End
   Begin VB.CommandButton cmdPrn 
      Height          =   330
      Left            =   600
      Style           =   1  'Graphical
      TabIndex        =   2
      Tag             =   "PrintPreview.ico"
      ToolTipText     =   "Печать"
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   330
   End
   Begin VB.CommandButton cmdRef 
      Height          =   330
      Left            =   120
      Style           =   1  'Graphical
      TabIndex        =   1
      Tag             =   "Refresh.ico"
      ToolTipText     =   "Обновить"
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   330
   End
   Begin GridEX20.GridEX gr 
      Height          =   4455
      Left            =   0
      TabIndex        =   0
      Top             =   480
      Width           =   9255
      _ExtentX        =   16325
      _ExtentY        =   7858
      Version         =   "2.0"
      AutomaticSort   =   -1  'True
      RecordNavigatorString=   "Запись:|из "
      BoundColumnIndex=   ""
      ReplaceColumnIndex=   ""
      TabKeyBehavior  =   1
      CalendarTodayText=   "Сегоднч"
      MethodHoldFields=   -1  'True
      SelectionStyle  =   1
      GroupByBoxInfoText=   "Перетащите колонку для группировки"
      AllowEdit       =   0   'False
      DataMode        =   99
      ColumnHeaderHeight=   285
      IntProp1        =   0
      IntProp2        =   0
      IntProp7        =   0
      FormatStylesCount=   6
      FormatStyle(1)  =   "frmLog_.frx":0442
      FormatStyle(2)  =   "frmLog_.frx":0522
      FormatStyle(3)  =   "frmLog_.frx":067E
      FormatStyle(4)  =   "frmLog_.frx":072E
      FormatStyle(5)  =   "frmLog_.frx":07E2
      FormatStyle(6)  =   "frmLog_.frx":08BA
      ImageCount      =   0
      PrinterProperties=   "frmLog_.frx":0972
   End
End
Attribute VB_Name = "frmLog_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private menuAction As String
Private mvarFieldArray() As Variant
Dim fmTop As Long
Private fnd As Object
Private LastCheckDate As Date
Private inRefreshTimer  As Boolean





Public Sub Init()
  On Error Resume Next
  Dim noLoad As Boolean
  noLoad = False
  RefreshTimer.Enabled = False

  fmTop = 0
  
  Dim js As Long, idx As Long
  'Dim pv As MTZMetaModel.PARTVIEW
  'Dim part As MTZMetaModel.part
  Dim rs As ADODB.Recordset
  Dim col As GridEX20.JSColumn
again:
  On Error Resume Next
  gr.ItemCount = 0
  gr.Groups.Clear
  gr.SortKeys.Clear
  gr.Columns.Clear
  

'  changestamp
'  StartAt
'  Closed
'  the_Resource
'  LogStructID



'  LogInstanceID
'  syslogid
'  Login
'  Family
'  Name
'  SurName
'  the_comment
'  instname
'  Caption
'  Verb
'  changestamp



    Set col = gr.Columns.Add("Пользователь", jgexText, jgexEditNone)
    Set col = gr.Columns.Add("Фамилия", jgexText, jgexEditNone)
    Set col = gr.Columns.Add("Имя", jgexText, jgexEditNone)
    Set col = gr.Columns.Add("Отчество", jgexText, jgexEditNone)
    Set col = gr.Columns.Add("Тип объекта", jgexText, jgexEditNone)
    Set col = gr.Columns.Add("Объект", jgexText, jgexEditNone)
    Set col = gr.Columns.Add("Раздел", jgexText, jgexEditNone)
    Set col = gr.Columns.Add("Действие", jgexText, jgexEditNone)
    Set col = gr.Columns.Add("Время", jgexText, jgexEditNone)
    col.SortType = jgexSortTypeDateTime
    
'  LogInstanceID
'  syslogid
'  Login
'  Family
'  Name
'  SurName
'  the_comment
'  instname
'  Caption
'  Verb
'  changestamp
    
    
'    If JC.ColSort = ColumnSortType_As_Date Then col.SortType = jgexSortTypeDateTime
'    If JC.ColSort = ColumnSortType_As_Numeric Then col.SortType = jgexSortTypeNumeric
'    If JC.ColSort = ColumnSortType_As_String Then col.SortType = jgexSortTypeString
'
'    If JC.GroupAggregation = AggregationType_AVG Then col.AggregateFunction = jgexAvg
'    If JC.GroupAggregation = AggregationType_COUNT Then col.AggregateFunction = jgexCount
'    If JC.GroupAggregation = AggregationType_MAX Then col.AggregateFunction = jgexMax
'    If JC.GroupAggregation = AggregationType_MIN Then col.AggregateFunction = jgexMin
'    If JC.GroupAggregation = AggregationType_none Then col.AggregateFunction = jgexAggregateNone
'    If JC.GroupAggregation = AggregationType_SUM Then col.AggregateFunction = jgexSum
'
'    If JC.ColumnAlignment = VHAlignment_Center_Bottom Then col.TextAlignment = jgexAlignCenter
'    If JC.ColumnAlignment = VHAlignment_Center_Top Then col.TextAlignment = jgexAlignCenter
'    If JC.ColumnAlignment = VHAlignment_Center_Center Then col.TextAlignment = jgexAlignCenter
'    If JC.ColumnAlignment = VHAlignment_Left_Bottom Then col.TextAlignment = jgexAlignLeft
'    If JC.ColumnAlignment = VHAlignment_Left_Top Then col.TextAlignment = jgexAlignLeft
'    If JC.ColumnAlignment = VHAlignment_Left_Center Then col.TextAlignment = jgexAlignLeft
'    If JC.ColumnAlignment = VHAlignment_Right_Bottom Then col.TextAlignment = jgexAlignRight
'    If JC.ColumnAlignment = VHAlignment_Right_Top Then col.TextAlignment = jgexAlignRight
'    If JC.ColumnAlignment = VHAlignment_Right_Center Then col.TextAlignment = jgexAlignRight
  
  
  
  
  On Error Resume Next
  
  
  
  On Error GoTo bye
  If noLoad = False Then
    LoadGridLayout gr, "JournalV_LOG"
    Exit Sub
  End If
  Exit Sub
bye:
  noLoad = True
  GoTo again
End Sub

Public Sub RefreshLog()
  On Error GoTo bye
  
  fmTop = 0
  On Error Resume Next
  Dim cnt As Long
  
  Dim js As Long, idx As Long, i As Long, j As Long
  Dim rs As ADODB.Recordset
   
  gr.ItemCount = 0
  DoEvents
  
  cnt = gr.Columns.Count
  Erase mvarFieldArray
  
  '-2 - InstanceID; -1 - RowID;  0 - VIEWBASE
  
  
'  LogInstanceID
'  syslogid
'  Login
'  Family
'  Name
'  SurName
'  the_comment
'  instname
'  Caption
'  Verb
'  changestamp
  
  ReDim mvarFieldArray(-2 To cnt, 0 To 0)
  
  LastCheckDate = Session.GetServerTime()
  
    
  If Session.IsORACLE Then
      Set rs = Session.GetRowsEx("V_Log", , , "ChangeStamp >=" & MakeORACLEDate(Date), " order by ChangeStamp")
  Else
      Set rs = Session.GetRowsEx("V_Log", , , "ChangeStamp >=" & MakeMSSQLDate(Date), " order by ChangeStamp")
  End If

    If Not rs Is Nothing Then
      On Error Resume Next
      
      ReDim Preserve mvarFieldArray(-2 To cnt, 0 To fmTop + rs.RecordCount)
      idx = 1
      While Not rs.EOF
        mvarFieldArray(-2, fmTop + idx) = rs!LogInstanceID
        mvarFieldArray(-1, fmTop + idx) = rs!syslogID
        mvarFieldArray(0, fmTop + idx) = "V_LOG"
        mvarFieldArray(1, fmTop + idx) = rs!Login & ""
        mvarFieldArray(2, fmTop + idx) = rs!Family & ""
        mvarFieldArray(3, fmTop + idx) = rs!Name & ""
        mvarFieldArray(4, fmTop + idx) = rs!SurName & ""
        mvarFieldArray(5, fmTop + idx) = rs!the_comment & ""
        mvarFieldArray(6, fmTop + idx) = rs!instname & ""
        mvarFieldArray(7, fmTop + idx) = rs!Caption & ""
        mvarFieldArray(8, fmTop + idx) = rs!Verb & ""
        mvarFieldArray(9, fmTop + idx) = rs!changestamp & ""
        rs.MoveNext
        idx = idx + 1
      Wend
      fmTop = fmTop + rs.RecordCount
    End If
  rs.Close
  Set rs = Nothing

  gr.ItemCount = fmTop
  gr.Refresh
  gr.RefreshSort
  gr.RefreshGroups
  DoEvents
  'LastCheckDate = Session.GetServerTime()
  RefreshTimer.Enabled = True
  Exit Sub
bye:
'  Stop
'  Resume
MsgBox err.Description, vbCritical + vbOKOnly, "Обновление журнала"
End Sub

Public Property Get FieldMatrix(ByVal col As Long, ByVal Row As Long) As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.FieldArray
    FieldMatrix = Empty
    On Error Resume Next
    
    FieldMatrix = mvarFieldArray(col, Row)
End Property


Public Property Get RowID(ByVal Row As Long) As String
    On Error Resume Next
    RowID = mvarFieldArray(-1, Row)
End Property


Public Property Get RowInstanceID(ByVal Row As Long) As String
    On Error Resume Next
    RowInstanceID = mvarFieldArray(-2, Row)
End Property


Public Property Get ViewBase(ByVal Row As Long) As String
    On Error Resume Next
    ViewBase = mvarFieldArray(0, Row)
End Property


Public Property Get RowCount() As Long
    On Error Resume Next
    RowCount = fmTop
End Property

Public Property Get Row() As Long
    On Error Resume Next
    Row = gr.RowIndex(gr.Row)
End Property


Public Property Let Row(r As Long)
    On Error Resume Next
    If r > 0 And r <= gr.ItemCount Then
      gr.Row = r
    End If
End Property


Public Property Let FieldMatrix(ByVal col As Long, ByVal Row As Long, ByVal vData As Variant)
    On Error Resume Next
    mvarFieldArray(col, Row) = vData
End Property


Public Property Set FieldMatrix(ByVal col As Long, ByVal Row As Long, ByVal vData As Variant)
    On Error Resume Next
    Set mvarFieldArray(col, Row) = vData
End Property



Private Sub cmdCfg_Click()
On Error Resume Next
  Dim jset As Object
  Set jset = CreateObject("MTZ_JSetup.Customizer")
  jset.ShowSumary gr, "JournalV_LOG"
  Set jset = Nothing
End Sub



Private Sub cmdFnd_Click()
  On Error Resume Next
  fnd.ShowForm
End Sub

Private Sub cmdMode_Click()
  On Error Resume Next
  Dim jset As Object 'MTZ_JSetup.Customizer
  Set jset = CreateObject("MTZ_JSetup.Customizer")
  jset.SwitchGridView gr
  Set jset = Nothing
End Sub

Private Sub cmdPrn_Click()
  On Error Resume Next
  Dim usedefault As Boolean
  Dim jset As Object 'MTZ_JSetup.Customizer

 
  Set jset = CreateObject("MTZ_JSetup.Customizer")
  jset.Preview gr, "Предварительный просмотр"
  Set jset = Nothing

End Sub

Private Sub cmdRef_Click()
  On Error Resume Next
  RefreshLog
End Sub


Private Sub cmdRun_Click()
On Error Resume Next
  Dim ri As Long
  Dim usedefault As Boolean
  Dim bRefresh As Boolean
  If gr.Row < 1 Then Exit Sub
  
  ri = gr.RowIndex(gr.Row)
  If ri < 1 Then Exit Sub
  
 
  gr_DblClick
  
End Sub



Private Sub Form_Resize()
On Error Resume Next
Usercontrol_resize
End Sub

Private Sub gr_DblClick()
  On Error Resume Next
  Dim ri As Long
  Dim o1 As Object
  Dim o2 As Object
  If gr.Row < 1 Then Exit Sub
  
  ri = gr.RowIndex(gr.Row)
  If ri < 1 Then Exit Sub
  On Error GoTo bye
  Dim usedefault As Boolean
    Set o1 = Manager.GetInstanceObject(RowInstanceID(ri), Session.site)
    Set o2 = Manager.GetInstanceGUI(o1.ID)
    o2.Show "", o1, True
 
bye:
  Set o1 = Nothing
  Set o2 = Nothing
End Sub



Private Sub gr_KeyDown(KeyCode As Integer, Shift As Integer)
  On Error Resume Next
  If KeyCode = vbKeyReturn And Shift = 0 Then
    gr_DblClick
    KeyCode = 0
  End If

End Sub

Private Sub gr_KeyPress(KeyAscii As Integer)
  If gr.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fnd.FindOnPress KeyAscii
End Sub

'Private Sub gr_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
'If Button = 2 And Shift = 0 Then
'  PopupMenu mnuPopup
'End If
'End Sub

Private Sub gr_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
  On Error Resume Next
  If LastRow <> gr.Row And LastRow > 0 Then
    gr.GetRowData(LastRow).RowStyle = "Default"
    gr.GetRowData(gr.Row).RowStyle = "SelectedRow"
  End If

End Sub

Private Sub gr_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)


Dim i As Long
On Error Resume Next
  For i = 1 To gr.Columns.Count
    Values(i) = FieldMatrix(i, RowIndex)
  Next
  Bookmark = RowID(RowIndex)
End Sub



Private Sub RefreshTimer_Timer()
  
  If inRefreshTimer Then Exit Sub
  inRefreshTimer = True
  On Error Resume Next
  Dim cnt As Long
  
  Dim js As Long, idx As Long, i As Long, j As Long
  Dim rs As ADODB.Recordset
  
  
'  syslogid
'  changestamp
'  StartAt
'  Closed
'  the_Resource
'  LogStructID
'  LogInstanceID
'  Verb
'  Login
'  Family
'  Name
'  SurName
'  instname
'  ObjType
'  Caption
'  the_comment

  
  Dim NextCheckDate As Date
  Dim maybe As Boolean
  NextCheckDate = Session.GetServerTime()
  maybe = False
  If Session.IsORACLE Then
    Set rs = Session.GetRowsEx("V_Log", , , "ChangeStamp >=" & MakeORACLEDate(LastCheckDate) & " and ChangeStamp < " & MakeORACLEDate(NextCheckDate) & " ", " order by ChangeStamp")
  Else
    Set rs = Session.GetRowsEx("V_Log", , , "ChangeStamp >=" & MakeMSSQLDate(LastCheckDate) & " and ChangeStamp < " & MakeMSSQLDate(NextCheckDate) & " ", " order by ChangeStamp")
  End If
  If Not rs Is Nothing Then
    While Not rs.EOF
      RefreshOrAppendRow rs!syslogID
      maybe = True
      rs.MoveNext
    Wend
  End If
  rs.Close
  Set rs = Nothing
  
  LastCheckDate = NextCheckDate
  If maybe Then
    gr.RefreshGroups
    gr.RefreshSort
  End If
  inRefreshTimer = False
End Sub

Private Sub UserControl_Initialize()
  On Error Resume Next
  gr.ItemCount = 0
  gr.Columns.Clear
  Set fnd = Nothing
  Set fnd = CreateObject("MTZ_JSetup.GridFinder")
  fnd.Init gr
  LoadBtnPictures cmdCfg, cmdCfg.Tag
  LoadBtnPictures cmdPrn, cmdPrn.Tag
  LoadBtnPictures cmdRef, cmdRef.Tag
  LoadBtnPictures cmdFnd, cmdFnd.Tag
  LoadBtnPictures cmdMode, cmdMode.Tag
End Sub

Private Sub Usercontrol_resize()
On Error Resume Next
gr.Left = 0
'gr.Top = 0
gr.Width = Me.Width
gr.Height = Me.ScaleHeight - gr.Top
End Sub

Private Sub UserControl_Terminate()
  On Error Resume Next
  RefreshTimer.Enabled = False
  gr.ItemCount = 0
  Set fnd = Nothing
  Erase mvarFieldArray
End Sub


Private Sub mnuRef_click()
   menuAction = "REF"
   menuTimer.Enabled = True
End Sub
Private Sub mnuPrn_click()
   menuAction = "PRN"
   menuTimer.Enabled = True
End Sub
Private Sub mnuCfg_click()
   menuAction = "CFG"
   menuTimer.Enabled = True
End Sub
Private Sub mnuFind_click()
   menuAction = "FND"
   menuTimer.Enabled = True
End Sub
Private Sub mnuFilter_click()
   menuAction = "FLT"
   menuTimer.Enabled = True
End Sub



Public Sub RefreshOrAppendRow(ByVal RowID As String)
  Dim rs As Recordset
  Dim f As ADODB.Field
  
  Dim c As Collection
  Dim o As Variant
    
 
  Set rs = Session.GetRows("v_LOG", , , "syslogID='" & RowID & "'")
   
  
  If rs Is Nothing Then Exit Sub
  If rs.EOF Then Exit Sub
  Dim i As Long, RowNum As Long, cnt As Long
  cnt = gr.ItemCount
  
  RowNum = -1
  For i = 1 To RowCount
    If Left(RowID, 1) <> "{" Then RowID = "{" & RowID & "}"
    If UCase(FieldMatrix(-1, i)) = UCase(RowID) Then
      RowNum = i
      Exit For
    End If
  Next
  ' добавляем строку, если она новая
  If RowNum = -1 Then
      On Error Resume Next
      ReDim Preserve mvarFieldArray(-2 To gr.Columns.Count, 0 To cnt + 1)
      mvarFieldArray(-2, cnt + 1) = rs!LogInstanceID
      mvarFieldArray(-1, cnt + 1) = rs!syslogID
      mvarFieldArray(-0, cnt + 1) = "V_LOG"
      cnt = cnt + 1
      RowNum = cnt
  End If
  
  ' обновляем строку по номеру
  RefreshRowByNum RowNum
  If gr.ItemCount <> cnt Then
   gr.ItemCount = cnt
   fmTop = cnt
  End If
nxt:
  rs.Close
  Set rs = Nothing
End Sub






Public Sub RefreshRow(ByVal ID As String)
  On Error Resume Next
  Dim cnt As Long, RowNum As Long
  Dim idx As Long, i As Long, j As Long
  Dim pv As MTZMetaModel.PARTVIEW
  Dim rs As ADODB.Recordset
  
  
  RowNum = -1
  For i = 1 To RowCount
    If FieldMatrix(-1, i) = ID Then
      RowNum = i
      Exit For
    End If
  Next
  If RowNum = -1 Then Exit Sub
  RefreshRowByNum RowNum
End Sub


Private Sub RefreshRowByNum(ByVal RowNum As Long)
  On Error Resume Next
  Dim cnt As Long
  Dim js As Long, idx As Long, i As Long, j As Long
  Dim rs As ADODB.Recordset
 
  If RowNum < 0 Then Exit Sub
  
    Set rs = Session.GetRows("v_LOG", , , "syslogID='" & FieldMatrix(-1, RowNum) & "'")
    If Not rs Is Nothing Then
      If Not rs.EOF Then
        mvarFieldArray(-2, RowNum) = rs!LogInstanceID
        mvarFieldArray(-1, RowNum) = rs!syslogID
        mvarFieldArray(0, RowNum) = "V_LOG"
        mvarFieldArray(1, RowNum) = rs!Login & ""
        mvarFieldArray(2, RowNum) = rs!Family & ""
        mvarFieldArray(3, RowNum) = rs!Name & ""
        mvarFieldArray(4, RowNum) = rs!SurName & ""
        mvarFieldArray(5, RowNum) = rs!the_comment & ""
        mvarFieldArray(6, RowNum) = rs!instname & ""
        mvarFieldArray(7, RowNum) = rs!Caption & ""
        mvarFieldArray(8, RowNum) = rs!Verb & ""
        mvarFieldArray(9, RowNum) = rs!changestamp & ""
      End If
    End If
    rs.Close
    Set rs = Nothing
    gr.RefreshRowIndex RowNum
End Sub


Private Sub menuTimer_timer()
   menuTimer.Enabled = False
   If menuAction = "RUN" Then cmdRun_Click
   If menuAction = "REF" Then cmdRef_Click
   If menuAction = "PRN" Then cmdPrn_Click
   If menuAction = "CFG" Then cmdCfg_Click
   If menuAction = "FND" Then cmdFnd_Click
   menuAction = ""
End Sub

Private Sub Form_Load()
UserControl_Initialize
Init
RefreshLog
End Sub
