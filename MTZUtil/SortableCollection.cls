VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "SortableCollection"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 430
Option Explicit
'Коллекция с возможностью сортировки по полю хранимого объекта


Private mCol As Collection
Private map() As Long
Private sortcash() As Variant
Private mSortName As String
Private Resort As Boolean

Private utl As New Utility
Dim m_Parent As Object
Dim m_Application As Object

Private Sub qsort(ByVal Name As String, ByVal l As Long, ByVal r As Long)
  On Error GoTo bye
  Dim i As Long, j As Long, x, y
  i = l
  j = r
  x = sortcash(map((l + r) \ 2))
  Do
    While sortcash(map(i)) < x
     i = i + 1
    Wend
    While x < sortcash(map(j))
     j = j - 1
    Wend
    If i <= j Then
      If i < j Then
        y = map(i)
        map(i) = map(j)
        map(j) = y
      End If
      i = i + 1
      j = j - 1
    End If
  Loop Until i > j
  If l < j Then qsort Name, l, j
  If i < r Then qsort Name, i, r
  Exit Sub
bye:
End Sub

'очистить коллекцию
'Parameters:
' параметров нет
'See Also:
'  Add
'  AddItem
'  CloseParents
'  Count
'  DirectItem
'  Item
'  Remove
'Example:
'  call me.Clear()
Public Sub Clear()
Attribute Clear.VB_HelpID = 450
  Set mCol = Nothing
  Set mCol = New Collection
  Erase map
  Erase sortcash
  Resort = False
  mSortName = ""
End Sub

'сортировать по полю хранимого элемента
'Parameters:
'[IN]   PropName , тип параметра: String  - название свойства
'See Also:
'  DirectItem
'  GetEQ
'  GetEQPos
'  GetGE
'  GetGEPos
'  GetGT
'  GetGTPos
'  GetLE
'  GetLEPos
'  GetLT
'  GetLTPos
'  Item
'  SortName
'Example:
'  call me.Sort(<параметры>)
Public Sub Sort(ByVal PropName As String)
Attribute Sort.VB_HelpID = 535
  On Error Resume Next
  ReDim map(0 To mCol.Count)
  
  mSortName = PropName
  If PropName <> "" Then
    ReDim sortcash(0 To mCol.Count)
  End If
  Dim i As Long, o As Object
  For i = 1 To mCol.Count
    map(i) = i
    If PropName <> "" Then
      Err.Clear
      sortcash(i) = CallByName(mCol.Item(i), PropName, VbGet)
      If (Err.Number <> 0) Then
        sortcash(i) = CallByName(mCol.Item(i), PropName, VbMethod)
      End If
    End If
  Next
  mSortName = PropName
  If PropName <> "" Then
    qsort PropName, 1, Count
    Erase sortcash
  End If
  Resort = False
End Sub

Private Sub Class_Initialize()
  Set mCol = New Collection
End Sub

Private Sub Class_Terminate()
  Set mCol = Nothing
  Erase map
End Sub

'Получить элемент по индексу
'Parameters:
'[IN]   ID , тип параметра: Variant  - индекс (если число, то в порядке сортировки, иначе как обычно)
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  Add
'  AddItem
'  Count
'  DirectItem
'  Remove
'  Sort
'  SortName
'Example:
' dim variable as Object
' Set variable = me.Item(<параметры>)
Public Function Item(ByVal ID As Variant) As Object
Attribute Item.VB_HelpID = 520
 On Error Resume Next
 If IsNumeric(ID) Then
    If Resort Then Sort mSortName
    Set Item = mCol.Item(map(ID))
 Else
    Set Item = mCol.Item(ID)
 End If
 
End Function

'Получить элемент игнорируя сортировку
'Parameters:
'[IN]   ID , тип параметра: Variant  - индекс
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  Add
'  AddItem
'  Count
'  Item
'  Remove
'  Sort
'  SortName
'Example:
' dim variable as Object
' Set variable = me.DirectItem(<параметры>)
Public Function DirectItem(ByVal ID As Variant) As Object
Attribute DirectItem.VB_HelpID = 465
  On Error Resume Next
  Set DirectItem = mCol.Item(ID)
