VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnVRRPT_MeetingPlan_CONT 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerVRRPT_Meeters 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerVRRPT_MeetingPlan 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlVRRPT_MeetingPlan 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdVRRPT_MeetersAcc 
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
      Begin MTZ_PANEL.DropButton cmdVRRPT_MeetersRun 
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
      Begin VB.CommandButton cmdVRRPT_MeetersFnd 
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
      Begin VB.CommandButton cmdVRRPT_MeetersCfg 
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
      Begin VB.CommandButton cmdVRRPT_MeetersPrn 
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
      Begin VB.CommandButton cmdVRRPT_MeetersRef 
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
      Begin VB.CommandButton cmdVRRPT_MeetersDel 
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
      Begin VB.CommandButton cmdVRRPT_MeetersEdit 
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
      Begin VB.CommandButton cmdVRRPT_MeetersAdd 
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
      Begin GridEX20.GridEX gridVRRPT_Meeters 
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
         Column(1)       =   "vpnVRRPT_MeetingPlan_CONT.ctx":0000
         Column(2)       =   "vpnVRRPT_MeetingPlan_CONT.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnVRRPT_MeetingPlan_CONT.ctx":016C
         FormatStyle(2)  =   "vpnVRRPT_MeetingPlan_CONT.ctx":02C8
         FormatStyle(3)  =   "vpnVRRPT_MeetingPlan_CONT.ctx":0378
         FormatStyle(4)  =   "vpnVRRPT_MeetingPlan_CONT.ctx":042C
         FormatStyle(5)  =   "vpnVRRPT_MeetingPlan_CONT.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnVRRPT_MeetingPlan_CONT.ctx":05BC
      End
      Begin VB.CommandButton cmdVRRPT_MeetingPlanAcc 
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
      Begin MTZ_PANEL.DropButton cmdVRRPT_MeetingPlanRun 
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
      Begin VB.CommandButton cmdVRRPT_MeetingPlanFnd 
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
      Begin VB.CommandButton cmdVRRPT_MeetingPlanCfg 
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
      Begin VB.CommandButton cmdVRRPT_MeetingPlanPrn 
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
      Begin VB.CommandButton cmdVRRPT_MeetingPlanRef 
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
      Begin VB.CommandButton cmdVRRPT_MeetingPlanDel 
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
      Begin VB.CommandButton cmdVRRPT_MeetingPlanEdit 
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
      Begin VB.CommandButton cmdVRRPT_MeetingPlanAdd 
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
      Begin GridEX20.GridEX gridVRRPT_MeetingPlan 
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
         Column(1)       =   "vpnVRRPT_MeetingPlan_CONT.ctx":0794
         Column(2)       =   "vpnVRRPT_MeetingPlan_CONT.ctx":085C
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnVRRPT_MeetingPlan_CONT.ctx":0900
         FormatStyle(2)  =   "vpnVRRPT_MeetingPlan_CONT.ctx":0A5C
         FormatStyle(3)  =   "vpnVRRPT_MeetingPlan_CONT.ctx":0B0C
         FormatStyle(4)  =   "vpnVRRPT_MeetingPlan_CONT.ctx":0BC0
         FormatStyle(5)  =   "vpnVRRPT_MeetingPlan_CONT.ctx":0C98
         ImageCount      =   0
         PrinterProperties=   "vpnVRRPT_MeetingPlan_CONT.ctx":0D50
      End
   End
   Begin VB.Menu mnuPopupVRRPT_MeetingPlan 
      Caption         =   "Меню для Планируемые встречи"
      Visible         =   0   'False
      Begin VB.Menu mnuVRRPT_MeetingPlanAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuVRRPT_MeetingPlanEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuVRRPT_MeetingPlanDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuVRRPT_MeetingPlanOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuVRRPT_MeetingPlanRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuVRRPT_MeetingPlanS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuVRRPT_MeetingPlanBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuVRRPT_MeetingPlanCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuVRRPT_MeetingPlanCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuVRRPT_MeetingPlanPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuVRRPT_MeetingPlanCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuVRRPT_MeetingPlanCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuVRRPT_MeetingPlanPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuVRRPT_MeetingPlanCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuVRRPT_MeetingPlanFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuVRRPT_MeetingPlanAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupVRRPT_Meeters 
      Caption         =   "Меню для Участники"
      Visible         =   0   'False
      Begin VB.Menu mnuVRRPT_MeetersAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuVRRPT_MeetersEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuVRRPT_MeetersDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuVRRPT_MeetersOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuVRRPT_MeetersRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuVRRPT_MeetersS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuVRRPT_MeetersBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuVRRPT_MeetersCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuVRRPT_MeetersCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuVRRPT_MeetersPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuVRRPT_MeetersCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuVRRPT_MeetersCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuVRRPT_MeetersPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuVRRPT_MeetersCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuVRRPT_MeetersFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuVRRPT_MeetersAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnVRRPT_MeetingPlan_CONT"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndVRRPT_MeetingPlan As Object
