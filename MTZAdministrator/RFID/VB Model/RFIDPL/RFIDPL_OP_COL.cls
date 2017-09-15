VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "RFIDPL_OP_COL"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 1280
Option Explicit


'раздел
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
  ChildPartName = "RFIDPL_OP"
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
Attribute Parent.VB_HelpID = 1410
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
  m_Application.Logger.Message "RFIDPL_OP.Init"
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
Attribute Application.VB_HelpID = 1290
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
Attribute Filter.VB_HelpID = 1330
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
'  объект класса  RFIDPL_OP
'  ,или Nothing
'See Also:
'Example:
' dim variable as  RFIDPL_OP
' Set variable = me.Add(...параметры...)
Public Function Add(Optional ID As String = "") As RFIDPL_OP
Attribute Add.VB_HelpID = 1285
 Dim LID As String
 Dim o As RFIDPL_OP
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
  Set o = New RFIDPL_OP
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
'  объект класса RFIDPL_OP
'  ,или Nothing
'See Also:
'Example:
' dim variable as RFIDPL_OP
' Set variable = me.Item(...параметры...)
Public Function Item(ByVal ID As Variant) As RFIDPL_OP
Attribute Item.VB_HelpID = 1395
Attribute Item.VB_MemberFlags = "200"
 On Error Resume Next
 Dim o As RFIDPL_OP
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
Attribute FindObject.VB_HelpID = 1335
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
Attribute Compact.VB_HelpID = 1315
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
Attribute Sort.VB_HelpID = 1430
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
'  объект класса RFIDPL_OP
'  ,или Nothing
'See Also:
'Example:
' dim variable as RFIDPL_OP
' Set variable = me.GetEQ(...параметры...)
Public Function GetEQ(ByVal Value As Variant) As RFIDPL_OP
Attribute GetEQ.VB_HelpID = 1340
   Set GetEQ = mcol.GetEQ(Value)
End Function


'Получить строку в кот. поле сортировки меньше или равно значению
'Parameters:
'[IN]   Value , тип параметра: variant  - ...
'Returns:
'  объект класса RFIDPL_OP
'  ,или Nothing
'See Also:
'Example:
' dim variable as RFIDPL_OP
' Set variable = me.GetLE(...параметры...)
Public Function GetLE(ByVal Value As Variant) As RFIDPL_OP
Attribute GetLE.VB_HelpID = 1370
   Set GetLE = mcol.GetLE(Value)
End Function


'Получить строку в кот. поле сортировки меньше значения
'Parameters:
'[IN]   Value , тип параметра: variant  - ...
'Returns:
'  объект класса RFIDPL_OP
'  ,или Nothing
'See Also:
'Example:
' dim variable as RFIDPL_OP
' Set variable = me.GetLT(...параметры...)
Public Function GetLT(ByVal Value As Variant) As RFIDPL_OP
Attribute GetLT.VB_HelpID = 1380
   Set GetLT = mcol.GetLT(Value)
End Function


'Получить строку в кот. поле сортировки больше или равно значению
'Parameters:
'[IN]   Value , тип параметра: variant  - ...
'Returns:
'  объект класса RFIDPL_OP
'  ,или Nothing
'See Also:
'Example:
' dim variable as RFIDPL_OP
' Set variable = me.GetGE(...параметры...)
Public Function GetGE(ByVal Value As Variant) As RFIDPL_OP
Attribute GetGE.VB_HelpID = 1350
   Set GetGE = mcol.GetGE(Value)
End Function


'Получить строку в кот. поле сортировки больше значения
'Parameters:
'[IN]   Value , тип параметра: variant  - ...
'Returns:
'  объект класса RFIDPL_OP
'  ,или Nothing
'See Also:
'Example:
' dim variable as RFIDPL_OP
' Set variable = me.GetGT(...параметры...)
Public Function GetGT(ByVal Value As Variant) As RFIDPL_OP
Attribute GetGT.VB_HelpID = 1360
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
Attribute GetEQPos.VB_HelpID = 1345
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
Attribute GetLEPos.VB_HelpID = 1375
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
Attribute GetLTPos.VB_HelpID = 1385
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
Attribute GetGEPos.VB_HelpID = 1355
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
Attribute GetGTPos.VB_HelpID = 1365
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
 Dim o As RFIDPL_OP
    For i = 1 To mcol.Count
       Set o = mcol.Item(i)
        o.CloseClass
    Next
 If Not Application Is Nothing Then Application.Logger.Message "RFIDPL_OP.CloseClass"
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
Attribute Count.VB_HelpID = 1320
    Count = mcol.Count
End Property


