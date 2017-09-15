VERSION 5.00
Begin VB.Form frmDicList 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "������� ����������"
   ClientHeight    =   3105
   ClientLeft      =   2775
   ClientTop       =   3720
   ClientWidth     =   6045
   Icon            =   "frmDicList.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3105
   ScaleWidth      =   6045
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   315
      Left            =   4860
      TabIndex        =   1
      Top             =   60
      Width           =   1175
   End
   Begin VB.CommandButton CancelButton 
      Cancel          =   -1  'True
      Caption         =   "������"
      Height          =   315
      Left            =   4860
      TabIndex        =   2
      Top             =   450
      Width           =   1175
   End
   Begin VB.ListBox lstJournal 
      Height          =   2985
      Left            =   30
      Sorted          =   -1  'True
      TabIndex        =   0
      Top             =   0
      Width           =   4785
   End
End
Attribute VB_Name = "frmDicList"
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
  For i = 1 To model.ObjectType.Count
    If model.ObjectType.item(i).IsSingleInstance = Boolean_Da Then
    lstJournal.AddItem model.ObjectType.item(i).the_comment
    lstJournal.ItemData(lstJournal.NewIndex) = i
    End If
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
    Result = model.ObjectType.item(lstJournal.ItemData(lstJournal.ListIndex)).ID
    Me.Hide
  End If
End Sub

Private Sub lstJournal_DblClick()
  OKButton_Click
End Sub
