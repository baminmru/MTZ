VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CONTRACT_COL"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'раздел Договорные установки
Dim mcol As SortableCollection
Dim m_Parent As Object
Dim m_Application As Application
Dim m_Filter As String
Private m_IsLocked As LockStyle







'Название таблицы раздела
'Parameters:
' параметров нет
'Returns:
'  значение типа string
'See Also:
'Example:
' dim variable as string
' variable = me. ChildPartName
Friend Property Get ChildPartName() As String
  ChildPartName = "CONTRACT"
End Property


'Задать родительский объект в иерархии документа
'Parameters:
'[IN][OUT]  newParent , тип параметра: object  - ...
'See Also:
'Example:
' dim value as Variant
' set value = new Variant
' set me. Parent = value
Friend Property Set Parent(newParent As Object)
  Set m_Parent = newParent
End Property


'Получить родительский объект в иерархии документа
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Parent
Public Property Get Parent() As Object
  Set Parent = m_Parent
End Property


'Задать корневой объект
'Parameters:
'[IN][OUT]  newApplication , тип параметра: object  - ...
'See Also:
'Example:
' dim value as Variant
' set value = new Variant
' set me. Application = value
Friend Property Set Application(newApplication As Object)
  Set m_Application = newApplication
  m_Application.Logger.Message "CONTRACT.Init"
End Property


'Получить корневой объект
'Parameters:
' параметров нет
'Returns:
'  объект класса Application
'  ,или Nothing
'See Also:
'Example:
' dim variable as Application
' Set variable = me. Application
Public Property Get Application() As Application
 If m_Parent Is Nothing Then
    Set Application = Me
  Else
    Set Application = m_Application
  End If
End Property


'Задать дополнительный фильтр коллекции
'Parameters:
'[IN]   newFilter , тип параметра: string  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...значение...
' me. Filter = value
Public Property Let Filter(ByVal newFilter As String)
  m_Filter = newFilter
  Refresh
End Property


'Получить значение фильтра
'Parameters:
' параметров нет
'Returns:
'  значение типа string
'See Also:
'Example:
' dim variable as string
' variable = me. Filter
Public Property Get Filter() As String
    Filter = m_Filter
End Property


'Разрушить иерархическую связку с родительскими объектами
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseParents()
Private Sub CloseParents()
  Set m_Application = Nothing
  Set m_Parent = Nothing
End Sub


'Добавить строку в раздел (но не в базу данных)
'Parameters:
'[IN][OUT]   ID , тип параметра: string=""  - ...
'Returns:
'  объект класса  CONTRACT
'  ,или Nothing
'See Also:
'Example:
' dim variable as  CONTRACT
' Set variable = me.Add(...параметры...)
Public Function Add(Optional ID As String = "") As CONTRACT
 Dim LID As String
 Dim o As CONTRACT
 If ID = "" Then
   LID = CreateGUID2()
 Else
   LID = Left(ID, 38)
 End If
 On Error Resume Next
 If mcol.Count > 0 Then
   If mcol.Item(LID) Is Nothing Then
   GoTo addnew
   Else
     Set Add = mcol.Item(LID)
     Exit Function
   End If
 End If
addnew:
  Set o = New CONTRACT
  o.ID = LID
  o.RowRetrived = False
  Set o.Parent = Me
  Set o.Application = Me.Application
  Me.Application.AddToCash ChildPartName & LID, o
  Set Add = o
  mcol.AddItem o, o.ID
  Set o = Nothing
End Function


'Получить строку раздела
'Parameters:
'[IN]   ID , тип параметра: variant  - ...
'Returns:
'  объект класса CONTRACT
'  ,или Nothing
'See Also:
'Example:
' dim variable as CONTRACT
' Set variable = me.Item(...параметры...)
Public Function Item(ByVal ID As Variant) As CONTRACT
Attribute Item.VB_MemberFlags = "200"
 On Error Resume Next
 Dim o As CONTRACT
 If Not mcol.Item(ID) Is Nothing Then
   Set o = mcol.Item(ID)
   Set Item = o
   Set o = Nothing
   Exit Function
 End If
End Function


'Найти строку по идентификатору в дочерней иерархии
'Parameters:
'[IN]   StrID , тип параметра: string,
'[IN]   InstID , тип параметра: string  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me.FindObject(...параметры...)
Public Function FindObject(ByVal StrID As String, ByVal InstID As String) As Object
 Dim m_FindObject As Object, i As Long
 If StrID = "" Then Exit Function
 If InstID = "" Then Exit Function
 If Not Application.MTZSession.IsDescendant(StrID, ChildPartName) Then Exit Function
 If StrID = ChildPartName Then
   Set m_FindObject = Item(InstID)
   If Not m_FindObject Is Nothing Then GoTo OK
 End If
 For i = 1 To Count
   Set m_FindObject = Item(i).FindObject(StrID, InstID)
   If Not m_FindObject Is Nothing Then Exit For
 Next
