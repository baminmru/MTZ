VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnFilterFieldGroup_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerFileterField 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerFilterFieldGroup 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlFilterFieldGroup 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdFileterFieldAcc 
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
      Begin MTZ_PANEL.DropButton cmdFileterFieldRun 
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
      Begin VB.CommandButton cmdFileterFieldFnd 
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
      Begin VB.CommandButton cmdFileterFieldCfg 
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
      Begin VB.CommandButton cmdFileterFieldPrn 
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
      Begin VB.CommandButton cmdFileterFieldRef 
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
      Begin VB.CommandButton cmdFileterFieldDel 
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
      Begin VB.CommandButton cmdFileterFieldEdit 
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
      Begin VB.CommandButton cmdFileterFieldAdd 
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
      Begin GridEX20.GridEX gridFileterField 
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
         Column(1)       =   "vpnFilterFieldGroup_.ctx":0000
         Column(2)       =   "vpnFilterFieldGroup_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnFilterFieldGroup_.ctx":016C
         FormatStyle(2)  =   "vpnFilterFieldGroup_.ctx":02C8
         FormatStyle(3)  =   "vpnFilterFieldGroup_.ctx":0378
         FormatStyle(4)  =   "vpnFilterFieldGroup_.ctx":042C
         FormatStyle(5)  =   "vpnFilterFieldGroup_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnFilterFieldGroup_.ctx":05BC
      End
      Begin VB.CommandButton cmdFilterFieldGroupAcc 
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
      Begin MTZ_PANEL.DropButton cmdFilterFieldGroupRun 
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
      Begin VB.CommandButton cmdFilterFieldGroupFnd 
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
      Begin VB.CommandButton cmdFilterFieldGroupCfg 
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
      Begin VB.CommandButton cmdFilterFieldGroupPrn 
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
      Begin VB.CommandButton cmdFilterFieldGroupRef 
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
      Begin VB.CommandButton cmdFilterFieldGroupDel 
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
      Begin VB.CommandButton cmdFilterFieldGroupEdit 
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
      Begin VB.CommandButton cmdFilterFieldGroupAdd 
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
      Begin GridEX20.GridEX gridFilterFieldGroup 
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
         Column(1)       =   "vpnFilterFieldGroup_.ctx":0794
         Column(2)       =   "vpnFilterFieldGroup_.ctx":085C
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnFilterFieldGroup_.ctx":0900
         FormatStyle(2)  =   "vpnFilterFieldGroup_.ctx":0A5C
         FormatStyle(3)  =   "vpnFilterFieldGroup_.ctx":0B0C
         FormatStyle(4)  =   "vpnFilterFieldGroup_.ctx":0BC0
         FormatStyle(5)  =   "vpnFilterFieldGroup_.ctx":0C98
         ImageCount      =   0
         PrinterProperties=   "vpnFilterFieldGroup_.ctx":0D50
      End
   End
   Begin VB.Menu mnuPopupFilterFieldGroup 
      Caption         =   "Меню для Группа полей фильтра"
      Visible         =   0   'False
      Begin VB.Menu mnuFilterFieldGroupAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuFilterFieldGroupEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuFilterFieldGroupDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuFilterFieldGroupOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuFilterFieldGroupRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuFilterFieldGroupS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFilterFieldGroupBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuFilterFieldGroupCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuFilterFieldGroupCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuFilterFieldGroupPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuFilterFieldGroupCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuFilterFieldGroupCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuFilterFieldGroupPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuFilterFieldGroupCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuFilterFieldGroupFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuFilterFieldGroupAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupFileterField 
      Caption         =   "Меню для Поле фильтра"
      Visible         =   0   'False
      Begin VB.Menu mnuFileterFieldAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuFileterFieldEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuFileterFieldDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuFileterFieldOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuFileterFieldRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuFileterFieldS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileterFieldBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuFileterFieldCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuFileterFieldCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuFileterFieldPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuFileterFieldCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuFileterFieldCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuFileterFieldPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuFileterFieldCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuFileterFieldFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuFileterFieldAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnFilterFieldGroup_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель для работы со строками раздела Группа полей фильтра
Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndFilterFieldGroup As Object
Private menuActionFilterFieldGroup As String
Private fndFileterField As Object
Private menuActionFileterField As String





Private Sub pnlFilterFieldGroup_PositionChanged()
  pnlFilterFieldGroup.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridFilterFieldGroup_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdFilterFieldGroupCfg_Click
        End If
    End If
