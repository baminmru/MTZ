VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Begin VB.Form frmLog 
   Caption         =   "Журнал активности"
   ClientHeight    =   7005
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   12075
   Icon            =   "frmLog.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   7005
   ScaleWidth      =   12075
   Begin VB.Frame FrameTool 
      Height          =   1635
      Left            =   60
      TabIndex        =   1
      Top             =   390
      Width           =   12285
      Begin MSComDlg.CommonDialog CommonDialog 
         Left            =   10620
         Top             =   780
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin VB.Frame Frame1 
         Caption         =   "Экспорт"
         Height          =   1455
         Left            =   7770
         TabIndex        =   13
         Top             =   120
         Width           =   2295
         Begin VB.CheckBox chkDeleteFrom 
            Caption         =   "Удалять при экспорте"
            Height          =   225
            Left            =   120
            TabIndex        =   15
            Top             =   810
            Width           =   2025
         End
         Begin VB.CommandButton cmdExport 
            Caption         =   "Экспорт записей"
            Height          =   345
            Left            =   90
            TabIndex        =   14
            Top             =   420
            Width           =   2025
         End
      End
      Begin VB.Frame frmFilter 
         Caption         =   "Фильтр"
         Height          =   1455
         Left            =   2160
         TabIndex        =   7
         Top             =   120
         Width           =   5565
         Begin VB.ListBox ListUsers 
            Height          =   1185
            ItemData        =   "frmLog.frx":0442
            Left            =   90
            List            =   "frmLog.frx":0444
            Style           =   1  'Checkbox
            TabIndex        =   8
            Top             =   210
            Width           =   3225
         End
         Begin MSComCtl2.DTPicker DTPicker1 
            Height          =   315
            Left            =   3870
            TabIndex        =   9
            Top             =   270
            Width           =   1515
            _ExtentX        =   2672
            _ExtentY        =   556
            _Version        =   393216
            CheckBox        =   -1  'True
            CustomFormat    =   "dd.M.yyyy"
            DateIsNull      =   -1  'True
            Format          =   3801091
            CurrentDate     =   38414
         End
         Begin MSComCtl2.DTPicker DTPicker2 
            Height          =   315
            Left            =   3870
            TabIndex        =   10
            Top             =   630
            Width           =   1515
            _ExtentX        =   2672
            _ExtentY        =   556
            _Version        =   393216
            CheckBox        =   -1  'True
            CustomFormat    =   "dd.M.yyyy"
            DateIsNull      =   -1  'True
            Format          =   3801091
            CurrentDate     =   38414
         End
         Begin VB.Label Label2 
            Caption         =   "по"
            Height          =   315
            Left            =   3450
            TabIndex        =   12
            Top             =   630
            Width           =   225
         End
         Begin VB.Label Label1 
            Caption         =   "C"
            Height          =   315
            Left            =   3450
            TabIndex        =   11
            Top             =   270
            Width           =   225
         End
      End
      Begin VB.CommandButton cmdRef 
         Height          =   330
         Left            =   150
         Style           =   1  'Graphical
         TabIndex        =   6
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   270
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdPrn 
         Height          =   330
         Left            =   630
         Style           =   1  'Graphical
         TabIndex        =   5
         Tag             =   "PrintPreview.ico"
         ToolTipText     =   "Печать"
         Top             =   270
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdCfg 
         Height          =   330
         Left            =   990
         Style           =   1  'Graphical
         TabIndex        =   4
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   270
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdFnd 
         Height          =   330
         Left            =   1350
         Style           =   1  'Graphical
         TabIndex        =   3
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   270
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdMode 
         Height          =   330
         Left            =   1710
         Style           =   1  'Graphical
         TabIndex        =   2
         Tag             =   "switch.ico"
         ToolTipText     =   "Режим таблицы или карточки"
         Top             =   270
         UseMaskColor    =   -1  'True
         Width           =   330
      End
   End
   Begin VB.Timer menuTimer 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   11280
      Top             =   2580
   End
   Begin VB.Timer RefreshTimer 
      Enabled         =   0   'False
      Interval        =   2000
      Left            =   11280
      Top             =   3390
   End
   Begin GridEX20.GridEX gr 
      Height          =   5745
      Left            =   -150
      TabIndex        =   0
      Top             =   2640
      Width           =   11235
      _ExtentX        =   19817
      _ExtentY        =   10134
      Version         =   "2.0"
      AutomaticSort   =   -1  'True
      RecordNavigatorString=   "Запись:|из "
      BoundColumnIndex=   ""
      ReplaceColumnIndex=   ""
      TabKeyBehavior  =   1
      CalendarTodayText=   "Сегоднч"
      MethodHoldFields=   -1  'True
      SelectionStyle  =   1
      GroupByBoxInfoText=   "Перетащите колонку для группировки"
      AllowEdit       =   0   'False
      DataMode        =   99
      ColumnHeaderHeight=   285
      IntProp1        =   0
      IntProp2        =   0
      IntProp7        =   0
      FormatStylesCount=   6
      FormatStyle(1)  =   "frmLog.frx":0446
      FormatStyle(2)  =   "frmLog.frx":0526
      FormatStyle(3)  =   "frmLog.frx":0682
      FormatStyle(4)  =   "frmLog.frx":0732
      FormatStyle(5)  =   "frmLog.frx":07E6
      FormatStyle(6)  =   "frmLog.frx":08BE
      ImageCount      =   0
      PrinterProperties=   "frmLog.frx":0976
   End
