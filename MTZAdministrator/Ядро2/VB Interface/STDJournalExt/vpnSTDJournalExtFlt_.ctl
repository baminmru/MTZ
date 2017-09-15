VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnSTDJournalExtFlt_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerSTDJournalExtField 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerSTDJournalExtFlt 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlSTDJournalExtFlt 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdSTDJournalExtFieldAcc 
         Height          =   330
         Left            =   3075
         Style           =   1  'Graphical
         TabIndex        =   20
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin MTZ_PANEL.DropButton cmdSTDJournalExtFieldRun 
         Height          =   330
         Left            =   2700
         TabIndex        =   19
         Tag             =   "run.ico"
         ToolTipText     =   "Открыть"
         Top             =   30
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   582
         Caption         =   ""
      End
      Begin VB.CommandButton cmdSTDJournalExtFieldFnd 
         Height          =   330
         Left            =   2325
         Style           =   1  'Graphical
         TabIndex        =   18
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdSTDJournalExtFieldCfg 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   17
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdSTDJournalExtFieldPrn 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   16
         Tag             =   "PrintPreview.ico"
         ToolTipText     =   "Печать"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdSTDJournalExtFieldRef 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   15
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdSTDJournalExtFieldDel 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   14
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdSTDJournalExtFieldEdit 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   13
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdSTDJournalExtFieldAdd 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   12
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin GridEX20.GridEX gridSTDJournalExtField 
         Height          =   480
         Left            =   3900
         TabIndex        =   11
         Top             =   2760
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
         Version         =   "2.0"
         AutomaticSort   =   -1  'True
         RecordNavigatorString=   "Запись:|из"
         BoundColumnIndex=   ""
         ReplaceColumnIndex=   ""
         ScrollToolTipColumn=   ""
         TabKeyBehavior  =   1
         HideSelection   =   2
         SelectionStyle  =   1
         GroupByBoxInfoText=   "Группировка"
         AllowDelete     =   -1  'True
         AllowEdit       =   0   'False
         ItemCount       =   0
         DataMode        =   99
         ColumnHeaderHeight=   285
         IntProp1        =   0
         IntProp2        =   0
         IntProp7        =   0
         ColumnsCount    =   2
         Column(1)       =   "vpnSTDJournalExtFlt_.ctx":0000
         Column(2)       =   "vpnSTDJournalExtFlt_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnSTDJournalExtFlt_.ctx":016C
         FormatStyle(2)  =   "vpnSTDJournalExtFlt_.ctx":02C8
         FormatStyle(3)  =   "vpnSTDJournalExtFlt_.ctx":0378
         FormatStyle(4)  =   "vpnSTDJournalExtFlt_.ctx":042C
         FormatStyle(5)  =   "vpnSTDJournalExtFlt_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnSTDJournalExtFlt_.ctx":05BC
      End
      Begin VB.CommandButton cmdSTDJournalExtFltAcc 
         Height          =   330
         Left            =   3075
         Style           =   1  'Graphical
         TabIndex        =   10
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin MTZ_PANEL.DropButton cmdSTDJournalExtFltRun 
         Height          =   330
         Left            =   2700
         TabIndex        =   9
         Tag             =   "run.ico"
         ToolTipText     =   "Открыть"
         Top             =   30
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   582
         Caption         =   ""
      End
      Begin VB.CommandButton cmdSTDJournalExtFltFnd 
         Height          =   330
         Left            =   2325
         Style           =   1  'Graphical
         TabIndex        =   8
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdSTDJournalExtFltCfg 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   7
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdSTDJournalExtFltPrn 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   6
         Tag             =   "PrintPreview.ico"
         ToolTipText     =   "Печать"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdSTDJournalExtFltRef 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   5
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdSTDJournalExtFltDel 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   4
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdSTDJournalExtFltEdit 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   3
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdSTDJournalExtFltAdd 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   2
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin GridEX20.GridEX gridSTDJournalExtFlt 
         Height          =   480
         Left            =   3900
         TabIndex        =   1
         Top             =   2760
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
         Version         =   "2.0"
         AutomaticSort   =   -1  'True
         RecordNavigatorString=   "Запись:|из"
         BoundColumnIndex=   ""
         ReplaceColumnIndex=   ""
         ScrollToolTipColumn=   ""
         TabKeyBehavior  =   1
         HideSelection   =   2
         SelectionStyle  =   1
         GroupByBoxInfoText=   "Группировка"
         AllowDelete     =   -1  'True
         AllowEdit       =   0   'False
         ItemCount       =   0
         DataMode        =   99
         ColumnHeaderHeight=   285
         IntProp1        =   0
         IntProp2        =   0
         IntProp7        =   0
         ColumnsCount    =   2
         Column(1)       =   "vpnSTDJournalExtFlt_.ctx":0794
         Column(2)       =   "vpnSTDJournalExtFlt_.ctx":085C
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnSTDJournalExtFlt_.ctx":0900
         FormatStyle(2)  =   "vpnSTDJournalExtFlt_.ctx":0A5C
         FormatStyle(3)  =   "vpnSTDJournalExtFlt_.ctx":0B0C
         FormatStyle(4)  =   "vpnSTDJournalExtFlt_.ctx":0BC0
         FormatStyle(5)  =   "vpnSTDJournalExtFlt_.ctx":0C98
         ImageCount      =   0
         PrinterProperties=   "vpnSTDJournalExtFlt_.ctx":0D50
      End
   End
   Begin VB.Menu mnuPopupSTDJournalExtFlt 
      Caption         =   "Меню для Фильтры журнала"
      Visible         =   0   'False
      Begin VB.Menu mnuSTDJournalExtFltAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuSTDJournalExtFltEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuSTDJournalExtFltDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuSTDJournalExtFltOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuSTDJournalExtFltRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuSTDJournalExtFltS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSTDJournalExtFltBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuSTDJournalExtFltCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuSTDJournalExtFltCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuSTDJournalExtFltPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuSTDJournalExtFltCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuSTDJournalExtFltCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuSTDJournalExtFltPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuSTDJournalExtFltCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuSTDJournalExtFltFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuSTDJournalExtFltAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupSTDJournalExtField 
      Caption         =   "Меню для Параметры фильтра"
      Visible         =   0   'False
      Begin VB.Menu mnuSTDJournalExtFieldAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuSTDJournalExtFieldEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuSTDJournalExtFieldDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuSTDJournalExtFieldOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuSTDJournalExtFieldRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuSTDJournalExtFieldS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSTDJournalExtFieldBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuSTDJournalExtFieldCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuSTDJournalExtFieldCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuSTDJournalExtFieldPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuSTDJournalExtFieldCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuSTDJournalExtFieldCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuSTDJournalExtFieldPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuSTDJournalExtFieldCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuSTDJournalExtFieldFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuSTDJournalExtFieldAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnSTDJournalExtFlt_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель для работы со строками раздела
Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndSTDJournalExtFlt As Object
Private menuActionSTDJournalExtFlt As String
Private fndSTDJournalExtField As Object
Private menuActionSTDJournalExtField As String





