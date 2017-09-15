VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnpekz_path_sent 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerPEKZ_WLIST 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerpekz_path 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlpekz_path 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdPEKZ_WLISTAcc 
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
      Begin MTZ_PANEL.DropButton cmdPEKZ_WLISTRun 
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
      Begin VB.CommandButton cmdPEKZ_WLISTFnd 
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
      Begin VB.CommandButton cmdPEKZ_WLISTCfg 
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
      Begin VB.CommandButton cmdPEKZ_WLISTPrn 
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
      Begin VB.CommandButton cmdPEKZ_WLISTRef 
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
      Begin VB.CommandButton cmdPEKZ_WLISTDel 
         Enabled         =   0   'False
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
      Begin VB.CommandButton cmdPEKZ_WLISTEdit 
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
      Begin VB.CommandButton cmdPEKZ_WLISTAdd 
         Enabled         =   0   'False
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
      Begin GridEX20.GridEX gridPEKZ_WLIST 
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
         Column(1)       =   "vpnpekz_path_sent.ctx":0000
         Column(2)       =   "vpnpekz_path_sent.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnpekz_path_sent.ctx":016C
         FormatStyle(2)  =   "vpnpekz_path_sent.ctx":02C8
         FormatStyle(3)  =   "vpnpekz_path_sent.ctx":0378
         FormatStyle(4)  =   "vpnpekz_path_sent.ctx":042C
         FormatStyle(5)  =   "vpnpekz_path_sent.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnpekz_path_sent.ctx":05BC
      End
      Begin VB.CommandButton cmdpekz_pathAcc 
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
      Begin MTZ_PANEL.DropButton cmdpekz_pathRun 
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
      Begin VB.CommandButton cmdpekz_pathFnd 
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
      Begin VB.CommandButton cmdpekz_pathCfg 
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
      Begin VB.CommandButton cmdpekz_pathPrn 
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
      Begin VB.CommandButton cmdpekz_pathRef 
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
      Begin VB.CommandButton cmdpekz_pathDel 
         Enabled         =   0   'False
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
      Begin VB.CommandButton cmdpekz_pathEdit 
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
      Begin VB.CommandButton cmdpekz_pathAdd 
         Enabled         =   0   'False
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
      Begin GridEX20.GridEX gridpekz_path 
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
         Column(1)       =   "vpnpekz_path_sent.ctx":0794
         Column(2)       =   "vpnpekz_path_sent.ctx":085C
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnpekz_path_sent.ctx":0900
         FormatStyle(2)  =   "vpnpekz_path_sent.ctx":0A5C
         FormatStyle(3)  =   "vpnpekz_path_sent.ctx":0B0C
         FormatStyle(4)  =   "vpnpekz_path_sent.ctx":0BC0
         FormatStyle(5)  =   "vpnpekz_path_sent.ctx":0C98
         ImageCount      =   0
         PrinterProperties=   "vpnpekz_path_sent.ctx":0D50
      End
   End
   Begin VB.Menu mnuPopuppekz_path 
      Caption         =   "Меню для Маршрут доставки"
      Visible         =   0   'False
      Begin VB.Menu mnupekz_pathAdd 
         Caption         =   "Создать"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnupekz_pathEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnupekz_pathDelete 
         Caption         =   "Удалить"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnupekz_pathOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnupekz_pathRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnupekz_pathS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnupekz_pathBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnupekz_pathCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnupekz_pathCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnupekz_pathPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnupekz_pathCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnupekz_pathCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnupekz_pathPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnupekz_pathCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnupekz_pathFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnupekz_pathAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupPEKZ_WLIST 
      Caption         =   "Меню для Весовой список ППО"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKZ_WLISTAdd 
         Caption         =   "Создать"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuPEKZ_WLISTEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuPEKZ_WLISTDelete 
         Caption         =   "Удалить"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuPEKZ_WLISTOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuPEKZ_WLISTRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuPEKZ_WLISTS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPEKZ_WLISTBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuPEKZ_WLISTCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuPEKZ_WLISTCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuPEKZ_WLISTPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuPEKZ_WLISTCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuPEKZ_WLISTCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuPEKZ_WLISTPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuPEKZ_WLISTCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuPEKZ_WLISTFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuPEKZ_WLISTAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnpekz_path_sent"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndpekz_path As Object
Private menuActionpekz_path As String
Private fndPEKZ_WLIST As Object
Private menuActionPEKZ_WLIST As String





