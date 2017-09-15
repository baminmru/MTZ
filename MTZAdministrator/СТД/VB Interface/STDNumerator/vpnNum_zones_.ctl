VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnNum_zones_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerNum_Values 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerNum_zones 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlNum_zones 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdNum_ValuesAcc 
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
      Begin MTZ_PANEL.DropButton cmdNum_ValuesRun 
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
      Begin VB.CommandButton cmdNum_ValuesFnd 
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
      Begin VB.CommandButton cmdNum_ValuesCfg 
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
      Begin VB.CommandButton cmdNum_ValuesPrn 
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
      Begin VB.CommandButton cmdNum_ValuesRef 
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
      Begin VB.CommandButton cmdNum_ValuesDel 
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
      Begin VB.CommandButton cmdNum_ValuesEdit 
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
      Begin VB.CommandButton cmdNum_ValuesAdd 
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
      Begin GridEX20.GridEX gridNum_Values 
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
         Column(1)       =   "vpnNum_zones_.ctx":0000
         Column(2)       =   "vpnNum_zones_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnNum_zones_.ctx":016C
         FormatStyle(2)  =   "vpnNum_zones_.ctx":02C8
         FormatStyle(3)  =   "vpnNum_zones_.ctx":0378
         FormatStyle(4)  =   "vpnNum_zones_.ctx":042C
         FormatStyle(5)  =   "vpnNum_zones_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnNum_zones_.ctx":05BC
      End
      Begin VB.CommandButton cmdNum_zonesAcc 
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
      Begin MTZ_PANEL.DropButton cmdNum_zonesRun 
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
      Begin VB.CommandButton cmdNum_zonesFnd 
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
      Begin VB.CommandButton cmdNum_zonesCfg 
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
      Begin VB.CommandButton cmdNum_zonesPrn 
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
      Begin VB.CommandButton cmdNum_zonesRef 
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
      Begin VB.CommandButton cmdNum_zonesDel 
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
      Begin VB.CommandButton cmdNum_zonesEdit 
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
      Begin VB.CommandButton cmdNum_zonesAdd 
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
      Begin GridEX20.GridEX gridNum_zones 
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
         Column(1)       =   "vpnNum_zones_.ctx":0794
         Column(2)       =   "vpnNum_zones_.ctx":085C
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnNum_zones_.ctx":0900
         FormatStyle(2)  =   "vpnNum_zones_.ctx":0A5C
         FormatStyle(3)  =   "vpnNum_zones_.ctx":0B0C
         FormatStyle(4)  =   "vpnNum_zones_.ctx":0BC0
         FormatStyle(5)  =   "vpnNum_zones_.ctx":0C98
         ImageCount      =   0
         PrinterProperties=   "vpnNum_zones_.ctx":0D50
      End
   End
   Begin VB.Menu mnuPopupNum_zones 
      Caption         =   "Меню для Зоны"
      Visible         =   0   'False
      Begin VB.Menu mnuNum_zonesAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuNum_zonesEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuNum_zonesDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuNum_zonesOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuNum_zonesRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuNum_zonesS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuNum_zonesBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuNum_zonesCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuNum_zonesCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuNum_zonesPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuNum_zonesCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuNum_zonesCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuNum_zonesPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuNum_zonesCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuNum_zonesFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuNum_zonesAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupNum_Values 
      Caption         =   "Меню для Номера"
      Visible         =   0   'False
      Begin VB.Menu mnuNum_ValuesAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuNum_ValuesEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuNum_ValuesDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuNum_ValuesOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuNum_ValuesRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuNum_ValuesS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuNum_ValuesBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuNum_ValuesCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuNum_ValuesCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuNum_ValuesPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuNum_ValuesCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuNum_ValuesCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuNum_ValuesPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuNum_ValuesCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuNum_ValuesFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuNum_ValuesAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnNum_zones_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель для работы со строками раздела Зоны уникальных нумеров
Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndNum_zones As Object
Private menuActionNum_zones As String
Private fndNum_Values As Object
Private menuActionNum_Values As String





