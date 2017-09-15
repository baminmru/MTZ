VERSION 5.00
Begin VB.UserControl ctlViewStep3 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5910
   ScaleHeight     =   3600
   ScaleWidth      =   5910
   Begin VB.CheckBox chkForSelect 
      Height          =   375
      Left            =   120
      TabIndex        =   4
      Top             =   2160
      Width           =   495
   End
   Begin VB.TextBox txtName 
      Height          =   285
      Left            =   120
      TabIndex        =   1
      Top             =   480
      Width           =   5655
   End
   Begin VB.TextBox txtAlias 
      Height          =   285
      Left            =   120
      TabIndex        =   0
      Top             =   1440
      Width           =   5655
   End
   Begin VB.Label Label3 
      Caption         =   "Использовать для выбора из раздела"
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   1800
      Width           =   3135
   End
   Begin VB.Label Label1 
      Caption         =   "Название представления"
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   120
      Width           =   1815
   End
   Begin VB.Label label2 
      Caption         =   "Псевдоним"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   1080
      Width           =   975
   End
End
Attribute VB_Name = "ctlViewStep3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit


Public Sub OnInit()
txtName = BasePart.Caption & "(" & TypeForStruct(BasePart).the_comment & ")"
txtAlias = "view" & TypeForStruct(BasePart).Name & "_" & BasePart.Name

End Sub

Public Function OnNext()
  If txtName <> "" And txtAlias <> "" Then
    NewViewName = txtName
    NewViewAlias = txtAlias
    NewForChoose = (chkForSelect.Value = vbChecked)
    OnNext = True
  Else
    MsgBox "Надо задать название и псевдоним запроса", vbInformation + vbOKOnly, "Посторение сложного запроса"
  End If
End Function
