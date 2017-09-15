VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WFRtm_Param 
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
      Begin VB.TextBox txtthe_Value 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   5
         ToolTipText     =   "Значение"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdBasedOn 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Реализует"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtBasedOn 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Реализует"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblthe_Value 
         BackStyle       =   0  'Transparent
         Caption         =   "Значение:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblBasedOn 
         BackStyle       =   0  'Transparent
         Caption         =   "Реализует:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WFRtm_Param"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean





Public Function IsChanged() As Boolean
  IsChanged = mIsChanged
End Function
Private Sub Usercontrol_resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub txtBasedOn_Change()
  Changing

End Sub
Private Sub cmdBasedOn_CLick()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WFDef_param", id, brief) Then
          txtBasedOn.Tag = Left(id, 38)
          txtBasedOn = brief
        End If
End Sub
Private Sub cmdBasedOn_MenuClick(ByVal sCaption As String)
          txtBasedOn.Tag = ""
          txtBasedOn = ""
End Sub
Private Sub txtthe_Value_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = txtBasedOn.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtthe_Value.Text)
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

If Not Item.BasedOn Is Nothing Then
  txtBasedOn.Tag = Item.BasedOn.id
  txtBasedOn = Item.BasedOn.brief
Else
  txtBasedOn.Tag = ""
  txtBasedOn = ""
End If
 LoadBtnPictures cmdBasedOn, cmdBasedOn.Tag
  cmdBasedOn.RemoveAllMenu
txtthe_Value = Item.the_Value
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub

 mIsChanged = True
 RaiseEvent Changed
End Sub
Public Sub Save()
If OnInit Then Exit Sub

If txtBasedOn.Tag <> "" Then
  Set Item.BasedOn = Item.Application.FindRowObject("WFDef_param", txtBasedOn.Tag)
Else
  Set Item.BasedOn = Nothing
End If
Item.the_Value = txtthe_Value
 mIsChanged = False
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



