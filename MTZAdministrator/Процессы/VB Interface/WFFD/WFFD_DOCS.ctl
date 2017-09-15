VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WFFD_DOCS 
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
      Begin VB.TextBox txtDocMode 
         Height          =   300
         Left            =   300
         MaxLength       =   5
         TabIndex        =   9
         ToolTipText     =   "Режим открытия документа"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.ComboBox cmbAllowWrite 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   7
         ToolTipText     =   "Ожидается модификация"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.ComboBox cmbAllowCreate 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   5
         ToolTipText     =   "Ожидается создание"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdProcessDocument 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Документ процеса"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtProcessDocument 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Документ процеса"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblDocMode 
         BackStyle       =   0  'Transparent
         Caption         =   "Режим открытия документа:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblAllowWrite 
         BackStyle       =   0  'Transparent
         Caption         =   "Ожидается модификация:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblAllowCreate 
         BackStyle       =   0  'Transparent
         Caption         =   "Ожидается создание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblProcessDocument 
         BackStyle       =   0  'Transparent
         Caption         =   "Документ процеса:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WFFD_DOCS"
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

Private Sub txtProcessDocument_Change()
  Changing

End Sub
Private Sub cmdProcessDocument_CLick()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WFDef_Doc", id, brief) Then
          txtProcessDocument.Tag = Left(id, 38)
          txtProcessDocument = brief
        End If
End Sub
Private Sub cmdProcessDocument_MenuClick(ByVal sCaption As String)
          txtProcessDocument.Tag = ""
          txtProcessDocument = ""
End Sub
Private Sub cmbAllowCreate_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbAllowWrite_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtDocMode_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = txtProcessDocument.Tag <> ""
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

If Not Item.ProcessDocument Is Nothing Then
  txtProcessDocument.Tag = Item.ProcessDocument.id
  txtProcessDocument = Item.ProcessDocument.brief
Else
  txtProcessDocument.Tag = ""
  txtProcessDocument = ""
End If
 LoadBtnPictures cmdProcessDocument, cmdProcessDocument.Tag
  cmdProcessDocument.RemoveAllMenu
cmbAllowCreate.Clear
cmbAllowCreate.AddItem "Да"
cmbAllowCreate.ItemData(cmbAllowCreate.NewIndex) = -1
cmbAllowCreate.AddItem "Нет"
cmbAllowCreate.ItemData(cmbAllowCreate.NewIndex) = 0
 For iii = 0 To cmbAllowCreate.ListCount - 1
  If Item.AllowCreate = cmbAllowCreate.ItemData(iii) Then
   cmbAllowCreate.ListIndex = iii
   Exit For
  End If
 Next
cmbAllowWrite.Clear
cmbAllowWrite.AddItem "Да"
cmbAllowWrite.ItemData(cmbAllowWrite.NewIndex) = -1
cmbAllowWrite.AddItem "Нет"
cmbAllowWrite.ItemData(cmbAllowWrite.NewIndex) = 0
 For iii = 0 To cmbAllowWrite.ListCount - 1
  If Item.AllowWrite = cmbAllowWrite.ItemData(iii) Then
   cmbAllowWrite.ListIndex = iii
   Exit For
  End If
 Next
txtDocMode = Item.DocMode
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub

 mIsChanged = True
 RaiseEvent Changed
End Sub
Public Sub Save()
If OnInit Then Exit Sub

If txtProcessDocument.Tag <> "" Then
  Set Item.ProcessDocument = Item.Application.FindRowObject("WFDef_Doc", txtProcessDocument.Tag)
Else
  Set Item.ProcessDocument = Nothing
End If
 If cmbAllowCreate.ListIndex >= 0 Then
   Item.AllowCreate = cmbAllowCreate.ItemData(cmbAllowCreate.ListIndex)
 End If
 If cmbAllowWrite.ListIndex >= 0 Then
   Item.AllowWrite = cmbAllowWrite.ItemData(cmbAllowWrite.ListIndex)
 End If
Item.DocMode = txtDocMode
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



