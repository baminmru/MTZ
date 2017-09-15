VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ControlData_col"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 200
Option Explicit


Dim mcol As Collection
Dim m_Parent As Object
Dim m_Application As Object

Friend Property Get ChildNodeID() As String
  ChildNodeID = "{D853A7A0-EE9F-4101-B700-0F34BAD9318D}"
End Property

Friend Property Get ChildStructID() As String
  ChildStructID = "{28DEEB54-5B3C-403C-97D1-F99626C87C64}"
End Property

Friend Property Get ChildAggStructID() As String
  ChildAggStructID = Parent.StructID
End Property

'Parameters:
'[IN][OUT]  newParent , тип параметра: Object  - ...
'See Also:
'  Add
'  Application
'  Count
'  Item
'  Remove
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
'  Add
'  Application
'  Count
'  Item
'  Remove
'  XMLLoad
'  XMLSave
'Example:
' dim variable as Object
' Set variable = me.Parent
Public Property Get Parent() As Object
Attribute Parent.VB_HelpID = 225
  Set Parent = m_Parent
End Property

'Parameters:
'[IN][OUT]  newApplication , тип параметра: Object  - ...
'See Also:
'  Add
'  Count
'  Item
'  Parent
'  Remove
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
'  Add
'  Count
'  Item
'  Parent
'  Remove
'  XMLLoad
'  XMLSave
'Example:
' dim variable as Object
' Set variable = me.Application
Public Property Get Application() As Object
Attribute Application.VB_HelpID = 210
 If m_Parent Is Nothing Then
    Set Application = Me
  Else
    Set Application = m_Application
  End If
End Property

Private Sub CloseParents()
  Set m_Application = Nothing
  Set m_Parent = Nothing
End Sub

'Parameters:
'[IN]   ID , тип параметра: String = ""  - ...
'Returns:
'  объект класса ControlData
'  ,или Nothing
'See Also:
'  Application
'  Count
'  Item
'  Parent
'  Remove
'  XMLLoad
'  XMLSave
'Example:
' dim variable as ControlData
' Set variable = me.Add(<параметры>)
Public Function Add(Optional ByVal ID As String = "") As ControlData
Attribute Add.VB_HelpID = 205
 Dim o As ControlData
 Set o = New ControlData
  If ID = "" Then
    mcol.Add o
  Else
   mcol.Add o, ID
   o.Name = ID
  End If
  Set o.Parent = Me
  Set o.Application = Me.Application
  Set Add = o
  Set o = Nothing
End Function

'Parameters:
'[IN]   ID , тип параметра: Variant  - ...
'Returns:
'  объект класса ControlData
'  ,или Nothing
'See Also:
'  Add
'  Application
'  Count
'  Parent
'  Remove
'  XMLLoad
'  XMLSave
'Example:
' dim variable as ControlData
' Set variable = me.Item(<параметры>)
Public Function Item(ByVal ID As Variant) As ControlData
Attribute Item.VB_HelpID = 220
 On Error Resume Next
 Dim o As ControlData
 If Not mcol.Item(ID) Is Nothing Then
   Set o = mcol.Item(ID)
   Set Item = o
   Set o = Nothing
   Exit Function
 End If
End Function


Friend Sub CloseClass()
 On Error Resume Next
 Dim i As Long
 Dim o As ControlData
    For i = 1 To mcol.Count
       Set o = mcol.Item(i)
        o.CloseClass
    Next
 CloseParents
 Set mcol = Nothing
End Sub

Private Sub Class_Initialize()
 Set mcol = New Collection
End Sub

'Parameters:
' параметров нет
'Returns:
'  значение типа Long
'See Also:
'  Add
'  Application
'  Item
'  Parent
'  Remove
'  XMLLoad
'  XMLSave
'Example:
' dim variable as Long
' variable = me.Count
Public Property Get Count() As Long
Attribute Count.VB_HelpID = 215
    Count = mcol.Count
End Property

'Parameters:
'[IN]   vntIndexKey , тип параметра: Variant  - ...
'See Also:
'  Add
'  Application
'  Count
'  Item
'  Parent
'  XMLLoad
'  XMLSave
'Example:
'  call me.Remove(<параметры>)
Public Sub Remove(ByVal vntIndexKey As Variant)
Attribute Remove.VB_HelpID = 230
    mcol.Remove vntIndexKey
End Sub

'Parameters:
'[IN][OUT]   ParentNode , тип параметра: IXMLDOMElement,
'[IN][OUT]   xdom , тип параметра: DOMDocument  - ...
'See Also:
'  Add
'  Application
'  Count
'  Item
'  Parent
'  Remove
'  XMLLoad
'Example:
'  call me.XMLSave(<параметры>)
Public Sub XMLSave(ByRef ParentNode As IXMLDOMElement, xdom As DOMDocument)
Attribute XMLSave.VB_HelpID = 240
  Dim o As ControlData
  Dim i As Long
  Dim node As IXMLDOMElement
  'While ParentNode.childNodes.Length > 0
  '  ParentNode.removeChild ParentNode.childNodes.Item(1)
  'Wend
  For i = 1 To Count
    Set o = Item(i)
    Set node = xdom.createElement("ControlData")
    ParentNode.appendChild node
    o.XMLSave node, xdom
  Next
End Sub

'Parameters:
'[IN][OUT]   NodeList , тип параметра: IXMLDOMNodeList  - ...
'See Also:
'  Add
'  Application
'  Count
'  Item
'  Parent
'  Remove
'  XMLSave
'Example:
'  call me.XMLLoad(<параметры>)
Public Sub XMLLoad(ByRef NodeList As IXMLDOMNodeList): On Error Resume Next
Attribute XMLLoad.VB_HelpID = 235
  Dim o As ControlData
  Dim node As IXMLDOMElement
  NodeList.Reset
  Set node = NodeList.nextNode
  While Not node Is Nothing
    Add().XMLLoad node
    Set node = NodeList.nextNode
  Wend
End Sub
