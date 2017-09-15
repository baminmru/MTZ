VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{8408294B-9E97-428D-999B-82C43BF0BFFA}#3.0#0"; "JWRAP.ocx"
Begin VB.UserControl ctlEditLink 
   ClientHeight    =   3585
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4995
   ScaleHeight     =   3585
   ScaleWidth      =   4995
   Begin VB.Timer menuTimerWFDef_linkres 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   3465
      Top             =   390
   End
   Begin MTZ_PANEL.HFrames pnlWFDef_links 
      Height          =   3255
      Left            =   75
      TabIndex        =   0
      Top             =   90
      Width           =   4785
      _ExtentX        =   8440
      _ExtentY        =   5741
      Begin VB.ComboBox cmbAcceptAnyResults 
         Height          =   315
         Left            =   120
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   11
         ToolTipText     =   "При любом результате завершения"
         Top             =   330
         Width           =   3000
      End
      Begin JWRAP.JanusWRAP gridWFDef_linkres 
         Height          =   2010
         Left            =   120
         TabIndex        =   10
         Top             =   1170
         Width           =   4350
         _ExtentX        =   7673
         _ExtentY        =   3545
      End
      Begin VB.CommandButton cmdWFDef_linkresAdd 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   9
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   720
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_linkresEdit 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   8
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   720
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_linkresDel 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   7
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   720
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_linkresRef 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   6
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   720
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_linkresPrn 
         Height          =   330
         Left            =   1560
         Style           =   1  'Graphical
         TabIndex        =   5
         Tag             =   "PrintPreview.ico"
         ToolTipText     =   "Печать"
         Top             =   720
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_linkresCfg 
         Height          =   330
         Left            =   1920
         Style           =   1  'Graphical
         TabIndex        =   4
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   720
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_linkresFnd 
         Height          =   330
         Left            =   2280
         Style           =   1  'Graphical
         TabIndex        =   3
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   735
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin MTZ_PANEL.DropButton cmdWFDef_linkresRun 
         Height          =   330
         Left            =   2640
         TabIndex        =   2
         Tag             =   "run.ico"
         ToolTipText     =   "Открыть"
         Top             =   735
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   582
         Caption         =   ""
      End
      Begin VB.CommandButton cmdWFDef_linkresAcc 
         Height          =   330
         Left            =   3000
         Style           =   1  'Graphical
         TabIndex        =   1
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   735
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.Label lblAcceptAnyResults 
         BackStyle       =   0  'Transparent
         Caption         =   "При любом результате завершения:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   120
         TabIndex        =   12
         Top             =   0
         Width           =   3000
      End
   End
End
Attribute VB_Name = "ctlEditLink"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Public item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private menuActionWFDef_links As String
Private fndWFDef_linkres As Object
Private menuActionWFDef_linkres As String


Private Sub cmdWFDef_linkresCfg_Click()
  On Error Resume Next
  Dim jset As Object 'MTZ_JSetup.Customizer
  Set jset = CreateObject("MTZ_JSetup.Customizer")
  jset.ShowSumary gridWFDef_linkres, "gridWFDef_linkres"
  Set jset = Nothing
End Sub

Private Sub cmdWFDef_linkresPrn_Click()
  On Error Resume Next
  Dim jset As Object 'MTZ_JSetup.Customizer
  Set jset = CreateObject("MTZ_JSetup.Customizer")
  jset.Preview gridWFDef_linkres, "Допустимые результаты"
  Set jset = Nothing
End Sub

Private Sub cmdWFDef_linkresAcc_Click()
On Error Resume Next
If gridWFDef_linkres.ItemCount = 0 Then Exit Sub
If gridWFDef_linkres.Row > 0 Then
 If gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_linkres.RowBookmark(gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFDef_linkresFnd_Click()
  On Error Resume Next
  fndWFDef_linkres.ShowForm
End Sub
Private Sub cmdWFDef_linkresRun_Click()
  On Error Resume Next
  gridWFDef_linkres_JWDblClick
End Sub
Private Sub cmdWFDef_linkresRef_Click()
  On Error Resume Next
  item.WFDef_linkres.Refresh
  gridWFDef_linkres.ItemCount = item.WFDef_linkres.Count
  gridWFDef_linkres.Refetch
  gridWFDef_linkres.Refresh
  
End Sub
Private Sub cmdWFDef_linkresEdit_Click()
    If gridWFDef_linkres.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridWFDef_linkres.RowBookmark(gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row))
    Set u = item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmWFDef_linkres_.item = u
again:     frmWFDef_linkres_.NotFirstTime = False
    frmWFDef_linkres_.OnInit
    frmWFDef_linkres_.Show vbModal
    If frmWFDef_linkres_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWFDef_linkres.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdWFDef_linkresDel_Click()
  On Error Resume Next
  gridWFDef_linkres.Delete
