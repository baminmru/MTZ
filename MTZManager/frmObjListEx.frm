VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Begin VB.Form frmObjListEx 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "Выбор документа"
   ClientHeight    =   6150
   ClientLeft      =   2775
   ClientTop       =   3720
   ClientWidth     =   9435
   Icon            =   "frmObjListEx.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6150
   ScaleWidth      =   9435
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdRefresh2 
      Caption         =   "&Искать"
      Height          =   330
      Left            =   5880
      Style           =   1  'Graphical
      TabIndex        =   2
      Tag             =   "refresh.ico"
      Top             =   0
      Width           =   930
   End
   Begin VB.ComboBox cmbfield 
      Height          =   315
      Left            =   0
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   0
      Width           =   2415
   End
   Begin VB.TextBox txtVal 
      Height          =   315
      Left            =   2520
      TabIndex        =   1
      Top             =   0
      Width           =   3255
   End
   Begin VB.CommandButton cmdPgDn 
      BeginProperty Font 
         Name            =   "Marlett"
         Size            =   8.25
         Charset         =   2
         Weight          =   500
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   5280
      Picture         =   "frmObjListEx.frx":0442
      Style           =   1  'Graphical
      TabIndex        =   14
      Tag             =   "xl.ico"
      ToolTipText     =   "Следующая страница"
      Top             =   5760
      Width           =   330
   End
   Begin VB.CommandButton cmdBottom 
      BeginProperty Font 
         Name            =   "Marlett"
         Size            =   8.25
         Charset         =   2
         Weight          =   500
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   5640
      Picture         =   "frmObjListEx.frx":0784
      Style           =   1  'Graphical
      TabIndex        =   15
      Tag             =   "xl.ico"
      ToolTipText     =   "К последней странице"
      Top             =   5760
      Width           =   330
   End
   Begin VB.CommandButton cmdTop 
      BeginProperty Font 
         Name            =   "Marlett"
         Size            =   8.25
         Charset         =   2
         Weight          =   500
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   4560
      Picture         =   "frmObjListEx.frx":0AC6
      Style           =   1  'Graphical
      TabIndex        =   12
      Tag             =   "xl.ico"
      ToolTipText     =   "К первой странице"
      Top             =   5760
      Width           =   330
   End
   Begin VB.CommandButton cmdPgUp 
      BeginProperty Font 
         Name            =   "Marlett"
         Size            =   8.25
         Charset         =   2
         Weight          =   500
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   4920
      Picture         =   "frmObjListEx.frx":0E08
      Style           =   1  'Graphical
      TabIndex        =   13
      Tag             =   "xl.ico"
      ToolTipText     =   "Предыдущая страница"
      Top             =   5760
      Width           =   330
   End
   Begin VB.CommandButton cmdUp 
      Caption         =   "t"
      BeginProperty Font 
         Name            =   "Marlett"
         Size            =   8.25
         Charset         =   2
         Weight          =   500
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   6000
      Style           =   1  'Graphical
      TabIndex        =   16
      Tag             =   "xl.ico"
      ToolTipText     =   "перейти на первую запись"
      Top             =   5760
      Width           =   330
   End
   Begin VB.CommandButton cmdDown 
      Caption         =   "u"
      BeginProperty Font 
         Name            =   "Marlett"
         Size            =   8.25
         Charset         =   2
         Weight          =   500
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   6360
      Style           =   1  'Graphical
      TabIndex        =   17
      Tag             =   "xl.ico"
      ToolTipText     =   "Перейти на последнюю запись"
      Top             =   5760
      Width           =   330
   End
   Begin VB.CommandButton cmdFind 
      Height          =   330
      Left            =   120
      Style           =   1  'Graphical
      TabIndex        =   6
      Tag             =   "find.ico"
      ToolTipText     =   "Поиск"
      Top             =   5760
      Width           =   330
   End
   Begin VB.CommandButton cmdRefresh 
      Height          =   330
      Left            =   1200
      Style           =   1  'Graphical
      TabIndex        =   9
      Tag             =   "refresh.ico"
      Top             =   5760
      Width           =   330
   End
   Begin VB.CommandButton cmdOpen 
      Caption         =   "&Открыть"
      Height          =   315
      Left            =   1560
      TabIndex        =   10
      Top             =   5760
      Width           =   1175
   End
   Begin VB.CommandButton cmdCreate 
      Caption         =   "&Создать\Найти"
      Height          =   315
      Left            =   2760
      TabIndex        =   11
      Top             =   5760
      Width           =   1770
   End
   Begin VB.CommandButton cmdPrn 
      Height          =   330
      Left            =   840
      Style           =   1  'Graphical
      TabIndex        =   8
      Tag             =   "printpreview.ico"
      ToolTipText     =   "Печать"
      Top             =   5760
      Width           =   330
   End
   Begin VB.CommandButton cmdSaveLayout 
      Height          =   330
      Left            =   480
      Style           =   1  'Graphical
      TabIndex        =   7
      Tag             =   "config.ico"
      ToolTipText     =   "Настроить"
      Top             =   5760
      Width           =   330
   End
   Begin GridEX20.GridEX gr 
      Height          =   5295
      Left            =   0
      TabIndex        =   3
      Top             =   360
      Width           =   9375
      _ExtentX        =   16536
      _ExtentY        =   9340
      Version         =   "2.0"
      AllowRowSizing  =   -1  'True
      RecordNavigatorString=   "Запись: | из "
      BoundColumnIndex=   ""
      ReplaceColumnIndex=   ""
      TabKeyBehavior  =   1
      HideSelection   =   2
      MethodHoldFields=   -1  'True
      ContScroll      =   -1  'True
      SelectionStyle  =   1
      GroupByBoxInfoText=   "Перетащите заголовок колонки для организации группировки"
      AllowEdit       =   0   'False
      DataMode        =   99
      ColumnHeaderHeight=   285
      IntProp1        =   0
      IntProp2        =   0
      IntProp7        =   0
      FormatStylesCount=   6
      FormatStyle(1)  =   "frmObjListEx.frx":114A
      FormatStyle(2)  =   "frmObjListEx.frx":1206
      FormatStyle(3)  =   "frmObjListEx.frx":1362
      FormatStyle(4)  =   "frmObjListEx.frx":1412
      FormatStyle(5)  =   "frmObjListEx.frx":14C6
      FormatStyle(6)  =   "frmObjListEx.frx":159E
      ImageCount      =   0
      PrinterProperties=   "frmObjListEx.frx":1656
   End
   Begin VB.CommandButton CancelButton 
      Caption         =   "Отмена"
      CausesValidation=   0   'False
      Height          =   315
      Left            =   8190
      TabIndex        =   5
      Top             =   5760
      Width           =   1175
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   315
      Left            =   6930
      TabIndex        =   4
      Top             =   5760
      Width           =   1175
   End
   Begin VB.Label lblInfo 
      Alignment       =   1  'Right Justify
      Caption         =   "Записей: "
      Height          =   315
      Left            =   6960
      TabIndex        =   18
      Top             =   0
      Width           =   2265
   End