End
Attribute VB_Name = "frmLog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private menuAction As String
Private mvarFieldArray() As Variant
Dim fmTop As Long
Private fnd As Object
Private LastCheckDate As Date
Private inRefreshTimer  As Boolean
Private bRefresh As Boolean





Public Sub Init()
  bRefresh = True
  On Error Resume Next
  Dim noLoad As Boolean
  noLoad = False
  RefreshTimer.Enabled = False

  fmTop = 0
  
  Dim js As Long, idx As Long
  'Dim pv As MTZMetaModel.PARTVIEW
  'Dim part As MTZMetaModel.part
  Dim rs As ADODB.Recordset
  Dim col As GridEX20.JSColumn
again:

  Call LoadUsersToList

  On Error Resume Next
  gr.ItemCount = 0
  gr.Groups.Clear
  gr.SortKeys.Clear
  gr.Columns.Clear
  

    Set col = gr.Columns.Add("Пользователь", jgexText, jgexEditNone)
    Set col = gr.Columns.Add("Фамилия", jgexText, jgexEditNone)
    Set col = gr.Columns.Add("Имя", jgexText, jgexEditNone)
    Set col = gr.Columns.Add("Отчество", jgexText, jgexEditNone)
    Set col = gr.Columns.Add("Тип объекта", jgexText, jgexEditNone)
    Set col = gr.Columns.Add("Объект", jgexText, jgexEditNone)
    Set col = gr.Columns.Add("Раздел", jgexText, jgexEditNone)
    Set col = gr.Columns.Add("Действие", jgexText, jgexEditNone)
    Set col = gr.Columns.Add("Время", jgexText, jgexEditNone)
    col.SortType = jgexSortTypeDateTime
    
  
  On Error Resume Next
  
  
  
  On Error GoTo bye
  If noLoad = False Then
    LoadGridLayout gr, "JournalV_LOG"
    Exit Sub
  End If
  bRefresh = False
  Exit Sub
bye:
  noLoad = True
  GoTo again
End Sub

Public Sub LoadUsersToList()
  Dim i As Long
  
  For i = 1 To usr.Users.Count
    Call ListUsers.AddItem(usr.Users.item(i).Login)
    ListUsers.Selected(ListUsers.NewIndex) = True
  Next
  ListUsers.ListIndex = 0
  
End Sub

