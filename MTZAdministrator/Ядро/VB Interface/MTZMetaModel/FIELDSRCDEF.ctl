VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl FIELDSRCDEF 
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
      Begin VB.ComboBox cmbDontShowDialog 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   18
         ToolTipText     =   "�� ���������� ����� ������"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtDescriptionString 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   16
         ToolTipText     =   "����������"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtSortField 
         Height          =   300
         Left            =   300
         MaxLength       =   512
         TabIndex        =   14
         ToolTipText     =   "���������� ��������� ������"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtFilterString 
         Height          =   300
         Left            =   300
         MaxLength       =   512
         TabIndex        =   12
         ToolTipText     =   "������ ��������� ������"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtBriefString 
         Height          =   300
         Left            =   300
         MaxLength       =   512
         TabIndex        =   10
         ToolTipText     =   "�������� ������� ����������"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtIDField 
         Height          =   300
         Left            =   300
         MaxLength       =   128
         TabIndex        =   8
         ToolTipText     =   "ID"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtDataSource 
         Height          =   300
         Left            =   300
         MaxLength       =   512
         TabIndex        =   6
         ToolTipText     =   "�������� ������"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtConnectionString 
         Height          =   300
         Left            =   300
         MaxLength       =   512
         TabIndex        =   4
         ToolTipText     =   "������ ���������� � ����������"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtProvider 
         Height          =   300
         Left            =   300
         MaxLength       =   128
         TabIndex        =   2
         ToolTipText     =   "���������"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblDontShowDialog 
         BackStyle       =   0  'Transparent
         Caption         =   "�� ���������� ����� ������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   17
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblDescriptionString 
         BackStyle       =   0  'Transparent
         Caption         =   "����������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblSortField 
         BackStyle       =   0  'Transparent
         Caption         =   "���������� ��������� ������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblFilterString 
         BackStyle       =   0  'Transparent
         Caption         =   "������ ��������� ������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblBriefString 
         BackStyle       =   0  'Transparent
         Caption         =   "�������� ������� ����������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblIDField 
         BackStyle       =   0  'Transparent
         Caption         =   "ID:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblDataSource 
         BackStyle       =   0  'Transparent
         Caption         =   "�������� ������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblConnectionString 
         BackStyle       =   0  'Transparent
         Caption         =   "������ ���������� � ����������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblProvider 
         BackStyle       =   0  'Transparent
         Caption         =   "���������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "FIELDSRCDEF"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ �������������� ������� �������� ��������� ������ ��� ����� ���� ReferenceSQL
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
Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef Brief As String, ByRef Cancel As Boolean) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, Brief, Cancel)
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

Private Sub txtProvider_Change()
  Changing

End Sub
Private Sub txtConnectionString_Change()
  Changing

End Sub
Private Sub txtDataSource_Change()
  Changing

End Sub
Private Sub txtIDField_Change()
  Changing

End Sub
Private Sub txtBriefString_Change()
  Changing

End Sub
Private Sub txtFilterString_Change()
  Changing

End Sub
Private Sub txtSortField_Change()
  Changing

End Sub
Private Sub txtDescriptionString_Change()
  Changing

End Sub
Private Sub cmbDontShowDialog_Click()
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

  On Error Resume Next
txtProvider = Item.Provider
  On Error Resume Next
txtConnectionString = Item.ConnectionString
  On Error Resume Next
txtDataSource = Item.DataSource
  On Error Resume Next
txtIDField = Item.IDField
  On Error Resume Next
txtBriefString = Item.BriefString
  On Error Resume Next
txtFilterString = Item.FilterString
  On Error Resume Next
txtSortField = Item.SortField
txtDescriptionString = Item.DescriptionString
cmbDontShowDialog.Clear
cmbDontShowDialog.AddItem "��"
cmbDontShowDialog.ItemData(cmbDontShowDialog.NewIndex) = 1
cmbDontShowDialog.AddItem "���"
cmbDontShowDialog.ItemData(cmbDontShowDialog.NewIndex) = 0
 For iii = 0 To cmbDontShowDialog.ListCount - 1
  If Item.DontShowDialog = cmbDontShowDialog.ItemData(iii) Then
   cmbDontShowDialog.ListIndex = iii
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

Item.Provider = txtProvider
Item.ConnectionString = txtConnectionString
Item.DataSource = txtDataSource
Item.IDField = txtIDField
Item.BriefString = txtBriefString
Item.FilterString = txtFilterString
Item.SortField = txtSortField
Item.DescriptionString = txtDescriptionString
 If cmbDontShowDialog.ListIndex >= 0 Then
   Item.DontShowDialog = cmbDontShowDialog.ItemData(cmbDontShowDialog.ListIndex)
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



