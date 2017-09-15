VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#1.6#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WFDef_links 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin MTZ_PANEL.ScrolledWindow Panel 
      Height          =   2805
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   4725
      _ExtentX        =   8334
      _ExtentY        =   4948
      Begin VB.ComboBox cmbAcceptAnyResults 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   8
         ToolTipText     =   "При любом результате завершения"
         Top             =   1815
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdToFunc 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "refopen.ico"
         ToolTipText     =   "К"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtToFunc 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   5
         ToolTipText     =   "К"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdFromFunction 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "От"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtFromFunction 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "От"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblAcceptAnyResults 
         BackStyle       =   0  'Transparent
         Caption         =   "При любом результате завершения:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblToFunc 
         BackStyle       =   0  'Transparent
         Caption         =   "К:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblFromFunction 
         BackStyle       =   0  'Transparent
         Caption         =   "От:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WFDef_links"
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

Private Sub txtFromFunction_Change()
  Changing
End Sub
Private Sub cmdFromFunction_CLick()
  On Error Resume Next
        Dim d As Form
        Set d = Item.Application.Manager.GetReferenceDialogEx("WFDef_func")
        d.Show vbModal, Me
        If d.OK Then
          txtFromFunction.Tag = Left(d.ID, 38)
          txtFromFunction = d.Brief
        End If
        Set d = Nothing
End Sub
Private Sub cmdFromFunction_MenuClick(ByVal sCaption As String)
          txtFromFunction.Tag = ""
          txtFromFunction = ""
End Sub
Private Sub txtToFunc_Change()
  Changing
End Sub
Private Sub cmdToFunc_CLick()
  On Error Resume Next
        Dim d As Form
        Set d = Item.Application.Manager.GetReferenceDialogEx("WFDef_func")
        d.Show vbModal, Me
        If d.OK Then
          txtToFunc.Tag = Left(d.ID, 38)
          txtToFunc = d.Brief
        End If
        Set d = Nothing
End Sub
Private Sub cmdToFunc_MenuClick(ByVal sCaption As String)
          txtToFunc.Tag = ""
          txtToFunc = ""
End Sub
Private Sub cmbAcceptAnyResults_Click()
  On Error Resume Next
  Changing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = txtFromFunction.Tag <> ""
If mIsOK Then mIsOK = txtToFunc.Tag <> ""
If mIsOK Then mIsOK = (cmbAcceptAnyResults.ListIndex >= 0)
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

If Not Item.FromFunction Is Nothing Then
  txtFromFunction.Tag = Item.FromFunction.ID
  txtFromFunction = Item.FromFunction.Brief
Else
  txtFromFunction.Tag = ""
  txtFromFunction = ""
End If
 LoadBtnPictures cmdFromFunction, cmdFromFunction.Tag
  cmdFromFunction.RemoveAllMenu
If Not Item.ToFunc Is Nothing Then
  txtToFunc.Tag = Item.ToFunc.ID
  txtToFunc = Item.ToFunc.Brief
Else
  txtToFunc.Tag = ""
  txtToFunc = ""
End If
 LoadBtnPictures cmdToFunc, cmdToFunc.Tag
  cmdToFunc.RemoveAllMenu
cmbAcceptAnyResults.Clear
cmbAcceptAnyResults.AddItem "Да"
cmbAcceptAnyResults.ItemData(cmbAcceptAnyResults.NewIndex) = -1
cmbAcceptAnyResults.AddItem "Нет"
cmbAcceptAnyResults.ItemData(cmbAcceptAnyResults.NewIndex) = 0
 For iii = 0 To cmbAcceptAnyResults.ListCount - 1
  If Item.AcceptAnyResults = cmbAcceptAnyResults.ItemData(iii) Then
   cmbAcceptAnyResults.ListIndex = iii
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

If txtFromFunction.Tag <> "" Then
  Set Item.FromFunction = Item.Application.FindRowObject("WFDef_func", txtFromFunction.Tag)
Else
  Set Item.FromFunction = Nothing
End If
If txtToFunc.Tag <> "" Then
  Set Item.ToFunc = Item.Application.FindRowObject("WFDef_func", txtToFunc.Tag)
Else
  Set Item.ToFunc = Nothing
End If
Item.AcceptAnyResults = cmbAcceptAnyResults.ItemData(cmbAcceptAnyResults.ListIndex)
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