End Function

'Создать новый элемент зная имя класса и идентификатор
'Parameters:
'[IN]   ItemClassName , тип параметра: String - имя класса,
'[IN][OUT]   Optional ID , тип параметра: String = ""  - идентификатор
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  AddItem
'  Clear
'  Count
'  DirectItem
'  Item
'  Remove
'Example:
' dim variable as Object
' Set variable = me.Add(<параметры>)
Public Function Add(ByVal ItemClassName As String, Optional ID As String = "") As Object
Attribute Add.VB_HelpID = 435
 Dim o As Object, LID As String
 If ID = "" Then
   LID = utl.CreateGUID2()
 Else
   LID = Left(ID, 38)
 End If
 
 On Error Resume Next
 If mCol.Count > 0 Then
   If mCol.Item(LID) Is Nothing Then
   GoTo addnew
   Else
     Set Add = mCol.Item(LID)
     Set o = Nothing
     Exit Function
   End If
 End If
addnew:
  Set o = CreateObject(ItemClassName)
  mCol.Add o, LID
  o.ID = LID
  ReDim Preserve map(0 To mCol.Count)
  map(mCol.Count) = mCol.Count
  If mSortName <> "" Then Resort = True
  Set Add = o
  Set o = Nothing
End Function

'Добавить объект в коллекцию
'Parameters:
'[IN][OUT]  o , тип параметра: Object - объект,
'[IN][OUT]   Optional ID , тип параметра: String = ""  - идентификатор
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  Add
'  Clear
'  Count
'  DirectItem
'  Item
'  Remove
'Example:
' dim variable as Object
' Set variable = me.AddItem(<параметры>)
Public Function AddItem(o As Object, Optional ID As String = "") As Object
Attribute AddItem.VB_HelpID = 440
 Dim LID As String
 If ID = "" Then
   LID = utl.CreateGUID2()
 Else
   LID = Left(ID, 38)
 End If
 
 On Error Resume Next
 If mCol.Count > 0 Then
   If mCol.Item(LID) Is Nothing Then
   GoTo addnew
   Else
     Set AddItem = mCol.Item(LID)
     Exit Function
   End If
 End If
addnew:
  mCol.Add o, LID
  o.ID = LID
  ReDim Preserve map(0 To mCol.Count)
  map(mCol.Count) = mCol.Count
  If mSortName <> "" Then Resort = True
  Set AddItem = o
  'Set o = Nothing
End Function

'Количество элементов
'Parameters:
' параметров нет
'Returns:
'  значение типа Long
'See Also:
'  Add
'  AddItem
'  Clear
'  CloseParents
'  DirectItem
'  Item
'  Remove
'Example:
' dim variable as Long
' variable = me.Count
Public Property Get Count() As Long
Attribute Count.VB_HelpID = 460
    Count = mCol.Count
End Property

'Удалить из коллекции
'Parameters:
'[IN]   vntIndexKey , тип параметра: Variant  - индекс
'See Also:
'  Add
'  AddItem
'  Clear
'  Count
'  DirectItem
'  Item
'Example:
'  call me.Remove(<параметры>)
Public Sub Remove(ByVal vntIndexKey As Variant)
Attribute Remove.VB_HelpID = 530
    On Error Resume Next
    
    Dim i As Long, ID As String, pos As Long
    Dim mpos As Long
    Dim o As Object
    Set o = Nothing
    Set o = Item(vntIndexKey)
    If o Is Nothing Then Exit Sub
    
    
    
    ' search for position in collection
    For i = 1 To mCol.Count
      If DirectItem(i) Is o Then
        pos = i
        Exit For
      End If
    Next
    
    
    
    ' search for position in map
    For i = 1 To mCol.Count
      If map(i) = pos Then
        mpos = i
        Exit For
      End If
    Next
    'Debug.Print "befor", map(1), map(2), map(3), map(4), map(5), map(6), map(7)
    
    ' renumbering
    For i = 1 To mCol.Count
      If map(i) > pos Then
        map(i) = map(i) - 1
      End If
    Next
    
    'Debug.Print "decr", map(1), map(2), map(3), map(4), map(5), map(6), map(7)
    
    ' delete position from map
    For i = mpos To mCol.Count - 1
      map(i) = map(i + 1)
    Next
    
    'Debug.Print "shift", map(1), map(2), map(3), map(4), map(5), map(6), map(7)
    ' remove item from collection
    mCol.Remove pos
    
    ' trancate map array
    ReDim Preserve map(0 To mCol.Count)
    
    Set o = Nothing
    
