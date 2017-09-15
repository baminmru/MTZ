VERSION 5.00
Begin VB.Form Form3 
   Caption         =   "Form3"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form3"
   MDIChild        =   -1  'True
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   Begin VB.OLE OLE1 
      Class           =   "Excel.Sheet.8"
      Height          =   2055
      Left            =   210
      OleObjectBlob   =   "Form3.frx":0000
      TabIndex        =   0
      Top             =   330
      Width           =   3495
   End
End
Attribute VB_Name = "Form3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit





Private Sub Form_Load()
OLE1.Action = 7
DoEvents
End Sub

Private Sub Form_Resize()
  On Error Resume Next
  OLE1.Top = 0
  OLE1.Left = 0
  OLE1.Width = Me.ScaleWidth
  OLE1.Height = Me.ScaleHeight - OLE1.Top
End Sub

