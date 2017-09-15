VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Nodes"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"Node"
Attribute VB_Ext_KEY = "Member0" ,"Node"
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


Public Function Add(ByVal sKey As String) As Node
    'create a new object
    Dim objNewMember As Node
    Set objNewMember = New Node
    mCol.Add objNewMember, sKey
    objNewMember.id = sKey
    Set objNewMember.NodeGraph = NodeGraph
    'return the object created
    Set Add = objNewMember
    Set objNewMember = Nothing


End Function

Public Property Get Item(ByVal vntIndexKey As Variant) As Node
Attribute Item.VB_UserMemId = 0
  Set Item = mCol(vntIndexKey)
End Property


Public Function GetItem(ByVal vntIndexKey As Variant) As Node
  Set GetItem = mCol(vntIndexKey)
End Function


Public Property Get Count() As Long
    Count = mCol.Count
End Property


Public Sub Remove(ByVal vntIndexKey As Variant)
    Item(vntIndexKey).CloseClass
    mCol.Remove vntIndexKey
End Sub


Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
    Set NewEnum = mCol.[_NewEnum]
End Property


Private Sub Class_Initialize()
    Set mCol = New Collection
End Sub


Private Sub Class_Terminate()
    Set mvarNodeGraph = Nothing
    Set mCol = Nothing
End Sub

