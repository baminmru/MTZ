VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl JColumnSource 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin MTZ_PANEL.ScrolledWindow Panel 
      Height          =   1515
      Left            =   0
      TabIndex        =   5
      Top             =   0
      Width           =   3285
      _ExtentX        =   5794
      _ExtentY        =   2672
      Begin VB.TextBox txtViewField 
         Height          =   300
         Left            =   150
         MaxLength       =   255
         TabIndex        =   4
         ToolTipText     =   "Поле представления"
         Top             =   960
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdSrcPartView 
         Height          =   300
         Left            =   2700
         TabIndex        =   2
         Tag             =   "refopen.ico"
         ToolTipText     =   "Представление"
         Top             =   315
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtSrcPartView 
         Height          =   300
         Left            =   150
         Locked          =   -1  'True
         TabIndex        =   1
         ToolTipText     =   "Представление"
         Top             =   315
         Width           =   2550
      End
      Begin VB.Label lblViewField 
         BackStyle       =   0  'Transparent
         Caption         =   "Поле представления:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   150
         TabIndex        =   3
         Top             =   690
         Width           =   3000
      End
      Begin VB.Label lblSrcPartView 
         BackStyle       =   0  'Transparent
         Caption         =   "Представление:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   150
         TabIndex        =   0
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "JColumnSource"
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

Private Sub txtSrcPartView_Change()
  Changing
End Sub
Private Sub cmdSrcPartView_CLick()
  On Error Resume Next
        Dim d As Form
        Set d = Item.Application.Manager.GetReferenceDialog("JournalSrc")
        d.Show vbModal, Me
        If d.OK Then
          txtSrcPartView.Tag = Left(d.ID, 38)
          txtSrcPartView = d.Brief
        End If
        Set d = Nothing
End Sub
Private Sub cmdSrcPartView_MenuClick(ByVal sCaption As String)
          txtSrcPartView.Tag = ""
          txtSrcPartView = ""
End Sub
Private Sub txtViewField_Change()
  Changing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = txtSrcPartView.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtViewField.Text)
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

If Not Item.SrcPartView Is Nothing Then
  txtSrcPartView.Tag = Item.SrcPartView.ID
  txtSrcPartView = Item.SrcPartView.Brief
Else
  txtSrcPartView.Tag = ""
  txtSrcPartView = ""
End If
 LoadBtnPictures cmdSrcPartView, cmdSrcPartView.Tag
txtViewField = Item.ViewField
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Public Sub Save()
If OnInit Then Exit Sub

If txtSrcPartView.Tag <> "" Then
  Set Item.SrcPartView = Item.Application.FindRowObject("JournalSrc", txtSrcPartView.Tag)
Else
  Set Item.SrcPartView = Nothing
End If
Item.ViewField = txtViewField
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

