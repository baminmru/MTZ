VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Begin VB.UserControl JournalView2 
   ClientHeight    =   5760
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   9765
   ScaleHeight     =   5760
   ScaleWidth      =   9765
   ToolboxBitmap   =   "JournalView.ctx":0000
   Begin VB.CommandButton cmdRefresh2 
      Caption         =   "Искать"
      Height          =   255
      Left            =   7440
      TabIndex        =   22
      Top             =   480
      Width           =   1215
   End
   Begin VB.TextBox txtVal 
      Height          =   285
      Left            =   4080
      TabIndex        =   21
      Top             =   480
      Width           =   3255
   End
   Begin VB.ComboBox cmbField 
      Height          =   315
      Left            =   120
      Style           =   2  'Dropdown List
      TabIndex        =   20
      Top             =   480
      Width           =   3855
   End
   Begin VB.Timer REFRESHTIMER 
      Enabled         =   0   'False
      Interval        =   3000
      Left            =   8640
      Top             =   120
   End
   Begin VB.CommandButton cmdPgDn 
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
      Left            =   6120
      Picture         =   "JournalView.ctx":0312
      Style           =   1  'Graphical
      TabIndex        =   14
      Tag             =   "xl.ico"
      ToolTipText     =   "Следующая страница"
      Top             =   120
      Width           =   330
   End
   Begin VB.CommandButton cmdBottom 
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
      Left            =   6480
      Picture         =   "JournalView.ctx":0654
      Style           =   1  'Graphical
      TabIndex        =   16
      Tag             =   "xl.ico"
      ToolTipText     =   "К последней странице"
      Top             =   120
      Width           =   330
   End
   Begin VB.CommandButton cmdTop 
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
      Left            =   5400
      Picture         =   "JournalView.ctx":0996
      Style           =   1  'Graphical
      TabIndex        =   13
      Tag             =   "xl.ico"
      ToolTipText     =   "К первой странице"
      Top             =   120
      Width           =   330
   End
   Begin VB.CommandButton cmdPgUp 
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
      Left            =   5760
      Picture         =   "JournalView.ctx":0CD8
      Style           =   1  'Graphical
      TabIndex        =   15
      Tag             =   "xl.ico"
      ToolTipText     =   "Предыдущая страница"
      Top             =   120
      Width           =   330
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
      Left            =   6840
      Style           =   1  'Graphical
      TabIndex        =   17
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
      Left            =   7200
      Style           =   1  'Graphical
      TabIndex        =   18
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
   Begin VB.Timer menuTimer 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   4680
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
      Height          =   4695
      Left            =   120
      TabIndex        =   0
      Top             =   960
      Width           =   9495
      _ExtentX        =   16748
      _ExtentY        =   8281
      Version         =   "2.0"
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
      FormatStyle(1)  =   "JournalView.ctx":101A
      FormatStyle(2)  =   "JournalView.ctx":10D6
      FormatStyle(3)  =   "JournalView.ctx":1232
      FormatStyle(4)  =   "JournalView.ctx":12E2
      FormatStyle(5)  =   "JournalView.ctx":1396
      FormatStyle(6)  =   "JournalView.ctx":146E
      ImageCount      =   0
      PrinterProperties=   "JournalView.ctx":1526
   End
   Begin VB.Label lblInfo 
      Caption         =   "Записей: "
      Height          =   195
      Left            =   7680
      TabIndex        =   19
      Top             =   195
      Width           =   2025
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
Attribute VB_Name = "JournalView2"
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
Private m_Order As JOrders
Private m_MiniFilter As JFilters
Private m_Color As StatusColors
Private M_Journal As MTZJrnl.Application
'Private M_model As MTZMetaModel.Application
Private LastCheckDate As Date
Private inRefreshTimer As Boolean
Private inPageBtn As Boolean
Private NoFind As Boolean

' события журнала
' запрос режима открытия
Public Event JVGetDocMode(ByVal Doc As Object, ByRef mode As String, ByRef IsDenied As Boolean)

' запрос возможности удаления
Public Event JVIsDocDeletable(ByVal Doc As Object, ByRef IsDeletable As Boolean)
' печать
Public Event JVOnPrint(ByRef UseDefault As Boolean)
' экспорт
Public Event JVOnExport(ByRef UseDefault As Boolean)

' фильтр
Public Event JVOnFilter(ByRef UseDefault As Boolean)

' сброс фильтра
Public Event JVOnClearFilter()

' добавить
Public Event JVOnAdd(ByRef UseDefault As Boolean, ByRef Refesh As Boolean)

'редактировать
Public Event JVOnEdit(ByVal RowIndex As Long, ByRef UseDefault As Boolean, ByRef Refesh As Boolean)

'действие
Public Event JVOnRun(ByVal RowIndex As Long, ByRef UseDefault As Boolean, ByRef Refesh As Boolean)

'удаление
Public Event JVOnDel(ByVal RowIndex As Long, ByRef UseDefault As Boolean, ByRef Refesh As Boolean)
'смена  позиции курсора
Public Event JVRowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)

'двойной щелчек на гриде
Public Event JVDblClick(ByVal RowIndex As Long, ByRef UseDefault As Boolean)


Private Pager As String  ' ID of paging list for this contol
Private MinLine As Long
Private MaxLine As Long
Private Const PageSize As Long = 200
Private CurrentTop As Long

Private m_AllowSelection As Boolean


Private ViewMap As Collection

Private m_Modal As Boolean
Private m_StatusUpdate As Boolean


'Parameters:
'[IN]   v , тип параметра: String  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim value as Variant
' value = ...значение...
' me.ExportHint = value
Public Property Let ExportHint(ByVal v As String)
   cmdExportXL.ToolTipText = v
   mnuExport.Caption = v
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as String
' variable = me.ExportHint
Public Property Get ExportHint() As String
  OpenHint = cmdExportXL.ToolTipText
End Property

'Parameters:
'[IN]   v , тип параметра: String  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim value as Variant
' value = ...значение...
' me.OpenHint = value
Public Property Let OpenHint(ByVal v As String)
   mnuOpen.Caption = v
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as String
' variable = me.OpenHint
Public Property Get OpenHint() As String
  OpenHint = mnuOpen.Caption
End Property

