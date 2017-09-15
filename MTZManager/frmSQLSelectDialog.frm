VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Begin VB.Form frmSQLSelectDialog 
   Caption         =   "Выбор записи"
   ClientHeight    =   3825
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8700
   Icon            =   "frmSQLSelectDialog.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   3825
   ScaleWidth      =   8700
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Отмена"
      Height          =   315
      Left            =   7500
      TabIndex        =   4
      Top             =   3480
      Width           =   1175
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   315
      Left            =   6300
      TabIndex        =   3
      Top             =   3480
      Width           =   1175
   End
   Begin VB.CommandButton cmdPrn 
      Height          =   330
      Left            =   390
      Style           =   1  'Graphical
      TabIndex        =   1
      Tag             =   "printpreview.ico"
      ToolTipText     =   "Печать"
      Top             =   3480
      Width           =   330
   End
   Begin VB.CommandButton cmdFind 
      Height          =   330
      Left            =   30
      Style           =   1  'Graphical
      TabIndex        =   0
      Tag             =   "find.ico"
      ToolTipText     =   "Поиск"
      Top             =   3480
      Width           =   330
   End
   Begin GridEX20.GridEX gr 
      Height          =   3375
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   8655
      _ExtentX        =   15266
      _ExtentY        =   5953
      Version         =   "2.0"
      AutomaticSort   =   -1  'True
      HoldSortSettings=   -1  'True
      BoundColumnIndex=   ""
      ReplaceColumnIndex=   ""
      TabKeyBehavior  =   1
      ColumnAutoResize=   -1  'True
      MethodHoldFields=   -1  'True
      AllowColumnDrag =   0   'False
      AllowEdit       =   0   'False
      GroupByBoxVisible=   0   'False
      DataMode        =   99
      ColumnHeaderHeight=   285
      IntProp1        =   0
      IntProp2        =   0
      IntProp7        =   0
      FormatStylesCount=   6
      FormatStyle(1)  =   "frmSQLSelectDialog.frx":0442
      FormatStyle(2)  =   "frmSQLSelectDialog.frx":0522
      FormatStyle(3)  =   "frmSQLSelectDialog.frx":067E
      FormatStyle(4)  =   "frmSQLSelectDialog.frx":072E
      FormatStyle(5)  =   "frmSQLSelectDialog.frx":07E2
      FormatStyle(6)  =   "frmSQLSelectDialog.frx":08BA
      ImageCount      =   0
      PrinterProperties=   "frmSQLSelectDialog.frx":0972
   End
End
Attribute VB_Name = "frmSQLSelectDialog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_HelpID = 395

Option Explicit
Public ok As Boolean
Attribute ok.VB_VarHelpID = 435
Public ID As String
Attribute ID.VB_VarHelpID = 425
Public Brief As String
Attribute Brief.VB_VarHelpID = 400

Private fnd As Object
Private IDFieldPos As Long

Public DataSource As Collection
Attribute DataSource.VB_VarHelpID = 415
Public DataColumns As Collection
Attribute DataColumns.VB_VarHelpID = 410
Private BriefColumns As Collection

Public IDFieldName As String
Attribute IDFieldName.VB_VarHelpID = 430
Public ErrorString As String
Attribute ErrorString.VB_VarHelpID = 420
Public BriefFields As String
Attribute BriefFields.VB_VarHelpID = 405

Public Permanent As Boolean
Attribute Permanent.VB_VarHelpID = 440

Private Sub cmdCancel_Click()
  ok = False
  Me.Hide
End Sub

Private Sub cmdOK_Click()
  On Error GoTo bye
  If gr.Row <= 0 Then Exit Sub
  If gr.RowIndex(gr.Row) <= 0 Then Exit Sub
  ok = True
  
  ID = DataSource.Item(gr.RowIndex(gr.Row))(IDFieldPos)
  Brief = GetBriefFieldsValues(DataSource.Item(gr.RowIndex(gr.Row)))
  Me.Hide
bye:
End Sub

Private Function GetBriefFieldsValues(nv As Variant) As String
  On Error Resume Next
  Dim res As String
  
  If (Not BriefColumns Is Nothing) Then
    If (BriefColumns.Count > 0) Then
      Dim i As Long
      For i = 1 To BriefColumns.Count
        If (res <> "") Then
          res = res & "; "
        End If
        res = res & nv(CLng(BriefColumns(i) - 1))
      Next
    End If
  End If
  
  GetBriefFieldsValues = res
End Function


