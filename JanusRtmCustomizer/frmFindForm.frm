VERSION 5.00
Begin VB.Form frmFindForm 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Поиск"
   ClientHeight    =   1455
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   5910
   Icon            =   "frmFindForm.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1455
   ScaleWidth      =   5910
   StartUpPosition =   1  'CenterOwner
   Tag             =   "660"
   Begin VB.CommandButton CloseBtn 
      Cancel          =   -1  'True
      Caption         =   "Отмена"
      Height          =   315
      Left            =   4680
      TabIndex        =   5
      Tag             =   "639"
      Top             =   1080
      Width           =   1175
   End
   Begin VB.Frame Frame1 
      Caption         =   "Место поиска"
      Height          =   975
      Left            =   1440
      TabIndex        =   7
      Tag             =   "641"
      Top             =   450
      Width           =   2175
      Begin VB.OptionButton OptEntire 
         Caption         =   "Искать везде"
         Height          =   255
         Left            =   120
         TabIndex        =   2
         Tag             =   "643"
         Top             =   600
         Value           =   -1  'True
         Width           =   1935
      End
      Begin VB.OptionButton OptColumn 
         Caption         =   "Искать в колонке"
         Height          =   375
         Left            =   120
         TabIndex        =   1
         Tag             =   "642"
         Top             =   200
         Width           =   1935
      End
   End
   Begin VB.ComboBox FindText 
      Height          =   315
      Left            =   1440
      TabIndex        =   0
      Top             =   90
      Width           =   3135
   End
   Begin VB.CommandButton PrevBtn 
      Appearance      =   0  'Flat
      Caption         =   "Предыдущее"
      Height          =   315
      Left            =   4680
      TabIndex        =   4
      Tag             =   "638"
      Top             =   450
      Width           =   1175
   End
   Begin VB.CommandButton NextBtn 
      Caption         =   "Следующее"
      Default         =   -1  'True
      Height          =   315
      Left            =   4680
      TabIndex        =   3
      Tag             =   "637"
      Top             =   90
      Width           =   1175
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Искать строку:"
      Height          =   195
      Left            =   120
      TabIndex        =   6
      Tag             =   "640"
      Top             =   90
      Width           =   1155
   End
End
Attribute VB_Name = "frmFindForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_HelpID = 50

Option Explicit

Public Event OnFindNext()
Attribute OnFindNext.VB_HelpID = 60
Public Event OnFindPrevios()
Attribute OnFindPrevios.VB_HelpID = 65
Public Event OnClose()
Attribute OnClose.VB_HelpID = 55
Private Changed As Boolean

Private Sub CloseBtn_Click()
    RaiseEvent OnClose
    Hide
End Sub

Private Sub FindText_Change()
    Changed = True
End Sub

Private Sub NextBtn_Click()
    RaiseEvent OnFindNext
    If Changed Then
        Call FindText.AddItem(FindText.Text)
        Changed = False
    End If
End Sub

Private Sub PrevBtn_Click()
    RaiseEvent OnFindPrevios
    If Changed Then
        Call FindText.AddItem(FindText.Text)
        Changed = False
    End If
End Sub



