VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnPEKCL_DAYLY_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerPEKL_TOLOAD 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerPEKCL_DAYLY 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlPEKCL_DAYLY 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdPEKL_TOLOADAcc 
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
      Begin MTZ_PANEL.DropButton cmdPEKL_TOLOADRun 
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
      Begin VB.CommandButton cmdPEKL_TOLOADFnd 
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
      Begin VB.CommandButton cmdPEKL_TOLOADCfg 
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
      Begin VB.CommandButton cmdPEKL_TOLOADPrn 
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
      Begin VB.CommandButton cmdPEKL_TOLOADRef 
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
      Begin VB.CommandButton cmdPEKL_TOLOADDel 
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
      Begin VB.CommandButton cmdPEKL_TOLOADEdit 
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
      Begin VB.CommandButton cmdPEKL_TOLOADAdd 
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
      Begin GridEX20.GridEX gridPEKL_TOLOAD 
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
         Column(1)       =   "vpnPEKCL_DAYLY_.ctx":0000
         Column(2)       =   "vpnPEKCL_DAYLY_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnPEKCL_DAYLY_.ctx":016C
         FormatStyle(2)  =   "vpnPEKCL_DAYLY_.ctx":02C8
         FormatStyle(3)  =   "vpnPEKCL_DAYLY_.ctx":0378
         FormatStyle(4)  =   "vpnPEKCL_DAYLY_.ctx":042C
         FormatStyle(5)  =   "vpnPEKCL_DAYLY_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnPEKCL_DAYLY_.ctx":05BC
      End
      Begin VB.CommandButton cmdPEKCL_DAYLYAcc 
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
      Begin MTZ_PANEL.DropButton cmdPEKCL_DAYLYRun 
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
      Begin VB.CommandButton cmdPEKCL_DAYLYFnd 
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
      Begin VB.CommandButton cmdPEKCL_DAYLYCfg 
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
      Begin VB.CommandButton cmdPEKCL_DAYLYPrn 
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
      Begin VB.CommandButton cmdPEKCL_DAYLYRef 
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
      Begin VB.CommandButton cmdPEKCL_DAYLYDel 
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
      Begin VB.CommandButton cmdPEKCL_DAYLYEdit 
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
      Begin VB.CommandButton cmdPEKCL_DAYLYAdd 
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
      Begin GridEX20.GridEX gridPEKCL_DAYLY 
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
         Column(1)       =   "vpnPEKCL_DAYLY_.ctx":0794
         Column(2)       =   "vpnPEKCL_DAYLY_.ctx":085C
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnPEKCL_DAYLY_.ctx":0900
         FormatStyle(2)  =   "vpnPEKCL_DAYLY_.ctx":0A5C
         FormatStyle(3)  =   "vpnPEKCL_DAYLY_.ctx":0B0C
         FormatStyle(4)  =   "vpnPEKCL_DAYLY_.ctx":0BC0
         FormatStyle(5)  =   "vpnPEKCL_DAYLY_.ctx":0C98
         ImageCount      =   0
         PrinterProperties=   "vpnPEKCL_DAYLY_.ctx":0D50
      End
   End
   Begin VB.Menu mnuPopupPEKCL_DAYLY 
      Caption         =   "Меню для Текущие лимиты"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKCL_DAYLYAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuPEKCL_DAYLYEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuPEKCL_DAYLYDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuPEKCL_DAYLYOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuPEKCL_DAYLYRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuPEKCL_DAYLYS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPEKCL_DAYLYBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuPEKCL_DAYLYCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuPEKCL_DAYLYCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuPEKCL_DAYLYPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuPEKCL_DAYLYCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuPEKCL_DAYLYCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuPEKCL_DAYLYPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuPEKCL_DAYLYCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuPEKCL_DAYLYFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuPEKCL_DAYLYAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupPEKL_TOLOAD 
      Caption         =   "Меню для Обемы под загрузку"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKL_TOLOADAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuPEKL_TOLOADEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuPEKL_TOLOADDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuPEKL_TOLOADOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuPEKL_TOLOADRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuPEKL_TOLOADS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPEKL_TOLOADBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuPEKL_TOLOADCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuPEKL_TOLOADCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuPEKL_TOLOADPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuPEKL_TOLOADCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuPEKL_TOLOADCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuPEKL_TOLOADPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuPEKL_TOLOADCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuPEKL_TOLOADFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuPEKL_TOLOADAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnPEKCL_DAYLY_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndPEKCL_DAYLY As Object
