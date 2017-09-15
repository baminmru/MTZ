VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnwpOut_line_main 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerwpout_pal 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerwpOut_line 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlwpOut_line 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdwpout_palAcc 
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
      Begin MTZ_PANEL.DropButton cmdwpout_palRun 
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
      Begin VB.CommandButton cmdwpout_palFnd 
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
      Begin VB.CommandButton cmdwpout_palCfg 
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
      Begin VB.CommandButton cmdwpout_palPrn 
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
      Begin VB.CommandButton cmdwpout_palRef 
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
      Begin VB.CommandButton cmdwpout_palDel 
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
      Begin VB.CommandButton cmdwpout_palEdit 
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
      Begin VB.CommandButton cmdwpout_palAdd 
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
      Begin GridEX20.GridEX gridwpout_pal 
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
         Column(1)       =   "vpnwpOut_line_main.ctx":0000
         Column(2)       =   "vpnwpOut_line_main.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnwpOut_line_main.ctx":016C
         FormatStyle(2)  =   "vpnwpOut_line_main.ctx":02C8
         FormatStyle(3)  =   "vpnwpOut_line_main.ctx":0378
         FormatStyle(4)  =   "vpnwpOut_line_main.ctx":042C
         FormatStyle(5)  =   "vpnwpOut_line_main.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnwpOut_line_main.ctx":05BC
      End
      Begin VB.CommandButton cmdwpOut_lineAcc 
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
      Begin MTZ_PANEL.DropButton cmdwpOut_lineRun 
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
      Begin VB.CommandButton cmdwpOut_lineFnd 
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
      Begin VB.CommandButton cmdwpOut_lineCfg 
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
      Begin VB.CommandButton cmdwpOut_linePrn 
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
      Begin VB.CommandButton cmdwpOut_lineRef 
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
      Begin VB.CommandButton cmdwpOut_lineDel 
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
      Begin VB.CommandButton cmdwpOut_lineEdit 
         Enabled         =   0   'False
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
      Begin VB.CommandButton cmdwpOut_lineAdd 
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
      Begin GridEX20.GridEX gridwpOut_line 
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
         Column(1)       =   "vpnwpOut_line_main.ctx":0794
         Column(2)       =   "vpnwpOut_line_main.ctx":085C
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnwpOut_line_main.ctx":0900
         FormatStyle(2)  =   "vpnwpOut_line_main.ctx":0A5C
         FormatStyle(3)  =   "vpnwpOut_line_main.ctx":0B0C
         FormatStyle(4)  =   "vpnwpOut_line_main.ctx":0BC0
         FormatStyle(5)  =   "vpnwpOut_line_main.ctx":0C98
         ImageCount      =   0
         PrinterProperties=   "vpnwpOut_line_main.ctx":0D50
      End
   End
   Begin VB.Menu mnuPopupwpOut_line 
      Caption         =   "Меню для Строки заказа"
      Visible         =   0   'False
      Begin VB.Menu mnuwpOut_lineAdd 
         Caption         =   "Создать"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuwpOut_lineEdit 
         Caption         =   "Свойства"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuwpOut_lineDelete 
         Caption         =   "Удалить"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuwpOut_lineOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuwpOut_lineRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuwpOut_lineS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuwpOut_lineBuffer 
         Caption         =   "Буфер"
         Enabled         =   0   'False
         Begin VB.Menu mnuwpOut_lineCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuwpOut_lineCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuwpOut_linePASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuwpOut_lineCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuwpOut_lineCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuwpOut_linePrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuwpOut_lineCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuwpOut_lineFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuwpOut_lineAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupwpout_pal 
      Caption         =   "Меню для Паллеты к строке"
      Visible         =   0   'False
      Begin VB.Menu mnuwpout_palAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuwpout_palEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuwpout_palDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuwpout_palOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuwpout_palRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuwpout_palS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuwpout_palBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuwpout_palCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuwpout_palCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuwpout_palPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuwpout_palCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuwpout_palCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuwpout_palPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuwpout_palCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuwpout_palFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuwpout_palAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnwpOut_line_main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель для работы со строками раздела
Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndwpOut_line As Object
Private menuActionwpOut_line As String
Private fndwpout_pal As Object
Private menuActionwpout_pal As String





