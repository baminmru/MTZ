VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Begin VB.UserControl JournalView 
   ClientHeight    =   5760
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   9540
   ScaleHeight     =   5760
   ScaleWidth      =   9540
   ToolboxBitmap   =   "JournalView.ctx":0000
   Begin VB.ComboBox cmbField 
      Height          =   315
      Left            =   120
      Style           =   2  'Dropdown List
      TabIndex        =   18
      Top             =   480
      Width           =   3855
   End
   Begin VB.TextBox txtVal 
      Height          =   285
      Left            =   4080
      TabIndex        =   17
      Top             =   480
      Width           =   3255
   End
   Begin VB.CommandButton cmdRefresh2 
      Caption         =   "Искать"
      Height          =   255
      Left            =   7440
      TabIndex        =   16
      Top             =   480
      Width           =   1215
   End
   Begin VB.CommandButton cmdUp 
      Caption         =   "t"
      BeginProperty Font 
         Name            =   "Marlett"
         Size            =   8.25
         Charset         =   2
         Weight          =   500
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   7080
      Style           =   1  'Graphical
      TabIndex        =   13
      Tag             =   "xl.ico"
      ToolTipText     =   "перейти на первую запись"
      Top             =   120
      Width           =   330
   End
   Begin VB.CommandButton cmdDown 
      Caption         =   "u"
      BeginProperty Font 
         Name            =   "Marlett"
         Size            =   8.25
         Charset         =   2
         Weight          =   500
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   7470
      Style           =   1  'Graphical
      TabIndex        =   14
      Tag             =   "xl.ico"
      ToolTipText     =   "Перейти на последнюю запись"
      Top             =   120
      Width           =   330
   End
   Begin VB.CommandButton cmdExportXL 
      Height          =   330
      Left            =   4230
      Style           =   1  'Graphical
      TabIndex        =   12
      Tag             =   "xl.ico"
      ToolTipText     =   "Экспорт в Excel"
      Top             =   120
      Width           =   330
   End
   Begin VB.CommandButton cmdRun 
      Height          =   330
      Left            =   2730
      Style           =   1  'Graphical
      TabIndex        =   8
      Tag             =   "run.ico"
      ToolTipText     =   "Действие"
      Top             =   120
      UseMaskColor    =   -1  'True
      Width           =   330
   End
   Begin VB.CommandButton cmdClearFilter 
      Height          =   330
      Left            =   3855
      Style           =   1  'Graphical
      TabIndex        =   11
      Tag             =   "nofilter.ico"
      ToolTipText     =   "Отменить фильтр"
      Top             =   120
      Width           =   330
   End
   Begin VB.Timer RefreshTimer 
      Enabled         =   0   'False
      Interval        =   2000
      Left            =   5640
      Top             =   120
   End
   Begin VB.Timer menuTimer 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   4920
      Top             =   120
   End
   Begin VB.CommandButton cmdAdd 
      Height          =   330
      Left            =   105
      Style           =   1  'Graphical
      TabIndex        =   1
      Tag             =   "NEW.ico"
      ToolTipText     =   "Добавить"
      Top             =   120
      UseMaskColor    =   -1  'True
      Width           =   330
   End
   Begin VB.CommandButton cmdEdit 
      Height          =   330
      Left            =   493
      Style           =   1  'Graphical
      TabIndex        =   2
      Tag             =   "PROP.ico"
      ToolTipText     =   "Свойства"
      Top             =   120
      UseMaskColor    =   -1  'True
      Width           =   330
   End
   Begin VB.CommandButton cmdDel 
      Height          =   330
      Left            =   866
      Style           =   1  'Graphical
      TabIndex        =   3
      Tag             =   "DELETE.ico"
      ToolTipText     =   "Удалить"
      Top             =   120
      UseMaskColor    =   -1  'True
      Width           =   330
   End
   Begin VB.CommandButton cmdRef 
      Height          =   330
      Left            =   1239
      Style           =   1  'Graphical
      TabIndex        =   4
      Tag             =   "Refresh.ico"
      ToolTipText     =   "Обновить"
      Top             =   120
      UseMaskColor    =   -1  'True
      Width           =   330
   End
   Begin VB.CommandButton cmdPrn 
      Height          =   330
      Left            =   1612
      Style           =   1  'Graphical
      TabIndex        =   5
      Tag             =   "PrintPreview.ico"
      ToolTipText     =   "Отчет"
      Top             =   120
      UseMaskColor    =   -1  'True
      Width           =   330
   End
   Begin VB.CommandButton cmdCfg 
      Height          =   330
      Left            =   1985
      Style           =   1  'Graphical
      TabIndex        =   6
      Tag             =   "config.ico"
      ToolTipText     =   "Настройка внешнего вида"
      Top             =   120
      UseMaskColor    =   -1  'True
      Width           =   330
   End
   Begin VB.CommandButton cmdFnd 
      Height          =   330
      Left            =   2358
      Style           =   1  'Graphical
      TabIndex        =   7
      Tag             =   "find.ico"
      ToolTipText     =   "Поиск"
      Top             =   120
      UseMaskColor    =   -1  'True
      Width           =   330
   End
   Begin VB.CommandButton cmdFilter 
      Height          =   330
      Left            =   3480
      Style           =   1  'Graphical
      TabIndex        =   10
      Tag             =   "filter.ico"
      ToolTipText     =   "Фильтр"
      Top             =   120
      Width           =   330
   End
   Begin VB.CommandButton cmdMode 
      Height          =   330
      Left            =   3104
      Style           =   1  'Graphical
      TabIndex        =   9
      Tag             =   "switch.ico"
      ToolTipText     =   "Режим таблицы или карточки"
      Top             =   120
      UseMaskColor    =   -1  'True
      Width           =   330
   End
   Begin GridEX20.GridEX gr 
      Height          =   4335
      Left            =   120
      TabIndex        =   0
      Top             =   840
      Width           =   9255
      _ExtentX        =   16325
      _ExtentY        =   7646
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
      FormatStyle(1)  =   "JournalView.ctx":0312
      FormatStyle(2)  =   "JournalView.ctx":03CE
      FormatStyle(3)  =   "JournalView.ctx":052A
      FormatStyle(4)  =   "JournalView.ctx":05DA
      FormatStyle(5)  =   "JournalView.ctx":068E
      FormatStyle(6)  =   "JournalView.ctx":0766
      ImageCount      =   0
      PrinterProperties=   "JournalView.ctx":081E
   End
   Begin VB.Label lblInfo 
      Caption         =   "Записей: "
      Height          =   195
      Left            =   7920
      TabIndex        =   15
      Top             =   195
      Width           =   1425
   End
   Begin VB.Menu mnuPopup 
      Caption         =   "Меню"
      Visible         =   0   'False
      Begin VB.Menu mnuAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuRun 
         Caption         =   "Исполнить"
      End
      Begin VB.Menu mnuPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuFilter 
         Caption         =   "Фильтр"
      End
      Begin VB.Menu mnuNoFilter 
         Caption         =   "Снять фильтр"
      End
      Begin VB.Menu mnuExport 
         Caption         =   "Экспорт"
      End
   End
