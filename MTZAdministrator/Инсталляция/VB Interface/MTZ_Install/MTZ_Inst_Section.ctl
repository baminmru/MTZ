VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl MTZ_Inst_Section 
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
      Begin MTZ_PANEL.DropButton cmdCustomSectionUnInstall 
         Height          =   300
         Left            =   2850
         TabIndex        =   18
         Tag             =   "refopen.ico"
         ToolTipText     =   "Custom Section UnInstall"
         Top             =   5340
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCustomSectionUnInstall 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   17
         ToolTipText     =   "Custom Section UnInstall"
         Top             =   5340
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdCustomSectionInstall 
         Height          =   300
         Left            =   2850
         TabIndex        =   15
         Tag             =   "refopen.ico"
         ToolTipText     =   "Custom Section Install"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCustomSectionInstall 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   14
         ToolTipText     =   "Custom Section Install"
         Top             =   4635
         Width           =   2550
      End
      Begin VB.ComboBox cmbIsCustomSection 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   12
         ToolTipText     =   "Custom Section"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.ComboBox cmbTheTargetPlatform 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   10
         ToolTipText     =   "������� ���������"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsNotDeletable 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   8
         ToolTipText     =   "������������"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtTheDescription 
         Height          =   300
         Left            =   300
         MaxLength       =   2048
         TabIndex        =   6
         ToolTipText     =   "����������� (ToolTip)"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsVisible 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   4
         ToolTipText     =   "�������"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtTheName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "�������� (Eng)"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblCustomSectionUnInstall 
         BackStyle       =   0  'Transparent
         Caption         =   "Custom Section UnInstall:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblCustomSectionInstall 
         BackStyle       =   0  'Transparent
         Caption         =   "Custom Section Install:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblIsCustomSection 
         BackStyle       =   0  'Transparent
         Caption         =   "Custom Section:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblTheTargetPlatform 
         BackStyle       =   0  'Transparent
         Caption         =   "������� ���������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblIsNotDeletable 
         BackStyle       =   0  'Transparent
         Caption         =   "������������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblTheDescription 
         BackStyle       =   0  'Transparent
         Caption         =   "����������� (ToolTip):"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblIsVisible 
         BackStyle       =   0  'Transparent
         Caption         =   "�������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheName 
         BackStyle       =   0  'Transparent
         Caption         =   "�������� (Eng):"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "MTZ_Inst_Section"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ �������������� �������
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

Private Sub txtTheName_Change()
  Changing

End Sub
Private Sub cmbIsVisible_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtTheDescription_Change()
  Changing

End Sub
Private Sub cmbIsNotDeletable_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbTheTargetPlatform_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbIsCustomSection_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtCustomSectionInstall_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdCustomSectionInstall_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("MTZ_Inst_Common", ID, brief) Then
          txtCustomSectionInstall.Tag = Left(ID, 38)
          txtCustomSectionInstall = brief
        End If
End Sub
Private Sub cmdCustomSectionInstall_MenuClick(ByVal sCaption As String)
          txtCustomSectionInstall.Tag = ""
          txtCustomSectionInstall = ""
End Sub
Private Sub txtCustomSectionUnInstall_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdCustomSectionUnInstall_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("MTZ_Inst_Common", ID, brief) Then
          txtCustomSectionUnInstall.Tag = Left(ID, 38)
          txtCustomSectionUnInstall = brief
        End If
End Sub
Private Sub cmdCustomSectionUnInstall_MenuClick(ByVal sCaption As String)
          txtCustomSectionUnInstall.Tag = ""
          txtCustomSectionUnInstall = ""
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

If mIsOK Then mIsOK = IsSet(txtTheName.Text)
If mIsOK Then mIsOK = (cmbIsVisible.ListIndex >= 0)
If mIsOK Then mIsOK = IsSet(txtTheDescription.Text)
If mIsOK Then mIsOK = (cmbIsNotDeletable.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbTheTargetPlatform.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbIsCustomSection.ListIndex >= 0)
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
txtTheName = Item.TheName
cmbIsVisible.Clear
cmbIsVisible.AddItem "��"
cmbIsVisible.ItemData(cmbIsVisible.NewIndex) = 1
cmbIsVisible.AddItem "���"
cmbIsVisible.ItemData(cmbIsVisible.NewIndex) = 0
 For iii = 0 To cmbIsVisible.ListCount - 1
  If Item.IsVisible = cmbIsVisible.ItemData(iii) Then
   cmbIsVisible.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtTheDescription = Item.TheDescription