'Parameters:
'[IN]   v , тип параметра: String  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim value as Variant
' value = ...значение...
' me.CfgHint = value
Public Property Let CfgHint(ByVal v As String)
  cmdCfg.ToolTipText = v
  mnuCfg.Caption = v
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as String
' variable = me.CfgHint
Public Property Get CfgHint() As String
  CfgHint = cmdCfg.ToolTipText
End Property

'Parameters:
'[IN]   v , тип параметра: String  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim value as Variant
' value = ...значение...
' me.GridHint = value
Public Property Let GridHint(ByVal v As String)
  gr.ToolTipText = v
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as String
' variable = me.GridHint
Public Property Get GridHint() As String
  GridHint = gr.ToolTipText
End Property

'Parameters:
'[IN]   v , тип параметра: String  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim value as Variant
' value = ...значение...
' me.DelHint = value
Public Property Let DelHint(ByVal v As String)
  cmdDel.ToolTipText = v
  mnuDelete.Caption = v
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as String
' variable = me.DelHint
Public Property Get DelHint() As String
  DelHint = cmdDel.ToolTipText
End Property

'Parameters:
'[IN]   v , тип параметра: String  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim value as Variant
' value = ...значение...
' me.EditHint = value
Public Property Let EditHint(ByVal v As String)
  cmdEdit.ToolTipText = v
  mnuEdit.Caption = v
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as String
' variable = me.EditHint
Public Property Get EditHint() As String
  EditHint = cmdEdit.ToolTipText
End Property

'Parameters:
'[IN]   v , тип параметра: String  - ...
'See Also:
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim value as Variant
' value = ...значение...
' me.AddHint = value
Public Property Let AddHint(ByVal v As String)
  cmdAdd.ToolTipText = v
  mnuAdd.Caption = v
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as String
' variable = me.AddHint
Public Property Get AddHint() As String
  AddHint = cmdAdd.ToolTipText
End Property

'Parameters:
'[IN]   v , тип параметра: String  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim value as Variant
' value = ...значение...
' me.RunMenuName = value
Public Property Let RunMenuName(ByVal v As String)
  mnuRun.Caption = v
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as String
' variable = me.RunMenuName
Public Property Get RunMenuName() As String
  RunMenuName = mnuRun.Caption
End Property

'Parameters:
'[IN]   v , тип параметра: String  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim value as Variant
' value = ...значение...
' me.RunHint = value
Public Property Let RunHint(ByVal v As String)
  cmdRun.ToolTipText = v
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as String
' variable = me.RunHint
Public Property Get RunHint() As String
  RunHint = cmdRun.ToolTipText
End Property

'Parameters:
'[IN]   v , тип параметра: String  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim value as Variant
' value = ...значение...
' me.PrintHint = value
Public Property Let PrintHint(ByVal v As String)
  cmdPrn.ToolTipText = v
  mnuPrn.Caption = v
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as String
' variable = me.PrintHint
Public Property Get PrintHint() As String
  PrintHint = cmdPrn.ToolTipText
End Property

'Parameters:
'[IN]   v , тип параметра: Boolean  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim value as Variant
' value = ...значение...
' me.AllowSelection = value
Public Property Let AllowSelection(ByVal v As Boolean)
  m_AllowSelection = v
  
End Property

'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as Boolean
' variable = me.AllowSelection
Public Property Get AllowSelection() As Boolean
  AllowSelection = m_AllowSelection
End Property

'Parameters:
'[IN]   v , тип параметра: Boolean  - ...
'See Also:
'  AddHint
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim value as Variant
' value = ...значение...
' me.AllowAdd = value
Public Property Let AllowAdd(ByVal v As Boolean)
  If v Then
    cmdAdd.Enabled = True
  Else
    cmdAdd.Enabled = False
  End If
  mnuAdd.Visible = cmdAdd.Enabled
End Property

'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'  AddHint
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as Boolean
' variable = me.AllowAdd
Public Property Get AllowAdd() As Boolean
  AllowAdd = cmdAdd.Enabled
End Property

'Parameters:
'[IN]   v , тип параметра: Boolean  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim value as Variant
' value = ...значение...
' me.AllowFilter = value
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

'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as Boolean
' variable = me.AllowFilter
Public Property Get AllowFilter() As Boolean
  AllowFilter = cmdFilter.Enabled
End Property

'Parameters:
'[IN]   v , тип параметра: Boolean  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim value as Variant
' value = ...значение...
' me.AllowEdit = value
Public Property Let AllowEdit(ByVal v As Boolean)
  If v Then
    cmdEdit.Enabled = True
  Else
    cmdEdit.Enabled = False
  End If
  mnuEdit.Visible = cmdEdit.Enabled
End Property

'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as Boolean
' variable = me.AllowEdit
Public Property Get AllowEdit() As Boolean
  AllowEdit = cmdEdit.Enabled
End Property

'Parameters:
'[IN]   v , тип параметра: Boolean  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim value as Variant
' value = ...значение...
' me.AllowDel = value
Public Property Let AllowDel(ByVal v As Boolean)
  If v Then
    cmdDel.Enabled = True
  Else
    cmdDel.Enabled = False
  End If
  mnuDelete.Visible = cmdDel.Enabled
End Property

'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'  AddHint
'  AllowAdd
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as Boolean
' variable = me.AllowDel
Public Property Get AllowDel() As Boolean
  AllowDel = cmdDel.Enabled
End Property

'Parameters:
'[IN]   v , тип параметра: Boolean  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim value as Variant
' value = ...значение...
' me.AllowRun = value
Public Property Let AllowRun(ByVal v As Boolean)
  If v Then
    cmdRun.Enabled = True
  Else
    cmdRun.Enabled = False
  End If
  mnuRun.Visible = cmdRun.Enabled
End Property

'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as Boolean
' variable = me.AllowRun
Public Property Get AllowRun() As Boolean
  AllowRun = cmdRun.Enabled
End Property

'Parameters:
'[IN]   v , тип параметра: Boolean  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim value as Variant
' value = ...значение...
' me.AllowPrint = value
Public Property Let AllowPrint(ByVal v As Boolean)
  If v Then
    cmdPrn.Enabled = True
  Else
    cmdPrn.Enabled = False
  End If
  mnuPrn.Visible = cmdPrn.Enabled
End Property

'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as Boolean
' variable = me.AllowPrint
Public Property Get AllowPrint() As Boolean
  AllowPrint = cmdPrn.Enabled
End Property

