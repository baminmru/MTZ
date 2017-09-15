VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#1.9#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WFDef_linkres 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin MTZ_PANEL.ScrolledWindow Panel 
      Height          =   1485
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   4245
      _ExtentX        =   7488
      _ExtentY        =   2619
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "Результат"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "Результат:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WFDef_linkres"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()


Private Sub UserControl_Resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub txtName_Change()
  Changing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtName.Text)
  IsOK = mIsOK
End Function
Public Sub InitPanel()
OnInit = True
Dim iii As Long ' for combo only
If Item.CanChange Then
  Panel.Enabled = True
Else
  Panel.Enabled = False
End If

txtName = Item.Name
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Public Sub Save()
If OnInit Then Exit Sub

Item.Name = txtName
 RaiseEvent Changed
End Sub
 Public Sub OptimalSize(X As Single, Y As Single)
   Panel.OptimalSize X, Y
   X = X + Panel.Left
   Y = Y + Panel.Top
 End Sub
 
 
 Public Function OptimalY() As Single
   Dim X As Single, Y As Single
   Panel.OptimalSize X, Y
   OptimalY = Y
 End Function
 Public Sub Customize()
   Panel.Customize
 End Sub
 Public Property Get PanelCustomisationString() As String
   PanelCustomisationString = Panel.PanelCustomisationString
 End Property
 Public Property Let PanelCustomisationString(s As String)
   Panel.PanelCustomisationString = s
 End Property
 Public Property Get Enabled() As Boolean
   Enabled = Panel.Enabled
 End Property
 Public Property Let Enabled(ByVal v As Boolean)
   Panel.Enabled = v
 End Property

