VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "AttributeHolder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 10
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

Private mvarName As String 'local copy
Private mvarValue As String 'local copy

'Parameters:
'[IN]   vData , тип параметра: String  - ...
'See Also:
'  Name
'  XMLLoad
'  XMLSave
'Example:
' dim value as Variant
' value = <значение>
' me.Value = value
Public Property Let Value(ByVal vData As String)
Attribute Value.VB_HelpID = 20
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.Value = 5
    mvarValue = vData
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  Name
'  XMLLoad
'  XMLSave
'Example:
' dim variable as String
' variable = me.Value
Public Property Get Value() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.Value
    Value = mvarValue
End Property

'Parameters:
'[IN]   vData , тип параметра: String  - ...
'See Also:
'  Value
'  XMLLoad
'  XMLSave
'Example:
' dim value as Variant
' value = <значение>
' me.Name = value
Friend Property Let Name(ByVal vData As String)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.Name = 5
    mvarName = vData
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  Value
'  XMLLoad
'  XMLSave
'Example:
' dim variable as String
' variable = me.Name
Public Property Get Name() As String
Attribute Name.VB_HelpID = 15
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.Name
    Name = mvarName
End Property

'Parameters:
'[IN][OUT]  node , тип параметра: IXMLDOMElement,
'[IN][OUT]   xdom , тип параметра: DOMDocument  - ...
'See Also:
'  Name
'  Value
'  XMLLoad
'Example:
'  call me.XMLSave(<параметры>)
Public Sub XMLSave(node As IXMLDOMElement, xdom As DOMDocument): On Error Resume Next
Attribute XMLSave.VB_HelpID = 30
  Dim e_ As IXMLDOMElement
  node.setAttribute "Name", Name
  node.setAttribute "Value", Value
End Sub

'Parameters:
'[IN][OUT]  node , тип параметра: IXMLDOMNode  - ...
'See Also:
'  Name
'  Value
'  XMLSave
'Example:
'  call me.XMLLoad(<параметры>)
Public Sub XMLLoad(node As IXMLDOMNode): On Error Resume Next
Attribute XMLLoad.VB_HelpID = 25
  Dim e_list As IXMLDOMNodeList
  Dim e_ As IXMLDOMNode
  Name = node.Attributes.getNamedItem("Name").nodeValue
  Name = Replace(Name, vbLf, vbCrLf)
  Value = node.Attributes.getNamedItem("Value").nodeValue
  Value = Replace(Value, vbLf, vbCrLf)
End Sub
