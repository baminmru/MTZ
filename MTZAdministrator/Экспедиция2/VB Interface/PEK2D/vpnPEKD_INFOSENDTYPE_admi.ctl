VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnPEKD_INFOSENDTYPE_admi 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerPEKD_INFOSENDTYPE 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlPEKD_INFOSENDTYPE 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdPEKD_INFOSENDTYPEAcc 
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
      Begin VB.CommandButton cmdPEKD_INFOSENDTYPEFnd 
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
      Begin VB.CommandButton cmdPEKD_INFOSENDTYPECfg 
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
      Begin VB.CommandButton cmdPEKD_INFOSENDTYPEPrn 
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
      Begin VB.CommandButton cmdPEKD_INFOSENDTYPERef 
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
      Begin VB.CommandButton cmdPEKD_INFOSENDTYPEDel 
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
      Begin VB.CommandButton cmdPEKD_INFOSENDTYPEEdit 
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
      Begin VB.CommandButton cmdPEKD_INFOSENDTYPEAdd 
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
      Begin GridEX20.GridEX gridPEKD_INFOSENDTYPE 
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
         Column(1)       =   "vpnPEKD_INFOSENDTYPE_admi.ctx":0000
         Column(2)       =   "vpnPEKD_INFOSENDTYPE_admi.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnPEKD_INFOSENDTYPE_admi.ctx":016C
         FormatStyle(2)  =   "vpnPEKD_INFOSENDTYPE_admi.ctx":02C8
         FormatStyle(3)  =   "vpnPEKD_INFOSENDTYPE_admi.ctx":0378
         FormatStyle(4)  =   "vpnPEKD_INFOSENDTYPE_admi.ctx":042C
         FormatStyle(5)  =   "vpnPEKD_INFOSENDTYPE_admi.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnPEKD_INFOSENDTYPE_admi.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdPEKD_INFOSENDTYPERun 
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
   End
   Begin VB.Menu mnuPopupPEKD_INFOSENDTYPE 
      Caption         =   "Меню для Способ передачи информации"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKD_INFOSENDTYPEAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuPEKD_INFOSENDTYPEEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuPEKD_INFOSENDTYPEDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuPEKD_INFOSENDTYPEOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuPEKD_INFOSENDTYPERef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuPEKD_INFOSENDTYPES1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPEKD_INFOSENDTYPEBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuPEKD_INFOSENDTYPECOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuPEKD_INFOSENDTYPECUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuPEKD_INFOSENDTYPEPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuPEKD_INFOSENDTYPECHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuPEKD_INFOSENDTYPECLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuPEKD_INFOSENDTYPEPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuPEKD_INFOSENDTYPECfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuPEKD_INFOSENDTYPEFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuPEKD_INFOSENDTYPEAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnPEKD_INFOSENDTYPE_admi"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndPEKD_INFOSENDTYPE As Object
Private menuActionPEKD_INFOSENDTYPE As String





Private Sub cmdPEKD_INFOSENDTYPECfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEKD_INFOSENDTYPE, "gridPEKD_INFOSENDTYPE"
Set jset = Nothing
End Sub

Private Sub cmdPEKD_INFOSENDTYPEPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEKD_INFOSENDTYPE, "Способ передачи информации"
Set jset = Nothing
End Sub

Private Sub cmdPEKD_INFOSENDTYPERef_Click()
  On Error Resume Next
  Item.PEKD_INFOSENDTYPE.Refresh
  gridPEKD_INFOSENDTYPE.ItemCount = Item.PEKD_INFOSENDTYPE.Count
  gridPEKD_INFOSENDTYPE.Refetch
  gridPEKD_INFOSENDTYPE.Refresh
