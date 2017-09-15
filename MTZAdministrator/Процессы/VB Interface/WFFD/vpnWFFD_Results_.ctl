VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnWFFD_Results_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerWFFD_DOCSTOPS 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerWFFD_Results 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlWFFD_Results 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdWFFD_DOCSTOPSFnd 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   14
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_DOCSTOPSPrn 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   13
         Tag             =   "PrintPreview.ico"
         ToolTipText     =   "Печать"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_DOCSTOPSRef 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   12
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_DOCSTOPSDel 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   11
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_DOCSTOPSEdit 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   10
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_DOCSTOPSAdd 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   9
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin GridEX20.GridEX gridWFFD_DOCSTOPS 
         Height          =   480
         Left            =   3900
         TabIndex        =   8
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
         Column(1)       =   "vpnWFFD_Results_.ctx":0000
         Column(2)       =   "vpnWFFD_Results_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnWFFD_Results_.ctx":016C
         FormatStyle(2)  =   "vpnWFFD_Results_.ctx":02C8
         FormatStyle(3)  =   "vpnWFFD_Results_.ctx":0378
         FormatStyle(4)  =   "vpnWFFD_Results_.ctx":042C
         FormatStyle(5)  =   "vpnWFFD_Results_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnWFFD_Results_.ctx":05BC
      End
      Begin VB.CommandButton cmdWFFD_ResultsFnd 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   7
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_ResultsPrn 
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
      Begin VB.CommandButton cmdWFFD_ResultsRef 
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
      Begin VB.CommandButton cmdWFFD_ResultsDel 
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
      Begin VB.CommandButton cmdWFFD_ResultsEdit 
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
      Begin VB.CommandButton cmdWFFD_ResultsAdd 
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
      Begin GridEX20.GridEX gridWFFD_Results 
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
         Column(1)       =   "vpnWFFD_Results_.ctx":0794
         Column(2)       =   "vpnWFFD_Results_.ctx":085C
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnWFFD_Results_.ctx":0900
         FormatStyle(2)  =   "vpnWFFD_Results_.ctx":0A5C
         FormatStyle(3)  =   "vpnWFFD_Results_.ctx":0B0C
         FormatStyle(4)  =   "vpnWFFD_Results_.ctx":0BC0
         FormatStyle(5)  =   "vpnWFFD_Results_.ctx":0C98
         ImageCount      =   0
         PrinterProperties=   "vpnWFFD_Results_.ctx":0D50
      End
   End
   Begin VB.Menu mnuPopupWFFD_Results 
      Caption         =   "Меню для Возможные результаты"
      Visible         =   0   'False
      Begin VB.Menu mnuWFFD_ResultsAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFFD_ResultsEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFFD_ResultsDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFFD_ResultsOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWFFD_ResultsRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFFD_ResultsS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFFD_ResultsBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFFD_ResultsCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFFD_ResultsCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFFD_ResultsPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFFD_ResultsCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFFD_ResultsCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFFD_ResultsPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWFFD_ResultsCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWFFD_ResultsFind 
         Caption         =   "Поиск"
      End
   End
   Begin VB.Menu mnuPopupWFFD_DOCSTOPS 
      Caption         =   "Меню для Завершение по состоянию документа"
      Visible         =   0   'False
      Begin VB.Menu mnuWFFD_DOCSTOPSAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFFD_DOCSTOPSEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFFD_DOCSTOPSDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFFD_DOCSTOPSOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWFFD_DOCSTOPSRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFFD_DOCSTOPSS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFFD_DOCSTOPSBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFFD_DOCSTOPSCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFFD_DOCSTOPSCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFFD_DOCSTOPSPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFFD_DOCSTOPSCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFFD_DOCSTOPSCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFFD_DOCSTOPSPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWFFD_DOCSTOPSCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWFFD_DOCSTOPSFind 
         Caption         =   "Поиск"
      End
   End
