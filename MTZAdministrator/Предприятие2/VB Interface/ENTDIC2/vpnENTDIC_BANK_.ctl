VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnENTDIC_BANK_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerENTDIC_1CLINK 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerENTDIC_BANK 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlENTDIC_BANK 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdENTDIC_1CLINKFnd 
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
      Begin VB.CommandButton cmdENTDIC_1CLINKPrn 
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
      Begin VB.CommandButton cmdENTDIC_1CLINKRef 
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
      Begin VB.CommandButton cmdENTDIC_1CLINKDel 
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
      Begin VB.CommandButton cmdENTDIC_1CLINKEdit 
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
      Begin VB.CommandButton cmdENTDIC_1CLINKAdd 
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
      Begin GridEX20.GridEX gridENTDIC_1CLINK 
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
         Column(1)       =   "vpnENTDIC_BANK_.ctx":0000
         Column(2)       =   "vpnENTDIC_BANK_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnENTDIC_BANK_.ctx":016C
         FormatStyle(2)  =   "vpnENTDIC_BANK_.ctx":02C8
         FormatStyle(3)  =   "vpnENTDIC_BANK_.ctx":0378
         FormatStyle(4)  =   "vpnENTDIC_BANK_.ctx":042C
         FormatStyle(5)  =   "vpnENTDIC_BANK_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnENTDIC_BANK_.ctx":05BC
      End
      Begin VB.CommandButton cmdENTDIC_BANKFnd 
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
      Begin VB.CommandButton cmdENTDIC_BANKPrn 
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
      Begin VB.CommandButton cmdENTDIC_BANKRef 
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
      Begin VB.CommandButton cmdENTDIC_BANKDel 
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
      Begin VB.CommandButton cmdENTDIC_BANKEdit 
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
      Begin VB.CommandButton cmdENTDIC_BANKAdd 
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
      Begin GridEX20.GridEX gridENTDIC_BANK 
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
         Column(1)       =   "vpnENTDIC_BANK_.ctx":0794
         Column(2)       =   "vpnENTDIC_BANK_.ctx":085C
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnENTDIC_BANK_.ctx":0900
         FormatStyle(2)  =   "vpnENTDIC_BANK_.ctx":0A5C
         FormatStyle(3)  =   "vpnENTDIC_BANK_.ctx":0B0C
         FormatStyle(4)  =   "vpnENTDIC_BANK_.ctx":0BC0
         FormatStyle(5)  =   "vpnENTDIC_BANK_.ctx":0C98
         ImageCount      =   0
         PrinterProperties=   "vpnENTDIC_BANK_.ctx":0D50
      End
   End
   Begin VB.Menu mnuPopupENTDIC_BANK 
      Caption         =   "Меню для Банки"
      Visible         =   0   'False
      Begin VB.Menu mnuENTDIC_BANKAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuENTDIC_BANKEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuENTDIC_BANKDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuENTDIC_BANKOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuENTDIC_BANKRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuENTDIC_BANKPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuENTDIC_BANKCfg 
         Caption         =   "Настроить"
      End
   End
   Begin VB.Menu mnuPopupENTDIC_1CLINK 
      Caption         =   "Меню для Связь с 1С"
      Visible         =   0   'False
      Begin VB.Menu mnuENTDIC_1CLINKAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuENTDIC_1CLINKEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuENTDIC_1CLINKDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuENTDIC_1CLINKOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuENTDIC_1CLINKRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuENTDIC_1CLINKPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuENTDIC_1CLINKCfg 
         Caption         =   "Настроить"
      End
   End
End
Attribute VB_Name = "vpnENTDIC_BANK_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndENTDIC_BANK As Object
Private menuActionENTDIC_BANK As String
Private fndENTDIC_1CLINK As Object
Private menuActionENTDIC_1CLINK As String





Private Sub pnlENTDIC_BANK_PositionChanged()
  pnlENTDIC_BANK.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridENTDIC_BANK_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdENTDIC_BANKCfg_Click
        End If
    End If
End Sub

