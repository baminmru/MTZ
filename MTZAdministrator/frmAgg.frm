VERSION 5.00
Begin VB.Form frmAgg 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Вариант агрегации"
   ClientHeight    =   2985
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   6030
   Icon            =   "frmAgg.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2985
   ScaleWidth      =   6030
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.ListBox lstAgg 
      Height          =   2985
      ItemData        =   "frmAgg.frx":0442
      Left            =   30
      List            =   "frmAgg.frx":0455
      TabIndex        =   0
      Top             =   0
      Width           =   4785
   End
   Begin VB.CommandButton CancelButton 
      Cancel          =   -1  'True
      Caption         =   "Отмена"
      Height          =   315
      Left            =   4860
      TabIndex        =   2
      Top             =   390
      Width           =   1175
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   315
      Left            =   4860
      TabIndex        =   1
      Top             =   30
      Width           =   1175
   End
End
Attribute VB_Name = "frmAgg"
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
  lstAgg.ListIndex = 0
End Sub

Private Sub OKButton_Click()
  OK = True
  Me.Hide

End Sub
