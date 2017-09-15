VERSION 5.00
Begin VB.Form frmJouralList 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "Выбор журнала"
   ClientHeight    =   3195
   ClientLeft      =   2775
   ClientTop       =   3720
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
      Left            =   30
      Sorted          =   -1  'True
      TabIndex        =   2
      Top             =   30
      Width           =   4605
   End
   Begin VB.CommandButton CancelButton 
      Cancel          =   -1  'True
      Caption         =   "Отмена"
      Height          =   315
      Left            =   4680
      TabIndex        =   1
      Top             =   510
      Width           =   1175
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   315
      Left            =   4680
      TabIndex        =   0
      Top             =   120
      Width           =   1175
   End
End
Attribute VB_Name = "frmJouralList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Public OK As Boolean
Public model As MTZMetaModel.Application
Public Result As String
Dim jcl As Collection

Private Sub CancelButton_Click()
OK = False
Me.Hide
End Sub

Private Sub Form_Activate()
  lstJournal.Clear
  Set jcl = New Collection
  OK = False
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
  If (lstJournal.ListCount > 0) Then
    lstJournal.ListIndex = 0
  End If
  
  Call Form_Resize
End Sub

Private Sub Form_Resize()
  On Error Resume Next
  lstJournal.Top = 30
  lstJournal.Left = 30
  lstJournal.Height = Me.ScaleHeight
  lstJournal.Width = Me.ScaleWidth - 100 - OKButton.Width
  
  OKButton.Top = 50
  OKButton.Left = Me.ScaleWidth - 50 - OKButton.Width
  
  CancelButton.Left = OKButton.Left
  CancelButton.Top = OKButton.Top + 50 + OKButton.Height
  
End Sub

Private Sub lstJournal_DblClick()
OKButton_Click
End Sub

Private Sub OKButton_Click()
If lstJournal.ListIndex >= 0 Then
  OK = True
  Result = jcl.item(lstJournal.ItemData(lstJournal.ListIndex)).ID
  Set jcl = Nothing
  Me.Hide
End If
End Sub
