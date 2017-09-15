VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl WMSPL_DEF 
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
      Begin VB.ComboBox cmbPrivatePalet 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   26
         ToolTipText     =   "Чужой поддон"
         Top             =   1815
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtCurrentWeightBrutto 
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         ToolTipText     =   "Текущий вес брутто"
         Top             =   1110
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
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   22
         ToolTipText     =   "Кол-во Калиброванныч коробок"
         Top             =   405
         Width           =   1800
      End
      Begin MSMask.MaskEdBox txtPackageWeight 
         Height          =   300
         Left            =   300
         TabIndex        =   20
         ToolTipText     =   "Вес упаковки"
         Top             =   6045
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtCurrentPosition 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   18
         ToolTipText     =   "Текущая ячейка склада"
         Top             =   5340
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCurrentGood 
         Height          =   300
         Left            =   2850
         TabIndex        =   16
         Tag             =   "refopen.ico"
         ToolTipText     =   "Текущий товар"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCurrentGood 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   15
         ToolTipText     =   "Текущий товар"
         Top             =   4635
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpWDate 
         Height          =   300
         Left            =   300
         TabIndex        =   13
         ToolTipText     =   "Дата взвешивания"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "HH:mm:ss"
         Format          =   20316163
         UpDown          =   -1  'True
         CurrentDate     =   39686
      End
      Begin MTZ_PANEL.DropButton cmdPltype 
         Height          =   300
         Left            =   2850
         TabIndex        =   11
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип палеты"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtPltype 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   10
         ToolTipText     =   "Тип палеты"
         Top             =   3225
         Width           =   2550
      End
      Begin MSMask.MaskEdBox txtWeight 
         Height          =   300
         Left            =   300
         TabIndex        =   8
         ToolTipText     =   "Вес паддона"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtPalKode 
         Height          =   300
         Left            =   300
         MaxLength       =   30
         TabIndex        =   6
         ToolTipText     =   "Штрихкод"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtTheNumber 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   4
         ToolTipText     =   "Номер"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.TextBox txtCode 
         Height          =   300
         Left            =   300
         MaxLength       =   14
         TabIndex        =   2
         ToolTipText     =   "Код палеты"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblPrivatePalet 
         BackStyle       =   0  'Transparent
         Caption         =   "Чужой поддон:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblCurrentWeightBrutto 
         BackStyle       =   0  'Transparent
         Caption         =   "Текущий вес брутто:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblCaliberQuantity 
         BackStyle       =   0  'Transparent
         Caption         =   "Кол-во Калиброванныч коробок:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblPackageWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес упаковки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblCurrentPosition 
         BackStyle       =   0  'Transparent
         Caption         =   "Текущая ячейка склада:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblCurrentGood 
         BackStyle       =   0  'Transparent
         Caption         =   "Текущий товар:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblWDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата взвешивания:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblPltype 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип палеты:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес паддона:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblPalKode 
         BackStyle       =   0  'Transparent
         Caption         =   "Штрихкод:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblCode 
         BackStyle       =   0  'Transparent
         Caption         =   "Код палеты:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WMSPL_DEF"
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

Private Sub txtCode_Change()
  Changing