Public Sub RefreshLog()
  On Error GoTo bye
  
  fmTop = 0
  On Error Resume Next
  Dim cnt As Long
  
  Dim js As Long, idx As Long, i As Long, j As Long
  Dim rs As ADODB.Recordset
   
  gr.ItemCount = 0
  DoEvents
  
  cnt = gr.Columns.Count
  Erase mvarFieldArray
  
  
  ReDim mvarFieldArray(-2 To cnt, 0 To 0)
  
  LastCheckDate = Session.GetServerTime()
  
  Dim Filter As String
  Filter = vbNullString
  If (Not IsNull(DTPicker1.Value)) Then
    Dim datefrom As Date
    datefrom = DateSerial(Year(DTPicker1.Value), Month(DTPicker1.Value), Day(DTPicker1.Value))
    datefrom = DateAdd("D", -1, datefrom)
    datefrom = DateAdd("h", 23, datefrom)
    datefrom = DateAdd("n", 59, datefrom)
    If Session.IsORACLE Then
        Filter = Filter & "(ChangeStamp >" & MakeORACLEDate(DTPicker1.Value) & ")"
    Else
        Filter = Filter & "(ChangeStamp >" & MakeMSSQLDate(DTPicker1.Value) & ")"
    End If
  End If
  If (Not IsNull(DTPicker2.Value)) Then
    If (Filter <> vbNullString) Then
      Filter = Filter & " AND "
    End If
    Dim dateto As Date
    dateto = DateSerial(Year(DTPicker2.Value), Month(DTPicker2.Value), Day(DTPicker2.Value))
    dateto = DateAdd("D", 1, dateto)
    If Session.IsORACLE Then
        Filter = Filter & "(ChangeStamp < " & MakeORACLEDate(dateto) & ")"
    Else
        Filter = Filter & "(ChangeStamp < " & MakeMSSQLDate(dateto) & ")"
    End If
  End If
  Dim ij As Long
  Dim Usersfilter As String
  For ij = 0 To ListUsers.ListCount - 1
    If (ListUsers.Selected(ij)) Then
      If (Usersfilter <> vbNullString) Then
        Usersfilter = Usersfilter & ","
      End If
      Usersfilter = Usersfilter & "'" & ListUsers.List(ij) & "'"
    End If
  Next
  If (Usersfilter <> vbNullString) Then
    If (Filter <> vbNullString) Then
      Filter = Filter & " AND "
    End If
    Filter = Filter & "( Login in (" & Usersfilter & ") )"
  End If
  
    
  If Session.IsORACLE Then
      Set rs = Session.GetRowsEx("V_Log", , , Filter, " order by ChangeStamp")
  Else
      Set rs = Session.GetRowsEx("V_Log", , , Filter, " order by ChangeStamp")
  End If

    If Not rs Is Nothing Then
      On Error Resume Next
      
      ReDim Preserve mvarFieldArray(-2 To cnt, 0 To fmTop + rs.RecordCount)
      idx = 1
      While Not rs.EOF
        mvarFieldArray(-2, fmTop + idx) = rs!LogInstanceID
        mvarFieldArray(-1, fmTop + idx) = rs!syslogID
        mvarFieldArray(0, fmTop + idx) = "V_LOG"
        mvarFieldArray(1, fmTop + idx) = rs!Login & ""
        mvarFieldArray(2, fmTop + idx) = rs!Family & ""
        mvarFieldArray(3, fmTop + idx) = rs!Name & ""
        mvarFieldArray(4, fmTop + idx) = rs!SurName & ""
        mvarFieldArray(5, fmTop + idx) = rs!the_comment & ""
        mvarFieldArray(6, fmTop + idx) = rs!instname & ""
        mvarFieldArray(7, fmTop + idx) = rs!Caption & ""
        mvarFieldArray(8, fmTop + idx) = rs!Verb & ""
        mvarFieldArray(9, fmTop + idx) = rs!changestamp & ""
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
  DoEvents
  'LastCheckDate = Session.GetServerTime()
  RefreshTimer.Enabled = True
  Exit Sub
bye:
'  Stop
'  Resume
MsgBox err.Description, vbCritical + vbOKOnly, "Обновление журнала"
End Sub

Public Property Get FieldMatrix(ByVal col As Long, ByVal Row As Long) As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.FieldArray
    FieldMatrix = Empty
    On Error Resume Next
    
    FieldMatrix = mvarFieldArray(col, Row)
End Property


Public Property Get RowID(ByVal Row As Long) As String
    On Error Resume Next
    RowID = mvarFieldArray(-1, Row)
End Property