Private Sub pnlNum_zones_PositionChanged()
  pnlNum_zones.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridNum_zones_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdNum_zonesCfg_Click
        End If
    End If
End Sub

Private Sub gridNum_zones_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupNum_zones
End If
End Sub
Private Sub mnuNum_zonesAdd_click()
   menuActionNum_zones = "ADD"
   menuTimerNum_zones.Enabled = True
End Sub
Private Sub mnuNum_zonesEdit_click()
   menuActionNum_zones = "EDIT"
   menuTimerNum_zones.Enabled = True
End Sub
Private Sub mnuNum_zonesDelete_click()
   menuActionNum_zones = "DEL"
   menuTimerNum_zones.Enabled = True
End Sub
Private Sub mnuNum_zonesOpen_click()
   menuActionNum_zones = "RUN"
   menuTimerNum_zones.Enabled = True
End Sub
Private Sub mnuNum_zonesRef_click()
   menuActionNum_zones = "REF"
   menuTimerNum_zones.Enabled = True
End Sub
  Private Sub mnuNum_zonesCOPY_Click()
    On Error Resume Next
    If gridNum_zones.ItemCount = 0 Then Exit Sub
    If gridNum_zones.Row > 0 Then
     If gridNum_zones.RowIndex(gridNum_zones.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridNum_zones.RowBookmark(gridNum_zones.RowIndex(gridNum_zones.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuNum_zonesCUT_Click()
    On Error Resume Next
    If gridNum_zones.ItemCount = 0 Then Exit Sub
    If gridNum_zones.Row > 0 Then
     If gridNum_zones.RowIndex(gridNum_zones.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridNum_zones.RowBookmark(gridNum_zones.RowIndex(gridNum_zones.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridNum_zones.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuNum_zonesCHANGE_Click()
  On Error Resume Next
  If gridNum_zones.ItemCount = 0 Then Exit Sub
  If gridNum_zones.Row > 0 Then
   If gridNum_zones.RowIndex(gridNum_zones.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridNum_zones.RowBookmark(gridNum_zones.RowIndex(gridNum_zones.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridNum_zones.ItemCount = u.Parent.Count
      gridNum_zones.RefreshRowIndex gridNum_zones.RowIndex(gridNum_zones.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuNum_zonesCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuNum_zonesPrn_click()
   menuActionNum_zones = "PRN"
   menuTimerNum_zones.Enabled = True
End Sub
Private Sub mnuNum_zonesCfg_click()
   menuActionNum_zones = "CFG"
   menuTimerNum_zones.Enabled = True
End Sub
Private Sub mnuNum_zonesFind_click()
   menuActionNum_zones = "FND"
   menuTimerNum_zones.Enabled = True
End Sub
Private Sub mnuNum_zonesAcc_click()
   menuActionNum_zones = "ACC"
   menuTimerNum_zones.Enabled = True
End Sub
Private Sub menuTimerNum_zones_timer()
   menuTimerNum_zones.Enabled = False
   If menuActionNum_zones = "ADD" Then cmdNum_zonesAdd_Click
   If menuActionNum_zones = "EDIT" Then cmdNum_zonesEdit_Click
   If menuActionNum_zones = "DEL" Then cmdNum_zonesDel_Click
   If menuActionNum_zones = "RUN" Then cmdNum_zonesRun_Click
   If menuActionNum_zones = "REF" Then cmdNum_zonesRef_Click
   If menuActionNum_zones = "PRN" Then cmdNum_zonesPrn_Click
   If menuActionNum_zones = "CFG" Then cmdNum_zonesCfg_Click
   If menuActionNum_zones = "FND" Then cmdNum_zonesFnd_Click
   If menuActionNum_zones = "ACC" Then cmdNum_zonesAcc_Click
   menuActionNum_zones = ""
End Sub
Private Sub cmdNum_zonesCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridNum_zones, "gridNum_zones"
Set jset = Nothing
End Sub

Private Sub cmdNum_zonesPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridNum_zones, "Зоны"
Set jset = Nothing
End Sub

Private Sub cmdNum_zonesRef_Click()
  On Error Resume Next
  Item.Num_zones.Refresh
  gridNum_zones.ItemCount = Item.Num_zones.Count
  gridNum_zones.Refetch
  gridNum_zones.Refresh
End Sub
Private Sub cmdNum_zonesAcc_Click()
On Error Resume Next
If gridNum_zones.ItemCount = 0 Then Exit Sub
If gridNum_zones.Row > 0 Then
 If gridNum_zones.RowIndex(gridNum_zones.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridNum_zones.RowBookmark(gridNum_zones.RowIndex(gridNum_zones.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdNum_zonesEdit_Click()
  On Error Resume Next
If gridNum_zones.ItemCount = 0 Then Exit Sub
If gridNum_zones.Row > 0 Then
 If gridNum_zones.RowIndex(gridNum_zones.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridNum_zones.RowBookmark(gridNum_zones.RowIndex(gridNum_zones.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmNum_zones_.Item = u
again:     frmNum_zones_.NotFirstTime = False
    frmNum_zones_.OnInit
    frmNum_zones_.Show vbModal
    If frmNum_zones_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridNum_zones.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdNum_zonesDel_Click()
  On Error Resume Next
  gridNum_zones.Delete
End Sub
Private Sub cmdNum_zonesAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.Num_zones.Add()

      Set frmNum_zones_.Item = u
again:       frmNum_zones_.NotFirstTime = False
      frmNum_zones_.OnInit
      frmNum_zones_.Show vbModal
      If frmNum_zones_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridNum_zones.ItemCount = Item.Num_zones.Count
        gridNum_zones.Refresh
        gridNum_zones.RefreshGroups
        gridNum_zones.RefreshSort
        gridNum_zones.MoveToBookmark u.ID & "Num_zones"
      Else
        Item.Num_zones.Delete u.ID
        Item.Num_zones.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdNum_zonesFnd_Click()
  On Error Resume Next
  fndNum_zones.ShowForm
End Sub
Private Sub cmdNum_zonesRun_Click()
  On Error Resume Next
  gridNum_zones_DblClick
End Sub
Private Sub gridNum_zones_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.Num_zones.LoadRow gridNum_zones, RowIndex, Bookmark, Values
End Sub
Private Sub gridNum_zones_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridNum_zones.ItemCount = 0 Then Exit Sub
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
Private Sub gridNum_zones_DblClick()
  cmdNum_zonesEdit_Click
End Sub
Private Sub gridNum_zones_KeyPress(KeyAscii As Integer)
  If gridNum_zones.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndNum_zones.FindOnPress KeyAscii
End Sub

Private Sub pnlNum_zones_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridNum_zones.Left = Left
  gridNum_zones.Top = Top + 25 * Screen.TwipsPerPixelY
  gridNum_zones.Width = Width
  gridNum_zones.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdNum_zonesAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNum_zonesEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNum_zonesDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNum_zonesRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNum_zonesPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNum_zonesCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNum_zonesFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNum_zonesRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNum_zonesAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNum_zonesAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdNum_zonesEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdNum_zonesDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdNum_zonesRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdNum_zonesPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdNum_zonesCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdNum_zonesFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdNum_zonesRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdNum_zonesAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuNum_zonesPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.Num_zones.Add()
    If GetFromBuffer(u) Then
      gridNum_zones.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdNum_ValuesCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridNum_Values, "gridNum_Values"
Set jset = Nothing
End Sub

Private Sub cmdNum_ValuesPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridNum_Values, "Номера"
Set jset = Nothing
End Sub

Private Sub cmdNum_ValuesAcc_Click()
On Error Resume Next
If gridNum_Values.ItemCount = 0 Then Exit Sub
If gridNum_Values.Row > 0 Then
 If gridNum_Values.RowIndex(gridNum_Values.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridNum_Values.RowBookmark(gridNum_Values.RowIndex(gridNum_Values.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdNum_ValuesFnd_Click()
  On Error Resume Next
  fndNum_Values.ShowForm
End Sub
Private Sub cmdNum_ValuesRun_Click()
  On Error Resume Next
  gridNum_Values_DblClick
End Sub
Private Sub pnlNum_zones_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridNum_Values.Left = Left
  gridNum_Values.Top = Top + 25 * Screen.TwipsPerPixelY
  gridNum_Values.Width = Width
  gridNum_Values.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdNum_ValuesAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNum_ValuesEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNum_ValuesDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNum_ValuesRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNum_ValuesPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNum_ValuesCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNum_ValuesFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNum_ValuesRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNum_ValuesAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNum_ValuesAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdNum_ValuesEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdNum_ValuesDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdNum_ValuesRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdNum_ValuesPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdNum_ValuesCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdNum_ValuesFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdNum_ValuesRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdNum_ValuesAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdNum_ValuesRef_Click()
  On Error Resume Next
If gridNum_zones.ItemCount = 0 Then Exit Sub
If gridNum_zones.Row > 0 Then
 If gridNum_zones.RowIndex(gridNum_zones.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridNum_zones.RowBookmark(gridNum_zones.RowIndex(gridNum_zones.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.Num_Values.Refresh
   gridNum_Values.ItemCount = gu.Num_Values.Count
   gridNum_Values.Refetch
   gridNum_Values.Refresh
 Else
  gridNum_Values.Columns.Clear
  gridNum_Values.ItemCount = 0
 End If
Else
 gridNum_Values.Columns.Clear
 gridNum_Values.ItemCount = 0
End If
End Sub
Private Sub cmdNum_ValuesEdit_Click()
    If gridNum_Values.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridNum_Values.RowBookmark(gridNum_Values.RowIndex(gridNum_Values.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmNum_Values_.Item = u
again:     frmNum_Values_.NotFirstTime = False
    frmNum_Values_.OnInit
    frmNum_Values_.Show vbModal
    If frmNum_Values_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridNum_Values.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdNum_ValuesDel_Click()
  On Error Resume Next
  gridNum_Values.Delete
End Sub
Private Sub cmdNum_ValuesAdd_Click()
  On Error Resume Next
    Dim gu As Object
    Dim u As Object
If gridNum_zones.ItemCount = 0 Then Exit Sub
    Dim bm
    bm = gridNum_zones.RowBookmark(gridNum_zones.RowIndex(gridNum_zones.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set u = gu.Num_Values.Add()

      Set frmNum_Values_.Item = u
again:       frmNum_Values_.NotFirstTime = False
      frmNum_Values_.OnInit
      frmNum_Values_.Show vbModal
      If frmNum_Values_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridNum_Values.ItemCount = gu.Num_Values.Count
        gridNum_Values.Refresh
        gridNum_Values.RefreshGroups
        gridNum_Values.RefreshSort
        gridNum_Values.MoveToBookmark u.ID & "Num_Values"
      Else
        gu.Num_Values.Delete u.ID
        gu.Num_Values.Remove u.ID
      End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridNum_zones_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridNum_zones.ItemCount = 0 Then
  gridNum_Values.ItemCount = 0
  Exit Sub
End If
If gridNum_zones.Row > 0 Then
  If LastRow <> gridNum_zones.Row And LastRow > 0 Then
    gridNum_zones.GetRowData(LastRow).RowStyle = "Default"
    gridNum_zones.GetRowData(gridNum_zones.Row).RowStyle = "SelectedRow"
  End If
 If gridNum_zones.RowIndex(gridNum_zones.Row) > 0 Then
  If LastRow <> gridNum_zones.Row Or gridNum_Values.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridNum_zones.RowBookmark(gridNum_zones.RowIndex(gridNum_zones.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.Num_Values.PrepareGrid gridNum_Values
  gridNum_Values.ItemCount = 0
    LoadGridLayout gridNum_Values
    Set fndNum_Values = Nothing
    Set fndNum_Values = CreateObject("MTZ_JSetup.GridFinder")
    fndNum_Values.Init gridNum_Values
  gridNum_Values.ItemCount = gu.Num_Values.Count
  End If
 End If
End If
End Sub
Private Sub gridNum_Values_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
    If gridNum_zones.ItemCount = 0 Then Exit Sub
    If gridNum_Values.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridNum_zones.RowBookmark(gridNum_zones.RowIndex(gridNum_zones.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.Num_Values.LoadRow gridNum_Values, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridNum_Values_KeyPress(KeyAscii As Integer)
  If gridNum_Values.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndNum_Values.FindOnPress KeyAscii
End Sub

Private Sub gridNum_Values_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If gridNum_Values.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridNum_Values.RowBookmark(gridNum_Values.RowIndex(gridNum_Values.Row))
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
Private Sub gridNum_Values_DblClick()
    cmdNum_ValuesEdit_Click
End Sub
Private Sub gridNum_Values_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridNum_Values.ItemCount = 0 Then Exit Sub
 If gridNum_Values.Row > 0 Then
   If LastRow <> gridNum_Values.Row And LastRow > 0 Then
     gridNum_Values.GetRowData(LastRow).RowStyle = "Default"
     gridNum_Values.GetRowData(gridNum_Values.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuNum_ValuesPASTE_Click()
On Error Resume Next
    If gridNum_zones.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridNum_zones.RowBookmark(gridNum_zones.RowIndex(gridNum_zones.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.Num_Values.Add()
    If GetFromBuffer(u) Then
      gridNum_Values.ItemCount = u.Parent.Count
    Else
      gu.Num_Values.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridNum_Values_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdNum_ValuesCfg_Click
        End If
    End If
End Sub

Private Sub gridNum_Values_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupNum_Values
End If
End Sub
Private Sub mnuNum_ValuesAdd_click()
   menuActionNum_Values = "ADD"
   menuTimerNum_Values.Enabled = True
End Sub
Private Sub mnuNum_ValuesEdit_click()
   menuActionNum_Values = "EDIT"
   menuTimerNum_Values.Enabled = True
End Sub
Private Sub mnuNum_ValuesDelete_click()
   menuActionNum_Values = "DEL"
   menuTimerNum_Values.Enabled = True
End Sub
Private Sub mnuNum_ValuesOpen_click()
   menuActionNum_Values = "RUN"
   menuTimerNum_Values.Enabled = True
End Sub
Private Sub mnuNum_ValuesRef_click()
   menuActionNum_Values = "REF"
   menuTimerNum_Values.Enabled = True
End Sub
  Private Sub mnuNum_ValuesCOPY_Click()
    On Error Resume Next
    If gridNum_Values.ItemCount = 0 Then Exit Sub
    If gridNum_Values.Row > 0 Then
     If gridNum_Values.RowIndex(gridNum_Values.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridNum_Values.RowBookmark(gridNum_Values.RowIndex(gridNum_Values.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuNum_ValuesCUT_Click()
    On Error Resume Next
    If gridNum_Values.ItemCount = 0 Then Exit Sub
    If gridNum_Values.Row > 0 Then
     If gridNum_Values.RowIndex(gridNum_Values.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridNum_Values.RowBookmark(gridNum_Values.RowIndex(gridNum_Values.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridNum_Values.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuNum_ValuesCHANGE_Click()
  On Error Resume Next
  If gridNum_Values.ItemCount = 0 Then Exit Sub
  If gridNum_Values.Row > 0 Then
   If gridNum_Values.RowIndex(gridNum_Values.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridNum_Values.RowBookmark(gridNum_Values.RowIndex(gridNum_Values.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridNum_Values.ItemCount = u.Parent.Count
      gridNum_Values.RefreshRowIndex gridNum_Values.RowIndex(gridNum_Values.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuNum_ValuesCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuNum_ValuesPrn_click()
   menuActionNum_Values = "PRN"
   menuTimerNum_Values.Enabled = True
End Sub
Private Sub mnuNum_ValuesCfg_click()
   menuActionNum_Values = "CFG"
   menuTimerNum_Values.Enabled = True
End Sub
Private Sub mnuNum_ValuesFind_click()
   menuActionNum_Values = "FND"
   menuTimerNum_Values.Enabled = True
End Sub
Private Sub mnuNum_ValuesAcc_click()
   menuActionNum_Values = "ACC"
   menuTimerNum_Values.Enabled = True
End Sub
Private Sub menuTimerNum_Values_timer()
   menuTimerNum_Values.Enabled = False
   If menuActionNum_Values = "ADD" Then cmdNum_ValuesAdd_Click
   If menuActionNum_Values = "EDIT" Then cmdNum_ValuesEdit_Click
   If menuActionNum_Values = "DEL" Then cmdNum_ValuesDel_Click
   If menuActionNum_Values = "RUN" Then cmdNum_ValuesRun_Click
   If menuActionNum_Values = "REF" Then cmdNum_ValuesRef_Click
   If menuActionNum_Values = "PRN" Then cmdNum_ValuesPrn_Click
   If menuActionNum_Values = "CFG" Then cmdNum_ValuesCfg_Click
   If menuActionNum_Values = "FND" Then cmdNum_ValuesFnd_Click
   If menuActionNum_Values = "ACC" Then cmdNum_ValuesAcc_Click
   menuActionNum_Values = ""
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

  LoadBtnPictures cmdNum_zonesAdd, cmdNum_zonesAdd.Tag
  LoadBtnPictures cmdNum_zonesEdit, cmdNum_zonesEdit.Tag
  LoadBtnPictures cmdNum_zonesDel, cmdNum_zonesDel.Tag
  LoadBtnPictures cmdNum_zonesRef, cmdNum_zonesRef.Tag
  LoadBtnPictures cmdNum_zonesPrn, cmdNum_zonesPrn.Tag
  LoadBtnPictures cmdNum_zonesFnd, cmdNum_zonesFnd.Tag
  LoadBtnPictures cmdNum_zonesRun, cmdNum_zonesRun.Tag
  LoadBtnPictures cmdNum_zonesAcc, cmdNum_zonesAcc.Tag
  LoadBtnPictures cmdNum_zonesCfg, cmdNum_zonesCfg.Tag
  Item.Num_zones.PrepareGrid gridNum_zones
  LoadGridLayout gridNum_zones
  Set fndNum_zones = Nothing
  On Error Resume Next
  Set fndNum_zones = CreateObject("MTZ_JSetup.GridFinder")
  fndNum_zones.Init gridNum_zones
  LoadBtnPictures cmdNum_ValuesAdd, cmdNum_ValuesAdd.Tag
  LoadBtnPictures cmdNum_ValuesEdit, cmdNum_ValuesEdit.Tag
  LoadBtnPictures cmdNum_ValuesDel, cmdNum_ValuesDel.Tag
  LoadBtnPictures cmdNum_ValuesRef, cmdNum_ValuesRef.Tag
  LoadBtnPictures cmdNum_ValuesPrn, cmdNum_ValuesPrn.Tag
  LoadBtnPictures cmdNum_ValuesFnd, cmdNum_ValuesFnd.Tag
  LoadBtnPictures cmdNum_ValuesCfg, cmdNum_ValuesCfg.Tag
  LoadBtnPictures cmdNum_ValuesRun, cmdNum_ValuesRun.Tag
  LoadBtnPictures cmdNum_ValuesAcc, cmdNum_ValuesAcc.Tag
  gridNum_Values.Columns.Clear
  gridNum_Values.ItemCount = 0
  cmdNum_ValuesRef_Click
End Sub

'Действие при активизации таба
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

pnlNum_zones.RestorePosition
  gridNum_zones_RowColChange gridNum_zones.Row, -1
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
  pnlNum_zones.Move 0, 0, UserControl.Width, UserControl.Height
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
  Set fndNum_zones = Nothing
  Set fndNum_Values = Nothing
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





