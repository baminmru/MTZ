VERSION 5.00
Begin VB.Form frmSettingGen 
   Caption         =   "Настройка процесса генерации"
   ClientHeight    =   2610
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4335
   LinkTopic       =   "Form1"
   ScaleHeight     =   2610
   ScaleWidth      =   4335
   StartUpPosition =   3  'Windows Default
   Begin VB.CheckBox chbPackGen 
      Caption         =   "Создавать файл пакетной компиляции"
      Height          =   255
      Left            =   0
      TabIndex        =   6
      Top             =   1680
      Width           =   4335
   End
   Begin VB.Frame Frame1 
      Height          =   1575
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   4335
      Begin VB.OptionButton optVB 
         Caption         =   "Очистить только очередь ""MTZ_VBQUEUE"""
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   1080
         Width           =   4095
      End
      Begin VB.OptionButton optList 
         Caption         =   "Очистить очередь согласно списку выбранных генераторов"
         Height          =   375
         Left            =   120
         TabIndex        =   4
         Top             =   600
         Width           =   3975
      End
      Begin VB.OptionButton optNO 
         Caption         =   "не очищать очередь генерации"
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   240
         Width           =   2775
      End
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2160
      TabIndex        =   1
      Top             =   2160
      Width           =   2175
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   0
      TabIndex        =   0
      Top             =   2160
      Width           =   2175
   End
End
Attribute VB_Name = "frmSettingGen"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public Q As Long

Private Sub cmdCancel_Click()
  Me.Hide
End Sub

Private Sub cmdOK_Click()
  If optNO.Value Then Q = 1
  If optList.Value Then Q = 2
  If optVB.Value Then Q = 3
  If chbPackGen.Value = 1 Then Q = Q + 10
  Me.Hide
End Sub

Private Sub Form_Load()
  If Q > 10 Then chbPackGen.Value = 1
  Select Case Q
    Case 1
      optNO.Value = True
    Case 11
      optNO.Value = True
    Case 2
      optList.Value = True
    Case 12
      optList.Value = True
    Case 3
      optVB.Value = True
    Case 13
      optVB.Value = True
  End Select
End Sub
