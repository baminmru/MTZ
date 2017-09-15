VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl PEKL_TOLOAD 
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
      Begin MTZ_PANEL.DropButton cmdWeightEDIZM 
         Height          =   300
         Left            =   2850
         TabIndex        =   13
         Tag             =   "refopen.ico"
         ToolTipText     =   "Ед. изм.веса"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtWeightEDIZM 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   12
         ToolTipText     =   "Ед. изм.веса"
         Top             =   3225
         Width           =   2550
      End
      Begin MSMask.MaskEdBox txtWeightValue 
         Height          =   300
         Left            =   300
         TabIndex        =   10
         ToolTipText     =   "Вес"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MTZ_PANEL.DropButton cmdValueEDIZM 
         Height          =   300
         Left            =   2850
         TabIndex        =   8
         Tag             =   "refopen.ico"
         ToolTipText     =   "Ед. изм. объема"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtValueEDIZM 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   7
         ToolTipText     =   "Ед. изм. объема"
         Top             =   1815
         Width           =   2550
      End
      Begin MSMask.MaskEdBox txtTheValue 
         Height          =   300
         Left            =   300
         TabIndex        =   5
         ToolTipText     =   "Объем"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MTZ_PANEL.DropButton cmdSRCPekZ 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "По заявке"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtSRCPekZ 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "По заявке"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblWeightEDIZM 
         BackStyle       =   0  'Transparent
         Caption         =   "Ед. изм.веса:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblWeightValue 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblValueEDIZM 
         BackStyle       =   0  'Transparent
         Caption         =   "Ед. изм. объема:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheValue 
         BackStyle       =   0  'Transparent
         Caption         =   "Объем:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblSRCPekZ 
         BackStyle       =   0  'Transparent
         Caption         =   "По заявке:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "PEKL_TOLOAD"
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

Private Sub txtSRCPekZ_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdSRCPekZ_CLick()
  On Error Resume Next
     If txtSRCPekZ.Tag = "" Then
       cmdSRCPekZ_MenuClick "Выбрать"
     Else
       cmdSRCPekZ_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdSRCPekZ_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtSRCPekZ.Tag = ""
          txtSRCPekZ = ""
  End If
  If sCaption = "Открыть" Then
    If txtSRCPekZ.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtSRCPekZ.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtSRCPekZ.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "PEK2Z")
        If OK Then
          txtSRCPekZ.Tag = Left(ID, 38)
          txtSRCPekZ = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim cancel As Boolean
        brief = "PEK2Z" & Now
        ook = findObject(Item.Application.Manager, "PEK2Z", ID, brief, cancel)
        If cancel Then
          Exit Sub
        End If
        If ook Then
              txtSRCPekZ.Tag = ID
              txtSRCPekZ = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "PEK2Z", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtSRCPekZ.Tag = obj.ID
              txtSRCPekZ = obj.brief
          Else
              txtSRCPekZ.Tag = ""
              txtSRCPekZ = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtTheValue_Validate(cancel As Boolean)
If txtTheValue.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTheValue.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtTheValue.SetFocus
  ElseIf Val(txtTheValue.Text) < -922337203685478# Or Val(txtTheValue.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtTheValue.SetFocus
  End If
End If
End Sub
Private Sub txtTheValue_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTheValue_Change()
  Changing

End Sub
Private Sub txtValueEDIZM_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdValueEDIZM_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ENTDIC_EDIZM", ID, brief) Then
          txtValueEDIZM.Tag = Left(ID, 38)
          txtValueEDIZM = brief
        End If
End Sub
Private Sub cmdValueEDIZM_MenuClick(ByVal sCaption As String)
          txtValueEDIZM.Tag = ""
          txtValueEDIZM = ""
End Sub
Private Sub txtWeightValue_Validate(cancel As Boolean)
If txtWeightValue.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtWeightValue.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtWeightValue.SetFocus
  ElseIf Val(txtWeightValue.Text) < -922337203685478# Or Val(txtWeightValue.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtWeightValue.SetFocus
  End If
End If
End Sub
Private Sub txtWeightValue_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtWeightValue_Change()
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
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = txtSRCPekZ.Tag <> ""
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

If Not Item.SRCPekZ Is Nothing Then
  txtSRCPekZ.Tag = Item.SRCPekZ.ID
  txtSRCPekZ = Item.SRCPekZ.brief
Else
  txtSRCPekZ.Tag = ""
  txtSRCPekZ = ""
End If
 LoadBtnPictures cmdSRCPekZ, cmdSRCPekZ.Tag
  cmdSRCPekZ.RemoveAllMenu
  cmdSRCPekZ.AddMenu "Очистить"
  cmdSRCPekZ.AddMenu "Создать"
  cmdSRCPekZ.AddMenu "Выбрать"
  cmdSRCPekZ.AddMenu "Открыть"
txtTheValue = Item.TheValue
If Not Item.ValueEDIZM Is Nothing Then
  txtValueEDIZM.Tag = Item.ValueEDIZM.ID
  txtValueEDIZM = Item.ValueEDIZM.brief
Else
  txtValueEDIZM.Tag = ""
  txtValueEDIZM = ""
End If
 LoadBtnPictures cmdValueEDIZM, cmdValueEDIZM.Tag
  cmdValueEDIZM.RemoveAllMenu
  cmdValueEDIZM.AddMenu "Очистить"
txtWeightValue = Item.WeightValue
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

If txtSRCPekZ.Tag <> "" Then
  Set Item.SRCPekZ = Item.Application.Manager.GetInstanceObject(txtSRCPekZ.Tag)
Else
  Set Item.SRCPekZ = Nothing
End If
Item.TheValue = CDbl(txtTheValue)
If txtValueEDIZM.Tag <> "" Then
  Set Item.ValueEDIZM = Item.Application.FindRowObject("ENTDIC_EDIZM", txtValueEDIZM.Tag)
Else
  Set Item.ValueEDIZM = Nothing
End If
Item.WeightValue = CDbl(txtWeightValue)
If txtWeightEDIZM.Tag <> "" Then
  Set Item.WeightEDIZM = Item.Application.FindRowObject("ENTDIC_EDIZM", txtWeightEDIZM.Tag)
Else
  Set Item.WeightEDIZM = Nothing
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



