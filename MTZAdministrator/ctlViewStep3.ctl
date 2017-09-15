VERSION 5.00
Begin VB.UserControl ctlViewStep3 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5910
   ScaleHeight     =   3600
   ScaleWidth      =   5910
   Begin VB.CheckBox chkbDelOtherView 
      Caption         =   "Удалить все вью Раздела"
      Height          =   375
      Left            =   120
      TabIndex        =   7
      Top             =   2160
      Width           =   4005
   End
   Begin VB.CheckBox chkbForObjectChoose 
      Caption         =   "Использовать для выбора объекта"
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   1800
      Width           =   4005
   End
   Begin VB.CommandButton cmdChangeExist 
      Caption         =   "Заменить..."
      Height          =   315
      Left            =   120
      TabIndex        =   4
      ToolTipText     =   "Заменить существуюущее представление в разделе"
      Top             =   2580
      Width           =   1455
   End
   Begin VB.CheckBox chkForSelect 
      Caption         =   "Использовать для выбора из раздела"
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   1440
      Width           =   4005
   End
   Begin VB.TextBox txtName 
      Height          =   285
      Left            =   120
      TabIndex        =   0
      Top             =   390
      Width           =   5655
   End
   Begin VB.TextBox txtAlias 
      Height          =   285
      Left            =   120
      TabIndex        =   1
      Top             =   1050
      Width           =   5655
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Название представления:"
      Height          =   195
      Left            =   120
      TabIndex        =   6
      Top             =   90
      Width           =   1995
   End
   Begin VB.Label label2 
      AutoSize        =   -1  'True
      Caption         =   "Псевдоним:"
      Height          =   195
      Left            =   120
      TabIndex        =   5
      Top             =   750
      Width           =   915
   End
End
Attribute VB_Name = "ctlViewStep3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit


Public Sub OnInit()
txtName = BasePart.Caption & " (" & TypeForStruct(BasePart).the_comment & ")"
txtAlias = "view" & TypeForStruct(BasePart).Name & "_" & BasePart.Name

End Sub

Public Function OnNext()
  If txtName <> "" And txtAlias <> "" Then
    NewViewName = txtName
    NewViewAlias = txtAlias
    NewForChoose = (chkForSelect.Value = vbChecked)
    NewForChooseObject = (chkbForObjectChoose.Value = vbChecked)
    DelOtherView = (chkbDelOtherView.Value = vbChecked)
    OnNext = True
  Else
    MsgBox "Надо задать название и псевдоним запроса", vbInformation + vbOKOnly, "Посторение сложного запроса"
  End If
End Function

Private Sub cmdChangeExist_Click()
Dim oChangedView As PARTVIEW
Dim ID As String
Dim Brief As String

    If Manager.GetReferenceDialogEx2("PARTVIEW", ID, Brief, , , "PARTID='" + BasePart.ID + "'") Then
        ID = Left(ID, 38)
        Set oChangedView = BasePart.Application.FindRowObject("PARTVIEW", ID)
        Set ViewForChange = oChangedView
        txtAlias.Text = ViewForChange.the_Alias
        txtName.Text = ViewForChange.Name
    End If
    
End Sub
