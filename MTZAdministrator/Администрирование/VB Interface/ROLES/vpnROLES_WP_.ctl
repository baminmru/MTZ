VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.UserControl vpnROLES_WP_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerROLES_ACT 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerROLES_WP 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlROLES_WP 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdROLES_ACTAcc 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   17
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdROLES_ACTRef 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   16
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdROLES_ACTDel 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   15
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdROLES_ACTEdit 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   14
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdROLES_ACTAdd 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   13
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdROLES_ACTAddRoot 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   12
         Tag             =   "NEWROOT.ico"
         ToolTipText     =   "Добавить ветку"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin MSComctlLib.TreeView treeROLES_ACT 
         Height          =   480
         Left            =   3900
         TabIndex        =   11
         Top             =   2760
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
         _Version        =   393217
         HideSelection   =   0   'False
         Indentation     =   132
         LabelEdit       =   1
         LineStyle       =   1
         PathSeparator   =   ""
         Sorted          =   -1  'True
         Style           =   7
         Appearance      =   1
      End
      Begin VB.CommandButton cmdROLES_WPAcc 
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
      Begin MTZ_PANEL.DropButton cmdROLES_WPRun 
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
      Begin VB.CommandButton cmdROLES_WPFnd 
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
      Begin VB.CommandButton cmdROLES_WPCfg 
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
      Begin VB.CommandButton cmdROLES_WPPrn 
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
      Begin VB.CommandButton cmdROLES_WPRef 
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
      Begin VB.CommandButton cmdROLES_WPDel 
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
      Begin VB.CommandButton cmdROLES_WPEdit 
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
      Begin VB.CommandButton cmdROLES_WPAdd 
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
      Begin GridEX20.GridEX gridROLES_WP 
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
         Column(1)       =   "vpnROLES_WP_.ctx":0000
         Column(2)       =   "vpnROLES_WP_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnROLES_WP_.ctx":016C
         FormatStyle(2)  =   "vpnROLES_WP_.ctx":02C8
         FormatStyle(3)  =   "vpnROLES_WP_.ctx":0378
         FormatStyle(4)  =   "vpnROLES_WP_.ctx":042C
         FormatStyle(5)  =   "vpnROLES_WP_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnROLES_WP_.ctx":05BC
      End
   End
   Begin VB.Menu mnuPopupROLES_WP 
      Caption         =   "Меню для Доступные приложения"
      Visible         =   0   'False
      Begin VB.Menu mnuROLES_WPAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuROLES_WPEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuROLES_WPDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuROLES_WPOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuROLES_WPRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuROLES_WPS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuROLES_WPBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuROLES_WPCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuROLES_WPCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuROLES_WPPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuROLES_WPCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuROLES_WPCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuROLES_WPPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuROLES_WPCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuROLES_WPFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuROLES_WPAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupROLES_ACT 
      Caption         =   "Меню для Допустимые действия"
      Visible         =   0   'False
      Begin VB.Menu mnuROLES_ACTAddRoot 
         Caption         =   "Создать ветку"
      End
      Begin VB.Menu mnuROLES_ACTAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuROLES_ACTEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuROLES_ACTDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuROLES_ACTS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuROLES_ACTBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuROLES_ACTCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuROLES_ACTCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuROLES_ACTPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuROLES_ACTCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuROLES_ACTCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuROLES_ACTRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuROLES_ACTAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnROLES_WP_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель для работы со строками раздела Доступные приложения
Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndROLES_WP As Object
Private menuActionROLES_WP As String
Private menuActionROLES_ACT As String





Private Sub pnlROLES_WP_PositionChanged()
  pnlROLES_WP.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridROLES_WP_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdROLES_WPCfg_Click
        End If
    End If
End Sub

Private Sub gridROLES_WP_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupROLES_WP
End If
End Sub
Private Sub mnuROLES_WPAdd_click()
   menuActionROLES_WP = "ADD"
   menuTimerROLES_WP.Enabled = True
End Sub
Private Sub mnuROLES_WPEdit_click()
   menuActionROLES_WP = "EDIT"
   menuTimerROLES_WP.Enabled = True
End Sub
Private Sub mnuROLES_WPDelete_click()
   menuActionROLES_WP = "DEL"
   menuTimerROLES_WP.Enabled = True
