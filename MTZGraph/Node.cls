VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Node"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Member0" ,"Edges"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "Member1" ,"LineItems"
Option Explicit



Private mvarCaption As String
Private mvarControl As Object
Private mvarNodeData As Variant
Private mvarEdges As Edges
Private mvarID As String
Private mvarIsSelected As Boolean
Private mvarY As Long
Private mvarX As Long
Private mvarW As Long
Private mvarH As Long
Private mvarImageIndex As Long
Private mvarImageKey As String
Private mvarNodeObject As Object
Private mvarControlIndex As Integer
Private mvarLineItems As LineItems
Private mvarDecomposeID As String
Private mvarNodeGraph As Graph
Private mvarAllowDecomposition As Boolean

Public Property Let AllowDecomposition(ByVal vData As Boolean)
    On Error Resume Next
    mvarAllowDecomposition = vData
    
    
    If Not Me.Control Is Nothing Then
        Me.Control.AllowDecomposition = vData
    End If
    
End Property


Public Property Get AllowDecomposition() As Boolean
    AllowDecomposition = mvarAllowDecomposition
End Property


Friend Property Get LineItems() As LineItems
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.LineItems
    If mvarLineItems Is Nothing Then
        Set mvarLineItems = New LineItems
    End If
    Set LineItems = mvarLineItems
End Property



Friend Property Let ControlIndex(ByVal vData As Integer)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.ControlIndex = 5
    mvarControlIndex = vData
End Property


Friend Property Get ControlIndex() As Integer
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.ControlIndex
    ControlIndex = mvarControlIndex
End Property



Public Property Set NodeObject(ByVal vData As Object)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.NodeObject = Form1
    Set mvarNodeObject = vData
End Property


Public Property Get NodeObject() As Object
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.NodeObject
    Set NodeObject = mvarNodeObject
End Property



Public Property Let ImageIndex(ByVal vData As Long)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.ImageIndex = 5
    mvarImageIndex = vData
End Property




Public Property Get ImageIndex() As Long
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.ImageIndex
    
     ImageIndex = mvarImageIndex
    
End Property


Public Property Let ImageKey(ByVal vData As String)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.ImageIndex = 5
    mvarImageKey = vData
End Property




Public Property Get ImageKey() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.ImageIndex
    
     ImageKey = mvarImageKey
    
End Property




Public Property Let H(ByVal vData As Long)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.H = 5
    mvarH = vData
End Property


Public Property Get H() As Long
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.H
    H = mvarH
End Property



Public Property Let W(ByVal vData As Long)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.W = 5
    mvarW = vData
End Property


Public Property Get W() As Long
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.W
    W = mvarW
End Property



Public Property Let x(ByVal vData As Long)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.X = 5
    mvarX = vData
End Property


Public Property Get x() As Long
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.X
    x = mvarX
End Property



Public Property Let y(ByVal vData As Long)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.Y = 5
    mvarY = vData
End Property


Public Property Get y() As Long
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.Y
    y = mvarY
End Property



Public Property Let IsSelected(ByVal vData As Boolean)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.IsSelected = 5
    mvarIsSelected = vData
    If Not Control Is Nothing Then
        If mvarIsSelected Then
            Control.BackColor = &H80000002
        Else
            Control.BackColor = &H80000000
        End If
    End If
End Property


Public Property Get IsSelected() As Boolean
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.IsSelected
    IsSelected = mvarIsSelected
End Property



Public Property Let id(ByVal vData As String)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.ID = 5
    mvarID = vData
End Property


Public Property Get id() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.ID
    id = mvarID
End Property



'Public Property Set Edges(ByVal vData As Edges)
''used when assigning an Object to the property, on the left side of a Set statement.
''Syntax: Set x.Edges = Form1
'    Set mvarEdges = vData
'End Property


Public Property Get Edges() As Edges
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.Edges
    If mvarEdges Is Nothing Then
      Set mvarEdges = New Edges
      Set mvarEdges.NodeGraph = NodeGraph
    End If
    Set Edges = mvarEdges
End Property



Public Property Let NodeData(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.NodeData = 5
    mvarNodeData = vData
End Property


Public Property Set NodeData(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.NodeData = Form1
    Set mvarNodeData = vData
End Property


Public Property Get NodeData() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.NodeData
    If IsObject(mvarNodeData) Then
        Set NodeData = mvarNodeData
    Else
        NodeData = mvarNodeData
    End If
End Property



Friend Property Set Control(ByVal vData As Object)
    Set mvarControl = vData
End Property


Friend Property Get Control() As Object
    Set Control = mvarControl
End Property

Public Property Let Caption(ByVal vData As String)
    mvarCaption = vData
    If Not Control Is Nothing Then
      Control.Caption = Caption
    End If
End Property


Public Property Get Caption() As String
    Caption = mvarCaption
End Property

Friend Property Let DecomposeID(ByVal vData As String)
    mvarDecomposeID = vData
End Property


Public Property Get DecomposeID() As String
    DecomposeID = mvarDecomposeID
End Property



Public Property Set Picture(ByVal vData As Picture)
    If Not Control Is Nothing Then
      Set Control.Picture = vData
    End If
End Property


Public Property Get Picture() As Picture
   If Not Control Is Nothing Then
      Set Picture = Control.Picture
    End If
End Property



Private Sub Class_Terminate()
    CloseClass
End Sub

Public Property Get BackColor() As OLE_COLOR
    If Not Control Is Nothing Then
      BackColor = Control.Color
    End If
End Property

Public Property Let BackColor(ByVal New_BackColor As OLE_COLOR)
    If Not Control Is Nothing Then
      Control.Color = New_BackColor
    End If
End Property


Public Property Get NodeGraph() As Graph
    Set NodeGraph = mvarNodeGraph
End Property

Friend Property Set NodeGraph(ByVal vNewValue As Graph)
    Set mvarNodeGraph = vNewValue
End Property

Public Sub CloseClass()
  On Error Resume Next
  If DecomposeID <> "" Then
    If Not NodeGraph Is Nothing Then
        If Not NodeGraph.Parent Is Nothing Then
            NodeGraph.Parent.Item(DecomposeID).CloseClass
            NodeGraph.Parent.Remove DecomposeID
            DecomposeID = ""
        End If
    End If
  End If
  Dim e As Edge
  If Not mvarEdges Is Nothing Then
    For Each e In mvarEdges
        e.CloseClass
    Next
  End If
  Set mvarEdges = Nothing
  Set mvarNodeObject = Nothing
  Set mvarNodeData = Nothing
  Set mvarControl = Nothing
  Set mvarNodeGraph = Nothing
End Sub
