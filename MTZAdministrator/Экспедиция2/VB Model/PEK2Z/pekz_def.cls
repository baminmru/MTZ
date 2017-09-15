VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "pekz_def"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'строка раздела Раздел описывает основные данные о заявке.
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
Private m_QueryDate As Date
Private m_Fillial As Object
Dim m_Fillial_ID As String
Dim m_Fillial_ID_BRIEF As String
Private m_PEKCode As String
Private m_PlatType As enumPlatType
Private m_TRType As Object
Dim m_TRType_ID As String
Dim m_TRType_ID_BRIEF As String
Private m_PlanedDate As Date
Private m_ClientFrom As Object
Dim m_ClientFrom_ID As String
Dim m_ClientFrom_ID_BRIEF As String
Private m_ClientTo As Object
Dim m_ClientTo_ID As String
Dim m_ClientTo_ID_BRIEF As String
Private m_ClientPayed As Object
Dim m_ClientPayed_ID As String
Dim m_ClientPayed_ID_BRIEF As String
Private m_AcceptDate As Date
Private m_VRCFinfo As String
Private m_Supplier As Object
Dim m_Supplier_ID As String
Dim m_Supplier_ID_BRIEF As String
Private m_PayDept As Object
Dim m_PayDept_ID As String
Dim m_PayDept_ID_BRIEF As String
Private m_TheDogovor As Object
Dim m_TheDogovor_ID As String
Dim m_TheDogovor_ID_BRIEF As String
Private m_IsPayed As enumBoolean
Private m_RcvInfo As String
Private m_IsNal As enumBoolean
Private m_TheComment As String
Private m_AcceptTime As Date
Private m_LoadTime As Date
Private m_LoadDate As Date
Private m_TRF As Object
Dim m_TRF_ID As String
Dim m_TRF_ID_BRIEF As String
Private m_Code1C As String
Private m_IncludeInOrder As enumBoolean
Private m_IncludeInAct As enumBoolean
Private m_SummNDS As Double
Private m_Summ As Double
Private m_SummDop As Double
Private m_SummDopNDS As Double
Private m_theActWork As Object
Dim m_theActWork_ID As String
Dim m_theActWork_ID_BRIEF As String
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
  PartName = "pekz_def"
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
  m_Application.Logger.Message "pekz_def.Init"
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
'Дата запроса

