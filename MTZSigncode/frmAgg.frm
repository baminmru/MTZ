VERSION 5.00
Begin VB.Form frmAgg 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Вариант агрегации"
   ClientHeight    =   3195
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   6030
   Icon            =   "frmAgg.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   6030
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.ListBox lstAgg 
      Height          =   2790
      ItemData        =   "frmAgg.frx":0442
      Left            =   120
      List            =   "frmAgg.frx":0455
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
