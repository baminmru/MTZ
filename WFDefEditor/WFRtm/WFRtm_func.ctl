VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#1.6#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WFRtm_func 
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
      Begin MTZ_PANEL.DropButton cmdFunc 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Функция"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtFunc 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Функция"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblFunc 
         BackStyle       =   0  'Transparent
         Caption         =   "Функция:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WFRtm_func"
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

Private Sub txtFunc_Change()
  Changing
End Sub
Private Sub cmdFunc_CLick()
  On Error Resume Next
     If txtFunc.Tag = "" Then
       cmdFunc_MenuClick "Создать"
     Else
       cmdFunc_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdFunc_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim d As Form
    Dim id As String
  If sCaption = "Очистить" Then
       If txtFunc.Tag <> "" Then
         Item.Application.MTZSession.SetOwner txtFunc.Tag, "", Item.id
         Item.Application.Manager.DeleteInstance txtFunc.Tag
       End If
          txtFunc.Tag = ""
          txtFunc = ""
  End If
  If sCaption = "Открыть" Then
    If txtFunc.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtFunc.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtFunc.Tag)
    obj.Show "", inst, True
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        Set d = Item.Application.Manager.GetObjectListDialog("", "WFFR")
        d.Show vbModal, Me
        If d.OK Then
          txtFunc.Tag = Left(d.id, 38)
          txtFunc = d.Brief
        End If
        Set d = Nothing
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        id = CreateGUID2
        Item.Application.Manager.NewInstance id, "WFFR", "Активная функця " & Now
        Set obj = Item.Application.Manager.GetInstanceObject(id)
        If Not obj Is Nothing Then
          Item.Application.MTZSession.SetOwner obj.id, Item.PartName, Item.id
          txtFunc.Tag = obj.id
          txtFunc = obj.Brief
          Set obj = Nothing
        End If
  End If
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = txtFunc.Tag <> ""
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

If Not Item.Func Is Nothing Then
  txtFunc.Tag = Item.Func.id
  txtFunc = Item.Func.Brief
Else
  txtFunc.Tag = ""
  txtFunc = ""
End If
 LoadBtnPictures cmdFunc, cmdFunc.Tag
  cmdFunc.RemoveAllMenu
  cmdFunc.AddMenu "Открыть"
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Public Sub Save()
If OnInit Then Exit Sub

If txtFunc.Tag <> "" Then
  Set Item.Func = Item.Application.Manager.GetInstanceObject(txtFunc.Tag)
Else
  Set Item.Func = Nothing
End If
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