'Дата запроса
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let QueryDate(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "QueryDate", QueryDate, NewValue

   m_QueryDate = NewValue
End If
End Property

'Дата запроса
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. QueryDate
Public Property Get QueryDate() As Date
 LoadFromDatabase
 AccessTime = Now

   QueryDate = m_QueryDate
End Property
' let
'Принята в

'Принята в
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set Fillial(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Fillial", Fillial, NewValue
On Error Resume Next
m_Fillial_ID = ""
m_Fillial_ID = NewValue.id
'  set   m_Fillial= newValue
End If
End Property

'Принята в
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Fillial
Public Property Get Fillial() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_Fillial As Object
If m_Fillial_ID <> "" Then
  Set tmp_Fillial = Application.FindRowObject("PEKD_DEPT", m_Fillial_ID)
  If tmp_Fillial Is Nothing Then
    m_Fillial_ID_BRIEF = ""
  Else
    m_Fillial_ID_BRIEF = tmp_Fillial.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PEKD_DEPT" & m_Fillial_ID, tmp_Fillial
  Set Fillial = tmp_Fillial
  Exit Property
End If
  '  set Fillial = m_Fillial
End Property
' let
'№ заявки

'№ заявки
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let PEKCode(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PEKCode", PEKCode, NewValue

   m_PEKCode = NewValue
End If
End Property

'№ заявки
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. PEKCode
Public Property Get PEKCode() As String
 LoadFromDatabase
 AccessTime = Now

   PEKCode = m_PEKCode
End Property
' let
'Платит

'Платит
'Parameters:
'[IN]   newValue , тип параметра: enumPlatType  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let PlatType(ByVal NewValue As enumPlatType)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PlatType", PlatType, NewValue

   m_PlatType = NewValue
End If
End Property

'Платит
'Parameters:
' параметров нет
'Returns:
'  объект класса enumPlatType
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumPlatType
' Set variable = me. PlatType
Public Property Get PlatType() As enumPlatType
 LoadFromDatabase
 AccessTime = Now

   PlatType = m_PlatType
End Property
' let
'Тип доставки

'Тип доставки
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TRType(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TRType", TRType, NewValue
On Error Resume Next
m_TRType_ID = ""
m_TRType_ID = NewValue.id
'  set   m_TRType= newValue
End If
End Property

'Тип доставки
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TRType
Public Property Get TRType() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TRType As Object
If m_TRType_ID <> "" Then
  Set tmp_TRType = Application.FindRowObject("PEKD_TRTYPE", m_TRType_ID)
  If tmp_TRType Is Nothing Then
    m_TRType_ID_BRIEF = ""
  Else
    m_TRType_ID_BRIEF = tmp_TRType.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PEKD_TRTYPE" & m_TRType_ID, tmp_TRType
  Set TRType = tmp_TRType
  Exit Property
End If
  '  set TRType = m_TRType
End Property
' let
'Дата предполагаемой отправки

'Дата предполагаемой отправки
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let PlanedDate(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PlanedDate", PlanedDate, NewValue

   m_PlanedDate = NewValue
End If
End Property

'Дата предполагаемой отправки
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. PlanedDate
Public Property Get PlanedDate() As Date
 LoadFromDatabase
 AccessTime = Now

   PlanedDate = m_PlanedDate
End Property
' let
'Отправитель

'Отправитель
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set ClientFrom(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ClientFrom", ClientFrom, NewValue
On Error Resume Next
m_ClientFrom_ID = ""
m_ClientFrom_ID = NewValue.id
' set   m_ClientFrom= newValue
End If
End Property

'Отправитель
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. ClientFrom
Public Property Get ClientFrom() As Object
 LoadFromDatabase
 AccessTime = Now
If m_ClientFrom_ID <> "" Then
  Set ClientFrom = Application.Manager.GetInstanceObject(Right(m_ClientFrom_ID, 38))
 Exit Property
End If
  ' set ClientFrom = m_ClientFrom
End Property
' let
'Получатель

'Получатель
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set ClientTo(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ClientTo", ClientTo, NewValue
On Error Resume Next
m_ClientTo_ID = ""
m_ClientTo_ID = NewValue.id
' set   m_ClientTo= newValue
End If
End Property

'Получатель
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. ClientTo
Public Property Get ClientTo() As Object
 LoadFromDatabase
 AccessTime = Now
If m_ClientTo_ID <> "" Then
  Set ClientTo = Application.Manager.GetInstanceObject(Right(m_ClientTo_ID, 38))
 Exit Property
End If
  ' set ClientTo = m_ClientTo
End Property
' let
'Плательщик

'Плательщик
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set ClientPayed(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ClientPayed", ClientPayed, NewValue
On Error Resume Next
m_ClientPayed_ID = ""
m_ClientPayed_ID = NewValue.id
' set   m_ClientPayed= newValue
End If
End Property

'Плательщик
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. ClientPayed
Public Property Get ClientPayed() As Object
 LoadFromDatabase
 AccessTime = Now
If m_ClientPayed_ID <> "" Then
  Set ClientPayed = Application.Manager.GetInstanceObject(Right(m_ClientPayed_ID, 38))
 Exit Property
End If
  ' set ClientPayed = m_ClientPayed
End Property
' let
'Дата приема заявки

'Дата приема заявки
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let AcceptDate(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "AcceptDate", AcceptDate, NewValue

   m_AcceptDate = NewValue
End If
End Property

'Дата приема заявки
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. AcceptDate
Public Property Get AcceptDate() As Date
 LoadFromDatabase
 AccessTime = Now

   AcceptDate = m_AcceptDate
End Property
' let
'Данные отправителя

'Данные отправителя
'Parameters:
'[IN]   newValue , тип параметра: STRING  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let VRCFinfo(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "VRCFinfo", VRCFinfo, NewValue

   m_VRCFinfo = NewValue
End If
End Property

'Данные отправителя
'Parameters:
' параметров нет
'Returns:
'  значение типа STRING
'See Also:
'Example:
' dim variable as STRING
' variable = me. VRCFinfo
Public Property Get VRCFinfo() As String
 LoadFromDatabase
 AccessTime = Now

   VRCFinfo = m_VRCFinfo
End Property
' let
'Поставщик

'Поставщик
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set Supplier(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Supplier", Supplier, NewValue
On Error Resume Next
m_Supplier_ID = ""
m_Supplier_ID = NewValue.id
' set   m_Supplier= newValue
End If
End Property

'Поставщик
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Supplier
Public Property Get Supplier() As Object
 LoadFromDatabase
 AccessTime = Now
If m_Supplier_ID <> "" Then
  Set Supplier = Application.Manager.GetInstanceObject(Right(m_Supplier_ID, 38))
 Exit Property
End If
  ' set Supplier = m_Supplier
End Property
' let
'Оплачивается в

'Оплачивается в
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set PayDept(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PayDept", PayDept, NewValue
On Error Resume Next
m_PayDept_ID = ""
m_PayDept_ID = NewValue.id
'  set   m_PayDept= newValue
End If
End Property

'Оплачивается в
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. PayDept
Public Property Get PayDept() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_PayDept As Object
If m_PayDept_ID <> "" Then
  Set tmp_PayDept = Application.FindRowObject("PEKD_DEPT", m_PayDept_ID)
  If tmp_PayDept Is Nothing Then
    m_PayDept_ID_BRIEF = ""
  Else
    m_PayDept_ID_BRIEF = tmp_PayDept.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PEKD_DEPT" & m_PayDept_ID, tmp_PayDept
  Set PayDept = tmp_PayDept
  Exit Property
End If
  '  set PayDept = m_PayDept
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
'Оплачена

'Оплачена
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IsPayed(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IsPayed", IsPayed, NewValue

   m_IsPayed = NewValue
End If
End Property

'Оплачена
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. IsPayed
Public Property Get IsPayed() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   IsPayed = m_IsPayed
End Property
' let
'Данные получателя

'Данные получателя
'Parameters:
'[IN]   newValue , тип параметра: STRING  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let RcvInfo(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "RcvInfo", RcvInfo, NewValue

   m_RcvInfo = NewValue
End If
End Property

'Данные получателя
'Parameters:
' параметров нет
'Returns:
'  значение типа STRING
'See Also:
'Example:
' dim variable as STRING
' variable = me. RcvInfo
Public Property Get RcvInfo() As String
 LoadFromDatabase
 AccessTime = Now

   RcvInfo = m_RcvInfo
End Property
' let
'Наличная оплата

'Наличная оплата
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IsNal(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IsNal", IsNal, NewValue

   m_IsNal = NewValue
End If
End Property

'Наличная оплата
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. IsNal
Public Property Get IsNal() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   IsNal = m_IsNal
End Property
' let
'Примечания

'Примечания
'Parameters:
'[IN]   newValue , тип параметра: STRING  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TheComment(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheComment", TheComment, NewValue

   m_TheComment = NewValue
End If
End Property

'Примечания
'Parameters:
' параметров нет
'Returns:
'  значение типа STRING
'See Also:
'Example:
' dim variable as STRING
' variable = me. TheComment
Public Property Get TheComment() As String
 LoadFromDatabase
 AccessTime = Now

   TheComment = m_TheComment
End Property
' let
'Время приема заявки

'Время приема заявки
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let AcceptTime(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "AcceptTime", AcceptTime, NewValue

   m_AcceptTime = NewValue
End If
End Property

'Время приема заявки
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. AcceptTime
Public Property Get AcceptTime() As Date
 LoadFromDatabase
 AccessTime = Now

   AcceptTime = m_AcceptTime
End Property
' let
'Время приема груза на склад

'Время приема груза на склад
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let LoadTime(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "LoadTime", LoadTime, NewValue

   m_LoadTime = NewValue
End If
End Property

'Время приема груза на склад
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. LoadTime
Public Property Get LoadTime() As Date
 LoadFromDatabase
 AccessTime = Now

   LoadTime = m_LoadTime
End Property
' let
'Дата приема груза на склад

'Дата приема груза на склад
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let LoadDate(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "LoadDate", LoadDate, NewValue

   m_LoadDate = NewValue
End If
End Property

'Дата приема груза на склад
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. LoadDate
Public Property Get LoadDate() As Date
 LoadFromDatabase
 AccessTime = Now

   LoadDate = m_LoadDate
End Property
' let
'Тариф

'Тариф
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TRF(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TRF", TRF, NewValue
On Error Resume Next
m_TRF_ID = ""
m_TRF_ID = NewValue.id
'  set   m_TRF= newValue
End If
End Property

'Тариф
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TRF
Public Property Get TRF() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TRF As Object
If m_TRF_ID <> "" Then
  Set tmp_TRF = Application.FindRowObject("PEKD_TRFTYPE", m_TRF_ID)
  If tmp_TRF Is Nothing Then
    m_TRF_ID_BRIEF = ""
  Else
    m_TRF_ID_BRIEF = tmp_TRF.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PEKD_TRFTYPE" & m_TRF_ID, tmp_TRF
  Set TRF = tmp_TRF
  Exit Property
End If
  '  set TRF = m_TRF
End Property
' let
'Код1С

'Код1С
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Code1C(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Code1C", Code1C, NewValue

   m_Code1C = NewValue
End If
End Property

'Код1С
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. Code1C
Public Property Get Code1C() As String
 LoadFromDatabase
 AccessTime = Now

   Code1C = m_Code1C
End Property
' let
'Включен в ордер

'Включен в ордер
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IncludeInOrder(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IncludeInOrder", IncludeInOrder, NewValue

   m_IncludeInOrder = NewValue
End If
End Property

'Включен в ордер
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. IncludeInOrder
Public Property Get IncludeInOrder() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   IncludeInOrder = m_IncludeInOrder
End Property
' let
'Включена в акт

'Включена в акт
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IncludeInAct(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IncludeInAct", IncludeInAct, NewValue

   m_IncludeInAct = NewValue
End If
End Property

'Включена в акт
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. IncludeInAct
Public Property Get IncludeInAct() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   IncludeInAct = m_IncludeInAct
End Property
' let
'Сумма с НДС

'Сумма с НДС
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let SummNDS(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SummNDS", SummNDS, NewValue

   m_SummNDS = NewValue
End If
End Property

'Сумма с НДС
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. SummNDS
Public Property Get SummNDS() As Double
 LoadFromDatabase
 AccessTime = Now

   SummNDS = m_SummNDS
End Property
' let
'Сумма без НДС

'Сумма без НДС
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Summ(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Summ", Summ, NewValue

   m_Summ = NewValue
End If
End Property

'Сумма без НДС
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. Summ
Public Property Get Summ() As Double
 LoadFromDatabase
 AccessTime = Now

   Summ = m_Summ
End Property
' let
'Сумма доп. услуг без НДС

'Сумма доп. услуг без НДС
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let SummDop(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SummDop", SummDop, NewValue

   m_SummDop = NewValue
End If
End Property

'Сумма доп. услуг без НДС
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. SummDop
Public Property Get SummDop() As Double
 LoadFromDatabase
 AccessTime = Now

   SummDop = m_SummDop
End Property
' let
'Сумма доп. услуг с НДС

'Сумма доп. услуг с НДС
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let SummDopNDS(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SummDopNDS", SummDopNDS, NewValue

   m_SummDopNDS = NewValue
End If
End Property

'Сумма доп. услуг с НДС
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. SummDopNDS
Public Property Get SummDopNDS() As Double
 LoadFromDatabase
 AccessTime = Now

   SummDopNDS = m_SummDopNDS
End Property
' let
'акт выполненных работ

'акт выполненных работ
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set theActWork(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "theActWork", theActWork, NewValue
On Error Resume Next
m_theActWork_ID = ""
m_theActWork_ID = NewValue.id
' set   m_theActWork= newValue
End If
End Property

'акт выполненных работ
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. theActWork
Public Property Get theActWork() As Object
 LoadFromDatabase
 AccessTime = Now
If m_theActWork_ID <> "" Then
  Set theActWork = Application.Manager.GetInstanceObject(Right(m_theActWork_ID, 38))
 Exit Property
End If
  ' set theActWork = m_theActWork
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

  Set nvi = nv.Add("QueryDate", m_QueryDate)
nvi.ValueType = adDate
 ' Reference to PEKD_DEPT
    If m_Fillial_ID = "" Then
       Set nvi = nv.Add("Fillial", "")
    Else
       Set nvi = nv.Add("Fillial", m_Fillial_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("PEKCode", m_PEKCode)
nvi.ValueSize = 50
  Set nvi = nv.Add("PlatType", m_PlatType)
nvi.ValueType = adInteger
 ' Reference to PEKD_TRTYPE
    If m_TRType_ID = "" Then
       Set nvi = nv.Add("TRType", "")
    Else
       Set nvi = nv.Add("TRType", m_TRType_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("PlanedDate", m_PlanedDate)
nvi.ValueType = adDate
 ' Reference to object
    If m_ClientFrom_ID = "" Then
       Set nvi = nv.Add("ClientFrom", "")
    Else
       Set nvi = nv.Add("ClientFrom", m_ClientFrom_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to object
    If m_ClientTo_ID = "" Then
       Set nvi = nv.Add("ClientTo", "")
    Else
       Set nvi = nv.Add("ClientTo", m_ClientTo_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to object
    If m_ClientPayed_ID = "" Then
       Set nvi = nv.Add("ClientPayed", "")
    Else
       Set nvi = nv.Add("ClientPayed", m_ClientPayed_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("AcceptDate", m_AcceptDate)
nvi.ValueType = adDate
  Set nvi = nv.Add("VRCFinfo", m_VRCFinfo)
 ' Reference to object
    If m_Supplier_ID = "" Then
       Set nvi = nv.Add("Supplier", "")
    Else
       Set nvi = nv.Add("Supplier", m_Supplier_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to PEKD_DEPT
    If m_PayDept_ID = "" Then
       Set nvi = nv.Add("PayDept", "")
    Else
       Set nvi = nv.Add("PayDept", m_PayDept_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to object
    If m_TheDogovor_ID = "" Then
       Set nvi = nv.Add("TheDogovor", "")
    Else
       Set nvi = nv.Add("TheDogovor", m_TheDogovor_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("IsPayed", m_IsPayed)
nvi.ValueType = adInteger
  Set nvi = nv.Add("RcvInfo", m_RcvInfo)
  Set nvi = nv.Add("IsNal", m_IsNal)
nvi.ValueType = adInteger
  Set nvi = nv.Add("TheComment", m_TheComment)
  Set nvi = nv.Add("AcceptTime", m_AcceptTime)
nvi.ValueType = adDBTime
  Set nvi = nv.Add("LoadTime", m_LoadTime)
nvi.ValueType = adDBTime
  Set nvi = nv.Add("LoadDate", m_LoadDate)
nvi.ValueType = adDate
 ' Reference to PEKD_TRFTYPE
    If m_TRF_ID = "" Then
       Set nvi = nv.Add("TRF", "")
    Else
       Set nvi = nv.Add("TRF", m_TRF_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("Code1C", m_Code1C)
nvi.ValueSize = 40
  Set nvi = nv.Add("IncludeInOrder", m_IncludeInOrder)
nvi.ValueType = adInteger
  Set nvi = nv.Add("IncludeInAct", m_IncludeInAct)
nvi.ValueType = adInteger
  Set nvi = nv.Add("SummNDS", m_SummNDS)
nvi.ValueType = adDouble
  Set nvi = nv.Add("Summ", m_Summ)
nvi.ValueType = adDouble
  Set nvi = nv.Add("SummDop", m_SummDop)
nvi.ValueType = adDouble
  Set nvi = nv.Add("SummDopNDS", m_SummDopNDS)
nvi.ValueType = adDouble
 ' Reference to object
    If m_theActWork_ID = "" Then
       Set nvi = nv.Add("theActWork", "")
    Else
       Set nvi = nv.Add("theActWork", m_theActWork_ID)
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
 m_Brief = m_Brief & PEKCode & "; "
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

m_QueryDate = nv.item("QueryDate").Value
  m_Fillial_ID = nv.item("Fillial").Value
m_PEKCode = nv.item("PEKCode").Value
m_PlatType = nv.item("PlatType").Value
  m_TRType_ID = nv.item("TRType").Value
m_PlanedDate = nv.item("PlanedDate").Value
  m_ClientFrom_ID = nv.item("ClientFrom").Value
  m_ClientTo_ID = nv.item("ClientTo").Value
  m_ClientPayed_ID = nv.item("ClientPayed").Value
m_AcceptDate = nv.item("AcceptDate").Value
m_VRCFinfo = nv.item("VRCFinfo").Value
  m_Supplier_ID = nv.item("Supplier").Value
  m_PayDept_ID = nv.item("PayDept").Value
  m_TheDogovor_ID = nv.item("TheDogovor").Value
m_IsPayed = nv.item("IsPayed").Value
m_RcvInfo = nv.item("RcvInfo").Value
m_IsNal = nv.item("IsNal").Value
m_TheComment = nv.item("TheComment").Value
m_AcceptTime = nv.item("AcceptTime").Value
m_LoadTime = nv.item("LoadTime").Value
m_LoadDate = nv.item("LoadDate").Value
  m_TRF_ID = nv.item("TRF").Value
m_Code1C = nv.item("Code1C").Value
m_IncludeInOrder = nv.item("IncludeInOrder").Value
m_IncludeInAct = nv.item("IncludeInAct").Value
m_SummNDS = nv.item("SummNDS").Value
m_Summ = nv.item("Summ").Value
m_SummDop = nv.item("SummDop").Value
m_SummDopNDS = nv.item("SummDopNDS").Value
  m_theActWork_ID = nv.item("theActWork").Value
Else

m_QueryDate = nv.Fields("QueryDate").Value
  m_Fillial_ID = nv.Fields("Fillial").Value
m_PEKCode = nv.Fields("PEKCode").Value
m_PlatType = nv.Fields("PlatType").Value
  m_TRType_ID = nv.Fields("TRType").Value
m_PlanedDate = nv.Fields("PlanedDate").Value
  m_ClientFrom_ID = nv.Fields("ClientFrom").Value
  m_ClientTo_ID = nv.Fields("ClientTo").Value
  m_ClientPayed_ID = nv.Fields("ClientPayed").Value
m_AcceptDate = nv.Fields("AcceptDate").Value
m_VRCFinfo = nv.Fields("VRCFinfo").Value
  m_Supplier_ID = nv.Fields("Supplier").Value
  m_PayDept_ID = nv.Fields("PayDept").Value
  m_TheDogovor_ID = nv.Fields("TheDogovor").Value
m_IsPayed = nv.Fields("IsPayed").Value
m_RcvInfo = nv.Fields("RcvInfo").Value
m_IsNal = nv.Fields("IsNal").Value
m_TheComment = nv.Fields("TheComment").Value
m_AcceptTime = nv.Fields("AcceptTime").Value
m_LoadTime = nv.Fields("LoadTime").Value
m_LoadDate = nv.Fields("LoadDate").Value
  m_TRF_ID = nv.Fields("TRF").Value
m_Code1C = nv.Fields("Code1C").Value
m_IncludeInOrder = nv.Fields("IncludeInOrder").Value
m_IncludeInAct = nv.Fields("IncludeInAct").Value
m_SummNDS = nv.Fields("SummNDS").Value
m_Summ = nv.Fields("Summ").Value
m_SummDop = nv.Fields("SummDop").Value
m_SummDopNDS = nv.Fields("SummDopNDS").Value
  m_theActWork_ID = nv.Fields("theActWork").Value
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
   Dim o As pekz_def
   Set o = New pekz_def
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
  err.Raise err.Number, "pekz_def.Save", err.Description
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
  err.Raise err.Number, "pekz_def.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("pekz_def", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "pekz_def.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "pekz_def", id
Exit Sub
bye:
  err.Raise err.Number, "pekz_def.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 m_Fillial_ID = ""
 Set m_Fillial = Nothing
 m_TRType_ID = ""
 Set m_TRType = Nothing
 m_ClientFrom_ID = ""
 Set m_ClientFrom = Nothing
 m_ClientTo_ID = ""
 Set m_ClientTo = Nothing
 m_ClientPayed_ID = ""
 Set m_ClientPayed = Nothing
 m_Supplier_ID = ""
 Set m_Supplier = Nothing
 m_PayDept_ID = ""
 Set m_PayDept = Nothing
 m_TheDogovor_ID = ""
 Set m_TheDogovor = Nothing
 m_TRF_ID = ""
 Set m_TRF = Nothing
 m_theActWork_ID = ""
 Set m_theActWork = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "pekz_def.CloseClass"
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
  QueryDate = node.Attributes.getNamedItem("QUERYDATE").nodeValue
  Set Fillial = Nothing
  m_Fillial_ID = node.Attributes.getNamedItem("FILLIAL").nodeValue
  m_Fillial_ID_BRIEF = node.Attributes.getNamedItem("FILLIAL_BRIEF").nodeValue
  PEKCode = Replace(node.Attributes.getNamedItem("PEKCODE").nodeValue, vbLf, vbCrLf)
  PlatType = node.Attributes.getNamedItem("PLATTYPE").nodeValue
  Set TRType = Nothing
  m_TRType_ID = node.Attributes.getNamedItem("TRTYPE").nodeValue
  m_TRType_ID_BRIEF = node.Attributes.getNamedItem("TRTYPE_BRIEF").nodeValue
  PlanedDate = node.Attributes.getNamedItem("PLANEDDATE").nodeValue
  Set ClientFrom = Nothing
  m_ClientFrom_ID = node.Attributes.getNamedItem("CLIENTFROM").nodeValue
  m_ClientFrom_ID_BRIEF = node.Attributes.getNamedItem("CLIENTFROM_BRIEF").nodeValue
  Set ClientTo = Nothing
  m_ClientTo_ID = node.Attributes.getNamedItem("CLIENTTO").nodeValue
  m_ClientTo_ID_BRIEF = node.Attributes.getNamedItem("CLIENTTO_BRIEF").nodeValue
  Set ClientPayed = Nothing
  m_ClientPayed_ID = node.Attributes.getNamedItem("CLIENTPAYED").nodeValue
  m_ClientPayed_ID_BRIEF = node.Attributes.getNamedItem("CLIENTPAYED_BRIEF").nodeValue
  AcceptDate = node.Attributes.getNamedItem("ACCEPTDATE").nodeValue
  VRCFinfo = Replace(node.Attributes.getNamedItem("VRCFINFO").nodeValue, vbLf, vbCrLf)
  Set Supplier = Nothing
  m_Supplier_ID = node.Attributes.getNamedItem("SUPPLIER").nodeValue
  m_Supplier_ID_BRIEF = node.Attributes.getNamedItem("SUPPLIER_BRIEF").nodeValue
  Set PayDept = Nothing
  m_PayDept_ID = node.Attributes.getNamedItem("PAYDEPT").nodeValue
  m_PayDept_ID_BRIEF = node.Attributes.getNamedItem("PAYDEPT_BRIEF").nodeValue
  Set TheDogovor = Nothing
  m_TheDogovor_ID = node.Attributes.getNamedItem("THEDOGOVOR").nodeValue
  m_TheDogovor_ID_BRIEF = node.Attributes.getNamedItem("THEDOGOVOR_BRIEF").nodeValue
  IsPayed = node.Attributes.getNamedItem("ISPAYED").nodeValue
  RcvInfo = Replace(node.Attributes.getNamedItem("RCVINFO").nodeValue, vbLf, vbCrLf)
  IsNal = node.Attributes.getNamedItem("ISNAL").nodeValue
  TheComment = Replace(node.Attributes.getNamedItem("THECOMMENT").nodeValue, vbLf, vbCrLf)
  AcceptTime = node.Attributes.getNamedItem("ACCEPTTIME").nodeValue
  LoadTime = node.Attributes.getNamedItem("LOADTIME").nodeValue
  LoadDate = node.Attributes.getNamedItem("LOADDATE").nodeValue
  Set TRF = Nothing
  m_TRF_ID = node.Attributes.getNamedItem("TRF").nodeValue
  m_TRF_ID_BRIEF = node.Attributes.getNamedItem("TRF_BRIEF").nodeValue
  Code1C = Replace(node.Attributes.getNamedItem("CODE1C").nodeValue, vbLf, vbCrLf)
  IncludeInOrder = node.Attributes.getNamedItem("INCLUDEINORDER").nodeValue
  IncludeInAct = node.Attributes.getNamedItem("INCLUDEINACT").nodeValue
  SummNDS = Val(Replace(node.Attributes.getNamedItem("SUMMNDS").nodeValue, vbLf, vbCrLf))
  Summ = Val(Replace(node.Attributes.getNamedItem("SUMM").nodeValue, vbLf, vbCrLf))
  SummDop = Val(Replace(node.Attributes.getNamedItem("SUMMDOP").nodeValue, vbLf, vbCrLf))
  SummDopNDS = Val(Replace(node.Attributes.getNamedItem("SUMMDOPNDS").nodeValue, vbLf, vbCrLf))
  Set theActWork = Nothing
  m_theActWork_ID = node.Attributes.getNamedItem("THEACTWORK").nodeValue
  m_theActWork_ID_BRIEF = node.Attributes.getNamedItem("THEACTWORK_BRIEF").nodeValue
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
  node.setAttribute "QUERYDATE", CDbl(QueryDate)
  node.setAttribute "FILLIAL", m_Fillial_ID
  If Not (Fillial Is Nothing) Then
    node.setAttribute "FILLIAL_BRIEF", Fillial.Brief
  Else
    node.setAttribute "FILLIAL_BRIEF", m_Fillial_ID_BRIEF
  End If
  node.setAttribute "PEKCODE", PEKCode
  node.setAttribute "PLATTYPE", PlatType
  node.setAttribute "TRTYPE", m_TRType_ID
  If Not (TRType Is Nothing) Then
    node.setAttribute "TRTYPE_BRIEF", TRType.Brief
  Else
    node.setAttribute "TRTYPE_BRIEF", m_TRType_ID_BRIEF
  End If
  node.setAttribute "PLANEDDATE", CDbl(PlanedDate)
  node.setAttribute "CLIENTFROM", m_ClientFrom_ID
  If Not (ClientFrom Is Nothing) Then
    node.setAttribute "CLIENTFROM_BRIEF", ClientFrom.Brief
  Else
    node.setAttribute "CLIENTFROM_BRIEF", m_ClientFrom_ID_BRIEF
  End If
  node.setAttribute "CLIENTTO", m_ClientTo_ID
  If Not (ClientTo Is Nothing) Then
    node.setAttribute "CLIENTTO_BRIEF", ClientTo.Brief
  Else
    node.setAttribute "CLIENTTO_BRIEF", m_ClientTo_ID_BRIEF
  End If
  node.setAttribute "CLIENTPAYED", m_ClientPayed_ID
  If Not (ClientPayed Is Nothing) Then
    node.setAttribute "CLIENTPAYED_BRIEF", ClientPayed.Brief
  Else
    node.setAttribute "CLIENTPAYED_BRIEF", m_ClientPayed_ID_BRIEF
  End If
  node.setAttribute "ACCEPTDATE", CDbl(AcceptDate)
  node.setAttribute "VRCFINFO", VRCFinfo
  node.setAttribute "SUPPLIER", m_Supplier_ID
  If Not (Supplier Is Nothing) Then
    node.setAttribute "SUPPLIER_BRIEF", Supplier.Brief
  Else
    node.setAttribute "SUPPLIER_BRIEF", m_Supplier_ID_BRIEF
  End If
  node.setAttribute "PAYDEPT", m_PayDept_ID
  If Not (PayDept Is Nothing) Then
    node.setAttribute "PAYDEPT_BRIEF", PayDept.Brief
  Else
    node.setAttribute "PAYDEPT_BRIEF", m_PayDept_ID_BRIEF
  End If
  node.setAttribute "THEDOGOVOR", m_TheDogovor_ID
  If Not (TheDogovor Is Nothing) Then
    node.setAttribute "THEDOGOVOR_BRIEF", TheDogovor.Brief
  Else
    node.setAttribute "THEDOGOVOR_BRIEF", m_TheDogovor_ID_BRIEF
  End If
  node.setAttribute "ISPAYED", IsPayed
  node.setAttribute "RCVINFO", RcvInfo
  node.setAttribute "ISNAL", IsNal
  node.setAttribute "THECOMMENT", TheComment
  node.setAttribute "ACCEPTTIME", CDbl(AcceptTime)
  node.setAttribute "LOADTIME", CDbl(LoadTime)
  node.setAttribute "LOADDATE", CDbl(LoadDate)
  node.setAttribute "TRF", m_TRF_ID
  If Not (TRF Is Nothing) Then
    node.setAttribute "TRF_BRIEF", TRF.Brief
  Else
    node.setAttribute "TRF_BRIEF", m_TRF_ID_BRIEF
  End If
  node.setAttribute "CODE1C", Code1C
  node.setAttribute "INCLUDEINORDER", IncludeInOrder
  node.setAttribute "INCLUDEINACT", IncludeInAct
  node.setAttribute "SUMMNDS", Replace(CStr(SummNDS), ",", ".")
  node.setAttribute "SUMM", Replace(CStr(Summ), ",", ".")
  node.setAttribute "SUMMDOP", Replace(CStr(SummDop), ",", ".")
  node.setAttribute "SUMMDOPNDS", Replace(CStr(SummDopNDS), ",", ".")
  node.setAttribute "THEACTWORK", m_theActWork_ID
  If Not (theActWork Is Nothing) Then
    node.setAttribute "THEACTWORK_BRIEF", theActWork.Brief
  Else
    node.setAttribute "THEACTWORK_BRIEF", m_theActWork_ID_BRIEF
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
m_IsLocked = Application.MTZSession.IsLocked("pekz_def", id)
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
OK = Application.MTZSession.LockResource("pekz_def", id, Permanent)
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
Application.MTZSession.UnLockResource "pekz_def", id
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
CanLock = Application.MTZSession.CanLock("pekz_def", id)
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
If mode = "prnt" Then
 Select Case child
End Select
End If ' mode="prnt"
If mode = "path" Then
 Select Case child
End Select
End If ' mode="path"
If mode = "read" Then
 Select Case child
End Select
End If ' mode="read"
If mode = "main" Then
 Select Case child
End Select
End If ' mode="main"
If mode = "sent" Then
 Select Case child
End Select
End If ' mode="sent"
If mode = "done" Then
 Select Case child
End Select
End If ' mode="done"
If mode = "" Then
 Select Case child
 End Select
End If ' mode="" (Default)
End Sub