End Sub

Private Sub gridFilterFieldGroup_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupFilterFieldGroup
End If
End Sub
Private Sub mnuFilterFieldGroupAdd_click()
   menuActionFilterFieldGroup = "ADD"
   menuTimerFilterFieldGroup.Enabled = True
End Sub
Private Sub mnuFilterFieldGroupEdit_click()
   menuActionFilterFieldGroup = "EDIT"
   menuTimerFilterFieldGroup.Enabled = True
End Sub
Private Sub mnuFilterFieldGroupDelete_click()
   menuActionFilterFieldGroup = "DEL"
   menuTimerFilterFieldGroup.Enabled = True
End Sub
Private Sub mnuFilterFieldGroupOpen_click()
   menuActionFilterFieldGroup = "RUN"
   menuTimerFilterFieldGroup.Enabled = True
End Sub
Private Sub mnuFilterFieldGroupRef_click()
   menuActionFilterFieldGroup = "REF"
   menuTimerFilterFieldGroup.Enabled = True
End Sub
  Private Sub mnuFilterFieldGroupCOPY_Click()
    On Error Resume Next
    If gridFilterFieldGroup.ItemCount = 0 Then Exit Sub
    If gridFilterFieldGroup.Row > 0 Then
     If gridFilterFieldGroup.RowIndex(gridFilterFieldGroup.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridFilterFieldGroup.RowBookmark(gridFilterFieldGroup.RowIndex(gridFilterFieldGroup.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuFilterFieldGroupCUT_Click()
    On Error Resume Next
    If gridFilterFieldGroup.ItemCount = 0 Then Exit Sub
    If gridFilterFieldGroup.Row > 0 Then
     If gridFilterFieldGroup.RowIndex(gridFilterFieldGroup.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridFilterFieldGroup.RowBookmark(gridFilterFieldGroup.RowIndex(gridFilterFieldGroup.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridFilterFieldGroup.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuFilterFieldGroupCHANGE_Click()
  On Error Resume Next
  If gridFilterFieldGroup.ItemCount = 0 Then Exit Sub
  If gridFilterFieldGroup.Row > 0 Then
   If gridFilterFieldGroup.RowIndex(gridFilterFieldGroup.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridFilterFieldGroup.RowBookmark(gridFilterFieldGroup.RowIndex(gridFilterFieldGroup.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridFilterFieldGroup.ItemCount = u.Parent.Count
      gridFilterFieldGroup.RefreshRowIndex gridFilterFieldGroup.RowIndex(gridFilterFieldGroup.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuFilterFieldGroupCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuFilterFieldGroupPrn_click()
   menuActionFilterFieldGroup = "PRN"
   menuTimerFilterFieldGroup.Enabled = True
End Sub
Private Sub mnuFilterFieldGroupCfg_click()
   menuActionFilterFieldGroup = "CFG"
   menuTimerFilterFieldGroup.Enabled = True
End Sub
Private Sub mnuFilterFieldGroupFind_click()
   menuActionFilterFieldGroup = "FND"
   menuTimerFilterFieldGroup.Enabled = True
End Sub
Private Sub mnuFilterFieldGroupAcc_click()
   menuActionFilterFieldGroup = "ACC"
   menuTimerFilterFieldGroup.Enabled = True
End Sub
Private Sub menuTimerFilterFieldGroup_timer()
   menuTimerFilterFieldGroup.Enabled = False
   If menuActionFilterFieldGroup = "ADD" Then cmdFilterFieldGroupAdd_Click
   If menuActionFilterFieldGroup = "EDIT" Then cmdFilterFieldGroupEdit_Click
   If menuActionFilterFieldGroup = "DEL" Then cmdFilterFieldGroupDel_Click
   If menuActionFilterFieldGroup = "RUN" Then cmdFilterFieldGroupRun_Click
   If menuActionFilterFieldGroup = "REF" Then cmdFilterFieldGroupRef_Click
   If menuActionFilterFieldGroup = "PRN" Then cmdFilterFieldGroupPrn_Click
   If menuActionFilterFieldGroup = "CFG" Then cmdFilterFieldGroupCfg_Click
   If menuActionFilterFieldGroup = "FND" Then cmdFilterFieldGroupFnd_Click
   If menuActionFilterFieldGroup = "ACC" Then cmdFilterFieldGroupAcc_Click
   menuActionFilterFieldGroup = ""
End Sub
Private Sub cmdFilterFieldGroupCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridFilterFieldGroup, "gridFilterFieldGroup"
Set jset = Nothing
End Sub

Private Sub cmdFilterFieldGroupPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridFilterFieldGroup, "Группа полей фильтра"
Set jset = Nothing
End Sub

Private Sub cmdFilterFieldGroupRef_Click()
  On Error Resume Next
  Item.FilterFieldGroup.Refresh
  gridFilterFieldGroup.ItemCount = Item.FilterFieldGroup.Count
  gridFilterFieldGroup.Refetch
  gridFilterFieldGroup.Refresh
End Sub
Private Sub cmdFilterFieldGroupAcc_Click()
On Error Resume Next
If gridFilterFieldGroup.ItemCount = 0 Then Exit Sub
If gridFilterFieldGroup.Row > 0 Then
 If gridFilterFieldGroup.RowIndex(gridFilterFieldGroup.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridFilterFieldGroup.RowBookmark(gridFilterFieldGroup.RowIndex(gridFilterFieldGroup.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdFilterFieldGroupEdit_Click()
  On Error Resume Next
If gridFilterFieldGroup.ItemCount = 0 Then Exit Sub
If gridFilterFieldGroup.Row > 0 Then
 If gridFilterFieldGroup.RowIndex(gridFilterFieldGroup.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridFilterFieldGroup.RowBookmark(gridFilterFieldGroup.RowIndex(gridFilterFieldGroup.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmFilterFieldGroup_.Item = u
again:     frmFilterFieldGroup_.NotFirstTime = False
    frmFilterFieldGroup_.OnInit
    frmFilterFieldGroup_.Show vbModal
    If frmFilterFieldGroup_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridFilterFieldGroup.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdFilterFieldGroupDel_Click()
  On Error Resume Next
  gridFilterFieldGroup.Delete
End Sub
Private Sub cmdFilterFieldGroupAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.FilterFieldGroup.Add()
   Call GetNumValue(u, "sequence", "{E7F3EE01-4EC4-41D2-8657-BA22089DE0E5}", Now, "%P", "")

      Set frmFilterFieldGroup_.Item = u
again:       frmFilterFieldGroup_.NotFirstTime = False
      frmFilterFieldGroup_.OnInit
      frmFilterFieldGroup_.Show vbModal
      If frmFilterFieldGroup_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridFilterFieldGroup.ItemCount = Item.FilterFieldGroup.Count
        gridFilterFieldGroup.Refresh
        gridFilterFieldGroup.RefreshGroups
        gridFilterFieldGroup.RefreshSort
        gridFilterFieldGroup.MoveToBookmark u.ID & "FilterFieldGroup"
      Else
        Item.FilterFieldGroup.Delete u.ID
        Item.FilterFieldGroup.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdFilterFieldGroupFnd_Click()
  On Error Resume Next
  fndFilterFieldGroup.ShowForm
End Sub
Private Sub cmdFilterFieldGroupRun_Click()
  On Error Resume Next
  gridFilterFieldGroup_DblClick
End Sub
Private Sub gridFilterFieldGroup_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.FilterFieldGroup.LoadRow gridFilterFieldGroup, RowIndex, Bookmark, Values
End Sub
Private Sub gridFilterFieldGroup_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridFilterFieldGroup.ItemCount = 0 Then Exit Sub
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
Private Sub gridFilterFieldGroup_DblClick()
  cmdFilterFieldGroupEdit_Click
End Sub
Private Sub gridFilterFieldGroup_KeyPress(KeyAscii As Integer)
  If gridFilterFieldGroup.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndFilterFieldGroup.FindOnPress KeyAscii
End Sub

Private Sub pnlFilterFieldGroup_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridFilterFieldGroup.Left = Left
  gridFilterFieldGroup.Top = Top + 25 * Screen.TwipsPerPixelY
  gridFilterFieldGroup.Width = Width
  gridFilterFieldGroup.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdFilterFieldGroupAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdFilterFieldGroupEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdFilterFieldGroupDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdFilterFieldGroupRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdFilterFieldGroupPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdFilterFieldGroupCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdFilterFieldGroupFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdFilterFieldGroupRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdFilterFieldGroupAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdFilterFieldGroupAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdFilterFieldGroupEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdFilterFieldGroupDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdFilterFieldGroupRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdFilterFieldGroupPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdFilterFieldGroupCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdFilterFieldGroupFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdFilterFieldGroupRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdFilterFieldGroupAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuFilterFieldGroupPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.FilterFieldGroup.Add()
    If GetFromBuffer(u) Then
      gridFilterFieldGroup.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdFileterFieldCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridFileterField, "gridFileterField"
Set jset = Nothing
End Sub

Private Sub cmdFileterFieldPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridFileterField, "Поле фильтра"
Set jset = Nothing
End Sub

Private Sub cmdFileterFieldAcc_Click()
On Error Resume Next
If gridFileterField.ItemCount = 0 Then Exit Sub
If gridFileterField.Row > 0 Then
 If gridFileterField.RowIndex(gridFileterField.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridFileterField.RowBookmark(gridFileterField.RowIndex(gridFileterField.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdFileterFieldFnd_Click()
  On Error Resume Next
  fndFileterField.ShowForm
End Sub
Private Sub cmdFileterFieldRun_Click()
  On Error Resume Next
  gridFileterField_DblClick
End Sub
Private Sub pnlFilterFieldGroup_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridFileterField.Left = Left
  gridFileterField.Top = Top + 25 * Screen.TwipsPerPixelY
  gridFileterField.Width = Width
  gridFileterField.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdFileterFieldAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdFileterFieldEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdFileterFieldDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdFileterFieldRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdFileterFieldPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdFileterFieldCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdFileterFieldFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdFileterFieldRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdFileterFieldAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdFileterFieldAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdFileterFieldEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdFileterFieldDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdFileterFieldRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdFileterFieldPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdFileterFieldCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdFileterFieldFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdFileterFieldRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdFileterFieldAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdFileterFieldRef_Click()
  On Error Resume Next
If gridFilterFieldGroup.ItemCount = 0 Then Exit Sub
If gridFilterFieldGroup.Row > 0 Then
 If gridFilterFieldGroup.RowIndex(gridFilterFieldGroup.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridFilterFieldGroup.RowBookmark(gridFilterFieldGroup.RowIndex(gridFilterFieldGroup.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.FileterField.Refresh
   gridFileterField.ItemCount = gu.FileterField.Count
   gridFileterField.Refetch
   gridFileterField.Refresh
 Else
  gridFileterField.Columns.Clear
  gridFileterField.ItemCount = 0
 End If
Else
 gridFileterField.Columns.Clear
 gridFileterField.ItemCount = 0
End If
End Sub
Private Sub cmdFileterFieldEdit_Click()
    If gridFileterField.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridFileterField.RowBookmark(gridFileterField.RowIndex(gridFileterField.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmFileterField_.Item = u
again:     frmFileterField_.NotFirstTime = False
    frmFileterField_.OnInit
    frmFileterField_.Show vbModal
    If frmFileterField_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridFileterField.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdFileterFieldDel_Click()
  On Error Resume Next
  gridFileterField.Delete
End Sub
Private Sub cmdFileterFieldAdd_Click()
  On Error Resume Next
    Dim gu As Object
    Dim u As Object
If gridFilterFieldGroup.ItemCount = 0 Then Exit Sub
    Dim bm
    bm = gridFilterFieldGroup.RowBookmark(gridFilterFieldGroup.RowIndex(gridFilterFieldGroup.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set u = gu.FileterField.Add()
   Call GetNumValue(u, "sequence", "{E7F3EE01-4EC4-41D2-8657-BA22089DE0E5}", Now, "%P", "")

      Set frmFileterField_.Item = u
again:       frmFileterField_.NotFirstTime = False
      frmFileterField_.OnInit
      frmFileterField_.Show vbModal
      If frmFileterField_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridFileterField.ItemCount = gu.FileterField.Count
        gridFileterField.Refresh
        gridFileterField.RefreshGroups
        gridFileterField.RefreshSort
        gridFileterField.MoveToBookmark u.ID & "FileterField"
      Else
        gu.FileterField.Delete u.ID
        gu.FileterField.Remove u.ID
      End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridFilterFieldGroup_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridFilterFieldGroup.ItemCount = 0 Then
  gridFileterField.ItemCount = 0
  Exit Sub
End If
If gridFilterFieldGroup.Row > 0 Then
  If LastRow <> gridFilterFieldGroup.Row And LastRow > 0 Then
    gridFilterFieldGroup.GetRowData(LastRow).RowStyle = "Default"
    gridFilterFieldGroup.GetRowData(gridFilterFieldGroup.Row).RowStyle = "SelectedRow"
  End If
 If gridFilterFieldGroup.RowIndex(gridFilterFieldGroup.Row) > 0 Then
  If LastRow <> gridFilterFieldGroup.Row Or gridFileterField.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridFilterFieldGroup.RowBookmark(gridFilterFieldGroup.RowIndex(gridFilterFieldGroup.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.FileterField.PrepareGrid gridFileterField
  gridFileterField.ItemCount = 0
    LoadGridLayout gridFileterField
    Set fndFileterField = Nothing
    Set fndFileterField = CreateObject("MTZ_JSetup.GridFinder")
    fndFileterField.Init gridFileterField
  gridFileterField.ItemCount = gu.FileterField.Count
  End If
 End If
End If
End Sub
Private Sub gridFileterField_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
    If gridFilterFieldGroup.ItemCount = 0 Then Exit Sub
    If gridFileterField.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridFilterFieldGroup.RowBookmark(gridFilterFieldGroup.RowIndex(gridFilterFieldGroup.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.FileterField.LoadRow gridFileterField, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridFileterField_KeyPress(KeyAscii As Integer)
  If gridFileterField.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndFileterField.FindOnPress KeyAscii
End Sub

Private Sub gridFileterField_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If gridFileterField.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridFileterField.RowBookmark(gridFileterField.RowIndex(gridFileterField.Row))
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
Private Sub gridFileterField_DblClick()
    cmdFileterFieldEdit_Click
End Sub
Private Sub gridFileterField_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridFileterField.ItemCount = 0 Then Exit Sub
 If gridFileterField.Row > 0 Then
   If LastRow <> gridFileterField.Row And LastRow > 0 Then
     gridFileterField.GetRowData(LastRow).RowStyle = "Default"
     gridFileterField.GetRowData(gridFileterField.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuFileterFieldPASTE_Click()
On Error Resume Next
    If gridFilterFieldGroup.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridFilterFieldGroup.RowBookmark(gridFilterFieldGroup.RowIndex(gridFilterFieldGroup.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.FileterField.Add()
    If GetFromBuffer(u) Then
      gridFileterField.ItemCount = u.Parent.Count
    Else
      gu.FileterField.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridFileterField_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdFileterFieldCfg_Click
        End If
    End If
End Sub

Private Sub gridFileterField_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupFileterField
End If
End Sub
Private Sub mnuFileterFieldAdd_click()
   menuActionFileterField = "ADD"
   menuTimerFileterField.Enabled = True
End Sub
Private Sub mnuFileterFieldEdit_click()
   menuActionFileterField = "EDIT"
   menuTimerFileterField.Enabled = True
End Sub
Private Sub mnuFileterFieldDelete_click()
   menuActionFileterField = "DEL"
   menuTimerFileterField.Enabled = True
End Sub
Private Sub mnuFileterFieldOpen_click()
   menuActionFileterField = "RUN"
   menuTimerFileterField.Enabled = True
End Sub
Private Sub mnuFileterFieldRef_click()
   menuActionFileterField = "REF"
   menuTimerFileterField.Enabled = True
End Sub
  Private Sub mnuFileterFieldCOPY_Click()
    On Error Resume Next
    If gridFileterField.ItemCount = 0 Then Exit Sub
    If gridFileterField.Row > 0 Then
     If gridFileterField.RowIndex(gridFileterField.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridFileterField.RowBookmark(gridFileterField.RowIndex(gridFileterField.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuFileterFieldCUT_Click()
    On Error Resume Next
    If gridFileterField.ItemCount = 0 Then Exit Sub
    If gridFileterField.Row > 0 Then
     If gridFileterField.RowIndex(gridFileterField.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridFileterField.RowBookmark(gridFileterField.RowIndex(gridFileterField.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridFileterField.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuFileterFieldCHANGE_Click()
  On Error Resume Next
  If gridFileterField.ItemCount = 0 Then Exit Sub
  If gridFileterField.Row > 0 Then
   If gridFileterField.RowIndex(gridFileterField.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridFileterField.RowBookmark(gridFileterField.RowIndex(gridFileterField.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridFileterField.ItemCount = u.Parent.Count
      gridFileterField.RefreshRowIndex gridFileterField.RowIndex(gridFileterField.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuFileterFieldCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuFileterFieldPrn_click()
   menuActionFileterField = "PRN"
   menuTimerFileterField.Enabled = True
End Sub
Private Sub mnuFileterFieldCfg_click()
   menuActionFileterField = "CFG"
   menuTimerFileterField.Enabled = True
End Sub
Private Sub mnuFileterFieldFind_click()
   menuActionFileterField = "FND"
   menuTimerFileterField.Enabled = True
End Sub
Private Sub mnuFileterFieldAcc_click()
   menuActionFileterField = "ACC"
   menuTimerFileterField.Enabled = True
End Sub
Private Sub menuTimerFileterField_timer()
   menuTimerFileterField.Enabled = False
   If menuActionFileterField = "ADD" Then cmdFileterFieldAdd_Click
   If menuActionFileterField = "EDIT" Then cmdFileterFieldEdit_Click
   If menuActionFileterField = "DEL" Then cmdFileterFieldDel_Click
   If menuActionFileterField = "RUN" Then cmdFileterFieldRun_Click
   If menuActionFileterField = "REF" Then cmdFileterFieldRef_Click
   If menuActionFileterField = "PRN" Then cmdFileterFieldPrn_Click
   If menuActionFileterField = "CFG" Then cmdFileterFieldCfg_Click
   If menuActionFileterField = "FND" Then cmdFileterFieldFnd_Click
   If menuActionFileterField = "ACC" Then cmdFileterFieldAcc_Click
   menuActionFileterField = ""
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

  LoadBtnPictures cmdFilterFieldGroupAdd, cmdFilterFieldGroupAdd.Tag
  LoadBtnPictures cmdFilterFieldGroupEdit, cmdFilterFieldGroupEdit.Tag
  LoadBtnPictures cmdFilterFieldGroupDel, cmdFilterFieldGroupDel.Tag
  LoadBtnPictures cmdFilterFieldGroupRef, cmdFilterFieldGroupRef.Tag
  LoadBtnPictures cmdFilterFieldGroupPrn, cmdFilterFieldGroupPrn.Tag
  LoadBtnPictures cmdFilterFieldGroupFnd, cmdFilterFieldGroupFnd.Tag
  LoadBtnPictures cmdFilterFieldGroupRun, cmdFilterFieldGroupRun.Tag
  LoadBtnPictures cmdFilterFieldGroupAcc, cmdFilterFieldGroupAcc.Tag
  LoadBtnPictures cmdFilterFieldGroupCfg, cmdFilterFieldGroupCfg.Tag
  Item.FilterFieldGroup.PrepareGrid gridFilterFieldGroup
  LoadGridLayout gridFilterFieldGroup
  Set fndFilterFieldGroup = Nothing
  On Error Resume Next
  Set fndFilterFieldGroup = CreateObject("MTZ_JSetup.GridFinder")
  fndFilterFieldGroup.Init gridFilterFieldGroup
  LoadBtnPictures cmdFileterFieldAdd, cmdFileterFieldAdd.Tag
  LoadBtnPictures cmdFileterFieldEdit, cmdFileterFieldEdit.Tag
  LoadBtnPictures cmdFileterFieldDel, cmdFileterFieldDel.Tag
  LoadBtnPictures cmdFileterFieldRef, cmdFileterFieldRef.Tag
  LoadBtnPictures cmdFileterFieldPrn, cmdFileterFieldPrn.Tag
  LoadBtnPictures cmdFileterFieldFnd, cmdFileterFieldFnd.Tag
  LoadBtnPictures cmdFileterFieldCfg, cmdFileterFieldCfg.Tag
  LoadBtnPictures cmdFileterFieldRun, cmdFileterFieldRun.Tag
  LoadBtnPictures cmdFileterFieldAcc, cmdFileterFieldAcc.Tag
  gridFileterField.Columns.Clear
  gridFileterField.ItemCount = 0
  cmdFileterFieldRef_Click
End Sub

'Действие при активизации таба
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

pnlFilterFieldGroup.RestorePosition
  gridFilterFieldGroup_RowColChange gridFilterFieldGroup.Row, -1
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
  pnlFilterFieldGroup.Move 0, 0, UserControl.Width, UserControl.Height
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
  Set fndFilterFieldGroup = Nothing
  Set fndFileterField = Nothing
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