OK:
 Set FindObject = m_FindObject
 Set m_FindObject = Nothing
End Function


'Оптимизировать использование памяти
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Compact()
Public Sub Compact()
 Dim i As Long
 For i = 1 To Count
   Item(i).Compact
 Next
End Sub

'Задать поле по которому будем сортировать
'Parameters:
'[IN]   Name , тип параметра: string  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...значение...
' me. Sort = value
Public Property Let Sort(ByVal Name As String)
 mcol.Sort Name
End Property

'Получить значения поля - основы сортировки
'Parameters:
' параметров нет
'Returns:
'  значение типа string
'See Also:
'Example:
' dim variable as string
' variable = me. Sort
Public Property Get Sort() As String
 Sort = mcol.SortName
End Property


'Получить строку в кот. поле сортировки равно значению
'Parameters:
'[IN]   Value , тип параметра: variant  - ...
'Returns:
'  объект класса CONTRACT
'  ,или Nothing
'See Also:
'Example:
' dim variable as CONTRACT
' Set variable = me.GetEQ(...параметры...)
Public Function GetEQ(ByVal Value As Variant) As CONTRACT
   Set GetEQ = mcol.GetEQ(Value)
End Function


'Получить строку в кот. поле сортировки меньше или равно значению
'Parameters:
'[IN]   Value , тип параметра: variant  - ...
'Returns:
'  объект класса CONTRACT
'  ,или Nothing
'See Also:
'Example:
' dim variable as CONTRACT
' Set variable = me.GetLE(...параметры...)
Public Function GetLE(ByVal Value As Variant) As CONTRACT
   Set GetLE = mcol.GetLE(Value)
End Function


'Получить строку в кот. поле сортировки меньше значения
'Parameters:
'[IN]   Value , тип параметра: variant  - ...
'Returns:
'  объект класса CONTRACT
'  ,или Nothing
'See Also:
'Example:
' dim variable as CONTRACT
' Set variable = me.GetLT(...параметры...)
Public Function GetLT(ByVal Value As Variant) As CONTRACT
   Set GetLT = mcol.GetLT(Value)
End Function


'Получить строку в кот. поле сортировки больше или равно значению
'Parameters:
'[IN]   Value , тип параметра: variant  - ...
'Returns:
'  объект класса CONTRACT
'  ,или Nothing
'See Also:
'Example:
' dim variable as CONTRACT
' Set variable = me.GetGE(...параметры...)
Public Function GetGE(ByVal Value As Variant) As CONTRACT
   Set GetGE = mcol.GetGE(Value)
End Function


'Получить строку в кот. поле сортировки больше значения
'Parameters:
'[IN]   Value , тип параметра: variant  - ...
'Returns:
'  объект класса CONTRACT
'  ,или Nothing
'See Also:
'Example:
' dim variable as CONTRACT
' Set variable = me.GetGT(...параметры...)
Public Function GetGT(ByVal Value As Variant) As CONTRACT
   Set GetGT = mcol.GetGT(Value)
End Function


'Получить номер строки в кот. поле сортировки равно значению
'Parameters:
'[IN]   Value , тип параметра: variant  - ...
'Returns:
'  объект класса  long
'  ,или Nothing
'See Also:
'Example:
' dim variable as  long
' Set variable = me.GetEQPos(...параметры...)
Public Function GetEQPos(ByVal Value As Variant) As Long
   GetEQPos = mcol.GetEQPos(Value)
End Function


'Получить номер строки в кот. поле сортировки меньше или равно значению
'Parameters:
'[IN]   Value , тип параметра: variant  - ...
'Returns:
'  объект класса  long
'  ,или Nothing
'See Also:
'Example:
' dim variable as  long
' Set variable = me.GetLEPos(...параметры...)
Public Function GetLEPos(ByVal Value As Variant) As Long
   GetLEPos = mcol.GetLEPos(Value)
End Function


'Получить номер строки в кот. поле сортировки меньше значения
'Parameters:
'[IN]   Value , тип параметра: variant  - ...
'Returns:
'  объект класса  long
'  ,или Nothing
'See Also:
'Example:
' dim variable as  long
' Set variable = me.GetLTPos(...параметры...)
Public Function GetLTPos(ByVal Value As Variant) As Long
   GetLTPos = mcol.GetLTPos(Value)
End Function


'Получить номер строки в кот. поле сортировки больше или равно значению
'Parameters:
'[IN]   Value , тип параметра: variant  - ...
'Returns:
'  объект класса  long
'  ,или Nothing
'See Also:
'Example:
' dim variable as  long
' Set variable = me.GetGEPos(...параметры...)
Public Function GetGEPos(ByVal Value As Variant) As Long
   GetGEPos = mcol.GetGEPos(Value)
End Function


