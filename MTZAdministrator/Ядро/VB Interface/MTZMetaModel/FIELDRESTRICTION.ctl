VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl FIELDRESTRICTION 
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
      Begin VB.ComboBox cmbMandatoryField 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   12
         ToolTipText     =   "������������ ����"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.ComboBox cmbAllowModify 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   10
         ToolTipText     =   "��������� �����������"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.ComboBox cmbAllowRead 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   8
         ToolTipText     =   "�������� ��������"
         Top             =   1815
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheField 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "refopen.ico"
         ToolTipText     =   "����, �� ������� ������������� �����������"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheField 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   5
         ToolTipText     =   "����, �� ������� ������������� �����������"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdThePart 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "���������, ������� ����������� ����"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtThePart 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "���������, ������� ����������� ����"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblMandatoryField 
         BackStyle       =   0  'Transparent
         Caption         =   "������������ ����:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblAllowModify 
         BackStyle       =   0  'Transparent
         Caption         =   "��������� �����������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblAllowRead 
         BackStyle       =   0  'Transparent
         Caption         =   "�������� ��������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheField 
         BackStyle       =   0  'Transparent
         Caption         =   "����, �� ������� ������������� �����������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblThePart 
         BackStyle       =   0  'Transparent
         Caption         =   "���������, ������� ����������� ����:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "FIELDRESTRICTION"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ �������������� ������� ����������� �� ������ � ����� �������
   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean






'������� ������ ������
'Parameters:
'[IN][OUT]  Runner , ��� ���������: mtzmanager.main,
'[IN]   TypeName , ��� ���������: String,
'[IN][OUT]   ID , ��� ���������: string,
'[IN][OUT]   Brief , ��� ���������: string,
'[IN][OUT]   Cancel , ��� ���������: boolean  - ...
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as Boolean
' variable = me.findObject(...���������...)
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

'������� ��������� ������
'Parameters:
' ���������� ���
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as Boolean
'  variable = me.IsChanged()
Public Function IsChanged() As Boolean
  IsChanged = mIsChanged
End Function
Private Sub Usercontrol_resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub txtThePart_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdThePart_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PART", ID, brief) Then
          txtThePart.Tag = Left(ID, 38)
          txtThePart = brief
        End If
End Sub
Private Sub cmdThePart_MenuClick(ByVal sCaption As String)
          txtThePart.Tag = ""
          txtThePart = ""
End Sub
Private Sub txtTheField_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheField_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("FIELD", ID, brief) Then
          txtTheField.Tag = Left(ID, 38)
          txtTheField = brief
        End If
End Sub
Private Sub cmdTheField_MenuClick(ByVal sCaption As String)
          txtTheField.Tag = ""
          txtTheField = ""
End Sub
Private Sub cmbAllowRead_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbAllowModify_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbMandatoryField_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub

'�������� ������������ ���������� ������ �� ������ ��������������
'Parameters:
' ���������� ���
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
'  variable = me.IsOK()
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

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

'������������� ��������� ������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.InitPanel()
Public Sub InitPanel()
OnInit = True
Dim iii As Long ' for combo only
If Item.CanChange Then
  Panel.Enabled = True
Else
  Panel.Enabled = False
End If

If Not Item.ThePart Is Nothing Then
  txtThePart.Tag = Item.ThePart.ID
  txtThePart = Item.ThePart.brief
Else
  txtThePart.Tag = ""
  txtThePart = ""
End If
 LoadBtnPictures cmdThePart, cmdThePart.Tag
  cmdThePart.RemoveAllMenu
  cmdThePart.AddMenu "��������"
If Not Item.TheField Is Nothing Then
  txtTheField.Tag = Item.TheField.ID
  txtTheField = Item.TheField.brief
Else
  txtTheField.Tag = ""
  txtTheField = ""
End If
 LoadBtnPictures cmdTheField, cmdTheField.Tag
  cmdTheField.RemoveAllMenu
  cmdTheField.AddMenu "��������"
