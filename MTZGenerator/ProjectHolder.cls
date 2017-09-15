VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ProjectHolder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 485
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "Member0" ,"Attributes"
Attribute VB_Ext_KEY = "Member1" ,"Modules"
Option Explicit

'local variable(s) to hold property value(s)
Private mvarAttributes As Attributes 'local copy
Private mvarModules As Modules 'local copy

'Parameters:
' параметров нет
'Returns:
'  объект класса Modules
'  ,или Nothing
'See Also:
'  Attributes
'  Load
'  Save
'  XMLLoad
'  XMLSave
'Example:
' dim variable as Modules
' Set variable = me.Modules
Public Property Get Modules() As Modules
Attribute Modules.VB_HelpID = 500
    If mvarModules Is Nothing Then
      Set mvarModules = New Modules
    End If
    Set Modules = mvarModules
End Property

'Parameters:
' параметров нет
'Returns:
'  объект класса Attributes
'  ,или Nothing
'See Also:
'  Load
'  Modules
'  Save
'  XMLLoad
'  XMLSave
'Example:
' dim variable as Attributes
' Set variable = me.Attributes
Public Property Get Attributes() As Attributes
Attribute Attributes.VB_HelpID = 490
   If mvarAttributes Is Nothing Then
      Set mvarAttributes = New Attributes
    End If
    Set Attributes = mvarAttributes
End Property


Private Sub Class_Terminate()
  Set mvarModules = Nothing
  Set mvarAttributes = Nothing
End Sub

'Parameters:
'[IN][OUT]  node , тип параметра: IXMLDOMElement,
'[IN][OUT]   xdom , тип параметра: DOMDocument  - ...
'See Also:
'  Attributes
'  Load
'  Modules
'  Save
'  XMLLoad
'Example:
'  call me.XMLSave(<параметры>)
Public Sub XMLSave(node As IXMLDOMElement, xdom As DOMDocument)
Attribute XMLSave.VB_HelpID = 515
  Attributes.XMLSave node, xdom
  Modules.XMLSave node, xdom
End Sub

'Parameters:
'[IN][OUT]  node , тип параметра: IXMLDOMNode  - ...
'See Also:
'  Attributes
'  Load
'  Modules
'  Save
'  XMLSave
'Example:
'  call me.XMLLoad(<параметры>)
Public Sub XMLLoad(node As IXMLDOMNode): On Error Resume Next
Attribute XMLLoad.VB_HelpID = 510
  Dim e_list As IXMLDOMNodeList
  Set e_list = node.selectNodes("AttributeHolder")
  Attributes.XMLLoad e_list
  Set e_list = node.selectNodes("ModuleHolder")
  Modules.XMLLoad e_list
End Sub

'Parameters:
'[IN]   path , тип параметра: String  - ...
'See Also:
'  Attributes
'  Modules
'  Save
'  XMLLoad
'  XMLSave
'Example:
'  call me.Load(<параметры>)
Public Sub Load(ByVal path As String)
Attribute Load.VB_HelpID = 495
  Dim xdom As DOMDocument
  Set xdom = New DOMDocument
  If Not xdom.Load(path) Then Exit Sub
  Dim xnode As IXMLDOMNode
  Set xnode = xdom.childNodes.Item(1)
  XMLLoad xnode
End Sub

'Parameters:
'[IN]   path , тип параметра: String  - ...
'See Also:
'  Attributes
'  Load
'  Modules
'  XMLLoad
'  XMLSave
'Example:
'  call me.Save(<параметры>)
Public Sub Save(ByVal path As String)
Attribute Save.VB_HelpID = 505
  Dim xdom As DOMDocument
  Set xdom = New DOMDocument
  xdom.loadXML "<?xml version=""1.0""?><root></root>"
  Dim xnode As IXMLDOMNode
  Set xnode = xdom.childNodes.Item(1)
  XMLSave xnode, xdom
  xdom.Save path
End Sub
