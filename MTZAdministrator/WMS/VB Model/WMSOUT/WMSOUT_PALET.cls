VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "WMSOUT_PALET"
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
Private m_sequence As Long
Private m_TheNumber As Object
Dim m_TheNumber_ID As String
Dim m_TheNumber_ID_BRIEF As String
Private m_made_country As Object
Dim m_made_country_ID As String
Dim m_made_country_ID_BRIEF As String
Private m_Factory As Object
Dim m_Factory_ID As String
Dim m_Factory_ID_BRIEF As String
Private m_KILL_NUMBER As Object
Dim m_KILL_NUMBER_ID As String
Dim m_KILL_NUMBER_ID_BRIEF As String
Private m_VidOtruba As String
Private m_PartRef As Object
Dim m_PartRef_ID As String
Dim m_PartRef_ID_BRIEF As String
Private m_Made_date As Date
Private m_exp_date As Date
Private m_CaliberQuantity As Long
Private m_GoodWithPaletWeight As Double
Private m_PackageWeight As Double
Private m_FullPackageWeight As Double
Private m_IsEmpty As enumBoolean
Private m_BufferCell As String
Private m_StoreCell As String
Private m_ReorgWeight As Double
Private m_ReorgCaliberQuantity As Long
Private m_ReorgPackageFullWeight As Double
Private m_IsBrak As enumBoolean
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
  PartName = "WMSOUT_PALET"
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
  m_Application.Logger.Message "WMSOUT_PALET.Init"
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
'№ П\П

