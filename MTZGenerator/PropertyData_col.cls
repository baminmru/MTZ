VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "PropertyData_col"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 635
Option Explicit


Dim mcol As Collection
Dim m_Parent As Object
Dim m_Application As Object

Friend Property Get ChildNodeID() As String
  ChildNodeID = "{79BE00AF-15C8-49EF-9595-56548419738B}"
End Property

Friend Property Get ChildStructID() As String
  ChildStructID = "{02580C29-2F95-4655-9BAB-70F994B13DCD}"
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
Attribute Parent.VB_HelpID = 660
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
Attribute Application.VB_HelpID = 645
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
'[IN][OUT]   ID , тип параметра: String = ""  - ...
'Returns:
'  объект класса PropertyData
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
' dim variable as PropertyData
' Set variable = me.Add(<параметры>)
Public Function Add(Optional ID As String = "") As PropertyData
Attribute Add.VB_HelpID = 640
 Dim o As PropertyData
 Set o = New PropertyData
  mcol.Add o
  
  Set o.Parent = Me
  Set o.Application = Me.Application
  Set Add = o
  Set o = Nothing
End Function

'Parameters:
'[IN]   ID , тип параметра: Variant  - ...
'Returns:
'  объект класса PropertyData
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
' dim variable as PropertyData
' Set variable = me.Item(<параметры>)
Public Function Item(ByVal ID As Variant) As PropertyData
Attribute Item.VB_HelpID = 655
 On Error Resume Next
 Dim o As PropertyData
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
 Dim o As PropertyData
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
Attribute Count.VB_HelpID = 650
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
Attribute Remove.VB_HelpID = 665
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
Attribute XMLSave.VB_HelpID = 675
  Dim o As PropertyData
  Dim i As Long
  Dim node As IXMLDOMElement
  'While ParentNode.childNodes.Length > 0
  '  ParentNode.removeChild ParentNode.childNodes.Item(1)
  'Wend
  For i = 1 To Count
    Set o = Item(i)
    Set node = xdom.createElement("PropertyData")
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
Attribute XMLLoad.VB_HelpID = 670
  Dim o As PropertyData
  Dim node As IXMLDOMElement
  NodeList.Reset
  Set node = NodeList.nextNode
  While Not node Is Nothing
    Add().XMLLoad node
    Set node = NodeList.nextNode
  Wend
End Sub