Private Sub pnlpekz_path_PositionChanged()
  pnlpekz_path.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridpekz_path_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdpekz_pathCfg_Click
        End If
    End If
End Sub

Private Sub gridpekz_path_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopuppekz_path
End If
End Sub
Private Sub mnupekz_pathAdd_click()
   menuActionpekz_path = "ADD"
   menuTimerpekz_path.Enabled = True
End Sub
Private Sub mnupekz_pathEdit_click()
   menuActionpekz_path = "EDIT"
   menuTimerpekz_path.Enabled = True
End Sub
Private Sub mnupekz_pathDelete_click()
   menuActionpekz_path = "DEL"
   menuTimerpekz_path.Enabled = True
End Sub
Private Sub mnupekz_pathOpen_click()
   menuActionpekz_path = "RUN"
   menuTimerpekz_path.Enabled = True
End Sub
Private Sub mnupekz_pathRef_click()
   menuActionpekz_path = "REF"
   menuTimerpekz_path.Enabled = True
End Sub
  Private Sub mnupekz_pathCOPY_Click()
    On Error Resume Next
    If gridpekz_path.ItemCount = 0 Then Exit Sub
    If gridpekz_path.Row > 0 Then
     If gridpekz_path.RowIndex(gridpekz_path.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridpekz_path.RowBookmark(gridpekz_path.RowIndex(gridpekz_path.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnupekz_pathCUT_Click()
    On Error Resume Next
    If gridpekz_path.ItemCount = 0 Then Exit Sub
    If gridpekz_path.Row > 0 Then
     If gridpekz_path.RowIndex(gridpekz_path.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridpekz_path.RowBookmark(gridpekz_path.RowIndex(gridpekz_path.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridpekz_path.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnupekz_pathCHANGE_Click()
  On Error Resume Next
  If gridpekz_path.ItemCount = 0 Then Exit Sub
  If gridpekz_path.Row > 0 Then
   If gridpekz_path.RowIndex(gridpekz_path.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridpekz_path.RowBookmark(gridpekz_path.RowIndex(gridpekz_path.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridpekz_path.ItemCount = u.Parent.Count
      gridpekz_path.RefreshRowIndex gridpekz_path.RowIndex(gridpekz_path.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnupekz_pathCLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnupekz_pathPrn_click()
   menuActionpekz_path = "PRN"
   menuTimerpekz_path.Enabled = True
End Sub
Private Sub mnupekz_pathCfg_click()
   menuActionpekz_path = "CFG"
   menuTimerpekz_path.Enabled = True
End Sub
Private Sub mnupekz_pathFind_click()
   menuActionpekz_path = "FND"
   menuTimerpekz_path.Enabled = True
End Sub
Private Sub mnupekz_pathAcc_click()
   menuActionpekz_path = "ACC"
   menuTimerpekz_path.Enabled = True
End Sub
Private Sub menuTimerpekz_path_timer()
   menuTimerpekz_path.Enabled = False
   If menuActionpekz_path = "ADD" Then cmdpekz_pathAdd_Click
   If menuActionpekz_path = "EDIT" Then cmdpekz_pathEdit_Click
   If menuActionpekz_path = "DEL" Then cmdpekz_pathDel_Click
   If menuActionpekz_path = "RUN" Then cmdpekz_pathRun_Click
   If menuActionpekz_path = "REF" Then cmdpekz_pathRef_Click
   If menuActionpekz_path = "PRN" Then cmdpekz_pathPrn_Click
   If menuActionpekz_path = "CFG" Then cmdpekz_pathCfg_Click
   If menuActionpekz_path = "FND" Then cmdpekz_pathFnd_Click
   If menuActionpekz_path = "ACC" Then cmdpekz_pathAcc_Click
   menuActionpekz_path = ""
End Sub
Private Sub cmdpekz_pathCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridpekz_path, "gridpekz_path"
Set jset = Nothing
End Sub

Private Sub cmdpekz_pathPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridpekz_path, "Маршрут доставки"
Set jset = Nothing
End Sub

Private Sub cmdpekz_pathRef_Click()
  On Error Resume Next
  item.pekz_path.Refresh
  gridpekz_path.ItemCount = item.pekz_path.Count
  gridpekz_path.Refetch
  gridpekz_path.Refresh
End Sub
Private Sub cmdpekz_pathAcc_Click()
On Error Resume Next
If gridpekz_path.ItemCount = 0 Then Exit Sub
If gridpekz_path.Row > 0 Then
 If gridpekz_path.RowIndex(gridpekz_path.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridpekz_path.RowBookmark(gridpekz_path.RowIndex(gridpekz_path.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdpekz_pathEdit_Click()
  On Error Resume Next
If gridpekz_path.ItemCount = 0 Then Exit Sub
If gridpekz_path.Row > 0 Then
 If gridpekz_path.RowIndex(gridpekz_path.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridpekz_path.RowBookmark(gridpekz_path.RowIndex(gridpekz_path.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmpekz_path_sent.item = u
again:     frmpekz_path_sent.NotFirstTime = False
    frmpekz_path_sent.OnInit
    frmpekz_path_sent.Show vbModal
    If frmpekz_path_sent.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridpekz_path.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdpekz_pathDel_Click()
  On Error Resume Next
End Sub
Private Sub cmdpekz_pathAdd_Click()
  On Error Resume Next
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdpekz_pathFnd_Click()
  On Error Resume Next
  fndpekz_path.ShowForm
End Sub
Private Sub cmdpekz_pathRun_Click()
  On Error Resume Next
  gridpekz_path_DblClick
End Sub
Private Sub gridpekz_path_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
item.pekz_path.LoadRow gridpekz_path, RowIndex, Bookmark, Values
End Sub
Private Sub gridpekz_path_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
   Cancel = True
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridpekz_path_DblClick()
  cmdpekz_pathEdit_Click
End Sub
Private Sub gridpekz_path_KeyPress(KeyAscii As Integer)
  If gridpekz_path.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndpekz_path.FindOnPress KeyAscii
End Sub

Private Sub pnlpekz_path_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridpekz_path.Left = Left
  gridpekz_path.Top = Top + 25 * Screen.TwipsPerPixelY
  gridpekz_path.Width = Width
  gridpekz_path.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdpekz_pathAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdpekz_pathEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdpekz_pathDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdpekz_pathRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdpekz_pathPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdpekz_pathCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdpekz_pathFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdpekz_pathRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdpekz_pathAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdpekz_pathAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdpekz_pathEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdpekz_pathDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdpekz_pathRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdpekz_pathPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdpekz_pathCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdpekz_pathFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdpekz_pathRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdpekz_pathAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub mnupekz_pathPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = item.pekz_path.Add()
    If GetFromBuffer(u) Then
      gridpekz_path.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdPEKZ_WLISTCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEKZ_WLIST, "gridPEKZ_WLIST"
Set jset = Nothing
End Sub

Private Sub cmdPEKZ_WLISTPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEKZ_WLIST, "Весовой список ППО"
Set jset = Nothing
End Sub

Private Sub cmdPEKZ_WLISTAcc_Click()
On Error Resume Next
If gridPEKZ_WLIST.ItemCount = 0 Then Exit Sub
If gridPEKZ_WLIST.Row > 0 Then
 If gridPEKZ_WLIST.RowIndex(gridPEKZ_WLIST.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKZ_WLIST.RowBookmark(gridPEKZ_WLIST.RowIndex(gridPEKZ_WLIST.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdPEKZ_WLISTFnd_Click()
  On Error Resume Next
  fndPEKZ_WLIST.ShowForm
End Sub
Private Sub cmdPEKZ_WLISTRun_Click()
  On Error Resume Next
  gridPEKZ_WLIST_DblClick
End Sub
Private Sub pnlpekz_path_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridPEKZ_WLIST.Left = Left
  gridPEKZ_WLIST.Top = Top + 25 * Screen.TwipsPerPixelY
  gridPEKZ_WLIST.Width = Width
  gridPEKZ_WLIST.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdPEKZ_WLISTAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKZ_WLISTEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKZ_WLISTDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKZ_WLISTRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKZ_WLISTPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKZ_WLISTCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKZ_WLISTFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKZ_WLISTRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKZ_WLISTAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKZ_WLISTAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdPEKZ_WLISTEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdPEKZ_WLISTDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdPEKZ_WLISTRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdPEKZ_WLISTPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdPEKZ_WLISTCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdPEKZ_WLISTFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdPEKZ_WLISTRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdPEKZ_WLISTAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdPEKZ_WLISTRef_Click()
  On Error Resume Next
If gridpekz_path.ItemCount = 0 Then Exit Sub
If gridpekz_path.Row > 0 Then
 If gridpekz_path.RowIndex(gridpekz_path.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridpekz_path.RowBookmark(gridpekz_path.RowIndex(gridpekz_path.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.PEKZ_WLIST.Refresh
   gridPEKZ_WLIST.ItemCount = gu.PEKZ_WLIST.Count
   gridPEKZ_WLIST.Refetch
   gridPEKZ_WLIST.Refresh
 Else
  gridPEKZ_WLIST.Columns.Clear
  gridPEKZ_WLIST.ItemCount = 0
 End If
Else
 gridPEKZ_WLIST.Columns.Clear
 gridPEKZ_WLIST.ItemCount = 0
End If
End Sub
Private Sub cmdPEKZ_WLISTEdit_Click()
    If gridPEKZ_WLIST.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridPEKZ_WLIST.RowBookmark(gridPEKZ_WLIST.RowIndex(gridPEKZ_WLIST.Row))
    Set u = item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmPEKZ_WLIST_sent.item = u
again:     frmPEKZ_WLIST_sent.NotFirstTime = False
    frmPEKZ_WLIST_sent.OnInit
    frmPEKZ_WLIST_sent.Show vbModal
    If frmPEKZ_WLIST_sent.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridPEKZ_WLIST.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdPEKZ_WLISTDel_Click()
  On Error Resume Next
End Sub
Private Sub cmdPEKZ_WLISTAdd_Click()
  On Error Resume Next
    Dim gu As Object
    Dim u As Object
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridpekz_path_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridpekz_path.ItemCount = 0 Then
  gridPEKZ_WLIST.ItemCount = 0
  Exit Sub
End If
If gridpekz_path.Row > 0 Then
  If LastRow <> gridpekz_path.Row And LastRow > 0 Then
    gridpekz_path.GetRowData(LastRow).RowStyle = "Default"
    gridpekz_path.GetRowData(gridpekz_path.Row).RowStyle = "SelectedRow"
  End If
 If gridpekz_path.RowIndex(gridpekz_path.Row) > 0 Then
  If LastRow <> gridpekz_path.Row Or gridPEKZ_WLIST.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridpekz_path.RowBookmark(gridpekz_path.RowIndex(gridpekz_path.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.PEKZ_WLIST.PrepareGrid gridPEKZ_WLIST
  gridPEKZ_WLIST.ItemCount = 0
    LoadGridLayout gridPEKZ_WLIST
    Set fndPEKZ_WLIST = Nothing
    Set fndPEKZ_WLIST = CreateObject("MTZ_JSetup.GridFinder")
    fndPEKZ_WLIST.Init gridPEKZ_WLIST
  gridPEKZ_WLIST.ItemCount = gu.PEKZ_WLIST.Count
  End If
 End If
End If
End Sub
Private Sub gridPEKZ_WLIST_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
    If gridpekz_path.ItemCount = 0 Then Exit Sub
    If gridPEKZ_WLIST.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridpekz_path.RowBookmark(gridpekz_path.RowIndex(gridpekz_path.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.PEKZ_WLIST.LoadRow gridPEKZ_WLIST, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridPEKZ_WLIST_KeyPress(KeyAscii As Integer)
  If gridPEKZ_WLIST.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEKZ_WLIST.FindOnPress KeyAscii
End Sub

Private Sub gridPEKZ_WLIST_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
   Cancel = True
End Sub
Private Sub gridPEKZ_WLIST_DblClick()
    cmdPEKZ_WLISTEdit_Click
End Sub
Private Sub gridPEKZ_WLIST_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridPEKZ_WLIST.ItemCount = 0 Then Exit Sub
 If gridPEKZ_WLIST.Row > 0 Then
   If LastRow <> gridPEKZ_WLIST.Row And LastRow > 0 Then
     gridPEKZ_WLIST.GetRowData(LastRow).RowStyle = "Default"
     gridPEKZ_WLIST.GetRowData(gridPEKZ_WLIST.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuPEKZ_WLISTPASTE_Click()
On Error Resume Next
    If gridpekz_path.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridpekz_path.RowBookmark(gridpekz_path.RowIndex(gridpekz_path.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.PEKZ_WLIST.Add()
    If GetFromBuffer(u) Then
      gridPEKZ_WLIST.ItemCount = u.Parent.Count
    Else
      gu.PEKZ_WLIST.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridPEKZ_WLIST_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdPEKZ_WLISTCfg_Click
        End If
    End If
End Sub

Private Sub gridPEKZ_WLIST_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupPEKZ_WLIST
End If
End Sub
Private Sub mnuPEKZ_WLISTAdd_click()
   menuActionPEKZ_WLIST = "ADD"
   menuTimerPEKZ_WLIST.Enabled = True
End Sub
Private Sub mnuPEKZ_WLISTEdit_click()
   menuActionPEKZ_WLIST = "EDIT"
   menuTimerPEKZ_WLIST.Enabled = True
End Sub
Private Sub mnuPEKZ_WLISTDelete_click()
   menuActionPEKZ_WLIST = "DEL"
   menuTimerPEKZ_WLIST.Enabled = True
End Sub
Private Sub mnuPEKZ_WLISTOpen_click()
   menuActionPEKZ_WLIST = "RUN"
   menuTimerPEKZ_WLIST.Enabled = True
End Sub
Private Sub mnuPEKZ_WLISTRef_click()
   menuActionPEKZ_WLIST = "REF"
   menuTimerPEKZ_WLIST.Enabled = True
End Sub
  Private Sub mnuPEKZ_WLISTCOPY_Click()
    On Error Resume Next
    If gridPEKZ_WLIST.ItemCount = 0 Then Exit Sub
    If gridPEKZ_WLIST.Row > 0 Then
     If gridPEKZ_WLIST.RowIndex(gridPEKZ_WLIST.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKZ_WLIST.RowBookmark(gridPEKZ_WLIST.RowIndex(gridPEKZ_WLIST.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEKZ_WLISTCUT_Click()
    On Error Resume Next
    If gridPEKZ_WLIST.ItemCount = 0 Then Exit Sub
    If gridPEKZ_WLIST.Row > 0 Then
     If gridPEKZ_WLIST.RowIndex(gridPEKZ_WLIST.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKZ_WLIST.RowBookmark(gridPEKZ_WLIST.RowIndex(gridPEKZ_WLIST.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEKZ_WLIST.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuPEKZ_WLISTCHANGE_Click()
  On Error Resume Next
  If gridPEKZ_WLIST.ItemCount = 0 Then Exit Sub
  If gridPEKZ_WLIST.Row > 0 Then
   If gridPEKZ_WLIST.RowIndex(gridPEKZ_WLIST.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKZ_WLIST.RowBookmark(gridPEKZ_WLIST.RowIndex(gridPEKZ_WLIST.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEKZ_WLIST.ItemCount = u.Parent.Count
      gridPEKZ_WLIST.RefreshRowIndex gridPEKZ_WLIST.RowIndex(gridPEKZ_WLIST.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEKZ_WLISTCLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKZ_WLISTPrn_click()
   menuActionPEKZ_WLIST = "PRN"
   menuTimerPEKZ_WLIST.Enabled = True
End Sub
Private Sub mnuPEKZ_WLISTCfg_click()
   menuActionPEKZ_WLIST = "CFG"
   menuTimerPEKZ_WLIST.Enabled = True
End Sub
Private Sub mnuPEKZ_WLISTFind_click()
   menuActionPEKZ_WLIST = "FND"
   menuTimerPEKZ_WLIST.Enabled = True
End Sub
Private Sub mnuPEKZ_WLISTAcc_click()
   menuActionPEKZ_WLIST = "ACC"
   menuTimerPEKZ_WLIST.Enabled = True
End Sub
Private Sub menuTimerPEKZ_WLIST_timer()
   menuTimerPEKZ_WLIST.Enabled = False
   If menuActionPEKZ_WLIST = "ADD" Then cmdPEKZ_WLISTAdd_Click
   If menuActionPEKZ_WLIST = "EDIT" Then cmdPEKZ_WLISTEdit_Click
   If menuActionPEKZ_WLIST = "DEL" Then cmdPEKZ_WLISTDel_Click
   If menuActionPEKZ_WLIST = "RUN" Then cmdPEKZ_WLISTRun_Click
   If menuActionPEKZ_WLIST = "REF" Then cmdPEKZ_WLISTRef_Click
   If menuActionPEKZ_WLIST = "PRN" Then cmdPEKZ_WLISTPrn_Click
   If menuActionPEKZ_WLIST = "CFG" Then cmdPEKZ_WLISTCfg_Click
   If menuActionPEKZ_WLIST = "FND" Then cmdPEKZ_WLISTFnd_Click
   If menuActionPEKZ_WLIST = "ACC" Then cmdPEKZ_WLISTAcc_Click
   menuActionPEKZ_WLIST = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdpekz_pathAdd, cmdpekz_pathAdd.Tag
  LoadBtnPictures cmdpekz_pathEdit, cmdpekz_pathEdit.Tag
  LoadBtnPictures cmdpekz_pathDel, cmdpekz_pathDel.Tag
  LoadBtnPictures cmdpekz_pathRef, cmdpekz_pathRef.Tag
  LoadBtnPictures cmdpekz_pathPrn, cmdpekz_pathPrn.Tag
  LoadBtnPictures cmdpekz_pathFnd, cmdpekz_pathFnd.Tag
  LoadBtnPictures cmdpekz_pathRun, cmdpekz_pathRun.Tag
  LoadBtnPictures cmdpekz_pathAcc, cmdpekz_pathAcc.Tag
  LoadBtnPictures cmdpekz_pathCfg, cmdpekz_pathCfg.Tag
  item.pekz_path.PrepareGrid gridpekz_path
  LoadGridLayout gridpekz_path
  Set fndpekz_path = Nothing
  On Error Resume Next
  Set fndpekz_path = CreateObject("MTZ_JSetup.GridFinder")
  fndpekz_path.Init gridpekz_path
  LoadBtnPictures cmdPEKZ_WLISTAdd, cmdPEKZ_WLISTAdd.Tag
  LoadBtnPictures cmdPEKZ_WLISTEdit, cmdPEKZ_WLISTEdit.Tag
  LoadBtnPictures cmdPEKZ_WLISTDel, cmdPEKZ_WLISTDel.Tag
  LoadBtnPictures cmdPEKZ_WLISTRef, cmdPEKZ_WLISTRef.Tag
  LoadBtnPictures cmdPEKZ_WLISTPrn, cmdPEKZ_WLISTPrn.Tag
  LoadBtnPictures cmdPEKZ_WLISTFnd, cmdPEKZ_WLISTFnd.Tag
  LoadBtnPictures cmdPEKZ_WLISTCfg, cmdPEKZ_WLISTCfg.Tag
  LoadBtnPictures cmdPEKZ_WLISTRun, cmdPEKZ_WLISTRun.Tag
  LoadBtnPictures cmdPEKZ_WLISTAcc, cmdPEKZ_WLISTAcc.Tag
  gridPEKZ_WLIST.Columns.Clear
  gridPEKZ_WLIST.ItemCount = 0
  cmdPEKZ_WLISTRef_Click
End Sub
Private Sub OnTabClick()

pnlpekz_path.RestorePosition
  gridpekz_path_RowColChange gridpekz_path.Row, -1
End Sub
Public Sub OnClick(aItem As Object, Optional pForm As Object = Nothing)
  On Error Resume Next
  Set item = aItem
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
  pnlpekz_path.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set item = Nothing
  Set fndpekz_path = Nothing
  Set fndPEKZ_WLIST = Nothing
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

  RowItem.Person.Secure item.SecureStyleID
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
  Set Obj = RowItem.Report.VRRPT_MAIN.item(1)
 End If
 
 Set Obj.Author = RowItem.Application.FindRowObject("Users", item.Application.MTZSession.GetSessionUserID())
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
  Set Obj = RowItem.TheDocument.PEKP_DEF.item(1)
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
  Set Obj = RowItem.TheDocument.PEKO_DEF.item(1)
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
    Set Obj = item.Manager.GetInstanceObject(ID)
    If Not Obj Is Nothing Then
      Dim objGui As Object
      Set objGui = item.Manager.GetInstanceGUI(Obj.ID)
      If objGui Is Nothing Then Exit Sub

       If StartMode = "AUTO" Then
        StartMode = ""
        Dim i As Long
        For i = 100 To 0 Step -10
          If Obj.MTZSession.CheckRight(Obj.SecureStyleID, Obj.TypeName & ":" & "M" & i) Then
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
item.Name = RowItem.Description
ParentForm.Caption = item.Name
item.Save
End Sub



'
'{D8914FB4-6B5D-491A-A72F-985617727583}
Private Sub Run_WFFuncName(Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
item.Name = RowItem.Name
ParentForm.Caption = item.Name
item.Save
End Sub



'Изменить название объекта
'{4FB59D1A-0123-47D3-9F4F-E12085C5D074}
Private Sub Run_VBUpdateItemName(Name As Variant, Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
item.Name = Name
' может не быть формы, если используем просто ActiveX
ParentForm.Caption = item.Name
item.Save
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
  Set Obj = RowItem.TheDocument.pekz_def.Add
 Else
  Set Obj = RowItem.TheDocument.pekz_def.item(1)
 End If
 
 Set Obj.ClientFrom = RowItem.Application
 Obj.QueryDate = Date
 Obj.Save
 RowItem.Save

 Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание Заявки"
End Sub