End
Attribute VB_Name = "frmObjListEx"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_HelpID = 300

Option Explicit
Dim NoFind As Boolean
Private fnd As Object
Public TypeName As String
Attribute TypeName.VB_VarHelpID = 375
Public Runner As Main
Attribute Runner.VB_VarHelpID = 365
Public ok As Boolean
Attribute ok.VB_VarHelpID = 350
Public ID As String
Attribute ID.VB_VarHelpID = 315
Private Sess As MTZSession.session
Public site As String
Attribute site.VB_VarHelpID = 370
Public Brief As String
Attribute Brief.VB_VarHelpID = 305
Public Filter As String
Attribute Filter.VB_VarHelpID = 310
Public pvAlias As String
Attribute pvAlias.VB_VarHelpID = 355
Dim mvarFieldArray() As Variant
Dim fmTop As Long
Private refreshMe As Boolean
Private inPageBtn As Boolean

'For GetRefEx3
Public IsHide_Add As Boolean
Attribute IsHide_Add.VB_VarHelpID = 320
Public IsHide_Open As Boolean
Attribute IsHide_Open.VB_VarHelpID = 330
Public IsHide_Refresh As Boolean
Attribute IsHide_Refresh.VB_VarHelpID = 340
Public IsHide_Prn As Boolean
Attribute IsHide_Prn.VB_VarHelpID = 335
Public IsHide_Find As Boolean
Attribute IsHide_Find.VB_VarHelpID = 325
Public IsHide_Setup As Boolean
Attribute IsHide_Setup.VB_VarHelpID = 345


