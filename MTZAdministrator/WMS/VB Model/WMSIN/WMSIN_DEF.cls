VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "WMSIN_DEF"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'строка раздела
Private m_ID As String
Private m_SecureStyleID As String
Private m_RowRetrived As Boolean
Private m_Changed As Boolean
Private m_Deleted As Boolean
Private m_RetriveTime As Date
Private m_ChangeTime As Date
Private m_AccessTime As Date
Private m_Parent As Object
Private m_Application As Application
Private m_WareHouse As Object
Dim m_WareHouse_ID As String
Dim m_WareHouse_ID_BRIEF As String
Private m_QryCode As String
Private m_TheClient As Object
Dim m_TheClient_ID As String
Dim m_TheClient_ID_BRIEF As String
Private m_ProcessDate As Date
Private m_TheType As Object
Dim m_TheType_ID As String
Dim m_TheType_ID_BRIEF As String
Private m_TheDogovor As Object
Dim m_TheDogovor_ID As String
Dim m_TheDogovor_ID_BRIEF As String
Private m_Supplier As String
Private m_TTN As String
Private m_TTNDate As Date
Private m_TranspNumber As String
Private m_Container As String
Private m_StampNumber As String
Private m_StampStatus As String
Private m_Track_time_in As Date
Private m_track_time_out As Date
Private m_temp_in_track As Double
Private m_ThePartyRule As Object
Dim m_ThePartyRule_ID As String
Dim m_ThePartyRule_ID_BRIEF As String
Private m_Brief As String

'Сообщение об изменении строки
'Parameters:
'[IN]   fieldName , тип параметра: string,
'[IN]   OldValue,, тип параметра: Variant
'[IN][OUT]   NewValue, тип параметра: Variant  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Event Change(ByVal fieldName As String, ByVal OldValue, ByRef NewValue)
Private m_IsLocked As LockStyle






'Признак удаления
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me. Deleted
Public Property Get Deleted() As Boolean
  Deleted = m_Deleted
End Property

'Признак изменения
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me. Changed
Public Property Get Changed() As Boolean
  Changed = m_Changed
End Property

'Установить признак изменения
'Parameters:
'[IN][OUT]  newChanged , тип параметра: boolean  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...значение...
' me. Changed = value
Friend Property Let Changed(newChanged As Boolean)
  m_Changed = newChanged
End Property

'Задать идентификатор строки
'Parameters:
'[IN]   newID , тип параметра: string  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...значение...
' me. ID = value
Friend Property Let id(ByVal newID As String)
  If m_ID = "" Then
    m_ID = newID
  End If
End Property

'Идентификатор строки
'Parameters:
' параметров нет
'Returns:
'  значение типа string
'See Also:
'Example:
' dim variable as string
' variable = me. ID
Public Property Get id() As String
  If m_ID = "" Then m_ID = CreateGUID2
  id = m_ID
End Property

'Задать стиль защиты
'Parameters:
'[IN]   newID , тип параметра: string  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...значение...
' me. SecureStyleID = value
Friend Property Let SecureStyleID(ByVal newID As String)
    m_SecureStyleID = newID
End Property

'Стиль защиты
'Parameters:
' параметров нет
'Returns:
'  значение типа string
'See Also:
'Example:
' dim variable as string
' variable = me. SecureStyleID
Public Property Get SecureStyleID() As String
  SecureStyleID = m_SecureStyleID
End Property

'Название таблицы раздела
'Parameters:
' параметров нет
'Returns:
'  значение типа string
'See Also:
'Example:
' dim variable as string
' variable = me. PartName
Public Property Get PartName() As String
  PartName = "WMSIN_DEF"
End Property

'Задать родительский объект
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

'Получить родительский объект
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
'[IN][OUT]  newApplication , тип параметра: Application  - ...
'See Also:
'Example:
' dim value as Variant
' set value = new Variant
' set me. Application = value
Friend Property Set Application(newApplication As Application)
  Set m_Application = newApplication
  m_Application.Logger.Message "WMSIN_DEF.Init"
End Property

'Корневой объект
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
  Set Application = m_Application
End Property

'Разрушить иерархическую зависимость объектов
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseParents()
Private Sub CloseParents()
  Set m_Application = Nothing
  Set m_Parent = Nothing
End Sub

