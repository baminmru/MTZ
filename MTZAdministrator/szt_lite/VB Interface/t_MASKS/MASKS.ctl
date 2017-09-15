VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl MASKS 
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
      Begin MTZ_PANEL.DropButton cmdID_TYPE 
         Height          =   300
         Left            =   2850
         TabIndex        =   10
         Tag             =   "refopen.ico"
         ToolTipText     =   "��� ������"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtID_TYPE 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   9
         ToolTipText     =   "��� ������"
         Top             =   2520
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdID_DEV 
         Height          =   300
         Left            =   2850
         TabIndex        =   7
         Tag             =   "refopen.ico"
         ToolTipText     =   "��� ����������"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtID_DEV 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   6
         ToolTipText     =   "��� ����������"
         Top             =   1815
         Width           =   2550
      End
      Begin VB.ComboBox cmbCTYPE 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   4
         ToolTipText     =   "���������"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtCNAME 
         Height          =   300
         Left            =   300
         MaxLength       =   80
         TabIndex        =   2
         ToolTipText     =   "��������"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblID_TYPE 
         BackStyle       =   0  'Transparent
         Caption         =   "��� ������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblID_DEV 
         BackStyle       =   0  'Transparent
         Caption         =   "��� ����������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblCTYPE 
         BackStyle       =   0  'Transparent
         Caption         =   "���������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblCNAME 
         BackStyle       =   0  'Transparent
         Caption         =   "��������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "MASKS"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ �������������� ������� MASKS
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

Private Sub txtCNAME_Change()
  Changing

End Sub
Private Sub cmbCTYPE_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtID_DEV_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdID_DEV_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("DEVCLASSES", ID, brief) Then
          txtID_DEV.Tag = Left(ID, 38)
          txtID_DEV = brief
        End If
End Sub
Private Sub cmdID_DEV_MenuClick(ByVal sCaption As String)
          txtID_DEV.Tag = ""
          txtID_DEV = ""
End Sub
Private Sub txtID_TYPE_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdID_TYPE_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PARAMTYPE", ID, brief) Then
          txtID_TYPE.Tag = Left(ID, 38)
          txtID_TYPE = brief
        End If
End Sub
Private Sub cmdID_TYPE_MenuClick(ByVal sCaption As String)
          txtID_TYPE.Tag = ""
          txtID_TYPE = ""
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

If mIsOK Then mIsOK = IsSet(txtCNAME.Text)
If mIsOK Then mIsOK = (cmbCTYPE.ListIndex >= 0)
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

  On Error Resume Next
txtCNAME = Item.CNAME
cmbCTYPE.Clear
cmbCTYPE.AddItem "��"
cmbCTYPE.ItemData(cmbCTYPE.NewIndex) = -1
cmbCTYPE.AddItem "���"
cmbCTYPE.ItemData(cmbCTYPE.NewIndex) = 0
 For iii = 0 To cmbCTYPE.ListCount - 1
  If Item.CTYPE = cmbCTYPE.ItemData(iii) Then
   cmbCTYPE.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.ID_DEV Is Nothing Then
  txtID_DEV.Tag = Item.ID_DEV.ID
  txtID_DEV = Item.ID_DEV.brief
Else
  txtID_DEV.Tag = ""
  txtID_DEV = ""
End If
 LoadBtnPictures cmdID_DEV, cmdID_DEV.Tag
  cmdID_DEV.RemoveAllMenu
  cmdID_DEV.AddMenu "��������"
If Not Item.ID_TYPE Is Nothing Then
  txtID_TYPE.Tag = Item.ID_TYPE.ID
  txtID_TYPE = Item.ID_TYPE.brief
Else
  txtID_TYPE.Tag = ""
  txtID_TYPE = ""
End If
 LoadBtnPictures cmdID_TYPE, cmdID_TYPE.Tag
  cmdID_TYPE.RemoveAllMenu
  cmdID_TYPE.AddMenu "��������"
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

Item.CNAME = txtCNAME
 If cmbCTYPE.ListIndex >= 0 Then
   Item.CTYPE = cmbCTYPE.ItemData(cmbCTYPE.ListIndex)
 End If
If txtID_DEV.Tag <> "" Then
  Set Item.ID_DEV = Item.Application.FindRowObject("DEVCLASSES", txtID_DEV.Tag)
Else
  Set Item.ID_DEV = Nothing
End If
If txtID_TYPE.Tag <> "" Then
  Set Item.ID_TYPE = Item.Application.FindRowObject("PARAMTYPE", txtID_TYPE.Tag)
Else
  Set Item.ID_TYPE = Nothing
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