'Parameters:
'[IN]   v , тип параметра: Boolean  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim value as Variant
' value = ...значение...
' me.AllowExport = value
Public Property Let AllowExport(ByVal v As Boolean)
  If v Then
    cmdExportXL.Enabled = True
  Else
    cmdExportXL.Enabled = False
  End If
  mnuExport.Visible = cmdExportXL.Enabled
End Property

'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as Boolean
' variable = me.AllowExport
Public Property Get AllowExport() As Boolean
  AllowExport = cmdExportXL.Enabled
End Property

Private Function JSession() As MTZSession.Session
  Set JSession = Journal.MTZSession
End Function

'Parameters:
' параметров нет
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
'  call me.ClearFilter()
Public Sub ClearFilter()
  Set m_Filter = Nothing
  Set m_Filter = New JFilters
End Sub

'Parameters:
' параметров нет
'Returns:
'  объект класса JFilters
'  ,или Nothing
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as JFilters
' Set variable = me.Filter
Public Property Get Filter() As JFilters
  If m_Filter Is Nothing Then
    Set m_Filter = New JFilters
  End If
  Set Filter = m_Filter
End Property

'Parameters:
' параметров нет
'Returns:
'  объект класса JOrders
'  ,или Nothing
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as JOrders
' Set variable = me.Order
Public Property Get Order() As JOrders
  If m_Order Is Nothing Then
    Set m_Order = New JOrders
  End If
  Set Order = m_Order
End Property

'Parameters:
' параметров нет
'Returns:
'  объект класса StatusColors
'  ,или Nothing
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as StatusColors
' Set variable = me.Colors
Public Property Get Colors() As StatusColors
  If m_Color Is Nothing Then
    Set m_Color = New StatusColors
  End If
  Set Colors = m_Color
End Property

Private Property Get MiniFilter() As JFilters
  If m_MiniFilter Is Nothing Then
    Set m_MiniFilter = New JFilters
  End If
  Set MiniFilter = m_MiniFilter
End Property

'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as Boolean
' variable = me.OpenModal
Public Property Get OpenModal() As Boolean
  OpenModal = m_Modal
End Property

'Parameters:
'[IN]   v , тип параметра: Boolean  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim value as Variant
' value = ...значение...
' me.OpenModal = value
Public Property Let OpenModal(ByVal v As Boolean)
  m_Modal = v
End Property

'Parameters:
'[IN][OUT]  v , тип параметра: MTZJrnl.Application  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim value as Variant
' set value = new Variant
' set me.Journal = value
Public Property Set Journal(v As MTZJrnl.Application)
  On Error Resume Next
  Dim noLoad As Boolean
  noLoad = False

   
  If Pager <> "" And Not JSession Is Null Then
      Call JSession.GetData("delete from #Pager where PagerID ='" & Pager & "'")
  End If
  
  Set M_Journal = v
  fmTop = 0
  
  Dim js As Long, idx As Long
  'Dim pv As MTZMetaModel.PARTVIEW
  'Dim part As MTZMetaModel.part
  Dim rs As ADODB.Recordset
  Dim jc As MTZJrnl.JournalColumn
  Dim col As GridEX20.JSColumn
again:
  On Error Resume Next
  gr.ItemCount = 0
  gr.Groups.Clear
  gr.SortKeys.Clear
  gr.Columns.Clear
  If M_Journal Is Nothing Then Exit Property
  Journal.JournalColumn.Sort = "sequence"
  
  If AllowSelection Then
    Set col = gr.Columns.Add("Выбор", jgexCheckBox, jgexEditCheckBox)
    col.TextAlignment = jgexAlignCenter
  End If
  
  cmbField.Clear
  For js = 1 To Journal.JournalColumn.Count
    Set jc = Journal.JournalColumn.Item(js)
    cmbField.AddItem jc.Name
    Set col = gr.Columns.Add(jc.Name, jgexText, jgexEditNone, jc.Name)
    
    
    If jc.ColSort = ColumnSortType_As_Date Then col.SortType = jgexSortTypeDateTime
    If jc.ColSort = ColumnSortType_As_Numeric Then col.SortType = jgexSortTypeNumeric
    If jc.ColSort = ColumnSortType_As_String Then col.SortType = jgexSortTypeString
    
    If jc.GroupAggregation = AggregationType_AVG Then col.AggregateFunction = jgexAvg
    If jc.GroupAggregation = AggregationType_COUNT Then col.AggregateFunction = jgexCount
    If jc.GroupAggregation = AggregationType_MAX Then col.AggregateFunction = jgexMax
    If jc.GroupAggregation = AggregationType_MIN Then col.AggregateFunction = jgexMin
    If jc.GroupAggregation = AggregationType_none Then col.AggregateFunction = jgexAggregateNone
    If jc.GroupAggregation = AggregationType_SUM Then col.AggregateFunction = jgexSum
    
    If jc.ColumnAlignment = VHAlignment_Center_Bottom Then col.TextAlignment = jgexAlignCenter
    If jc.ColumnAlignment = VHAlignment_Center_Top Then col.TextAlignment = jgexAlignCenter
    If jc.ColumnAlignment = VHAlignment_Center_Center Then col.TextAlignment = jgexAlignCenter
    If jc.ColumnAlignment = VHAlignment_Left_Bottom Then col.TextAlignment = jgexAlignLeft
    If jc.ColumnAlignment = VHAlignment_Left_Top Then col.TextAlignment = jgexAlignLeft
    If jc.ColumnAlignment = VHAlignment_Left_Center Then col.TextAlignment = jgexAlignLeft
    If jc.ColumnAlignment = VHAlignment_Right_Bottom Then col.TextAlignment = jgexAlignRight
    If jc.ColumnAlignment = VHAlignment_Right_Top Then col.TextAlignment = jgexAlignRight
    If jc.ColumnAlignment = VHAlignment_Right_Center Then col.TextAlignment = jgexAlignRight
  Next
  
  ' лишняя колонка для отображения состояния
  Set col = gr.Columns.Add("Состояние", jgexText, jgexEditNone, "Состояние")
  
  
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

'Parameters:
' параметров нет
'Returns:
'  объект класса MTZJrnl.Application
'  ,или Nothing
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as MTZJrnl.Application
' Set variable = me.Journal
Public Property Get Journal() As MTZJrnl.Application
  Set Journal = M_Journal
End Property



