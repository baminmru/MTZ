VERSION 5.00
Begin VB.Form frmDicList 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Открыть справочник"
   ClientHeight    =   3105
   ClientLeft      =   2760
   ClientTop       =   3750
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
      Height          =   375
      Left            =   4680
      TabIndex        =   2
      Top             =   0
      Width           =   1215
   End
   Begin VB.CommandButton CancelButton 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4680
      TabIndex        =   1
      Top             =   480
      Width           =   1215
   End
   Begin VB.ListBox lstJournal 
      Height          =   2985
      Left            =   120
      Sorted          =   -1  'True
      TabIndex        =   0
      Top             =   0
      Width           =   4455
   End
End
Attribute VB_Name = "frmDicList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Public ok As Boolean
Public model As MTZMetaModel.Application
Public Result As String

Private Sub CancelButton_Click()
ok = False
Me.Hide
End Sub

Private Sub Form_Activate()
  lstJournal.Clear
  ok = False
  Dim i As Long
  For i = 1 To model.OBJECTTYPE.Count
    If model.OBJECTTYPE.item(i).IsSingleInstance = Boolean_Da Then
    lstJournal.AddItem model.OBJECTTYPE.item(i).the_comment
    lstJournal.ItemData(lstJournal.NewIndex) = i
    End If
  Next
End Sub

Private Sub OKButton_Click()
  If lstJournal.ListIndex >= 0 Then
    ok = True
    Result = model.OBJECTTYPE.item(lstJournal.ItemData(lstJournal.ListIndex)).ID
    Me.Hide
  End If
End Sub

Private Sub lstJournal_DblClick()
OKButton_Click
End Sub

