VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WFRtm_Doc 
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
      Begin MTZ_PANEL.DropButton cmdDocument 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "refopen.ico"
         ToolTipText     =   "Документ"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtDocument 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   5
         ToolTipText     =   "Документ"
         Top             =   1110
         Width           =   2550
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
      Begin VB.Label lblDocument 
         BackStyle       =   0  'Transparent
         Caption         =   "Документ:"
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
Attribute VB_Name = "WFRtm_Doc"
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
        If Item.Application.Manager.GetReferenceDialogEx2("WFDef_Doc", id, brief) Then
          txtBasedOn.Tag = Left(id, 38)
          txtBasedOn = brief
        End If
End Sub
Private Sub cmdBasedOn_MenuClick(ByVal sCaption As String)
          txtBasedOn.Tag = ""
          txtBasedOn = ""
End Sub
Private Sub txtDocument_Change()
  Changing

End Sub
Private Sub cmdDocument_CLick()
  On Error Resume Next
     If txtDocument.Tag = "" Then
       cmdDocument_MenuClick "Выбрать"
     Else
       cmdDocument_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdDocument_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim id As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtDocument.Tag = ""
          txtDocument = ""
  End If
  If sCaption = "Открыть" Then
    If txtDocument.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtDocument.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtDocument.Tag)
    obj.Show "", inst, True
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(id, brief, "", "")
        If OK Then
          txtDocument.Tag = Left(id, 38)
          txtDocument = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Set obj = Item.Application.Manager.GetNewObject()
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.id)
          Gobj.Show "", obj, True
          Set obj = Item.Application.Manager.GetInstanceObject(obj.id)
          If (Not obj Is Nothing) Then
              txtDocument.Tag = obj.id
              txtDocument = obj.brief
          Else
              txtDocument.Tag = ""
              txtDocument = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = txtBasedOn.Tag <> ""
If mIsOK Then mIsOK = txtDocument.Tag <> ""
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
If Not Item.Document Is Nothing Then
  txtDocument.Tag = Item.Document.id
  txtDocument = Item.Document.brief
Else
  txtDocument.Tag = ""
  txtDocument = ""
End If
 LoadBtnPictures cmdDocument, cmdDocument.Tag
  cmdDocument.RemoveAllMenu
  cmdDocument.AddMenu "Открыть"
  cmdDocument.AddMenu "Создать"
  cmdDocument.AddMenu "Выбрать"
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
  Set Item.BasedOn = Item.Application.FindRowObject("WFDef_Doc", txtBasedOn.Tag)
Else
  Set Item.BasedOn = Nothing
End If
If txtDocument.Tag <> "" Then
  Set Item.Document = Item.Application.Manager.GetInstanceObject(txtDocument.Tag)
Else
  Set Item.Document = Nothing
End If
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



