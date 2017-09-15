VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ModuleHolder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 375
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "Member0" ,"Attributes"
Attribute VB_Ext_KEY = "Member1" ,"Blocks"
Option Explicit

Private mvarModuleName As String 'local copy
Private mvarFile As String 'local copy
Private mvarAttributes As Attributes 'local copy
Private mvarBlocks As Blocks 'local copy

'Parameters:
' параметров нет
'Returns:
'  объект класса Blocks
'  ,или Nothing
'See Also:
'  Attributes
'  File
'  ModuleName
'  XMLLoad
'  XMLSave
'Example:
' dim variable as Blocks
' Set variable = me.Blocks
Public Property Get Blocks() As Blocks
Attribute Blocks.VB_HelpID = 385
 If mvarBlocks Is Nothing Then
      Set mvarBlocks = New Blocks
    End If
    Set Blocks = mvarBlocks
End Property

'Parameters:
' параметров нет
'Returns:
'  объект класса Attributes
'  ,или Nothing
'See Also:
'  Blocks
'  File
'  ModuleName
'  XMLLoad
'  XMLSave
'Example:
' dim variable as Attributes
' Set variable = me.Attributes
Public Property Get Attributes() As Attributes
Attribute Attributes.VB_HelpID = 380
 If mvarAttributes Is Nothing Then
      Set mvarAttributes = New Attributes
    End If
    Set Attributes = mvarAttributes
End Property

'Parameters:
'[IN]   vData , тип параметра: String  - ...
'See Also:
'  Attributes
'  Blocks
'  ModuleName
'  XMLLoad
'  XMLSave
'Example:
' dim value as Variant
' value = <значение>
' me.File = value
Public Property Let File(ByVal vData As String)
Attribute File.VB_HelpID = 390
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.File = 5
    mvarFile = vData
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  Attributes
'  Blocks
'  ModuleName
'  XMLLoad
'  XMLSave
'Example:
' dim variable as String
' variable = me.File
Public Property Get File() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.File
    File = mvarFile
End Property

'Parameters:
'[IN]   vData , тип параметра: String  - ...
'See Also:
'  Attributes
'  Blocks
'  File
'  XMLLoad
'  XMLSave
'Example:
' dim value as Variant
' value = <значение>
' me.ModuleName = value
Friend Property Let ModuleName(ByVal vData As String)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.ModuleName = 5
    mvarModuleName = vData
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  Attributes
'  Blocks
'  File
'  XMLLoad
'  XMLSave
'Example:
' dim variable as String
' variable = me.ModuleName
Public Property Get ModuleName() As String
Attribute ModuleName.VB_HelpID = 395
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.ModuleName
    ModuleName = mvarModuleName
End Property

Private Property Get Code() As String
  Dim b As BlockHolder
  Dim s As String
  For Each b In Blocks
    s = s & vbCrLf & b.BlockCode
  Next
  Code = s
End Property

Private Sub Class_Terminate()
  Set mvarAttributes = Nothing
  Set mvarBlocks = Nothing
End Sub

'Parameters:
'[IN][OUT]  node , тип параметра: IXMLDOMElement,
'[IN][OUT]   xdom , тип параметра: DOMDocument  - ...
'See Also:
'  Attributes
'  Blocks
'  File
'  ModuleName
'  XMLLoad
'Example:
'  call me.XMLSave(<параметры>)
Public Sub XMLSave(node As IXMLDOMElement, xdom As DOMDocument): On Error Resume Next
Attribute XMLSave.VB_HelpID = 405
  Dim e_ As IXMLDOMElement
  node.setAttribute "ModuleName", ModuleName
  node.setAttribute "File", File
  Attributes.XMLSave node, xdom
  Blocks.XMLSave node, xdom
End Sub

'Parameters:
'[IN][OUT]  node , тип параметра: IXMLDOMNode  - ...
'See Also:
'  Attributes
'  Blocks
'  File
'  ModuleName
'  XMLSave
'Example:
'  call me.XMLLoad(<параметры>)
Public Sub XMLLoad(node As IXMLDOMNode): On Error Resume Next
Attribute XMLLoad.VB_HelpID = 400
  Dim e_list As IXMLDOMNodeList
  Dim e_ As IXMLDOMNode
  ModuleName = node.Attributes.getNamedItem("ModuleName").nodeValue
  ModuleName = Replace(ModuleName, vbLf, vbCrLf)
  File = node.Attributes.getNamedItem("File").nodeValue
  File = Replace(File, vbLf, vbCrLf)
  Set e_list = node.selectNodes("AttributeHolder")
  Attributes.XMLLoad e_list
  Set e_list = node.selectNodes("BlockHolder")
  Blocks.XMLLoad e_list
End Sub