Private pager As String
Private Const PageSize As Long = 200
Private MinLine As Long
Private MaxLine As Long
Private CurrentTop As Long
Private DefSort As String



Private Sub CancelButton_Click()
  ok = False
  Set Runner = Nothing
  Me.Hide
End Sub

Private Sub cmdBottom_Click()
  If inPageBtn Then Exit Sub
  inPageBtn = True
  CurrentTop = MaxLine - PageSize
  RefreshPage
  inPageBtn = False
End Sub
Private Sub cmdDown_Click()
  If (gr.RowCount > 0) Then
    gr.Row = gr.RowCount
    Call gr.EnsureVisible(gr.RowCount)
  End If
End Sub

Private Function findObject(TypeName As String) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, Brief)

bye:
findObject = result

End Function


Private Sub cmdCreate_Click()
  Dim n As String
'  n = InputBox("Задайте имя нового документа", "Новый документ", TypeName & " " & Now)
'  If n = "" Then Exit Sub
  Dim ook As Boolean
  Brief = TypeName & Now
  ook = findObject(TypeName)
  If Not ook Then
    ID = CreateGUID2()
     Call Runner.NewInstance(ID, TypeName, Brief, site)
  End If
  
  
  
  If ook Then
    Dim ref As Object, objGUI As Object
    Set ref = Runner.GetInstanceObject(ID)
    If Not ref Is Nothing Then
      Set objGUI = Runner.GetInstanceGUI(ID)
      If objGUI Is Nothing Then Set ref = Nothing: Exit Sub
      
      Dim NValues As NamedValues
      Dim bShowModal As Boolean
      bShowModal = True
      Set NValues = Runner.GetCustomObjects("ManagerSettings")
      If Not NValues Is Nothing Then
        If Not NValues.Item("AddObject_ShowModal") Is Nothing Then
            bShowModal = NValues.Item("AddObject_ShowModal").Value
        End If
      End If
      
      objGUI.Show "", ref, bShowModal
      Set objGUI = Nothing
    End If
  End If
    
  On Error GoTo bye
  ok = True
  refreshMe = True
  Brief = ref.Brief
  Set ref = Nothing
  'Set Runner = Nothing
  Me.Hide
    
bye:
  'End If
End Sub

Private Sub cmdPrn_Click()
  On Error Resume Next
  Dim jset As Object 'MTZ_JSetup.Customizer
  Set jset = CreateObject("MTZ_JSetup.Customizer")
  jset.Preview gr, "Поиск"
  Set jset = Nothing

End Sub

Private Sub cmdRefresh_Click()
RefreshData
End Sub

Private Sub cmdRefresh2_Click()
  
    cmdRefresh_Click
 
End Sub

Private Sub cmdSaveLayout_Click()
  On Error Resume Next
  Dim jset As Object
  Set jset = CreateObject("MTZ_JSetup.Customizer")
  jset.ShowSumary gr, "FindEx" & TypeName
  Set jset = Nothing
End Sub

Private Sub cmdFind_Click()
  On Error Resume Next
  fnd.ShowForm
