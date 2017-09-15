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

'Parameters:
'[IN][OUT]  ViewName , тип параметра: String,
'[IN][OUT]   FilterString , тип параметра: String  - ...
'Returns:
'  объект класса JFilter
'  ,или Nothing
'See Also:
'  Count
'  Item
'  NewEnum
'  Remove
'Example:
' dim variable as JFilter
' Set variable = me.Add(...параметры...)
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

'Parameters:
'[IN]   vntIndexKey , тип параметра: Variant  - ...
'Returns:
'  объект класса JFilter
'  ,или Nothing
'See Also:
'  Add
'  Count
'  NewEnum
'  Remove
'Example:
' dim variable as JFilter
' Set variable = me.Item(...параметры...)
Public Property Get Item(ByVal vntIndexKey As Variant) As JFilter
Attribute Item.VB_UserMemId = 0
Attribute Item.VB_MemberFlags = "200"
  On Error Resume Next
  Set Item = mCol(vntIndexKey)
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа Long
'See Also:
'  Add
'  Item
'  NewEnum
'  Remove
'Example:
' dim variable as Long
' variable = me.Count
Public Property Get Count() As Long
    
    Count = mCol.Count
End Property

'Parameters:
'[IN]   vntIndexKey , тип параметра: Variant  - ...
'See Also:
'  Add
'  Count
'  Item
'  NewEnum
'Example:
'  call me.Remove(...параметры...)
Public Sub Remove(ByVal vntIndexKey As Variant)
    On Error Resume Next
    mCol.Remove vntIndexKey
End Sub

'Parameters:
' параметров нет
'Returns:
'  объект класса IUnknown
'  ,или Nothing
'See Also:
'  Add
'  Count
'  Item
'  Remove
'Example:
' dim variable as IUnknown
' Set variable = me.NewEnum
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

