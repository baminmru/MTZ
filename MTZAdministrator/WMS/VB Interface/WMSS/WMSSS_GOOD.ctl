VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl WMSSS_GOOD 
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
      Begin MSMask.MaskEdBox txtGoodQuantity 
         Height          =   300
         Left            =   300
         TabIndex        =   8
         ToolTipText     =   "Количество"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MTZ_PANEL.DropButton cmdPallete 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "refopen.ico"
         ToolTipText     =   "Поддон"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtPallete 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   5
         ToolTipText     =   "Поддон"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdItem_id 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Товар"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtItem_id 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Товар"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblGoodQuantity 
         BackStyle       =   0  'Transparent
         Caption         =   "Количество:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblPallete 
         BackStyle       =   0  'Transparent
         Caption         =   "Поддон:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblItem_id 
         BackStyle       =   0  'Transparent
         Caption         =   "Товар:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WMSSS_GOOD"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean





Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef brief As String, ByRef cancel As Boolean) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, brief, cancel)
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

Private Sub txtItem_id_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdItem_id_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WMSG_NOM", ID, brief) Then
          txtItem_id.Tag = Left(ID, 38)
          txtItem_id = brief
        End If
End Sub
Private Sub cmdItem_id_MenuClick(ByVal sCaption As String)
          txtItem_id.Tag = ""
          txtItem_id = ""
End Sub
Private Sub txtPallete_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdPallete_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WMSPL_DEF", ID, brief) Then
          txtPallete.Tag = Left(ID, 38)
          txtPallete = brief
        End If
End Sub
Private Sub cmdPallete_MenuClick(ByVal sCaption As String)
          txtPallete.Tag = ""
          txtPallete = ""
End Sub
Private Sub txtGoodQuantity_Validate(cancel As Boolean)
If txtGoodQuantity.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtGoodQuantity.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtGoodQuantity.SetFocus
  ElseIf Val(txtGoodQuantity.Text) < -922337203685478# Or Val(txtGoodQuantity.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtGoodQuantity.SetFocus
  End If
End If
End Sub
Private Sub txtGoodQuantity_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtGoodQuantity_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = txtItem_id.Tag <> ""
If mIsOK Then mIsOK = txtPallete.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtGoodQuantity.Text)
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

If Not Item.Item_id Is Nothing Then
  txtItem_id.Tag = Item.Item_id.ID
  txtItem_id = Item.Item_id.brief
Else
  txtItem_id.Tag = ""
  txtItem_id = ""
End If
 LoadBtnPictures cmdItem_id, cmdItem_id.Tag
  cmdItem_id.RemoveAllMenu
  cmdItem_id.AddMenu "Очистить"
If Not Item.Pallete Is Nothing Then
  txtPallete.Tag = Item.Pallete.ID
  txtPallete = Item.Pallete.brief
Else
  txtPallete.Tag = ""
  txtPallete = ""
End If
 LoadBtnPictures cmdPallete, cmdPallete.Tag
  cmdPallete.RemoveAllMenu
  cmdPallete.AddMenu "Очистить"
txtGoodQuantity = Item.GoodQuantity
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

If txtItem_id.Tag <> "" Then
  Set Item.Item_id = Item.Application.FindRowObject("WMSG_NOM", txtItem_id.Tag)
Else
  Set Item.Item_id = Nothing
End If
If txtPallete.Tag <> "" Then
  Set Item.Pallete = Item.Application.FindRowObject("WMSPL_DEF", txtPallete.Tag)
Else
  Set Item.Pallete = Nothing
End If
Item.GoodQuantity = CDbl(txtGoodQuantity)
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



