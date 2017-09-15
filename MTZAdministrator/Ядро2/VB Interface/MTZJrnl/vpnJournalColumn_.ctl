VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnJournalColumn_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerJColumnSource 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerJournalColumn 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlJournalColumn 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdJColumnSourceAcc 
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
      Begin MTZ_PANEL.DropButton cmdJColumnSourceRun 
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
      Begin VB.CommandButton cmdJColumnSourceFnd 
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
      Begin VB.CommandButton cmdJColumnSourceCfg 
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
      Begin VB.CommandButton cmdJColumnSourcePrn 
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
      Begin VB.CommandButton cmdJColumnSourceRef 
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
      Begin VB.CommandButton cmdJColumnSourceDel 
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
      Begin VB.CommandButton cmdJColumnSourceEdit 
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
      Begin VB.CommandButton cmdJColumnSourceAdd 
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
      Begin GridEX20.GridEX gridJColumnSource 
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
         Column(1)       =   "vpnJournalColumn_.ctx":0000
         Column(2)       =   "vpnJournalColumn_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnJournalColumn_.ctx":016C
         FormatStyle(2)  =   "vpnJournalColumn_.ctx":02C8
         FormatStyle(3)  =   "vpnJournalColumn_.ctx":0378
         FormatStyle(4)  =   "vpnJournalColumn_.ctx":042C
         FormatStyle(5)  =   "vpnJournalColumn_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnJournalColumn_.ctx":05BC
      End
      Begin VB.CommandButton cmdJournalColumnAcc 
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
      Begin MTZ_PANEL.DropButton cmdJournalColumnRun 
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
      Begin VB.CommandButton cmdJournalColumnFnd 
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
      Begin VB.CommandButton cmdJournalColumnCfg 
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
      Begin VB.CommandButton cmdJournalColumnPrn 
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
      Begin VB.CommandButton cmdJournalColumnRef 
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
      Begin VB.CommandButton cmdJournalColumnDel 
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
      Begin VB.CommandButton cmdJournalColumnEdit 
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
      Begin VB.CommandButton cmdJournalColumnAdd 
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
      Begin GridEX20.GridEX gridJournalColumn 
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
         Column(1)       =   "vpnJournalColumn_.ctx":0794
         Column(2)       =   "vpnJournalColumn_.ctx":085C
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnJournalColumn_.ctx":0900
         FormatStyle(2)  =   "vpnJournalColumn_.ctx":0A5C
         FormatStyle(3)  =   "vpnJournalColumn_.ctx":0B0C
         FormatStyle(4)  =   "vpnJournalColumn_.ctx":0BC0
         FormatStyle(5)  =   "vpnJournalColumn_.ctx":0C98
         ImageCount      =   0
         PrinterProperties=   "vpnJournalColumn_.ctx":0D50
      End
   End
   Begin VB.Menu mnuPopupJournalColumn 
      Caption         =   "Меню для Колонки журнала"
      Visible         =   0   'False
      Begin VB.Menu mnuJournalColumnAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuJournalColumnEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuJournalColumnDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuJournalColumnOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuJournalColumnRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuJournalColumnS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuJournalColumnBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuJournalColumnCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuJournalColumnCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuJournalColumnPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuJournalColumnCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuJournalColumnCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuJournalColumnPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuJournalColumnCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuJournalColumnFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuJournalColumnAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupJColumnSource 
      Caption         =   "Меню для Состав колонки"
      Visible         =   0   'False
      Begin VB.Menu mnuJColumnSourceAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuJColumnSourceEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuJColumnSourceDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuJColumnSourceOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuJColumnSourceRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuJColumnSourceS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuJColumnSourceBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuJColumnSourceCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuJColumnSourceCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuJColumnSourcePASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuJColumnSourceCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuJColumnSourceCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuJColumnSourcePrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuJColumnSourceCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuJColumnSourceFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuJColumnSourceAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnJournalColumn_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель для работы со строками раздела Колонки журнала
Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndJournalColumn As Object
Private menuActionJournalColumn As String
Private fndJColumnSource As Object
Private menuActionJColumnSource As String





Private Sub pnlJournalColumn_PositionChanged()
  pnlJournalColumn.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridJournalColumn_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdJournalColumnCfg_Click
        End If
    End If
