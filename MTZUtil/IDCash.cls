VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "IDCash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 160
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"IDCashItem"
Attribute VB_Ext_KEY = "Member0" ,"IDCashItem"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit
'Коллекция -кеш идентификаторов

Private mCol As Collection

'Parameters:
'[IN][OUT]  ID , тип параметра: String  - ...
'Returns:
'  объект класса IDCashItem
'  ,или Nothing
'See Also:
'  Count
'  Item
'  Remove
'Example:
' dim variable as IDCashItem
' Set variable = me.Add(<параметры>)
Public Function Add(ID As String) As IDCashItem
Attribute Add.VB_HelpID = 165
    Dim objNewMember As IDCashItem
    Set objNewMember = New IDCashItem
    objNewMember.ID = ID
    mCol.Add objNewMember, ID
    Set Add = objNewMember
    Set objNewMember = Nothing
End Function

'Parameters:
'[IN]   vntIndexKey , тип параметра: Variant  - ...
'Returns:
'  объект класса IDCashItem
'  ,или Nothing
'See Also:
'  Add
'  Count
'  Remove
'Example:
' dim variable as IDCashItem
' Set variable = me.Item(<параметры>)
Public Property Get Item(ByVal vntIndexKey As Variant) As IDCashItem
Attribute Item.VB_HelpID = 175
Attribute Item.VB_UserMemId = 0
Attribute Item.VB_MemberFlags = "200"
  Set Item = mCol(vntIndexKey)
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа Long
'See Also:
'  Add
'  Item
'  Remove
'Example:
' dim variable as Long
' variable = me.Count
Public Property Get Count() As Long
Attribute Count.VB_HelpID = 170
    Count = mCol.Count
End Property

'Parameters:
'[IN]   vntIndexKey , тип параметра: Variant  - ...
'See Also:
'  Add
'  Count
'  Item
'Example:
'  call me.Remove(<параметры>)
Public Sub Remove(ByVal vntIndexKey As Variant)
Attribute Remove.VB_HelpID = 180
    mCol.Remove vntIndexKey
End Sub




Private Sub Class_Initialize()
    Set mCol = New Collection
End Sub


Private Sub Class_Terminate()
    Set mCol = Nothing
End Sub

