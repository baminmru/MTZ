VERSION 5.00
Begin VB.Form frmNewPrc 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Новый процесс"
   ClientHeight    =   1800
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   6030
   Icon            =   "frmNewPrc.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1800
   ScaleWidth      =   6030
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtName 
      Height          =   285
      Left            =   120
      TabIndex        =   4
      Top             =   480
      Width           =   4335
   End
   Begin VB.ComboBox CmbType 
      Height          =   315
      Left            =   120
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   1320
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
   Begin VB.Label Label2 
      Caption         =   "Тип процесса"
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   960
      Width           =   3135
   End
   Begin VB.Label Label1 
      Caption         =   "Название"
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   120
      Width           =   2535
   End
End
Attribute VB_Name = "frmNewPrc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Public OK As Boolean
Public IDCol As Collection

Private Sub CancelButton_Click()
OK = False
Me.Hide

End Sub

Private Sub Form_Activate()
OK = False
End Sub

Private Sub Form_Load()
OK = False
CmbType.Clear
Set IDCol = New Collection
Dim rs As ADODB.Recordset
Set rs = Manager.ListInstances(Session.Site, "WFDef")
While Not rs.EOF
  CmbType.AddItem rs!Name
  Set Def = Manager.GetInstanceObject(rs!InstanceID)
  IDCol.Add Def, rs!InstanceID
  rs.MoveNext
Wend
rs.Close
Set rs = Nothing
End Sub

Private Sub OKButton_Click()
OK = True
Me.Hide

End Sub