End Sub
Private Sub mnuROLES_WPOpen_click()
   menuActionROLES_WP = "RUN"
   menuTimerROLES_WP.Enabled = True
End Sub
Private Sub mnuROLES_WPRef_click()
   menuActionROLES_WP = "REF"
   menuTimerROLES_WP.Enabled = True
End Sub
  Private Sub mnuROLES_WPCOPY_Click()
    On Error Resume Next
    If gridROLES_WP.ItemCount = 0 Then Exit Sub
    If gridROLES_WP.Row > 0 Then
     If gridROLES_WP.RowIndex(gridROLES_WP.Row) > 0 Then
        Dim u As Object
        Dim BM
        BM = gridROLES_WP.RowBookmark(gridROLES_WP.RowIndex(gridROLES_WP.Row))
        Set u = Item.FindRowObject(Right(BM, Len(BM) - 38), Left(BM, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuROLES_WPCUT_Click()
    On Error Resume Next
    If gridROLES_WP.ItemCount = 0 Then Exit Sub
    If gridROLES_WP.Row > 0 Then
     If gridROLES_WP.RowIndex(gridROLES_WP.Row) > 0 Then
        Dim u As Object
        Dim BM
        BM = gridROLES_WP.RowBookmark(gridROLES_WP.RowIndex(gridROLES_WP.Row))
        Set u = Item.FindRowObject(Right(BM, Len(BM) - 38), Left(BM, 38))
        SaveToBuffer u
        Set BM = u.Parent
        u.Parent.Delete u.ID
        gridROLES_WP.ItemCount = BM.Count
      End If
    End If
  End Sub
Private Sub mnuROLES_WPCHANGE_Click()
  On Error Resume Next
  If gridROLES_WP.ItemCount = 0 Then Exit Sub
  If gridROLES_WP.Row > 0 Then
   If gridROLES_WP.RowIndex(gridROLES_WP.Row) > 0 Then
    Dim u As Object
    Dim BM
    BM = gridROLES_WP.RowBookmark(gridROLES_WP.RowIndex(gridROLES_WP.Row))
    Set u = Item.FindRowObject(Right(BM, Len(BM) - 38), Left(BM, 38))
    If GetFromBuffer(u) Then
      gridROLES_WP.ItemCount = u.Parent.Count
      gridROLES_WP.RefreshRowIndex gridROLES_WP.RowIndex(gridROLES_WP.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuROLES_WPCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuROLES_WPPrn_click()
   menuActionROLES_WP = "PRN"
   menuTimerROLES_WP.Enabled = True
End Sub
Private Sub mnuROLES_WPCfg_click()
   menuActionROLES_WP = "CFG"
   menuTimerROLES_WP.Enabled = True
End Sub
Private Sub mnuROLES_WPFind_click()
   menuActionROLES_WP = "FND"
   menuTimerROLES_WP.Enabled = True
End Sub
Private Sub mnuROLES_WPAcc_click()
   menuActionROLES_WP = "ACC"
   menuTimerROLES_WP.Enabled = True
End Sub
Private Sub menuTimerROLES_WP_timer()
   menuTimerROLES_WP.Enabled = False
   If menuActionROLES_WP = "ADD" Then cmdROLES_WPAdd_Click
   If menuActionROLES_WP = "EDIT" Then cmdROLES_WPEdit_Click
   If menuActionROLES_WP = "DEL" Then cmdROLES_WPDel_Click
   If menuActionROLES_WP = "RUN" Then cmdROLES_WPRun_Click
   If menuActionROLES_WP = "REF" Then cmdROLES_WPRef_Click
   If menuActionROLES_WP = "PRN" Then cmdROLES_WPPrn_Click
   If menuActionROLES_WP = "CFG" Then cmdROLES_WPCfg_Click
   If menuActionROLES_WP = "FND" Then cmdROLES_WPFnd_Click
   If menuActionROLES_WP = "ACC" Then cmdROLES_WPAcc_Click
   menuActionROLES_WP = ""
End Sub
Private Sub cmdROLES_WPCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridROLES_WP, "gridROLES_WP"
Set jset = Nothing
End Sub

Private Sub cmdROLES_WPPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridROLES_WP, "Доступные приложения"
Set jset = Nothing
End Sub

Private Sub cmdROLES_WPRef_Click()
  On Error Resume Next
  Item.ROLES_WP.Refresh
  gridROLES_WP.ItemCount = Item.ROLES_WP.Count
  gridROLES_WP.Refetch
  gridROLES_WP.Refresh
End Sub
Private Sub cmdROLES_WPAcc_Click()
On Error Resume Next
If gridROLES_WP.ItemCount = 0 Then Exit Sub
If gridROLES_WP.Row > 0 Then
 If gridROLES_WP.RowIndex(gridROLES_WP.Row) > 0 Then
    Dim u As Object
    Dim BM
    BM = gridROLES_WP.RowBookmark(gridROLES_WP.RowIndex(gridROLES_WP.Row))
    Set u = Item.FindRowObject(Right(BM, Len(BM) - 38), Left(BM, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdROLES_WPEdit_Click()
  On Error Resume Next
If gridROLES_WP.ItemCount = 0 Then Exit Sub
If gridROLES_WP.Row > 0 Then
 If gridROLES_WP.RowIndex(gridROLES_WP.Row) > 0 Then
    Dim u As Object
    Dim BM
    BM = gridROLES_WP.RowBookmark(gridROLES_WP.RowIndex(gridROLES_WP.Row))
    Set u = Item.FindRowObject(Right(BM, Len(BM) - 38), Left(BM, 38))
    Set frmROLES_WP_.Item = u
again:     frmROLES_WP_.NotFirstTime = False
    frmROLES_WP_.OnInit
    frmROLES_WP_.Show vbModal
    If frmROLES_WP_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridROLES_WP.RefreshRowBookmark BM
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdROLES_WPDel_Click()
  On Error Resume Next
  gridROLES_WP.Delete
End Sub
Private Sub cmdROLES_WPAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.ROLES_WP.Add()

      Set frmROLES_WP_.Item = u
again:       frmROLES_WP_.NotFirstTime = False
      frmROLES_WP_.OnInit
      frmROLES_WP_.Show vbModal
      If frmROLES_WP_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridROLES_WP.ItemCount = Item.ROLES_WP.Count
        gridROLES_WP.Refresh
        gridROLES_WP.RefreshGroups
        gridROLES_WP.RefreshSort
        gridROLES_WP.MoveToBookmark u.ID & "ROLES_WP"
      Else
        Item.ROLES_WP.Delete u.ID
        Item.ROLES_WP.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdROLES_WPFnd_Click()
  On Error Resume Next
  fndROLES_WP.ShowForm
End Sub
Private Sub cmdROLES_WPRun_Click()
  On Error Resume Next
  gridROLES_WP_DblClick
End Sub
Private Sub gridROLES_WP_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.ROLES_WP.LoadRow gridROLES_WP, RowIndex, Bookmark, Values
End Sub
Private Sub gridROLES_WP_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridROLES_WP.ItemCount = 0 Then Exit Sub
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
Private Sub gridROLES_WP_DblClick()
  cmdROLES_WPEdit_Click
End Sub
Private Sub gridROLES_WP_KeyPress(KeyAscii As Integer)
  If gridROLES_WP.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndROLES_WP.FindOnPress KeyAscii
End Sub

Private Sub pnlROLES_WP_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridROLES_WP.Left = Left
  gridROLES_WP.Top = Top + 25 * Screen.TwipsPerPixelY
  gridROLES_WP.Width = Width
  gridROLES_WP.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdROLES_WPAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_WPEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_WPDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_WPRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_WPPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_WPCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_WPFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_WPRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_WPAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_WPAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdROLES_WPEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdROLES_WPDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdROLES_WPRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdROLES_WPPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdROLES_WPCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdROLES_WPFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdROLES_WPRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdROLES_WPAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuROLES_WPPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.ROLES_WP.Add()
    If GetFromBuffer(u) Then
      gridROLES_WP.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub pnlROLES_WP_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  treeROLES_ACT.Left = Left
  treeROLES_ACT.Top = Top + 25 * Screen.TwipsPerPixelY
  treeROLES_ACT.Width = Width
  treeROLES_ACT.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdROLES_ACTAddRoot.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdROLES_ACTAdd.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdROLES_ACTEdit.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdROLES_ACTDel.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdROLES_ACTRef.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdROLES_ACTAcc.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdROLES_ACTAddRoot.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_ACTAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_ACTEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_ACTDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_ACTRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_ACTAcc.Top = Top + 2 * Screen.TwipsPerPixelY
End Sub
Private Sub treeROLES_ACT_DblClick()
If treeROLES_ACT.SelectedItem Is Nothing Then Exit Sub
  Dim f As Object
  Set f = Item.FindRowObject("ROLES_ACT", Left(treeROLES_ACT.SelectedItem.Key, 38))
  Set frmROLES_ACT_.Item = f
again:   frmROLES_ACT_.NotFirstTime = False
  frmROLES_ACT_.OnInit
  frmROLES_ACT_.Show vbModal
  If frmROLES_ACT_.OK Then
    On Error Resume Next
    err.Clear
    f.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    treeROLES_ACT.SelectedItem.Text = f.brief(True)
    Else
     f.Refresh
  End If
End Sub

Private Sub treeROLES_ACT_Expand(ByVal Node As MSComctlLib.Node)
If Node.Child.Tag = "ToDelete" Then
 ParentForm.MousePointer = vbHourglass
 treeROLES_ACT.Nodes.Remove Node.Child.Index
 Dim f As Object
 Set f = Item.FindRowObject("ROLES_ACT", Left(Node.Key, 38))
 f.expandpart treeROLES_ACT, Node.Key
 ParentForm.MousePointer = vbNormal
End If
End Sub

Private Sub cmdROLES_ACTAdd_Click()
  On Error Resume Next
Dim f As Object, p As Object
If (treeROLES_ACT.SelectedItem Is Nothing) Then Exit Sub
  Set p = Item.FindRowObject("ROLES_ACT", Left(treeROLES_ACT.SelectedItem.Key, 38))
  Set f = p.ROLES_ACT.Add()

      Set frmROLES_ACT_.Item = f
again:       frmROLES_ACT_.NotFirstTime = False
      frmROLES_ACT_.OnInit
      frmROLES_ACT_.Show vbModal
      If frmROLES_ACT_.OK Then
        err.Clear
        f.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
          If treeROLES_ACT.SelectedItem.Child.Tag <> "ToDelete" Then
            f.LoadToTree treeROLES_ACT, treeROLES_ACT.SelectedItem.Key
          End If
          Set treeROLES_ACT.SelectedItem = treeROLES_ACT.Nodes.Item(f.ID & "ROLES_ACT")
      Else
        p.ROLES_ACT.Delete f.ID
        p.ROLES_ACT.Remove f.ID
      End If
End Sub

Private Sub cmdROLES_ACTAddRoot_Click()
  On Error Resume Next
If gridROLES_WP.ItemCount = 0 Then Exit Sub
  Dim gu As Object
  Dim f As Object, p As Object
  Dim BM
  BM = gridROLES_WP.RowBookmark(gridROLES_WP.RowIndex(gridROLES_WP.Row))
  Set p = Item.FindRowObject(Right(BM, Len(BM) - 38), Left(BM, 38))
  Set f = p.ROLES_ACT.Add()

      Set frmROLES_ACT_.Item = f
again:       frmROLES_ACT_.NotFirstTime = False
      frmROLES_ACT_.OnInit
      frmROLES_ACT_.Show vbModal
      If frmROLES_ACT_.OK Then
        err.Clear
        f.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
          Item.ROLES_ACT.Refresh
          treeROLES_ACT.Nodes.Clear
          Item.ROLES_ACT.filltree treeROLES_ACT
      Else
        Item.ROLES_WP.Remove f.ID
      End If
    p.LoadToTree treeROLES_ACT, ""
    Set p = Nothing
    Set gu = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub

Private Sub cmdROLES_ACTEdit_Click()
  On Error Resume Next
  Dim f As Object
  If treeROLES_ACT.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("ROLES_ACT", Left(treeROLES_ACT.SelectedItem.Key, 38))
  Set frmROLES_ACT_.Item = f
again:   frmROLES_ACT_.NotFirstTime = False
  frmROLES_ACT_.OnInit
  frmROLES_ACT_.Show vbModal
  If frmROLES_ACT_.OK Then
    err.Clear
    f.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
  End If
End Sub

Private Sub cmdROLES_ACTDel_Click()
  On Error Resume Next
  Dim f As Object
  If treeROLES_ACT.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("ROLES_ACT", Left(treeROLES_ACT.SelectedItem.Key, 38))
  If MsgBox("Удалить элемент" & vbCrLf & f.brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
  On Error GoTo bye
     If f.Parent.Delete(f.ID) Then
       treeROLES_ACT.Nodes.Remove treeROLES_ACT.SelectedItem.Key
     End If
  End If
 Exit Sub
bye:
 MsgBox err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub

Private Sub cmdROLES_ACTAcc_Click()
  On Error Resume Next
  Dim f As Object
  If treeROLES_ACT.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("ROLES_ACT", Left(treeROLES_ACT.SelectedItem.Key, 38))
  Item.Application.Manager.ShowSecurityDialog f
End Sub

Private Sub cmdROLES_ACTREf_Click()
  On Error Resume Next
  ROLES_ACT_reinit
End Sub

Private Sub gridROLES_WP_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridROLES_WP.Row And LastRow > 0 Then
  gridROLES_WP.GetRowData(LastRow).RowStyle = "Default"
  gridROLES_WP.GetRowData(gridROLES_WP.Row).RowStyle = "SelectedRow"
End If
  ROLES_ACT_reinit
End Sub
Private Sub ROLES_ACT_reinit()
  If gridROLES_WP.ItemCount = 0 Then
    treeROLES_ACT.Nodes.Clear
  Else
    Dim gu As Object
    Dim BM
    BM = gridROLES_WP.RowBookmark(gridROLES_WP.RowIndex(gridROLES_WP.Row))
    Set gu = Item.FindRowObject(Right(BM, Len(BM) - 38), Left(BM, 38))
    If gu Is Nothing Then Exit Sub
    gu.ROLES_ACT.Refresh
    treeROLES_ACT.Nodes.Clear
    gu.ROLES_ACT.filltree treeROLES_ACT
  End If
End Sub

Private Sub treeROLES_ACT_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupROLES_ACT
End If
End Sub
Private Sub mnuROLES_ACTAddRoot_click()
   menuActionROLES_ACT = "ADDROOT"
   menuTimerROLES_ACT.Enabled = True
End Sub
Private Sub mnuROLES_ACTAdd_click()
   menuActionROLES_ACT = "ADD"
   menuTimerROLES_ACT.Enabled = True
End Sub
Private Sub mnuROLES_ACTEdit_click()
   menuActionROLES_ACT = "EDIT"
   menuTimerROLES_ACT.Enabled = True
End Sub
Private Sub mnuROLES_ACTDelete_click()
   menuActionROLES_ACT = "DEL"
   menuTimerROLES_ACT.Enabled = True
End Sub
  Private Sub mnuROLES_ACTCOPY_Click()
    On Error Resume Next
    If treeROLES_ACT.SelectedItem Is Nothing Then Exit Sub
        Dim u As Object
        Set u = Item.FindRowObject("ROLES_ACT", Left(treeROLES_ACT.SelectedItem.Key, 38))
        SaveToBuffer u
  End Sub
  Private Sub mnuROLES_ACTCUT_Click()
    On Error Resume Next
    If treeROLES_ACT.SelectedItem Is Nothing Then Exit Sub
    Dim u As Object, BM
    Set u = Item.FindRowObject("ROLES_ACT", Left(treeROLES_ACT.SelectedItem.Key, 38))
    SaveToBuffer u
    Set BM = u.Parent
    u.Parent.Delete u.ID
    treeROLES_ACT.Nodes.Remove treeROLES_ACT.SelectedItem.Key
  End Sub
Private Sub mnuROLES_ACTPASTE_Click()
On Error Resume Next
If treeROLES_ACT.SelectedItem Is Nothing Then Exit Sub
  Dim u As Object, f As Object
  Set f = Item.FindRowObject("ROLES_ACT", Left(treeROLES_ACT.SelectedItem.Key, 38))
  Set u = f.ROLES_ACT.Add()
  If GetFromBuffer(u) Then
    If treeROLES_ACT.SelectedItem.Child.Tag <> "ToDelete" Then
      u.LoadToTree treeROLES_ACT, treeROLES_ACT.SelectedItem.Key
    End If
  Else
   f.ROLES_ACT.Refresh
  End If
End Sub
Private Sub mnuROLES_ACTCHANGE_Click()
  On Error Resume Next
  If treeROLES_ACT.SelectedItem Is Nothing Then Exit Sub
  Dim u As Object, BM
  Set u = Item.FindRowObject("ROLES_ACT", Left(treeROLES_ACT.SelectedItem.Key, 38))
  If GetFromBuffer(u) Then
    treeROLES_ACT.SelectedItem.Text = u.brief
      treeROLES_ACT.SelectedItem.Expanded = False
      While treeROLES_ACT.SelectedItem.Children > 0
        treeROLES_ACT.Nodes.Remove treeROLES_ACT.SelectedItem.Child.Key
      Wend
      treeROLES_ACT.Nodes.Add(treeROLES_ACT.SelectedItem.Key, 4, "Expanding ...").Tag = "ToDelete"
      treeROLES_ACT_Expand treeROLES_ACT.SelectedItem
  End If
End Sub
  Private Sub mnuROLES_ACTCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuROLES_ACTRef_click()
   menuActionROLES_ACT = "REF"
   menuTimerROLES_ACT.Enabled = True
End Sub
Private Sub mnuROLES_ACTAcc_click()
   menuActionROLES_ACT = "ACC"
   menuTimerROLES_ACT.Enabled = True
End Sub
Private Sub menuTimerROLES_ACT_timer()
   menuTimerROLES_ACT.Enabled = False
   If menuActionROLES_ACT = "ADDROOT" Then cmdROLES_ACTAddRoot_Click
   If menuActionROLES_ACT = "ADD" Then cmdROLES_ACTAdd_Click
   If menuActionROLES_ACT = "EDIT" Then cmdROLES_ACTEdit_Click
   If menuActionROLES_ACT = "DEL" Then cmdROLES_ACTDel_Click
   If menuActionROLES_ACT = "REF" Then cmdROLES_ACTREf_Click
   If menuActionROLES_ACT = "ACC" Then cmdROLES_ACTAcc_Click
   menuActionROLES_ACT = ""
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

  LoadBtnPictures cmdROLES_WPAdd, cmdROLES_WPAdd.Tag
  LoadBtnPictures cmdROLES_WPEdit, cmdROLES_WPEdit.Tag
  LoadBtnPictures cmdROLES_WPDel, cmdROLES_WPDel.Tag
  LoadBtnPictures cmdROLES_WPRef, cmdROLES_WPRef.Tag
  LoadBtnPictures cmdROLES_WPPrn, cmdROLES_WPPrn.Tag
  LoadBtnPictures cmdROLES_WPFnd, cmdROLES_WPFnd.Tag
  LoadBtnPictures cmdROLES_WPRun, cmdROLES_WPRun.Tag
  LoadBtnPictures cmdROLES_WPAcc, cmdROLES_WPAcc.Tag
  LoadBtnPictures cmdROLES_WPCfg, cmdROLES_WPCfg.Tag
  Item.ROLES_WP.PrepareGrid gridROLES_WP
  LoadGridLayout gridROLES_WP
  Set fndROLES_WP = Nothing
  On Error Resume Next
  Set fndROLES_WP = CreateObject("MTZ_JSetup.GridFinder")
  fndROLES_WP.Init gridROLES_WP
  LoadBtnPictures cmdROLES_ACTAddRoot, cmdROLES_ACTAddRoot.Tag
  LoadBtnPictures cmdROLES_ACTAdd, cmdROLES_ACTAdd.Tag
  LoadBtnPictures cmdROLES_ACTEdit, cmdROLES_ACTEdit.Tag
  LoadBtnPictures cmdROLES_ACTDel, cmdROLES_ACTDel.Tag
  LoadBtnPictures cmdROLES_ACTRef, cmdROLES_ACTRef.Tag
  LoadBtnPictures cmdROLES_ACTAcc, cmdROLES_ACTAcc.Tag
 ROLES_ACT_reinit
End Sub

'Действие при активизации таба
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

pnlROLES_WP.RestorePosition
 ROLES_ACT_reinit
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
  pnlROLES_WP.Move 0, 0, UserControl.Width, UserControl.Height
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
  Set fndROLES_WP = Nothing
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





