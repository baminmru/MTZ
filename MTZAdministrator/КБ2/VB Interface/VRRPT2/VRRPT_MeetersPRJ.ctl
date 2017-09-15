VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl VRRPT_MeetersPRJ 
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
      Begin VB.ComboBox cmbReminderSent 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   12
         ToolTipText     =   "Оповещен"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtReminderTime 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   10
         ToolTipText     =   "Оповещать за (час.)"
         Top             =   2520
         Width           =   1800
      End
      Begin VB.ComboBox cmbMandatory 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   8
         ToolTipText     =   "Обязательно"
         Top             =   1815
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdContact 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "refopen.ico"
         ToolTipText     =   "Контактное лицо"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtContact 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   5
         ToolTipText     =   "Контактное лицо"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdWorker 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Сотрудник"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtWorker 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Сотрудник"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblReminderSent 
         BackStyle       =   0  'Transparent
         Caption         =   "Оповещен:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblReminderTime 
         BackStyle       =   0  'Transparent
         Caption         =   "Оповещать за (час.):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblMandatory 
         BackStyle       =   0  'Transparent
         Caption         =   "Обязательно:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblContact 
         BackStyle       =   0  'Transparent
         Caption         =   "Контактное лицо:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblWorker 
         BackStyle       =   0  'Transparent
         Caption         =   "Сотрудник:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "VRRPT_MeetersPRJ"
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

Private Sub txtWorker_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdWorker_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("Users", ID, brief) Then
          txtWorker.Tag = Left(ID, 38)
          txtWorker = brief
        End If
End Sub
Private Sub cmdWorker_MenuClick(ByVal sCaption As String)
          txtWorker.Tag = ""
          txtWorker = ""
End Sub
Private Sub txtContact_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdContact_CLick()
  On Error Resume Next
     If txtContact.Tag = "" Then
       cmdContact_MenuClick "Выбрать"
     Else
       cmdContact_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdContact_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtContact.Tag = ""
          txtContact = ""
  End If
  If sCaption = "Открыть" Then
    If txtContact.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtContact.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtContact.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "VRCP2")
        If OK Then
          txtContact.Tag = Left(ID, 38)
          txtContact = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim cancel As Boolean
        brief = "VRCP2" & Now
        ook = findObject(Item.Application.Manager, "VRCP2", ID, brief, cancel)
        If cancel Then
          Exit Sub
        End If
        If ook Then
              txtContact.Tag = ID
              txtContact = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "VRCP2", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtContact.Tag = obj.ID
              txtContact = obj.brief
          Else
              txtContact.Tag = ""
              txtContact = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub cmbMandatory_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtReminderTime_Validate(cancel As Boolean)
If txtReminderTime.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtReminderTime.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtReminderTime.SetFocus
  ElseIf Val(txtReminderTime.Text) <> CLng(Val(txtReminderTime.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtReminderTime.SetFocus
  End If
End If
End Sub
Private Sub txtReminderTime_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtReminderTime_Change()
  Changing

End Sub
Private Sub cmbReminderSent_Click()
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

If mIsOK Then mIsOK = (cmbMandatory.ListIndex >= 0)
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

If Not Item.Worker Is Nothing Then
  txtWorker.Tag = Item.Worker.ID
  txtWorker = Item.Worker.brief
Else
  txtWorker.Tag = ""
  txtWorker = ""
End If
 LoadBtnPictures cmdWorker, cmdWorker.Tag
  cmdWorker.RemoveAllMenu
  cmdWorker.AddMenu "Очистить"
If Not Item.Contact Is Nothing Then
  txtContact.Tag = Item.Contact.ID
  txtContact = Item.Contact.brief
Else
  txtContact.Tag = ""
  txtContact = ""
End If
 LoadBtnPictures cmdContact, cmdContact.Tag
  cmdContact.RemoveAllMenu
  cmdContact.AddMenu "Очистить"
  cmdContact.AddMenu "Создать"
  cmdContact.AddMenu "Выбрать"
  cmdContact.AddMenu "Открыть"
cmbMandatory.Clear
cmbMandatory.AddItem "Да"
cmbMandatory.ItemData(cmbMandatory.NewIndex) = -1
cmbMandatory.AddItem "Нет"
cmbMandatory.ItemData(cmbMandatory.NewIndex) = 0
 For iii = 0 To cmbMandatory.ListCount - 1
  If Item.Mandatory = cmbMandatory.ItemData(iii) Then
   cmbMandatory.ListIndex = iii
   Exit For
  End If
 Next
txtReminderTime = Item.ReminderTime
cmbReminderSent.Clear
cmbReminderSent.AddItem "Да"
cmbReminderSent.ItemData(cmbReminderSent.NewIndex) = -1
cmbReminderSent.AddItem "Нет"
cmbReminderSent.ItemData(cmbReminderSent.NewIndex) = 0
 For iii = 0 To cmbReminderSent.ListCount - 1
  If Item.ReminderSent = cmbReminderSent.ItemData(iii) Then
   cmbReminderSent.ListIndex = iii
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

If txtWorker.Tag <> "" Then
  Set Item.Worker = Item.Application.FindRowObject("Users", txtWorker.Tag)
Else
  Set Item.Worker = Nothing
End If
If txtContact.Tag <> "" Then
  Set Item.Contact = Item.Application.Manager.GetInstanceObject(txtContact.Tag)
Else
  Set Item.Contact = Nothing
End If
 If cmbMandatory.ListIndex >= 0 Then
   Item.Mandatory = cmbMandatory.ItemData(cmbMandatory.ListIndex)
 End If
Item.ReminderTime = CDbl(txtReminderTime)
 If cmbReminderSent.ListIndex >= 0 Then
   Item.ReminderSent = cmbReminderSent.ItemData(cmbReminderSent.ListIndex)
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