Private Sub AddConditionalFormatting()
Dim col As JSColumn
Dim fmtCon As JSFmtCondition
Dim i As Long



    gr.FmtConditions.Clear
    
    For i = 1 To Colors.Count
       
        Set col = gr.Columns("Состояние")
        'add a format condition for the products on sale
        Set fmtCon = gr.FmtConditions.Add(col.Index, jgexEqual, Colors.Item(i).StatusName)
        'Set FontBold property to True in the FormatStyle for this condition
        fmtCon.FormatStyle.ForeColor = Colors.Item(i).RowForeColor
        fmtCon.FormatStyle.BackColor = Colors.Item(i).RowBackColor
        'set the Group Condition too
       
    Next
    
'   With gr.FmtConditions
'        .ApplyGroupCondition = True
'        .ShowGroupConditionCount = True
'        .GroupConditionCountTitle = "On Sale"
'        Set fmtCon = .GroupCondition
'    End With
'
   

'    fmtCon.SetCondition col.Index, jgexEqual, True
'    fmtCon.FormatStyle.FontBold = True

'    'Add another format condition for discontinued products
'    Set col = gr.Columns("Discontinued")
'    Set fmtCon = gr.FmtConditions.Add(col.Index, jgexEqual, True)
'
'    'Set properties in the FormatStyle for this condition
'    fmtCon.FormatStyle.FontStrikethru = True
'    fmtCon.FormatStyle.ForeColor = vbGrayText
'
End Sub

'Parameters:
' параметров нет
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
'  call me.Refresh()
Public Sub Refresh()
  If Journal Is Nothing Then Exit Sub
  On Error GoTo bye
  
  AddConditionalFormatting
  
  fmTop = 0
  On Error Resume Next
  Dim cnt As Long
  
  Dim js As Long, idx As Long, i As Long, j As Long
  Dim rs As ADODB.Recordset
  Dim jcs As MTZJrnl.JColumnSource
  Dim jc As MTZJrnl.JournalColumn
  Dim jsrc As MTZJrnl.JournalSrc
  Dim fltr As JFilter
  Dim mfltr As JFilter
  
  gr.ItemCount = 0
  DoEvents
  
  Journal.JournalColumn.Sort = "sequence"
  
  cnt = Journal.JournalColumn.Count + 1  ' +1 для учета колонки с состоянием !!!
  
  
  
  LastCheckDate = JSession.GetServerTime()
  
  If Pager <> "" Then
      Call JSession.GetData("delete from #Pager where PagerID ='" & Pager & "'")
  End If
    
    
'   JSession.GetData ("CREATE TABLE [#Pager] (" & _
'    "[PagerID] [uniqueidentifier] NOT NULL ," & _
'    "[ViewID] [uniqueidentifier] NOT NULL ," & _
'    "[Sequence] [numeric](18, 0) IDENTITY (1, 1) NOT NULL ," & _
'    "[SessionID] [uniqueidentifier] NULL ," & _
'    "CONSTRAINT [PK_Pager] PRIMARY KEY  CLUSTERED" & _
'    "(" & _
'    "  [PagerID]," & _
'    "  [ViewID]" & _
'    ")" & _
'  ")")
    
  Pager = CreateGUID2
  
  ' prepare data for paging
  
  Dim ors As ADODB.Recordset
  Dim deford1 As String, deford2 As String
  
  
  For js = 1 To Journal.JournalSrc.Count
    Set jsrc = Journal.JournalSrc.Item(js)
    
    
    Set fltr = Nothing
    Set fltr = Filter.Item(jsrc.ViewAlias)
    Set mfltr = Nothing
    Set mfltr = MiniFilter.Item(jsrc.ViewAlias)
    
    
    If Order.Item(jsrc.ViewAlias) Is Nothing Then
        Set ors = JSession.GetRowsEx("Viewcolumn", jsrc.PARTVIEW, , , " order by sequence")
        
        cnt = 0
        While Not ors.EOF
         
          cnt = cnt + 1
      
          If ors!ForCombo <> 0 Then
            If deford1 <> "" Then
              deford1 = deford1 & ","
            End If
            deford1 = deford1 & "convert(varchar(20), isnull(" & ors!the_Alias & ",''))"
          End If
          
          If cnt <= 4 Then
            If deford2 <> "" Then
              deford2 = deford2 & ","
            End If
            deford2 = deford2 & "convert(varchar(20), isnull(" & ors!the_Alias & ",''))"
          End If
        
      
          ors.MoveNext
        Wend
        
        Set ors = Nothing
    
    
      
        If deford1 <> "" Then
          Order.Add deford1, jsrc.ViewAlias
        Else
          Order.Add "ID", jsrc.ViewAlias
        End If
      
      
    End If
    Err.Clear
    If Not fltr Is Nothing Then
      If Not mfltr Is Nothing Then
        Call JSession.GetData("insert into #Pager(PagerID,ViewID) select '" & Pager & "',ID from V_" & jsrc.ViewAlias & " where (" & fltr.FilterString & ") and (" & mfltr.FilterString & ") order by " & Order.Item(jsrc.ViewAlias).OrderString)
        If Err.Number <> 0 Then
          Call JSession.GetData("insert into #Pager(PagerID,ViewID) select '" & Pager & "',ID from V_" & jsrc.ViewAlias & " where (" & fltr.FilterString & ") and (" & mfltr.FilterString & ")")
        End If
      Else
        Call JSession.GetData("insert into #Pager(PagerID,ViewID) select '" & Pager & "',ID from V_" & jsrc.ViewAlias & " where " & fltr.FilterString & " order by " & Order.Item(jsrc.ViewAlias).OrderString)
        If Err.Number <> 0 Then
          Call JSession.GetData("insert into #Pager(PagerID,ViewID) select '" & Pager & "',ID from V_" & jsrc.ViewAlias & " where " & fltr.FilterString)
        End If
      End If
    Else
      If Not mfltr Is Nothing Then
        Call JSession.GetData("insert into #Pager(PagerID,ViewID) select '" & Pager & "',ID from V_" & jsrc.ViewAlias & " where (" & mfltr.FilterString & ")  order by " & Order.Item(jsrc.ViewAlias).OrderString)
        If Err.Number <> 0 Then
          Call JSession.GetData("insert into #Pager(PagerID,ViewID) select '" & Pager & "',ID from V_" & jsrc.ViewAlias & " where (" & mfltr.FilterString & ")")
        End If

      Else
        Call JSession.GetData("insert into #Pager(PagerID,ViewID) select '" & Pager & "',ID from V_" & jsrc.ViewAlias & " order by " & Order.Item(jsrc.ViewAlias).OrderString)
        If Err.Number <> 0 Then
          Call JSession.GetData("insert into #Pager(PagerID,ViewID) select '" & Pager & "',ID from V_" & jsrc.ViewAlias)
        End If
      End If
    End If
    
    Set fltr = Nothing
  Next
  
  Erase mvarFieldArray
  
  '-2 - InstanceID; -1 - RowID;  0 - VIEWBASE
  ReDim mvarFieldArray(-3 To cnt, 0 To PageSize)
  
  Set rs = JSession.GetData(" select min(sequence) minseq ,max(sequence) maxseq from #Pager where pagerid='" & Pager & "'")
  
  MinLine = rs!minseq
  MaxLine = rs!maxseq
  CurrentTop = MinLine

  RefreshPage
  REFRESHTIMER.Enabled = True
  Exit Sub
