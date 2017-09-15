VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnMTZAPP_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerParentPackage 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerMTZAPP 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlMTZAPP 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdParentPackageAcc 
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
      Begin MTZ_PANEL.DropButton cmdParentPackageRun 
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
      Begin VB.CommandButton cmdParentPackageFnd 
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
      Begin VB.CommandButton cmdParentPackageCfg 
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
      Begin VB.CommandButton cmdParentPackagePrn 
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
      Begin VB.CommandButton cmdParentPackageRef 
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
      Begin VB.CommandButton cmdParentPackageDel 
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
      Begin VB.CommandButton cmdParentPackageEdit 
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
      Begin VB.CommandButton cmdParentPackageAdd 
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
      Begin GridEX20.GridEX gridParentPackage 
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
         Column(1)       =   "vpnMTZAPP_.ctx":0000
         Column(2)       =   "vpnMTZAPP_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnMTZAPP_.ctx":016C
         FormatStyle(2)  =   "vpnMTZAPP_.ctx":02C8
         FormatStyle(3)  =   "vpnMTZAPP_.ctx":0378
         FormatStyle(4)  =   "vpnMTZAPP_.ctx":042C
         FormatStyle(5)  =   "vpnMTZAPP_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnMTZAPP_.ctx":05BC
      End
      Begin VB.CommandButton cmdMTZAPPAcc 
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
      Begin MTZ_PANEL.DropButton cmdMTZAPPRun 
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
      Begin VB.CommandButton cmdMTZAPPFnd 
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
      Begin VB.CommandButton cmdMTZAPPCfg 
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
      Begin VB.CommandButton cmdMTZAPPPrn 
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
      Begin VB.CommandButton cmdMTZAPPRef 
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
      Begin VB.CommandButton cmdMTZAPPDel 
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
      Begin VB.CommandButton cmdMTZAPPEdit 
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
      Begin VB.CommandButton cmdMTZAPPAdd 
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
      Begin GridEX20.GridEX gridMTZAPP 
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
         Column(1)       =   "vpnMTZAPP_.ctx":0794
         Column(2)       =   "vpnMTZAPP_.ctx":085C
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnMTZAPP_.ctx":0900
         FormatStyle(2)  =   "vpnMTZAPP_.ctx":0A5C
         FormatStyle(3)  =   "vpnMTZAPP_.ctx":0B0C
         FormatStyle(4)  =   "vpnMTZAPP_.ctx":0BC0
         FormatStyle(5)  =   "vpnMTZAPP_.ctx":0C98
         ImageCount      =   0
         PrinterProperties=   "vpnMTZAPP_.ctx":0D50
      End
   End
   Begin VB.Menu mnuPopupMTZAPP 
      Caption         =   "Меню для Приложение"
      Visible         =   0   'False
      Begin VB.Menu mnuMTZAPPAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuMTZAPPEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuMTZAPPDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuMTZAPPOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuMTZAPPRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuMTZAPPS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuMTZAPPBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuMTZAPPCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuMTZAPPCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuMTZAPPPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuMTZAPPCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuMTZAPPCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuMTZAPPPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuMTZAPPCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuMTZAPPFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuMTZAPPAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupParentPackage 
      Caption         =   "Меню для Обязательные приложения"
      Visible         =   0   'False
      Begin VB.Menu mnuParentPackageAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuParentPackageEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuParentPackageDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuParentPackageOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuParentPackageRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuParentPackageS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuParentPackageBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuParentPackageCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuParentPackageCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuParentPackagePASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuParentPackageCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuParentPackageCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuParentPackagePrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuParentPackageCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuParentPackageFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuParentPackageAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnMTZAPP_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель для работы со строками раздела Группа взаимосвязных документов
Public item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndMTZAPP As Object
Private menuActionMTZAPP As String
Private fndParentPackage As Object
Private menuActionParentPackage As String





Private Sub pnlMTZAPP_PositionChanged()
  pnlMTZAPP.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridMTZAPP_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdMTZAPPCfg_Click
        End If
    End If
End Sub

Private Sub gridMTZAPP_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupMTZAPP
End If
End Sub
Private Sub mnuMTZAPPAdd_click()
   menuActionMTZAPP = "ADD"
   menuTimerMTZAPP.Enabled = True
End Sub
Private Sub mnuMTZAPPEdit_click()
   menuActionMTZAPP = "EDIT"
   menuTimerMTZAPP.Enabled = True
