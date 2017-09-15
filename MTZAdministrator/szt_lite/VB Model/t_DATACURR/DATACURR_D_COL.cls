VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "DATACURR_D_COL"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'раздел Суточный архив
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
  ChildPartName = "DATACURR_D"
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
  m_Application.Logger.Message "DATACURR_D.Init"
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
'  объект класса  DATACURR_D
'  ,или Nothing
'See Also:
'Example:
' dim variable as  DATACURR_D
' Set variable = me.Add(...параметры...)
Public Function Add(Optional ID As String = "") As DATACURR_D
 Dim LID As String
 Dim o As DATACURR_D
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
  Set o = New DATACURR_D
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
'  объект класса DATACURR_D
'  ,или Nothing
'See Also:
'Example:
' dim variable as DATACURR_D
' Set variable = me.Item(...параметры...)
Public Function Item(ByVal ID As Variant) As DATACURR_D
Attribute Item.VB_MemberFlags = "200"
 On Error Resume Next
 Dim o As DATACURR_D
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
'  объект класса DATACURR_D
'  ,или Nothing
'See Also:
'Example:
' dim variable as DATACURR_D
' Set variable = me.GetEQ(...параметры...)
Public Function GetEQ(ByVal Value As Variant) As DATACURR_D
   Set GetEQ = mcol.GetEQ(Value)
End Function


'Получить строку в кот. поле сортировки меньше или равно значению
'Parameters:
'[IN]   Value , тип параметра: variant  - ...
'Returns:
'  объект класса DATACURR_D
'  ,или Nothing
'See Also:
'Example:
' dim variable as DATACURR_D
' Set variable = me.GetLE(...параметры...)
Public Function GetLE(ByVal Value As Variant) As DATACURR_D
   Set GetLE = mcol.GetLE(Value)
End Function


'Получить строку в кот. поле сортировки меньше значения
'Parameters:
'[IN]   Value , тип параметра: variant  - ...
'Returns:
'  объект класса DATACURR_D
'  ,или Nothing
'See Also:
'Example:
' dim variable as DATACURR_D
' Set variable = me.GetLT(...параметры...)
Public Function GetLT(ByVal Value As Variant) As DATACURR_D
   Set GetLT = mcol.GetLT(Value)
End Function


'Получить строку в кот. поле сортировки больше или равно значению
'Parameters:
'[IN]   Value , тип параметра: variant  - ...
'Returns:
'  объект класса DATACURR_D
'  ,или Nothing
'See Also:
'Example:
' dim variable as DATACURR_D
' Set variable = me.GetGE(...параметры...)
Public Function GetGE(ByVal Value As Variant) As DATACURR_D
   Set GetGE = mcol.GetGE(Value)
End Function


