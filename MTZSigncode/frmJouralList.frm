VERSION 5.00
Begin VB.Form frmJouralList 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Выбор журнала"
   ClientHeight    =   3195
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   6030
   Icon            =   "frmJouralList.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   6030
   ShowInTaskbar   =   0   'False
   Begin VB.ListBox lstJournal 
      Height          =   2985
      Left            =   120
      Sorted          =   -1  'True
      TabIndex        =   2
      Top             =   120
      Width           =   4455
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
Attribute VB_Name = "frmJouralList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Public ok As Boolean
Public model As MTZMetaModel.Application
Public Result As String
Dim jcl As Collection

Private Sub CancelButton_Click()
ok = False
Me.Hide
End Sub

Private Sub Form_Activate()
  lstJournal.Clear
  Set jcl = New Collection
  ok = False
  Dim i As Long
  Dim rs As ADODB.Recordset
  Set rs = model.Manager.ListInstances("", "MTZJrnl")
  If rs Is Nothing Then Exit Sub
  Dim ti As tmpInst
  While Not rs.EOF
    Set ti = New tmpInst
    ti.ID = rs!InstanceID
    ti.Name = rs!Name
    jcl.Add ti, ti.ID
    
    lstJournal.AddItem ti.Name
    lstJournal.ItemData(lstJournal.NewIndex) = jcl.Count
    rs.MoveNext
  Wend
  Set rs = Nothing
End Sub

Private Sub lstJournal_DblClick()
OKButton_Click
End Sub

Private Sub OKButton_Click()
If lstJournal.ListIndex >= 0 Then
  ok = True
  Result = jcl.item(lstJournal.ItemData(lstJournal.ListIndex)).ID
  Set jcl = Nothing
  Me.Hide
End If
End Sub
