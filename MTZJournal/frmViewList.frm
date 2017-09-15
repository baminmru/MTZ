VERSION 5.00
Begin VB.Form frmViewList 
   Caption         =   "Выберите представление"
   ClientHeight    =   3075
   ClientLeft      =   2775
   ClientTop       =   3765
   ClientWidth     =   6030
   Icon            =   "frmViewList.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   3075
   ScaleWidth      =   6030
   Begin VB.ListBox lstView 
      Height          =   2985
      Left            =   30
      Sorted          =   -1  'True
      TabIndex        =   2
      Top             =   30
      Width           =   4605
   End
   Begin VB.CommandButton CancelButton 
      Caption         =   "Отмена"
      Height          =   315
      Left            =   4740
      TabIndex        =   1
      Top             =   480
      Width           =   1185
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Height          =   315
      Left            =   4740
      TabIndex        =   0
      Top             =   90
      Width           =   1185
   End
End
Attribute VB_Name = "frmViewList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Public OK As Boolean
Public model As MTZMetaModel.Application
Public Result As String
Dim ids As Collection
Dim rs As Recordset

Private Sub CancelButton_Click()
OK = False
Me.Hide
Set ids = Nothing
Set model = Nothing
End Sub

Private Sub Form_Activate()
  lstView.Clear
  OK = False
  Dim i As Long
  Dim idh As idholder
  Set ids = New Collection
  Dim qry As String
  ' DENISK approved
  qry = "Select ObjectType.name as ObjectTypeName, PartView.PartViewID, PartView.Name as PartViewName, Part.Name as PartName, Part.Caption from PartView join Part on Part.PartId=PartView.ParentStructRowID join ObjectType on ObjectType.ObjectTypeID = Part.ParentStructRowID ORDER BY ObjectTypeName, Part.Name"
  
  Set rs = model.MTZSession.GetData(qry)  ' GetRows("PartView")
  While Not rs.EOF
    Set idh = New idholder
    idh.ID = rs!PartViewID
    ids.Add idh
    lstView.AddItem "[" & rs!ObjectTypeName & "] " & "[" & rs!PartName & "] " & rs!PartViewName
    lstView.ItemData(lstView.NewIndex) = ids.Count
    rs.MoveNext
  Wend
  rs.Close
  Set rs = Nothing
  Call Form_Resize
End Sub

Private Sub Form_Resize()
  On Error Resume Next
  lstView.Top = 0
  lstView.Left = 0
  lstView.Height = Me.ScaleHeight
  lstView.Width = Me.ScaleWidth - OKButton.Width - 40
  
  OKButton.Left = Me.ScaleWidth - OKButton.Width - 20
  CancelButton.Left = OKButton.Left
End Sub

Private Sub OKButton_Click()
  If lstView.ListIndex >= 0 Then
    OK = True
    Result = ids.Item(lstView.ItemData(lstView.ListIndex)).ID
    Me.Hide
  End If
  Set ids = Nothing
  Set model = Nothing
End Sub

