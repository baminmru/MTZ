VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl PEKTRF_SRVmain 
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
      Begin MSMask.MaskEdBox txtQuant 
         Height          =   300
         Left            =   300
         TabIndex        =   13
         ToolTipText     =   "Количество"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MTZ_PANEL.DropButton cmdEDIZM 
         Height          =   300
         Left            =   2850
         TabIndex        =   11
         Tag             =   "refopen.ico"
         ToolTipText     =   "Ед. изм."
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtEDIZM 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   10
         ToolTipText     =   "Ед. изм."
         Top             =   2520
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdTheCurrency 
         Height          =   300
         Left            =   2850
         TabIndex        =   8
         Tag             =   "refopen.ico"
         ToolTipText     =   "Валюта"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheCurrency 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   7
         ToolTipText     =   "Валюта"
         Top             =   1815
         Width           =   2550
      End
      Begin MSMask.MaskEdBox txtPrice 
         Height          =   300
         Left            =   300
         TabIndex        =   5
         ToolTipText     =   "Цена"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MTZ_PANEL.DropButton cmdSrvTYPE 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Услуга"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtSrvTYPE 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Услуга"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblQuant 
         BackStyle       =   0  'Transparent
         Caption         =   "Количество:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblEDIZM 
         BackStyle       =   0  'Transparent
         Caption         =   "Ед. изм.:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblTheCurrency 
         BackStyle       =   0  'Transparent
         Caption         =   "Валюта:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblPrice 
         BackStyle       =   0  'Transparent
         Caption         =   "Цена:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblSrvTYPE 
         BackStyle       =   0  'Transparent
         Caption         =   "Услуга:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "PEKTRF_SRVmain"
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

Private Sub txtSrvTYPE_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdSrvTYPE_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PEKD_SRV", ID, brief) Then
          txtSrvTYPE.Tag = Left(ID, 38)
          txtSrvTYPE = brief
        End If
End Sub
Private Sub cmdSrvTYPE_MenuClick(ByVal sCaption As String)
          txtSrvTYPE.Tag = ""
          txtSrvTYPE = ""
End Sub
Private Sub txtPrice_Validate(cancel As Boolean)
If txtPrice.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPrice.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtPrice.SetFocus
  ElseIf Val(txtPrice.Text) < -922337203685478# Or Val(txtPrice.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtPrice.SetFocus
  End If
End If
End Sub
Private Sub txtPrice_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPrice_Change()
  Changing

End Sub
Private Sub txtTheCurrency_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheCurrency_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ENTDIC_CURRENCY", ID, brief) Then
          txtTheCurrency.Tag = Left(ID, 38)
          txtTheCurrency = brief
        End If
End Sub
Private Sub cmdTheCurrency_MenuClick(ByVal sCaption As String)
          txtTheCurrency.Tag = ""
          txtTheCurrency = ""
End Sub
Private Sub txtEDIZM_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdEDIZM_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ENTDIC_EDIZM", ID, brief) Then
          txtEDIZM.Tag = Left(ID, 38)
          txtEDIZM = brief
        End If
End Sub
Private Sub cmdEDIZM_MenuClick(ByVal sCaption As String)
          txtEDIZM.Tag = ""
          txtEDIZM = ""
End Sub
Private Sub txtQuant_Validate(cancel As Boolean)
If txtQuant.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQuant.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtQuant.SetFocus
  ElseIf Val(txtQuant.Text) < -922337203685478# Or Val(txtQuant.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtQuant.SetFocus
  End If
End If
End Sub
Private Sub txtQuant_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQuant_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = txtSrvTYPE.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtPrice.Text)
If mIsOK Then mIsOK = txtTheCurrency.Tag <> ""
If mIsOK Then mIsOK = txtEDIZM.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtQuant.Text)
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

If Not Item.SrvTYPE Is Nothing Then
  txtSrvTYPE.Tag = Item.SrvTYPE.ID
  txtSrvTYPE = Item.SrvTYPE.brief
Else
  txtSrvTYPE.Tag = ""
  txtSrvTYPE = ""
End If
 LoadBtnPictures cmdSrvTYPE, cmdSrvTYPE.Tag
  cmdSrvTYPE.RemoveAllMenu
  cmdSrvTYPE.AddMenu "Очистить"
txtPrice = Item.Price
If Not Item.TheCurrency Is Nothing Then
  txtTheCurrency.Tag = Item.TheCurrency.ID
  txtTheCurrency = Item.TheCurrency.brief
Else
  txtTheCurrency.Tag = ""
  txtTheCurrency = ""
End If
 LoadBtnPictures cmdTheCurrency, cmdTheCurrency.Tag
  cmdTheCurrency.RemoveAllMenu
  cmdTheCurrency.AddMenu "Очистить"
If Not Item.EDIZM Is Nothing Then
  txtEDIZM.Tag = Item.EDIZM.ID
  txtEDIZM = Item.EDIZM.brief
Else
  txtEDIZM.Tag = ""
  txtEDIZM = ""
End If
 LoadBtnPictures cmdEDIZM, cmdEDIZM.Tag
  cmdEDIZM.RemoveAllMenu
  cmdEDIZM.AddMenu "Очистить"
txtQuant = Item.Quant
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

If txtSrvTYPE.Tag <> "" Then
  Set Item.SrvTYPE = Item.Application.FindRowObject("PEKD_SRV", txtSrvTYPE.Tag)
Else
  Set Item.SrvTYPE = Nothing
End If
Item.Price = CDbl(txtPrice)
If txtTheCurrency.Tag <> "" Then
  Set Item.TheCurrency = Item.Application.FindRowObject("ENTDIC_CURRENCY", txtTheCurrency.Tag)
Else
  Set Item.TheCurrency = Nothing
End If
If txtEDIZM.Tag <> "" Then
  Set Item.EDIZM = Item.Application.FindRowObject("ENTDIC_EDIZM", txtEDIZM.Tag)
Else
  Set Item.EDIZM = Nothing
End If
Item.Quant = CDbl(txtQuant)
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



