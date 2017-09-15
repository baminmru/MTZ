VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnITTOUT_LINES_main 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerITTOUT_PALET 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerITTOUT_LINES 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlITTOUT_LINES 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdITTOUT_PALETAcc 
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
      Begin MTZ_PANEL.DropButton cmdITTOUT_PALETRun 
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
      Begin VB.CommandButton cmdITTOUT_PALETFnd 
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
      Begin VB.CommandButton cmdITTOUT_PALETCfg 
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
      Begin VB.CommandButton cmdITTOUT_PALETPrn 
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
      Begin VB.CommandButton cmdITTOUT_PALETRef 
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
      Begin VB.CommandButton cmdITTOUT_PALETDel 
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
      Begin VB.CommandButton cmdITTOUT_PALETEdit 
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
      Begin VB.CommandButton cmdITTOUT_PALETAdd 
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
      Begin GridEX20.GridEX gridITTOUT_PALET 
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
         Column(1)       =   "vpnITTOUT_LINES_main.ctx":0000
         Column(2)       =   "vpnITTOUT_LINES_main.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnITTOUT_LINES_main.ctx":016C
         FormatStyle(2)  =   "vpnITTOUT_LINES_main.ctx":02C8
         FormatStyle(3)  =   "vpnITTOUT_LINES_main.ctx":0378
         FormatStyle(4)  =   "vpnITTOUT_LINES_main.ctx":042C
         FormatStyle(5)  =   "vpnITTOUT_LINES_main.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnITTOUT_LINES_main.ctx":05BC
      End
      Begin VB.CommandButton cmdITTOUT_LINESAcc 
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
      Begin MTZ_PANEL.DropButton cmdITTOUT_LINESRun 
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
      Begin VB.CommandButton cmdITTOUT_LINESFnd 
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
      Begin VB.CommandButton cmdITTOUT_LINESCfg 
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
      Begin VB.CommandButton cmdITTOUT_LINESPrn 
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
      Begin VB.CommandButton cmdITTOUT_LINESRef 
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
      Begin VB.CommandButton cmdITTOUT_LINESDel 
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
      Begin VB.CommandButton cmdITTOUT_LINESEdit 
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
      Begin VB.CommandButton cmdITTOUT_LINESAdd 
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
      Begin GridEX20.GridEX gridITTOUT_LINES 
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
         Column(1)       =   "vpnITTOUT_LINES_main.ctx":0794
         Column(2)       =   "vpnITTOUT_LINES_main.ctx":085C
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnITTOUT_LINES_main.ctx":0900
         FormatStyle(2)  =   "vpnITTOUT_LINES_main.ctx":0A5C
         FormatStyle(3)  =   "vpnITTOUT_LINES_main.ctx":0B0C
         FormatStyle(4)  =   "vpnITTOUT_LINES_main.ctx":0BC0
         FormatStyle(5)  =   "vpnITTOUT_LINES_main.ctx":0C98
         ImageCount      =   0
         PrinterProperties=   "vpnITTOUT_LINES_main.ctx":0D50
      End
   End
   Begin VB.Menu mnuPopupITTOUT_LINES 
      Caption         =   "Меню для Строки заказа"
      Visible         =   0   'False
      Begin VB.Menu mnuITTOUT_LINESAdd 
         Caption         =   "Создать"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuITTOUT_LINESEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuITTOUT_LINESDelete 
         Caption         =   "Удалить"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuITTOUT_LINESOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuITTOUT_LINESRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuITTOUT_LINESS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuITTOUT_LINESBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuITTOUT_LINESCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuITTOUT_LINESCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuITTOUT_LINESPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuITTOUT_LINESCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuITTOUT_LINESCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuITTOUT_LINESPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuITTOUT_LINESCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuITTOUT_LINESFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuITTOUT_LINESAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupITTOUT_PALET 
      Caption         =   "Меню для Палеты к строке"
      Visible         =   0   'False
      Begin VB.Menu mnuITTOUT_PALETAdd 
         Caption         =   "Создать"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuITTOUT_PALETEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuITTOUT_PALETDelete 
         Caption         =   "Удалить"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuITTOUT_PALETOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuITTOUT_PALETRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuITTOUT_PALETS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuITTOUT_PALETBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuITTOUT_PALETCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuITTOUT_PALETCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuITTOUT_PALETPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuITTOUT_PALETCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuITTOUT_PALETCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuITTOUT_PALETPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuITTOUT_PALETCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuITTOUT_PALETFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuITTOUT_PALETAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnITTOUT_LINES_main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель для работы со строками раздела
Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndITTOUT_LINES As Object
Private menuActionITTOUT_LINES As String
Private fndITTOUT_PALET As Object
Private menuActionITTOUT_PALET As String





