VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnITTOP_OPLNK_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerITTOP_OPKAM 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerITTOP_OPLNK 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlITTOP_OPLNK 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdITTOP_OPKAMAcc 
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
      Begin MTZ_PANEL.DropButton cmdITTOP_OPKAMRun 
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
      Begin VB.CommandButton cmdITTOP_OPKAMFnd 
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
      Begin VB.CommandButton cmdITTOP_OPKAMCfg 
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
      Begin VB.CommandButton cmdITTOP_OPKAMPrn 
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
      Begin VB.CommandButton cmdITTOP_OPKAMRef 
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
      Begin VB.CommandButton cmdITTOP_OPKAMDel 
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
      Begin VB.CommandButton cmdITTOP_OPKAMEdit 
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
      Begin VB.CommandButton cmdITTOP_OPKAMAdd 
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
      Begin GridEX20.GridEX gridITTOP_OPKAM 
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
         Column(1)       =   "vpnITTOP_OPLNK_.ctx":0000
         Column(2)       =   "vpnITTOP_OPLNK_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnITTOP_OPLNK_.ctx":016C
         FormatStyle(2)  =   "vpnITTOP_OPLNK_.ctx":02C8
         FormatStyle(3)  =   "vpnITTOP_OPLNK_.ctx":0378
         FormatStyle(4)  =   "vpnITTOP_OPLNK_.ctx":042C
         FormatStyle(5)  =   "vpnITTOP_OPLNK_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnITTOP_OPLNK_.ctx":05BC
      End
      Begin VB.CommandButton cmdITTOP_OPLNKAcc 
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
      Begin MTZ_PANEL.DropButton cmdITTOP_OPLNKRun 
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
      Begin VB.CommandButton cmdITTOP_OPLNKFnd 
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
      Begin VB.CommandButton cmdITTOP_OPLNKCfg 
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
      Begin VB.CommandButton cmdITTOP_OPLNKPrn 
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
      Begin VB.CommandButton cmdITTOP_OPLNKRef 
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
      Begin VB.CommandButton cmdITTOP_OPLNKDel 
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
      Begin VB.CommandButton cmdITTOP_OPLNKEdit 
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
      Begin VB.CommandButton cmdITTOP_OPLNKAdd 
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
      Begin GridEX20.GridEX gridITTOP_OPLNK 
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
         Column(1)       =   "vpnITTOP_OPLNK_.ctx":0794
         Column(2)       =   "vpnITTOP_OPLNK_.ctx":085C
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnITTOP_OPLNK_.ctx":0900
         FormatStyle(2)  =   "vpnITTOP_OPLNK_.ctx":0A5C
         FormatStyle(3)  =   "vpnITTOP_OPLNK_.ctx":0B0C
         FormatStyle(4)  =   "vpnITTOP_OPLNK_.ctx":0BC0
         FormatStyle(5)  =   "vpnITTOP_OPLNK_.ctx":0C98
         ImageCount      =   0
         PrinterProperties=   "vpnITTOP_OPLNK_.ctx":0D50
      End
   End
   Begin VB.Menu mnuPopupITTOP_OPLNK 
      Caption         =   "Меню для Операторы"
      Visible         =   0   'False
      Begin VB.Menu mnuITTOP_OPLNKAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuITTOP_OPLNKEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuITTOP_OPLNKDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuITTOP_OPLNKOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuITTOP_OPLNKRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuITTOP_OPLNKS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuITTOP_OPLNKBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuITTOP_OPLNKCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuITTOP_OPLNKCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuITTOP_OPLNKPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuITTOP_OPLNKCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuITTOP_OPLNKCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuITTOP_OPLNKPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuITTOP_OPLNKCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuITTOP_OPLNKFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuITTOP_OPLNKAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupITTOP_OPKAM 
      Caption         =   "Меню для Холодильные камеры"
      Visible         =   0   'False
      Begin VB.Menu mnuITTOP_OPKAMAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuITTOP_OPKAMEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuITTOP_OPKAMDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuITTOP_OPKAMOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuITTOP_OPKAMRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuITTOP_OPKAMS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuITTOP_OPKAMBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuITTOP_OPKAMCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuITTOP_OPKAMCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuITTOP_OPKAMPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuITTOP_OPKAMCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuITTOP_OPKAMCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuITTOP_OPKAMPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuITTOP_OPKAMCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuITTOP_OPKAMFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuITTOP_OPKAMAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnITTOP_OPLNK_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель для работы со строками раздела Привязка операторов
Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndITTOP_OPLNK As Object
Private menuActionITTOP_OPLNK As String
Private fndITTOP_OPKAM As Object
Private menuActionITTOP_OPKAM As String