End Sub

'Ссылка на родительский объект
'Parameters:
'[IN][OUT]  newParent , тип параметра: Object  - родительский объект
'See Also:
'  Application
'  CloseParents
'Example:
' dim value as Variant
' set value = <объект>
' set me.Parent = value
Public Property Set Parent(newParent As Object)
  Set m_Parent = newParent
End Property

'Ссылка на родительский объект
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  Application
'  CloseParents
'Example:
' dim variable as Object
' Set variable = me.Parent
Public Property Get Parent() As Object
Attribute Parent.VB_HelpID = 525
  Set Parent = m_Parent
End Property

'Ссылка на объект - приложение
'Parameters:
'[IN][OUT]  newApplication , тип параметра: Object  - объект - приложение
'See Also:
'  CloseParents
'  Parent
'Example:
' dim value as Variant
' set value = <объект>
' set me.Application = value
Public Property Set Application(newApplication As Object)
  Set m_Application = newApplication
End Property

'Ссылка на объект - приложение
'Parameters:
' параметров нет
'Returns:
'  объект - приложение
'  ,или Nothing
'See Also:
'  CloseParents
'  Parent
'Example:
' dim variable as Object
' Set variable = me.Application
Public Property Get Application() As Object
Attribute Application.VB_HelpID = 445
 If m_Parent Is Nothing Then
    Set Application = Me
  Else
    Set Application = m_Application
  End If
End Property

'Очистить ссылки на родительские объекты
'Parameters:
' параметров нет
'See Also:
'  Application
'  Parent
'Example:
'  call me.CloseParents()
Public Sub CloseParents()
Attribute CloseParents.VB_HelpID = 455
  Set m_Application = Nothing
  Set m_Parent = Nothing
End Sub

'Имя свойства по которому установлена сортировка
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'  DirectItem
'  GetEQ
'  GetEQPos
'  GetGE
'  GetGEPos
'  GetGT
'  GetGTPos
'  GetLE
'  GetLEPos
'  GetLT
'  GetLTPos
'  Item
'  Sort
'Example:
' dim variable as Variant
' variable = me.SortName
' Set variable = me.SortName
Public Property Get SortName()
Attribute SortName.VB_HelpID = 540
  SortName = mSortName
End Property

'Индекс элемента свойство, которого  больше значения
'Parameters:
'[IN]   V , тип параметра: Variant  - значение
'Returns:
'  значение типа Long
'See Also:
'  DirectItem
'  GetEQ
'  GetEQPos
'  GetGE
'  GetGEPos
'  GetGT
'  GetLE
'  GetLEPos
'  GetLT
'  GetLTPos
'  Item
'  Sort
'  SortName
'Example:
' dim variable as Long
' variable = me.GetGTPos(<параметры>)
Public Function GetGTPos(ByVal v As Variant) As Long
Attribute GetGTPos.VB_HelpID = 495
Dim l As Long, r As Long, pos As Long, stp As Long, prevpos As Long
Dim f As Long, t As Long, i As Long
Dim Greater As Boolean, OK As Boolean

GetGTPos = -1


