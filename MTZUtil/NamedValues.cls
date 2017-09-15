VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "NamedValues"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 280
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"NamedValue"
Attribute VB_Ext_KEY = "Member0" ,"NamedValue"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit
'Коллекция именованных значений

'local variable to hold ACollection
Private mCol As Collection
Private sortIndex() As Long
Private sortValue()
Private sorted As Boolean
'добавить
'Parameters:
'[IN]   TheName , тип параметра: String - ключ,
'[IN]   Value , тип параметра: Variant  - значение
'Returns:
'  объект класса NamedValue
'  ,или Nothing
'See Also:
'  Count
'  Item
'  Remove
'Example:
' dim variable as NamedValue
' Set variable = me.Add(<параметры>)
Public Function Add(ByVal TheName As String, ByVal Value As Variant) As NamedValue
Attribute Add.VB_HelpID = 285
    'create a new object
    On Error Resume Next
    Dim objNewMember As NamedValue
    Set objNewMember = New NamedValue

    objNewMember.TheName = UCase(TheName)
    If IsObject(Value) Then
        Set objNewMember.Value = Value
    Else
        objNewMember.Value = Value
    End If
    mCol.Add objNewMember, UCase(TheName)


    'return the object created
    Set Add = objNewMember
    Set objNewMember = Nothing
    sorted = False
End Function
'получить из коллекции
'Parameters:
'[IN]   vntIndexKey , тип параметра: Variant  - ключ
'Returns:
'  объект класса NamedValue
'  ,или Nothing
'See Also:
'  Add
'  Count
'  Remove
'Example:
' dim variable as NamedValue
' Set variable = me.Item(<параметры>)
Public Property Get Item(ByVal vntIndexKey As Variant) As NamedValue
Attribute Item.VB_HelpID = 295
Attribute Item.VB_UserMemId = 0
Attribute Item.VB_MemberFlags = "200"
  If IsNumeric(vntIndexKey) Then
      Set Item = mCol(vntIndexKey)
  Else
      Set Item = mCol(UCase(vntIndexKey))
  End If
End Property
'кол-во
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
Attribute Count.VB_HelpID = 290
    'used when retrieving the number of elements in the
    'ACollection. Syntax: Debug.Print x.Count
    Count = mCol.Count
End Property
'удалить из коллекции
'Parameters:
'[IN]   vntIndexKey , тип параметра: Variant  - индекс
'See Also:
'  Add
'  Count
'  Item
'Example:
'  call me.Remove(<параметры>)
Public Sub Remove(ByVal vntIndexKey As Variant)
Attribute Remove.VB_HelpID = 305
    'used when removing an element from the ACollection
    'vntIndexKey contains either the Index or Key, which is why
    'it is declared as a Variant
    'Syntax: x.Remove(xyz)

    If IsNumeric(vntIndexKey) Then
      mCol.Remove vntIndexKey
    Else
      mCol.Remove UCase(vntIndexKey)
    End If
    sorted = False
End Sub




Private Sub Class_Initialize()
    'creates the ACollection when this class is created
    Set mCol = New Collection
End Sub


Private Sub Class_Terminate()
    'destroys ACollection when this class is terminated
    Set mCol = Nothing
    Erase sortIndex
End Sub

'Parameters:
' параметров нет
'See Also:
'  Add
'  Count
'  Item
'  ItemByValueIndex
'  Remove
'Example:
'  call me.SortValues()
Public Sub SortValues()
Attribute SortValues.VB_HelpID = 310
  sorted = False
  If mCol.Count > 0 Then
    ReDim sortIndex(1 To mCol.Count)
    ReDim sortValue(1 To mCol.Count)
    Dim i As Long
    For i = 1 To mCol.Count
      sortValue(i) = mCol.Item(i).Value
      sortIndex(i) = i
    Next
    qsort 1, mCol.Count
    Erase sortValue
    sorted = True
  End If
End Sub
'получить по номеру
'Parameters:
'[IN]   Index , тип параметра: Long  - номер
'Returns:
'  объект класса NamedValue
'  ,или Nothing
'See Also:
'  Add
'  Count
'  Item
'  Remove
'  SortValues
'Example:
' dim variable as NamedValue
' Set variable = me.ItemByValueIndex(<параметры>)
Public Function ItemByValueIndex(ByVal Index As Long) As NamedValue
Attribute ItemByValueIndex.VB_HelpID = 300
  On Error GoTo bye
  If sorted Then
    Set ItemByValueIndex = Item(sortIndex(Index))
  End If
bye:
End Function

Private Sub qsort(l As Long, r As Long)
Dim i As Long, j As Long, x, y
On Error GoTo bye
i = l
j = r
x = sortValue((l + r) \ 2)
  Do
    While sortValue(i) < x
    i = i + 1
    Wend
    While x < sortValue(j)
     j = j - 1
    Wend
    If i <= j Then
      y = sortValue(i)
      sortValue(i) = sortValue(j)
      sortValue(j) = y
      
      y = sortIndex(i)
      sortIndex(i) = sortIndex(j)
      sortIndex(j) = y
      i = i + 1
      j = j - 1
    End If
  Loop Until i > j
  If l < j Then qsort l, j
  If i < r Then qsort i, r
bye:
End Sub
