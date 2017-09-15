VERSION 5.00
Begin VB.MDIForm MDIForm1 
   BackColor       =   &H8000000C&
   Caption         =   "MDIForm1"
   ClientHeight    =   3195
   ClientLeft      =   165
   ClientTop       =   855
   ClientWidth     =   4680
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   Begin VB.Menu mnuFile 
      Caption         =   "File"
      Begin VB.Menu mnuAll 
         Caption         =   "All"
      End
      Begin VB.Menu mnuf1 
         Caption         =   "form1"
      End
      Begin VB.Menu mnuf2 
         Caption         =   "form2"
      End
      Begin VB.Menu mnuf3 
         Caption         =   "form3"
      End
      Begin VB.Menu mnuf4 
         Caption         =   "form4"
      End
   End
End
Attribute VB_Name = "MDIForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub mnuAll_Click()
  Form1.Show
  Form2.Show
  Form3.Show
  Form4.Show
End Sub

Private Sub mnuf1_Click()
Form1.Show
End Sub

Private Sub mnuf2_Click()
Form2.Show
End Sub

Private Sub mnuf3_Click()
Form3.Show
End Sub

Private Sub mnuf4_Click()
Form4.Show
End Sub