End
Attribute VB_Name = "JournalView"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private menuAction As String
Private mvarFieldArray() As Variant
Dim fmTop As Long
Private fnd As Object
Private m_Filter As JFilters
Private M_Journal As MTZJrnl.Application
'Private M_model As MTZMetaModel.Application
Private LastCheckDate As Date
Private inRefreshTimer  As Boolean
Public Event JVGetDocMode(ByVal Doc As Object, ByRef mode As String, ByRef IsDenied As Boolean)
Public Event JVIsDocDeletable(ByVal Doc As Object, ByRef IsDeletable As Boolean)
Public Event JVOnPrint(ByRef UseDefault As Boolean)
Public Event JVOnExport(ByRef UseDefault As Boolean)
Public Event JVOnFilter(ByRef UseDefault As Boolean)
Public Event JVOnClearFilter()
Public Event JVOnAdd(ByRef UseDefault As Boolean, ByRef Refesh As Boolean)
Public Event JVOnEdit(ByVal RowIndex As Long, ByRef UseDefault As Boolean, ByRef Refesh As Boolean)
Public Event JVOnRun(ByVal RowIndex As Long, ByRef UseDefault As Boolean, ByRef Refesh As Boolean)
Public Event JVOnDel(ByVal RowIndex As Long, ByRef UseDefault As Boolean, ByRef Refesh As Boolean)
Public Event JVRowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
Public Event JVDblClick(ByVal RowIndex As Long, ByRef UseDefault As Boolean)
Private ViewMap As Collection
Private NoFind As Boolean
Dim m_MiniFilter As JFilters

Private m_Modal As Boolean
Private m_StatusUpdate As Boolean


Public Property Let ExportHint(ByVal v As String)
   cmdExportXL.ToolTipText = v
   mnuExport.Caption = v
End Property

Public Property Get ExportHint() As String
  OpenHint = cmdExportXL.ToolTipText
End Property

Public Property Let OpenHint(ByVal v As String)
   mnuOpen.Caption = v
End Property

Public Property Get OpenHint() As String
  OpenHint = mnuOpen.Caption
End Property

Public Property Let CfgHint(ByVal v As String)
  cmdCfg.ToolTipText = v
  mnuCfg.Caption = v
End Property

Public Property Get CfgHint() As String
  CfgHint = cmdCfg.ToolTipText
End Property

Public Property Let GridHint(ByVal v As String)
  gr.ToolTipText = v
End Property

Public Property Get GridHint() As String
  GridHint = gr.ToolTipText
End Property


Public Property Let DelHint(ByVal v As String)
  cmdDel.ToolTipText = v
  mnuDelete.Caption = v
End Property

Public Property Get DelHint() As String
  DelHint = cmdDel.ToolTipText
End Property

Public Property Let EditHint(ByVal v As String)
  cmdEdit.ToolTipText = v
  mnuEdit.Caption = v
End Property

Public Property Get EditHint() As String
  EditHint = cmdEdit.ToolTipText
End Property

Public Property Let AddHint(ByVal v As String)
  cmdAdd.ToolTipText = v
  mnuAdd.Caption = v
End Property

Public Property Get AddHint() As String
  AddHint = cmdAdd.ToolTipText
End Property

Public Property Let RunMenuName(ByVal v As String)
  mnuRun.Caption = v
End Property

Public Property Get RunMenuName() As String
  RunMenuName = mnuRun.Caption
End Property
Public Property Let RunHint(ByVal v As String)
  cmdRun.ToolTipText = v
End Property

Public Property Get RunHint() As String
  RunHint = cmdRun.ToolTipText
End Property

Public Property Let PrintHint(ByVal v As String)
  cmdPrn.ToolTipText = v
  mnuPrn.Caption = v
End Property

Public Property Get PrintHint() As String
  PrintHint = cmdPrn.ToolTipText
End Property


Public Property Let AutoRefresh(ByVal v As Boolean)
  If v Then
    If Not M_Journal Is Nothing Then
      RefreshTimer.Enabled = v
    End If
  Else
    RefreshTimer.Enabled = v
  End If
End Property

Public Property Get AutoRefresh() As Boolean
  AutoRefresh = RefreshTimer.Enabled
End Property



Public Property Let AllowAdd(ByVal v As Boolean)
  If v Then
    cmdAdd.Enabled = True
  Else
    cmdAdd.Enabled = False
  End If
  mnuAdd.Visible = cmdAdd.Enabled
End Property

Public Property Get AllowAdd() As Boolean
  AllowAdd = cmdAdd.Enabled
End Property

Public Property Let AllowFilter(ByVal v As Boolean)
  If v Then
    cmdFilter.Enabled = True
  Else
    cmdFilter.Enabled = False
  End If
  mnuFilter.Visible = cmdFilter.Enabled
  If v Then
    cmdClearFilter.Enabled = True
  Else
    cmdClearFilter.Enabled = False
  End If
  mnuNoFilter.Visible = cmdClearFilter.Enabled
End Property

Public Property Get AllowFilter() As Boolean
  AllowFilter = cmdFilter.Enabled
End Property

Public Property Let AllowEdit(ByVal v As Boolean)
  If v Then
    cmdEdit.Enabled = True
  Else
    cmdEdit.Enabled = False
  End If
  mnuEdit.Visible = cmdEdit.Enabled
End Property

Public Property Get AllowEdit() As Boolean
  AllowEdit = cmdEdit.Enabled
End Property

Public Property Let AllowDel(ByVal v As Boolean)
  If v Then
    cmdDel.Enabled = True
  Else
    cmdDel.Enabled = False
  End If
  mnuDelete.Visible = cmdDel.Enabled
End Property

Public Property Get AllowDel() As Boolean
  AllowDel = cmdDel.Enabled
End Property