Private menuActionPEKCL_DAYLY As String
Private fndPEKL_TOLOAD As Object
Private menuActionPEKL_TOLOAD As String





Private Sub pnlPEKCL_DAYLY_PositionChanged()
  pnlPEKCL_DAYLY.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridPEKCL_DAYLY_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdPEKCL_DAYLYCfg_Click
        End If
    End If
End Sub

Private Sub gridPEKCL_DAYLY_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupPEKCL_DAYLY
End If
End Sub
Private Sub mnuPEKCL_DAYLYAdd_click()
   menuActionPEKCL_DAYLY = "ADD"
   menuTimerPEKCL_DAYLY.Enabled = True
End Sub
Private Sub mnuPEKCL_DAYLYEdit_click()
   menuActionPEKCL_DAYLY = "EDIT"
   menuTimerPEKCL_DAYLY.Enabled = True
End Sub
Private Sub mnuPEKCL_DAYLYDelete_click()
   menuActionPEKCL_DAYLY = "DEL"
   menuTimerPEKCL_DAYLY.Enabled = True
End Sub
Private Sub mnuPEKCL_DAYLYOpen_click()
   menuActionPEKCL_DAYLY = "RUN"
   menuTimerPEKCL_DAYLY.Enabled = True
End Sub
Private Sub mnuPEKCL_DAYLYRef_click()
   menuActionPEKCL_DAYLY = "REF"
   menuTimerPEKCL_DAYLY.Enabled = True
