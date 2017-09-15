VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnPEKTRF_TR_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerPEKTRF_REGRTR 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerPEKTRF_TR 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlPEKTRF_TR 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdPEKTRF_REGRTRAcc 
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
      Begin MTZ_PANEL.DropButton cmdPEKTRF_REGRTRRun 
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
      Begin VB.CommandButton cmdPEKTRF_REGRTRFnd 
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
      Begin VB.CommandButton cmdPEKTRF_REGRTRCfg 
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
      Begin VB.CommandButton cmdPEKTRF_REGRTRPrn 
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
      Begin VB.CommandButton cmdPEKTRF_REGRTRRef 
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
      Begin VB.CommandButton cmdPEKTRF_REGRTRDel 
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
      Begin VB.CommandButton cmdPEKTRF_REGRTREdit 
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
      Begin VB.CommandButton cmdPEKTRF_REGRTRAdd 
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
      Begin GridEX20.GridEX gridPEKTRF_REGRTR 
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
         Column(1)       =   "vpnPEKTRF_TR_.ctx":0000
         Column(2)       =   "vpnPEKTRF_TR_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnPEKTRF_TR_.ctx":016C
         FormatStyle(2)  =   "vpnPEKTRF_TR_.ctx":02C8
         FormatStyle(3)  =   "vpnPEKTRF_TR_.ctx":0378
         FormatStyle(4)  =   "vpnPEKTRF_TR_.ctx":042C
         FormatStyle(5)  =   "vpnPEKTRF_TR_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnPEKTRF_TR_.ctx":05BC
      End
      Begin VB.CommandButton cmdPEKTRF_TRAcc 
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
      Begin MTZ_PANEL.DropButton cmdPEKTRF_TRRun 
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
      Begin VB.CommandButton cmdPEKTRF_TRFnd 
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
      Begin VB.CommandButton cmdPEKTRF_TRCfg 
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
      Begin VB.CommandButton cmdPEKTRF_TRPrn 
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
      Begin VB.CommandButton cmdPEKTRF_TRRef 
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
      Begin VB.CommandButton cmdPEKTRF_TRDel 
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
      Begin VB.CommandButton cmdPEKTRF_TREdit 
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
      Begin VB.CommandButton cmdPEKTRF_TRAdd 
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
      Begin GridEX20.GridEX gridPEKTRF_TR 
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
         Column(1)       =   "vpnPEKTRF_TR_.ctx":0794
         Column(2)       =   "vpnPEKTRF_TR_.ctx":085C
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnPEKTRF_TR_.ctx":0900
         FormatStyle(2)  =   "vpnPEKTRF_TR_.ctx":0A5C
         FormatStyle(3)  =   "vpnPEKTRF_TR_.ctx":0B0C
         FormatStyle(4)  =   "vpnPEKTRF_TR_.ctx":0BC0
         FormatStyle(5)  =   "vpnPEKTRF_TR_.ctx":0C98
         ImageCount      =   0
         PrinterProperties=   "vpnPEKTRF_TR_.ctx":0D50
      End
   End
   Begin VB.Menu mnuPopupPEKTRF_TR 
      Caption         =   "Меню для Транспортировка"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKTRF_TRAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuPEKTRF_TREdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuPEKTRF_TRDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuPEKTRF_TROpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuPEKTRF_TRRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuPEKTRF_TRS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPEKTRF_TRBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuPEKTRF_TRCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuPEKTRF_TRCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuPEKTRF_TRPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuPEKTRF_TRCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuPEKTRF_TRCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuPEKTRF_TRPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuPEKTRF_TRCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuPEKTRF_TRFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuPEKTRF_TRAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupPEKTRF_REGRTR 
      Caption         =   "Меню для Регресс по весу"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKTRF_REGRTRAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuPEKTRF_REGRTREdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuPEKTRF_REGRTRDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuPEKTRF_REGRTROpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuPEKTRF_REGRTRRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuPEKTRF_REGRTRS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPEKTRF_REGRTRBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuPEKTRF_REGRTRCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuPEKTRF_REGRTRCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuPEKTRF_REGRTRPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuPEKTRF_REGRTRCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuPEKTRF_REGRTRCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuPEKTRF_REGRTRPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuPEKTRF_REGRTRCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuPEKTRF_REGRTRFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuPEKTRF_REGRTRAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnPEKTRF_TR_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndPEKTRF_TR As Object