Private Sub pnlSTDJournalExtFlt_PositionChanged()
  pnlSTDJournalExtFlt.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridSTDJournalExtFlt_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdSTDJournalExtFltCfg_Click
        End If
    End If
End Sub

Private Sub gridSTDJournalExtFlt_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupSTDJournalExtFlt
End If
End Sub
Private Sub mnuSTDJournalExtFltAdd_click()
   menuActionSTDJournalExtFlt = "ADD"
   menuTimerSTDJournalExtFlt.Enabled = True
End Sub
Private Sub mnuSTDJournalExtFltEdit_click()
   menuActionSTDJournalExtFlt = "EDIT"
   menuTimerSTDJournalExtFlt.Enabled = True
End Sub
Private Sub mnuSTDJournalExtFltDelete_click()
   menuActionSTDJournalExtFlt = "DEL"
   menuTimerSTDJournalExtFlt.Enabled = True
End Sub
Private Sub mnuSTDJournalExtFltOpen_click()
   menuActionSTDJournalExtFlt = "RUN"
   menuTimerSTDJournalExtFlt.Enabled = True
End Sub
Private Sub mnuSTDJournalExtFltRef_click()
   menuActionSTDJournalExtFlt = "REF"
   menuTimerSTDJournalExtFlt.Enabled = True