End
Attribute VB_Name = "vpnWFFD_Results_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndWFFD_Results As Object
Private menuActionWFFD_Results As String
Private fndWFFD_DOCSTOPS As Object
Private menuActionWFFD_DOCSTOPS As String





Private Sub pnlWFFD_Results_PositionChanged()
  pnlWFFD_Results.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridWFFD_Results_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdWFFD_ResultsCfg_Click
        End If
    End If
End Sub

Private Sub gridWFFD_Results_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupWFFD_Results
End If
End Sub
Private Sub mnuWFFD_ResultsAdd_click()
   menuActionWFFD_Results = "ADD"
   menuTimerWFFD_Results.Enabled = True
End Sub
Private Sub mnuWFFD_ResultsEdit_click()
   menuActionWFFD_Results = "EDIT"
   menuTimerWFFD_Results.Enabled = True
End Sub
Private Sub mnuWFFD_ResultsDelete_click()
   menuActionWFFD_Results = "DEL"
   menuTimerWFFD_Results.Enabled = True
End Sub
Private Sub mnuWFFD_ResultsOpen_click()
   menuActionWFFD_Results = "RUN"
   menuTimerWFFD_Results.Enabled = True
End Sub
Private Sub mnuWFFD_ResultsRef_click()
   menuActionWFFD_Results = "REF"
   menuTimerWFFD_Results.Enabled = True