End Sub
'Public Sub RefreshData()
'Dim rs As ADODB.Recordset
'  Dim i As Long
'
'  Dim idx As Long
'  Dim pvid As String
'Erase mvarFieldArray
'
'    On Error GoTo bye
'    Set rs = Sess.GetRows("V_" & pvAlias, "", "", Filter)
'    If Not rs Is Nothing Then
'    fmTop = 0
'    ReDim mvarFieldArray(-2 To gr.Columns.Count, 0 To fmTop + rs.RecordCount)
'    idx = 1
'    While Not rs.EOF
'      mvarFieldArray(-2, fmTop + idx) = rs!InstanceiD
'      mvarFieldArray(-1, fmTop + idx) = rs!ID
'      mvarFieldArray(0, fmTop + idx) = rs!ViewBase
'
'      For i = 1 To gr.Columns.Count
'          mvarFieldArray(i, fmTop + idx) = rs.Fields(gr.Columns.Item(i).Key).Value & ""
'      Next
'      rs.MoveNext
'      idx = idx + 1
'    Wend
'    fmTop = fmTop + rs.RecordCount
'  End If
'  rs.Close
'  Set rs = Nothing
'
'  gr.ItemCount = fmTop
'  LoadGridLayout gr, "FindEx" & TypeName
'  refreshMe = False
'bye:
'End Sub


Private Sub RefreshData()
  Dim rs As ADODB.Recordset
  Dim i As Long
  Dim idx As Long
  
  On Error Resume Next
  
  If pager <> "" Then
      Call Sess.GetData("delete from #Pager where PagerID ='" & pager & "'")
  End If
    
  pager = CreateGUID2
  
  
  Dim tFilter As String
  If cmbfield.ListIndex = -1 Then
    If cmbfield.ListCount > 0 Then
      cmbfield.ListIndex = 0
    End If
  End If
  
  If cmbfield.ListIndex > -1 Then
    If txtVal <> "" Then
        tFilter = " convert( varchar(255)," & gr.Columns.Item(cmbfield.ListIndex + 1).Key & " ) like '%" & Replace(txtVal, "'", "''") & "%' "
    End If
  Else
    If cmbfield.ListCount > 0 Then
      If txtVal <> "" Then
          tFilter = " convert( varchar(255)," & gr.Columns.Item(1).Key & " ) like '%" & Replace(txtVal, "'", "''") & "%' "
      End If
    End If
  End If
  
  err.Clear
  If Filter <> "" Then
    If tFilter <> "" Then
      Call Sess.GetData("insert into #Pager(PagerID,ViewID) select '" & pager & "',ID from V_" & pvAlias & " where (" & Filter & ") and " & tFilter & " order by " & DefSort)
      If err.Number <> 0 Then
        Call Sess.GetData("insert into #Pager(PagerID,ViewID) select '" & pager & "',ID from V_" & pvAlias & " where (" & Filter & ") and " & tFilter)
      End If
    Else
      Call Sess.GetData("insert into #Pager(PagerID,ViewID) select '" & pager & "',ID from V_" & pvAlias & " where " & Filter & " order by " & DefSort)
      If err.Number <> 0 Then
        Call Sess.GetData("insert into #Pager(PagerID,ViewID) select '" & pager & "',ID from V_" & pvAlias & " where " & Filter)
      End If
    End If
  Else
    If tFilter <> "" Then
      Call Sess.GetData("insert into #Pager(PagerID,ViewID) select '" & pager & "',ID from V_" & pvAlias & " where " & tFilter & " order by " & DefSort)
      If err.Number <> 0 Then
        Call Sess.GetData("insert into #Pager(PagerID,ViewID) select '" & pager & "',ID from V_" & pvAlias & " where " & tFilter)
      End If
    Else
      Call Sess.GetData("insert into #Pager(PagerID,ViewID) select '" & pager & "',ID from V_" & pvAlias & " order by " & DefSort)
      If err.Number <> 0 Then
        Call Sess.GetData("insert into #Pager(PagerID,ViewID) select '" & pager & "',ID from V_" & pvAlias & " order by " & DefSort)
      End If
    End If
  End If
  
  
  

  fmTop = 0
  
  Erase mvarFieldArray
  
  
  Set rs = Sess.GetData(" select min(sequence) minseq ,max(sequence) maxseq from #Pager where pagerid='" & pager & "'")
  On Error Resume Next
  MinLine = 0
  MaxLine = 0
  MinLine = rs!minseq
  MaxLine = rs!maxseq
  CurrentTop = MinLine
  
  RefreshPage
  
  gr.ItemCount = fmTop
  refreshMe = False