Public Property Get RowInstanceID(ByVal Row As Long) As String
    On Error Resume Next
    RowInstanceID = mvarFieldArray(-2, Row)
End Property


Public Property Get ViewBase(ByVal Row As Long) As String
    On Error Resume Next
    ViewBase = mvarFieldArray(0, Row)
End Property


Public Property Get RowCount() As Long
    On Error Resume Next
    RowCount = fmTop
End Property

Public Property Get Row() As Long
    On Error Resume Next
    Row = gr.RowIndex(gr.Row)
End Property


Public Property Let Row(r As Long)
    On Error Resume Next
    If r > 0 And r <= gr.ItemCount Then
      gr.Row = r
    End If
End Property


Public Property Let FieldMatrix(ByVal col As Long, ByVal Row As Long, ByVal vData As Variant)
    On Error Resume Next
    mvarFieldArray(col, Row) = vData
End Property


Public Property Set FieldMatrix(ByVal col As Long, ByVal Row As Long, ByVal vData As Variant)
    On Error Resume Next
    Set mvarFieldArray(col, Row) = vData
End Property



Private Sub cmdCfg_Click()
On Error Resume Next
  Dim jset As Object
  Set jset = CreateObject("MTZ_JSetup.Customizer")
  jset.ShowSumary gr, "JournalV_LOG"
  Set jset = Nothing
End Sub



