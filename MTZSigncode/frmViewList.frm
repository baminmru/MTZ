VERSION 5.00
Begin VB.Form frmViewList 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Select View"
   ClientHeight    =   3075
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   6030
   Icon            =   "frmViewList.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3075
   ScaleWidth      =   6030
   ShowInTaskbar   =   0   'False
   Begin VB.ListBox lstView 
      Height          =   2790
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   4335
   End
   Begin VB.CommandButton CancelButton 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4680
      TabIndex        =   1
      Top             =   600
      Width           =   1215
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Height          =   375
      Left            =   4680
      TabIndex        =   0
      Top             =   120
      Width           =   1215
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
End Sub

Private Sub Form_Activate()
  lstView.Clear
  OK = False
  Dim i As Long
  Dim idh As idholder
  Set ids = New Collection
  Set rs = model.MTZSession.GetRows("PartView")
  While Not rs.EOF
    lstView.AddItem rs!Name
    Set idh = New idholder
    idh.ID = rs!PartViewID
    ids.Add idh
    rs.MoveNext
  Wend
  rs.Close
  Set rs = Nothing
End Sub

Private Sub OKButton_Click()
  If lstView.ListIndex >= 0 Then
    OK = True
    Result = ids.Item(lstView.ListIndex + 1).ID
    Me.Hide
  End If
End Sub

