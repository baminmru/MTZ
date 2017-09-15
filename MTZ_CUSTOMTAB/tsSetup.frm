VERSION 5.00
Begin VB.Form frmTSSetup 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Настройка видимости вкладок"
   ClientHeight    =   3195
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   6030
   Icon            =   "tsSetup.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   6030
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.ListBox LstTab 
      Height          =   2985
      Left            =   120
      Style           =   1  'Checkbox
      TabIndex        =   2
      Top             =   120
      Width           =   4335
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
Attribute VB_Name = "frmTSSetup"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_HelpID = 10
Option Explicit
' окно настройки табов

Public ts As TabStates
Attribute ts.VB_VarHelpID = 25
Public OK As Boolean
Attribute OK.VB_VarHelpID = 20


' отмена
Private Sub CancelButton_Click()
OK = False
Me.Hide
End Sub


' загрузка списка табов
Public Sub Init()
Attribute Init.VB_HelpID = 15
LstTab.Clear
Dim i As Long
For i = 1 To ts.Count
  LstTab.AddItem ts.Item(i).Caption
  LstTab.Selected(LstTab.NewIndex) = ts.Item(i).Visible
Next
End Sub


'положительное закрытие
Private Sub OKButton_Click()
OK = True
Me.Hide
End Sub
