VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "JFilters"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"JFilter"
Attribute VB_Ext_KEY = "Member0" ,"JFilter"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

'local variable to hold collection
Private mCol As Collection

Public Function Add(ViewName As String, FilterString As String) As JFilter
    'create a new object
    Dim objNewMember As JFilter
    On Error Resume Next
    Set objNewMember = mCol.Item(ViewName)
    If objNewMember Is Nothing Then
      Set objNewMember = New JFilter
      objNewMember.ViewName = ViewName
      objNewMember.FilterString = FilterString
      mCol.Add objNewMember, ViewName
    End If
    objNewMember.FilterString = FilterString
    'return the object created
    Set Add = objNewMember
    Set objNewMember = Nothing


End Function

Public Property Get Item(ByVal vntIndexKey As Variant) As JFilter
Attribute Item.VB_UserMemId = 0
  On Error Resume Next
  Set Item = mCol(vntIndexKey)
End Property



Public Property Get Count() As Long
    
    Count = mCol.Count
End Property


Public Sub Remove(ByVal vntIndexKey As Variant)
    On Error Resume Next
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

