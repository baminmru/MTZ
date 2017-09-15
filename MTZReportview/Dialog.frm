VERSION 5.00
Begin VB.Form Dialog 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Выбор принтера"
   ClientHeight    =   1185
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   6030
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1185
   ScaleWidth      =   6030
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.ComboBox cmbPrn 
      Height          =   315
      Left            =   210
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   525
      Width           =   4215
   End
   Begin VB.CommandButton CancelButton 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4680
      TabIndex        =   1
      Top             =   600
      Width           =   1215
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   4680
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "Выбор принтера"
      Height          =   300
      Left            =   210
      TabIndex        =   3
      Top             =   210
      Width           =   4200
   End
End
Attribute VB_Name = "Dialog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Public OK As Boolean

Private Sub CancelButton_Click()
OK = False
Me.Hide
End Sub

Private Sub Form_Load()
Dim p As Printer
cmbPrn.Clear
For Each p In Printers
cmbPrn.AddItem p.DeviceName
 
Next
If cmbPrn.ListCount > 0 Then
  cmbPrn.ListIndex = 0
End If

On Error Resume Next
cmbPrn.Text = GetSetting("RBH", App.EXEName, "LASTPRINTER", "")

End Sub

Private Sub OKButton_Click()
SaveSetting "RBH", App.EXEName, "LASTPRINTER", cmbPrn.Text
OK = True
Me.Hide
End Sub