cmbIsNotDeletable.Clear
cmbIsNotDeletable.AddItem "��"
cmbIsNotDeletable.ItemData(cmbIsNotDeletable.NewIndex) = 1
cmbIsNotDeletable.AddItem "���"
cmbIsNotDeletable.ItemData(cmbIsNotDeletable.NewIndex) = 0
 For iii = 0 To cmbIsNotDeletable.ListCount - 1
  If Item.IsNotDeletable = cmbIsNotDeletable.ItemData(iii) Then
   cmbIsNotDeletable.ListIndex = iii
   Exit For
  End If
 Next
cmbTheTargetPlatform.Clear
cmbTheTargetPlatform.AddItem "JAVA"
cmbTheTargetPlatform.ItemData(cmbTheTargetPlatform.NewIndex) = 2
cmbTheTargetPlatform.AddItem "OTHER"
cmbTheTargetPlatform.ItemData(cmbTheTargetPlatform.NewIndex) = 3
cmbTheTargetPlatform.AddItem "DOTNET"
cmbTheTargetPlatform.ItemData(cmbTheTargetPlatform.NewIndex) = 1
cmbTheTargetPlatform.AddItem "VB6"
cmbTheTargetPlatform.ItemData(cmbTheTargetPlatform.NewIndex) = 0
 For iii = 0 To cmbTheTargetPlatform.ListCount - 1
  If Item.TheTargetPlatform = cmbTheTargetPlatform.ItemData(iii) Then
   cmbTheTargetPlatform.ListIndex = iii
   Exit For
  End If
 Next
cmbIsCustomSection.Clear
cmbIsCustomSection.AddItem "��"
cmbIsCustomSection.ItemData(cmbIsCustomSection.NewIndex) = 1
cmbIsCustomSection.AddItem "���"
cmbIsCustomSection.ItemData(cmbIsCustomSection.NewIndex) = 0
 For iii = 0 To cmbIsCustomSection.ListCount - 1
  If Item.IsCustomSection = cmbIsCustomSection.ItemData(iii) Then
   cmbIsCustomSection.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.CustomSectionInstall Is Nothing Then
  txtCustomSectionInstall.Tag = Item.CustomSectionInstall.ID
  txtCustomSectionInstall = Item.CustomSectionInstall.brief
Else
  txtCustomSectionInstall.Tag = ""
  txtCustomSectionInstall = ""
End If
 LoadBtnPictures cmdCustomSectionInstall, cmdCustomSectionInstall.Tag
  cmdCustomSectionInstall.RemoveAllMenu
  cmdCustomSectionInstall.AddMenu "��������"
If Not Item.CustomSectionUnInstall Is Nothing Then
  txtCustomSectionUnInstall.Tag = Item.CustomSectionUnInstall.ID
  txtCustomSectionUnInstall = Item.CustomSectionUnInstall.brief
Else
  txtCustomSectionUnInstall.Tag = ""
  txtCustomSectionUnInstall = ""
End If
 LoadBtnPictures cmdCustomSectionUnInstall, cmdCustomSectionUnInstall.Tag
  cmdCustomSectionUnInstall.RemoveAllMenu
  cmdCustomSectionUnInstall.AddMenu "��������"
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

Item.TheName = txtTheName
 If cmbIsVisible.ListIndex >= 0 Then
   Item.IsVisible = cmbIsVisible.ItemData(cmbIsVisible.ListIndex)
 End If
Item.TheDescription = txtTheDescription
 If cmbIsNotDeletable.ListIndex >= 0 Then
   Item.IsNotDeletable = cmbIsNotDeletable.ItemData(cmbIsNotDeletable.ListIndex)
 End If
 If cmbTheTargetPlatform.ListIndex >= 0 Then
   Item.TheTargetPlatform = cmbTheTargetPlatform.ItemData(cmbTheTargetPlatform.ListIndex)
 End If
 If cmbIsCustomSection.ListIndex >= 0 Then
   Item.IsCustomSection = cmbIsCustomSection.ItemData(cmbIsCustomSection.ListIndex)
 End If
If txtCustomSectionInstall.Tag <> "" Then
  Set Item.CustomSectionInstall = Item.Application.FindRowObject("MTZ_Inst_Common", txtCustomSectionInstall.Tag)
Else
  Set Item.CustomSectionInstall = Nothing
End If
If txtCustomSectionUnInstall.Tag <> "" Then
  Set Item.CustomSectionUnInstall = Item.Application.FindRowObject("MTZ_Inst_Common", txtCustomSectionUnInstall.Tag)
Else
  Set Item.CustomSectionUnInstall = Nothing
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



