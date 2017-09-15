VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "BDEVICES"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'строка раздела Подключенные к узлу устройства
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
Private m_ID_BU As Object
Dim m_ID_BU_ID As String
Dim m_ID_BU_ID_BRIEF As String
Private m_ID_DEV As Object
Dim m_ID_DEV_ID As String
Dim m_ID_DEV_ID_BRIEF As String
Private m_ID_MASK_CURR As Object
Dim m_ID_MASK_CURR_ID As String
Dim m_ID_MASK_CURR_ID_BRIEF As String
Private m_ID_MASK_HOUR As Object
Dim m_ID_MASK_HOUR_ID As String
Dim m_ID_MASK_HOUR_ID_BRIEF As String
Private m_ID_MASK_24 As Object
Dim m_ID_MASK_24_ID As String
Dim m_ID_MASK_24_ID_BRIEF As String
Private m_ID_MASK_SUM As Object
Dim m_ID_MASK_SUM_ID As String
Dim m_ID_MASK_SUM_ID_BRIEF As String
Private m_SCHEMA_ID As Object
Dim m_SCHEMA_ID_ID As String
Dim m_SCHEMA_ID_ID_BRIEF As String
Private m_report_hour As Object
Dim m_report_hour_ID As String
Dim m_report_hour_ID_BRIEF As String
Private m_report_day As Object
Dim m_report_day_ID As String
Dim m_report_day_ID_BRIEF As String
Private m_NPIP As String
Private m_NPPASSWORD As String
Private m_NPLOCK As Date
Private m_CONNECTED As enumBoolean
Private m_ID_MD As enumBoolean
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
  PartName = "BDEVICES"
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
  m_Application.Logger.Message "BDEVICES.Init"
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
'Здание