Public Property Let AllowRun(ByVal v As Boolean)
  If v Then
    cmdRun.Enabled = True
  Else
    cmdRun.Enabled = False
  End If
  mnuRun.Visible = cmdRun.Enabled
End Property

Public Property Get AllowRun() As Boolean
  AllowRun = cmdRun.Enabled
End Property


Public Property Let AllowPrint(ByVal v As Boolean)
  If v Then
    cmdPrn.Enabled = True
  Else
    cmdPrn.Enabled = False
  End If
  mnuPrn.Visible = cmdPrn.Enabled
End Property

Public Property Get AllowPrint() As Boolean
  AllowPrint = cmdPrn.Enabled
End Property

Public Property Let AllowExport(ByVal v As Boolean)
  If v Then
    cmdExportXL.Enabled = True
  Else
    cmdExportXL.Enabled = False
  End If
  mnuExport.Visible = cmdExportXL.Enabled
End Property

Public Property Get AllowExport() As Boolean
  AllowExport = cmdExportXL.Enabled
End Property

Private Function JSession() As MTZSession.Session
  Set JSession = Journal.MTZSession
End Function

Public Sub ClearFilter()
  Set m_Filter = Nothing
  Set m_Filter = New JFilters
End Sub


Public Property Get Filter() As JFilters
  If m_Filter Is Nothing Then
    Set m_Filter = New JFilters
  End If
  Set Filter = m_Filter
End Property

Public Property Get OpenModal() As Boolean
  OpenModal = m_Modal
End Property

Public Property Let OpenModal(ByVal v As Boolean)
  m_Modal = v
End Property


Public Property Set Journal(v As MTZJrnl.Application)
  On Error Resume Next
  Dim noLoad As Boolean
  noLoad = False
  RefreshTimer.Enabled = False

  Set M_Journal = v
  fmTop = 0
  
  Dim js As Long, idx As Long
  'Dim pv As MTZMetaModel.PARTVIEW
  'Dim part As MTZMetaModel.part
  Dim rs As ADODB.Recordset
  Dim JC As MTZJrnl.JournalColumn
  Dim col As GridEX20.JSColumn
again:
  On Error Resume Next
  gr.ItemCount = 0
  gr.Groups.Clear
  gr.SortKeys.Clear
  gr.Columns.Clear
  If M_Journal Is Nothing Then Exit Property
  
  
  cmbField.Clear
  Journal.JournalColumn.Sort = "sequence"
  For js = 1 To Journal.JournalColumn.Count
    Set JC = Journal.JournalColumn.Item(js)
    cmbField.AddItem JC.Name
    Set col = gr.Columns.Add(JC.Name, jgexText, jgexEditNone)
    If JC.ColSort = ColumnSortType_As_Date Then col.SortType = jgexSortTypeDateTime
    If JC.ColSort = ColumnSortType_As_Numeric Then col.SortType = jgexSortTypeNumeric
    If JC.ColSort = ColumnSortType_As_String Then col.SortType = jgexSortTypeString
    
    If JC.GroupAggregation = AggregationType_AVG Then col.AggregateFunction = jgexAvg
    If JC.GroupAggregation = AggregationType_COUNT Then col.AggregateFunction = jgexCount
    If JC.GroupAggregation = AggregationType_MAX Then col.AggregateFunction = jgexMax
    If JC.GroupAggregation = AggregationType_MIN Then col.AggregateFunction = jgexMin
    If JC.GroupAggregation = AggregationType_none Then col.AggregateFunction = jgexAggregateNone
    If JC.GroupAggregation = AggregationType_SUM Then col.AggregateFunction = jgexSum
    
    If JC.ColumnAlignment = VHAlignment_Center_Bottom Then col.TextAlignment = jgexAlignCenter
    If JC.ColumnAlignment = VHAlignment_Center_Top Then col.TextAlignment = jgexAlignCenter
    If JC.ColumnAlignment = VHAlignment_Center_Center Then col.TextAlignment = jgexAlignCenter
    If JC.ColumnAlignment = VHAlignment_Left_Bottom Then col.TextAlignment = jgexAlignLeft
    If JC.ColumnAlignment = VHAlignment_Left_Top Then col.TextAlignment = jgexAlignLeft
    If JC.ColumnAlignment = VHAlignment_Left_Center Then col.TextAlignment = jgexAlignLeft
    If JC.ColumnAlignment = VHAlignment_Right_Bottom Then col.TextAlignment = jgexAlignRight
    If JC.ColumnAlignment = VHAlignment_Right_Top Then col.TextAlignment = jgexAlignRight
    If JC.ColumnAlignment = VHAlignment_Right_Center Then col.TextAlignment = jgexAlignRight
  Next
  
  ' лишняя колонка для отображения состояния
  Set col = gr.Columns.Add("Состояние", jgexText, jgexEditNone)
  cmbField.AddItem "Состояние"
  On Error Resume Next
  
  Set ViewMap = Nothing
  Set ViewMap = New Collection
  
  Dim jsrc As JournalSrc
  Dim partid As String
  Dim idh As idholder
  For js = 1 To Journal.JournalSrc.Count
    Set jsrc = Journal.JournalSrc.Item(js)
    Set rs = JSession.GetRows("partview", "", "", "partviewid='" & jsrc.PARTVIEW & "'")
    If Not rs Is Nothing Then
      partid = rs!parentstructrowid
      Set rs = JSession.GetRows("part", "", "", "partid='" & partid & "'")
      If Not rs Is Nothing Then
        Set idh = New idholder
        idh.ID = jsrc.PARTVIEW
        idh.N1 = jsrc.ViewAlias
        idh.N2 = rs!Name
        ViewMap.Add idh, idh.ID
      End If
    End If
  Next
  On Error GoTo bye
  If noLoad = False Then
    LoadGridLayout gr, "Journal" & M_Journal.Journal.Item(1).the_Alias
    Call RefreshInfo
    Exit Property
  End If
  Exit Property
bye:
  noLoad = True
  GoTo again
End Property

Public Property Get Journal() As MTZJrnl.Application
  Set Journal = M_Journal
End Property