bye:
'  LoadGridLayout gr, "FindEx" & TypeName
End Sub


Private Sub Form_Activate()

  cmdCreate.Visible = Not Runner.HideAditionalButtons
  cmdOpen.Visible = Not Runner.HideAditionalButtons
  
  cmdSaveLayout.Visible = Not Runner.HideAditionalButtons
  cmdFind.Visible = Not Runner.HideAditionalButtons
  cmdPrn.Visible = Not Runner.HideAditionalButtons
  cmdRefresh.Visible = Not Runner.HideAditionalButtons

  NoFind = MTZGetSetting("MTZ", "CONFIG", "NOFIND", False)
  If NoFind Then
    cmdFind.Visible = False
  Else
    cmdFind.Visible = True
  End If
  
  If refreshMe Then
    RefreshData
  End If
End Sub

Private Sub Form_GotFocus()
If refreshMe Then
    RefreshData
  End If
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
If IsEditObject(KeyCode, Shift) Then
    cmdSaveLayout_Click
End If
End Sub

Private Sub Form_Load()
  LoadBtnPictures cmdSaveLayout, cmdSaveLayout.Tag
  LoadBtnPictures cmdPrn, cmdPrn.Tag
  LoadBtnPictures cmdFind, cmdFind.Tag
  LoadBtnPictures cmdRefresh, cmdRefresh.Tag
  'LoadBtnPictures cmdRefresh2, cmdRefresh2.Tag
  
 
  
  Set Sess = Runner.GetSession(site)
  Dim rs As ADODB.Recordset
  Dim i As Long
  Dim cnt As Long
  Dim col As GridEX20.JSColumn
  Dim idx As Long
  Dim pvid As String
  Dim deford1 As String, deford2 As String
  
  gr.ItemCount = 0
  gr.Groups.Clear
  gr.SortKeys.Clear
  gr.Columns.Clear
  
  Set rs = Sess.GetRows("PartView", "", "", "the_Alias='" & pvAlias & "'")
  
  pvid = rs!partviewid
  Set rs = Sess.GetRowsEx("Viewcolumn", pvid, , , " order by sequence")
  If rs Is Nothing Then Exit Sub
  cnt = 0
  
  cmbfield.Clear
  While Not rs.EOF
    Set col = gr.Columns.Add(rs!Name, jgexText, jgexEditNone, rs!the_Alias)
     cmbfield.AddItem rs!Name
    cnt = cnt + 1
    
    If rs!ForCombo <> 0 Then
      If deford1 <> "" Then
        deford1 = deford1 & ","
      End If
      deford1 = deford1 & " convert( varchar(20),isnull(" & rs!the_Alias & ",'')) "
    End If
     
    If cnt <= 4 Then
      If deford2 <> "" Then
        deford2 = deford2 & ","
      End If
      deford2 = deford2 & " convert( varchar(20),isnull(" & rs!the_Alias & ",'')) "
    End If
   
    rs.MoveNext
  Wend
  
  If deford1 <> "" Then
    DefSort = deford1
  Else
    DefSort = deford2
  End If
  
  Set col = gr.Columns.Add("Состояние", jgexText, jgexEditNone, "StatusName")
  cnt = cnt + 1
  
