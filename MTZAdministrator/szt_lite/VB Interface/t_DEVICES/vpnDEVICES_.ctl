VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnDEVICES_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerDEVUNITS 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerDEVICES 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlDEVICES 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdDEVUNITSAcc 
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
      Begin MTZ_PANEL.DropButton cmdDEVUNITSRun 
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
      Begin VB.CommandButton cmdDEVUNITSFnd 
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
      Begin VB.CommandButton cmdDEVUNITSCfg 
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
      Begin VB.CommandButton cmdDEVUNITSPrn 
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
      Begin VB.CommandButton cmdDEVUNITSRef 
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
      Begin VB.CommandButton cmdDEVUNITSDel 
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
      Begin VB.CommandButton cmdDEVUNITSEdit 
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
      Begin VB.CommandButton cmdDEVUNITSAdd 
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
      Begin GridEX20.GridEX gridDEVUNITS 
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
         Column(1)       =   "vpnDEVICES_.ctx":0000
         Column(2)       =   "vpnDEVICES_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnDEVICES_.ctx":016C
         FormatStyle(2)  =   "vpnDEVICES_.ctx":02C8
         FormatStyle(3)  =   "vpnDEVICES_.ctx":0378
         FormatStyle(4)  =   "vpnDEVICES_.ctx":042C
         FormatStyle(5)  =   "vpnDEVICES_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnDEVICES_.ctx":05BC
      End
      Begin VB.CommandButton cmdDEVICESAcc 
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
      Begin MTZ_PANEL.DropButton cmdDEVICESRun 
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
      Begin VB.CommandButton cmdDEVICESFnd 
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
      Begin VB.CommandButton cmdDEVICESCfg 
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
      Begin VB.CommandButton cmdDEVICESPrn 
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
      Begin VB.CommandButton cmdDEVICESRef 
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
      Begin VB.CommandButton cmdDEVICESDel 
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
      Begin VB.CommandButton cmdDEVICESEdit 
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
      Begin VB.CommandButton cmdDEVICESAdd 
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
      Begin GridEX20.GridEX gridDEVICES 
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
         Column(1)       =   "vpnDEVICES_.ctx":0794
         Column(2)       =   "vpnDEVICES_.ctx":085C
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnDEVICES_.ctx":0900
         FormatStyle(2)  =   "vpnDEVICES_.ctx":0A5C
         FormatStyle(3)  =   "vpnDEVICES_.ctx":0B0C
         FormatStyle(4)  =   "vpnDEVICES_.ctx":0BC0
         FormatStyle(5)  =   "vpnDEVICES_.ctx":0C98
         ImageCount      =   0
         PrinterProperties=   "vpnDEVICES_.ctx":0D50
      End
   End
   Begin VB.Menu mnuPopupDEVICES 
      Caption         =   "Меню для Устройства"
      Visible         =   0   'False
      Begin VB.Menu mnuDEVICESAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuDEVICESEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuDEVICESDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuDEVICESOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuDEVICESRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuDEVICESS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuDEVICESBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuDEVICESCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuDEVICESCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuDEVICESPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuDEVICESCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuDEVICESCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuDEVICESPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuDEVICESCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuDEVICESFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuDEVICESAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupDEVUNITS 
      Caption         =   "Меню для Элементы устройств"
      Visible         =   0   'False
      Begin VB.Menu mnuDEVUNITSAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuDEVUNITSEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuDEVUNITSDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuDEVUNITSOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuDEVUNITSRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuDEVUNITSS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuDEVUNITSBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuDEVUNITSCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuDEVUNITSCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuDEVUNITSPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuDEVUNITSCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuDEVUNITSCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuDEVUNITSPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuDEVUNITSCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuDEVUNITSFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuDEVUNITSAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnDEVICES_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель для работы со строками раздела Устройства
Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndDEVICES As Object
Private menuActionDEVICES As String
Private fndDEVUNITS As Object
Private menuActionDEVUNITS As String





Private Sub pnlDEVICES_PositionChanged()
  pnlDEVICES.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridDEVICES_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdDEVICESCfg_Click
        End If
    End If
