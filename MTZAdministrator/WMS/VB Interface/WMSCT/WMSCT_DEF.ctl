VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WMSCT_DEF 
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
      Begin MTZ_PANEL.DropButton cmdSupplier 
         Height          =   300
         Left            =   2850
         TabIndex        =   7
         Tag             =   "refopen.ico"
         ToolTipText     =   "Поставщик"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtSupplier 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   6
         ToolTipText     =   "Поставщик"
         Top             =   1815
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpTheDate 
         Height          =   300
         Left            =   300
         TabIndex        =   4
         ToolTipText     =   "Дата"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   85000195
         CurrentDate     =   39482
      End
      Begin VB.TextBox txtTheNumber 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   2
         ToolTipText     =   "Номер договора"
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblSupplier 
         BackStyle       =   0  'Transparent
         Caption         =   "Поставщик:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер договора:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WMSCT_DEF"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean





Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef brief As String, ByRef Cancel As Boolean) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, brief, Cancel)
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

Private Sub txtTheNumber_Validate(Cancel As Boolean)
If txtTheNumber.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTheNumber.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtTheNumber.SetFocus
  ElseIf Val(txtTheNumber.Text) <> CLng(Val(txtTheNumber.Text)) Then
     Cancel = True
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
Private Sub dtpTheDate_Change()
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
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "WMSK")
        If OK Then
          txtSupplier.Tag = Left(ID, 38)
          txtSupplier = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim Cancel As Boolean
        brief = "WMSK" & Now
        ook = findObject(Item.Application.Manager, "WMSK", ID, brief, Cancel)
        If Cancel Then
          Exit Sub
        End If
        If ook Then
              txtSupplier.Tag = ID
              txtSupplier = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "WMSK", brief)
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
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtTheNumber.Text)
If mIsOK Then mIsOK = IsSet(dtpTheDate.Value)
If mIsOK Then mIsOK = txtSupplier.Tag <> ""
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

txtTheNumber = Item.TheNumber
dtpTheDate = Date
If Item.TheDate <> 0 Then
 dtpTheDate = Item.TheDate
End If
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

Item.TheNumber = CDbl(txtTheNumber)
  If IsNull(dtpTheDate) Then
    Item.TheDate = 0
  Else
    Item.TheDate = dtpTheDate.Value
  End If
If txtSupplier.Tag <> "" Then
  Set Item.Supplier = Item.Application.Manager.GetInstanceObject(txtSupplier.Tag)
Else
  Set Item.Supplier = Nothing
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