Private Sub gridENTDIC_BANK_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupENTDIC_BANK
End If
End Sub
Private Sub mnuENTDIC_BANKAdd_click()
   menuActionENTDIC_BANK = "ADD"
   menuTimerENTDIC_BANK.Enabled = True
End Sub
Private Sub mnuENTDIC_BANKEdit_click()
   menuActionENTDIC_BANK = "EDIT"
   menuTimerENTDIC_BANK.Enabled = True
End Sub
Private Sub mnuENTDIC_BANKDelete_click()
   menuActionENTDIC_BANK = "DEL"
   menuTimerENTDIC_BANK.Enabled = True
End Sub
Private Sub mnuENTDIC_BANKOpen_click()
   menuActionENTDIC_BANK = "RUN"
   menuTimerENTDIC_BANK.Enabled = True
End Sub
Private Sub mnuENTDIC_BANKRef_click()
   menuActionENTDIC_BANK = "REF"
   menuTimerENTDIC_BANK.Enabled = True
End Sub
  Private Sub mnuENTDIC_BANKCOPY_Click()
    On Error Resume Next
    If gridENTDIC_BANK.ItemCount = 0 Then Exit Sub
    If gridENTDIC_BANK.Row > 0 Then
     If gridENTDIC_BANK.RowIndex(gridENTDIC_BANK.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridENTDIC_BANK.RowBookmark(gridENTDIC_BANK.RowIndex(gridENTDIC_BANK.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuENTDIC_BANKCUT_Click()
    On Error Resume Next
    If gridENTDIC_BANK.ItemCount = 0 Then Exit Sub
    If gridENTDIC_BANK.Row > 0 Then
     If gridENTDIC_BANK.RowIndex(gridENTDIC_BANK.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridENTDIC_BANK.RowBookmark(gridENTDIC_BANK.RowIndex(gridENTDIC_BANK.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridENTDIC_BANK.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuENTDIC_BANKCHANGE_Click()
  On Error Resume Next
  If gridENTDIC_BANK.ItemCount = 0 Then Exit Sub
  If gridENTDIC_BANK.Row > 0 Then
   If gridENTDIC_BANK.RowIndex(gridENTDIC_BANK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridENTDIC_BANK.RowBookmark(gridENTDIC_BANK.RowIndex(gridENTDIC_BANK.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridENTDIC_BANK.ItemCount = u.Parent.Count
      gridENTDIC_BANK.RefreshRowIndex gridENTDIC_BANK.RowIndex(gridENTDIC_BANK.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuENTDIC_BANKCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuENTDIC_BANKPrn_click()
   menuActionENTDIC_BANK = "PRN"
   menuTimerENTDIC_BANK.Enabled = True
End Sub
Private Sub mnuENTDIC_BANKCfg_click()
   menuActionENTDIC_BANK = "CFG"
   menuTimerENTDIC_BANK.Enabled = True
End Sub
Private Sub mnuENTDIC_BANKFind_click()
   menuActionENTDIC_BANK = "FND"
   menuTimerENTDIC_BANK.Enabled = True
End Sub
Private Sub mnuENTDIC_BANKAcc_click()
   menuActionENTDIC_BANK = "ACC"
   menuTimerENTDIC_BANK.Enabled = True
End Sub
Private Sub menuTimerENTDIC_BANK_timer()
   menuTimerENTDIC_BANK.Enabled = False
   If menuActionENTDIC_BANK = "ADD" Then cmdENTDIC_BANKAdd_Click
   If menuActionENTDIC_BANK = "EDIT" Then cmdENTDIC_BANKEdit_Click
   If menuActionENTDIC_BANK = "DEL" Then cmdENTDIC_BANKDel_Click
   If menuActionENTDIC_BANK = "RUN" Then cmdENTDIC_BANKRun_Click
   If menuActionENTDIC_BANK = "REF" Then cmdENTDIC_BANKRef_Click
   If menuActionENTDIC_BANK = "PRN" Then cmdENTDIC_BANKPrn_Click
   If menuActionENTDIC_BANK = "CFG" Then cmdENTDIC_BANKCfg_Click
   If menuActionENTDIC_BANK = "FND" Then cmdENTDIC_BANKFnd_Click
   If menuActionENTDIC_BANK = "ACC" Then cmdENTDIC_BANKAcc_Click
   menuActionENTDIC_BANK = ""
End Sub
Private Sub cmdENTDIC_BANKCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridENTDIC_BANK, "gridENTDIC_BANK"
Set jset = Nothing
End Sub

Private Sub cmdENTDIC_BANKPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridENTDIC_BANK, "Банки"
Set jset = Nothing
End Sub

Private Sub cmdENTDIC_BANKRef_Click()
  On Error Resume Next
  Item.ENTDIC_BANK.Refresh
  gridENTDIC_BANK.ItemCount = Item.ENTDIC_BANK.Count
  gridENTDIC_BANK.Refetch
  gridENTDIC_BANK.Refresh
End Sub
Private Sub cmdENTDIC_BANKAcc_Click()
On Error Resume Next
If gridENTDIC_BANK.ItemCount = 0 Then Exit Sub
If gridENTDIC_BANK.Row > 0 Then
 If gridENTDIC_BANK.RowIndex(gridENTDIC_BANK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridENTDIC_BANK.RowBookmark(gridENTDIC_BANK.RowIndex(gridENTDIC_BANK.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdENTDIC_BANKEdit_Click()
  On Error Resume Next
If gridENTDIC_BANK.ItemCount = 0 Then Exit Sub
If gridENTDIC_BANK.Row > 0 Then
 If gridENTDIC_BANK.RowIndex(gridENTDIC_BANK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridENTDIC_BANK.RowBookmark(gridENTDIC_BANK.RowIndex(gridENTDIC_BANK.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmENTDIC_BANK_.Item = u
again:     frmENTDIC_BANK_.NotFirstTime = False
    frmENTDIC_BANK_.OnInit
    frmENTDIC_BANK_.Show vbModal
    If frmENTDIC_BANK_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridENTDIC_BANK.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdENTDIC_BANKDel_Click()
  On Error Resume Next
  gridENTDIC_BANK.Delete
End Sub
Private Sub cmdENTDIC_BANKAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.ENTDIC_BANK.Add()

      Set frmENTDIC_BANK_.Item = u
again:       frmENTDIC_BANK_.NotFirstTime = False
      frmENTDIC_BANK_.OnInit
      frmENTDIC_BANK_.Show vbModal
      If frmENTDIC_BANK_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridENTDIC_BANK.ItemCount = Item.ENTDIC_BANK.Count
        gridENTDIC_BANK.Refresh
        gridENTDIC_BANK.RefreshGroups
        gridENTDIC_BANK.RefreshSort
        gridENTDIC_BANK.MoveToBookmark u.ID & "ENTDIC_BANK"
      Else
        Item.ENTDIC_BANK.Delete u.ID
        Item.ENTDIC_BANK.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdENTDIC_BANKFnd_Click()
  On Error Resume Next
  fndENTDIC_BANK.ShowForm
End Sub
Private Sub cmdENTDIC_BANKRun_Click()
  On Error Resume Next
  gridENTDIC_BANK_DblClick
End Sub
Private Sub gridENTDIC_BANK_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.ENTDIC_BANK.LoadRow gridENTDIC_BANK, RowIndex, Bookmark, Values
End Sub
Private Sub gridENTDIC_BANK_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridENTDIC_BANK.ItemCount = 0 Then Exit Sub
  Dim u As Object
  On Error Resume Next
  Set u = Item.FindRowObject(Right(Bookmark, Len(Bookmark) - 38), Left(Bookmark, 38))
  If Not u Is Nothing Then
    If MsgBox("Удалить элемент" & vbCrLf & u.Brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
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
Private Sub gridENTDIC_BANK_DblClick()
  cmdENTDIC_BANKEdit_Click
End Sub
Private Sub gridENTDIC_BANK_KeyPress(KeyAscii As Integer)
  If gridENTDIC_BANK.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndENTDIC_BANK.FindOnPress KeyAscii
End Sub

Private Sub pnlENTDIC_BANK_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridENTDIC_BANK.Left = Left
  gridENTDIC_BANK.Top = Top + 25 * Screen.TwipsPerPixelY
  gridENTDIC_BANK.Width = Width
  gridENTDIC_BANK.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdENTDIC_BANKAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdENTDIC_BANKEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdENTDIC_BANKDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdENTDIC_BANKRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdENTDIC_BANKPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdENTDIC_BANKFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdENTDIC_BANKAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdENTDIC_BANKEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdENTDIC_BANKDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdENTDIC_BANKRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdENTDIC_BANKPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdENTDIC_BANKFnd.Left = Left + 130 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuENTDIC_BANKPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.ENTDIC_BANK.Add()
    If GetFromBuffer(u) Then
      gridENTDIC_BANK.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdENTDIC_1CLINKCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridENTDIC_1CLINK, "gridENTDIC_1CLINK"
Set jset = Nothing
End Sub

Private Sub cmdENTDIC_1CLINKPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridENTDIC_1CLINK, "Связь с 1С"
Set jset = Nothing
End Sub

Private Sub cmdENTDIC_1CLINKAcc_Click()
On Error Resume Next
If gridENTDIC_1CLINK.ItemCount = 0 Then Exit Sub
If gridENTDIC_1CLINK.Row > 0 Then
 If gridENTDIC_1CLINK.RowIndex(gridENTDIC_1CLINK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridENTDIC_1CLINK.RowBookmark(gridENTDIC_1CLINK.RowIndex(gridENTDIC_1CLINK.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdENTDIC_1CLINKFnd_Click()
  On Error Resume Next
  fndENTDIC_1CLINK.ShowForm
End Sub
Private Sub cmdENTDIC_1CLINKRun_Click()
  On Error Resume Next
  gridENTDIC_1CLINK_DblClick
End Sub
Private Sub pnlENTDIC_BANK_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridENTDIC_1CLINK.Left = Left
  gridENTDIC_1CLINK.Top = Top + 25 * Screen.TwipsPerPixelY
  gridENTDIC_1CLINK.Width = Width
  gridENTDIC_1CLINK.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdENTDIC_1CLINKAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdENTDIC_1CLINKEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdENTDIC_1CLINKDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdENTDIC_1CLINKRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdENTDIC_1CLINKPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdENTDIC_1CLINKFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdENTDIC_1CLINKAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdENTDIC_1CLINKEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdENTDIC_1CLINKDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdENTDIC_1CLINKRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdENTDIC_1CLINKPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdENTDIC_1CLINKFnd.Left = Left + 130 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdENTDIC_1CLINKRef_Click()
  On Error Resume Next
If gridENTDIC_BANK.ItemCount = 0 Then Exit Sub
If gridENTDIC_BANK.Row > 0 Then
 If gridENTDIC_BANK.RowIndex(gridENTDIC_BANK.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridENTDIC_BANK.RowBookmark(gridENTDIC_BANK.RowIndex(gridENTDIC_BANK.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.ENTDIC_1CLINK.Refresh
   gridENTDIC_1CLINK.ItemCount = gu.ENTDIC_1CLINK.Count
   gridENTDIC_1CLINK.Refetch
   gridENTDIC_1CLINK.Refresh
 Else
  gridENTDIC_1CLINK.Columns.Clear
  gridENTDIC_1CLINK.ItemCount = 0
 End If
Else
 gridENTDIC_1CLINK.Columns.Clear
 gridENTDIC_1CLINK.ItemCount = 0
End If
End Sub
Private Sub cmdENTDIC_1CLINKEdit_Click()
    If gridENTDIC_1CLINK.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridENTDIC_1CLINK.RowBookmark(gridENTDIC_1CLINK.RowIndex(gridENTDIC_1CLINK.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmENTDIC_1CLINK_.Item = u
again:     frmENTDIC_1CLINK_.NotFirstTime = False
    frmENTDIC_1CLINK_.OnInit
    frmENTDIC_1CLINK_.Show vbModal
    If frmENTDIC_1CLINK_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridENTDIC_1CLINK.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdENTDIC_1CLINKDel_Click()
  On Error Resume Next
  gridENTDIC_1CLINK.Delete
End Sub
Private Sub cmdENTDIC_1CLINKAdd_Click()
  On Error Resume Next
    Dim gu As Object
    Dim u As Object
If gridENTDIC_BANK.ItemCount = 0 Then Exit Sub
    Dim bm
    bm = gridENTDIC_BANK.RowBookmark(gridENTDIC_BANK.RowIndex(gridENTDIC_BANK.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set u = gu.ENTDIC_1CLINK.Add()

      Set frmENTDIC_1CLINK_.Item = u
again:       frmENTDIC_1CLINK_.NotFirstTime = False
      frmENTDIC_1CLINK_.OnInit
      frmENTDIC_1CLINK_.Show vbModal
      If frmENTDIC_1CLINK_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridENTDIC_1CLINK.ItemCount = gu.ENTDIC_1CLINK.Count
        gridENTDIC_1CLINK.Refresh
        gridENTDIC_1CLINK.RefreshGroups
        gridENTDIC_1CLINK.RefreshSort
        gridENTDIC_1CLINK.MoveToBookmark u.ID & "ENTDIC_1CLINK"
      Else
        gu.ENTDIC_1CLINK.Delete u.ID
        gu.ENTDIC_1CLINK.Remove u.ID
      End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridENTDIC_BANK_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridENTDIC_BANK.ItemCount = 0 Then
  gridENTDIC_1CLINK.ItemCount = 0
  Exit Sub
End If
If gridENTDIC_BANK.Row > 0 Then
  If LastRow <> gridENTDIC_BANK.Row And LastRow > 0 Then
    gridENTDIC_BANK.GetRowData(LastRow).RowStyle = "Default"
    gridENTDIC_BANK.GetRowData(gridENTDIC_BANK.Row).RowStyle = "SelectedRow"
  End If
 If gridENTDIC_BANK.RowIndex(gridENTDIC_BANK.Row) > 0 Then
  If LastRow <> gridENTDIC_BANK.Row Or gridENTDIC_1CLINK.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridENTDIC_BANK.RowBookmark(gridENTDIC_BANK.RowIndex(gridENTDIC_BANK.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.ENTDIC_1CLINK.PrepareGrid gridENTDIC_1CLINK
  gridENTDIC_1CLINK.ItemCount = 0
    LoadGridLayout gridENTDIC_1CLINK
    Set fndENTDIC_1CLINK = Nothing
    Set fndENTDIC_1CLINK = CreateObject("MTZ_JSetup.GridFinder")
    fndENTDIC_1CLINK.Init gridENTDIC_1CLINK
  gridENTDIC_1CLINK.ItemCount = gu.ENTDIC_1CLINK.Count
  End If
 End If
End If
End Sub
Private Sub gridENTDIC_1CLINK_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
    If gridENTDIC_BANK.ItemCount = 0 Then Exit Sub
    If gridENTDIC_1CLINK.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridENTDIC_BANK.RowBookmark(gridENTDIC_BANK.RowIndex(gridENTDIC_BANK.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.ENTDIC_1CLINK.LoadRow gridENTDIC_1CLINK, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridENTDIC_1CLINK_KeyPress(KeyAscii As Integer)
  If gridENTDIC_1CLINK.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndENTDIC_1CLINK.FindOnPress KeyAscii
End Sub

Private Sub gridENTDIC_1CLINK_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If gridENTDIC_1CLINK.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridENTDIC_1CLINK.RowBookmark(gridENTDIC_1CLINK.RowIndex(gridENTDIC_1CLINK.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    If Not u Is Nothing Then
      On Error Resume Next
      If MsgBox("Удалить элемент" & vbCrLf & u.Brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
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
Private Sub gridENTDIC_1CLINK_DblClick()
    cmdENTDIC_1CLINKEdit_Click
End Sub
Private Sub gridENTDIC_1CLINK_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridENTDIC_1CLINK.ItemCount = 0 Then Exit Sub
 If gridENTDIC_1CLINK.Row > 0 Then
   If LastRow <> gridENTDIC_1CLINK.Row And LastRow > 0 Then
     gridENTDIC_1CLINK.GetRowData(LastRow).RowStyle = "Default"
     gridENTDIC_1CLINK.GetRowData(gridENTDIC_1CLINK.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuENTDIC_1CLINKPASTE_Click()
On Error Resume Next
    If gridENTDIC_BANK.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridENTDIC_BANK.RowBookmark(gridENTDIC_BANK.RowIndex(gridENTDIC_BANK.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.ENTDIC_1CLINK.Add()
    If GetFromBuffer(u) Then
      gridENTDIC_1CLINK.ItemCount = u.Parent.Count
    Else
      gu.ENTDIC_1CLINK.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridENTDIC_1CLINK_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdENTDIC_1CLINKCfg_Click
        End If
    End If
End Sub

Private Sub gridENTDIC_1CLINK_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupENTDIC_1CLINK
End If
End Sub
Private Sub mnuENTDIC_1CLINKAdd_click()
   menuActionENTDIC_1CLINK = "ADD"
   menuTimerENTDIC_1CLINK.Enabled = True
End Sub
Private Sub mnuENTDIC_1CLINKEdit_click()
   menuActionENTDIC_1CLINK = "EDIT"
   menuTimerENTDIC_1CLINK.Enabled = True
End Sub
Private Sub mnuENTDIC_1CLINKDelete_click()
   menuActionENTDIC_1CLINK = "DEL"
   menuTimerENTDIC_1CLINK.Enabled = True
End Sub
Private Sub mnuENTDIC_1CLINKOpen_click()
   menuActionENTDIC_1CLINK = "RUN"
   menuTimerENTDIC_1CLINK.Enabled = True
End Sub
Private Sub mnuENTDIC_1CLINKRef_click()
   menuActionENTDIC_1CLINK = "REF"
   menuTimerENTDIC_1CLINK.Enabled = True
End Sub
  Private Sub mnuENTDIC_1CLINKCOPY_Click()
    On Error Resume Next
    If gridENTDIC_1CLINK.ItemCount = 0 Then Exit Sub
    If gridENTDIC_1CLINK.Row > 0 Then
     If gridENTDIC_1CLINK.RowIndex(gridENTDIC_1CLINK.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridENTDIC_1CLINK.RowBookmark(gridENTDIC_1CLINK.RowIndex(gridENTDIC_1CLINK.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuENTDIC_1CLINKCUT_Click()
    On Error Resume Next
    If gridENTDIC_1CLINK.ItemCount = 0 Then Exit Sub
    If gridENTDIC_1CLINK.Row > 0 Then
     If gridENTDIC_1CLINK.RowIndex(gridENTDIC_1CLINK.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridENTDIC_1CLINK.RowBookmark(gridENTDIC_1CLINK.RowIndex(gridENTDIC_1CLINK.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridENTDIC_1CLINK.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuENTDIC_1CLINKCHANGE_Click()
  On Error Resume Next
  If gridENTDIC_1CLINK.ItemCount = 0 Then Exit Sub
  If gridENTDIC_1CLINK.Row > 0 Then
   If gridENTDIC_1CLINK.RowIndex(gridENTDIC_1CLINK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridENTDIC_1CLINK.RowBookmark(gridENTDIC_1CLINK.RowIndex(gridENTDIC_1CLINK.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridENTDIC_1CLINK.ItemCount = u.Parent.Count
      gridENTDIC_1CLINK.RefreshRowIndex gridENTDIC_1CLINK.RowIndex(gridENTDIC_1CLINK.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuENTDIC_1CLINKCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuENTDIC_1CLINKPrn_click()
   menuActionENTDIC_1CLINK = "PRN"
   menuTimerENTDIC_1CLINK.Enabled = True
End Sub
Private Sub mnuENTDIC_1CLINKCfg_click()
   menuActionENTDIC_1CLINK = "CFG"
   menuTimerENTDIC_1CLINK.Enabled = True
End Sub
Private Sub mnuENTDIC_1CLINKFind_click()
   menuActionENTDIC_1CLINK = "FND"
   menuTimerENTDIC_1CLINK.Enabled = True
End Sub
Private Sub mnuENTDIC_1CLINKAcc_click()
   menuActionENTDIC_1CLINK = "ACC"
   menuTimerENTDIC_1CLINK.Enabled = True
End Sub
Private Sub menuTimerENTDIC_1CLINK_timer()
   menuTimerENTDIC_1CLINK.Enabled = False
   If menuActionENTDIC_1CLINK = "ADD" Then cmdENTDIC_1CLINKAdd_Click
   If menuActionENTDIC_1CLINK = "EDIT" Then cmdENTDIC_1CLINKEdit_Click
   If menuActionENTDIC_1CLINK = "DEL" Then cmdENTDIC_1CLINKDel_Click
   If menuActionENTDIC_1CLINK = "RUN" Then cmdENTDIC_1CLINKRun_Click
   If menuActionENTDIC_1CLINK = "REF" Then cmdENTDIC_1CLINKRef_Click
   If menuActionENTDIC_1CLINK = "PRN" Then cmdENTDIC_1CLINKPrn_Click
   If menuActionENTDIC_1CLINK = "CFG" Then cmdENTDIC_1CLINKCfg_Click
   If menuActionENTDIC_1CLINK = "FND" Then cmdENTDIC_1CLINKFnd_Click
   If menuActionENTDIC_1CLINK = "ACC" Then cmdENTDIC_1CLINKAcc_Click
   menuActionENTDIC_1CLINK = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdENTDIC_BANKAdd, cmdENTDIC_BANKAdd.Tag
  LoadBtnPictures cmdENTDIC_BANKEdit, cmdENTDIC_BANKEdit.Tag
  LoadBtnPictures cmdENTDIC_BANKDel, cmdENTDIC_BANKDel.Tag
  LoadBtnPictures cmdENTDIC_BANKRef, cmdENTDIC_BANKRef.Tag
  LoadBtnPictures cmdENTDIC_BANKPrn, cmdENTDIC_BANKPrn.Tag
  LoadBtnPictures cmdENTDIC_BANKFnd, cmdENTDIC_BANKFnd.Tag
  Item.ENTDIC_BANK.PrepareGrid gridENTDIC_BANK
  LoadGridLayout gridENTDIC_BANK
  Set fndENTDIC_BANK = Nothing
  On Error Resume Next
  Set fndENTDIC_BANK = CreateObject("MTZ_JSetup.GridFinder")
  fndENTDIC_BANK.Init gridENTDIC_BANK
  LoadBtnPictures cmdENTDIC_1CLINKAdd, cmdENTDIC_1CLINKAdd.Tag
  LoadBtnPictures cmdENTDIC_1CLINKEdit, cmdENTDIC_1CLINKEdit.Tag
  LoadBtnPictures cmdENTDIC_1CLINKDel, cmdENTDIC_1CLINKDel.Tag
  LoadBtnPictures cmdENTDIC_1CLINKRef, cmdENTDIC_1CLINKRef.Tag
  LoadBtnPictures cmdENTDIC_1CLINKPrn, cmdENTDIC_1CLINKPrn.Tag
  LoadBtnPictures cmdENTDIC_1CLINKFnd, cmdENTDIC_1CLINKFnd.Tag
  gridENTDIC_1CLINK.Columns.Clear
  gridENTDIC_1CLINK.ItemCount = 0
  cmdENTDIC_1CLINKRef_Click
End Sub
Private Sub OnTabClick()

pnlENTDIC_BANK.RestorePosition
  gridENTDIC_BANK_RowColChange gridENTDIC_BANK.Row, -1
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
  pnlENTDIC_BANK.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndENTDIC_BANK = Nothing
  Set fndENTDIC_1CLINK = Nothing
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





