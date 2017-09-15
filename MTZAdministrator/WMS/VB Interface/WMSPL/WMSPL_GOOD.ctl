VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl WMSPL_GOOD 
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
      Begin MSMask.MaskEdBox txtOnePackageWeight 
         Height          =   300
         Left            =   300
         TabIndex        =   17
         ToolTipText     =   "Вес одной упаковки"
         Top             =   5340
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtPackageWeight 
         Height          =   300
         Left            =   300
         TabIndex        =   15
         ToolTipText     =   "Общий вес упаковки"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtWeightBrutto 
         Height          =   300
         Left            =   300
         TabIndex        =   13
         ToolTipText     =   "Вес товара БРУТТО"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtWeightNetto 
         Height          =   300
         Left            =   300
         TabIndex        =   11
         ToolTipText     =   "Вес НЕТТО"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtCaliberQuantity 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   9
         ToolTipText     =   "Количество коробов на поддоне"
         Top             =   2520
         Width           =   1800
      End
      Begin VB.ComboBox cmbIsReserved 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   7
         ToolTipText     =   "Зарезервирован"
         Top             =   1815
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtGoodQuantity 
         Height          =   300
         Left            =   300
         TabIndex        =   5
         ToolTipText     =   "Количество товара"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MTZ_PANEL.DropButton cmdCurrentGood 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Текущий товар"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCurrentGood 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Текущий товар"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblOnePackageWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес одной упаковки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblPackageWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Общий вес упаковки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblWeightBrutto 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес товара БРУТТО:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblWeightNetto 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес НЕТТО:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblCaliberQuantity 
         BackStyle       =   0  'Transparent
         Caption         =   "Количество коробов на поддоне:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblIsReserved 
         BackStyle       =   0  'Transparent
         Caption         =   "Зарезервирован:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblGoodQuantity 
         BackStyle       =   0  'Transparent
         Caption         =   "Количество товара:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblCurrentGood 
         BackStyle       =   0  'Transparent
         Caption         =   "Текущий товар:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WMSPL_GOOD"
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

Private Sub txtCurrentGood_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdCurrentGood_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WMSG_NOM", ID, brief) Then
          txtCurrentGood.Tag = Left(ID, 38)
          txtCurrentGood = brief
        End If
End Sub
Private Sub cmdCurrentGood_MenuClick(ByVal sCaption As String)
          txtCurrentGood.Tag = ""
          txtCurrentGood = ""
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
Private Sub cmbIsReserved_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtCaliberQuantity_Validate(cancel As Boolean)
If txtCaliberQuantity.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCaliberQuantity.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtCaliberQuantity.SetFocus
  ElseIf Val(txtCaliberQuantity.Text) <> CLng(Val(txtCaliberQuantity.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtCaliberQuantity.SetFocus
  End If
End If
End Sub
Private Sub txtCaliberQuantity_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCaliberQuantity_Change()
  Changing

End Sub
Private Sub txtWeightNetto_Validate(cancel As Boolean)
If txtWeightNetto.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtWeightNetto.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtWeightNetto.SetFocus
  ElseIf Val(txtWeightNetto.Text) < -922337203685478# Or Val(txtWeightNetto.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtWeightNetto.SetFocus
  End If
End If
End Sub
Private Sub txtWeightNetto_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtWeightNetto_Change()
  Changing

End Sub
Private Sub txtWeightBrutto_Validate(cancel As Boolean)
If txtWeightBrutto.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtWeightBrutto.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtWeightBrutto.SetFocus
  ElseIf Val(txtWeightBrutto.Text) < -922337203685478# Or Val(txtWeightBrutto.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtWeightBrutto.SetFocus
  End If
End If
End Sub
Private Sub txtWeightBrutto_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtWeightBrutto_Change()
  Changing

End Sub
Private Sub txtPackageWeight_Validate(cancel As Boolean)
If txtPackageWeight.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPackageWeight.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtPackageWeight.SetFocus
  ElseIf Val(txtPackageWeight.Text) < -922337203685478# Or Val(txtPackageWeight.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtPackageWeight.SetFocus
  End If
End If
End Sub
Private Sub txtPackageWeight_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPackageWeight_Change()
  Changing

End Sub
Private Sub txtOnePackageWeight_Validate(cancel As Boolean)
If txtOnePackageWeight.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtOnePackageWeight.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtOnePackageWeight.SetFocus
  ElseIf Val(txtOnePackageWeight.Text) < -922337203685478# Or Val(txtOnePackageWeight.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtOnePackageWeight.SetFocus
  End If
End If
End Sub
Private Sub txtOnePackageWeight_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtOnePackageWeight_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = (cmbIsReserved.ListIndex >= 0)
If mIsOK Then mIsOK = IsSet(txtWeightNetto.Text)
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

If Not Item.CurrentGood Is Nothing Then
  txtCurrentGood.Tag = Item.CurrentGood.ID
  txtCurrentGood = Item.CurrentGood.brief
Else
  txtCurrentGood.Tag = ""
  txtCurrentGood = ""
End If
 LoadBtnPictures cmdCurrentGood, cmdCurrentGood.Tag
  cmdCurrentGood.RemoveAllMenu
  cmdCurrentGood.AddMenu "Очистить"
txtGoodQuantity = Item.GoodQuantity
cmbIsReserved.Clear
cmbIsReserved.AddItem "Да"
cmbIsReserved.ItemData(cmbIsReserved.NewIndex) = -1
cmbIsReserved.AddItem "Нет"
cmbIsReserved.ItemData(cmbIsReserved.NewIndex) = 0
 For iii = 0 To cmbIsReserved.ListCount - 1
  If Item.IsReserved = cmbIsReserved.ItemData(iii) Then
   cmbIsReserved.ListIndex = iii
   Exit For
  End If
 Next
txtCaliberQuantity = Item.CaliberQuantity
txtWeightNetto = Item.WeightNetto
txtWeightBrutto = Item.WeightBrutto
txtPackageWeight = Item.PackageWeight
txtOnePackageWeight = Item.OnePackageWeight
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

If txtCurrentGood.Tag <> "" Then
  Set Item.CurrentGood = Item.Application.FindRowObject("WMSG_NOM", txtCurrentGood.Tag)
Else
  Set Item.CurrentGood = Nothing
End If
Item.GoodQuantity = CDbl(txtGoodQuantity)
 If cmbIsReserved.ListIndex >= 0 Then
   Item.IsReserved = cmbIsReserved.ItemData(cmbIsReserved.ListIndex)
 End If
Item.CaliberQuantity = CDbl(txtCaliberQuantity)
Item.WeightNetto = CDbl(txtWeightNetto)
Item.WeightBrutto = CDbl(txtWeightBrutto)
Item.PackageWeight = CDbl(txtPackageWeight)
Item.OnePackageWeight = CDbl(txtOnePackageWeight)
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



