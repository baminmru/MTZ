VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl PEKZ_WLIST 
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
      Begin VB.TextBox txtQDocs 
         Height          =   300
         Left            =   6600
         MaxLength       =   15
         TabIndex        =   40
         ToolTipText     =   "Количество сопроводительных документов"
         Top             =   405
         Width           =   1800
      End
      Begin VB.TextBox txtOrderNum 
         Height          =   300
         Left            =   3450
         MaxLength       =   30
         TabIndex        =   38
         ToolTipText     =   "№ счета"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txtQSertif 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   36
         ToolTipText     =   "Количество сертификатов"
         Top             =   5340
         Width           =   1800
      End
      Begin VB.TextBox txtQLicense 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   34
         ToolTipText     =   "Количество лицензий"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.TextBox txtItemDescription 
         Height          =   300
         Left            =   3450
         MaxLength       =   60
         TabIndex        =   32
         ToolTipText     =   "Описание отправления"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsProchee 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   30
         ToolTipText     =   "Прочее отправление"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsVozvrat 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   28
         ToolTipText     =   "Возврат товара"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsObrazec 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   26
         ToolTipText     =   "Коммерческий образец"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsDocument 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   24
         ToolTipText     =   "Документ"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsPodarok 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   22
         ToolTipText     =   "Подарок"
         Top             =   405
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheCurrency 
         Height          =   300
         Left            =   2850
         TabIndex        =   20
         Tag             =   "refopen.ico"
         ToolTipText     =   "Валюта стоимости"
         Top             =   6045
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheCurrency 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   19
         ToolTipText     =   "Валюта стоимости"
         Top             =   6045
         Width           =   2550
      End
      Begin MSMask.MaskEdBox txtVozmCost 
         Height          =   300
         Left            =   300
         TabIndex        =   17
         ToolTipText     =   "Стоимость возмщения"
         Top             =   5340
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtItemPrice 
         Height          =   300
         Left            =   300
         TabIndex        =   15
         ToolTipText     =   "Стоимость посылки"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MTZ_PANEL.DropButton cmdTheCountry 
         Height          =   300
         Left            =   2850
         TabIndex        =   13
         Tag             =   "refopen.ico"
         ToolTipText     =   "Страна происхождения"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheCountry 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   12
         ToolTipText     =   "Страна происхождения"
         Top             =   3930
         Width           =   2550
      End
      Begin VB.TextBox txtTNBED 
         Height          =   300
         Left            =   300
         MaxLength       =   40
         TabIndex        =   10
         ToolTipText     =   "Код ТНВЭД"
         Top             =   3225
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtNettoWeight 
         Height          =   300
         Left            =   300
         TabIndex        =   8
         ToolTipText     =   "Вес нетто"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtshCode 
         Height          =   300
         Left            =   300
         MaxLength       =   14
         TabIndex        =   6
         ToolTipText     =   "Штрих Код"
         Top             =   1815
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txttheWeight 
         Height          =   300
         Left            =   300
         TabIndex        =   4
         ToolTipText     =   "Вес"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtsequence 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   15
         TabIndex        =   2
         ToolTipText     =   "№"
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblQDocs 
         BackStyle       =   0  'Transparent
         Caption         =   "Количество сопроводительных документов:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   39
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblOrderNum 
         BackStyle       =   0  'Transparent
         Caption         =   "№ счета:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   37
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblQSertif 
         BackStyle       =   0  'Transparent
         Caption         =   "Количество сертификатов:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   35
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblQLicense 
         BackStyle       =   0  'Transparent
         Caption         =   "Количество лицензий:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblItemDescription 
         BackStyle       =   0  'Transparent
         Caption         =   "Описание отправления:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblIsProchee 
         BackStyle       =   0  'Transparent
         Caption         =   "Прочее отправление:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblIsVozvrat 
         BackStyle       =   0  'Transparent
         Caption         =   "Возврат товара:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblIsObrazec 
         BackStyle       =   0  'Transparent
         Caption         =   "Коммерческий образец:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblIsDocument 
         BackStyle       =   0  'Transparent
         Caption         =   "Документ:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblIsPodarok 
         BackStyle       =   0  'Transparent
         Caption         =   "Подарок:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblTheCurrency 
         BackStyle       =   0  'Transparent
         Caption         =   "Валюта стоимости:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblVozmCost 
         BackStyle       =   0  'Transparent
         Caption         =   "Стоимость возмщения:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblItemPrice 
         BackStyle       =   0  'Transparent
         Caption         =   "Стоимость посылки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblTheCountry 
         BackStyle       =   0  'Transparent
         Caption         =   "Страна происхождения:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblTNBED 
         BackStyle       =   0  'Transparent
         Caption         =   "Код ТНВЭД:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblNettoWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес нетто:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblshCode 
         BackStyle       =   0  'Transparent
         Caption         =   "Штрих Код:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lbltheWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblsequence 
         BackStyle       =   0  'Transparent
         Caption         =   "№:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "PEKZ_WLIST"
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

