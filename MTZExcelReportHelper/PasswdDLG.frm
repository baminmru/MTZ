VERSION 5.00
Begin VB.Form PasswordDLG 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Data Base login"
   ClientHeight    =   1665
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   4320
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1665
   ScaleWidth      =   4320
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox Text2 
      Height          =   285
      IMEMode         =   3  'DISABLE
      Left            =   1560
      PasswordChar    =   "*"
      TabIndex        =   1
      Top             =   720
      Width           =   2655
   End
   Begin VB.TextBox Text1 
      Height          =   315
      Left            =   1560
      TabIndex        =   0
      Top             =   240
      Width           =   2655
   End
   Begin VB.CommandButton CancelButton 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3000
      TabIndex        =   3
      Top             =   1200
      Width           =   1215
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   1560
      TabIndex        =   2
      Top             =   1200
      Width           =   1215
   End
   Begin VB.Label Label2 
      Caption         =   "Password:"
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   720
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "Name:"
      Height          =   255
      Left            =   120
      TabIndex        =   4
      Top             =   240
      Width           =   1335
   End
End
Attribute VB_Name = "PasswordDLG"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Public isOk As Boolean
Public login As String
Public pwd As String

Private Sub CancelButton_Click()
    Me.Hide
End Sub

Private Sub Form_Load()
    isOk = False
End Sub

Private Sub OKButton_Click()
    isOk = True
    login = Text1.Text
    pwd = Text2.Text
    Me.Hide
End Sub
