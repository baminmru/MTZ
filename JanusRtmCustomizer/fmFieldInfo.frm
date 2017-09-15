VERSION 5.00
Begin VB.Form fmFieldInfo 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Установки колонки"
   ClientHeight    =   2925
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   3975
   Icon            =   "fmFieldInfo.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2925
   ScaleWidth      =   3975
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtCaption 
      Height          =   285
      Left            =   90
      TabIndex        =   1
      Top             =   364
      Width           =   2535
   End
   Begin VB.ComboBox cmbHeaderlignment 
      Height          =   315
      ItemData        =   "fmFieldInfo.frx":000C
      Left            =   90
      List            =   "fmFieldInfo.frx":0019
      Style           =   2  'Dropdown List
      TabIndex        =   7
      Top             =   2520
      Width           =   2535
   End
   Begin VB.ComboBox cmbAlignment 
      Height          =   315
      ItemData        =   "fmFieldInfo.frx":0032
      Left            =   90
      List            =   "fmFieldInfo.frx":003F
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   1790
      Width           =   2535
   End
   Begin VB.ComboBox cmbSortStyle 
      Height          =   315
      ItemData        =   "fmFieldInfo.frx":0058
      Left            =   90
      List            =   "fmFieldInfo.frx":006B
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   1062
      Width           =   2535
   End
   Begin VB.CommandButton CancelButton 
      Cancel          =   -1  'True
      Caption         =   "Отмена"
      Height          =   315
      Left            =   2730
      TabIndex        =   9
      Top             =   420
      Width           =   1175
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   315
      Left            =   2730
      TabIndex        =   8
      Top             =   60
      Width           =   1175
   End
   Begin VB.Label Label4 
      Caption         =   "Заголовок"
      Height          =   255
      Left            =   90
      TabIndex        =   0
      Top             =   30
      Width           =   1335
   End
   Begin VB.Label Label3 
      Caption         =   "Выравнивание заголовка"
      Height          =   255
      Left            =   90
      TabIndex        =   6
      Top             =   2190
      Width           =   2535
   End
   Begin VB.Label Label2 
      Caption         =   "Выравнивание текста"
      Height          =   255
      Left            =   90
      TabIndex        =   4
      Top             =   1455
      Width           =   2535
   End
   Begin VB.Label Label1 
      Caption         =   "Тип сортировки"
      Height          =   255
      Left            =   90
      TabIndex        =   2
      Top             =   735
      Width           =   1455
   End
End
Attribute VB_Name = "fmFieldInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_HelpID = 30

Option Explicit
Public c As JSColumn
Attribute c.VB_VarHelpID = 35


Private Sub CancelButton_Click()
Me.Hide
End Sub

Private Sub Form_Load()
Dim i As Integer
 txtCaption.Text = c.Caption
 
 For i = 0 To cmbSortStyle.ListCount - 1
  If cmbSortStyle.ItemData(i) = c.SortType Then
  cmbSortStyle.ListIndex = i
  End If
 Next
 
 For i = 0 To cmbAlignment.ListCount - 1
  If cmbAlignment.ItemData(i) = c.TextAlignment Then
    cmbAlignment.ListIndex = i
  End If
 Next
 
 For i = 0 To cmbHeaderlignment.ListCount - 1
  If cmbHeaderlignment.ItemData(i) = c.HeaderAlignment Then
    cmbHeaderlignment.ListIndex = i
  End If
 Next
End Sub

Private Sub OKButton_Click()
On Error Resume Next
c.HeaderAlignment = cmbHeaderlignment.ItemData(cmbHeaderlignment.ListIndex)
c.TextAlignment = cmbAlignment.ItemData(cmbAlignment.ListIndex)
c.SortType = cmbSortStyle.ItemData(cmbSortStyle.ListIndex)
c.Caption = txtCaption.Text
Me.Hide
End Sub