End Sub
  Private Sub mnuWFFD_ResultsCOPY_Click()
    On Error Resume Next
    If gridWFFD_Results.ItemCount = 0 Then Exit Sub
    If gridWFFD_Results.Row > 0 Then
     If gridWFFD_Results.RowIndex(gridWFFD_Results.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFFD_Results.RowBookmark(gridWFFD_Results.RowIndex(gridWFFD_Results.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFFD_ResultsCUT_Click()
    On Error Resume Next
    If gridWFFD_Results.ItemCount = 0 Then Exit Sub
    If gridWFFD_Results.Row > 0 Then
     If gridWFFD_Results.RowIndex(gridWFFD_Results.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFFD_Results.RowBookmark(gridWFFD_Results.RowIndex(gridWFFD_Results.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFFD_Results.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFFD_ResultsCHANGE_Click()
  On Error Resume Next
  If gridWFFD_Results.ItemCount = 0 Then Exit Sub
  If gridWFFD_Results.Row > 0 Then
   If gridWFFD_Results.RowIndex(gridWFFD_Results.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFFD_Results.RowBookmark(gridWFFD_Results.RowIndex(gridWFFD_Results.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFFD_Results.ItemCount = u.Parent.Count
      gridWFFD_Results.RefreshRowIndex gridWFFD_Results.RowIndex(gridWFFD_Results.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFFD_ResultsCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFFD_ResultsPrn_click()
   menuActionWFFD_Results = "PRN"
   menuTimerWFFD_Results.Enabled = True
End Sub
Private Sub mnuWFFD_ResultsCfg_click()
   menuActionWFFD_Results = "CFG"
   menuTimerWFFD_Results.Enabled = True
End Sub
Private Sub mnuWFFD_ResultsFind_click()
   menuActionWFFD_Results = "FND"
   menuTimerWFFD_Results.Enabled = True
End Sub
Private Sub mnuWFFD_ResultsAcc_click()
   menuActionWFFD_Results = "ACC"
   menuTimerWFFD_Results.Enabled = True
End Sub
Private Sub menuTimerWFFD_Results_timer()
   menuTimerWFFD_Results.Enabled = False
   If menuActionWFFD_Results = "ADD" Then cmdWFFD_ResultsAdd_Click
   If menuActionWFFD_Results = "EDIT" Then cmdWFFD_ResultsEdit_Click
   If menuActionWFFD_Results = "DEL" Then cmdWFFD_ResultsDel_Click
   If menuActionWFFD_Results = "RUN" Then cmdWFFD_ResultsRun_Click
   If menuActionWFFD_Results = "REF" Then cmdWFFD_ResultsRef_Click
   If menuActionWFFD_Results = "PRN" Then cmdWFFD_ResultsPrn_Click
   If menuActionWFFD_Results = "CFG" Then cmdWFFD_ResultsCfg_Click
   If menuActionWFFD_Results = "FND" Then cmdWFFD_ResultsFnd_Click
   If menuActionWFFD_Results = "ACC" Then cmdWFFD_ResultsAcc_Click
   menuActionWFFD_Results = ""
End Sub
Private Sub cmdWFFD_ResultsCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFFD_Results, "gridWFFD_Results"
Set jset = Nothing
End Sub

Private Sub cmdWFFD_ResultsPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFFD_Results, "Возможные результаты"
Set jset = Nothing
End Sub

Private Sub cmdWFFD_ResultsRef_Click()
  On Error Resume Next
  Item.WFFD_Results.Refresh
  gridWFFD_Results.ItemCount = Item.WFFD_Results.Count
  gridWFFD_Results.Refetch
  gridWFFD_Results.Refresh
End Sub
Private Sub cmdWFFD_ResultsAcc_Click()
On Error Resume Next
If gridWFFD_Results.ItemCount = 0 Then Exit Sub
If gridWFFD_Results.Row > 0 Then
 If gridWFFD_Results.RowIndex(gridWFFD_Results.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFFD_Results.RowBookmark(gridWFFD_Results.RowIndex(gridWFFD_Results.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFFD_ResultsEdit_Click()
  On Error Resume Next
If gridWFFD_Results.ItemCount = 0 Then Exit Sub
If gridWFFD_Results.Row > 0 Then
 If gridWFFD_Results.RowIndex(gridWFFD_Results.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFFD_Results.RowBookmark(gridWFFD_Results.RowIndex(gridWFFD_Results.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWFFD_Results_.Item = u
again:     frmWFFD_Results_.NotFirstTime = False
    frmWFFD_Results_.OnInit
    frmWFFD_Results_.Show vbModal
    If frmWFFD_Results_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWFFD_Results.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWFFD_ResultsDel_Click()
  On Error Resume Next
  gridWFFD_Results.Delete
End Sub
Private Sub cmdWFFD_ResultsAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.WFFD_Results.Add()

      Set frmWFFD_Results_.Item = u
again:       frmWFFD_Results_.NotFirstTime = False
      frmWFFD_Results_.OnInit
      frmWFFD_Results_.Show vbModal
      If frmWFFD_Results_.OK Then
        Err.Clear
        u.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWFFD_Results.ItemCount = Item.WFFD_Results.Count
        gridWFFD_Results.Refresh
        gridWFFD_Results.RefreshGroups
        gridWFFD_Results.RefreshSort
        gridWFFD_Results.MoveToBookmark u.ID & "WFFD_Results"
      Else
        Item.WFFD_Results.Delete u.ID
        Item.WFFD_Results.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdWFFD_ResultsFnd_Click()
  On Error Resume Next
  fndWFFD_Results.ShowForm
End Sub
Private Sub cmdWFFD_ResultsRun_Click()
  On Error Resume Next
  gridWFFD_Results_DblClick
End Sub
Private Sub gridWFFD_Results_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.WFFD_Results.LoadRow gridWFFD_Results, RowIndex, Bookmark, Values
End Sub
Private Sub gridWFFD_Results_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridWFFD_Results.ItemCount = 0 Then Exit Sub
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
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub
Private Sub gridWFFD_Results_DblClick()
  cmdWFFD_ResultsEdit_Click
End Sub
Private Sub gridWFFD_Results_KeyPress(KeyAscii As Integer)
  If gridWFFD_Results.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFFD_Results.FindOnPress KeyAscii
End Sub

Private Sub pnlWFFD_Results_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridWFFD_Results.Left = Left
  gridWFFD_Results.Top = Top + 25 * Screen.TwipsPerPixelY
  gridWFFD_Results.Width = Width
  gridWFFD_Results.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdWFFD_ResultsAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFFD_ResultsEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFFD_ResultsDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFFD_ResultsRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFFD_ResultsPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFFD_ResultsFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFFD_ResultsAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdWFFD_ResultsEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdWFFD_ResultsDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdWFFD_ResultsRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdWFFD_ResultsPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdWFFD_ResultsFnd.Left = Left + 130 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuWFFD_ResultsPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.WFFD_Results.Add()
    If GetFromBuffer(u) Then
      gridWFFD_Results.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdWFFD_DOCSTOPSCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFFD_DOCSTOPS, "gridWFFD_DOCSTOPS"
Set jset = Nothing
End Sub

Private Sub cmdWFFD_DOCSTOPSPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFFD_DOCSTOPS, "Завершение по состоянию документа"
Set jset = Nothing
End Sub

Private Sub cmdWFFD_DOCSTOPSAcc_Click()
On Error Resume Next
If gridWFFD_DOCSTOPS.ItemCount = 0 Then Exit Sub
If gridWFFD_DOCSTOPS.Row > 0 Then
 If gridWFFD_DOCSTOPS.RowIndex(gridWFFD_DOCSTOPS.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFFD_DOCSTOPS.RowBookmark(gridWFFD_DOCSTOPS.RowIndex(gridWFFD_DOCSTOPS.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFFD_DOCSTOPSFnd_Click()
  On Error Resume Next
  fndWFFD_DOCSTOPS.ShowForm
End Sub
Private Sub cmdWFFD_DOCSTOPSRun_Click()
  On Error Resume Next
  gridWFFD_DOCSTOPS_DblClick
End Sub
Private Sub pnlWFFD_Results_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridWFFD_DOCSTOPS.Left = Left
  gridWFFD_DOCSTOPS.Top = Top + 25 * Screen.TwipsPerPixelY
  gridWFFD_DOCSTOPS.Width = Width
  gridWFFD_DOCSTOPS.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdWFFD_DOCSTOPSAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFFD_DOCSTOPSEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFFD_DOCSTOPSDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFFD_DOCSTOPSRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFFD_DOCSTOPSPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFFD_DOCSTOPSFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFFD_DOCSTOPSAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdWFFD_DOCSTOPSEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdWFFD_DOCSTOPSDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdWFFD_DOCSTOPSRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdWFFD_DOCSTOPSPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdWFFD_DOCSTOPSFnd.Left = Left + 130 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdWFFD_DOCSTOPSRef_Click()
  On Error Resume Next
If gridWFFD_Results.ItemCount = 0 Then Exit Sub
If gridWFFD_Results.Row > 0 Then
 If gridWFFD_Results.RowIndex(gridWFFD_Results.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridWFFD_Results.RowBookmark(gridWFFD_Results.RowIndex(gridWFFD_Results.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.WFFD_DOCSTOPS.Refresh
   gridWFFD_DOCSTOPS.ItemCount = gu.WFFD_DOCSTOPS.Count
   gridWFFD_DOCSTOPS.Refetch
   gridWFFD_DOCSTOPS.Refresh
 Else
  gridWFFD_DOCSTOPS.Columns.Clear
  gridWFFD_DOCSTOPS.ItemCount = 0
 End If
Else
 gridWFFD_DOCSTOPS.Columns.Clear
 gridWFFD_DOCSTOPS.ItemCount = 0
End If
End Sub
Private Sub cmdWFFD_DOCSTOPSEdit_Click()
    If gridWFFD_DOCSTOPS.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridWFFD_DOCSTOPS.RowBookmark(gridWFFD_DOCSTOPS.RowIndex(gridWFFD_DOCSTOPS.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmWFFD_DOCSTOPS_.Item = u
again:     frmWFFD_DOCSTOPS_.NotFirstTime = False
    frmWFFD_DOCSTOPS_.OnInit
    frmWFFD_DOCSTOPS_.Show vbModal
    If frmWFFD_DOCSTOPS_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWFFD_DOCSTOPS.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdWFFD_DOCSTOPSDel_Click()
  On Error Resume Next
  gridWFFD_DOCSTOPS.Delete
End Sub
Private Sub cmdWFFD_DOCSTOPSAdd_Click()
  On Error Resume Next
    Dim gu As Object
    Dim u As Object
If gridWFFD_Results.ItemCount = 0 Then Exit Sub
    Dim bm
    bm = gridWFFD_Results.RowBookmark(gridWFFD_Results.RowIndex(gridWFFD_Results.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set u = gu.WFFD_DOCSTOPS.Add()

      Set frmWFFD_DOCSTOPS_.Item = u
again:       frmWFFD_DOCSTOPS_.NotFirstTime = False
      frmWFFD_DOCSTOPS_.OnInit
      frmWFFD_DOCSTOPS_.Show vbModal
      If frmWFFD_DOCSTOPS_.OK Then
        Err.Clear
        u.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWFFD_DOCSTOPS.ItemCount = gu.WFFD_DOCSTOPS.Count
        gridWFFD_DOCSTOPS.Refresh
        gridWFFD_DOCSTOPS.RefreshGroups
        gridWFFD_DOCSTOPS.RefreshSort
        gridWFFD_DOCSTOPS.MoveToBookmark u.ID & "WFFD_DOCSTOPS"
      Else
        gu.WFFD_DOCSTOPS.Delete u.ID
        gu.WFFD_DOCSTOPS.Remove u.ID
      End If
Exit Sub
bye:
MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridWFFD_Results_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridWFFD_Results.ItemCount = 0 Then
  gridWFFD_DOCSTOPS.ItemCount = 0
  Exit Sub
End If
If gridWFFD_Results.Row > 0 Then
  If LastRow <> gridWFFD_Results.Row And LastRow > 0 Then
    gridWFFD_Results.GetRowData(LastRow).RowStyle = "Default"
    gridWFFD_Results.GetRowData(gridWFFD_Results.Row).RowStyle = "SelectedRow"
  End If
 If gridWFFD_Results.RowIndex(gridWFFD_Results.Row) > 0 Then
  If LastRow <> gridWFFD_Results.Row Or gridWFFD_DOCSTOPS.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridWFFD_Results.RowBookmark(gridWFFD_Results.RowIndex(gridWFFD_Results.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.WFFD_DOCSTOPS.PrepareGrid gridWFFD_DOCSTOPS
  gridWFFD_DOCSTOPS.ItemCount = 0
    LoadGridLayout gridWFFD_DOCSTOPS
    Set fndWFFD_DOCSTOPS = Nothing
    Set fndWFFD_DOCSTOPS = CreateObject("MTZ_JSetup.GridFinder")
    fndWFFD_DOCSTOPS.Init gridWFFD_DOCSTOPS
  gridWFFD_DOCSTOPS.ItemCount = gu.WFFD_DOCSTOPS.Count
  End If
 End If
End If
End Sub
Private Sub gridWFFD_DOCSTOPS_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
    If gridWFFD_Results.ItemCount = 0 Then Exit Sub
    If gridWFFD_DOCSTOPS.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridWFFD_Results.RowBookmark(gridWFFD_Results.RowIndex(gridWFFD_Results.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.WFFD_DOCSTOPS.LoadRow gridWFFD_DOCSTOPS, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridWFFD_DOCSTOPS_KeyPress(KeyAscii As Integer)
  If gridWFFD_DOCSTOPS.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFFD_DOCSTOPS.FindOnPress KeyAscii
End Sub

Private Sub gridWFFD_DOCSTOPS_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If gridWFFD_DOCSTOPS.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridWFFD_DOCSTOPS.RowBookmark(gridWFFD_DOCSTOPS.RowIndex(gridWFFD_DOCSTOPS.Row))
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
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub
Private Sub gridWFFD_DOCSTOPS_DblClick()
    cmdWFFD_DOCSTOPSEdit_Click
End Sub
Private Sub gridWFFD_DOCSTOPS_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridWFFD_DOCSTOPS.ItemCount = 0 Then Exit Sub
 If gridWFFD_DOCSTOPS.Row > 0 Then
   If LastRow <> gridWFFD_DOCSTOPS.Row And LastRow > 0 Then
     gridWFFD_DOCSTOPS.GetRowData(LastRow).RowStyle = "Default"
     gridWFFD_DOCSTOPS.GetRowData(gridWFFD_DOCSTOPS.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuWFFD_DOCSTOPSPASTE_Click()
On Error Resume Next
    If gridWFFD_Results.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridWFFD_Results.RowBookmark(gridWFFD_Results.RowIndex(gridWFFD_Results.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.WFFD_DOCSTOPS.Add()
    If GetFromBuffer(u) Then
      gridWFFD_DOCSTOPS.ItemCount = u.Parent.Count
    Else
      gu.WFFD_DOCSTOPS.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridWFFD_DOCSTOPS_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdWFFD_DOCSTOPSCfg_Click
        End If
    End If
End Sub

Private Sub gridWFFD_DOCSTOPS_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupWFFD_DOCSTOPS
End If
End Sub
Private Sub mnuWFFD_DOCSTOPSAdd_click()
   menuActionWFFD_DOCSTOPS = "ADD"
   menuTimerWFFD_DOCSTOPS.Enabled = True
End Sub
Private Sub mnuWFFD_DOCSTOPSEdit_click()
   menuActionWFFD_DOCSTOPS = "EDIT"
   menuTimerWFFD_DOCSTOPS.Enabled = True
End Sub
Private Sub mnuWFFD_DOCSTOPSDelete_click()
   menuActionWFFD_DOCSTOPS = "DEL"
   menuTimerWFFD_DOCSTOPS.Enabled = True
End Sub
Private Sub mnuWFFD_DOCSTOPSOpen_click()
   menuActionWFFD_DOCSTOPS = "RUN"
   menuTimerWFFD_DOCSTOPS.Enabled = True
End Sub
Private Sub mnuWFFD_DOCSTOPSRef_click()
   menuActionWFFD_DOCSTOPS = "REF"
   menuTimerWFFD_DOCSTOPS.Enabled = True
End Sub
  Private Sub mnuWFFD_DOCSTOPSCOPY_Click()
    On Error Resume Next
    If gridWFFD_DOCSTOPS.ItemCount = 0 Then Exit Sub
    If gridWFFD_DOCSTOPS.Row > 0 Then
     If gridWFFD_DOCSTOPS.RowIndex(gridWFFD_DOCSTOPS.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFFD_DOCSTOPS.RowBookmark(gridWFFD_DOCSTOPS.RowIndex(gridWFFD_DOCSTOPS.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFFD_DOCSTOPSCUT_Click()
    On Error Resume Next
    If gridWFFD_DOCSTOPS.ItemCount = 0 Then Exit Sub
    If gridWFFD_DOCSTOPS.Row > 0 Then
     If gridWFFD_DOCSTOPS.RowIndex(gridWFFD_DOCSTOPS.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFFD_DOCSTOPS.RowBookmark(gridWFFD_DOCSTOPS.RowIndex(gridWFFD_DOCSTOPS.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFFD_DOCSTOPS.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFFD_DOCSTOPSCHANGE_Click()
  On Error Resume Next
  If gridWFFD_DOCSTOPS.ItemCount = 0 Then Exit Sub
  If gridWFFD_DOCSTOPS.Row > 0 Then
   If gridWFFD_DOCSTOPS.RowIndex(gridWFFD_DOCSTOPS.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFFD_DOCSTOPS.RowBookmark(gridWFFD_DOCSTOPS.RowIndex(gridWFFD_DOCSTOPS.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFFD_DOCSTOPS.ItemCount = u.Parent.Count
      gridWFFD_DOCSTOPS.RefreshRowIndex gridWFFD_DOCSTOPS.RowIndex(gridWFFD_DOCSTOPS.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFFD_DOCSTOPSCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFFD_DOCSTOPSPrn_click()
   menuActionWFFD_DOCSTOPS = "PRN"
   menuTimerWFFD_DOCSTOPS.Enabled = True
End Sub
Private Sub mnuWFFD_DOCSTOPSCfg_click()
   menuActionWFFD_DOCSTOPS = "CFG"
   menuTimerWFFD_DOCSTOPS.Enabled = True
End Sub
Private Sub mnuWFFD_DOCSTOPSFind_click()
   menuActionWFFD_DOCSTOPS = "FND"
   menuTimerWFFD_DOCSTOPS.Enabled = True
End Sub
Private Sub mnuWFFD_DOCSTOPSAcc_click()
   menuActionWFFD_DOCSTOPS = "ACC"
   menuTimerWFFD_DOCSTOPS.Enabled = True
End Sub
Private Sub menuTimerWFFD_DOCSTOPS_timer()
   menuTimerWFFD_DOCSTOPS.Enabled = False
   If menuActionWFFD_DOCSTOPS = "ADD" Then cmdWFFD_DOCSTOPSAdd_Click
   If menuActionWFFD_DOCSTOPS = "EDIT" Then cmdWFFD_DOCSTOPSEdit_Click
   If menuActionWFFD_DOCSTOPS = "DEL" Then cmdWFFD_DOCSTOPSDel_Click
   If menuActionWFFD_DOCSTOPS = "RUN" Then cmdWFFD_DOCSTOPSRun_Click
   If menuActionWFFD_DOCSTOPS = "REF" Then cmdWFFD_DOCSTOPSRef_Click
   If menuActionWFFD_DOCSTOPS = "PRN" Then cmdWFFD_DOCSTOPSPrn_Click
   If menuActionWFFD_DOCSTOPS = "CFG" Then cmdWFFD_DOCSTOPSCfg_Click
   If menuActionWFFD_DOCSTOPS = "FND" Then cmdWFFD_DOCSTOPSFnd_Click
   If menuActionWFFD_DOCSTOPS = "ACC" Then cmdWFFD_DOCSTOPSAcc_Click
   menuActionWFFD_DOCSTOPS = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdWFFD_ResultsAdd, cmdWFFD_ResultsAdd.Tag
  LoadBtnPictures cmdWFFD_ResultsEdit, cmdWFFD_ResultsEdit.Tag
  LoadBtnPictures cmdWFFD_ResultsDel, cmdWFFD_ResultsDel.Tag
  LoadBtnPictures cmdWFFD_ResultsRef, cmdWFFD_ResultsRef.Tag
  LoadBtnPictures cmdWFFD_ResultsPrn, cmdWFFD_ResultsPrn.Tag
  LoadBtnPictures cmdWFFD_ResultsFnd, cmdWFFD_ResultsFnd.Tag
  Item.WFFD_Results.PrepareGrid gridWFFD_Results
  LoadGridLayout gridWFFD_Results
  Set fndWFFD_Results = Nothing
  On Error Resume Next
  Set fndWFFD_Results = CreateObject("MTZ_JSetup.GridFinder")
  fndWFFD_Results.Init gridWFFD_Results
  LoadBtnPictures cmdWFFD_DOCSTOPSAdd, cmdWFFD_DOCSTOPSAdd.Tag
  LoadBtnPictures cmdWFFD_DOCSTOPSEdit, cmdWFFD_DOCSTOPSEdit.Tag
  LoadBtnPictures cmdWFFD_DOCSTOPSDel, cmdWFFD_DOCSTOPSDel.Tag
  LoadBtnPictures cmdWFFD_DOCSTOPSRef, cmdWFFD_DOCSTOPSRef.Tag
  LoadBtnPictures cmdWFFD_DOCSTOPSPrn, cmdWFFD_DOCSTOPSPrn.Tag
  LoadBtnPictures cmdWFFD_DOCSTOPSFnd, cmdWFFD_DOCSTOPSFnd.Tag
  gridWFFD_DOCSTOPS.Columns.Clear
  gridWFFD_DOCSTOPS.ItemCount = 0
  cmdWFFD_DOCSTOPSRef_Click
End Sub
Private Sub OnTabClick()

pnlWFFD_Results.RestorePosition
  gridWFFD_Results_RowColChange gridWFFD_Results.Row, -1
End Sub
Public Sub OnClick(aItem As Object, Optional pForm As Object = Nothing)
  On Error Resume Next
  Set Item = aItem
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
  pnlWFFD_Results.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndWFFD_Results = Nothing
  Set fndWFFD_DOCSTOPS = Nothing
End Sub
Private Sub UserControl_Terminate()
  On Error Resume Next
  CloseClass
End Sub

'переместить клиента в каталоге
'{5CB1388C-1623-4B36-A775-00B70BEE27AF}
Private Sub Run_VBMoveVRC(VRCATFolder As Variant, Optional RowItem As Object)
'do nothing
End Sub



'Передать права объекту контактное лицо от объекта клиент
'{79DED4FD-045C-45F8-AC79-2E5A3D956D97}
Private Sub Run_VBMigrateRight(Optional RowItem As Object)
'Migrate security
On Error GoTo bye
  If RowItem.Person Is Nothing Then Exit Sub

  RowItem.Person.Secure Item.SecureStyleid
  RowItem.Person.Propagate
bye:
  Exit Sub
  MsgBox Err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Применить стиль защиты для объекта Предназначен для каталога клиентов
'{31EC6CF7-8DBD-4EFE-BF12-4D168F653D34}
Private Sub Run_VBApplySecurity(Optional RowItem As Object)
'Apply security
On Error GoTo bye
  If RowItem.Client Is Nothing Then Exit Sub
  If RowItem.Parent.Parent.AccessLevel Is Nothing Then Exit Sub
  RowItem.Client.Secure RowItem.Parent.Parent.AccessLevel.ID
  RowItem.Client.Propagate
  Exit Sub
bye:
  MsgBox Err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Создание отчета из разных карточек
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
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
  MsgBox Err.Description, vbOKOnly + vbCritical, "Создание отчета"
End Sub



'Создать новую оплату из клиента
'{42A1A436-8AA2-4F1F-999B-6680DFF514DE}
Private Sub Run_VBNewPayIn(Optional RowItem As Object)
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
  MsgBox Err.Description, vbOKOnly + vbCritical, "Создание Платежа"
End Sub



'Создать новый платеж из клиента
'{2BB30818-90ED-4627-8ABB-85B3FBA46750}
Private Sub Run_VBNewPayOut(Optional RowItem As Object)
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
  MsgBox Err.Description, vbOKOnly + vbCritical, "Создание Платежа"
End Sub



'открытие карточки по идентификатору
'{94E8F6DB-106A-44DC-9483-86C801798FF0}
Private Sub Run_VBOpenRef(StartMode As Variant, ID As Variant, Optional RowItem As Object)
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
Item.Name = RowItem.Description
ParentForm.Caption = Item.Name
Item.Save
End Sub



'
'{D8914FB4-6B5D-491A-A72F-985617727583}
Private Sub Run_WFFuncName(Optional RowItem As Object)
On Error Resume Next
Item.Name = RowItem.Name
ParentForm.Caption = Item.Name
Item.Save
End Sub



'Изменить название объекта
'{4FB59D1A-0123-47D3-9F4F-E12085C5D074}
Private Sub Run_VBUpdateItemName(Name As Variant, Optional RowItem As Object)
On Error Resume Next
Item.Name = Name
' может не быть формы, если используем просто ActiveX
ParentForm.Caption = Item.Name
Item.Save
End Sub



'Создать заявку из клиента
'{49EA5CBF-93CF-41A8-B1F1-E37FE4D59EA5}
Private Sub Run_VBNewZayavka(Optional RowItem As Object)
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
  MsgBox Err.Description, vbOKOnly + vbCritical, "Создание Заявки"
End Sub





