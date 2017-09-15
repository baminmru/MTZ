VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Begin VB.Form frmDialogEx 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "Выбор строки"
   ClientHeight    =   6375
   ClientLeft      =   2775
   ClientTop       =   3720
   ClientWidth     =   9300
   Icon            =   "frmDialogEx.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6375
   ScaleWidth      =   9300
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
   Begin VB.TextBox txtVal 
      Height          =   315
      Left            =   2760
      TabIndex        =   1
      Top             =   0
      Width           =   3015
   End
   Begin VB.ComboBox cmbfield 
      Height          =   315
      Left            =   0
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   0
      Width           =   2655
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
      Left            =   4680
      Style           =   1  'Graphical
      TabIndex        =   16
      Tag             =   "xl.ico"
      ToolTipText     =   "Перейти на последнюю запись"
      Top             =   6000
      Width           =   315
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
      Left            =   4320
      Style           =   1  'Graphical
      TabIndex        =   15
      Tag             =   "xl.ico"
      ToolTipText     =   "перейти на первую запись"
      Top             =   6000
      Width           =   315
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
      Left            =   3240
      Picture         =   "frmDialogEx.frx":0442
      Style           =   1  'Graphical
      TabIndex        =   12
      Tag             =   "xl.ico"
      ToolTipText     =   "Предыдущая страница"
      Top             =   6000
      Width           =   315
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
      Left            =   2880
      Picture         =   "frmDialogEx.frx":0784
      Style           =   1  'Graphical
      TabIndex        =   11
      Tag             =   "xl.ico"
      ToolTipText     =   "К первой странице"
      Top             =   6000
      Width           =   315
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
      Left            =   3960
      Picture         =   "frmDialogEx.frx":0AC6
      Style           =   1  'Graphical
      TabIndex        =   14
      Tag             =   "xl.ico"
      ToolTipText     =   "К последней странице"
      Top             =   6000
      Width           =   315
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
      Left            =   3600
      Picture         =   "frmDialogEx.frx":0E08
      Style           =   1  'Graphical
      TabIndex        =   13
      Tag             =   "xl.ico"
      ToolTipText     =   "Следующая страница"
      Top             =   6000
      Width           =   315
   End
   Begin VB.CommandButton cmdRefresh 
      Height          =   330
      Left            =   1200
      Style           =   1  'Graphical
      TabIndex        =   9
      Tag             =   "refresh.ico"
      Top             =   6000
      Width           =   330
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "Добавить"
      Height          =   315
      Left            =   1590
      TabIndex        =   10
      Top             =   6000
      Width           =   1175
   End
   Begin VB.CommandButton cmdPrn 
      Height          =   330
      Left            =   840
      Style           =   1  'Graphical
      TabIndex        =   8
      Tag             =   "printpreview.ico"
      ToolTipText     =   "Печать"
      Top             =   6000
      Width           =   330
   End
   Begin VB.CommandButton cmdFind 
      Height          =   330
      Left            =   120
      Style           =   1  'Graphical
      TabIndex        =   6
      Tag             =   "find.ico"
      ToolTipText     =   "Поиск"
      Top             =   6000
      Width           =   330
   End
   Begin VB.CommandButton cmdSaveLayout 
      Height          =   330
      Left            =   480
      Style           =   1  'Graphical
      TabIndex        =   7
      Tag             =   "config.ico"
      ToolTipText     =   "Настроить"
      Top             =   6000
      Width           =   330
   End
   Begin GridEX20.GridEX gr 
      Height          =   5475
      Left            =   30
      TabIndex        =   3
      Top             =   360
      Width           =   9285
      _ExtentX        =   16378
      _ExtentY        =   9657
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
      FormatStyle(1)  =   "frmDialogEx.frx":114A
      FormatStyle(2)  =   "frmDialogEx.frx":1206
      FormatStyle(3)  =   "frmDialogEx.frx":1362
      FormatStyle(4)  =   "frmDialogEx.frx":1412
      FormatStyle(5)  =   "frmDialogEx.frx":14C6
      FormatStyle(6)  =   "frmDialogEx.frx":159E
      ImageCount      =   0
      PrinterProperties=   "frmDialogEx.frx":1656
   End
   Begin VB.CommandButton CancelButton 
      Cancel          =   -1  'True
      Caption         =   "Отмена"
      CausesValidation=   0   'False
      Height          =   315
      Left            =   8040
      TabIndex        =   5
      Top             =   6000
      Width           =   1175
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   315
      Left            =   6840
      TabIndex        =   4
      Top             =   6000
      Width           =   1175
   End
   Begin VB.Label lblInfo 
      Alignment       =   1  'Right Justify
      Caption         =   "Записей: "
      Height          =   315
      Left            =   6960
      TabIndex        =   17
      Top             =   0
      Width           =   2265
   End
End
Attribute VB_Name = "frmDialogEx"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_HelpID = 165

