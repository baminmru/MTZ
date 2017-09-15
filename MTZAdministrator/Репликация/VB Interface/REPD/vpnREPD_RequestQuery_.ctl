VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnREPD_RequestQuery_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerREPD_ResQueryRcv 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerREPD_RequestQuery 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlREPD_RequestQuery 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdREPD_ResQueryRcvAcc 
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
      Begin MTZ_PANEL.DropButton cmdREPD_ResQueryRcvRun 
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
      Begin VB.CommandButton cmdREPD_ResQueryRcvFnd 
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
      Begin VB.CommandButton cmdREPD_ResQueryRcvCfg 
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
      Begin VB.CommandButton cmdREPD_ResQueryRcvPrn 
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
      Begin VB.CommandButton cmdREPD_ResQueryRcvRef 
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
      Begin VB.CommandButton cmdREPD_ResQueryRcvDel 
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
      Begin VB.CommandButton cmdREPD_ResQueryRcvEdit 
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
      Begin VB.CommandButton cmdREPD_ResQueryRcvAdd 
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
      Begin GridEX20.GridEX gridREPD_ResQueryRcv 
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
         Column(1)       =   "vpnREPD_RequestQuery_.ctx":0000
         Column(2)       =   "vpnREPD_RequestQuery_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnREPD_RequestQuery_.ctx":016C
         FormatStyle(2)  =   "vpnREPD_RequestQuery_.ctx":02C8
         FormatStyle(3)  =   "vpnREPD_RequestQuery_.ctx":0378
         FormatStyle(4)  =   "vpnREPD_RequestQuery_.ctx":042C
         FormatStyle(5)  =   "vpnREPD_RequestQuery_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnREPD_RequestQuery_.ctx":05BC
      End
      Begin VB.CommandButton cmdREPD_RequestQueryAcc 
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
      Begin MTZ_PANEL.DropButton cmdREPD_RequestQueryRun 
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
      Begin VB.CommandButton cmdREPD_RequestQueryFnd 
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
      Begin VB.CommandButton cmdREPD_RequestQueryCfg 
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
      Begin VB.CommandButton cmdREPD_RequestQueryPrn 
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
      Begin VB.CommandButton cmdREPD_RequestQueryRef 
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
      Begin VB.CommandButton cmdREPD_RequestQueryDel 
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
      Begin VB.CommandButton cmdREPD_RequestQueryEdit 
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
      Begin VB.CommandButton cmdREPD_RequestQueryAdd 
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
      Begin GridEX20.GridEX gridREPD_RequestQuery 
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
         Column(1)       =   "vpnREPD_RequestQuery_.ctx":0794
         Column(2)       =   "vpnREPD_RequestQuery_.ctx":085C
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnREPD_RequestQuery_.ctx":0900
         FormatStyle(2)  =   "vpnREPD_RequestQuery_.ctx":0A5C
         FormatStyle(3)  =   "vpnREPD_RequestQuery_.ctx":0B0C
         FormatStyle(4)  =   "vpnREPD_RequestQuery_.ctx":0BC0
         FormatStyle(5)  =   "vpnREPD_RequestQuery_.ctx":0C98
         ImageCount      =   0
         PrinterProperties=   "vpnREPD_RequestQuery_.ctx":0D50
      End
   End
   Begin VB.Menu mnuPopupREPD_RequestQuery 
      Caption         =   "Меню для Запрос данных на объект\ строку"
      Visible         =   0   'False
      Begin VB.Menu mnuREPD_RequestQueryAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuREPD_RequestQueryEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuREPD_RequestQueryDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuREPD_RequestQueryOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuREPD_RequestQueryRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuREPD_RequestQueryS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuREPD_RequestQueryBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuREPD_RequestQueryCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuREPD_RequestQueryCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuREPD_RequestQueryPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuREPD_RequestQueryCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuREPD_RequestQueryCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuREPD_RequestQueryPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuREPD_RequestQueryCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuREPD_RequestQueryFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuREPD_RequestQueryAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupREPD_ResQueryRcv 
      Caption         =   "Меню для Результат запроса"
      Visible         =   0   'False
      Begin VB.Menu mnuREPD_ResQueryRcvAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuREPD_ResQueryRcvEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuREPD_ResQueryRcvDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuREPD_ResQueryRcvOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuREPD_ResQueryRcvRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuREPD_ResQueryRcvS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuREPD_ResQueryRcvBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuREPD_ResQueryRcvCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuREPD_ResQueryRcvCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuREPD_ResQueryRcvPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuREPD_ResQueryRcvCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuREPD_ResQueryRcvCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuREPD_ResQueryRcvPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuREPD_ResQueryRcvCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuREPD_ResQueryRcvFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuREPD_ResQueryRcvAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnREPD_RequestQuery_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель для работы со строками раздела Запрос данных на объект\ строку
Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndREPD_RequestQuery As Object
Private menuActionREPD_RequestQuery As String
Private fndREPD_ResQueryRcv As Object
Private menuActionREPD_ResQueryRcv As String





