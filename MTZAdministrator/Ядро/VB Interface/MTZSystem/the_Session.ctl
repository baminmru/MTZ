VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl the_Session 
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
      Begin VB.TextBox txtLang 
         Height          =   300
         Left            =   300
         MaxLength       =   25
         TabIndex        =   16
         ToolTipText     =   "�����������"
         Top             =   4635
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpStartAt 
         Height          =   300
         Left            =   300
         TabIndex        =   14
         ToolTipText     =   "������ ��������"
         Top             =   3930
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   16515075
         CurrentDate     =   39874
      End
      Begin MSComCtl2.DTPicker dtpLastAccess 
         Height          =   300
         Left            =   300
         TabIndex        =   12
         ToolTipText     =   "��������� �������������"
         Top             =   3225
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   16515075
         CurrentDate     =   39874
      End
      Begin MTZ_PANEL.DropButton cmdUsersid 
         Height          =   300
         Left            =   2850
         TabIndex        =   10
         Tag             =   "refopen.ico"
         ToolTipText     =   "������������"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtUsersid 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   9
         ToolTipText     =   "������������"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.ComboBox cmbClosed 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   7
         ToolTipText     =   "�������"
         Top             =   1815
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpClosedAt 
         Height          =   300
         Left            =   300
         TabIndex        =   5
         ToolTipText     =   "������ ��������"
         Top             =   1110
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   16515075
         CurrentDate     =   39874
      End
      Begin MTZ_PANEL.DropButton cmdUserRole 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "������� ���� ������������"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtUserRole 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "������� ���� ������������"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblLang 
         BackStyle       =   0  'Transparent
         Caption         =   "�����������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblStartAt 
         BackStyle       =   0  'Transparent
         Caption         =   "������ ��������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblLastAccess 
         BackStyle       =   0  'Transparent
         Caption         =   "��������� �������������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblUsersid 
         BackStyle       =   0  'Transparent
         Caption         =   "������������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblClosed 
         BackStyle       =   0  'Transparent
         Caption         =   "�������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblClosedAt 
         BackStyle       =   0  'Transparent
         Caption         =   "������ ��������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblUserRole 
         BackStyle       =   0  'Transparent
         Caption         =   "������� ���� ������������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "the_Session"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ �������������� ������� ������������������ ������ �������������
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

Private Sub txtUserRole_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdUserRole_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("Groups", ID, brief) Then
          txtUserRole.Tag = Left(ID, 38)
          txtUserRole = brief
        End If
End Sub
Private Sub cmdUserRole_MenuClick(ByVal sCaption As String)
          txtUserRole.Tag = ""
          txtUserRole = ""
End Sub
Private Sub dtpClosedAt_Change()
  Changing

End Sub
Private Sub cmbClosed_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtUsersid_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdUsersid_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("Users", ID, brief) Then
          txtUsersid.Tag = Left(ID, 38)
          txtUsersid = brief
        End If
End Sub
Private Sub cmdUsersid_MenuClick(ByVal sCaption As String)
          txtUsersid.Tag = ""
          txtUsersid = ""
End Sub
Private Sub dtpLastAccess_Change()
  Changing

End Sub
Private Sub dtpStartAt_Change()
  Changing

End Sub
Private Sub txtLang_Change()
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

If mIsOK Then mIsOK = (cmbClosed.ListIndex >= 0)
If mIsOK Then mIsOK = txtUsersid.Tag <> ""
If mIsOK Then mIsOK = IsSet(dtpStartAt.Value)
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

If Not Item.UserRole Is Nothing Then
  txtUserRole.Tag = Item.UserRole.ID
  txtUserRole = Item.UserRole.brief
Else
  txtUserRole.Tag = ""
  txtUserRole = ""
End If
 LoadBtnPictures cmdUserRole, cmdUserRole.Tag
  cmdUserRole.RemoveAllMenu
  cmdUserRole.AddMenu "��������"
dtpClosedAt = Now
If Item.ClosedAt <> 0 Then
 dtpClosedAt = Item.ClosedAt
Else
 dtpClosedAt.Value = Null
End If
cmbClosed.Clear
cmbClosed.AddItem "��"
cmbClosed.ItemData(cmbClosed.NewIndex) = 1
cmbClosed.AddItem "���"
cmbClosed.ItemData(cmbClosed.NewIndex) = 0
 For iii = 0 To cmbClosed.ListCount - 1
  If Item.Closed = cmbClosed.ItemData(iii) Then
   cmbClosed.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.Usersid Is Nothing Then
  txtUsersid.Tag = Item.Usersid.ID
  txtUsersid = Item.Usersid.brief
Else
  txtUsersid.Tag = ""
  txtUsersid = ""
End If
 LoadBtnPictures cmdUsersid, cmdUsersid.Tag
  cmdUsersid.RemoveAllMenu
  cmdUsersid.AddMenu "��������"
dtpLastAccess = Now
If Item.LastAccess <> 0 Then
 dtpLastAccess = Item.LastAccess
Else
 dtpLastAccess.Value = Null
End If
dtpStartAt = Now
If Item.StartAt <> 0 Then
 dtpStartAt = Item.StartAt
End If
  On Error Resume Next
txtLang = Item.Lang
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

If txtUserRole.Tag <> "" Then
  Set Item.UserRole = Item.Application.FindRowObject("Groups", txtUserRole.Tag)
Else
  Set Item.UserRole = Nothing
End If
  If IsNull(dtpClosedAt) Then
    Item.ClosedAt = 0
  Else
    Item.ClosedAt = dtpClosedAt.Value
  End If
 If cmbClosed.ListIndex >= 0 Then
   Item.Closed = cmbClosed.ItemData(cmbClosed.ListIndex)
 End If
If txtUsersid.Tag <> "" Then
  Set Item.Usersid = Item.Application.FindRowObject("Users", txtUsersid.Tag)
Else
  Set Item.Usersid = Nothing
End If
  If IsNull(dtpLastAccess) Then
    Item.LastAccess = 0
  Else
    Item.LastAccess = dtpLastAccess.Value
  End If
  If IsNull(dtpStartAt) Then
    Item.StartAt = 0
  Else
    Item.StartAt = dtpStartAt.Value
  End If
Item.Lang = txtLang
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