'Установить признак - считано из базы
'Parameters:
'[IN][OUT]  newRetrived , тип параметра: boolean  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...значение...
' me. RowRetrived = value
Friend Property Let RowRetrived(newRetrived As Boolean)
  m_RowRetrived = newRetrived
End Property

'получить признак - считано из базы
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me. RowRetrived
Public Property Get RowRetrived() As Boolean
  RowRetrived = m_RowRetrived
End Property

'Задать Дату и время считывания из базы
'Parameters:
'[IN][OUT]  newRetriveTime , тип параметра: date  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...значение...
' me. RetriveTime = value
Friend Property Let RetriveTime(newRetriveTime As Date)
  m_RetriveTime = newRetriveTime
End Property

'Дата и время считывания из базы
'Parameters:
' параметров нет
'Returns:
'  значение типа date
'See Also:
'Example:
' dim variable as date
' variable = me. RetriveTime
Public Property Get RetriveTime() As Date
  RetriveTime = m_RetriveTime
End Property

'Задать Дату и время изменения
'Parameters:
'[IN][OUT]  newChangeTime , тип параметра: date  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...значение...
' me. ChangeTime = value
Friend Property Let ChangeTime(newChangeTime As Date)
  m_ChangeTime = newChangeTime
End Property

'Получить Дату и время изменения
'Parameters:
' параметров нет
'Returns:
'  значение типа date
'See Also:
'Example:
' dim variable as date
' variable = me. ChangeTime
Public Property Get ChangeTime() As Date
 ChangeTime = m_ChangeTime
End Property

'Задать время обращения
'Parameters:
'[IN][OUT]  newAccessTime , тип параметра: date  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...значение...
' me. AccessTime = value
Friend Property Let AccessTime(newAccessTime As Date)
  m_AccessTime = newAccessTime
  If m_AccessTime <= m_RetriveTime Then m_AccessTime = m_RetriveTime + 0.001
End Property

'Получить время обращения
'Parameters:
' параметров нет
'Returns:
'  значение типа date
'See Also:
'Example:
' dim variable as date
' variable = me. AccessTime
Public Property Get AccessTime() As Date
  AccessTime = m_AccessTime
End Property
Private Function GetFromXML(ByVal XML As String, ByVal TagName As String) As String
  Dim res As String
  On Error GoTo err
  Dim XMLDoc As New DOMDocument
  Call XMLDoc.loadXML(XML)
  Dim node As MSXML2.IXMLDOMNode
  For Each node In XMLDoc.childNodes.item(0).childNodes
    If (UCase(node.baseName) = "BRIEF") Then
      res = node.Text
      Exit For
    End If
  Next
err:
  GetFromXML = res
End Function
' let
'Склад

