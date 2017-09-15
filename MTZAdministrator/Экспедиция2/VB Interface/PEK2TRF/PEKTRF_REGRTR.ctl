VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl PEKTRF_REGRTR 
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
      Begin MTZ_PANEL.DropButton cmdPriceCurrency 
         Height          =   300
         Left            =   2850
         TabIndex        =   14
         Tag             =   "refopen.ico"
         ToolTipText     =   "Валюта фиксированной цены"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtPriceCurrency 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   13
         ToolTipText     =   "Валюта фиксированной цены"
         Top             =   3930
         Width           =   2550
      End
      Begin MSMask.MaskEdBox txtFixedPrice 
         Height          =   300
         Left            =   300
         TabIndex        =   11
         ToolTipText     =   "Фиксированная цена"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtPricePercent 
         Height          =   300
         Left            =   300
         TabIndex        =   9
         ToolTipText     =   "Процент от тарифа"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MTZ_PANEL.DropButton cmdWeightEDIZM 
         Height          =   300
         Left            =   2850
         TabIndex        =   7
         Tag             =   "refopen.ico"
         ToolTipText     =   "Ед. изм. веса"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtWeightEDIZM 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   6
         ToolTipText     =   "Ед. изм. веса"
         Top             =   1815
         Width           =   2550
      End
      Begin MSMask.MaskEdBox txtWeightTo 
         Height          =   300
         Left            =   300
         TabIndex        =   4
         ToolTipText     =   "Суммарный вес по"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtWeightFrom 
         Height          =   300
         Left            =   300
         TabIndex        =   2
         ToolTipText     =   "Суммарный вес от"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.Label lblPriceCurrency 
         BackStyle       =   0  'Transparent
         Caption         =   "Валюта фиксированной цены:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblFixedPrice 
         BackStyle       =   0  'Transparent
         Caption         =   "Фиксированная цена:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblPricePercent 
         BackStyle       =   0  'Transparent
         Caption         =   "Процент от тарифа:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblWeightEDIZM 
         BackStyle       =   0  'Transparent
         Caption         =   "Ед. изм. веса:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblWeightTo 
         BackStyle       =   0  'Transparent
         Caption         =   "Суммарный вес по:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblWeightFrom 
         BackStyle       =   0  'Transparent
         Caption         =   "Суммарный вес от:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "PEKTRF_REGRTR"
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

Private Sub txtWeightFrom_Validate(cancel As Boolean)
If txtWeightFrom.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtWeightFrom.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtWeightFrom.SetFocus
  ElseIf Val(txtWeightFrom.Text) < -922337203685478# Or Val(txtWeightFrom.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtWeightFrom.SetFocus
  End If
End If
End Sub
Private Sub txtWeightFrom_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtWeightFrom_Change()
  Changing

End Sub
Private Sub txtWeightTo_Validate(cancel As Boolean)
If txtWeightTo.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtWeightTo.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtWeightTo.SetFocus
  ElseIf Val(txtWeightTo.Text) < -922337203685478# Or Val(txtWeightTo.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtWeightTo.SetFocus
  End If
End If
End Sub
Private Sub txtWeightTo_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtWeightTo_Change()
  Changing

End Sub
Private Sub txtWeightEDIZM_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdWeightEDIZM_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ENTDIC_EDIZM", ID, brief) Then
          txtWeightEDIZM.Tag = Left(ID, 38)
          txtWeightEDIZM = brief
        End If
End Sub
Private Sub cmdWeightEDIZM_MenuClick(ByVal sCaption As String)
          txtWeightEDIZM.Tag = ""
          txtWeightEDIZM = ""
End Sub
Private Sub txtPricePercent_Validate(cancel As Boolean)
If txtPricePercent.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPricePercent.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtPricePercent.SetFocus
  ElseIf Val(txtPricePercent.Text) < -922337203685478# Or Val(txtPricePercent.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtPricePercent.SetFocus
  End If
End If
End Sub
Private Sub txtPricePercent_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPricePercent_Change()
  Changing

End Sub
Private Sub txtFixedPrice_Validate(cancel As Boolean)
If txtFixedPrice.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtFixedPrice.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtFixedPrice.SetFocus
  ElseIf Val(txtFixedPrice.Text) < -922337203685478# Or Val(txtFixedPrice.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtFixedPrice.SetFocus
  End If
End If
End Sub
Private Sub txtFixedPrice_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtFixedPrice_Change()
  Changing

End Sub
Private Sub txtPriceCurrency_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdPriceCurrency_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ENTDIC_CURRENCY", ID, brief) Then
          txtPriceCurrency.Tag = Left(ID, 38)
          txtPriceCurrency = brief
        End If
End Sub
Private Sub cmdPriceCurrency_MenuClick(ByVal sCaption As String)
          txtPriceCurrency.Tag = ""
          txtPriceCurrency = ""
End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtWeightFrom.Text)
If mIsOK Then mIsOK = IsSet(txtWeightTo.Text)
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

txtWeightFrom = Item.WeightFrom
txtWeightTo = Item.WeightTo
If Not Item.WeightEDIZM Is Nothing Then
  txtWeightEDIZM.Tag = Item.WeightEDIZM.ID
  txtWeightEDIZM = Item.WeightEDIZM.brief
Else
  txtWeightEDIZM.Tag = ""
  txtWeightEDIZM = ""
End If
 LoadBtnPictures cmdWeightEDIZM, cmdWeightEDIZM.Tag
  cmdWeightEDIZM.RemoveAllMenu
  cmdWeightEDIZM.AddMenu "Очистить"
txtPricePercent = Item.PricePercent
txtFixedPrice = Item.FixedPrice
If Not Item.PriceCurrency Is Nothing Then
  txtPriceCurrency.Tag = Item.PriceCurrency.ID
  txtPriceCurrency = Item.PriceCurrency.brief
Else
  txtPriceCurrency.Tag = ""
  txtPriceCurrency = ""
End If
 LoadBtnPictures cmdPriceCurrency, cmdPriceCurrency.Tag
  cmdPriceCurrency.RemoveAllMenu
  cmdPriceCurrency.AddMenu "Очистить"
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

Item.WeightFrom = CDbl(txtWeightFrom)
Item.WeightTo = CDbl(txtWeightTo)
If txtWeightEDIZM.Tag <> "" Then
  Set Item.WeightEDIZM = Item.Application.FindRowObject("ENTDIC_EDIZM", txtWeightEDIZM.Tag)
Else
  Set Item.WeightEDIZM = Nothing
End If
Item.PricePercent = CDbl(txtPricePercent)
Item.FixedPrice = CDbl(txtFixedPrice)
If txtPriceCurrency.Tag <> "" Then
  Set Item.PriceCurrency = Item.Application.FindRowObject("ENTDIC_CURRENCY", txtPriceCurrency.Tag)
Else
  Set Item.PriceCurrency = Nothing
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



