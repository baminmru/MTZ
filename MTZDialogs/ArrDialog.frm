VERSION 5.00
Begin VB.Form ArrDialog 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Множество значений"
   ClientHeight    =   3135
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   6030
   Icon            =   "ArrDialog.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3135
   ScaleWidth      =   6030
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txtVal 
      Height          =   375
      Left            =   120
      TabIndex        =   5
      Top             =   2640
      Width           =   4455
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "Добавить"
      Height          =   375
      Left            =   4680
      TabIndex        =   4
      Top             =   2640
      Width           =   1215
   End
   Begin VB.CommandButton cmdDel 
      Caption         =   "Удалить"
      Height          =   375
      Left            =   4680
      TabIndex        =   3
      Top             =   2160
      Width           =   1215
   End
   Begin VB.ListBox lstVal 
      Height          =   2400
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   4455
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
Attribute VB_Name = "ArrDialog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Private InClick As Boolean
Public Result As String
Public OK As Boolean

Private Sub CancelButton_Click()
OK = False
Me.Hide
End Sub

Private Sub cmdAdd_Click()
  lstVal.AddItem (txtVal)
End Sub


Private Sub cmdDel_Click()
If lstVal.ListCount = 0 Then Exit Sub
If lstVal.ListIndex = -1 Then Exit Sub
lstVal.RemoveItem lstVal.ListIndex
lstVal.ListIndex = -1
If lstVal.ListCount = 0 Then Exit Sub
lstVal.ListIndex = 0
End Sub

Private Sub Form_Load()
Dim s() As String, i As Long
s = Split(Result, vbCrLf)
lstVal.Clear
For i = 0 To UBound(s)
  lstVal.AddItem s(i)
Next
If lstVal.ListCount > 0 Then lstVal.ListIndex = 0
End Sub

Private Sub lstVal_Click()
InClick = True
txtVal = lstVal.Text
InClick = False
End Sub

Private Sub OKButton_Click()
Result = ""
Dim i As Long
For i = 0 To lstVal.ListCount - 1
  If i > 0 Then Result = Result + vbCrLf
  Result = Result + lstVal.List(i)
Next
OK = True
Me.Hide
End Sub

Private Sub txtVal_Change()
If InClick Then Exit Sub
If lstVal.ListCount = 0 Then Exit Sub
If lstVal.ListIndex = -1 Then Exit Sub
lstVal.List(lstVal.ListIndex) = txtVal
End Sub
