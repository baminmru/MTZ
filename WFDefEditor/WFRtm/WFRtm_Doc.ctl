VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#1.7#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WFRtm_Doc 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin MTZ_PANEL.ScrolledWindow Panel 
      Height          =   3285
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   4245
      _ExtentX        =   7488
      _ExtentY        =   5794
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
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblBasedOn 
         BackStyle       =   0  'Transparent
         Caption         =   "Реализует:"
         ForeColor       =   &H00000000&
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


Private Sub UserControl_Resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub txtBasedOn_Change()
  Changing
End Sub
Private Sub cmdBasedOn_CLick()
  On Error Resume Next
        Dim d As Form
        Set d = Item.Application.Manager.GetReferenceDialogEx("WFDef_Doc")
        d.InstanceID = Item.Application.WFRtm_main.Item(1).BasedOn.ID
        d.Show vbModal, Me
        If d.OK Then
          txtBasedOn.Tag = Left(d.ID, 38)
          txtBasedOn = d.Brief
        End If
        Set d = Nothing
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
    Dim Obj As Object
    Dim d As Form
    Dim ID As String
  If sCaption = "Очистить" Then
          txtDocument.Tag = ""
          txtDocument = ""
  End If
  If sCaption = "Открыть" Then
    If txtDocument.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtDocument.Tag)
    If inst Is Nothing Then Exit Sub
    Set Obj = Item.Application.Manager.GetInstanceGUI(txtDocument.Tag)
    Obj.Show "", inst, True
    Set Obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        Set d = Item.Application.Manager.GetObjectListDialog("", "")
        d.Show vbModal, Me
        If d.OK Then
          txtDocument.Tag = Left(d.ID, 38)
          txtDocument = d.Brief
        End If
        Set d = Nothing
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Set Obj = Item.Application.Manager.GetNewObject()
        If Not Obj Is Nothing Then
          txtDocument.Tag = Obj.ID
          txtDocument = Obj.Brief
          Set Obj = Nothing
        End If
  End If
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
  txtBasedOn.Tag = Item.BasedOn.ID
  txtBasedOn = Item.BasedOn.Brief
Else
  txtBasedOn.Tag = ""
  txtBasedOn = ""
End If
 LoadBtnPictures cmdBasedOn, cmdBasedOn.Tag
  cmdBasedOn.RemoveAllMenu
If Not Item.Document Is Nothing Then
  txtDocument.Tag = Item.Document.ID
  txtDocument = Item.Document.Brief
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