Private Sub txtsequence_Change()
  Changing

End Sub
Private Sub txttheWeight_Validate(cancel As Boolean)
If txttheWeight.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txttheWeight.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txttheWeight.SetFocus
  ElseIf Val(txttheWeight.Text) < -922337203685478# Or Val(txttheWeight.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txttheWeight.SetFocus
  End If
End If
End Sub
Private Sub txttheWeight_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txttheWeight_Change()
  Changing

End Sub
Private Sub txtshCode_Change()
  Changing

End Sub
Private Sub txtNettoWeight_Validate(cancel As Boolean)
If txtNettoWeight.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtNettoWeight.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtNettoWeight.SetFocus
  ElseIf Val(txtNettoWeight.Text) < -922337203685478# Or Val(txtNettoWeight.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtNettoWeight.SetFocus
  End If
End If
End Sub
Private Sub txtNettoWeight_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtNettoWeight_Change()
  Changing

End Sub
Private Sub txtTNBED_Change()
  Changing

End Sub
Private Sub txtTheCountry_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheCountry_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ENTDIC_COUNTRY", ID, brief) Then
          txtTheCountry.Tag = Left(ID, 38)
          txtTheCountry = brief
        End If
End Sub
Private Sub cmdTheCountry_MenuClick(ByVal sCaption As String)
          txtTheCountry.Tag = ""
          txtTheCountry = ""
End Sub
Private Sub txtItemPrice_Validate(cancel As Boolean)
If txtItemPrice.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtItemPrice.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtItemPrice.SetFocus
  ElseIf Val(txtItemPrice.Text) < -922337203685478# Or Val(txtItemPrice.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtItemPrice.SetFocus
  End If
End If
End Sub
Private Sub txtItemPrice_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtItemPrice_Change()
  Changing

End Sub
Private Sub txtVozmCost_Validate(cancel As Boolean)
If txtVozmCost.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtVozmCost.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtVozmCost.SetFocus
  ElseIf Val(txtVozmCost.Text) < -922337203685478# Or Val(txtVozmCost.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtVozmCost.SetFocus
  End If
End If
End Sub
Private Sub txtVozmCost_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtVozmCost_Change()
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
Private Sub cmbIsPodarok_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbIsDocument_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbIsObrazec_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbIsVozvrat_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbIsProchee_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtItemDescription_Change()
  Changing

