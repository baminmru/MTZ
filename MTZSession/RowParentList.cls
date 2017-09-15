VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "RowParentList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 205
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"RowParentItem"
Attribute VB_Ext_KEY = "Member0" ,"RowParentItem"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

'local variable to hold collection
Private mCol As Collection
'добавить в коллекцию
'Parameters:
'[IN][OUT]  RowID , тип параметра: String -идентификатор строки,
'[IN][OUT]   PartName , тип параметра: String - раздел,
'[IN][OUT]   Optional sKey , тип параметра: String  - ключ
'Returns:
'  объект класса RowParentItem
'  ,или Nothing
'See Also:
'  Count
'  Item
'  NewEnum
'  Remove
'Example:
' dim variable as RowParentItem
' Set variable = me.Add(...параметры...)
Public Function Add(RowID As String, PartName As String, Optional sKey As String) As RowParentItem
Attribute Add.VB_HelpID = 210
    'create a new object
    Dim objNewMember As RowParentItem
    Set objNewMember = New RowParentItem


    'set the properties passed into the method
    objNewMember.RowID = RowID
    objNewMember.PartName = PartName
    If Len(sKey) = 0 Then
        mCol.Add objNewMember
    Else
        mCol.Add objNewMember, sKey
    End If


    'return the object created
    Set Add = objNewMember
    Set objNewMember = Nothing


End Function
'получить элемент по ключу
'Parameters:
'[IN][OUT]  vntIndexKey , тип параметра: Variant  - ключ
'Returns:
'  объект класса RowParentItem
'  ,или Nothing
'See Also:
'  Add
'  Count
'  NewEnum
'  Remove
'Example:
' dim variable as RowParentItem
' Set variable = me.Item(...параметры...)
Public Property Get Item(vntIndexKey As Variant) As RowParentItem
Attribute Item.VB_HelpID = 220
Attribute Item.VB_UserMemId = 0
Attribute Item.VB_MemberFlags = "200"
    'used when referencing an element in the collection
    'vntIndexKey contains either the Index or Key to the collection,
    'this is why it is declared as a Variant
    'Syntax: Set foo = x.Item(xyz) or Set foo = x.Item(5)
  Set Item = mCol(vntIndexKey)
End Property
'кол-во
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
Attribute Count.VB_HelpID = 215
    'used when retrieving the number of elements in the
    'collection. Syntax: Debug.Print x.Count
    Count = mCol.Count
End Property
' удалить из коллекции
'Parameters:
'[IN][OUT]  vntIndexKey , тип параметра: Variant  - ключ
'See Also:
'  Add
'  Count
'  Item
'  NewEnum
'Example:
'  call me.Remove(...параметры...)
Public Sub Remove(vntIndexKey As Variant)
Attribute Remove.VB_HelpID = 230
    'used when removing an element from the collection
    'vntIndexKey contains either the Index or Key, which is why
    'it is declared as a Variant
    'Syntax: x.Remove(xyz)


    mCol.Remove vntIndexKey
End Sub
'итератор
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
Attribute NewEnum.VB_HelpID = 225
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

