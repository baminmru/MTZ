VERSION 5.00
Begin VB.Form frmUniqueTool 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Создание уникальных сочетаний"
   ClientHeight    =   6015
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5760
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6015
   ScaleWidth      =   5760
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtDesc 
      Height          =   975
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   9
      Top             =   4440
      Width           =   5535
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Закрыть"
      Height          =   375
      Left            =   4320
      TabIndex        =   8
      Top             =   5640
      Width           =   1335
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "Создать"
      Height          =   375
      Left            =   2760
      TabIndex        =   7
      Top             =   5640
      Width           =   1455
   End
   Begin VB.CheckBox chkIsGlobal 
      Caption         =   "Глобальное ограничение"
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   3720
      Width           =   4335
   End
   Begin VB.ListBox lstFields 
      Height          =   1410
      Left            =   120
      Style           =   1  'Checkbox
      TabIndex        =   5
      Top             =   1200
      Width           =   5535
   End
   Begin VB.TextBox txtName 
      Height          =   375
      Left            =   120
      TabIndex        =   4
      Top             =   3240
      Width           =   5535
   End
   Begin VB.TextBox txtPart 
      Height          =   420
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   1
      Top             =   360
      Width           =   5085
   End
   Begin VB.CommandButton cmdPart 
      Caption         =   "..."
      Height          =   435
      Left            =   5160
      TabIndex        =   0
      Top             =   360
      Width           =   435
   End
   Begin VB.Label Label4 
      Caption         =   "Поля раздела"
      Height          =   375
      Left            =   120
      TabIndex        =   11
      Top             =   840
      Width           =   2535
   End
   Begin VB.Label Label2 
      Caption         =   "Описание"
      Height          =   375
      Left            =   120
      TabIndex        =   10
      Top             =   4080
      Width           =   2895
   End
   Begin VB.Label Label1 
      Caption         =   "Название"
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   2760
      Width           =   4215
   End
   Begin VB.Label Label3 
      Caption         =   "Раздел для создания уникального сочетания"
      Height          =   300
      Left            =   120
      TabIndex        =   2
      Top             =   0
      Width           =   4620
   End
End
Attribute VB_Name = "frmUniqueTool"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private P As PART
Private fld As MTZMetaModel.Field

Private Sub cmdCancel_Click()
Me.Hide
End Sub

Private Sub cmdOK_Click()
  Dim uc As UNIQUECONSTRAINT
  Dim i As Long
  If lstFields.SelCount > 0 Then
    Set uc = P.UNIQUECONSTRAINT.Add
    With uc
      .Name = txtName
      .TheComment = txtDesc
      If chkIsGlobal.Value = vbChecked Then
        .PerParent = Boolean_Net
      Else
        .PerParent = Boolean_Da
      End If
      .Save
      For i = 0 To lstFields.ListCount - 1
        If lstFields.Selected(i) Then
          
          With uc.CONSTRAINTFIELD.Add
            Set .TheField = P.Field.item(i + 1)
            .Save
          End With
        End If
      Next
    End With
  End If
End Sub

Private Sub cmdPart_Click()
  Dim ID As String
  Dim Brief As String
  Dim i As Long
  If Manager.GetReferenceDialogEx2("PART", ID, Brief) Then
      txtPart.Tag = Left(ID, 38)
      txtPart.Text = Brief
      If ID <> "" Then
        Set P = model.FindRowObject("PART", txtPart.Tag)
        lstFields.Clear
        P.Field.Sort = "Caption"
        For i = 1 To P.Field.Count
          Set fld = P.Field.item(i)
          lstFields.AddItem fld.Caption
        Next
      End If
  End If
End Sub
