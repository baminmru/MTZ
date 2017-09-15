VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "pekz_path_COL"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'раздел Маршрут доставки
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
  ChildPartName = "pekz_path"
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
  m_Application.Logger.Message "pekz_path.Init"
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
'  объект класса  pekz_path
'  ,или Nothing
'See Also:
'Example:
' dim variable as  pekz_path
' Set variable = me.Add(...параметры...)
Public Function Add(Optional ID As String = "") As pekz_path
 Dim LID As String
 Dim o As pekz_path
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
  Set o = New pekz_path
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
'  объект класса pekz_path
'  ,или Nothing
'See Also:
'Example:
' dim variable as pekz_path
' Set variable = me.Item(...параметры...)
Public Function Item(ByVal ID As Variant) As pekz_path
Attribute Item.VB_MemberFlags = "200"
 On Error Resume Next
 Dim o As pekz_path
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
'  объект класса pekz_path
'  ,или Nothing
'See Also:
'Example:
' dim variable as pekz_path
' Set variable = me.GetEQ(...параметры...)
Public Function GetEQ(ByVal Value As Variant) As pekz_path
   Set GetEQ = mcol.GetEQ(Value)
End Function


'Получить строку в кот. поле сортировки меньше или равно значению
'Parameters:
'[IN]   Value , тип параметра: variant  - ...
'Returns:
'  объект класса pekz_path
'  ,или Nothing
'See Also:
'Example:
' dim variable as pekz_path
' Set variable = me.GetLE(...параметры...)
Public Function GetLE(ByVal Value As Variant) As pekz_path
   Set GetLE = mcol.GetLE(Value)
End Function


'Получить строку в кот. поле сортировки меньше значения
'Parameters:
'[IN]   Value , тип параметра: variant  - ...
'Returns:
'  объект класса pekz_path
'  ,или Nothing
'See Also:
'Example:
' dim variable as pekz_path
' Set variable = me.GetLT(...параметры...)
Public Function GetLT(ByVal Value As Variant) As pekz_path
   Set GetLT = mcol.GetLT(Value)
End Function


'Получить строку в кот. поле сортировки больше или равно значению
'Parameters:
'[IN]   Value , тип параметра: variant  - ...
'Returns:
'  объект класса pekz_path
'  ,или Nothing
'See Also:
'Example:
' dim variable as pekz_path
' Set variable = me.GetGE(...параметры...)
Public Function GetGE(ByVal Value As Variant) As pekz_path
   Set GetGE = mcol.GetGE(Value)
End Function


