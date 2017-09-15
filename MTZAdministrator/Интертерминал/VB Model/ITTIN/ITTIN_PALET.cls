VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ITTIN_PALET"
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
Private m_made_date_to As Date
Private m_vetsved As String
Private m_exp_date As Date
Private m_CaliberQuantity As Long
Private m_PalWeight As Double
Private m_GoodWithPaletWeight As Double
Private m_PackageWeight As Double
Private m_FullPackageWeight As Double
Private m_BufferZonePlace As String
Private m_Stock_ID As Long
Private m_IsBrak As enumBoolean
Private m_palet_id As Long
Private m_KorobBrutto As Double
Private m_KorobNetto As Double
Private m_IsCalibrated As enumBoolean
Private m_SSCC As String
Private m_BarCode1 As String
Private m_BarCode2 As String
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
  PartName = "ITTIN_PALET"
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
  m_Application.Logger.Message "ITTIN_PALET.Init"
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
  Set tmp_TheNumber = Application.FindRowObject("ITTPL_DEF", m_TheNumber_ID)
  If tmp_TheNumber Is Nothing Then
    m_TheNumber_ID_BRIEF = ""
  Else
    m_TheNumber_ID_BRIEF = tmp_TheNumber.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "ITTPL_DEF" & m_TheNumber_ID, tmp_TheNumber
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
  Set tmp_made_country = Application.FindRowObject("ITTD_COUNTRY", m_made_country_ID)
  If tmp_made_country Is Nothing Then
    m_made_country_ID_BRIEF = ""
  Else
    m_made_country_ID_BRIEF = tmp_made_country.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "ITTD_COUNTRY" & m_made_country_ID, tmp_made_country
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
  Set tmp_Factory = Application.FindRowObject("ITTD_FACTORY", m_Factory_ID)
  If tmp_Factory Is Nothing Then
    m_Factory_ID_BRIEF = ""
  Else
    m_Factory_ID_BRIEF = tmp_Factory.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "ITTD_FACTORY" & m_Factory_ID, tmp_Factory
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
  Set tmp_KILL_NUMBER = Application.FindRowObject("ITTD_KILLPLACE", m_KILL_NUMBER_ID)
  If tmp_KILL_NUMBER Is Nothing Then
    m_KILL_NUMBER_ID_BRIEF = ""
  Else
    m_KILL_NUMBER_ID_BRIEF = tmp_KILL_NUMBER.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "ITTD_KILLPLACE" & m_KILL_NUMBER_ID, tmp_KILL_NUMBER
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
  Set tmp_PartRef = Application.FindRowObject("ITTD_PART", m_PartRef_ID)
  If tmp_PartRef Is Nothing Then
    m_PartRef_ID_BRIEF = ""
  Else
    m_PartRef_ID_BRIEF = tmp_PartRef.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "ITTD_PART" & m_PartRef_ID, tmp_PartRef
  Set PartRef = tmp_PartRef
  Exit Property
End If
  '  set PartRef = m_PartRef
End Property
' let
'Дата производства С

'Дата производства С
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

'Дата производства С
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
'Датиа производства По

