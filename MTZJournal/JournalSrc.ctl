VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#1.5#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl JournalSrc 
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
      Begin VB.TextBox txtOpenMode 
         Height          =   300
         Left            =   300
         TabIndex        =   7
         ToolTipText     =   "Режим открытия"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.ComboBox cmbOnRun 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   5
         ToolTipText     =   "При открытии"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdPartView 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Представление"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtPartView 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Представление"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblOpenMode 
         BackStyle       =   0  'Transparent
         Caption         =   "Режим открытия"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblOnRun 
         BackStyle       =   0  'Transparent
         Caption         =   "При открытии"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblPartView 
         BackStyle       =   0  'Transparent
         Caption         =   "Представление"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "JournalSrc"
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

Private Sub txtPartView_Change()
  Changing
End Sub
Private Sub cmdPartView_CLick()
  On Error Resume Next
        Dim d As Form
        Set d = Item.Application.Manager.GetReferenceDialog("PartView")
        d.Show vbModal, Me
        If d.OK Then
          txtPartView.Tag = Left(d.ID, 38)
          txtPartView = d.Brief
        End If
        Set d = Nothing
End Sub
Private Sub cmdPartView_MenuClick(ByVal sCaption As String)
          txtPartView.Tag = ""
          txtPartView = ""
End Sub
Private Sub cmbOnRun_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub txtOpenMode_Change()
  Changing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = txtPartView.Tag <> ""
If mIsOK Then mIsOK = (cmbOnRun.ListIndex >= 0)
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

If Not Item.PartView Is Nothing Then
  txtPartView.Tag = Item.PartView.ID
  txtPartView = Item.PartView.Brief
Else
  txtPartView.Tag = ""
  txtPartView = ""
End If
 LoadBtnPictures cmdPartView, cmdPartView.Tag
cmbOnRun.Clear
cmbOnRun.AddItem "Открыть документ"
cmbOnRun.ItemData(cmbOnRun.NewIndex) = 2
cmbOnRun.AddItem "Открыть строку"
cmbOnRun.ItemData(cmbOnRun.NewIndex) = 1
cmbOnRun.AddItem "Ничего не делать"
cmbOnRun.ItemData(cmbOnRun.NewIndex) = 0
 For iii = 0 To cmbOnRun.ListCount - 1
  If Item.OnRun = cmbOnRun.ItemData(iii) Then
   cmbOnRun.ListIndex = iii
   Exit For
  End If
 Next
txtOpenMode = Item.OpenMode
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Public Sub Save()
If OnInit Then Exit Sub

If txtPartView.Tag <> "" Then
  Set Item.PartView = Item.Application.FindRowObject("PartView", txtPartView.Tag)
Else
  Set Item.PartView = Nothing
End If
Item.OnRun = cmbOnRun.ItemData(cmbOnRun.ListIndex)
Item.OpenMode = txtOpenMode
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