'Получить номер строки в кот. поле сортировки больше значения
'Parameters:
'[IN]   Value , тип параметра: variant  - ...
'Returns:
'  объект класса  long
'  ,или Nothing
'See Also:
'Example:
' dim variable as  long
' Set variable = me.GetGTPos(...параметры...)
Public Function GetGTPos(ByVal Value As Variant) As Long
   GetGTPos = mcol.GetGTPos(Value)
End Function


'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next
 Dim i As Long
 Dim o As CONTRACT
    For i = 1 To mcol.Count
       Set o = mcol.Item(i)
        o.CloseClass
    Next
 If Not Application Is Nothing Then Application.Logger.Message "CONTRACT.CloseClass"
 CloseParents
 Set mcol = Nothing
End Sub


'Инициализация коллекции
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Class_Initialize()
Private Sub Class_Initialize()
 Set mcol = New SortableCollection
End Sub


'Количетсво строк в коллекции
'Parameters:
' параметров нет
'Returns:
'  значение типа Long
'See Also:
'Example:
' dim variable as Long
' variable = me. Count
Public Property Get Count() As Long
    Count = mcol.Count
End Property


'Удалить строку из коллекции
'Parameters:
'[IN]   vntIndexKey , тип параметра: Variant  - ...
'See Also:
'Example:
'  call me.Remove({параметры})
Public Sub Remove(ByVal vntIndexKey As Variant)
    On Error Resume Next
    Me.Application.RemoveFromCash ChildPartName & Item(vntIndexKey).ID
    mcol.Remove vntIndexKey
End Sub


'Сохранить изменения в строке
'Parameters:
'[IN]   vntIndexKey , тип параметра: Variant  - ...
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me.Update(...параметры...)
Public Function Update(ByVal vntIndexKey As Variant) As Boolean
 If Not Item(vntIndexKey) Is Nothing Then
   Update = Item(vntIndexKey).Save
 Else
   Update = False
 End If
End Function


'Удалить строку
'Parameters:
'[IN]   vntIndexKey , тип параметра: Variant  - ...
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me.Delete(...параметры...)
Public Function Delete(ByVal vntIndexKey As Variant) As Boolean
On Error GoTo bye
Dim o As CONTRACT
Set o = Item(vntIndexKey)
If o Is Nothing Then Exit Function
If o.Delete Then
  Delete = True
  mcol.Remove vntIndexKey
End If
Exit Function
bye:
err.Raise err.Number, "Delete", err.Description
End Function


'Обновить
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Refresh()
Public Sub Refresh()
    On Error Resume Next
    Dim mcol2  As SortableCollection
    Set mcol2 = mcol
    Set mcol = Nothing
    Set mcol = New SortableCollection
    Dim rs As ADODB.Recordset
    If Application.WorkOffline Then Exit Sub
    Dim o As CONTRACT
    Dim tmpParent As Object
    Dim tID As String
    Dim SSID As String
    Dim rtime As Date
    rtime = Now
    rtime = Application.MTZSession.GetServerTime()
    If Application.AutoLoadPart Then
    Set rs = Application.MTZSession.GetRows(ChildPartName, Parent.ID, , Filter)
    Else
    Set rs = Application.MTZSession.GetIDs(ChildPartName, Parent.ID, , Filter)
    End If
    If mcol2 Is Nothing Then Set mcol2 = New SortableCollection
    Dim idx As Long
    If Not rs Is Nothing Then ' wrong database structure
    While Not rs.EOF
      If Application.AutoLoadPart Then
        tID = rs!CONTRACTID
      Else
        tID = rs!ID
      End If
      On Error Resume Next
      SSID = rs!SecurityStyleID & ""
      If mcol2.Item(tID) Is Nothing Then
        Set o = Add(tID)
        If Application.AutoLoadPart Then
          o.UnPack rs
          o.RowRetrived = True
          o.RetriveTime = rtime
        End If
      Else
        Set o = mcol2.Item(tID)
        If o.RowRetrived Then
          If o.RetriveTime < rs!ChangeStamp Then
             If Application.AutoLoadPart Then
               o.CleanFields
               o.UnPack rs
               o.RetriveTime = rtime
             Else
               o.RowRetrived = False
             End If
          End If
        Else
          If Application.AutoLoadPart Then
            o.CleanFields
            o.UnPack rs
            o.RetriveTime = rtime
          End If
        End If
        mcol.AddItem o, tID
        mcol2.Remove tID
      End If
      o.SecureStyleID = SSID
    rs.MoveNext
    Wend
    End If ' rs is nothing
    For idx = 1 To mcol2.Count
       Set o = mcol2.Item(idx)
       o.CloseClass
    Next
    Set mcol2 = Nothing
End Sub

