VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl WMSACT_LINE 
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
      Begin MTZ_PANEL.DropButton cmdEI 
         Height          =   300
         Left            =   2850
         TabIndex        =   17
         Tag             =   "refopen.ico"
         ToolTipText     =   "Ед. изм"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtEI 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   16
         ToolTipText     =   "Ед. изм"
         Top             =   4635
         Width           =   2550
      End
      Begin MSMask.MaskEdBox txtTheNetto 
         Height          =   300
         Left            =   300
         TabIndex        =   14
         ToolTipText     =   "Вес НЕТТО"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtTheBrutto 
         Height          =   300
         Left            =   300
         TabIndex        =   12
         ToolTipText     =   "Вес БРУТТО"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtTheQuantity 
         Height          =   300
         Left            =   300
         TabIndex        =   10
         ToolTipText     =   "Количество"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MTZ_PANEL.DropButton cmdTheCell 
         Height          =   300
         Left            =   2850
         TabIndex        =   8
         Tag             =   "refopen.ico"
         ToolTipText     =   "Ячейка"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheCell 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   7
         ToolTipText     =   "Ячейка"
         Top             =   1815
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdThePallet 
         Height          =   300
         Left            =   2850
         TabIndex        =   5
         Tag             =   "refopen.ico"
         ToolTipText     =   "Палетта"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtThePallet 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   4
         ToolTipText     =   "Палетта"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.ComboBox cmbDC 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   2
         ToolTipText     =   "Д \ К"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblEI 
         BackStyle       =   0  'Transparent
         Caption         =   "Ед. изм:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblTheNetto 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес НЕТТО:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblTheBrutto 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес БРУТТО:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblTheQuantity 
         BackStyle       =   0  'Transparent
         Caption         =   "Количество:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblTheCell 
         BackStyle       =   0  'Transparent
         Caption         =   "Ячейка:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblThePallet 
         BackStyle       =   0  'Transparent
         Caption         =   "Палетта:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblDC 
         BackStyle       =   0  'Transparent
         Caption         =   "Д \ К:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WMSACT_LINE"
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

Private Sub cmbDC_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtThePallet_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdThePallet_CLick()
  On Error Resume Next
     If txtThePallet.Tag = "" Then
       cmdThePallet_MenuClick "Выбрать"
     Else
       cmdThePallet_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdThePallet_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtThePallet.Tag = ""
          txtThePallet = ""
  End If
  If sCaption = "Открыть" Then
    If txtThePallet.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtThePallet.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtThePallet.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "WMSPL")
        If OK Then
          txtThePallet.Tag = Left(ID, 38)
          txtThePallet = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim cancel As Boolean
        brief = "WMSPL" & Now
        ook = findObject(Item.Application.Manager, "WMSPL", ID, brief, cancel)
        If cancel Then
          Exit Sub
        End If
        If ook Then
              txtThePallet.Tag = ID
              txtThePallet = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "WMSPL", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtThePallet.Tag = obj.ID
              txtThePallet = obj.brief
          Else
              txtThePallet.Tag = ""
              txtThePallet = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtTheCell_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheCell_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WMSXYZ_CELL", ID, brief) Then
          txtTheCell.Tag = Left(ID, 38)
          txtTheCell = brief
        End If
End Sub
Private Sub cmdTheCell_MenuClick(ByVal sCaption As String)
          txtTheCell.Tag = ""
          txtTheCell = ""
End Sub
Private Sub txtTheQuantity_Validate(cancel As Boolean)
If txtTheQuantity.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTheQuantity.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtTheQuantity.SetFocus
  ElseIf Val(txtTheQuantity.Text) < -922337203685478# Or Val(txtTheQuantity.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtTheQuantity.SetFocus
  End If
End If
End Sub
Private Sub txtTheQuantity_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTheQuantity_Change()
  Changing

