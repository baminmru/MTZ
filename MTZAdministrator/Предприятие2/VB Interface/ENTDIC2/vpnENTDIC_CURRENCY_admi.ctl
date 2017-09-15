VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnENTDIC_CURRENCY_admi 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerENTDIC_CURCOURCE 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerENTDIC_CURRENCY 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlENTDIC_CURRENCY 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdENTDIC_CURCOURCEFnd 
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
      Begin VB.CommandButton cmdENTDIC_CURCOURCEPrn 
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
      Begin VB.CommandButton cmdENTDIC_CURCOURCERef 
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
      Begin VB.CommandButton cmdENTDIC_CURCOURCEDel 
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
      Begin VB.CommandButton cmdENTDIC_CURCOURCEEdit 
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
      Begin VB.CommandButton cmdENTDIC_CURCOURCEAdd 
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
      Begin GridEX20.GridEX gridENTDIC_CURCOURCE 
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
         Column(1)       =   "vpnENTDIC_CURRENCY_admi.ctx":0000
         Column(2)       =   "vpnENTDIC_CURRENCY_admi.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnENTDIC_CURRENCY_admi.ctx":016C
         FormatStyle(2)  =   "vpnENTDIC_CURRENCY_admi.ctx":02C8
         FormatStyle(3)  =   "vpnENTDIC_CURRENCY_admi.ctx":0378
         FormatStyle(4)  =   "vpnENTDIC_CURRENCY_admi.ctx":042C
         FormatStyle(5)  =   "vpnENTDIC_CURRENCY_admi.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnENTDIC_CURRENCY_admi.ctx":05BC
      End
      Begin VB.CommandButton cmdENTDIC_CURRENCYFnd 
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
      Begin VB.CommandButton cmdENTDIC_CURRENCYPrn 
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
      Begin VB.CommandButton cmdENTDIC_CURRENCYRef 
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
      Begin VB.CommandButton cmdENTDIC_CURRENCYDel 
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
      Begin VB.CommandButton cmdENTDIC_CURRENCYEdit 
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
      Begin VB.CommandButton cmdENTDIC_CURRENCYAdd 
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
      Begin GridEX20.GridEX gridENTDIC_CURRENCY 
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
         Column(1)       =   "vpnENTDIC_CURRENCY_admi.ctx":0794
         Column(2)       =   "vpnENTDIC_CURRENCY_admi.ctx":085C
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnENTDIC_CURRENCY_admi.ctx":0900
         FormatStyle(2)  =   "vpnENTDIC_CURRENCY_admi.ctx":0A5C
         FormatStyle(3)  =   "vpnENTDIC_CURRENCY_admi.ctx":0B0C
         FormatStyle(4)  =   "vpnENTDIC_CURRENCY_admi.ctx":0BC0
         FormatStyle(5)  =   "vpnENTDIC_CURRENCY_admi.ctx":0C98
         ImageCount      =   0
         PrinterProperties=   "vpnENTDIC_CURRENCY_admi.ctx":0D50
      End
   End
   Begin VB.Menu mnuPopupENTDIC_CURRENCY 
      Caption         =   "Меню для Валюта"
      Visible         =   0   'False
      Begin VB.Menu mnuENTDIC_CURRENCYAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuENTDIC_CURRENCYEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuENTDIC_CURRENCYDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuENTDIC_CURRENCYOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuENTDIC_CURRENCYRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuENTDIC_CURRENCYPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuENTDIC_CURRENCYCfg 
         Caption         =   "Настроить"
      End
   End
   Begin VB.Menu mnuPopupENTDIC_CURCOURCE 
      Caption         =   "Меню для Курс валюты"
      Visible         =   0   'False
      Begin VB.Menu mnuENTDIC_CURCOURCEAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuENTDIC_CURCOURCEEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuENTDIC_CURCOURCEDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuENTDIC_CURCOURCEOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuENTDIC_CURCOURCERef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuENTDIC_CURCOURCEPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuENTDIC_CURCOURCECfg 
         Caption         =   "Настроить"
      End
   End