If mSortName = "" Then Exit Function
If Resort Then Sort mSortName

If mCol.Count = 0 Then Exit Function
l = 1
r = mCol.Count
pos = (l + r) / 2
stp = (l + r) / 4

Greater = (CallByName(Item(pos), mSortName, VbGet) > v)
prevpos = pos

While Not OK
  If CallByName(Item(pos), mSortName, VbGet) > v Then
    If Not Greater Then
      If Abs(pos - prevpos) < 10 Then
        If prevpos < pos Then
          f = prevpos
          t = pos
        Else
          f = pos
          t = prevpos
        End If
        For i = f To t
          If CallByName(Item(i), mSortName, VbGet) > v Then
            GetGTPos = i
            Exit Function
          End If
        Next
      End If
    End If
    Greater = True
    prevpos = pos
    pos = pos - stp
  Else
    If Greater Then
      If Abs(pos - prevpos) < 10 Then
        If prevpos < pos Then
          f = prevpos
          t = pos
        Else
          f = pos
          t = prevpos
        End If
        For i = f To t
          If CallByName(Item(i), mSortName, VbGet) > v Then
            GetGTPos = i
            Exit Function
          End If
        Next
      End If
    End If
    Greater = False
    prevpos = pos
    pos = pos + stp
  End If
  If stp \ 2 = 0 Then
    stp = 1
  Else
    stp = stp \ 2
  End If
  If pos > mCol.Count Then
    Exit Function
  End If
  If pos <= 1 Then
    GetGTPos = 1
    Exit Function
  End If
Wend


End Function

'Индекс элемента свойство, которого  меньше значения
'Parameters:
'[IN]   V , тип параметра: Variant  - значение
'Returns:
'  значение типа Long
'See Also:
'  DirectItem
'  GetEQ
'  GetEQPos
'  GetGE
'  GetGEPos
'  GetGT
'  GetGTPos
'  GetLE
'  GetLEPos
'  GetLT
'  Item
'  Sort
'  SortName
'Example:
' dim variable as Long
' variable = me.GetLTPos(<параметры>)
Public Function GetLTPos(ByVal v As Variant) As Long
Attribute GetLTPos.VB_HelpID = 515
Dim l As Long, r As Long, pos As Long, stp As Long, prevpos As Long
Dim f As Long, t As Long, i As Long
Dim Less As Boolean, OK As Boolean

If mSortName = "" Then Exit Function
If Resort Then Sort mSortName
If mCol.Count = 0 Then Exit Function

GetLTPos = -1

l = 1
r = mCol.Count
pos = (l + r) / 2
stp = (l + r) / 4

Less = (CallByName(Item(pos), mSortName, VbGet) < v)
prevpos = pos

While Not OK
  If CallByName(Item(pos), mSortName, VbGet) < v Then
    If Not Less Then
      If Abs(pos - prevpos) < 10 Then
        If prevpos < pos Then
          f = prevpos
          t = pos
        Else
          f = pos
          t = prevpos
        End If
        For i = t To f Step -1
          If CallByName(Item(i), mSortName, VbGet) < v Then
            GetLTPos = i
            Exit Function
          End If
        Next
      End If
    End If
    Less = True
    prevpos = pos
    pos = pos + stp
  Else
    If Less Then
      If Abs(pos - prevpos) < 10 Then
        If prevpos < pos Then
          f = prevpos
          t = pos
        Else
          f = pos
          t = prevpos
        End If
        For i = t To f Step -1
          If CallByName(Item(i), mSortName, VbGet) < v Then
            GetLTPos = i
            Exit Function
          End If
        Next
      End If
    End If
    Less = False
    prevpos = pos
    pos = pos - stp
  End If
  If stp \ 2 = 0 Then
    stp = 1
  Else
    stp = stp \ 2
  End If
  If pos < 1 Then
    Exit Function
  End If
  If pos >= mCol.Count Then
    GetLTPos = mCol.Count
    Exit Function
  End If
Wend
End Function

