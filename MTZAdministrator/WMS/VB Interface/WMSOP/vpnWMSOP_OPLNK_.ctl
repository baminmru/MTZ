VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnWMSOP_OPLNK_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerWMSOP_OPKAM 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerWMSOP_OPLNK 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlWMSOP_OPLNK 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdWMSOP_OPKAMAcc 
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
      Begin MTZ_PANEL.DropButton cmdWMSOP_OPKAMRun 
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
      Begin VB.CommandButton cmdWMSOP_OPKAMFnd 
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
      Begin VB.CommandButton cmdWMSOP_OPKAMCfg 
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
      Begin VB.CommandButton cmdWMSOP_OPKAMPrn 
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
      Begin VB.CommandButton cmdWMSOP_OPKAMRef 
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
      Begin VB.CommandButton cmdWMSOP_OPKAMDel 
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
      Begin VB.CommandButton cmdWMSOP_OPKAMEdit 
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
      Begin VB.CommandButton cmdWMSOP_OPKAMAdd 
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
      Begin GridEX20.GridEX gridWMSOP_OPKAM 
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
         Column(1)       =   "vpnWMSOP_OPLNK_.ctx":0000
         Column(2)       =   "vpnWMSOP_OPLNK_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnWMSOP_OPLNK_.ctx":016C
         FormatStyle(2)  =   "vpnWMSOP_OPLNK_.ctx":02C8
         FormatStyle(3)  =   "vpnWMSOP_OPLNK_.ctx":0378
         FormatStyle(4)  =   "vpnWMSOP_OPLNK_.ctx":042C
         FormatStyle(5)  =   "vpnWMSOP_OPLNK_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnWMSOP_OPLNK_.ctx":05BC
      End
      Begin VB.CommandButton cmdWMSOP_OPLNKAcc 
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
      Begin MTZ_PANEL.DropButton cmdWMSOP_OPLNKRun 
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
      Begin VB.CommandButton cmdWMSOP_OPLNKFnd 
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
      Begin VB.CommandButton cmdWMSOP_OPLNKCfg 
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
      Begin VB.CommandButton cmdWMSOP_OPLNKPrn 
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
      Begin VB.CommandButton cmdWMSOP_OPLNKRef 
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
      Begin VB.CommandButton cmdWMSOP_OPLNKDel 
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
      Begin VB.CommandButton cmdWMSOP_OPLNKEdit 
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
      Begin VB.CommandButton cmdWMSOP_OPLNKAdd 
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
      Begin GridEX20.GridEX gridWMSOP_OPLNK 
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
         Column(1)       =   "vpnWMSOP_OPLNK_.ctx":0794
         Column(2)       =   "vpnWMSOP_OPLNK_.ctx":085C
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnWMSOP_OPLNK_.ctx":0900
         FormatStyle(2)  =   "vpnWMSOP_OPLNK_.ctx":0A5C
         FormatStyle(3)  =   "vpnWMSOP_OPLNK_.ctx":0B0C
         FormatStyle(4)  =   "vpnWMSOP_OPLNK_.ctx":0BC0
         FormatStyle(5)  =   "vpnWMSOP_OPLNK_.ctx":0C98
         ImageCount      =   0
         PrinterProperties=   "vpnWMSOP_OPLNK_.ctx":0D50
      End
   End
   Begin VB.Menu mnuPopupWMSOP_OPLNK 
      Caption         =   "Меню для Операторы"
      Visible         =   0   'False
      Begin VB.Menu mnuWMSOP_OPLNKAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWMSOP_OPLNKEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWMSOP_OPLNKDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWMSOP_OPLNKOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWMSOP_OPLNKRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWMSOP_OPLNKS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWMSOP_OPLNKBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWMSOP_OPLNKCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWMSOP_OPLNKCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWMSOP_OPLNKPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWMSOP_OPLNKCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWMSOP_OPLNKCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWMSOP_OPLNKPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWMSOP_OPLNKCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWMSOP_OPLNKFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuWMSOP_OPLNKAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupWMSOP_OPKAM 
      Caption         =   "Меню для Холодильные камеры"
      Visible         =   0   'False
      Begin VB.Menu mnuWMSOP_OPKAMAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWMSOP_OPKAMEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWMSOP_OPKAMDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWMSOP_OPKAMOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWMSOP_OPKAMRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWMSOP_OPKAMS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWMSOP_OPKAMBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWMSOP_OPKAMCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWMSOP_OPKAMCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWMSOP_OPKAMPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWMSOP_OPKAMCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWMSOP_OPKAMCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWMSOP_OPKAMPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWMSOP_OPKAMCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWMSOP_OPKAMFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuWMSOP_OPKAMAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnWMSOP_OPLNK_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndWMSOP_OPLNK As Object
