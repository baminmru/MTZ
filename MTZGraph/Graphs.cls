VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Graphs"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"Graph"
Attribute VB_Ext_KEY = "Member0" ,"Graph"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

'local variable to hold collection
Private mCol As Collection

Public Function Add(ByVal sKey As String) As Graph
    'create a new object
    Dim objNewMember As Graph
    Set objNewMember = New Graph
    Set objNewMember.Parent = Me
    objNewMember.id = sKey
    mCol.Add objNewMember, sKey
    'return the object created
    Set Add = objNewMember
    Set objNewMember = Nothing
End Function

Public Property Get Item(ByVal vntIndexKey As Variant) As Graph
Attribute Item.VB_UserMemId = 0
    On Error Resume Next
  Set Item = mCol(vntIndexKey)
End Property


Public Function GetItem(ByVal vntIndexKey As Variant) As Graph
    On Error Resume Next
  Set GetItem = mCol(vntIndexKey)
End Function



Public Property Get Count() As Long
    On Error Resume Next
    Count = mCol.Count
End Property


Public Sub Remove(ByVal vntIndexKey As Variant)
    On Error Resume Next
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
    Set mCol = Nothing
End Sub

