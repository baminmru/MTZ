VERSION 5.00
Begin VB.Form fmZoom 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Масштаб"
   ClientHeight    =   1290
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   3075
   Icon            =   "fmZoom.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1290
   ScaleWidth      =   3075
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtZoom 
      Height          =   315
      Left            =   1200
      TabIndex        =   0
      Top             =   180
      Width           =   1515
   End
   Begin VB.CommandButton CancelButton 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   375
      Left            =   1680
      TabIndex        =   2
      Top             =   780
      Width           =   1215
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   180
      TabIndex        =   1
      Top             =   780
      Width           =   1215
   End
   Begin VB.Label Label2 
      Caption         =   "%"
      Height          =   255
      Left            =   2760
      TabIndex        =   4
      Top             =   240
      Width           =   255
   End
   Begin VB.Label Label1 
      Caption         =   "Увеличение:"
      Height          =   195
      Left            =   135
      TabIndex        =   3
      Top             =   255
      Width           =   975
   End
End
Attribute VB_Name = "fmZoom"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Public CurScale As Double
Public OkClicked As Boolean

Private Sub CancelButton_Click()
    Me.Hide
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    'If KeyAscii = 27 Then Cancel_Click
End Sub

Private Sub Form_Load()
    txtZoom.Text = Trim(Str(CurScale * 100))
    OkClicked = False
End Sub

Private Sub OKButton_Click()
On Error GoTo bye:
    CurScale = CDbl(Replace(txtZoom.Text, ".", ",")) / 100
    If CurScale > 0 Then OkClicked = True: Me.Hide
bye:
End Sub

Private Sub txtZoom_GotFocus()
    txtZoom.SelStart = 0
    txtZoom.SelLength = Len(txtZoom.Text)
End Sub

Private Sub txtZoom_Validate(Cancel As Boolean)
Cancel = True
On Error GoTo bye:
    If CDbl(Replace(txtZoom.Text, ".", ",")) > 0 Then Cancel = False
bye:
End Sub
