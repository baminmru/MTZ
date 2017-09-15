VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ControlData"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 150
Option Explicit


 Private m_Parent As Object
 Private m_Application As Object

Private m_ControlData As ControlData_col

Private m_Properties As Properties_col

Private m_Name As String

Private m_ControlIndex As Long

Private m_PROGID As String

'Parameters:
' параметров нет
'Returns:
'  объект класса ControlData_col
'  ,или Nothing
'See Also:
'  Application
'  ControlIndex
'  Name
'  Parent
'  PROGID
'  Properties
'  XMLLoad
'  XMLSave
'Example:
' dim variable as ControlData_col
' Set variable = me.ControlData
Public Property Get ControlData() As ControlData_col
Attribute ControlData.VB_HelpID = 160
 If m_ControlData Is Nothing Then
   Set m_ControlData = New ControlData_col
   Set m_ControlData.Parent = Me
   Set m_ControlData.Application = Me.Application
  End If
 Set ControlData = m_ControlData
End Property

'Parameters:
'[IN][OUT]  newParent , тип параметра: Object  - ...
'See Also:
'  Application
'  ControlData
'  ControlIndex
'  Name
'  PROGID
'  Properties
'  XMLLoad
'  XMLSave
'Example:
' dim value as Variant
' set value = <объект>
' set me.Parent = value
Friend Property Set Parent(newParent As Object)
  Set m_Parent = newParent
End Property

'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  Application
'  ControlData
'  ControlIndex
'  Name
'  PROGID
'  Properties
'  XMLLoad
'  XMLSave
'Example:
' dim variable as Object
' Set variable = me.Parent
Public Property Get Parent() As Object
Attribute Parent.VB_HelpID = 175
  Set Parent = m_Parent
End Property

'Parameters:
'[IN][OUT]  newApplication , тип параметра: Object  - ...
'See Also:
'  ControlData
'  ControlIndex
'  Name
'  Parent
'  PROGID
'  Properties
'  XMLLoad
'  XMLSave
'Example:
' dim value as Variant
' set value = <объект>
' set me.Application = value
Friend Property Set Application(newApplication As Object)
  Set m_Application = newApplication
End Property

'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  ControlData
'  ControlIndex
'  Name
'  Parent
'  PROGID
'  Properties
'  XMLLoad
'  XMLSave
'Example:
' dim variable as Object
' Set variable = me.Application
Public Property Get Application() As Object
Attribute Application.VB_HelpID = 155
  Set Application = m_Application
End Property

Private Sub CloseParents()
  Set m_Application = Nothing
  Set m_Parent = Nothing
End Sub

'Parameters:
' параметров нет
'Returns:
'  объект класса Properties_col
'  ,или Nothing
'See Also:
'  Application
'  ControlData
'  ControlIndex
'  Name
'  Parent
'  PROGID
'  XMLLoad
'  XMLSave
'Example:
' dim variable as Properties_col
' Set variable = me.Properties
Public Property Get Properties() As Properties_col
Attribute Properties.VB_HelpID = 185
 If m_Properties Is Nothing Then
   Set m_Properties = New Properties_col
   Set m_Properties.Parent = Me
   Set m_Properties.Application = Me.Application
   
 End If
 Set Properties = m_Properties
End Property

' let
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'See Also:
'  Application
'  ControlData
'  ControlIndex
'  Parent
'  PROGID
'  Properties
'  XMLLoad
'  XMLSave
'Example:
' dim value as Variant
' value = <значение>
' me.Name = value
Public Property Let Name(ByVal newValue As String)
Attribute Name.VB_HelpID = 170
 'LoadFromCash
 ''AccessDate = Now: KeepInMemory = True

   m_Name = newValue
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  Application
'  ControlData
'  ControlIndex
'  Parent
'  PROGID
'  Properties
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
'[IN]   newValue , тип параметра: Long  - ...
'See Also:
'  Application
'  ControlData
'  Name
'  Parent
'  PROGID
'  Properties
'  XMLLoad
'  XMLSave
'Example:
' dim value as Variant
' value = <значение>
' me.ControlIndex = value
Public Property Let ControlIndex(ByVal newValue As Long)
Attribute ControlIndex.VB_HelpID = 165
 'LoadFromCash
 ''AccessDate = Now: KeepInMemory = True

   m_ControlIndex = newValue
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа Long
'See Also:
'  Application
'  ControlData
'  Name
'  Parent
'  PROGID
'  Properties
'  XMLLoad
'  XMLSave
'Example:
' dim variable as Long
' variable = me.ControlIndex
Public Property Get ControlIndex() As Long
 'LoadFromCash
 'AccessDate = Now

   ControlIndex = m_ControlIndex
End Property

' let
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'See Also:
'  Application
'  ControlData
'  ControlIndex
'  Name
'  Parent
'  Properties
'  XMLLoad
'  XMLSave
'Example:
' dim value as Variant
' value = <значение>
' me.PROGID = value
Public Property Let PROGID(ByVal newValue As String)
Attribute PROGID.VB_HelpID = 180
 'LoadFromCash
 ''AccessDate = Now: KeepInMemory = True

   m_PROGID = newValue
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  Application
'  ControlData
'  ControlIndex
'  Name
'  Parent
'  Properties
'  XMLLoad
'  XMLSave
'Example:
' dim variable as String
' variable = me.PROGID
Public Property Get PROGID() As String
 'LoadFromCash
 'AccessDate = Now

   PROGID = m_PROGID
End Property





Friend Sub CloseClass()

If Not m_ControlData Is Nothing Then
  m_ControlData.CloseClass
  Set m_ControlData = Nothing
End If
If Not m_Properties Is Nothing Then
  m_Properties.CloseClass
  Set m_Properties = Nothing
End If
 CloseParents
End Sub

'Parameters:
'[IN][OUT]  node , тип параметра: IXMLDOMElement,
'[IN][OUT]   xdom , тип параметра: DOMDocument  - ...
'See Also:
'  Application
'  ControlData
'  ControlIndex
'  Name
'  Parent
'  PROGID
'  Properties
'  XMLLoad
'Example:
'  call me.XMLSave(<параметры>)
Public Sub XMLSave(node As IXMLDOMElement, xdom As DOMDocument): On Error Resume Next
Attribute XMLSave.VB_HelpID = 195
  Dim e_ As IXMLDOMElement
  'LoadFromCash
  
  node.setAttribute "Name", Name
  node.setAttribute "ControlIndex", ControlIndex
  node.setAttribute "PROGID", PROGID
  Properties.XMLSave node, xdom
  ControlData.XMLSave node, xdom
End Sub

'Parameters:
'[IN][OUT]  node , тип параметра: IXMLDOMNode  - ...
'See Also:
'  Application
'  ControlData
'  ControlIndex
'  Name
'  Parent
'  PROGID
'  Properties
'  XMLSave
'Example:
'  call me.XMLLoad(<параметры>)
Public Sub XMLLoad(node As IXMLDOMNode): On Error Resume Next
Attribute XMLLoad.VB_HelpID = 190
  Dim e_list As IXMLDOMNodeList
  Dim e_ As IXMLDOMNode
  
  Name = Replace(node.Attributes.getNamedItem("Name").nodeValue, vbLf, vbCrLf)
  ControlIndex = node.Attributes.getNamedItem("ControlIndex").nodeValue
  PROGID = Replace(node.Attributes.getNamedItem("PROGID").nodeValue, vbLf, vbCrLf)

Set e_list = node.selectNodes("Properties")
  Properties.XMLLoad e_list
Set e_list = node.selectNodes("ControlData")
  ControlData.XMLLoad e_list
End Sub