'Индекс элемента свойство, которого  равно значению
'Parameters:
'[IN]   V , тип параметра: Variant  - значение
'Returns:
'  значение типа Long
'See Also:
'  Count
'  DirectItem
'  GetEQ
'  GetGE
'  GetGEPos
'  GetGT
'  GetGTPos
'  GetLE
'  GetLEPos
'  GetLT
'  GetLTPos
'  Item
'  Sort
'  SortName
'Example:
' dim variable as Long
' variable = me.GetEQPos(<параметры>)
Public Function GetEQPos(ByVal v As Variant) As Long
Attribute GetEQPos.VB_HelpID = 475
Dim l As Long, r As Long, pos As Long, stp As Long, prevpos As Long
Dim f As Long, t As Long, i As Long
Dim Greater As Boolean, OK As Boolean
On Error GoTo bye

GetEQPos = -1

If mSortName = "" Then Exit Function
If Resort Then Sort mSortName

If mCol.Count = 0 Then Exit Function
l = 1
r = mCol.Count
pos = (l + r) / 2
stp = (l + r) / 4


Greater = (CallByName(Item(pos), mSortName, VbGet) > v)
prevpos = pos

While Not OK
  If CallByName(Item(pos), mSortName, VbGet) = v Then
      GetEQPos = pos
      Exit Function
  End If
  If CallByName(Item(pos), mSortName, VbGet) > v Then
    If Not Greater Then
      If Abs(pos - prevpos) < 10 Then
        If prevpos < pos Then
          f = prevpos
          t = pos
        Else
          f = pos
          t = prevpos
        End If
        For i = f To t
          If CallByName(Item(i), mSortName, VbGet) = v Then
            GetEQPos = i
            Exit Function
          End If
        Next
        Exit Function
      End If
    End If
    Greater = True
    prevpos = pos
    pos = pos - stp
  Else
    If Greater Then
      If Abs(pos - prevpos) < 10 Then
        If prevpos < pos Then
          f = prevpos
          t = pos
        Else
          f = pos
          t = prevpos
        End If
        For i = f To t
          If CallByName(Item(i), mSortName, VbGet) = v Then
            GetEQPos = i
            Exit Function
          End If
        Next
        Exit Function
      End If
    End If
    Greater = False
    prevpos = pos
    pos = pos + stp
  End If
  If stp \ 2 = 0 Then
    stp = 1
  Else
    stp = stp \ 2
  End If
  If pos > mCol.Count Then
    Exit Function
  End If
  If pos < 1 Then
    Exit Function
  End If
Wend
bye:
End Function

'Индекс элемента свойство, которого  больши или равно значению
'Parameters:
'[IN]   V , тип параметра: Variant  - значение
'Returns:
'  значение типа Long
'See Also:
'  Count
'  DirectItem
'  GetEQ
'  GetEQPos
'  GetGE
'  GetGT
'  GetGTPos
'  GetLE
'  GetLEPos
'  GetLT
'  GetLTPos
'  Item
'  Sort
'  SortName
'Example:
' dim variable as Long
' variable = me.GetGEPos(<параметры>)
Public Function GetGEPos(ByVal v As Variant) As Long
Attribute GetGEPos.VB_HelpID = 485
On Error GoTo bye
  Dim o As Long
  o = GetEQPos(v)
  If o > 0 Then
    GetGEPos = o
    Exit Function
  End If

  GetGEPos = GetGTPos(v)
bye:
End Function

'Индекс элемента свойство, которого  меньше или равно значению
'Parameters:
'[IN]   V , тип параметра: Variant  - значение
'Returns:
'  значение типа Long
'See Also:
'  Count
'  DirectItem
'  GetEQ
'  GetEQPos
'  GetGE
'  GetGEPos
'  GetGT
'  GetGTPos
'  GetLE
'  GetLT
'  GetLTPos
'  Item
'  Sort
'  SortName
'Example:
' dim variable as Long
' variable = me.GetLEPos(<параметры>)
Public Function GetLEPos(ByVal v As Variant) As Long
Attribute GetLEPos.VB_HelpID = 505
On Error GoTo bye
  Dim o As Long
  o = GetEQPos(v)
  If o > 0 Then
    GetLEPos = o
    Exit Function
  End If

  GetLEPos = GetLTPos(v)
