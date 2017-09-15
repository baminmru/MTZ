VERSION 5.00
Begin VB.Form frmAppDel 
   Caption         =   "Удалить приложение"
   ClientHeight    =   3045
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5895
   Icon            =   "frmAppDel.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   3045
   ScaleWidth      =   5895
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   315
      Left            =   4740
      TabIndex        =   1
      Top             =   60
      Width           =   1175
   End
   Begin VB.CommandButton CancelButton 
      Cancel          =   -1  'True
      Caption         =   "Отмена"
      Height          =   315
      Left            =   4740
      TabIndex        =   2
      Top             =   420
      Width           =   1175
   End
   Begin VB.ListBox lstJournal 
      Height          =   2985
      Left            =   0
      Sorted          =   -1  'True
      TabIndex        =   0
      Top             =   0
      Width           =   4695
   End
End
Attribute VB_Name = "frmAppDel"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Public OK As Boolean
Public model As MTZMetaModel.Application
Public Result As Object

Private Sub CancelButton_Click()
OK = False
Me.Hide
End Sub

Private Sub Form_Activate()
  lstJournal.Clear
  OK = False
  Dim i As Long
  model.MTZAPP.Refresh
  For i = 1 To model.MTZAPP.Count
    lstJournal.AddItem model.MTZAPP.item(i).Name
    lstJournal.ItemData(lstJournal.NewIndex) = i
  Next
  If (lstJournal.ListCount > 0) Then
    lstJournal.ListIndex = 0
  End If
  Call Form_Resize
End Sub

Private Sub Form_Resize()
  On Error Resume Next
  lstJournal.Top = 30
  lstJournal.Left = 30
  lstJournal.Height = Me.ScaleHeight
  lstJournal.Width = Me.ScaleWidth - 100 - OKButton.Width
  
  OKButton.Top = 50
  OKButton.Left = Me.ScaleWidth - 50 - OKButton.Width
  
  CancelButton.Left = OKButton.Left
  CancelButton.Top = OKButton.Top + 50 + OKButton.Height
End Sub

Private Sub OKButton_Click()
  If lstJournal.ListIndex >= 0 Then
    OK = True
    Set Result = model.MTZAPP.item(lstJournal.ItemData(lstJournal.ListIndex))
    Me.Hide
  End If
End Sub


Private Sub lstJournal_DblClick()
OKButton_Click
End Sub


