VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl OBJECTTYPE 
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
      Begin VB.TextBox txtTheComment 
         Height          =   1200
         Left            =   3450
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   29
         ToolTipText     =   "��������"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.ComboBox cmbReplicaType 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   27
         ToolTipText     =   "��� ����������"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.ComboBox cmbAllowSearch 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   25
         ToolTipText     =   "���������� ��� ������"
         Top             =   405
         Width           =   3000
      End
      Begin VB.ComboBox cmbAllowRefToObject 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   23
         ToolTipText     =   "���������� ��� ������ ������"
         Top             =   6045
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdOnDelete 
         Height          =   300
         Left            =   2850
         TabIndex        =   21
         Tag             =   "refopen.ico"
         ToolTipText     =   "��� ��������"
         Top             =   5340
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtOnDelete 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   20
         ToolTipText     =   "��� ��������"
         Top             =   5340
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdOnCreate 
         Height          =   300
         Left            =   2850
         TabIndex        =   18
         Tag             =   "refopen.ico"
         ToolTipText     =   "��� ��������"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtOnCreate 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   17
         ToolTipText     =   "��� ��������"
         Top             =   4635
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdOnRun 
         Height          =   300
         Left            =   2850
         TabIndex        =   15
         Tag             =   "refopen.ico"
         ToolTipText     =   "��� �������"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtOnRun 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   14
         ToolTipText     =   "��� �������"
         Top             =   3930
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdChooseView 
         Height          =   300
         Left            =   2850
         TabIndex        =   12
         Tag             =   "refopen.ico"
         ToolTipText     =   "������������� ��� ������"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtChooseView 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   11
         ToolTipText     =   "������������� ��� ������"
         Top             =   3225
         Width           =   2550
      End
      Begin VB.ComboBox cmbIsSingleInstance 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   9
         ToolTipText     =   "����������� ������ ���� ������"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   14
         TabIndex        =   7
         ToolTipText     =   "���"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtthe_Comment 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   5
         ToolTipText     =   "��������"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdPackage 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "����������"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtPackage 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "����������"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblTheComment 
         BackStyle       =   0  'Transparent
         Caption         =   "��������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblReplicaType 
         BackStyle       =   0  'Transparent
         Caption         =   "��� ����������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblAllowSearch 
         BackStyle       =   0  'Transparent
         Caption         =   "���������� ��� ������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblAllowRefToObject 
         BackStyle       =   0  'Transparent
         Caption         =   "���������� ��� ������ ������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   22
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblOnDelete 
         BackStyle       =   0  'Transparent
         Caption         =   "��� ��������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblOnCreate 
         BackStyle       =   0  'Transparent
         Caption         =   "��� ��������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblOnRun 
         BackStyle       =   0  'Transparent
         Caption         =   "��� �������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblChooseView 
         BackStyle       =   0  'Transparent
         Caption         =   "������������� ��� ������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblIsSingleInstance 
         BackStyle       =   0  'Transparent
         Caption         =   "����������� ������ ���� ������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "���:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblthe_Comment 
         BackStyle       =   0  'Transparent
         Caption         =   "��������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblPackage 
         BackStyle       =   0  'Transparent
         Caption         =   "����������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "OBJECTTYPE"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ �������������� ������� ��� ������� (��������)
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

Private Sub txtPackage_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdPackage_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("MTZAPP", ID, brief) Then
          txtPackage.Tag = Left(ID, 38)
          txtPackage = brief
        End If
End Sub
Private Sub cmdPackage_MenuClick(ByVal sCaption As String)
          txtPackage.Tag = ""
          txtPackage = ""
End Sub
Private Sub txtthe_Comment_Change()
  Changing

End Sub
Private Sub txtName_Change()
  Changing

End Sub
Private Sub cmbIsSingleInstance_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtChooseView_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdChooseView_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PARTVIEW", ID, brief) Then
          txtChooseView.Tag = Left(ID, 38)
          txtChooseView = brief
        End If
