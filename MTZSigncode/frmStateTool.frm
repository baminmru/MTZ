VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Begin VB.Form frmStateTool 
   Caption         =   "Настройка матрицыпереходов"
   ClientHeight    =   4770
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8190
   Icon            =   "frmStateTool.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   4770
   ScaleWidth      =   8190
   Begin VB.CommandButton cmdIDs 
      Caption         =   "Идентификаторы "
      Height          =   375
      Left            =   6510
      TabIndex        =   4
      Top             =   330
      Width           =   1470
   End
   Begin VB.ComboBox cmbTypes 
      Height          =   315
      Left            =   150
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   345
      Width           =   4335
   End
   Begin VB.CommandButton cmdSave 
      Caption         =   "Сохранить"
      Height          =   405
      Left            =   4560
      TabIndex        =   1
      Top             =   300
      Width           =   1845
   End
   Begin GridEX20.GridEX gr 
      Height          =   3810
      Left            =   165
      TabIndex        =   0
      Top             =   840
      Width           =   7830
      _ExtentX        =   13811
      _ExtentY        =   6720
      Version         =   "2.0"
      BoundColumnIndex=   ""
      ReplaceColumnIndex=   ""
      UseEvenOddColor =   -1  'True
      MethodHoldFields=   -1  'True
      SelectionStyle  =   1
      AllowColumnDrag =   0   'False
      GroupByBoxVisible=   0   'False
      DataMode        =   99
      ColumnHeaderHeight=   285
      FrozenColumns   =   1
      IntProp1        =   0
      IntProp2        =   0
      IntProp7        =   0
      ColumnsCount    =   2
      Column(1)       =   "frmStateTool.frx":030A
      Column(2)       =   "frmStateTool.frx":048A
      FormatStylesCount=   6
      FormatStyle(1)  =   "frmStateTool.frx":052E
      FormatStyle(2)  =   "frmStateTool.frx":068A
      FormatStyle(3)  =   "frmStateTool.frx":073A
      FormatStyle(4)  =   "frmStateTool.frx":07EE
      FormatStyle(5)  =   "frmStateTool.frx":08C6
      FormatStyle(6)  =   "frmStateTool.frx":097E
      ImageCount      =   0
      PrinterProperties=   "frmStateTool.frx":0A5E
   End
   Begin VB.Label Label1 
      Caption         =   "Тип объекта"
      Height          =   240
      Left            =   195
      TabIndex        =   3
      Top             =   75
      Width           =   4185
   End
End
Attribute VB_Name = "frmStateTool"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Dim ot As OBJECTTYPE
Dim Data() As Variant

Private Sub Init()
  Dim i As Integer, j As Long
  Dim col As JSColumn
  gr.ItemCount = 0
  Erase Data
  gr.Columns.Clear
  Set col = gr.Columns.Add("Переход Из \ В", jgexText, jgexEditNone)
  col.Selectable = False
  gr.FrozenColumns = 1
  ot.OBJSTATUS.Sort = "Name"
  
  'Add columns
  For i = 1 To ot.OBJSTATUS.Count
    Set col = gr.Columns.Add(ot.OBJSTATUS.item(i).Name, jgexText, jgexEditDropDown)
    'Set col = gr.Columns.Add(ot.OBJSTATUS.item(i).Name, jgexCheckBox, jgexEditCheckBox)
    col.AutoSize
    col.HasValueList = True
    Call col.ValueList.Add(-1, "Есть")
    Call col.ValueList.Add(0, "-")
    col.Selectable = True
    'col.EditType = jgexEditDropDown
  Next

  ' Add rows
  ReDim Data(0 To ot.OBJSTATUS.Count, 0 To ot.OBJSTATUS.Count)
  Data(0, 0) = "Переход Из \ В"
  For i = 1 To ot.OBJSTATUS.Count
    Data(0, i) = ot.OBJSTATUS.item(i).Name
    Data(i, 0) = ot.OBJSTATUS.item(i).Name
    For j = 1 To ot.OBJSTATUS.Count
       Data(i, j) = AllowJump(i, j)
    Next
  Next
  
  
  gr.ItemCount = ot.OBJSTATUS.Count
  gr.Columns.item(1).AutoSize
  
