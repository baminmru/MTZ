VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl GENERATOR_TARGET 
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
      Begin VB.ComboBox cmbTheDevelopmentEnv 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   12
         ToolTipText     =   "����� ����������"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.ComboBox cmbGeneratorStyle 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   10
         ToolTipText     =   "�������"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtGeneratorProgID 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   8
         ToolTipText     =   "COM �����"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtQueueName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   6
         ToolTipText     =   "�������"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.ComboBox cmbTargetType 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   4
         ToolTipText     =   "��� ���������"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "��������"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblTheDevelopmentEnv 
         BackStyle       =   0  'Transparent
         Caption         =   "����� ����������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblGeneratorStyle 
         BackStyle       =   0  'Transparent
         Caption         =   "�������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblGeneratorProgID 
         BackStyle       =   0  'Transparent
         Caption         =   "COM �����:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblQueueName 
         BackStyle       =   0  'Transparent
         Caption         =   "�������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTargetType 
         BackStyle       =   0  'Transparent
         Caption         =   "��� ���������:"
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
Attribute VB_Name = "GENERATOR_TARGET"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ �������������� ������� ����������
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

Private Sub txtName_Change()
  Changing

End Sub
Private Sub cmbTargetType_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtQueueName_Change()
  Changing

End Sub
Private Sub txtGeneratorProgID_Change()
  Changing

End Sub
Private Sub cmbGeneratorStyle_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbTheDevelopmentEnv_Click()
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
txtName = Item.Name
cmbTargetType.Clear
cmbTargetType.AddItem "����"
cmbTargetType.ItemData(cmbTargetType.NewIndex) = 0
cmbTargetType.AddItem "���"
cmbTargetType.ItemData(cmbTargetType.NewIndex) = 4
cmbTargetType.AddItem "������������"
cmbTargetType.ItemData(cmbTargetType.NewIndex) = 3
cmbTargetType.AddItem "������"
cmbTargetType.ItemData(cmbTargetType.NewIndex) = 1
cmbTargetType.AddItem "����������"
cmbTargetType.ItemData(cmbTargetType.NewIndex) = 2
 For iii = 0 To cmbTargetType.ListCount - 1
  If Item.TargetType = cmbTargetType.ItemData(iii) Then
   cmbTargetType.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtQueueName = Item.QueueName
  On Error Resume Next
txtGeneratorProgID = Item.GeneratorProgID
cmbGeneratorStyle.Clear
cmbGeneratorStyle.AddItem "���� ���"
cmbGeneratorStyle.ItemData(cmbGeneratorStyle.NewIndex) = 0
cmbGeneratorStyle.AddItem "��� ���� �����"
cmbGeneratorStyle.ItemData(cmbGeneratorStyle.NewIndex) = 1
 For iii = 0 To cmbGeneratorStyle.ListCount - 1
  If Item.GeneratorStyle = cmbGeneratorStyle.ItemData(iii) Then
   cmbGeneratorStyle.ListIndex = iii
   Exit For
  End If
 Next
cmbTheDevelopmentEnv.Clear
cmbTheDevelopmentEnv.AddItem "JAVA"
cmbTheDevelopmentEnv.ItemData(cmbTheDevelopmentEnv.NewIndex) = 2
cmbTheDevelopmentEnv.AddItem "OTHER"
cmbTheDevelopmentEnv.ItemData(cmbTheDevelopmentEnv.NewIndex) = 3
cmbTheDevelopmentEnv.AddItem "DOTNET"
cmbTheDevelopmentEnv.ItemData(cmbTheDevelopmentEnv.NewIndex) = 1
cmbTheDevelopmentEnv.AddItem "VB6"
cmbTheDevelopmentEnv.ItemData(cmbTheDevelopmentEnv.NewIndex) = 0
 For iii = 0 To cmbTheDevelopmentEnv.ListCount - 1
  If Item.TheDevelopmentEnv = cmbTheDevelopmentEnv.ItemData(iii) Then
   cmbTheDevelopmentEnv.ListIndex = iii
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

Item.Name = txtName
 If cmbTargetType.ListIndex >= 0 Then
   Item.TargetType = cmbTargetType.ItemData(cmbTargetType.ListIndex)
 End If
Item.QueueName = txtQueueName
Item.GeneratorProgID = txtGeneratorProgID
 If cmbGeneratorStyle.ListIndex >= 0 Then
   Item.GeneratorStyle = cmbGeneratorStyle.ItemData(cmbGeneratorStyle.ListIndex)
 End If
 If cmbTheDevelopmentEnv.ListIndex >= 0 Then
   Item.TheDevelopmentEnv = cmbTheDevelopmentEnv.ItemData(cmbTheDevelopmentEnv.ListIndex)
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