Option Explicit
Dim NoFind As Boolean
Private fnd As Object
Public TableName As String
Attribute TableName.VB_VarHelpID = 235
Public Runner As Main
Attribute Runner.VB_VarHelpID = 220
Public Sess As MTZSession.session
Attribute Sess.VB_VarHelpID = 225
Public ok As Boolean
Attribute ok.VB_VarHelpID = 200
Public ID As String
Attribute ID.VB_VarHelpID = 180
Public site As String
Attribute site.VB_VarHelpID = 230
Public Brief As String
Attribute Brief.VB_VarHelpID = 170
Public Filter As String
Attribute Filter.VB_VarHelpID = 175
Public pvAlias As String
Attribute pvAlias.VB_VarHelpID = 210
Dim mvarFieldArray() As Variant
Dim fmTop As Long
Public InstanceiD As String
Attribute InstanceiD.VB_VarHelpID = 185
Private inPageBtn As Boolean

'For GetRefEx3
Public IsHide_Add As Boolean
Attribute IsHide_Add.VB_VarHelpID = 190

Public IsHide_Setup As Boolean
Attribute IsHide_Setup.VB_VarHelpID = 195

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
        Call Sess.GetData("insert into #Pager(PagerID,ViewID) select '" & pager & "',ID from V_" & pvAlias & " where  " & tFilter)
      End If
    Else
      Call Sess.GetData("insert into #Pager(PagerID,ViewID) select '" & pager & "',ID from V_" & pvAlias & " order by " & DefSort)
      
      If err.Number <> 0 Then
        Call Sess.GetData("insert into #Pager(PagerID,ViewID) select '" & pager & "',ID from V_" & pvAlias)
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
bye:
  'LoadGridLayout gr, "FindEx" & TableName
End Sub

'Parameters:
' параметров нет
'See Also:
'  Brief
'  Filter
'  ID
'  InstanceiD
'  IsHide_Add
'  IsHide_Setup
'  ok
'  Prepare
'  pvAlias
'  Runner
'  Sess
'  site
'  TableName
'Example:
'  call me.RefreshPage()
Public Sub RefreshPage()
Attribute RefreshPage.VB_HelpID = 215
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
  Set rs = Sess.GetData(" select * from  V_" & pvAlias & "  join #Pager XXXX on ID = XXXX.ViewID and XXXX.PagerID ='" & pager & "' and XXXX.sequence >=" & CurrentTop & " and XXXX.sequence <=" & (CurrentTop + PageSize) & " order by XXXX.sequence")
    
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

Private Sub cmdAdd_Click()
  On Error Resume Next
  Dim otname As String
  otname = Sess.TableToType(TableName)
  
  Dim rs As ADODB.Recordset
  Set rs = Runner.ListInstances("", otname)
  If rs.EOF Then
    Call MsgBox("Тип '" & otname & " не найден.", vbOKOnly + vbExclamation, App.Title)
    Exit Sub
  End If
  
  Dim obj As Object, ogui As Object
  Dim col As Object
  Dim pobj As Object, pname As String, pid As String, pbrief As String
  Dim ritem As Object
  Set obj = Runner.GetInstanceObject(rs!InstanceiD)
  If (obj Is Nothing) Then
    Call MsgBox("Библиотека доступа к данным для типа '" & otname & " не найдена.", vbOKOnly + vbExclamation, App.Title)
    Exit Sub
  End If
  Set ogui = Runner.GetInstanceGUI(obj.ID)
  If (ogui Is Nothing) Then
    Call MsgBox("Визуальная библиотека для типа '" & otname & " не найдена.", vbOKOnly + vbExclamation, App.Title)
    Exit Sub
  End If
  
  pname = Sess.TableParent(TableName)
  If pname = vbNullString Then
    Set col = CallByName(obj, TableName, VbGet)
    If (col Is Nothing) Then
      Call MsgBox("Метод '" & TableName & " не найден.", vbOKOnly + vbExclamation, App.Title)
      Exit Sub
    End If
  Else
    MsgBox "Сначала необходимо определить строку, к которой будет оноситься информация", vbInformation & vbOKOnly, App.Title
    If Runner.GetReferenceDialogEx2(pname, pid, pbrief, obj.ID) Then
      Set pobj = obj.FindRowObject(pname, pid)
      If Not pobj Is Nothing Then
        Set col = CallByName(pobj, TableName, VbGet)
        If (col Is Nothing) Then
          Call MsgBox("Метод '" & TableName & " не найден.", vbOKOnly + vbExclamation, App.Title)
          Exit Sub
        End If
      Else
        Exit Sub
      End If
    Else
      Exit Sub
    End If
  End If
  
  If Not col Is Nothing Then
   Set ritem = col.Add
   On Error Resume Next
   
   If ogui.ShowAddForm("", ritem) Then
   
     If err.Number = 0 Then
        ritem.Save
        RefreshData
     Else
      Call MsgBox(err.Description, vbOKOnly + vbExclamation, App.Title)
     End If
   Else
    col.Refresh
   End If
  
  End If

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
  jset.ShowSumary gr, "FindEx" & TableName
  Set jset = Nothing
