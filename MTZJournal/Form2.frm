VERSION 5.00
Object = "{BB95CD0C-5138-4A76-AF3C-30EFB10D1594}#3.2#0"; "MTZJournal.ocx"
Begin VB.Form Form2 
   Caption         =   "Form2"
   ClientHeight    =   3735
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   5535
   LinkTopic       =   "Form2"
   ScaleHeight     =   3735
   ScaleWidth      =   5535
   StartUpPosition =   3  'Windows Default
   Begin MTZJournal.JournalView JournalView1 
      Height          =   2895
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4455
      _ExtentX        =   7858
      _ExtentY        =   5106
   End
   Begin VB.Menu mnuRefresh 
      Caption         =   "Refresh"
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Resize()
If Me.WindowState <> 1 Then
    JournalView1.Left = 0
    JournalView1.Top = 0
    JournalView1.Width = Me.ScaleWidth
    JournalView1.Height = Me.ScaleHeight
  End If
End Sub

Private Sub mnuRefresh_Click()
  JournalView1.Refresh
End Sub
