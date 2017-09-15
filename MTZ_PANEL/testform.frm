VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.Form Form1 
   Caption         =   "Пример"
   ClientHeight    =   4635
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5850
   LinkTopic       =   "Form1"
   ScaleHeight     =   4635
   ScaleWidth      =   5850
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command5 
      Caption         =   "Восстановить позицию из файла"
      Height          =   375
      Left            =   2880
      TabIndex        =   9
      Top             =   480
      Width           =   2775
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Сохранить позицию в файл"
      Height          =   375
      Left            =   0
      TabIndex        =   8
      Top             =   480
      Width           =   2775
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Редактирование положения контролов"
      Height          =   375
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   5655
   End
   Begin MTZ_PANEL.ScrolledWindow ScrolledWindow1 
      Height          =   3135
      Left            =   0
      TabIndex        =   0
      ToolTipText     =   "Поменяйте размер формы"
      Top             =   1320
      Width           =   5655
      _ExtentX        =   9975
      _ExtentY        =   5530
      Begin MTZ_PANEL.DropButton DropButton1 
         Height          =   495
         Left            =   2040
         TabIndex        =   10
         ToolTipText     =   "tooltip"
         Top             =   2040
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   873
         Caption         =   "DropButton1"
         Caption         =   "DropButton1"
      End
      Begin VB.CommandButton Command3 
         Caption         =   "Command3"
         Height          =   495
         Left            =   3480
         TabIndex        =   6
         ToolTipText     =   "tooltip"
         Top             =   1920
         Width           =   1095
      End
      Begin VB.TextBox Text2 
         Height          =   375
         Left            =   120
         TabIndex        =   5
         Text            =   "Text2"
         Top             =   1800
         Width           =   1575
      End
      Begin VB.ListBox List1 
         Height          =   1230
         Left            =   1800
         TabIndex        =   4
         Top             =   240
         Width           =   1575
      End
      Begin VB.TextBox Text1 
         Height          =   615
         Left            =   120
         TabIndex        =   2
         Text            =   "Text1"
         Top             =   120
         Width           =   1215
      End
      Begin VB.Label Label1 
         Caption         =   "Label1"
         Height          =   495
         Left            =   120
         TabIndex        =   3
         Top             =   960
         Width           =   1215
      End
   End
   Begin VB.Label Label2 
      Caption         =   "Пример размещения"
      Height          =   255
      Left            =   0
      TabIndex        =   7
      Top             =   960
      Width           =   5175
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
ScrolledWindow1.Customize
ScrolledWindow1.ArrangeConstituentControls
End Sub

Private Sub Command4_Click()
Dim ff As Long
ff = FreeFile
Open App.Path & "\savedpos.txt" For Output As #ff
Print #ff, ScrolledWindow1.PanelCustomisationString
Close #ff

End Sub

Private Sub Command5_Click()
On Error Resume Next

Dim ff As Long, s As String
ff = FreeFile
Open App.Path & "\savedpos.txt" For Input As #ff
s = Input(LOF(ff), ff)
If s <> "" Then
 ScrolledWindow1.PanelCustomisationString = s
End If
Close #ff

End Sub

Private Sub Form_Resize()
On Error Resume Next
ScrolledWindow1.Width = Me.ScaleWidth - ScrolledWindow1.Left
ScrolledWindow1.Height = Me.ScaleHeight - ScrolledWindow1.Top
End Sub