Private menuActionWMSOP_OPLNK As String
Private fndWMSOP_OPKAM As Object
Private menuActionWMSOP_OPKAM As String





Private Sub pnlWMSOP_OPLNK_PositionChanged()
  pnlWMSOP_OPLNK.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridWMSOP_OPLNK_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdWMSOP_OPLNKCfg_Click
        End If
    End If
End Sub

Private Sub gridWMSOP_OPLNK_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupWMSOP_OPLNK
End If
End Sub
Private Sub mnuWMSOP_OPLNKAdd_click()
   menuActionWMSOP_OPLNK = "ADD"
   menuTimerWMSOP_OPLNK.Enabled = True
End Sub
Private Sub mnuWMSOP_OPLNKEdit_click()
   menuActionWMSOP_OPLNK = "EDIT"
   menuTimerWMSOP_OPLNK.Enabled = True
End Sub
Private Sub mnuWMSOP_OPLNKDelete_click()
   menuActionWMSOP_OPLNK = "DEL"
   menuTimerWMSOP_OPLNK.Enabled = True
End Sub
Private Sub mnuWMSOP_OPLNKOpen_click()
   menuActionWMSOP_OPLNK = "RUN"
   menuTimerWMSOP_OPLNK.Enabled = True
End Sub
Private Sub mnuWMSOP_OPLNKRef_click()
   menuActionWMSOP_OPLNK = "REF"
   menuTimerWMSOP_OPLNK.Enabled = True
