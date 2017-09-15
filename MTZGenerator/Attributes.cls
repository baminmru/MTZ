VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Attributes"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 35
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"AttributeHolder"
Attribute VB_Ext_KEY = "Member0" ,"AttributeHolder"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

'local variable to hold collection
Private mcol As Collection

'Parameters:
'[IN]   Name , тип параметра: String  - ...
'Returns:
'  объект класса AttributeHolder
'  ,или Nothing
'See Also:
'  Count
'  Item
'  NewEnum
'  Remove
'  XMLLoad
'  XMLSave
'Example:
' dim variable as AttributeHolder
' Set variable = me.Add(<параметры>)
Public Function Add(ByVal Name As String) As AttributeHolder
Attribute Add.VB_HelpID = 40
    'create a new object
    Dim objNewMember As AttributeHolder
    
    On Error Resume Next
    Set objNewMember = Item(Name)
    If objNewMember Is Nothing Then
        Set objNewMember = New AttributeHolder
        objNewMember.Name = Name
        mcol.Add objNewMember, Name
    End If
    
    'return the object created
    Set Add = objNewMember
    Set objNewMember = Nothing
End Function

'Parameters:
'[IN][OUT]  vntIndexKey , тип параметра: Variant  - ...
'Returns:
'  объект класса AttributeHolder
'  ,или Nothing
'See Also:
'  Add
'  Count
'  NewEnum
'  Remove
'  XMLLoad
'  XMLSave
'Example:
' dim variable as AttributeHolder
' Set variable = me.Item(<параметры>)
Public Property Get Item(vntIndexKey As Variant) As AttributeHolder
Attribute Item.VB_HelpID = 50
Attribute Item.VB_UserMemId = 0
Attribute Item.VB_MemberFlags = "200"
    'used when referencing an element in the collection
    'vntIndexKey contains either the Index or Key to the collection,
    'this is why it is declared as a Variant
    'Syntax: Set foo = x.Item(xyz) or Set foo = x.Item(5)
  On Error Resume Next
  Set Item = mcol(vntIndexKey)
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа Long
'See Also:
'  Add
'  Item
'  NewEnum
'  Remove
'  XMLLoad
'  XMLSave
'Example:
' dim variable as Long
' variable = me.Count
Public Property Get Count() As Long
Attribute Count.VB_HelpID = 45
    'used when retrieving the number of elements in the
    'collection. Syntax: Debug.Print x.Count
    Count = mcol.Count
End Property

'Parameters:
'[IN][OUT]  vntIndexKey , тип параметра: Variant  - ...
'See Also:
'  Add
'  Count
'  Item
'  NewEnum
'  XMLLoad
'  XMLSave
'Example:
'  call me.Remove(<параметры>)
Public Sub Remove(vntIndexKey As Variant)
Attribute Remove.VB_HelpID = 60
    'used when removing an element from the collection
    'vntIndexKey contains either the Index or Key, which is why
    'it is declared as a Variant
    'Syntax: x.Remove(xyz)


    mcol.Remove vntIndexKey
End Sub

'Parameters:
' параметров нет
'Returns:
'  объект класса IUnknown
'  ,или Nothing
'See Also:
'  Add
'  Count
'  Item
'  Remove
'  XMLLoad
'  XMLSave
'Example:
' dim variable as IUnknown
' Set variable = me.NewEnum
Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_HelpID = 55
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
    'this property allows you to enumerate
    'this collection with the For...Each syntax
    Set NewEnum = mcol.[_NewEnum]
End Property


Private Sub Class_Initialize()
    'creates the collection when this class is created
    Set mcol = New Collection
End Sub


Private Sub Class_Terminate()
    'destroys collection when this class is terminated
    Set mcol = Nothing
End Sub

'Parameters:
'[IN][OUT]   ParentNode , тип параметра: IXMLDOMElement,
'[IN][OUT]   xdom , тип параметра: DOMDocument  - ...
'See Also:
'  Add
'  Count
'  Item
'  NewEnum
'  Remove
'  XMLLoad
'Example:
'  call me.XMLSave(<параметры>)
Public Sub XMLSave(ByRef ParentNode As IXMLDOMElement, xdom As DOMDocument)
Attribute XMLSave.VB_HelpID = 70
  Dim o As AttributeHolder
  Dim i As Long
  Dim node As IXMLDOMElement
  For i = 1 To Count
    Set o = Item(i)
    Set node = xdom.createElement("AttributeHolder")
    ParentNode.appendChild node
    o.XMLSave node, xdom
  Next
End Sub

'Parameters:
'[IN][OUT]   NodeList , тип параметра: IXMLDOMNodeList  - ...
'See Also:
'  Add
'  Count
'  Item
'  NewEnum
'  Remove
'  XMLSave
'Example:
'  call me.XMLLoad(<параметры>)
Public Sub XMLLoad(ByRef NodeList As IXMLDOMNodeList): On Error Resume Next
Attribute XMLLoad.VB_HelpID = 65
  Dim node As IXMLDOMElement
  NodeList.Reset
  Set node = NodeList.nextNode
  While Not node Is Nothing
    If Item(node.Attributes.getNamedItem("Name").nodeValue) Is Nothing Then
      Add(node.Attributes.getNamedItem("Name").nodeValue).XMLLoad node
    Else
      Item(node.Attributes.getNamedItem("Name").nodeValue).XMLLoad node
    End If
    Set node = NodeList.nextNode
  Wend
End Sub

