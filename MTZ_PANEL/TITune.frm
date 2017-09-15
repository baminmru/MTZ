VERSION 5.00
Begin VB.Form TITune 
   Caption         =   "Настройка порядка обхода"
   ClientHeight    =   3030
   ClientLeft      =   2775
   ClientTop       =   3765
   ClientWidth     =   5955
   Icon            =   "TITune.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   3030
   ScaleWidth      =   5955
   Begin VB.ListBox lstSelected 
      Height          =   2985
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   4620
   End
   Begin VB.CommandButton cmdUp 
      Height          =   435
      Left            =   4710
      Picture         =   "TITune.frx":0442
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   870
      Width           =   435
   End
   Begin VB.CommandButton cmdDown 
      Height          =   435
      Left            =   4710
      Picture         =   "TITune.frx":0544
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   1350
      Width           =   435
   End
   Begin VB.CommandButton CancelButton 
      Cancel          =   -1  'True
      Caption         =   "Отмена"
      Height          =   315
      Left            =   4680
      TabIndex        =   2
      Top             =   420
      Width           =   1185
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   315
      Left            =   4680
      TabIndex        =   1
      Top             =   60
      Width           =   1185
   End
End
Attribute VB_Name = "TITune"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_HelpID = 485
Option Explicit
'окно настройки порядка обхода контролов

Public OK As Boolean
Attribute OK.VB_VarHelpID = 490


Private Sub CancelButton_Click()
Me.Hide
End Sub

Private Sub cmdUp_Click()
  On Error Resume Next
  Dim nItem As Integer
  
  With lstSelected
    If .ListIndex < 0 Then Exit Sub
    nItem = .ListIndex
    If nItem = 0 Then Exit Sub  'can't move 1st item up
    'move item up
    .AddItem .Text, nItem - 1
    'remove old item
    .RemoveItem nItem + 1
    'select the item that was just moved
    .Selected(nItem - 1) = True
  End With
End Sub

Private Sub cmdDown_Click()
  On Error Resume Next
  Dim nItem As Integer
  
  With lstSelected
    If .ListIndex < 0 Then Exit Sub
    nItem = .ListIndex
    If nItem = .ListCount - 1 Then Exit Sub 'can't move last item down
    'move item down
    .AddItem .Text, nItem + 2
    'remove old item
    .RemoveItem nItem
    'select the item that was just moved
    .Selected(nItem + 1) = True
  End With
End Sub



Private Sub Form_Resize()
  On Error Resume Next
  If Me.Height < 3600 Then Me.Height = 3600
  If Me.Width < 6075 Then Me.Width = 6075
  
  lstSelected.Top = 0
  lstSelected.Left = 0
  lstSelected.Height = Me.ScaleHeight
  lstSelected.Width = Me.ScaleWidth - OKButton.Width - 60
  
  OKButton.Top = 30
  OKButton.Left = Me.ScaleWidth - OKButton.Width - 30
  
  CancelButton.Top = OKButton.Top + OKButton.Height + 30
  CancelButton.Left = OKButton.Left
   
  cmdUp.Left = CancelButton.Left
  cmdUp.Top = CancelButton.Top + cmdUp.Height + 120
  cmdDown.Left = cmdUp.Left
  cmdDown.Top = cmdUp.Top + cmdDown.Height + 30
  
End Sub

Private Sub OKButton_Click()
OK = True
Me.Hide
End Sub
