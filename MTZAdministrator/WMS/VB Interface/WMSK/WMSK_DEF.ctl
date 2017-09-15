VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WMSK_DEF 
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
      Begin VB.TextBox txtTheComment 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   17
         ToolTipText     =   "Комментарий"
         Top             =   6240
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdmail 
         Height          =   300
         Left            =   2850
         TabIndex        =   15
         Tag             =   "mailopen.ico"
         ToolTipText     =   "E-mail"
         Top             =   5535
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtmail 
         Height          =   300
         Left            =   300
         TabIndex        =   14
         ToolTipText     =   "E-mail"
         Top             =   5535
         Width           =   2550
      End
      Begin VB.TextBox txtfax 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   12
         ToolTipText     =   "Факс"
         Top             =   4830
         Width           =   3000
      End
      Begin VB.TextBox txtfon2 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   10
         ToolTipText     =   "Телефон 2"
         Top             =   4125
         Width           =   3000
      End
      Begin VB.TextBox txtfon1 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   8
         ToolTipText     =   "Телефон 1"
         Top             =   3420
         Width           =   3000
      End
      Begin VB.TextBox txtaddress 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   6
         ToolTipText     =   "Адрес"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtname 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   4
         ToolTipText     =   "Название"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtcode 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "Код"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblTheComment 
         BackStyle       =   0  'Transparent
         Caption         =   "Комментарий:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   5910
         Width           =   3000
      End
      Begin VB.Label lblmail 
         BackStyle       =   0  'Transparent
         Caption         =   "E-mail:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   5205
         Width           =   3000
      End
      Begin VB.Label lblfax 
         BackStyle       =   0  'Transparent
         Caption         =   "Факс:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   4500
         Width           =   3000
      End
      Begin VB.Label lblfon2 
         BackStyle       =   0  'Transparent
         Caption         =   "Телефон 2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   3795
         Width           =   3000
      End
      Begin VB.Label lblfon1 
         BackStyle       =   0  'Transparent
         Caption         =   "Телефон 1:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   3090
         Width           =   3000
      End
      Begin VB.Label lbladdress 
         BackStyle       =   0  'Transparent
         Caption         =   "Адрес:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblname 
         BackStyle       =   0  'Transparent
         Caption         =   "Название:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblcode 
         BackStyle       =   0  'Transparent
         Caption         =   "Код:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WMSK_DEF"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean





Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef Brief As String, ByRef Cancel As Boolean) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, Brief, Cancel)
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

Private Sub txtcode_Change()
  Changing

End Sub
Private Sub txtname_Change()
  Changing

End Sub
Private Sub txtaddress_Change()
  Changing

End Sub
Private Sub txtfon1_Change()
  Changing

End Sub
Private Sub txtfon2_Change()
  Changing

End Sub
Private Sub txtfax_Change()
  Changing

End Sub
Private Sub txtmail_Change()
  Changing

End Sub
Private Sub cmdmail_Click()
  On Error Resume Next
  Dim s As String
  s = s & "mailto:" & txtmail.Text
  OpenDocument 0, s
End Sub
Private Sub txtTheComment_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtname.Text)
If mIsOK Then mIsOK = IsSet(txtaddress.Text)
If mIsOK Then mIsOK = IsSet(txtfon1.Text)
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

  On Error Resume Next
txtcode = Item.code
  On Error Resume Next
txtname = Item.Name
txtaddress = Item.address
  On Error Resume Next
txtfon1 = Item.fon1
  On Error Resume Next
txtfon2 = Item.fon2
  On Error Resume Next
txtfax = Item.fax
  On Error Resume Next
txtmail = Item.mail
 LoadBtnPictures cmdmail, cmdmail.Tag
  cmdmail.RemoveAllMenu
txtTheComment = Item.TheComment
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

Item.code = txtcode
Item.Name = txtname
Item.address = txtaddress
Item.fon1 = txtfon1
Item.fon2 = txtfon2
Item.fax = txtfax
Item.mail = txtmail
Item.TheComment = txtTheComment
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