Public Sub Refresh()
  If Journal Is Nothing Then Exit Sub
  On Error GoTo bye
  
  fmTop = 0
  On Error Resume Next
  Dim cnt As Long
  
  Dim js As Long, idx As Long, i As Long, j As Long
  Dim rs As ADODB.Recordset
  Dim jcs As MTZJrnl.JColumnSource
  Dim JC As MTZJrnl.JournalColumn
  Dim jsrc As MTZJrnl.JournalSrc
  Dim fltr As JFilter
  
  gr.ItemCount = 0
  DoEvents
  Journal.JournalColumn.Sort = "sequence"
  
  cnt = Journal.JournalColumn.Count + 1  ' +1 для учета колонки с состоянием !!!
  
  Erase mvarFieldArray
  
  '-2 - InstanceID; -1 - RowID;  0 - VIEWBASE
  ReDim mvarFieldArray(-2 To cnt, 0 To 0)
  
  LastCheckDate = JSession.GetServerTime()
  
  Dim mfltr As JFilter
  
  For js = 1 To Journal.JournalSrc.Count
    Set jsrc = Journal.JournalSrc.Item(js)
    
    Set fltr = Nothing
    Set fltr = Filter.Item(jsrc.ViewAlias)
    Set mfltr = Nothing
    Set mfltr = MiniFilter.Item(jsrc.ViewAlias)
    
    If Not fltr Is Nothing Then
      If Not mfltr Is Nothing Then
        Set rs = JSession.GetRows("v_" & jsrc.ViewAlias, , , fltr.FilterString & " and  " & mfltr.FilterString)
      Else
        Set rs = JSession.GetRows("v_" & jsrc.ViewAlias, , , fltr.FilterString)
      End If
    Else
      If Not mfltr Is Nothing Then
        Set rs = JSession.GetRows("v_" & jsrc.ViewAlias, , , mfltr.FilterString)
      Else
        Set rs = JSession.GetRows("v_" & jsrc.ViewAlias)
      End If
    End If
    Set fltr = Nothing
    
    If Not rs Is Nothing Then
      On Error Resume Next
      
      ReDim Preserve mvarFieldArray(-2 To cnt, 0 To fmTop + rs.RecordCount)
      idx = 1
      While Not rs.EOF
        mvarFieldArray(-2, fmTop + idx) = rs!Instanceid
        mvarFieldArray(-1, fmTop + idx) = rs!ID
        mvarFieldArray(0, fmTop + idx) = rs!ViewBase
        
        For i = 1 To Journal.JournalColumn.Count
          Set JC = Journal.JournalColumn.Item(i)
          For j = 1 To JC.JColumnSource.Count
            Set jcs = JC.JColumnSource.Item(j)
            If jcs.SrcPartView.ID = jsrc.ID Then
            
            mvarFieldArray(i, fmTop + idx) = rs.Fields(jcs.ViewField).Value & ""
            
            End If
          Next
          
        Next
        Debug.Print idx
        ' плюс еще состояние
        mvarFieldArray(Journal.JournalColumn.Count + 1, fmTop + idx) = rs.Fields("StatusName").Value & ""
        
        rs.MoveNext
        idx = idx + 1
      Wend
      fmTop = fmTop + rs.RecordCount
    End If
  rs.Close
  Set rs = Nothing
  Next
  
  gr.ItemCount = fmTop
  gr.Refresh
  gr.RefreshSort
  gr.RefreshGroups
  gr.CollapseAll
  If gr.Row > 0 Then
    gr.GetRowData(gr.Row).RowStyle = "SelectedRow"
  End If
  Call RefreshInfo
  DoEvents
  'LastCheckDate = JSession.GetServerTime()
  RefreshTimer.Enabled = True
  Exit Sub
bye:
'  Stop
'  Resume
MsgBox Err.Description, vbCritical + vbOKOnly, "Обновление журнала"
End Sub

Private Sub RefreshInfo()
  lblInfo.Caption = "Записей: " & CStr(gr.ItemCount)
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


Private Sub cmdAdd_Click()
  On Error Resume Next
  Dim ri As Long
  Dim UseDefault As Boolean
  Dim bRefresh As Boolean
  ri = gr.RowIndex(gr.Row)
  UseDefault = True
  bRefresh = False
  RaiseEvent JVOnAdd(UseDefault, bRefresh)
  If UseDefault Then
    ' do nothing
  End If
  If bRefresh Then
    Refresh
  End If
End Sub

Private Sub cmdCfg_Click()
On Error Resume Next
 
  Dim jset As Object
  Set jset = CreateObject("MTZ_JSetup.Customizer")
  jset.ShowSumary gr, "Journal" & M_Journal.Journal.Item(1).the_Alias
  Set jset = Nothing
End Sub

Private Sub cmdClearFilter_Click()
  On Error Resume Next
  ClearFilter
  RaiseEvent JVOnClearFilter
  Refresh
End Sub

Private Sub cmdDel_Click()
On Error Resume Next
  Dim ri As Long
  Dim UseDefault As Boolean
  Dim bRefresh As Boolean
  Dim IsDeletable As Boolean
  Dim obj As Object
  If gr.Row < 1 Then Exit Sub
  ri = gr.RowIndex(gr.Row)
  If ri < 1 Then Exit Sub
  UseDefault = True
  bRefresh = False
  
  If UseDefault Then
    Dim ID As String
    ID = mvarFieldArray(-2, ri)
    Set obj = Journal.Manager.GetInstanceObject(ID)
    IsDeletable = True
    If Not obj Is Nothing Then
      RaiseEvent JVIsDocDeletable(obj, IsDeletable)
      If IsDeletable Then
        RaiseEvent JVOnDel(ri, UseDefault, bRefresh)
        ' по умолчанию  - удаляем документ
        If UseDefault Then
          If MsgBox("Удалить текущий документ?", vbYesNo, "Удаление документа") = vbYes Then
            Journal.Manager.DeleteInstance ID
          End If
        End If
      Else
        MsgBox "удаление документа не разрешено", vbOKOnly + vbInformation, "Удаление документа"
      End If
    End If
  End If
  If bRefresh Then
    Refresh
  End If
End Sub

Private Sub cmdDown_Click()
  If (gr.RowCount > 0) Then
    gr.Row = gr.RowCount
    Call gr.EnsureVisible(gr.RowCount)
  End If
End Sub

Private Sub cmdEdit_Click()
  On Error Resume Next
  Dim ri As Long
  Dim UseDefault As Boolean
  Dim bRefresh As Boolean
  If gr.Row < 1 Then Exit Sub
  
  ri = gr.RowIndex(gr.Row)
  If ri < 1 Then Exit Sub
  UseDefault = True
  bRefresh = False
  RaiseEvent JVOnEdit(ri, UseDefault, bRefresh)
  If UseDefault Then
    gr_DblClick
  End If
  If bRefresh Then
    Refresh
  End If
End Sub

Private Sub cmdExportXL_Click()