End Sub
Private Sub cmdWFDef_linkresAdd_Click()
  On Error Resume Next
    Dim u As Object
    Set u = item.WFDef_linkres.Add()

    Set frmWFDef_linkres_.item = u
again:     frmWFDef_linkres_.NotFirstTime = False
    frmWFDef_linkres_.OnInit
    frmWFDef_linkres_.Show vbModal
    If frmWFDef_linkres_.OK Then
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
      GoTo again
    End If

        gridWFDef_linkres.ItemCount = item.WFDef_linkres.Count
        gridWFDef_linkres.Refresh
        gridWFDef_linkres.RefreshGroups
        gridWFDef_linkres.RefreshSort
    Else
        u.Parent.Remove u.ID
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
  
End Sub
Private Sub gridWFDef_linkres_JWUnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As Object)
    item.WFDef_linkres.LoadRow gridWFDef_linkres, RowIndex, Bookmark, Values
End Sub
Private Sub gridWFDef_linkres_JWKeyPress(KeyAscii As Integer)
  If gridWFDef_linkres.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFDef_linkres.FindOnPress KeyAscii
End Sub

Private Sub gridWFDef_linkres_JWBeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As Object)
    If gridWFDef_linkres.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridWFDef_linkres.RowBookmark(gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row))
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
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub
Private Sub gridWFDef_linkres_JWDblClick()
    cmdWFDef_linkresEdit_Click