End Sub
Private Sub cmdChooseView_MenuClick(ByVal sCaption As String)
          txtChooseView.Tag = ""
          txtChooseView = ""
End Sub
Private Sub txtOnRun_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdOnRun_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TYPEMENU", ID, brief, Item.Application.ID) Then
          txtOnRun.Tag = Left(ID, 38)
          txtOnRun = brief
        End If
End Sub
Private Sub cmdOnRun_MenuClick(ByVal sCaption As String)
          txtOnRun.Tag = ""
          txtOnRun = ""
End Sub
Private Sub txtOnCreate_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdOnCreate_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TYPEMENU", ID, brief) Then
          txtOnCreate.Tag = Left(ID, 38)
          txtOnCreate = brief
        End If
End Sub
Private Sub cmdOnCreate_MenuClick(ByVal sCaption As String)
          txtOnCreate.Tag = ""
          txtOnCreate = ""
End Sub
Private Sub txtOnDelete_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdOnDelete_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TYPEMENU", ID, brief) Then
          txtOnDelete.Tag = Left(ID, 38)
          txtOnDelete = brief
        End If
End Sub
Private Sub cmdOnDelete_MenuClick(ByVal sCaption As String)
          txtOnDelete.Tag = ""
          txtOnDelete = ""
End Sub
Private Sub cmbAllowRefToObject_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbAllowSearch_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbReplicaType_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtTheComment_Change()
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

If mIsOK Then mIsOK = txtPackage.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtName.Text)
If mIsOK Then mIsOK = (cmbIsSingleInstance.ListIndex >= 0)
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

If Not Item.Package Is Nothing Then
  txtPackage.Tag = Item.Package.ID
  txtPackage = Item.Package.brief
Else
  txtPackage.Tag = ""
  txtPackage = ""
End If
 LoadBtnPictures cmdPackage, cmdPackage.Tag
  cmdPackage.RemoveAllMenu
  cmdPackage.AddMenu "��������"
  On Error Resume Next
txtthe_Comment = Item.the_Comment
  On Error Resume Next
txtName = Item.Name
cmbIsSingleInstance.Clear
cmbIsSingleInstance.AddItem "��"
cmbIsSingleInstance.ItemData(cmbIsSingleInstance.NewIndex) = -1
cmbIsSingleInstance.AddItem "���"
cmbIsSingleInstance.ItemData(cmbIsSingleInstance.NewIndex) = 0
 For iii = 0 To cmbIsSingleInstance.ListCount - 1
  If Item.IsSingleInstance = cmbIsSingleInstance.ItemData(iii) Then
   cmbIsSingleInstance.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.ChooseView Is Nothing Then
  txtChooseView.Tag = Item.ChooseView.ID
  txtChooseView = Item.ChooseView.brief
Else
  txtChooseView.Tag = ""
  txtChooseView = ""
End If
 LoadBtnPictures cmdChooseView, cmdChooseView.Tag
  cmdChooseView.RemoveAllMenu
  cmdChooseView.AddMenu "��������"
If Not Item.OnRun Is Nothing Then
  txtOnRun.Tag = Item.OnRun.ID
  txtOnRun = Item.OnRun.brief
Else
  txtOnRun.Tag = ""
  txtOnRun = ""
End If
 LoadBtnPictures cmdOnRun, cmdOnRun.Tag
  cmdOnRun.RemoveAllMenu
  cmdOnRun.AddMenu "��������"
If Not Item.OnCreate Is Nothing Then
  txtOnCreate.Tag = Item.OnCreate.ID
  txtOnCreate = Item.OnCreate.brief
Else
  txtOnCreate.Tag = ""
  txtOnCreate = ""
End If
 LoadBtnPictures cmdOnCreate, cmdOnCreate.Tag
  cmdOnCreate.RemoveAllMenu
  cmdOnCreate.AddMenu "��������"
If Not Item.OnDelete Is Nothing Then
  txtOnDelete.Tag = Item.OnDelete.ID
  txtOnDelete = Item.OnDelete.brief
