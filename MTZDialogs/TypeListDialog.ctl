VERSION 5.00
Begin VB.UserControl TypeListDialog 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.ListBox cmbType 
      Height          =   2790
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   4455
   End
End
Attribute VB_Name = "TypeListDialog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Public TypeName As String
Public site As String
Public Runner As Main
Public ok As Boolean
Private ID  As String
Public NewObject  As Object
Private types As Collection






Private Sub CancelButton_Click()
ok = False
Set Runner = Nothing
Set types = Nothing
Me.Hide

End Sub


Private Sub Form_Load()
  Dim rs As ADODB.Recordset, i
  Dim n As String, tn As String
  
  Set rs = Runner.Sessions.Item(site).GetRows("OBJECTTYPE")
  
  Dim o As tmpInst
  Set types = New Collection
  i = 0
  While Not rs.EOF
      i = i + 1
      Set o = New tmpInst
      o.Name = rs!comment
      o.ObjType = rs!Name
      o.IsSingle = rs!IsSingleInstance
      types.Add o
      cmbType.AddItem o.Name
      cmbType.ItemData(cmbType.NewIndex) = i
      rs.MoveNext
  Wend
  Set rs = Nothing
  
  If cmbType.ListCount > 0 Then
    cmbType.ListIndex = 0
  End If
  
End Sub

Private Sub OKButton_Click()
  On Error GoTo bye
  If cmbType.ListIndex = -1 Then Exit Sub
  ID = CreateGUID2()
  If Runner.NewInstance(ID, types.Item(cmbType.ItemData(cmbType.ListIndex)).ObjType, types.Item(cmbType.ItemData(cmbType.ListIndex)).ObjType & " " & Now, site) Then
    Set NewObject = Runner.GetInstanceGUI(ID, site)
    If Not NewObject Is Nothing Then
      ok = True
      Set Runner = Nothing
      Set types = Nothing
      Me.Hide
    End If
  End If
bye:
End Sub

