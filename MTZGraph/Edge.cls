VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Edge"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Member0" ,"LineItems"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

Private mvarFromNode As Node
Private mvarToNode As Node
Private mvarEdgeData As Variant
Private mvarID As String
Private mvarLineItems As LineItems
'Private mvarIsSelected As Boolean
Private mvarSelectedColor As Long
Private mvarDefaultColor As Long

Private mvarBorderStyle As Integer

Private mvarToolTipText As String

Private mvarER_Arrow As Boolean

Private mvarNodeGraph As Graph
Public Property Get NodeGraph() As Graph
    Set NodeGraph = mvarNodeGraph
End Property

Friend Property Set NodeGraph(ByVal vNewValue As Graph)
    Set mvarNodeGraph = vNewValue
End Property




Public Property Let ER_Arrow(ByVal vData As Boolean)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.ER_Arrow = 5
    mvarER_Arrow = vData
End Property


Public Property Get ER_Arrow() As Boolean
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.ER_Arrow
    ER_Arrow = mvarER_Arrow
End Property



Public Property Let ToolTipText(ByVal vData As String)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.ToolTipText = 5
    mvarToolTipText = vData
End Property


Public Property Get ToolTipText() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.ToolTipText
    ToolTipText = mvarToolTipText
End Property



Public Property Let BorderStyle(ByVal vData As Integer)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.BorderStyle = 5
    mvarBorderStyle = vData
End Property


Public Property Get BorderStyle() As Integer
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.BorderStyle
    BorderStyle = mvarBorderStyle
End Property




Public Property Let DefaultColor(ByVal vData As Long)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.DefaultColor = 5
    mvarDefaultColor = vData
End Property


Public Property Get DefaultColor() As Long
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.DefaultColor
    DefaultColor = mvarDefaultColor
End Property



Public Property Let SelectedColor(ByVal vData As Long)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.SelectedColor = 5
    mvarSelectedColor = vData
End Property


Public Property Get SelectedColor() As Long
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.SelectedColor
    SelectedColor = mvarSelectedColor
End Property



'Public Property Let IsSelected(ByVal vData As Boolean)
''used when assigning a value to the property, on the left side of an assignment.
''Syntax: X.IsSelected = 5
'    mvarIsSelected = vData
'End Property
'
'
'Public Property Get IsSelected() As Boolean
''used when retrieving value of a property, on the right side of an assignment.
''Syntax: Debug.Print X.IsSelected
'    IsSelected = mvarIsSelected
'End Property
'
'

Friend Property Set LineItems(ByVal vData As LineItems)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.LineItems = Form1
    Set mvarLineItems = vData
End Property


Friend Property Get LineItems() As LineItems
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.LineItems
    If mvarLineItems Is Nothing Then
      Set mvarLineItems = New LineItems
    End If
    Set LineItems = mvarLineItems
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



Public Property Let EdgeData(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.EdgeData = 5
    mvarEdgeData = vData
End Property


Public Property Set EdgeData(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.EdgeData = Form1
    Set mvarEdgeData = vData
End Property


Public Property Get EdgeData() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.EdgeData
    If IsObject(mvarEdgeData) Then
        Set EdgeData = mvarEdgeData
    Else
        EdgeData = mvarEdgeData
    End If
End Property



Public Property Set ToNode(ByVal vData As Node)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.ToNode = Form1
    Set mvarToNode = vData
End Property


Public Property Get ToNode() As Node
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.ToNode
    Set ToNode = mvarToNode
End Property



Public Property Set FromNode(ByVal vData As Node)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.FromNode = Form1
    Set mvarFromNode = vData
End Property


Public Property Get FromNode() As Node
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.FromNode
    Set FromNode = mvarFromNode
End Property




Public Function HitTest(ByVal x As Double, ByVal y As Double) As Boolean
  Dim l As LineItem
  Dim a As Double, b As Double, dlt As Double
  HitTest = False
  dlt = 5 * Screen.TwipsPerPixelY
  On Error Resume Next
  For Each l In LineItems
      
      If (l.FromX - dlt <= x And x <= l.ToX + dlt) Or (l.ToX - dlt <= x And x <= l.FromX + dlt) Then
        If (l.FromY - dlt <= y And y <= l.ToY + dlt) Or (l.ToY - dlt <= y And y <= l.FromY + dlt) Then
          If Abs(l.FromX - l.ToX) < dlt Then
            HitTest = True
            Exit Function
          ElseIf Abs(l.FromY - l.ToY) < dlt Then
            HitTest = True
            Exit Function
          Else
            a = (l.FromY - l.ToY) / (l.FromX - l.ToX)
            b = l.FromY - a * l.FromX
            If y - dlt <= a * x + b And y + dlt >= a * x + b Then
              HitTest = True
              Exit Function
            End If
          End If
        End If
      End If
  Next
End Function

Private Sub Class_Initialize()
 mvarSelectedColor = RGB(255, 0, 0)
 mvarDefaultColor = RGB(0, 0, 0)
 mvarBorderStyle = 1 'Solid
 mvarER_Arrow = False
End Sub


Private Sub Class_Terminate()
  CloseClass
End Sub

Public Sub CloseClass()
 Set LineItems = Nothing
 Set ToNode = Nothing
 Set FromNode = Nothing
 If IsObject(EdgeData) Then
   Set EdgeData = Nothing
 End If

End Sub