Private Sub pnlITTOP_OPLNK_PositionChanged()
  pnlITTOP_OPLNK.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridITTOP_OPLNK_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdITTOP_OPLNKCfg_Click
        End If
    End If
End Sub

Private Sub gridITTOP_OPLNK_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupITTOP_OPLNK
End If
End Sub
Private Sub mnuITTOP_OPLNKAdd_click()
   menuActionITTOP_OPLNK = "ADD"
   menuTimerITTOP_OPLNK.Enabled = True
End Sub
Private Sub mnuITTOP_OPLNKEdit_click()
   menuActionITTOP_OPLNK = "EDIT"
   menuTimerITTOP_OPLNK.Enabled = True
End Sub
Private Sub mnuITTOP_OPLNKDelete_click()
   menuActionITTOP_OPLNK = "DEL"
   menuTimerITTOP_OPLNK.Enabled = True
End Sub
Private Sub mnuITTOP_OPLNKOpen_click()
   menuActionITTOP_OPLNK = "RUN"
   menuTimerITTOP_OPLNK.Enabled = True
End Sub
Private Sub mnuITTOP_OPLNKRef_click()
   menuActionITTOP_OPLNK = "REF"
   menuTimerITTOP_OPLNK.Enabled = True
End Sub
  Private Sub mnuITTOP_OPLNKCOPY_Click()
    On Error Resume Next
    If gridITTOP_OPLNK.ItemCount = 0 Then Exit Sub
    If gridITTOP_OPLNK.Row > 0 Then
     If gridITTOP_OPLNK.RowIndex(gridITTOP_OPLNK.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridITTOP_OPLNK.RowBookmark(gridITTOP_OPLNK.RowIndex(gridITTOP_OPLNK.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuITTOP_OPLNKCUT_Click()
    On Error Resume Next
    If gridITTOP_OPLNK.ItemCount = 0 Then Exit Sub
    If gridITTOP_OPLNK.Row > 0 Then
     If gridITTOP_OPLNK.RowIndex(gridITTOP_OPLNK.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridITTOP_OPLNK.RowBookmark(gridITTOP_OPLNK.RowIndex(gridITTOP_OPLNK.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridITTOP_OPLNK.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuITTOP_OPLNKCHANGE_Click()
  On Error Resume Next
  If gridITTOP_OPLNK.ItemCount = 0 Then Exit Sub
  If gridITTOP_OPLNK.Row > 0 Then
   If gridITTOP_OPLNK.RowIndex(gridITTOP_OPLNK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridITTOP_OPLNK.RowBookmark(gridITTOP_OPLNK.RowIndex(gridITTOP_OPLNK.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridITTOP_OPLNK.ItemCount = u.Parent.Count
      gridITTOP_OPLNK.RefreshRowIndex gridITTOP_OPLNK.RowIndex(gridITTOP_OPLNK.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuITTOP_OPLNKCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuITTOP_OPLNKPrn_click()
   menuActionITTOP_OPLNK = "PRN"
   menuTimerITTOP_OPLNK.Enabled = True
End Sub
Private Sub mnuITTOP_OPLNKCfg_click()
   menuActionITTOP_OPLNK = "CFG"
   menuTimerITTOP_OPLNK.Enabled = True
End Sub
Private Sub mnuITTOP_OPLNKFind_click()
   menuActionITTOP_OPLNK = "FND"
   menuTimerITTOP_OPLNK.Enabled = True
End Sub
Private Sub mnuITTOP_OPLNKAcc_click()
   menuActionITTOP_OPLNK = "ACC"
   menuTimerITTOP_OPLNK.Enabled = True
End Sub
Private Sub menuTimerITTOP_OPLNK_timer()
   menuTimerITTOP_OPLNK.Enabled = False
   If menuActionITTOP_OPLNK = "ADD" Then cmdITTOP_OPLNKAdd_Click
   If menuActionITTOP_OPLNK = "EDIT" Then cmdITTOP_OPLNKEdit_Click
   If menuActionITTOP_OPLNK = "DEL" Then cmdITTOP_OPLNKDel_Click
   If menuActionITTOP_OPLNK = "RUN" Then cmdITTOP_OPLNKRun_Click
   If menuActionITTOP_OPLNK = "REF" Then cmdITTOP_OPLNKRef_Click
   If menuActionITTOP_OPLNK = "PRN" Then cmdITTOP_OPLNKPrn_Click
   If menuActionITTOP_OPLNK = "CFG" Then cmdITTOP_OPLNKCfg_Click
   If menuActionITTOP_OPLNK = "FND" Then cmdITTOP_OPLNKFnd_Click
   If menuActionITTOP_OPLNK = "ACC" Then cmdITTOP_OPLNKAcc_Click
   menuActionITTOP_OPLNK = ""
End Sub
Private Sub cmdITTOP_OPLNKCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridITTOP_OPLNK, "gridITTOP_OPLNK"
Set jset = Nothing
End Sub

Private Sub cmdITTOP_OPLNKPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridITTOP_OPLNK, "Операторы"
Set jset = Nothing
End Sub

Private Sub cmdITTOP_OPLNKRef_Click()
  On Error Resume Next
  Item.ITTOP_OPLNK.Refresh
  gridITTOP_OPLNK.ItemCount = Item.ITTOP_OPLNK.Count
  gridITTOP_OPLNK.Refetch
  gridITTOP_OPLNK.Refresh
End Sub
Private Sub cmdITTOP_OPLNKAcc_Click()
On Error Resume Next
If gridITTOP_OPLNK.ItemCount = 0 Then Exit Sub
If gridITTOP_OPLNK.Row > 0 Then
 If gridITTOP_OPLNK.RowIndex(gridITTOP_OPLNK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridITTOP_OPLNK.RowBookmark(gridITTOP_OPLNK.RowIndex(gridITTOP_OPLNK.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdITTOP_OPLNKEdit_Click()
  On Error Resume Next
If gridITTOP_OPLNK.ItemCount = 0 Then Exit Sub
If gridITTOP_OPLNK.Row > 0 Then
 If gridITTOP_OPLNK.RowIndex(gridITTOP_OPLNK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridITTOP_OPLNK.RowBookmark(gridITTOP_OPLNK.RowIndex(gridITTOP_OPLNK.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmITTOP_OPLNK_.Item = u
again:     frmITTOP_OPLNK_.NotFirstTime = False
    frmITTOP_OPLNK_.OnInit
    frmITTOP_OPLNK_.Show vbModal
    If frmITTOP_OPLNK_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridITTOP_OPLNK.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdITTOP_OPLNKDel_Click()
  On Error Resume Next
  gridITTOP_OPLNK.Delete
End Sub
Private Sub cmdITTOP_OPLNKAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.ITTOP_OPLNK.Add()

      Set frmITTOP_OPLNK_.Item = u
again:       frmITTOP_OPLNK_.NotFirstTime = False
      frmITTOP_OPLNK_.OnInit
      frmITTOP_OPLNK_.Show vbModal
      If frmITTOP_OPLNK_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridITTOP_OPLNK.ItemCount = Item.ITTOP_OPLNK.Count
        gridITTOP_OPLNK.Refresh
        gridITTOP_OPLNK.RefreshGroups
        gridITTOP_OPLNK.RefreshSort
        gridITTOP_OPLNK.MoveToBookmark u.ID & "ITTOP_OPLNK"
      Else
        Item.ITTOP_OPLNK.Delete u.ID
        Item.ITTOP_OPLNK.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdITTOP_OPLNKFnd_Click()
  On Error Resume Next
  fndITTOP_OPLNK.ShowForm
End Sub
Private Sub cmdITTOP_OPLNKRun_Click()
  On Error Resume Next
  gridITTOP_OPLNK_DblClick
End Sub
Private Sub gridITTOP_OPLNK_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.ITTOP_OPLNK.LoadRow gridITTOP_OPLNK, RowIndex, Bookmark, Values
End Sub
Private Sub gridITTOP_OPLNK_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridITTOP_OPLNK.ItemCount = 0 Then Exit Sub
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
Private Sub gridITTOP_OPLNK_DblClick()
  cmdITTOP_OPLNKEdit_Click
End Sub
Private Sub gridITTOP_OPLNK_KeyPress(KeyAscii As Integer)
  If gridITTOP_OPLNK.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndITTOP_OPLNK.FindOnPress KeyAscii
End Sub

Private Sub pnlITTOP_OPLNK_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridITTOP_OPLNK.Left = Left
  gridITTOP_OPLNK.Top = Top + 25 * Screen.TwipsPerPixelY
  gridITTOP_OPLNK.Width = Width
  gridITTOP_OPLNK.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdITTOP_OPLNKAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOP_OPLNKEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOP_OPLNKDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOP_OPLNKRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOP_OPLNKPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOP_OPLNKCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOP_OPLNKFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOP_OPLNKRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOP_OPLNKAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOP_OPLNKAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdITTOP_OPLNKEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdITTOP_OPLNKDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdITTOP_OPLNKRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdITTOP_OPLNKPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdITTOP_OPLNKCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdITTOP_OPLNKFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdITTOP_OPLNKRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdITTOP_OPLNKAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuITTOP_OPLNKPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.ITTOP_OPLNK.Add()
    If GetFromBuffer(u) Then
      gridITTOP_OPLNK.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdITTOP_OPKAMCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridITTOP_OPKAM, "gridITTOP_OPKAM"
Set jset = Nothing
End Sub

Private Sub cmdITTOP_OPKAMPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridITTOP_OPKAM, "Холодильные камеры"
Set jset = Nothing
End Sub

Private Sub cmdITTOP_OPKAMAcc_Click()
On Error Resume Next
If gridITTOP_OPKAM.ItemCount = 0 Then Exit Sub
If gridITTOP_OPKAM.Row > 0 Then
 If gridITTOP_OPKAM.RowIndex(gridITTOP_OPKAM.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridITTOP_OPKAM.RowBookmark(gridITTOP_OPKAM.RowIndex(gridITTOP_OPKAM.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdITTOP_OPKAMFnd_Click()
  On Error Resume Next
  fndITTOP_OPKAM.ShowForm
End Sub
Private Sub cmdITTOP_OPKAMRun_Click()
  On Error Resume Next
  gridITTOP_OPKAM_DblClick
End Sub
Private Sub pnlITTOP_OPLNK_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridITTOP_OPKAM.Left = Left
  gridITTOP_OPKAM.Top = Top + 25 * Screen.TwipsPerPixelY
  gridITTOP_OPKAM.Width = Width
  gridITTOP_OPKAM.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdITTOP_OPKAMAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOP_OPKAMEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOP_OPKAMDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOP_OPKAMRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOP_OPKAMPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOP_OPKAMCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOP_OPKAMFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOP_OPKAMRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOP_OPKAMAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOP_OPKAMAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdITTOP_OPKAMEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdITTOP_OPKAMDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdITTOP_OPKAMRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdITTOP_OPKAMPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdITTOP_OPKAMCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdITTOP_OPKAMFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdITTOP_OPKAMRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdITTOP_OPKAMAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdITTOP_OPKAMRef_Click()
  On Error Resume Next
If gridITTOP_OPLNK.ItemCount = 0 Then Exit Sub
If gridITTOP_OPLNK.Row > 0 Then
 If gridITTOP_OPLNK.RowIndex(gridITTOP_OPLNK.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridITTOP_OPLNK.RowBookmark(gridITTOP_OPLNK.RowIndex(gridITTOP_OPLNK.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.ITTOP_OPKAM.Refresh
   gridITTOP_OPKAM.ItemCount = gu.ITTOP_OPKAM.Count
   gridITTOP_OPKAM.Refetch
   gridITTOP_OPKAM.Refresh
 Else
  gridITTOP_OPKAM.Columns.Clear
  gridITTOP_OPKAM.ItemCount = 0
 End If
Else
 gridITTOP_OPKAM.Columns.Clear
 gridITTOP_OPKAM.ItemCount = 0
End If
End Sub
Private Sub cmdITTOP_OPKAMEdit_Click()
    If gridITTOP_OPKAM.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridITTOP_OPKAM.RowBookmark(gridITTOP_OPKAM.RowIndex(gridITTOP_OPKAM.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmITTOP_OPKAM_.Item = u
again:     frmITTOP_OPKAM_.NotFirstTime = False
    frmITTOP_OPKAM_.OnInit
    frmITTOP_OPKAM_.Show vbModal
    If frmITTOP_OPKAM_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridITTOP_OPKAM.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdITTOP_OPKAMDel_Click()
  On Error Resume Next
  gridITTOP_OPKAM.Delete
End Sub
Private Sub cmdITTOP_OPKAMAdd_Click()
  On Error Resume Next
    Dim gu As Object
    Dim u As Object
If gridITTOP_OPLNK.ItemCount = 0 Then Exit Sub
    Dim bm
    bm = gridITTOP_OPLNK.RowBookmark(gridITTOP_OPLNK.RowIndex(gridITTOP_OPLNK.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set u = gu.ITTOP_OPKAM.Add()

      Set frmITTOP_OPKAM_.Item = u
again:       frmITTOP_OPKAM_.NotFirstTime = False
      frmITTOP_OPKAM_.OnInit
      frmITTOP_OPKAM_.Show vbModal
      If frmITTOP_OPKAM_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridITTOP_OPKAM.ItemCount = gu.ITTOP_OPKAM.Count
        gridITTOP_OPKAM.Refresh
        gridITTOP_OPKAM.RefreshGroups
        gridITTOP_OPKAM.RefreshSort
        gridITTOP_OPKAM.MoveToBookmark u.ID & "ITTOP_OPKAM"
      Else
        gu.ITTOP_OPKAM.Delete u.ID
        gu.ITTOP_OPKAM.Remove u.ID
      End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridITTOP_OPLNK_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridITTOP_OPLNK.ItemCount = 0 Then
  gridITTOP_OPKAM.ItemCount = 0
  Exit Sub
End If
If gridITTOP_OPLNK.Row > 0 Then
  If LastRow <> gridITTOP_OPLNK.Row And LastRow > 0 Then
    gridITTOP_OPLNK.GetRowData(LastRow).RowStyle = "Default"
    gridITTOP_OPLNK.GetRowData(gridITTOP_OPLNK.Row).RowStyle = "SelectedRow"
  End If
 If gridITTOP_OPLNK.RowIndex(gridITTOP_OPLNK.Row) > 0 Then
  If LastRow <> gridITTOP_OPLNK.Row Or gridITTOP_OPKAM.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridITTOP_OPLNK.RowBookmark(gridITTOP_OPLNK.RowIndex(gridITTOP_OPLNK.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.ITTOP_OPKAM.PrepareGrid gridITTOP_OPKAM
  gridITTOP_OPKAM.ItemCount = 0
    LoadGridLayout gridITTOP_OPKAM
    Set fndITTOP_OPKAM = Nothing
    Set fndITTOP_OPKAM = CreateObject("MTZ_JSetup.GridFinder")
    fndITTOP_OPKAM.Init gridITTOP_OPKAM
  gridITTOP_OPKAM.ItemCount = gu.ITTOP_OPKAM.Count
  End If
 End If
End If
End Sub
Private Sub gridITTOP_OPKAM_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
    If gridITTOP_OPLNK.ItemCount = 0 Then Exit Sub
    If gridITTOP_OPKAM.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridITTOP_OPLNK.RowBookmark(gridITTOP_OPLNK.RowIndex(gridITTOP_OPLNK.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.ITTOP_OPKAM.LoadRow gridITTOP_OPKAM, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridITTOP_OPKAM_KeyPress(KeyAscii As Integer)
  If gridITTOP_OPKAM.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndITTOP_OPKAM.FindOnPress KeyAscii
End Sub

Private Sub gridITTOP_OPKAM_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If gridITTOP_OPKAM.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridITTOP_OPKAM.RowBookmark(gridITTOP_OPKAM.RowIndex(gridITTOP_OPKAM.Row))
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
Private Sub gridITTOP_OPKAM_DblClick()
    cmdITTOP_OPKAMEdit_Click
End Sub
Private Sub gridITTOP_OPKAM_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridITTOP_OPKAM.ItemCount = 0 Then Exit Sub
 If gridITTOP_OPKAM.Row > 0 Then
   If LastRow <> gridITTOP_OPKAM.Row And LastRow > 0 Then
     gridITTOP_OPKAM.GetRowData(LastRow).RowStyle = "Default"
     gridITTOP_OPKAM.GetRowData(gridITTOP_OPKAM.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuITTOP_OPKAMPASTE_Click()
On Error Resume Next
    If gridITTOP_OPLNK.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridITTOP_OPLNK.RowBookmark(gridITTOP_OPLNK.RowIndex(gridITTOP_OPLNK.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.ITTOP_OPKAM.Add()
    If GetFromBuffer(u) Then
      gridITTOP_OPKAM.ItemCount = u.Parent.Count
    Else
      gu.ITTOP_OPKAM.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridITTOP_OPKAM_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdITTOP_OPKAMCfg_Click
        End If
    End If
End Sub

Private Sub gridITTOP_OPKAM_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupITTOP_OPKAM
End If
End Sub
Private Sub mnuITTOP_OPKAMAdd_click()
   menuActionITTOP_OPKAM = "ADD"
   menuTimerITTOP_OPKAM.Enabled = True
End Sub
Private Sub mnuITTOP_OPKAMEdit_click()
   menuActionITTOP_OPKAM = "EDIT"
   menuTimerITTOP_OPKAM.Enabled = True
End Sub
Private Sub mnuITTOP_OPKAMDelete_click()
   menuActionITTOP_OPKAM = "DEL"
   menuTimerITTOP_OPKAM.Enabled = True
End Sub
Private Sub mnuITTOP_OPKAMOpen_click()
   menuActionITTOP_OPKAM = "RUN"
   menuTimerITTOP_OPKAM.Enabled = True
End Sub
Private Sub mnuITTOP_OPKAMRef_click()
   menuActionITTOP_OPKAM = "REF"
   menuTimerITTOP_OPKAM.Enabled = True
End Sub
  Private Sub mnuITTOP_OPKAMCOPY_Click()
    On Error Resume Next
    If gridITTOP_OPKAM.ItemCount = 0 Then Exit Sub
    If gridITTOP_OPKAM.Row > 0 Then
     If gridITTOP_OPKAM.RowIndex(gridITTOP_OPKAM.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridITTOP_OPKAM.RowBookmark(gridITTOP_OPKAM.RowIndex(gridITTOP_OPKAM.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuITTOP_OPKAMCUT_Click()
    On Error Resume Next
    If gridITTOP_OPKAM.ItemCount = 0 Then Exit Sub
    If gridITTOP_OPKAM.Row > 0 Then
     If gridITTOP_OPKAM.RowIndex(gridITTOP_OPKAM.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridITTOP_OPKAM.RowBookmark(gridITTOP_OPKAM.RowIndex(gridITTOP_OPKAM.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridITTOP_OPKAM.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuITTOP_OPKAMCHANGE_Click()
  On Error Resume Next
  If gridITTOP_OPKAM.ItemCount = 0 Then Exit Sub
  If gridITTOP_OPKAM.Row > 0 Then
   If gridITTOP_OPKAM.RowIndex(gridITTOP_OPKAM.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridITTOP_OPKAM.RowBookmark(gridITTOP_OPKAM.RowIndex(gridITTOP_OPKAM.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridITTOP_OPKAM.ItemCount = u.Parent.Count
      gridITTOP_OPKAM.RefreshRowIndex gridITTOP_OPKAM.RowIndex(gridITTOP_OPKAM.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuITTOP_OPKAMCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuITTOP_OPKAMPrn_click()
   menuActionITTOP_OPKAM = "PRN"
   menuTimerITTOP_OPKAM.Enabled = True
End Sub
Private Sub mnuITTOP_OPKAMCfg_click()
   menuActionITTOP_OPKAM = "CFG"
   menuTimerITTOP_OPKAM.Enabled = True
End Sub
Private Sub mnuITTOP_OPKAMFind_click()
   menuActionITTOP_OPKAM = "FND"
   menuTimerITTOP_OPKAM.Enabled = True
End Sub
Private Sub mnuITTOP_OPKAMAcc_click()
   menuActionITTOP_OPKAM = "ACC"
   menuTimerITTOP_OPKAM.Enabled = True
End Sub
Private Sub menuTimerITTOP_OPKAM_timer()
   menuTimerITTOP_OPKAM.Enabled = False
   If menuActionITTOP_OPKAM = "ADD" Then cmdITTOP_OPKAMAdd_Click
   If menuActionITTOP_OPKAM = "EDIT" Then cmdITTOP_OPKAMEdit_Click
   If menuActionITTOP_OPKAM = "DEL" Then cmdITTOP_OPKAMDel_Click
   If menuActionITTOP_OPKAM = "RUN" Then cmdITTOP_OPKAMRun_Click
   If menuActionITTOP_OPKAM = "REF" Then cmdITTOP_OPKAMRef_Click
   If menuActionITTOP_OPKAM = "PRN" Then cmdITTOP_OPKAMPrn_Click
   If menuActionITTOP_OPKAM = "CFG" Then cmdITTOP_OPKAMCfg_Click
   If menuActionITTOP_OPKAM = "FND" Then cmdITTOP_OPKAMFnd_Click
   If menuActionITTOP_OPKAM = "ACC" Then cmdITTOP_OPKAMAcc_Click
   menuActionITTOP_OPKAM = ""
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

  LoadBtnPictures cmdITTOP_OPLNKAdd, cmdITTOP_OPLNKAdd.Tag
  LoadBtnPictures cmdITTOP_OPLNKEdit, cmdITTOP_OPLNKEdit.Tag
  LoadBtnPictures cmdITTOP_OPLNKDel, cmdITTOP_OPLNKDel.Tag
  LoadBtnPictures cmdITTOP_OPLNKRef, cmdITTOP_OPLNKRef.Tag
  LoadBtnPictures cmdITTOP_OPLNKPrn, cmdITTOP_OPLNKPrn.Tag
  LoadBtnPictures cmdITTOP_OPLNKFnd, cmdITTOP_OPLNKFnd.Tag
  LoadBtnPictures cmdITTOP_OPLNKRun, cmdITTOP_OPLNKRun.Tag
  LoadBtnPictures cmdITTOP_OPLNKAcc, cmdITTOP_OPLNKAcc.Tag
  LoadBtnPictures cmdITTOP_OPLNKCfg, cmdITTOP_OPLNKCfg.Tag
  Item.ITTOP_OPLNK.PrepareGrid gridITTOP_OPLNK
  LoadGridLayout gridITTOP_OPLNK
  Set fndITTOP_OPLNK = Nothing
  On Error Resume Next
  Set fndITTOP_OPLNK = CreateObject("MTZ_JSetup.GridFinder")
  fndITTOP_OPLNK.Init gridITTOP_OPLNK
  LoadBtnPictures cmdITTOP_OPKAMAdd, cmdITTOP_OPKAMAdd.Tag
  LoadBtnPictures cmdITTOP_OPKAMEdit, cmdITTOP_OPKAMEdit.Tag
  LoadBtnPictures cmdITTOP_OPKAMDel, cmdITTOP_OPKAMDel.Tag
  LoadBtnPictures cmdITTOP_OPKAMRef, cmdITTOP_OPKAMRef.Tag
  LoadBtnPictures cmdITTOP_OPKAMPrn, cmdITTOP_OPKAMPrn.Tag
  LoadBtnPictures cmdITTOP_OPKAMFnd, cmdITTOP_OPKAMFnd.Tag
  LoadBtnPictures cmdITTOP_OPKAMCfg, cmdITTOP_OPKAMCfg.Tag
  LoadBtnPictures cmdITTOP_OPKAMRun, cmdITTOP_OPKAMRun.Tag
  LoadBtnPictures cmdITTOP_OPKAMAcc, cmdITTOP_OPKAMAcc.Tag
  gridITTOP_OPKAM.Columns.Clear
  gridITTOP_OPKAM.ItemCount = 0
  cmdITTOP_OPKAMRef_Click
End Sub

'Действие при активизации таба
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

pnlITTOP_OPLNK.RestorePosition
  gridITTOP_OPLNK_RowColChange gridITTOP_OPLNK.Row, -1
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
  pnlITTOP_OPLNK.Move 0, 0, UserControl.Width, UserControl.Height
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
  Set fndITTOP_OPLNK = Nothing
  Set fndITTOP_OPKAM = Nothing
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





