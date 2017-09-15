VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl VRCAccountsur 
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
      Begin VB.TextBox txtCode1C 
         Height          =   300
         Left            =   300
         MaxLength       =   40
         TabIndex        =   11
         ToolTipText     =   "Код1С"
         Top             =   4125
         Width           =   3000
      End
      Begin VB.ComboBox cmbDefaultAccount 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   9
         ToolTipText     =   "Основной счет для расчетов"
         Top             =   3420
         Width           =   3000
      End
      Begin VB.TextBox txtfillial 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   7
         ToolTipText     =   "Название филиала"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtacc 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   5
         ToolTipText     =   "№ счета"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdBANK 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Банк"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtBANK 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Банк"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblCode1C 
         BackStyle       =   0  'Transparent
         Caption         =   "Код1С:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   3795
         Width           =   3000
      End
      Begin VB.Label lblDefaultAccount 
         BackStyle       =   0  'Transparent
         Caption         =   "Основной счет для расчетов:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   3090
         Width           =   3000
      End
      Begin VB.Label lblfillial 
         BackStyle       =   0  'Transparent
         Caption         =   "Название филиала:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblacc 
         BackStyle       =   0  'Transparent
         Caption         =   "№ счета:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblBANK 
         BackStyle       =   0  'Transparent
         Caption         =   "Банк:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "VRCAccountsur"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean





Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef brief As String, ByRef Cancel As Boolean) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, brief, Cancel)
bye:
findObject = result
End Function
Public Function IsChanged() As Boolean
  IsChanged = mIsChanged
End Function
Private Sub Usercontrol_resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub txtBANK_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdBANK_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ENTDIC_BANK", ID, brief) Then
          txtBANK.Tag = Left(ID, 38)
          txtBANK = brief
        End If
End Sub
Private Sub cmdBANK_MenuClick(ByVal sCaption As String)
          txtBANK.Tag = ""
          txtBANK = ""
End Sub
Private Sub txtacc_Change()
  Changing

End Sub
Private Sub txtfillial_Change()
  Changing

End Sub
Private Sub cmbDefaultAccount_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtCode1C_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = txtBANK.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtacc.Text)
If mIsOK Then mIsOK = (cmbDefaultAccount.ListIndex >= 0)
  IsOK = mIsOK
End Function
Private Function AddSQLRefIds(ByVal strTo As String, ByVal fldName As String, ByVal strFrom As String) As String
  Dim XMLDocFrom As New DOMDocument
  Dim XMLDocTo As New DOMDocument
  AddSQLRefIds = strTo
  On Error GoTo err
  Call XMLDocTo.loadXML(strTo)
  Call XMLDocFrom.loadXML(strFrom)
  Dim Node As MSXML2.IXMLDOMNode
  Dim ID As String
  For Each Node In XMLDocFrom.childNodes.Item(0).childNodes
    If (Node.baseName = "ID") Then
      ID = Node.Text
      Dim NodeTO As MSXML2.IXMLDOMNode
      Dim bAdded As Boolean
      bAdded = False
      For Each NodeTO In XMLDocTo.childNodes.Item(0).childNodes
       If (NodeTO.baseName = fldName & "ID") Then
         NodeTO.Text = ID
         bAdded = True
         Exit For
       End If
      Next
      If (Not bAdded) Then
       Dim newNode As MSXML2.IXMLDOMNode
       Set newNode = XMLDocTo.createNode(MSXML2.NODE_ELEMENT, fldName & "ID", XMLDocTo.namespaceURI)
        newNode.Text = ID
       Call XMLDocTo.childNodes.Item(0).appendChild(newNode)
      End If
      AddSQLRefIds = XMLDocTo.xml
      Exit For
    End If
  Next
err:
End Function
Public Sub InitPanel()
OnInit = True
Dim iii As Long ' for combo only
If Item.CanChange Then
  Panel.Enabled = True
Else
  Panel.Enabled = False
End If

If Not Item.BANK Is Nothing Then
  txtBANK.Tag = Item.BANK.ID
  txtBANK = Item.BANK.brief
Else
  txtBANK.Tag = ""
  txtBANK = ""
End If
 LoadBtnPictures cmdBANK, cmdBANK.Tag
  cmdBANK.RemoveAllMenu
  cmdBANK.AddMenu "Очистить"
  On Error Resume Next
txtacc = Item.acc
txtfillial = Item.fillial
cmbDefaultAccount.Clear
cmbDefaultAccount.AddItem "Да"
cmbDefaultAccount.ItemData(cmbDefaultAccount.NewIndex) = -1
cmbDefaultAccount.AddItem "Нет"
cmbDefaultAccount.ItemData(cmbDefaultAccount.NewIndex) = 0
 For iii = 0 To cmbDefaultAccount.ListCount - 1
  If Item.DefaultAccount = cmbDefaultAccount.ItemData(iii) Then
   cmbDefaultAccount.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtCode1C = Item.Code1C
' Добавим значения ID ко всем SQLReference
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub

 mIsChanged = True
 RaiseEvent Changed
End Sub
Public Sub Save()
If OnInit Then Exit Sub

If txtBANK.Tag <> "" Then
  Set Item.BANK = Item.Application.FindRowObject("ENTDIC_BANK", txtBANK.Tag)
Else
  Set Item.BANK = Nothing
End If
Item.acc = txtacc
Item.fillial = txtfillial
 If cmbDefaultAccount.ListIndex >= 0 Then
   Item.DefaultAccount = cmbDefaultAccount.ItemData(cmbDefaultAccount.ListIndex)
 End If
Item.Code1C = txtCode1C
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



