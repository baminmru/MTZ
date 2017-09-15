VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "BlockHolder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 75
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit


Private mvarBlockName As String 'local copy
Private mvarAttributes As Attributes 'local copy
Private mvarFormData As MTZGenerator.FormData
Private wr As Writer

'Parameters:
' параметров нет
'Returns:
'  объект класса Attributes
'  ,или Nothing
'See Also:
'  BlockCode
'  BlockName
'  FormData
'  XMLLoad
'  XMLSave
'Example:
' dim variable as Attributes
' Set variable = me.Attributes
Public Property Get Attributes() As Attributes
Attribute Attributes.VB_HelpID = 80
 If mvarAttributes Is Nothing Then
      Set mvarAttributes = New Attributes
    End If
    Set Attributes = mvarAttributes
End Property

'Parameters:
' параметров нет
'Returns:
'  объект класса MTZGenerator.FormData
'  ,или Nothing
'See Also:
'  Attributes
'  BlockCode
'  BlockName
'  XMLLoad
'  XMLSave
'Example:
' dim variable as MTZGenerator.FormData
' Set variable = me.FormData
Public Property Get FormData() As MTZGenerator.FormData
Attribute FormData.VB_HelpID = 95
 If mvarFormData Is Nothing Then
      Set mvarFormData = New MTZGenerator.FormData
    End If
    Set FormData = mvarFormData
End Property

'Parameters:
'[IN]   vData , тип параметра: String  - ...
'See Also:
'  Attributes
'  BlockName
'  FormData
'  XMLLoad
'  XMLSave
'Example:
' dim value as Variant
' value = <значение>
' me.BlockCode = value
Public Property Let BlockCode(ByVal vData As String)
Attribute BlockCode.VB_HelpID = 85
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.BlockCode = 5
    Set wr = Nothing
    Set wr = New Writer
    wr.putBuf vData
    wr.Flush
End Property

Public Sub AppendCode(ByVal s As String)
  wr.putBuf2 s
End Sub

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  Attributes
'  BlockName
'  FormData
'  XMLLoad
'  XMLSave
'Example:
' dim variable as String
' variable = me.BlockCode
Public Property Get BlockCode() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.BlockCode
    BlockCode = wr.getBuf
End Property

'Parameters:
'[IN]   vData , тип параметра: String  - ...
'See Also:
'  Attributes
'  BlockCode
'  FormData
'  XMLLoad
'  XMLSave
'Example:
' dim value as Variant
' value = <значение>
' me.BlockName = value
Friend Property Let BlockName(ByVal vData As String)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.BlockName = 5
    mvarBlockName = vData
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  Attributes
'  BlockCode
'  FormData
'  XMLLoad
'  XMLSave
'Example:
' dim variable as String
' variable = me.BlockName
Public Property Get BlockName() As String
Attribute BlockName.VB_HelpID = 90
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.BlockName
    BlockName = mvarBlockName
End Property

'Parameters:
'[IN][OUT]  node , тип параметра: IXMLDOMElement,
'[IN][OUT]   xdom , тип параметра: DOMDocument  - ...
'See Also:
'  Attributes
'  BlockCode
'  BlockName
'  FormData
'  XMLLoad
'Example:
'  call me.XMLSave(<параметры>)
Public Sub XMLSave(node As IXMLDOMElement, xdom As DOMDocument): On Error Resume Next
Attribute XMLSave.VB_HelpID = 105
  Dim e_ As IXMLDOMElement
  node.setAttribute "BlockName", BlockName
  node.setAttribute "BlockCode", BlockCode
  Attributes.XMLSave node, xdom
  
  If FormData.Name <> "" Then
  End If
  Dim nnode As IXMLDOMElement
  Set nnode = xdom.createElement("FormData")
  node.appendChild nnode
  FormData.XMLSave nnode, xdom
  
End Sub

'Parameters:
'[IN][OUT]  node , тип параметра: IXMLDOMNode  - ...
'See Also:
'  Attributes
'  BlockCode
'  BlockName
'  FormData
'  XMLSave
'Example:
'  call me.XMLLoad(<параметры>)
Public Sub XMLLoad(node As IXMLDOMNode): On Error Resume Next
Attribute XMLLoad.VB_HelpID = 100
  Dim e_list As IXMLDOMNodeList
  Dim e_ As IXMLDOMNode
  BlockName = Replace(node.Attributes.getNamedItem("BlockName").nodeValue, vbLf, vbCrLf)
  BlockCode = Replace(node.Attributes.getNamedItem("BlockCode").nodeValue, vbLf, vbCrLf)
  Set e_list = node.selectNodes("AttributeHolder")
  Attributes.XMLLoad e_list
  Set e_list = node.selectNodes("FormData")
  If e_list.length = 1 Then FormData.XMLLoad e_list.Item(0)
  
End Sub


Private Sub Class_Initialize()
  Set wr = New Writer
End Sub

Private Sub Class_Terminate()
    Set mvarAttributes = Nothing
    Set mvarFormData = Nothing
    Set wr = Nothing
    
End Sub

Public Sub Flush()
  wr.Flush
End Sub
