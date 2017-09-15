VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl PEKTRF_DEF 
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
      Begin MSMask.MaskEdBox txtNalAdds 
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         ToolTipText     =   "Надбавка за наличную оплату"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MTZ_PANEL.DropButton cmdTheFilial 
         Height          =   300
         Left            =   2850
         TabIndex        =   21
         Tag             =   "refopen.ico"
         ToolTipText     =   "Филиал"
         Top             =   6045
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheFilial 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   20
         ToolTipText     =   "Филиал"
         Top             =   6045
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpEndDate 
         Height          =   300
         Left            =   300
         TabIndex        =   18
         ToolTipText     =   "Конец действия тарифа"
         Top             =   5340
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   71565315
         CurrentDate     =   39500
      End
      Begin MTZ_PANEL.DropButton cmdSupplier 
         Height          =   300
         Left            =   2850
         TabIndex        =   16
         Tag             =   "refopen.ico"
         ToolTipText     =   "Поставщик"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtSupplier 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   15
         ToolTipText     =   "Поставщик"
         Top             =   4635
         Width           =   2550
      End
      Begin VB.ComboBox cmbSupplierTarif 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   13
         ToolTipText     =   "Тариф поставщика"
         Top             =   3930
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtMinPPOWeight 
         Height          =   300
         Left            =   300
         TabIndex        =   11
         ToolTipText     =   "Минимальный расчетный вес"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.ComboBox cmbIncludeNDS 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   9
         ToolTipText     =   "Цены с НДС"
         Top             =   2520
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTType 
         Height          =   300
         Left            =   2850
         TabIndex        =   7
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип тарифа"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTType 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   6
         ToolTipText     =   "Тип тарифа"
         Top             =   1815
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpStartDate 
         Height          =   300
         Left            =   300
         TabIndex        =   4
         ToolTipText     =   "Начало действия"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   71565315
         CurrentDate     =   39500
      End
      Begin VB.ComboBox cmbVolumeTarif 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   2
         ToolTipText     =   "Тариф по объему"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblNalAdds 
         BackStyle       =   0  'Transparent
         Caption         =   "Надбавка за наличную оплату:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   3450
         TabIndex        =   22
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblTheFilial 
         BackStyle       =   0  'Transparent
         Caption         =   "Филиал:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblEndDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Конец действия тарифа:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblSupplier 
         BackStyle       =   0  'Transparent
         Caption         =   "Поставщик:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblSupplierTarif 
         BackStyle       =   0  'Transparent
         Caption         =   "Тариф поставщика:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblMinPPOWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Минимальный расчетный вес:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblIncludeNDS 
         BackStyle       =   0  'Transparent
         Caption         =   "Цены с НДС:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblTType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип тарифа:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblStartDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Начало действия:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblVolumeTarif 
         BackStyle       =   0  'Transparent
         Caption         =   "Тариф по объему:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "PEKTRF_DEF"
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

Private Sub cmbVolumeTarif_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub dtpStartDate_Change()
  Changing

End Sub
Private Sub txtTType_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTType_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PEKD_TRFTYPE", ID, brief) Then
          txtTType.Tag = Left(ID, 38)
          txtTType = brief
        End If
End Sub
Private Sub cmdTType_MenuClick(ByVal sCaption As String)
          txtTType.Tag = ""
          txtTType = ""
End Sub
Private Sub cmbIncludeNDS_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtMinPPOWeight_Validate(cancel As Boolean)
If txtMinPPOWeight.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtMinPPOWeight.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtMinPPOWeight.SetFocus
  ElseIf Val(txtMinPPOWeight.Text) < -922337203685478# Or Val(txtMinPPOWeight.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtMinPPOWeight.SetFocus
  End If
End If
End Sub
Private Sub txtMinPPOWeight_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtMinPPOWeight_Change()
  Changing

End Sub
Private Sub cmbSupplierTarif_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtSupplier_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdSupplier_CLick()
  On Error Resume Next
     If txtSupplier.Tag = "" Then
       cmdSupplier_MenuClick "Выбрать"
     Else
       cmdSupplier_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdSupplier_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtSupplier.Tag = ""
          txtSupplier = ""
  End If
  If sCaption = "Открыть" Then
    If txtSupplier.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtSupplier.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtSupplier.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "VRC2", "VRCCommonInfo_Transporter_Val=-1")
        If OK Then
          txtSupplier.Tag = Left(ID, 38)
          txtSupplier = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim cancel As Boolean
        brief = "VRC2" & Now
        ook = findObject(Item.Application.Manager, "VRC2", ID, brief, cancel)
        If cancel Then
          Exit Sub
        End If
        If ook Then
              txtSupplier.Tag = ID
              txtSupplier = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "VRC2", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtSupplier.Tag = obj.ID
              txtSupplier = obj.brief
          Else
              txtSupplier.Tag = ""
              txtSupplier = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub dtpEndDate_Change()
  Changing

End Sub
Private Sub txtTheFilial_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheFilial_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PEKD_DEPT", ID, brief) Then
          txtTheFilial.Tag = Left(ID, 38)
          txtTheFilial = brief
        End If
End Sub
Private Sub cmdTheFilial_MenuClick(ByVal sCaption As String)
          txtTheFilial.Tag = ""
          txtTheFilial = ""
End Sub
Private Sub txtNalAdds_Validate(cancel As Boolean)
If txtNalAdds.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtNalAdds.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtNalAdds.SetFocus
  ElseIf Val(txtNalAdds.Text) < -922337203685478# Or Val(txtNalAdds.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtNalAdds.SetFocus
  End If