On Error Resume Next
  Dim UseDefault As Boolean
  If M_Journal Is Nothing Then Exit Sub
  UseDefault = True
  RaiseEvent JVOnExport(UseDefault)
  If UseDefault Then
    Dim ex As Object
    Dim excel As Object
    
    Set excel = CreateObject("Excel.Application")
    With excel.Workbooks.Add
    Set ex = .Worksheets.Item(1)
    End With
    
    Dim s()
    ReDim s(0 To gr.Columns.Count)
    Dim i As Long, j As Long
    For j = 0 To gr.Columns.Count - 1
        s(j) = gr.Columns.Item(j + 1).Caption
    Next
    ex.Range(ex.Cells(1, 1), ex.Cells(1, gr.Columns.Count)).Value = s
    
    For i = 0 To gr.ItemCount - 1
      For j = 0 To gr.Columns.Count - 1
        s(j) = FieldMatrix(j + 1, i + 1)
      Next
      ex.Range(ex.Cells(i + 2, 1), ex.Cells(i + 2, gr.Columns.Count)).Value = s
    Next
    excel.Selection.AutoFormat Format:=12, Number:=True, Font _
            :=True, Alignment:=True, Border:=True, Pattern:=True, Width:=True
    excel.ActiveWindow.Visible = True
    excel.Visible = True
  End If
End Sub

Private Sub cmdFilter_Click()
  On Error Resume Next
  Dim UseDefault As Boolean
  If M_Journal Is Nothing Then Exit Sub
  UseDefault = True
  RaiseEvent JVOnFilter(UseDefault)
  If UseDefault Then
    ClearFilter
  End If
  Refresh
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
  Dim UseDefault As Boolean
  Dim jset As Object 'MTZ_JSetup.Customizer

  UseDefault = True
  RaiseEvent JVOnPrint(UseDefault)
  If UseDefault Then
    Set jset = CreateObject("MTZ_JSetup.Customizer")
    jset.Preview gr, "Предварительный просмотр"
    Set jset = Nothing
  End If
End Sub

Private Sub cmdRef_Click()
  On Error Resume Next
  Refresh
End Sub


Private Sub cmdRefresh2_Click()
 Dim i As Long, js As Long, fcol As Long, jcs As Long
 Dim jsrc As JournalSrc
  Dim sMiniFilter As String
  
  If cmbField.ListIndex = -1 Then
    If cmbField.ListCount > 0 Then
      fcol = 0
      cmbField.ListIndex = 0
    Else
      Exit Sub
    End If
  Else
    fcol = cmbField.ListIndex
  End If
  fcol = fcol + 1
  For js = 1 To Journal.JournalSrc.Count
    Set jsrc = Journal.JournalSrc.Item(js)
    sMiniFilter = ""
    If fcol <= Journal.JournalColumn.Count Then
      For jcs = 1 To Journal.JournalColumn.Item(fcol).JColumnSource.Count
        If Journal.JournalColumn.Item(fcol).JColumnSource.Item(jcs).SrcPartView Is jsrc Then
          sMiniFilter = " convert( varchar(255)," & Journal.JournalColumn.Item(fcol).JColumnSource.Item(jcs).ViewField & ") like '%" & Replace(txtVal, "'", "''") & "%'"
          Exit For
        End If
      Next
    Else
      If cmbField.Text = "Состояние" Then
          sMiniFilter = " StatusName like '%" & Replace(txtVal, "'", "''") & "%'"
      End If
    End If
    MiniFilter.Add jsrc.ViewAlias, sMiniFilter
  Next
  Refresh
End Sub


Private Sub cmdRun_Click()
On Error Resume Next
  Dim ri As Long
  Dim UseDefault As Boolean
  Dim bRefresh As Boolean
  If gr.Row < 1 Then Exit Sub
  
  ri = gr.RowIndex(gr.Row)
  If ri < 1 Then Exit Sub
  UseDefault = True
  bRefresh = False
  RaiseEvent JVOnRun(ri, UseDefault, bRefresh)
  If UseDefault Then
    gr_DblClick
  End If
  If bRefresh Then
    Refresh
  End If
End Sub



Private Sub cmdUp_Click()
  If (gr.RowCount > 0) Then
    gr.Row = 1
    Call gr.EnsureVisible(1)
  End If
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
  Dim UseDefault As Boolean
  Dim mode As String, IsDenied As Boolean
  mode = ""
  IsDenied = False
  UseDefault = True
  RaiseEvent JVDblClick(ri, UseDefault)
  
  If UseDefault Then
    Set o1 = Journal.Manager.GetInstanceObject(RowInstanceID(ri), Journal.MTZSession.Site)
    RaiseEvent JVGetDocMode(o1, mode, IsDenied)
    If IsDenied Then
      MsgBox "Не разрешено открывать документы такого типа", vbCritical + vbOKOnly, Journal.Name
      Exit Sub
    End If
    Set o2 = Journal.Manager.GetInstanceGUI(o1.ID)
    o2.Show mode, o1, m_Modal
  End If
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
  If NoFind Then Exit Sub
  fnd.FindOnPress KeyAscii
End Sub

Private Sub gr_KeyUp(KeyCode As Integer, Shift As Integer)
  On Error Resume Next
  'Debug.Print KeyCode & " - " & Shift
  If Shift = 0 And KeyCode = 45 And cmdAdd.Enabled Then cmdAdd_Click
  If Shift = 0 And KeyCode = 13 And cmdEdit.Enabled Then cmdEdit_Click
  If Shift = 0 And KeyCode = 46 And cmdDel.Enabled Then cmdDel_Click
  If Shift = 2 And KeyCode = 80 And cmdPrn.Enabled Then cmdPrn_Click
  If Shift = 2 And KeyCode = 70 And cmdFnd.Enabled Then cmdFnd_Click
  If Shift = 2 And KeyCode = 65 And cmdFilter.Enabled Then cmdFilter_Click
  If Shift = 4 And KeyCode = 65 And cmdClearFilter.Enabled Then cmdClearFilter_Click
  If Shift = 2 And KeyCode = 83 And cmdExportXL.Enabled Then cmdExportXL_Click
  KeyCode = 0
End Sub


Private Sub gr_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopup
End If
End Sub

Private Sub gr_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
  On Error Resume Next
  If LastRow <> gr.Row And LastRow > 0 Then
    gr.GetRowData(LastRow).RowStyle = "Default"
    gr.GetRowData(gr.Row).RowStyle = "SelectedRow"
  End If
 RaiseEvent JVRowColChange(LastRow, LastCol)
