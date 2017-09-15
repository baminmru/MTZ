VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "FormData"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 325
Option Explicit

Private m_Parent As Object
Private m_Application As Object

Private m_ControlData As ControlData_col

Private m_PropertyData As PropertyData_col

Private m_Name As String
Public Event MakeBrief(ByRef BriefString As String)
Attribute MakeBrief.VB_HelpID = 345

'Parameters:
'[IN][OUT]  newParent , тип параметра: Object  - ...
'See Also:
'  Application
'  CloseClass
'  ControlData
'  MakeBrief
'  Name
'  PropertyData
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
'  CloseClass
'  ControlData
'  MakeBrief
'  Name
'  PropertyData
'  XMLLoad
'  XMLSave
'Example:
' dim variable as Object
' Set variable = me.Parent
Public Property Get Parent() As Object
Attribute Parent.VB_HelpID = 355
  Set Parent = m_Parent
End Property

'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  CloseClass
'  ControlData
'  MakeBrief
'  Name
'  Parent
'  PropertyData
'  XMLLoad
'  XMLSave
'Example:
' dim variable as Object
' Set variable = me.Application
Public Property Get Application() As Object
Attribute Application.VB_HelpID = 330
  Set Application = Me
End Property

Private Sub CloseParents()
  Set m_Application = Nothing
  Set m_Parent = Nothing
End Sub

'Parameters:
' параметров нет
'Returns:
'  объект класса ControlData_col
'  ,или Nothing
'See Also:
'  Application
'  CloseClass
'  MakeBrief
'  Name
'  Parent
'  PropertyData
'  XMLLoad
'  XMLSave
'Example:
' dim variable as ControlData_col
' Set variable = me.ControlData
Public Property Get ControlData() As ControlData_col
Attribute ControlData.VB_HelpID = 340
 If m_ControlData Is Nothing Then
   Set m_ControlData = New ControlData_col
   Set m_ControlData.Parent = Me
   Set m_ControlData.Application = Me.Application
 End If
 Set ControlData = m_ControlData
End Property

'Parameters:
' параметров нет
'Returns:
'  объект класса PropertyData_col
'  ,или Nothing
'See Also:
'  Application
'  CloseClass
'  ControlData
'  MakeBrief
'  Name
'  Parent
'  XMLLoad
'  XMLSave
'Example:
' dim variable as PropertyData_col
' Set variable = me.PropertyData
Public Property Get PropertyData() As PropertyData_col
Attribute PropertyData.VB_HelpID = 360
 If m_PropertyData Is Nothing Then
   Set m_PropertyData = New PropertyData_col
   Set m_PropertyData.Parent = Me
   Set m_PropertyData.Application = Me.Application
 End If
 Set PropertyData = m_PropertyData
End Property

' let
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'See Also:
'  Application
'  CloseClass
'  ControlData
'  MakeBrief
'  Parent
'  PropertyData
'  XMLLoad
'  XMLSave
'Example:
' dim value as Variant
' value = <значение>
' me.Name = value
Public Property Let Name(ByVal newValue As String)
Attribute Name.VB_HelpID = 350
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
'  CloseClass
'  ControlData
'  MakeBrief
'  Parent
'  PropertyData
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

'Parameters:
' параметров нет
'See Also:
'  Application
'  ControlData
'  MakeBrief
'  Name
'  Parent
'  PropertyData
'  XMLLoad
'  XMLSave
'Example:
'  call me.CloseClass()
Public Sub CloseClass()
Attribute CloseClass.VB_HelpID = 335

If Not m_ControlData Is Nothing Then
  m_ControlData.CloseClass
  Set m_ControlData = Nothing
End If
If Not m_PropertyData Is Nothing Then
  m_PropertyData.CloseClass
  Set m_PropertyData = Nothing
End If
 CloseParents
End Sub

'Parameters:
'[IN][OUT]  node , тип параметра: IXMLDOMElement,
'[IN][OUT]   xdom , тип параметра: DOMDocument  - ...
'See Also:
'  Application
'  CloseClass
'  ControlData
'  MakeBrief
'  Name
'  Parent
'  PropertyData
'  XMLLoad
'Example:
'  call me.XMLSave(<параметры>)
Public Sub XMLSave(node As IXMLDOMElement, xdom As DOMDocument): On Error Resume Next
Attribute XMLSave.VB_HelpID = 370
  Dim e_ As IXMLDOMElement
  node.setAttribute "Name", Name
  ControlData.XMLSave node, xdom
  PropertyData.XMLSave node, xdom
End Sub

'Parameters:
'[IN][OUT]  node , тип параметра: IXMLDOMNode  - ...
'See Also:
'  Application
'  CloseClass
'  ControlData
'  MakeBrief
'  Name
'  Parent
'  PropertyData
'  XMLSave
'Example:
'  call me.XMLLoad(<параметры>)
Public Sub XMLLoad(node As IXMLDOMNode): On Error Resume Next
Attribute XMLLoad.VB_HelpID = 365
  Dim e_list As IXMLDOMNodeList
  Dim e_ As IXMLDOMNode
  Name = Replace(node.Attributes.getNamedItem("Name").nodeValue, vbLf, vbCrLf)
  Set e_list = node.selectNodes("ControlData")
  'If e_list.length > 0 Then Stop
  ControlData.XMLLoad e_list
  Set e_list = node.selectNodes("PropertyData")
  'If e_list.length > 0 Then Stop
  PropertyData.XMLLoad e_list
End Sub


