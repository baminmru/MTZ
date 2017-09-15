VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl PEKD_NZONEmain 
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
      Begin VB.TextBox txtPOIDX 
         Height          =   300
         Left            =   300
         MaxLength       =   6
         TabIndex        =   13
         ToolTipText     =   "Индекс отделения"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtToPPOIdx 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   11
         ToolTipText     =   "По"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.TextBox txtFromPPOIDX 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   9
         ToolTipText     =   "Начиная с"
         Top             =   2520
         Width           =   1800
      End
      Begin VB.ComboBox cmbTheMonth 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   7
         ToolTipText     =   "Месяц"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtTheYear 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   5
         ToolTipText     =   "Год"
         Top             =   1110
         Width           =   1800
      End
      Begin MTZ_PANEL.DropButton cmdDept 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Филиал"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtDept 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Филиал"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblPOIDX 
         BackStyle       =   0  'Transparent
         Caption         =   "Индекс отделения:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblToPPOIdx 
         BackStyle       =   0  'Transparent
         Caption         =   "По:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblFromPPOIDX 
         BackStyle       =   0  'Transparent
         Caption         =   "Начиная с:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblTheMonth 
         BackStyle       =   0  'Transparent
         Caption         =   "Месяц:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheYear 
         BackStyle       =   0  'Transparent
         Caption         =   "Год:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblDept 
         BackStyle       =   0  'Transparent
         Caption         =   "Филиал:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "PEKD_NZONEmain"
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

Private Sub txtDept_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdDept_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PEKD_DEPT", ID, brief) Then
          txtDept.Tag = Left(ID, 38)
          txtDept = brief
        End If
End Sub
Private Sub cmdDept_MenuClick(ByVal sCaption As String)
          txtDept.Tag = ""
          txtDept = ""
End Sub
Private Sub txtTheYear_Validate(cancel As Boolean)
If txtTheYear.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTheYear.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtTheYear.SetFocus
  ElseIf Val(txtTheYear.Text) <> CLng(Val(txtTheYear.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtTheYear.SetFocus
  End If
End If
End Sub
Private Sub txtTheYear_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTheYear_Change()
  Changing

End Sub
Private Sub cmbTheMonth_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtFromPPOIDX_Validate(cancel As Boolean)
If txtFromPPOIDX.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtFromPPOIDX.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtFromPPOIDX.SetFocus
  ElseIf Val(txtFromPPOIDX.Text) <> CLng(Val(txtFromPPOIDX.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtFromPPOIDX.SetFocus
  End If
End If
End Sub
Private Sub txtFromPPOIDX_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtFromPPOIDX_Change()
  Changing

End Sub
Private Sub txtToPPOIdx_Validate(cancel As Boolean)
If txtToPPOIdx.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtToPPOIdx.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtToPPOIdx.SetFocus
  ElseIf Val(txtToPPOIdx.Text) <> CLng(Val(txtToPPOIdx.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtToPPOIdx.SetFocus
  End If
End If
End Sub
Private Sub txtToPPOIdx_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtToPPOIdx_Change()
  Changing

End Sub
Private Sub txtPOIDX_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = txtDept.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtTheYear.Text)
If mIsOK Then mIsOK = (cmbTheMonth.ListIndex >= 0)
If mIsOK Then mIsOK = IsSet(txtFromPPOIDX.Text)
If mIsOK Then mIsOK = IsSet(txtToPPOIdx.Text)
If mIsOK Then mIsOK = IsSet(txtPOIDX.Text)
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

If Not Item.Dept Is Nothing Then
  txtDept.Tag = Item.Dept.ID
  txtDept = Item.Dept.brief
Else
  txtDept.Tag = ""
  txtDept = ""
End If
 LoadBtnPictures cmdDept, cmdDept.Tag
  cmdDept.RemoveAllMenu
  cmdDept.AddMenu "Очистить"
txtTheYear = Item.TheYear
cmbTheMonth.Clear
cmbTheMonth.AddItem "Ноябрь"
cmbTheMonth.ItemData(cmbTheMonth.NewIndex) = 11
cmbTheMonth.AddItem "Февраль"
cmbTheMonth.ItemData(cmbTheMonth.NewIndex) = 2
cmbTheMonth.AddItem "Декабрь"
cmbTheMonth.ItemData(cmbTheMonth.NewIndex) = 12
cmbTheMonth.AddItem "Март"
cmbTheMonth.ItemData(cmbTheMonth.NewIndex) = 3
cmbTheMonth.AddItem "Январь"
cmbTheMonth.ItemData(cmbTheMonth.NewIndex) = 1
cmbTheMonth.AddItem "Сентябрь"
cmbTheMonth.ItemData(cmbTheMonth.NewIndex) = 9
cmbTheMonth.AddItem "Июнь"
cmbTheMonth.ItemData(cmbTheMonth.NewIndex) = 6
cmbTheMonth.AddItem "Октябрь"
cmbTheMonth.ItemData(cmbTheMonth.NewIndex) = 10
cmbTheMonth.AddItem "Май"
cmbTheMonth.ItemData(cmbTheMonth.NewIndex) = 5
cmbTheMonth.AddItem "Август"
cmbTheMonth.ItemData(cmbTheMonth.NewIndex) = 8
cmbTheMonth.AddItem "Июль"
cmbTheMonth.ItemData(cmbTheMonth.NewIndex) = 7
cmbTheMonth.AddItem "Апрель"
cmbTheMonth.ItemData(cmbTheMonth.NewIndex) = 4
 For iii = 0 To cmbTheMonth.ListCount - 1
  If Item.TheMonth = cmbTheMonth.ItemData(iii) Then
   cmbTheMonth.ListIndex = iii
   Exit For
  End If
 Next
txtFromPPOIDX = Item.FromPPOIDX
txtToPPOIdx = Item.ToPPOIdx
  On Error Resume Next
txtPOIDX = Item.POIDX
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

If txtDept.Tag <> "" Then
  Set Item.Dept = Item.Application.FindRowObject("PEKD_DEPT", txtDept.Tag)
Else
  Set Item.Dept = Nothing
End If
Item.TheYear = CDbl(txtTheYear)
 If cmbTheMonth.ListIndex >= 0 Then
   Item.TheMonth = cmbTheMonth.ItemData(cmbTheMonth.ListIndex)
 End If
Item.FromPPOIDX = CDbl(txtFromPPOIDX)
Item.ToPPOIdx = CDbl(txtToPPOIdx)
Item.POIDX = txtPOIDX
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



