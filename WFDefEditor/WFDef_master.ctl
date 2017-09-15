VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.0#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WFDef_master 
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
      Begin VB.ComboBox cmbAllowControl 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   11
         ToolTipText     =   "Разрешено управление"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.ComboBox cmbAllowAnaliz 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   9
         ToolTipText     =   "Разрешен детальный анализ"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.ComboBox cmbAllowCheckState 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   7
         ToolTipText     =   "Разрешен промотр состояния"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.ComboBox cmbAllowStart 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   5
         ToolTipText     =   "Разрешен запуск"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheGroup 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Группа"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheGroup 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Группа"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblAllowControl 
         BackStyle       =   0  'Transparent
         Caption         =   "Разрешено управление:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblAllowAnaliz 
         BackStyle       =   0  'Transparent
         Caption         =   "Разрешен детальный анализ:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblAllowCheckState 
         BackStyle       =   0  'Transparent
         Caption         =   "Разрешен промотр состояния:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblAllowStart 
         BackStyle       =   0  'Transparent
         Caption         =   "Разрешен запуск:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheGroup 
         BackStyle       =   0  'Transparent
         Caption         =   "Группа:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WFDef_master"
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

Private Sub txtTheGroup_Change()
  Changing
End Sub
Private Sub cmdTheGroup_CLick()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("Users", id, brief) Then
          txtTheGroup.Tag = Left(id, 38)
          txtTheGroup = brief
        End If
End Sub
Private Sub cmdTheGroup_MenuClick(ByVal sCaption As String)
          txtTheGroup.Tag = ""
          txtTheGroup = ""
End Sub
Private Sub cmbAllowStart_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub cmbAllowCheckState_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub cmbAllowAnaliz_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub cmbAllowControl_Click()
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

If mIsOK Then mIsOK = txtTheGroup.Tag <> ""
If mIsOK Then mIsOK = (cmbAllowAnaliz.ListIndex >= 0)
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

If Not Item.TheGroup Is Nothing Then
  txtTheGroup.Tag = Item.TheGroup.id
  txtTheGroup = Item.TheGroup.brief
Else
  txtTheGroup.Tag = ""
  txtTheGroup = ""
End If
 LoadBtnPictures cmdTheGroup, cmdTheGroup.Tag
  cmdTheGroup.RemoveAllMenu
cmbAllowStart.Clear
cmbAllowStart.AddItem "Да"
cmbAllowStart.ItemData(cmbAllowStart.NewIndex) = -1
cmbAllowStart.AddItem "Нет"
cmbAllowStart.ItemData(cmbAllowStart.NewIndex) = 0
 For iii = 0 To cmbAllowStart.ListCount - 1
  If Item.AllowStart = cmbAllowStart.ItemData(iii) Then
   cmbAllowStart.ListIndex = iii
   Exit For
  End If
 Next
cmbAllowCheckState.Clear
cmbAllowCheckState.AddItem "Да"
cmbAllowCheckState.ItemData(cmbAllowCheckState.NewIndex) = -1
cmbAllowCheckState.AddItem "Нет"
cmbAllowCheckState.ItemData(cmbAllowCheckState.NewIndex) = 0
 For iii = 0 To cmbAllowCheckState.ListCount - 1
  If Item.AllowCheckState = cmbAllowCheckState.ItemData(iii) Then
   cmbAllowCheckState.ListIndex = iii
   Exit For
  End If
 Next
cmbAllowAnaliz.Clear
cmbAllowAnaliz.AddItem "Да"
cmbAllowAnaliz.ItemData(cmbAllowAnaliz.NewIndex) = -1
cmbAllowAnaliz.AddItem "Нет"
cmbAllowAnaliz.ItemData(cmbAllowAnaliz.NewIndex) = 0
 For iii = 0 To cmbAllowAnaliz.ListCount - 1
  If Item.AllowAnaliz = cmbAllowAnaliz.ItemData(iii) Then
   cmbAllowAnaliz.ListIndex = iii
   Exit For
  End If
 Next
cmbAllowControl.Clear
cmbAllowControl.AddItem "Да"
cmbAllowControl.ItemData(cmbAllowControl.NewIndex) = -1
cmbAllowControl.AddItem "Нет"
cmbAllowControl.ItemData(cmbAllowControl.NewIndex) = 0
 For iii = 0 To cmbAllowControl.ListCount - 1
  If Item.AllowControl = cmbAllowControl.ItemData(iii) Then
   cmbAllowControl.ListIndex = iii
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

If txtTheGroup.Tag <> "" Then
  Set Item.TheGroup = Item.Application.FindRowObject("Users", txtTheGroup.Tag)
Else
  Set Item.TheGroup = Nothing
End If
Item.AllowStart = cmbAllowStart.ItemData(cmbAllowStart.ListIndex)
Item.AllowCheckState = cmbAllowCheckState.ItemData(cmbAllowCheckState.ListIndex)
Item.AllowAnaliz = cmbAllowAnaliz.ItemData(cmbAllowAnaliz.ListIndex)
Item.AllowControl = cmbAllowControl.ItemData(cmbAllowControl.ListIndex)
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



