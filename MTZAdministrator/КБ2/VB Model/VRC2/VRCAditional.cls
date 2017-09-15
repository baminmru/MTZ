VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "VRCAditional"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'строка раздела Доп. информация
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
Private m_Country As Object
Dim m_Country_ID As String
Dim m_Country_ID_BRIEF As String
Private m_town As Object
Dim m_town_ID As String
Dim m_town_ID_BRIEF As String
Private m_district As String
Private m_uraddr As String
Private m_townphonecode As String
Private m_urphone As String
Private m_phone2 As String
Private m_POSTINDEX As String
Private m_WEBSite As String
Private m_OKONH As String
Private m_OKPO As String
Private m_regsved As String
Private m_regdate As Date
Private m_eMail As String
Private m_BossFIO As String
Private m_BossPosition As String
Private m_mobTelephone As String
Private m_prnActWork As enumBoolean
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
  PartName = "VRCAditional"
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
  m_Application.Logger.Message "VRCAditional.Init"
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
'Страна

'Страна
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set Country(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Country", Country, NewValue
On Error Resume Next
m_Country_ID = ""
m_Country_ID = NewValue.id
'  set   m_Country= newValue
End If
End Property

'Страна
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Country
Public Property Get Country() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_Country As Object
If m_Country_ID <> "" Then
  Set tmp_Country = Application.FindRowObject("ENTDIC_COUNTRY", m_Country_ID)
  If tmp_Country Is Nothing Then
    m_Country_ID_BRIEF = ""
  Else
    m_Country_ID_BRIEF = tmp_Country.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "ENTDIC_COUNTRY" & m_Country_ID, tmp_Country
  Set Country = tmp_Country
  Exit Property
End If
  '  set Country = m_Country
End Property
' let
'Город

'Город
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set town(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "town", town, NewValue
On Error Resume Next
m_town_ID = ""
m_town_ID = NewValue.id
'  set   m_town= newValue
End If
End Property

'Город
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. town
Public Property Get town() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_town As Object
If m_town_ID <> "" Then
  Set tmp_town = Application.FindRowObject("ENTDIC_TOWN", m_town_ID)
  If tmp_town Is Nothing Then
    m_town_ID_BRIEF = ""
  Else
    m_town_ID_BRIEF = tmp_town.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "ENTDIC_TOWN" & m_town_ID, tmp_town
  Set town = tmp_town
  Exit Property
End If
  '  set town = m_town
End Property
' let
'Район

'Район
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let district(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "district", district, NewValue

   m_district = NewValue
End If
End Property

'Район
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. district
Public Property Get district() As String
 LoadFromDatabase
 AccessTime = Now

   district = m_district
End Property
' let
'Юридический адрес

'Юридический адрес
'Parameters:
'[IN]   newValue , тип параметра: STRING  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let uraddr(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "uraddr", uraddr, NewValue

   m_uraddr = NewValue
End If
End Property

'Юридический адрес
'Parameters:
' параметров нет
'Returns:
'  значение типа STRING
'See Also:
'Example:
' dim variable as STRING
' variable = me. uraddr
Public Property Get uraddr() As String
 LoadFromDatabase
 AccessTime = Now

   uraddr = m_uraddr
End Property
' let
'Телефонный код

'Телефонный код
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let townphonecode(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "townphonecode", townphonecode, NewValue

   m_townphonecode = NewValue
End If
End Property

'Телефонный код
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. townphonecode
Public Property Get townphonecode() As String
 LoadFromDatabase
 AccessTime = Now

   townphonecode = m_townphonecode
End Property
' let
'Телефон по юр. адресу

'Телефон по юр. адресу
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let urphone(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "urphone", urphone, NewValue

   m_urphone = NewValue
End If
End Property

'Телефон по юр. адресу
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. urphone
Public Property Get urphone() As String
 LoadFromDatabase
 AccessTime = Now

   urphone = m_urphone
End Property
' let
'Телефон 2

'Телефон 2
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let phone2(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "phone2", phone2, NewValue

   m_phone2 = NewValue
End If
End Property

'Телефон 2
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. phone2
Public Property Get phone2() As String
 LoadFromDatabase
 AccessTime = Now

   phone2 = m_phone2
End Property
' let
'Почтовый индекс

'Почтовый индекс
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let POSTINDEX(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "POSTINDEX", POSTINDEX, NewValue

   m_POSTINDEX = NewValue
End If
End Property

'Почтовый индекс
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. POSTINDEX
Public Property Get POSTINDEX() As String
 LoadFromDatabase
 AccessTime = Now

   POSTINDEX = m_POSTINDEX
End Property
' let
'WEB узел

'WEB узел
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let WEBSite(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "WEBSite", WEBSite, NewValue

   m_WEBSite = NewValue
End If
End Property

'WEB узел
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. WEBSite
Public Property Get WEBSite() As String
 LoadFromDatabase
 AccessTime = Now

   WEBSite = m_WEBSite
End Property
' let
'ОКОНХ

'ОКОНХ
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let OKONH(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "OKONH", OKONH, NewValue

   m_OKONH = NewValue
End If
End Property

'ОКОНХ
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. OKONH
Public Property Get OKONH() As String
 LoadFromDatabase
 AccessTime = Now

   OKONH = m_OKONH
End Property
' let
'ОКПО

'ОКПО
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let OKPO(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "OKPO", OKPO, NewValue

   m_OKPO = NewValue
End If
End Property

'ОКПО
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. OKPO
Public Property Get OKPO() As String
 LoadFromDatabase
 AccessTime = Now

   OKPO = m_OKPO
End Property
' let
'Номер свидетельства орегистрации

'Номер свидетельства орегистрации
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let regsved(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "regsved", regsved, NewValue

   m_regsved = NewValue
End If
End Property

'Номер свидетельства орегистрации
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. regsved
Public Property Get regsved() As String
 LoadFromDatabase
 AccessTime = Now

   regsved = m_regsved
End Property
' let
'Дата регистрации

'Дата регистрации
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let regdate(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "regdate", regdate, NewValue

   m_regdate = NewValue
End If
End Property

'Дата регистрации
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. regdate
Public Property Get regdate() As Date
 LoadFromDatabase
 AccessTime = Now

   regdate = m_regdate
End Property
' let
'Электронная почта

'Электронная почта
'Parameters:
'[IN]   newValue , тип параметра: string  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let eMail(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "eMail", eMail, NewValue

   m_eMail = NewValue
End If
End Property

'Электронная почта
'Parameters:
' параметров нет
'Returns:
'  значение типа string
'See Also:
'Example:
' dim variable as string
' variable = me. eMail
Public Property Get eMail() As String
 LoadFromDatabase
 AccessTime = Now

   eMail = m_eMail
End Property
' let
'ФИО Руководителя

'ФИО Руководителя
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let BossFIO(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "BossFIO", BossFIO, NewValue

   m_BossFIO = NewValue
End If
End Property

'ФИО Руководителя
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. BossFIO
Public Property Get BossFIO() As String
 LoadFromDatabase
 AccessTime = Now

   BossFIO = m_BossFIO
End Property
' let
'Должность руководителя

'Должность руководителя
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let BossPosition(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "BossPosition", BossPosition, NewValue

   m_BossPosition = NewValue
End If
End Property

'Должность руководителя
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. BossPosition
Public Property Get BossPosition() As String
 LoadFromDatabase
 AccessTime = Now

   BossPosition = m_BossPosition
End Property
' let
'Мобильный телефон

'Мобильный телефон
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let mobTelephone(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "mobTelephone", mobTelephone, NewValue

   m_mobTelephone = NewValue
End If
End Property

'Мобильный телефон
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. mobTelephone
Public Property Get mobTelephone() As String
 LoadFromDatabase
 AccessTime = Now

   mobTelephone = m_mobTelephone
End Property
' let
'Печать акта выполненных работ

'Печать акта выполненных работ
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let prnActWork(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "prnActWork", prnActWork, NewValue

   m_prnActWork = NewValue
End If
End Property

'Печать акта выполненных работ
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. prnActWork
Public Property Get prnActWork() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   prnActWork = m_prnActWork
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

 ' Reference to ENTDIC_COUNTRY
    If m_Country_ID = "" Then
       Set nvi = nv.Add("Country", "")
    Else
       Set nvi = nv.Add("Country", m_Country_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to ENTDIC_TOWN
    If m_town_ID = "" Then
       Set nvi = nv.Add("town", "")
    Else
       Set nvi = nv.Add("town", m_town_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("district", m_district)
nvi.ValueSize = 255
  Set nvi = nv.Add("uraddr", m_uraddr)
  Set nvi = nv.Add("townphonecode", m_townphonecode)
nvi.ValueSize = 10
  Set nvi = nv.Add("urphone", m_urphone)
nvi.ValueSize = 20
  Set nvi = nv.Add("phone2", m_phone2)
nvi.ValueSize = 20
  Set nvi = nv.Add("POSTINDEX", m_POSTINDEX)
nvi.ValueSize = 20
  Set nvi = nv.Add("WEBSite", m_WEBSite)
  Set nvi = nv.Add("OKONH", m_OKONH)
nvi.ValueSize = 20
  Set nvi = nv.Add("OKPO", m_OKPO)
nvi.ValueSize = 20
  Set nvi = nv.Add("regsved", m_regsved)
nvi.ValueSize = 30
  Set nvi = nv.Add("regdate", m_regdate)
nvi.ValueType = adDate
  Set nvi = nv.Add("eMail", m_eMail)
  Set nvi = nv.Add("BossFIO", m_BossFIO)
nvi.ValueSize = 255
  Set nvi = nv.Add("BossPosition", m_BossPosition)
nvi.ValueSize = 255
  Set nvi = nv.Add("mobTelephone", m_mobTelephone)
nvi.ValueSize = 20
  Set nvi = nv.Add("prnActWork", m_prnActWork)
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
 m_Brief = m_Brief & regdate & "; "
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

  m_Country_ID = nv.item("Country").Value
  m_town_ID = nv.item("town").Value
m_district = nv.item("district").Value
m_uraddr = nv.item("uraddr").Value
m_townphonecode = nv.item("townphonecode").Value
m_urphone = nv.item("urphone").Value
m_phone2 = nv.item("phone2").Value
m_POSTINDEX = nv.item("POSTINDEX").Value
m_WEBSite = nv.item("WEBSite").Value
m_OKONH = nv.item("OKONH").Value
m_OKPO = nv.item("OKPO").Value
m_regsved = nv.item("regsved").Value
m_regdate = nv.item("regdate").Value
m_eMail = nv.item("eMail").Value
m_BossFIO = nv.item("BossFIO").Value
m_BossPosition = nv.item("BossPosition").Value
m_mobTelephone = nv.item("mobTelephone").Value
m_prnActWork = nv.item("prnActWork").Value
Else

  m_Country_ID = nv.Fields("Country").Value
  m_town_ID = nv.Fields("town").Value
m_district = nv.Fields("district").Value
m_uraddr = nv.Fields("uraddr").Value
m_townphonecode = nv.Fields("townphonecode").Value
m_urphone = nv.Fields("urphone").Value
m_phone2 = nv.Fields("phone2").Value
m_POSTINDEX = nv.Fields("POSTINDEX").Value
m_WEBSite = nv.Fields("WEBSite").Value
m_OKONH = nv.Fields("OKONH").Value
m_OKPO = nv.Fields("OKPO").Value
m_regsved = nv.Fields("regsved").Value
m_regdate = nv.Fields("regdate").Value
m_eMail = nv.Fields("eMail").Value
m_BossFIO = nv.Fields("BossFIO").Value
m_BossPosition = nv.Fields("BossPosition").Value
m_mobTelephone = nv.Fields("mobTelephone").Value
m_prnActWork = nv.Fields("prnActWork").Value
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
   Dim o As VRCAditional
   Set o = New VRCAditional
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
  err.Raise err.Number, "VRCAditional.Save", err.Description
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
  err.Raise err.Number, "VRCAditional.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("VRCAditional", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "VRCAditional.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "VRCAditional", id
Exit Sub
bye:
  err.Raise err.Number, "VRCAditional.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 m_Country_ID = ""
 Set m_Country = Nothing
 m_town_ID = ""
 Set m_town = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "VRCAditional.CloseClass"
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
  Set Country = Nothing
  m_Country_ID = node.Attributes.getNamedItem("COUNTRY").nodeValue
  m_Country_ID_BRIEF = node.Attributes.getNamedItem("COUNTRY_BRIEF").nodeValue
  Set town = Nothing
  m_town_ID = node.Attributes.getNamedItem("TOWN").nodeValue
  m_town_ID_BRIEF = node.Attributes.getNamedItem("TOWN_BRIEF").nodeValue
  district = Replace(node.Attributes.getNamedItem("DISTRICT").nodeValue, vbLf, vbCrLf)
  uraddr = Replace(node.Attributes.getNamedItem("URADDR").nodeValue, vbLf, vbCrLf)
  townphonecode = Replace(node.Attributes.getNamedItem("TOWNPHONECODE").nodeValue, vbLf, vbCrLf)
  urphone = Replace(node.Attributes.getNamedItem("URPHONE").nodeValue, vbLf, vbCrLf)
  phone2 = Replace(node.Attributes.getNamedItem("PHONE2").nodeValue, vbLf, vbCrLf)
  POSTINDEX = Replace(node.Attributes.getNamedItem("POSTINDEX").nodeValue, vbLf, vbCrLf)
  WEBSite = Replace(node.Attributes.getNamedItem("WEBSITE").nodeValue, vbLf, vbCrLf)
  OKONH = Replace(node.Attributes.getNamedItem("OKONH").nodeValue, vbLf, vbCrLf)
  OKPO = Replace(node.Attributes.getNamedItem("OKPO").nodeValue, vbLf, vbCrLf)
  regsved = Replace(node.Attributes.getNamedItem("REGSVED").nodeValue, vbLf, vbCrLf)
  regdate = node.Attributes.getNamedItem("REGDATE").nodeValue
  eMail = Replace(node.Attributes.getNamedItem("EMAIL").nodeValue, vbLf, vbCrLf)
  BossFIO = Replace(node.Attributes.getNamedItem("BOSSFIO").nodeValue, vbLf, vbCrLf)
  BossPosition = Replace(node.Attributes.getNamedItem("BOSSPOSITION").nodeValue, vbLf, vbCrLf)
  mobTelephone = Replace(node.Attributes.getNamedItem("MOBTELEPHONE").nodeValue, vbLf, vbCrLf)
  prnActWork = node.Attributes.getNamedItem("PRNACTWORK").nodeValue
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
  node.setAttribute "COUNTRY", m_Country_ID
  If Not (Country Is Nothing) Then
    node.setAttribute "COUNTRY_BRIEF", Country.Brief
  Else
    node.setAttribute "COUNTRY_BRIEF", m_Country_ID_BRIEF
  End If
  node.setAttribute "TOWN", m_town_ID
  If Not (town Is Nothing) Then
    node.setAttribute "TOWN_BRIEF", town.Brief
  Else
    node.setAttribute "TOWN_BRIEF", m_town_ID_BRIEF
  End If
  node.setAttribute "DISTRICT", district
  node.setAttribute "URADDR", uraddr
  node.setAttribute "TOWNPHONECODE", townphonecode
  node.setAttribute "URPHONE", urphone
  node.setAttribute "PHONE2", phone2
  node.setAttribute "POSTINDEX", POSTINDEX
  node.setAttribute "WEBSITE", WEBSite
  node.setAttribute "OKONH", OKONH
  node.setAttribute "OKPO", OKPO
  node.setAttribute "REGSVED", regsved
  node.setAttribute "REGDATE", CDbl(regdate)
  node.setAttribute "EMAIL", eMail
  node.setAttribute "BOSSFIO", BossFIO
  node.setAttribute "BOSSPOSITION", BossPosition
  node.setAttribute "MOBTELEPHONE", mobTelephone
  node.setAttribute "PRNACTWORK", prnActWork
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
m_IsLocked = Application.MTZSession.IsLocked("VRCAditional", id)
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
OK = Application.MTZSession.LockResource("VRCAditional", id, Permanent)
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
Application.MTZSession.UnLockResource "VRCAditional", id
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
CanLock = Application.MTZSession.CanLock("VRCAditional", id)
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
If mode = "ur" Then
 Select Case child
End Select
End If ' mode="ur"
If mode = "main" Then
 Select Case child
End Select
End If ' mode="main"
If mode = "phiz" Then
 Select Case child
End Select
End If ' mode="phiz"
If mode = "" Then
 Select Case child
 End Select
End If ' mode="" (Default)
End Sub