'Получить строку в кот. поле сортировки больше значения
'Parameters:
'[IN]   Value , тип параметра: variant  - ...
'Returns:
'  объект класса pekz_path
'  ,или Nothing
'See Also:
'Example:
' dim variable as pekz_path
' Set variable = me.GetGT(...параметры...)
Public Function GetGT(ByVal Value As Variant) As pekz_path
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
 Dim o As pekz_path
    For i = 1 To mcol.Count
       Set o = mcol.Item(i)
        o.CloseClass
    Next
 If Not Application Is Nothing Then Application.Logger.Message "pekz_path.CloseClass"
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
Dim o As pekz_path
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
    Dim o As pekz_path
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
        tID = rs!pekz_pathID
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
  Dim o As pekz_path
  Dim i As Long
  Dim pnode As IXMLDOMElement
  Set pnode = Xdom.createElement("PEKZ_PATH_COL")
  pnode.setAttribute "IsLocked", m_IsLocked
  Dim node As IXMLDOMElement
  ParentNode.appendChild pnode
  For i = 1 To Count
    Set o = Item(i)
    Set node = Xdom.createElement("PEKZ_PATH")
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
  Dim o As pekz_path
  Dim node As IXMLDOMElement
  Dim pnode As IXMLDOMElement
  NodeList.Reset
  Set pnode = NodeList.nextNode
  m_IsLocked = pnode.Attributes.getNamedItem("IsLocked").nodeValue
  Set NodeList = pnode.selectNodes("PEKZ_PATH")
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
  YGrid.Columns.Add("№", 0, 0, "sequence").SortType = 2
  YGrid.Columns.Add("Транзит", 0, 0, "IsTranzit").SortType = 1
  YGrid.Columns.Add("Филиал", 0, 0, "PathFilial").SortType = 1
  YGrid.Columns.Add("Поставщик", 0, 0, "TransSupplier").SortType = 1
  YGrid.Columns.Add("Направление", 0, 0, "TheDirection").SortType = 1
  YGrid.Columns.Add("Кол-во ПО", 0, 0, "PPONum").SortType = 2
  YGrid.Columns.Add("Станция назначения", 0, 0, "DestStation").SortType = 1
  YGrid.Columns.Add("Характер груза", 0, 0, "PPODescription").SortType = 1
  YGrid.Columns.Add("Получатель", 0, 0, "Receiver").SortType = 1
  YGrid.Columns.Add("Вес ПО", 0, 0, "PPOWeight").SortType = 2
  YGrid.Columns.Add("Ед. изм. веса", 0, 0, "WeightEDIZM").SortType = 1
  YGrid.Columns.Add("Объем ПО", 0, 0, "PPOVol").SortType = 2
  YGrid.Columns.Add("Ед.изм. объема", 0, 0, "ValueEDIZM").SortType = 1
  YGrid.Columns.Add("Данные получателя", 0, 0, "RCVInfo").SortType = 1
  YGrid.Columns.Add("Дата предполагаемой отправки", 0, 0, "PathPlanedDate").SortType = 4
  YGrid.Columns.Add("Ориентировочная дата получения", 0, 0, "RcvWaitDate").SortType = 4
  YGrid.Columns.Add("Поезд", 0, 0, "trainNo").SortType = 1
  YGrid.Columns.Add("Вагон №", 0, 0, "vagNo").SortType = 1
  YGrid.Columns.Add("Дата отправки", 0, 0, "SendDate").SortType = 4
  YGrid.Columns.Add("Cписание денежных средств поставщиком", 0, 0, "SupMoneyDate").SortType = 4
  YGrid.Columns.Add("ФИО Кладовщика", 0, 0, "PassFIO").SortType = 1
  YGrid.Columns.Add("Дата передачи груза в вагон", 0, 0, "PassDate").SortType = 4
  YGrid.Columns.Add("ФИО ВПН", 0, 0, "RcvFIO").SortType = 1
  YGrid.Columns.Add("Дата получения груза в ПО", 0, 0, "RcvDate").SortType = 4
  YGrid.Columns.Add("Кому передана информация", 0, 0, "InforRcvFIO").SortType = 1
  YGrid.Columns.Add("Дата передачи информации", 0, 0, "InfoDate").SortType = 4
  YGrid.Columns.Add("Способ передачи информации", 0, 0, "InfoSendType").SortType = 1
  YGrid.Columns.Add("Расчет с НДС", 0, 0, "CalcWithNDS").SortType = 1
  YGrid.Columns.Add("Валюта", 0, 0, "TheCurrency").SortType = 1
  YGrid.Columns.Add("Тариф", 0, 0, "TRF").SortType = 2
  YGrid.Columns.Add("Сумма с НДС", 0, 0, "SummNDS").SortType = 2
  YGrid.Columns.Add("Сумма без НДС", 0, 0, "Summ").SortType = 2
  YGrid.Columns.Add("Тариф поставщика", 0, 0, "SupTRF").SortType = 2
  YGrid.Columns.Add("Сумма поставщику без НДС", 0, 0, "SupSumm").SortType = 2
  YGrid.Columns.Add("Сумма поставщику с НДС", 0, 0, "SupSummNDS").SortType = 2
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
 Dim obj As pekz_path
  If RowIndex > 0 And RowIndex <= Count Then
    'If not IsEmpty(BookMArk) then
    '  set obj = item(left(bookmark,38))
    'else
      Set obj = Item(RowIndex)
    'end If
    If obj Is Nothing Then Exit Sub
    On Error Resume Next
    Values.Value(1) = Left(Replace(obj.sequence, vbCrLf, " "), 255)
   If obj.IsTranzit = -1 Then
     Values.Value(2) = "Да"
   End If
   If obj.IsTranzit = 0 Then
     Values.Value(2) = "Нет"
   End If
   If obj.PathFilial Is Nothing Then
    Values.Value(3) = "Не задано"
   Else
    Values.Value(3) = Left(Replace(obj.PathFilial.Brief, vbCrLf, " "), 255)
   End If
   If obj.TransSupplier Is Nothing Then
    Values.Value(4) = "Не задано"
   Else
    Values.Value(4) = Left(Replace(obj.TransSupplier.Brief, vbCrLf, " "), 255)
   End If
   If obj.TheDirection Is Nothing Then
    Values.Value(5) = "Не задано"
   Else
    Values.Value(5) = Left(Replace(obj.TheDirection.Brief, vbCrLf, " "), 255)
   End If
    Values.Value(6) = Left(Replace(obj.PPONum, vbCrLf, " "), 255)
   If obj.DestStation Is Nothing Then
    Values.Value(7) = "Не задано"
   Else
    Values.Value(7) = Left(Replace(obj.DestStation.Brief, vbCrLf, " "), 255)
   End If
   If obj.PPODescription Is Nothing Then
    Values.Value(8) = "Не задано"
   Else
    Values.Value(8) = Left(Replace(obj.PPODescription.Brief, vbCrLf, " "), 255)
   End If
   If obj.Receiver Is Nothing Then
    Values.Value(9) = "Не задано"
   Else
    Values.Value(9) = Left(Replace(obj.Receiver.Brief, vbCrLf, " "), 255)
   End If
    Values.Value(10) = Left(Replace(obj.PPOWeight, vbCrLf, " "), 255)
   If obj.WeightEDIZM Is Nothing Then
    Values.Value(11) = "Не задано"
   Else
    Values.Value(11) = Left(Replace(obj.WeightEDIZM.Brief, vbCrLf, " "), 255)
   End If
    Values.Value(12) = Left(Replace(obj.PPOVol, vbCrLf, " "), 255)
   If obj.ValueEDIZM Is Nothing Then
    Values.Value(13) = "Не задано"
   Else
    Values.Value(13) = Left(Replace(obj.ValueEDIZM.Brief, vbCrLf, " "), 255)
   End If
    Values.Value(14) = Left(Replace(obj.RCVInfo, vbCrLf, " "), 255)
    Values.Value(15) = Left(Replace(obj.PathPlanedDate, vbCrLf, " "), 255)
    Values.Value(16) = Left(Replace(obj.RcvWaitDate, vbCrLf, " "), 255)
   If obj.trainNo Is Nothing Then
    Values.Value(17) = "Не задано"
   Else
    Values.Value(17) = Left(Replace(obj.trainNo.Brief, vbCrLf, " "), 255)
   End If
    Values.Value(18) = Left(Replace(obj.vagNo, vbCrLf, " "), 255)
    Values.Value(19) = Left(Replace(obj.SendDate, vbCrLf, " "), 255)
    Values.Value(20) = Left(Replace(obj.SupMoneyDate, vbCrLf, " "), 255)
    Values.Value(21) = Left(Replace(obj.PassFIO, vbCrLf, " "), 255)
    Values.Value(22) = Left(Replace(obj.PassDate, vbCrLf, " "), 255)
    Values.Value(23) = Left(Replace(obj.RcvFIO, vbCrLf, " "), 255)
    Values.Value(24) = Left(Replace(obj.RcvDate, vbCrLf, " "), 255)
    Values.Value(25) = Left(Replace(obj.InforRcvFIO, vbCrLf, " "), 255)
    Values.Value(26) = Left(Replace(obj.InfoDate, vbCrLf, " "), 255)
   If obj.InfoSendType Is Nothing Then
    Values.Value(27) = "Не задано"
   Else
    Values.Value(27) = Left(Replace(obj.InfoSendType.Brief, vbCrLf, " "), 255)
   End If
   If obj.CalcWithNDS = -1 Then
     Values.Value(28) = "Да"
   End If
   If obj.CalcWithNDS = 0 Then
     Values.Value(28) = "Нет"
   End If
   If obj.TheCurrency Is Nothing Then
    Values.Value(29) = "Не задано"
   Else
    Values.Value(29) = Left(Replace(obj.TheCurrency.Brief, vbCrLf, " "), 255)
   End If
    Values.Value(30) = Left(Replace(obj.TRF, vbCrLf, " "), 255)
    Values.Value(31) = Left(Replace(obj.SummNDS, vbCrLf, " "), 255)
    Values.Value(32) = Left(Replace(obj.Summ, vbCrLf, " "), 255)
    Values.Value(33) = Left(Replace(obj.SupTRF, vbCrLf, " "), 255)
    Values.Value(34) = Left(Replace(obj.SupSumm, vbCrLf, " "), 255)
    Values.Value(35) = Left(Replace(obj.SupSummNDS, vbCrLf, " "), 255)
   YGrid.RowBookmark(RowIndex) = obj.ID & "pekz_path"
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



