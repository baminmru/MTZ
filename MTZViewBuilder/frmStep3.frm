VERSION 5.00
Begin VB.Form frmStep3 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Сохранение представления"
   ClientHeight    =   3195
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   6030
   Icon            =   "frmStep3.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   6030
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer1 
      Interval        =   60000
      Left            =   3000
      Top             =   240
   End
   Begin VB.TextBox txtAlias 
      Height          =   285
      Left            =   240
      TabIndex        =   5
      Top             =   2160
      Width           =   5655
   End
   Begin VB.TextBox txtName 
      Height          =   285
      Left            =   240
      TabIndex        =   3
      Top             =   1200
      Width           =   5655
   End
   Begin VB.CommandButton CancelButton 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   1440
      TabIndex        =   1
      Top             =   120
      Width           =   1215
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label label2 
      Caption         =   "Псевдоним"
      Height          =   255
      Left            =   240
      TabIndex        =   4
      Top             =   1800
      Width           =   975
   End
   Begin VB.Label Label1 
      Caption         =   "Название представления"
      Height          =   255
      Left            =   240
      TabIndex        =   2
      Top             =   840
      Width           =   1815
   End
End
Attribute VB_Name = "frmStep3"
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

Private Sub OKButton_Click()
OK = True
Me.Hide
End Sub

Private Sub Timer1_Timer()
On Error Resume Next: session.Exec "SessionTouch", Nothing
End Sub
