VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Edges"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"Edge"
Attribute VB_Ext_KEY = "Member0" ,"Edge"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit
'local variable to hold collection
Private mCol As Collection

Private mvarNodeGraph As Graph
Public Property Get NodeGraph() As Graph
    Set NodeGraph = mvarNodeGraph
End Property

Friend Property Set NodeGraph(ByVal vNewValue As Graph)
    Set mvarNodeGraph = vNewValue
End Property


Public Function Add(ByVal id As String, ByVal FromNode As Node, ByVal ToNode As Node) As Edge
    'create a new object
    Dim objNewMember As Edge
    Set objNewMember = New Edge
    'set the properties passed into the method

     Set objNewMember.FromNode = FromNode
     Set objNewMember.ToNode = ToNode
     objNewMember.id = id
     Set objNewMember.NodeGraph = NodeGraph
     mCol.Add objNewMember, objNewMember.id
     

    'return the object created
    Set Add = objNewMember
    Set objNewMember = Nothing


End Function

Public Property Get Item(ByVal vntIndexKey As Variant) As Edge
Attribute Item.VB_UserMemId = 0
    'used when referencing an element in the collection
    'vntIndexKey contains either the Index or Key to the collection,
    'this is why it is declared as a Variant
    'Syntax: Set foo = x.Item(xyz) or Set foo = x.Item(5)
   Set Item = mCol(vntIndexKey)
End Property

Public Function GetItem(ByVal vntIndexKey As Variant) As Edge
   Set GetItem = mCol(vntIndexKey)
End Function


Public Property Get Count() As Long
    'used when retrieving the number of elements in the
    'collection. Syntax: Debug.Print x.Count
    Count = mCol.Count
End Property


Public Sub Remove(ByVal vntIndexKey As Variant)
    'used when removing an element from the collection
    'vntIndexKey contains either the Index or Key, which is why
    'it is declared as a Variant
    'Syntax: x.Remove(xyz)
    mCol.Item(vntIndexKey).CloseClass
    mCol.Remove vntIndexKey
End Sub


Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
    'this property allows you to enumerate
    'this collection with the For...Each syntax
    Set NewEnum = mCol.[_NewEnum]
End Property


Private Sub Class_Initialize()
    'creates the collection when this class is created
    Set mCol = New Collection
End Sub


Private Sub Class_Terminate()
    'destroys collection when this class is terminated
    Set mCol = Nothing
End Sub