End Sub
  Private Sub mnuWMSOP_OPLNKCOPY_Click()
    On Error Resume Next
    If gridWMSOP_OPLNK.ItemCount = 0 Then Exit Sub
    If gridWMSOP_OPLNK.Row > 0 Then
     If gridWMSOP_OPLNK.RowIndex(gridWMSOP_OPLNK.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWMSOP_OPLNK.RowBookmark(gridWMSOP_OPLNK.RowIndex(gridWMSOP_OPLNK.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWMSOP_OPLNKCUT_Click()
    On Error Resume Next
    If gridWMSOP_OPLNK.ItemCount = 0 Then Exit Sub
    If gridWMSOP_OPLNK.Row > 0 Then
     If gridWMSOP_OPLNK.RowIndex(gridWMSOP_OPLNK.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWMSOP_OPLNK.RowBookmark(gridWMSOP_OPLNK.RowIndex(gridWMSOP_OPLNK.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWMSOP_OPLNK.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWMSOP_OPLNKCHANGE_Click()
  On Error Resume Next
  If gridWMSOP_OPLNK.ItemCount = 0 Then Exit Sub
  If gridWMSOP_OPLNK.Row > 0 Then
   If gridWMSOP_OPLNK.RowIndex(gridWMSOP_OPLNK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWMSOP_OPLNK.RowBookmark(gridWMSOP_OPLNK.RowIndex(gridWMSOP_OPLNK.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWMSOP_OPLNK.ItemCount = u.Parent.Count
      gridWMSOP_OPLNK.RefreshRowIndex gridWMSOP_OPLNK.RowIndex(gridWMSOP_OPLNK.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWMSOP_OPLNKCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWMSOP_OPLNKPrn_click()
   menuActionWMSOP_OPLNK = "PRN"
   menuTimerWMSOP_OPLNK.Enabled = True
End Sub
Private Sub mnuWMSOP_OPLNKCfg_click()
   menuActionWMSOP_OPLNK = "CFG"
   menuTimerWMSOP_OPLNK.Enabled = True
End Sub
Private Sub mnuWMSOP_OPLNKFind_click()
   menuActionWMSOP_OPLNK = "FND"
   menuTimerWMSOP_OPLNK.Enabled = True
End Sub
Private Sub mnuWMSOP_OPLNKAcc_click()
   menuActionWMSOP_OPLNK = "ACC"
   menuTimerWMSOP_OPLNK.Enabled = True
End Sub
Private Sub menuTimerWMSOP_OPLNK_timer()
   menuTimerWMSOP_OPLNK.Enabled = False
   If menuActionWMSOP_OPLNK = "ADD" Then cmdWMSOP_OPLNKAdd_Click
   If menuActionWMSOP_OPLNK = "EDIT" Then cmdWMSOP_OPLNKEdit_Click
   If menuActionWMSOP_OPLNK = "DEL" Then cmdWMSOP_OPLNKDel_Click
   If menuActionWMSOP_OPLNK = "RUN" Then cmdWMSOP_OPLNKRun_Click
   If menuActionWMSOP_OPLNK = "REF" Then cmdWMSOP_OPLNKRef_Click
   If menuActionWMSOP_OPLNK = "PRN" Then cmdWMSOP_OPLNKPrn_Click
   If menuActionWMSOP_OPLNK = "CFG" Then cmdWMSOP_OPLNKCfg_Click
   If menuActionWMSOP_OPLNK = "FND" Then cmdWMSOP_OPLNKFnd_Click
   If menuActionWMSOP_OPLNK = "ACC" Then cmdWMSOP_OPLNKAcc_Click
   menuActionWMSOP_OPLNK = ""
End Sub
Private Sub cmdWMSOP_OPLNKCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWMSOP_OPLNK, "gridWMSOP_OPLNK"
Set jset = Nothing
End Sub

Private Sub cmdWMSOP_OPLNKPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWMSOP_OPLNK, "Операторы"
Set jset = Nothing
End Sub

Private Sub cmdWMSOP_OPLNKRef_Click()
  On Error Resume Next
  Item.WMSOP_OPLNK.Refresh
  gridWMSOP_OPLNK.ItemCount = Item.WMSOP_OPLNK.Count
  gridWMSOP_OPLNK.Refetch
  gridWMSOP_OPLNK.Refresh
End Sub
Private Sub cmdWMSOP_OPLNKAcc_Click()
On Error Resume Next
If gridWMSOP_OPLNK.ItemCount = 0 Then Exit Sub
If gridWMSOP_OPLNK.Row > 0 Then
 If gridWMSOP_OPLNK.RowIndex(gridWMSOP_OPLNK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWMSOP_OPLNK.RowBookmark(gridWMSOP_OPLNK.RowIndex(gridWMSOP_OPLNK.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWMSOP_OPLNKEdit_Click()
  On Error Resume Next
If gridWMSOP_OPLNK.ItemCount = 0 Then Exit Sub
If gridWMSOP_OPLNK.Row > 0 Then
 If gridWMSOP_OPLNK.RowIndex(gridWMSOP_OPLNK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWMSOP_OPLNK.RowBookmark(gridWMSOP_OPLNK.RowIndex(gridWMSOP_OPLNK.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWMSOP_OPLNK_.Item = u
again:     frmWMSOP_OPLNK_.NotFirstTime = False
    frmWMSOP_OPLNK_.OnInit
    frmWMSOP_OPLNK_.Show vbModal
    If frmWMSOP_OPLNK_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWMSOP_OPLNK.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWMSOP_OPLNKDel_Click()
  On Error Resume Next
  gridWMSOP_OPLNK.Delete
End Sub
Private Sub cmdWMSOP_OPLNKAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.WMSOP_OPLNK.Add()

      Set frmWMSOP_OPLNK_.Item = u
again:       frmWMSOP_OPLNK_.NotFirstTime = False
      frmWMSOP_OPLNK_.OnInit
      frmWMSOP_OPLNK_.Show vbModal
      If frmWMSOP_OPLNK_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWMSOP_OPLNK.ItemCount = Item.WMSOP_OPLNK.Count
        gridWMSOP_OPLNK.Refresh
        gridWMSOP_OPLNK.RefreshGroups
        gridWMSOP_OPLNK.RefreshSort
        gridWMSOP_OPLNK.MoveToBookmark u.ID & "WMSOP_OPLNK"
      Else
        Item.WMSOP_OPLNK.Delete u.ID
        Item.WMSOP_OPLNK.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdWMSOP_OPLNKFnd_Click()
  On Error Resume Next
  fndWMSOP_OPLNK.ShowForm
End Sub
Private Sub cmdWMSOP_OPLNKRun_Click()
  On Error Resume Next
  gridWMSOP_OPLNK_DblClick
End Sub
Private Sub gridWMSOP_OPLNK_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.WMSOP_OPLNK.LoadRow gridWMSOP_OPLNK, RowIndex, Bookmark, Values
End Sub
Private Sub gridWMSOP_OPLNK_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridWMSOP_OPLNK.ItemCount = 0 Then Exit Sub
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
Private Sub gridWMSOP_OPLNK_DblClick()
  cmdWMSOP_OPLNKEdit_Click
End Sub
Private Sub gridWMSOP_OPLNK_KeyPress(KeyAscii As Integer)
  If gridWMSOP_OPLNK.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWMSOP_OPLNK.FindOnPress KeyAscii
End Sub

Private Sub pnlWMSOP_OPLNK_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridWMSOP_OPLNK.Left = Left
  gridWMSOP_OPLNK.Top = Top + 25 * Screen.TwipsPerPixelY
  gridWMSOP_OPLNK.Width = Width
  gridWMSOP_OPLNK.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdWMSOP_OPLNKAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOP_OPLNKEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOP_OPLNKDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOP_OPLNKRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOP_OPLNKPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOP_OPLNKCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOP_OPLNKFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOP_OPLNKRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOP_OPLNKAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOP_OPLNKAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdWMSOP_OPLNKEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdWMSOP_OPLNKDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdWMSOP_OPLNKRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdWMSOP_OPLNKPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdWMSOP_OPLNKCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdWMSOP_OPLNKFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdWMSOP_OPLNKRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdWMSOP_OPLNKAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuWMSOP_OPLNKPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.WMSOP_OPLNK.Add()
    If GetFromBuffer(u) Then
      gridWMSOP_OPLNK.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdWMSOP_OPKAMCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWMSOP_OPKAM, "gridWMSOP_OPKAM"
Set jset = Nothing
End Sub

Private Sub cmdWMSOP_OPKAMPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWMSOP_OPKAM, "Холодильные камеры"
Set jset = Nothing
End Sub

Private Sub cmdWMSOP_OPKAMAcc_Click()
On Error Resume Next
If gridWMSOP_OPKAM.ItemCount = 0 Then Exit Sub
If gridWMSOP_OPKAM.Row > 0 Then
 If gridWMSOP_OPKAM.RowIndex(gridWMSOP_OPKAM.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWMSOP_OPKAM.RowBookmark(gridWMSOP_OPKAM.RowIndex(gridWMSOP_OPKAM.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWMSOP_OPKAMFnd_Click()
  On Error Resume Next
  fndWMSOP_OPKAM.ShowForm
End Sub
Private Sub cmdWMSOP_OPKAMRun_Click()
  On Error Resume Next
  gridWMSOP_OPKAM_DblClick
End Sub
Private Sub pnlWMSOP_OPLNK_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridWMSOP_OPKAM.Left = Left
  gridWMSOP_OPKAM.Top = Top + 25 * Screen.TwipsPerPixelY
  gridWMSOP_OPKAM.Width = Width
  gridWMSOP_OPKAM.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdWMSOP_OPKAMAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOP_OPKAMEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOP_OPKAMDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOP_OPKAMRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOP_OPKAMPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOP_OPKAMCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOP_OPKAMFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOP_OPKAMRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOP_OPKAMAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOP_OPKAMAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdWMSOP_OPKAMEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdWMSOP_OPKAMDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdWMSOP_OPKAMRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdWMSOP_OPKAMPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdWMSOP_OPKAMCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdWMSOP_OPKAMFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdWMSOP_OPKAMRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdWMSOP_OPKAMAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdWMSOP_OPKAMRef_Click()
  On Error Resume Next
If gridWMSOP_OPLNK.ItemCount = 0 Then Exit Sub
If gridWMSOP_OPLNK.Row > 0 Then
 If gridWMSOP_OPLNK.RowIndex(gridWMSOP_OPLNK.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridWMSOP_OPLNK.RowBookmark(gridWMSOP_OPLNK.RowIndex(gridWMSOP_OPLNK.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.WMSOP_OPKAM.Refresh
   gridWMSOP_OPKAM.ItemCount = gu.WMSOP_OPKAM.Count
   gridWMSOP_OPKAM.Refetch
   gridWMSOP_OPKAM.Refresh
 Else
  gridWMSOP_OPKAM.Columns.Clear
  gridWMSOP_OPKAM.ItemCount = 0
 End If
Else
 gridWMSOP_OPKAM.Columns.Clear
 gridWMSOP_OPKAM.ItemCount = 0
End If
End Sub
Private Sub cmdWMSOP_OPKAMEdit_Click()
    If gridWMSOP_OPKAM.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridWMSOP_OPKAM.RowBookmark(gridWMSOP_OPKAM.RowIndex(gridWMSOP_OPKAM.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmWMSOP_OPKAM_.Item = u
again:     frmWMSOP_OPKAM_.NotFirstTime = False
    frmWMSOP_OPKAM_.OnInit
    frmWMSOP_OPKAM_.Show vbModal
    If frmWMSOP_OPKAM_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWMSOP_OPKAM.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdWMSOP_OPKAMDel_Click()
  On Error Resume Next
  gridWMSOP_OPKAM.Delete
End Sub
Private Sub cmdWMSOP_OPKAMAdd_Click()
  On Error Resume Next
    Dim gu As Object
    Dim u As Object
If gridWMSOP_OPLNK.ItemCount = 0 Then Exit Sub
    Dim bm
    bm = gridWMSOP_OPLNK.RowBookmark(gridWMSOP_OPLNK.RowIndex(gridWMSOP_OPLNK.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set u = gu.WMSOP_OPKAM.Add()

      Set frmWMSOP_OPKAM_.Item = u
again:       frmWMSOP_OPKAM_.NotFirstTime = False
      frmWMSOP_OPKAM_.OnInit
      frmWMSOP_OPKAM_.Show vbModal
      If frmWMSOP_OPKAM_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWMSOP_OPKAM.ItemCount = gu.WMSOP_OPKAM.Count
        gridWMSOP_OPKAM.Refresh
        gridWMSOP_OPKAM.RefreshGroups
        gridWMSOP_OPKAM.RefreshSort
        gridWMSOP_OPKAM.MoveToBookmark u.ID & "WMSOP_OPKAM"
      Else
        gu.WMSOP_OPKAM.Delete u.ID
        gu.WMSOP_OPKAM.Remove u.ID
      End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridWMSOP_OPLNK_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridWMSOP_OPLNK.ItemCount = 0 Then
  gridWMSOP_OPKAM.ItemCount = 0
  Exit Sub
End If
If gridWMSOP_OPLNK.Row > 0 Then
  If LastRow <> gridWMSOP_OPLNK.Row And LastRow > 0 Then
    gridWMSOP_OPLNK.GetRowData(LastRow).RowStyle = "Default"
    gridWMSOP_OPLNK.GetRowData(gridWMSOP_OPLNK.Row).RowStyle = "SelectedRow"
  End If
 If gridWMSOP_OPLNK.RowIndex(gridWMSOP_OPLNK.Row) > 0 Then
  If LastRow <> gridWMSOP_OPLNK.Row Or gridWMSOP_OPKAM.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridWMSOP_OPLNK.RowBookmark(gridWMSOP_OPLNK.RowIndex(gridWMSOP_OPLNK.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.WMSOP_OPKAM.PrepareGrid gridWMSOP_OPKAM
  gridWMSOP_OPKAM.ItemCount = 0
    LoadGridLayout gridWMSOP_OPKAM
    Set fndWMSOP_OPKAM = Nothing
    Set fndWMSOP_OPKAM = CreateObject("MTZ_JSetup.GridFinder")
    fndWMSOP_OPKAM.Init gridWMSOP_OPKAM
  gridWMSOP_OPKAM.ItemCount = gu.WMSOP_OPKAM.Count
  End If
 End If
End If
End Sub
Private Sub gridWMSOP_OPKAM_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
    If gridWMSOP_OPLNK.ItemCount = 0 Then Exit Sub
    If gridWMSOP_OPKAM.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridWMSOP_OPLNK.RowBookmark(gridWMSOP_OPLNK.RowIndex(gridWMSOP_OPLNK.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.WMSOP_OPKAM.LoadRow gridWMSOP_OPKAM, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridWMSOP_OPKAM_KeyPress(KeyAscii As Integer)
  If gridWMSOP_OPKAM.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWMSOP_OPKAM.FindOnPress KeyAscii
End Sub

Private Sub gridWMSOP_OPKAM_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If gridWMSOP_OPKAM.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridWMSOP_OPKAM.RowBookmark(gridWMSOP_OPKAM.RowIndex(gridWMSOP_OPKAM.Row))
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
Private Sub gridWMSOP_OPKAM_DblClick()
    cmdWMSOP_OPKAMEdit_Click
End Sub
Private Sub gridWMSOP_OPKAM_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridWMSOP_OPKAM.ItemCount = 0 Then Exit Sub
 If gridWMSOP_OPKAM.Row > 0 Then
   If LastRow <> gridWMSOP_OPKAM.Row And LastRow > 0 Then
     gridWMSOP_OPKAM.GetRowData(LastRow).RowStyle = "Default"
     gridWMSOP_OPKAM.GetRowData(gridWMSOP_OPKAM.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuWMSOP_OPKAMPASTE_Click()
On Error Resume Next
    If gridWMSOP_OPLNK.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridWMSOP_OPLNK.RowBookmark(gridWMSOP_OPLNK.RowIndex(gridWMSOP_OPLNK.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.WMSOP_OPKAM.Add()
    If GetFromBuffer(u) Then
      gridWMSOP_OPKAM.ItemCount = u.Parent.Count
    Else
      gu.WMSOP_OPKAM.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridWMSOP_OPKAM_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdWMSOP_OPKAMCfg_Click
        End If
    End If
End Sub

Private Sub gridWMSOP_OPKAM_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupWMSOP_OPKAM
End If
End Sub
Private Sub mnuWMSOP_OPKAMAdd_click()
   menuActionWMSOP_OPKAM = "ADD"
   menuTimerWMSOP_OPKAM.Enabled = True
End Sub
Private Sub mnuWMSOP_OPKAMEdit_click()
   menuActionWMSOP_OPKAM = "EDIT"
   menuTimerWMSOP_OPKAM.Enabled = True
End Sub
Private Sub mnuWMSOP_OPKAMDelete_click()
   menuActionWMSOP_OPKAM = "DEL"
   menuTimerWMSOP_OPKAM.Enabled = True
End Sub
Private Sub mnuWMSOP_OPKAMOpen_click()
   menuActionWMSOP_OPKAM = "RUN"
   menuTimerWMSOP_OPKAM.Enabled = True
End Sub
Private Sub mnuWMSOP_OPKAMRef_click()
   menuActionWMSOP_OPKAM = "REF"
   menuTimerWMSOP_OPKAM.Enabled = True
End Sub
  Private Sub mnuWMSOP_OPKAMCOPY_Click()
    On Error Resume Next
    If gridWMSOP_OPKAM.ItemCount = 0 Then Exit Sub
    If gridWMSOP_OPKAM.Row > 0 Then
     If gridWMSOP_OPKAM.RowIndex(gridWMSOP_OPKAM.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWMSOP_OPKAM.RowBookmark(gridWMSOP_OPKAM.RowIndex(gridWMSOP_OPKAM.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWMSOP_OPKAMCUT_Click()
    On Error Resume Next
    If gridWMSOP_OPKAM.ItemCount = 0 Then Exit Sub
    If gridWMSOP_OPKAM.Row > 0 Then
     If gridWMSOP_OPKAM.RowIndex(gridWMSOP_OPKAM.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWMSOP_OPKAM.RowBookmark(gridWMSOP_OPKAM.RowIndex(gridWMSOP_OPKAM.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWMSOP_OPKAM.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWMSOP_OPKAMCHANGE_Click()
  On Error Resume Next
  If gridWMSOP_OPKAM.ItemCount = 0 Then Exit Sub
  If gridWMSOP_OPKAM.Row > 0 Then
   If gridWMSOP_OPKAM.RowIndex(gridWMSOP_OPKAM.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWMSOP_OPKAM.RowBookmark(gridWMSOP_OPKAM.RowIndex(gridWMSOP_OPKAM.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWMSOP_OPKAM.ItemCount = u.Parent.Count
      gridWMSOP_OPKAM.RefreshRowIndex gridWMSOP_OPKAM.RowIndex(gridWMSOP_OPKAM.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWMSOP_OPKAMCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWMSOP_OPKAMPrn_click()
   menuActionWMSOP_OPKAM = "PRN"
   menuTimerWMSOP_OPKAM.Enabled = True
End Sub
Private Sub mnuWMSOP_OPKAMCfg_click()
   menuActionWMSOP_OPKAM = "CFG"
   menuTimerWMSOP_OPKAM.Enabled = True
End Sub
Private Sub mnuWMSOP_OPKAMFind_click()
   menuActionWMSOP_OPKAM = "FND"
   menuTimerWMSOP_OPKAM.Enabled = True
End Sub
Private Sub mnuWMSOP_OPKAMAcc_click()
   menuActionWMSOP_OPKAM = "ACC"
   menuTimerWMSOP_OPKAM.Enabled = True
End Sub
Private Sub menuTimerWMSOP_OPKAM_timer()
   menuTimerWMSOP_OPKAM.Enabled = False
   If menuActionWMSOP_OPKAM = "ADD" Then cmdWMSOP_OPKAMAdd_Click
   If menuActionWMSOP_OPKAM = "EDIT" Then cmdWMSOP_OPKAMEdit_Click
   If menuActionWMSOP_OPKAM = "DEL" Then cmdWMSOP_OPKAMDel_Click
   If menuActionWMSOP_OPKAM = "RUN" Then cmdWMSOP_OPKAMRun_Click
   If menuActionWMSOP_OPKAM = "REF" Then cmdWMSOP_OPKAMRef_Click
   If menuActionWMSOP_OPKAM = "PRN" Then cmdWMSOP_OPKAMPrn_Click
   If menuActionWMSOP_OPKAM = "CFG" Then cmdWMSOP_OPKAMCfg_Click
   If menuActionWMSOP_OPKAM = "FND" Then cmdWMSOP_OPKAMFnd_Click
   If menuActionWMSOP_OPKAM = "ACC" Then cmdWMSOP_OPKAMAcc_Click
   menuActionWMSOP_OPKAM = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdWMSOP_OPLNKAdd, cmdWMSOP_OPLNKAdd.Tag
  LoadBtnPictures cmdWMSOP_OPLNKEdit, cmdWMSOP_OPLNKEdit.Tag
  LoadBtnPictures cmdWMSOP_OPLNKDel, cmdWMSOP_OPLNKDel.Tag
  LoadBtnPictures cmdWMSOP_OPLNKRef, cmdWMSOP_OPLNKRef.Tag
  LoadBtnPictures cmdWMSOP_OPLNKPrn, cmdWMSOP_OPLNKPrn.Tag
  LoadBtnPictures cmdWMSOP_OPLNKFnd, cmdWMSOP_OPLNKFnd.Tag
  LoadBtnPictures cmdWMSOP_OPLNKRun, cmdWMSOP_OPLNKRun.Tag
  LoadBtnPictures cmdWMSOP_OPLNKAcc, cmdWMSOP_OPLNKAcc.Tag
  LoadBtnPictures cmdWMSOP_OPLNKCfg, cmdWMSOP_OPLNKCfg.Tag
  Item.WMSOP_OPLNK.PrepareGrid gridWMSOP_OPLNK
  LoadGridLayout gridWMSOP_OPLNK
  Set fndWMSOP_OPLNK = Nothing
  On Error Resume Next
  Set fndWMSOP_OPLNK = CreateObject("MTZ_JSetup.GridFinder")
  fndWMSOP_OPLNK.Init gridWMSOP_OPLNK
  LoadBtnPictures cmdWMSOP_OPKAMAdd, cmdWMSOP_OPKAMAdd.Tag
  LoadBtnPictures cmdWMSOP_OPKAMEdit, cmdWMSOP_OPKAMEdit.Tag
  LoadBtnPictures cmdWMSOP_OPKAMDel, cmdWMSOP_OPKAMDel.Tag
  LoadBtnPictures cmdWMSOP_OPKAMRef, cmdWMSOP_OPKAMRef.Tag
  LoadBtnPictures cmdWMSOP_OPKAMPrn, cmdWMSOP_OPKAMPrn.Tag
  LoadBtnPictures cmdWMSOP_OPKAMFnd, cmdWMSOP_OPKAMFnd.Tag
  LoadBtnPictures cmdWMSOP_OPKAMCfg, cmdWMSOP_OPKAMCfg.Tag
  LoadBtnPictures cmdWMSOP_OPKAMRun, cmdWMSOP_OPKAMRun.Tag
  LoadBtnPictures cmdWMSOP_OPKAMAcc, cmdWMSOP_OPKAMAcc.Tag
  gridWMSOP_OPKAM.Columns.Clear
  gridWMSOP_OPKAM.ItemCount = 0
  cmdWMSOP_OPKAMRef_Click
End Sub
Private Sub OnTabClick()

pnlWMSOP_OPLNK.RestorePosition
  gridWMSOP_OPLNK_RowColChange gridWMSOP_OPLNK.Row, -1
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
  pnlWMSOP_OPLNK.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndWMSOP_OPLNK = Nothing
  Set fndWMSOP_OPKAM = Nothing
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