Private Sub pnlREPD_RequestQuery_PositionChanged()
  pnlREPD_RequestQuery.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridREPD_RequestQuery_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdREPD_RequestQueryCfg_Click
        End If
    End If
End Sub

Private Sub gridREPD_RequestQuery_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupREPD_RequestQuery
End If
End Sub
Private Sub mnuREPD_RequestQueryAdd_click()
   menuActionREPD_RequestQuery = "ADD"
   menuTimerREPD_RequestQuery.Enabled = True
End Sub
Private Sub mnuREPD_RequestQueryEdit_click()
   menuActionREPD_RequestQuery = "EDIT"
   menuTimerREPD_RequestQuery.Enabled = True
End Sub
Private Sub mnuREPD_RequestQueryDelete_click()
   menuActionREPD_RequestQuery = "DEL"
   menuTimerREPD_RequestQuery.Enabled = True
End Sub
Private Sub mnuREPD_RequestQueryOpen_click()
   menuActionREPD_RequestQuery = "RUN"
   menuTimerREPD_RequestQuery.Enabled = True
End Sub
Private Sub mnuREPD_RequestQueryRef_click()
   menuActionREPD_RequestQuery = "REF"
   menuTimerREPD_RequestQuery.Enabled = True
End Sub
  Private Sub mnuREPD_RequestQueryCOPY_Click()
    On Error Resume Next
    If gridREPD_RequestQuery.ItemCount = 0 Then Exit Sub
    If gridREPD_RequestQuery.Row > 0 Then
     If gridREPD_RequestQuery.RowIndex(gridREPD_RequestQuery.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridREPD_RequestQuery.RowBookmark(gridREPD_RequestQuery.RowIndex(gridREPD_RequestQuery.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuREPD_RequestQueryCUT_Click()
    On Error Resume Next
    If gridREPD_RequestQuery.ItemCount = 0 Then Exit Sub
    If gridREPD_RequestQuery.Row > 0 Then
     If gridREPD_RequestQuery.RowIndex(gridREPD_RequestQuery.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridREPD_RequestQuery.RowBookmark(gridREPD_RequestQuery.RowIndex(gridREPD_RequestQuery.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridREPD_RequestQuery.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuREPD_RequestQueryCHANGE_Click()
  On Error Resume Next
  If gridREPD_RequestQuery.ItemCount = 0 Then Exit Sub
  If gridREPD_RequestQuery.Row > 0 Then
   If gridREPD_RequestQuery.RowIndex(gridREPD_RequestQuery.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridREPD_RequestQuery.RowBookmark(gridREPD_RequestQuery.RowIndex(gridREPD_RequestQuery.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridREPD_RequestQuery.ItemCount = u.Parent.Count
      gridREPD_RequestQuery.RefreshRowIndex gridREPD_RequestQuery.RowIndex(gridREPD_RequestQuery.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuREPD_RequestQueryCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuREPD_RequestQueryPrn_click()
   menuActionREPD_RequestQuery = "PRN"
   menuTimerREPD_RequestQuery.Enabled = True
End Sub
Private Sub mnuREPD_RequestQueryCfg_click()
   menuActionREPD_RequestQuery = "CFG"
   menuTimerREPD_RequestQuery.Enabled = True
End Sub
Private Sub mnuREPD_RequestQueryFind_click()
   menuActionREPD_RequestQuery = "FND"
   menuTimerREPD_RequestQuery.Enabled = True
End Sub
Private Sub mnuREPD_RequestQueryAcc_click()
   menuActionREPD_RequestQuery = "ACC"
   menuTimerREPD_RequestQuery.Enabled = True
End Sub
Private Sub menuTimerREPD_RequestQuery_timer()
   menuTimerREPD_RequestQuery.Enabled = False
   If menuActionREPD_RequestQuery = "ADD" Then cmdREPD_RequestQueryAdd_Click
   If menuActionREPD_RequestQuery = "EDIT" Then cmdREPD_RequestQueryEdit_Click
   If menuActionREPD_RequestQuery = "DEL" Then cmdREPD_RequestQueryDel_Click
   If menuActionREPD_RequestQuery = "RUN" Then cmdREPD_RequestQueryRun_Click
   If menuActionREPD_RequestQuery = "REF" Then cmdREPD_RequestQueryRef_Click
   If menuActionREPD_RequestQuery = "PRN" Then cmdREPD_RequestQueryPrn_Click
   If menuActionREPD_RequestQuery = "CFG" Then cmdREPD_RequestQueryCfg_Click
   If menuActionREPD_RequestQuery = "FND" Then cmdREPD_RequestQueryFnd_Click
   If menuActionREPD_RequestQuery = "ACC" Then cmdREPD_RequestQueryAcc_Click
   menuActionREPD_RequestQuery = ""
End Sub
Private Sub cmdREPD_RequestQueryCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridREPD_RequestQuery, "gridREPD_RequestQuery"
Set jset = Nothing
End Sub

Private Sub cmdREPD_RequestQueryPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridREPD_RequestQuery, "Запрос данных на объект\ строку"
Set jset = Nothing
End Sub

Private Sub cmdREPD_RequestQueryRef_Click()
  On Error Resume Next
  Item.REPD_RequestQuery.Refresh
  gridREPD_RequestQuery.ItemCount = Item.REPD_RequestQuery.Count
  gridREPD_RequestQuery.Refetch
  gridREPD_RequestQuery.Refresh
End Sub
Private Sub cmdREPD_RequestQueryAcc_Click()
On Error Resume Next
If gridREPD_RequestQuery.ItemCount = 0 Then Exit Sub
If gridREPD_RequestQuery.Row > 0 Then
 If gridREPD_RequestQuery.RowIndex(gridREPD_RequestQuery.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridREPD_RequestQuery.RowBookmark(gridREPD_RequestQuery.RowIndex(gridREPD_RequestQuery.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdREPD_RequestQueryEdit_Click()
  On Error Resume Next
If gridREPD_RequestQuery.ItemCount = 0 Then Exit Sub
If gridREPD_RequestQuery.Row > 0 Then
 If gridREPD_RequestQuery.RowIndex(gridREPD_RequestQuery.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridREPD_RequestQuery.RowBookmark(gridREPD_RequestQuery.RowIndex(gridREPD_RequestQuery.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmREPD_RequestQuery_.Item = u
again:     frmREPD_RequestQuery_.NotFirstTime = False
    frmREPD_RequestQuery_.OnInit
    frmREPD_RequestQuery_.Show vbModal
    If frmREPD_RequestQuery_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridREPD_RequestQuery.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdREPD_RequestQueryDel_Click()
  On Error Resume Next
  gridREPD_RequestQuery.Delete
End Sub
Private Sub cmdREPD_RequestQueryAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.REPD_RequestQuery.Add()

      Set frmREPD_RequestQuery_.Item = u
again:       frmREPD_RequestQuery_.NotFirstTime = False
      frmREPD_RequestQuery_.OnInit
      frmREPD_RequestQuery_.Show vbModal
      If frmREPD_RequestQuery_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridREPD_RequestQuery.ItemCount = Item.REPD_RequestQuery.Count
        gridREPD_RequestQuery.Refresh
        gridREPD_RequestQuery.RefreshGroups
        gridREPD_RequestQuery.RefreshSort
        gridREPD_RequestQuery.MoveToBookmark u.ID & "REPD_RequestQuery"
      Else
        Item.REPD_RequestQuery.Delete u.ID
        Item.REPD_RequestQuery.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdREPD_RequestQueryFnd_Click()
  On Error Resume Next
  fndREPD_RequestQuery.ShowForm
End Sub
Private Sub cmdREPD_RequestQueryRun_Click()
  On Error Resume Next
  gridREPD_RequestQuery_DblClick
End Sub
Private Sub gridREPD_RequestQuery_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.REPD_RequestQuery.LoadRow gridREPD_RequestQuery, RowIndex, Bookmark, Values
End Sub
Private Sub gridREPD_RequestQuery_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridREPD_RequestQuery.ItemCount = 0 Then Exit Sub
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
Private Sub gridREPD_RequestQuery_DblClick()
  cmdREPD_RequestQueryEdit_Click
End Sub
Private Sub gridREPD_RequestQuery_KeyPress(KeyAscii As Integer)
  If gridREPD_RequestQuery.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndREPD_RequestQuery.FindOnPress KeyAscii
End Sub

Private Sub pnlREPD_RequestQuery_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridREPD_RequestQuery.Left = Left
  gridREPD_RequestQuery.Top = Top + 25 * Screen.TwipsPerPixelY
  gridREPD_RequestQuery.Width = Width
  gridREPD_RequestQuery.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdREPD_RequestQueryAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdREPD_RequestQueryEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdREPD_RequestQueryDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdREPD_RequestQueryRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdREPD_RequestQueryPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdREPD_RequestQueryCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdREPD_RequestQueryFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdREPD_RequestQueryRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdREPD_RequestQueryAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdREPD_RequestQueryAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdREPD_RequestQueryEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdREPD_RequestQueryDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdREPD_RequestQueryRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdREPD_RequestQueryPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdREPD_RequestQueryCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdREPD_RequestQueryFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdREPD_RequestQueryRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdREPD_RequestQueryAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuREPD_RequestQueryPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.REPD_RequestQuery.Add()
    If GetFromBuffer(u) Then
      gridREPD_RequestQuery.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdREPD_ResQueryRcvCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridREPD_ResQueryRcv, "gridREPD_ResQueryRcv"
Set jset = Nothing
End Sub

Private Sub cmdREPD_ResQueryRcvPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridREPD_ResQueryRcv, "Результат запроса"
Set jset = Nothing
End Sub

Private Sub cmdREPD_ResQueryRcvAcc_Click()
On Error Resume Next
If gridREPD_ResQueryRcv.ItemCount = 0 Then Exit Sub
If gridREPD_ResQueryRcv.Row > 0 Then
 If gridREPD_ResQueryRcv.RowIndex(gridREPD_ResQueryRcv.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridREPD_ResQueryRcv.RowBookmark(gridREPD_ResQueryRcv.RowIndex(gridREPD_ResQueryRcv.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdREPD_ResQueryRcvFnd_Click()
  On Error Resume Next
  fndREPD_ResQueryRcv.ShowForm
End Sub
Private Sub cmdREPD_ResQueryRcvRun_Click()
  On Error Resume Next
  gridREPD_ResQueryRcv_DblClick
End Sub
Private Sub pnlREPD_RequestQuery_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridREPD_ResQueryRcv.Left = Left
  gridREPD_ResQueryRcv.Top = Top + 25 * Screen.TwipsPerPixelY
  gridREPD_ResQueryRcv.Width = Width
  gridREPD_ResQueryRcv.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdREPD_ResQueryRcvAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdREPD_ResQueryRcvEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdREPD_ResQueryRcvDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdREPD_ResQueryRcvRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdREPD_ResQueryRcvPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdREPD_ResQueryRcvCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdREPD_ResQueryRcvFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdREPD_ResQueryRcvRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdREPD_ResQueryRcvAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdREPD_ResQueryRcvAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdREPD_ResQueryRcvEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdREPD_ResQueryRcvDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdREPD_ResQueryRcvRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdREPD_ResQueryRcvPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdREPD_ResQueryRcvCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdREPD_ResQueryRcvFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdREPD_ResQueryRcvRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdREPD_ResQueryRcvAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdREPD_ResQueryRcvRef_Click()
  On Error Resume Next
If gridREPD_RequestQuery.ItemCount = 0 Then Exit Sub
If gridREPD_RequestQuery.Row > 0 Then
 If gridREPD_RequestQuery.RowIndex(gridREPD_RequestQuery.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridREPD_RequestQuery.RowBookmark(gridREPD_RequestQuery.RowIndex(gridREPD_RequestQuery.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.REPD_ResQueryRcv.Refresh
   gridREPD_ResQueryRcv.ItemCount = gu.REPD_ResQueryRcv.Count
   gridREPD_ResQueryRcv.Refetch
   gridREPD_ResQueryRcv.Refresh
 Else
  gridREPD_ResQueryRcv.Columns.Clear
  gridREPD_ResQueryRcv.ItemCount = 0
 End If
Else
 gridREPD_ResQueryRcv.Columns.Clear
 gridREPD_ResQueryRcv.ItemCount = 0
End If
End Sub
Private Sub cmdREPD_ResQueryRcvEdit_Click()
    If gridREPD_ResQueryRcv.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridREPD_ResQueryRcv.RowBookmark(gridREPD_ResQueryRcv.RowIndex(gridREPD_ResQueryRcv.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmREPD_ResQueryRcv_.Item = u
again:     frmREPD_ResQueryRcv_.NotFirstTime = False
    frmREPD_ResQueryRcv_.OnInit
    frmREPD_ResQueryRcv_.Show vbModal
    If frmREPD_ResQueryRcv_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridREPD_ResQueryRcv.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdREPD_ResQueryRcvDel_Click()
  On Error Resume Next
  gridREPD_ResQueryRcv.Delete
End Sub
Private Sub cmdREPD_ResQueryRcvAdd_Click()
  On Error Resume Next
    Dim gu As Object
    Dim u As Object
If gridREPD_RequestQuery.ItemCount = 0 Then Exit Sub
    Dim bm
    bm = gridREPD_RequestQuery.RowBookmark(gridREPD_RequestQuery.RowIndex(gridREPD_RequestQuery.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set u = gu.REPD_ResQueryRcv.Add()

      Set frmREPD_ResQueryRcv_.Item = u
again:       frmREPD_ResQueryRcv_.NotFirstTime = False
      frmREPD_ResQueryRcv_.OnInit
      frmREPD_ResQueryRcv_.Show vbModal
      If frmREPD_ResQueryRcv_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridREPD_ResQueryRcv.ItemCount = gu.REPD_ResQueryRcv.Count
        gridREPD_ResQueryRcv.Refresh
        gridREPD_ResQueryRcv.RefreshGroups
        gridREPD_ResQueryRcv.RefreshSort
        gridREPD_ResQueryRcv.MoveToBookmark u.ID & "REPD_ResQueryRcv"
      Else
        gu.REPD_ResQueryRcv.Delete u.ID
        gu.REPD_ResQueryRcv.Remove u.ID
      End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridREPD_RequestQuery_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridREPD_RequestQuery.ItemCount = 0 Then
  gridREPD_ResQueryRcv.ItemCount = 0
  Exit Sub
End If
If gridREPD_RequestQuery.Row > 0 Then
  If LastRow <> gridREPD_RequestQuery.Row And LastRow > 0 Then
    gridREPD_RequestQuery.GetRowData(LastRow).RowStyle = "Default"
    gridREPD_RequestQuery.GetRowData(gridREPD_RequestQuery.Row).RowStyle = "SelectedRow"
  End If
 If gridREPD_RequestQuery.RowIndex(gridREPD_RequestQuery.Row) > 0 Then
  If LastRow <> gridREPD_RequestQuery.Row Or gridREPD_ResQueryRcv.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridREPD_RequestQuery.RowBookmark(gridREPD_RequestQuery.RowIndex(gridREPD_RequestQuery.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.REPD_ResQueryRcv.PrepareGrid gridREPD_ResQueryRcv
  gridREPD_ResQueryRcv.ItemCount = 0
    LoadGridLayout gridREPD_ResQueryRcv
    Set fndREPD_ResQueryRcv = Nothing
    Set fndREPD_ResQueryRcv = CreateObject("MTZ_JSetup.GridFinder")
    fndREPD_ResQueryRcv.Init gridREPD_ResQueryRcv
  gridREPD_ResQueryRcv.ItemCount = gu.REPD_ResQueryRcv.Count
  End If
 End If
End If
End Sub
Private Sub gridREPD_ResQueryRcv_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
    If gridREPD_RequestQuery.ItemCount = 0 Then Exit Sub
    If gridREPD_ResQueryRcv.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridREPD_RequestQuery.RowBookmark(gridREPD_RequestQuery.RowIndex(gridREPD_RequestQuery.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.REPD_ResQueryRcv.LoadRow gridREPD_ResQueryRcv, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridREPD_ResQueryRcv_KeyPress(KeyAscii As Integer)
  If gridREPD_ResQueryRcv.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndREPD_ResQueryRcv.FindOnPress KeyAscii
End Sub

Private Sub gridREPD_ResQueryRcv_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If gridREPD_ResQueryRcv.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridREPD_ResQueryRcv.RowBookmark(gridREPD_ResQueryRcv.RowIndex(gridREPD_ResQueryRcv.Row))
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
Private Sub gridREPD_ResQueryRcv_DblClick()
    cmdREPD_ResQueryRcvEdit_Click
End Sub
Private Sub gridREPD_ResQueryRcv_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridREPD_ResQueryRcv.ItemCount = 0 Then Exit Sub
 If gridREPD_ResQueryRcv.Row > 0 Then
   If LastRow <> gridREPD_ResQueryRcv.Row And LastRow > 0 Then
     gridREPD_ResQueryRcv.GetRowData(LastRow).RowStyle = "Default"
     gridREPD_ResQueryRcv.GetRowData(gridREPD_ResQueryRcv.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuREPD_ResQueryRcvPASTE_Click()
On Error Resume Next
    If gridREPD_RequestQuery.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridREPD_RequestQuery.RowBookmark(gridREPD_RequestQuery.RowIndex(gridREPD_RequestQuery.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.REPD_ResQueryRcv.Add()
    If GetFromBuffer(u) Then
      gridREPD_ResQueryRcv.ItemCount = u.Parent.Count
    Else
      gu.REPD_ResQueryRcv.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridREPD_ResQueryRcv_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdREPD_ResQueryRcvCfg_Click
        End If
    End If
End Sub

Private Sub gridREPD_ResQueryRcv_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupREPD_ResQueryRcv
End If
End Sub
Private Sub mnuREPD_ResQueryRcvAdd_click()
   menuActionREPD_ResQueryRcv = "ADD"
   menuTimerREPD_ResQueryRcv.Enabled = True
End Sub
Private Sub mnuREPD_ResQueryRcvEdit_click()
   menuActionREPD_ResQueryRcv = "EDIT"
   menuTimerREPD_ResQueryRcv.Enabled = True
End Sub
Private Sub mnuREPD_ResQueryRcvDelete_click()
   menuActionREPD_ResQueryRcv = "DEL"
   menuTimerREPD_ResQueryRcv.Enabled = True
End Sub
Private Sub mnuREPD_ResQueryRcvOpen_click()
   menuActionREPD_ResQueryRcv = "RUN"
   menuTimerREPD_ResQueryRcv.Enabled = True
End Sub
Private Sub mnuREPD_ResQueryRcvRef_click()
   menuActionREPD_ResQueryRcv = "REF"
   menuTimerREPD_ResQueryRcv.Enabled = True
End Sub
  Private Sub mnuREPD_ResQueryRcvCOPY_Click()
    On Error Resume Next
    If gridREPD_ResQueryRcv.ItemCount = 0 Then Exit Sub
    If gridREPD_ResQueryRcv.Row > 0 Then
     If gridREPD_ResQueryRcv.RowIndex(gridREPD_ResQueryRcv.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridREPD_ResQueryRcv.RowBookmark(gridREPD_ResQueryRcv.RowIndex(gridREPD_ResQueryRcv.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuREPD_ResQueryRcvCUT_Click()
    On Error Resume Next
    If gridREPD_ResQueryRcv.ItemCount = 0 Then Exit Sub
    If gridREPD_ResQueryRcv.Row > 0 Then
     If gridREPD_ResQueryRcv.RowIndex(gridREPD_ResQueryRcv.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridREPD_ResQueryRcv.RowBookmark(gridREPD_ResQueryRcv.RowIndex(gridREPD_ResQueryRcv.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridREPD_ResQueryRcv.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuREPD_ResQueryRcvCHANGE_Click()
  On Error Resume Next
  If gridREPD_ResQueryRcv.ItemCount = 0 Then Exit Sub
  If gridREPD_ResQueryRcv.Row > 0 Then
   If gridREPD_ResQueryRcv.RowIndex(gridREPD_ResQueryRcv.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridREPD_ResQueryRcv.RowBookmark(gridREPD_ResQueryRcv.RowIndex(gridREPD_ResQueryRcv.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridREPD_ResQueryRcv.ItemCount = u.Parent.Count
      gridREPD_ResQueryRcv.RefreshRowIndex gridREPD_ResQueryRcv.RowIndex(gridREPD_ResQueryRcv.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuREPD_ResQueryRcvCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuREPD_ResQueryRcvPrn_click()
   menuActionREPD_ResQueryRcv = "PRN"
   menuTimerREPD_ResQueryRcv.Enabled = True
End Sub
Private Sub mnuREPD_ResQueryRcvCfg_click()
   menuActionREPD_ResQueryRcv = "CFG"
   menuTimerREPD_ResQueryRcv.Enabled = True
End Sub
Private Sub mnuREPD_ResQueryRcvFind_click()
   menuActionREPD_ResQueryRcv = "FND"
   menuTimerREPD_ResQueryRcv.Enabled = True
End Sub
Private Sub mnuREPD_ResQueryRcvAcc_click()
   menuActionREPD_ResQueryRcv = "ACC"
   menuTimerREPD_ResQueryRcv.Enabled = True
End Sub
Private Sub menuTimerREPD_ResQueryRcv_timer()
   menuTimerREPD_ResQueryRcv.Enabled = False
   If menuActionREPD_ResQueryRcv = "ADD" Then cmdREPD_ResQueryRcvAdd_Click
   If menuActionREPD_ResQueryRcv = "EDIT" Then cmdREPD_ResQueryRcvEdit_Click
   If menuActionREPD_ResQueryRcv = "DEL" Then cmdREPD_ResQueryRcvDel_Click
   If menuActionREPD_ResQueryRcv = "RUN" Then cmdREPD_ResQueryRcvRun_Click
   If menuActionREPD_ResQueryRcv = "REF" Then cmdREPD_ResQueryRcvRef_Click
   If menuActionREPD_ResQueryRcv = "PRN" Then cmdREPD_ResQueryRcvPrn_Click
   If menuActionREPD_ResQueryRcv = "CFG" Then cmdREPD_ResQueryRcvCfg_Click
   If menuActionREPD_ResQueryRcv = "FND" Then cmdREPD_ResQueryRcvFnd_Click
   If menuActionREPD_ResQueryRcv = "ACC" Then cmdREPD_ResQueryRcvAcc_Click
   menuActionREPD_ResQueryRcv = ""
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

  LoadBtnPictures cmdREPD_RequestQueryAdd, cmdREPD_RequestQueryAdd.Tag
  LoadBtnPictures cmdREPD_RequestQueryEdit, cmdREPD_RequestQueryEdit.Tag
  LoadBtnPictures cmdREPD_RequestQueryDel, cmdREPD_RequestQueryDel.Tag
  LoadBtnPictures cmdREPD_RequestQueryRef, cmdREPD_RequestQueryRef.Tag
  LoadBtnPictures cmdREPD_RequestQueryPrn, cmdREPD_RequestQueryPrn.Tag
  LoadBtnPictures cmdREPD_RequestQueryFnd, cmdREPD_RequestQueryFnd.Tag
  LoadBtnPictures cmdREPD_RequestQueryRun, cmdREPD_RequestQueryRun.Tag
  LoadBtnPictures cmdREPD_RequestQueryAcc, cmdREPD_RequestQueryAcc.Tag
  LoadBtnPictures cmdREPD_RequestQueryCfg, cmdREPD_RequestQueryCfg.Tag
  Item.REPD_RequestQuery.PrepareGrid gridREPD_RequestQuery
  LoadGridLayout gridREPD_RequestQuery
  Set fndREPD_RequestQuery = Nothing
  On Error Resume Next
  Set fndREPD_RequestQuery = CreateObject("MTZ_JSetup.GridFinder")
  fndREPD_RequestQuery.Init gridREPD_RequestQuery
  LoadBtnPictures cmdREPD_ResQueryRcvAdd, cmdREPD_ResQueryRcvAdd.Tag
  LoadBtnPictures cmdREPD_ResQueryRcvEdit, cmdREPD_ResQueryRcvEdit.Tag
  LoadBtnPictures cmdREPD_ResQueryRcvDel, cmdREPD_ResQueryRcvDel.Tag
  LoadBtnPictures cmdREPD_ResQueryRcvRef, cmdREPD_ResQueryRcvRef.Tag
  LoadBtnPictures cmdREPD_ResQueryRcvPrn, cmdREPD_ResQueryRcvPrn.Tag
  LoadBtnPictures cmdREPD_ResQueryRcvFnd, cmdREPD_ResQueryRcvFnd.Tag
  LoadBtnPictures cmdREPD_ResQueryRcvCfg, cmdREPD_ResQueryRcvCfg.Tag
  LoadBtnPictures cmdREPD_ResQueryRcvRun, cmdREPD_ResQueryRcvRun.Tag
  LoadBtnPictures cmdREPD_ResQueryRcvAcc, cmdREPD_ResQueryRcvAcc.Tag
  gridREPD_ResQueryRcv.Columns.Clear
  gridREPD_ResQueryRcv.ItemCount = 0
  cmdREPD_ResQueryRcvRef_Click
End Sub

'Действие при активизации таба
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

pnlREPD_RequestQuery.RestorePosition
  gridREPD_RequestQuery_RowColChange gridREPD_RequestQuery.Row, -1
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
  pnlREPD_RequestQuery.Move 0, 0, UserControl.Width, UserControl.Height
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
  Set fndREPD_RequestQuery = Nothing
  Set fndREPD_ResQueryRcv = Nothing
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