Private menuActionVRRPT_MeetingPlan As String
Private fndVRRPT_Meeters As Object
Private menuActionVRRPT_Meeters As String





Private Sub pnlVRRPT_MeetingPlan_PositionChanged()
  pnlVRRPT_MeetingPlan.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridVRRPT_MeetingPlan_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdVRRPT_MeetingPlanCfg_Click
        End If
    End If
End Sub

Private Sub gridVRRPT_MeetingPlan_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupVRRPT_MeetingPlan
End If
End Sub
Private Sub mnuVRRPT_MeetingPlanAdd_click()
   menuActionVRRPT_MeetingPlan = "ADD"
   menuTimerVRRPT_MeetingPlan.Enabled = True
End Sub
Private Sub mnuVRRPT_MeetingPlanEdit_click()
   menuActionVRRPT_MeetingPlan = "EDIT"
   menuTimerVRRPT_MeetingPlan.Enabled = True
End Sub
Private Sub mnuVRRPT_MeetingPlanDelete_click()
   menuActionVRRPT_MeetingPlan = "DEL"
   menuTimerVRRPT_MeetingPlan.Enabled = True
End Sub
Private Sub mnuVRRPT_MeetingPlanOpen_click()
   menuActionVRRPT_MeetingPlan = "RUN"
   menuTimerVRRPT_MeetingPlan.Enabled = True
End Sub
Private Sub mnuVRRPT_MeetingPlanRef_click()
   menuActionVRRPT_MeetingPlan = "REF"
   menuTimerVRRPT_MeetingPlan.Enabled = True