End Sub
Private Sub txtQLicense_Validate(cancel As Boolean)
If txtQLicense.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQLicense.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtQLicense.SetFocus
  ElseIf Val(txtQLicense.Text) <> CLng(Val(txtQLicense.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtQLicense.SetFocus
  End If
End If
End Sub
Private Sub txtQLicense_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQLicense_Change()
  Changing

End Sub
Private Sub txtQSertif_Validate(cancel As Boolean)
If txtQSertif.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQSertif.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtQSertif.SetFocus
  ElseIf Val(txtQSertif.Text) <> CLng(Val(txtQSertif.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtQSertif.SetFocus
  End If
End If
End Sub
Private Sub txtQSertif_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQSertif_Change()
  Changing

End Sub
Private Sub txtOrderNum_Change()
  Changing

End Sub
Private Sub txtQDocs_Validate(cancel As Boolean)
If txtQDocs.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQDocs.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtQDocs.SetFocus
  ElseIf Val(txtQDocs.Text) <> CLng(Val(txtQDocs.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtQDocs.SetFocus
  End If
End If
End Sub
Private Sub txtQDocs_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQDocs_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtsequence.Text)
If mIsOK Then mIsOK = IsSet(txttheWeight.Text)
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

txtsequence = Item.sequence
txttheWeight = Item.theWeight
  On Error Resume Next
txtshCode = Item.shCode
txtNettoWeight = Item.NettoWeight
  On Error Resume Next
txtTNBED = Item.TNBED
If Not Item.TheCountry Is Nothing Then
  txtTheCountry.Tag = Item.TheCountry.ID
  txtTheCountry = Item.TheCountry.brief
Else
  txtTheCountry.Tag = ""
  txtTheCountry = ""
End If
 LoadBtnPictures cmdTheCountry, cmdTheCountry.Tag
  cmdTheCountry.RemoveAllMenu
  cmdTheCountry.AddMenu "Очистить"
txtItemPrice = Item.ItemPrice
txtVozmCost = Item.VozmCost
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
cmbIsPodarok.Clear
cmbIsPodarok.AddItem "Да"
cmbIsPodarok.ItemData(cmbIsPodarok.NewIndex) = -1
cmbIsPodarok.AddItem "Нет"
cmbIsPodarok.ItemData(cmbIsPodarok.NewIndex) = 0
 For iii = 0 To cmbIsPodarok.ListCount - 1
  If Item.IsPodarok = cmbIsPodarok.ItemData(iii) Then
   cmbIsPodarok.ListIndex = iii
   Exit For
  End If
 Next
cmbIsDocument.Clear
cmbIsDocument.AddItem "Да"
cmbIsDocument.ItemData(cmbIsDocument.NewIndex) = -1
cmbIsDocument.AddItem "Нет"
cmbIsDocument.ItemData(cmbIsDocument.NewIndex) = 0
 For iii = 0 To cmbIsDocument.ListCount - 1
  If Item.IsDocument = cmbIsDocument.ItemData(iii) Then
   cmbIsDocument.ListIndex = iii
   Exit For
  End If
 Next
cmbIsObrazec.Clear
cmbIsObrazec.AddItem "Да"
cmbIsObrazec.ItemData(cmbIsObrazec.NewIndex) = -1
cmbIsObrazec.AddItem "Нет"
cmbIsObrazec.ItemData(cmbIsObrazec.NewIndex) = 0
 For iii = 0 To cmbIsObrazec.ListCount - 1
  If Item.IsObrazec = cmbIsObrazec.ItemData(iii) Then
   cmbIsObrazec.ListIndex = iii
   Exit For
  End If
 Next
cmbIsVozvrat.Clear
cmbIsVozvrat.AddItem "Да"
cmbIsVozvrat.ItemData(cmbIsVozvrat.NewIndex) = -1
cmbIsVozvrat.AddItem "Нет"
cmbIsVozvrat.ItemData(cmbIsVozvrat.NewIndex) = 0
 For iii = 0 To cmbIsVozvrat.ListCount - 1
  If Item.IsVozvrat = cmbIsVozvrat.ItemData(iii) Then
   cmbIsVozvrat.ListIndex = iii
   Exit For
  End If
 Next
cmbIsProchee.Clear
cmbIsProchee.AddItem "Да"
cmbIsProchee.ItemData(cmbIsProchee.NewIndex) = -1
cmbIsProchee.AddItem "Нет"
cmbIsProchee.ItemData(cmbIsProchee.NewIndex) = 0
 For iii = 0 To cmbIsProchee.ListCount - 1
  If Item.IsProchee = cmbIsProchee.ItemData(iii) Then
   cmbIsProchee.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtItemDescription = Item.ItemDescription
txtQLicense = Item.QLicense
txtQSertif = Item.QSertif
  On Error Resume Next
txtOrderNum = Item.OrderNum
txtQDocs = Item.QDocs
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

Item.theWeight = CDbl(txttheWeight)
Item.shCode = txtshCode
Item.NettoWeight = CDbl(txtNettoWeight)
Item.TNBED = txtTNBED
If txtTheCountry.Tag <> "" Then
  Set Item.TheCountry = Item.Application.FindRowObject("ENTDIC_COUNTRY", txtTheCountry.Tag)
Else
  Set Item.TheCountry = Nothing
End If
Item.ItemPrice = CDbl(txtItemPrice)
Item.VozmCost = CDbl(txtVozmCost)
If txtTheCurrency.Tag <> "" Then
  Set Item.TheCurrency = Item.Application.FindRowObject("ENTDIC_CURRENCY", txtTheCurrency.Tag)
Else
  Set Item.TheCurrency = Nothing
End If
 If cmbIsPodarok.ListIndex >= 0 Then
   Item.IsPodarok = cmbIsPodarok.ItemData(cmbIsPodarok.ListIndex)
 End If
 If cmbIsDocument.ListIndex >= 0 Then
   Item.IsDocument = cmbIsDocument.ItemData(cmbIsDocument.ListIndex)
 End If
 If cmbIsObrazec.ListIndex >= 0 Then
   Item.IsObrazec = cmbIsObrazec.ItemData(cmbIsObrazec.ListIndex)
 End If
 If cmbIsVozvrat.ListIndex >= 0 Then
   Item.IsVozvrat = cmbIsVozvrat.ItemData(cmbIsVozvrat.ListIndex)
 End If
 If cmbIsProchee.ListIndex >= 0 Then
   Item.IsProchee = cmbIsProchee.ItemData(cmbIsProchee.ListIndex)
 End If
Item.ItemDescription = txtItemDescription
Item.QLicense = CDbl(txtQLicense)
Item.QSertif = CDbl(txtQSertif)
Item.OrderNum = txtOrderNum
Item.QDocs = CDbl(txtQDocs)
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