End
Attribute VB_Name = "vpnENTDIC_CURRENCY_admi"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndENTDIC_CURRENCY As Object
Private menuActionENTDIC_CURRENCY As String
Private fndENTDIC_CURCOURCE As Object
Private menuActionENTDIC_CURCOURCE As String





Private Sub pnlENTDIC_CURRENCY_PositionChanged()
  pnlENTDIC_CURRENCY.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridENTDIC_CURRENCY_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdENTDIC_CURRENCYCfg_Click
        End If
    End If
End Sub

Private Sub gridENTDIC_CURRENCY_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupENTDIC_CURRENCY
End If
End Sub
Private Sub mnuENTDIC_CURRENCYAdd_click()
   menuActionENTDIC_CURRENCY = "ADD"
   menuTimerENTDIC_CURRENCY.Enabled = True
End Sub
Private Sub mnuENTDIC_CURRENCYEdit_click()
   menuActionENTDIC_CURRENCY = "EDIT"
   menuTimerENTDIC_CURRENCY.Enabled = True
End Sub
Private Sub mnuENTDIC_CURRENCYDelete_click()
   menuActionENTDIC_CURRENCY = "DEL"
   menuTimerENTDIC_CURRENCY.Enabled = True
End Sub
Private Sub mnuENTDIC_CURRENCYOpen_click()
   menuActionENTDIC_CURRENCY = "RUN"
   menuTimerENTDIC_CURRENCY.Enabled = True
End Sub
Private Sub mnuENTDIC_CURRENCYRef_click()
   menuActionENTDIC_CURRENCY = "REF"
   menuTimerENTDIC_CURRENCY.Enabled = True