End Sub
Private Sub mnuMTZAPPDelete_click()
   menuActionMTZAPP = "DEL"
   menuTimerMTZAPP.Enabled = True
End Sub
Private Sub mnuMTZAPPOpen_click()
   menuActionMTZAPP = "RUN"
   menuTimerMTZAPP.Enabled = True
End Sub
Private Sub mnuMTZAPPRef_click()
   menuActionMTZAPP = "REF"
   menuTimerMTZAPP.Enabled = True
End Sub
  Private Sub mnuMTZAPPCOPY_Click()
    On Error Resume Next
    If gridMTZAPP.ItemCount = 0 Then Exit Sub
    If gridMTZAPP.Row > 0 Then
     If gridMTZAPP.RowIndex(gridMTZAPP.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridMTZAPP.RowBookmark(gridMTZAPP.RowIndex(gridMTZAPP.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuMTZAPPCUT_Click()
    On Error Resume Next
    If gridMTZAPP.ItemCount = 0 Then Exit Sub
    If gridMTZAPP.Row > 0 Then
     If gridMTZAPP.RowIndex(gridMTZAPP.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridMTZAPP.RowBookmark(gridMTZAPP.RowIndex(gridMTZAPP.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridMTZAPP.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuMTZAPPCHANGE_Click()
  On Error Resume Next
  If gridMTZAPP.ItemCount = 0 Then Exit Sub
  If gridMTZAPP.Row > 0 Then
   If gridMTZAPP.RowIndex(gridMTZAPP.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridMTZAPP.RowBookmark(gridMTZAPP.RowIndex(gridMTZAPP.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridMTZAPP.ItemCount = u.Parent.Count
      gridMTZAPP.RefreshRowIndex gridMTZAPP.RowIndex(gridMTZAPP.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuMTZAPPCLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuMTZAPPPrn_click()
   menuActionMTZAPP = "PRN"
   menuTimerMTZAPP.Enabled = True
End Sub
Private Sub mnuMTZAPPCfg_click()
   menuActionMTZAPP = "CFG"
   menuTimerMTZAPP.Enabled = True
End Sub
Private Sub mnuMTZAPPFind_click()
   menuActionMTZAPP = "FND"
   menuTimerMTZAPP.Enabled = True
End Sub
Private Sub mnuMTZAPPAcc_click()
   menuActionMTZAPP = "ACC"
   menuTimerMTZAPP.Enabled = True
End Sub
Private Sub menuTimerMTZAPP_timer()
   menuTimerMTZAPP.Enabled = False
   If menuActionMTZAPP = "ADD" Then cmdMTZAPPAdd_Click
   If menuActionMTZAPP = "EDIT" Then cmdMTZAPPEdit_Click
   If menuActionMTZAPP = "DEL" Then cmdMTZAPPDel_Click
   If menuActionMTZAPP = "RUN" Then cmdMTZAPPRun_Click
   If menuActionMTZAPP = "REF" Then cmdMTZAPPRef_Click
   If menuActionMTZAPP = "PRN" Then cmdMTZAPPPrn_Click
   If menuActionMTZAPP = "CFG" Then cmdMTZAPPCfg_Click
   If menuActionMTZAPP = "FND" Then cmdMTZAPPFnd_Click
   If menuActionMTZAPP = "ACC" Then cmdMTZAPPAcc_Click
   menuActionMTZAPP = ""
End Sub
Private Sub cmdMTZAPPCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridMTZAPP, "gridMTZAPP"
Set jset = Nothing
End Sub

Private Sub cmdMTZAPPPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridMTZAPP, "Приложение"
Set jset = Nothing
End Sub

Private Sub cmdMTZAPPRef_Click()
  On Error Resume Next
  item.MTZAPP.Refresh
  gridMTZAPP.ItemCount = item.MTZAPP.Count
  gridMTZAPP.Refetch
  gridMTZAPP.Refresh
End Sub
Private Sub cmdMTZAPPAcc_Click()
On Error Resume Next
If gridMTZAPP.ItemCount = 0 Then Exit Sub
If gridMTZAPP.Row > 0 Then
 If gridMTZAPP.RowIndex(gridMTZAPP.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridMTZAPP.RowBookmark(gridMTZAPP.RowIndex(gridMTZAPP.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdMTZAPPEdit_Click()
  On Error Resume Next
If gridMTZAPP.ItemCount = 0 Then Exit Sub
If gridMTZAPP.Row > 0 Then
 If gridMTZAPP.RowIndex(gridMTZAPP.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridMTZAPP.RowBookmark(gridMTZAPP.RowIndex(gridMTZAPP.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmMTZAPP_.item = u
again:     frmMTZAPP_.NotFirstTime = False
    frmMTZAPP_.OnInit
    frmMTZAPP_.Show vbModal
    If frmMTZAPP_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridMTZAPP.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdMTZAPPDel_Click()
  On Error Resume Next
  gridMTZAPP.Delete
End Sub
Private Sub cmdMTZAPPAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = item.MTZAPP.Add()

      Set frmMTZAPP_.item = u
again:       frmMTZAPP_.NotFirstTime = False
      frmMTZAPP_.OnInit
      frmMTZAPP_.Show vbModal
      If frmMTZAPP_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridMTZAPP.ItemCount = item.MTZAPP.Count
        gridMTZAPP.Refresh
        gridMTZAPP.RefreshGroups
        gridMTZAPP.RefreshSort
        gridMTZAPP.MoveToBookmark u.ID & "MTZAPP"
      Else
        item.MTZAPP.Delete u.ID
        item.MTZAPP.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdMTZAPPFnd_Click()
  On Error Resume Next
  fndMTZAPP.ShowForm
End Sub
Private Sub cmdMTZAPPRun_Click()
  On Error Resume Next
  gridMTZAPP_DblClick
End Sub
Private Sub gridMTZAPP_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
item.MTZAPP.LoadRow gridMTZAPP, RowIndex, Bookmark, Values
End Sub
Private Sub gridMTZAPP_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridMTZAPP.ItemCount = 0 Then Exit Sub
  Dim u As Object
  On Error Resume Next
  Set u = item.FindRowObject(Right(Bookmark, Len(Bookmark) - 38), Left(Bookmark, 38))
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
Private Sub gridMTZAPP_DblClick()
  cmdMTZAPPEdit_Click
End Sub
Private Sub gridMTZAPP_KeyPress(KeyAscii As Integer)
  If gridMTZAPP.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndMTZAPP.FindOnPress KeyAscii
End Sub

Private Sub pnlMTZAPP_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridMTZAPP.Left = Left
  gridMTZAPP.Top = Top + 25 * Screen.TwipsPerPixelY
  gridMTZAPP.Width = Width
  gridMTZAPP.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdMTZAPPAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZAPPEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZAPPDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZAPPRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZAPPPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZAPPCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZAPPFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZAPPRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZAPPAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZAPPAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdMTZAPPEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdMTZAPPDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdMTZAPPRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdMTZAPPPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdMTZAPPCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdMTZAPPFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdMTZAPPRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdMTZAPPAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuMTZAPPPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = item.MTZAPP.Add()
    If GetFromBuffer(u) Then
      gridMTZAPP.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdParentPackageCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridParentPackage, "gridParentPackage"
Set jset = Nothing
End Sub

Private Sub cmdParentPackagePrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridParentPackage, "Обязательные приложения"
Set jset = Nothing
End Sub

Private Sub cmdParentPackageAcc_Click()
On Error Resume Next
If gridParentPackage.ItemCount = 0 Then Exit Sub
If gridParentPackage.Row > 0 Then
 If gridParentPackage.RowIndex(gridParentPackage.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridParentPackage.RowBookmark(gridParentPackage.RowIndex(gridParentPackage.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdParentPackageFnd_Click()
  On Error Resume Next
  fndParentPackage.ShowForm
End Sub
Private Sub cmdParentPackageRun_Click()
  On Error Resume Next
  gridParentPackage_DblClick
End Sub
Private Sub pnlMTZAPP_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridParentPackage.Left = Left
  gridParentPackage.Top = Top + 25 * Screen.TwipsPerPixelY
  gridParentPackage.Width = Width
  gridParentPackage.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdParentPackageAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdParentPackageEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdParentPackageDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdParentPackageRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdParentPackagePrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdParentPackageCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdParentPackageFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdParentPackageRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdParentPackageAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdParentPackageAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdParentPackageEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdParentPackageDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdParentPackageRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdParentPackagePrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdParentPackageCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdParentPackageFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdParentPackageRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdParentPackageAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdParentPackageRef_Click()
  On Error Resume Next
If gridMTZAPP.ItemCount = 0 Then Exit Sub
If gridMTZAPP.Row > 0 Then
 If gridMTZAPP.RowIndex(gridMTZAPP.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridMTZAPP.RowBookmark(gridMTZAPP.RowIndex(gridMTZAPP.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.ParentPackage.Refresh
   gridParentPackage.ItemCount = gu.ParentPackage.Count
   gridParentPackage.Refetch
   gridParentPackage.Refresh
 Else
  gridParentPackage.Columns.Clear
  gridParentPackage.ItemCount = 0
 End If
Else
 gridParentPackage.Columns.Clear
 gridParentPackage.ItemCount = 0
End If
End Sub
Private Sub cmdParentPackageEdit_Click()
    If gridParentPackage.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridParentPackage.RowBookmark(gridParentPackage.RowIndex(gridParentPackage.Row))
    Set u = item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmParentPackage_.item = u
again:     frmParentPackage_.NotFirstTime = False
    frmParentPackage_.OnInit
    frmParentPackage_.Show vbModal
    If frmParentPackage_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridParentPackage.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdParentPackageDel_Click()
  On Error Resume Next
  gridParentPackage.Delete
End Sub
Private Sub cmdParentPackageAdd_Click()
  On Error Resume Next
    Dim gu As Object
    Dim u As Object
If gridMTZAPP.ItemCount = 0 Then Exit Sub
    Dim bm
    bm = gridMTZAPP.RowBookmark(gridMTZAPP.RowIndex(gridMTZAPP.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set u = gu.ParentPackage.Add()

      Set frmParentPackage_.item = u
again:       frmParentPackage_.NotFirstTime = False
      frmParentPackage_.OnInit
      frmParentPackage_.Show vbModal
      If frmParentPackage_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridParentPackage.ItemCount = gu.ParentPackage.Count
        gridParentPackage.Refresh
        gridParentPackage.RefreshGroups
        gridParentPackage.RefreshSort
        gridParentPackage.MoveToBookmark u.ID & "ParentPackage"
      Else
        gu.ParentPackage.Delete u.ID
        gu.ParentPackage.Remove u.ID
      End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridMTZAPP_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridMTZAPP.ItemCount = 0 Then
  gridParentPackage.ItemCount = 0
  Exit Sub
End If
If gridMTZAPP.Row > 0 Then
  If LastRow <> gridMTZAPP.Row And LastRow > 0 Then
    gridMTZAPP.GetRowData(LastRow).RowStyle = "Default"
    gridMTZAPP.GetRowData(gridMTZAPP.Row).RowStyle = "SelectedRow"
  End If
 If gridMTZAPP.RowIndex(gridMTZAPP.Row) > 0 Then
  If LastRow <> gridMTZAPP.Row Or gridParentPackage.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridMTZAPP.RowBookmark(gridMTZAPP.RowIndex(gridMTZAPP.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.ParentPackage.PrepareGrid gridParentPackage
  gridParentPackage.ItemCount = 0
    LoadGridLayout gridParentPackage
    Set fndParentPackage = Nothing
    Set fndParentPackage = CreateObject("MTZ_JSetup.GridFinder")
    fndParentPackage.Init gridParentPackage
  gridParentPackage.ItemCount = gu.ParentPackage.Count
  End If
 End If
End If
End Sub
Private Sub gridParentPackage_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
    If gridMTZAPP.ItemCount = 0 Then Exit Sub
    If gridParentPackage.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridMTZAPP.RowBookmark(gridMTZAPP.RowIndex(gridMTZAPP.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.ParentPackage.LoadRow gridParentPackage, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridParentPackage_KeyPress(KeyAscii As Integer)
  If gridParentPackage.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndParentPackage.FindOnPress KeyAscii
End Sub

Private Sub gridParentPackage_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If gridParentPackage.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridParentPackage.RowBookmark(gridParentPackage.RowIndex(gridParentPackage.Row))
    Set u = item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
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
Private Sub gridParentPackage_DblClick()
    cmdParentPackageEdit_Click
End Sub
Private Sub gridParentPackage_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridParentPackage.ItemCount = 0 Then Exit Sub
 If gridParentPackage.Row > 0 Then
   If LastRow <> gridParentPackage.Row And LastRow > 0 Then
     gridParentPackage.GetRowData(LastRow).RowStyle = "Default"
     gridParentPackage.GetRowData(gridParentPackage.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuParentPackagePASTE_Click()
On Error Resume Next
    If gridMTZAPP.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridMTZAPP.RowBookmark(gridMTZAPP.RowIndex(gridMTZAPP.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.ParentPackage.Add()
    If GetFromBuffer(u) Then
      gridParentPackage.ItemCount = u.Parent.Count
    Else
      gu.ParentPackage.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridParentPackage_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdParentPackageCfg_Click
        End If
    End If
End Sub

Private Sub gridParentPackage_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupParentPackage
End If
End Sub
Private Sub mnuParentPackageAdd_click()
   menuActionParentPackage = "ADD"
   menuTimerParentPackage.Enabled = True
End Sub
Private Sub mnuParentPackageEdit_click()
   menuActionParentPackage = "EDIT"
   menuTimerParentPackage.Enabled = True
End Sub
Private Sub mnuParentPackageDelete_click()
   menuActionParentPackage = "DEL"
   menuTimerParentPackage.Enabled = True
End Sub
Private Sub mnuParentPackageOpen_click()
   menuActionParentPackage = "RUN"
   menuTimerParentPackage.Enabled = True
End Sub
Private Sub mnuParentPackageRef_click()
   menuActionParentPackage = "REF"
   menuTimerParentPackage.Enabled = True
End Sub
  Private Sub mnuParentPackageCOPY_Click()
    On Error Resume Next
    If gridParentPackage.ItemCount = 0 Then Exit Sub
    If gridParentPackage.Row > 0 Then
     If gridParentPackage.RowIndex(gridParentPackage.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridParentPackage.RowBookmark(gridParentPackage.RowIndex(gridParentPackage.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuParentPackageCUT_Click()
    On Error Resume Next
    If gridParentPackage.ItemCount = 0 Then Exit Sub
    If gridParentPackage.Row > 0 Then
     If gridParentPackage.RowIndex(gridParentPackage.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridParentPackage.RowBookmark(gridParentPackage.RowIndex(gridParentPackage.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridParentPackage.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuParentPackageCHANGE_Click()
  On Error Resume Next
  If gridParentPackage.ItemCount = 0 Then Exit Sub
  If gridParentPackage.Row > 0 Then
   If gridParentPackage.RowIndex(gridParentPackage.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridParentPackage.RowBookmark(gridParentPackage.RowIndex(gridParentPackage.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridParentPackage.ItemCount = u.Parent.Count
      gridParentPackage.RefreshRowIndex gridParentPackage.RowIndex(gridParentPackage.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuParentPackageCLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuParentPackagePrn_click()
   menuActionParentPackage = "PRN"
   menuTimerParentPackage.Enabled = True
End Sub
Private Sub mnuParentPackageCfg_click()
   menuActionParentPackage = "CFG"
   menuTimerParentPackage.Enabled = True
End Sub
Private Sub mnuParentPackageFind_click()
   menuActionParentPackage = "FND"
   menuTimerParentPackage.Enabled = True
End Sub
Private Sub mnuParentPackageAcc_click()
   menuActionParentPackage = "ACC"
   menuTimerParentPackage.Enabled = True
End Sub
Private Sub menuTimerParentPackage_timer()
   menuTimerParentPackage.Enabled = False
   If menuActionParentPackage = "ADD" Then cmdParentPackageAdd_Click
   If menuActionParentPackage = "EDIT" Then cmdParentPackageEdit_Click
   If menuActionParentPackage = "DEL" Then cmdParentPackageDel_Click
   If menuActionParentPackage = "RUN" Then cmdParentPackageRun_Click
   If menuActionParentPackage = "REF" Then cmdParentPackageRef_Click
   If menuActionParentPackage = "PRN" Then cmdParentPackagePrn_Click
   If menuActionParentPackage = "CFG" Then cmdParentPackageCfg_Click
   If menuActionParentPackage = "FND" Then cmdParentPackageFnd_Click
   If menuActionParentPackage = "ACC" Then cmdParentPackageAcc_Click
   menuActionParentPackage = ""
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
 Set item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdMTZAPPAdd, cmdMTZAPPAdd.Tag
  LoadBtnPictures cmdMTZAPPEdit, cmdMTZAPPEdit.Tag
  LoadBtnPictures cmdMTZAPPDel, cmdMTZAPPDel.Tag
  LoadBtnPictures cmdMTZAPPRef, cmdMTZAPPRef.Tag
  LoadBtnPictures cmdMTZAPPPrn, cmdMTZAPPPrn.Tag
  LoadBtnPictures cmdMTZAPPFnd, cmdMTZAPPFnd.Tag
  LoadBtnPictures cmdMTZAPPRun, cmdMTZAPPRun.Tag
  LoadBtnPictures cmdMTZAPPAcc, cmdMTZAPPAcc.Tag
  LoadBtnPictures cmdMTZAPPCfg, cmdMTZAPPCfg.Tag
  item.MTZAPP.PrepareGrid gridMTZAPP
  LoadGridLayout gridMTZAPP
  Set fndMTZAPP = Nothing
  On Error Resume Next
  Set fndMTZAPP = CreateObject("MTZ_JSetup.GridFinder")
  fndMTZAPP.Init gridMTZAPP
  LoadBtnPictures cmdParentPackageAdd, cmdParentPackageAdd.Tag
  LoadBtnPictures cmdParentPackageEdit, cmdParentPackageEdit.Tag
  LoadBtnPictures cmdParentPackageDel, cmdParentPackageDel.Tag
  LoadBtnPictures cmdParentPackageRef, cmdParentPackageRef.Tag
  LoadBtnPictures cmdParentPackagePrn, cmdParentPackagePrn.Tag
  LoadBtnPictures cmdParentPackageFnd, cmdParentPackageFnd.Tag
  LoadBtnPictures cmdParentPackageCfg, cmdParentPackageCfg.Tag
  LoadBtnPictures cmdParentPackageRun, cmdParentPackageRun.Tag
  LoadBtnPictures cmdParentPackageAcc, cmdParentPackageAcc.Tag
  gridParentPackage.Columns.Clear
  gridParentPackage.ItemCount = 0
  cmdParentPackageRef_Click
End Sub

'Действие при активизации таба
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

pnlMTZAPP.RestorePosition
  gridMTZAPP_RowColChange gridMTZAPP.Row, -1
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
  Set item = aItem
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
  pnlMTZAPP.Move 0, 0, UserControl.Width, UserControl.Height
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
  Set item = Nothing
  Set fndMTZAPP = Nothing
  Set fndParentPackage = Nothing
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

  RowItem.Person.Secure item.SecureStyleID
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
    Set part_item = part_col.item(1)
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
    Set part_item = part_col.item(1)
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
        OK = item.Application.Manager.GetObjectListDialogEx(ID, brief, "", ObjTypeName)
    Else
        ID = CreateGUID2
        If Len(ObjTypeName) = 0 Then
            Dim newObj As Object
            Set newObj = item.Application.Manager.GetNewObject
            If Not (newObj Is Nothing) Then
                OK = True
                ID = newObj.ID
            End If
        Else
            OK = item.Application.Manager.NewInstance(ID, ObjTypeName, "")
        End If
        Dim ref As Object, objGui As Object
        Set ref = item.Application.Manager.GetInstanceObject(ID)
        If Not ref Is Nothing Then
          Set objGui = item.Application.Manager.GetInstanceGUI(ID)
          If objGui Is Nothing Then Set ref = Nothing: Exit Sub
          objGui.Show "", ref, False
          Set objGui = Nothing
        Else
          OK = False
        End If
    End If
    Dim Obj As Object
    Set Obj = item.Application.Manager.GetInstanceObject(ID)
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
        Call item.Application.Manager.AddCustomObjects(Coll, Obj.ID)
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
    Obj.EC_Def.item(1).TheName = RowItem.TheName
 End If
 Obj.Save
 Set RowItem.LinkedEC = Obj
 RowItem.Save
 Set GObj = RowItem.Application.Manager.GetInstanceGUI(Obj.ID)
 GObj.Show "", Obj, True 'False
 Set Obj = RowItem.Application.Manager.GetInstanceObject(ID)
 RowItem.TheName = Obj.EC_Def.item(1).TheName
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
 Call RowItem.Application.Manager.NewInstance(ID, "PEKZ", "Заявка " & Date)
 Set RowItem.TheDocument = RowItem.Application.Manager.GetInstanceObject(ID)

 If RowItem.TheDocument.PEKO_DEF.Count = 0 Then
  Set Obj = RowItem.TheDocument.PEKZ_DEF.Add
 Else
  Set Obj = RowItem.TheDocument.PEKZ_DEF.item(1)
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