'Получить строку в кот. поле сортировки больше значения
'Parameters:
'[IN]   Value , тип параметра: variant  - ...
'Returns:
'  объект класса DATACURR_D
'  ,или Nothing
'See Also:
'Example:
' dim variable as DATACURR_D
' Set variable = me.GetGT(...параметры...)
Public Function GetGT(ByVal Value As Variant) As DATACURR_D
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
 Dim o As DATACURR_D
    For i = 1 To mcol.Count
       Set o = mcol.Item(i)
        o.CloseClass
    Next
 If Not Application Is Nothing Then Application.Logger.Message "DATACURR_D.CloseClass"
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
Dim o As DATACURR_D
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
    Dim o As DATACURR_D
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
        tID = rs!DATACURR_DID
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
  Dim o As DATACURR_D
  Dim i As Long
  Dim pnode As IXMLDOMElement
  Set pnode = Xdom.createElement("DATACURR_D_COL")
  pnode.setAttribute "IsLocked", m_IsLocked
  Dim node As IXMLDOMElement
  ParentNode.appendChild pnode
  For i = 1 To Count
    Set o = Item(i)
    Set node = Xdom.createElement("DATACURR_D")
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
  Dim o As DATACURR_D
  Dim node As IXMLDOMElement
  Dim pnode As IXMLDOMElement
  NodeList.Reset
  Set pnode = NodeList.nextNode
  m_IsLocked = pnode.Attributes.getNamedItem("IsLocked").nodeValue
  Set NodeList = pnode.selectNodes("DATACURR_D")
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
  YGrid.Columns.Add("Дата опроса", 0, 0, "DCALL").SortType = 4
  YGrid.Columns.Add("Дата счетчика", 0, 0, "DCOUNTER").SortType = 4
  YGrid.Columns.Add("Тепловая энергия канал 1", 0, 0, "Q1").SortType = 2
  YGrid.Columns.Add("Тепловая энергия канал 2", 0, 0, "Q2").SortType = 2
  YGrid.Columns.Add("Температура по каналу 1", 0, 0, "T1").SortType = 2
  YGrid.Columns.Add("Температура по каналу 2", 0, 0, "T2").SortType = 2
  YGrid.Columns.Add("Разность Температур по каналу 1 и 2", 0, 0, "DT12").SortType = 2
  YGrid.Columns.Add("Температура по каналу 3", 0, 0, "T3").SortType = 2
  YGrid.Columns.Add("Температура по каналу 4", 0, 0, "T4").SortType = 2
  YGrid.Columns.Add("Температура по каналу 5", 0, 0, "T5").SortType = 2
  YGrid.Columns.Add("Разность Температур по каналу 4 и 5", 0, 0, "DT45").SortType = 2
  YGrid.Columns.Add("Температура по каналу 6", 0, 0, "T6").SortType = 2
  YGrid.Columns.Add("Объемный расход воды по каналу 1", 0, 0, "V1").SortType = 2
  YGrid.Columns.Add("Объемный расход воды по каналу 2", 0, 0, "V2").SortType = 2
  YGrid.Columns.Add("Разность объемов канал 1 (расход ГВС)", 0, 0, "DV12").SortType = 2
  YGrid.Columns.Add("Объемный расход воды по каналу 3", 0, 0, "V3").SortType = 2
  YGrid.Columns.Add("Объемный расход воды по каналу 4", 0, 0, "V4").SortType = 2
  YGrid.Columns.Add("Объемный расход воды по каналу 5", 0, 0, "V5").SortType = 2
  YGrid.Columns.Add("Разность объемов канал 2", 0, 0, "DV45").SortType = 2
  YGrid.Columns.Add("Объемный расход воды по каналу 6", 0, 0, "V6").SortType = 2
  YGrid.Columns.Add("Масса воды по каналу 1", 0, 0, "M1").SortType = 2
  YGrid.Columns.Add("Масса воды по каналу 2", 0, 0, "M2").SortType = 2
  YGrid.Columns.Add("Разность масс канал 1 (расход ГВС)", 0, 0, "DM12").SortType = 2
  YGrid.Columns.Add("Масса воды по каналу 3", 0, 0, "M3").SortType = 2
  YGrid.Columns.Add("Масса воды по каналу 4", 0, 0, "M4").SortType = 2
  YGrid.Columns.Add("Масса воды по каналу 5", 0, 0, "M5").SortType = 2
  YGrid.Columns.Add("Разность масс канал 2", 0, 0, "DM45").SortType = 2
  YGrid.Columns.Add("Масса воды по каналу 6", 0, 0, "M6").SortType = 2
  YGrid.Columns.Add("Давление в трубопроводе 1", 0, 0, "P1").SortType = 2
  YGrid.Columns.Add("Давление в трубопроводе 2", 0, 0, "P2").SortType = 2
  YGrid.Columns.Add("Давление в трубопроводе 3", 0, 0, "P3").SortType = 2
  YGrid.Columns.Add("Давление в трубопроводе 4", 0, 0, "P4").SortType = 2
  YGrid.Columns.Add("Давление в трубопроводе 5", 0, 0, "P5").SortType = 2
  YGrid.Columns.Add("Давление в трубопроводе 6", 0, 0, "P6").SortType = 2
  YGrid.Columns.Add("Текущее значение расхода в трубопроводе 1", 0, 0, "G1").SortType = 2
  YGrid.Columns.Add("Текущее значение расхода в трубопроводе 2", 0, 0, "G2").SortType = 2
  YGrid.Columns.Add("Текущее значение расхода в трубопроводе 3", 0, 0, "G3").SortType = 2
  YGrid.Columns.Add("Текущее значение расхода в трубопроводе 4", 0, 0, "G4").SortType = 2
  YGrid.Columns.Add("Текущее значение расхода в трубопроводе 5", 0, 0, "G5").SortType = 2
  YGrid.Columns.Add("Текущее значение расхода в трубопроводе 6", 0, 0, "G6").SortType = 2
  YGrid.Columns.Add("Температура холодной воды", 0, 0, "TCOOL").SortType = 2
  YGrid.Columns.Add("Температура холодного конца канал 1", 0, 0, "TCE1").SortType = 2
  YGrid.Columns.Add("Температура холодного конца канал 2", 0, 0, "TCE2").SortType = 2
  YGrid.Columns.Add("Тотальное время счета TB1", 0, 0, "TSUM1").SortType = 2
  YGrid.Columns.Add("Тотальное время счета TB2", 0, 0, "TSUM2").SortType = 2
  YGrid.Columns.Add("Тепловая энергия канал 1 нарастающим итогом", 0, 0, "Q1H").SortType = 2
  YGrid.Columns.Add("Тепловая энергия канал 2 нарастающим итогом", 0, 0, "Q2H").SortType = 2
  YGrid.Columns.Add("Объемный расход воды по каналу 1 нарастающим итогом", 0, 0, "V1H").SortType = 2
  YGrid.Columns.Add("Объемный расход воды по каналу 2 нарастающим итогом", 0, 0, "V2H").SortType = 2
  YGrid.Columns.Add("Объемный расход воды по каналу 4 нарастающим итогом", 0, 0, "V4H").SortType = 2
  YGrid.Columns.Add("Объемный расход воды по каналу 5 нарастающим итогом", 0, 0, "V5H").SortType = 2
  YGrid.Columns.Add("Время аварии", 0, 0, "ERRTIME").SortType = 2
  YGrid.Columns.Add("Время аварии нарастающим итогом", 0, 0, "ERRTIMEH").SortType = 2
  YGrid.Columns.Add("Нештатные ситуации общ", 0, 0, "HC").SortType = 1
  YGrid.Columns.Add("Схема потребления", 0, 0, "SP").SortType = 2
  YGrid.Columns.Add("Схема потребления TB1", 0, 0, "SP_TB1").SortType = 2
  YGrid.Columns.Add("Схема потребления TB2", 0, 0, "SP_TB2").SortType = 2
  YGrid.Columns.Add("datetimeCOUNTER", 0, 0, "datetimeCOUNTER").SortType = 4
  YGrid.Columns.Add("G1-G2", 0, 0, "DG12").SortType = 2
  YGrid.Columns.Add("G4-G5", 0, 0, "DG45").SortType = 2
  YGrid.Columns.Add("P1-P2", 0, 0, "DP12").SortType = 2
  YGrid.Columns.Add("P4-P5", 0, 0, "DP45").SortType = 2
  YGrid.Columns.Add("Единицы измерения расхода", 0, 0, "UNITSR").SortType = 1
  YGrid.Columns.Add("Тепловая энергия канал 3", 0, 0, "Q3").SortType = 2
  YGrid.Columns.Add("Тепловая энергия канал 4", 0, 0, "Q4").SortType = 2
  YGrid.Columns.Add("Атмосферное давление", 0, 0, "PATM").SortType = 2
  YGrid.Columns.Add("Тепловая энергия канал 5", 0, 0, "Q5").SortType = 2
  YGrid.Columns.Add("Тепловая энергия потребитель 1", 0, 0, "DQ12").SortType = 2
  YGrid.Columns.Add("Тепловая энергия потребитель 2", 0, 0, "DQ45").SortType = 2
  YGrid.Columns.Add("Давление холодной воды", 0, 0, "PXB").SortType = 2
  YGrid.Columns.Add("Расход энергии потребитель 1", 0, 0, "DQ").SortType = 2
  YGrid.Columns.Add("Нештатная ситуация 1 (ТВ1 или внешняя)", 0, 0, "HC_1").SortType = 1
  YGrid.Columns.Add("Нештатная ситуация 2 (ТВ2 или внутренняя)", 0, 0, "HC_2").SortType = 1
  YGrid.Columns.Add("Температура горячей воды", 0, 0, "THOT").SortType = 2
  YGrid.Columns.Add("DANS1", 0, 0, "DANS1").SortType = 2
  YGrid.Columns.Add("DANS2", 0, 0, "DANS2").SortType = 2
  YGrid.Columns.Add("DANS3", 0, 0, "DANS3").SortType = 2
  YGrid.Columns.Add("DANS4", 0, 0, "DANS4").SortType = 2
  YGrid.Columns.Add("DANS5", 0, 0, "DANS5").SortType = 2
  YGrid.Columns.Add("DANS6", 0, 0, "DANS6").SortType = 2
  YGrid.Columns.Add("Проверка архивных данных на НС (0 - не производилась, 1 - произведена)", 0, 0, "CHECK_A").SortType = 2
  YGrid.Columns.Add("Время безошиб.работы", 0, 0, "OKTIME").SortType = 2
  YGrid.Columns.Add("Время работы", 0, 0, "WORKTIME").SortType = 2
  YGrid.Columns.Add("Температура воздуха канал 1", 0, 0, "TAIR1").SortType = 2
  YGrid.Columns.Add("Температура воздуха канал 2", 0, 0, "TAIR2").SortType = 2
  YGrid.Columns.Add("Код нештатной ситуации тепловычислителя", 0, 0, "HC_CODE").SortType = 1
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
 Dim obj As DATACURR_D
  If RowIndex > 0 And RowIndex <= Count Then
    'If not IsEmpty(BookMArk) then
    '  set obj = item(left(bookmark,38))
    'else
      Set obj = Item(RowIndex)
    'end If
    If obj Is Nothing Then Exit Sub
    On Error Resume Next
    Values.Value(1) = Left(Replace(obj.DCALL, vbCrLf, " "), 255)
    Values.Value(2) = Left(Replace(obj.DCOUNTER, vbCrLf, " "), 255)
    Values.Value(3) = Left(Replace(obj.Q1, vbCrLf, " "), 255)
    Values.Value(4) = Left(Replace(obj.Q2, vbCrLf, " "), 255)
    Values.Value(5) = Left(Replace(obj.T1, vbCrLf, " "), 255)
    Values.Value(6) = Left(Replace(obj.T2, vbCrLf, " "), 255)
    Values.Value(7) = Left(Replace(obj.DT12, vbCrLf, " "), 255)
    Values.Value(8) = Left(Replace(obj.T3, vbCrLf, " "), 255)
    Values.Value(9) = Left(Replace(obj.T4, vbCrLf, " "), 255)
    Values.Value(10) = Left(Replace(obj.T5, vbCrLf, " "), 255)
    Values.Value(11) = Left(Replace(obj.DT45, vbCrLf, " "), 255)
    Values.Value(12) = Left(Replace(obj.T6, vbCrLf, " "), 255)
    Values.Value(13) = Left(Replace(obj.V1, vbCrLf, " "), 255)
    Values.Value(14) = Left(Replace(obj.V2, vbCrLf, " "), 255)
    Values.Value(15) = Left(Replace(obj.DV12, vbCrLf, " "), 255)
    Values.Value(16) = Left(Replace(obj.V3, vbCrLf, " "), 255)
    Values.Value(17) = Left(Replace(obj.V4, vbCrLf, " "), 255)
    Values.Value(18) = Left(Replace(obj.V5, vbCrLf, " "), 255)
    Values.Value(19) = Left(Replace(obj.DV45, vbCrLf, " "), 255)
    Values.Value(20) = Left(Replace(obj.V6, vbCrLf, " "), 255)
    Values.Value(21) = Left(Replace(obj.M1, vbCrLf, " "), 255)
    Values.Value(22) = Left(Replace(obj.M2, vbCrLf, " "), 255)
    Values.Value(23) = Left(Replace(obj.DM12, vbCrLf, " "), 255)
    Values.Value(24) = Left(Replace(obj.M3, vbCrLf, " "), 255)
    Values.Value(25) = Left(Replace(obj.M4, vbCrLf, " "), 255)
    Values.Value(26) = Left(Replace(obj.M5, vbCrLf, " "), 255)
    Values.Value(27) = Left(Replace(obj.DM45, vbCrLf, " "), 255)
    Values.Value(28) = Left(Replace(obj.M6, vbCrLf, " "), 255)
    Values.Value(29) = Left(Replace(obj.P1, vbCrLf, " "), 255)
    Values.Value(30) = Left(Replace(obj.P2, vbCrLf, " "), 255)
    Values.Value(31) = Left(Replace(obj.P3, vbCrLf, " "), 255)
    Values.Value(32) = Left(Replace(obj.P4, vbCrLf, " "), 255)
    Values.Value(33) = Left(Replace(obj.P5, vbCrLf, " "), 255)
    Values.Value(34) = Left(Replace(obj.P6, vbCrLf, " "), 255)
    Values.Value(35) = Left(Replace(obj.G1, vbCrLf, " "), 255)
    Values.Value(36) = Left(Replace(obj.G2, vbCrLf, " "), 255)
    Values.Value(37) = Left(Replace(obj.G3, vbCrLf, " "), 255)
    Values.Value(38) = Left(Replace(obj.G4, vbCrLf, " "), 255)
    Values.Value(39) = Left(Replace(obj.G5, vbCrLf, " "), 255)
    Values.Value(40) = Left(Replace(obj.G6, vbCrLf, " "), 255)
    Values.Value(41) = Left(Replace(obj.TCOOL, vbCrLf, " "), 255)
    Values.Value(42) = Left(Replace(obj.TCE1, vbCrLf, " "), 255)
    Values.Value(43) = Left(Replace(obj.TCE2, vbCrLf, " "), 255)
    Values.Value(44) = Left(Replace(obj.TSUM1, vbCrLf, " "), 255)
    Values.Value(45) = Left(Replace(obj.TSUM2, vbCrLf, " "), 255)
    Values.Value(46) = Left(Replace(obj.Q1H, vbCrLf, " "), 255)
    Values.Value(47) = Left(Replace(obj.Q2H, vbCrLf, " "), 255)
    Values.Value(48) = Left(Replace(obj.V1H, vbCrLf, " "), 255)
    Values.Value(49) = Left(Replace(obj.V2H, vbCrLf, " "), 255)
    Values.Value(50) = Left(Replace(obj.V4H, vbCrLf, " "), 255)
    Values.Value(51) = Left(Replace(obj.V5H, vbCrLf, " "), 255)
    Values.Value(52) = Left(Replace(obj.ERRTIME, vbCrLf, " "), 255)
    Values.Value(53) = Left(Replace(obj.ERRTIMEH, vbCrLf, " "), 255)
    Values.Value(54) = Left(Replace(obj.HC, vbCrLf, " "), 255)
    Values.Value(55) = Left(Replace(obj.SP, vbCrLf, " "), 255)
    Values.Value(56) = Left(Replace(obj.SP_TB1, vbCrLf, " "), 255)
    Values.Value(57) = Left(Replace(obj.SP_TB2, vbCrLf, " "), 255)
    Values.Value(58) = Left(Replace(obj.datetimeCOUNTER, vbCrLf, " "), 255)
    Values.Value(59) = Left(Replace(obj.DG12, vbCrLf, " "), 255)
    Values.Value(60) = Left(Replace(obj.DG45, vbCrLf, " "), 255)
    Values.Value(61) = Left(Replace(obj.DP12, vbCrLf, " "), 255)
    Values.Value(62) = Left(Replace(obj.DP45, vbCrLf, " "), 255)
    Values.Value(63) = Left(Replace(obj.UNITSR, vbCrLf, " "), 255)
    Values.Value(64) = Left(Replace(obj.Q3, vbCrLf, " "), 255)
    Values.Value(65) = Left(Replace(obj.Q4, vbCrLf, " "), 255)
    Values.Value(66) = Left(Replace(obj.PATM, vbCrLf, " "), 255)
    Values.Value(67) = Left(Replace(obj.Q5, vbCrLf, " "), 255)
    Values.Value(68) = Left(Replace(obj.DQ12, vbCrLf, " "), 255)
    Values.Value(69) = Left(Replace(obj.DQ45, vbCrLf, " "), 255)
    Values.Value(70) = Left(Replace(obj.PXB, vbCrLf, " "), 255)
    Values.Value(71) = Left(Replace(obj.DQ, vbCrLf, " "), 255)
    Values.Value(72) = Left(Replace(obj.HC_1, vbCrLf, " "), 255)
    Values.Value(73) = Left(Replace(obj.HC_2, vbCrLf, " "), 255)
    Values.Value(74) = Left(Replace(obj.THOT, vbCrLf, " "), 255)
    Values.Value(75) = Left(Replace(obj.DANS1, vbCrLf, " "), 255)
    Values.Value(76) = Left(Replace(obj.DANS2, vbCrLf, " "), 255)
    Values.Value(77) = Left(Replace(obj.DANS3, vbCrLf, " "), 255)
    Values.Value(78) = Left(Replace(obj.DANS4, vbCrLf, " "), 255)
    Values.Value(79) = Left(Replace(obj.DANS5, vbCrLf, " "), 255)
    Values.Value(80) = Left(Replace(obj.DANS6, vbCrLf, " "), 255)
    Values.Value(81) = Left(Replace(obj.CHECK_A, vbCrLf, " "), 255)
    Values.Value(82) = Left(Replace(obj.OKTIME, vbCrLf, " "), 255)
    Values.Value(83) = Left(Replace(obj.WORKTIME, vbCrLf, " "), 255)
    Values.Value(84) = Left(Replace(obj.TAIR1, vbCrLf, " "), 255)
    Values.Value(85) = Left(Replace(obj.TAIR2, vbCrLf, " "), 255)
    Values.Value(86) = Left(Replace(obj.HC_CODE, vbCrLf, " "), 255)
   YGrid.RowBookmark(RowIndex) = obj.ID & "DATACURR_D"
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



