VERSION 5.00
Object = "{BB95CD0C-5138-4A76-AF3C-30EFB10D1594}#8.5#0"; "MTZJournal.ocx"
Begin VB.Form frmJournalShow 
   ClientHeight    =   4995
   ClientLeft      =   165
   ClientTop       =   450
   ClientWidth     =   7560
   Icon            =   "frmJournalShow.frx":0000
   LinkTopic       =   "Form3"
   ScaleHeight     =   4995
   ScaleWidth      =   7560
   StartUpPosition =   3  'Windows Default
   Begin MTZJournal.JournalView jv 
      Height          =   4215
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   6855
      _ExtentX        =   12091
      _ExtentY        =   7435
   End
End
Attribute VB_Name = "frmJournalShow"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Resize()
  On Error Resume Next
  jv.Top = 0
  jv.Left = 0
  jv.Width = Me.ScaleWidth
  jv.Height = Me.ScaleHeight
End Sub
