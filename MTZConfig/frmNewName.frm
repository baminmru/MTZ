VERSION 5.00
Begin VB.Form frmNewName 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Добавить сайт"
   ClientHeight    =   930
   ClientLeft      =   6285
   ClientTop       =   2175
   ClientWidth     =   4845
   Icon            =   "frmNewName.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   930
   ScaleWidth      =   4845
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtName 
      Height          =   285
      Left            =   1140
      TabIndex        =   1
      Top             =   120
      Width           =   3675
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "&OK"
      Default         =   -1  'True
      Enabled         =   0   'False
      Height          =   315
      Left            =   2310
      TabIndex        =   2
      ToolTipText     =   "Удалить выбранный сайт"
      Top             =   540
      Width           =   1185
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "О&тмена"
      Height          =   315
      Left            =   3570
      TabIndex        =   3
      ToolTipText     =   "Удалить выбранный сайт"
      Top             =   540
      Width           =   1185
   End
   Begin VB.Label lblDatabase 
      Caption         =   "Имя сайта:"
      Height          =   255
      Left            =   150
      TabIndex        =   0
      Top             =   120
      Width           =   975
   End
End
Attribute VB_Name = "frmNewName"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Result As Long

Public Function ShowModal() As String
  Show vbModal
  If (Result = vbOK) Then
    ShowModal = txtName.Text
  Else
    ShowModal = ""
  End If
End Function

Private Sub cmdCancel_Click()
  Result = vbCancel
  Hide
End Sub

Private Sub cmdOK_Click()
  Result = vbOK
  Hide
End Sub

Private Sub txtName_Change()
  If (Len(txtName.Text) = 0) Then
    cmdOK.Enabled = False
  Else
    cmdOK.Enabled = True
  End If
End Sub
