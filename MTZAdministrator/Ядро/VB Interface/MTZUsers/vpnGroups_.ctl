VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnGroups_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerGroupUser 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerGroups 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlGroups 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdGroupUserAcc 
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
      Begin MTZ_PANEL.DropButton cmdGroupUserRun 
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
      Begin VB.CommandButton cmdGroupUserFnd 
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
      Begin VB.CommandButton cmdGroupUserCfg 
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
      Begin VB.CommandButton cmdGroupUserPrn 
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
      Begin VB.CommandButton cmdGroupUserRef 
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
      Begin VB.CommandButton cmdGroupUserDel 
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
      Begin VB.CommandButton cmdGroupUserEdit 
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
      Begin VB.CommandButton cmdGroupUserAdd 
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
      Begin GridEX20.GridEX gridGroupUser 
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
         Column(1)       =   "vpnGroups_.ctx":0000
         Column(2)       =   "vpnGroups_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnGroups_.ctx":016C
         FormatStyle(2)  =   "vpnGroups_.ctx":02C8
         FormatStyle(3)  =   "vpnGroups_.ctx":0378
         FormatStyle(4)  =   "vpnGroups_.ctx":042C
         FormatStyle(5)  =   "vpnGroups_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnGroups_.ctx":05BC
      End
      Begin VB.CommandButton cmdGroupsAcc 
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
      Begin MTZ_PANEL.DropButton cmdGroupsRun 
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
      Begin VB.CommandButton cmdGroupsFnd 
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
      Begin VB.CommandButton cmdGroupsCfg 
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
      Begin VB.CommandButton cmdGroupsPrn 
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
      Begin VB.CommandButton cmdGroupsRef 
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
      Begin VB.CommandButton cmdGroupsDel 
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
      Begin VB.CommandButton cmdGroupsEdit 
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
      Begin VB.CommandButton cmdGroupsAdd 
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
      Begin GridEX20.GridEX gridGroups 
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
         Column(1)       =   "vpnGroups_.ctx":0794
         Column(2)       =   "vpnGroups_.ctx":085C
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnGroups_.ctx":0900
         FormatStyle(2)  =   "vpnGroups_.ctx":0A5C
         FormatStyle(3)  =   "vpnGroups_.ctx":0B0C
         FormatStyle(4)  =   "vpnGroups_.ctx":0BC0
         FormatStyle(5)  =   "vpnGroups_.ctx":0C98
         ImageCount      =   0
         PrinterProperties=   "vpnGroups_.ctx":0D50
      End
   End
   Begin VB.Menu mnuPopupGroups 
      Caption         =   "Меню для Группы"
      Visible         =   0   'False
      Begin VB.Menu mnuGroupsAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuGroupsEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuGroupsDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuGroupsOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuGroupsRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuGroupsS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuGroupsBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuGroupsCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuGroupsCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuGroupsPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuGroupsCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuGroupsCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuGroupsPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuGroupsCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuGroupsFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuGroupsAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupGroupUser 
      Caption         =   "Меню для Состав группы"
      Visible         =   0   'False
      Begin VB.Menu mnuGroupUserAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuGroupUserEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuGroupUserDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuGroupUserOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuGroupUserRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuGroupUserS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuGroupUserBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuGroupUserCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuGroupUserCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuGroupUserPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuGroupUserCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuGroupUserCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuGroupUserPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuGroupUserCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuGroupUserFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuGroupUserAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnGroups_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель для работы со строками раздела Группы
Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndGroups As Object
Private menuActionGroups As String
Private fndGroupUser As Object
Private menuActionGroupUser As String





Private Sub pnlGroups_PositionChanged()
  pnlGroups.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridGroups_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdGroupsCfg_Click
        End If
    End If
End Sub

Private Sub gridGroups_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupGroups
End If
End Sub
Private Sub mnuGroupsAdd_click()
   menuActionGroups = "ADD"
   menuTimerGroups.Enabled = True
End Sub
Private Sub mnuGroupsEdit_click()
   menuActionGroups = "EDIT"
   menuTimerGroups.Enabled = True
End Sub
Private Sub mnuGroupsDelete_click()
   menuActionGroups = "DEL"
   menuTimerGroups.Enabled = True
End Sub
Private Sub mnuGroupsOpen_click()
   menuActionGroups = "RUN"
   menuTimerGroups.Enabled = True