bye:
'  Stop
'  Resume
MsgBox Err.Description, vbCritical + vbOKOnly, "Обновление журнала"
End Sub

'Parameters:
' параметров нет
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
'  call me.RefreshPage()
Public Sub RefreshPage()
  If Journal Is Nothing Then Exit Sub
  On Error GoTo bye
  
  fmTop = 0
  On Error Resume Next
  Dim cnt As Long
  
  Dim js As Long, idx As Long, i As Long, j As Long
  Dim rs As ADODB.Recordset
  Dim jcs As MTZJrnl.JColumnSource
  Dim jc As MTZJrnl.JournalColumn
  Dim jsrc As MTZJrnl.JournalSrc
  Dim fltr As JFilter
  Dim curcnt As Long
  
  gr.ItemCount = 0
  DoEvents
  
  
  LastCheckDate = JSession.GetServerTime()
  
  
  Erase mvarFieldArray
  cnt = Journal.JournalColumn.Count + 1
   
  '-2 - InstanceID; -1 - RowID;  0 - VIEWBASE
  ReDim mvarFieldArray(-3 To cnt, 0 To PageSize + 1)
  
  For js = 1 To Journal.JournalSrc.Count
    Set jsrc = Journal.JournalSrc.Item(js)
    Set rs = JSession.GetData(" select * from v_" & jsrc.ViewAlias & "  join #Pager XXXX on ID = XXXX.ViewID and XXXX.PagerID ='" & Pager & "' and XXXX.sequence >=" & CurrentTop & " and XXXX.sequence <=" & (CurrentTop + PageSize) & " order by XXXX.sequence ")
    
    If Not rs Is Nothing Then
      On Error Resume Next
      
      'ReDim Preserve mvarFieldArray(-2 To cnt, 0 To fmTop + rs.RecordCount)
      idx = 1
      curcnt = 0
      While Not rs.EOF
        mvarFieldArray(-3, fmTop + idx) = 0
        mvarFieldArray(-2, fmTop + idx) = rs!Instanceid
        mvarFieldArray(-1, fmTop + idx) = rs!ID
        mvarFieldArray(0, fmTop + idx) = rs!ViewBase
        
        For i = 1 To Journal.JournalColumn.Count
          Set jc = Journal.JournalColumn.Item(i)
          For j = 1 To jc.JColumnSource.Count
            Set jcs = jc.JColumnSource.Item(j)
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
        curcnt = curcnt + 1
      Wend
      fmTop = fmTop + curcnt 'rs.RecordCount
      
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
  
  Exit Sub
bye:
'  Stop
'  Resume
MsgBox Err.Description, vbCritical + vbOKOnly, "Обновление журнала"
End Sub


Private Sub RefreshInfo()
  lblInfo.Caption = gr.ItemCount & " из " & (MaxLine - MinLine + 1) & " с " & IIf(CurrentTop - MinLine + 1 < 0, 1, CurrentTop - MinLine + 1)
End Sub

'Parameters:
'[IN]   col , тип параметра: Long,
'[IN]   Row , тип параметра: Long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as Variant
' variable = me.FieldMatrix(...параметры...)
' Set variable = me.FieldMatrix(...параметры...)
Public Property Get FieldMatrix(ByVal col As Long, ByVal Row As Long) As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.FieldArray
    FieldMatrix = Empty
    On Error Resume Next
    
    FieldMatrix = mvarFieldArray(col, Row)
End Property

'Parameters:
'[IN]   Row , тип параметра: Long  - ...
'Returns:
'  значение типа String
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as String
' variable = me.RowID(...параметры...)
Public Property Get RowID(ByVal Row As Long) As String
    On Error Resume Next
    RowID = mvarFieldArray(-1, Row)
End Property

'Parameters:
'[IN]   Row , тип параметра: Long  - ...
'Returns:
'  значение типа String
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as String
' variable = me.RowInstanceID(...параметры...)
Public Property Get RowInstanceID(ByVal Row As Long) As String
    On Error Resume Next
    RowInstanceID = mvarFieldArray(-2, Row)
End Property

'Parameters:
'[IN]   Row , тип параметра: Long  - ...
'Returns:
'  значение типа Integer
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as Integer
' variable = me.RowSelected(...параметры...)
Public Property Get RowSelected(ByVal Row As Long) As Integer
    On Error Resume Next
    RowSelected = mvarFieldArray(-3, Row)
End Property

'Parameters:
'[IN]   Row , тип параметра: Long  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  UnSelectRow
'  ViewBase
'Example:
'  call me.SelectRow(...параметры...)
Public Sub SelectRow(ByVal Row As Long)
    On Error Resume Next
    mvarFieldArray(-3, Row) = 1
End Sub

'Parameters:
'[IN]   Row , тип параметра: Long  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  ViewBase
'Example:
'  call me.UnSelectRow(...параметры...)
Public Sub UnSelectRow(ByVal Row As Long)
    On Error Resume Next
    mvarFieldArray(-3, Row) = 0
End Sub

'Parameters:
'[IN]   Row , тип параметра: Long  - ...
'Returns:
'  значение типа String
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'Example:
' dim variable as String
' variable = me.ViewBase(...параметры...)
Public Property Get ViewBase(ByVal Row As Long) As String
    On Error Resume Next
    ViewBase = mvarFieldArray(0, Row)
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа Long
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as Long
' variable = me.RowCount
Public Property Get RowCount() As Long
    On Error Resume Next
    RowCount = fmTop
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа Long
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as Long
' variable = me.Row
Public Property Get Row() As Long
    On Error Resume Next
    Row = gr.RowIndex(gr.Row)