Private Sub cmdPrn_Click()
On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gr, "Поиск"
Set jset = Nothing
End Sub


Private Sub cmdFind_Click()
  On Error Resume Next
  fnd.ShowForm
End Sub

'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'  Brief
'  BriefFields
'  DataColumns
'  DataSource
'  ErrorString
'  ID
'  IDFieldName
'  ok
'  Permanent
'Example:
' dim variable as Boolean
'  variable = me.ShowModal()
Public Function ShowModal() As Boolean
Attribute ShowModal.VB_HelpID = 445
  If (Not DataSource Is Nothing) Then
    If (DataSource.Count > 0) Then
      If (IDFieldName = "") Then
        ErrorString = "Не задано ключевое поле для выбора"
      End If
      If (BriefFields = "") Then
        ErrorString = "Не заданы поля для представления результатов"
      End If
    End If
  Else
    ErrorString = "Не задан истоник данных"
  End If
  If (ErrorString = vbNullString) Then
    Call LoadBriefIndexes
    If (Not Permanent) Then
      Me.Show vbModal
    Else
      If (DataSource.Count > 0) Then
        ID = DataSource.Item(1)(IDFieldPos)
        Brief = GetBriefFieldsValues(DataSource.Item(1))
      End If
      ok = True
    End If
    ShowModal = True
  Else
    ShowModal = False
  End If
End Function


Private Sub Form_Load()
  LoadBtnPictures cmdPrn, cmdPrn.Tag
  LoadBtnPictures cmdFind, cmdFind.Tag
 
  Dim i As Long
  gr.ItemCount = 0
  i = 0
  If (Not DataColumns Is Nothing) Then
    If (DataColumns.Count > 0) Then
      Dim nv As NamedValues
      Set nv = DataColumns.Item(1)
      For i = 1 To nv.Count
        If (nv.Item(i).TheName = IDFieldName) Then
          'IDFieldPos = i
          IDFieldPos = nv.Item(i).ValueSize
        End If
        If (nv.Item(i).ValueType <> adGUID) Then
          gr.Columns.Add(nv.Item(i).TheName).Tag = nv.Item(i).ValueSize
          'gr.Columns.Add(nv.Item(i).TheName).Tag = i
        End If
      Next
      gr.ItemCount = DataSource.Count
    End If
  End If
  Set fnd = Nothing
  Set fnd = CreateObject("MTZ_JSetup.GridFinder")
  fnd.Init gr
End Sub



Private Sub LoadBriefIndexes()
  Dim FldArr() As String
  Dim res As String
  FldArr = Split(BriefFields, ",")
  Dim i As Long
  Dim j As Long
  
  Set BriefColumns = New Collection
  For i = LBound(FldArr) To UBound(FldArr)
    Dim ColName As String
    ColName = UCase(FldArr(i))
    If (Not DataColumns Is Nothing) Then
    If (DataColumns.Count > 0) Then
    For j = 1 To DataColumns.Item(1).Count
        If (UCase(DataColumns.Item(1).Item(j).TheName) = ColName) Then
          Call BriefColumns.Add(j, ColName)
          Exit For
       End If
    Next
    End If
    End If
  Next
End Sub
  


Private Sub Form_Resize()
  On Error Resume Next
 
  gr.top = 0
  gr.Left = 0
  gr.Height = Me.ScaleHeight - cmdOK.Height - 120
  gr.Width = Me.ScaleWidth
 
  cmdFind.top = gr.Height + 60
  cmdPrn.top = cmdFind.top
  cmdOK.top = cmdFind.top
  cmdCancel.top = cmdFind.top
  
  cmdCancel.Left = Me.ScaleWidth - 60 - cmdCancel.Width
  cmdOK.Left = cmdCancel.Left - 30 - cmdOK.Width
End Sub

Private Sub Form_Unload(Cancel As Integer)
  Set DataSource = Nothing
End Sub

Private Sub gr_DblClick()
  Call cmdOK_Click
End Sub

Private Sub gr_KeyPress(KeyAscii As Integer)
  If gr.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fnd.FindOnPress KeyAscii
End Sub

Private Sub gr_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
  Dim i As Long
  Dim iPos As Long
   
  For i = 1 To gr.Columns.Count
    iPos = gr.Columns(i).Tag
    Values(i) = DataSource.Item(RowIndex)(iPos)   ' Item(gr.Columns.Item(i).Caption).Value
  Next
  Bookmark = DataSource.Item(RowIndex)(IDFieldPos)
End Sub
