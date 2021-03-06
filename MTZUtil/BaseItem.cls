VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "BaseItem"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 10
Option Explicit
'������� ��������� (���� �� ������������)

Dim mID As String
Dim m_Parent As Object
Dim m_Application As Object

'�������������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� String
'See Also:
'  Application
'  CloseParents
'  Parent
'Example:
' dim variable as String
' variable = me.ID
Public Property Get ID() As String
Attribute ID.VB_HelpID = 25
  ID = mID
End Property

'�������������
'Parameters:
'[IN][OUT]  s , ��� ���������: String  - �������������
'See Also:
'  Application
'  CloseParents
'  Parent
'Example:
' dim value as Variant
' value = <��������>
' me.ID = value
Public Property Let ID(s As String)
   mID = s
End Property

'��������
'Parameters:
'[IN][OUT]  newParent , ��� ���������: Object  - ��������
'See Also:
'  Application
'  CloseParents
'  ID
'Example:
' dim value as Variant
' set value = <������>
' set me.Parent = value
Public Property Set Parent(newParent As Object)
  Set m_Parent = newParent
End Property

'��������
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'See Also:
'  Application
'  CloseParents
'  ID
'Example:
' dim variable as Object
' Set variable = me.Parent
Public Property Get Parent() As Object
Attribute Parent.VB_HelpID = 30
  Set Parent = m_Parent
End Property

'����������
'Parameters:
'[IN][OUT]  newApplication , ��� ���������: Object  - ����������
'See Also:
'  CloseParents
'  ID
'  Parent
'Example:
' dim value as Variant
' set value = <������>
' set me.Application = value
Public Property Set Application(newApplication As Object)
  Set m_Application = newApplication
End Property

'����������
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'See Also:
'  CloseParents
'  ID
'  Parent
'Example:
' dim variable as Object
' Set variable = me.Application
Public Property Get Application() As Object
Attribute Application.VB_HelpID = 15
 If m_Parent Is Nothing Then
    Set Application = Me
  Else
    Set Application = m_Application
  End If
End Property

' ������� ��������
'Parameters:
' ���������� ���
'See Also:
'  Application
'  ID
'  Parent
'Example:
'  call me.CloseParents()
Public Sub CloseParents()
Attribute CloseParents.VB_HelpID = 20
  Set m_Application = Nothing
  Set m_Parent = Nothing
End Sub