End Sub

Private Sub cmdFind_Click()
  On Error Resume Next
  fnd.ShowForm
End Sub

Private Sub Form_Activate()
Prepare







Set Sess = Runner.GetSession(site)
End Sub

'Parameters:
' параметров нет
'See Also:
'  Brief
'  Filter
'  ID
'  InstanceiD
'  IsHide_Add
'  IsHide_Setup
'  ok
'  pvAlias
'  RefreshPage
'  Runner
'  Sess
'  site
'  TableName
'Example:
'  call me.Prepare()
Public Sub Prepare()
Attribute Prepare.VB_HelpID = 205
 cmdSaveLayout.Visible = Not Runner.HideAditionalButtons
  cmdFind.Visible = Not Runner.HideAditionalButtons
  cmdPrn.Visible = Not Runner.HideAditionalButtons
  cmdRefresh.Visible = Not Runner.HideAditionalButtons

  
  
  If IsHide_Add Then
    cmdAdd.Visible = False
  Else
    cmdAdd.Visible = True
  End If
  
  
  
  
  If IsHide_Setup Then
    cmdRefresh.Visible = False
    cmdPrn.Visible = False
    cmdFind.Visible = False
    cmdSaveLayout.Visible = False
  Else
    cmdRefresh.Visible = True
    cmdPrn.Visible = True
    cmdFind.Visible = True
    cmdSaveLayout.Visible = True
  End If
  
  NoFind = MTZGetSetting("MTZ", "CONFIG", "NOFIND", False)
  
  If NoFind Then
    cmdFind.Visible = False
  Else
    cmdFind.Visible = True
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
  Dim col As GridEX20.JSColumn
  Dim cnt As Integer, idx As Long
  Dim pvid As String
  Dim deford1 As String
  Dim deford2 As String
  
  gr.ItemCount = 0
  gr.Groups.Clear
  gr.SortKeys.Clear
  gr.Columns.Clear
  
  Set rs = Sess.GetRows("PartView", "", "", "the_Alias='" & pvAlias & "'")
  If rs.EOF Then Exit Sub
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
  
  If InstanceiD <> "" Then
    If Filter <> "" Then
      Filter = "(" & Filter & ") and "
    End If
    Filter = Filter & " InstanceID ='" & InstanceiD & "'"
  End If
  
  RefreshData
  'On Error Resume Next
  Set fnd = Nothing
  Set fnd = CreateObject("MTZ_JSetup.GridFinder")
  fnd.Init gr
  
  Dim otname As String
  otname = Sess.TableToType(TableName)
  
  Set rs = Runner.Sessions.Item(site).GetRowsEx("OBJECTTYPE", "", "", " Name='" & otname & "'")
  
  
  If Not rs.EOF Then
     If rs!IsSingleInstance = -1 Then
        cmdAdd.Visible = True
     End If
  End If
  
  
  
 
  
  LoadGridLayout gr, "FindEx" & TableName
  
 Prepare
  Exit Sub
bye:

 
 
 
End Sub

Private Sub Form_Resize()
  On Error Resume Next
  If (Me.Height < 6555) Then Me.Height = 6555
  If (Me.Width < 8265) Then Me.Width = 8265
  
  'gr.Top = 0
  gr.Left = 0
  gr.Width = Me.ScaleWidth
  gr.Height = Me.ScaleHeight - 120 - OKButton.Height * 2 - gr.top
  
  CancelButton.top = Me.ScaleHeight - 60 - CancelButton.Height
  OKButton.top = CancelButton.top
  
  CancelButton.Left = Me.ScaleWidth - 60 - CancelButton.Width
  OKButton.Left = CancelButton.Left - 60 - OKButton.Width
  
  
  
  
  cmdSaveLayout.top = OKButton.top
  cmdFind.top = OKButton.top
  cmdPrn.top = OKButton.top
  cmdRefresh.top = OKButton.top
  cmdAdd.top = OKButton.top
  
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
          DefSort = DefSort & gr.Columns.Item(gr.SortKeys.Item(i).ColIndex).Key & " DESC "
    End If
  Next
 
  
  RefreshData
End Sub

Private Sub gr_DblClick()
  If gr.Row < 1 Then Exit Sub
  If gr.RowIndex(gr.Row) < 1 Then Exit Sub
  ok = True
  ID = mvarFieldArray(-1, gr.RowIndex(gr.Row))
  Call Sess.GetBrief(TableName, ID, Brief)
  Set Runner = Nothing
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
  For i = 1 To gr.Columns.Count
    Values(i) = mvarFieldArray(i, RowIndex)
  Next
  Bookmark = mvarFieldArray(-1, RowIndex)
End Sub


Private Sub OKButton_Click()
  gr_DblClick
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

Private Sub RefreshInfo()
  lblInfo.Caption = gr.ItemCount & " из " & (MaxLine - MinLine + 1) & " с " & IIf(CurrentTop - MinLine + 1 < 0, 1, CurrentTop - MinLine + 1)
End Sub
