VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "StatusColors"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"StatusColor"
Attribute VB_Ext_KEY = "Member0" ,"StatusColor"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

'local variable to hold collection
Private mCol As Collection

'Parameters:
'[IN][OUT]  RowBackColor , тип параметра: Long,
'[IN][OUT]   RowForeColor , тип параметра: Long,
'[IN][OUT]   StatusName , тип параметра: String  - ...
'Returns:
'  объект класса StatusColor
'  ,или Nothing
'See Also:
'  Count
'  Item
'  NewEnum
'  Remove
'Example:
' dim variable as StatusColor
' Set variable = me.Add(...параметры...)
Public Function Add(RowBackColor As Long, RowForeColor As Long, StatusName As String) As StatusColor
    'create a new object
    Dim objNewMember As StatusColor
    On Error Resume Next
    
    Set objNewMember = Nothing
    Set objNewMember = mCol.Item(StatusName)
    
    If objNewMember Is Nothing Then
      Set objNewMember = New StatusColor
      mCol.Add objNewMember, StatusName
    End If
  
    'set the properties passed into the method
    objNewMember.RowBackColor = RowBackColor
    objNewMember.RowForeColor = RowForeColor
    objNewMember.StatusName = StatusName
    
  
    

    'return the object created
    Set Add = objNewMember
    Set objNewMember = Nothing


End Function

'Parameters:
'[IN][OUT]  vntIndexKey , тип параметра: Variant  - ...
'Returns:
'  объект класса StatusColor
'  ,или Nothing
'See Also:
'  Add
'  Count
'  NewEnum
'  Remove
'Example:
' dim variable as StatusColor
' Set variable = me.Item(...параметры...)
Public Property Get Item(vntIndexKey As Variant) As StatusColor
Attribute Item.VB_UserMemId = 0
Attribute Item.VB_MemberFlags = "200"
    'used when referencing an element in the collection
    'vntIndexKey contains either the Index or Key to the collection,
    'this is why it is declared as a Variant
    'Syntax: Set foo = x.Item(xyz) or Set foo = x.Item(5)
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
    'used when retrieving the number of elements in the
    'collection. Syntax: Debug.Print x.Count
    Count = mCol.Count
End Property

'Parameters:
'[IN][OUT]  vntIndexKey , тип параметра: Variant  - ...
'See Also:
'  Add
'  Count
'  Item
'  NewEnum
'Example:
'  call me.Remove(...параметры...)
Public Sub Remove(vntIndexKey As Variant)
    'used when removing an element from the collection
    'vntIndexKey contains either the Index or Key, which is why
    'it is declared as a Variant
    'Syntax: x.Remove(xyz)


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