End Sub

Private Sub gr_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
If M_Journal Is Nothing Then Exit Sub
If M_Journal.Application Is Nothing Then Exit Sub
Dim i As Long
On Error Resume Next
  For i = 1 To Journal.JournalColumn.Count + 1
    Values(i) = FieldMatrix(i, RowIndex)
  Next
  Bookmark = RowID(RowIndex)
End Sub

Private Sub Label1_Click()

End Sub

Private Sub mnuNoFilter_Click()
  menuAction = "NFLT"
  menuTimer.Enabled = True
End Sub

Private Sub mnuRun_Click()
   menuAction = "RUN"
   menuTimer.Enabled = True
End Sub

Private Sub RefreshTimer_Timer()
  If Journal Is Nothing Then Exit Sub
  If inRefreshTimer Then Exit Sub
  inRefreshTimer = True
  m_StatusUpdate = False
  On Error Resume Next
  Dim cnt As Long
  
  Dim js As Long, idx As Long, i As Long, j As Long
  Dim rs As ADODB.Recordset
  Dim jcs As MTZJrnl.JColumnSource
  Dim JC As MTZJrnl.JournalColumn
  Dim jsrc As MTZJrnl.JournalSrc
  Dim lastID As String
  
  
  Dim NextCheckDate As Date
  Dim maybe As Boolean
  NextCheckDate = JSession.GetServerTime()
  Dim idh As idholder
  maybe = False
  lastID = RowID(gr.Row)
  
  
  For js = 1 To Journal.JournalSrc.Count
    Set jsrc = Journal.JournalSrc.Item(js)
    Set idh = ViewMap.Item(jsrc.PARTVIEW)
    If JSession.IsORACLE Then
      Set rs = JSession.GetRowsEx("SysLog", , , "LogStructID='" & idh.N2 & "' and ChangeStamp >=" & MakeORACLEDate(LastCheckDate) & " and ChangeStamp < " & MakeORACLEDate(NextCheckDate) & " and VERB in ('CREATEROW','EDITROW','DELETEROW')", " order by ChangeStamp")
    Else
      Set rs = JSession.GetRowsEx("SysLog", , , "LogStructID='" & idh.N2 & "' and ChangeStamp >=" & MakeMSSQLDate(LastCheckDate) & " and ChangeStamp < " & MakeMSSQLDate(NextCheckDate) & " and VERB in ('CREATEROW','EDITROW','DELETEROW')", " order by ChangeStamp")
    End If
    'Debug.Print "ChangeStamp >=" & MakeMSSQLDate(LastCheckDate) & " and ChangeStamp < " & MakeMSSQLDate(NextCheckDate)
    
    If Not rs Is Nothing Then
      While Not rs.EOF
        If rs!Verb = "DELETEROW" Then
          DeleteRow jsrc.ViewAlias, rs!the_Resource
        Else
 
          If rs!Verb = "CREATEROW" Then
            Debug.Print "CREATED"
          End If
          
          RefreshOrAppendRow jsrc.ViewAlias, rs!the_Resource
        End If
        maybe = True
        rs.MoveNext
      Wend
    End If
    rs.Close
    Set rs = Nothing
    
    ' отдельно обрабатываем изменение состояний
    If JSession.IsORACLE Then
      Set rs = JSession.GetRowsEx("SysLog", , , "ChangeStamp >=" & MakeORACLEDate(LastCheckDate) & " and ChangeStamp < " & MakeORACLEDate(NextCheckDate) & " and VERB in ('STATUS')", " order by ChangeStamp")
    Else
      Set rs = JSession.GetRowsEx("SysLog", , , "ChangeStamp >=" & MakeMSSQLDate(LastCheckDate) & " and ChangeStamp < " & MakeMSSQLDate(NextCheckDate) & " and VERB in ('STATUS')", " order by ChangeStamp")
    End If
    'Debug.Print "ChangeStamp >=" & MakeMSSQLDate(LastCheckDate) & " and ChangeStamp < " & MakeMSSQLDate(NextCheckDate)
    
    If Not rs Is Nothing Then
      While Not rs.EOF
'         обрабатываем состояние
          RefreshStatus jsrc.ViewAlias, rs!the_Resource
        
        rs.MoveNext
      Wend
    End If
    rs.Close
    Set rs = Nothing
  Next
  
  LastCheckDate = NextCheckDate
  If m_StatusUpdate Then
    gr.Refresh
    maybe = True
  End If
  If maybe Then
    gr.RefreshGroups
    gr.RefreshSort
  End If
  
  If lastID <> "" Then
    i = FindRowByID(lastID)
    If i > 0 And i < gr.ItemCount Then
      gr.Row = i
      If gr.Row > 0 Then
        gr.GetRowData(gr.Row).RowStyle = "SelectedRow"
      End If
    End If
  End If
  Call RefreshInfo
  inRefreshTimer = False
End Sub

Private Function FindRowByID(ByVal ID As String) As Long
  Dim i As Long
  For i = 1 To gr.RowCount
    If RowID(i) = ID Then
      FindRowByID = i
      Exit Function
    End If
  Next
  FindRowByID = 1
End Function

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
  LoadBtnPictures cmdEdit, cmdEdit.Tag
  LoadBtnPictures cmdAdd, cmdAdd.Tag
  LoadBtnPictures cmdRun, cmdRun.Tag
  LoadBtnPictures cmdDel, cmdDel.Tag
  LoadBtnPictures cmdFilter, cmdFilter.Tag
  LoadBtnPictures cmdClearFilter, cmdClearFilter.Tag
  LoadBtnPictures cmdExportXL, cmdExportXL.Tag
  Set ViewMap = Nothing
  
  NoFind = MTZGetSetting("MTZ", "CONFIG", "NOFIND", False)
  If NoFind Then
    cmdFnd.Enabled = False
    mnuFind.Visible = False
  Else
    cmdFnd.Enabled = True
    mnuFind.Visible = False
  End If

End Sub

Private Sub Usercontrol_resize()
  On Error Resume Next
  gr.Left = 0
  'gr.Top = 0
  gr.Width = UserControl.Width
  gr.Height = UserControl.Height - gr.Top
  lblInfo.Left = UserControl.ScaleWidth - 30 - lblInfo.Width
  cmdDown.Left = lblInfo.Left - 60 - cmdDown.Width
  cmdUp.Left = cmdDown.Left - 30 - cmdUp.Width
End Sub