'Удалить строку из коллекции
'Parameters:
'[IN]   vntIndexKey , тип параметра: Variant  - ...
'See Also:
'Example:
'  call me.Remove({параметры})
Public Sub Remove(ByVal vntIndexKey As Variant)
Attribute Remove.VB_HelpID = 1425
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
Attribute Update.VB_HelpID = 1440
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
Attribute Delete.VB_HelpID = 1325
On Error GoTo bye
Dim o As RFIDPL_OP
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
Attribute Refresh.VB_HelpID = 1420
    On Error Resume Next
    Dim mcol2  As SortableCollection
    Set mcol2 = mcol
    Set mcol = Nothing
    Set mcol = New SortableCollection
    Dim rs As ADODB.Recordset
    If Application.WorkOffline Then Exit Sub
    Dim o As RFIDPL_OP
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
        tID = rs!RFIDPL_OPID
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
Attribute XMLSave.VB_HelpID = 1450
  Dim o As RFIDPL_OP
  Dim i As Long
  Dim pnode As IXMLDOMElement
  Set pnode = Xdom.createElement("RFIDPL_OP_COL")
  pnode.setAttribute "IsLocked", m_IsLocked
  Dim node As IXMLDOMElement
  ParentNode.appendChild pnode
  For i = 1 To Count
    Set o = Item(i)
    Set node = Xdom.createElement("RFIDPL_OP")
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
Attribute XMLLoad.VB_HelpID = 1445
  On Error Resume Next
  Dim o As RFIDPL_OP
  Dim node As IXMLDOMElement
  Dim pnode As IXMLDOMElement
  NodeList.Reset
  Set pnode = NodeList.nextNode
  m_IsLocked = pnode.Attributes.getNamedItem("IsLocked").nodeValue
  Set NodeList = pnode.selectNodes("RFIDPL_OP")
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
Attribute CanChange.VB_HelpID = 1295
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
Attribute CanChangeOffline.VB_HelpID = 1300
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
Attribute CanChangeONLine.VB_HelpID = 1305
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
Attribute IsLocked.VB_HelpID = 1390
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
Attribute LockResource.VB_HelpID = 1405
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
Attribute UnLockResource.VB_HelpID = 1435
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
Attribute CanLock.VB_HelpID = 1310
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
Attribute PrepareGrid.VB_HelpID = 1415
YGrid.ItemCount = 0
YGrid.Groups.Clear
YGrid.SortKeys.Clear
YGrid.Columns.Clear
  YGrid.Columns.Add("Тип операции", 0, 0, "OpType").SortType = 1
  YGrid.Columns.Add("Номер заказа", 0, 0, "QryNum").SortType = 1
  YGrid.Columns.Add("Товар", 0, 0, "TheGood").SortType = 1
  YGrid.Columns.Add("Вес груза НЕТТО", 0, 0, "GoodWeight").SortType = 2
  YGrid.Columns.Add("Вес груза БРУТТО", 0, 0, "GoodWeightBrutto").SortType = 2
  YGrid.Columns.Add("Количество упаковок", 0, 0, "CntOfPackage").SortType = 2
  YGrid.Columns.Add("Вес упаковки", 0, 0, "PackageWeight").SortType = 2
  YGrid.Columns.Add("Вес одной упаковки", 0, 0, "OnePackageWeight").SortType = 2
  YGrid.Columns.Add("Вес тары одной упаковки", 0, 0, "OneBoxWeight").SortType = 2
  YGrid.Columns.Add("Дата операции", 0, 0, "OpDate").SortType = 4
  YGrid.Columns.Add("Размещение", 0, 0, "PalletPlaceRef").SortType = 1
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
Attribute LoadRow.VB_HelpID = 1400
 Dim obj As RFIDPL_OP
  If RowIndex > 0 And RowIndex <= Count Then
    'If not IsEmpty(BookMArk) then
    '  set obj = item(left(bookmark,38))
    'else
      Set obj = Item(RowIndex)
    'end If
    If obj Is Nothing Then Exit Sub
    On Error Resume Next
   If obj.OpType Is Nothing Then
    Values.Value(1) = "Не задано"
   Else
    Values.Value(1) = Left(Replace(obj.OpType.Brief, vbCrLf, " "), 255)
   End If
    Values.Value(2) = Left(Replace(obj.QryNum, vbCrLf, " "), 255)
    Values.Value(3) = Left(Replace(obj.TheGood, vbCrLf, " "), 255)
    Values.Value(4) = Left(Replace(obj.GoodWeight, vbCrLf, " "), 255)
    Values.Value(5) = Left(Replace(obj.GoodWeightBrutto, vbCrLf, " "), 255)
    Values.Value(6) = Left(Replace(obj.CntOfPackage, vbCrLf, " "), 255)
    Values.Value(7) = Left(Replace(obj.PackageWeight, vbCrLf, " "), 255)
    Values.Value(8) = Left(Replace(obj.OnePackageWeight, vbCrLf, " "), 255)
    Values.Value(9) = Left(Replace(obj.OneBoxWeight, vbCrLf, " "), 255)
    Values.Value(10) = Left(Replace(obj.OpDate, vbCrLf, " "), 255)
   If obj.PalletPlaceRef Is Nothing Then
    Values.Value(11) = "Не задано"
   Else
    Values.Value(11) = Left(Replace(obj.PalletPlaceRef.Brief, vbCrLf, " "), 255)
   End If
   YGrid.RowBookmark(RowIndex) = obj.ID & "RFIDPL_OP"
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