Private Sub pnlITTOUT_LINES_PositionChanged()
  pnlITTOUT_LINES.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridITTOUT_LINES_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdITTOUT_LINESCfg_Click
        End If
    End If
End Sub

Private Sub gridITTOUT_LINES_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupITTOUT_LINES
End If
End Sub
Private Sub mnuITTOUT_LINESAdd_click()
   menuActionITTOUT_LINES = "ADD"
   menuTimerITTOUT_LINES.Enabled = True
End Sub
Private Sub mnuITTOUT_LINESEdit_click()
   menuActionITTOUT_LINES = "EDIT"
   menuTimerITTOUT_LINES.Enabled = True
End Sub
Private Sub mnuITTOUT_LINESDelete_click()
   menuActionITTOUT_LINES = "DEL"
   menuTimerITTOUT_LINES.Enabled = True
End Sub
Private Sub mnuITTOUT_LINESOpen_click()
   menuActionITTOUT_LINES = "RUN"
   menuTimerITTOUT_LINES.Enabled = True
End Sub
Private Sub mnuITTOUT_LINESRef_click()
   menuActionITTOUT_LINES = "REF"
   menuTimerITTOUT_LINES.Enabled = True
End Sub
  Private Sub mnuITTOUT_LINESCOPY_Click()
    On Error Resume Next
    If gridITTOUT_LINES.ItemCount = 0 Then Exit Sub
    If gridITTOUT_LINES.Row > 0 Then
     If gridITTOUT_LINES.RowIndex(gridITTOUT_LINES.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridITTOUT_LINES.RowBookmark(gridITTOUT_LINES.RowIndex(gridITTOUT_LINES.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuITTOUT_LINESCUT_Click()
    On Error Resume Next
    If gridITTOUT_LINES.ItemCount = 0 Then Exit Sub
    If gridITTOUT_LINES.Row > 0 Then
     If gridITTOUT_LINES.RowIndex(gridITTOUT_LINES.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridITTOUT_LINES.RowBookmark(gridITTOUT_LINES.RowIndex(gridITTOUT_LINES.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridITTOUT_LINES.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuITTOUT_LINESCHANGE_Click()
  On Error Resume Next
  If gridITTOUT_LINES.ItemCount = 0 Then Exit Sub
  If gridITTOUT_LINES.Row > 0 Then
   If gridITTOUT_LINES.RowIndex(gridITTOUT_LINES.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridITTOUT_LINES.RowBookmark(gridITTOUT_LINES.RowIndex(gridITTOUT_LINES.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridITTOUT_LINES.ItemCount = u.Parent.Count
      gridITTOUT_LINES.RefreshRowIndex gridITTOUT_LINES.RowIndex(gridITTOUT_LINES.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuITTOUT_LINESCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuITTOUT_LINESPrn_click()
   menuActionITTOUT_LINES = "PRN"
   menuTimerITTOUT_LINES.Enabled = True
End Sub
Private Sub mnuITTOUT_LINESCfg_click()
   menuActionITTOUT_LINES = "CFG"
   menuTimerITTOUT_LINES.Enabled = True
End Sub
Private Sub mnuITTOUT_LINESFind_click()
   menuActionITTOUT_LINES = "FND"
   menuTimerITTOUT_LINES.Enabled = True
End Sub
Private Sub mnuITTOUT_LINESAcc_click()
   menuActionITTOUT_LINES = "ACC"
   menuTimerITTOUT_LINES.Enabled = True
End Sub
Private Sub menuTimerITTOUT_LINES_timer()
   menuTimerITTOUT_LINES.Enabled = False
   If menuActionITTOUT_LINES = "ADD" Then cmdITTOUT_LINESAdd_Click
   If menuActionITTOUT_LINES = "EDIT" Then cmdITTOUT_LINESEdit_Click
   If menuActionITTOUT_LINES = "DEL" Then cmdITTOUT_LINESDel_Click
   If menuActionITTOUT_LINES = "RUN" Then cmdITTOUT_LINESRun_Click
   If menuActionITTOUT_LINES = "REF" Then cmdITTOUT_LINESRef_Click
   If menuActionITTOUT_LINES = "PRN" Then cmdITTOUT_LINESPrn_Click
   If menuActionITTOUT_LINES = "CFG" Then cmdITTOUT_LINESCfg_Click
   If menuActionITTOUT_LINES = "FND" Then cmdITTOUT_LINESFnd_Click
   If menuActionITTOUT_LINES = "ACC" Then cmdITTOUT_LINESAcc_Click
   menuActionITTOUT_LINES = ""
End Sub
Private Sub cmdITTOUT_LINESCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridITTOUT_LINES, "gridITTOUT_LINES"
Set jset = Nothing
End Sub

Private Sub cmdITTOUT_LINESPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridITTOUT_LINES, "Строки заказа"
Set jset = Nothing
End Sub

Private Sub cmdITTOUT_LINESRef_Click()
  On Error Resume Next
  Item.ITTOUT_LINES.Refresh
  gridITTOUT_LINES.ItemCount = Item.ITTOUT_LINES.Count
  gridITTOUT_LINES.Refetch
  gridITTOUT_LINES.Refresh
End Sub
Private Sub cmdITTOUT_LINESAcc_Click()
On Error Resume Next
If gridITTOUT_LINES.ItemCount = 0 Then Exit Sub
If gridITTOUT_LINES.Row > 0 Then
 If gridITTOUT_LINES.RowIndex(gridITTOUT_LINES.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridITTOUT_LINES.RowBookmark(gridITTOUT_LINES.RowIndex(gridITTOUT_LINES.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdITTOUT_LINESEdit_Click()
  On Error Resume Next
If gridITTOUT_LINES.ItemCount = 0 Then Exit Sub
If gridITTOUT_LINES.Row > 0 Then
 If gridITTOUT_LINES.RowIndex(gridITTOUT_LINES.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridITTOUT_LINES.RowBookmark(gridITTOUT_LINES.RowIndex(gridITTOUT_LINES.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmITTOUT_LINES_main.Item = u
again:     frmITTOUT_LINES_main.NotFirstTime = False
    frmITTOUT_LINES_main.OnInit
    frmITTOUT_LINES_main.Show vbModal
    If frmITTOUT_LINES_main.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridITTOUT_LINES.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdITTOUT_LINESDel_Click()
  On Error Resume Next
End Sub
Private Sub cmdITTOUT_LINESAdd_Click()
  On Error Resume Next
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdITTOUT_LINESFnd_Click()
  On Error Resume Next
  fndITTOUT_LINES.ShowForm
End Sub
Private Sub cmdITTOUT_LINESRun_Click()
  On Error Resume Next
  gridITTOUT_LINES_DblClick
End Sub
Private Sub gridITTOUT_LINES_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.ITTOUT_LINES.LoadRow gridITTOUT_LINES, RowIndex, Bookmark, Values
End Sub
Private Sub gridITTOUT_LINES_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
   Cancel = True
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridITTOUT_LINES_DblClick()
  cmdITTOUT_LINESEdit_Click
End Sub
Private Sub gridITTOUT_LINES_KeyPress(KeyAscii As Integer)
  If gridITTOUT_LINES.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndITTOUT_LINES.FindOnPress KeyAscii
End Sub

Private Sub pnlITTOUT_LINES_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridITTOUT_LINES.Left = Left
  gridITTOUT_LINES.Top = Top + 25 * Screen.TwipsPerPixelY
  gridITTOUT_LINES.Width = Width
  gridITTOUT_LINES.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdITTOUT_LINESAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOUT_LINESEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOUT_LINESDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOUT_LINESRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOUT_LINESPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOUT_LINESCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOUT_LINESFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOUT_LINESRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOUT_LINESAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOUT_LINESAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdITTOUT_LINESEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdITTOUT_LINESDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdITTOUT_LINESRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdITTOUT_LINESPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdITTOUT_LINESCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdITTOUT_LINESFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdITTOUT_LINESRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdITTOUT_LINESAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuITTOUT_LINESPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.ITTOUT_LINES.Add()
    If GetFromBuffer(u) Then
      gridITTOUT_LINES.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdITTOUT_PALETCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridITTOUT_PALET, "gridITTOUT_PALET"
Set jset = Nothing
End Sub

Private Sub cmdITTOUT_PALETPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridITTOUT_PALET, "Палеты к строке"
Set jset = Nothing
End Sub

Private Sub cmdITTOUT_PALETAcc_Click()
On Error Resume Next
If gridITTOUT_PALET.ItemCount = 0 Then Exit Sub
If gridITTOUT_PALET.Row > 0 Then
 If gridITTOUT_PALET.RowIndex(gridITTOUT_PALET.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridITTOUT_PALET.RowBookmark(gridITTOUT_PALET.RowIndex(gridITTOUT_PALET.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdITTOUT_PALETFnd_Click()
  On Error Resume Next
  fndITTOUT_PALET.ShowForm
End Sub
Private Sub cmdITTOUT_PALETRun_Click()
  On Error Resume Next
  gridITTOUT_PALET_DblClick
End Sub
Private Sub pnlITTOUT_LINES_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridITTOUT_PALET.Left = Left
  gridITTOUT_PALET.Top = Top + 25 * Screen.TwipsPerPixelY
  gridITTOUT_PALET.Width = Width
  gridITTOUT_PALET.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdITTOUT_PALETAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOUT_PALETEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOUT_PALETDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOUT_PALETRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOUT_PALETPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOUT_PALETCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOUT_PALETFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOUT_PALETRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOUT_PALETAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTOUT_PALETAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdITTOUT_PALETEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdITTOUT_PALETDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdITTOUT_PALETRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdITTOUT_PALETPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdITTOUT_PALETCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdITTOUT_PALETFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdITTOUT_PALETRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdITTOUT_PALETAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdITTOUT_PALETRef_Click()
  On Error Resume Next
If gridITTOUT_LINES.ItemCount = 0 Then Exit Sub
If gridITTOUT_LINES.Row > 0 Then
 If gridITTOUT_LINES.RowIndex(gridITTOUT_LINES.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridITTOUT_LINES.RowBookmark(gridITTOUT_LINES.RowIndex(gridITTOUT_LINES.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.ITTOUT_PALET.Refresh
   gridITTOUT_PALET.ItemCount = gu.ITTOUT_PALET.Count
   gridITTOUT_PALET.Refetch
   gridITTOUT_PALET.Refresh
 Else
  gridITTOUT_PALET.Columns.Clear
  gridITTOUT_PALET.ItemCount = 0
 End If
Else
 gridITTOUT_PALET.Columns.Clear
 gridITTOUT_PALET.ItemCount = 0
End If
End Sub
Private Sub cmdITTOUT_PALETEdit_Click()
    If gridITTOUT_PALET.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridITTOUT_PALET.RowBookmark(gridITTOUT_PALET.RowIndex(gridITTOUT_PALET.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmITTOUT_PALET_main.Item = u
again:     frmITTOUT_PALET_main.NotFirstTime = False
    frmITTOUT_PALET_main.OnInit
    frmITTOUT_PALET_main.Show vbModal
    If frmITTOUT_PALET_main.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridITTOUT_PALET.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdITTOUT_PALETDel_Click()
  On Error Resume Next
End Sub
Private Sub cmdITTOUT_PALETAdd_Click()
  On Error Resume Next
    Dim gu As Object
    Dim u As Object
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridITTOUT_LINES_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridITTOUT_LINES.ItemCount = 0 Then
  gridITTOUT_PALET.ItemCount = 0
  Exit Sub
End If
If gridITTOUT_LINES.Row > 0 Then
  If LastRow <> gridITTOUT_LINES.Row And LastRow > 0 Then
    gridITTOUT_LINES.GetRowData(LastRow).RowStyle = "Default"
    gridITTOUT_LINES.GetRowData(gridITTOUT_LINES.Row).RowStyle = "SelectedRow"
  End If
 If gridITTOUT_LINES.RowIndex(gridITTOUT_LINES.Row) > 0 Then
  If LastRow <> gridITTOUT_LINES.Row Or gridITTOUT_PALET.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridITTOUT_LINES.RowBookmark(gridITTOUT_LINES.RowIndex(gridITTOUT_LINES.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.ITTOUT_PALET.PrepareGrid gridITTOUT_PALET
  gridITTOUT_PALET.ItemCount = 0
    LoadGridLayout gridITTOUT_PALET
    Set fndITTOUT_PALET = Nothing
    Set fndITTOUT_PALET = CreateObject("MTZ_JSetup.GridFinder")
    fndITTOUT_PALET.Init gridITTOUT_PALET
  gridITTOUT_PALET.ItemCount = gu.ITTOUT_PALET.Count
  End If
 End If
End If
End Sub
Private Sub gridITTOUT_PALET_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
    If gridITTOUT_LINES.ItemCount = 0 Then Exit Sub
    If gridITTOUT_PALET.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridITTOUT_LINES.RowBookmark(gridITTOUT_LINES.RowIndex(gridITTOUT_LINES.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.ITTOUT_PALET.LoadRow gridITTOUT_PALET, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridITTOUT_PALET_KeyPress(KeyAscii As Integer)
  If gridITTOUT_PALET.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndITTOUT_PALET.FindOnPress KeyAscii
End Sub

Private Sub gridITTOUT_PALET_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
   Cancel = True
End Sub
Private Sub gridITTOUT_PALET_DblClick()
    cmdITTOUT_PALETEdit_Click
End Sub
Private Sub gridITTOUT_PALET_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridITTOUT_PALET.ItemCount = 0 Then Exit Sub
 If gridITTOUT_PALET.Row > 0 Then
   If LastRow <> gridITTOUT_PALET.Row And LastRow > 0 Then
     gridITTOUT_PALET.GetRowData(LastRow).RowStyle = "Default"
     gridITTOUT_PALET.GetRowData(gridITTOUT_PALET.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuITTOUT_PALETPASTE_Click()
On Error Resume Next
    If gridITTOUT_LINES.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridITTOUT_LINES.RowBookmark(gridITTOUT_LINES.RowIndex(gridITTOUT_LINES.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.ITTOUT_PALET.Add()
    If GetFromBuffer(u) Then
      gridITTOUT_PALET.ItemCount = u.Parent.Count
    Else
      gu.ITTOUT_PALET.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridITTOUT_PALET_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdITTOUT_PALETCfg_Click
        End If
    End If
End Sub

Private Sub gridITTOUT_PALET_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupITTOUT_PALET
End If
End Sub
Private Sub mnuITTOUT_PALETAdd_click()
   menuActionITTOUT_PALET = "ADD"
   menuTimerITTOUT_PALET.Enabled = True
End Sub
Private Sub mnuITTOUT_PALETEdit_click()
   menuActionITTOUT_PALET = "EDIT"
   menuTimerITTOUT_PALET.Enabled = True
End Sub
Private Sub mnuITTOUT_PALETDelete_click()
   menuActionITTOUT_PALET = "DEL"
   menuTimerITTOUT_PALET.Enabled = True
End Sub
Private Sub mnuITTOUT_PALETOpen_click()
   menuActionITTOUT_PALET = "RUN"
   menuTimerITTOUT_PALET.Enabled = True
End Sub
Private Sub mnuITTOUT_PALETRef_click()
   menuActionITTOUT_PALET = "REF"
   menuTimerITTOUT_PALET.Enabled = True
End Sub
  Private Sub mnuITTOUT_PALETCOPY_Click()
    On Error Resume Next
    If gridITTOUT_PALET.ItemCount = 0 Then Exit Sub
    If gridITTOUT_PALET.Row > 0 Then
     If gridITTOUT_PALET.RowIndex(gridITTOUT_PALET.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridITTOUT_PALET.RowBookmark(gridITTOUT_PALET.RowIndex(gridITTOUT_PALET.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuITTOUT_PALETCUT_Click()
    On Error Resume Next
    If gridITTOUT_PALET.ItemCount = 0 Then Exit Sub
    If gridITTOUT_PALET.Row > 0 Then
     If gridITTOUT_PALET.RowIndex(gridITTOUT_PALET.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridITTOUT_PALET.RowBookmark(gridITTOUT_PALET.RowIndex(gridITTOUT_PALET.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridITTOUT_PALET.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuITTOUT_PALETCHANGE_Click()
  On Error Resume Next
  If gridITTOUT_PALET.ItemCount = 0 Then Exit Sub
  If gridITTOUT_PALET.Row > 0 Then
   If gridITTOUT_PALET.RowIndex(gridITTOUT_PALET.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridITTOUT_PALET.RowBookmark(gridITTOUT_PALET.RowIndex(gridITTOUT_PALET.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridITTOUT_PALET.ItemCount = u.Parent.Count
      gridITTOUT_PALET.RefreshRowIndex gridITTOUT_PALET.RowIndex(gridITTOUT_PALET.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuITTOUT_PALETCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuITTOUT_PALETPrn_click()
   menuActionITTOUT_PALET = "PRN"
   menuTimerITTOUT_PALET.Enabled = True
End Sub
Private Sub mnuITTOUT_PALETCfg_click()
   menuActionITTOUT_PALET = "CFG"
   menuTimerITTOUT_PALET.Enabled = True
End Sub
Private Sub mnuITTOUT_PALETFind_click()
   menuActionITTOUT_PALET = "FND"
   menuTimerITTOUT_PALET.Enabled = True
End Sub
Private Sub mnuITTOUT_PALETAcc_click()
   menuActionITTOUT_PALET = "ACC"
   menuTimerITTOUT_PALET.Enabled = True
End Sub
Private Sub menuTimerITTOUT_PALET_timer()
   menuTimerITTOUT_PALET.Enabled = False
   If menuActionITTOUT_PALET = "ADD" Then cmdITTOUT_PALETAdd_Click
   If menuActionITTOUT_PALET = "EDIT" Then cmdITTOUT_PALETEdit_Click
   If menuActionITTOUT_PALET = "DEL" Then cmdITTOUT_PALETDel_Click
   If menuActionITTOUT_PALET = "RUN" Then cmdITTOUT_PALETRun_Click
   If menuActionITTOUT_PALET = "REF" Then cmdITTOUT_PALETRef_Click
   If menuActionITTOUT_PALET = "PRN" Then cmdITTOUT_PALETPrn_Click
   If menuActionITTOUT_PALET = "CFG" Then cmdITTOUT_PALETCfg_Click
   If menuActionITTOUT_PALET = "FND" Then cmdITTOUT_PALETFnd_Click
   If menuActionITTOUT_PALET = "ACC" Then cmdITTOUT_PALETAcc_Click
   menuActionITTOUT_PALET = ""
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

  LoadBtnPictures cmdITTOUT_LINESAdd, cmdITTOUT_LINESAdd.Tag
  LoadBtnPictures cmdITTOUT_LINESEdit, cmdITTOUT_LINESEdit.Tag
  LoadBtnPictures cmdITTOUT_LINESDel, cmdITTOUT_LINESDel.Tag
  LoadBtnPictures cmdITTOUT_LINESRef, cmdITTOUT_LINESRef.Tag
  LoadBtnPictures cmdITTOUT_LINESPrn, cmdITTOUT_LINESPrn.Tag
  LoadBtnPictures cmdITTOUT_LINESFnd, cmdITTOUT_LINESFnd.Tag
  LoadBtnPictures cmdITTOUT_LINESRun, cmdITTOUT_LINESRun.Tag
  LoadBtnPictures cmdITTOUT_LINESAcc, cmdITTOUT_LINESAcc.Tag
  LoadBtnPictures cmdITTOUT_LINESCfg, cmdITTOUT_LINESCfg.Tag
  Item.ITTOUT_LINES.PrepareGrid gridITTOUT_LINES
  LoadGridLayout gridITTOUT_LINES
  Set fndITTOUT_LINES = Nothing
  On Error Resume Next
  Set fndITTOUT_LINES = CreateObject("MTZ_JSetup.GridFinder")
  fndITTOUT_LINES.Init gridITTOUT_LINES
  LoadBtnPictures cmdITTOUT_PALETAdd, cmdITTOUT_PALETAdd.Tag
  LoadBtnPictures cmdITTOUT_PALETEdit, cmdITTOUT_PALETEdit.Tag
  LoadBtnPictures cmdITTOUT_PALETDel, cmdITTOUT_PALETDel.Tag
  LoadBtnPictures cmdITTOUT_PALETRef, cmdITTOUT_PALETRef.Tag
  LoadBtnPictures cmdITTOUT_PALETPrn, cmdITTOUT_PALETPrn.Tag
  LoadBtnPictures cmdITTOUT_PALETFnd, cmdITTOUT_PALETFnd.Tag
  LoadBtnPictures cmdITTOUT_PALETCfg, cmdITTOUT_PALETCfg.Tag
  LoadBtnPictures cmdITTOUT_PALETRun, cmdITTOUT_PALETRun.Tag
  LoadBtnPictures cmdITTOUT_PALETAcc, cmdITTOUT_PALETAcc.Tag
  gridITTOUT_PALET.Columns.Clear
  gridITTOUT_PALET.ItemCount = 0
  cmdITTOUT_PALETRef_Click
End Sub

'Действие при активизации таба
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

pnlITTOUT_LINES.RestorePosition
  gridITTOUT_LINES_RowColChange gridITTOUT_LINES.Row, -1
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
  pnlITTOUT_LINES.Move 0, 0, UserControl.Width, UserControl.Height
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
  Set fndITTOUT_LINES = Nothing
  Set fndITTOUT_PALET = Nothing
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