End Property

'Parameters:
'[IN][OUT]  r , тип параметра: Long  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim value as Variant
' value = ...значение...
' me.Row = value
Public Property Let Row(r As Long)
    On Error Resume Next
    If r > 0 And r <= gr.ItemCount Then
      gr.Row = r
    End If
End Property

'Parameters:
'[IN]   col , тип параметра: Long,
'[IN]   Row , тип параметра: Long,
'[IN]   vData , тип параметра: Variant  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim value as Variant
' value = ...значение...
' me.FieldMatrix(...параметры...) = value
Public Property Let FieldMatrix(ByVal col As Long, ByVal Row As Long, ByVal vData As Variant)
    On Error Resume Next
    mvarFieldArray(col, Row) = vData
End Property

'Parameters:
'[IN]   col , тип параметра: Long,
'[IN]   Row , тип параметра: Long,
'[IN]   vData , тип параметра: Variant  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim value as Variant
' set value = new Variant
' set me.FieldMatrix(...параметры...) = value
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

'Private Sub cmdPgDn_Click()
'    If CurrentTop + PageSize > MaxLine - PageSize Then
'        CurrentTop = MaxLine - PageSize
'    Else
'        CurrentTop = CurrentTop + PageSize
'    End If
'    RefreshPage
'End Sub

'Private Sub cmdPgUp_Click()
'    If CurrentTop - PageSize < MinLine Then
'        CurrentTop = MinLine
'    Else
'        CurrentTop = CurrentTop - PageSize
'    End If
'    RefreshPage
'End Sub

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



'Private Sub cmdTop_Click()
'
'End Sub

'Private Sub cmdUp_Click()
'
'End Sub

'Private Sub cmdTop_Click()
'CurrentTop = MinLine
'RefreshPage
'End Sub
'
'Private Sub cmdUp_Click()
'  If (gr.RowCount > 0) Then
'    gr.Row = 1
'    Call gr.EnsureVisible(1)
'  End If
'End Sub



Private Sub cmdTop_Click()
If inPageBtn Then Exit Sub
inPageBtn = True
CurrentTop = MinLine
RefreshPage
inPageBtn = False
End Sub

Private Sub cmdUp_Click()
  If (gr.RowCount > 0) Then
    gr.Row = 1
    Call gr.EnsureVisible(1)
  End If
End Sub
Private Sub cmdPgDn_Click()
  If inPageBtn Then Exit Sub
  inPageBtn = True
  
  If CurrentTop + PageSize > MaxLine - PageSize Then
      CurrentTop = MaxLine - PageSize
  Else
      CurrentTop = CurrentTop + PageSize
  End If
  RefreshPage
      
  inPageBtn = False
End Sub

Private Sub cmdPgUp_Click()
  If inPageBtn Then Exit Sub
  inPageBtn = True
  
  If CurrentTop - PageSize < MinLine Then
      CurrentTop = MinLine
  Else
      CurrentTop = CurrentTop - PageSize
  End If
  RefreshPage
  
  inPageBtn = False
End Sub

Private Sub cmdBottom_Click()
If inPageBtn Then Exit Sub
  inPageBtn = True
  
CurrentTop = MaxLine - PageSize
RefreshPage
  inPageBtn = False
End Sub

Private Sub gr_ColumnHeaderClick(ByVal Column As GridEX20.JSColumn)

  Dim SortOrder As Integer
  Dim jsrc As JournalSrc
  SortOrder = Column.SortOrder
  
  
  If SortOrder = jgexSortAscending Then
    gr.SortKeys.Clear
    gr.SortKeys.Add Column.Index, jgexSortDescending
  Else
    gr.SortKeys.Clear
    gr.SortKeys.Add Column.Index, jgexSortAscending
  End If
  Dim DefSort As String

  
  Dim i As Long, js As Long, jc As Long, jcs As Long
  
  
  For js = 1 To Journal.JournalSrc.Count
    Set jsrc = Journal.JournalSrc.Item(js)
    DefSort = ""
    For i = 1 To gr.SortKeys.Count
      If gr.SortKeys.Item(i).SortOrder = jgexSortAscending Then
        If AllowSelection Then
          jc = gr.SortKeys.Item(i).ColIndex - 1
        Else
          jc = gr.SortKeys.Item(i).ColIndex
        End If
        
        If jc <= Journal.JournalColumn.Count Then
          For jcs = 1 To Journal.JournalColumn.Item(jc).JColumnSource.Count
            If Journal.JournalColumn.Item(jc).JColumnSource.Item(jcs).SrcPartView Is jsrc Then
              If DefSort <> "" Then
                DefSort = DefSort & ","
              End If
              DefSort = DefSort & Journal.JournalColumn.Item(jc).JColumnSource.Item(jcs).ViewField
            End If
          Next
        Else
          If Column = "Состояние" Then
              If DefSort <> "" Then
                DefSort = DefSort & ","
              End If
              DefSort = DefSort & "StatusName"
          End If
        End If
        
      End If
            
      If gr.SortKeys.Item(i).SortOrder = jgexSortDescending Then
        If AllowSelection Then
          jc = gr.SortKeys.Item(i).ColIndex - 1
        Else
          jc = gr.SortKeys.Item(i).ColIndex
        End If
        
        If jc <= Journal.JournalColumn.Count Then
          For jcs = 1 To Journal.JournalColumn.Item(jc).JColumnSource.Count
            If Journal.JournalColumn.Item(jc).JColumnSource.Item(jcs).SrcPartView Is jsrc Then
              If DefSort <> "" Then
                DefSort = DefSort & ","
              End If
              DefSort = DefSort & Journal.JournalColumn.Item(jc).JColumnSource.Item(jcs).ViewField & " DESC "
            End If
          Next
        Else
          If Column = "Состояние" Then
              If DefSort <> "" Then
                DefSort = DefSort & ","
              End If
              DefSort = DefSort & "StatusName DESC"
          End If
        End If
      End If
    Next
    Order.Add DefSort, jsrc.ViewAlias
  Next
  Refresh
  
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
     If AllowSelection Then
      FieldMatrix(-3, ri) = 1 - FieldMatrix(-3, ri)
      gr.RefreshRowIndex ri
     Else
      Set o1 = Journal.Manager.GetInstanceObject(RowInstanceID(ri), Journal.MTZSession.Site)
      RaiseEvent JVGetDocMode(o1, mode, IsDenied)
      If IsDenied Then
        MsgBox "Не разрешено открывать документы такого типа", vbCritical + vbOKOnly, Journal.Name
        Exit Sub
      End If
      Set o2 = Journal.Manager.GetInstanceGUI(o1.ID)
      o2.Show mode, o1, m_Modal
     End If
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
  If AllowSelection Then
    Values(1) = mvarFieldArray(-3, RowIndex)
    For i = 1 To Journal.JournalColumn.Count + 1
      Values(i + 1) = FieldMatrix(i, RowIndex)
    Next
  Else
    For i = 1 To Journal.JournalColumn.Count + 1
      Values(i) = FieldMatrix(i, RowIndex)
    Next
  End If
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
  Dim jc As MTZJrnl.JournalColumn
  Dim jsrc As MTZJrnl.JournalSrc
  Dim lastID As String
  Dim DetectDelete As Boolean


  Dim NextCheckDate As Date
  Dim maybe As Boolean
  NextCheckDate = JSession.GetServerTime()
  Dim idh As idholder
  maybe = False
  lastID = RowID(gr.Row)
  DetectDelete = False


  For js = 1 To Journal.JournalSrc.Count
    Set jsrc = Journal.JournalSrc.Item(js)
    Set idh = ViewMap.Item(jsrc.PARTVIEW)
    If JSession.IsORACLE Then
      Set rs = JSession.GetRowsEx("SysLog", , , "LogStructID='" & idh.N2 & "' and ChangeStamp >=" & MakeORACLEDate(LastCheckDate) & " and ChangeStamp < " & MakeORACLEDate(NextCheckDate) & " and VERB in ('CREATEROW','EDITROW','DELETEROW')", " order by ChangeStamp")
    Else
      Set rs = JSession.GetRowsEx("SysLog", , , "LogStructID='" & idh.N2 & "' and ChangeStamp >=" & MakeMSSQLDate(LastCheckDate) & " and ChangeStamp < " & MakeMSSQLDate(NextCheckDate) & " and VERB in ('CREATEROW','EDITROW','DELETEROW')", " order by ChangeStamp")
    End If
    Debug.Print rs.Source
    'Debug.Print "ChangeStamp >=" & MakeMSSQLDate(LastCheckDate) & " and ChangeStamp < " & MakeMSSQLDate(NextCheckDate)

    If Not rs Is Nothing Then
      While Not rs.EOF
        If rs!Verb = "DELETEROW" Then
          DetectDelete = DetectDelete Or DeleteRow(jsrc.ViewAlias, rs!the_Resource)
        Else