Private menuActionPEKTRF_TR As String
Private fndPEKTRF_REGRTR As Object
Private menuActionPEKTRF_REGRTR As String





Private Sub pnlPEKTRF_TR_PositionChanged()
  pnlPEKTRF_TR.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridPEKTRF_TR_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdPEKTRF_TRCfg_Click
        End If
    End If
End Sub

Private Sub gridPEKTRF_TR_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupPEKTRF_TR
End If
End Sub
Private Sub mnuPEKTRF_TRAdd_click()
   menuActionPEKTRF_TR = "ADD"
   menuTimerPEKTRF_TR.Enabled = True
End Sub
Private Sub mnuPEKTRF_TREdit_click()
   menuActionPEKTRF_TR = "EDIT"
   menuTimerPEKTRF_TR.Enabled = True
End Sub
Private Sub mnuPEKTRF_TRDelete_click()
   menuActionPEKTRF_TR = "DEL"
   menuTimerPEKTRF_TR.Enabled = True
End Sub
Private Sub mnuPEKTRF_TROpen_click()
   menuActionPEKTRF_TR = "RUN"
   menuTimerPEKTRF_TR.Enabled = True
End Sub
Private Sub mnuPEKTRF_TRRef_click()
   menuActionPEKTRF_TR = "REF"
   menuTimerPEKTRF_TR.Enabled = True