Else
  txtOnDelete.Tag = ""
  txtOnDelete = ""
End If
 LoadBtnPictures cmdOnDelete, cmdOnDelete.Tag
  cmdOnDelete.RemoveAllMenu
  cmdOnDelete.AddMenu "��������"
cmbAllowRefToObject.Clear
cmbAllowRefToObject.AddItem "��"
cmbAllowRefToObject.ItemData(cmbAllowRefToObject.NewIndex) = -1
cmbAllowRefToObject.AddItem "���"
cmbAllowRefToObject.ItemData(cmbAllowRefToObject.NewIndex) = 0
 For iii = 0 To cmbAllowRefToObject.ListCount - 1
  If Item.AllowRefToObject = cmbAllowRefToObject.ItemData(iii) Then
   cmbAllowRefToObject.ListIndex = iii
   Exit For
  End If
 Next
cmbAllowSearch.Clear
cmbAllowSearch.AddItem "��"
cmbAllowSearch.ItemData(cmbAllowSearch.NewIndex) = -1
cmbAllowSearch.AddItem "���"
cmbAllowSearch.ItemData(cmbAllowSearch.NewIndex) = 0
 For iii = 0 To cmbAllowSearch.ListCount - 1
  If Item.AllowSearch = cmbAllowSearch.ItemData(iii) Then
   cmbAllowSearch.ListIndex = iii
   Exit For
  End If
 Next
cmbReplicaType.Clear
cmbReplicaType.AddItem "���� ��������"
cmbReplicaType.ItemData(cmbReplicaType.NewIndex) = 0
cmbReplicaType.AddItem "���������"
cmbReplicaType.ItemData(cmbReplicaType.NewIndex) = 2
cmbReplicaType.AddItem "���������"
cmbReplicaType.ItemData(cmbReplicaType.NewIndex) = 1
 For iii = 0 To cmbReplicaType.ListCount - 1
  If Item.ReplicaType = cmbReplicaType.ItemData(iii) Then
   cmbReplicaType.ListIndex = iii
   Exit For
  End If
 Next
txtTheComment = Item.TheComment
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

If txtPackage.Tag <> "" Then
  Set Item.Package = Item.Application.FindRowObject("MTZAPP", txtPackage.Tag)
Else
  Set Item.Package = Nothing
End If
Item.the_Comment = txtthe_Comment
Item.Name = txtName
 If cmbIsSingleInstance.ListIndex >= 0 Then
   Item.IsSingleInstance = cmbIsSingleInstance.ItemData(cmbIsSingleInstance.ListIndex)
 End If
If txtChooseView.Tag <> "" Then
  Set Item.ChooseView = Item.Application.FindRowObject("PARTVIEW", txtChooseView.Tag)
Else
  Set Item.ChooseView = Nothing
End If
If txtOnRun.Tag <> "" Then
  Set Item.OnRun = Item.Application.FindRowObject("TYPEMENU", txtOnRun.Tag)
Else
  Set Item.OnRun = Nothing
End If
If txtOnCreate.Tag <> "" Then
  Set Item.OnCreate = Item.Application.FindRowObject("TYPEMENU", txtOnCreate.Tag)
Else
  Set Item.OnCreate = Nothing
End If
If txtOnDelete.Tag <> "" Then
  Set Item.OnDelete = Item.Application.FindRowObject("TYPEMENU", txtOnDelete.Tag)
Else
  Set Item.OnDelete = Nothing
End If
 If cmbAllowRefToObject.ListIndex >= 0 Then
   Item.AllowRefToObject = cmbAllowRefToObject.ItemData(cmbAllowRefToObject.ListIndex)
 End If
 If cmbAllowSearch.ListIndex >= 0 Then
   Item.AllowSearch = cmbAllowSearch.ItemData(cmbAllowSearch.ListIndex)
 End If
 If cmbReplicaType.ListIndex >= 0 Then
   Item.ReplicaType = cmbReplicaType.ItemData(cmbReplicaType.ListIndex)
 End If
Item.TheComment = txtTheComment
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



