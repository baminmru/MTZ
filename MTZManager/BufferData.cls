VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "BufferData"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_HelpID = 10
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"BufferInfo"
Attribute VB_Ext_KEY = "Member0" ,"BufferInfo"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

'local variable to hold collection
Private mCol As Collection
'добавить
'Parameters:
'[IN]   Data , тип параметра: String - данные,
'[IN]   PartName , тип параметра: String  - раздел
'Returns:
'  объект класса BufferInfo
'  ,или Nothing
'See Also:
'  Count
'  Item
'  NewEnum
'  Remove
'Example:
' dim variable as BufferInfo
' Set variable = me.Add(...параметры...)
Public Function Add(ByVal Data As String, ByVal PartName As String) As BufferInfo
Attribute Add.VB_HelpID = 15
    'create a new object
    Dim objNewMember As BufferInfo
    
    Set objNewMember = Nothing
    On Error Resume Next
    
    
    Set objNewMember = mCol.Item(PartName)
    If objNewMember Is Nothing Then
      Set objNewMember = New BufferInfo
      mCol.Add objNewMember, PartName
    End If
    
    'set the properties passed into the method
    objNewMember.Data = Data
    objNewMember.PartName = PartName

    'return the object created
    Set Add = objNewMember
    Set objNewMember = Nothing


End Function
'получить по ключу
'Parameters:
'[IN]   vntIndexKey , тип параметра: Variant  - ключ
'Returns:
'  объект класса BufferInfo
'  ,или Nothing
'See Also:
'  Add
'  Count
'  NewEnum
'  Remove
'Example:
' dim variable as BufferInfo
' Set variable = me.Item(...параметры...)
Public Property Get Item(ByVal vntIndexKey As Variant) As BufferInfo
Attribute Item.VB_HelpID = 25
Attribute Item.VB_UserMemId = 0
Attribute Item.VB_MemberFlags = "200"
  On Error Resume Next
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
Attribute Count.VB_HelpID = 20
    Count = mCol.Count
End Property
' удалить из коллекции
'Parameters:
'[IN]   vntIndexKey , тип параметра: Variant  - ключ
'See Also:
'  Add
'  Count
'  Item
'  NewEnum
'Example:
'  call me.Remove(...параметры...)
Public Sub Remove(ByVal vntIndexKey As Variant)
Attribute Remove.VB_HelpID = 35
    On Error Resume Next
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
Attribute NewEnum.VB_HelpID = 30
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