End Sub
Private Sub mnuGroupsRef_click()
   menuActionGroups = "REF"
   menuTimerGroups.Enabled = True
End Sub
  Private Sub mnuGroupsCOPY_Click()
    On Error Resume Next
    If gridGroups.ItemCount = 0 Then Exit Sub
    If gridGroups.Row > 0 Then
     If gridGroups.RowIndex(gridGroups.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridGroups.RowBookmark(gridGroups.RowIndex(gridGroups.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuGroupsCUT_Click()
    On Error Resume Next
    If gridGroups.ItemCount = 0 Then Exit Sub
    If gridGroups.Row > 0 Then
     If gridGroups.RowIndex(gridGroups.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridGroups.RowBookmark(gridGroups.RowIndex(gridGroups.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridGroups.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuGroupsCHANGE_Click()
  On Error Resume Next
  If gridGroups.ItemCount = 0 Then Exit Sub
  If gridGroups.Row > 0 Then
   If gridGroups.RowIndex(gridGroups.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridGroups.RowBookmark(gridGroups.RowIndex(gridGroups.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridGroups.ItemCount = u.Parent.Count
      gridGroups.RefreshRowIndex gridGroups.RowIndex(gridGroups.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuGroupsCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuGroupsPrn_click()
   menuActionGroups = "PRN"
   menuTimerGroups.Enabled = True
End Sub
Private Sub mnuGroupsCfg_click()
   menuActionGroups = "CFG"
   menuTimerGroups.Enabled = True
End Sub
Private Sub mnuGroupsFind_click()
   menuActionGroups = "FND"
   menuTimerGroups.Enabled = True
End Sub
Private Sub mnuGroupsAcc_click()
   menuActionGroups = "ACC"
   menuTimerGroups.Enabled = True
End Sub
Private Sub menuTimerGroups_timer()
   menuTimerGroups.Enabled = False
   If menuActionGroups = "ADD" Then cmdGroupsAdd_Click
   If menuActionGroups = "EDIT" Then cmdGroupsEdit_Click
   If menuActionGroups = "DEL" Then cmdGroupsDel_Click
   If menuActionGroups = "RUN" Then cmdGroupsRun_Click
   If menuActionGroups = "REF" Then cmdGroupsRef_Click
   If menuActionGroups = "PRN" Then cmdGroupsPrn_Click
   If menuActionGroups = "CFG" Then cmdGroupsCfg_Click
   If menuActionGroups = "FND" Then cmdGroupsFnd_Click
   If menuActionGroups = "ACC" Then cmdGroupsAcc_Click
   menuActionGroups = ""
End Sub
Private Sub cmdGroupsCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridGroups, "gridGroups"
Set jset = Nothing
End Sub

Private Sub cmdGroupsPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridGroups, "Группы"
Set jset = Nothing
End Sub

Private Sub cmdGroupsRef_Click()
  On Error Resume Next
  Item.Groups.Refresh
  gridGroups.ItemCount = Item.Groups.Count
  gridGroups.Refetch
  gridGroups.Refresh
End Sub
Private Sub cmdGroupsAcc_Click()
On Error Resume Next
If gridGroups.ItemCount = 0 Then Exit Sub
If gridGroups.Row > 0 Then
 If gridGroups.RowIndex(gridGroups.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridGroups.RowBookmark(gridGroups.RowIndex(gridGroups.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdGroupsEdit_Click()
  On Error Resume Next
If gridGroups.ItemCount = 0 Then Exit Sub
If gridGroups.Row > 0 Then
 If gridGroups.RowIndex(gridGroups.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridGroups.RowBookmark(gridGroups.RowIndex(gridGroups.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmGroups_.Item = u
again:     frmGroups_.NotFirstTime = False
    frmGroups_.OnInit
    frmGroups_.Show vbModal
    If frmGroups_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridGroups.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdGroupsDel_Click()
  On Error Resume Next
  gridGroups.Delete
End Sub
Private Sub cmdGroupsAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.Groups.Add()

      Set frmGroups_.Item = u
again:       frmGroups_.NotFirstTime = False
      frmGroups_.OnInit
      frmGroups_.Show vbModal
      If frmGroups_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridGroups.ItemCount = Item.Groups.Count
        gridGroups.Refresh
        gridGroups.RefreshGroups
        gridGroups.RefreshSort
        gridGroups.MoveToBookmark u.ID & "Groups"
      Else
        Item.Groups.Delete u.ID
        Item.Groups.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdGroupsFnd_Click()
  On Error Resume Next
  fndGroups.ShowForm
End Sub
Private Sub cmdGroupsRun_Click()
  On Error Resume Next
  gridGroups_DblClick
End Sub
Private Sub gridGroups_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.Groups.LoadRow gridGroups, RowIndex, Bookmark, Values
End Sub
Private Sub gridGroups_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridGroups.ItemCount = 0 Then Exit Sub
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
Private Sub gridGroups_DblClick()
  cmdGroupsEdit_Click
End Sub
Private Sub gridGroups_KeyPress(KeyAscii As Integer)
  If gridGroups.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndGroups.FindOnPress KeyAscii
End Sub

Private Sub pnlGroups_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridGroups.Left = Left
  gridGroups.Top = Top + 25 * Screen.TwipsPerPixelY
  gridGroups.Width = Width
  gridGroups.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdGroupsAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdGroupsEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdGroupsDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdGroupsRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdGroupsPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdGroupsCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdGroupsFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdGroupsRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdGroupsAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdGroupsAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdGroupsEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdGroupsDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdGroupsRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdGroupsPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdGroupsCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdGroupsFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdGroupsRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdGroupsAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuGroupsPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.Groups.Add()
    If GetFromBuffer(u) Then
      gridGroups.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdGroupUserCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridGroupUser, "gridGroupUser"
Set jset = Nothing
End Sub

Private Sub cmdGroupUserPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridGroupUser, "Состав группы"
Set jset = Nothing
End Sub

Private Sub cmdGroupUserAcc_Click()
On Error Resume Next
If gridGroupUser.ItemCount = 0 Then Exit Sub
If gridGroupUser.Row > 0 Then
 If gridGroupUser.RowIndex(gridGroupUser.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridGroupUser.RowBookmark(gridGroupUser.RowIndex(gridGroupUser.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdGroupUserFnd_Click()
  On Error Resume Next
  fndGroupUser.ShowForm
End Sub
Private Sub cmdGroupUserRun_Click()
  On Error Resume Next
  gridGroupUser_DblClick
End Sub
Private Sub pnlGroups_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridGroupUser.Left = Left
  gridGroupUser.Top = Top + 25 * Screen.TwipsPerPixelY
  gridGroupUser.Width = Width
  gridGroupUser.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdGroupUserAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdGroupUserEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdGroupUserDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdGroupUserRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdGroupUserPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdGroupUserCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdGroupUserFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdGroupUserRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdGroupUserAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdGroupUserAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdGroupUserEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdGroupUserDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdGroupUserRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdGroupUserPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdGroupUserCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdGroupUserFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdGroupUserRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdGroupUserAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdGroupUserRef_Click()
  On Error Resume Next
If gridGroups.ItemCount = 0 Then Exit Sub
If gridGroups.Row > 0 Then
 If gridGroups.RowIndex(gridGroups.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridGroups.RowBookmark(gridGroups.RowIndex(gridGroups.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.GroupUser.Refresh
   gridGroupUser.ItemCount = gu.GroupUser.Count
   gridGroupUser.Refetch
   gridGroupUser.Refresh
 Else
  gridGroupUser.Columns.Clear
  gridGroupUser.ItemCount = 0
 End If
Else
 gridGroupUser.Columns.Clear
 gridGroupUser.ItemCount = 0
End If
End Sub
Private Sub cmdGroupUserEdit_Click()
    If gridGroupUser.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridGroupUser.RowBookmark(gridGroupUser.RowIndex(gridGroupUser.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmGroupUser_.Item = u
again:     frmGroupUser_.NotFirstTime = False
    frmGroupUser_.OnInit
    frmGroupUser_.Show vbModal
    If frmGroupUser_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridGroupUser.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdGroupUserDel_Click()
  On Error Resume Next
  gridGroupUser.Delete
End Sub
Private Sub cmdGroupUserAdd_Click()
  On Error Resume Next
    Dim gu As Object
    Dim u As Object
If gridGroups.ItemCount = 0 Then Exit Sub
    Dim bm
    bm = gridGroups.RowBookmark(gridGroups.RowIndex(gridGroups.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set u = gu.GroupUser.Add()

      Set frmGroupUser_.Item = u
again:       frmGroupUser_.NotFirstTime = False
      frmGroupUser_.OnInit
      frmGroupUser_.Show vbModal
      If frmGroupUser_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridGroupUser.ItemCount = gu.GroupUser.Count
        gridGroupUser.Refresh
        gridGroupUser.RefreshGroups
        gridGroupUser.RefreshSort
        gridGroupUser.MoveToBookmark u.ID & "GroupUser"
      Else
        gu.GroupUser.Delete u.ID
        gu.GroupUser.Remove u.ID
      End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridGroups_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridGroups.ItemCount = 0 Then
  gridGroupUser.ItemCount = 0
  Exit Sub
End If
If gridGroups.Row > 0 Then
  If LastRow <> gridGroups.Row And LastRow > 0 Then
    gridGroups.GetRowData(LastRow).RowStyle = "Default"
    gridGroups.GetRowData(gridGroups.Row).RowStyle = "SelectedRow"
  End If
 If gridGroups.RowIndex(gridGroups.Row) > 0 Then
  If LastRow <> gridGroups.Row Or gridGroupUser.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridGroups.RowBookmark(gridGroups.RowIndex(gridGroups.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.GroupUser.PrepareGrid gridGroupUser
  gridGroupUser.ItemCount = 0
    LoadGridLayout gridGroupUser
    Set fndGroupUser = Nothing
    Set fndGroupUser = CreateObject("MTZ_JSetup.GridFinder")
    fndGroupUser.Init gridGroupUser
  gridGroupUser.ItemCount = gu.GroupUser.Count
  End If
 End If
End If
End Sub
Private Sub gridGroupUser_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
    If gridGroups.ItemCount = 0 Then Exit Sub
    If gridGroupUser.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridGroups.RowBookmark(gridGroups.RowIndex(gridGroups.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.GroupUser.LoadRow gridGroupUser, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridGroupUser_KeyPress(KeyAscii As Integer)
  If gridGroupUser.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndGroupUser.FindOnPress KeyAscii
End Sub

Private Sub gridGroupUser_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If gridGroupUser.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridGroupUser.RowBookmark(gridGroupUser.RowIndex(gridGroupUser.Row))
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
Private Sub gridGroupUser_DblClick()
    cmdGroupUserEdit_Click
End Sub
Private Sub gridGroupUser_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridGroupUser.ItemCount = 0 Then Exit Sub
 If gridGroupUser.Row > 0 Then
   If LastRow <> gridGroupUser.Row And LastRow > 0 Then
     gridGroupUser.GetRowData(LastRow).RowStyle = "Default"
     gridGroupUser.GetRowData(gridGroupUser.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuGroupUserPASTE_Click()
On Error Resume Next
    If gridGroups.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridGroups.RowBookmark(gridGroups.RowIndex(gridGroups.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.GroupUser.Add()
    If GetFromBuffer(u) Then
      gridGroupUser.ItemCount = u.Parent.Count
    Else
      gu.GroupUser.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridGroupUser_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdGroupUserCfg_Click
        End If
    End If
End Sub

Private Sub gridGroupUser_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupGroupUser
End If
End Sub
Private Sub mnuGroupUserAdd_click()
   menuActionGroupUser = "ADD"
   menuTimerGroupUser.Enabled = True
End Sub
Private Sub mnuGroupUserEdit_click()
   menuActionGroupUser = "EDIT"
   menuTimerGroupUser.Enabled = True
End Sub
Private Sub mnuGroupUserDelete_click()
   menuActionGroupUser = "DEL"
   menuTimerGroupUser.Enabled = True
End Sub
Private Sub mnuGroupUserOpen_click()
   menuActionGroupUser = "RUN"
   menuTimerGroupUser.Enabled = True
End Sub
Private Sub mnuGroupUserRef_click()
   menuActionGroupUser = "REF"
   menuTimerGroupUser.Enabled = True
End Sub
  Private Sub mnuGroupUserCOPY_Click()
    On Error Resume Next
    If gridGroupUser.ItemCount = 0 Then Exit Sub
    If gridGroupUser.Row > 0 Then
     If gridGroupUser.RowIndex(gridGroupUser.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridGroupUser.RowBookmark(gridGroupUser.RowIndex(gridGroupUser.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuGroupUserCUT_Click()
    On Error Resume Next
    If gridGroupUser.ItemCount = 0 Then Exit Sub
    If gridGroupUser.Row > 0 Then
     If gridGroupUser.RowIndex(gridGroupUser.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridGroupUser.RowBookmark(gridGroupUser.RowIndex(gridGroupUser.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridGroupUser.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuGroupUserCHANGE_Click()
  On Error Resume Next
  If gridGroupUser.ItemCount = 0 Then Exit Sub
  If gridGroupUser.Row > 0 Then
   If gridGroupUser.RowIndex(gridGroupUser.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridGroupUser.RowBookmark(gridGroupUser.RowIndex(gridGroupUser.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridGroupUser.ItemCount = u.Parent.Count
      gridGroupUser.RefreshRowIndex gridGroupUser.RowIndex(gridGroupUser.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuGroupUserCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuGroupUserPrn_click()
   menuActionGroupUser = "PRN"
   menuTimerGroupUser.Enabled = True
End Sub
Private Sub mnuGroupUserCfg_click()
   menuActionGroupUser = "CFG"
   menuTimerGroupUser.Enabled = True
End Sub
Private Sub mnuGroupUserFind_click()
   menuActionGroupUser = "FND"
   menuTimerGroupUser.Enabled = True
End Sub
Private Sub mnuGroupUserAcc_click()
   menuActionGroupUser = "ACC"
   menuTimerGroupUser.Enabled = True
End Sub
Private Sub menuTimerGroupUser_timer()
   menuTimerGroupUser.Enabled = False
   If menuActionGroupUser = "ADD" Then cmdGroupUserAdd_Click
   If menuActionGroupUser = "EDIT" Then cmdGroupUserEdit_Click
   If menuActionGroupUser = "DEL" Then cmdGroupUserDel_Click
   If menuActionGroupUser = "RUN" Then cmdGroupUserRun_Click
   If menuActionGroupUser = "REF" Then cmdGroupUserRef_Click
   If menuActionGroupUser = "PRN" Then cmdGroupUserPrn_Click
   If menuActionGroupUser = "CFG" Then cmdGroupUserCfg_Click
   If menuActionGroupUser = "FND" Then cmdGroupUserFnd_Click
   If menuActionGroupUser = "ACC" Then cmdGroupUserAcc_Click
   menuActionGroupUser = ""
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

  LoadBtnPictures cmdGroupsAdd, cmdGroupsAdd.Tag
  LoadBtnPictures cmdGroupsEdit, cmdGroupsEdit.Tag
  LoadBtnPictures cmdGroupsDel, cmdGroupsDel.Tag
  LoadBtnPictures cmdGroupsRef, cmdGroupsRef.Tag
  LoadBtnPictures cmdGroupsPrn, cmdGroupsPrn.Tag
  LoadBtnPictures cmdGroupsFnd, cmdGroupsFnd.Tag
  LoadBtnPictures cmdGroupsRun, cmdGroupsRun.Tag
  LoadBtnPictures cmdGroupsAcc, cmdGroupsAcc.Tag
  LoadBtnPictures cmdGroupsCfg, cmdGroupsCfg.Tag
  Item.Groups.PrepareGrid gridGroups
  LoadGridLayout gridGroups
  Set fndGroups = Nothing
  On Error Resume Next
  Set fndGroups = CreateObject("MTZ_JSetup.GridFinder")
  fndGroups.Init gridGroups
  LoadBtnPictures cmdGroupUserAdd, cmdGroupUserAdd.Tag
  LoadBtnPictures cmdGroupUserEdit, cmdGroupUserEdit.Tag
  LoadBtnPictures cmdGroupUserDel, cmdGroupUserDel.Tag
  LoadBtnPictures cmdGroupUserRef, cmdGroupUserRef.Tag
  LoadBtnPictures cmdGroupUserPrn, cmdGroupUserPrn.Tag
  LoadBtnPictures cmdGroupUserFnd, cmdGroupUserFnd.Tag
  LoadBtnPictures cmdGroupUserCfg, cmdGroupUserCfg.Tag
  LoadBtnPictures cmdGroupUserRun, cmdGroupUserRun.Tag
  LoadBtnPictures cmdGroupUserAcc, cmdGroupUserAcc.Tag
  gridGroupUser.Columns.Clear
  gridGroupUser.ItemCount = 0
  cmdGroupUserRef_Click
End Sub

'Действие при активизации таба
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

pnlGroups.RestorePosition
  gridGroups_RowColChange gridGroups.Row, -1
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
  pnlGroups.Move 0, 0, UserControl.Width, UserControl.Height
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
  Set fndGroups = Nothing
  Set fndGroupUser = Nothing
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