'  If Filter <> "" Then
'    Filter = "(" & Filter & ") and "
'  End If
  
  
  
    
  RefreshData
  
  Set fnd = Nothing
  Set fnd = CreateObject("MTZ_JSetup.GridFinder")
  fnd.Init gr
  
  If IsHide_Add Then
    cmdCreate.Visible = False
  End If
  If IsHide_Find Then
    cmdFind.Visible = False
  End If
  If IsHide_Setup Then
    cmdSaveLayout.Visible = False
  End If
  If IsHide_Open Then
    cmdOpen.Visible = False
  End If
  If IsHide_Prn Then
    cmdPrn.Visible = False
  End If
  If IsHide_Refresh Then
    cmdRefresh.Visible = False
  End If
  
  LoadGridLayout gr, "FindEx" & TypeName
  
  
  Exit Sub
bye:

End Sub

Private Sub Form_Paint()
  If refreshMe Then
    RefreshData
  End If
End Sub

Private Sub Form_Resize()
  On Error Resume Next
  'gr.Top = 0
  gr.Left = 0
  If Me.Height < 6630 Then Me.Height = 6630
  If Me.Width < 8340 Then Me.Width = 8340
  
  gr.Height = Me.ScaleHeight - OKButton.Height - 60 - gr.top
  gr.Width = Me.ScaleWidth
  
  CancelButton.top = Me.ScaleHeight - CancelButton.Height - 30
  CancelButton.Left = Me.ScaleWidth - CancelButton.Width - 30
  OKButton.Left = CancelButton.Left - 30 - OKButton.Width
  
  OKButton.top = CancelButton.top
  cmdCreate.top = CancelButton.top
  cmdOpen.top = CancelButton.top
  cmdRefresh.top = CancelButton.top
  cmdPrn.top = CancelButton.top
  cmdFind.top = CancelButton.top
  cmdSaveLayout.top = CancelButton.top
  
  cmdTop.top = OKButton.top
  cmdPgDn.top = OKButton.top
  cmdPgUp.top = OKButton.top
  cmdBottom.top = OKButton.top
  cmdUp.top = OKButton.top
  cmdDown.top = OKButton.top
  
End Sub

Private Sub Form_Unload(Cancel As Integer)
  Set fnd = Nothing
  If Not Sess Is Nothing Then
    If pager <> "" Then
        Call Sess.GetData("delete from #Pager where PagerID ='" & pager & "'")
    End If
  End If
End Sub

Private Sub gr_ColumnHeaderClick(ByVal Column As GridEX20.JSColumn)
  Dim SortOrder As Integer

  SortOrder = Column.SortOrder
  
 
  If SortOrder = jgexSortAscending Then
    gr.SortKeys.Clear
    gr.SortKeys.Add Column.Index, jgexSortDescending
  Else
    gr.SortKeys.Clear
    gr.SortKeys.Add Column.Index, jgexSortAscending
  End If
  
  
  DefSort = ""
  
  Dim i As Long
  For i = 1 To gr.SortKeys.Count
    If gr.SortKeys.Item(i).SortOrder = jgexSortAscending Then
          If DefSort <> "" Then
            DefSort = DefSort & ","
          End If
          DefSort = DefSort & gr.Columns.Item(gr.SortKeys.Item(i).ColIndex).Key
    End If
    
    If gr.SortKeys.Item(i).SortOrder = jgexSortDescending Then
          If DefSort <> "" Then
            DefSort = DefSort & ","
          End If
          DefSort = DefSort & gr.Columns.Item(gr.SortKeys.Item(i).ColIndex).Key & " DESC"
    End If
  Next
  RefreshData
End Sub

Private Sub gr_DblClick()
If gr.Row < 1 Then Exit Sub
If gr.RowIndex(gr.Row) < 1 Then Exit Sub
ok = True