'Сохранить данные в структуре XML
'Parameters:
'[IN][OUT]   ParentNode , тип параметра: IXMLDOMElement,
'[IN][OUT]   Xdom , тип параметра: DomDocument  - ...
'See Also:
'Example:
'  call me.XMLSave({параметры})
Public Sub XMLSave(ByRef ParentNode As IXMLDOMElement, Xdom As DOMDocument)
  Dim o As CONTRACT
  Dim i As Long
  Dim pnode As IXMLDOMElement
  Set pnode = Xdom.createElement("CONTRACT_COL")
  pnode.setAttribute "IsLocked", m_IsLocked
  Dim node As IXMLDOMElement
  ParentNode.appendChild pnode
  For i = 1 To Count
    Set o = Item(i)
    Set node = Xdom.createElement("CONTRACT")
    pnode.appendChild node
    o.XMLSave node, Xdom
  Next
End Sub


'Загрузить данные из XML
'Parameters:
'[IN][OUT]   NodeList , тип параметра: IXMLDOMnodeList,
'[IN]   LoadMode , тип параметра: integer=0  - ...
'See Also:
'Example:
'  call me.XMLLoad({параметры})
Public Sub XMLLoad(ByRef NodeList As IXMLDOMNodeList, Optional ByVal LoadMode As Integer = 0)
  On Error Resume Next
  Dim o As CONTRACT
  Dim node As IXMLDOMElement
  Dim pnode As IXMLDOMElement
  NodeList.Reset
  Set pnode = NodeList.nextNode
  m_IsLocked = pnode.Attributes.getNamedItem("IsLocked").nodeValue
  Set NodeList = pnode.selectNodes("CONTRACT")
  Dim bufcol As Collection
  If LoadMode = 1 Then
    Set bufcol = New Collection
  End If
  Set node = NodeList.nextNode
  While Not node Is Nothing
    ' append mode
    If LoadMode = 0 Then
      If Item(node.Attributes.getNamedItem("ID").nodeValue) Is Nothing Then
        Add(node.Attributes.getNamedItem("ID").nodeValue).XMLLoad node, LoadMode
      Else
        Item(node.Attributes.getNamedItem("ID").nodeValue).XMLLoad node, LoadMode
      End If
    End If
    ' replace mode
    If LoadMode = 1 Then
      If Item(node.Attributes.getNamedItem("ID").nodeValue) Is Nothing Then
        Add(node.Attributes.getNamedItem("ID").nodeValue).XMLLoad node, LoadMode
      Else
        Item(node.Attributes.getNamedItem("ID").nodeValue).XMLLoad node, LoadMode
      End If
      bufcol.Add Item(node.Attributes.getNamedItem("ID").nodeValue), node.Attributes.getNamedItem("ID").nodeValue
    End If
    ' copy with new ID mode
    If LoadMode = 2 Then
        Add().XMLLoad node, LoadMode
    End If
    Set node = NodeList.nextNode
  Wend
    ' remove extra items from collection
  If LoadMode = 1 Then
    Dim i As Long
    ' remove existing
removeAgain:
    For i = 1 To Count
      If bufcol.Item(Item(i).ID) Is Nothing Then
        Delete Item(i).ID
        GoTo removeAgain
      End If
    Next
    Set bufcol = Nothing
  End If
End Sub

'может ли быть изменено
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me. CanChange
Public Property Get CanChange() As Boolean
   If Application.WorkOffline Then
     CanChange = CanChangeOffline
   Else
     CanChange = CanChangeONLine
   End If
End Property

'может ли быть изменено в режиме Offline
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me. CanChangeOffline
Public Property Get CanChangeOffline() As Boolean
  Dim test As Boolean
  If Not Parent Is Nothing Then
   test = Parent.CanChangeOffline
  End If
  If Not test Then
   test = (IsLocked = LockPermanent)
  End If
   CanChangeOffline = test
End Property

'может ли быть изменено в режиме ONline
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me. CanChangeONLine
Public Property Get CanChangeONLine() As Boolean
  Dim test As Boolean
  If Not Parent Is Nothing Then
   test = Parent.CanChangeONLine
  End If
  If Not test Then
   test = (IsLocked < ExternalLockSession)
  End If
   CanChangeONLine = test
End Property

'Задать тип блокировки
'Parameters:
'[IN][OUT]  newIsLocked , тип параметра: LockStyle  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...значение...
' me. IsLocked = value
Friend Property Let IsLocked(newIsLocked As LockStyle)
  m_IsLocked = newIsLocked
End Property

'Текущий тип блокировки
'Parameters:
' параметров нет
'Returns:
'  объект класса LockStyle
'  ,или Nothing
'See Also:
'Example:
' dim variable as LockStyle
' Set variable = me. IsLocked
Public Property Get IsLocked() As LockStyle
  If m_IsLocked <> LockSession And m_IsLocked <> LockPermanent Then CheckLock
  IsLocked = m_IsLocked
End Property

'Проверить блокировку
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CheckLock()
Private Sub CheckLock()
Static LastCheckTime As Date
If Application.WorkOffline Then Exit Sub
If Now - LastCheckTime < CDbl(CDate("00:00:10")) Then Exit Sub
On Error Resume Next
m_IsLocked = Application.MTZSession.IsLocked("INSTANCE", Parent.ID)
LastCheckTime = Now
End Sub