End If
End Sub
Private Sub txtNalAdds_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtNalAdds_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = (cmbVolumeTarif.ListIndex >= 0)
If mIsOK Then mIsOK = IsSet(dtpStartDate.Value)
If mIsOK Then mIsOK = txtTType.Tag <> ""
If mIsOK Then mIsOK = (cmbIncludeNDS.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbSupplierTarif.ListIndex >= 0)
If mIsOK Then mIsOK = txtTheFilial.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtNalAdds.Text)
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

cmbVolumeTarif.Clear
cmbVolumeTarif.AddItem "Да"
cmbVolumeTarif.ItemData(cmbVolumeTarif.NewIndex) = -1
cmbVolumeTarif.AddItem "Нет"
cmbVolumeTarif.ItemData(cmbVolumeTarif.NewIndex) = 0
 For iii = 0 To cmbVolumeTarif.ListCount - 1
  If Item.VolumeTarif = cmbVolumeTarif.ItemData(iii) Then
   cmbVolumeTarif.ListIndex = iii
   Exit For
  End If
 Next
dtpStartDate = Date
If Item.StartDate <> 0 Then
 dtpStartDate = Item.StartDate
End If
If Not Item.TType Is Nothing Then
  txtTType.Tag = Item.TType.ID
  txtTType = Item.TType.brief
Else
  txtTType.Tag = ""
  txtTType = ""
End If
 LoadBtnPictures cmdTType, cmdTType.Tag
  cmdTType.RemoveAllMenu
  cmdTType.AddMenu "Очистить"
cmbIncludeNDS.Clear
cmbIncludeNDS.AddItem "Да"
cmbIncludeNDS.ItemData(cmbIncludeNDS.NewIndex) = -1
cmbIncludeNDS.AddItem "Нет"
cmbIncludeNDS.ItemData(cmbIncludeNDS.NewIndex) = 0
 For iii = 0 To cmbIncludeNDS.ListCount - 1
  If Item.IncludeNDS = cmbIncludeNDS.ItemData(iii) Then
   cmbIncludeNDS.ListIndex = iii
   Exit For
  End If
 Next
txtMinPPOWeight = Item.MinPPOWeight
cmbSupplierTarif.Clear
cmbSupplierTarif.AddItem "Да"
cmbSupplierTarif.ItemData(cmbSupplierTarif.NewIndex) = -1
cmbSupplierTarif.AddItem "Нет"
cmbSupplierTarif.ItemData(cmbSupplierTarif.NewIndex) = 0
 For iii = 0 To cmbSupplierTarif.ListCount - 1
  If Item.SupplierTarif = cmbSupplierTarif.ItemData(iii) Then
   cmbSupplierTarif.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.Supplier Is Nothing Then
  txtSupplier.Tag = Item.Supplier.ID
  txtSupplier = Item.Supplier.brief
Else
  txtSupplier.Tag = ""
  txtSupplier = ""
End If
 LoadBtnPictures cmdSupplier, cmdSupplier.Tag
  cmdSupplier.RemoveAllMenu
  cmdSupplier.AddMenu "Очистить"
  cmdSupplier.AddMenu "Создать"
  cmdSupplier.AddMenu "Выбрать"
  cmdSupplier.AddMenu "Открыть"
dtpEndDate = Date
If Item.EndDate <> 0 Then
 dtpEndDate = Item.EndDate
Else
 dtpEndDate.Value = Null
End If
If Not Item.TheFilial Is Nothing Then
  txtTheFilial.Tag = Item.TheFilial.ID
  txtTheFilial = Item.TheFilial.brief
Else
  txtTheFilial.Tag = ""
  txtTheFilial = ""
End If
 LoadBtnPictures cmdTheFilial, cmdTheFilial.Tag
  cmdTheFilial.RemoveAllMenu
  cmdTheFilial.AddMenu "Очистить"
txtNalAdds = Item.NalAdds
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

 If cmbVolumeTarif.ListIndex >= 0 Then
   Item.VolumeTarif = cmbVolumeTarif.ItemData(cmbVolumeTarif.ListIndex)
 End If
  If IsNull(dtpStartDate) Then
    Item.StartDate = 0
  Else
    Item.StartDate = dtpStartDate.Value
  End If
If txtTType.Tag <> "" Then
  Set Item.TType = Item.Application.FindRowObject("PEKD_TRFTYPE", txtTType.Tag)
Else
  Set Item.TType = Nothing
End If
 If cmbIncludeNDS.ListIndex >= 0 Then
   Item.IncludeNDS = cmbIncludeNDS.ItemData(cmbIncludeNDS.ListIndex)
 End If
Item.MinPPOWeight = CDbl(txtMinPPOWeight)
 If cmbSupplierTarif.ListIndex >= 0 Then
   Item.SupplierTarif = cmbSupplierTarif.ItemData(cmbSupplierTarif.ListIndex)
 End If
If txtSupplier.Tag <> "" Then
  Set Item.Supplier = Item.Application.Manager.GetInstanceObject(txtSupplier.Tag)
Else
  Set Item.Supplier = Nothing
End If
  If IsNull(dtpEndDate) Then
    Item.EndDate = 0
  Else
    Item.EndDate = dtpEndDate.Value
  End If
If txtTheFilial.Tag <> "" Then
  Set Item.TheFilial = Item.Application.FindRowObject("PEKD_DEPT", txtTheFilial.Tag)
Else
  Set Item.TheFilial = Nothing
End If
Item.NalAdds = CDbl(txtNalAdds)
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