Private Sub UserControl_Terminate()
  On Error Resume Next
  RefreshTimer.Enabled = False
  gr.ItemCount = 0
  Set Journal = Nothing
  Set m_Filter = Nothing
  Set fnd = Nothing
  Erase mvarFieldArray
End Sub


Private Sub mnuAdd_click()
   menuAction = "ADD"
   menuTimer.Enabled = True
End Sub


Private Sub mnuExport_click()
   menuAction = "EXPORT"
   menuTimer.Enabled = True
End Sub
Private Sub mnuEdit_click()
   menuAction = "EDIT"
   menuTimer.Enabled = True
End Sub
Private Sub mnuDelete_click()
   menuAction = "DEL"
   menuTimer.Enabled = True
End Sub
Private Sub mnuOpen_click()
   menuAction = "OPEN"
   menuTimer.Enabled = True
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
Private Sub menuTimer_timer()
   menuTimer.Enabled = False
   If menuAction = "ADD" Then cmdAdd_Click
   If menuAction = "EDIT" Then cmdEdit_Click
   If menuAction = "DEL" Then cmdDel_Click
   If menuAction = "OPEN" Then gr_DblClick
   If menuAction = "RUN" Then cmdRun_Click
   If menuAction = "REF" Then cmdRef_Click
   If menuAction = "PRN" Then cmdPrn_Click
   If menuAction = "CFG" Then cmdCfg_Click
   If menuAction = "FND" Then cmdFnd_Click
   If menuAction = "FLT" Then cmdFilter_Click
   If menuAction = "NFLT" Then cmdClearFilter_Click
   If menuAction = "EXPORT" Then cmdExportXL_Click
   menuAction = ""
End Sub



Public Sub RefreshOrAppendRow(ByVal ViewName As String, ByVal RowID As String)
  Dim rs As Recordset
  Dim f As ADODB.FIELD
  
  Dim c As Collection
  Dim o As Variant
    
  Dim fltr As JFilter
  
  '-2 - InstanceID; -1 - RowID;  0 - VIEWBASE
  'ReDim mvarFieldArray(-2 To cnt, 0 To 0)
    
    Set fltr = Nothing
    Set fltr = Filter.Item(ViewName)
    If Not fltr Is Nothing Then
      Set rs = JSession.GetRows("v_" & ViewName, , , "ID='" & RowID & "' and  " & fltr.FilterString)
    Else
      Set rs = JSession.GetRows("v_" & ViewName, , , "ID='" & RowID & "'")
    End If
    Set fltr = Nothing
    
  
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
      ReDim Preserve mvarFieldArray(-2 To Journal.JournalColumn.Count + 1, 0 To cnt + 1)
      mvarFieldArray(-2, cnt + 1) = rs!Instanceid
      mvarFieldArray(-1, cnt + 1) = rs!ID
      mvarFieldArray(-0, cnt + 1) = rs!ViewBase
      mvarFieldArray(Journal.JournalColumn.Count + 1, cnt + 1) = rs.Fields("StatusName").Value & ""
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



Public Sub RefreshStatus(ByVal ViewName As String, ByVal Instanceid As String)
  Dim rs As Recordset
  Dim rs1 As Recordset
  Dim f As ADODB.FIELD
  
  Dim c As Collection
  Dim o As Variant
    
  Dim fltr As JFilter
  
  '-2 - InstanceID; -1 - RowID;  0 - VIEWBASE
  'ReDim mvarFieldArray(-2 To cnt, 0 To 0)
    Dim i As Long, RowNum As Long, cnt As Long
    
    cnt = gr.ItemCount
    
    Set fltr = Nothing
    Set fltr = Filter.Item(ViewName)
    If Not fltr Is Nothing Then
        Set rs1 = JSession.GetRows("v_" & ViewName, , , "InstanceID='" & Instanceid & "'")
        While Not rs1.EOF
          Set rs = JSession.GetRows("v_" & ViewName, , , "id='" & rs1!ID & "' and InstanceID='" & Instanceid & "' and  " & fltr.FilterString)
          If rs.EOF Then
           ' Это ситуация, когда строка вышла из фильтра
           
           
           DeleteRow ViewName, rs1!ID
           cnt = gr.ItemCount
          Else
            m_StatusUpdate = True
                       
            RowNum = -1
            For i = 1 To RowCount
              If Left(Instanceid, 1) <> "{" Then Instanceid = "{" & Instanceid & "}"
              If UCase(FieldMatrix(-2, i)) = UCase(Instanceid) Then
                RowNum = i
                Exit For
              End If
            Next
            
            ' обновляем старые строки
            If RowNum >= 0 Then
                On Error Resume Next
                'ReDim Preserve mvarFieldArray(-2 To Journal.JournalColumn.Count + 1, 0 To cnt + 1)
                mvarFieldArray(-2, RowNum) = rs!Instanceid
                mvarFieldArray(-1, RowNum) = rs!ID
                mvarFieldArray(-0, RowNum) = rs!ViewBase
                mvarFieldArray(Journal.JournalColumn.Count + 1, RowNum) = rs.Fields("StatusName").Value & ""
                'cnt = cnt + 1
                'RowNum = cnt
            End If
          
            ' добавляем строку, если она новая и попала в наш фильтр
            If RowNum = -1 Then
                On Error Resume Next
                ReDim Preserve mvarFieldArray(-2 To Journal.JournalColumn.Count + 1, 0 To cnt + 1)
                mvarFieldArray(-2, cnt + 1) = rs!Instanceid
                mvarFieldArray(-1, cnt + 1) = rs!ID
                mvarFieldArray(-0, cnt + 1) = rs!ViewBase
                mvarFieldArray(Journal.JournalColumn.Count + 1, cnt + 1) = rs.Fields("StatusName").Value & ""
                cnt = cnt + 1
                RowNum = cnt
                RefreshRowByNum RowNum
            End If
          
          End If
    
          rs1.MoveNext
        Wend
    
    Else
        Set rs = JSession.GetRows("v_" & ViewName, , , "InstanceID='" & Instanceid & "'")
        Set fltr = Nothing
    
        ' если уж совсем ничего нет
        If rs Is Nothing Then Exit Sub
        If rs.EOF Then Exit Sub
        
        While Not rs.EOF
        
          m_StatusUpdate = True
          
          
          
          RowNum = -1
          For i = 1 To RowCount
            If Left(Instanceid, 1) <> "{" Then Instanceid = "{" & Instanceid & "}"
            If UCase(FieldMatrix(-2, i)) = UCase(Instanceid) Then
              RowNum = i
              Exit For
            End If
          Next
          
          ' обновляем старые строки
          If RowNum >= 0 Then
              On Error Resume Next
              'ReDim Preserve mvarFieldArray(-2 To Journal.JournalColumn.Count + 1, 0 To cnt + 1)
              mvarFieldArray(-2, RowNum) = rs!Instanceid
              mvarFieldArray(-1, RowNum) = rs!ID
              mvarFieldArray(-0, RowNum) = rs!ViewBase
              mvarFieldArray(Journal.JournalColumn.Count + 1, RowNum) = rs.Fields("StatusName").Value & ""
              'cnt = cnt + 1
              'RowNum = cnt
          End If
        
          ' добавляем строку, если она новая и попала в наш фильтр
          If RowNum = -1 Then
              On Error Resume Next
              ReDim Preserve mvarFieldArray(-2 To Journal.JournalColumn.Count + 1, 0 To cnt + 1)
              mvarFieldArray(-2, cnt + 1) = rs!Instanceid
              mvarFieldArray(-1, cnt + 1) = rs!ID
              mvarFieldArray(-0, cnt + 1) = rs!ViewBase
              mvarFieldArray(Journal.JournalColumn.Count + 1, cnt + 1) = rs.Fields("StatusName").Value & ""
              cnt = cnt + 1
              RowNum = cnt
              RefreshRowByNum RowNum
          End If
            
          ' что делать если строка вышла из статуса, который накрывается нашим фильтром???
        rs.MoveNext
      Wend

    End If
    
    
    
  
  If gr.ItemCount <> cnt Then
   gr.ItemCount = cnt
   fmTop = cnt
  End If