'Заблокировать
'Parameters:
'[IN]   Permanent , тип параметра: boolean=false   - ...
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me.LockResource(...параметры...)
Public Function LockResource(Optional ByVal Permanent As Boolean = False) As Boolean
If Application.WorkOffline Then Exit Function
  Dim OK
OK = Application.MTZSession.LockResource("INSTANCE", Parent.ID, Permanent)
  If OK Then
    If Permanent Then m_IsLocked = LockPermanent Else m_IsLocked = LockSession
  Else
    m_IsLocked = NoLock
  End If
bye:
End Function

'Снять блокировку ресурса
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
'  variable = me.UnLockResource()
Public Function UnLockResource() As Boolean
If Application.WorkOffline Then Exit Function
On Error GoTo bye
Application.MTZSession.UnLockResource "INSTANCE", Parent.ID
m_IsLocked = NoLock
bye:
End Function

'Возможно блокирование
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
'  variable = me.CanLock()
Public Function CanLock() As Boolean
If Application.WorkOffline Then Exit Function
On Error Resume Next
CanLock = Application.MTZSession.CanLock("INSTANCE", Parent.ID)
End Function



'Настройка грида на вывод раздела
'Parameters:
'[IN][OUT]  YGrid , тип параметра: object  - ...
'See Also:
'Example:
'  call me.PrepareGrid({параметры})
Public Sub PrepareGrid(YGrid As Object)
YGrid.ItemCount = 0
YGrid.Groups.Clear
YGrid.SortKeys.Clear
YGrid.Columns.Clear
  YGrid.Columns.Add("№ прибора", 0, 0, "FLD12").SortType = 1
  YGrid.Columns.Add("№ключа", 0, 0, "FLD13").SortType = 1
  YGrid.Columns.Add("D20ОБ", 0, 0, "FLD14").SortType = 1
  YGrid.Columns.Add("D20ПР", 0, 0, "FLD15").SortType = 1
  YGrid.Columns.Add("DyГВС", 0, 0, "FLD16").SortType = 1
  YGrid.Columns.Add("DyОБР", 0, 0, "FLD17").SortType = 1
  YGrid.Columns.Add("DyПР", 0, 0, "FLD18").SortType = 1
  YGrid.Columns.Add("dРпрОБ", 0, 0, "FLD19").SortType = 1
  YGrid.Columns.Add("dРпрПР", 0, 0, "FLD20").SortType = 1
  YGrid.Columns.Add("G(гвс)ПР", 0, 0, "FLD21").SortType = 1
  YGrid.Columns.Add("Gгвс", 0, 0, "FLD22").SortType = 1
  YGrid.Columns.Add("Gоб(гвс min)", 0, 0, "FLD23").SortType = 1
  YGrid.Columns.Add("Gов", 0, 0, "FLD24").SortType = 1
  YGrid.Columns.Add("Gпр(гвс min)", 0, 0, "FLD25").SortType = 1
  YGrid.Columns.Add("Gпр_minОБ", 0, 0, "FLD26").SortType = 1
  YGrid.Columns.Add("Gпр_minПР", 0, 0, "FLD27").SortType = 1
  YGrid.Columns.Add("GпрОБ", 0, 0, "FLD28").SortType = 1
  YGrid.Columns.Add("GпрПР", 0, 0, "FLD29").SortType = 1
  YGrid.Columns.Add("Gут", 0, 0, "FLD30").SortType = 1
  YGrid.Columns.Add("д20ОБ", 0, 0, "FLD31").SortType = 1
  YGrid.Columns.Add("д20ПР", 0, 0, "FLD32").SortType = 1
  YGrid.Columns.Add("Договор", 0, 0, "FLD33").SortType = 1
  YGrid.Columns.Add("Договор G2", 0, 0, "FLD34").SortType = 1
  YGrid.Columns.Add("Договор G1", 0, 0, "FLD35").SortType = 1
  YGrid.Columns.Add("Источник", 0, 0, "FLD36").SortType = 1
  YGrid.Columns.Add("Магистраль", 0, 0, "FLD37").SortType = 1
  YGrid.Columns.Add("Расходомер", 0, 0, "FLD40").SortType = 1
  YGrid.Columns.Add("Расходомер ГВС", 0, 0, "FLD41").SortType = 1
  YGrid.Columns.Add("Робр", 0, 0, "FLD42").SortType = 1
  YGrid.Columns.Add("Рпр", 0, 0, "FLD43").SortType = 1
  YGrid.Columns.Add("Способ отбора", 0, 0, "FLD45").SortType = 1
  YGrid.Columns.Add("Т_график", 0, 0, "FLD46").SortType = 1
  YGrid.Columns.Add("Теп_камера", 0, 0, "FLD47").SortType = 1
  YGrid.Columns.Add("Тип расходомера", 0, 0, "FLD48").SortType = 1
  YGrid.Columns.Add("тип термометра", 0, 0, "FLD49").SortType = 1
  YGrid.Columns.Add("Формула", 0, 0, "FLD50").SortType = 1
  YGrid.Columns.Add("Наименование счетчика", 0, 0, "FLD51").SortType = 1
  YGrid.Columns.Add("Схема", 0, 0, "FLD52").SortType = 1
  YGrid.Columns.Add("Qот", 0, 0, "FLD53").SortType = 1
  YGrid.Columns.Add("Qв", 0, 0, "FLD54").SortType = 1
  YGrid.Columns.Add("Qгвс", 0, 0, "FLD55").SortType = 1
  YGrid.Columns.Add("Qну", 0, 0, "FLD56").SortType = 1
  YGrid.Columns.Add("Gот", 0, 0, "FLD57").SortType = 1
  YGrid.Columns.Add("Gв", 0, 0, "FLD58").SortType = 1
  YGrid.Columns.Add("Gну", 0, 0, "FLD59").SortType = 1
  YGrid.Columns.Add("Часов_архив", 0, 0, "FLD60").SortType = 1
  YGrid.Columns.Add("Сут_архив", 0, 0, "FLD61").SortType = 1
  YGrid.Columns.Add("Термопреобр ГВС", 0, 0, "FLD62").SortType = 1
  YGrid.Columns.Add("Т1", 0, 0, "FLD63").SortType = 1
  YGrid.Columns.Add("Т2", 0, 0, "FLD64").SortType = 1
  YGrid.Columns.Add("Т3", 0, 0, "FLD65").SortType = 1
  YGrid.Columns.Add("Т4", 0, 0, "FLD66").SortType = 1
  YGrid.Columns.Add("Gтех", 0, 0, "FLD67").SortType = 1
  YGrid.Columns.Add("Gтех_гвс", 0, 0, "FLD68").SortType = 1
  YGrid.Columns.Add("Gгвс_м", 0, 0, "FLD69").SortType = 1
  YGrid.Columns.Add("Qтех", 0, 0, "FLD70").SortType = 1
  YGrid.Columns.Add("Qвент", 0, 0, "FLD71").SortType = 1
  YGrid.Columns.Add("Тхв", 0, 0, "FLD72").SortType = 1
  YGrid.Columns.Add("Расходомер ГВСц", 0, 0, "FLD73").SortType = 1
  YGrid.Columns.Add("Формула2", 0, 0, "FLD81").SortType = 1
  YGrid.Columns.Add("Термопреобр", 0, 0, "FLD82").SortType = 1
  YGrid.Columns.Add("Gвент", 0, 0, "FLD83").SortType = 1
  YGrid.Columns.Add("Код УУТЭ", 0, 0, "FLD84").SortType = 1
  YGrid.Columns.Add("Сист_теплопотребления", 0, 0, "FLD85").SortType = 1
  YGrid.Columns.Add("Qтех_гвс", 0, 0, "FLD86").SortType = 1
  YGrid.Columns.Add("Qтех_гвс ср", 0, 0, "FLD87").SortType = 1
  YGrid.Columns.Add("Qгвс ср", 0, 0, "FLD88").SortType = 1
  YGrid.Columns.Add("Дата поверки", 0, 0, "FLD89").SortType = 1
  YGrid.Columns.Add("Фамилия", 0, 0, "FLD90").SortType = 1
  YGrid.Columns.Add("Узел учета", 0, 0, "FLD92").SortType = 1
  YGrid.Columns.Add("Стр.адрес", 0, 0, "FLD93").SortType = 1
  YGrid.Columns.Add("G(гвс)ОБР", 0, 0, "FLD94").SortType = 1
  YGrid.Columns.Add("DyГВСц", 0, 0, "FLD95").SortType = 1
  YGrid.Columns.Add("Цена_имп_M1", 0, 0, "FLD96").SortType = 1
  YGrid.Columns.Add("Цена_имп_M2", 0, 0, "FLD97").SortType = 1
  YGrid.Columns.Add("Цена_имп_M1гв", 0, 0, "FLD98").SortType = 1
  YGrid.Columns.Add("Цена_имп_M2гв", 0, 0, "FLD99").SortType = 1
  YGrid.Columns.Add("Доп_погр_изм_M1%", 0, 0, "FLD100").SortType = 1
  YGrid.Columns.Add("Доп_погр_изм_M2%", 0, 0, "FLD101").SortType = 1
  YGrid.Columns.Add("Доп_погр_изм_M1гв%", 0, 0, "FLD102").SortType = 1
  YGrid.Columns.Add("Доп_погр_изм_M2гв%", 0, 0, "FLD103").SortType = 1
  YGrid.Columns.Add("Расходомер M2", 0, 0, "FLD104").SortType = 1