Private Sub cmdExport_Click()
    Dim DeleteCollection As Collection
    Set DeleteCollection = New Collection
    CommonDialog.CancelError = True
    On Error Resume Next
    CommonDialog.Filter = "html файлы|*.html"
    Call CommonDialog.ShowSave
    If (err.Number = 0) Then
      On Error GoTo errr
      Dim FileName  As String
      FileName = CommonDialog.FileName
      Dim fso As FileSystemObject
      Set fso = New FileSystemObject
      
      
      If (Right(FileName, 5) <> ".html") Then
        FileName = FileName & ".html"
      End If
      Dim FileStream As TextStream
      Set FileStream = fso.CreateTextFile(FileName, True, True)
      If Not (FileStream Is Nothing) Then
        Call FileStream.WriteLine("<html>")
        Call FileStream.WriteLine("<table border=0 cellspacing=0 width=100%> ")
        Call FileStream.WriteLine("<tr>")
        Call FileStream.WriteLine("<td align=center>")
        Call FileStream.WriteLine("<h2>Журнал аудита</h2>")
        Call FileStream.WriteLine("</td>")
        Call FileStream.WriteLine("</tr>")
        Call FileStream.WriteLine("<tr>")
        Call FileStream.WriteLine("<td>")
        Call FileStream.WriteLine("Параметры журнала:")
        Call FileStream.WriteLine("</td>")
        Call FileStream.WriteLine("</tr>")
        
        Dim i As Long
        For i = 0 To ListUsers.ListCount - 1
          If (ListUsers.Selected(i)) Then
            Call FileStream.WriteLine("<tr>")
            Call FileStream.WriteLine("<td align=left>")
            Call FileStream.WriteLine("Пользователь: " & ListUsers.List(i))
            Call FileStream.WriteLine("</td>")
            Call FileStream.WriteLine("</tr>")
          End If
        Next
        
        If Not (IsNull(DTPicker1.Value)) Then
            Call FileStream.WriteLine("<tr>")
            Call FileStream.WriteLine("<td align=left>")
            Call FileStream.WriteLine("Дата от: " & Format(DTPicker1, "dd.mm.yyyy"))
            Call FileStream.WriteLine("</td>")
            Call FileStream.WriteLine("</tr>")
        End If
        If (Not IsNull(DTPicker2.Value)) Then
            Call FileStream.WriteLine("<tr>")
            Call FileStream.WriteLine("<td align=left>")
            Call FileStream.WriteLine("Дата до: " & Format(DTPicker2, "dd.mm.yyyy"))
            Call FileStream.WriteLine("</td>")
            Call FileStream.WriteLine("</tr>")
        End If
        Call FileStream.WriteLine("<tr>")
        Call FileStream.WriteLine("<td>")
        Call FileStream.WriteLine("&nbsp;")
        Call FileStream.WriteLine("</td>")
        Call FileStream.WriteLine("</tr>")
        Call FileStream.WriteLine("</table> ")
        
        Call FileStream.WriteLine("</table>")
        Call FileStream.WriteLine("<table border=1 cellspacing=0 width=100%> ")
        Call FileStream.WriteLine("<tr>")
        Call FileStream.WriteLine("<td>Пользователь</td>")
        Call FileStream.WriteLine("<td>Фамилия</td>")
        Call FileStream.WriteLine("<td>Имя</td>")
        Call FileStream.WriteLine("<td>Отчество</td>")
        Call FileStream.WriteLine("<td>Тип объекта</td>")
        Call FileStream.WriteLine("<td>Объект</td>")
        Call FileStream.WriteLine("<td>Раздел</td>")
        Call FileStream.WriteLine("<td>Действие</td>")
        Call FileStream.WriteLine("<td>Время</td>")
        Call FileStream.WriteLine("</tr>")
        
        For i = LBound(mvarFieldArray, 2) + 1 To UBound(mvarFieldArray, 2)
          Call FileStream.WriteLine("<tr>")
          Dim j As Long
          If (chkDeleteFrom.Value) Then
            DeleteCollection.Add (mvarFieldArray(-1, i))
          End If
          For j = 1 To UBound(mvarFieldArray, 1)
            Call FileStream.WriteLine("<td>&nbsp;" & mvarFieldArray(j, i) & "&nbsp;</td>")
            DoEvents
          Next
          Call FileStream.WriteLine("</tr>")
        Next
        Call FileStream.WriteLine("</table>")
        Call FileStream.WriteLine("</html>")
      End If
      Call FileStream.Close
    End If
    If (DeleteCollection.Count > 0) Then
      Dim str As String
      For i = 1 To DeleteCollection.Count
        If (DeleteCollection.item(i) <> vbNullString) Then
          Call Session.DeleteRow2("SysLog", DeleteCollection.item(i), "{9A360531-D935-4676-952A-5BF35A5CFE80}")
        End If
      Next
      Call RefreshLog
      chkDeleteFrom.Value = vbUnchecked
    End If
    Call ShellExecute(-1, "edit", """" & FileName & """", "", "", 0)
    
    Exit Sub
errr:
    Call MsgBox("При формировании отчёта возникла ошибка: " & vbCrLf & err.Description, vbCritical, App.Title)
End Sub

Private Sub cmdFnd_Click()
  On Error Resume Next
  fnd.ShowForm
End Sub

Private Sub cmdMode_Click()
  On Error Resume Next
  Dim jset As Object 'MTZ_JSetup.Customizer
  Set jset = CreateObject("MTZ_JSetup.Customizer")
  jset.SwitchGridView gr
  Set jset = Nothing
End Sub

Private Sub cmdPrn_Click()
  On Error Resume Next
  Dim usedefault As Boolean
  Dim jset As Object 'MTZ_JSetup.Customizer

 
  Set jset = CreateObject("MTZ_JSetup.Customizer")
  jset.Preview gr, "Предварительный просмотр"
  Set jset = Nothing

End Sub

Private Sub cmdRef_Click()
  On Error Resume Next
  RefreshLog
End Sub


Private Sub cmdRun_Click()
On Error Resume Next
  Dim ri As Long
  Dim usedefault As Boolean
  Dim bRefresh As Boolean
  If gr.Row < 1 Then Exit Sub
  
  ri = gr.RowIndex(gr.Row)
  If ri < 1 Then Exit Sub
  
 
  gr_DblClick
  
End Sub




Private Sub Form_Resize()
On Error Resume Next
Usercontrol_resize
End Sub

Private Sub gr_DblClick()
  On Error Resume Next
  Dim ri As Long
  Dim o1 As Object
  Dim o2 As Object
  If gr.Row < 1 Then Exit Sub
  
  ri = gr.RowIndex(gr.Row)
  If ri < 1 Then Exit Sub
  On Error GoTo bye
  Dim usedefault As Boolean
    Set o1 = Manager.GetInstanceObject(RowInstanceID(ri), Session.site)
    Set o2 = Manager.GetInstanceGUI(o1.ID)
    o2.Show "", o1, True
 
bye:
  Set o1 = Nothing
  Set o2 = Nothing
End Sub



Private Sub gr_KeyDown(KeyCode As Integer, Shift As Integer)
  On Error Resume Next
  If KeyCode = vbKeyReturn And Shift = 0 Then
    gr_DblClick
    KeyCode = 0
  End If

End Sub

Private Sub gr_KeyPress(KeyAscii As Integer)
  If gr.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fnd.FindOnPress KeyAscii
End Sub

'Private Sub gr_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
'If Button = 2 And Shift = 0 Then
'  PopupMenu mnuPopup
'End If
'End Sub

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
    Values(i) = FieldMatrix(i, RowIndex)
  Next
  Bookmark = RowID(RowIndex)
End Sub



Private Sub RefreshTimer_Timer()
  
  If inRefreshTimer Then Exit Sub
  inRefreshTimer = True
  On Error Resume Next
  Dim cnt As Long
  
  Dim js As Long, idx As Long, i As Long, j As Long
  Dim rs As ADODB.Recordset
  
  
'  syslogid
'  changestamp
'  StartAt
'  Closed
'  the_Resource
'  LogStructID
'  LogInstanceID
'  Verb
'  Login
'  Family
'  Name
'  SurName
'  instname
'  ObjType
'  Caption
'  the_comment

  
  Dim NextCheckDate As Date
  Dim maybe As Boolean
  NextCheckDate = Session.GetServerTime()
  maybe = False
  If Session.IsORACLE Then
    Set rs = Session.GetRowsEx("V_Log", , , "ChangeStamp >=" & MakeORACLEDate(LastCheckDate) & " and ChangeStamp < " & MakeORACLEDate(NextCheckDate) & " ", " order by ChangeStamp")
  Else
    Set rs = Session.GetRowsEx("V_Log", , , "ChangeStamp >=" & MakeMSSQLDate(LastCheckDate) & " and ChangeStamp < " & MakeMSSQLDate(NextCheckDate) & " ", " order by ChangeStamp")
  End If
  If Not rs Is Nothing Then
    While Not rs.EOF
      RefreshOrAppendRow rs!syslogID
      maybe = True
      rs.MoveNext
    Wend
  End If
  rs.Close
  Set rs = Nothing
  
  LastCheckDate = NextCheckDate
  If maybe Then
    gr.RefreshGroups
    gr.RefreshSort
  End If
  inRefreshTimer = False
End Sub

Private Sub UserControl_Initialize()
  On Error Resume Next
  gr.ItemCount = 0
  gr.Columns.Clear
  Set fnd = Nothing
  Set fnd = CreateObject("MTZ_JSetup.GridFinder")
  fnd.Init gr
  LoadBtnPictures cmdCfg, cmdCfg.Tag
  LoadBtnPictures cmdPrn, cmdPrn.Tag
  LoadBtnPictures cmdRef, cmdRef.Tag
  LoadBtnPictures cmdFnd, cmdFnd.Tag
  LoadBtnPictures cmdMode, cmdMode.Tag
End Sub

Private Sub Usercontrol_resize()
On Error Resume Next
FrameTool.Top = 0
FrameTool.Left = 0
FrameTool.Width = Me.ScaleWidth
gr.Left = 0
gr.Top = FrameTool.Height
gr.Width = Me.ScaleWidth
gr.Height = Me.ScaleHeight - gr.Top
End Sub

Private Sub UserControl_Terminate()
  On Error Resume Next
  RefreshTimer.Enabled = False
  gr.ItemCount = 0
  Set fnd = Nothing
  Erase mvarFieldArray
End Sub


Private Sub mnuRef_click()
   menuAction = "REF"
   menuTimer.Enabled = True
End Sub
Private Sub mnuPrn_click()
   menuAction = "PRN"
   menuTimer.Enabled = True
End Sub
Private Sub mnuCfg_click()
   menuAction = "CFG"
   menuTimer.Enabled = True
End Sub
Private Sub mnuFind_click()
   menuAction = "FND"
   menuTimer.Enabled = True
End Sub
Private Sub mnuFilter_click()
   menuAction = "FLT"
   menuTimer.Enabled = True
End Sub



Public Sub RefreshOrAppendRow(ByVal RowID As String)
  Dim rs As Recordset
  Dim f As ADODB.Field
  
  Dim c As Collection
  Dim o As Variant
    
 
  Set rs = Session.GetRows("v_LOG", , , "syslogID='" & RowID & "'")
   
  
  If rs Is Nothing Then Exit Sub
  If rs.EOF Then Exit Sub
  Dim i As Long, RowNum As Long, cnt As Long
  cnt = gr.ItemCount
  
  RowNum = -1
  For i = 1 To RowCount
    If Left(RowID, 1) <> "{" Then RowID = "{" & RowID & "}"
    If UCase(FieldMatrix(-1, i)) = UCase(RowID) Then
      RowNum = i
      Exit For
    End If
  Next
  ' добавляем строку, если она новая
  If RowNum = -1 Then
      On Error Resume Next
      ReDim Preserve mvarFieldArray(-2 To gr.Columns.Count, 0 To cnt + 1)
      mvarFieldArray(-2, cnt + 1) = rs!LogInstanceID
      mvarFieldArray(-1, cnt + 1) = rs!syslogID
      mvarFieldArray(-0, cnt + 1) = "V_LOG"
      cnt = cnt + 1
      RowNum = cnt
  End If
  
  ' обновляем строку по номеру
  RefreshRowByNum RowNum
  If gr.ItemCount <> cnt Then
   gr.ItemCount = cnt
   fmTop = cnt
  End If
nxt:
  rs.Close
  Set rs = Nothing
End Sub






Public Sub RefreshRow(ByVal ID As String)
  On Error Resume Next
  Dim cnt As Long, RowNum As Long
  Dim idx As Long, i As Long, j As Long
  Dim pv As MTZMetaModel.PARTVIEW
  Dim rs As ADODB.Recordset
  
  
  RowNum = -1
  For i = 1 To RowCount
    If FieldMatrix(-1, i) = ID Then
      RowNum = i
      Exit For
    End If
  Next
  If RowNum = -1 Then Exit Sub
  RefreshRowByNum RowNum
End Sub


Private Sub RefreshRowByNum(ByVal RowNum As Long)
  On Error Resume Next
  Dim cnt As Long
  Dim js As Long, idx As Long, i As Long, j As Long
  Dim rs As ADODB.Recordset
 
  If RowNum < 0 Then Exit Sub
  
    Set rs = Session.GetRows("v_LOG", , , "syslogID='" & FieldMatrix(-1, RowNum) & "'")
    If Not rs Is Nothing Then
      If Not rs.EOF Then
        mvarFieldArray(-2, RowNum) = rs!LogInstanceID
        mvarFieldArray(-1, RowNum) = rs!syslogID
        mvarFieldArray(0, RowNum) = "V_LOG"
        mvarFieldArray(1, RowNum) = rs!Login & ""
        mvarFieldArray(2, RowNum) = rs!Family & ""
        mvarFieldArray(3, RowNum) = rs!Name & ""
        mvarFieldArray(4, RowNum) = rs!SurName & ""
        mvarFieldArray(5, RowNum) = rs!the_comment & ""
        mvarFieldArray(6, RowNum) = rs!instname & ""
        mvarFieldArray(7, RowNum) = rs!Caption & ""
        mvarFieldArray(8, RowNum) = rs!Verb & ""
        mvarFieldArray(9, RowNum) = rs!changestamp & ""
      End If
    End If
    rs.Close
    Set rs = Nothing
    gr.RefreshRowIndex RowNum
End Sub


Private Sub menuTimer_timer()
   menuTimer.Enabled = False
   If menuAction = "RUN" Then cmdRun_Click
   If menuAction = "REF" Then cmdRef_Click
   If menuAction = "PRN" Then cmdPrn_Click
   If menuAction = "CFG" Then cmdCfg_Click
   If menuAction = "FND" Then cmdFnd_Click
   menuAction = ""
End Sub

Private Sub Form_Load()
  UserControl_Initialize
  DTPicker2.Value = Now
  DTPicker1.Value = DateAdd("D", -1, Now)
  Init
  RefreshLog
End Sub