bye:
End Function

'Элемент свойство, которого  меньше значения
'Parameters:
'[IN]   V , тип параметра: Variant  - значение
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  Count
'  DirectItem
'  GetEQ
'  GetEQPos
'  GetGE
'  GetGEPos
'  GetGTPos
'  GetLE
'  GetLEPos
'  GetLT
'  GetLTPos
'  Item
'  Sort
'  SortName
'Example:
' dim variable as Object
' Set variable = me.GetGT(<параметры>)
Public Function GetGT(ByVal v As Variant) As Object
Attribute GetGT.VB_HelpID = 490
Dim l As Long
l = GetGTPos(v)
If l > 0 Then
  Set GetGT = Item(l)
End If
End Function

'Элемент свойство, которого  больше значения
'Parameters:
'[IN]   V , тип параметра: Variant  - значение
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  Count
'  DirectItem
'  GetEQ
'  GetEQPos
'  GetGE
'  GetGEPos
'  GetGT
'  GetGTPos
'  GetLE
'  GetLEPos
'  GetLTPos
'  Item
'  Sort
'  SortName
'Example:
' dim variable as Object
' Set variable = me.GetLT(<параметры>)
Public Function GetLT(ByVal v As Variant) As Object
Attribute GetLT.VB_HelpID = 510
  Dim l As Long
  l = GetLTPos(v)
  If l > 0 Then
    Set GetLT = Item(l)
  End If
End Function

'Элемент свойство, которого  равно значению
'Parameters:
'[IN]   V , тип параметра: Variant  - значение
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  Count
'  DirectItem
'  GetEQPos
'  GetGE
'  GetGEPos
'  GetGT
'  GetGTPos
'  GetLE
'  GetLEPos
'  GetLT
'  GetLTPos
'  Item
'  Sort
'  SortName
'Example:
' dim variable as Object
' Set variable = me.GetEQ(<параметры>)
Public Function GetEQ(ByVal v As Variant) As Object
Attribute GetEQ.VB_HelpID = 470
  Dim l As Long
  l = GetEQPos(v)
  If l > 0 Then
    Set GetEQ = Item(l)
  End If
End Function

'Элемент свойство, которого  больше или равно значения
'Parameters:
'[IN]   V , тип параметра: Variant  - значение
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  Count
'  DirectItem
'  GetEQ
'  GetEQPos
'  GetGEPos
'  GetGT
'  GetGTPos
'  GetLE
'  GetLEPos
'  GetLT
'  GetLTPos
'  Item
'  Sort
'  SortName
'Example:
' dim variable as Object
' Set variable = me.GetGE(<параметры>)
Public Function GetGE(ByVal v As Variant) As Object
Attribute GetGE.VB_HelpID = 480
  Dim l As Long
  l = GetGEPos(v)
  If l > 0 Then
    Set GetGE = Item(l)
  End If

End Function

'Элемент свойство, которого  меньше значения
'Parameters:
'[IN]   V , тип параметра: Variant  - значение
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  Count
'  DirectItem
'  GetEQ
'  GetEQPos
'  GetGE
'  GetGEPos
'  GetGT
'  GetGTPos
'  GetLEPos
'  GetLT
'  GetLTPos
'  Item
'  Sort
'  SortName
'Example:
' dim variable as Object
' Set variable = me.GetLE(<параметры>)
Public Function GetLE(ByVal v As Variant) As Object
Attribute GetLE.VB_HelpID = 500
  Dim l As Long
  l = GetLEPos(v)
  If l > 0 Then
    Set GetLE = Item(l)
  End If
End Function







