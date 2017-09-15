VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "PLANCALL"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'строка раздела План опроса устройств
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
Private m_CSTATUS As Long
Private m_ICALL As Long
Private m_NUMCALL As Long
Private m_CCURR As enumBoolean
Private m_CHOUR As enumBoolean
Private m_C24 As enumBoolean
Private m_CSUM As enumBoolean
Private m_NUMHOUR As Long
Private m_NUM24 As Long
Private m_NMAXCALL As Long
Private m_MINREPEAT As Long
Private m_DLOCK As Date
Private m_ICALL24 As Long
Private m_ICALLCURR As Long
Private m_ICALLSUM As Long
Private m_CHNRONLY As enumBoolean
Private m_C24NRONLY As enumBoolean
Private m_DNEXTHOUR As Date
Private m_DNEXT24 As Date
Private m_DNEXTCURR As Date
Private m_DNEXTSUM As Date
Private m_DLASTCALL As Date
Private m_DLASTDAY As Date
Private m_DLASTHOUR As Date
Private m_MUSTREPEATDAY As enumBoolean
Private m_MUSTREPEATHOUR As enumBoolean
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
  PartName = "PLANCALL"
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
  m_Application.Logger.Message "PLANCALL.Init"
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
'Блокировка

'Блокировка
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let CSTATUS(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CSTATUS", CSTATUS, NewValue

   m_CSTATUS = NewValue
End If
End Property

'Блокировка
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. CSTATUS
Public Property Get CSTATUS() As Long
 LoadFromDatabase
 AccessTime = Now

   CSTATUS = m_CSTATUS
End Property
' let
'Интервал опроса (минут) часовых

'Интервал опроса (минут) часовых
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ICALL(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ICALL", ICALL, NewValue

   m_ICALL = NewValue
End If
End Property

'Интервал опроса (минут) часовых
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. ICALL
Public Property Get ICALL() As Long
 LoadFromDatabase
 AccessTime = Now

   ICALL = m_ICALL
End Property
' let
'Сколько раз опросить (0 - циклический опрос)

'Сколько раз опросить (0 - циклический опрос)
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let NUMCALL(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "NUMCALL", NUMCALL, NewValue

   m_NUMCALL = NewValue
End If
End Property

'Сколько раз опросить (0 - циклический опрос)
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. NUMCALL
Public Property Get NUMCALL() As Long
 LoadFromDatabase
 AccessTime = Now

   NUMCALL = m_NUMCALL
End Property
' let
'опрашивать текущие

'опрашивать текущие
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let CCURR(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CCURR", CCURR, NewValue

   m_CCURR = NewValue
End If
End Property

'опрашивать текущие
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. CCURR
Public Property Get CCURR() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   CCURR = m_CCURR
End Property
' let
'опрашивать часовые

'опрашивать часовые
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let CHOUR(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CHOUR", CHOUR, NewValue

   m_CHOUR = NewValue
End If
End Property

'опрашивать часовые
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. CHOUR
Public Property Get CHOUR() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   CHOUR = m_CHOUR
End Property
' let
'опрашивать суточные

'опрашивать суточные
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let C24(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "C24", C24, NewValue

   m_C24 = NewValue
End If
End Property

'опрашивать суточные
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. C24
Public Property Get C24() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   C24 = m_C24
End Property
' let
'опрашивать итоговые

'опрашивать итоговые
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let CSUM(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CSUM", CSUM, NewValue

   m_CSUM = NewValue
End If
End Property

'опрашивать итоговые
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. CSUM
Public Property Get CSUM() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   CSUM = m_CSUM
End Property
' let
'За сколько часов опрашивать часовые

'За сколько часов опрашивать часовые
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let NUMHOUR(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "NUMHOUR", NUMHOUR, NewValue

   m_NUMHOUR = NewValue
End If
End Property

'За сколько часов опрашивать часовые
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. NUMHOUR
Public Property Get NUMHOUR() As Long
 LoadFromDatabase
 AccessTime = Now

   NUMHOUR = m_NUMHOUR
End Property
' let
'За сколько суток опрашивать суточные

'За сколько суток опрашивать суточные
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let NUM24(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "NUM24", NUM24, NewValue

   m_NUM24 = NewValue
End If
End Property

'За сколько суток опрашивать суточные
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. NUM24
Public Property Get NUM24() As Long
 LoadFromDatabase
 AccessTime = Now

   NUM24 = m_NUM24
End Property
' let
'Max число попыток дозвона

'Max число попыток дозвона
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let NMAXCALL(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "NMAXCALL", NMAXCALL, NewValue

   m_NMAXCALL = NewValue
End If
End Property

'Max число попыток дозвона
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. NMAXCALL
Public Property Get NMAXCALL() As Long
 LoadFromDatabase
 AccessTime = Now

   NMAXCALL = m_NMAXCALL
End Property
' let
'При неудачом дозвоне повторить через (минут)

'При неудачом дозвоне повторить через (минут)
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let MINREPEAT(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "MINREPEAT", MINREPEAT, NewValue

   m_MINREPEAT = NewValue
End If
End Property

'При неудачом дозвоне повторить через (минут)
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. MINREPEAT
Public Property Get MINREPEAT() As Long
 LoadFromDatabase
 AccessTime = Now

   MINREPEAT = m_MINREPEAT
End Property
' let
'Когда заблокирован

'Когда заблокирован
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DLOCK(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DLOCK", DLOCK, NewValue

   m_DLOCK = NewValue
End If
End Property

'Когда заблокирован
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. DLOCK
Public Property Get DLOCK() As Date
 LoadFromDatabase
 AccessTime = Now

   DLOCK = m_DLOCK
End Property
' let
'Интервал опроса (часов) суточных

'Интервал опроса (часов) суточных
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ICALL24(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ICALL24", ICALL24, NewValue

   m_ICALL24 = NewValue
End If
End Property

'Интервал опроса (часов) суточных
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. ICALL24
Public Property Get ICALL24() As Long
 LoadFromDatabase
 AccessTime = Now

   ICALL24 = m_ICALL24
End Property
' let
'Интервал опроса (минут) мгновенных

'Интервал опроса (минут) мгновенных
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ICALLCURR(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ICALLCURR", ICALLCURR, NewValue

   m_ICALLCURR = NewValue
End If
End Property

'Интервал опроса (минут) мгновенных
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. ICALLCURR
Public Property Get ICALLCURR() As Long
 LoadFromDatabase
 AccessTime = Now

   ICALLCURR = m_ICALLCURR
End Property
' let
'Интервал опроса (минут) тотальных

'Интервал опроса (минут) тотальных
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ICALLSUM(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ICALLSUM", ICALLSUM, NewValue

   m_ICALLSUM = NewValue
End If
End Property

'Интервал опроса (минут) тотальных
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. ICALLSUM
Public Property Get ICALLSUM() As Long
 LoadFromDatabase
 AccessTime = Now

   ICALLSUM = m_ICALLSUM
End Property
' let
'Только непрочитанные суточные

'Только непрочитанные суточные
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let CHNRONLY(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CHNRONLY", CHNRONLY, NewValue

   m_CHNRONLY = NewValue
End If
End Property

'Только непрочитанные суточные
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. CHNRONLY
Public Property Get CHNRONLY() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   CHNRONLY = m_CHNRONLY
End Property
' let
'Только непрочитанные часовые

'Только непрочитанные часовые
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let C24NRONLY(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "C24NRONLY", C24NRONLY, NewValue

   m_C24NRONLY = NewValue
End If
End Property

'Только непрочитанные часовые
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. C24NRONLY
Public Property Get C24NRONLY() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   C24NRONLY = m_C24NRONLY
End Property
' let
'Дата следующего опроса часовых

'Дата следующего опроса часовых
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DNEXTHOUR(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DNEXTHOUR", DNEXTHOUR, NewValue

   m_DNEXTHOUR = NewValue
End If
End Property

'Дата следующего опроса часовых
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. DNEXTHOUR
Public Property Get DNEXTHOUR() As Date
 LoadFromDatabase
 AccessTime = Now

   DNEXTHOUR = m_DNEXTHOUR
End Property
' let
'Дата следующего опроса суточных

'Дата следующего опроса суточных
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DNEXT24(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DNEXT24", DNEXT24, NewValue

   m_DNEXT24 = NewValue
End If
End Property

'Дата следующего опроса суточных
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. DNEXT24
Public Property Get DNEXT24() As Date
 LoadFromDatabase
 AccessTime = Now

   DNEXT24 = m_DNEXT24
End Property
' let
'Дата следующего опроса мгновенных

'Дата следующего опроса мгновенных
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DNEXTCURR(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DNEXTCURR", DNEXTCURR, NewValue

   m_DNEXTCURR = NewValue
End If
End Property

'Дата следующего опроса мгновенных
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. DNEXTCURR
Public Property Get DNEXTCURR() As Date
 LoadFromDatabase
 AccessTime = Now

   DNEXTCURR = m_DNEXTCURR
End Property
' let
'Дата следующего опроса тотальных

'Дата следующего опроса тотальных
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DNEXTSUM(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DNEXTSUM", DNEXTSUM, NewValue

   m_DNEXTSUM = NewValue
End If
End Property

'Дата следующего опроса тотальных
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. DNEXTSUM
Public Property Get DNEXTSUM() As Date
 LoadFromDatabase
 AccessTime = Now

   DNEXTSUM = m_DNEXTSUM
End Property
' let
'Дата последнего опроса счетчика

'Дата последнего опроса счетчика
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DLASTCALL(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DLASTCALL", DLASTCALL, NewValue

   m_DLASTCALL = NewValue
End If
End Property

'Дата последнего опроса счетчика
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. DLASTCALL
Public Property Get DLASTCALL() As Date
 LoadFromDatabase
 AccessTime = Now

   DLASTCALL = m_DLASTCALL
End Property
' let
'Дата последнего опроса суточных

'Дата последнего опроса суточных
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DLASTDAY(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DLASTDAY", DLASTDAY, NewValue

   m_DLASTDAY = NewValue
End If
End Property

'Дата последнего опроса суточных
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. DLASTDAY
Public Property Get DLASTDAY() As Date
 LoadFromDatabase
 AccessTime = Now

   DLASTDAY = m_DLASTDAY
End Property
' let
'Дата последнего опроса часовых

'Дата последнего опроса часовых
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DLASTHOUR(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DLASTHOUR", DLASTHOUR, NewValue

   m_DLASTHOUR = NewValue
End If
End Property

'Дата последнего опроса часовых
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. DLASTHOUR
Public Property Get DLASTHOUR() As Date
 LoadFromDatabase
 AccessTime = Now

   DLASTHOUR = m_DLASTHOUR
End Property
' let
'Требование повтора съема суточных

'Требование повтора съема суточных
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let MUSTREPEATDAY(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "MUSTREPEATDAY", MUSTREPEATDAY, NewValue

   m_MUSTREPEATDAY = NewValue
End If
End Property

'Требование повтора съема суточных
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. MUSTREPEATDAY
Public Property Get MUSTREPEATDAY() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   MUSTREPEATDAY = m_MUSTREPEATDAY
End Property
' let
'Требование повтора съема часовых

'Требование повтора съема часовых
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let MUSTREPEATHOUR(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "MUSTREPEATHOUR", MUSTREPEATHOUR, NewValue

   m_MUSTREPEATHOUR = NewValue
End If
End Property

'Требование повтора съема часовых
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. MUSTREPEATHOUR
Public Property Get MUSTREPEATHOUR() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   MUSTREPEATHOUR = m_MUSTREPEATHOUR
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

  Set nvi = nv.Add("CSTATUS", m_CSTATUS)
nvi.ValueType = adInteger
  Set nvi = nv.Add("ICALL", m_ICALL)
nvi.ValueType = adInteger
  Set nvi = nv.Add("NUMCALL", m_NUMCALL)
nvi.ValueType = adInteger
  Set nvi = nv.Add("CCURR", m_CCURR)
nvi.ValueType = adInteger
  Set nvi = nv.Add("CHOUR", m_CHOUR)
nvi.ValueType = adInteger
  Set nvi = nv.Add("C24", m_C24)
nvi.ValueType = adInteger
  Set nvi = nv.Add("CSUM", m_CSUM)
nvi.ValueType = adInteger
  Set nvi = nv.Add("NUMHOUR", m_NUMHOUR)
nvi.ValueType = adInteger
  Set nvi = nv.Add("NUM24", m_NUM24)
nvi.ValueType = adInteger
  Set nvi = nv.Add("NMAXCALL", m_NMAXCALL)
nvi.ValueType = adInteger
  Set nvi = nv.Add("MINREPEAT", m_MINREPEAT)
nvi.ValueType = adInteger
  Set nvi = nv.Add("DLOCK", m_DLOCK)
nvi.ValueType = adDBTimeStamp
  Set nvi = nv.Add("ICALL24", m_ICALL24)
nvi.ValueType = adInteger
  Set nvi = nv.Add("ICALLCURR", m_ICALLCURR)
nvi.ValueType = adInteger
  Set nvi = nv.Add("ICALLSUM", m_ICALLSUM)
nvi.ValueType = adInteger
  Set nvi = nv.Add("CHNRONLY", m_CHNRONLY)
nvi.ValueType = adInteger
  Set nvi = nv.Add("C24NRONLY", m_C24NRONLY)
nvi.ValueType = adInteger
  Set nvi = nv.Add("DNEXTHOUR", m_DNEXTHOUR)
nvi.ValueType = adDBTimeStamp
  Set nvi = nv.Add("DNEXT24", m_DNEXT24)
nvi.ValueType = adDBTimeStamp
  Set nvi = nv.Add("DNEXTCURR", m_DNEXTCURR)
nvi.ValueType = adDBTimeStamp
  Set nvi = nv.Add("DNEXTSUM", m_DNEXTSUM)
nvi.ValueType = adDBTimeStamp
  Set nvi = nv.Add("DLASTCALL", m_DLASTCALL)
nvi.ValueType = adDBTimeStamp
  Set nvi = nv.Add("DLASTDAY", m_DLASTDAY)
nvi.ValueType = adDBTimeStamp
  Set nvi = nv.Add("DLASTHOUR", m_DLASTHOUR)
nvi.ValueType = adDBTimeStamp
  Set nvi = nv.Add("MUSTREPEATDAY", m_MUSTREPEATDAY)
nvi.ValueType = adInteger
  Set nvi = nv.Add("MUSTREPEATHOUR", m_MUSTREPEATHOUR)
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
 m_Brief = m_Brief & ICALL & "; "
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

m_CSTATUS = nv.item("CSTATUS").Value
m_ICALL = nv.item("ICALL").Value
m_NUMCALL = nv.item("NUMCALL").Value
m_CCURR = nv.item("CCURR").Value
m_CHOUR = nv.item("CHOUR").Value
m_C24 = nv.item("C24").Value
m_CSUM = nv.item("CSUM").Value
m_NUMHOUR = nv.item("NUMHOUR").Value
m_NUM24 = nv.item("NUM24").Value
m_NMAXCALL = nv.item("NMAXCALL").Value
m_MINREPEAT = nv.item("MINREPEAT").Value
m_DLOCK = nv.item("DLOCK").Value
m_ICALL24 = nv.item("ICALL24").Value
m_ICALLCURR = nv.item("ICALLCURR").Value
m_ICALLSUM = nv.item("ICALLSUM").Value
m_CHNRONLY = nv.item("CHNRONLY").Value
m_C24NRONLY = nv.item("C24NRONLY").Value
m_DNEXTHOUR = nv.item("DNEXTHOUR").Value
m_DNEXT24 = nv.item("DNEXT24").Value
m_DNEXTCURR = nv.item("DNEXTCURR").Value
m_DNEXTSUM = nv.item("DNEXTSUM").Value
m_DLASTCALL = nv.item("DLASTCALL").Value
m_DLASTDAY = nv.item("DLASTDAY").Value
m_DLASTHOUR = nv.item("DLASTHOUR").Value
m_MUSTREPEATDAY = nv.item("MUSTREPEATDAY").Value
m_MUSTREPEATHOUR = nv.item("MUSTREPEATHOUR").Value
Else

m_CSTATUS = nv.Fields("CSTATUS").Value
m_ICALL = nv.Fields("ICALL").Value
m_NUMCALL = nv.Fields("NUMCALL").Value
m_CCURR = nv.Fields("CCURR").Value
m_CHOUR = nv.Fields("CHOUR").Value
m_C24 = nv.Fields("C24").Value
m_CSUM = nv.Fields("CSUM").Value
m_NUMHOUR = nv.Fields("NUMHOUR").Value
m_NUM24 = nv.Fields("NUM24").Value
m_NMAXCALL = nv.Fields("NMAXCALL").Value
m_MINREPEAT = nv.Fields("MINREPEAT").Value
m_DLOCK = nv.Fields("DLOCK").Value
m_ICALL24 = nv.Fields("ICALL24").Value
m_ICALLCURR = nv.Fields("ICALLCURR").Value
m_ICALLSUM = nv.Fields("ICALLSUM").Value
m_CHNRONLY = nv.Fields("CHNRONLY").Value
m_C24NRONLY = nv.Fields("C24NRONLY").Value
m_DNEXTHOUR = nv.Fields("DNEXTHOUR").Value
m_DNEXT24 = nv.Fields("DNEXT24").Value
m_DNEXTCURR = nv.Fields("DNEXTCURR").Value
m_DNEXTSUM = nv.Fields("DNEXTSUM").Value
m_DLASTCALL = nv.Fields("DLASTCALL").Value
m_DLASTDAY = nv.Fields("DLASTDAY").Value
m_DLASTHOUR = nv.Fields("DLASTHOUR").Value
m_MUSTREPEATDAY = nv.Fields("MUSTREPEATDAY").Value
m_MUSTREPEATHOUR = nv.Fields("MUSTREPEATHOUR").Value
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
   Dim o As PLANCALL
   Set o = New PLANCALL
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
  err.Raise err.Number, "PLANCALL.Save", err.Description
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
  err.Raise err.Number, "PLANCALL.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("PLANCALL", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "PLANCALL.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "PLANCALL", id
Exit Sub
bye:
  err.Raise err.Number, "PLANCALL.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 If Not Application Is Nothing Then Application.Logger.Message "PLANCALL.CloseClass"
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
  CSTATUS = node.Attributes.getNamedItem("CSTATUS").nodeValue
  ICALL = node.Attributes.getNamedItem("ICALL").nodeValue
  NUMCALL = node.Attributes.getNamedItem("NUMCALL").nodeValue
  CCURR = node.Attributes.getNamedItem("CCURR").nodeValue
  CHOUR = node.Attributes.getNamedItem("CHOUR").nodeValue
  C24 = node.Attributes.getNamedItem("C24").nodeValue
  CSUM = node.Attributes.getNamedItem("CSUM").nodeValue
  NUMHOUR = node.Attributes.getNamedItem("NUMHOUR").nodeValue
  NUM24 = node.Attributes.getNamedItem("NUM24").nodeValue
  NMAXCALL = node.Attributes.getNamedItem("NMAXCALL").nodeValue
  MINREPEAT = node.Attributes.getNamedItem("MINREPEAT").nodeValue
  DLOCK = node.Attributes.getNamedItem("DLOCK").nodeValue
  ICALL24 = node.Attributes.getNamedItem("ICALL24").nodeValue
  ICALLCURR = node.Attributes.getNamedItem("ICALLCURR").nodeValue
  ICALLSUM = node.Attributes.getNamedItem("ICALLSUM").nodeValue
  CHNRONLY = node.Attributes.getNamedItem("CHNRONLY").nodeValue
  C24NRONLY = node.Attributes.getNamedItem("C24NRONLY").nodeValue
  DNEXTHOUR = node.Attributes.getNamedItem("DNEXTHOUR").nodeValue
  DNEXT24 = node.Attributes.getNamedItem("DNEXT24").nodeValue
  DNEXTCURR = node.Attributes.getNamedItem("DNEXTCURR").nodeValue
  DNEXTSUM = node.Attributes.getNamedItem("DNEXTSUM").nodeValue
  DLASTCALL = node.Attributes.getNamedItem("DLASTCALL").nodeValue
  DLASTDAY = node.Attributes.getNamedItem("DLASTDAY").nodeValue
  DLASTHOUR = node.Attributes.getNamedItem("DLASTHOUR").nodeValue
  MUSTREPEATDAY = node.Attributes.getNamedItem("MUSTREPEATDAY").nodeValue
  MUSTREPEATHOUR = node.Attributes.getNamedItem("MUSTREPEATHOUR").nodeValue
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
  node.setAttribute "CSTATUS", CSTATUS
  node.setAttribute "ICALL", ICALL
  node.setAttribute "NUMCALL", NUMCALL
  node.setAttribute "CCURR", CCURR
  node.setAttribute "CHOUR", CHOUR
  node.setAttribute "C24", C24
  node.setAttribute "CSUM", CSUM
  node.setAttribute "NUMHOUR", NUMHOUR
  node.setAttribute "NUM24", NUM24
  node.setAttribute "NMAXCALL", NMAXCALL
  node.setAttribute "MINREPEAT", MINREPEAT
  node.setAttribute "DLOCK", CDbl(DLOCK)
  node.setAttribute "ICALL24", ICALL24
  node.setAttribute "ICALLCURR", ICALLCURR
  node.setAttribute "ICALLSUM", ICALLSUM
  node.setAttribute "CHNRONLY", CHNRONLY
  node.setAttribute "C24NRONLY", C24NRONLY
  node.setAttribute "DNEXTHOUR", CDbl(DNEXTHOUR)
  node.setAttribute "DNEXT24", CDbl(DNEXT24)
  node.setAttribute "DNEXTCURR", CDbl(DNEXTCURR)
  node.setAttribute "DNEXTSUM", CDbl(DNEXTSUM)
  node.setAttribute "DLASTCALL", CDbl(DLASTCALL)
  node.setAttribute "DLASTDAY", CDbl(DLASTDAY)
  node.setAttribute "DLASTHOUR", CDbl(DLASTHOUR)
  node.setAttribute "MUSTREPEATDAY", MUSTREPEATDAY
  node.setAttribute "MUSTREPEATHOUR", MUSTREPEATHOUR
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
m_IsLocked = Application.MTZSession.IsLocked("PLANCALL", id)
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
OK = Application.MTZSession.LockResource("PLANCALL", id, Permanent)
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
Application.MTZSession.UnLockResource "PLANCALL", id
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
CanLock = Application.MTZSession.CanLock("PLANCALL", id)
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



