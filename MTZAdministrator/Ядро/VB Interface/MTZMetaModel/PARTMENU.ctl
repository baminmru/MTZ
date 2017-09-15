VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl PARTMENU 
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
      Begin VB.TextBox txtHotKey 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   15
         ToolTipText     =   "������� �������"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsToolBarButton 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   13
         ToolTipText     =   "� ������"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsMenuItem 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   11
         ToolTipText     =   "�������� � ����"
         Top             =   3225
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdthe_Action 
         Height          =   300
         Left            =   2850
         TabIndex        =   9
         Tag             =   "refopen.ico"
         ToolTipText     =   "�����"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtthe_Action 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   8
         ToolTipText     =   "�����"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.TextBox txtToolTip 
         Height          =   300
         Left            =   300
         MaxLength       =   80
         TabIndex        =   6
         ToolTipText     =   "���������"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtCaption 
         Height          =   300
         Left            =   300
         MaxLength       =   80
         TabIndex        =   4
         ToolTipText     =   "���������"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   64
         TabIndex        =   2
         ToolTipText     =   "��������"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblHotKey 
         BackStyle       =   0  'Transparent
         Caption         =   "������� �������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblIsToolBarButton 
         BackStyle       =   0  'Transparent
         Caption         =   "� ������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblIsMenuItem 
         BackStyle       =   0  'Transparent
         Caption         =   "�������� � ����:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblthe_Action 
         BackStyle       =   0  'Transparent
         Caption         =   "�����:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblToolTip 
         BackStyle       =   0  'Transparent
         Caption         =   "���������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblCaption 
         BackStyle       =   0  'Transparent
         Caption         =   "���������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "��������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "PARTMENU"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ �������������� ������� ������ ������ �������
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

Private Sub txtName_Change()
  Changing

End Sub
Private Sub txtCaption_Change()
  Changing

End Sub
Private Sub txtToolTip_Change()
  Changing

End Sub
Private Sub txtthe_Action_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdthe_Action_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("SHAREDMETHOD", ID, brief) Then
          txtthe_Action.Tag = Left(ID, 38)
          txtthe_Action = brief
        End If
End Sub
Private Sub cmdthe_Action_MenuClick(ByVal sCaption As String)
          txtthe_Action.Tag = ""
          txtthe_Action = ""
End Sub
Private Sub cmbIsMenuItem_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbIsToolBarButton_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtHotKey_Change()
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

  On Error Resume Next
txtName = Item.Name
  On Error Resume Next
txtCaption = Item.Caption
  On Error Resume Next
txtToolTip = Item.ToolTip
If Not Item.the_Action Is Nothing Then
  txtthe_Action.Tag = Item.the_Action.ID
  txtthe_Action = Item.the_Action.brief
Else
  txtthe_Action.Tag = ""
  txtthe_Action = ""
End If
 LoadBtnPictures cmdthe_Action, cmdthe_Action.Tag
  cmdthe_Action.RemoveAllMenu
  cmdthe_Action.AddMenu "��������"
cmbIsMenuItem.Clear
cmbIsMenuItem.AddItem "��"
cmbIsMenuItem.ItemData(cmbIsMenuItem.NewIndex) = -1
cmbIsMenuItem.AddItem "���"
cmbIsMenuItem.ItemData(cmbIsMenuItem.NewIndex) = 0
 For iii = 0 To cmbIsMenuItem.ListCount - 1
  If Item.IsMenuItem = cmbIsMenuItem.ItemData(iii) Then
   cmbIsMenuItem.ListIndex = iii
   Exit For
  End If
 Next
cmbIsToolBarButton.Clear
cmbIsToolBarButton.AddItem "��"
cmbIsToolBarButton.ItemData(cmbIsToolBarButton.NewIndex) = -1
cmbIsToolBarButton.AddItem "���"
cmbIsToolBarButton.ItemData(cmbIsToolBarButton.NewIndex) = 0
 For iii = 0 To cmbIsToolBarButton.ListCount - 1
  If Item.IsToolBarButton = cmbIsToolBarButton.ItemData(iii) Then
   cmbIsToolBarButton.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtHotKey = Item.HotKey
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

Item.Name = txtName
Item.Caption = txtCaption
Item.ToolTip = txtToolTip
If txtthe_Action.Tag <> "" Then
  Set Item.the_Action = Item.Application.FindRowObject("SHAREDMETHOD", txtthe_Action.Tag)
Else
  Set Item.the_Action = Nothing
End If
 If cmbIsMenuItem.ListIndex >= 0 Then
   Item.IsMenuItem = cmbIsMenuItem.ItemData(cmbIsMenuItem.ListIndex)
 End If
 If cmbIsToolBarButton.ListIndex >= 0 Then
   Item.IsToolBarButton = cmbIsToolBarButton.ItemData(cmbIsToolBarButton.ListIndex)
 End If
Item.HotKey = txtHotKey
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