End Sub
  Private Sub mnuPEKCL_DAYLYCOPY_Click()
    On Error Resume Next
    If gridPEKCL_DAYLY.ItemCount = 0 Then Exit Sub
    If gridPEKCL_DAYLY.Row > 0 Then
     If gridPEKCL_DAYLY.RowIndex(gridPEKCL_DAYLY.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKCL_DAYLY.RowBookmark(gridPEKCL_DAYLY.RowIndex(gridPEKCL_DAYLY.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEKCL_DAYLYCUT_Click()
    On Error Resume Next
    If gridPEKCL_DAYLY.ItemCount = 0 Then Exit Sub
    If gridPEKCL_DAYLY.Row > 0 Then
     If gridPEKCL_DAYLY.RowIndex(gridPEKCL_DAYLY.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKCL_DAYLY.RowBookmark(gridPEKCL_DAYLY.RowIndex(gridPEKCL_DAYLY.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEKCL_DAYLY.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuPEKCL_DAYLYCHANGE_Click()
  On Error Resume Next
  If gridPEKCL_DAYLY.ItemCount = 0 Then Exit Sub
  If gridPEKCL_DAYLY.Row > 0 Then
   If gridPEKCL_DAYLY.RowIndex(gridPEKCL_DAYLY.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKCL_DAYLY.RowBookmark(gridPEKCL_DAYLY.RowIndex(gridPEKCL_DAYLY.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEKCL_DAYLY.ItemCount = u.Parent.Count
      gridPEKCL_DAYLY.RefreshRowIndex gridPEKCL_DAYLY.RowIndex(gridPEKCL_DAYLY.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEKCL_DAYLYCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKCL_DAYLYPrn_click()
   menuActionPEKCL_DAYLY = "PRN"
   menuTimerPEKCL_DAYLY.Enabled = True
End Sub
Private Sub mnuPEKCL_DAYLYCfg_click()
   menuActionPEKCL_DAYLY = "CFG"
   menuTimerPEKCL_DAYLY.Enabled = True
End Sub
Private Sub mnuPEKCL_DAYLYFind_click()
   menuActionPEKCL_DAYLY = "FND"
   menuTimerPEKCL_DAYLY.Enabled = True
End Sub
Private Sub mnuPEKCL_DAYLYAcc_click()
   menuActionPEKCL_DAYLY = "ACC"
   menuTimerPEKCL_DAYLY.Enabled = True
End Sub
Private Sub menuTimerPEKCL_DAYLY_timer()
   menuTimerPEKCL_DAYLY.Enabled = False
   If menuActionPEKCL_DAYLY = "ADD" Then cmdPEKCL_DAYLYAdd_Click
   If menuActionPEKCL_DAYLY = "EDIT" Then cmdPEKCL_DAYLYEdit_Click
   If menuActionPEKCL_DAYLY = "DEL" Then cmdPEKCL_DAYLYDel_Click
   If menuActionPEKCL_DAYLY = "RUN" Then cmdPEKCL_DAYLYRun_Click
   If menuActionPEKCL_DAYLY = "REF" Then cmdPEKCL_DAYLYRef_Click
   If menuActionPEKCL_DAYLY = "PRN" Then cmdPEKCL_DAYLYPrn_Click
   If menuActionPEKCL_DAYLY = "CFG" Then cmdPEKCL_DAYLYCfg_Click
   If menuActionPEKCL_DAYLY = "FND" Then cmdPEKCL_DAYLYFnd_Click
   If menuActionPEKCL_DAYLY = "ACC" Then cmdPEKCL_DAYLYAcc_Click
   menuActionPEKCL_DAYLY = ""
End Sub
Private Sub cmdPEKCL_DAYLYCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEKCL_DAYLY, "gridPEKCL_DAYLY"
Set jset = Nothing
End Sub

Private Sub cmdPEKCL_DAYLYPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEKCL_DAYLY, "Текущие лимиты"
Set jset = Nothing
End Sub

Private Sub cmdPEKCL_DAYLYRef_Click()
  On Error Resume Next
  Item.PEKCL_DAYLY.Refresh
  gridPEKCL_DAYLY.ItemCount = Item.PEKCL_DAYLY.Count
  gridPEKCL_DAYLY.Refetch
  gridPEKCL_DAYLY.Refresh
End Sub
Private Sub cmdPEKCL_DAYLYAcc_Click()
On Error Resume Next
If gridPEKCL_DAYLY.ItemCount = 0 Then Exit Sub
If gridPEKCL_DAYLY.Row > 0 Then
 If gridPEKCL_DAYLY.RowIndex(gridPEKCL_DAYLY.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKCL_DAYLY.RowBookmark(gridPEKCL_DAYLY.RowIndex(gridPEKCL_DAYLY.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdPEKCL_DAYLYEdit_Click()
  On Error Resume Next
If gridPEKCL_DAYLY.ItemCount = 0 Then Exit Sub
If gridPEKCL_DAYLY.Row > 0 Then
 If gridPEKCL_DAYLY.RowIndex(gridPEKCL_DAYLY.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKCL_DAYLY.RowBookmark(gridPEKCL_DAYLY.RowIndex(gridPEKCL_DAYLY.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmPEKCL_DAYLY_.Item = u
again:     frmPEKCL_DAYLY_.NotFirstTime = False
    frmPEKCL_DAYLY_.OnInit
    frmPEKCL_DAYLY_.Show vbModal
    If frmPEKCL_DAYLY_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridPEKCL_DAYLY.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdPEKCL_DAYLYDel_Click()
  On Error Resume Next
  gridPEKCL_DAYLY.Delete
End Sub
Private Sub cmdPEKCL_DAYLYAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.PEKCL_DAYLY.Add()

      Set frmPEKCL_DAYLY_.Item = u
again:       frmPEKCL_DAYLY_.NotFirstTime = False
      frmPEKCL_DAYLY_.OnInit
      frmPEKCL_DAYLY_.Show vbModal
      If frmPEKCL_DAYLY_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridPEKCL_DAYLY.ItemCount = Item.PEKCL_DAYLY.Count
        gridPEKCL_DAYLY.Refresh
        gridPEKCL_DAYLY.RefreshGroups
        gridPEKCL_DAYLY.RefreshSort
        gridPEKCL_DAYLY.MoveToBookmark u.ID & "PEKCL_DAYLY"
      Else
        Item.PEKCL_DAYLY.Delete u.ID
        Item.PEKCL_DAYLY.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdPEKCL_DAYLYFnd_Click()
  On Error Resume Next
  fndPEKCL_DAYLY.ShowForm
End Sub
Private Sub cmdPEKCL_DAYLYRun_Click()
  On Error Resume Next
  gridPEKCL_DAYLY_DblClick
End Sub
Private Sub gridPEKCL_DAYLY_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.PEKCL_DAYLY.LoadRow gridPEKCL_DAYLY, RowIndex, Bookmark, Values
End Sub
Private Sub gridPEKCL_DAYLY_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridPEKCL_DAYLY.ItemCount = 0 Then Exit Sub
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
Private Sub gridPEKCL_DAYLY_DblClick()
  cmdPEKCL_DAYLYEdit_Click
End Sub
Private Sub gridPEKCL_DAYLY_KeyPress(KeyAscii As Integer)
  If gridPEKCL_DAYLY.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEKCL_DAYLY.FindOnPress KeyAscii
End Sub

Private Sub pnlPEKCL_DAYLY_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridPEKCL_DAYLY.Left = Left
  gridPEKCL_DAYLY.Top = Top + 25 * Screen.TwipsPerPixelY
  gridPEKCL_DAYLY.Width = Width
  gridPEKCL_DAYLY.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdPEKCL_DAYLYAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKCL_DAYLYEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKCL_DAYLYDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKCL_DAYLYRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKCL_DAYLYPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKCL_DAYLYCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKCL_DAYLYFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKCL_DAYLYRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKCL_DAYLYAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKCL_DAYLYAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdPEKCL_DAYLYEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdPEKCL_DAYLYDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdPEKCL_DAYLYRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdPEKCL_DAYLYPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdPEKCL_DAYLYCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdPEKCL_DAYLYFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdPEKCL_DAYLYRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdPEKCL_DAYLYAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuPEKCL_DAYLYPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.PEKCL_DAYLY.Add()
    If GetFromBuffer(u) Then
      gridPEKCL_DAYLY.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdPEKL_TOLOADCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEKL_TOLOAD, "gridPEKL_TOLOAD"
Set jset = Nothing
End Sub

Private Sub cmdPEKL_TOLOADPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEKL_TOLOAD, "Обемы под загрузку"
Set jset = Nothing
End Sub

Private Sub cmdPEKL_TOLOADAcc_Click()
On Error Resume Next
If gridPEKL_TOLOAD.ItemCount = 0 Then Exit Sub
If gridPEKL_TOLOAD.Row > 0 Then
 If gridPEKL_TOLOAD.RowIndex(gridPEKL_TOLOAD.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKL_TOLOAD.RowBookmark(gridPEKL_TOLOAD.RowIndex(gridPEKL_TOLOAD.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdPEKL_TOLOADFnd_Click()
  On Error Resume Next
  fndPEKL_TOLOAD.ShowForm
End Sub
Private Sub cmdPEKL_TOLOADRun_Click()
  On Error Resume Next
  gridPEKL_TOLOAD_DblClick
End Sub
Private Sub pnlPEKCL_DAYLY_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridPEKL_TOLOAD.Left = Left
  gridPEKL_TOLOAD.Top = Top + 25 * Screen.TwipsPerPixelY
  gridPEKL_TOLOAD.Width = Width
  gridPEKL_TOLOAD.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdPEKL_TOLOADAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKL_TOLOADEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKL_TOLOADDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKL_TOLOADRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKL_TOLOADPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKL_TOLOADCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKL_TOLOADFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKL_TOLOADRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKL_TOLOADAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKL_TOLOADAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdPEKL_TOLOADEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdPEKL_TOLOADDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdPEKL_TOLOADRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdPEKL_TOLOADPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdPEKL_TOLOADCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdPEKL_TOLOADFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdPEKL_TOLOADRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdPEKL_TOLOADAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdPEKL_TOLOADRef_Click()
  On Error Resume Next
If gridPEKCL_DAYLY.ItemCount = 0 Then Exit Sub
If gridPEKCL_DAYLY.Row > 0 Then
 If gridPEKCL_DAYLY.RowIndex(gridPEKCL_DAYLY.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridPEKCL_DAYLY.RowBookmark(gridPEKCL_DAYLY.RowIndex(gridPEKCL_DAYLY.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.PEKL_TOLOAD.Refresh
   gridPEKL_TOLOAD.ItemCount = gu.PEKL_TOLOAD.Count
   gridPEKL_TOLOAD.Refetch
   gridPEKL_TOLOAD.Refresh
 Else
  gridPEKL_TOLOAD.Columns.Clear
  gridPEKL_TOLOAD.ItemCount = 0
 End If
Else
 gridPEKL_TOLOAD.Columns.Clear
 gridPEKL_TOLOAD.ItemCount = 0
End If
End Sub
Private Sub cmdPEKL_TOLOADEdit_Click()
    If gridPEKL_TOLOAD.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridPEKL_TOLOAD.RowBookmark(gridPEKL_TOLOAD.RowIndex(gridPEKL_TOLOAD.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmPEKL_TOLOAD_.Item = u
again:     frmPEKL_TOLOAD_.NotFirstTime = False
    frmPEKL_TOLOAD_.OnInit
    frmPEKL_TOLOAD_.Show vbModal
    If frmPEKL_TOLOAD_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridPEKL_TOLOAD.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdPEKL_TOLOADDel_Click()
  On Error Resume Next
  gridPEKL_TOLOAD.Delete
End Sub
Private Sub cmdPEKL_TOLOADAdd_Click()
  On Error Resume Next
    Dim gu As Object
    Dim u As Object
If gridPEKCL_DAYLY.ItemCount = 0 Then Exit Sub
    Dim bm
    bm = gridPEKCL_DAYLY.RowBookmark(gridPEKCL_DAYLY.RowIndex(gridPEKCL_DAYLY.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set u = gu.PEKL_TOLOAD.Add()

      Set frmPEKL_TOLOAD_.Item = u
again:       frmPEKL_TOLOAD_.NotFirstTime = False
      frmPEKL_TOLOAD_.OnInit
      frmPEKL_TOLOAD_.Show vbModal
      If frmPEKL_TOLOAD_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridPEKL_TOLOAD.ItemCount = gu.PEKL_TOLOAD.Count
        gridPEKL_TOLOAD.Refresh
        gridPEKL_TOLOAD.RefreshGroups
        gridPEKL_TOLOAD.RefreshSort
        gridPEKL_TOLOAD.MoveToBookmark u.ID & "PEKL_TOLOAD"
      Else
        gu.PEKL_TOLOAD.Delete u.ID
        gu.PEKL_TOLOAD.Remove u.ID
      End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridPEKCL_DAYLY_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridPEKCL_DAYLY.ItemCount = 0 Then
  gridPEKL_TOLOAD.ItemCount = 0
  Exit Sub
End If
If gridPEKCL_DAYLY.Row > 0 Then
  If LastRow <> gridPEKCL_DAYLY.Row And LastRow > 0 Then
    gridPEKCL_DAYLY.GetRowData(LastRow).RowStyle = "Default"
    gridPEKCL_DAYLY.GetRowData(gridPEKCL_DAYLY.Row).RowStyle = "SelectedRow"
  End If
 If gridPEKCL_DAYLY.RowIndex(gridPEKCL_DAYLY.Row) > 0 Then
  If LastRow <> gridPEKCL_DAYLY.Row Or gridPEKL_TOLOAD.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridPEKCL_DAYLY.RowBookmark(gridPEKCL_DAYLY.RowIndex(gridPEKCL_DAYLY.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.PEKL_TOLOAD.PrepareGrid gridPEKL_TOLOAD
  gridPEKL_TOLOAD.ItemCount = 0
    LoadGridLayout gridPEKL_TOLOAD
    Set fndPEKL_TOLOAD = Nothing
    Set fndPEKL_TOLOAD = CreateObject("MTZ_JSetup.GridFinder")
    fndPEKL_TOLOAD.Init gridPEKL_TOLOAD
  gridPEKL_TOLOAD.ItemCount = gu.PEKL_TOLOAD.Count
  End If
 End If
End If
End Sub
Private Sub gridPEKL_TOLOAD_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
    If gridPEKCL_DAYLY.ItemCount = 0 Then Exit Sub
    If gridPEKL_TOLOAD.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridPEKCL_DAYLY.RowBookmark(gridPEKCL_DAYLY.RowIndex(gridPEKCL_DAYLY.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.PEKL_TOLOAD.LoadRow gridPEKL_TOLOAD, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridPEKL_TOLOAD_KeyPress(KeyAscii As Integer)
  If gridPEKL_TOLOAD.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEKL_TOLOAD.FindOnPress KeyAscii
End Sub

Private Sub gridPEKL_TOLOAD_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If gridPEKL_TOLOAD.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridPEKL_TOLOAD.RowBookmark(gridPEKL_TOLOAD.RowIndex(gridPEKL_TOLOAD.Row))
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
Private Sub gridPEKL_TOLOAD_DblClick()
    cmdPEKL_TOLOADEdit_Click
End Sub
Private Sub gridPEKL_TOLOAD_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridPEKL_TOLOAD.ItemCount = 0 Then Exit Sub
 If gridPEKL_TOLOAD.Row > 0 Then
   If LastRow <> gridPEKL_TOLOAD.Row And LastRow > 0 Then
     gridPEKL_TOLOAD.GetRowData(LastRow).RowStyle = "Default"
     gridPEKL_TOLOAD.GetRowData(gridPEKL_TOLOAD.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuPEKL_TOLOADPASTE_Click()
On Error Resume Next
    If gridPEKCL_DAYLY.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridPEKCL_DAYLY.RowBookmark(gridPEKCL_DAYLY.RowIndex(gridPEKCL_DAYLY.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.PEKL_TOLOAD.Add()
    If GetFromBuffer(u) Then
      gridPEKL_TOLOAD.ItemCount = u.Parent.Count
    Else
      gu.PEKL_TOLOAD.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridPEKL_TOLOAD_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdPEKL_TOLOADCfg_Click
        End If
    End If
End Sub

Private Sub gridPEKL_TOLOAD_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupPEKL_TOLOAD
End If
End Sub
Private Sub mnuPEKL_TOLOADAdd_click()
   menuActionPEKL_TOLOAD = "ADD"
   menuTimerPEKL_TOLOAD.Enabled = True
End Sub
Private Sub mnuPEKL_TOLOADEdit_click()
   menuActionPEKL_TOLOAD = "EDIT"
   menuTimerPEKL_TOLOAD.Enabled = True
End Sub
Private Sub mnuPEKL_TOLOADDelete_click()
   menuActionPEKL_TOLOAD = "DEL"
   menuTimerPEKL_TOLOAD.Enabled = True
End Sub
Private Sub mnuPEKL_TOLOADOpen_click()
   menuActionPEKL_TOLOAD = "RUN"
   menuTimerPEKL_TOLOAD.Enabled = True
End Sub
Private Sub mnuPEKL_TOLOADRef_click()
   menuActionPEKL_TOLOAD = "REF"
   menuTimerPEKL_TOLOAD.Enabled = True
End Sub
  Private Sub mnuPEKL_TOLOADCOPY_Click()
    On Error Resume Next
    If gridPEKL_TOLOAD.ItemCount = 0 Then Exit Sub
    If gridPEKL_TOLOAD.Row > 0 Then
     If gridPEKL_TOLOAD.RowIndex(gridPEKL_TOLOAD.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKL_TOLOAD.RowBookmark(gridPEKL_TOLOAD.RowIndex(gridPEKL_TOLOAD.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEKL_TOLOADCUT_Click()
    On Error Resume Next
    If gridPEKL_TOLOAD.ItemCount = 0 Then Exit Sub
    If gridPEKL_TOLOAD.Row > 0 Then
     If gridPEKL_TOLOAD.RowIndex(gridPEKL_TOLOAD.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKL_TOLOAD.RowBookmark(gridPEKL_TOLOAD.RowIndex(gridPEKL_TOLOAD.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEKL_TOLOAD.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuPEKL_TOLOADCHANGE_Click()
  On Error Resume Next
  If gridPEKL_TOLOAD.ItemCount = 0 Then Exit Sub
  If gridPEKL_TOLOAD.Row > 0 Then
   If gridPEKL_TOLOAD.RowIndex(gridPEKL_TOLOAD.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKL_TOLOAD.RowBookmark(gridPEKL_TOLOAD.RowIndex(gridPEKL_TOLOAD.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEKL_TOLOAD.ItemCount = u.Parent.Count
      gridPEKL_TOLOAD.RefreshRowIndex gridPEKL_TOLOAD.RowIndex(gridPEKL_TOLOAD.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEKL_TOLOADCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKL_TOLOADPrn_click()
   menuActionPEKL_TOLOAD = "PRN"
   menuTimerPEKL_TOLOAD.Enabled = True
End Sub
Private Sub mnuPEKL_TOLOADCfg_click()
   menuActionPEKL_TOLOAD = "CFG"
   menuTimerPEKL_TOLOAD.Enabled = True
End Sub
Private Sub mnuPEKL_TOLOADFind_click()
   menuActionPEKL_TOLOAD = "FND"
   menuTimerPEKL_TOLOAD.Enabled = True
End Sub
Private Sub mnuPEKL_TOLOADAcc_click()
   menuActionPEKL_TOLOAD = "ACC"
   menuTimerPEKL_TOLOAD.Enabled = True
End Sub
Private Sub menuTimerPEKL_TOLOAD_timer()
   menuTimerPEKL_TOLOAD.Enabled = False
   If menuActionPEKL_TOLOAD = "ADD" Then cmdPEKL_TOLOADAdd_Click
   If menuActionPEKL_TOLOAD = "EDIT" Then cmdPEKL_TOLOADEdit_Click
   If menuActionPEKL_TOLOAD = "DEL" Then cmdPEKL_TOLOADDel_Click
   If menuActionPEKL_TOLOAD = "RUN" Then cmdPEKL_TOLOADRun_Click
   If menuActionPEKL_TOLOAD = "REF" Then cmdPEKL_TOLOADRef_Click
   If menuActionPEKL_TOLOAD = "PRN" Then cmdPEKL_TOLOADPrn_Click
   If menuActionPEKL_TOLOAD = "CFG" Then cmdPEKL_TOLOADCfg_Click
   If menuActionPEKL_TOLOAD = "FND" Then cmdPEKL_TOLOADFnd_Click
   If menuActionPEKL_TOLOAD = "ACC" Then cmdPEKL_TOLOADAcc_Click
   menuActionPEKL_TOLOAD = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdPEKCL_DAYLYAdd, cmdPEKCL_DAYLYAdd.Tag
  LoadBtnPictures cmdPEKCL_DAYLYEdit, cmdPEKCL_DAYLYEdit.Tag
  LoadBtnPictures cmdPEKCL_DAYLYDel, cmdPEKCL_DAYLYDel.Tag
  LoadBtnPictures cmdPEKCL_DAYLYRef, cmdPEKCL_DAYLYRef.Tag
  LoadBtnPictures cmdPEKCL_DAYLYPrn, cmdPEKCL_DAYLYPrn.Tag
  LoadBtnPictures cmdPEKCL_DAYLYFnd, cmdPEKCL_DAYLYFnd.Tag
  LoadBtnPictures cmdPEKCL_DAYLYRun, cmdPEKCL_DAYLYRun.Tag
  LoadBtnPictures cmdPEKCL_DAYLYAcc, cmdPEKCL_DAYLYAcc.Tag
  LoadBtnPictures cmdPEKCL_DAYLYCfg, cmdPEKCL_DAYLYCfg.Tag
  Item.PEKCL_DAYLY.PrepareGrid gridPEKCL_DAYLY
  LoadGridLayout gridPEKCL_DAYLY
  Set fndPEKCL_DAYLY = Nothing
  On Error Resume Next
  Set fndPEKCL_DAYLY = CreateObject("MTZ_JSetup.GridFinder")
  fndPEKCL_DAYLY.Init gridPEKCL_DAYLY
  LoadBtnPictures cmdPEKL_TOLOADAdd, cmdPEKL_TOLOADAdd.Tag
  LoadBtnPictures cmdPEKL_TOLOADEdit, cmdPEKL_TOLOADEdit.Tag
  LoadBtnPictures cmdPEKL_TOLOADDel, cmdPEKL_TOLOADDel.Tag
  LoadBtnPictures cmdPEKL_TOLOADRef, cmdPEKL_TOLOADRef.Tag
  LoadBtnPictures cmdPEKL_TOLOADPrn, cmdPEKL_TOLOADPrn.Tag
  LoadBtnPictures cmdPEKL_TOLOADFnd, cmdPEKL_TOLOADFnd.Tag
  LoadBtnPictures cmdPEKL_TOLOADCfg, cmdPEKL_TOLOADCfg.Tag
  LoadBtnPictures cmdPEKL_TOLOADRun, cmdPEKL_TOLOADRun.Tag
  LoadBtnPictures cmdPEKL_TOLOADAcc, cmdPEKL_TOLOADAcc.Tag
  gridPEKL_TOLOAD.Columns.Clear
  gridPEKL_TOLOAD.ItemCount = 0
  cmdPEKL_TOLOADRef_Click
End Sub
Private Sub OnTabClick()

pnlPEKCL_DAYLY.RestorePosition
  gridPEKCL_DAYLY_RowColChange gridPEKCL_DAYLY.Row, -1
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
  pnlPEKCL_DAYLY.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndPEKCL_DAYLY = Nothing
  Set fndPEKL_TOLOAD = Nothing
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





