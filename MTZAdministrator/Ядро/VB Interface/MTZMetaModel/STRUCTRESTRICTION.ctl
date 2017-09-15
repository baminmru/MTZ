VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl STRUCTRESTRICTION 
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
      Begin VB.ComboBox cmbAllowDelete 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   11
         ToolTipText     =   "��������� �������"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.ComboBox cmbAllowEdit 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   9
         ToolTipText     =   "��������� ��������"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.ComboBox cmbAllowAdd 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   7
         ToolTipText     =   "��������� ���������"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.ComboBox cmbAllowRead 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   5
         ToolTipText     =   "�������� ��������"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdStruct 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "���������, ������ � ������� ���������"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtStruct 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "���������, ������ � ������� ���������"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblAllowDelete 
         BackStyle       =   0  'Transparent
         Caption         =   "��������� �������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblAllowEdit 
         BackStyle       =   0  'Transparent
         Caption         =   "��������� ��������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblAllowAdd 
         BackStyle       =   0  'Transparent
         Caption         =   "��������� ���������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblAllowRead 
         BackStyle       =   0  'Transparent
         Caption         =   "�������� ��������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblStruct 
         BackStyle       =   0  'Transparent
         Caption         =   "���������, ������ � ������� ���������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "STRUCTRESTRICTION"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ �������������� ������� ���������� �� ������ � ������� ���������
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

Private Sub txtStruct_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdStruct_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PART", ID, brief) Then
          txtStruct.Tag = Left(ID, 38)
          txtStruct = brief
        End If
End Sub
Private Sub cmdStruct_MenuClick(ByVal sCaption As String)
          txtStruct.Tag = ""
          txtStruct = ""
End Sub
Private Sub cmbAllowRead_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbAllowAdd_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbAllowEdit_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbAllowDelete_Click()
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

If Not Item.Struct Is Nothing Then
  txtStruct.Tag = Item.Struct.ID
  txtStruct = Item.Struct.brief
Else
  txtStruct.Tag = ""
  txtStruct = ""
End If
 LoadBtnPictures cmdStruct, cmdStruct.Tag
  cmdStruct.RemoveAllMenu
  cmdStruct.AddMenu "��������"
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
cmbAllowAdd.Clear
cmbAllowAdd.AddItem "��"
cmbAllowAdd.ItemData(cmbAllowAdd.NewIndex) = -1
cmbAllowAdd.AddItem "���"
cmbAllowAdd.ItemData(cmbAllowAdd.NewIndex) = 0
 For iii = 0 To cmbAllowAdd.ListCount - 1
  If Item.AllowAdd = cmbAllowAdd.ItemData(iii) Then
   cmbAllowAdd.ListIndex = iii
   Exit For
  End If
 Next
cmbAllowEdit.Clear
cmbAllowEdit.AddItem "��"
cmbAllowEdit.ItemData(cmbAllowEdit.NewIndex) = -1
cmbAllowEdit.AddItem "���"
cmbAllowEdit.ItemData(cmbAllowEdit.NewIndex) = 0
 For iii = 0 To cmbAllowEdit.ListCount - 1
  If Item.AllowEdit = cmbAllowEdit.ItemData(iii) Then
   cmbAllowEdit.ListIndex = iii
   Exit For
  End If
 Next
cmbAllowDelete.Clear
cmbAllowDelete.AddItem "��"
cmbAllowDelete.ItemData(cmbAllowDelete.NewIndex) = -1
cmbAllowDelete.AddItem "���"
cmbAllowDelete.ItemData(cmbAllowDelete.NewIndex) = 0
 For iii = 0 To cmbAllowDelete.ListCount - 1
  If Item.AllowDelete = cmbAllowDelete.ItemData(iii) Then
   cmbAllowDelete.ListIndex = iii
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

If txtStruct.Tag <> "" Then
  Set Item.Struct = Item.Application.FindRowObject("PART", txtStruct.Tag)
Else
  Set Item.Struct = Nothing
End If
 If cmbAllowRead.ListIndex >= 0 Then
   Item.AllowRead = cmbAllowRead.ItemData(cmbAllowRead.ListIndex)
 End If
 If cmbAllowAdd.ListIndex >= 0 Then
   Item.AllowAdd = cmbAllowAdd.ItemData(cmbAllowAdd.ListIndex)
 End If
 If cmbAllowEdit.ListIndex >= 0 Then
   Item.AllowEdit = cmbAllowEdit.ItemData(cmbAllowEdit.ListIndex)
 End If
 If cmbAllowDelete.ListIndex >= 0 Then
   Item.AllowDelete = cmbAllowDelete.ItemData(cmbAllowDelete.ListIndex)
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