'Склад
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set WareHouse(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "WareHouse", WareHouse, NewValue
On Error Resume Next
m_WareHouse_ID = ""
m_WareHouse_ID = NewValue.id
'  set   m_WareHouse= newValue
End If
End Property

'Склад
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. WareHouse
Public Property Get WareHouse() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_WareHouse As Object
If m_WareHouse_ID <> "" Then
  Set tmp_WareHouse = Application.FindRowObject("WMSD_WH", m_WareHouse_ID)
  If tmp_WareHouse Is Nothing Then
    m_WareHouse_ID_BRIEF = ""
  Else
    m_WareHouse_ID_BRIEF = tmp_WareHouse.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "WMSD_WH" & m_WareHouse_ID, tmp_WareHouse
  Set WareHouse = tmp_WareHouse
  Exit Property
End If
  '  set WareHouse = m_WareHouse
End Property
' let
'Код заказа

'Код заказа
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let QryCode(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "QryCode", QryCode, NewValue

   m_QryCode = NewValue
End If
End Property

'Код заказа
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. QryCode
Public Property Get QryCode() As String
 LoadFromDatabase
 AccessTime = Now

   QryCode = m_QryCode
End Property
' let
'Клиент

'Клиент
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TheClient(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheClient", TheClient, NewValue
On Error Resume Next
m_TheClient_ID = ""
m_TheClient_ID = NewValue.id
' set   m_TheClient= newValue
End If
End Property

'Клиент
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TheClient
Public Property Get TheClient() As Object
 LoadFromDatabase
 AccessTime = Now
If m_TheClient_ID <> "" Then
  Set TheClient = Application.Manager.GetInstanceObject(Right(m_TheClient_ID, 38))
 Exit Property
End If
  ' set TheClient = m_TheClient
End Property
' let
'Дата обработки заказа

'Дата обработки заказа
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ProcessDate(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ProcessDate", ProcessDate, NewValue

   m_ProcessDate = NewValue
End If
End Property

'Дата обработки заказа
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. ProcessDate
Public Property Get ProcessDate() As Date
 LoadFromDatabase
 AccessTime = Now

   ProcessDate = m_ProcessDate
End Property
' let
'Тип заказа

'Тип заказа
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TheType(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheType", TheType, NewValue
On Error Resume Next
m_TheType_ID = ""
m_TheType_ID = NewValue.id
'  set   m_TheType= newValue
End If
End Property

'Тип заказа
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TheType
Public Property Get TheType() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TheType As Object
If m_TheType_ID <> "" Then
  Set tmp_TheType = Application.FindRowObject("WMSD_QTYPE", m_TheType_ID)
  If tmp_TheType Is Nothing Then
    m_TheType_ID_BRIEF = ""
  Else
    m_TheType_ID_BRIEF = tmp_TheType.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "WMSD_QTYPE" & m_TheType_ID, tmp_TheType
  Set TheType = tmp_TheType
  Exit Property
End If
  '  set TheType = m_TheType
End Property
' let
'Договор

'Договор
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TheDogovor(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheDogovor", TheDogovor, NewValue
On Error Resume Next
m_TheDogovor_ID = ""
m_TheDogovor_ID = NewValue.id
' set   m_TheDogovor= newValue
End If
End Property

'Договор
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TheDogovor
Public Property Get TheDogovor() As Object
 LoadFromDatabase
 AccessTime = Now
If m_TheDogovor_ID <> "" Then
  Set TheDogovor = Application.Manager.GetInstanceObject(Right(m_TheDogovor_ID, 38))
 Exit Property
End If
  ' set TheDogovor = m_TheDogovor
End Property
' let
'Поставщик

'Поставщик
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Supplier(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Supplier", Supplier, NewValue

   m_Supplier = NewValue
End If
End Property

'Поставщик
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. Supplier
Public Property Get Supplier() As String
 LoadFromDatabase
 AccessTime = Now

   Supplier = m_Supplier
End Property
' let
'Номер ТТН

'Номер ТТН
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TTN(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TTN", TTN, NewValue

   m_TTN = NewValue
End If
End Property

'Номер ТТН
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. TTN
Public Property Get TTN() As String
 LoadFromDatabase
 AccessTime = Now

   TTN = m_TTN
End Property
' let
'Дата ТТН

'Дата ТТН
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TTNDate(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TTNDate", TTNDate, NewValue

   m_TTNDate = NewValue
End If
End Property

'Дата ТТН
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. TTNDate
Public Property Get TTNDate() As Date
 LoadFromDatabase
 AccessTime = Now

   TTNDate = m_TTNDate
End Property
' let
'№ ТС

'№ ТС
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TranspNumber(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TranspNumber", TranspNumber, NewValue

   m_TranspNumber = NewValue
End If
End Property

'№ ТС
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. TranspNumber
Public Property Get TranspNumber() As String
 LoadFromDatabase
 AccessTime = Now

   TranspNumber = m_TranspNumber
End Property
' let
'№ прицепа \ контейнера

'№ прицепа \ контейнера
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Container(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Container", Container, NewValue

   m_Container = NewValue
End If
End Property

'№ прицепа \ контейнера
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. Container
Public Property Get Container() As String
 LoadFromDatabase
 AccessTime = Now

   Container = m_Container
End Property
' let
'Номер пломбы

'Номер пломбы
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let StampNumber(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "StampNumber", StampNumber, NewValue

   m_StampNumber = NewValue
End If
End Property

'Номер пломбы
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. StampNumber
Public Property Get StampNumber() As String
 LoadFromDatabase
 AccessTime = Now

   StampNumber = m_StampNumber
End Property
' let
'Состояние пломбы

'Состояние пломбы
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let StampStatus(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "StampStatus", StampStatus, NewValue

   m_StampStatus = NewValue
End If
End Property

'Состояние пломбы
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. StampStatus
Public Property Get StampStatus() As String
 LoadFromDatabase
 AccessTime = Now

   StampStatus = m_StampStatus
End Property
' let
'Время прибытия машины

'Время прибытия машины
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Track_time_in(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Track_time_in", Track_time_in, NewValue

   m_Track_time_in = NewValue
End If
End Property

'Время прибытия машины
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. Track_time_in
Public Property Get Track_time_in() As Date
 LoadFromDatabase
 AccessTime = Now

   Track_time_in = m_Track_time_in
End Property
' let
'Время убытия машины

'Время убытия машины
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let track_time_out(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "track_time_out", track_time_out, NewValue

   m_track_time_out = NewValue
End If
End Property

'Время убытия машины
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. track_time_out
Public Property Get track_time_out() As Date
 LoadFromDatabase
 AccessTime = Now

   track_time_out = m_track_time_out
End Property
' let
'Температура

'Температура
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let temp_in_track(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "temp_in_track", temp_in_track, NewValue

   m_temp_in_track = NewValue
End If
End Property

'Температура
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. temp_in_track
Public Property Get temp_in_track() As Double
 LoadFromDatabase
 AccessTime = Now

   temp_in_track = m_temp_in_track
End Property
' let
'Правило оптимизации

'Правило оптимизации
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set ThePartyRule(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ThePartyRule", ThePartyRule, NewValue
On Error Resume Next
m_ThePartyRule_ID = ""
m_ThePartyRule_ID = NewValue.id
'  set   m_ThePartyRule= newValue
End If
End Property

'Правило оптимизации
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. ThePartyRule
Public Property Get ThePartyRule() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_ThePartyRule As Object
If m_ThePartyRule_ID <> "" Then
  Set tmp_ThePartyRule = Application.FindRowObject("WMSD_RULE", m_ThePartyRule_ID)
  If tmp_ThePartyRule Is Nothing Then
    m_ThePartyRule_ID_BRIEF = ""
  Else
    m_ThePartyRule_ID_BRIEF = tmp_ThePartyRule.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "WMSD_RULE" & m_ThePartyRule_ID, tmp_ThePartyRule
  Set ThePartyRule = tmp_ThePartyRule
  Exit Property
End If
  '  set ThePartyRule = m_ThePartyRule
End Property

'Упаковать поля в именованную коллекцию
'Parameters:
'[IN][OUT]   nv , тип параметра: NamedValues  - ...
'See Also:
'Example:
'  call me.Pack({параметры})
Public Sub Pack(ByRef nv As NamedValues)
  Dim nvi As NamedValue
  Set nv = Nothing
  Set nv = New NamedValues

 ' Reference to WMSD_WH
    If m_WareHouse_ID = "" Then
       Set nvi = nv.Add("WareHouse", "")
    Else
       Set nvi = nv.Add("WareHouse", m_WareHouse_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("QryCode", m_QryCode)
nvi.ValueSize = 255
 ' Reference to object
    If m_TheClient_ID = "" Then
       Set nvi = nv.Add("TheClient", "")
    Else
       Set nvi = nv.Add("TheClient", m_TheClient_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("ProcessDate", m_ProcessDate)
nvi.ValueType = adDate
 ' Reference to WMSD_QTYPE
    If m_TheType_ID = "" Then
       Set nvi = nv.Add("TheType", "")
    Else
       Set nvi = nv.Add("TheType", m_TheType_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to object
    If m_TheDogovor_ID = "" Then
       Set nvi = nv.Add("TheDogovor", "")
    Else
       Set nvi = nv.Add("TheDogovor", m_TheDogovor_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("Supplier", m_Supplier)
nvi.ValueSize = 255
  Set nvi = nv.Add("TTN", m_TTN)
nvi.ValueSize = 30
  Set nvi = nv.Add("TTNDate", m_TTNDate)
nvi.ValueType = adDate
  Set nvi = nv.Add("TranspNumber", m_TranspNumber)
nvi.ValueSize = 10
  Set nvi = nv.Add("Container", m_Container)
nvi.ValueSize = 10
  Set nvi = nv.Add("StampNumber", m_StampNumber)
nvi.ValueSize = 20
  Set nvi = nv.Add("StampStatus", m_StampStatus)
nvi.ValueSize = 30
  Set nvi = nv.Add("Track_time_in", m_Track_time_in)
nvi.ValueType = adDBTimeStamp
  Set nvi = nv.Add("track_time_out", m_track_time_out)
nvi.ValueType = adDBTimeStamp
  Set nvi = nv.Add("temp_in_track", m_temp_in_track)
nvi.ValueType = adDouble
 ' Reference to WMSD_RULE
    If m_ThePartyRule_ID = "" Then
       Set nvi = nv.Add("ThePartyRule", "")
    Else
       Set nvi = nv.Add("ThePartyRule", m_ThePartyRule_ID)
    End If
    nvi.ORACLE_GUID
End Sub

'Краткое название строки
'Parameters:
'[IN]   UseServer , тип параметра: boolean = false  - ...
'Returns:
'  значение типа string
'See Also:
'Example:
' dim variable as string
' variable = me. Brief(...параметры...)
Public Function Brief(Optional ByVal UseServer As Boolean = False) As String
 Dim s As String
 If Application.WorkOffline Then

  m_Brief = ""
 m_Brief = m_Brief & QryCode & "; "
 Brief = m_Brief
 Else
  On Error GoTo bye
   If UseServer Or m_Brief = "" Then
     Application.MTZSession.GetBrief PartName, id, s
     If Len(s) > 255 Then
       Brief = Left(s, 255) & "..."
     Else
       Brief = s
     End If
       m_Brief = Brief
   Else
     Brief = m_Brief
   End If
 End If
Exit Function
bye:
    Brief = "! доступ запрещен ! (" & err.Description & ")"
End Function

'Распаковать значения полей из именованной коллекции
'Parameters:
'[IN][OUT]   nv , тип параметра: object  - ...
'See Also:
'Example:
'  call me.UnPack({параметры})
Public Sub UnPack(ByRef nv As Object)
 On Error Resume Next
If TypeName(nv) = "NamedValues" Then

  m_WareHouse_ID = nv.item("WareHouse").Value
m_QryCode = nv.item("QryCode").Value
  m_TheClient_ID = nv.item("TheClient").Value
m_ProcessDate = nv.item("ProcessDate").Value
  m_TheType_ID = nv.item("TheType").Value
  m_TheDogovor_ID = nv.item("TheDogovor").Value
m_Supplier = nv.item("Supplier").Value
m_TTN = nv.item("TTN").Value
m_TTNDate = nv.item("TTNDate").Value
m_TranspNumber = nv.item("TranspNumber").Value
m_Container = nv.item("Container").Value
m_StampNumber = nv.item("StampNumber").Value
m_StampStatus = nv.item("StampStatus").Value
m_Track_time_in = nv.item("Track_time_in").Value
m_track_time_out = nv.item("track_time_out").Value
m_temp_in_track = nv.item("temp_in_track").Value
  m_ThePartyRule_ID = nv.item("ThePartyRule").Value
Else

  m_WareHouse_ID = nv.Fields("WareHouse").Value
m_QryCode = nv.Fields("QryCode").Value
  m_TheClient_ID = nv.Fields("TheClient").Value
m_ProcessDate = nv.Fields("ProcessDate").Value
  m_TheType_ID = nv.Fields("TheType").Value
  m_TheDogovor_ID = nv.Fields("TheDogovor").Value
m_Supplier = nv.Fields("Supplier").Value
m_TTN = nv.Fields("TTN").Value
m_TTNDate = nv.Fields("TTNDate").Value
m_TranspNumber = nv.Fields("TranspNumber").Value
m_Container = nv.Fields("Container").Value
m_StampNumber = nv.Fields("StampNumber").Value
m_StampStatus = nv.Fields("StampStatus").Value
m_Track_time_in = nv.Fields("Track_time_in").Value
m_track_time_out = nv.Fields("track_time_out").Value
m_temp_in_track = nv.Fields("temp_in_track").Value
  m_ThePartyRule_ID = nv.Fields("ThePartyRule").Value
End If
End Sub

'Очистить поля
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CleanFields()
Public Sub CleanFields()
   Dim nv As NamedValues
   Dim o As WMSIN_DEF
   Set o = New WMSIN_DEF
   Set o.Application = Me.Application
   Set o.Parent = Me.Parent
   o.Pack nv
   UnPack nv
   Set o = Nothing
End Sub

'Сохранить изменение
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
'  variable = me.Save()
Public Function Save() As Boolean
   LoadFromDatabase
   If Application.WorkOffline Then Exit Function
   If Not CanChangeONLine Then Exit Function
   Dim nv As NamedValues
   Pack nv
   On Error GoTo bye
     Application.MTZSession.SaveRow2 PartName, id, Me.Parent.Parent.id, nv, Application.id
   Changed = False
   Save = True
Exit Function
bye:
  err.Raise err.Number, "WMSIN_DEF.Save", err.Description
End Function

'Удалить строку
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
'  variable = me.Delete()
Public Function Delete() As Boolean
   Dim i As Long, OK As Boolean
If Application.WorkOffline Then
  If Not CanChangeOffline Then Exit Function
   On Error GoTo bye
  m_Deleted = True
  Delete = True
Else
  If Not CanChangeONLine Then Exit Function
   Delete = Application.MTZSession.DeleteRow2(PartName, id, Application.id)
   Changed = False
   'Compact
   CloseClass
End If
Exit Function
bye:
  err.Raise err.Number, "WMSIN_DEF.Delete", err.Description
End Function

'Задать стиль защиты
'Parameters:
'[IN]   SecurityStyleID , тип параметра: string  - ...
'See Also:
'Example:
'  call me.Secure({параметры})
Public Sub Secure(ByVal SecurityStyleID As String)
If Application.WorkOffline Then Exit Sub
On Error GoTo bye
  m_SecureStyleID = Application.MTZSession.Secure("WMSIN_DEF", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "WMSIN_DEF.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "WMSIN_DEF", id
Exit Sub
bye:
  err.Raise err.Number, "WMSIN_DEF.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 m_WareHouse_ID = ""
 Set m_WareHouse = Nothing
 m_TheClient_ID = ""
 Set m_TheClient = Nothing
 m_TheType_ID = ""
 Set m_TheType = Nothing
 m_TheDogovor_ID = ""
 Set m_TheDogovor = Nothing
 m_ThePartyRule_ID = ""
 Set m_ThePartyRule = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "WMSIN_DEF.CloseClass"
 CloseParents
End Sub

'Обновить
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Refresh()
Public Sub Refresh()
    On Error Resume Next
    RowRetrived = False
    m_Brief = ""
End Sub

'Загрузить из базы данных
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.LoadFromDatabase ()
Public Sub LoadFromDatabase()
    On Error Resume Next
   If id = "" Then Exit Sub
   If Application.WorkOffline Then
     RowRetrived = True
     RetriveTime = Now
     Exit Sub
   End If
   Dim rs As ADODB.Recordset
   If Not RowRetrived Then
     CleanFields
     Set rs = Application.MTZSession.GetRow(PartName, id)
     UnPack rs
     m_SecureStyleID = rs!SecurityStyleID
     RowRetrived = True
     RetriveTime = Now
   End If
End Sub

'Найти строку раздела в дочерних объектах
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
 Dim m_FindObject As Object
 Static inFindObject As Boolean
 If StrID = "" Then Exit Function
 If InstID = "" Then Exit Function
 If inFindObject Then Exit Function
 inFindObject = True
 If StrID = PartName Then
   If InstID = id Then
     Set m_FindObject = Me
   End If
 End If

 Set FindObject = m_FindObject
 Set m_FindObject = Nothing
 inFindObject = False
End Function

'Оптимизировать занятую объектом память
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Compact()
Public Sub Compact()
 If Not Changed Then
   CleanFields
   RowRetrived = False
 End If

End Sub

'Регистрация изменения значения строки
'Parameters:
'[IN]   fieldName , тип параметра: string,
'[IN]   OldValue,, тип параметра: Variant
'[IN][OUT]   NewValue, тип параметра: Variant  - ...
'See Also:
'Example:
'  call me.OnChange({параметры})
Friend Sub OnChange(ByVal fieldName As String, ByVal OldValue, ByRef NewValue)
RaiseEvent Change(fieldName, OldValue, NewValue)
End Sub



'Загрузить из формата XML
'Parameters:
'[IN][OUT]   node , тип параметра: IXMLDOMNode,
'[IN]   LoadMode , тип параметра: integer=0  - ...
'See Also:
'Example:
'  call me.XMLLoad({параметры})
Public Sub XMLLoad(node As IXMLDOMNode, Optional ByVal LoadMode As Integer = 0)
  On Error Resume Next
  Dim e_list As IXMLDOMNodeList
  Dim e_ As IXMLDOMNode
  If LoadMode <> 2 Then m_ID = node.Attributes.getNamedItem("ID").nodeValue
  m_Deleted = node.Attributes.getNamedItem("Deleted").nodeValue
  m_IsLocked = node.Attributes.getNamedItem("IsLocked").nodeValue
  If m_IsLocked > 2 Then m_IsLocked = 0
  m_RetriveTime = node.Attributes.getNamedItem("RetriveTime").nodeValue
  m_ChangeTime = node.Attributes.getNamedItem("ChangeTime").nodeValue
  m_AccessTime = node.Attributes.getNamedItem("AccessTime").nodeValue
  If Application.WorkOffline And m_IsLocked = LockSession Then m_IsLocked = NoLock
  Secure node.Attributes.getNamedItem("SECURITYSTYLEID").nodeValue
  Set WareHouse = Nothing
  m_WareHouse_ID = node.Attributes.getNamedItem("WAREHOUSE").nodeValue
  m_WareHouse_ID_BRIEF = node.Attributes.getNamedItem("WAREHOUSE_BRIEF").nodeValue
  QryCode = Replace(node.Attributes.getNamedItem("QRYCODE").nodeValue, vbLf, vbCrLf)
  Set TheClient = Nothing
  m_TheClient_ID = node.Attributes.getNamedItem("THECLIENT").nodeValue
  m_TheClient_ID_BRIEF = node.Attributes.getNamedItem("THECLIENT_BRIEF").nodeValue
  ProcessDate = node.Attributes.getNamedItem("PROCESSDATE").nodeValue
  Set TheType = Nothing
  m_TheType_ID = node.Attributes.getNamedItem("THETYPE").nodeValue
  m_TheType_ID_BRIEF = node.Attributes.getNamedItem("THETYPE_BRIEF").nodeValue
  Set TheDogovor = Nothing
  m_TheDogovor_ID = node.Attributes.getNamedItem("THEDOGOVOR").nodeValue
  m_TheDogovor_ID_BRIEF = node.Attributes.getNamedItem("THEDOGOVOR_BRIEF").nodeValue
  Supplier = Replace(node.Attributes.getNamedItem("SUPPLIER").nodeValue, vbLf, vbCrLf)
  TTN = Replace(node.Attributes.getNamedItem("TTN").nodeValue, vbLf, vbCrLf)
  TTNDate = node.Attributes.getNamedItem("TTNDATE").nodeValue
  TranspNumber = Replace(node.Attributes.getNamedItem("TRANSPNUMBER").nodeValue, vbLf, vbCrLf)
  Container = Replace(node.Attributes.getNamedItem("CONTAINER").nodeValue, vbLf, vbCrLf)
  StampNumber = Replace(node.Attributes.getNamedItem("STAMPNUMBER").nodeValue, vbLf, vbCrLf)
  StampStatus = Replace(node.Attributes.getNamedItem("STAMPSTATUS").nodeValue, vbLf, vbCrLf)
  Track_time_in = node.Attributes.getNamedItem("TRACK_TIME_IN").nodeValue
  track_time_out = node.Attributes.getNamedItem("TRACK_TIME_OUT").nodeValue
  temp_in_track = Val(Replace(node.Attributes.getNamedItem("TEMP_IN_TRACK").nodeValue, vbLf, vbCrLf))
  Set ThePartyRule = Nothing
  m_ThePartyRule_ID = node.Attributes.getNamedItem("THEPARTYRULE").nodeValue
  m_ThePartyRule_ID_BRIEF = node.Attributes.getNamedItem("THEPARTYRULE_BRIEF").nodeValue
  On Error GoTo bye
  'if m_ChangeTime >= m_RetriveTime then m_Changed = true
  m_Changed = True
  m_RowRetrived = True
  m_Brief = ""
  On Error Resume Next
  Exit Sub
bye:
  DebugOutput err.Description
End Sub


'Сохранить в формате XML
'Parameters:
'[IN][OUT]  node , тип параметра: IXMLDOMElement,
'[IN][OUT]   xdom , тип параметра: DomDocument  - ...
'See Also:
'Example:
'  call me.XMLSave({параметры})
Public Sub XMLSave(node As IXMLDOMElement, xdom As DOMDocument)
On Error Resume Next
  Dim e_ As IXMLDOMElement
  LoadFromDatabase
  node.setAttribute "ID", m_ID
  node.setAttribute "Deleted", m_Deleted
  node.setAttribute "IsLocked", m_IsLocked
  node.setAttribute "RetriveTime", CDbl(m_RetriveTime)
  node.setAttribute "ChangeTime", CDbl(m_ChangeTime)
  node.setAttribute "SECURITYSTYLEID", m_SecureStyleID
  node.setAttribute "WAREHOUSE", m_WareHouse_ID
  If Not (WareHouse Is Nothing) Then
    node.setAttribute "WAREHOUSE_BRIEF", WareHouse.Brief
  Else
    node.setAttribute "WAREHOUSE_BRIEF", m_WareHouse_ID_BRIEF
  End If
  node.setAttribute "QRYCODE", QryCode
  node.setAttribute "THECLIENT", m_TheClient_ID
  If Not (TheClient Is Nothing) Then
    node.setAttribute "THECLIENT_BRIEF", TheClient.Brief
  Else
    node.setAttribute "THECLIENT_BRIEF", m_TheClient_ID_BRIEF
  End If
  node.setAttribute "PROCESSDATE", CDbl(ProcessDate)
  node.setAttribute "THETYPE", m_TheType_ID
  If Not (TheType Is Nothing) Then
    node.setAttribute "THETYPE_BRIEF", TheType.Brief
  Else
    node.setAttribute "THETYPE_BRIEF", m_TheType_ID_BRIEF
  End If
  node.setAttribute "THEDOGOVOR", m_TheDogovor_ID
  If Not (TheDogovor Is Nothing) Then
    node.setAttribute "THEDOGOVOR_BRIEF", TheDogovor.Brief
  Else
    node.setAttribute "THEDOGOVOR_BRIEF", m_TheDogovor_ID_BRIEF
  End If
  node.setAttribute "SUPPLIER", Supplier
  node.setAttribute "TTN", TTN
  node.setAttribute "TTNDATE", CDbl(TTNDate)
  node.setAttribute "TRANSPNUMBER", TranspNumber
  node.setAttribute "CONTAINER", Container
  node.setAttribute "STAMPNUMBER", StampNumber
  node.setAttribute "STAMPSTATUS", StampStatus
  node.setAttribute "TRACK_TIME_IN", CDbl(Track_time_in)
  node.setAttribute "TRACK_TIME_OUT", CDbl(track_time_out)
  node.setAttribute "TEMP_IN_TRACK", Replace(CStr(temp_in_track), ",", ".")
  node.setAttribute "THEPARTYRULE", m_ThePartyRule_ID
  If Not (ThePartyRule Is Nothing) Then
    node.setAttribute "THEPARTYRULE_BRIEF", ThePartyRule.Brief
  Else
    node.setAttribute "THEPARTYRULE_BRIEF", m_ThePartyRule_ID_BRIEF
  End If
  node.setAttribute "AccessTime", CDbl(m_AccessTime)
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
m_IsLocked = Application.MTZSession.IsLocked("WMSIN_DEF", id)
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
OK = Application.MTZSession.LockResource("WMSIN_DEF", id, Permanent)
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
Application.MTZSession.UnLockResource "WMSIN_DEF", id
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
CanLock = Application.MTZSession.CanLock("WMSIN_DEF", id)
End Function

'Массовое обновление измененных строк
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.BatchUpdate()
Public Sub BatchUpdate()
If Not Application.WorkOffline Then
  If Deleted Then
    Delete
    Exit Sub
  End If
  If Changed Then Save
End If
End Sub

'Загрузить все данные документа из базы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.LoadAll()
Friend Sub LoadAll()
If Not Application.WorkOffline Then
  LoadFromDatabase
End If
End Sub


'Раскрытие раздела при выборе узла в глобальном дереве
'Parameters:
'[IN][OUT]  tree , тип параметра: object,
'[IN]   key , тип параметра: string,
'[IN]   mode , тип параметра: string,
'[IN][OUT]   optional Mask , тип параметра: string = ""  - ...
'See Also:
'Example:
'  call me.Expand({параметры})
Public Sub Expand(tree As Object, ByVal key As String, ByVal mode As String, Optional Mask As String = "")
 Dim id As String, struct As String, child As String
 Dim item As Object, i As Long, nid As String, tmpid As String
 Dim tidx As Long, tid As String 'only for tree styled structure
 On Error Resume Next
 id = Mid(key, 39, 38)
 struct = Right(tree.nodes.item(key).Parent.Parent.key, Len(tree.nodes.item(key).Parent.Parent.key) - 76)
 child = Right(key, Len(key) - 76)
 If id <> m_ID Then
   Exit Sub
 Else
    Set item = Me
 End If
 tree.nodes.item(key).Sorted = True
If mode = "" Then
 Select Case child
 End Select
End If ' mode="" (Default)
End Sub