End Sub
Private Sub txtTheBrutto_Validate(cancel As Boolean)
If txtTheBrutto.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTheBrutto.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtTheBrutto.SetFocus
  ElseIf Val(txtTheBrutto.Text) < -922337203685478# Or Val(txtTheBrutto.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtTheBrutto.SetFocus
  End If
End If
End Sub
Private Sub txtTheBrutto_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTheBrutto_Change()
  Changing

End Sub
Private Sub txtTheNetto_Validate(cancel As Boolean)
If txtTheNetto.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTheNetto.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtTheNetto.SetFocus
  ElseIf Val(txtTheNetto.Text) < -922337203685478# Or Val(txtTheNetto.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtTheNetto.SetFocus
  End If
End If
End Sub
Private Sub txtTheNetto_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTheNetto_Change()
  Changing

End Sub
Private Sub txtEI_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdEI_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WMSD_EI", ID, brief) Then
          txtEI.Tag = Left(ID, 38)
          txtEI = brief
        End If
End Sub
Private Sub cmdEI_MenuClick(ByVal sCaption As String)
          txtEI.Tag = ""
          txtEI = ""
End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = (cmbDC.ListIndex >= 0)
If mIsOK Then mIsOK = txtThePallet.Tag <> ""
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

cmbDC.Clear
cmbDC.AddItem "Да"
cmbDC.ItemData(cmbDC.NewIndex) = -1
cmbDC.AddItem "Нет"
cmbDC.ItemData(cmbDC.NewIndex) = 0
 For iii = 0 To cmbDC.ListCount - 1
  If Item.DC = cmbDC.ItemData(iii) Then
   cmbDC.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.ThePallet Is Nothing Then
  txtThePallet.Tag = Item.ThePallet.ID
  txtThePallet = Item.ThePallet.brief
Else
  txtThePallet.Tag = ""
  txtThePallet = ""
End If
 LoadBtnPictures cmdThePallet, cmdThePallet.Tag
  cmdThePallet.RemoveAllMenu
  cmdThePallet.AddMenu "Очистить"
  cmdThePallet.AddMenu "Создать"
  cmdThePallet.AddMenu "Выбрать"
  cmdThePallet.AddMenu "Открыть"
If Not Item.TheCell Is Nothing Then
  txtTheCell.Tag = Item.TheCell.ID
  txtTheCell = Item.TheCell.brief
Else
  txtTheCell.Tag = ""
  txtTheCell = ""
End If
 LoadBtnPictures cmdTheCell, cmdTheCell.Tag
  cmdTheCell.RemoveAllMenu
  cmdTheCell.AddMenu "Очистить"
txtTheQuantity = Item.TheQuantity
txtTheBrutto = Item.TheBrutto
txtTheNetto = Item.TheNetto
If Not Item.EI Is Nothing Then
  txtEI.Tag = Item.EI.ID
  txtEI = Item.EI.brief
Else
  txtEI.Tag = ""
  txtEI = ""
End If
 LoadBtnPictures cmdEI, cmdEI.Tag
  cmdEI.RemoveAllMenu
  cmdEI.AddMenu "Очистить"
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

 If cmbDC.ListIndex >= 0 Then
   Item.DC = cmbDC.ItemData(cmbDC.ListIndex)
 End If
If txtThePallet.Tag <> "" Then
  Set Item.ThePallet = Item.Application.Manager.GetInstanceObject(txtThePallet.Tag)
Else
  Set Item.ThePallet = Nothing
End If
If txtTheCell.Tag <> "" Then
  Set Item.TheCell = Item.Application.FindRowObject("WMSXYZ_CELL", txtTheCell.Tag)
Else
  Set Item.TheCell = Nothing
End If
Item.TheQuantity = CDbl(txtTheQuantity)
Item.TheBrutto = CDbl(txtTheBrutto)
Item.TheNetto = CDbl(txtTheNetto)
If txtEI.Tag <> "" Then
  Set Item.EI = Item.Application.FindRowObject("WMSD_EI", txtEI.Tag)
Else
  Set Item.EI = Nothing
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