End Sub
  Private Sub mnuPEKTRF_TRCOPY_Click()
    On Error Resume Next
    If gridPEKTRF_TR.ItemCount = 0 Then Exit Sub
    If gridPEKTRF_TR.Row > 0 Then
     If gridPEKTRF_TR.RowIndex(gridPEKTRF_TR.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKTRF_TR.RowBookmark(gridPEKTRF_TR.RowIndex(gridPEKTRF_TR.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEKTRF_TRCUT_Click()
    On Error Resume Next
    If gridPEKTRF_TR.ItemCount = 0 Then Exit Sub
    If gridPEKTRF_TR.Row > 0 Then
     If gridPEKTRF_TR.RowIndex(gridPEKTRF_TR.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKTRF_TR.RowBookmark(gridPEKTRF_TR.RowIndex(gridPEKTRF_TR.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEKTRF_TR.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuPEKTRF_TRCHANGE_Click()
  On Error Resume Next
  If gridPEKTRF_TR.ItemCount = 0 Then Exit Sub
  If gridPEKTRF_TR.Row > 0 Then
   If gridPEKTRF_TR.RowIndex(gridPEKTRF_TR.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKTRF_TR.RowBookmark(gridPEKTRF_TR.RowIndex(gridPEKTRF_TR.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEKTRF_TR.ItemCount = u.Parent.Count
      gridPEKTRF_TR.RefreshRowIndex gridPEKTRF_TR.RowIndex(gridPEKTRF_TR.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEKTRF_TRCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKTRF_TRPrn_click()
   menuActionPEKTRF_TR = "PRN"
   menuTimerPEKTRF_TR.Enabled = True
End Sub
Private Sub mnuPEKTRF_TRCfg_click()
   menuActionPEKTRF_TR = "CFG"
   menuTimerPEKTRF_TR.Enabled = True
End Sub
Private Sub mnuPEKTRF_TRFind_click()
   menuActionPEKTRF_TR = "FND"
   menuTimerPEKTRF_TR.Enabled = True
End Sub
Private Sub mnuPEKTRF_TRAcc_click()
   menuActionPEKTRF_TR = "ACC"
   menuTimerPEKTRF_TR.Enabled = True
End Sub
Private Sub menuTimerPEKTRF_TR_timer()
   menuTimerPEKTRF_TR.Enabled = False
   If menuActionPEKTRF_TR = "ADD" Then cmdPEKTRF_TRAdd_Click
   If menuActionPEKTRF_TR = "EDIT" Then cmdPEKTRF_TREdit_Click
   If menuActionPEKTRF_TR = "DEL" Then cmdPEKTRF_TRDel_Click
   If menuActionPEKTRF_TR = "RUN" Then cmdPEKTRF_TRRun_Click
   If menuActionPEKTRF_TR = "REF" Then cmdPEKTRF_TRRef_Click
   If menuActionPEKTRF_TR = "PRN" Then cmdPEKTRF_TRPrn_Click
   If menuActionPEKTRF_TR = "CFG" Then cmdPEKTRF_TRCfg_Click
   If menuActionPEKTRF_TR = "FND" Then cmdPEKTRF_TRFnd_Click
   If menuActionPEKTRF_TR = "ACC" Then cmdPEKTRF_TRAcc_Click
   menuActionPEKTRF_TR = ""
End Sub
Private Sub cmdPEKTRF_TRCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEKTRF_TR, "gridPEKTRF_TR"
Set jset = Nothing
End Sub

Private Sub cmdPEKTRF_TRPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEKTRF_TR, "Транспортировка"
Set jset = Nothing
End Sub

Private Sub cmdPEKTRF_TRRef_Click()
  On Error Resume Next
  Item.PEKTRF_TR.Refresh
  gridPEKTRF_TR.ItemCount = Item.PEKTRF_TR.Count
  gridPEKTRF_TR.Refetch
  gridPEKTRF_TR.Refresh
End Sub
Private Sub cmdPEKTRF_TRAcc_Click()
On Error Resume Next
If gridPEKTRF_TR.ItemCount = 0 Then Exit Sub
If gridPEKTRF_TR.Row > 0 Then
 If gridPEKTRF_TR.RowIndex(gridPEKTRF_TR.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKTRF_TR.RowBookmark(gridPEKTRF_TR.RowIndex(gridPEKTRF_TR.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdPEKTRF_TREdit_Click()
  On Error Resume Next
If gridPEKTRF_TR.ItemCount = 0 Then Exit Sub
If gridPEKTRF_TR.Row > 0 Then
 If gridPEKTRF_TR.RowIndex(gridPEKTRF_TR.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKTRF_TR.RowBookmark(gridPEKTRF_TR.RowIndex(gridPEKTRF_TR.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmPEKTRF_TR_.Item = u
again:     frmPEKTRF_TR_.NotFirstTime = False
    frmPEKTRF_TR_.OnInit
    frmPEKTRF_TR_.Show vbModal
    If frmPEKTRF_TR_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridPEKTRF_TR.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdPEKTRF_TRDel_Click()
  On Error Resume Next
  gridPEKTRF_TR.Delete
End Sub
Private Sub cmdPEKTRF_TRAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.PEKTRF_TR.Add()

      Set frmPEKTRF_TR_.Item = u
again:       frmPEKTRF_TR_.NotFirstTime = False
      frmPEKTRF_TR_.OnInit
      frmPEKTRF_TR_.Show vbModal
      If frmPEKTRF_TR_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridPEKTRF_TR.ItemCount = Item.PEKTRF_TR.Count
        gridPEKTRF_TR.Refresh
        gridPEKTRF_TR.RefreshGroups
        gridPEKTRF_TR.RefreshSort
        gridPEKTRF_TR.MoveToBookmark u.ID & "PEKTRF_TR"
      Else
        Item.PEKTRF_TR.Delete u.ID
        Item.PEKTRF_TR.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdPEKTRF_TRFnd_Click()
  On Error Resume Next
  fndPEKTRF_TR.ShowForm
End Sub
Private Sub cmdPEKTRF_TRRun_Click()
  On Error Resume Next
  gridPEKTRF_TR_DblClick
End Sub
Private Sub gridPEKTRF_TR_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.PEKTRF_TR.LoadRow gridPEKTRF_TR, RowIndex, Bookmark, Values
End Sub
Private Sub gridPEKTRF_TR_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridPEKTRF_TR.ItemCount = 0 Then Exit Sub
  Dim u As Object
  On Error Resume Next
  Set u = Item.FindRowObject(Right(Bookmark, Len(Bookmark) - 38), Left(Bookmark, 38))
  If Not u Is Nothing Then
    If MsgBox("Удалить элемент" & vbCrLf & u.Brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
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
Private Sub gridPEKTRF_TR_DblClick()
  cmdPEKTRF_TREdit_Click
End Sub
Private Sub gridPEKTRF_TR_KeyPress(KeyAscii As Integer)
  If gridPEKTRF_TR.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEKTRF_TR.FindOnPress KeyAscii
End Sub

Private Sub pnlPEKTRF_TR_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridPEKTRF_TR.Left = Left
  gridPEKTRF_TR.Top = Top + 25 * Screen.TwipsPerPixelY
  gridPEKTRF_TR.Width = Width
  gridPEKTRF_TR.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdPEKTRF_TRAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKTRF_TREdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKTRF_TRDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKTRF_TRRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKTRF_TRPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKTRF_TRCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKTRF_TRFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKTRF_TRRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKTRF_TRAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKTRF_TRAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdPEKTRF_TREdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdPEKTRF_TRDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdPEKTRF_TRRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdPEKTRF_TRPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdPEKTRF_TRCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdPEKTRF_TRFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdPEKTRF_TRRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdPEKTRF_TRAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuPEKTRF_TRPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.PEKTRF_TR.Add()
    If GetFromBuffer(u) Then
      gridPEKTRF_TR.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdPEKTRF_REGRTRCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEKTRF_REGRTR, "gridPEKTRF_REGRTR"
Set jset = Nothing
End Sub

Private Sub cmdPEKTRF_REGRTRPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEKTRF_REGRTR, "Регресс по весу"
Set jset = Nothing
End Sub

Private Sub cmdPEKTRF_REGRTRAcc_Click()
On Error Resume Next
If gridPEKTRF_REGRTR.ItemCount = 0 Then Exit Sub
If gridPEKTRF_REGRTR.Row > 0 Then
 If gridPEKTRF_REGRTR.RowIndex(gridPEKTRF_REGRTR.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKTRF_REGRTR.RowBookmark(gridPEKTRF_REGRTR.RowIndex(gridPEKTRF_REGRTR.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdPEKTRF_REGRTRFnd_Click()
  On Error Resume Next
  fndPEKTRF_REGRTR.ShowForm
End Sub
Private Sub cmdPEKTRF_REGRTRRun_Click()
  On Error Resume Next
  gridPEKTRF_REGRTR_DblClick
End Sub
Private Sub pnlPEKTRF_TR_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridPEKTRF_REGRTR.Left = Left
  gridPEKTRF_REGRTR.Top = Top + 25 * Screen.TwipsPerPixelY
  gridPEKTRF_REGRTR.Width = Width
  gridPEKTRF_REGRTR.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdPEKTRF_REGRTRAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKTRF_REGRTREdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKTRF_REGRTRDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKTRF_REGRTRRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKTRF_REGRTRPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKTRF_REGRTRCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKTRF_REGRTRFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKTRF_REGRTRRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKTRF_REGRTRAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKTRF_REGRTRAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdPEKTRF_REGRTREdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdPEKTRF_REGRTRDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdPEKTRF_REGRTRRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdPEKTRF_REGRTRPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdPEKTRF_REGRTRCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdPEKTRF_REGRTRFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdPEKTRF_REGRTRRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdPEKTRF_REGRTRAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdPEKTRF_REGRTRRef_Click()
  On Error Resume Next
If gridPEKTRF_TR.ItemCount = 0 Then Exit Sub
If gridPEKTRF_TR.Row > 0 Then
 If gridPEKTRF_TR.RowIndex(gridPEKTRF_TR.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridPEKTRF_TR.RowBookmark(gridPEKTRF_TR.RowIndex(gridPEKTRF_TR.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.PEKTRF_REGRTR.Refresh
   gridPEKTRF_REGRTR.ItemCount = gu.PEKTRF_REGRTR.Count
   gridPEKTRF_REGRTR.Refetch
   gridPEKTRF_REGRTR.Refresh
 Else
  gridPEKTRF_REGRTR.Columns.Clear
  gridPEKTRF_REGRTR.ItemCount = 0
 End If
Else
 gridPEKTRF_REGRTR.Columns.Clear
 gridPEKTRF_REGRTR.ItemCount = 0
End If
End Sub
Private Sub cmdPEKTRF_REGRTREdit_Click()
    If gridPEKTRF_REGRTR.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridPEKTRF_REGRTR.RowBookmark(gridPEKTRF_REGRTR.RowIndex(gridPEKTRF_REGRTR.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmPEKTRF_REGRTR_.Item = u
again:     frmPEKTRF_REGRTR_.NotFirstTime = False
    frmPEKTRF_REGRTR_.OnInit
    frmPEKTRF_REGRTR_.Show vbModal
    If frmPEKTRF_REGRTR_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridPEKTRF_REGRTR.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdPEKTRF_REGRTRDel_Click()
  On Error Resume Next
  gridPEKTRF_REGRTR.Delete
End Sub
Private Sub cmdPEKTRF_REGRTRAdd_Click()
  On Error Resume Next
    Dim gu As Object
    Dim u As Object
If gridPEKTRF_TR.ItemCount = 0 Then Exit Sub
    Dim bm
    bm = gridPEKTRF_TR.RowBookmark(gridPEKTRF_TR.RowIndex(gridPEKTRF_TR.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set u = gu.PEKTRF_REGRTR.Add()

      Set frmPEKTRF_REGRTR_.Item = u
again:       frmPEKTRF_REGRTR_.NotFirstTime = False
      frmPEKTRF_REGRTR_.OnInit
      frmPEKTRF_REGRTR_.Show vbModal
      If frmPEKTRF_REGRTR_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridPEKTRF_REGRTR.ItemCount = gu.PEKTRF_REGRTR.Count
        gridPEKTRF_REGRTR.Refresh
        gridPEKTRF_REGRTR.RefreshGroups
        gridPEKTRF_REGRTR.RefreshSort
        gridPEKTRF_REGRTR.MoveToBookmark u.ID & "PEKTRF_REGRTR"
      Else
        gu.PEKTRF_REGRTR.Delete u.ID
        gu.PEKTRF_REGRTR.Remove u.ID
      End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridPEKTRF_TR_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridPEKTRF_TR.ItemCount = 0 Then
  gridPEKTRF_REGRTR.ItemCount = 0
  Exit Sub
End If
If gridPEKTRF_TR.Row > 0 Then
  If LastRow <> gridPEKTRF_TR.Row And LastRow > 0 Then
    gridPEKTRF_TR.GetRowData(LastRow).RowStyle = "Default"
    gridPEKTRF_TR.GetRowData(gridPEKTRF_TR.Row).RowStyle = "SelectedRow"
  End If
 If gridPEKTRF_TR.RowIndex(gridPEKTRF_TR.Row) > 0 Then
  If LastRow <> gridPEKTRF_TR.Row Or gridPEKTRF_REGRTR.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridPEKTRF_TR.RowBookmark(gridPEKTRF_TR.RowIndex(gridPEKTRF_TR.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.PEKTRF_REGRTR.PrepareGrid gridPEKTRF_REGRTR
  gridPEKTRF_REGRTR.ItemCount = 0
    LoadGridLayout gridPEKTRF_REGRTR
    Set fndPEKTRF_REGRTR = Nothing
    Set fndPEKTRF_REGRTR = CreateObject("MTZ_JSetup.GridFinder")
    fndPEKTRF_REGRTR.Init gridPEKTRF_REGRTR
  gridPEKTRF_REGRTR.ItemCount = gu.PEKTRF_REGRTR.Count
  End If
 End If
End If
End Sub
Private Sub gridPEKTRF_REGRTR_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
    If gridPEKTRF_TR.ItemCount = 0 Then Exit Sub
    If gridPEKTRF_REGRTR.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridPEKTRF_TR.RowBookmark(gridPEKTRF_TR.RowIndex(gridPEKTRF_TR.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.PEKTRF_REGRTR.LoadRow gridPEKTRF_REGRTR, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridPEKTRF_REGRTR_KeyPress(KeyAscii As Integer)
  If gridPEKTRF_REGRTR.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEKTRF_REGRTR.FindOnPress KeyAscii
End Sub

Private Sub gridPEKTRF_REGRTR_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If gridPEKTRF_REGRTR.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridPEKTRF_REGRTR.RowBookmark(gridPEKTRF_REGRTR.RowIndex(gridPEKTRF_REGRTR.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    If Not u Is Nothing Then
      On Error Resume Next
      If MsgBox("Удалить элемент" & vbCrLf & u.Brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
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
Private Sub gridPEKTRF_REGRTR_DblClick()
    cmdPEKTRF_REGRTREdit_Click
End Sub
Private Sub gridPEKTRF_REGRTR_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridPEKTRF_REGRTR.ItemCount = 0 Then Exit Sub
 If gridPEKTRF_REGRTR.Row > 0 Then
   If LastRow <> gridPEKTRF_REGRTR.Row And LastRow > 0 Then
     gridPEKTRF_REGRTR.GetRowData(LastRow).RowStyle = "Default"
     gridPEKTRF_REGRTR.GetRowData(gridPEKTRF_REGRTR.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuPEKTRF_REGRTRPASTE_Click()
On Error Resume Next
    If gridPEKTRF_TR.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridPEKTRF_TR.RowBookmark(gridPEKTRF_TR.RowIndex(gridPEKTRF_TR.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.PEKTRF_REGRTR.Add()
    If GetFromBuffer(u) Then
      gridPEKTRF_REGRTR.ItemCount = u.Parent.Count
    Else
      gu.PEKTRF_REGRTR.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridPEKTRF_REGRTR_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdPEKTRF_REGRTRCfg_Click
        End If
    End If
End Sub

Private Sub gridPEKTRF_REGRTR_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupPEKTRF_REGRTR
End If
End Sub
Private Sub mnuPEKTRF_REGRTRAdd_click()
   menuActionPEKTRF_REGRTR = "ADD"
   menuTimerPEKTRF_REGRTR.Enabled = True
End Sub
Private Sub mnuPEKTRF_REGRTREdit_click()
   menuActionPEKTRF_REGRTR = "EDIT"
   menuTimerPEKTRF_REGRTR.Enabled = True
End Sub
Private Sub mnuPEKTRF_REGRTRDelete_click()
   menuActionPEKTRF_REGRTR = "DEL"
   menuTimerPEKTRF_REGRTR.Enabled = True
End Sub
Private Sub mnuPEKTRF_REGRTROpen_click()
   menuActionPEKTRF_REGRTR = "RUN"
   menuTimerPEKTRF_REGRTR.Enabled = True
End Sub
Private Sub mnuPEKTRF_REGRTRRef_click()
   menuActionPEKTRF_REGRTR = "REF"
   menuTimerPEKTRF_REGRTR.Enabled = True
End Sub
  Private Sub mnuPEKTRF_REGRTRCOPY_Click()
    On Error Resume Next
    If gridPEKTRF_REGRTR.ItemCount = 0 Then Exit Sub
    If gridPEKTRF_REGRTR.Row > 0 Then
     If gridPEKTRF_REGRTR.RowIndex(gridPEKTRF_REGRTR.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKTRF_REGRTR.RowBookmark(gridPEKTRF_REGRTR.RowIndex(gridPEKTRF_REGRTR.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEKTRF_REGRTRCUT_Click()
    On Error Resume Next
    If gridPEKTRF_REGRTR.ItemCount = 0 Then Exit Sub
    If gridPEKTRF_REGRTR.Row > 0 Then
     If gridPEKTRF_REGRTR.RowIndex(gridPEKTRF_REGRTR.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKTRF_REGRTR.RowBookmark(gridPEKTRF_REGRTR.RowIndex(gridPEKTRF_REGRTR.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEKTRF_REGRTR.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuPEKTRF_REGRTRCHANGE_Click()
  On Error Resume Next
  If gridPEKTRF_REGRTR.ItemCount = 0 Then Exit Sub
  If gridPEKTRF_REGRTR.Row > 0 Then
   If gridPEKTRF_REGRTR.RowIndex(gridPEKTRF_REGRTR.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKTRF_REGRTR.RowBookmark(gridPEKTRF_REGRTR.RowIndex(gridPEKTRF_REGRTR.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEKTRF_REGRTR.ItemCount = u.Parent.Count
      gridPEKTRF_REGRTR.RefreshRowIndex gridPEKTRF_REGRTR.RowIndex(gridPEKTRF_REGRTR.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEKTRF_REGRTRCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKTRF_REGRTRPrn_click()
   menuActionPEKTRF_REGRTR = "PRN"
   menuTimerPEKTRF_REGRTR.Enabled = True
End Sub
Private Sub mnuPEKTRF_REGRTRCfg_click()
   menuActionPEKTRF_REGRTR = "CFG"
   menuTimerPEKTRF_REGRTR.Enabled = True
End Sub
Private Sub mnuPEKTRF_REGRTRFind_click()
   menuActionPEKTRF_REGRTR = "FND"
   menuTimerPEKTRF_REGRTR.Enabled = True
End Sub
Private Sub mnuPEKTRF_REGRTRAcc_click()
   menuActionPEKTRF_REGRTR = "ACC"
   menuTimerPEKTRF_REGRTR.Enabled = True
End Sub
Private Sub menuTimerPEKTRF_REGRTR_timer()
   menuTimerPEKTRF_REGRTR.Enabled = False
   If menuActionPEKTRF_REGRTR = "ADD" Then cmdPEKTRF_REGRTRAdd_Click
   If menuActionPEKTRF_REGRTR = "EDIT" Then cmdPEKTRF_REGRTREdit_Click
   If menuActionPEKTRF_REGRTR = "DEL" Then cmdPEKTRF_REGRTRDel_Click
   If menuActionPEKTRF_REGRTR = "RUN" Then cmdPEKTRF_REGRTRRun_Click
   If menuActionPEKTRF_REGRTR = "REF" Then cmdPEKTRF_REGRTRRef_Click
   If menuActionPEKTRF_REGRTR = "PRN" Then cmdPEKTRF_REGRTRPrn_Click
   If menuActionPEKTRF_REGRTR = "CFG" Then cmdPEKTRF_REGRTRCfg_Click
   If menuActionPEKTRF_REGRTR = "FND" Then cmdPEKTRF_REGRTRFnd_Click
   If menuActionPEKTRF_REGRTR = "ACC" Then cmdPEKTRF_REGRTRAcc_Click
   menuActionPEKTRF_REGRTR = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdPEKTRF_TRAdd, cmdPEKTRF_TRAdd.Tag
  LoadBtnPictures cmdPEKTRF_TREdit, cmdPEKTRF_TREdit.Tag
  LoadBtnPictures cmdPEKTRF_TRDel, cmdPEKTRF_TRDel.Tag
  LoadBtnPictures cmdPEKTRF_TRRef, cmdPEKTRF_TRRef.Tag
  LoadBtnPictures cmdPEKTRF_TRPrn, cmdPEKTRF_TRPrn.Tag
  LoadBtnPictures cmdPEKTRF_TRFnd, cmdPEKTRF_TRFnd.Tag
  LoadBtnPictures cmdPEKTRF_TRRun, cmdPEKTRF_TRRun.Tag
  LoadBtnPictures cmdPEKTRF_TRAcc, cmdPEKTRF_TRAcc.Tag
  LoadBtnPictures cmdPEKTRF_TRCfg, cmdPEKTRF_TRCfg.Tag
  Item.PEKTRF_TR.PrepareGrid gridPEKTRF_TR
  LoadGridLayout gridPEKTRF_TR
  Set fndPEKTRF_TR = Nothing
  On Error Resume Next
  Set fndPEKTRF_TR = CreateObject("MTZ_JSetup.GridFinder")
  fndPEKTRF_TR.Init gridPEKTRF_TR
  LoadBtnPictures cmdPEKTRF_REGRTRAdd, cmdPEKTRF_REGRTRAdd.Tag
  LoadBtnPictures cmdPEKTRF_REGRTREdit, cmdPEKTRF_REGRTREdit.Tag
  LoadBtnPictures cmdPEKTRF_REGRTRDel, cmdPEKTRF_REGRTRDel.Tag
  LoadBtnPictures cmdPEKTRF_REGRTRRef, cmdPEKTRF_REGRTRRef.Tag
  LoadBtnPictures cmdPEKTRF_REGRTRPrn, cmdPEKTRF_REGRTRPrn.Tag
  LoadBtnPictures cmdPEKTRF_REGRTRFnd, cmdPEKTRF_REGRTRFnd.Tag
  LoadBtnPictures cmdPEKTRF_REGRTRCfg, cmdPEKTRF_REGRTRCfg.Tag
  LoadBtnPictures cmdPEKTRF_REGRTRRun, cmdPEKTRF_REGRTRRun.Tag
  LoadBtnPictures cmdPEKTRF_REGRTRAcc, cmdPEKTRF_REGRTRAcc.Tag
  gridPEKTRF_REGRTR.Columns.Clear
  gridPEKTRF_REGRTR.ItemCount = 0
  cmdPEKTRF_REGRTRRef_Click
End Sub
Private Sub OnTabClick()

pnlPEKTRF_TR.RestorePosition
  gridPEKTRF_TR_RowColChange gridPEKTRF_TR.Row, -1
End Sub
Public Sub OnClick(aItem As Object, Optional pForm As Object = Nothing)
  On Error Resume Next
  Set Item = aItem
  Set ParentForm = pForm
  OnTabClick
End Sub
Public Sub OnSave()
  
End Sub
Public Function IsChanged() As Boolean
  Dim m_IsChanged As Boolean
  On Error Resume Next
  
  IsChanged = m_IsChanged
End Function
Private Sub UserControl_Resize()
  On Error Resume Next
  pnlPEKTRF_TR.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndPEKTRF_TR = Nothing
  Set fndPEKTRF_REGRTR = Nothing
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
  MsgBox err.Description, vbOKOnly + vbCritical, "Установка стиля защиты"
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
  MsgBox err.Description, vbOKOnly + vbCritical, "Установка стиля защиты"
End Sub



'Создание отчета из разных карточек
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
'  ID = CreateGUID2
 'Call RowItem.Application.Manager.NewInstance(ID, "VRRPT2", "Отчет " & Date)
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



'Создать новую оплату из клиента
'{42A1A436-8AA2-4F1F-999B-6680DFF514DE}
Private Sub Run_VBNewPayIn(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2P", "Платеж " & Date)
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



'Создать новый платеж из клиента
'{2BB30818-90ED-4627-8ABB-85B3FBA46750}
Private Sub Run_VBNewPayOut(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2O", "Оплата " & Date)
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
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2Z", "Заявка " & Date)
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