cmbAllowRead.Clear
cmbAllowRead.AddItem "��"
cmbAllowRead.ItemData(cmbAllowRead.NewIndex) = -1
cmbAllowRead.AddItem "���"
cmbAllowRead.ItemData(cmbAllowRead.NewIndex) = 0
 For iii = 0 To cmbAllowRead.ListCount - 1
  If Item.AllowRead = cmbAllowRead.ItemData(iii) Then
   cmbAllowRead.ListIndex = iii
   Exit For
  End If
 Next
cmbAllowModify.Clear
cmbAllowModify.AddItem "��"
cmbAllowModify.ItemData(cmbAllowModify.NewIndex) = -1
cmbAllowModify.AddItem "���"
cmbAllowModify.ItemData(cmbAllowModify.NewIndex) = 0
 For iii = 0 To cmbAllowModify.ListCount - 1
  If Item.AllowModify = cmbAllowModify.ItemData(iii) Then
   cmbAllowModify.ListIndex = iii
   Exit For
  End If
 Next
cmbMandatoryField.Clear
cmbMandatoryField.AddItem "���"
cmbMandatoryField.ItemData(cmbMandatoryField.NewIndex) = 0
cmbMandatoryField.AddItem "�� �����������"
cmbMandatoryField.ItemData(cmbMandatoryField.NewIndex) = -1
cmbMandatoryField.AddItem "��"
cmbMandatoryField.ItemData(cmbMandatoryField.NewIndex) = 1
 For iii = 0 To cmbMandatoryField.ListCount - 1
  If Item.MandatoryField = cmbMandatoryField.ItemData(iii) Then
   cmbMandatoryField.ListIndex = iii
   Exit For
  End If
 Next
' ������� �������� ID �� ���� SQLReference
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub

 mIsChanged = True
 RaiseEvent Changed
End Sub

'����������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.Save({���������})
Public Sub Save()
If OnInit Then Exit Sub

If txtThePart.Tag <> "" Then
  Set Item.ThePart = Item.Application.FindRowObject("PART", txtThePart.Tag)
Else
  Set Item.ThePart = Nothing
End If
If txtTheField.Tag <> "" Then
  Set Item.TheField = Item.Application.FindRowObject("FIELD", txtTheField.Tag)
Else
  Set Item.TheField = Nothing
End If
 If cmbAllowRead.ListIndex >= 0 Then
   Item.AllowRead = cmbAllowRead.ItemData(cmbAllowRead.ListIndex)
 End If
 If cmbAllowModify.ListIndex >= 0 Then
   Item.AllowModify = cmbAllowModify.ItemData(cmbAllowModify.ListIndex)
 End If
 If cmbMandatoryField.ListIndex >= 0 Then
   Item.MandatoryField = cmbMandatoryField.ItemData(cmbMandatoryField.ListIndex)
 End If
 mIsChanged = False
 RaiseEvent Changed
End Sub

'������ ������� ������ �� ������� ���������
'Parameters:
'[IN][OUT]  x , ��� ���������: Single,
'[IN][OUT]   y , ��� ���������: single  - ...
'See Also:
'Example:
'  call me.OptimalSize({���������})
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

'�������� ���� ��������� ������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.Customize()
 Public Sub Customize()
   Panel.Customize
 End Sub

'������ ��������� ��������� �� ������ ��� ���������� �������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� string
'See Also:
'Example:
' dim variable as string
' variable = me. PanelCustomisationString
 Public Property Get PanelCustomisationString() As String
   PanelCustomisationString = Panel.PanelCustomisationString
 End Property

'��������������  ������� ��������� �� ������
'Parameters:
'[IN][OUT]  s , ��� ���������: string  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...��������...
' me. PanelCustomisationString = value
 Public Property Let PanelCustomisationString(s As String)
   Panel.PanelCustomisationString = s
 End Property

'���������� ��������� ���������
'Parameters:
' ���������� ���
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me. Enabled
 Public Property Get Enabled() As Boolean
   Enabled = Panel.Enabled
 End Property

'������ \ ���������� ��������� ���������
'Parameters:
'[IN]   v , ��� ���������: boolean  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...��������...
' me. Enabled = value
 Public Property Let Enabled(ByVal v As Boolean)
   Panel.Enabled = v
 End Property



