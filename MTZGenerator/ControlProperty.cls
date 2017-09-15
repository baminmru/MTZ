VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ControlProperty"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 245
Option Explicit


 Private m_Parent As Object
 Private m_Application As Object

Private m_Name As String

Private m_PropValue As String
Public Event MakeBrief(ByRef BriefString As String)
Attribute MakeBrief.VB_HelpID = 255

'Parameters:
'[IN][OUT]  newParent , тип параметра: Object  - ...
'See Also:
'  Application
'  MakeBrief
'  Name
'  PropValue
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
'  MakeBrief
'  Name
'  PropValue
'  XMLLoad
'  XMLSave
'Example:
' dim variable as Object
' Set variable = me.Parent
Public Property Get Parent() As Object
Attribute Parent.VB_HelpID = 265
  Set Parent = m_Parent
End Property

'Parameters:
'[IN][OUT]  newApplication , тип параметра: Object  - ...
'See Also:
'  MakeBrief
'  Name
'  Parent
'  PropValue
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
'  MakeBrief
'  Name
'  Parent
'  PropValue
'  XMLLoad
'  XMLSave
'Example:
' dim variable as Object
' Set variable = me.Application
Public Property Get Application() As Object
Attribute Application.VB_HelpID = 250
  Set Application = m_Application
End Property

Private Sub CloseParents()
  Set m_Application = Nothing
  Set m_Parent = Nothing
End Sub

' let
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'See Also:
'  Application
'  MakeBrief
'  Parent
'  PropValue
'  XMLLoad
'  XMLSave
'Example:
' dim value as Variant
' value = <значение>
' me.Name = value
Public Property Let Name(ByVal newValue As String)
Attribute Name.VB_HelpID = 260

   m_Name = newValue
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  Application
'  MakeBrief
'  Parent
'  PropValue
'  XMLLoad
'  XMLSave
'Example:
' dim variable as String
' variable = me.Name
Public Property Get Name() As String
 
   Name = m_Name
End Property

' let
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'See Also:
'  Application
'  MakeBrief
'  Name
'  Parent
'  XMLLoad
'  XMLSave
'Example:
' dim value as Variant
' value = <значение>
' me.PropValue = value
Public Property Let PropValue(ByVal newValue As String)
Attribute PropValue.VB_HelpID = 270
 
   m_PropValue = newValue
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  Application
'  MakeBrief
'  Name
'  Parent
'  XMLLoad
'  XMLSave
'Example:
' dim variable as String
' variable = me.PropValue
Public Property Get PropValue() As String
 
   PropValue = m_PropValue
End Property


Friend Sub CloseClass()
 CloseParents
End Sub

'Parameters:
'[IN][OUT]  node , тип параметра: IXMLDOMElement,
'[IN][OUT]   xdom , тип параметра: DOMDocument  - ...
'See Also:
'  Application
'  MakeBrief
'  Name
'  Parent
'  PropValue
'  XMLLoad
'Example:
'  call me.XMLSave(<параметры>)
Public Sub XMLSave(node As IXMLDOMElement, xdom As DOMDocument): On Error Resume Next
Attribute XMLSave.VB_HelpID = 280
  Dim e_ As IXMLDOMElement


  node.setAttribute "Name", Name
  node.setAttribute "PropValue", PropValue
End Sub

'Parameters:
'[IN][OUT]  node , тип параметра: IXMLDOMNode  - ...
'See Also:
'  Application
'  MakeBrief
'  Name
'  Parent
'  PropValue
'  XMLSave
'Example:
'  call me.XMLLoad(<параметры>)
Public Sub XMLLoad(node As IXMLDOMNode): On Error Resume Next
Attribute XMLLoad.VB_HelpID = 275
  Dim e_list As IXMLDOMNodeList
  Dim e_ As IXMLDOMNode

  Name = Replace(node.Attributes.getNamedItem("Name").nodeValue, vbLf, vbCrLf)
  PropValue = Replace(node.Attributes.getNamedItem("PropValue").nodeValue, vbLf, vbCrLf)

End Sub