ID = mvarFieldArray(-2, gr.RowIndex(gr.Row))
Dim ref As Object
Set ref = Runner.GetInstanceObject(ID)
If Not ref Is Nothing Then
  Brief = ref.Brief
End If
'Set Runner = Nothing
Me.Hide
End Sub

Private Sub gr_KeyDown(KeyCode As Integer, Shift As Integer)
     If Shift = 0 And KeyCode = vbKeyReturn Then
      OKButton_Click
      Exit Sub
    End If
    If IsEditObject(KeyCode, Shift) Then
        cmdSaveLayout_Click
    End If
    If KeyCode = vbKeyF5 Then
        cmdRefresh_Click
    End If

End Sub

Private Sub gr_KeyPress(KeyAscii As Integer)
  If gr.ItemCount = 0 Then Exit Sub
   
  If NoFind Then Exit Sub
  
  On Error Resume Next
  fnd.FindOnPress KeyAscii
End Sub

Private Sub gr_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
  On Error Resume Next
  If LastRow <> gr.Row And LastRow > 0 Then
    gr.GetRowData(LastRow).RowStyle = "Default"
    gr.GetRowData(gr.Row).RowStyle = "SelectedRow"
  End If
End Sub

Private Sub gr_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
  Dim i As Long
  On Error Resume Next
  For i = 1 To gr.Columns.Count
    Values(i) = mvarFieldArray(i, RowIndex)
  Next
  Bookmark = mvarFieldArray(-1, RowIndex)
End Sub


Private Sub OKButton_Click()
  gr_DblClick
End Sub
Private Sub cmdOpen_Click()
On Error GoTo bye
If gr.Row < 1 Then Exit Sub
If gr.RowIndex(gr.Row) < 1 Then Exit Sub
Dim ref As Object, objGUI As Object
Set ref = Runner.GetInstanceObject(mvarFieldArray(-2, gr.RowIndex(gr.Row)))
If Not ref Is Nothing Then
  Set objGUI = Runner.GetInstanceGUI(ref.ID)
  If objGUI Is Nothing Then Set ref = Nothing: Exit Sub
  objGUI.Show "", ref, True
  Set objGUI = Nothing
End If
Set ref = Nothing
bye:
End Sub

'Allow Edit layout on Ctrl+Shift+Alt+F4
Private Function IsEditObject(KeyCode As Integer, Shift As Integer) As Boolean
Dim ShiftDown, AltDown, CtrlDown
ShiftDown = (Shift And vbShiftMask) > 0
AltDown = (Shift And vbAltMask) > 0
CtrlDown = (Shift And vbCtrlMask) > 0
IsEditObject = False
If KeyCode = vbKeyF4 Then
    If ShiftDown And CtrlDown And AltDown Then
        IsEditObject = True
    End If
End If
End Function

'''''''''''''

'Private Sub cmdTop_Click()
'CurrentTop = MinLine
'RefreshPage
'End Sub
'
'Private Sub cmdUp_Click()
'  If (gr.RowCount > 0) Then
'    gr.Row = 1
'    Call gr.EnsureVisible(1)
'  End If
'End Sub
'Private Sub cmdPgDn_Click()
'    If CurrentTop + PageSize > MaxLine - PageSize Then
'        CurrentTop = MaxLine - PageSize
'    Else
'        CurrentTop = CurrentTop + PageSize
'    End If
'    RefreshPage
'End Sub
'
'Private Sub cmdPgUp_Click()
'    If CurrentTop - PageSize < MinLine Then
'        CurrentTop = MinLine
'    Else
'        CurrentTop = CurrentTop - PageSize
'    End If
'    RefreshPage
'End Sub
'Private Sub cmdBottom_Click()
'CurrentTop = MaxLine - PageSize
'RefreshPage
'End Sub
'Private Sub cmdDown_Click()
'  If (gr.RowCount > 0) Then
'    gr.Row = gr.RowCount
'    Call gr.EnsureVisible(gr.RowCount)
'  End If
'End Sub