'Здание
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set ID_BU(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ID_BU", ID_BU, NewValue
On Error Resume Next
m_ID_BU_ID = ""
m_ID_BU_ID = NewValue.id
'  set   m_ID_BU= newValue
End If
End Property

'Здание
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. ID_BU
Public Property Get ID_BU() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_ID_BU As Object
If m_ID_BU_ID <> "" Then
  Set tmp_ID_BU = Application.FindRowObject("BBUILDINGS", m_ID_BU_ID)
  If tmp_ID_BU Is Nothing Then
    m_ID_BU_ID_BRIEF = ""
  Else
    m_ID_BU_ID_BRIEF = tmp_ID_BU.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "BBUILDINGS" & m_ID_BU_ID, tmp_ID_BU
  Set ID_BU = tmp_ID_BU
  Exit Property
End If
  '  set ID_BU = m_ID_BU
End Property
' let
'Устройство

'Устройство
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set ID_DEV(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ID_DEV", ID_DEV, NewValue
On Error Resume Next
m_ID_DEV_ID = ""
m_ID_DEV_ID = NewValue.id
'  set   m_ID_DEV= newValue
End If
End Property

'Устройство
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. ID_DEV
Public Property Get ID_DEV() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_ID_DEV As Object
If m_ID_DEV_ID <> "" Then
  Set tmp_ID_DEV = Application.FindRowObject("DEVICES", m_ID_DEV_ID)
  If tmp_ID_DEV Is Nothing Then
    m_ID_DEV_ID_BRIEF = ""
  Else
    m_ID_DEV_ID_BRIEF = tmp_ID_DEV.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "DEVICES" & m_ID_DEV_ID, tmp_ID_DEV
  Set ID_DEV = tmp_ID_DEV
  Exit Property
End If
  '  set ID_DEV = m_ID_DEV
End Property
' let
'Шаблон отображения текущих

'Шаблон отображения текущих
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set ID_MASK_CURR(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ID_MASK_CURR", ID_MASK_CURR, NewValue
On Error Resume Next
m_ID_MASK_CURR_ID = ""
m_ID_MASK_CURR_ID = NewValue.id
'  set   m_ID_MASK_CURR= newValue
End If
End Property

'Шаблон отображения текущих
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. ID_MASK_CURR
Public Property Get ID_MASK_CURR() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_ID_MASK_CURR As Object
If m_ID_MASK_CURR_ID <> "" Then
  Set tmp_ID_MASK_CURR = Application.FindRowObject("MASKS", m_ID_MASK_CURR_ID)
  If tmp_ID_MASK_CURR Is Nothing Then
    m_ID_MASK_CURR_ID_BRIEF = ""
  Else
    m_ID_MASK_CURR_ID_BRIEF = tmp_ID_MASK_CURR.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "MASKS" & m_ID_MASK_CURR_ID, tmp_ID_MASK_CURR
  Set ID_MASK_CURR = tmp_ID_MASK_CURR
  Exit Property
End If
  '  set ID_MASK_CURR = m_ID_MASK_CURR
End Property
' let
'Шаблон отображения часовых

'Шаблон отображения часовых
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set ID_MASK_HOUR(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ID_MASK_HOUR", ID_MASK_HOUR, NewValue
On Error Resume Next
m_ID_MASK_HOUR_ID = ""
m_ID_MASK_HOUR_ID = NewValue.id
'  set   m_ID_MASK_HOUR= newValue
End If
End Property

'Шаблон отображения часовых
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. ID_MASK_HOUR
Public Property Get ID_MASK_HOUR() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_ID_MASK_HOUR As Object
If m_ID_MASK_HOUR_ID <> "" Then
  Set tmp_ID_MASK_HOUR = Application.FindRowObject("MASKS", m_ID_MASK_HOUR_ID)
  If tmp_ID_MASK_HOUR Is Nothing Then
    m_ID_MASK_HOUR_ID_BRIEF = ""
  Else
    m_ID_MASK_HOUR_ID_BRIEF = tmp_ID_MASK_HOUR.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "MASKS" & m_ID_MASK_HOUR_ID, tmp_ID_MASK_HOUR
  Set ID_MASK_HOUR = tmp_ID_MASK_HOUR
  Exit Property
End If
  '  set ID_MASK_HOUR = m_ID_MASK_HOUR
End Property
' let
'Шаблон опроса суточных

'Шаблон опроса суточных
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set ID_MASK_24(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ID_MASK_24", ID_MASK_24, NewValue
On Error Resume Next
m_ID_MASK_24_ID = ""
m_ID_MASK_24_ID = NewValue.id
'  set   m_ID_MASK_24= newValue
End If
End Property

'Шаблон опроса суточных
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. ID_MASK_24
Public Property Get ID_MASK_24() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_ID_MASK_24 As Object
If m_ID_MASK_24_ID <> "" Then
  Set tmp_ID_MASK_24 = Application.FindRowObject("MASKS", m_ID_MASK_24_ID)
  If tmp_ID_MASK_24 Is Nothing Then
    m_ID_MASK_24_ID_BRIEF = ""
  Else
    m_ID_MASK_24_ID_BRIEF = tmp_ID_MASK_24.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "MASKS" & m_ID_MASK_24_ID, tmp_ID_MASK_24
  Set ID_MASK_24 = tmp_ID_MASK_24
  Exit Property
End If
  '  set ID_MASK_24 = m_ID_MASK_24
End Property
' let
'Шаблон опроса итоговых

'Шаблон опроса итоговых
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set ID_MASK_SUM(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ID_MASK_SUM", ID_MASK_SUM, NewValue
On Error Resume Next
m_ID_MASK_SUM_ID = ""
m_ID_MASK_SUM_ID = NewValue.id
'  set   m_ID_MASK_SUM= newValue
End If
End Property

'Шаблон опроса итоговых
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. ID_MASK_SUM
Public Property Get ID_MASK_SUM() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_ID_MASK_SUM As Object
If m_ID_MASK_SUM_ID <> "" Then
  Set tmp_ID_MASK_SUM = Application.FindRowObject("MASKS", m_ID_MASK_SUM_ID)
  If tmp_ID_MASK_SUM Is Nothing Then
    m_ID_MASK_SUM_ID_BRIEF = ""
  Else
    m_ID_MASK_SUM_ID_BRIEF = tmp_ID_MASK_SUM.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "MASKS" & m_ID_MASK_SUM_ID, tmp_ID_MASK_SUM
  Set ID_MASK_SUM = tmp_ID_MASK_SUM
  Exit Property
End If
  '  set ID_MASK_SUM = m_ID_MASK_SUM
End Property
' let
'Схема подключения

'Схема подключения
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set SCHEMA_ID(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SCHEMA_ID", SCHEMA_ID, NewValue
On Error Resume Next
m_SCHEMA_ID_ID = ""
m_SCHEMA_ID_ID = NewValue.id
'  set   m_SCHEMA_ID= newValue
End If
End Property

'Схема подключения
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. SCHEMA_ID
Public Property Get SCHEMA_ID() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_SCHEMA_ID As Object
If m_SCHEMA_ID_ID <> "" Then
  Set tmp_SCHEMA_ID = Application.FindRowObject("DEVSCHEMA", m_SCHEMA_ID_ID)
  If tmp_SCHEMA_ID Is Nothing Then
    m_SCHEMA_ID_ID_BRIEF = ""
  Else
    m_SCHEMA_ID_ID_BRIEF = tmp_SCHEMA_ID.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "DEVSCHEMA" & m_SCHEMA_ID_ID, tmp_SCHEMA_ID
  Set SCHEMA_ID = tmp_SCHEMA_ID
  Exit Property
End If
  '  set SCHEMA_ID = m_SCHEMA_ID
End Property
' let
'Отчет по часовым

'Отчет по часовым
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set report_hour(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "report_hour", report_hour, NewValue
On Error Resume Next
m_report_hour_ID = ""
m_report_hour_ID = NewValue.id
'  set   m_report_hour= newValue
End If
End Property

'Отчет по часовым
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. report_hour
Public Property Get report_hour() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_report_hour As Object
If m_report_hour_ID <> "" Then
  Set tmp_report_hour = Application.FindRowObject("REPORT", m_report_hour_ID)
  If tmp_report_hour Is Nothing Then
    m_report_hour_ID_BRIEF = ""
  Else
    m_report_hour_ID_BRIEF = tmp_report_hour.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "REPORT" & m_report_hour_ID, tmp_report_hour
  Set report_hour = tmp_report_hour
  Exit Property
End If
  '  set report_hour = m_report_hour
End Property
' let
'Отчет по суточным

'Отчет по суточным
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set report_day(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "report_day", report_day, NewValue
On Error Resume Next
m_report_day_ID = ""
m_report_day_ID = NewValue.id
'  set   m_report_day= newValue
End If
End Property

'Отчет по суточным
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. report_day
Public Property Get report_day() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_report_day As Object
If m_report_day_ID <> "" Then
  Set tmp_report_day = Application.FindRowObject("REPORT", m_report_day_ID)
  If tmp_report_day Is Nothing Then
    m_report_day_ID_BRIEF = ""
  Else
    m_report_day_ID_BRIEF = tmp_report_day.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "REPORT" & m_report_day_ID, tmp_report_day
  Set report_day = tmp_report_day
  Exit Property
End If
  '  set report_day = m_report_day
End Property
' let
'IP адрес NPORT

'IP адрес NPORT
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let NPIP(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "NPIP", NPIP, NewValue

   m_NPIP = NewValue
End If
End Property

'IP адрес NPORT
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. NPIP
Public Property Get NPIP() As String
 LoadFromDatabase
 AccessTime = Now

   NPIP = m_NPIP
End Property
' let
'Пароль к NPORT

'Пароль к NPORT
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let NPPASSWORD(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "NPPASSWORD", NPPASSWORD, NewValue

   m_NPPASSWORD = NewValue
End If
End Property

'Пароль к NPORT
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. NPPASSWORD
Public Property Get NPPASSWORD() As String
 LoadFromDatabase
 AccessTime = Now

   NPPASSWORD = m_NPPASSWORD
End Property
' let
'Время до которого устройство считается заблокированным

'Время до которого устройство считается заблокированным
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let NPLOCK(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "NPLOCK", NPLOCK, NewValue

   m_NPLOCK = NewValue
End If
End Property

'Время до которого устройство считается заблокированным
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. NPLOCK
Public Property Get NPLOCK() As Date
 LoadFromDatabase
 AccessTime = Now

   NPLOCK = m_NPLOCK
End Property
' let
'1 - подключен  0 - отключен

'1 - подключен  0 - отключен
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let CONNECTED(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CONNECTED", CONNECTED, NewValue

   m_CONNECTED = NewValue
End If
End Property

'1 - подключен  0 - отключен
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. CONNECTED
Public Property Get CONNECTED() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   CONNECTED = m_CONNECTED
End Property
' let
'Автоматический опрос

'Автоматический опрос
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ID_MD(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ID_MD", ID_MD, NewValue

   m_ID_MD = NewValue
End If
End Property

'Автоматический опрос
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. ID_MD
Public Property Get ID_MD() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   ID_MD = m_ID_MD
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

 ' Reference to BBUILDINGS
    If m_ID_BU_ID = "" Then
       Set nvi = nv.Add("ID_BU", "")
    Else
       Set nvi = nv.Add("ID_BU", m_ID_BU_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to DEVICES
    If m_ID_DEV_ID = "" Then
       Set nvi = nv.Add("ID_DEV", "")
    Else
       Set nvi = nv.Add("ID_DEV", m_ID_DEV_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to MASKS
    If m_ID_MASK_CURR_ID = "" Then
       Set nvi = nv.Add("ID_MASK_CURR", "")
    Else
       Set nvi = nv.Add("ID_MASK_CURR", m_ID_MASK_CURR_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to MASKS
    If m_ID_MASK_HOUR_ID = "" Then
       Set nvi = nv.Add("ID_MASK_HOUR", "")
    Else
       Set nvi = nv.Add("ID_MASK_HOUR", m_ID_MASK_HOUR_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to MASKS
    If m_ID_MASK_24_ID = "" Then
       Set nvi = nv.Add("ID_MASK_24", "")
    Else
       Set nvi = nv.Add("ID_MASK_24", m_ID_MASK_24_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to MASKS
    If m_ID_MASK_SUM_ID = "" Then
       Set nvi = nv.Add("ID_MASK_SUM", "")
    Else
       Set nvi = nv.Add("ID_MASK_SUM", m_ID_MASK_SUM_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to DEVSCHEMA
    If m_SCHEMA_ID_ID = "" Then
       Set nvi = nv.Add("SCHEMA_ID", "")
    Else
       Set nvi = nv.Add("SCHEMA_ID", m_SCHEMA_ID_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to REPORT
    If m_report_hour_ID = "" Then
       Set nvi = nv.Add("report_hour", "")
    Else
       Set nvi = nv.Add("report_hour", m_report_hour_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to REPORT
    If m_report_day_ID = "" Then
       Set nvi = nv.Add("report_day", "")
    Else
       Set nvi = nv.Add("report_day", m_report_day_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("NPIP", m_NPIP)
nvi.ValueSize = 80
  Set nvi = nv.Add("NPPASSWORD", m_NPPASSWORD)
nvi.ValueSize = 160
  Set nvi = nv.Add("NPLOCK", m_NPLOCK)
nvi.ValueType = adDBTimeStamp
  Set nvi = nv.Add("CONNECTED", m_CONNECTED)
nvi.ValueType = adInteger
  Set nvi = nv.Add("ID_MD", m_ID_MD)
nvi.ValueType = adInteger
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
   If ID_BU Is Nothing Then
     m_Brief = m_Brief & "{" & m_ID_BU_ID_BRIEF & "}; "
   Else
     m_Brief = m_Brief & "{" & ID_BU.Brief & "}; "
   End If
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

  m_ID_BU_ID = nv.item("ID_BU").Value
  m_ID_DEV_ID = nv.item("ID_DEV").Value
  m_ID_MASK_CURR_ID = nv.item("ID_MASK_CURR").Value
  m_ID_MASK_HOUR_ID = nv.item("ID_MASK_HOUR").Value
  m_ID_MASK_24_ID = nv.item("ID_MASK_24").Value
  m_ID_MASK_SUM_ID = nv.item("ID_MASK_SUM").Value
  m_SCHEMA_ID_ID = nv.item("SCHEMA_ID").Value
  m_report_hour_ID = nv.item("report_hour").Value
  m_report_day_ID = nv.item("report_day").Value
m_NPIP = nv.item("NPIP").Value
m_NPPASSWORD = nv.item("NPPASSWORD").Value
m_NPLOCK = nv.item("NPLOCK").Value
m_CONNECTED = nv.item("CONNECTED").Value
m_ID_MD = nv.item("ID_MD").Value
Else

  m_ID_BU_ID = nv.Fields("ID_BU").Value
  m_ID_DEV_ID = nv.Fields("ID_DEV").Value
  m_ID_MASK_CURR_ID = nv.Fields("ID_MASK_CURR").Value
  m_ID_MASK_HOUR_ID = nv.Fields("ID_MASK_HOUR").Value
  m_ID_MASK_24_ID = nv.Fields("ID_MASK_24").Value
  m_ID_MASK_SUM_ID = nv.Fields("ID_MASK_SUM").Value
  m_SCHEMA_ID_ID = nv.Fields("SCHEMA_ID").Value
  m_report_hour_ID = nv.Fields("report_hour").Value
  m_report_day_ID = nv.Fields("report_day").Value
m_NPIP = nv.Fields("NPIP").Value
m_NPPASSWORD = nv.Fields("NPPASSWORD").Value
m_NPLOCK = nv.Fields("NPLOCK").Value
m_CONNECTED = nv.Fields("CONNECTED").Value
m_ID_MD = nv.Fields("ID_MD").Value
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
   Dim o As BDEVICES
   Set o = New BDEVICES
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
  err.Raise err.Number, "BDEVICES.Save", err.Description
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
  err.Raise err.Number, "BDEVICES.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("BDEVICES", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "BDEVICES.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "BDEVICES", id
Exit Sub
bye:
  err.Raise err.Number, "BDEVICES.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 m_ID_BU_ID = ""
 Set m_ID_BU = Nothing
 m_ID_DEV_ID = ""
 Set m_ID_DEV = Nothing
 m_ID_MASK_CURR_ID = ""
 Set m_ID_MASK_CURR = Nothing
 m_ID_MASK_HOUR_ID = ""
 Set m_ID_MASK_HOUR = Nothing
 m_ID_MASK_24_ID = ""
 Set m_ID_MASK_24 = Nothing
 m_ID_MASK_SUM_ID = ""
 Set m_ID_MASK_SUM = Nothing
 m_SCHEMA_ID_ID = ""
 Set m_SCHEMA_ID = Nothing
 m_report_hour_ID = ""
 Set m_report_hour = Nothing
 m_report_day_ID = ""
 Set m_report_day = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "BDEVICES.CloseClass"
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
  Set ID_BU = Nothing
  m_ID_BU_ID = node.Attributes.getNamedItem("ID_BU").nodeValue
  m_ID_BU_ID_BRIEF = node.Attributes.getNamedItem("ID_BU_BRIEF").nodeValue
  Set ID_DEV = Nothing
  m_ID_DEV_ID = node.Attributes.getNamedItem("ID_DEV").nodeValue
  m_ID_DEV_ID_BRIEF = node.Attributes.getNamedItem("ID_DEV_BRIEF").nodeValue
  Set ID_MASK_CURR = Nothing
  m_ID_MASK_CURR_ID = node.Attributes.getNamedItem("ID_MASK_CURR").nodeValue
  m_ID_MASK_CURR_ID_BRIEF = node.Attributes.getNamedItem("ID_MASK_CURR_BRIEF").nodeValue
  Set ID_MASK_HOUR = Nothing
  m_ID_MASK_HOUR_ID = node.Attributes.getNamedItem("ID_MASK_HOUR").nodeValue
  m_ID_MASK_HOUR_ID_BRIEF = node.Attributes.getNamedItem("ID_MASK_HOUR_BRIEF").nodeValue
  Set ID_MASK_24 = Nothing
  m_ID_MASK_24_ID = node.Attributes.getNamedItem("ID_MASK_24").nodeValue
  m_ID_MASK_24_ID_BRIEF = node.Attributes.getNamedItem("ID_MASK_24_BRIEF").nodeValue
  Set ID_MASK_SUM = Nothing
  m_ID_MASK_SUM_ID = node.Attributes.getNamedItem("ID_MASK_SUM").nodeValue
  m_ID_MASK_SUM_ID_BRIEF = node.Attributes.getNamedItem("ID_MASK_SUM_BRIEF").nodeValue
  Set SCHEMA_ID = Nothing
  m_SCHEMA_ID_ID = node.Attributes.getNamedItem("SCHEMA_ID").nodeValue
  m_SCHEMA_ID_ID_BRIEF = node.Attributes.getNamedItem("SCHEMA_ID_BRIEF").nodeValue
  Set report_hour = Nothing
  m_report_hour_ID = node.Attributes.getNamedItem("REPORT_HOUR").nodeValue
  m_report_hour_ID_BRIEF = node.Attributes.getNamedItem("REPORT_HOUR_BRIEF").nodeValue
  Set report_day = Nothing
  m_report_day_ID = node.Attributes.getNamedItem("REPORT_DAY").nodeValue
  m_report_day_ID_BRIEF = node.Attributes.getNamedItem("REPORT_DAY_BRIEF").nodeValue
  NPIP = Replace(node.Attributes.getNamedItem("NPIP").nodeValue, vbLf, vbCrLf)
  NPPASSWORD = Replace(node.Attributes.getNamedItem("NPPASSWORD").nodeValue, vbLf, vbCrLf)
  NPLOCK = node.Attributes.getNamedItem("NPLOCK").nodeValue
  CONNECTED = node.Attributes.getNamedItem("CONNECTED").nodeValue
  ID_MD = node.Attributes.getNamedItem("ID_MD").nodeValue
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
  node.setAttribute "ID_BU", m_ID_BU_ID
  If Not (ID_BU Is Nothing) Then
    node.setAttribute "ID_BU_BRIEF", ID_BU.Brief
  Else
    node.setAttribute "ID_BU_BRIEF", m_ID_BU_ID_BRIEF
  End If
  node.setAttribute "ID_DEV", m_ID_DEV_ID
  If Not (ID_DEV Is Nothing) Then
    node.setAttribute "ID_DEV_BRIEF", ID_DEV.Brief
  Else
    node.setAttribute "ID_DEV_BRIEF", m_ID_DEV_ID_BRIEF
  End If
  node.setAttribute "ID_MASK_CURR", m_ID_MASK_CURR_ID
  If Not (ID_MASK_CURR Is Nothing) Then
    node.setAttribute "ID_MASK_CURR_BRIEF", ID_MASK_CURR.Brief
  Else
    node.setAttribute "ID_MASK_CURR_BRIEF", m_ID_MASK_CURR_ID_BRIEF
  End If
  node.setAttribute "ID_MASK_HOUR", m_ID_MASK_HOUR_ID
  If Not (ID_MASK_HOUR Is Nothing) Then
    node.setAttribute "ID_MASK_HOUR_BRIEF", ID_MASK_HOUR.Brief
  Else
    node.setAttribute "ID_MASK_HOUR_BRIEF", m_ID_MASK_HOUR_ID_BRIEF
  End If
  node.setAttribute "ID_MASK_24", m_ID_MASK_24_ID
  If Not (ID_MASK_24 Is Nothing) Then
    node.setAttribute "ID_MASK_24_BRIEF", ID_MASK_24.Brief
  Else
    node.setAttribute "ID_MASK_24_BRIEF", m_ID_MASK_24_ID_BRIEF
  End If
  node.setAttribute "ID_MASK_SUM", m_ID_MASK_SUM_ID
  If Not (ID_MASK_SUM Is Nothing) Then
    node.setAttribute "ID_MASK_SUM_BRIEF", ID_MASK_SUM.Brief
  Else
    node.setAttribute "ID_MASK_SUM_BRIEF", m_ID_MASK_SUM_ID_BRIEF
  End If
  node.setAttribute "SCHEMA_ID", m_SCHEMA_ID_ID
  If Not (SCHEMA_ID Is Nothing) Then
    node.setAttribute "SCHEMA_ID_BRIEF", SCHEMA_ID.Brief
  Else
    node.setAttribute "SCHEMA_ID_BRIEF", m_SCHEMA_ID_ID_BRIEF
  End If
  node.setAttribute "REPORT_HOUR", m_report_hour_ID
  If Not (report_hour Is Nothing) Then
    node.setAttribute "REPORT_HOUR_BRIEF", report_hour.Brief
  Else
    node.setAttribute "REPORT_HOUR_BRIEF", m_report_hour_ID_BRIEF
  End If
  node.setAttribute "REPORT_DAY", m_report_day_ID
  If Not (report_day Is Nothing) Then
    node.setAttribute "REPORT_DAY_BRIEF", report_day.Brief
  Else
    node.setAttribute "REPORT_DAY_BRIEF", m_report_day_ID_BRIEF
  End If
  node.setAttribute "NPIP", NPIP
  node.setAttribute "NPPASSWORD", NPPASSWORD
  node.setAttribute "NPLOCK", CDbl(NPLOCK)
  node.setAttribute "CONNECTED", CONNECTED
  node.setAttribute "ID_MD", ID_MD
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
m_IsLocked = Application.MTZSession.IsLocked("BDEVICES", id)
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
OK = Application.MTZSession.LockResource("BDEVICES", id, Permanent)
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
Application.MTZSession.UnLockResource "BDEVICES", id
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
CanLock = Application.MTZSession.CanLock("BDEVICES", id)
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



