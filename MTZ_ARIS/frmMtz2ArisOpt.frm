VERSION 5.00
Begin VB.Form frmMtz2ArisOpt 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Параметры переноса"
   ClientHeight    =   3240
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3525
   Icon            =   "frmMtz2ArisOpt.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3240
   ScaleWidth      =   3525
   StartUpPosition =   1  'CenterOwner
   Begin VB.CheckBox chkFieldType 
      Caption         =   "Типы полей"
      Height          =   255
      Left            =   240
      TabIndex        =   6
      Top             =   2280
      Width           =   3255
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2280
      TabIndex        =   5
      Top             =   2760
      Width           =   1095
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   1080
      TabIndex        =   4
      Top             =   2760
      Width           =   1095
   End
   Begin VB.CheckBox chkProcess 
      Caption         =   "Описание процессов"
      Height          =   375
      Left            =   240
      TabIndex        =   3
      Top             =   1800
      Width           =   3735
   End
   Begin VB.CheckBox chkDocState 
      Caption         =   "Описание ЖЦ документа"
      Height          =   495
      Left            =   240
      TabIndex        =   2
      Top             =   1200
      Width           =   3615
   End
   Begin VB.CheckBox chkDoc 
      Caption         =   "Структура документов"
      Height          =   375
      Left            =   240
      TabIndex        =   1
      Top             =   720
      Width           =   3615
   End
   Begin VB.CheckBox chkorg 
      Caption         =   "Орг. струкутра"
      Height          =   375
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   3495
   End
End
Attribute VB_Name = "frmMtz2ArisOpt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public ok As Boolean

Private Sub cmdOK_Click()
ok = True
Me.Hide
End Sub

Private Sub Form_Load()
ok = False
Me.Hide
End Sub