Private Sub cmdTop_Click()
If inPageBtn Then Exit Sub
inPageBtn = True
CurrentTop = MinLine
RefreshPage
inPageBtn = False
End Sub

Private Sub cmdUp_Click()
  If (gr.RowCount > 0) Then
    gr.Row = 1
    Call gr.EnsureVisible(1)
  End If
End Sub
Private Sub cmdPgDn_Click()
  If inPageBtn Then Exit Sub
  inPageBtn = True
  
  If CurrentTop + PageSize > MaxLine - PageSize Then
      CurrentTop = MaxLine - PageSize
  Else
      CurrentTop = CurrentTop + PageSize
  End If
  RefreshPage
      
  inPageBtn = False
End Sub

Private Sub cmdPgUp_Click()
  If inPageBtn Then Exit Sub
  inPageBtn = True
  
  If CurrentTop - PageSize < MinLine Then
      CurrentTop = MinLine
  Else
      CurrentTop = CurrentTop - PageSize
  End If
  RefreshPage
  
  inPageBtn = False
End Sub

'Parameters:
' параметров нет
'See Also:
'  Brief
'  Filter
'  ID
'  IsHide_Add
'  IsHide_Find
'  IsHide_Open
'  IsHide_Prn
'  IsHide_Refresh
'  IsHide_Setup
'  ok
'  pvAlias
'  Runner
'  site
'  TypeName
'Example:
'  call me.RefreshPage()
Public Sub RefreshPage()
Attribute RefreshPage.VB_HelpID = 360
   On Error GoTo bye
  
  fmTop = 0
  On Error Resume Next
  Dim cnt As Long
  
  Dim idx As Long, i As Long, j As Long
  Dim rs As ADODB.Recordset
 
  gr.ItemCount = 0
  DoEvents
  
  Erase mvarFieldArray
    
  '-2 - InstanceID; -1 - RowID;  0 - VIEWBASE
  ReDim mvarFieldArray(-2 To gr.Columns.Count, 0 To PageSize + 1)
  Set rs = Sess.GetData(" select * from  V_" & pvAlias & "  join #Pager XXXX on ID = XXXX.ViewID and XXXX.PagerID ='" & pager & "' and XXXX.sequence >=" & CurrentTop & " and XXXX.sequence <=" & (CurrentTop + PageSize) & " order by XXXX.sequence ")
    
    If Not rs Is Nothing Then
      On Error Resume Next
      
      'ReDim Preserve mvarFieldArray(-2 To cnt, 0 To fmTop + rs.RecordCount)
      idx = 1
      While Not rs.EOF
        mvarFieldArray(-2, fmTop + idx) = rs!InstanceiD
        mvarFieldArray(-1, fmTop + idx) = rs!ID
        mvarFieldArray(0, fmTop + idx) = rs!ViewBase
        
        For i = 1 To gr.Columns.Count
          mvarFieldArray(i, fmTop + idx) = rs.Fields(gr.Columns.Item(i).Key).Value
        Next
        
        rs.MoveNext
        idx = idx + 1
      Wend
      fmTop = fmTop + rs.RecordCount
    End If
  rs.Close
  Set rs = Nothing
  
  
  gr.ItemCount = fmTop
  gr.Refresh
  gr.RefreshSort
  gr.RefreshGroups
  gr.CollapseAll
  If gr.Row > 0 Then
    gr.GetRowData(gr.Row).RowStyle = "SelectedRow"
  End If
  RefreshInfo
  DoEvents
  
  Exit Sub
bye:
'  Stop
'  Resume
MsgBox err.Description, vbCritical + vbOKOnly, "Обновление страницы"
End Sub


Private Sub RefreshInfo()
  lblInfo.Caption = gr.ItemCount & " из " & (MaxLine - MinLine + 1) & " с " & IIf(CurrentTop - MinLine + 1 < 0, 1, CurrentTop - MinLine + 1)
End Sub
