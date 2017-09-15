VERSION 5.00
Begin VB.Form frmJColumn 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Определение колонки данных"
   ClientHeight    =   3615
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   5985
   Icon            =   "frmJColumn.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3615
   ScaleWidth      =   5985
   ShowInTaskbar   =   0   'False
   Begin MTZJournal.ctlJournalColumn JournalColumn1 
      Height          =   3555
      Left            =   30
      TabIndex        =   2
      Top             =   30
      Width           =   4545
      _extentx        =   7858
      _extenty        =   5530
   End
   Begin VB.CommandButton CancelButton 
      Caption         =   "Отмена"
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
Attribute VB_Name = "frmJColumn"
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
  JournalColumn1.Save
  Me.Hide
End Sub
