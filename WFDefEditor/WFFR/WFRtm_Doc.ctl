VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#1.7#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WFRtm_Doc 
   ClientHeight    =   1620
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3705
   ScaleHeight     =   1620
   ScaleWidth      =   3705
   Begin MTZ_PANEL.ScrolledWindow Panel 
      Height          =   1365
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   3525
      _ExtentX        =   6218
      _ExtentY        =   2408
      Begin MTZ_PANEL.DropButton cmdDocument 
         Height          =   300
         Left            =   2730
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Документ"
         Top             =   510
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtDocument 
         Height          =   300
         Left            =   180
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Документ"
         Top             =   510
         Width           =   2550
      End
      Begin VB.Label lblDocument 
         BackStyle       =   0  'Transparent
         Caption         =   "Документ:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   180
         TabIndex        =   1
         Top             =   180
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


   Public item As Object
   Private OnInit As Boolean
   Public Event Changed()


Private Sub UserControl_Resize()
  On Error Resume Next
  panel.Width = UserControl.Width
  panel.Height = UserControl.Height
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
    Dim d As Form
    Dim id As String
  If sCaption = "Открыть" Then
    If txtDocument.Tag = "" Then Exit Sub
    Set inst = item.Application.Manager.GetInstanceObject(txtDocument.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = item.Application.Manager.GetInstanceGUI(txtDocument.Tag)
    obj.Show "", inst, True
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        Set d = item.Application.Manager.GetObjectListDialog("", "")
        d.Show vbModal, Me
        If d.OK Then
          txtDocument.Tag = Left(d.id, 38)
          txtDocument = d.Brief
        End If
        Set d = Nothing
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Set obj = item.Application.Manager.GetNewObject()
        If Not obj Is Nothing Then
          txtDocument.Tag = obj.id
          txtDocument = obj.Brief
          Set obj = Nothing
        End If
  End If
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True
  If mIsOK Then mIsOK = txtDocument.Tag <> ""
  IsOK = mIsOK
End Function
Public Sub InitPanel()
OnInit = True
Dim iii As Long ' for combo only
If item.CanChange Then
  panel.Enabled = True
Else
  panel.Enabled = False
End If

If Not item.Document Is Nothing Then
  txtDocument.Tag = item.Document.id
  txtDocument = item.Document.Brief
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

If txtDocument.Tag <> "" Then
  Set item.Document = item.Application.Manager.GetInstanceObject(txtDocument.Tag)
Else
  Set item.Document = Nothing
End If
 RaiseEvent Changed
End Sub
 Public Sub OptimalSize(x As Single, y As Single)
   panel.OptimalSize x, y
   x = x + panel.Left
   y = y + panel.Top
 End Sub
 
 
 Public Function OptimalY() As Single
   Dim x As Single, y As Single
   panel.OptimalSize x, y
   OptimalY = y
 End Function
 Public Sub Customize()
   panel.Customize
 End Sub
 Public Property Get PanelCustomisationString() As String
   PanelCustomisationString = panel.PanelCustomisationString
 End Property
 Public Property Let PanelCustomisationString(s As String)
   panel.PanelCustomisationString = s
 End Property
 Public Property Get Enabled() As Boolean
   Enabled = panel.Enabled
 End Property
 Public Property Let Enabled(ByVal v As Boolean)
   panel.Enabled = v
 End Property