End Sub


Private Function AllowJump(ByVal i As Integer, ByVal j As Integer) As Integer
Dim o1 As OBJSTATUS, o2 As OBJSTATUS
Set o1 = ot.OBJSTATUS.item(i)
Set o2 = ot.OBJSTATUS.item(j)
AllowJump = 0
Dim k As Integer
For k = 1 To o1.NEXTSTATE.Count
  If o1.NEXTSTATE.item(k).TheState.ID = o2.ID Then
    AllowJump = -1
    Exit Function
  End If
Next
End Function



Private Sub cmbTypes_Click()
 If cmbTypes.ListIndex >= 0 Then
    Set ot = model.OBJECTTYPE.item(cmbTypes.ListIndex + 1)
    Init
  End If
End Sub

Private Sub cmdIDs_Click()
  Set ot = model.OBJECTTYPE.item(cmbTypes.ListIndex + 1)
  Dim ots As OBJSTATUS
  Dim i As Long, s As String
  s = "' состояния для типа:" & ot.Name & " " & Replace(ot.the_comment, vbCrLf, " ")
  For i = 1 To ot.OBJSTATUS.Count
    Set ots = ot.OBJSTATUS.item(i)
    s = s & vbCrLf & "' """ & ots.ID & """ '" & ots.Name & " " & Replace(ots.the_comment, vbCrLf, " ")
  Next
  Clipboard.SetText s
  MsgBox "Список идентификаторов помещен в буфер обмена", vbOKOnly, "Идентификаторы состояний"
End Sub

Private Sub cmdSave_Click()
  If ot Is Nothing Then Exit Sub
  On Error GoTo bye
  Dim o1 As OBJSTATUS, i As Integer
  
  For i = 1 To ot.OBJSTATUS.Count
    Set o1 = ot.OBJSTATUS.item(i)
    While o1.NEXTSTATE.Count > 0
      o1.NEXTSTATE.Delete 1
    Wend
    o1.NEXTSTATE.Refresh
    
    Dim k As Integer
    For k = 1 To ot.OBJSTATUS.Count
      Debug.Print i, k, Data(i, k)
      
      If Data(i, k) = -1 Then
        With o1.NEXTSTATE.Add
          Set .TheState = ot.OBJSTATUS.item(k)
          .Save
        End With
      End If
    Next
  Next
  Exit Sub
bye:
MsgBox Err.Description
End Sub

Private Sub Form_Load()
  gr.Columns.Clear
  gr.ItemCount = 0
  cmbTypes.Clear
  Dim i As Long
  model.OBJECTTYPE.Sort = "Comment"
  For i = 1 To model.OBJECTTYPE.Count
  cmbTypes.AddItem model.OBJECTTYPE.item(i).the_comment
  Next
  
End Sub

Private Sub Form_Resize()
  On Error Resume Next
  gr.Width = Me.ScaleWidth - 2 * gr.Left
  gr.Height = Me.ScaleHeight - gr.Top - gr.Left
End Sub

Private Sub gr_AfterColEdit(ByVal ColIndex As Integer)
gr.Update
End Sub

Private Sub gr_AfterUpdate()
gr.Update
End Sub

Private Sub gr_ListSelected(ByVal ColIndex As Integer, ByVal ValueListIndex As Long, ByVal Value As Variant)
Data(gr.Row, ColIndex - 1) = gr.Columns.item(ColIndex).ValueList.item(ValueListIndex).Value
End Sub

Private Sub gr_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
   Dim j As Long
   On Error Resume Next
   For j = 0 To ot.OBJSTATUS.Count
        Values(j + 1) = Data(RowIndex, j)
   Next
End Sub

Private Sub gr_UnboundUpdate(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
  Dim i As Long, j As Long
  
'  For i = 1 To ot.OBJSTATUS.Count
'     Data(RowIndex, i) = Values(i + 1)
'     If Values(i + 1) = -1 Then
'      Debug.Print RowIndex, i, Data(RowIndex, i)
'     End If
'  Next

  
End Sub