'Датиа производства По
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let made_date_to(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "made_date_to", made_date_to, NewValue

   m_made_date_to = NewValue
End If
End Property

'Датиа производства По
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. made_date_to
Public Property Get made_date_to() As Date
 LoadFromDatabase
 AccessTime = Now

   made_date_to = m_made_date_to
End Property
' let
'Номер сертификата

'Номер сертификата
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let vetsved(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "vetsved", vetsved, NewValue

   m_vetsved = NewValue
End If
End Property

'Номер сертификата
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. vetsved
Public Property Get vetsved() As String
 LoadFromDatabase
 AccessTime = Now

   vetsved = m_vetsved
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
'Вес поддона КГ.

'Вес поддона КГ.
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let PalWeight(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PalWeight", PalWeight, NewValue

   m_PalWeight = NewValue
End If
End Property

'Вес поддона КГ.
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. PalWeight
Public Property Get PalWeight() As Double
 LoadFromDatabase
 AccessTime = Now

   PalWeight = m_PalWeight
End Property
' let
'Вес поддона с грузом КГ.

'Вес поддона с грузом КГ.
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

'Вес поддона с грузом КГ.
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
'Вес упаковки КГ.

'Вес упаковки КГ.
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

'Вес упаковки КГ.
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
'Номер ячейки в буферной зоне

'Номер ячейки в буферной зоне
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let BufferZonePlace(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "BufferZonePlace", BufferZonePlace, NewValue

   m_BufferZonePlace = NewValue
End If
End Property

'Номер ячейки в буферной зоне
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. BufferZonePlace
Public Property Get BufferZonePlace() As String
 LoadFromDatabase
 AccessTime = Now

   BufferZonePlace = m_BufferZonePlace
End Property
' let
'Идентификатор на  складе

'Идентификатор на  складе
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Stock_ID(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Stock_ID", Stock_ID, NewValue

   m_Stock_ID = NewValue
End If
End Property

'Идентификатор на  складе
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. Stock_ID
Public Property Get Stock_ID() As Long
 LoadFromDatabase
 AccessTime = Now

   Stock_ID = m_Stock_ID
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
' let
'Идентификатор палеты

'Идентификатор палеты
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let palet_id(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "palet_id", palet_id, NewValue

   m_palet_id = NewValue
End If
End Property

'Идентификатор палеты
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. palet_id
Public Property Get palet_id() As Long
 LoadFromDatabase
 AccessTime = Now

   palet_id = m_palet_id
End Property
' let
'Вес брутто короба

'Вес брутто короба
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let KorobBrutto(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "KorobBrutto", KorobBrutto, NewValue

   m_KorobBrutto = NewValue
End If
End Property

'Вес брутто короба
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. KorobBrutto
Public Property Get KorobBrutto() As Double
 LoadFromDatabase
 AccessTime = Now

   KorobBrutto = m_KorobBrutto
End Property
' let
'Вес НЕТТО короба

'Вес НЕТТО короба
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let KorobNetto(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "KorobNetto", KorobNetto, NewValue

   m_KorobNetto = NewValue
End If
End Property

'Вес НЕТТО короба
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. KorobNetto
Public Property Get KorobNetto() As Double
 LoadFromDatabase
 AccessTime = Now

   KorobNetto = m_KorobNetto
End Property
' let
'Калиброванный груз

'Калиброванный груз
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IsCalibrated(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IsCalibrated", IsCalibrated, NewValue

   m_IsCalibrated = NewValue
End If
End Property

'Калиброванный груз
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. IsCalibrated
Public Property Get IsCalibrated() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   IsCalibrated = m_IsCalibrated
End Property
' let
'SSCC код

'SSCC код
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let SSCC(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SSCC", SSCC, NewValue

   m_SSCC = NewValue
End If
End Property

'SSCC код
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. SSCC
Public Property Get SSCC() As String
 LoadFromDatabase
 AccessTime = Now

   SSCC = m_SSCC
End Property
' let
'Bar Code 1

'Bar Code 1
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let BarCode1(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "BarCode1", BarCode1, NewValue

   m_BarCode1 = NewValue
End If
End Property

'Bar Code 1
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. BarCode1
Public Property Get BarCode1() As String
 LoadFromDatabase
 AccessTime = Now

   BarCode1 = m_BarCode1
End Property
' let
'Bar Code 2

'Bar Code 2
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let BarCode2(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "BarCode2", BarCode2, NewValue

   m_BarCode2 = NewValue
End If
End Property

'Bar Code 2
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. BarCode2
Public Property Get BarCode2() As String
 LoadFromDatabase
 AccessTime = Now

   BarCode2 = m_BarCode2
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
 ' Reference to ITTPL_DEF
    If m_TheNumber_ID = "" Then
       Set nvi = nv.Add("TheNumber", "")
    Else
       Set nvi = nv.Add("TheNumber", m_TheNumber_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to ITTD_COUNTRY
    If m_made_country_ID = "" Then
       Set nvi = nv.Add("made_country", "")
    Else
       Set nvi = nv.Add("made_country", m_made_country_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to ITTD_FACTORY
    If m_Factory_ID = "" Then
       Set nvi = nv.Add("Factory", "")
    Else
       Set nvi = nv.Add("Factory", m_Factory_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to ITTD_KILLPLACE
    If m_KILL_NUMBER_ID = "" Then
       Set nvi = nv.Add("KILL_NUMBER", "")
    Else
       Set nvi = nv.Add("KILL_NUMBER", m_KILL_NUMBER_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("VidOtruba", m_VidOtruba)
nvi.ValueSize = 64
 ' Reference to ITTD_PART
    If m_PartRef_ID = "" Then
       Set nvi = nv.Add("PartRef", "")
    Else
       Set nvi = nv.Add("PartRef", m_PartRef_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("Made_date", m_Made_date)
nvi.ValueType = adDate
  Set nvi = nv.Add("made_date_to", m_made_date_to)
nvi.ValueType = adDate
  Set nvi = nv.Add("vetsved", m_vetsved)
nvi.ValueSize = 50
  Set nvi = nv.Add("exp_date", m_exp_date)
nvi.ValueType = adDate
  Set nvi = nv.Add("CaliberQuantity", m_CaliberQuantity)
nvi.ValueType = adInteger
  Set nvi = nv.Add("PalWeight", m_PalWeight)
nvi.ValueType = adDouble
  Set nvi = nv.Add("GoodWithPaletWeight", m_GoodWithPaletWeight)
nvi.ValueType = adDouble
  Set nvi = nv.Add("PackageWeight", m_PackageWeight)
nvi.ValueType = adDouble
  Set nvi = nv.Add("FullPackageWeight", m_FullPackageWeight)
nvi.ValueType = adDouble
  Set nvi = nv.Add("BufferZonePlace", m_BufferZonePlace)
nvi.ValueSize = 20
  Set nvi = nv.Add("Stock_ID", m_Stock_ID)
nvi.ValueType = adInteger
  Set nvi = nv.Add("IsBrak", m_IsBrak)
nvi.ValueType = adInteger
  Set nvi = nv.Add("palet_id", m_palet_id)
nvi.ValueType = adInteger
  Set nvi = nv.Add("KorobBrutto", m_KorobBrutto)
nvi.ValueType = adDouble
  Set nvi = nv.Add("KorobNetto", m_KorobNetto)
nvi.ValueType = adDouble
  Set nvi = nv.Add("IsCalibrated", m_IsCalibrated)
nvi.ValueType = adInteger
  Set nvi = nv.Add("SSCC", m_SSCC)
nvi.ValueSize = 18
  Set nvi = nv.Add("BarCode1", m_BarCode1)
nvi.ValueSize = 40
  Set nvi = nv.Add("BarCode2", m_BarCode2)
nvi.ValueSize = 40
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
m_made_date_to = nv.item("made_date_to").Value
m_vetsved = nv.item("vetsved").Value
m_exp_date = nv.item("exp_date").Value
m_CaliberQuantity = nv.item("CaliberQuantity").Value
m_PalWeight = nv.item("PalWeight").Value
m_GoodWithPaletWeight = nv.item("GoodWithPaletWeight").Value
m_PackageWeight = nv.item("PackageWeight").Value
m_FullPackageWeight = nv.item("FullPackageWeight").Value
m_BufferZonePlace = nv.item("BufferZonePlace").Value
m_Stock_ID = nv.item("Stock_ID").Value
m_IsBrak = nv.item("IsBrak").Value
m_palet_id = nv.item("palet_id").Value
m_KorobBrutto = nv.item("KorobBrutto").Value
m_KorobNetto = nv.item("KorobNetto").Value
m_IsCalibrated = nv.item("IsCalibrated").Value
m_SSCC = nv.item("SSCC").Value
m_BarCode1 = nv.item("BarCode1").Value
m_BarCode2 = nv.item("BarCode2").Value
Else

m_sequence = nv.Fields("sequence").Value
  m_TheNumber_ID = nv.Fields("TheNumber").Value
  m_made_country_ID = nv.Fields("made_country").Value
  m_Factory_ID = nv.Fields("Factory").Value
  m_KILL_NUMBER_ID = nv.Fields("KILL_NUMBER").Value
m_VidOtruba = nv.Fields("VidOtruba").Value
  m_PartRef_ID = nv.Fields("PartRef").Value
m_Made_date = nv.Fields("Made_date").Value
m_made_date_to = nv.Fields("made_date_to").Value
m_vetsved = nv.Fields("vetsved").Value
m_exp_date = nv.Fields("exp_date").Value
m_CaliberQuantity = nv.Fields("CaliberQuantity").Value
m_PalWeight = nv.Fields("PalWeight").Value
m_GoodWithPaletWeight = nv.Fields("GoodWithPaletWeight").Value
m_PackageWeight = nv.Fields("PackageWeight").Value
m_FullPackageWeight = nv.Fields("FullPackageWeight").Value
m_BufferZonePlace = nv.Fields("BufferZonePlace").Value
m_Stock_ID = nv.Fields("Stock_ID").Value
m_IsBrak = nv.Fields("IsBrak").Value
m_palet_id = nv.Fields("palet_id").Value
m_KorobBrutto = nv.Fields("KorobBrutto").Value
m_KorobNetto = nv.Fields("KorobNetto").Value
m_IsCalibrated = nv.Fields("IsCalibrated").Value
m_SSCC = nv.Fields("SSCC").Value
m_BarCode1 = nv.Fields("BarCode1").Value
m_BarCode2 = nv.Fields("BarCode2").Value
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
   Dim o As ITTIN_PALET
   Set o = New ITTIN_PALET
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
  err.Raise err.Number, "ITTIN_PALET.Save", err.Description
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
  err.Raise err.Number, "ITTIN_PALET.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("ITTIN_PALET", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "ITTIN_PALET.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "ITTIN_PALET", id
Exit Sub
bye:
  err.Raise err.Number, "ITTIN_PALET.Propagate", err.Description
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
 If Not Application Is Nothing Then Application.Logger.Message "ITTIN_PALET.CloseClass"
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
  made_date_to = node.Attributes.getNamedItem("MADE_DATE_TO").nodeValue
  vetsved = Replace(node.Attributes.getNamedItem("VETSVED").nodeValue, vbLf, vbCrLf)
  exp_date = node.Attributes.getNamedItem("EXP_DATE").nodeValue
  CaliberQuantity = node.Attributes.getNamedItem("CALIBERQUANTITY").nodeValue
  PalWeight = Val(Replace(node.Attributes.getNamedItem("PALWEIGHT").nodeValue, vbLf, vbCrLf))
  GoodWithPaletWeight = Val(Replace(node.Attributes.getNamedItem("GOODWITHPALETWEIGHT").nodeValue, vbLf, vbCrLf))
  PackageWeight = Val(Replace(node.Attributes.getNamedItem("PACKAGEWEIGHT").nodeValue, vbLf, vbCrLf))
  FullPackageWeight = Val(Replace(node.Attributes.getNamedItem("FULLPACKAGEWEIGHT").nodeValue, vbLf, vbCrLf))
  BufferZonePlace = Replace(node.Attributes.getNamedItem("BUFFERZONEPLACE").nodeValue, vbLf, vbCrLf)
  Stock_ID = node.Attributes.getNamedItem("STOCK_ID").nodeValue
  IsBrak = node.Attributes.getNamedItem("ISBRAK").nodeValue
  palet_id = node.Attributes.getNamedItem("PALET_ID").nodeValue
  KorobBrutto = Val(Replace(node.Attributes.getNamedItem("KOROBBRUTTO").nodeValue, vbLf, vbCrLf))
  KorobNetto = Val(Replace(node.Attributes.getNamedItem("KOROBNETTO").nodeValue, vbLf, vbCrLf))
  IsCalibrated = node.Attributes.getNamedItem("ISCALIBRATED").nodeValue
  SSCC = Replace(node.Attributes.getNamedItem("SSCC").nodeValue, vbLf, vbCrLf)
  BarCode1 = Replace(node.Attributes.getNamedItem("BARCODE1").nodeValue, vbLf, vbCrLf)
  BarCode2 = Replace(node.Attributes.getNamedItem("BARCODE2").nodeValue, vbLf, vbCrLf)
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
  node.setAttribute "MADE_DATE_TO", CDbl(made_date_to)
  node.setAttribute "VETSVED", vetsved
  node.setAttribute "EXP_DATE", CDbl(exp_date)
  node.setAttribute "CALIBERQUANTITY", CaliberQuantity
  node.setAttribute "PALWEIGHT", Replace(CStr(PalWeight), ",", ".")
  node.setAttribute "GOODWITHPALETWEIGHT", Replace(CStr(GoodWithPaletWeight), ",", ".")
  node.setAttribute "PACKAGEWEIGHT", Replace(CStr(PackageWeight), ",", ".")
  node.setAttribute "FULLPACKAGEWEIGHT", Replace(CStr(FullPackageWeight), ",", ".")
  node.setAttribute "BUFFERZONEPLACE", BufferZonePlace
  node.setAttribute "STOCK_ID", Stock_ID
  node.setAttribute "ISBRAK", IsBrak
  node.setAttribute "PALET_ID", palet_id
  node.setAttribute "KOROBBRUTTO", Replace(CStr(KorobBrutto), ",", ".")
  node.setAttribute "KOROBNETTO", Replace(CStr(KorobNetto), ",", ".")
  node.setAttribute "ISCALIBRATED", IsCalibrated
  node.setAttribute "SSCC", SSCC
  node.setAttribute "BARCODE1", BarCode1
  node.setAttribute "BARCODE2", BarCode2
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
m_IsLocked = Application.MTZSession.IsLocked("ITTIN_PALET", id)
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
OK = Application.MTZSession.LockResource("ITTIN_PALET", id, Permanent)
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
Application.MTZSession.UnLockResource "ITTIN_PALET", id
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
CanLock = Application.MTZSession.CanLock("ITTIN_PALET", id)
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
If mode = "read" Then
 Select Case child
End Select
End If ' mode="read"
If mode = "main" Then
 Select Case child
End Select
End If ' mode="main"
If mode = "admi" Then
 Select Case child
End Select
End If ' mode="admi"
If mode = "" Then
 Select Case child
 End Select
End If ' mode="" (Default)
End Sub