End Sub
  Private Sub mnuENTDIC_CURRENCYCOPY_Click()
    On Error Resume Next
    If gridENTDIC_CURRENCY.ItemCount = 0 Then Exit Sub
    If gridENTDIC_CURRENCY.Row > 0 Then
     If gridENTDIC_CURRENCY.RowIndex(gridENTDIC_CURRENCY.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridENTDIC_CURRENCY.RowBookmark(gridENTDIC_CURRENCY.RowIndex(gridENTDIC_CURRENCY.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuENTDIC_CURRENCYCUT_Click()
    On Error Resume Next
    If gridENTDIC_CURRENCY.ItemCount = 0 Then Exit Sub
    If gridENTDIC_CURRENCY.Row > 0 Then
     If gridENTDIC_CURRENCY.RowIndex(gridENTDIC_CURRENCY.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridENTDIC_CURRENCY.RowBookmark(gridENTDIC_CURRENCY.RowIndex(gridENTDIC_CURRENCY.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridENTDIC_CURRENCY.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuENTDIC_CURRENCYCHANGE_Click()
  On Error Resume Next
  If gridENTDIC_CURRENCY.ItemCount = 0 Then Exit Sub
  If gridENTDIC_CURRENCY.Row > 0 Then
   If gridENTDIC_CURRENCY.RowIndex(gridENTDIC_CURRENCY.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridENTDIC_CURRENCY.RowBookmark(gridENTDIC_CURRENCY.RowIndex(gridENTDIC_CURRENCY.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridENTDIC_CURRENCY.ItemCount = u.Parent.Count
      gridENTDIC_CURRENCY.RefreshRowIndex gridENTDIC_CURRENCY.RowIndex(gridENTDIC_CURRENCY.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuENTDIC_CURRENCYCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuENTDIC_CURRENCYPrn_click()
   menuActionENTDIC_CURRENCY = "PRN"
   menuTimerENTDIC_CURRENCY.Enabled = True
End Sub
Private Sub mnuENTDIC_CURRENCYCfg_click()
   menuActionENTDIC_CURRENCY = "CFG"
   menuTimerENTDIC_CURRENCY.Enabled = True
End Sub
Private Sub mnuENTDIC_CURRENCYFind_click()
   menuActionENTDIC_CURRENCY = "FND"
   menuTimerENTDIC_CURRENCY.Enabled = True
End Sub
Private Sub mnuENTDIC_CURRENCYAcc_click()
   menuActionENTDIC_CURRENCY = "ACC"
   menuTimerENTDIC_CURRENCY.Enabled = True
End Sub
Private Sub menuTimerENTDIC_CURRENCY_timer()
   menuTimerENTDIC_CURRENCY.Enabled = False
   If menuActionENTDIC_CURRENCY = "ADD" Then cmdENTDIC_CURRENCYAdd_Click
   If menuActionENTDIC_CURRENCY = "EDIT" Then cmdENTDIC_CURRENCYEdit_Click
   If menuActionENTDIC_CURRENCY = "DEL" Then cmdENTDIC_CURRENCYDel_Click
   If menuActionENTDIC_CURRENCY = "RUN" Then cmdENTDIC_CURRENCYRun_Click
   If menuActionENTDIC_CURRENCY = "REF" Then cmdENTDIC_CURRENCYRef_Click
   If menuActionENTDIC_CURRENCY = "PRN" Then cmdENTDIC_CURRENCYPrn_Click
   If menuActionENTDIC_CURRENCY = "CFG" Then cmdENTDIC_CURRENCYCfg_Click
   If menuActionENTDIC_CURRENCY = "FND" Then cmdENTDIC_CURRENCYFnd_Click
   If menuActionENTDIC_CURRENCY = "ACC" Then cmdENTDIC_CURRENCYAcc_Click
   menuActionENTDIC_CURRENCY = ""
End Sub
Private Sub cmdENTDIC_CURRENCYCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridENTDIC_CURRENCY, "gridENTDIC_CURRENCY"
Set jset = Nothing
End Sub

Private Sub cmdENTDIC_CURRENCYPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridENTDIC_CURRENCY, "Валюта"
Set jset = Nothing
End Sub

Private Sub cmdENTDIC_CURRENCYRef_Click()
  On Error Resume Next
  Item.ENTDIC_CURRENCY.Refresh
  gridENTDIC_CURRENCY.ItemCount = Item.ENTDIC_CURRENCY.Count
  gridENTDIC_CURRENCY.Refetch
  gridENTDIC_CURRENCY.Refresh
End Sub
Private Sub cmdENTDIC_CURRENCYAcc_Click()
On Error Resume Next
If gridENTDIC_CURRENCY.ItemCount = 0 Then Exit Sub
If gridENTDIC_CURRENCY.Row > 0 Then
 If gridENTDIC_CURRENCY.RowIndex(gridENTDIC_CURRENCY.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridENTDIC_CURRENCY.RowBookmark(gridENTDIC_CURRENCY.RowIndex(gridENTDIC_CURRENCY.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdENTDIC_CURRENCYEdit_Click()
  On Error Resume Next
If gridENTDIC_CURRENCY.ItemCount = 0 Then Exit Sub
If gridENTDIC_CURRENCY.Row > 0 Then
 If gridENTDIC_CURRENCY.RowIndex(gridENTDIC_CURRENCY.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridENTDIC_CURRENCY.RowBookmark(gridENTDIC_CURRENCY.RowIndex(gridENTDIC_CURRENCY.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmENTDIC_CURRENCY_admi.Item = u
again:     frmENTDIC_CURRENCY_admi.NotFirstTime = False
    frmENTDIC_CURRENCY_admi.OnInit
    frmENTDIC_CURRENCY_admi.Show vbModal
    If frmENTDIC_CURRENCY_admi.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridENTDIC_CURRENCY.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdENTDIC_CURRENCYDel_Click()
  On Error Resume Next
  gridENTDIC_CURRENCY.Delete
End Sub
Private Sub cmdENTDIC_CURRENCYAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.ENTDIC_CURRENCY.Add()

      Set frmENTDIC_CURRENCY_admi.Item = u
again:       frmENTDIC_CURRENCY_admi.NotFirstTime = False
      frmENTDIC_CURRENCY_admi.OnInit
      frmENTDIC_CURRENCY_admi.Show vbModal
      If frmENTDIC_CURRENCY_admi.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridENTDIC_CURRENCY.ItemCount = Item.ENTDIC_CURRENCY.Count
        gridENTDIC_CURRENCY.Refresh
        gridENTDIC_CURRENCY.RefreshGroups
        gridENTDIC_CURRENCY.RefreshSort
        gridENTDIC_CURRENCY.MoveToBookmark u.ID & "ENTDIC_CURRENCY"
      Else
        Item.ENTDIC_CURRENCY.Delete u.ID
        Item.ENTDIC_CURRENCY.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdENTDIC_CURRENCYFnd_Click()
  On Error Resume Next
  fndENTDIC_CURRENCY.ShowForm
End Sub
Private Sub cmdENTDIC_CURRENCYRun_Click()
  On Error Resume Next
  gridENTDIC_CURRENCY_DblClick
End Sub
Private Sub gridENTDIC_CURRENCY_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.ENTDIC_CURRENCY.LoadRow gridENTDIC_CURRENCY, RowIndex, Bookmark, Values
End Sub
Private Sub gridENTDIC_CURRENCY_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridENTDIC_CURRENCY.ItemCount = 0 Then Exit Sub
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
Private Sub gridENTDIC_CURRENCY_DblClick()
  cmdENTDIC_CURRENCYEdit_Click
End Sub
Private Sub gridENTDIC_CURRENCY_KeyPress(KeyAscii As Integer)
  If gridENTDIC_CURRENCY.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndENTDIC_CURRENCY.FindOnPress KeyAscii
End Sub

Private Sub pnlENTDIC_CURRENCY_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridENTDIC_CURRENCY.Left = Left
  gridENTDIC_CURRENCY.Top = Top + 25 * Screen.TwipsPerPixelY
  gridENTDIC_CURRENCY.Width = Width
  gridENTDIC_CURRENCY.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdENTDIC_CURRENCYAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdENTDIC_CURRENCYEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdENTDIC_CURRENCYDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdENTDIC_CURRENCYRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdENTDIC_CURRENCYPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdENTDIC_CURRENCYFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdENTDIC_CURRENCYAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdENTDIC_CURRENCYEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdENTDIC_CURRENCYDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdENTDIC_CURRENCYRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdENTDIC_CURRENCYPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdENTDIC_CURRENCYFnd.Left = Left + 130 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuENTDIC_CURRENCYPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.ENTDIC_CURRENCY.Add()
    If GetFromBuffer(u) Then
      gridENTDIC_CURRENCY.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdENTDIC_CURCOURCECfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridENTDIC_CURCOURCE, "gridENTDIC_CURCOURCE"
Set jset = Nothing
End Sub

Private Sub cmdENTDIC_CURCOURCEPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridENTDIC_CURCOURCE, "Курс валюты"
Set jset = Nothing
End Sub

Private Sub cmdENTDIC_CURCOURCEAcc_Click()
On Error Resume Next
If gridENTDIC_CURCOURCE.ItemCount = 0 Then Exit Sub
If gridENTDIC_CURCOURCE.Row > 0 Then
 If gridENTDIC_CURCOURCE.RowIndex(gridENTDIC_CURCOURCE.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridENTDIC_CURCOURCE.RowBookmark(gridENTDIC_CURCOURCE.RowIndex(gridENTDIC_CURCOURCE.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdENTDIC_CURCOURCEFnd_Click()
  On Error Resume Next
  fndENTDIC_CURCOURCE.ShowForm
End Sub
Private Sub cmdENTDIC_CURCOURCERun_Click()
  On Error Resume Next
  gridENTDIC_CURCOURCE_DblClick
End Sub
Private Sub pnlENTDIC_CURRENCY_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridENTDIC_CURCOURCE.Left = Left
  gridENTDIC_CURCOURCE.Top = Top + 25 * Screen.TwipsPerPixelY
  gridENTDIC_CURCOURCE.Width = Width
  gridENTDIC_CURCOURCE.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdENTDIC_CURCOURCEAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdENTDIC_CURCOURCEEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdENTDIC_CURCOURCEDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdENTDIC_CURCOURCERef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdENTDIC_CURCOURCEPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdENTDIC_CURCOURCEFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdENTDIC_CURCOURCEAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdENTDIC_CURCOURCEEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdENTDIC_CURCOURCEDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdENTDIC_CURCOURCERef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdENTDIC_CURCOURCEPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdENTDIC_CURCOURCEFnd.Left = Left + 130 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdENTDIC_CURCOURCERef_Click()
  On Error Resume Next
If gridENTDIC_CURRENCY.ItemCount = 0 Then Exit Sub
If gridENTDIC_CURRENCY.Row > 0 Then
 If gridENTDIC_CURRENCY.RowIndex(gridENTDIC_CURRENCY.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridENTDIC_CURRENCY.RowBookmark(gridENTDIC_CURRENCY.RowIndex(gridENTDIC_CURRENCY.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.ENTDIC_CURCOURCE.Refresh
   gridENTDIC_CURCOURCE.ItemCount = gu.ENTDIC_CURCOURCE.Count
   gridENTDIC_CURCOURCE.Refetch
   gridENTDIC_CURCOURCE.Refresh
 Else
  gridENTDIC_CURCOURCE.Columns.Clear
  gridENTDIC_CURCOURCE.ItemCount = 0
 End If
Else
 gridENTDIC_CURCOURCE.Columns.Clear
 gridENTDIC_CURCOURCE.ItemCount = 0
End If
End Sub
Private Sub cmdENTDIC_CURCOURCEEdit_Click()
    If gridENTDIC_CURCOURCE.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridENTDIC_CURCOURCE.RowBookmark(gridENTDIC_CURCOURCE.RowIndex(gridENTDIC_CURCOURCE.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmENTDIC_CURCOURCE_admi.Item = u
again:     frmENTDIC_CURCOURCE_admi.NotFirstTime = False
    frmENTDIC_CURCOURCE_admi.OnInit
    frmENTDIC_CURCOURCE_admi.Show vbModal
    If frmENTDIC_CURCOURCE_admi.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridENTDIC_CURCOURCE.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdENTDIC_CURCOURCEDel_Click()
  On Error Resume Next
  gridENTDIC_CURCOURCE.Delete
End Sub
Private Sub cmdENTDIC_CURCOURCEAdd_Click()
  On Error Resume Next
    Dim gu As Object
    Dim u As Object
If gridENTDIC_CURRENCY.ItemCount = 0 Then Exit Sub
    Dim bm
    bm = gridENTDIC_CURRENCY.RowBookmark(gridENTDIC_CURRENCY.RowIndex(gridENTDIC_CURRENCY.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set u = gu.ENTDIC_CURCOURCE.Add()

      Set frmENTDIC_CURCOURCE_admi.Item = u
again:       frmENTDIC_CURCOURCE_admi.NotFirstTime = False
      frmENTDIC_CURCOURCE_admi.OnInit
      frmENTDIC_CURCOURCE_admi.Show vbModal
      If frmENTDIC_CURCOURCE_admi.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridENTDIC_CURCOURCE.ItemCount = gu.ENTDIC_CURCOURCE.Count
        gridENTDIC_CURCOURCE.Refresh
        gridENTDIC_CURCOURCE.RefreshGroups
        gridENTDIC_CURCOURCE.RefreshSort
        gridENTDIC_CURCOURCE.MoveToBookmark u.ID & "ENTDIC_CURCOURCE"
      Else
        gu.ENTDIC_CURCOURCE.Delete u.ID
        gu.ENTDIC_CURCOURCE.Remove u.ID
      End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridENTDIC_CURRENCY_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridENTDIC_CURRENCY.ItemCount = 0 Then
  gridENTDIC_CURCOURCE.ItemCount = 0
  Exit Sub
End If
If gridENTDIC_CURRENCY.Row > 0 Then
  If LastRow <> gridENTDIC_CURRENCY.Row And LastRow > 0 Then
    gridENTDIC_CURRENCY.GetRowData(LastRow).RowStyle = "Default"
    gridENTDIC_CURRENCY.GetRowData(gridENTDIC_CURRENCY.Row).RowStyle = "SelectedRow"
  End If
 If gridENTDIC_CURRENCY.RowIndex(gridENTDIC_CURRENCY.Row) > 0 Then
  If LastRow <> gridENTDIC_CURRENCY.Row Or gridENTDIC_CURCOURCE.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridENTDIC_CURRENCY.RowBookmark(gridENTDIC_CURRENCY.RowIndex(gridENTDIC_CURRENCY.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.ENTDIC_CURCOURCE.PrepareGrid gridENTDIC_CURCOURCE
  gridENTDIC_CURCOURCE.ItemCount = 0
    LoadGridLayout gridENTDIC_CURCOURCE
    Set fndENTDIC_CURCOURCE = Nothing
    Set fndENTDIC_CURCOURCE = CreateObject("MTZ_JSetup.GridFinder")
    fndENTDIC_CURCOURCE.Init gridENTDIC_CURCOURCE
  gridENTDIC_CURCOURCE.ItemCount = gu.ENTDIC_CURCOURCE.Count
  End If
 End If
End If
End Sub
Private Sub gridENTDIC_CURCOURCE_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
    If gridENTDIC_CURRENCY.ItemCount = 0 Then Exit Sub
    If gridENTDIC_CURCOURCE.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridENTDIC_CURRENCY.RowBookmark(gridENTDIC_CURRENCY.RowIndex(gridENTDIC_CURRENCY.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.ENTDIC_CURCOURCE.LoadRow gridENTDIC_CURCOURCE, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridENTDIC_CURCOURCE_KeyPress(KeyAscii As Integer)
  If gridENTDIC_CURCOURCE.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndENTDIC_CURCOURCE.FindOnPress KeyAscii
End Sub

Private Sub gridENTDIC_CURCOURCE_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If gridENTDIC_CURCOURCE.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridENTDIC_CURCOURCE.RowBookmark(gridENTDIC_CURCOURCE.RowIndex(gridENTDIC_CURCOURCE.Row))
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
Private Sub gridENTDIC_CURCOURCE_DblClick()
    cmdENTDIC_CURCOURCEEdit_Click
End Sub
Private Sub gridENTDIC_CURCOURCE_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridENTDIC_CURCOURCE.ItemCount = 0 Then Exit Sub
 If gridENTDIC_CURCOURCE.Row > 0 Then
   If LastRow <> gridENTDIC_CURCOURCE.Row And LastRow > 0 Then
     gridENTDIC_CURCOURCE.GetRowData(LastRow).RowStyle = "Default"
     gridENTDIC_CURCOURCE.GetRowData(gridENTDIC_CURCOURCE.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuENTDIC_CURCOURCEPASTE_Click()
On Error Resume Next
    If gridENTDIC_CURRENCY.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridENTDIC_CURRENCY.RowBookmark(gridENTDIC_CURRENCY.RowIndex(gridENTDIC_CURRENCY.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.ENTDIC_CURCOURCE.Add()
    If GetFromBuffer(u) Then
      gridENTDIC_CURCOURCE.ItemCount = u.Parent.Count
    Else
      gu.ENTDIC_CURCOURCE.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridENTDIC_CURCOURCE_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdENTDIC_CURCOURCECfg_Click
        End If
    End If
End Sub

Private Sub gridENTDIC_CURCOURCE_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupENTDIC_CURCOURCE
End If
End Sub
Private Sub mnuENTDIC_CURCOURCEAdd_click()
   menuActionENTDIC_CURCOURCE = "ADD"
   menuTimerENTDIC_CURCOURCE.Enabled = True
End Sub
Private Sub mnuENTDIC_CURCOURCEEdit_click()
   menuActionENTDIC_CURCOURCE = "EDIT"
   menuTimerENTDIC_CURCOURCE.Enabled = True
End Sub
Private Sub mnuENTDIC_CURCOURCEDelete_click()
   menuActionENTDIC_CURCOURCE = "DEL"
   menuTimerENTDIC_CURCOURCE.Enabled = True
End Sub
Private Sub mnuENTDIC_CURCOURCEOpen_click()
   menuActionENTDIC_CURCOURCE = "RUN"
   menuTimerENTDIC_CURCOURCE.Enabled = True
End Sub
Private Sub mnuENTDIC_CURCOURCERef_click()
   menuActionENTDIC_CURCOURCE = "REF"
   menuTimerENTDIC_CURCOURCE.Enabled = True
End Sub
  Private Sub mnuENTDIC_CURCOURCECOPY_Click()
    On Error Resume Next
    If gridENTDIC_CURCOURCE.ItemCount = 0 Then Exit Sub
    If gridENTDIC_CURCOURCE.Row > 0 Then
     If gridENTDIC_CURCOURCE.RowIndex(gridENTDIC_CURCOURCE.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridENTDIC_CURCOURCE.RowBookmark(gridENTDIC_CURCOURCE.RowIndex(gridENTDIC_CURCOURCE.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuENTDIC_CURCOURCECUT_Click()
    On Error Resume Next
    If gridENTDIC_CURCOURCE.ItemCount = 0 Then Exit Sub
    If gridENTDIC_CURCOURCE.Row > 0 Then
     If gridENTDIC_CURCOURCE.RowIndex(gridENTDIC_CURCOURCE.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridENTDIC_CURCOURCE.RowBookmark(gridENTDIC_CURCOURCE.RowIndex(gridENTDIC_CURCOURCE.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridENTDIC_CURCOURCE.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuENTDIC_CURCOURCECHANGE_Click()
  On Error Resume Next
  If gridENTDIC_CURCOURCE.ItemCount = 0 Then Exit Sub
  If gridENTDIC_CURCOURCE.Row > 0 Then
   If gridENTDIC_CURCOURCE.RowIndex(gridENTDIC_CURCOURCE.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridENTDIC_CURCOURCE.RowBookmark(gridENTDIC_CURCOURCE.RowIndex(gridENTDIC_CURCOURCE.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridENTDIC_CURCOURCE.ItemCount = u.Parent.Count
      gridENTDIC_CURCOURCE.RefreshRowIndex gridENTDIC_CURCOURCE.RowIndex(gridENTDIC_CURCOURCE.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuENTDIC_CURCOURCECLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuENTDIC_CURCOURCEPrn_click()
   menuActionENTDIC_CURCOURCE = "PRN"
   menuTimerENTDIC_CURCOURCE.Enabled = True
End Sub
Private Sub mnuENTDIC_CURCOURCECfg_click()
   menuActionENTDIC_CURCOURCE = "CFG"
   menuTimerENTDIC_CURCOURCE.Enabled = True
End Sub
Private Sub mnuENTDIC_CURCOURCEFind_click()
   menuActionENTDIC_CURCOURCE = "FND"
   menuTimerENTDIC_CURCOURCE.Enabled = True
End Sub
Private Sub mnuENTDIC_CURCOURCEAcc_click()
   menuActionENTDIC_CURCOURCE = "ACC"
   menuTimerENTDIC_CURCOURCE.Enabled = True
End Sub
Private Sub menuTimerENTDIC_CURCOURCE_timer()
   menuTimerENTDIC_CURCOURCE.Enabled = False
   If menuActionENTDIC_CURCOURCE = "ADD" Then cmdENTDIC_CURCOURCEAdd_Click
   If menuActionENTDIC_CURCOURCE = "EDIT" Then cmdENTDIC_CURCOURCEEdit_Click
   If menuActionENTDIC_CURCOURCE = "DEL" Then cmdENTDIC_CURCOURCEDel_Click
   If menuActionENTDIC_CURCOURCE = "RUN" Then cmdENTDIC_CURCOURCERun_Click
   If menuActionENTDIC_CURCOURCE = "REF" Then cmdENTDIC_CURCOURCERef_Click
   If menuActionENTDIC_CURCOURCE = "PRN" Then cmdENTDIC_CURCOURCEPrn_Click
   If menuActionENTDIC_CURCOURCE = "CFG" Then cmdENTDIC_CURCOURCECfg_Click
   If menuActionENTDIC_CURCOURCE = "FND" Then cmdENTDIC_CURCOURCEFnd_Click
   If menuActionENTDIC_CURCOURCE = "ACC" Then cmdENTDIC_CURCOURCEAcc_Click
   menuActionENTDIC_CURCOURCE = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdENTDIC_CURRENCYAdd, cmdENTDIC_CURRENCYAdd.Tag
  LoadBtnPictures cmdENTDIC_CURRENCYEdit, cmdENTDIC_CURRENCYEdit.Tag
  LoadBtnPictures cmdENTDIC_CURRENCYDel, cmdENTDIC_CURRENCYDel.Tag
  LoadBtnPictures cmdENTDIC_CURRENCYRef, cmdENTDIC_CURRENCYRef.Tag
  LoadBtnPictures cmdENTDIC_CURRENCYPrn, cmdENTDIC_CURRENCYPrn.Tag
  LoadBtnPictures cmdENTDIC_CURRENCYFnd, cmdENTDIC_CURRENCYFnd.Tag
  Item.ENTDIC_CURRENCY.PrepareGrid gridENTDIC_CURRENCY
  LoadGridLayout gridENTDIC_CURRENCY
  Set fndENTDIC_CURRENCY = Nothing
  On Error Resume Next
  Set fndENTDIC_CURRENCY = CreateObject("MTZ_JSetup.GridFinder")
  fndENTDIC_CURRENCY.Init gridENTDIC_CURRENCY
  LoadBtnPictures cmdENTDIC_CURCOURCEAdd, cmdENTDIC_CURCOURCEAdd.Tag
  LoadBtnPictures cmdENTDIC_CURCOURCEEdit, cmdENTDIC_CURCOURCEEdit.Tag
  LoadBtnPictures cmdENTDIC_CURCOURCEDel, cmdENTDIC_CURCOURCEDel.Tag
  LoadBtnPictures cmdENTDIC_CURCOURCERef, cmdENTDIC_CURCOURCERef.Tag
  LoadBtnPictures cmdENTDIC_CURCOURCEPrn, cmdENTDIC_CURCOURCEPrn.Tag
  LoadBtnPictures cmdENTDIC_CURCOURCEFnd, cmdENTDIC_CURCOURCEFnd.Tag
  gridENTDIC_CURCOURCE.Columns.Clear
  gridENTDIC_CURCOURCE.ItemCount = 0
  cmdENTDIC_CURCOURCERef_Click
End Sub
Private Sub OnTabClick()

pnlENTDIC_CURRENCY.RestorePosition
  gridENTDIC_CURRENCY_RowColChange gridENTDIC_CURRENCY.Row, -1
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
  pnlENTDIC_CURRENCY.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndENTDIC_CURRENCY = Nothing
  Set fndENTDIC_CURCOURCE = Nothing
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