End Sub
Private Sub txtTheNumber_Validate(cancel As Boolean)
If txtTheNumber.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTheNumber.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtTheNumber.SetFocus
  ElseIf Val(txtTheNumber.Text) <> CLng(Val(txtTheNumber.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtTheNumber.SetFocus
  End If
End If
End Sub
Private Sub txtTheNumber_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTheNumber_Change()
  Changing

End Sub
Private Sub txtPalKode_Change()
  Changing

End Sub
Private Sub txtWeight_Validate(cancel As Boolean)
If txtWeight.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtWeight.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtWeight.SetFocus
  ElseIf Val(txtWeight.Text) < -922337203685478# Or Val(txtWeight.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtWeight.SetFocus
  End If
End If
End Sub
Private Sub txtWeight_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtWeight_Change()
  Changing

End Sub
Private Sub txtPltype_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdPltype_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WMSD_PLTYPE", ID, brief) Then
          txtPltype.Tag = Left(ID, 38)
          txtPltype = brief
        End If
End Sub
Private Sub cmdPltype_MenuClick(ByVal sCaption As String)
          txtPltype.Tag = ""
          txtPltype = ""
End Sub
Private Sub dtpWDate_Change()
  Changing

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
Private Sub txtCurrentPosition_Change()
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
Private Sub txtCurrentWeightBrutto_Validate(cancel As Boolean)
If txtCurrentWeightBrutto.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCurrentWeightBrutto.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtCurrentWeightBrutto.SetFocus
  ElseIf Val(txtCurrentWeightBrutto.Text) < -922337203685478# Or Val(txtCurrentWeightBrutto.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtCurrentWeightBrutto.SetFocus
  End If
End If
End Sub
Private Sub txtCurrentWeightBrutto_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCurrentWeightBrutto_Change()
  Changing

End Sub
Private Sub cmbPrivatePalet_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtCode.Text)
If mIsOK Then mIsOK = IsSet(txtTheNumber.Text)
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
txtCode = Item.Code
txtTheNumber = Item.TheNumber
  On Error Resume Next
txtPalKode = Item.PalKode
txtWeight = Item.Weight
If Not Item.Pltype Is Nothing Then
  txtPltype.Tag = Item.Pltype.ID
  txtPltype = Item.Pltype.brief
Else
  txtPltype.Tag = ""
  txtPltype = ""
End If
 LoadBtnPictures cmdPltype, cmdPltype.Tag
  cmdPltype.RemoveAllMenu
  cmdPltype.AddMenu "Очистить"
dtpWDate = Time
If Item.WDate <> 0 Then
 dtpWDate = Item.WDate
Else
 dtpWDate.Value = Null
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
  On Error Resume Next
txtCurrentPosition = Item.CurrentPosition
txtPackageWeight = Item.PackageWeight
txtCaliberQuantity = Item.CaliberQuantity
txtCurrentWeightBrutto = Item.CurrentWeightBrutto
cmbPrivatePalet.Clear
cmbPrivatePalet.AddItem "Да"
cmbPrivatePalet.ItemData(cmbPrivatePalet.NewIndex) = -1
cmbPrivatePalet.AddItem "Нет"
cmbPrivatePalet.ItemData(cmbPrivatePalet.NewIndex) = 0
 For iii = 0 To cmbPrivatePalet.ListCount - 1
  If Item.PrivatePalet = cmbPrivatePalet.ItemData(iii) Then
   cmbPrivatePalet.ListIndex = iii
   Exit For
  End If
 Next
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

Item.Code = txtCode
Item.TheNumber = CDbl(txtTheNumber)
Item.PalKode = txtPalKode
Item.Weight = CDbl(txtWeight)
If txtPltype.Tag <> "" Then
  Set Item.Pltype = Item.Application.FindRowObject("WMSD_PLTYPE", txtPltype.Tag)
Else
  Set Item.Pltype = Nothing
End If
  If IsNull(dtpWDate) Then
    Item.WDate = 0
  Else
    Item.WDate = dtpWDate.Value
  End If
If txtCurrentGood.Tag <> "" Then
  Set Item.CurrentGood = Item.Application.FindRowObject("WMSG_NOM", txtCurrentGood.Tag)
Else
  Set Item.CurrentGood = Nothing
End If
Item.CurrentPosition = txtCurrentPosition
Item.PackageWeight = CDbl(txtPackageWeight)
Item.CaliberQuantity = CDbl(txtCaliberQuantity)
Item.CurrentWeightBrutto = CDbl(txtCurrentWeightBrutto)
 If cmbPrivatePalet.ListIndex >= 0 Then
   Item.PrivatePalet = cmbPrivatePalet.ItemData(cmbPrivatePalet.ListIndex)
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