nxt:
  rs.Close
  Set rs = Nothing
End Sub


Private Sub DeleteRow(ByVal ViewName As String, ByVal RowID As String)
  Dim rs As Recordset
  Dim f As ADODB.FIELD
  
  Dim c As Collection
  Dim o As Variant
    
  Dim fltr As JFilter
  
  '-2 - InstanceID; -1 - RowID;  0 - VIEWBASE
  'ReDim mvarFieldArray(-2 To cnt, 0 To 0)
    
    Set fltr = Nothing
    Set fltr = Filter.Item(ViewName)
    If Not fltr Is Nothing Then
      Set rs = JSession.GetRows("v_" & ViewName, , , "ID='" & RowID & "' and  " & fltr.FilterString)
    Else
      Set rs = JSession.GetRows("v_" & ViewName, , , "ID='" & RowID & "'")
    End If
    Set fltr = Nothing
    
  
  If rs Is Nothing Then Exit Sub
  
  Dim i As Long, RowNum As Long, cnt As Long, j As Long
  cnt = gr.ItemCount
  
  RowNum = -1
  For i = 1 To RowCount
    If Left(RowID, 1) <> "{" Then RowID = "{" & RowID & "}"
    If UCase(FieldMatrix(-1, i)) = UCase(RowID) Then
      RowNum = i
      Exit For
    End If
  Next
  
  
  If RowNum <> -1 Then
      ' поднимаем все строки на одну вверх
      For i = RowNum To cnt - 1
        For j = -2 To Journal.JournalColumn.Count
          mvarFieldArray(j, i) = mvarFieldArray(j, i + 1)
        Next
      Next
      ' подрезаем хвост у массива
      ReDim Preserve mvarFieldArray(-2 To Journal.JournalColumn.Count + 1, 0 To cnt - 1)
      cnt = cnt - 1
  End If
  
  If gr.ItemCount <> cnt Then
   gr.ItemCount = cnt
   gr.Refresh
   fmTop = cnt
  End If
nxt:
  rs.Close
  Set rs = Nothing
End Sub




Public Sub RefreshRow(ByVal ID As String)
  On Error Resume Next
  Dim cnt As Long, RowNum As Long
  Dim js As Long, idx As Long, i As Long, j As Long
  Dim pv As MTZMetaModel.PARTVIEW
  Dim rs As ADODB.Recordset
  Dim jcs As MTZJrnl.JColumnSource
  Dim JC As MTZJrnl.JournalColumn
  Dim jsrc As MTZJrnl.JournalSrc
  Dim fltr As JFilter
  
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
  Dim pv As MTZMetaModel.PARTVIEW
  Dim rs As ADODB.Recordset
  Dim jcs As MTZJrnl.JColumnSource
  Dim JC As MTZJrnl.JournalColumn
  Dim jsrc As MTZJrnl.JournalSrc
  Dim fltr As JFilter
  Dim part As MTZMetaModel.part
  
  If RowNum < 0 Then Exit Sub
  For js = 1 To Journal.JournalSrc.Count
    Set jsrc = Journal.JournalSrc.Item(js)
    Set rs = JSession.GetRows("v_" & jsrc.ViewAlias, , , "ID='" & FieldMatrix(-1, RowNum) & "'")
    If Not rs Is Nothing Then
      If Not rs.EOF Then
        For i = 1 To Journal.JournalColumn.Count
          Set JC = Journal.JournalColumn.Item(i)
          For j = 1 To JC.JColumnSource.Count
            Set jcs = JC.JColumnSource.Item(j)
            If jcs.SrcPartView.ID = jsrc.ID Then
            mvarFieldArray(i, RowNum) = rs.Fields(jcs.ViewField).Value & ""
            End If
          Next
        Next
        mvarFieldArray(Journal.JournalColumn.Count + 1, RowNum) = rs.Fields("StatusName").Value & ""
      End If
    End If
    rs.Close
    Set rs = Nothing
    Exit For
  Next
  gr.RefreshRowIndex RowNum
End Sub

Public Property Let EditCommandTip(ByVal v As String)
  cmdEdit.ToolTipText = v
End Property

Public Property Get EditCommandTip() As String
  EditCommandTip = cmdEdit.ToolTipText
End Property


Public Property Let RunCommandTip(ByVal v As String)
  cmdRun.ToolTipText = v
End Property

Public Property Get RunCommandTip() As String
  RunCommandTip = cmdRun.ToolTipText
End Property

Public Property Let PrnCommandTip(ByVal v As String)
  cmdPrn.ToolTipText = v
End Property

Public Property Get PrnCommandTip() As String
  PrnCommandTip = cmdPrn.ToolTipText
End Property

Private Property Get MiniFilter() As JFilters
  If m_MiniFilter Is Nothing Then
    Set m_MiniFilter = New JFilters
  End If
  Set MiniFilter = m_MiniFilter
End Property