End Sub
  Private Sub mnuVRRPT_MeetingPlanCOPY_Click()
    On Error Resume Next
    If gridVRRPT_MeetingPlan.ItemCount = 0 Then Exit Sub
    If gridVRRPT_MeetingPlan.Row > 0 Then
     If gridVRRPT_MeetingPlan.RowIndex(gridVRRPT_MeetingPlan.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridVRRPT_MeetingPlan.RowBookmark(gridVRRPT_MeetingPlan.RowIndex(gridVRRPT_MeetingPlan.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuVRRPT_MeetingPlanCUT_Click()
    On Error Resume Next
    If gridVRRPT_MeetingPlan.ItemCount = 0 Then Exit Sub
    If gridVRRPT_MeetingPlan.Row > 0 Then
     If gridVRRPT_MeetingPlan.RowIndex(gridVRRPT_MeetingPlan.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridVRRPT_MeetingPlan.RowBookmark(gridVRRPT_MeetingPlan.RowIndex(gridVRRPT_MeetingPlan.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridVRRPT_MeetingPlan.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuVRRPT_MeetingPlanCHANGE_Click()
  On Error Resume Next
  If gridVRRPT_MeetingPlan.ItemCount = 0 Then Exit Sub
  If gridVRRPT_MeetingPlan.Row > 0 Then
   If gridVRRPT_MeetingPlan.RowIndex(gridVRRPT_MeetingPlan.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRRPT_MeetingPlan.RowBookmark(gridVRRPT_MeetingPlan.RowIndex(gridVRRPT_MeetingPlan.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridVRRPT_MeetingPlan.ItemCount = u.Parent.Count
      gridVRRPT_MeetingPlan.RefreshRowIndex gridVRRPT_MeetingPlan.RowIndex(gridVRRPT_MeetingPlan.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuVRRPT_MeetingPlanCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuVRRPT_MeetingPlanPrn_click()
   menuActionVRRPT_MeetingPlan = "PRN"
   menuTimerVRRPT_MeetingPlan.Enabled = True
End Sub
Private Sub mnuVRRPT_MeetingPlanCfg_click()
   menuActionVRRPT_MeetingPlan = "CFG"
   menuTimerVRRPT_MeetingPlan.Enabled = True
End Sub
Private Sub mnuVRRPT_MeetingPlanFind_click()
   menuActionVRRPT_MeetingPlan = "FND"
   menuTimerVRRPT_MeetingPlan.Enabled = True
End Sub
Private Sub mnuVRRPT_MeetingPlanAcc_click()
   menuActionVRRPT_MeetingPlan = "ACC"
   menuTimerVRRPT_MeetingPlan.Enabled = True
End Sub
Private Sub menuTimerVRRPT_MeetingPlan_timer()
   menuTimerVRRPT_MeetingPlan.Enabled = False
   If menuActionVRRPT_MeetingPlan = "ADD" Then cmdVRRPT_MeetingPlanAdd_Click
   If menuActionVRRPT_MeetingPlan = "EDIT" Then cmdVRRPT_MeetingPlanEdit_Click
   If menuActionVRRPT_MeetingPlan = "DEL" Then cmdVRRPT_MeetingPlanDel_Click
   If menuActionVRRPT_MeetingPlan = "RUN" Then cmdVRRPT_MeetingPlanRun_Click
   If menuActionVRRPT_MeetingPlan = "REF" Then cmdVRRPT_MeetingPlanRef_Click
   If menuActionVRRPT_MeetingPlan = "PRN" Then cmdVRRPT_MeetingPlanPrn_Click
   If menuActionVRRPT_MeetingPlan = "CFG" Then cmdVRRPT_MeetingPlanCfg_Click
   If menuActionVRRPT_MeetingPlan = "FND" Then cmdVRRPT_MeetingPlanFnd_Click
   If menuActionVRRPT_MeetingPlan = "ACC" Then cmdVRRPT_MeetingPlanAcc_Click
   menuActionVRRPT_MeetingPlan = ""
End Sub
Private Sub cmdVRRPT_MeetingPlanCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridVRRPT_MeetingPlan, "gridVRRPT_MeetingPlan"
Set jset = Nothing
End Sub

Private Sub cmdVRRPT_MeetingPlanPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridVRRPT_MeetingPlan, "Планируемые встречи"
Set jset = Nothing
End Sub

Private Sub cmdVRRPT_MeetingPlanRef_Click()
  On Error Resume Next
  Item.VRRPT_MeetingPlan.Refresh
  gridVRRPT_MeetingPlan.ItemCount = Item.VRRPT_MeetingPlan.Count
  gridVRRPT_MeetingPlan.Refetch
  gridVRRPT_MeetingPlan.Refresh
End Sub
Private Sub cmdVRRPT_MeetingPlanAcc_Click()
On Error Resume Next
If gridVRRPT_MeetingPlan.ItemCount = 0 Then Exit Sub
If gridVRRPT_MeetingPlan.Row > 0 Then
 If gridVRRPT_MeetingPlan.RowIndex(gridVRRPT_MeetingPlan.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRRPT_MeetingPlan.RowBookmark(gridVRRPT_MeetingPlan.RowIndex(gridVRRPT_MeetingPlan.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdVRRPT_MeetingPlanEdit_Click()
  On Error Resume Next
If gridVRRPT_MeetingPlan.ItemCount = 0 Then Exit Sub
If gridVRRPT_MeetingPlan.Row > 0 Then
 If gridVRRPT_MeetingPlan.RowIndex(gridVRRPT_MeetingPlan.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRRPT_MeetingPlan.RowBookmark(gridVRRPT_MeetingPlan.RowIndex(gridVRRPT_MeetingPlan.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmVRRPT_MeetingPlan_CONT.Item = u
again:     frmVRRPT_MeetingPlan_CONT.NotFirstTime = False
    frmVRRPT_MeetingPlan_CONT.OnInit
    frmVRRPT_MeetingPlan_CONT.Show vbModal
    If frmVRRPT_MeetingPlan_CONT.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridVRRPT_MeetingPlan.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdVRRPT_MeetingPlanDel_Click()
  On Error Resume Next
  gridVRRPT_MeetingPlan.Delete
End Sub
Private Sub cmdVRRPT_MeetingPlanAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.VRRPT_MeetingPlan.Add()

      Set frmVRRPT_MeetingPlan_CONT.Item = u
again:       frmVRRPT_MeetingPlan_CONT.NotFirstTime = False
      frmVRRPT_MeetingPlan_CONT.OnInit
      frmVRRPT_MeetingPlan_CONT.Show vbModal
      If frmVRRPT_MeetingPlan_CONT.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridVRRPT_MeetingPlan.ItemCount = Item.VRRPT_MeetingPlan.Count
        gridVRRPT_MeetingPlan.Refresh
        gridVRRPT_MeetingPlan.RefreshGroups
        gridVRRPT_MeetingPlan.RefreshSort
        gridVRRPT_MeetingPlan.MoveToBookmark u.ID & "VRRPT_MeetingPlan"
      Else
        Item.VRRPT_MeetingPlan.Delete u.ID
        Item.VRRPT_MeetingPlan.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdVRRPT_MeetingPlanFnd_Click()
  On Error Resume Next
  fndVRRPT_MeetingPlan.ShowForm
End Sub
Private Sub cmdVRRPT_MeetingPlanRun_Click()
  On Error Resume Next
  gridVRRPT_MeetingPlan_DblClick
End Sub
Private Sub gridVRRPT_MeetingPlan_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.VRRPT_MeetingPlan.LoadRow gridVRRPT_MeetingPlan, RowIndex, Bookmark, Values
End Sub
Private Sub gridVRRPT_MeetingPlan_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridVRRPT_MeetingPlan.ItemCount = 0 Then Exit Sub
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
Private Sub gridVRRPT_MeetingPlan_DblClick()
  cmdVRRPT_MeetingPlanEdit_Click
End Sub
Private Sub gridVRRPT_MeetingPlan_KeyPress(KeyAscii As Integer)
  If gridVRRPT_MeetingPlan.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndVRRPT_MeetingPlan.FindOnPress KeyAscii
End Sub

Private Sub pnlVRRPT_MeetingPlan_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridVRRPT_MeetingPlan.Left = Left
  gridVRRPT_MeetingPlan.Top = Top + 25 * Screen.TwipsPerPixelY
  gridVRRPT_MeetingPlan.Width = Width
  gridVRRPT_MeetingPlan.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdVRRPT_MeetingPlanAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdVRRPT_MeetingPlanEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdVRRPT_MeetingPlanDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdVRRPT_MeetingPlanRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdVRRPT_MeetingPlanPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdVRRPT_MeetingPlanCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdVRRPT_MeetingPlanFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdVRRPT_MeetingPlanRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdVRRPT_MeetingPlanAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdVRRPT_MeetingPlanAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdVRRPT_MeetingPlanEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdVRRPT_MeetingPlanDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdVRRPT_MeetingPlanRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdVRRPT_MeetingPlanPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdVRRPT_MeetingPlanCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdVRRPT_MeetingPlanFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdVRRPT_MeetingPlanRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdVRRPT_MeetingPlanAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuVRRPT_MeetingPlanPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.VRRPT_MeetingPlan.Add()
    If GetFromBuffer(u) Then
      gridVRRPT_MeetingPlan.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdVRRPT_MeetersCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridVRRPT_Meeters, "gridVRRPT_Meeters"
Set jset = Nothing
End Sub

Private Sub cmdVRRPT_MeetersPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridVRRPT_Meeters, "Участники"
Set jset = Nothing
End Sub

Private Sub cmdVRRPT_MeetersAcc_Click()
On Error Resume Next
If gridVRRPT_Meeters.ItemCount = 0 Then Exit Sub
If gridVRRPT_Meeters.Row > 0 Then
 If gridVRRPT_Meeters.RowIndex(gridVRRPT_Meeters.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRRPT_Meeters.RowBookmark(gridVRRPT_Meeters.RowIndex(gridVRRPT_Meeters.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdVRRPT_MeetersFnd_Click()
  On Error Resume Next
  fndVRRPT_Meeters.ShowForm
End Sub
Private Sub cmdVRRPT_MeetersRun_Click()
  On Error Resume Next
  gridVRRPT_Meeters_DblClick
End Sub
Private Sub pnlVRRPT_MeetingPlan_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridVRRPT_Meeters.Left = Left
  gridVRRPT_Meeters.Top = Top + 25 * Screen.TwipsPerPixelY
  gridVRRPT_Meeters.Width = Width
  gridVRRPT_Meeters.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdVRRPT_MeetersAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdVRRPT_MeetersEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdVRRPT_MeetersDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdVRRPT_MeetersRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdVRRPT_MeetersPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdVRRPT_MeetersCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdVRRPT_MeetersFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdVRRPT_MeetersRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdVRRPT_MeetersAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdVRRPT_MeetersAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdVRRPT_MeetersEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdVRRPT_MeetersDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdVRRPT_MeetersRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdVRRPT_MeetersPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdVRRPT_MeetersCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdVRRPT_MeetersFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdVRRPT_MeetersRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdVRRPT_MeetersAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdVRRPT_MeetersRef_Click()
  On Error Resume Next
If gridVRRPT_MeetingPlan.ItemCount = 0 Then Exit Sub
If gridVRRPT_MeetingPlan.Row > 0 Then
 If gridVRRPT_MeetingPlan.RowIndex(gridVRRPT_MeetingPlan.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridVRRPT_MeetingPlan.RowBookmark(gridVRRPT_MeetingPlan.RowIndex(gridVRRPT_MeetingPlan.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.VRRPT_Meeters.Refresh
   gridVRRPT_Meeters.ItemCount = gu.VRRPT_Meeters.Count
   gridVRRPT_Meeters.Refetch
   gridVRRPT_Meeters.Refresh
 Else
  gridVRRPT_Meeters.Columns.Clear
  gridVRRPT_Meeters.ItemCount = 0
 End If
Else
 gridVRRPT_Meeters.Columns.Clear
 gridVRRPT_Meeters.ItemCount = 0
End If
End Sub
Private Sub cmdVRRPT_MeetersEdit_Click()
    If gridVRRPT_Meeters.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridVRRPT_Meeters.RowBookmark(gridVRRPT_Meeters.RowIndex(gridVRRPT_Meeters.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmVRRPT_Meeters_CONT.Item = u
again:     frmVRRPT_Meeters_CONT.NotFirstTime = False
    frmVRRPT_Meeters_CONT.OnInit
    frmVRRPT_Meeters_CONT.Show vbModal
    If frmVRRPT_Meeters_CONT.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridVRRPT_Meeters.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdVRRPT_MeetersDel_Click()
  On Error Resume Next
  gridVRRPT_Meeters.Delete
End Sub
Private Sub cmdVRRPT_MeetersAdd_Click()
  On Error Resume Next
    Dim gu As Object
    Dim u As Object
If gridVRRPT_MeetingPlan.ItemCount = 0 Then Exit Sub
    Dim bm
    bm = gridVRRPT_MeetingPlan.RowBookmark(gridVRRPT_MeetingPlan.RowIndex(gridVRRPT_MeetingPlan.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set u = gu.VRRPT_Meeters.Add()

      Set frmVRRPT_Meeters_CONT.Item = u
again:       frmVRRPT_Meeters_CONT.NotFirstTime = False
      frmVRRPT_Meeters_CONT.OnInit
      frmVRRPT_Meeters_CONT.Show vbModal
      If frmVRRPT_Meeters_CONT.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridVRRPT_Meeters.ItemCount = gu.VRRPT_Meeters.Count
        gridVRRPT_Meeters.Refresh
        gridVRRPT_Meeters.RefreshGroups
        gridVRRPT_Meeters.RefreshSort
        gridVRRPT_Meeters.MoveToBookmark u.ID & "VRRPT_Meeters"
      Else
        gu.VRRPT_Meeters.Delete u.ID
        gu.VRRPT_Meeters.Remove u.ID
      End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridVRRPT_MeetingPlan_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridVRRPT_MeetingPlan.ItemCount = 0 Then
  gridVRRPT_Meeters.ItemCount = 0
  Exit Sub
End If
If gridVRRPT_MeetingPlan.Row > 0 Then
  If LastRow <> gridVRRPT_MeetingPlan.Row And LastRow > 0 Then
    gridVRRPT_MeetingPlan.GetRowData(LastRow).RowStyle = "Default"
    gridVRRPT_MeetingPlan.GetRowData(gridVRRPT_MeetingPlan.Row).RowStyle = "SelectedRow"
  End If
 If gridVRRPT_MeetingPlan.RowIndex(gridVRRPT_MeetingPlan.Row) > 0 Then
  If LastRow <> gridVRRPT_MeetingPlan.Row Or gridVRRPT_Meeters.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridVRRPT_MeetingPlan.RowBookmark(gridVRRPT_MeetingPlan.RowIndex(gridVRRPT_MeetingPlan.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.VRRPT_Meeters.PrepareGrid gridVRRPT_Meeters
  gridVRRPT_Meeters.ItemCount = 0
    LoadGridLayout gridVRRPT_Meeters
    Set fndVRRPT_Meeters = Nothing
    Set fndVRRPT_Meeters = CreateObject("MTZ_JSetup.GridFinder")
    fndVRRPT_Meeters.Init gridVRRPT_Meeters
  gridVRRPT_Meeters.ItemCount = gu.VRRPT_Meeters.Count
  End If
 End If
End If
End Sub
Private Sub gridVRRPT_Meeters_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
    If gridVRRPT_MeetingPlan.ItemCount = 0 Then Exit Sub
    If gridVRRPT_Meeters.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridVRRPT_MeetingPlan.RowBookmark(gridVRRPT_MeetingPlan.RowIndex(gridVRRPT_MeetingPlan.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.VRRPT_Meeters.LoadRow gridVRRPT_Meeters, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridVRRPT_Meeters_KeyPress(KeyAscii As Integer)
  If gridVRRPT_Meeters.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndVRRPT_Meeters.FindOnPress KeyAscii
End Sub

Private Sub gridVRRPT_Meeters_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If gridVRRPT_Meeters.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridVRRPT_Meeters.RowBookmark(gridVRRPT_Meeters.RowIndex(gridVRRPT_Meeters.Row))
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
Private Sub gridVRRPT_Meeters_DblClick()
    cmdVRRPT_MeetersEdit_Click
End Sub
Private Sub gridVRRPT_Meeters_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridVRRPT_Meeters.ItemCount = 0 Then Exit Sub
 If gridVRRPT_Meeters.Row > 0 Then
   If LastRow <> gridVRRPT_Meeters.Row And LastRow > 0 Then
     gridVRRPT_Meeters.GetRowData(LastRow).RowStyle = "Default"
     gridVRRPT_Meeters.GetRowData(gridVRRPT_Meeters.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuVRRPT_MeetersPASTE_Click()
On Error Resume Next
    If gridVRRPT_MeetingPlan.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridVRRPT_MeetingPlan.RowBookmark(gridVRRPT_MeetingPlan.RowIndex(gridVRRPT_MeetingPlan.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.VRRPT_Meeters.Add()
    If GetFromBuffer(u) Then
      gridVRRPT_Meeters.ItemCount = u.Parent.Count
    Else
      gu.VRRPT_Meeters.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridVRRPT_Meeters_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdVRRPT_MeetersCfg_Click
        End If
    End If
End Sub

Private Sub gridVRRPT_Meeters_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupVRRPT_Meeters
End If
End Sub
Private Sub mnuVRRPT_MeetersAdd_click()
   menuActionVRRPT_Meeters = "ADD"
   menuTimerVRRPT_Meeters.Enabled = True
End Sub
Private Sub mnuVRRPT_MeetersEdit_click()
   menuActionVRRPT_Meeters = "EDIT"
   menuTimerVRRPT_Meeters.Enabled = True
End Sub
Private Sub mnuVRRPT_MeetersDelete_click()
   menuActionVRRPT_Meeters = "DEL"
   menuTimerVRRPT_Meeters.Enabled = True
End Sub
Private Sub mnuVRRPT_MeetersOpen_click()
   menuActionVRRPT_Meeters = "RUN"
   menuTimerVRRPT_Meeters.Enabled = True
End Sub
Private Sub mnuVRRPT_MeetersRef_click()
   menuActionVRRPT_Meeters = "REF"
   menuTimerVRRPT_Meeters.Enabled = True
End Sub
  Private Sub mnuVRRPT_MeetersCOPY_Click()
    On Error Resume Next
    If gridVRRPT_Meeters.ItemCount = 0 Then Exit Sub
    If gridVRRPT_Meeters.Row > 0 Then
     If gridVRRPT_Meeters.RowIndex(gridVRRPT_Meeters.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridVRRPT_Meeters.RowBookmark(gridVRRPT_Meeters.RowIndex(gridVRRPT_Meeters.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuVRRPT_MeetersCUT_Click()
    On Error Resume Next
    If gridVRRPT_Meeters.ItemCount = 0 Then Exit Sub
    If gridVRRPT_Meeters.Row > 0 Then
     If gridVRRPT_Meeters.RowIndex(gridVRRPT_Meeters.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridVRRPT_Meeters.RowBookmark(gridVRRPT_Meeters.RowIndex(gridVRRPT_Meeters.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridVRRPT_Meeters.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuVRRPT_MeetersCHANGE_Click()
  On Error Resume Next
  If gridVRRPT_Meeters.ItemCount = 0 Then Exit Sub
  If gridVRRPT_Meeters.Row > 0 Then
   If gridVRRPT_Meeters.RowIndex(gridVRRPT_Meeters.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRRPT_Meeters.RowBookmark(gridVRRPT_Meeters.RowIndex(gridVRRPT_Meeters.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridVRRPT_Meeters.ItemCount = u.Parent.Count
      gridVRRPT_Meeters.RefreshRowIndex gridVRRPT_Meeters.RowIndex(gridVRRPT_Meeters.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuVRRPT_MeetersCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuVRRPT_MeetersPrn_click()
   menuActionVRRPT_Meeters = "PRN"
   menuTimerVRRPT_Meeters.Enabled = True
End Sub
Private Sub mnuVRRPT_MeetersCfg_click()
   menuActionVRRPT_Meeters = "CFG"
   menuTimerVRRPT_Meeters.Enabled = True
End Sub
Private Sub mnuVRRPT_MeetersFind_click()
   menuActionVRRPT_Meeters = "FND"
   menuTimerVRRPT_Meeters.Enabled = True
End Sub
Private Sub mnuVRRPT_MeetersAcc_click()
   menuActionVRRPT_Meeters = "ACC"
   menuTimerVRRPT_Meeters.Enabled = True
End Sub
Private Sub menuTimerVRRPT_Meeters_timer()
   menuTimerVRRPT_Meeters.Enabled = False
   If menuActionVRRPT_Meeters = "ADD" Then cmdVRRPT_MeetersAdd_Click
   If menuActionVRRPT_Meeters = "EDIT" Then cmdVRRPT_MeetersEdit_Click
   If menuActionVRRPT_Meeters = "DEL" Then cmdVRRPT_MeetersDel_Click
   If menuActionVRRPT_Meeters = "RUN" Then cmdVRRPT_MeetersRun_Click
   If menuActionVRRPT_Meeters = "REF" Then cmdVRRPT_MeetersRef_Click
   If menuActionVRRPT_Meeters = "PRN" Then cmdVRRPT_MeetersPrn_Click
   If menuActionVRRPT_Meeters = "CFG" Then cmdVRRPT_MeetersCfg_Click
   If menuActionVRRPT_Meeters = "FND" Then cmdVRRPT_MeetersFnd_Click
   If menuActionVRRPT_Meeters = "ACC" Then cmdVRRPT_MeetersAcc_Click
   menuActionVRRPT_Meeters = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdVRRPT_MeetingPlanAdd, cmdVRRPT_MeetingPlanAdd.Tag
  LoadBtnPictures cmdVRRPT_MeetingPlanEdit, cmdVRRPT_MeetingPlanEdit.Tag
  LoadBtnPictures cmdVRRPT_MeetingPlanDel, cmdVRRPT_MeetingPlanDel.Tag
  LoadBtnPictures cmdVRRPT_MeetingPlanRef, cmdVRRPT_MeetingPlanRef.Tag
  LoadBtnPictures cmdVRRPT_MeetingPlanPrn, cmdVRRPT_MeetingPlanPrn.Tag
  LoadBtnPictures cmdVRRPT_MeetingPlanFnd, cmdVRRPT_MeetingPlanFnd.Tag
  LoadBtnPictures cmdVRRPT_MeetingPlanRun, cmdVRRPT_MeetingPlanRun.Tag
  LoadBtnPictures cmdVRRPT_MeetingPlanAcc, cmdVRRPT_MeetingPlanAcc.Tag
  LoadBtnPictures cmdVRRPT_MeetingPlanCfg, cmdVRRPT_MeetingPlanCfg.Tag
  Item.VRRPT_MeetingPlan.PrepareGrid gridVRRPT_MeetingPlan
  LoadGridLayout gridVRRPT_MeetingPlan
  Set fndVRRPT_MeetingPlan = Nothing
  On Error Resume Next
  Set fndVRRPT_MeetingPlan = CreateObject("MTZ_JSetup.GridFinder")
  fndVRRPT_MeetingPlan.Init gridVRRPT_MeetingPlan
  LoadBtnPictures cmdVRRPT_MeetersAdd, cmdVRRPT_MeetersAdd.Tag
  LoadBtnPictures cmdVRRPT_MeetersEdit, cmdVRRPT_MeetersEdit.Tag
  LoadBtnPictures cmdVRRPT_MeetersDel, cmdVRRPT_MeetersDel.Tag
  LoadBtnPictures cmdVRRPT_MeetersRef, cmdVRRPT_MeetersRef.Tag
  LoadBtnPictures cmdVRRPT_MeetersPrn, cmdVRRPT_MeetersPrn.Tag
  LoadBtnPictures cmdVRRPT_MeetersFnd, cmdVRRPT_MeetersFnd.Tag
  LoadBtnPictures cmdVRRPT_MeetersCfg, cmdVRRPT_MeetersCfg.Tag
  LoadBtnPictures cmdVRRPT_MeetersRun, cmdVRRPT_MeetersRun.Tag
  LoadBtnPictures cmdVRRPT_MeetersAcc, cmdVRRPT_MeetersAcc.Tag
  gridVRRPT_Meeters.Columns.Clear
  gridVRRPT_Meeters.ItemCount = 0
  cmdVRRPT_MeetersRef_Click
End Sub
Private Sub OnTabClick()

pnlVRRPT_MeetingPlan.RestorePosition
  gridVRRPT_MeetingPlan_RowColChange gridVRRPT_MeetingPlan.Row, -1
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
  pnlVRRPT_MeetingPlan.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndVRRPT_MeetingPlan = Nothing
  Set fndVRRPT_Meeters = Nothing
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