End Sub

Private Sub gridJournalColumn_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupJournalColumn
End If
End Sub
Private Sub mnuJournalColumnAdd_click()
   menuActionJournalColumn = "ADD"
   menuTimerJournalColumn.Enabled = True
End Sub
Private Sub mnuJournalColumnEdit_click()
   menuActionJournalColumn = "EDIT"
   menuTimerJournalColumn.Enabled = True
End Sub
Private Sub mnuJournalColumnDelete_click()
   menuActionJournalColumn = "DEL"
   menuTimerJournalColumn.Enabled = True
End Sub
Private Sub mnuJournalColumnOpen_click()
   menuActionJournalColumn = "RUN"
   menuTimerJournalColumn.Enabled = True
End Sub
Private Sub mnuJournalColumnRef_click()
   menuActionJournalColumn = "REF"
   menuTimerJournalColumn.Enabled = True
End Sub
  Private Sub mnuJournalColumnCOPY_Click()
    On Error Resume Next
    If gridJournalColumn.ItemCount = 0 Then Exit Sub
    If gridJournalColumn.Row > 0 Then
     If gridJournalColumn.RowIndex(gridJournalColumn.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridJournalColumn.RowBookmark(gridJournalColumn.RowIndex(gridJournalColumn.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuJournalColumnCUT_Click()
    On Error Resume Next
    If gridJournalColumn.ItemCount = 0 Then Exit Sub
    If gridJournalColumn.Row > 0 Then
     If gridJournalColumn.RowIndex(gridJournalColumn.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridJournalColumn.RowBookmark(gridJournalColumn.RowIndex(gridJournalColumn.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridJournalColumn.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuJournalColumnCHANGE_Click()
  On Error Resume Next
  If gridJournalColumn.ItemCount = 0 Then Exit Sub
  If gridJournalColumn.Row > 0 Then
   If gridJournalColumn.RowIndex(gridJournalColumn.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridJournalColumn.RowBookmark(gridJournalColumn.RowIndex(gridJournalColumn.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridJournalColumn.ItemCount = u.Parent.Count
      gridJournalColumn.RefreshRowIndex gridJournalColumn.RowIndex(gridJournalColumn.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuJournalColumnCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuJournalColumnPrn_click()
   menuActionJournalColumn = "PRN"
   menuTimerJournalColumn.Enabled = True
End Sub
Private Sub mnuJournalColumnCfg_click()
   menuActionJournalColumn = "CFG"
   menuTimerJournalColumn.Enabled = True
End Sub
Private Sub mnuJournalColumnFind_click()
   menuActionJournalColumn = "FND"
   menuTimerJournalColumn.Enabled = True
End Sub
Private Sub mnuJournalColumnAcc_click()
   menuActionJournalColumn = "ACC"
   menuTimerJournalColumn.Enabled = True
End Sub
Private Sub menuTimerJournalColumn_timer()
   menuTimerJournalColumn.Enabled = False
   If menuActionJournalColumn = "ADD" Then cmdJournalColumnAdd_Click
   If menuActionJournalColumn = "EDIT" Then cmdJournalColumnEdit_Click
   If menuActionJournalColumn = "DEL" Then cmdJournalColumnDel_Click
   If menuActionJournalColumn = "RUN" Then cmdJournalColumnRun_Click
   If menuActionJournalColumn = "REF" Then cmdJournalColumnRef_Click
   If menuActionJournalColumn = "PRN" Then cmdJournalColumnPrn_Click
   If menuActionJournalColumn = "CFG" Then cmdJournalColumnCfg_Click
   If menuActionJournalColumn = "FND" Then cmdJournalColumnFnd_Click
   If menuActionJournalColumn = "ACC" Then cmdJournalColumnAcc_Click
   menuActionJournalColumn = ""
End Sub
Private Sub cmdJournalColumnCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridJournalColumn, "gridJournalColumn"
Set jset = Nothing
End Sub

Private Sub cmdJournalColumnPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridJournalColumn, "Колонки журнала"
Set jset = Nothing
End Sub

Private Sub cmdJournalColumnRef_Click()
  On Error Resume Next
  Item.JournalColumn.Refresh
  gridJournalColumn.ItemCount = Item.JournalColumn.Count
  gridJournalColumn.Refetch
  gridJournalColumn.Refresh
End Sub
Private Sub cmdJournalColumnAcc_Click()
On Error Resume Next
If gridJournalColumn.ItemCount = 0 Then Exit Sub
If gridJournalColumn.Row > 0 Then
 If gridJournalColumn.RowIndex(gridJournalColumn.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridJournalColumn.RowBookmark(gridJournalColumn.RowIndex(gridJournalColumn.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdJournalColumnEdit_Click()
  On Error Resume Next
If gridJournalColumn.ItemCount = 0 Then Exit Sub
If gridJournalColumn.Row > 0 Then
 If gridJournalColumn.RowIndex(gridJournalColumn.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridJournalColumn.RowBookmark(gridJournalColumn.RowIndex(gridJournalColumn.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmJournalColumn_.Item = u
again:     frmJournalColumn_.NotFirstTime = False
    frmJournalColumn_.OnInit
    frmJournalColumn_.Show vbModal
    If frmJournalColumn_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridJournalColumn.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdJournalColumnDel_Click()
  On Error Resume Next
  gridJournalColumn.Delete
End Sub
Private Sub cmdJournalColumnAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.JournalColumn.Add()
   Call GetNumValue(u, "sequence", "{E7F3EE01-4EC4-41D2-8657-BA22089DE0E5}", Now, "%P", "")

      Set frmJournalColumn_.Item = u
again:       frmJournalColumn_.NotFirstTime = False
      frmJournalColumn_.OnInit
      frmJournalColumn_.Show vbModal
      If frmJournalColumn_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridJournalColumn.ItemCount = Item.JournalColumn.Count
        gridJournalColumn.Refresh
        gridJournalColumn.RefreshGroups
        gridJournalColumn.RefreshSort
        gridJournalColumn.MoveToBookmark u.ID & "JournalColumn"
      Else
        Item.JournalColumn.Delete u.ID
        Item.JournalColumn.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdJournalColumnFnd_Click()
  On Error Resume Next
  fndJournalColumn.ShowForm
End Sub
Private Sub cmdJournalColumnRun_Click()
  On Error Resume Next
  gridJournalColumn_DblClick
End Sub
Private Sub gridJournalColumn_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.JournalColumn.LoadRow gridJournalColumn, RowIndex, Bookmark, Values
End Sub
Private Sub gridJournalColumn_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridJournalColumn.ItemCount = 0 Then Exit Sub
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
Private Sub gridJournalColumn_DblClick()
  cmdJournalColumnEdit_Click
End Sub
Private Sub gridJournalColumn_KeyPress(KeyAscii As Integer)
  If gridJournalColumn.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndJournalColumn.FindOnPress KeyAscii
End Sub

Private Sub pnlJournalColumn_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridJournalColumn.Left = Left
  gridJournalColumn.Top = Top + 25 * Screen.TwipsPerPixelY
  gridJournalColumn.Width = Width
  gridJournalColumn.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdJournalColumnAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdJournalColumnEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdJournalColumnDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdJournalColumnRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdJournalColumnPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdJournalColumnCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdJournalColumnFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdJournalColumnRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdJournalColumnAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdJournalColumnAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdJournalColumnEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdJournalColumnDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdJournalColumnRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdJournalColumnPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdJournalColumnCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdJournalColumnFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdJournalColumnRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdJournalColumnAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuJournalColumnPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.JournalColumn.Add()
    If GetFromBuffer(u) Then
      gridJournalColumn.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdJColumnSourceCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridJColumnSource, "gridJColumnSource"
Set jset = Nothing
End Sub

Private Sub cmdJColumnSourcePrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridJColumnSource, "Состав колонки"
Set jset = Nothing
End Sub

Private Sub cmdJColumnSourceAcc_Click()
On Error Resume Next
If gridJColumnSource.ItemCount = 0 Then Exit Sub
If gridJColumnSource.Row > 0 Then
 If gridJColumnSource.RowIndex(gridJColumnSource.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridJColumnSource.RowBookmark(gridJColumnSource.RowIndex(gridJColumnSource.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdJColumnSourceFnd_Click()
  On Error Resume Next
  fndJColumnSource.ShowForm
End Sub
Private Sub cmdJColumnSourceRun_Click()
  On Error Resume Next
  gridJColumnSource_DblClick
End Sub
Private Sub pnlJournalColumn_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridJColumnSource.Left = Left
  gridJColumnSource.Top = Top + 25 * Screen.TwipsPerPixelY
  gridJColumnSource.Width = Width
  gridJColumnSource.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdJColumnSourceAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdJColumnSourceEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdJColumnSourceDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdJColumnSourceRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdJColumnSourcePrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdJColumnSourceCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdJColumnSourceFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdJColumnSourceRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdJColumnSourceAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdJColumnSourceAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdJColumnSourceEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdJColumnSourceDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdJColumnSourceRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdJColumnSourcePrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdJColumnSourceCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdJColumnSourceFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdJColumnSourceRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdJColumnSourceAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdJColumnSourceRef_Click()
  On Error Resume Next
If gridJournalColumn.ItemCount = 0 Then Exit Sub
If gridJournalColumn.Row > 0 Then
 If gridJournalColumn.RowIndex(gridJournalColumn.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridJournalColumn.RowBookmark(gridJournalColumn.RowIndex(gridJournalColumn.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.JColumnSource.Refresh
   gridJColumnSource.ItemCount = gu.JColumnSource.Count
   gridJColumnSource.Refetch
   gridJColumnSource.Refresh
 Else
  gridJColumnSource.Columns.Clear
  gridJColumnSource.ItemCount = 0
 End If
Else
 gridJColumnSource.Columns.Clear
 gridJColumnSource.ItemCount = 0
End If
End Sub
Private Sub cmdJColumnSourceEdit_Click()
    If gridJColumnSource.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridJColumnSource.RowBookmark(gridJColumnSource.RowIndex(gridJColumnSource.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmJColumnSource_.Item = u
again:     frmJColumnSource_.NotFirstTime = False
    frmJColumnSource_.OnInit
    frmJColumnSource_.Show vbModal
    If frmJColumnSource_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridJColumnSource.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdJColumnSourceDel_Click()
  On Error Resume Next
  gridJColumnSource.Delete
End Sub
Private Sub cmdJColumnSourceAdd_Click()
  On Error Resume Next
    Dim gu As Object
    Dim u As Object
If gridJournalColumn.ItemCount = 0 Then Exit Sub
    Dim bm
    bm = gridJournalColumn.RowBookmark(gridJournalColumn.RowIndex(gridJournalColumn.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set u = gu.JColumnSource.Add()

      Set frmJColumnSource_.Item = u
again:       frmJColumnSource_.NotFirstTime = False
      frmJColumnSource_.OnInit
      frmJColumnSource_.Show vbModal
      If frmJColumnSource_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridJColumnSource.ItemCount = gu.JColumnSource.Count
        gridJColumnSource.Refresh
        gridJColumnSource.RefreshGroups
        gridJColumnSource.RefreshSort
        gridJColumnSource.MoveToBookmark u.ID & "JColumnSource"
      Else
        gu.JColumnSource.Delete u.ID
        gu.JColumnSource.Remove u.ID
      End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridJournalColumn_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridJournalColumn.ItemCount = 0 Then
  gridJColumnSource.ItemCount = 0
  Exit Sub
End If
If gridJournalColumn.Row > 0 Then
  If LastRow <> gridJournalColumn.Row And LastRow > 0 Then
    gridJournalColumn.GetRowData(LastRow).RowStyle = "Default"
    gridJournalColumn.GetRowData(gridJournalColumn.Row).RowStyle = "SelectedRow"
  End If
 If gridJournalColumn.RowIndex(gridJournalColumn.Row) > 0 Then
  If LastRow <> gridJournalColumn.Row Or gridJColumnSource.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridJournalColumn.RowBookmark(gridJournalColumn.RowIndex(gridJournalColumn.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.JColumnSource.PrepareGrid gridJColumnSource
  gridJColumnSource.ItemCount = 0
    LoadGridLayout gridJColumnSource
    Set fndJColumnSource = Nothing
    Set fndJColumnSource = CreateObject("MTZ_JSetup.GridFinder")
    fndJColumnSource.Init gridJColumnSource
  gridJColumnSource.ItemCount = gu.JColumnSource.Count
  End If
 End If
End If
End Sub
Private Sub gridJColumnSource_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
    If gridJournalColumn.ItemCount = 0 Then Exit Sub
    If gridJColumnSource.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridJournalColumn.RowBookmark(gridJournalColumn.RowIndex(gridJournalColumn.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.JColumnSource.LoadRow gridJColumnSource, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridJColumnSource_KeyPress(KeyAscii As Integer)
  If gridJColumnSource.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndJColumnSource.FindOnPress KeyAscii
End Sub

Private Sub gridJColumnSource_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If gridJColumnSource.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridJColumnSource.RowBookmark(gridJColumnSource.RowIndex(gridJColumnSource.Row))
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
Private Sub gridJColumnSource_DblClick()
    cmdJColumnSourceEdit_Click
End Sub
Private Sub gridJColumnSource_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridJColumnSource.ItemCount = 0 Then Exit Sub
 If gridJColumnSource.Row > 0 Then
   If LastRow <> gridJColumnSource.Row And LastRow > 0 Then
     gridJColumnSource.GetRowData(LastRow).RowStyle = "Default"
     gridJColumnSource.GetRowData(gridJColumnSource.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuJColumnSourcePASTE_Click()
On Error Resume Next
    If gridJournalColumn.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridJournalColumn.RowBookmark(gridJournalColumn.RowIndex(gridJournalColumn.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.JColumnSource.Add()
    If GetFromBuffer(u) Then
      gridJColumnSource.ItemCount = u.Parent.Count
    Else
      gu.JColumnSource.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridJColumnSource_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdJColumnSourceCfg_Click
        End If
    End If
End Sub

Private Sub gridJColumnSource_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupJColumnSource
End If
End Sub
Private Sub mnuJColumnSourceAdd_click()
   menuActionJColumnSource = "ADD"
   menuTimerJColumnSource.Enabled = True
End Sub
Private Sub mnuJColumnSourceEdit_click()
   menuActionJColumnSource = "EDIT"
   menuTimerJColumnSource.Enabled = True
End Sub
Private Sub mnuJColumnSourceDelete_click()
   menuActionJColumnSource = "DEL"
   menuTimerJColumnSource.Enabled = True
End Sub
Private Sub mnuJColumnSourceOpen_click()
   menuActionJColumnSource = "RUN"
   menuTimerJColumnSource.Enabled = True
End Sub
Private Sub mnuJColumnSourceRef_click()
   menuActionJColumnSource = "REF"
   menuTimerJColumnSource.Enabled = True
End Sub
  Private Sub mnuJColumnSourceCOPY_Click()
    On Error Resume Next
    If gridJColumnSource.ItemCount = 0 Then Exit Sub
    If gridJColumnSource.Row > 0 Then
     If gridJColumnSource.RowIndex(gridJColumnSource.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridJColumnSource.RowBookmark(gridJColumnSource.RowIndex(gridJColumnSource.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuJColumnSourceCUT_Click()
    On Error Resume Next
    If gridJColumnSource.ItemCount = 0 Then Exit Sub
    If gridJColumnSource.Row > 0 Then
     If gridJColumnSource.RowIndex(gridJColumnSource.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridJColumnSource.RowBookmark(gridJColumnSource.RowIndex(gridJColumnSource.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridJColumnSource.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuJColumnSourceCHANGE_Click()
  On Error Resume Next
  If gridJColumnSource.ItemCount = 0 Then Exit Sub
  If gridJColumnSource.Row > 0 Then
   If gridJColumnSource.RowIndex(gridJColumnSource.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridJColumnSource.RowBookmark(gridJColumnSource.RowIndex(gridJColumnSource.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridJColumnSource.ItemCount = u.Parent.Count
      gridJColumnSource.RefreshRowIndex gridJColumnSource.RowIndex(gridJColumnSource.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuJColumnSourceCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuJColumnSourcePrn_click()
   menuActionJColumnSource = "PRN"
   menuTimerJColumnSource.Enabled = True
End Sub
Private Sub mnuJColumnSourceCfg_click()
   menuActionJColumnSource = "CFG"
   menuTimerJColumnSource.Enabled = True
End Sub
Private Sub mnuJColumnSourceFind_click()
   menuActionJColumnSource = "FND"
   menuTimerJColumnSource.Enabled = True
End Sub
Private Sub mnuJColumnSourceAcc_click()
   menuActionJColumnSource = "ACC"
   menuTimerJColumnSource.Enabled = True
End Sub
Private Sub menuTimerJColumnSource_timer()
   menuTimerJColumnSource.Enabled = False
   If menuActionJColumnSource = "ADD" Then cmdJColumnSourceAdd_Click
   If menuActionJColumnSource = "EDIT" Then cmdJColumnSourceEdit_Click
   If menuActionJColumnSource = "DEL" Then cmdJColumnSourceDel_Click
   If menuActionJColumnSource = "RUN" Then cmdJColumnSourceRun_Click
   If menuActionJColumnSource = "REF" Then cmdJColumnSourceRef_Click
   If menuActionJColumnSource = "PRN" Then cmdJColumnSourcePrn_Click
   If menuActionJColumnSource = "CFG" Then cmdJColumnSourceCfg_Click
   If menuActionJColumnSource = "FND" Then cmdJColumnSourceFnd_Click
   If menuActionJColumnSource = "ACC" Then cmdJColumnSourceAcc_Click
   menuActionJColumnSource = ""
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

  LoadBtnPictures cmdJournalColumnAdd, cmdJournalColumnAdd.Tag
  LoadBtnPictures cmdJournalColumnEdit, cmdJournalColumnEdit.Tag
  LoadBtnPictures cmdJournalColumnDel, cmdJournalColumnDel.Tag
  LoadBtnPictures cmdJournalColumnRef, cmdJournalColumnRef.Tag
  LoadBtnPictures cmdJournalColumnPrn, cmdJournalColumnPrn.Tag
  LoadBtnPictures cmdJournalColumnFnd, cmdJournalColumnFnd.Tag
  LoadBtnPictures cmdJournalColumnRun, cmdJournalColumnRun.Tag
  LoadBtnPictures cmdJournalColumnAcc, cmdJournalColumnAcc.Tag
  LoadBtnPictures cmdJournalColumnCfg, cmdJournalColumnCfg.Tag
  Item.JournalColumn.PrepareGrid gridJournalColumn
  LoadGridLayout gridJournalColumn
  Set fndJournalColumn = Nothing
  On Error Resume Next
  Set fndJournalColumn = CreateObject("MTZ_JSetup.GridFinder")
  fndJournalColumn.Init gridJournalColumn
  LoadBtnPictures cmdJColumnSourceAdd, cmdJColumnSourceAdd.Tag
  LoadBtnPictures cmdJColumnSourceEdit, cmdJColumnSourceEdit.Tag
  LoadBtnPictures cmdJColumnSourceDel, cmdJColumnSourceDel.Tag
  LoadBtnPictures cmdJColumnSourceRef, cmdJColumnSourceRef.Tag
  LoadBtnPictures cmdJColumnSourcePrn, cmdJColumnSourcePrn.Tag
  LoadBtnPictures cmdJColumnSourceFnd, cmdJColumnSourceFnd.Tag
  LoadBtnPictures cmdJColumnSourceCfg, cmdJColumnSourceCfg.Tag
  LoadBtnPictures cmdJColumnSourceRun, cmdJColumnSourceRun.Tag
  LoadBtnPictures cmdJColumnSourceAcc, cmdJColumnSourceAcc.Tag
  gridJColumnSource.Columns.Clear
  gridJColumnSource.ItemCount = 0
  cmdJColumnSourceRef_Click
End Sub

'Действие при активизации таба
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

pnlJournalColumn.RestorePosition
  gridJournalColumn_RowColChange gridJournalColumn.Row, -1
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
  pnlJournalColumn.Move 0, 0, UserControl.Width, UserControl.Height
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
  Set fndJournalColumn = Nothing
  Set fndJColumnSource = Nothing
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