End Sub
Private Sub gridWFDef_linkres_JWRowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridWFDef_linkres.ItemCount = 0 Then Exit Sub
 If gridWFDef_linkres.Row > 0 Then
   If LastRow <> gridWFDef_linkres.Row And LastRow > 0 Then
     gridWFDef_linkres.GetRowData(LastRow).RowStyle = "Default"
     gridWFDef_linkres.GetRowData(gridWFDef_linkres.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuWFDef_linkresPASTE_Click()
On Error Resume Next
    
    Dim u As Object
    Set u = item.WFDef_linkres.Add()
    If GetFromBuffer(u) Then
      gridWFDef_linkres.ItemCount = u.Parent.Count
    Else
      item.WFDef_linkres.Refresh
    End If
    
End Sub
Private Sub mnuWFDef_linkresAdd_click()
   menuActionWFDef_linkres = "ADD"
   menuTimerWFDef_linkres.Enabled = True
End Sub
Private Sub mnuWFDef_linkresEdit_click()
   menuActionWFDef_linkres = "EDIT"
   menuTimerWFDef_linkres.Enabled = True
End Sub
Private Sub mnuWFDef_linkresDelete_click()
   menuActionWFDef_linkres = "DEL"
   menuTimerWFDef_linkres.Enabled = True
End Sub
Private Sub mnuWFDef_linkresOpen_click()
   menuActionWFDef_linkres = "RUN"
   menuTimerWFDef_linkres.Enabled = True
End Sub
Private Sub mnuWFDef_linkresRef_click()
   menuActionWFDef_linkres = "REF"
   menuTimerWFDef_linkres.Enabled = True
End Sub
  Private Sub mnuWFDef_linkresCOPY_Click()
    On Error Resume Next
    If gridWFDef_linkres.ItemCount = 0 Then Exit Sub
    If gridWFDef_linkres.Row > 0 Then
     If gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFDef_linkres.RowBookmark(gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFDef_linkresCUT_Click()
    On Error Resume Next
    If gridWFDef_linkres.ItemCount = 0 Then Exit Sub
    If gridWFDef_linkres.Row > 0 Then
     If gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFDef_linkres.RowBookmark(gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFDef_linkres.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFDef_linkresCHANGE_Click()
  On Error Resume Next
  If gridWFDef_linkres.ItemCount = 0 Then Exit Sub
  If gridWFDef_linkres.Row > 0 Then
   If gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_linkres.RowBookmark(gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFDef_linkres.ItemCount = u.Parent.Count
      gridWFDef_linkres.RefreshRowIndex gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFDef_linkresCLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFDef_linkresPrn_click()
   menuActionWFDef_linkres = "PRN"
   menuTimerWFDef_linkres.Enabled = True
End Sub
Private Sub mnuWFDef_linkresCfg_click()
   menuActionWFDef_linkres = "CFG"
   menuTimerWFDef_linkres.Enabled = True
End Sub
Private Sub mnuWFDef_linkresFind_click()
   menuActionWFDef_linkres = "FND"
   menuTimerWFDef_linkres.Enabled = True
End Sub
Private Sub mnuWFDef_linkresAcc_click()
   menuActionWFDef_linkres = "ACC"
   menuTimerWFDef_linkres.Enabled = True
End Sub
Private Sub menuTimerWFDef_linkres_timer()
   menuTimerWFDef_linkres.Enabled = False
   If menuActionWFDef_linkres = "ADD" Then cmdWFDef_linkresAdd_Click
   If menuActionWFDef_linkres = "EDIT" Then cmdWFDef_linkresEdit_Click
   If menuActionWFDef_linkres = "DEL" Then cmdWFDef_linkresDel_Click
   If menuActionWFDef_linkres = "RUN" Then cmdWFDef_linkresRun_Click
   If menuActionWFDef_linkres = "REF" Then cmdWFDef_linkresRef_Click
   If menuActionWFDef_linkres = "PRN" Then cmdWFDef_linkresPrn_Click
   If menuActionWFDef_linkres = "CFG" Then cmdWFDef_linkresCfg_Click
   If menuActionWFDef_linkres = "FND" Then cmdWFDef_linkresFnd_Click
   If menuActionWFDef_linkres = "ACC" Then cmdWFDef_linkresAcc_Click
   menuActionWFDef_linkres = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
  On Error Resume Next
  Set item = aItem
  Set ParentForm = pForm
  
  item.WFDef_linkres.PrepareGrid gridWFDef_linkres
  LoadGridLayout gridWFDef_linkres
  Set fndWFDef_linkres = Nothing
  Set fndWFDef_linkres = CreateObject("MTZ_JSetup.GridFinder")
  fndWFDef_linkres.Init gridWFDef_linkres
    
  LoadBtnPictures cmdWFDef_linkresAdd, cmdWFDef_linkresAdd.Tag
  LoadBtnPictures cmdWFDef_linkresEdit, cmdWFDef_linkresEdit.Tag
  LoadBtnPictures cmdWFDef_linkresDel, cmdWFDef_linkresDel.Tag
  LoadBtnPictures cmdWFDef_linkresRef, cmdWFDef_linkresRef.Tag
  LoadBtnPictures cmdWFDef_linkresPrn, cmdWFDef_linkresPrn.Tag
  LoadBtnPictures cmdWFDef_linkresCfg, cmdWFDef_linkresCfg.Tag
  LoadBtnPictures cmdWFDef_linkresFnd, cmdWFDef_linkresFnd.Tag
  LoadBtnPictures cmdWFDef_linkresRun, cmdWFDef_linkresRun.Tag
  LoadBtnPictures cmdWFDef_linkresAcc, cmdWFDef_linkresAcc.Tag
  
 
  gridWFDef_linkres.ItemCount = item.WFDef_linkres.Count
End Sub
Private Sub OnTabClick()
'  pnlWFDef_links.SizeControls pnlWFDef_links.Height / 2
End Sub
Public Sub OnClick(aItem As Object, Optional pForm As Object = Nothing)
  On Error Resume Next
  Set item = aItem
  Set ParentForm = pForm
  OnTabClick
End Sub
Public Function IsChanged() As Boolean
  Dim m_IsChanged As Boolean
  On Error Resume Next
  
  IsChanged = m_IsChanged
End Function
Private Sub Usercontrol_resize()
  On Error Resume Next
  pnlWFDef_links.Move 0, 0, UserControl.Width, UserControl.Height
  gridWFDef_linkres.Left = 0
  gridWFDef_linkres.Width = UserControl.Width
  gridWFDef_linkres.Height = UserControl.Height - gridWFDef_linkres.Top
  cmdWFDef_linkresAdd.Left = 5 * Screen.TwipsPerPixelX
  cmdWFDef_linkresEdit.Left = 30 * Screen.TwipsPerPixelX
  cmdWFDef_linkresDel.Left = 55 * Screen.TwipsPerPixelX
  cmdWFDef_linkresRef.Left = 80 * Screen.TwipsPerPixelX
  cmdWFDef_linkresPrn.Left = 105 * Screen.TwipsPerPixelX
  cmdWFDef_linkresCfg.Left = 130 * Screen.TwipsPerPixelX
  cmdWFDef_linkresFnd.Left = 155 * Screen.TwipsPerPixelX
  cmdWFDef_linkresRun.Left = 180 * Screen.TwipsPerPixelX
  cmdWFDef_linkresAcc.Left = 205 * Screen.TwipsPerPixelX
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set item = Nothing
  Set fndWFDef_linkres = Nothing
End Sub
Private Sub UserControl_Terminate()
  On Error Resume Next
  CloseClass
End Sub

Public Sub InitPanel()

Dim iii As Long ' for combo only

cmbAcceptAnyResults.Clear
cmbAcceptAnyResults.AddItem "Да"
cmbAcceptAnyResults.ItemData(cmbAcceptAnyResults.NewIndex) = -1
cmbAcceptAnyResults.AddItem "Нет"
cmbAcceptAnyResults.ItemData(cmbAcceptAnyResults.NewIndex) = 0
 For iii = 0 To cmbAcceptAnyResults.ListCount - 1
  If item.AcceptAnyResults = cmbAcceptAnyResults.ItemData(iii) Then
   cmbAcceptAnyResults.ListIndex = iii
   Exit For
  End If
 Next

End Sub

Public Sub Save()
item.AcceptAnyResults = cmbAcceptAnyResults.ItemData(cmbAcceptAnyResults.ListIndex)
item.Save
End Sub
