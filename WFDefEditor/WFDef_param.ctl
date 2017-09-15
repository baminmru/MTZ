VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.0#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WFDef_param 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin MTZ_PANEL.ScrolledWindow Panel 
      Height          =   1000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   1000
      _ExtentX        =   1773
      _ExtentY        =   1773
      Begin VB.ComboBox cmbSetBeforStart 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   8
         ToolTipText     =   "Задать до старта процесса"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.ComboBox cmbNoChange 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   6
         ToolTipText     =   "Не менять после старта"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtthe_Value 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   4
         ToolTipText     =   "Значение"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "Название"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblSetBeforStart 
         BackStyle       =   0  'Transparent
         Caption         =   "Задать до старта процесса:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblNoChange 
         BackStyle       =   0  'Transparent
         Caption         =   "Не менять после старта:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblthe_Value 
         BackStyle       =   0  'Transparent
         Caption         =   "Значение:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "Название:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WFDef_param"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()





Private Sub Usercontrol_resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub txtName_Change()
  Changing
End Sub
Private Sub txtthe_Value_Change()
  Changing
End Sub
Private Sub cmbNoChange_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub cmbSetBeforStart_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtName.Text)
If mIsOK Then mIsOK = IsSet(txtthe_Value.Text)
If mIsOK Then mIsOK = (cmbNoChange.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbSetBeforStart.ListIndex >= 0)
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
txtthe_Value = Item.the_Value
cmbNoChange.Clear
cmbNoChange.AddItem "Да"
cmbNoChange.ItemData(cmbNoChange.NewIndex) = -1
cmbNoChange.AddItem "Нет"
cmbNoChange.ItemData(cmbNoChange.NewIndex) = 0
 For iii = 0 To cmbNoChange.ListCount - 1
  If Item.NoChange = cmbNoChange.ItemData(iii) Then
   cmbNoChange.ListIndex = iii
   Exit For
  End If
 Next
cmbSetBeforStart.Clear
cmbSetBeforStart.AddItem "Да"
cmbSetBeforStart.ItemData(cmbSetBeforStart.NewIndex) = -1
cmbSetBeforStart.AddItem "Нет"
cmbSetBeforStart.ItemData(cmbSetBeforStart.NewIndex) = 0
 For iii = 0 To cmbSetBeforStart.ListCount - 1
  If Item.SetBeforStart = cmbSetBeforStart.ItemData(iii) Then
   cmbSetBeforStart.ListIndex = iii
   Exit For
  End If
 Next
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Public Sub Save()
If OnInit Then Exit Sub

Item.Name = txtName
Item.the_Value = txtthe_Value
Item.NoChange = cmbNoChange.ItemData(cmbNoChange.ListIndex)
Item.SetBeforStart = cmbSetBeforStart.ItemData(cmbSetBeforStart.ListIndex)
 RaiseEvent Changed
End Sub
 Public Sub OptimalSize(x As Single, y As Single)
   Panel.OptimalSize x, y
   x = x + Panel.Left
   y = y + Panel.Top
 End Sub
 
 
 Public Function OptimalY() As Single
   Dim x As Single, y As Single
   Panel.OptimalSize x, y
   OptimalY = y
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



