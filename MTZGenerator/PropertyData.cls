VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "PropertyData"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 600
Option Explicit


Private m_Parent As Object
Private m_Application As Object
Private m_Name As String
Private m_PropValue As Variant

'Parameters:
'[IN][OUT]  newParent , ��� ���������: Object  - ...
'See Also:
'  Application
'  Name
'  PropValue
'  XMLLoad
'  XMLSave
'Example:
' dim value as Variant
' set value = <������>
' set me.Parent = value
Friend Property Set Parent(newParent As Object)
  Set m_Parent = newParent
End Property

'Parameters:
' ���������� ���
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'See Also:
'  Application
'  Name
'  PropValue
'  XMLLoad
'  XMLSave
'Example:
' dim variable as Object
' Set variable = me.Parent
Public Property Get Parent() As Object
Attribute Parent.VB_HelpID = 615
  Set Parent = m_Parent
End Property

'Parameters:
'[IN][OUT]  newApplication , ��� ���������: Object  - ...
'See Also:
'  Name
'  Parent
'  PropValue
'  XMLLoad
'  XMLSave
'Example:
' dim value as Variant
' set value = <������>
' set me.Application = value
Friend Property Set Application(newApplication As Object)
  Set m_Application = newApplication
End Property

'Parameters:
' ���������� ���
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'See Also:
'  Name
'  Parent
'  PropValue
'  XMLLoad
'  XMLSave
'Example:
' dim variable as Object
' Set variable = me.Application
Public Property Get Application() As Object
Attribute Application.VB_HelpID = 605
  Set Application = m_Application
End Property

Private Sub CloseParents()
  Set m_Application = Nothing
  Set m_Parent = Nothing
End Sub

' let
'Parameters:
'[IN]   newValue , ��� ���������: String  - ...
'See Also:
'  Application
'  Parent
'  PropValue
'  XMLLoad
'  XMLSave
'Example:
' dim value as Variant
' value = <��������>
' me.Name = value
Public Property Let Name(ByVal newValue As String)
Attribute Name.VB_HelpID = 610
 'LoadFromCash
 ''AccessDate = Now: KeepInMemory = True

   m_Name = newValue
End Property

'Parameters:
' ���������� ���
'Returns:
'  �������� ���� String
'See Also:
'  Application
'  Parent
'  PropValue
'  XMLLoad
'  XMLSave
'Example:
' dim variable as String
' variable = me.Name
Public Property Get Name() As String
 'LoadFromCash
 'AccessDate = Now

   Name = m_Name
End Property

' let
'Parameters:
'[IN]   newValue , ��� ���������: Variant  - ...
'See Also:
'  Application
'  Name
'  Parent
'  XMLLoad
'  XMLSave
'Example:
' dim value as Variant
' value = <��������>
' me.PropValue = value
Public Property Let PropValue(ByVal newValue As Variant)
Attribute PropValue.VB_HelpID = 620
 'LoadFromCash
 ''AccessDate = Now: KeepInMemory = True

   m_PropValue = newValue
End Property

'Parameters:
' ���������� ���
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'  Application
'  Name
'  Parent
'  XMLLoad
'  XMLSave
'Example:
' dim variable as Variant
' variable = me.PropValue
' Set variable = me.PropValue
Public Property Get PropValue() As Variant
 'LoadFromCash
 'AccessDate = Now

   PropValue = m_PropValue
End Property



Friend Sub CloseClass()

 CloseParents
End Sub

'Parameters:
'[IN][OUT]  node , ��� ���������: IXMLDOMElement,
'[IN][OUT]   xdom , ��� ���������: DOMDocument  - ...
'See Also:
'  Application
'  Name
'  Parent
'  PropValue
'  XMLLoad
'Example:
'  call me.XMLSave(<���������>)
Public Sub XMLSave(node As IXMLDOMElement, xdom As DOMDocument): On Error Resume Next
Attribute XMLSave.VB_HelpID = 630
  Dim e_ As IXMLDOMElement
  'LoadFromCash

  node.setAttribute "Name", Name
  node.setAttribute "PropValue", PropValue
End Sub

'Parameters:
'[IN][OUT]  node , ��� ���������: IXMLDOMNode  - ...
'See Also:
'  Application
'  Name
'  Parent
'  PropValue
'  XMLSave
'Example:
'  call me.XMLLoad(<���������>)
Public Sub XMLLoad(node As IXMLDOMNode): On Error Resume Next
Attribute XMLLoad.VB_HelpID = 625
  Dim e_list As IXMLDOMNodeList
  Dim e_ As IXMLDOMNode
  Name = Replace(node.Attributes.getNamedItem("Name").nodeValue, vbLf, vbCrLf)
  PropValue = node.Attributes.getNamedItem("PropValue").nodeValue

End Sub
