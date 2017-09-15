VERSION 5.00
Begin VB.Form frmJouralList 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Выбор журнала"
   ClientHeight    =   3195
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   6030
   Icon            =   "frmJouralList.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   6030
   ShowInTaskbar   =   0   'False
   Begin VB.ListBox lstJournal 
      Height          =   2985
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
Attribute VB_Name = "frmJouralList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Public OK As Boolean
Public model As MTZMetaModel.Application
Public Result As String

Private Sub CancelButton_Click()
OK = False
Me.Hide
End Sub

Private Sub Form_Activate()
  lstJournal.Clear
  OK = False
  Dim i As Long
  For i = 1 To model.Jounal.Count
    lstJournal.AddItem model.Jounal.Item(i).Name
    lstJournal.ItemData(lstJournal.NewIndex) = i
  Next
End Sub

Private Sub lstJournal_DblClick()
OKButton_Click
End Sub

Private Sub OKButton_Click()
If lstJournal.ListIndex >= 0 Then
  OK = True
  Result = model.Jounal.Item(lstJournal.ItemData(lstJournal.ListIndex)).id
  Me.Hide
End If
End Sub