'          If rs!Verb = "CREATEROW" Then
'            Debug.Print "CREATED"
'          End If

          DetectDelete = DetectDelete Or RefreshOrAppendRow(jsrc.ViewAlias, rs!the_Resource)
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

  If DetectDelete Then
    RefreshPage
  Else
    If m_StatusUpdate Then
      gr.Refresh
      maybe = True
    End If
    If maybe Then
      gr.RefreshGroups
      gr.RefreshSort
    End If
  End If
  
  LastCheckDate = NextCheckDate
  

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
  lblInfo.Left = UserControl.ScaleWidth - lblInfo.Width
  cmdDown.Left = lblInfo.Left - 22 * Screen.TwipsPerPixelX
  cmdUp.Left = lblInfo.Left - 44 * Screen.TwipsPerPixelX
  cmdBottom.Left = lblInfo.Left - 66 * Screen.TwipsPerPixelX
  cmdPgDn.Left = lblInfo.Left - 88 * Screen.TwipsPerPixelX
  cmdPgUp.Left = lblInfo.Left - 110 * Screen.TwipsPerPixelX
  cmdTop.Left = lblInfo.Left - 132 * Screen.TwipsPerPixelX
  
End Sub


Private Sub UserControl_Terminate()
  On Error Resume Next
  REFRESHTIMER.Enabled = False
  gr.ItemCount = 0
  
  If Pager <> "" Then
      Call JSession.GetData("delete from #Pager where PagerID ='" & Pager & "'")
  End If

  
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

'Parameters:
'[IN]   ViewName , тип параметра: String,
'[IN]   RowID , тип параметра: String  - ...
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as Boolean
' variable = me.RefreshOrAppendRow(...параметры...)
Public Function RefreshOrAppendRow(ByVal ViewName As String, ByVal RowID As String) As Boolean
  Dim rs As Recordset
  Dim f As ADODB.FIELD
  
  Dim c As Collection
  Dim o As Variant
    
  Dim fltr As JFilter
  Dim mfltr As JFilter
  
  RefreshOrAppendRow = False
  
  '-2 - InstanceID; -1 - RowID;  0 - VIEWBASE
  'ReDim mvarFieldArray(-2 To cnt, 0 To 0)
    
  Set fltr = Nothing
  Set fltr = Filter.Item(ViewName)
  
  
  Set mfltr = Nothing
  Set mfltr = MiniFilter.Item(ViewName)

'  If Not fltr Is Nothing Then
'    Set rs = JSession.GetRows("v_" & ViewName, , , "ID='" & RowID & "' and  " & fltr.FilterString)
'  Else
'    Set rs = JSession.GetRows("v_" & ViewName, , , "ID='" & RowID & "'")
'  End If

  If Not fltr Is Nothing Then
    If Not mfltr Is Nothing Then
       Set rs = JSession.GetRows("v_" & ViewName, , , "ID='" & RowID & "' and  (" & mfltr.FilterString & " ) and ( " & fltr.FilterString & " )")
    Else
       Set rs = JSession.GetRows("v_" & ViewName, , , "ID='" & RowID & "' and  " & fltr.FilterString)
    End If
  Else
    If Not mfltr Is Nothing Then
      Set rs = JSession.GetRows("v_" & ViewName, , , "ID='" & RowID & "' and  " & mfltr.FilterString)

    Else
      Set rs = JSession.GetRows("v_" & ViewName, , , "ID='" & RowID & "'")
    End If
  End If
  
  
  Set fltr = Nothing
  Set mfltr = Nothing
    
  
  
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
  
  If Not rs Is Nothing Then
    If rs.EOF Then
      If RowNum <> -1 Then
        ' строка изменилась так, что не попадает в фильтр!!!
        RefreshOrAppendRow = True
      End If
    End If
  End If
  
  If rs Is Nothing Then Exit Function
  If rs.EOF Then Exit Function
  
  ' добавляем строку, если она новая
  If RowNum = -1 Then
      On Error Resume Next
      ReDim Preserve mvarFieldArray(-3 To Journal.JournalColumn.Count + 1, 0 To cnt + 1)
      mvarFieldArray(-3, cnt + 1) = 0
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
End Function

