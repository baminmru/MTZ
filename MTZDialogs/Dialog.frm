VERSION 5.00
Begin VB.Form Dialog 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Условие"
   ClientHeight    =   3195
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   5160
   Icon            =   "Dialog.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   5160
   ShowInTaskbar   =   0   'False
   Begin VB.ListBox lstOP 
      Height          =   2985
      ItemData        =   "Dialog.frx":000C
      Left            =   120
      List            =   "Dialog.frx":0058
      TabIndex        =   2
      Top             =   120
      Width           =   3855
   End
   Begin VB.CommandButton CancelButton 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4080
      TabIndex        =   1
      Top             =   600
      Width           =   975
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Height          =   375
      Left            =   4080
      TabIndex        =   0
      Top             =   120
      Width           =   975
   End
End
Attribute VB_Name = "Dialog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Public Result As Integer
Public sync As String

Private Sub CancelButton_Click()
  Result = -1
  Me.Hide
End Sub

Private Sub Form_Load()
  'SyncCombo lstOP, sync
End Sub

Private Sub lstOP_DblClick()
  OKButton_Click
End Sub

Private Sub OKButton_Click()
  If lstOP.ListIndex = -1 Then Exit Sub
  Result = lstOP.ListIndex
  Me.Hide
End Sub

''''''''''''''''''''''''''
'равно
'не равно
'меньше или равно
'меньше
'больше или равно
'больше
'включает значение
'поле содержит пустое значение
'поле содержит не пустое значение
'строка начинается со значения
'строка заканчивается значением
'строка соответствует маске
'равно строковому значению
'не равно строковому значению
'меньше строкового значения
'меньше или равно строкового значения
'больше или равно строкового значения
'больше или равно строкового значения
'значение входит в множество чисел
'значение входит в множество дат
'значение входит в множество строк
'значение не входит в множество чисел
'значение не входит в множество дат
'значение не входит в множество строк

'значения не находятся в подмножестве TEMP_ID_STORE
'значения находятся в подмножестве TEMP_ID_STORE
'левая скобка
'правая скобка
''''''''''''''''''''''''''