End Sub
Private Sub cmdPEKD_INFOSENDTYPEAcc_Click()
On Error Resume Next
If gridPEKD_INFOSENDTYPE.ItemCount = 0 Then Exit Sub
If gridPEKD_INFOSENDTYPE.Row > 0 Then
 If gridPEKD_INFOSENDTYPE.RowIndex(gridPEKD_INFOSENDTYPE.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKD_INFOSENDTYPE.RowBookmark(gridPEKD_INFOSENDTYPE.RowIndex(gridPEKD_INFOSENDTYPE.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdPEKD_INFOSENDTYPEEdit_Click()
  On Error Resume Next
If gridPEKD_INFOSENDTYPE.ItemCount = 0 Then Exit Sub
If gridPEKD_INFOSENDTYPE.Row > 0 Then
 If gridPEKD_INFOSENDTYPE.RowIndex(gridPEKD_INFOSENDTYPE.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKD_INFOSENDTYPE.RowBookmark(gridPEKD_INFOSENDTYPE.RowIndex(gridPEKD_INFOSENDTYPE.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmPEKD_INFOSENDTYPE_admi.Item = u
again:     frmPEKD_INFOSENDTYPE_admi.NotFirstTime = False
    frmPEKD_INFOSENDTYPE_admi.OnInit
    frmPEKD_INFOSENDTYPE_admi.Show vbModal
    If frmPEKD_INFOSENDTYPE_admi.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridPEKD_INFOSENDTYPE.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdPEKD_INFOSENDTYPEDel_Click()
  On Error Resume Next
  gridPEKD_INFOSENDTYPE.Delete
End Sub
Private Sub cmdPEKD_INFOSENDTYPEAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.PEKD_INFOSENDTYPE.Add()

      Set frmPEKD_INFOSENDTYPE_admi.Item = u
again:       frmPEKD_INFOSENDTYPE_admi.NotFirstTime = False
      frmPEKD_INFOSENDTYPE_admi.OnInit
      frmPEKD_INFOSENDTYPE_admi.Show vbModal
      If frmPEKD_INFOSENDTYPE_admi.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridPEKD_INFOSENDTYPE.ItemCount = Item.PEKD_INFOSENDTYPE.Count
        gridPEKD_INFOSENDTYPE.Refresh
        gridPEKD_INFOSENDTYPE.RefreshGroups
        gridPEKD_INFOSENDTYPE.RefreshSort
        gridPEKD_INFOSENDTYPE.MoveToBookmark u.ID & "PEKD_INFOSENDTYPE"
      Else
        Item.PEKD_INFOSENDTYPE.Delete u.ID
        Item.PEKD_INFOSENDTYPE.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdPEKD_INFOSENDTYPEFnd_Click()
  On Error Resume Next
  fndPEKD_INFOSENDTYPE.ShowForm
End Sub
Private Sub cmdPEKD_INFOSENDTYPERun_Click()
  On Error Resume Next
  gridPEKD_INFOSENDTYPE_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridPEKD_INFOSENDTYPE_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.PEKD_INFOSENDTYPE.LoadRow gridPEKD_INFOSENDTYPE, RowIndex, Bookmark, Values
End Sub
Private Sub gridPEKD_INFOSENDTYPE_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridPEKD_INFOSENDTYPE.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("PEKD_INFOSENDTYPE", Left(Bookmark, 38))
  If Not u Is Nothing Then
    On Error Resume Next
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

Private Sub gridPEKD_INFOSENDTYPE_DblClick()
  cmdPEKD_INFOSENDTYPEEdit_Click
End Sub
Private Sub gridPEKD_INFOSENDTYPE_KeyPress(KeyAscii As Integer)
  If gridPEKD_INFOSENDTYPE.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEKD_INFOSENDTYPE.FindOnPress KeyAscii
End Sub

Private Sub gridPEKD_INFOSENDTYPE_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridPEKD_INFOSENDTYPE.Row And LastRow > 0 Then
  gridPEKD_INFOSENDTYPE.GetRowData(LastRow).RowStyle = "Default"
  gridPEKD_INFOSENDTYPE.GetRowData(gridPEKD_INFOSENDTYPE.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuPEKD_INFOSENDTYPEPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.PEKD_INFOSENDTYPE.Add()
    If GetFromBuffer(u) Then
      gridPEKD_INFOSENDTYPE.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridPEKD_INFOSENDTYPE_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdPEKD_INFOSENDTYPECfg_Click
        End If
    End If
End Sub

Private Sub gridPEKD_INFOSENDTYPE_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupPEKD_INFOSENDTYPE
End If
End Sub
Private Sub mnuPEKD_INFOSENDTYPEAdd_click()
   menuActionPEKD_INFOSENDTYPE = "ADD"
   menuTimerPEKD_INFOSENDTYPE.Enabled = True
End Sub
Private Sub mnuPEKD_INFOSENDTYPEEdit_click()
   menuActionPEKD_INFOSENDTYPE = "EDIT"
   menuTimerPEKD_INFOSENDTYPE.Enabled = True
End Sub
Private Sub mnuPEKD_INFOSENDTYPEDelete_click()
   menuActionPEKD_INFOSENDTYPE = "DEL"
   menuTimerPEKD_INFOSENDTYPE.Enabled = True
End Sub
Private Sub mnuPEKD_INFOSENDTYPEOpen_click()
   menuActionPEKD_INFOSENDTYPE = "RUN"
   menuTimerPEKD_INFOSENDTYPE.Enabled = True
End Sub
Private Sub mnuPEKD_INFOSENDTYPERef_click()
   menuActionPEKD_INFOSENDTYPE = "REF"
   menuTimerPEKD_INFOSENDTYPE.Enabled = True
End Sub
  Private Sub mnuPEKD_INFOSENDTYPECOPY_Click()
    On Error Resume Next
    If gridPEKD_INFOSENDTYPE.ItemCount = 0 Then Exit Sub
    If gridPEKD_INFOSENDTYPE.Row > 0 Then
     If gridPEKD_INFOSENDTYPE.RowIndex(gridPEKD_INFOSENDTYPE.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKD_INFOSENDTYPE.RowBookmark(gridPEKD_INFOSENDTYPE.RowIndex(gridPEKD_INFOSENDTYPE.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEKD_INFOSENDTYPECUT_Click()
    On Error Resume Next
    If gridPEKD_INFOSENDTYPE.ItemCount = 0 Then Exit Sub
    If gridPEKD_INFOSENDTYPE.Row > 0 Then
     If gridPEKD_INFOSENDTYPE.RowIndex(gridPEKD_INFOSENDTYPE.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKD_INFOSENDTYPE.RowBookmark(gridPEKD_INFOSENDTYPE.RowIndex(gridPEKD_INFOSENDTYPE.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEKD_INFOSENDTYPE.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuPEKD_INFOSENDTYPECHANGE_Click()
  On Error Resume Next
  If gridPEKD_INFOSENDTYPE.ItemCount = 0 Then Exit Sub
  If gridPEKD_INFOSENDTYPE.Row > 0 Then
   If gridPEKD_INFOSENDTYPE.RowIndex(gridPEKD_INFOSENDTYPE.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKD_INFOSENDTYPE.RowBookmark(gridPEKD_INFOSENDTYPE.RowIndex(gridPEKD_INFOSENDTYPE.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEKD_INFOSENDTYPE.ItemCount = u.Parent.Count
      gridPEKD_INFOSENDTYPE.RefreshRowIndex gridPEKD_INFOSENDTYPE.RowIndex(gridPEKD_INFOSENDTYPE.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEKD_INFOSENDTYPECLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKD_INFOSENDTYPEPrn_click()
   menuActionPEKD_INFOSENDTYPE = "PRN"
   menuTimerPEKD_INFOSENDTYPE.Enabled = True
End Sub
Private Sub mnuPEKD_INFOSENDTYPECfg_click()
   menuActionPEKD_INFOSENDTYPE = "CFG"
   menuTimerPEKD_INFOSENDTYPE.Enabled = True
End Sub
Private Sub mnuPEKD_INFOSENDTYPEFind_click()
   menuActionPEKD_INFOSENDTYPE = "FND"
   menuTimerPEKD_INFOSENDTYPE.Enabled = True
End Sub
Private Sub mnuPEKD_INFOSENDTYPEAcc_click()
   menuActionPEKD_INFOSENDTYPE = "ACC"
   menuTimerPEKD_INFOSENDTYPE.Enabled = True
End Sub
Private Sub menuTimerPEKD_INFOSENDTYPE_timer()
   menuTimerPEKD_INFOSENDTYPE.Enabled = False
   If menuActionPEKD_INFOSENDTYPE = "ADD" Then cmdPEKD_INFOSENDTYPEAdd_Click
   If menuActionPEKD_INFOSENDTYPE = "EDIT" Then cmdPEKD_INFOSENDTYPEEdit_Click
   If menuActionPEKD_INFOSENDTYPE = "DEL" Then cmdPEKD_INFOSENDTYPEDel_Click
   If menuActionPEKD_INFOSENDTYPE = "RUN" Then cmdPEKD_INFOSENDTYPERun_Click
   If menuActionPEKD_INFOSENDTYPE = "REF" Then cmdPEKD_INFOSENDTYPERef_Click
   If menuActionPEKD_INFOSENDTYPE = "PRN" Then cmdPEKD_INFOSENDTYPEPrn_Click
   If menuActionPEKD_INFOSENDTYPE = "CFG" Then cmdPEKD_INFOSENDTYPECfg_Click
   If menuActionPEKD_INFOSENDTYPE = "FND" Then cmdPEKD_INFOSENDTYPEFnd_Click
   If menuActionPEKD_INFOSENDTYPE = "ACC" Then cmdPEKD_INFOSENDTYPEAcc_Click
   menuActionPEKD_INFOSENDTYPE = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdPEKD_INFOSENDTYPEAdd, cmdPEKD_INFOSENDTYPEAdd.Tag
  LoadBtnPictures cmdPEKD_INFOSENDTYPEEdit, cmdPEKD_INFOSENDTYPEEdit.Tag
  LoadBtnPictures cmdPEKD_INFOSENDTYPEDel, cmdPEKD_INFOSENDTYPEDel.Tag
  LoadBtnPictures cmdPEKD_INFOSENDTYPERef, cmdPEKD_INFOSENDTYPERef.Tag
  LoadBtnPictures cmdPEKD_INFOSENDTYPEPrn, cmdPEKD_INFOSENDTYPEPrn.Tag
  LoadBtnPictures cmdPEKD_INFOSENDTYPEFnd, cmdPEKD_INFOSENDTYPEFnd.Tag
  LoadBtnPictures cmdPEKD_INFOSENDTYPERun, cmdPEKD_INFOSENDTYPERun.Tag
  LoadBtnPictures cmdPEKD_INFOSENDTYPEAcc, cmdPEKD_INFOSENDTYPEAcc.Tag
  LoadBtnPictures cmdPEKD_INFOSENDTYPECfg, cmdPEKD_INFOSENDTYPECfg.Tag
  Item.PEKD_INFOSENDTYPE.PrepareGrid gridPEKD_INFOSENDTYPE
  LoadGridLayout gridPEKD_INFOSENDTYPE
  Set fndPEKD_INFOSENDTYPE = Nothing
  On Error Resume Next
  Set fndPEKD_INFOSENDTYPE = CreateObject("MTZ_JSetup.GridFinder")
  fndPEKD_INFOSENDTYPE.Init gridPEKD_INFOSENDTYPE
End Sub
Private Sub OnTabClick()

      gridPEKD_INFOSENDTYPE.Top = 40 * Screen.TwipsPerPixelX
      gridPEKD_INFOSENDTYPE.Left = 5 * Screen.TwipsPerPixelX
      gridPEKD_INFOSENDTYPE.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKD_INFOSENDTYPE.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridPEKD_INFOSENDTYPE.Top = 40 * Screen.TwipsPerPixelX
      gridPEKD_INFOSENDTYPE.Left = 5 * Screen.TwipsPerPixelX
      gridPEKD_INFOSENDTYPE.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKD_INFOSENDTYPE.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlPEKD_INFOSENDTYPE.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndPEKD_INFOSENDTYPE = Nothing
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
  MsgBox err.Description, vbOKOnly + vbCritical, "Установка стиля защиты"
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
  MsgBox err.Description, vbOKOnly + vbCritical, "Установка стиля защиты"
End Sub



'Создание отчета из разных карточек
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
'  ID = CreateGUID2
 'Call RowItem.Application.Manager.NewInstance(ID, "VRRPT2", "Отчет " & Date)
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
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2P", "Платеж " & Date)
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
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2O", "Оплата " & Date)
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
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2Z", "Заявка " & Date)
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





