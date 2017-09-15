VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Graph"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Member0" ,"Nodes"
Attribute VB_Ext_KEY = "Member1" ,"Nodes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

Private mvarNodes As Nodes
Private mvarID As String
Private mvarName As String
Private mvarParentID As String
Private mvarParent As Graphs

Public Property Get Nodes() As Nodes
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.Nodes
    If mvarNodes Is Nothing Then
      Set mvarNodes = New Nodes
      Set mvarNodes.NodeGraph = Me
    End If
    Set Nodes = mvarNodes
End Property

Friend Function NewEdge() As Edge
    Set NewEdge = New Edge
End Function

Public Property Get id() As String
    id = mvarID
End Property


Friend Property Let id(ByVal v As String)
    mvarID = v
End Property


Public Property Get Parentid() As String
    Parentid = mvarParentID
End Property


Friend Property Let Parentid(ByVal v As String)
    mvarParentID = v
End Property


Public Property Get NAME() As String
    NAME = mvarName
End Property


Public Property Let NAME(ByVal v As String)
    mvarName = v
End Property

Public Sub CloseClass()
    On Error Resume Next
    If Not mvarNodes Is Nothing Then
        Dim n As Node
        For Each n In mvarNodes
            n.CloseClass
        Next
    End If
    Set mvarParent = Nothing
    Set mvarNodes = Nothing
End Sub

Private Sub Class_Terminate()
 'CloseClass
End Sub

Friend Property Get Parent() As Graphs
    Set Parent = mvarParent
End Property

Friend Property Set Parent(v As Graphs)
    Set mvarParent = v
End Property