'Parameters:
'[IN]   ViewName , тип параметра: String,
'[IN]   Instanceid , тип параметра: String  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
'  call me.RefreshStatus(...параметры...)
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
                ReDim Preserve mvarFieldArray(-3 To Journal.JournalColumn.Count + 1, 0 To cnt + 1)
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
              ReDim Preserve mvarFieldArray(-3 To Journal.JournalColumn.Count + 1, 0 To cnt + 1)
              mvarFieldArray(-2, cnt + 1) = rs!Instanceid
              mvarFieldArray(-1, cnt + 1) = rs!ID
              mvarFieldArray(-0, cnt + 1) = rs!ViewBase
              mvarFieldArray(Journal.JournalColumn.Count + 1, cnt + 1) = rs.Fields("StatusName").Value & ""
              cnt = cnt + 1
              RowNum = cnt
              RefreshRowByNum RowNum
          End If
            
         
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


Private Function DeleteRow(ByVal ViewName As String, ByVal RowID As String) As Boolean
  Dim rs As Recordset
  Dim f As ADODB.FIELD
  
  Dim c As Collection
  Dim o As Variant
    
  Dim fltr As JFilter
  DeleteRow = False
  
  '-2 - InstanceID; -1 - RowID;  0 - VIEWBASE
  'ReDim mvarFieldArray(-2 To cnt, 0 To 0)
    
'  Set fltr = Nothing
'  Set fltr = Filter.Item(ViewName)
'  If Not fltr Is Nothing Then
'    Set rs = JSession.GetRows("v_" & ViewName, , , "ID='" & RowID & "' and  " & fltr.FilterString)
'  Else
'    Set rs = JSession.GetRows("v_" & ViewName, , , "ID='" & RowID & "'")
'  End If
'  Set fltr = Nothing
'
'
'  If rs Is Nothing Then Exit Function
  
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
'      ' поднимаем все строки на одну вверх
'      For i = RowNum To cnt - 1
'        For j = -2 To Journal.JournalColumn.Count
'          mvarFieldArray(j, i) = mvarFieldArray(j, i + 1)
'        Next
'      Next
'      ' подрезаем хвост у массива
'      ReDim Preserve mvarFieldArray(-2 To Journal.JournalColumn.Count + 1, 0 To cnt - 1)
'      cnt = cnt - 1
      DeleteRow = True
  End If
  
'  If gr.ItemCount <> cnt Then
'   gr.ItemCount = cnt
'   gr.Refresh
'   fmTop = cnt
'  End If
nxt:
'  rs.Close
'  Set rs = Nothing
End Function

'Parameters:
'[IN]   ID , тип параметра: String  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
'  call me.RefreshRow(...параметры...)
Public Sub RefreshRow(ByVal ID As String)
  On Error Resume Next
  Dim cnt As Long, RowNum As Long
  Dim js As Long, idx As Long, i As Long, j As Long
  Dim pv As MTZMetaModel.PARTVIEW
  Dim rs As ADODB.Recordset
  Dim jcs As MTZJrnl.JColumnSource
  Dim jc As MTZJrnl.JournalColumn
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
  Dim jc As MTZJrnl.JournalColumn
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
          Set jc = Journal.JournalColumn.Item(i)
          For j = 1 To jc.JColumnSource.Count
            Set jcs = jc.JColumnSource.Item(j)
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
  Next
  gr.RefreshRowIndex RowNum
End Sub

'Parameters:
'[IN]   v , тип параметра: String  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim value as Variant
' value = ...значение...
' me.EditCommandTip = value
Public Property Let EditCommandTip(ByVal v As String)
  cmdEdit.ToolTipText = v
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as String
' variable = me.EditCommandTip
Public Property Get EditCommandTip() As String
  EditCommandTip = cmdEdit.ToolTipText
End Property

'Parameters:
'[IN]   v , тип параметра: String  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim value as Variant
' value = ...значение...
' me.RunCommandTip = value
Public Property Let RunCommandTip(ByVal v As String)
  cmdRun.ToolTipText = v
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  PrnCommandTip
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as String
' variable = me.RunCommandTip
Public Property Get RunCommandTip() As String
  RunCommandTip = cmdRun.ToolTipText
End Property

'Parameters:
'[IN]   v , тип параметра: String  - ...
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim value as Variant
' value = ...значение...
' me.PrnCommandTip = value
Public Property Let PrnCommandTip(ByVal v As String)
  cmdPrn.ToolTipText = v
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  AddHint
'  AllowAdd
'  AllowDel
'  AllowEdit
'  AllowExport
'  AllowFilter
'  AllowPrint
'  AllowRun
'  AllowSelection
'  CfgHint
'  ClearFilter
'  Colors
'  DelHint
'  EditCommandTip
'  EditHint
'  ExportHint
'  FieldMatrix
'  Filter
'  GridHint
'  Journal
'  JVDblClick
'  JVGetDocMode
'  JVIsDocDeletable
'  JVOnAdd
'  JVOnClearFilter
'  JVOnDel
'  JVOnEdit
'  JVOnExport
'  JVOnFilter
'  JVOnPrint
'  JVOnRun
'  JVRowColChange
'  OpenHint
'  OpenModal
'  Order
'  PrintHint
'  Refresh
'  RefreshOrAppendRow
'  RefreshPage
'  RefreshRow
'  RefreshStatus
'  Row
'  RowCount
'  RowID
'  RowInstanceID
'  RowSelected
'  RunCommandTip
'  RunHint
'  RunMenuName
'  SelectRow
'  UnSelectRow
'  ViewBase
'Example:
' dim variable as String
' variable = me.PrnCommandTip
Public Property Get PrnCommandTip() As String
  PrnCommandTip = cmdPrn.ToolTipText
End Property

