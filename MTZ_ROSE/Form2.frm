VERSION 5.00
Begin VB.Form Form2 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Комментируем параметры методов"
   ClientHeight    =   6855
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9180
   Icon            =   "Form2.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6855
   ScaleWidth      =   9180
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtPostCond 
      Height          =   1335
      Left            =   4560
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   11
      Top             =   5400
      Width           =   4575
   End
   Begin VB.TextBox txtSemantics 
      Height          =   1335
      Left            =   4560
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   8
      Top             =   3720
      Width           =   4575
   End
   Begin VB.TextBox txtPrecond 
      Height          =   1335
      Left            =   4560
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   7
      Top             =   2040
      Width           =   4575
   End
   Begin VB.TextBox txtFuncDoc 
      Height          =   1335
      Left            =   4560
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   6
      Top             =   360
      Width           =   4575
   End
   Begin VB.TextBox txtComment 
      Height          =   1935
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   4
      Top             =   4800
      Width           =   4335
   End
   Begin VB.ListBox lstParam 
      Height          =   2010
      Left            =   120
      TabIndex        =   1
      Top             =   2400
      Width           =   4215
   End
   Begin VB.ListBox lstFunc 
      Height          =   1620
      Left            =   120
      TabIndex        =   0
      Top             =   360
      Width           =   4215
   End
   Begin VB.Label Label7 
      Caption         =   "пост условие"
      Height          =   255
      Left            =   4560
      TabIndex        =   13
      Top             =   5160
      Width           =   2055
   End
   Begin VB.Label Label6 
      Caption         =   "Алгоритм"
      Height          =   255
      Left            =   4560
      TabIndex        =   12
      Top             =   3480
      Width           =   2055
   End
   Begin VB.Label Label5 
      Caption         =   "пред условие"
      Height          =   255
      Left            =   4560
      TabIndex        =   10
      Top             =   1800
      Width           =   2295
   End
   Begin VB.Label Label4 
      Caption         =   "описание функции"
      Height          =   255
      Left            =   4560
      TabIndex        =   9
      Top             =   120
      Width           =   2175
   End
   Begin VB.Label Label3 
      Caption         =   "Комментарий к параметру"
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   4560
      Width           =   2175
   End
   Begin VB.Label Label2 
      Caption         =   "Параметры"
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   2160
      Width           =   3015
   End
   Begin VB.Label Label1 
      Caption         =   "Методы"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   2895
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private InClick As Boolean
Private InFClick As Boolean
Public cCls As RoseClass

Public Sub Init()
lstFunc.Clear
lstParam.Clear
Dim i As Long
For i = 1 To cCls.Operations.Count
  lstFunc.AddItem cCls.Operations.GetAt(i).name
  
Next
lstFunc.ListIndex = -1
If cCls.Operations.Count > 0 Then
  lstFunc.ListIndex = 0
End If
End Sub


Private Sub Form_Load()
Init
End Sub

Private Sub lstFunc_Click()

lstParam.Clear
Dim i As Long, j As Long
j = lstFunc.ListIndex + 1
If j < 1 Then Exit Sub
For i = 1 To cCls.Operations.GetAt(j).Parameters.Count
  lstParam.AddItem cCls.Operations.GetAt(j).Parameters.GetAt(i).name
Next
InFClick = True
txtFuncDoc = cCls.Operations.GetAt(j).Documentation
txtPrecond = cCls.Operations.GetAt(j).Preconditions
txtPostCond = cCls.Operations.GetAt(j).Postconditions
txtSemantics = cCls.Operations.GetAt(j).Semantics
InFClick = False
  


lstParam.ListIndex = -1
If cCls.Operations.GetAt(j).Parameters.Count > 0 Then
  lstParam.ListIndex = 0
End If

End Sub

Private Sub lstParam_Click()
InClick = True
Dim i As Long, j As Long
j = lstFunc.ListIndex + 1
i = lstParam.ListIndex + 1
If i < 1 Or j < 1 Then Exit Sub
txtComment.Text = cCls.Operations.GetAt(j).Parameters.GetAt(i).Documentation
InClick = False
End Sub

Private Sub Text3_Change()

End Sub

Private Sub txtComment_Change()
If InClick Then Exit Sub
Dim i As Long, j As Long
j = lstFunc.ListIndex + 1
i = lstParam.ListIndex + 1
If i < 1 Or j < 1 Then Exit Sub
cCls.Operations.GetAt(j).Parameters.GetAt(i).Documentation = txtComment.Text
End Sub

Private Sub txtFuncDoc_Change()
Dim j As Long
j = lstFunc.ListIndex + 1
If j < 1 Then Exit Sub
If InFClick Then Exit Sub
cCls.Operations.GetAt(j).Documentation = txtFuncDoc
cCls.Operations.GetAt(j).Preconditions = txtPrecond
cCls.Operations.GetAt(j).Postconditions = txtPostCond
cCls.Operations.GetAt(j).Semantics = txtSemantics
End Sub

Private Sub txtPostCond_Change()
Dim j As Long
j = lstFunc.ListIndex + 1
If j < 1 Then Exit Sub
If InFClick Then Exit Sub
cCls.Operations.GetAt(j).Documentation = txtFuncDoc
cCls.Operations.GetAt(j).Preconditions = txtPrecond
cCls.Operations.GetAt(j).Postconditions = txtPostCond
cCls.Operations.GetAt(j).Semantics = txtSemantics

End Sub

Private Sub txtPrecond_Change()
Dim j As Long
j = lstFunc.ListIndex + 1
If j < 1 Then Exit Sub
If InFClick Then Exit Sub
cCls.Operations.GetAt(j).Documentation = txtFuncDoc
cCls.Operations.GetAt(j).Preconditions = txtPrecond
cCls.Operations.GetAt(j).Postconditions = txtPostCond
cCls.Operations.GetAt(j).Semantics = txtSemantics

End Sub

Private Sub txtSemantics_Change()
Dim j As Long
j = lstFunc.ListIndex + 1
If j < 1 Then Exit Sub
If InFClick Then Exit Sub
cCls.Operations.GetAt(j).Documentation = txtFuncDoc
cCls.Operations.GetAt(j).Preconditions = txtPrecond
cCls.Operations.GetAt(j).Postconditions = txtPostCond
cCls.Operations.GetAt(j).Semantics = txtSemantics

End Sub