Private Sub pnlwpOut_line_PositionChanged()
  pnlwpOut_line.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridwpOut_line_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdwpOut_lineCfg_Click
        End If
    End If
End Sub

Private Sub gridwpOut_line_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupwpOut_line
End If
End Sub
Private Sub mnuwpOut_lineAdd_click()
   menuActionwpOut_line = "ADD"
   menuTimerwpOut_line.Enabled = True
End Sub
Private Sub mnuwpOut_lineEdit_click()
   menuActionwpOut_line = "EDIT"
   menuTimerwpOut_line.Enabled = True
End Sub
Private Sub mnuwpOut_lineDelete_click()
   menuActionwpOut_line = "DEL"
   menuTimerwpOut_line.Enabled = True
End Sub
Private Sub mnuwpOut_lineOpen_click()
   menuActionwpOut_line = "RUN"
   menuTimerwpOut_line.Enabled = True
End Sub
Private Sub mnuwpOut_lineRef_click()
   menuActionwpOut_line = "REF"
   menuTimerwpOut_line.Enabled = True
End Sub
  Private Sub mnuwpOut_lineCOPY_Click()
    On Error Resume Next
    If gridwpOut_line.ItemCount = 0 Then Exit Sub
    If gridwpOut_line.Row > 0 Then
     If gridwpOut_line.RowIndex(gridwpOut_line.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridwpOut_line.RowBookmark(gridwpOut_line.RowIndex(gridwpOut_line.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuwpOut_lineCUT_Click()
    On Error Resume Next
    If gridwpOut_line.ItemCount = 0 Then Exit Sub
    If gridwpOut_line.Row > 0 Then
     If gridwpOut_line.RowIndex(gridwpOut_line.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridwpOut_line.RowBookmark(gridwpOut_line.RowIndex(gridwpOut_line.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridwpOut_line.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuwpOut_lineCHANGE_Click()
  On Error Resume Next
  If gridwpOut_line.ItemCount = 0 Then Exit Sub
  If gridwpOut_line.Row > 0 Then
   If gridwpOut_line.RowIndex(gridwpOut_line.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridwpOut_line.RowBookmark(gridwpOut_line.RowIndex(gridwpOut_line.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridwpOut_line.ItemCount = u.Parent.Count
      gridwpOut_line.RefreshRowIndex gridwpOut_line.RowIndex(gridwpOut_line.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuwpOut_lineCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuwpOut_linePrn_click()
   menuActionwpOut_line = "PRN"
   menuTimerwpOut_line.Enabled = True
End Sub
Private Sub mnuwpOut_lineCfg_click()
   menuActionwpOut_line = "CFG"
   menuTimerwpOut_line.Enabled = True
End Sub
Private Sub mnuwpOut_lineFind_click()
   menuActionwpOut_line = "FND"
   menuTimerwpOut_line.Enabled = True
End Sub
Private Sub mnuwpOut_lineAcc_click()
   menuActionwpOut_line = "ACC"
   menuTimerwpOut_line.Enabled = True
End Sub
Private Sub menuTimerwpOut_line_timer()
   menuTimerwpOut_line.Enabled = False
   If menuActionwpOut_line = "ADD" Then cmdwpOut_lineAdd_Click
   If menuActionwpOut_line = "EDIT" Then cmdwpOut_lineEdit_Click
   If menuActionwpOut_line = "DEL" Then cmdwpOut_lineDel_Click
   If menuActionwpOut_line = "RUN" Then cmdwpOut_lineRun_Click
   If menuActionwpOut_line = "REF" Then cmdwpOut_lineRef_Click
   If menuActionwpOut_line = "PRN" Then cmdwpOut_linePrn_Click
   If menuActionwpOut_line = "CFG" Then cmdwpOut_lineCfg_Click
   If menuActionwpOut_line = "FND" Then cmdwpOut_lineFnd_Click
   If menuActionwpOut_line = "ACC" Then cmdwpOut_lineAcc_Click
   menuActionwpOut_line = ""
End Sub
Private Sub cmdwpOut_lineCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridwpOut_line, "gridwpOut_line"
Set jset = Nothing
End Sub

Private Sub cmdwpOut_linePrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridwpOut_line, "Строки заказа"
Set jset = Nothing
End Sub

Private Sub cmdwpOut_lineRef_Click()
  On Error Resume Next
  Item.wpOut_line.Refresh
  gridwpOut_line.ItemCount = Item.wpOut_line.Count
  gridwpOut_line.Refetch
  gridwpOut_line.Refresh
End Sub
Private Sub cmdwpOut_lineAcc_Click()
On Error Resume Next
If gridwpOut_line.ItemCount = 0 Then Exit Sub
If gridwpOut_line.Row > 0 Then
 If gridwpOut_line.RowIndex(gridwpOut_line.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridwpOut_line.RowBookmark(gridwpOut_line.RowIndex(gridwpOut_line.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdwpOut_lineEdit_Click()
  On Error Resume Next
End Sub
Private Sub cmdwpOut_lineDel_Click()
  On Error Resume Next
End Sub
Private Sub cmdwpOut_lineAdd_Click()
  On Error Resume Next
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdwpOut_lineFnd_Click()
  On Error Resume Next
  fndwpOut_line.ShowForm
End Sub
Private Sub cmdwpOut_lineRun_Click()
  On Error Resume Next
  gridwpOut_line_DblClick
End Sub
Private Sub gridwpOut_line_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.wpOut_line.LoadRow gridwpOut_line, RowIndex, Bookmark, Values
End Sub
Private Sub gridwpOut_line_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
   Cancel = True
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridwpOut_line_DblClick()
  cmdwpOut_lineEdit_Click
End Sub
Private Sub gridwpOut_line_KeyPress(KeyAscii As Integer)
  If gridwpOut_line.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndwpOut_line.FindOnPress KeyAscii
End Sub

Private Sub pnlwpOut_line_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridwpOut_line.Left = Left
  gridwpOut_line.Top = Top + 25 * Screen.TwipsPerPixelY
  gridwpOut_line.Width = Width
  gridwpOut_line.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdwpOut_lineAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdwpOut_lineEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdwpOut_lineDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdwpOut_lineRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdwpOut_linePrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdwpOut_lineCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdwpOut_lineFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdwpOut_lineRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdwpOut_lineAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdwpOut_lineAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdwpOut_lineEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdwpOut_lineDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdwpOut_lineRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdwpOut_linePrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdwpOut_lineCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdwpOut_lineFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdwpOut_lineRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdwpOut_lineAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuwpOut_linePASTE_Click()
On Error Resume Next
End Sub
Private Sub cmdwpout_palCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridwpout_pal, "gridwpout_pal"
Set jset = Nothing
End Sub

Private Sub cmdwpout_palPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridwpout_pal, "Паллеты к строке"
Set jset = Nothing
End Sub

Private Sub cmdwpout_palAcc_Click()
On Error Resume Next
If gridwpout_pal.ItemCount = 0 Then Exit Sub
If gridwpout_pal.Row > 0 Then
 If gridwpout_pal.RowIndex(gridwpout_pal.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridwpout_pal.RowBookmark(gridwpout_pal.RowIndex(gridwpout_pal.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdwpout_palFnd_Click()
  On Error Resume Next
  fndwpout_pal.ShowForm
End Sub
Private Sub cmdwpout_palRun_Click()
  On Error Resume Next
  gridwpout_pal_DblClick
End Sub
Private Sub pnlwpOut_line_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridwpout_pal.Left = Left
  gridwpout_pal.Top = Top + 25 * Screen.TwipsPerPixelY
  gridwpout_pal.Width = Width
  gridwpout_pal.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdwpout_palAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdwpout_palEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdwpout_palDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdwpout_palRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdwpout_palPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdwpout_palCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdwpout_palFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdwpout_palRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdwpout_palAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdwpout_palAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdwpout_palEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdwpout_palDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdwpout_palRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdwpout_palPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdwpout_palCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdwpout_palFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdwpout_palRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdwpout_palAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdwpout_palRef_Click()
  On Error Resume Next
If gridwpOut_line.ItemCount = 0 Then Exit Sub
If gridwpOut_line.Row > 0 Then
 If gridwpOut_line.RowIndex(gridwpOut_line.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridwpOut_line.RowBookmark(gridwpOut_line.RowIndex(gridwpOut_line.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.wpout_pal.Refresh
   gridwpout_pal.ItemCount = gu.wpout_pal.Count
   gridwpout_pal.Refetch
   gridwpout_pal.Refresh
 Else
  gridwpout_pal.Columns.Clear
  gridwpout_pal.ItemCount = 0
 End If
Else
 gridwpout_pal.Columns.Clear
 gridwpout_pal.ItemCount = 0
End If
End Sub
Private Sub cmdwpout_palEdit_Click()
    If gridwpout_pal.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridwpout_pal.RowBookmark(gridwpout_pal.RowIndex(gridwpout_pal.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmwpout_pal_main.Item = u
again:     frmwpout_pal_main.NotFirstTime = False
    frmwpout_pal_main.OnInit
    frmwpout_pal_main.Show vbModal
    If frmwpout_pal_main.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridwpout_pal.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdwpout_palDel_Click()
  On Error Resume Next
  gridwpout_pal.Delete
End Sub
Private Sub cmdwpout_palAdd_Click()
  On Error Resume Next
    Dim gu As Object
    Dim u As Object
If gridwpOut_line.ItemCount = 0 Then Exit Sub
    Dim bm
    bm = gridwpOut_line.RowBookmark(gridwpOut_line.RowIndex(gridwpOut_line.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set u = gu.wpout_pal.Add()
   Call GetNumValue(u, "sequence", "{C51BB549-613B-4EE8-A257-7C21F0C3D585}", Now, "%P", "")

      Set frmwpout_pal_main.Item = u
again:       frmwpout_pal_main.NotFirstTime = False
      frmwpout_pal_main.OnInit
      frmwpout_pal_main.Show vbModal
      If frmwpout_pal_main.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridwpout_pal.ItemCount = gu.wpout_pal.Count
        gridwpout_pal.Refresh
        gridwpout_pal.RefreshGroups
        gridwpout_pal.RefreshSort
        gridwpout_pal.MoveToBookmark u.ID & "wpout_pal"
      Else
        gu.wpout_pal.Delete u.ID
        gu.wpout_pal.Remove u.ID
      End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridwpOut_line_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridwpOut_line.ItemCount = 0 Then
  gridwpout_pal.ItemCount = 0
  Exit Sub
End If
If gridwpOut_line.Row > 0 Then
  If LastRow <> gridwpOut_line.Row And LastRow > 0 Then
    gridwpOut_line.GetRowData(LastRow).RowStyle = "Default"
    gridwpOut_line.GetRowData(gridwpOut_line.Row).RowStyle = "SelectedRow"
  End If
 If gridwpOut_line.RowIndex(gridwpOut_line.Row) > 0 Then
  If LastRow <> gridwpOut_line.Row Or gridwpout_pal.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridwpOut_line.RowBookmark(gridwpOut_line.RowIndex(gridwpOut_line.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.wpout_pal.PrepareGrid gridwpout_pal
  gridwpout_pal.ItemCount = 0
    LoadGridLayout gridwpout_pal
    Set fndwpout_pal = Nothing
    Set fndwpout_pal = CreateObject("MTZ_JSetup.GridFinder")
    fndwpout_pal.Init gridwpout_pal
  gridwpout_pal.ItemCount = gu.wpout_pal.Count
  End If
 End If
End If
End Sub
Private Sub gridwpout_pal_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
    If gridwpOut_line.ItemCount = 0 Then Exit Sub
    If gridwpout_pal.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridwpOut_line.RowBookmark(gridwpOut_line.RowIndex(gridwpOut_line.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.wpout_pal.LoadRow gridwpout_pal, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridwpout_pal_KeyPress(KeyAscii As Integer)
  If gridwpout_pal.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndwpout_pal.FindOnPress KeyAscii
End Sub

Private Sub gridwpout_pal_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If gridwpout_pal.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridwpout_pal.RowBookmark(gridwpout_pal.RowIndex(gridwpout_pal.Row))
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
Private Sub gridwpout_pal_DblClick()
    cmdwpout_palEdit_Click
End Sub
Private Sub gridwpout_pal_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridwpout_pal.ItemCount = 0 Then Exit Sub
 If gridwpout_pal.Row > 0 Then
   If LastRow <> gridwpout_pal.Row And LastRow > 0 Then
     gridwpout_pal.GetRowData(LastRow).RowStyle = "Default"
     gridwpout_pal.GetRowData(gridwpout_pal.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuwpout_palPASTE_Click()
On Error Resume Next
    If gridwpOut_line.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridwpOut_line.RowBookmark(gridwpOut_line.RowIndex(gridwpOut_line.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.wpout_pal.Add()
    If GetFromBuffer(u) Then
      gridwpout_pal.ItemCount = u.Parent.Count
    Else
      gu.wpout_pal.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridwpout_pal_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdwpout_palCfg_Click
        End If
    End If
End Sub

Private Sub gridwpout_pal_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupwpout_pal
End If
End Sub
Private Sub mnuwpout_palAdd_click()
   menuActionwpout_pal = "ADD"
   menuTimerwpout_pal.Enabled = True
End Sub
Private Sub mnuwpout_palEdit_click()
   menuActionwpout_pal = "EDIT"
   menuTimerwpout_pal.Enabled = True
End Sub
Private Sub mnuwpout_palDelete_click()
   menuActionwpout_pal = "DEL"
   menuTimerwpout_pal.Enabled = True
End Sub
Private Sub mnuwpout_palOpen_click()
   menuActionwpout_pal = "RUN"
   menuTimerwpout_pal.Enabled = True
End Sub
Private Sub mnuwpout_palRef_click()
   menuActionwpout_pal = "REF"
   menuTimerwpout_pal.Enabled = True
End Sub
  Private Sub mnuwpout_palCOPY_Click()
    On Error Resume Next
    If gridwpout_pal.ItemCount = 0 Then Exit Sub
    If gridwpout_pal.Row > 0 Then
     If gridwpout_pal.RowIndex(gridwpout_pal.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridwpout_pal.RowBookmark(gridwpout_pal.RowIndex(gridwpout_pal.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuwpout_palCUT_Click()
    On Error Resume Next
    If gridwpout_pal.ItemCount = 0 Then Exit Sub
    If gridwpout_pal.Row > 0 Then
     If gridwpout_pal.RowIndex(gridwpout_pal.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridwpout_pal.RowBookmark(gridwpout_pal.RowIndex(gridwpout_pal.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridwpout_pal.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuwpout_palCHANGE_Click()
  On Error Resume Next
  If gridwpout_pal.ItemCount = 0 Then Exit Sub
  If gridwpout_pal.Row > 0 Then
   If gridwpout_pal.RowIndex(gridwpout_pal.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridwpout_pal.RowBookmark(gridwpout_pal.RowIndex(gridwpout_pal.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridwpout_pal.ItemCount = u.Parent.Count
      gridwpout_pal.RefreshRowIndex gridwpout_pal.RowIndex(gridwpout_pal.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuwpout_palCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuwpout_palPrn_click()
   menuActionwpout_pal = "PRN"
   menuTimerwpout_pal.Enabled = True
End Sub
Private Sub mnuwpout_palCfg_click()
   menuActionwpout_pal = "CFG"
   menuTimerwpout_pal.Enabled = True
End Sub
Private Sub mnuwpout_palFind_click()
   menuActionwpout_pal = "FND"
   menuTimerwpout_pal.Enabled = True
End Sub
Private Sub mnuwpout_palAcc_click()
   menuActionwpout_pal = "ACC"
   menuTimerwpout_pal.Enabled = True
End Sub
Private Sub menuTimerwpout_pal_timer()
   menuTimerwpout_pal.Enabled = False
   If menuActionwpout_pal = "ADD" Then cmdwpout_palAdd_Click
   If menuActionwpout_pal = "EDIT" Then cmdwpout_palEdit_Click
   If menuActionwpout_pal = "DEL" Then cmdwpout_palDel_Click
   If menuActionwpout_pal = "RUN" Then cmdwpout_palRun_Click
   If menuActionwpout_pal = "REF" Then cmdwpout_palRef_Click
   If menuActionwpout_pal = "PRN" Then cmdwpout_palPrn_Click
   If menuActionwpout_pal = "CFG" Then cmdwpout_palCfg_Click
   If menuActionwpout_pal = "FND" Then cmdwpout_palFnd_Click
   If menuActionwpout_pal = "ACC" Then cmdwpout_palAcc_Click
   menuActionwpout_pal = ""
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

  LoadBtnPictures cmdwpOut_lineAdd, cmdwpOut_lineAdd.Tag
  LoadBtnPictures cmdwpOut_lineEdit, cmdwpOut_lineEdit.Tag
  LoadBtnPictures cmdwpOut_lineDel, cmdwpOut_lineDel.Tag
  LoadBtnPictures cmdwpOut_lineRef, cmdwpOut_lineRef.Tag
  LoadBtnPictures cmdwpOut_linePrn, cmdwpOut_linePrn.Tag
  LoadBtnPictures cmdwpOut_lineFnd, cmdwpOut_lineFnd.Tag
  LoadBtnPictures cmdwpOut_lineRun, cmdwpOut_lineRun.Tag
  LoadBtnPictures cmdwpOut_lineAcc, cmdwpOut_lineAcc.Tag
  LoadBtnPictures cmdwpOut_lineCfg, cmdwpOut_lineCfg.Tag
  Item.wpOut_line.PrepareGrid gridwpOut_line
  LoadGridLayout gridwpOut_line
  Set fndwpOut_line = Nothing
  On Error Resume Next
  Set fndwpOut_line = CreateObject("MTZ_JSetup.GridFinder")
  fndwpOut_line.Init gridwpOut_line
  LoadBtnPictures cmdwpout_palAdd, cmdwpout_palAdd.Tag
  LoadBtnPictures cmdwpout_palEdit, cmdwpout_palEdit.Tag
  LoadBtnPictures cmdwpout_palDel, cmdwpout_palDel.Tag
  LoadBtnPictures cmdwpout_palRef, cmdwpout_palRef.Tag
  LoadBtnPictures cmdwpout_palPrn, cmdwpout_palPrn.Tag
  LoadBtnPictures cmdwpout_palFnd, cmdwpout_palFnd.Tag
  LoadBtnPictures cmdwpout_palCfg, cmdwpout_palCfg.Tag
  LoadBtnPictures cmdwpout_palRun, cmdwpout_palRun.Tag
  LoadBtnPictures cmdwpout_palAcc, cmdwpout_palAcc.Tag
  gridwpout_pal.Columns.Clear
  gridwpout_pal.ItemCount = 0
  cmdwpout_palRef_Click
End Sub

'Действие при активизации таба
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

pnlwpOut_line.RestorePosition
  gridwpOut_line_RowColChange gridwpOut_line.Row, -1
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
  pnlwpOut_line.Move 0, 0, UserControl.Width, UserControl.Height
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
  Set fndwpOut_line = Nothing
  Set fndwpout_pal = Nothing
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





