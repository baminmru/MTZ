VERSION 5.00
Begin VB.Form frmAppDel 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Удалить приложение"
   ClientHeight    =   3075
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5895
   Icon            =   "frmAppDel.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3075
   ScaleWidth      =   5895
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Height          =   375
      Left            =   4560
      TabIndex        =   2
      Top             =   0
      Width           =   1215
   End
   Begin VB.CommandButton CancelButton 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4560
      TabIndex        =   1
      Top             =   480
      Width           =   1215
   End
   Begin VB.ListBox lstJournal 
      Height          =   2985
      Left            =   0
      Sorted          =   -1  'True
      TabIndex        =   0
      Top             =   0
      Width           =   4455
   End
End
Attribute VB_Name = "frmAppDel"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Public ok As Boolean
Public model As MTZMetaModel.Application
Public Result As Object

Private Sub CancelButton_Click()
ok = False
Me.Hide
End Sub

Private Sub Form_Activate()
  lstJournal.Clear
  ok = False
  Dim i As Long
  model.MTZAPP.Refresh
  For i = 1 To model.MTZAPP.Count
    lstJournal.AddItem model.MTZAPP.item(i).Name
    lstJournal.ItemData(lstJournal.NewIndex) = i
    
  Next
End Sub

Private Sub OKButton_Click()
  If lstJournal.ListIndex >= 0 Then
    ok = True
    Set Result = model.MTZAPP.item(lstJournal.ItemData(lstJournal.ListIndex))
    Me.Hide
  End If
End Sub


Private Sub lstJournal_DblClick()
OKButton_Click
End Sub


