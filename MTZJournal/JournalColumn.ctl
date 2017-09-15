VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl ctlJournalColumn 
   ClientHeight    =   3165
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3615
   ScaleHeight     =   3165
   ScaleWidth      =   3615
   Begin MTZ_PANEL.ScrolledWindow Panel 
      Height          =   2955
      Left            =   0
      TabIndex        =   8
      Top             =   0
      Width           =   3315
      _ExtentX        =   5847
      _ExtentY        =   5212
      Begin VB.ComboBox cmbGroupAggregation 
         Height          =   315
         Left            =   90
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   7
         ToolTipText     =   "Аггрегация при группировке"
         Top             =   2340
         Width           =   3000
      End
      Begin VB.ComboBox cmbColSort 
         Height          =   315
         Left            =   90
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   5
         ToolTipText     =   "Сортировка колонки"
         Top             =   1635
         Width           =   3000
      End
      Begin VB.ComboBox cmbColumnAlignment 
         Height          =   315
         Left            =   90
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   3
         ToolTipText     =   "Выравнивание"
         Top             =   960
         Width           =   3000
      End
      Begin VB.TextBox txtname 
         Height          =   300
         Left            =   90
         MaxLength       =   255
         TabIndex        =   1
         ToolTipText     =   "Название"
         Top             =   330
         Width           =   3000
      End
      Begin VB.Label lblGroupAggregation 
         BackStyle       =   0  'Transparent
         Caption         =   "Аггрегация при группировке:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   90
         TabIndex        =   6
         Top             =   2055
         Width           =   3000
      End
      Begin VB.Label lblColSort 
         BackStyle       =   0  'Transparent
         Caption         =   "Сортировка колонки:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   90
         TabIndex        =   4
         Top             =   1350
         Width           =   3000
      End
      Begin VB.Label lblColumnAlignment 
         BackStyle       =   0  'Transparent
         Caption         =   "Выравнивание:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   90
         TabIndex        =   2
         Top             =   705
         Width           =   3000
      End
      Begin VB.Label lblname 
         BackStyle       =   0  'Transparent
         Caption         =   "Название:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   90
         TabIndex        =   0
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "ctlJournalColumn"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit


   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()


Private Sub Usercontrol_resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub txtname_Change()
  Changing
End Sub
Private Sub cmbColumnAlignment_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub cmbColSort_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub cmbGroupAggregation_Click()
  On Error Resume Next
  Changing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtname.Text)
If mIsOK Then mIsOK = (cmbColumnAlignment.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbColSort.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbGroupAggregation.ListIndex >= 0)
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

txtname = Item.Name
cmbColumnAlignment.Clear
cmbColumnAlignment.AddItem "Center Center"
cmbColumnAlignment.ItemData(cmbColumnAlignment.NewIndex) = 4
cmbColumnAlignment.AddItem "Center Top"
cmbColumnAlignment.ItemData(cmbColumnAlignment.NewIndex) = 3
cmbColumnAlignment.AddItem "Right Top"
cmbColumnAlignment.ItemData(cmbColumnAlignment.NewIndex) = 6
cmbColumnAlignment.AddItem "Right Bottom"
cmbColumnAlignment.ItemData(cmbColumnAlignment.NewIndex) = 8
cmbColumnAlignment.AddItem "Left Bottom"
cmbColumnAlignment.ItemData(cmbColumnAlignment.NewIndex) = 2
cmbColumnAlignment.AddItem "Right Center"
cmbColumnAlignment.ItemData(cmbColumnAlignment.NewIndex) = 7
cmbColumnAlignment.AddItem "Center Bottom"
cmbColumnAlignment.ItemData(cmbColumnAlignment.NewIndex) = 5
cmbColumnAlignment.AddItem "Left Center"
cmbColumnAlignment.ItemData(cmbColumnAlignment.NewIndex) = 1
cmbColumnAlignment.AddItem "Left Top"
cmbColumnAlignment.ItemData(cmbColumnAlignment.NewIndex) = 0
 For iii = 0 To cmbColumnAlignment.ListCount - 1
  If Item.ColumnAlignment = cmbColumnAlignment.ItemData(iii) Then
   cmbColumnAlignment.ListIndex = iii
   Exit For
  End If
 Next
cmbColSort.Clear
cmbColSort.AddItem "As String"
cmbColSort.ItemData(cmbColSort.NewIndex) = 0
cmbColSort.AddItem "As Numeric"
cmbColSort.ItemData(cmbColSort.NewIndex) = 1
cmbColSort.AddItem "As Date"
cmbColSort.ItemData(cmbColSort.NewIndex) = 2
 For iii = 0 To cmbColSort.ListCount - 1
  If Item.ColSort = cmbColSort.ItemData(iii) Then
   cmbColSort.ListIndex = iii
   Exit For
  End If
 Next
cmbGroupAggregation.Clear
cmbGroupAggregation.AddItem "MAX"
cmbGroupAggregation.ItemData(cmbGroupAggregation.NewIndex) = 5
cmbGroupAggregation.AddItem "AVG"
cmbGroupAggregation.ItemData(cmbGroupAggregation.NewIndex) = 1
cmbGroupAggregation.AddItem "SUM"
cmbGroupAggregation.ItemData(cmbGroupAggregation.NewIndex) = 3
cmbGroupAggregation.AddItem "COUNT"
cmbGroupAggregation.ItemData(cmbGroupAggregation.NewIndex) = 2
cmbGroupAggregation.AddItem "MIN"
cmbGroupAggregation.ItemData(cmbGroupAggregation.NewIndex) = 4
cmbGroupAggregation.AddItem "CUSTOM"
cmbGroupAggregation.ItemData(cmbGroupAggregation.NewIndex) = 6
cmbGroupAggregation.AddItem "none"
cmbGroupAggregation.ItemData(cmbGroupAggregation.NewIndex) = 0
 For iii = 0 To cmbGroupAggregation.ListCount - 1
  If Item.GroupAggregation = cmbGroupAggregation.ItemData(iii) Then
   cmbGroupAggregation.ListIndex = iii
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

Item.Name = txtname
Item.ColumnAlignment = cmbColumnAlignment.ItemData(cmbColumnAlignment.ListIndex)
Item.ColSort = cmbColSort.ItemData(cmbColSort.ListIndex)
Item.GroupAggregation = cmbGroupAggregation.ItemData(cmbGroupAggregation.ListIndex)
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