End Sub
  Private Sub mnuSTDJournalExtFltCOPY_Click()
    On Error Resume Next
    If gridSTDJournalExtFlt.ItemCount = 0 Then Exit Sub
    If gridSTDJournalExtFlt.Row > 0 Then
     If gridSTDJournalExtFlt.RowIndex(gridSTDJournalExtFlt.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridSTDJournalExtFlt.RowBookmark(gridSTDJournalExtFlt.RowIndex(gridSTDJournalExtFlt.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuSTDJournalExtFltCUT_Click()
    On Error Resume Next
    If gridSTDJournalExtFlt.ItemCount = 0 Then Exit Sub
    If gridSTDJournalExtFlt.Row > 0 Then
     If gridSTDJournalExtFlt.RowIndex(gridSTDJournalExtFlt.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridSTDJournalExtFlt.RowBookmark(gridSTDJournalExtFlt.RowIndex(gridSTDJournalExtFlt.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridSTDJournalExtFlt.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuSTDJournalExtFltCHANGE_Click()
  On Error Resume Next
  If gridSTDJournalExtFlt.ItemCount = 0 Then Exit Sub
  If gridSTDJournalExtFlt.Row > 0 Then
   If gridSTDJournalExtFlt.RowIndex(gridSTDJournalExtFlt.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridSTDJournalExtFlt.RowBookmark(gridSTDJournalExtFlt.RowIndex(gridSTDJournalExtFlt.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridSTDJournalExtFlt.ItemCount = u.Parent.Count
      gridSTDJournalExtFlt.RefreshRowIndex gridSTDJournalExtFlt.RowIndex(gridSTDJournalExtFlt.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuSTDJournalExtFltCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuSTDJournalExtFltPrn_click()
   menuActionSTDJournalExtFlt = "PRN"
   menuTimerSTDJournalExtFlt.Enabled = True
End Sub
Private Sub mnuSTDJournalExtFltCfg_click()
   menuActionSTDJournalExtFlt = "CFG"
   menuTimerSTDJournalExtFlt.Enabled = True
End Sub
Private Sub mnuSTDJournalExtFltFind_click()
   menuActionSTDJournalExtFlt = "FND"
   menuTimerSTDJournalExtFlt.Enabled = True
End Sub
Private Sub mnuSTDJournalExtFltAcc_click()
   menuActionSTDJournalExtFlt = "ACC"
   menuTimerSTDJournalExtFlt.Enabled = True
End Sub
Private Sub menuTimerSTDJournalExtFlt_timer()
   menuTimerSTDJournalExtFlt.Enabled = False
   If menuActionSTDJournalExtFlt = "ADD" Then cmdSTDJournalExtFltAdd_Click
   If menuActionSTDJournalExtFlt = "EDIT" Then cmdSTDJournalExtFltEdit_Click
   If menuActionSTDJournalExtFlt = "DEL" Then cmdSTDJournalExtFltDel_Click
   If menuActionSTDJournalExtFlt = "RUN" Then cmdSTDJournalExtFltRun_Click
   If menuActionSTDJournalExtFlt = "REF" Then cmdSTDJournalExtFltRef_Click
   If menuActionSTDJournalExtFlt = "PRN" Then cmdSTDJournalExtFltPrn_Click
   If menuActionSTDJournalExtFlt = "CFG" Then cmdSTDJournalExtFltCfg_Click
   If menuActionSTDJournalExtFlt = "FND" Then cmdSTDJournalExtFltFnd_Click
   If menuActionSTDJournalExtFlt = "ACC" Then cmdSTDJournalExtFltAcc_Click
   menuActionSTDJournalExtFlt = ""
End Sub
Private Sub cmdSTDJournalExtFltCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridSTDJournalExtFlt, "gridSTDJournalExtFlt"
Set jset = Nothing
End Sub

Private Sub cmdSTDJournalExtFltPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridSTDJournalExtFlt, "Фильтры журнала"
Set jset = Nothing
End Sub

Private Sub cmdSTDJournalExtFltRef_Click()
  On Error Resume Next
  Item.STDJournalExtFlt.Refresh
  gridSTDJournalExtFlt.ItemCount = Item.STDJournalExtFlt.Count
  gridSTDJournalExtFlt.Refetch
  gridSTDJournalExtFlt.Refresh
End Sub
Private Sub cmdSTDJournalExtFltAcc_Click()
On Error Resume Next
If gridSTDJournalExtFlt.ItemCount = 0 Then Exit Sub
If gridSTDJournalExtFlt.Row > 0 Then
 If gridSTDJournalExtFlt.RowIndex(gridSTDJournalExtFlt.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridSTDJournalExtFlt.RowBookmark(gridSTDJournalExtFlt.RowIndex(gridSTDJournalExtFlt.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdSTDJournalExtFltEdit_Click()
  On Error Resume Next
If gridSTDJournalExtFlt.ItemCount = 0 Then Exit Sub
If gridSTDJournalExtFlt.Row > 0 Then
 If gridSTDJournalExtFlt.RowIndex(gridSTDJournalExtFlt.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridSTDJournalExtFlt.RowBookmark(gridSTDJournalExtFlt.RowIndex(gridSTDJournalExtFlt.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmSTDJournalExtFlt_.Item = u
again:     frmSTDJournalExtFlt_.NotFirstTime = False
    frmSTDJournalExtFlt_.OnInit
    frmSTDJournalExtFlt_.Show vbModal
    If frmSTDJournalExtFlt_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridSTDJournalExtFlt.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdSTDJournalExtFltDel_Click()
  On Error Resume Next
  gridSTDJournalExtFlt.Delete
End Sub
Private Sub cmdSTDJournalExtFltAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.STDJournalExtFlt.Add()

      Set frmSTDJournalExtFlt_.Item = u
again:       frmSTDJournalExtFlt_.NotFirstTime = False
      frmSTDJournalExtFlt_.OnInit
      frmSTDJournalExtFlt_.Show vbModal
      If frmSTDJournalExtFlt_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridSTDJournalExtFlt.ItemCount = Item.STDJournalExtFlt.Count
        gridSTDJournalExtFlt.Refresh
        gridSTDJournalExtFlt.RefreshGroups
        gridSTDJournalExtFlt.RefreshSort
        gridSTDJournalExtFlt.MoveToBookmark u.ID & "STDJournalExtFlt"
      Else
        Item.STDJournalExtFlt.Delete u.ID
        Item.STDJournalExtFlt.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdSTDJournalExtFltFnd_Click()
  On Error Resume Next
  fndSTDJournalExtFlt.ShowForm
End Sub
Private Sub cmdSTDJournalExtFltRun_Click()
  On Error Resume Next
  gridSTDJournalExtFlt_DblClick
End Sub
Private Sub gridSTDJournalExtFlt_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.STDJournalExtFlt.LoadRow gridSTDJournalExtFlt, RowIndex, Bookmark, Values
End Sub
Private Sub gridSTDJournalExtFlt_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridSTDJournalExtFlt.ItemCount = 0 Then Exit Sub
  Dim u As Object
  On Error Resume Next
  Set u = Item.FindRowObject(Right(Bookmark, Len(Bookmark) - 38), Left(Bookmark, 38))
  If Not u Is Nothing Then
    If MsgBox("Удалить элемент" & vbCrLf & u.brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
      On Error GoTo bye
      u.Parent.Delete u.ID
    Else
      Cancel = True
    End If
  End If
Exit Sub
bye:
   Cancel = True
   MsgBox err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridSTDJournalExtFlt_DblClick()
  cmdSTDJournalExtFltEdit_Click
End Sub
Private Sub gridSTDJournalExtFlt_KeyPress(KeyAscii As Integer)
  If gridSTDJournalExtFlt.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndSTDJournalExtFlt.FindOnPress KeyAscii
End Sub

Private Sub pnlSTDJournalExtFlt_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridSTDJournalExtFlt.Left = Left
  gridSTDJournalExtFlt.Top = Top + 25 * Screen.TwipsPerPixelY
  gridSTDJournalExtFlt.Width = Width
  gridSTDJournalExtFlt.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdSTDJournalExtFltAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdSTDJournalExtFltEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdSTDJournalExtFltDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdSTDJournalExtFltRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdSTDJournalExtFltPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdSTDJournalExtFltCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdSTDJournalExtFltFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdSTDJournalExtFltRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdSTDJournalExtFltAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdSTDJournalExtFltAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdSTDJournalExtFltEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdSTDJournalExtFltDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdSTDJournalExtFltRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdSTDJournalExtFltPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdSTDJournalExtFltCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdSTDJournalExtFltFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdSTDJournalExtFltRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdSTDJournalExtFltAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuSTDJournalExtFltPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.STDJournalExtFlt.Add()
    If GetFromBuffer(u) Then
      gridSTDJournalExtFlt.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdSTDJournalExtFieldCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridSTDJournalExtField, "gridSTDJournalExtField"
Set jset = Nothing
End Sub

Private Sub cmdSTDJournalExtFieldPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridSTDJournalExtField, "Параметры фильтра"
Set jset = Nothing
End Sub

Private Sub cmdSTDJournalExtFieldAcc_Click()
On Error Resume Next
If gridSTDJournalExtField.ItemCount = 0 Then Exit Sub
If gridSTDJournalExtField.Row > 0 Then
 If gridSTDJournalExtField.RowIndex(gridSTDJournalExtField.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridSTDJournalExtField.RowBookmark(gridSTDJournalExtField.RowIndex(gridSTDJournalExtField.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdSTDJournalExtFieldFnd_Click()
  On Error Resume Next
  fndSTDJournalExtField.ShowForm
End Sub
Private Sub cmdSTDJournalExtFieldRun_Click()
  On Error Resume Next
  gridSTDJournalExtField_DblClick
End Sub
Private Sub pnlSTDJournalExtFlt_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridSTDJournalExtField.Left = Left
  gridSTDJournalExtField.Top = Top + 25 * Screen.TwipsPerPixelY
  gridSTDJournalExtField.Width = Width
  gridSTDJournalExtField.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdSTDJournalExtFieldAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdSTDJournalExtFieldEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdSTDJournalExtFieldDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdSTDJournalExtFieldRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdSTDJournalExtFieldPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdSTDJournalExtFieldCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdSTDJournalExtFieldFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdSTDJournalExtFieldRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdSTDJournalExtFieldAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdSTDJournalExtFieldAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdSTDJournalExtFieldEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdSTDJournalExtFieldDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdSTDJournalExtFieldRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdSTDJournalExtFieldPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdSTDJournalExtFieldCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdSTDJournalExtFieldFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdSTDJournalExtFieldRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdSTDJournalExtFieldAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdSTDJournalExtFieldRef_Click()
  On Error Resume Next
If gridSTDJournalExtFlt.ItemCount = 0 Then Exit Sub
If gridSTDJournalExtFlt.Row > 0 Then
 If gridSTDJournalExtFlt.RowIndex(gridSTDJournalExtFlt.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridSTDJournalExtFlt.RowBookmark(gridSTDJournalExtFlt.RowIndex(gridSTDJournalExtFlt.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.STDJournalExtField.Refresh
   gridSTDJournalExtField.ItemCount = gu.STDJournalExtField.Count
   gridSTDJournalExtField.Refetch
   gridSTDJournalExtField.Refresh
 Else
  gridSTDJournalExtField.Columns.Clear
  gridSTDJournalExtField.ItemCount = 0
 End If
Else
 gridSTDJournalExtField.Columns.Clear
 gridSTDJournalExtField.ItemCount = 0
End If
End Sub
Private Sub cmdSTDJournalExtFieldEdit_Click()
    If gridSTDJournalExtField.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridSTDJournalExtField.RowBookmark(gridSTDJournalExtField.RowIndex(gridSTDJournalExtField.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmSTDJournalExtField_.Item = u
again:     frmSTDJournalExtField_.NotFirstTime = False
    frmSTDJournalExtField_.OnInit
    frmSTDJournalExtField_.Show vbModal
    If frmSTDJournalExtField_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridSTDJournalExtField.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdSTDJournalExtFieldDel_Click()
  On Error Resume Next
  gridSTDJournalExtField.Delete
End Sub
Private Sub cmdSTDJournalExtFieldAdd_Click()
  On Error Resume Next
    Dim gu As Object
    Dim u As Object
If gridSTDJournalExtFlt.ItemCount = 0 Then Exit Sub
    Dim bm
    bm = gridSTDJournalExtFlt.RowBookmark(gridSTDJournalExtFlt.RowIndex(gridSTDJournalExtFlt.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set u = gu.STDJournalExtField.Add()

      Set frmSTDJournalExtField_.Item = u
again:       frmSTDJournalExtField_.NotFirstTime = False
      frmSTDJournalExtField_.OnInit
      frmSTDJournalExtField_.Show vbModal
      If frmSTDJournalExtField_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridSTDJournalExtField.ItemCount = gu.STDJournalExtField.Count
        gridSTDJournalExtField.Refresh
        gridSTDJournalExtField.RefreshGroups
        gridSTDJournalExtField.RefreshSort
        gridSTDJournalExtField.MoveToBookmark u.ID & "STDJournalExtField"
      Else
        gu.STDJournalExtField.Delete u.ID
        gu.STDJournalExtField.Remove u.ID
      End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridSTDJournalExtFlt_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridSTDJournalExtFlt.ItemCount = 0 Then
  gridSTDJournalExtField.ItemCount = 0
  Exit Sub
End If
If gridSTDJournalExtFlt.Row > 0 Then
  If LastRow <> gridSTDJournalExtFlt.Row And LastRow > 0 Then
    gridSTDJournalExtFlt.GetRowData(LastRow).RowStyle = "Default"
    gridSTDJournalExtFlt.GetRowData(gridSTDJournalExtFlt.Row).RowStyle = "SelectedRow"
  End If
 If gridSTDJournalExtFlt.RowIndex(gridSTDJournalExtFlt.Row) > 0 Then
  If LastRow <> gridSTDJournalExtFlt.Row Or gridSTDJournalExtField.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridSTDJournalExtFlt.RowBookmark(gridSTDJournalExtFlt.RowIndex(gridSTDJournalExtFlt.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.STDJournalExtField.PrepareGrid gridSTDJournalExtField
  gridSTDJournalExtField.ItemCount = 0
    LoadGridLayout gridSTDJournalExtField
    Set fndSTDJournalExtField = Nothing
    Set fndSTDJournalExtField = CreateObject("MTZ_JSetup.GridFinder")
    fndSTDJournalExtField.Init gridSTDJournalExtField
  gridSTDJournalExtField.ItemCount = gu.STDJournalExtField.Count
  End If
 End If
End If
End Sub
Private Sub gridSTDJournalExtField_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
    If gridSTDJournalExtFlt.ItemCount = 0 Then Exit Sub
    If gridSTDJournalExtField.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridSTDJournalExtFlt.RowBookmark(gridSTDJournalExtFlt.RowIndex(gridSTDJournalExtFlt.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.STDJournalExtField.LoadRow gridSTDJournalExtField, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridSTDJournalExtField_KeyPress(KeyAscii As Integer)
  If gridSTDJournalExtField.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndSTDJournalExtField.FindOnPress KeyAscii
End Sub

Private Sub gridSTDJournalExtField_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If gridSTDJournalExtField.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridSTDJournalExtField.RowBookmark(gridSTDJournalExtField.RowIndex(gridSTDJournalExtField.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    If Not u Is Nothing Then
      On Error Resume Next
      If MsgBox("Удалить элемент" & vbCrLf & u.brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
      On Error GoTo bye
        u.Parent.Delete u.ID
      Else
        Cancel = True
      End If
    End If

    Set u = Nothing
Exit Sub
bye:
   Cancel = True
   MsgBox err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub
Private Sub gridSTDJournalExtField_DblClick()
    cmdSTDJournalExtFieldEdit_Click
End Sub
Private Sub gridSTDJournalExtField_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridSTDJournalExtField.ItemCount = 0 Then Exit Sub
 If gridSTDJournalExtField.Row > 0 Then
   If LastRow <> gridSTDJournalExtField.Row And LastRow > 0 Then
     gridSTDJournalExtField.GetRowData(LastRow).RowStyle = "Default"
     gridSTDJournalExtField.GetRowData(gridSTDJournalExtField.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuSTDJournalExtFieldPASTE_Click()
On Error Resume Next
    If gridSTDJournalExtFlt.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridSTDJournalExtFlt.RowBookmark(gridSTDJournalExtFlt.RowIndex(gridSTDJournalExtFlt.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.STDJournalExtField.Add()
    If GetFromBuffer(u) Then
      gridSTDJournalExtField.ItemCount = u.Parent.Count
    Else
      gu.STDJournalExtField.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridSTDJournalExtField_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdSTDJournalExtFieldCfg_Click
        End If
    End If
End Sub

Private Sub gridSTDJournalExtField_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupSTDJournalExtField
End If
End Sub
Private Sub mnuSTDJournalExtFieldAdd_click()
   menuActionSTDJournalExtField = "ADD"
   menuTimerSTDJournalExtField.Enabled = True
End Sub
Private Sub mnuSTDJournalExtFieldEdit_click()
   menuActionSTDJournalExtField = "EDIT"
   menuTimerSTDJournalExtField.Enabled = True
End Sub
Private Sub mnuSTDJournalExtFieldDelete_click()
   menuActionSTDJournalExtField = "DEL"
   menuTimerSTDJournalExtField.Enabled = True
End Sub
Private Sub mnuSTDJournalExtFieldOpen_click()
   menuActionSTDJournalExtField = "RUN"
   menuTimerSTDJournalExtField.Enabled = True
End Sub
Private Sub mnuSTDJournalExtFieldRef_click()
   menuActionSTDJournalExtField = "REF"
   menuTimerSTDJournalExtField.Enabled = True
End Sub
  Private Sub mnuSTDJournalExtFieldCOPY_Click()
    On Error Resume Next
    If gridSTDJournalExtField.ItemCount = 0 Then Exit Sub
    If gridSTDJournalExtField.Row > 0 Then
     If gridSTDJournalExtField.RowIndex(gridSTDJournalExtField.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridSTDJournalExtField.RowBookmark(gridSTDJournalExtField.RowIndex(gridSTDJournalExtField.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuSTDJournalExtFieldCUT_Click()
    On Error Resume Next
    If gridSTDJournalExtField.ItemCount = 0 Then Exit Sub
    If gridSTDJournalExtField.Row > 0 Then
     If gridSTDJournalExtField.RowIndex(gridSTDJournalExtField.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridSTDJournalExtField.RowBookmark(gridSTDJournalExtField.RowIndex(gridSTDJournalExtField.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridSTDJournalExtField.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuSTDJournalExtFieldCHANGE_Click()
  On Error Resume Next
  If gridSTDJournalExtField.ItemCount = 0 Then Exit Sub
  If gridSTDJournalExtField.Row > 0 Then
   If gridSTDJournalExtField.RowIndex(gridSTDJournalExtField.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridSTDJournalExtField.RowBookmark(gridSTDJournalExtField.RowIndex(gridSTDJournalExtField.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridSTDJournalExtField.ItemCount = u.Parent.Count
      gridSTDJournalExtField.RefreshRowIndex gridSTDJournalExtField.RowIndex(gridSTDJournalExtField.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuSTDJournalExtFieldCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuSTDJournalExtFieldPrn_click()
   menuActionSTDJournalExtField = "PRN"
   menuTimerSTDJournalExtField.Enabled = True
End Sub
Private Sub mnuSTDJournalExtFieldCfg_click()
   menuActionSTDJournalExtField = "CFG"
   menuTimerSTDJournalExtField.Enabled = True
End Sub
Private Sub mnuSTDJournalExtFieldFind_click()
   menuActionSTDJournalExtField = "FND"
   menuTimerSTDJournalExtField.Enabled = True
End Sub
Private Sub mnuSTDJournalExtFieldAcc_click()
   menuActionSTDJournalExtField = "ACC"
   menuTimerSTDJournalExtField.Enabled = True
End Sub
Private Sub menuTimerSTDJournalExtField_timer()
   menuTimerSTDJournalExtField.Enabled = False
   If menuActionSTDJournalExtField = "ADD" Then cmdSTDJournalExtFieldAdd_Click
   If menuActionSTDJournalExtField = "EDIT" Then cmdSTDJournalExtFieldEdit_Click
   If menuActionSTDJournalExtField = "DEL" Then cmdSTDJournalExtFieldDel_Click
   If menuActionSTDJournalExtField = "RUN" Then cmdSTDJournalExtFieldRun_Click
   If menuActionSTDJournalExtField = "REF" Then cmdSTDJournalExtFieldRef_Click
   If menuActionSTDJournalExtField = "PRN" Then cmdSTDJournalExtFieldPrn_Click
   If menuActionSTDJournalExtField = "CFG" Then cmdSTDJournalExtFieldCfg_Click
   If menuActionSTDJournalExtField = "FND" Then cmdSTDJournalExtFieldFnd_Click
   If menuActionSTDJournalExtField = "ACC" Then cmdSTDJournalExtFieldAcc_Click
   menuActionSTDJournalExtField = ""
End Sub

'Функция инициализации панели данными
'Parameters:
'[IN][OUT]  aItem , тип параметра: object,
'[IN][OUT]   optional pForm , тип параметра: object = nothing  - ...
'See Also:
'Example:
'  call me.OnInit({параметры})
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdSTDJournalExtFltAdd, cmdSTDJournalExtFltAdd.Tag
  LoadBtnPictures cmdSTDJournalExtFltEdit, cmdSTDJournalExtFltEdit.Tag
  LoadBtnPictures cmdSTDJournalExtFltDel, cmdSTDJournalExtFltDel.Tag
  LoadBtnPictures cmdSTDJournalExtFltRef, cmdSTDJournalExtFltRef.Tag
  LoadBtnPictures cmdSTDJournalExtFltPrn, cmdSTDJournalExtFltPrn.Tag
  LoadBtnPictures cmdSTDJournalExtFltFnd, cmdSTDJournalExtFltFnd.Tag
  LoadBtnPictures cmdSTDJournalExtFltRun, cmdSTDJournalExtFltRun.Tag
  LoadBtnPictures cmdSTDJournalExtFltAcc, cmdSTDJournalExtFltAcc.Tag
  LoadBtnPictures cmdSTDJournalExtFltCfg, cmdSTDJournalExtFltCfg.Tag
  Item.STDJournalExtFlt.PrepareGrid gridSTDJournalExtFlt
  LoadGridLayout gridSTDJournalExtFlt
  Set fndSTDJournalExtFlt = Nothing
  On Error Resume Next
  Set fndSTDJournalExtFlt = CreateObject("MTZ_JSetup.GridFinder")
  fndSTDJournalExtFlt.Init gridSTDJournalExtFlt
  LoadBtnPictures cmdSTDJournalExtFieldAdd, cmdSTDJournalExtFieldAdd.Tag
  LoadBtnPictures cmdSTDJournalExtFieldEdit, cmdSTDJournalExtFieldEdit.Tag
  LoadBtnPictures cmdSTDJournalExtFieldDel, cmdSTDJournalExtFieldDel.Tag
  LoadBtnPictures cmdSTDJournalExtFieldRef, cmdSTDJournalExtFieldRef.Tag
  LoadBtnPictures cmdSTDJournalExtFieldPrn, cmdSTDJournalExtFieldPrn.Tag
  LoadBtnPictures cmdSTDJournalExtFieldFnd, cmdSTDJournalExtFieldFnd.Tag
  LoadBtnPictures cmdSTDJournalExtFieldCfg, cmdSTDJournalExtFieldCfg.Tag
  LoadBtnPictures cmdSTDJournalExtFieldRun, cmdSTDJournalExtFieldRun.Tag
  LoadBtnPictures cmdSTDJournalExtFieldAcc, cmdSTDJournalExtFieldAcc.Tag
  gridSTDJournalExtField.Columns.Clear
  gridSTDJournalExtField.ItemCount = 0
  cmdSTDJournalExtFieldRef_Click
End Sub

'Действие при активизации таба
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

pnlSTDJournalExtFlt.RestorePosition
  gridSTDJournalExtFlt_RowColChange gridSTDJournalExtFlt.Row, -1
End Sub

'Действие при активизации панели
'Parameters:
'[IN][OUT]  aItem , тип параметра: object,
'[IN][OUT]   optional pForm , тип параметра: object = nothing  - ...
'See Also:
'Example:
'  call me.OnClick({параметры})
Public Sub OnClick(aItem As Object, Optional pForm As Object = Nothing)
  On Error Resume Next
  Set Item = aItem
  Set ParentForm = pForm
  OnTabClick
End Sub

'Действие при сохранении
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnSave()
Public Sub OnSave()
  
End Sub

'Признак изменения
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
'  variable = me.IsChanged()
Public Function IsChanged() As Boolean
  Dim m_IsChanged As Boolean
  On Error Resume Next
  
  IsChanged = m_IsChanged
End Function
Private Sub UserControl_Resize()
  On Error Resume Next
  pnlSTDJournalExtFlt.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub

'Освобождение ресурсов
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndSTDJournalExtFlt = Nothing
  Set fndSTDJournalExtField = Nothing
End Sub
Private Sub UserControl_Terminate()
  On Error Resume Next
  CloseClass
End Sub

'переместить клиента в каталоге
'{5CB1388C-1623-4B36-A775-00B70BEE27AF}
Private Sub Run_VBMoveVRC(VRCATFolder As Variant, Optional RowItem As Object)
On Error Resume Next

'do nothing
End Sub



'Так же проверяет Square >0
'{53371FFA-B514-447A-A1F9-26EE4FD409C9}
Private Sub Run_VBUpdateObjNamePEO(Name As Variant, Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
RowItem.Application.Name = Name
RowItem.Application.Save

End Sub



'Передать права объекту контактное лицо от объекта клиент
'{79DED4FD-045C-45F8-AC79-2E5A3D956D97}
Private Sub Run_VBMigrateRight(Optional RowItem As Object)
On Error Resume Next

'Migrate security
On Error GoTo bye
  If RowItem.Person Is Nothing Then Exit Sub

  RowItem.Person.Secure Item.SecureStyleid
  RowItem.Person.Propagate
bye:
  Exit Sub
  MsgBox err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Проверка наличия коллекции характеристик
'{79E6BDEB-91D5-4B2E-81F7-3E091FB65E3A}
Private Sub Run_VBCheckDescrs(DesPartName As Variant, Optional RowItem As Object)
On Error Resume Next

    On Error Resume Next

    Dim part_col As Variant
    Dim part_item As Object
    Set part_col = CallByName(RowItem.Parent.Parent, DesPartName, VbGet, False)
    Set part_item = part_col.Item(1)
    If RowItem.Parent.Count = 1 Then
        If part_item.HasDescrs = -1 Then
            part_item.HasDescrs = 0
        Else
            part_item.HasDescrs = -1
        End If
    End If
    part_item.Save

End Sub



'Применить стиль защиты для объекта Предназначен для каталога клиентов
'{31EC6CF7-8DBD-4EFE-BF12-4D168F653D34}
Private Sub Run_VBApplySecurity(Optional RowItem As Object)
On Error Resume Next

'Apply security
On Error GoTo bye
  If RowItem.Client Is Nothing Then Exit Sub
  If RowItem.Parent.Parent.AccessLevel Is Nothing Then Exit Sub
  RowItem.Client.Secure RowItem.Parent.Parent.AccessLevel.ID
  RowItem.Client.Propagate
  Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Создание отчета из разных карточек
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 'ID = CreateGUID2
 'Call RowItem.Application.Manager.NewInstance(ID, "VRRPT", "Отчет " & Date)
 'Set RowItem.Report = RowItem.Application.Manager.GetInstanceObject(ID)
 If RowItem.Report.VRRPT_MAIN.Count = 0 Then
  Set Obj = RowItem.Report.VRRPT_MAIN.Add
 Else
  Set Obj = RowItem.Report.VRRPT_MAIN.Item(1)
 End If
 
 Set Obj.Author = RowItem.Application.FindRowObject("Users", Item.Application.MTZSession.GetSessionUserID())
 Obj.TheDate = Date
 
 If ReportType = "CLNT" Then
   Set Obj.Client = RowItem.Application
 End If
 If ReportType = "PRJ" Then
   Set Obj.Project = RowItem.Application
 End If
 If ReportType = "CONT" Then
   Set Obj.Contract = RowItem.Application
 End If
 If ReportType = "PERS" Then
   Set Obj.Person = RowItem.Application
 End If
 
 Obj.Save
 RowItem.Save

 Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание отчета"
End Sub



'
'{AA4085E6-745B-4A37-8EC4-65D99A653966}
Private Sub Run_VBRemoveSymmetricObjRef(ForwardFieldName As Variant, ObjTypeName As Variant, SymmetricPartName As Variant, SymmetricFieldName As Variant, Optional RowItem As Object)
On Error Resume Next

    Dim OK As Boolean
    Dim ID As String
    Dim brief As String

    On Error Resume Next
'     On Error GoTo bye

    Dim Obj As Object
    Dim part_col As Variant
    Dim part_item As Object
    Set Obj = CallByName(RowItem, ForwardFieldName, VbGet)
    Set part_col = CallByName(Obj, SymmetricPartName, VbGet, False)
    part_col.Filter = SymmetricFieldName + "='" + RowItem.Application.ID + "'"
'    RowItem.Parent.Remove RowItem.ID
    Set part_item = part_col.Item(1)
    part_col.Delete part_item.ID
    Exit Sub
bye:
Resume

End Sub



'Создать новую оплату из клиента
'{42A1A436-8AA2-4F1F-999B-6680DFF514DE}
Private Sub Run_VBNewPayIn(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEKP", "Платеж " & Date)
 Set RowItem.TheDocument = RowItem.Application.Manager.GetInstanceObject(ID)

 If RowItem.TheDocument.PEKP_DEF.Count = 0 Then
  Set Obj = RowItem.TheDocument.PEKP_DEF.Add
 Else
  Set Obj = RowItem.TheDocument.PEKP_DEF.Item(1)
 End If
 
 Set Obj.FromClient = RowItem.Application
 Obj.PLPDate = Date
 Obj.Save
 RowItem.Save

 Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание Платежа"
End Sub



'Для раздела, в котором есть поле - ссылка, создает/выбирает объект без открытия окна редактирования ссылки
'{A2EEE876-54D8-4AED-B124-775F5DA2D911}
Private Sub Run_VBAddObjByRef(ObjTypeName As Variant, ForwardFieldName As Variant, SymmetricPartName As Variant, SymmetricFieldName As Variant, Optional RowItem As Object)
On Error Resume Next

    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
    Dim Mode As String
    Dim ResObject As Object
    On Error Resume Next
    Mode = Mid(TypeName(Me), InStr(TypeName(Me), "_") + 1)
    
'     On Error GoTo bye
    If Len(Mode) = 0 Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", ObjTypeName)
    Else
        ID = CreateGUID2
        If Len(ObjTypeName) = 0 Then
            Dim newObj As Object
            Set newObj = Item.Application.Manager.GetNewObject
            If Not (newObj Is Nothing) Then
                OK = True
                ID = newObj.ID
            End If
        Else
            OK = Item.Application.Manager.NewInstance(ID, ObjTypeName, "")
        End If
        Dim ref As Object, objGui As Object
        Set ref = Item.Application.Manager.GetInstanceObject(ID)
        If Not ref Is Nothing Then
          Set objGui = Item.Application.Manager.GetInstanceGUI(ID)
          If objGui Is Nothing Then Set ref = Nothing: Exit Sub
          objGui.Show "", ref, False
          Set objGui = Nothing
        Else
          OK = False
        End If
    End If
    Dim Obj As Object
    Set Obj = Item.Application.Manager.GetInstanceObject(ID)
    If Obj Is Nothing Then
        OK = False
    End If
    If OK Then
  Dim Coll As New Collection
        Dim part_col As Variant
        Dim part_item As Object
        CallByName RowItem, ForwardFieldName, VbSet, Obj
        Coll.Add TypeName(RowItem) + ":" + RowItem.ID
        RowItem.Save
        If Len(SymmetricPartName) > 0 And Len(SymmetricFieldName) > 0 Then
          Set part_col = CallByName(Obj, SymmetricPartName, VbGet, True)
          Set part_item = part_col.Add
          CallByName part_item, SymmetricFieldName, VbSet, RowItem.Application
          part_item.Save
          Coll.Add SymmetricPartName + ":" + part_item.ID
        End If
        Call Item.Application.Manager.AddCustomObjects(Coll, Obj.ID)
    Else
        RowItem.Parent.Remove RowItem.ID
    End If
    Exit Sub
bye:
Resume
End Sub



'
'{5B376AF5-339B-4365-BA80-785E28BCF4DA}
Private Sub Run_VBUpdateSymmetricObjRef(SymmetricFieldName As Variant, ForwardFieldName As Variant, SymmetricPartName As Variant, ObjTypeName As Variant, Optional RowItem As Object)
On Error Resume Next

 
End Sub



'Создать новый платеж из клиента
'{2BB30818-90ED-4627-8ABB-85B3FBA46750}
Private Sub Run_VBNewPayOut(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEKO", "Оплата " & Date)
 Set RowItem.TheDocument = RowItem.Application.Manager.GetInstanceObject(ID)

 If RowItem.TheDocument.PEKO_DEF.Count = 0 Then
  Set Obj = RowItem.TheDocument.PEKO_DEF.Add
 Else
  Set Obj = RowItem.TheDocument.PEKO_DEF.Item(1)
 End If
 
 Set Obj.ToClient = RowItem.Application
 Obj.PLPDate = Date
 Obj.Save
 RowItem.Save

 Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание Платежа"
End Sub



'открытие карточки по идентификатору
'{94E8F6DB-106A-44DC-9483-86C801798FF0}
Private Sub Run_VBOpenRef(StartMode As Variant, ID As Variant, Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
If ID <> "" Then
    Dim Obj As Object
    Set Obj = Item.Manager.GetInstanceObject(ID)
    If Not Obj Is Nothing Then
      Dim objGui As Object
      Set objGui = Item.Manager.GetInstanceGUI(Obj.ID)
      If objGui Is Nothing Then Exit Sub

       If StartMode = "AUTO" Then
        StartMode = ""
        Dim i As Long
        For i = 100 To 0 Step -10
          If Obj.MTZSession.CheckRight(Obj.SecureStyleid, Obj.TypeName & ":" & "M" & i) Then
            StartMode = "M" & i
            Exit For
          End If
        Next
       End If
      
      objGui.Show StartMode & "", Obj
      Set objGui = Nothing
    End If
  End If
  
End Sub



'
'{069956DC-3305-45EF-9331-91CE323B5942}
Private Sub Run_WFDefName(Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
Item.Name = RowItem.Description
ParentForm.Caption = Item.Name
Item.Save
End Sub



'
'{D8914FB4-6B5D-491A-A72F-985617727583}
Private Sub Run_WFFuncName(Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
Item.Name = RowItem.Name
ParentForm.Caption = Item.Name
Item.Save
End Sub



'Обновление Имени объекта
'{61393545-ABF7-46F7-82F3-9B7E610DD9C0}
Private Sub Run_VBUpdateObjName(Name As Variant, Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
RowItem.Application.Name = Name
RowItem.Application.Save
End Sub



'Метод создает новый элемент в иерархии Имущественных Комплексов (приложение RealEstate) при создании нового элемента к нему линкуется объект ИК, форма которого и вызывается на редактирование
'{477B8D25-4FF7-491A-A0B0-D3437EC16957}
Private Sub Run_MakeNewFolderEC(FolderID As Variant, Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
 Dim ID As String
 Dim Obj As Object ' EstComplex.Application ' Object
 Dim GObj As Object
 Dim fold As Object 'EstCatalog.Application ' Object
 
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "EstComplex", RowItem.TheName & " " & Date)
 Set Obj = RowItem.Application.Manager.GetInstanceObject(ID)
 If Obj.EC_Def.Count = 0 Then
    With Obj.EC_Def.Add
        .TheName = RowItem.TheName
    End With
 Else
    Obj.EC_Def.Item(1).TheName = RowItem.TheName
 End If
 Obj.Save
 Set RowItem.LinkedEC = Obj
 RowItem.Save
 Set GObj = RowItem.Application.Manager.GetInstanceGUI(Obj.ID)
 GObj.Show "", Obj, True 'False
 Set Obj = RowItem.Application.Manager.GetInstanceObject(ID)
 RowItem.TheName = Obj.EC_Def.Item(1).TheName
 RowItem.Save
 Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание ИК"

End Sub



'Изменить название объекта
'{4FB59D1A-0123-47D3-9F4F-E12085C5D074}
Private Sub Run_VBUpdateItemName(Name As Variant, Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
Item.Name = Name
' может не быть формы, если используем просто ActiveX
ParentForm.Caption = Item.Name
Item.Save
End Sub



'Создать заявку из клиента
'{49EA5CBF-93CF-41A8-B1F1-E37FE4D59EA5}
Private Sub Run_VBNewZayavka(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEKZ", "Заявка " & Date)
 Set RowItem.TheDocument = RowItem.Application.Manager.GetInstanceObject(ID)

 If RowItem.TheDocument.PEKO_DEF.Count = 0 Then
  Set Obj = RowItem.TheDocument.PEKZ_DEF.Add
 Else
  Set Obj = RowItem.TheDocument.PEKZ_DEF.Item(1)
 End If
 
 Set Obj.ClientFrom = RowItem.Application
 Obj.QueryDate = Date
 Obj.Save
 RowItem.Save

 Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание Заявки"
End Sub



'Создание номенклатуры по шаблону
'{B91ABF3A-31F8-4A82-8D41-EF463DBA32D0}
Private Sub Run_SSCreateNomen(Name As Variant, Optional RowItem As Object)
On Error Resume Next

'pointCreateLine
End Sub





