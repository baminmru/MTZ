VERSION 5.00
Begin VB.Form frmChooseRole 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "”кажите вашу текущую роль"
   ClientHeight    =   1680
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   6030
   Icon            =   "frmChooseRole.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1680
   ScaleWidth      =   6030
   StartUpPosition =   2  'CenterScreen
   Begin VB.ListBox lstRole 
      Height          =   1425
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
Attribute VB_Name = "frmChooseRole"
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
If lstRole.ListIndex = -1 Then Exit Sub
OK = True
Me.Hide
End Sub