YGrid.ItemCount = Count
End Sub


'Чтение данных строки раздела в грид
'Parameters:
'[IN][OUT]  YGrid , тип параметра: object,
'[IN]   RowIndex , тип параметра: Long,
'[IN]   Bookmark , тип параметра: Variant,
'[IN][OUT]    Values , тип параметра: Variant  - ...
'See Also:
'Example:
'  call me.LoadRow({параметры})
Public Sub LoadRow(YGrid As Object, ByVal RowIndex As Long, ByVal Bookmark As Variant, Values)
 Dim obj As CONTRACT
  If RowIndex > 0 And RowIndex <= Count Then
    'If not IsEmpty(BookMArk) then
    '  set obj = item(left(bookmark,38))
    'else
      Set obj = Item(RowIndex)
    'end If
    If obj Is Nothing Then Exit Sub
    On Error Resume Next
    Values.Value(1) = Left(Replace(obj.FLD12, vbCrLf, " "), 255)
    Values.Value(2) = Left(Replace(obj.FLD13, vbCrLf, " "), 255)
    Values.Value(3) = Left(Replace(obj.FLD14, vbCrLf, " "), 255)
    Values.Value(4) = Left(Replace(obj.FLD15, vbCrLf, " "), 255)
    Values.Value(5) = Left(Replace(obj.FLD16, vbCrLf, " "), 255)
    Values.Value(6) = Left(Replace(obj.FLD17, vbCrLf, " "), 255)
    Values.Value(7) = Left(Replace(obj.FLD18, vbCrLf, " "), 255)
    Values.Value(8) = Left(Replace(obj.FLD19, vbCrLf, " "), 255)
    Values.Value(9) = Left(Replace(obj.FLD20, vbCrLf, " "), 255)
    Values.Value(10) = Left(Replace(obj.FLD21, vbCrLf, " "), 255)
    Values.Value(11) = Left(Replace(obj.FLD22, vbCrLf, " "), 255)
    Values.Value(12) = Left(Replace(obj.FLD23, vbCrLf, " "), 255)
    Values.Value(13) = Left(Replace(obj.FLD24, vbCrLf, " "), 255)
    Values.Value(14) = Left(Replace(obj.FLD25, vbCrLf, " "), 255)
    Values.Value(15) = Left(Replace(obj.FLD26, vbCrLf, " "), 255)
    Values.Value(16) = Left(Replace(obj.FLD27, vbCrLf, " "), 255)
    Values.Value(17) = Left(Replace(obj.FLD28, vbCrLf, " "), 255)
    Values.Value(18) = Left(Replace(obj.FLD29, vbCrLf, " "), 255)
    Values.Value(19) = Left(Replace(obj.FLD30, vbCrLf, " "), 255)
    Values.Value(20) = Left(Replace(obj.FLD31, vbCrLf, " "), 255)
    Values.Value(21) = Left(Replace(obj.FLD32, vbCrLf, " "), 255)
    Values.Value(22) = Left(Replace(obj.FLD33, vbCrLf, " "), 255)
    Values.Value(23) = Left(Replace(obj.FLD34, vbCrLf, " "), 255)
    Values.Value(24) = Left(Replace(obj.FLD35, vbCrLf, " "), 255)
    Values.Value(25) = Left(Replace(obj.FLD36, vbCrLf, " "), 255)
    Values.Value(26) = Left(Replace(obj.FLD37, vbCrLf, " "), 255)
    Values.Value(27) = Left(Replace(obj.FLD40, vbCrLf, " "), 255)
    Values.Value(28) = Left(Replace(obj.FLD41, vbCrLf, " "), 255)
    Values.Value(29) = Left(Replace(obj.FLD42, vbCrLf, " "), 255)
    Values.Value(30) = Left(Replace(obj.FLD43, vbCrLf, " "), 255)
    Values.Value(31) = Left(Replace(obj.FLD45, vbCrLf, " "), 255)
    Values.Value(32) = Left(Replace(obj.FLD46, vbCrLf, " "), 255)
    Values.Value(33) = Left(Replace(obj.FLD47, vbCrLf, " "), 255)
    Values.Value(34) = Left(Replace(obj.FLD48, vbCrLf, " "), 255)
    Values.Value(35) = Left(Replace(obj.FLD49, vbCrLf, " "), 255)
    Values.Value(36) = Left(Replace(obj.FLD50, vbCrLf, " "), 255)
    Values.Value(37) = Left(Replace(obj.FLD51, vbCrLf, " "), 255)
    Values.Value(38) = Left(Replace(obj.FLD52, vbCrLf, " "), 255)
    Values.Value(39) = Left(Replace(obj.FLD53, vbCrLf, " "), 255)
    Values.Value(40) = Left(Replace(obj.FLD54, vbCrLf, " "), 255)
    Values.Value(41) = Left(Replace(obj.FLD55, vbCrLf, " "), 255)
    Values.Value(42) = Left(Replace(obj.FLD56, vbCrLf, " "), 255)
    Values.Value(43) = Left(Replace(obj.FLD57, vbCrLf, " "), 255)
    Values.Value(44) = Left(Replace(obj.FLD58, vbCrLf, " "), 255)
    Values.Value(45) = Left(Replace(obj.FLD59, vbCrLf, " "), 255)
    Values.Value(46) = Left(Replace(obj.FLD60, vbCrLf, " "), 255)
    Values.Value(47) = Left(Replace(obj.FLD61, vbCrLf, " "), 255)
    Values.Value(48) = Left(Replace(obj.FLD62, vbCrLf, " "), 255)
    Values.Value(49) = Left(Replace(obj.FLD63, vbCrLf, " "), 255)
    Values.Value(50) = Left(Replace(obj.FLD64, vbCrLf, " "), 255)
    Values.Value(51) = Left(Replace(obj.FLD65, vbCrLf, " "), 255)
    Values.Value(52) = Left(Replace(obj.FLD66, vbCrLf, " "), 255)
    Values.Value(53) = Left(Replace(obj.FLD67, vbCrLf, " "), 255)
    Values.Value(54) = Left(Replace(obj.FLD68, vbCrLf, " "), 255)
    Values.Value(55) = Left(Replace(obj.FLD69, vbCrLf, " "), 255)
    Values.Value(56) = Left(Replace(obj.FLD70, vbCrLf, " "), 255)
    Values.Value(57) = Left(Replace(obj.FLD71, vbCrLf, " "), 255)
    Values.Value(58) = Left(Replace(obj.FLD72, vbCrLf, " "), 255)
    Values.Value(59) = Left(Replace(obj.FLD73, vbCrLf, " "), 255)
    Values.Value(60) = Left(Replace(obj.FLD81, vbCrLf, " "), 255)
    Values.Value(61) = Left(Replace(obj.FLD82, vbCrLf, " "), 255)
    Values.Value(62) = Left(Replace(obj.FLD83, vbCrLf, " "), 255)
    Values.Value(63) = Left(Replace(obj.FLD84, vbCrLf, " "), 255)
    Values.Value(64) = Left(Replace(obj.FLD85, vbCrLf, " "), 255)
    Values.Value(65) = Left(Replace(obj.FLD86, vbCrLf, " "), 255)
    Values.Value(66) = Left(Replace(obj.FLD87, vbCrLf, " "), 255)
    Values.Value(67) = Left(Replace(obj.FLD88, vbCrLf, " "), 255)
    Values.Value(68) = Left(Replace(obj.FLD89, vbCrLf, " "), 255)
    Values.Value(69) = Left(Replace(obj.FLD90, vbCrLf, " "), 255)
    Values.Value(70) = Left(Replace(obj.FLD92, vbCrLf, " "), 255)
    Values.Value(71) = Left(Replace(obj.FLD93, vbCrLf, " "), 255)
    Values.Value(72) = Left(Replace(obj.FLD94, vbCrLf, " "), 255)
    Values.Value(73) = Left(Replace(obj.FLD95, vbCrLf, " "), 255)
    Values.Value(74) = Left(Replace(obj.FLD96, vbCrLf, " "), 255)
    Values.Value(75) = Left(Replace(obj.FLD97, vbCrLf, " "), 255)
    Values.Value(76) = Left(Replace(obj.FLD98, vbCrLf, " "), 255)
    Values.Value(77) = Left(Replace(obj.FLD99, vbCrLf, " "), 255)
    Values.Value(78) = Left(Replace(obj.FLD100, vbCrLf, " "), 255)
    Values.Value(79) = Left(Replace(obj.FLD101, vbCrLf, " "), 255)
    Values.Value(80) = Left(Replace(obj.FLD102, vbCrLf, " "), 255)
    Values.Value(81) = Left(Replace(obj.FLD103, vbCrLf, " "), 255)
    Values.Value(82) = Left(Replace(obj.FLD104, vbCrLf, " "), 255)
   YGrid.RowBookmark(RowIndex) = obj.ID & "CONTRACT"
  End If 'RowIndex
End Sub

'Массовое обновление измененных строк коллекции
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.BatchUpdate()
Friend Sub BatchUpdate()
 On Error GoTo bye
If Not Application.WorkOffline Then
 Dim i As Long
again:
 For i = 1 To Count
    If Item(i) Is Nothing Then Exit For
    If Item(i).Deleted Then
      If Delete(i) Then GoTo again
    Else
      On Error Resume Next
      Item(i).BatchUpdate
      On Error GoTo bye
    End If
 Next
End If
bye:
End Sub

'Загрузка данных из базы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.LoadAll()
Friend Sub LoadAll()
On Error GoTo bye
If Not Application.WorkOffline Then
 Dim i As Long
 Refresh
 For i = 1 To Count
     Item(i).LoadAll
 Next
End If
bye:
End Sub