End Sub

Private Sub gridDEVICES_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupDEVICES
End If
End Sub
Private Sub mnuDEVICESAdd_click()
   menuActionDEVICES = "ADD"
   menuTimerDEVICES.Enabled = True
End Sub
Private Sub mnuDEVICESEdit_click()
   menuActionDEVICES = "EDIT"
   menuTimerDEVICES.Enabled = True
End Sub
Private Sub mnuDEVICESDelete_click()
   menuActionDEVICES = "DEL"
   menuTimerDEVICES.Enabled = True
End Sub
Private Sub mnuDEVICESOpen_click()
   menuActionDEVICES = "RUN"
   menuTimerDEVICES.Enabled = True
End Sub
Private Sub mnuDEVICESRef_click()
   menuActionDEVICES = "REF"
   menuTimerDEVICES.Enabled = True
End Sub
  Private Sub mnuDEVICESCOPY_Click()
    On Error Resume Next
    If gridDEVICES.ItemCount = 0 Then Exit Sub
    If gridDEVICES.Row > 0 Then
     If gridDEVICES.RowIndex(gridDEVICES.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridDEVICES.RowBookmark(gridDEVICES.RowIndex(gridDEVICES.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuDEVICESCUT_Click()
    On Error Resume Next
    If gridDEVICES.ItemCount = 0 Then Exit Sub
    If gridDEVICES.Row > 0 Then
     If gridDEVICES.RowIndex(gridDEVICES.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridDEVICES.RowBookmark(gridDEVICES.RowIndex(gridDEVICES.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridDEVICES.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuDEVICESCHANGE_Click()
  On Error Resume Next
  If gridDEVICES.ItemCount = 0 Then Exit Sub
  If gridDEVICES.Row > 0 Then
   If gridDEVICES.RowIndex(gridDEVICES.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridDEVICES.RowBookmark(gridDEVICES.RowIndex(gridDEVICES.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridDEVICES.ItemCount = u.Parent.Count
      gridDEVICES.RefreshRowIndex gridDEVICES.RowIndex(gridDEVICES.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuDEVICESCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuDEVICESPrn_click()
   menuActionDEVICES = "PRN"
   menuTimerDEVICES.Enabled = True
End Sub
Private Sub mnuDEVICESCfg_click()
   menuActionDEVICES = "CFG"
   menuTimerDEVICES.Enabled = True
End Sub
Private Sub mnuDEVICESFind_click()
   menuActionDEVICES = "FND"
   menuTimerDEVICES.Enabled = True
End Sub
Private Sub mnuDEVICESAcc_click()
   menuActionDEVICES = "ACC"
   menuTimerDEVICES.Enabled = True
End Sub
Private Sub menuTimerDEVICES_timer()
   menuTimerDEVICES.Enabled = False
   If menuActionDEVICES = "ADD" Then cmdDEVICESAdd_Click
   If menuActionDEVICES = "EDIT" Then cmdDEVICESEdit_Click
   If menuActionDEVICES = "DEL" Then cmdDEVICESDel_Click
   If menuActionDEVICES = "RUN" Then cmdDEVICESRun_Click
   If menuActionDEVICES = "REF" Then cmdDEVICESRef_Click
   If menuActionDEVICES = "PRN" Then cmdDEVICESPrn_Click
   If menuActionDEVICES = "CFG" Then cmdDEVICESCfg_Click
   If menuActionDEVICES = "FND" Then cmdDEVICESFnd_Click
   If menuActionDEVICES = "ACC" Then cmdDEVICESAcc_Click
   menuActionDEVICES = ""
End Sub
Private Sub cmdDEVICESCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridDEVICES, "gridDEVICES"
Set jset = Nothing
End Sub

Private Sub cmdDEVICESPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridDEVICES, "Устройства"
Set jset = Nothing
End Sub

Private Sub cmdDEVICESRef_Click()
  On Error Resume Next
  Item.DEVICES.Refresh
  gridDEVICES.ItemCount = Item.DEVICES.Count
  gridDEVICES.Refetch
  gridDEVICES.Refresh
End Sub
Private Sub cmdDEVICESAcc_Click()
On Error Resume Next
If gridDEVICES.ItemCount = 0 Then Exit Sub
If gridDEVICES.Row > 0 Then
 If gridDEVICES.RowIndex(gridDEVICES.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridDEVICES.RowBookmark(gridDEVICES.RowIndex(gridDEVICES.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdDEVICESEdit_Click()
  On Error Resume Next
If gridDEVICES.ItemCount = 0 Then Exit Sub
If gridDEVICES.Row > 0 Then
 If gridDEVICES.RowIndex(gridDEVICES.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridDEVICES.RowBookmark(gridDEVICES.RowIndex(gridDEVICES.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmDEVICES_.Item = u
again:     frmDEVICES_.NotFirstTime = False
    frmDEVICES_.OnInit
    frmDEVICES_.Show vbModal
    If frmDEVICES_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridDEVICES.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdDEVICESDel_Click()
  On Error Resume Next
  gridDEVICES.Delete
End Sub
Private Sub cmdDEVICESAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.DEVICES.Add()

      Set frmDEVICES_.Item = u
again:       frmDEVICES_.NotFirstTime = False
      frmDEVICES_.OnInit
      frmDEVICES_.Show vbModal
      If frmDEVICES_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridDEVICES.ItemCount = Item.DEVICES.Count
        gridDEVICES.Refresh
        gridDEVICES.RefreshGroups
        gridDEVICES.RefreshSort
        gridDEVICES.MoveToBookmark u.ID & "DEVICES"
      Else
        Item.DEVICES.Delete u.ID
        Item.DEVICES.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdDEVICESFnd_Click()
  On Error Resume Next
  fndDEVICES.ShowForm
End Sub
Private Sub cmdDEVICESRun_Click()
  On Error Resume Next
  gridDEVICES_DblClick
End Sub
Private Sub gridDEVICES_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.DEVICES.LoadRow gridDEVICES, RowIndex, Bookmark, Values
End Sub
Private Sub gridDEVICES_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridDEVICES.ItemCount = 0 Then Exit Sub
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
Private Sub gridDEVICES_DblClick()
  cmdDEVICESEdit_Click
End Sub
Private Sub gridDEVICES_KeyPress(KeyAscii As Integer)
  If gridDEVICES.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndDEVICES.FindOnPress KeyAscii
End Sub

Private Sub pnlDEVICES_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridDEVICES.Left = Left
  gridDEVICES.Top = Top + 25 * Screen.TwipsPerPixelY
  gridDEVICES.Width = Width
  gridDEVICES.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdDEVICESAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdDEVICESEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdDEVICESDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdDEVICESRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdDEVICESPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdDEVICESCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdDEVICESFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdDEVICESRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdDEVICESAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdDEVICESAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdDEVICESEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdDEVICESDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdDEVICESRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdDEVICESPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdDEVICESCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdDEVICESFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdDEVICESRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdDEVICESAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuDEVICESPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.DEVICES.Add()
    If GetFromBuffer(u) Then
      gridDEVICES.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdDEVUNITSCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridDEVUNITS, "gridDEVUNITS"
Set jset = Nothing
End Sub

Private Sub cmdDEVUNITSPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridDEVUNITS, "Элементы устройств"
Set jset = Nothing
End Sub

Private Sub cmdDEVUNITSAcc_Click()
On Error Resume Next
If gridDEVUNITS.ItemCount = 0 Then Exit Sub
If gridDEVUNITS.Row > 0 Then
 If gridDEVUNITS.RowIndex(gridDEVUNITS.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridDEVUNITS.RowBookmark(gridDEVUNITS.RowIndex(gridDEVUNITS.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdDEVUNITSFnd_Click()
  On Error Resume Next
  fndDEVUNITS.ShowForm
End Sub
Private Sub cmdDEVUNITSRun_Click()
  On Error Resume Next
  gridDEVUNITS_DblClick
End Sub
Private Sub pnlDEVICES_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridDEVUNITS.Left = Left
  gridDEVUNITS.Top = Top + 25 * Screen.TwipsPerPixelY
  gridDEVUNITS.Width = Width
  gridDEVUNITS.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdDEVUNITSAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdDEVUNITSEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdDEVUNITSDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdDEVUNITSRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdDEVUNITSPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdDEVUNITSCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdDEVUNITSFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdDEVUNITSRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdDEVUNITSAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdDEVUNITSAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdDEVUNITSEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdDEVUNITSDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdDEVUNITSRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdDEVUNITSPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdDEVUNITSCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdDEVUNITSFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdDEVUNITSRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdDEVUNITSAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdDEVUNITSRef_Click()
  On Error Resume Next
If gridDEVICES.ItemCount = 0 Then Exit Sub
If gridDEVICES.Row > 0 Then
 If gridDEVICES.RowIndex(gridDEVICES.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridDEVICES.RowBookmark(gridDEVICES.RowIndex(gridDEVICES.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.DEVUNITS.Refresh
   gridDEVUNITS.ItemCount = gu.DEVUNITS.Count
   gridDEVUNITS.Refetch
   gridDEVUNITS.Refresh
 Else
  gridDEVUNITS.Columns.Clear
  gridDEVUNITS.ItemCount = 0
 End If
Else
 gridDEVUNITS.Columns.Clear
 gridDEVUNITS.ItemCount = 0
End If
End Sub
Private Sub cmdDEVUNITSEdit_Click()
    If gridDEVUNITS.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridDEVUNITS.RowBookmark(gridDEVUNITS.RowIndex(gridDEVUNITS.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmDEVUNITS_.Item = u
again:     frmDEVUNITS_.NotFirstTime = False
    frmDEVUNITS_.OnInit
    frmDEVUNITS_.Show vbModal
    If frmDEVUNITS_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridDEVUNITS.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdDEVUNITSDel_Click()
  On Error Resume Next
  gridDEVUNITS.Delete
End Sub
Private Sub cmdDEVUNITSAdd_Click()
  On Error Resume Next
    Dim gu As Object
    Dim u As Object
If gridDEVICES.ItemCount = 0 Then Exit Sub
    Dim bm
    bm = gridDEVICES.RowBookmark(gridDEVICES.RowIndex(gridDEVICES.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set u = gu.DEVUNITS.Add()

      Set frmDEVUNITS_.Item = u
again:       frmDEVUNITS_.NotFirstTime = False
      frmDEVUNITS_.OnInit
      frmDEVUNITS_.Show vbModal
      If frmDEVUNITS_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridDEVUNITS.ItemCount = gu.DEVUNITS.Count
        gridDEVUNITS.Refresh
        gridDEVUNITS.RefreshGroups
        gridDEVUNITS.RefreshSort
        gridDEVUNITS.MoveToBookmark u.ID & "DEVUNITS"
      Else
        gu.DEVUNITS.Delete u.ID
        gu.DEVUNITS.Remove u.ID
      End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridDEVICES_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridDEVICES.ItemCount = 0 Then
  gridDEVUNITS.ItemCount = 0
  Exit Sub
End If
If gridDEVICES.Row > 0 Then
  If LastRow <> gridDEVICES.Row And LastRow > 0 Then
    gridDEVICES.GetRowData(LastRow).RowStyle = "Default"
    gridDEVICES.GetRowData(gridDEVICES.Row).RowStyle = "SelectedRow"
  End If
 If gridDEVICES.RowIndex(gridDEVICES.Row) > 0 Then
  If LastRow <> gridDEVICES.Row Or gridDEVUNITS.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridDEVICES.RowBookmark(gridDEVICES.RowIndex(gridDEVICES.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.DEVUNITS.PrepareGrid gridDEVUNITS
  gridDEVUNITS.ItemCount = 0
    LoadGridLayout gridDEVUNITS
    Set fndDEVUNITS = Nothing
    Set fndDEVUNITS = CreateObject("MTZ_JSetup.GridFinder")
    fndDEVUNITS.Init gridDEVUNITS
  gridDEVUNITS.ItemCount = gu.DEVUNITS.Count
  End If
 End If
End If
End Sub
Private Sub gridDEVUNITS_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
    If gridDEVICES.ItemCount = 0 Then Exit Sub
    If gridDEVUNITS.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridDEVICES.RowBookmark(gridDEVICES.RowIndex(gridDEVICES.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.DEVUNITS.LoadRow gridDEVUNITS, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridDEVUNITS_KeyPress(KeyAscii As Integer)
  If gridDEVUNITS.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndDEVUNITS.FindOnPress KeyAscii
End Sub

Private Sub gridDEVUNITS_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If gridDEVUNITS.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridDEVUNITS.RowBookmark(gridDEVUNITS.RowIndex(gridDEVUNITS.Row))
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
Private Sub gridDEVUNITS_DblClick()
    cmdDEVUNITSEdit_Click
End Sub
Private Sub gridDEVUNITS_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridDEVUNITS.ItemCount = 0 Then Exit Sub
 If gridDEVUNITS.Row > 0 Then
   If LastRow <> gridDEVUNITS.Row And LastRow > 0 Then
     gridDEVUNITS.GetRowData(LastRow).RowStyle = "Default"
     gridDEVUNITS.GetRowData(gridDEVUNITS.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuDEVUNITSPASTE_Click()
On Error Resume Next
    If gridDEVICES.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridDEVICES.RowBookmark(gridDEVICES.RowIndex(gridDEVICES.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.DEVUNITS.Add()
    If GetFromBuffer(u) Then
      gridDEVUNITS.ItemCount = u.Parent.Count
    Else
      gu.DEVUNITS.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridDEVUNITS_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdDEVUNITSCfg_Click
        End If
    End If
End Sub

Private Sub gridDEVUNITS_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupDEVUNITS
End If
End Sub
Private Sub mnuDEVUNITSAdd_click()
   menuActionDEVUNITS = "ADD"
   menuTimerDEVUNITS.Enabled = True
End Sub
Private Sub mnuDEVUNITSEdit_click()
   menuActionDEVUNITS = "EDIT"
   menuTimerDEVUNITS.Enabled = True
End Sub
Private Sub mnuDEVUNITSDelete_click()
   menuActionDEVUNITS = "DEL"
   menuTimerDEVUNITS.Enabled = True
End Sub
Private Sub mnuDEVUNITSOpen_click()
   menuActionDEVUNITS = "RUN"
   menuTimerDEVUNITS.Enabled = True
End Sub
Private Sub mnuDEVUNITSRef_click()
   menuActionDEVUNITS = "REF"
   menuTimerDEVUNITS.Enabled = True
End Sub
  Private Sub mnuDEVUNITSCOPY_Click()
    On Error Resume Next
    If gridDEVUNITS.ItemCount = 0 Then Exit Sub
    If gridDEVUNITS.Row > 0 Then
     If gridDEVUNITS.RowIndex(gridDEVUNITS.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridDEVUNITS.RowBookmark(gridDEVUNITS.RowIndex(gridDEVUNITS.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuDEVUNITSCUT_Click()
    On Error Resume Next
    If gridDEVUNITS.ItemCount = 0 Then Exit Sub
    If gridDEVUNITS.Row > 0 Then
     If gridDEVUNITS.RowIndex(gridDEVUNITS.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridDEVUNITS.RowBookmark(gridDEVUNITS.RowIndex(gridDEVUNITS.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridDEVUNITS.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuDEVUNITSCHANGE_Click()
  On Error Resume Next
  If gridDEVUNITS.ItemCount = 0 Then Exit Sub
  If gridDEVUNITS.Row > 0 Then
   If gridDEVUNITS.RowIndex(gridDEVUNITS.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridDEVUNITS.RowBookmark(gridDEVUNITS.RowIndex(gridDEVUNITS.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridDEVUNITS.ItemCount = u.Parent.Count
      gridDEVUNITS.RefreshRowIndex gridDEVUNITS.RowIndex(gridDEVUNITS.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuDEVUNITSCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuDEVUNITSPrn_click()
   menuActionDEVUNITS = "PRN"
   menuTimerDEVUNITS.Enabled = True
End Sub
Private Sub mnuDEVUNITSCfg_click()
   menuActionDEVUNITS = "CFG"
   menuTimerDEVUNITS.Enabled = True
End Sub
Private Sub mnuDEVUNITSFind_click()
   menuActionDEVUNITS = "FND"
   menuTimerDEVUNITS.Enabled = True
End Sub
Private Sub mnuDEVUNITSAcc_click()
   menuActionDEVUNITS = "ACC"
   menuTimerDEVUNITS.Enabled = True
End Sub
Private Sub menuTimerDEVUNITS_timer()
   menuTimerDEVUNITS.Enabled = False
   If menuActionDEVUNITS = "ADD" Then cmdDEVUNITSAdd_Click
   If menuActionDEVUNITS = "EDIT" Then cmdDEVUNITSEdit_Click
   If menuActionDEVUNITS = "DEL" Then cmdDEVUNITSDel_Click
   If menuActionDEVUNITS = "RUN" Then cmdDEVUNITSRun_Click
   If menuActionDEVUNITS = "REF" Then cmdDEVUNITSRef_Click
   If menuActionDEVUNITS = "PRN" Then cmdDEVUNITSPrn_Click
   If menuActionDEVUNITS = "CFG" Then cmdDEVUNITSCfg_Click
   If menuActionDEVUNITS = "FND" Then cmdDEVUNITSFnd_Click
   If menuActionDEVUNITS = "ACC" Then cmdDEVUNITSAcc_Click
   menuActionDEVUNITS = ""
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

  LoadBtnPictures cmdDEVICESAdd, cmdDEVICESAdd.Tag
  LoadBtnPictures cmdDEVICESEdit, cmdDEVICESEdit.Tag
  LoadBtnPictures cmdDEVICESDel, cmdDEVICESDel.Tag
  LoadBtnPictures cmdDEVICESRef, cmdDEVICESRef.Tag
  LoadBtnPictures cmdDEVICESPrn, cmdDEVICESPrn.Tag
  LoadBtnPictures cmdDEVICESFnd, cmdDEVICESFnd.Tag
  LoadBtnPictures cmdDEVICESRun, cmdDEVICESRun.Tag
  LoadBtnPictures cmdDEVICESAcc, cmdDEVICESAcc.Tag
  LoadBtnPictures cmdDEVICESCfg, cmdDEVICESCfg.Tag
  Item.DEVICES.PrepareGrid gridDEVICES
  LoadGridLayout gridDEVICES
  Set fndDEVICES = Nothing
  On Error Resume Next
  Set fndDEVICES = CreateObject("MTZ_JSetup.GridFinder")
  fndDEVICES.Init gridDEVICES
  LoadBtnPictures cmdDEVUNITSAdd, cmdDEVUNITSAdd.Tag
  LoadBtnPictures cmdDEVUNITSEdit, cmdDEVUNITSEdit.Tag
  LoadBtnPictures cmdDEVUNITSDel, cmdDEVUNITSDel.Tag
  LoadBtnPictures cmdDEVUNITSRef, cmdDEVUNITSRef.Tag
  LoadBtnPictures cmdDEVUNITSPrn, cmdDEVUNITSPrn.Tag
  LoadBtnPictures cmdDEVUNITSFnd, cmdDEVUNITSFnd.Tag
  LoadBtnPictures cmdDEVUNITSCfg, cmdDEVUNITSCfg.Tag
  LoadBtnPictures cmdDEVUNITSRun, cmdDEVUNITSRun.Tag
  LoadBtnPictures cmdDEVUNITSAcc, cmdDEVUNITSAcc.Tag
  gridDEVUNITS.Columns.Clear
  gridDEVUNITS.ItemCount = 0
  cmdDEVUNITSRef_Click
End Sub

'Действие при активизации таба
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

pnlDEVICES.RestorePosition
  gridDEVICES_RowColChange gridDEVICES.Row, -1
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
  pnlDEVICES.Move 0, 0, UserControl.Width, UserControl.Height
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
  Set fndDEVICES = Nothing
  Set fndDEVUNITS = Nothing
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