'№ П\П
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let sequence(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "sequence", sequence, NewValue

   m_sequence = NewValue
End If
End Property

'№ П\П
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. sequence
Public Property Get sequence() As Long
 LoadFromDatabase
 AccessTime = Now

   sequence = m_sequence
End Property
' let
'Палета

'Палета
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TheNumber(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheNumber", TheNumber, NewValue
On Error Resume Next
m_TheNumber_ID = ""
m_TheNumber_ID = NewValue.id
'  set   m_TheNumber= newValue
End If
End Property

'Палета
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TheNumber
Public Property Get TheNumber() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TheNumber As Object
If m_TheNumber_ID <> "" Then
  Set tmp_TheNumber = Application.FindRowObject("WMSPL_DEF", m_TheNumber_ID)
  If tmp_TheNumber Is Nothing Then
    m_TheNumber_ID_BRIEF = ""
  Else
    m_TheNumber_ID_BRIEF = tmp_TheNumber.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "WMSPL_DEF" & m_TheNumber_ID, tmp_TheNumber
  Set TheNumber = tmp_TheNumber
  Exit Property
End If
  '  set TheNumber = m_TheNumber
End Property
' let
'Страна производитель

'Страна производитель
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set made_country(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "made_country", made_country, NewValue
On Error Resume Next
m_made_country_ID = ""
m_made_country_ID = NewValue.id
'  set   m_made_country= newValue
End If
End Property

'Страна производитель
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. made_country
Public Property Get made_country() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_made_country As Object
If m_made_country_ID <> "" Then
  Set tmp_made_country = Application.FindRowObject("WMSD_COUNTRY", m_made_country_ID)
  If tmp_made_country Is Nothing Then
    m_made_country_ID_BRIEF = ""
  Else
    m_made_country_ID_BRIEF = tmp_made_country.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "WMSD_COUNTRY" & m_made_country_ID, tmp_made_country
  Set made_country = tmp_made_country
  Exit Property
End If
  '  set made_country = m_made_country
End Property
' let
'Завод

'Завод
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set Factory(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Factory", Factory, NewValue
On Error Resume Next
m_Factory_ID = ""
m_Factory_ID = NewValue.id
'  set   m_Factory= newValue
End If
End Property

'Завод
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Factory
Public Property Get Factory() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_Factory As Object
If m_Factory_ID <> "" Then
  Set tmp_Factory = Application.FindRowObject("WMSD_FACTORY", m_Factory_ID)
  If tmp_Factory Is Nothing Then
    m_Factory_ID_BRIEF = ""
  Else
    m_Factory_ID_BRIEF = tmp_Factory.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "WMSD_FACTORY" & m_Factory_ID, tmp_Factory
  Set Factory = tmp_Factory
  Exit Property
End If
  '  set Factory = m_Factory
End Property
' let
'№ бойни

'№ бойни
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set KILL_NUMBER(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "KILL_NUMBER", KILL_NUMBER, NewValue
On Error Resume Next
m_KILL_NUMBER_ID = ""
m_KILL_NUMBER_ID = NewValue.id
'  set   m_KILL_NUMBER= newValue
End If
End Property

'№ бойни
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. KILL_NUMBER
Public Property Get KILL_NUMBER() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_KILL_NUMBER As Object
If m_KILL_NUMBER_ID <> "" Then
  Set tmp_KILL_NUMBER = Application.FindRowObject("WMSD_KILLPLACE", m_KILL_NUMBER_ID)
  If tmp_KILL_NUMBER Is Nothing Then
    m_KILL_NUMBER_ID_BRIEF = ""
  Else
    m_KILL_NUMBER_ID_BRIEF = tmp_KILL_NUMBER.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "WMSD_KILLPLACE" & m_KILL_NUMBER_ID, tmp_KILL_NUMBER
  Set KILL_NUMBER = tmp_KILL_NUMBER
  Exit Property
End If
  '  set KILL_NUMBER = m_KILL_NUMBER
End Property
' let
'Вид отруба

'Вид отруба
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let VidOtruba(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "VidOtruba", VidOtruba, NewValue

   m_VidOtruba = NewValue
End If
End Property

'Вид отруба
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. VidOtruba
Public Property Get VidOtruba() As String
 LoadFromDatabase
 AccessTime = Now

   VidOtruba = m_VidOtruba
End Property
' let
'Партия

'Партия
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set PartRef(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PartRef", PartRef, NewValue
On Error Resume Next
m_PartRef_ID = ""
m_PartRef_ID = NewValue.id
'  set   m_PartRef= newValue
End If
End Property

'Партия
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. PartRef
Public Property Get PartRef() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_PartRef As Object
If m_PartRef_ID <> "" Then
  Set tmp_PartRef = Application.FindRowObject("WMSD_PART", m_PartRef_ID)
  If tmp_PartRef Is Nothing Then
    m_PartRef_ID_BRIEF = ""
  Else
    m_PartRef_ID_BRIEF = tmp_PartRef.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "WMSD_PART" & m_PartRef_ID, tmp_PartRef
  Set PartRef = tmp_PartRef
  Exit Property
End If
  '  set PartRef = m_PartRef
End Property
' let
'Дата производства

'Дата производства
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Made_date(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Made_date", Made_date, NewValue

   m_Made_date = NewValue
End If
End Property

'Дата производства
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. Made_date
Public Property Get Made_date() As Date
 LoadFromDatabase
 AccessTime = Now

   Made_date = m_Made_date
End Property
' let
'Срок годности

'Срок годности
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let exp_date(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "exp_date", exp_date, NewValue

   m_exp_date = NewValue
End If
End Property

'Срок годности
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. exp_date
Public Property Get exp_date() As Date
 LoadFromDatabase
 AccessTime = Now

   exp_date = m_exp_date
End Property
' let
'Количство коробов

'Количство коробов
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let CaliberQuantity(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CaliberQuantity", CaliberQuantity, NewValue

   m_CaliberQuantity = NewValue
End If
End Property

'Количство коробов
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. CaliberQuantity
Public Property Get CaliberQuantity() As Long
 LoadFromDatabase
 AccessTime = Now

   CaliberQuantity = m_CaliberQuantity
End Property
' let
'Вес БРУТТО с палетой КГ.

'Вес БРУТТО с палетой КГ.
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let GoodWithPaletWeight(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "GoodWithPaletWeight", GoodWithPaletWeight, NewValue

   m_GoodWithPaletWeight = NewValue
End If
End Property

'Вес БРУТТО с палетой КГ.
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. GoodWithPaletWeight
Public Property Get GoodWithPaletWeight() As Double
 LoadFromDatabase
 AccessTime = Now

   GoodWithPaletWeight = m_GoodWithPaletWeight
End Property
' let
'Вес одной упаковки КГ.

'Вес одной упаковки КГ.
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let PackageWeight(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PackageWeight", PackageWeight, NewValue

   m_PackageWeight = NewValue
End If
End Property

'Вес одной упаковки КГ.
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. PackageWeight
Public Property Get PackageWeight() As Double
 LoadFromDatabase
 AccessTime = Now

   PackageWeight = m_PackageWeight
End Property
' let
'Суммарный вес упаковки КГ.

'Суммарный вес упаковки КГ.
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FullPackageWeight(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FullPackageWeight", FullPackageWeight, NewValue

   m_FullPackageWeight = NewValue
End If
End Property

'Суммарный вес упаковки КГ.
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. FullPackageWeight
Public Property Get FullPackageWeight() As Double
 LoadFromDatabase
 AccessTime = Now

   FullPackageWeight = m_FullPackageWeight
End Property
' let
'Отгружена полностью

'Отгружена полностью
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IsEmpty(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IsEmpty", IsEmpty, NewValue

   m_IsEmpty = NewValue
End If
End Property

'Отгружена полностью
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. IsEmpty
Public Property Get IsEmpty() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   IsEmpty = m_IsEmpty
End Property
' let
'Адрес буферной ячейки

'Адрес буферной ячейки
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let BufferCell(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "BufferCell", BufferCell, NewValue

   m_BufferCell = NewValue
End If
End Property

'Адрес буферной ячейки
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. BufferCell
Public Property Get BufferCell() As String
 LoadFromDatabase
 AccessTime = Now

   BufferCell = m_BufferCell
End Property
' let
'Адрес основной ячейки

'Адрес основной ячейки
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let StoreCell(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "StoreCell", StoreCell, NewValue

   m_StoreCell = NewValue
End If
End Property

'Адрес основной ячейки
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. StoreCell
Public Property Get StoreCell() As String
 LoadFromDatabase
 AccessTime = Now

   StoreCell = m_StoreCell
End Property
' let
'Вес оставшегося груза с поддоном КГ.

'Вес оставшегося груза с поддоном КГ.
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ReorgWeight(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ReorgWeight", ReorgWeight, NewValue

   m_ReorgWeight = NewValue
End If
End Property

'Вес оставшегося груза с поддоном КГ.
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. ReorgWeight
Public Property Get ReorgWeight() As Double
 LoadFromDatabase
 AccessTime = Now

   ReorgWeight = m_ReorgWeight
End Property
' let
'Количество оставшихся коробов

'Количество оставшихся коробов
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ReorgCaliberQuantity(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ReorgCaliberQuantity", ReorgCaliberQuantity, NewValue

   m_ReorgCaliberQuantity = NewValue
End If
End Property

'Количество оставшихся коробов
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. ReorgCaliberQuantity
Public Property Get ReorgCaliberQuantity() As Long
 LoadFromDatabase
 AccessTime = Now

   ReorgCaliberQuantity = m_ReorgCaliberQuantity
End Property
' let
'Суммарный вес оставшейся упаковки КГ.

'Суммарный вес оставшейся упаковки КГ.
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ReorgPackageFullWeight(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ReorgPackageFullWeight", ReorgPackageFullWeight, NewValue

   m_ReorgPackageFullWeight = NewValue
End If
End Property

'Суммарный вес оставшейся упаковки КГ.
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. ReorgPackageFullWeight
Public Property Get ReorgPackageFullWeight() As Double
 LoadFromDatabase
 AccessTime = Now

   ReorgPackageFullWeight = m_ReorgPackageFullWeight
End Property
' let
'Брак

'Брак
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IsBrak(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IsBrak", IsBrak, NewValue

   m_IsBrak = NewValue
End If
End Property

'Брак
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. IsBrak
Public Property Get IsBrak() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   IsBrak = m_IsBrak
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

  Set nvi = nv.Add("sequence", m_sequence)
nvi.ValueType = adInteger
 ' Reference to WMSPL_DEF
    If m_TheNumber_ID = "" Then
       Set nvi = nv.Add("TheNumber", "")
    Else
       Set nvi = nv.Add("TheNumber", m_TheNumber_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to WMSD_COUNTRY
    If m_made_country_ID = "" Then
       Set nvi = nv.Add("made_country", "")
    Else
       Set nvi = nv.Add("made_country", m_made_country_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to WMSD_FACTORY
    If m_Factory_ID = "" Then
       Set nvi = nv.Add("Factory", "")
    Else
       Set nvi = nv.Add("Factory", m_Factory_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to WMSD_KILLPLACE
    If m_KILL_NUMBER_ID = "" Then
       Set nvi = nv.Add("KILL_NUMBER", "")
    Else
       Set nvi = nv.Add("KILL_NUMBER", m_KILL_NUMBER_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("VidOtruba", m_VidOtruba)
nvi.ValueSize = 64
 ' Reference to WMSD_PART
    If m_PartRef_ID = "" Then
       Set nvi = nv.Add("PartRef", "")
    Else
       Set nvi = nv.Add("PartRef", m_PartRef_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("Made_date", m_Made_date)
nvi.ValueType = adDate
  Set nvi = nv.Add("exp_date", m_exp_date)
nvi.ValueType = adDate
  Set nvi = nv.Add("CaliberQuantity", m_CaliberQuantity)
nvi.ValueType = adInteger
  Set nvi = nv.Add("GoodWithPaletWeight", m_GoodWithPaletWeight)
nvi.ValueType = adDouble
  Set nvi = nv.Add("PackageWeight", m_PackageWeight)
nvi.ValueType = adDouble
  Set nvi = nv.Add("FullPackageWeight", m_FullPackageWeight)
nvi.ValueType = adDouble
  Set nvi = nv.Add("IsEmpty", m_IsEmpty)
nvi.ValueType = adInteger
  Set nvi = nv.Add("BufferCell", m_BufferCell)
nvi.ValueSize = 20
  Set nvi = nv.Add("StoreCell", m_StoreCell)
nvi.ValueSize = 20
  Set nvi = nv.Add("ReorgWeight", m_ReorgWeight)
nvi.ValueType = adDouble
  Set nvi = nv.Add("ReorgCaliberQuantity", m_ReorgCaliberQuantity)
nvi.ValueType = adInteger
  Set nvi = nv.Add("ReorgPackageFullWeight", m_ReorgPackageFullWeight)
nvi.ValueType = adDouble
  Set nvi = nv.Add("IsBrak", m_IsBrak)
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
   If TheNumber Is Nothing Then
     m_Brief = m_Brief & "{" & m_TheNumber_ID_BRIEF & "}; "
   Else
     m_Brief = m_Brief & "{" & TheNumber.Brief & "}; "
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

m_sequence = nv.item("sequence").Value
  m_TheNumber_ID = nv.item("TheNumber").Value
  m_made_country_ID = nv.item("made_country").Value
  m_Factory_ID = nv.item("Factory").Value
  m_KILL_NUMBER_ID = nv.item("KILL_NUMBER").Value
m_VidOtruba = nv.item("VidOtruba").Value
  m_PartRef_ID = nv.item("PartRef").Value
m_Made_date = nv.item("Made_date").Value
m_exp_date = nv.item("exp_date").Value
m_CaliberQuantity = nv.item("CaliberQuantity").Value
m_GoodWithPaletWeight = nv.item("GoodWithPaletWeight").Value
m_PackageWeight = nv.item("PackageWeight").Value
m_FullPackageWeight = nv.item("FullPackageWeight").Value
m_IsEmpty = nv.item("IsEmpty").Value
m_BufferCell = nv.item("BufferCell").Value
m_StoreCell = nv.item("StoreCell").Value
m_ReorgWeight = nv.item("ReorgWeight").Value
m_ReorgCaliberQuantity = nv.item("ReorgCaliberQuantity").Value
m_ReorgPackageFullWeight = nv.item("ReorgPackageFullWeight").Value
m_IsBrak = nv.item("IsBrak").Value
Else

m_sequence = nv.Fields("sequence").Value
  m_TheNumber_ID = nv.Fields("TheNumber").Value
  m_made_country_ID = nv.Fields("made_country").Value
  m_Factory_ID = nv.Fields("Factory").Value
  m_KILL_NUMBER_ID = nv.Fields("KILL_NUMBER").Value
m_VidOtruba = nv.Fields("VidOtruba").Value
  m_PartRef_ID = nv.Fields("PartRef").Value
m_Made_date = nv.Fields("Made_date").Value
m_exp_date = nv.Fields("exp_date").Value
m_CaliberQuantity = nv.Fields("CaliberQuantity").Value
m_GoodWithPaletWeight = nv.Fields("GoodWithPaletWeight").Value
m_PackageWeight = nv.Fields("PackageWeight").Value
m_FullPackageWeight = nv.Fields("FullPackageWeight").Value
m_IsEmpty = nv.Fields("IsEmpty").Value
m_BufferCell = nv.Fields("BufferCell").Value
m_StoreCell = nv.Fields("StoreCell").Value
m_ReorgWeight = nv.Fields("ReorgWeight").Value
m_ReorgCaliberQuantity = nv.Fields("ReorgCaliberQuantity").Value
m_ReorgPackageFullWeight = nv.Fields("ReorgPackageFullWeight").Value
m_IsBrak = nv.Fields("IsBrak").Value
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
   Dim o As WMSOUT_PALET
   Set o = New WMSOUT_PALET
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
  err.Raise err.Number, "WMSOUT_PALET.Save", err.Description
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
  err.Raise err.Number, "WMSOUT_PALET.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("WMSOUT_PALET", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "WMSOUT_PALET.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "WMSOUT_PALET", id
Exit Sub
bye:
  err.Raise err.Number, "WMSOUT_PALET.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 m_TheNumber_ID = ""
 Set m_TheNumber = Nothing
 m_made_country_ID = ""
 Set m_made_country = Nothing
 m_Factory_ID = ""
 Set m_Factory = Nothing
 m_KILL_NUMBER_ID = ""
 Set m_KILL_NUMBER = Nothing
 m_PartRef_ID = ""
 Set m_PartRef = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "WMSOUT_PALET.CloseClass"
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
  sequence = node.Attributes.getNamedItem("SEQUENCE").nodeValue
  Set TheNumber = Nothing
  m_TheNumber_ID = node.Attributes.getNamedItem("THENUMBER").nodeValue
  m_TheNumber_ID_BRIEF = node.Attributes.getNamedItem("THENUMBER_BRIEF").nodeValue
  Set made_country = Nothing
  m_made_country_ID = node.Attributes.getNamedItem("MADE_COUNTRY").nodeValue
  m_made_country_ID_BRIEF = node.Attributes.getNamedItem("MADE_COUNTRY_BRIEF").nodeValue
  Set Factory = Nothing
  m_Factory_ID = node.Attributes.getNamedItem("FACTORY").nodeValue
  m_Factory_ID_BRIEF = node.Attributes.getNamedItem("FACTORY_BRIEF").nodeValue
  Set KILL_NUMBER = Nothing
  m_KILL_NUMBER_ID = node.Attributes.getNamedItem("KILL_NUMBER").nodeValue
  m_KILL_NUMBER_ID_BRIEF = node.Attributes.getNamedItem("KILL_NUMBER_BRIEF").nodeValue
  VidOtruba = Replace(node.Attributes.getNamedItem("VIDOTRUBA").nodeValue, vbLf, vbCrLf)
  Set PartRef = Nothing
  m_PartRef_ID = node.Attributes.getNamedItem("PARTREF").nodeValue
  m_PartRef_ID_BRIEF = node.Attributes.getNamedItem("PARTREF_BRIEF").nodeValue
  Made_date = node.Attributes.getNamedItem("MADE_DATE").nodeValue
  exp_date = node.Attributes.getNamedItem("EXP_DATE").nodeValue
  CaliberQuantity = node.Attributes.getNamedItem("CALIBERQUANTITY").nodeValue
  GoodWithPaletWeight = Val(Replace(node.Attributes.getNamedItem("GOODWITHPALETWEIGHT").nodeValue, vbLf, vbCrLf))
  PackageWeight = Val(Replace(node.Attributes.getNamedItem("PACKAGEWEIGHT").nodeValue, vbLf, vbCrLf))
  FullPackageWeight = Val(Replace(node.Attributes.getNamedItem("FULLPACKAGEWEIGHT").nodeValue, vbLf, vbCrLf))
  IsEmpty = node.Attributes.getNamedItem("ISEMPTY").nodeValue
  BufferCell = Replace(node.Attributes.getNamedItem("BUFFERCELL").nodeValue, vbLf, vbCrLf)
  StoreCell = Replace(node.Attributes.getNamedItem("STORECELL").nodeValue, vbLf, vbCrLf)
  ReorgWeight = Val(Replace(node.Attributes.getNamedItem("REORGWEIGHT").nodeValue, vbLf, vbCrLf))
  ReorgCaliberQuantity = node.Attributes.getNamedItem("REORGCALIBERQUANTITY").nodeValue
  ReorgPackageFullWeight = Val(Replace(node.Attributes.getNamedItem("REORGPACKAGEFULLWEIGHT").nodeValue, vbLf, vbCrLf))
  IsBrak = node.Attributes.getNamedItem("ISBRAK").nodeValue
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
  node.setAttribute "SEQUENCE", sequence
  node.setAttribute "THENUMBER", m_TheNumber_ID
  If Not (TheNumber Is Nothing) Then
    node.setAttribute "THENUMBER_BRIEF", TheNumber.Brief
  Else
    node.setAttribute "THENUMBER_BRIEF", m_TheNumber_ID_BRIEF
  End If
  node.setAttribute "MADE_COUNTRY", m_made_country_ID
  If Not (made_country Is Nothing) Then
    node.setAttribute "MADE_COUNTRY_BRIEF", made_country.Brief
  Else
    node.setAttribute "MADE_COUNTRY_BRIEF", m_made_country_ID_BRIEF
  End If
  node.setAttribute "FACTORY", m_Factory_ID
  If Not (Factory Is Nothing) Then
    node.setAttribute "FACTORY_BRIEF", Factory.Brief
  Else
    node.setAttribute "FACTORY_BRIEF", m_Factory_ID_BRIEF
  End If
  node.setAttribute "KILL_NUMBER", m_KILL_NUMBER_ID
  If Not (KILL_NUMBER Is Nothing) Then
    node.setAttribute "KILL_NUMBER_BRIEF", KILL_NUMBER.Brief
  Else
    node.setAttribute "KILL_NUMBER_BRIEF", m_KILL_NUMBER_ID_BRIEF
  End If
  node.setAttribute "VIDOTRUBA", VidOtruba
  node.setAttribute "PARTREF", m_PartRef_ID
  If Not (PartRef Is Nothing) Then
    node.setAttribute "PARTREF_BRIEF", PartRef.Brief
  Else
    node.setAttribute "PARTREF_BRIEF", m_PartRef_ID_BRIEF
  End If
  node.setAttribute "MADE_DATE", CDbl(Made_date)
  node.setAttribute "EXP_DATE", CDbl(exp_date)
  node.setAttribute "CALIBERQUANTITY", CaliberQuantity
  node.setAttribute "GOODWITHPALETWEIGHT", Replace(CStr(GoodWithPaletWeight), ",", ".")
  node.setAttribute "PACKAGEWEIGHT", Replace(CStr(PackageWeight), ",", ".")
  node.setAttribute "FULLPACKAGEWEIGHT", Replace(CStr(FullPackageWeight), ",", ".")
  node.setAttribute "ISEMPTY", IsEmpty
  node.setAttribute "BUFFERCELL", BufferCell
  node.setAttribute "STORECELL", StoreCell
  node.setAttribute "REORGWEIGHT", Replace(CStr(ReorgWeight), ",", ".")
  node.setAttribute "REORGCALIBERQUANTITY", ReorgCaliberQuantity
  node.setAttribute "REORGPACKAGEFULLWEIGHT", Replace(CStr(ReorgPackageFullWeight), ",", ".")
  node.setAttribute "ISBRAK", IsBrak
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
m_IsLocked = Application.MTZSession.IsLocked("WMSOUT_PALET", id)
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
OK = Application.MTZSession.LockResource("WMSOUT_PALET", id, Permanent)
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
Application.MTZSession.UnLockResource "WMSOUT_PALET", id
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
CanLock = Application.MTZSession.CanLock("WMSOUT_PALET", id)
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



