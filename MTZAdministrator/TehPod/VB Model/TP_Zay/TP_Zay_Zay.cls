VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TP_Zay_Zay"
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
Private m_Num As Long
Private m_DataPriem As Date
Private m_ZType As Object
Dim m_ZType_ID As String
Dim m_ZType_ID_BRIEF As String
Private m_FIO As String
Private m_TheOperator As Object
Dim m_TheOperator_ID As String
Dim m_TheOperator_ID_BRIEF As String
Private m_Adres As String
Private m_Rayon As Object
Dim m_Rayon_ID As String
Dim m_Rayon_ID_BRIEF As String
Private m_Metro As Object
Dim m_Metro_ID As String
Dim m_Metro_ID_BRIEF As String
Private m_KonrLizo As String
Private m_KontTelefon As String
Private m_KontEMAIL As String
Private m_VremjaDljaSvjazi As String
Private m_GelData As Date
Private m_GelVremja As Object
Dim m_GelVremja_ID As String
Dim m_GelVremja_ID_BRIEF As String
Private m_Portref As Object
Dim m_Portref_ID As String
Dim m_Portref_ID_BRIEF As String
Private m_ABNumber As String
Private m_SN_STB As String
Private m_MAC_STB As String
Private m_DopInfo As String
Private m_Koordin As Object
Dim m_Koordin_ID As String
Dim m_Koordin_ID_BRIEF As String
Private m_Ingener As Object
Dim m_Ingener_ID As String
Dim m_Ingener_ID_BRIEF As String
Private m_DeviceType As Object
Dim m_DeviceType_ID As String
Dim m_DeviceType_ID_BRIEF As String
Private m_VidanModemSer As String
Private m_Tarif As Object
Dim m_Tarif_ID As String
Dim m_Tarif_ID_BRIEF As String
Private m_FIOdogovor As String
Private m_DataInstall As Date
Private m_SrochDogovor As Object
Dim m_SrochDogovor_ID As String
Dim m_SrochDogovor_ID_BRIEF As String
Private m_DocPolych As enumBoolean
Private m_DataSZT As Date
Private m_VklVReestr As enumBoolean
Private m_Otkaz As enumBoolean
Private m_OpisProblem As String
Private m_OtprVKEY As enumBoolean
Private m_DataOtpravVKEY As Date
Private m_DopSogl As enumBoolean
Private m_NumDogovor As String
Private m_Komment As String
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
  PartName = "TP_Zay_Zay"
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
  m_Application.Logger.Message "TP_Zay_Zay.Init"
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
'Номер заявки

'Номер заявки
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Num(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Num", Num, NewValue

   m_Num = NewValue
End If
End Property

'Номер заявки
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. Num
Public Property Get Num() As Long
 LoadFromDatabase
 AccessTime = Now

   Num = m_Num
End Property
' let
'Дата приема

'Дата приема
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DataPriem(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DataPriem", DataPriem, NewValue

   m_DataPriem = NewValue
End If
End Property

'Дата приема
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. DataPriem
Public Property Get DataPriem() As Date
 LoadFromDatabase
 AccessTime = Now

   DataPriem = m_DataPriem
End Property
' let
'Тип заявки

'Тип заявки
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set ZType(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ZType", ZType, NewValue
On Error Resume Next
m_ZType_ID = ""
m_ZType_ID = NewValue.id
'  set   m_ZType= newValue
End If
End Property

'Тип заявки
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. ZType
Public Property Get ZType() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_ZType As Object
If m_ZType_ID <> "" Then
  Set tmp_ZType = Application.FindRowObject("TP_SPR_ZTYPE", m_ZType_ID)
  If tmp_ZType Is Nothing Then
    m_ZType_ID_BRIEF = ""
  Else
    m_ZType_ID_BRIEF = tmp_ZType.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "TP_SPR_ZTYPE" & m_ZType_ID, tmp_ZType
  Set ZType = tmp_ZType
  Exit Property
End If
  '  set ZType = m_ZType
End Property
' let
'ФИО

'ФИО
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FIO(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FIO", FIO, NewValue

   m_FIO = NewValue
End If
End Property

'ФИО
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FIO
Public Property Get FIO() As String
 LoadFromDatabase
 AccessTime = Now

   FIO = m_FIO
End Property
' let
'Оператор

'Оператор
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TheOperator(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheOperator", TheOperator, NewValue
On Error Resume Next
m_TheOperator_ID = ""
m_TheOperator_ID = NewValue.id
'  set   m_TheOperator= newValue
End If
End Property

'Оператор
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TheOperator
Public Property Get TheOperator() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TheOperator As Object
If m_TheOperator_ID <> "" Then
  Set tmp_TheOperator = Application.FindRowObject("TP_Spr_Oper", m_TheOperator_ID)
  If tmp_TheOperator Is Nothing Then
    m_TheOperator_ID_BRIEF = ""
  Else
    m_TheOperator_ID_BRIEF = tmp_TheOperator.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "TP_Spr_Oper" & m_TheOperator_ID, tmp_TheOperator
  Set TheOperator = tmp_TheOperator
  Exit Property
End If
  '  set TheOperator = m_TheOperator
End Property
' let
'Адрес

'Адрес
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Adres(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Adres", Adres, NewValue

   m_Adres = NewValue
End If
End Property

'Адрес
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. Adres
Public Property Get Adres() As String
 LoadFromDatabase
 AccessTime = Now

   Adres = m_Adres
End Property
' let
'Район

'Район
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set Rayon(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Rayon", Rayon, NewValue
On Error Resume Next
m_Rayon_ID = ""
m_Rayon_ID = NewValue.id
'  set   m_Rayon= newValue
End If
End Property

'Район
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Rayon
Public Property Get Rayon() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_Rayon As Object
If m_Rayon_ID <> "" Then
  Set tmp_Rayon = Application.FindRowObject("Rayon", m_Rayon_ID)
  If tmp_Rayon Is Nothing Then
    m_Rayon_ID_BRIEF = ""
  Else
    m_Rayon_ID_BRIEF = tmp_Rayon.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "Rayon" & m_Rayon_ID, tmp_Rayon
  Set Rayon = tmp_Rayon
  Exit Property
End If
  '  set Rayon = m_Rayon
End Property
' let
'Метро

'Метро
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set Metro(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Metro", Metro, NewValue
On Error Resume Next
m_Metro_ID = ""
m_Metro_ID = NewValue.id
'  set   m_Metro= newValue
End If
End Property

'Метро
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Metro
Public Property Get Metro() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_Metro As Object
If m_Metro_ID <> "" Then
  Set tmp_Metro = Application.FindRowObject("TP_Spr_Metro", m_Metro_ID)
  If tmp_Metro Is Nothing Then
    m_Metro_ID_BRIEF = ""
  Else
    m_Metro_ID_BRIEF = tmp_Metro.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "TP_Spr_Metro" & m_Metro_ID, tmp_Metro
  Set Metro = tmp_Metro
  Exit Property
End If
  '  set Metro = m_Metro
End Property
' let
'Контактное лицо

'Контактное лицо
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let KonrLizo(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "KonrLizo", KonrLizo, NewValue

   m_KonrLizo = NewValue
End If
End Property

'Контактное лицо
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. KonrLizo
Public Property Get KonrLizo() As String
 LoadFromDatabase
 AccessTime = Now

   KonrLizo = m_KonrLizo
End Property
' let
'Контактный телефон

'Контактный телефон
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let KontTelefon(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "KontTelefon", KontTelefon, NewValue

   m_KontTelefon = NewValue
End If
End Property

'Контактный телефон
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. KontTelefon
Public Property Get KontTelefon() As String
 LoadFromDatabase
 AccessTime = Now

   KontTelefon = m_KontTelefon
End Property
' let
'Контактный e-mail

'Контактный e-mail
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let KontEMAIL(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "KontEMAIL", KontEMAIL, NewValue

   m_KontEMAIL = NewValue
End If
End Property

'Контактный e-mail
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. KontEMAIL
Public Property Get KontEMAIL() As String
 LoadFromDatabase
 AccessTime = Now

   KontEMAIL = m_KontEMAIL
End Property
' let
'Время для связи

'Время для связи
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let VremjaDljaSvjazi(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "VremjaDljaSvjazi", VremjaDljaSvjazi, NewValue

   m_VremjaDljaSvjazi = NewValue
End If
End Property

'Время для связи
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. VremjaDljaSvjazi
Public Property Get VremjaDljaSvjazi() As String
 LoadFromDatabase
 AccessTime = Now

   VremjaDljaSvjazi = m_VremjaDljaSvjazi
End Property
' let
'Желаемая дата визита инсталятора

'Желаемая дата визита инсталятора
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let GelData(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "GelData", GelData, NewValue

   m_GelData = NewValue
End If
End Property

'Желаемая дата визита инсталятора
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. GelData
Public Property Get GelData() As Date
 LoadFromDatabase
 AccessTime = Now

   GelData = m_GelData
End Property
' let
'Желаемое время визита инсталятора

'Желаемое время визита инсталятора
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set GelVremja(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "GelVremja", GelVremja, NewValue
On Error Resume Next
m_GelVremja_ID = ""
m_GelVremja_ID = NewValue.id
'  set   m_GelVremja= newValue
End If
End Property

'Желаемое время визита инсталятора
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. GelVremja
Public Property Get GelVremja() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_GelVremja As Object
If m_GelVremja_ID <> "" Then
  Set tmp_GelVremja = Application.FindRowObject("TP_Spr_VrVisInst", m_GelVremja_ID)
  If tmp_GelVremja Is Nothing Then
    m_GelVremja_ID_BRIEF = ""
  Else
    m_GelVremja_ID_BRIEF = tmp_GelVremja.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "TP_Spr_VrVisInst" & m_GelVremja_ID, tmp_GelVremja
  Set GelVremja = tmp_GelVremja
  Exit Property
End If
  '  set GelVremja = m_GelVremja
End Property
' let
'Порт

'Порт
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set Portref(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Portref", Portref, NewValue
On Error Resume Next
m_Portref_ID = ""
m_Portref_ID = NewValue.id
'  set   m_Portref= newValue
End If
End Property

'Порт
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Portref
Public Property Get Portref() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_Portref As Object
If m_Portref_ID <> "" Then
  Set tmp_Portref = Application.FindRowObject("TP_SPR_Port", m_Portref_ID)
  If tmp_Portref Is Nothing Then
    m_Portref_ID_BRIEF = ""
  Else
    m_Portref_ID_BRIEF = tmp_Portref.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "TP_SPR_Port" & m_Portref_ID, tmp_Portref
  Set Portref = tmp_Portref
  Exit Property
End If
  '  set Portref = m_Portref
End Property
' let
'Абонентский номер

'Абонентский номер
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ABNumber(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ABNumber", ABNumber, NewValue

   m_ABNumber = NewValue
End If
End Property

'Абонентский номер
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. ABNumber
Public Property Get ABNumber() As String
 LoadFromDatabase
 AccessTime = Now

   ABNumber = m_ABNumber
End Property
' let
'Сер. Номер STB

'Сер. Номер STB
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let SN_STB(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SN_STB", SN_STB, NewValue

   m_SN_STB = NewValue
End If
End Property

'Сер. Номер STB
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. SN_STB
Public Property Get SN_STB() As String
 LoadFromDatabase
 AccessTime = Now

   SN_STB = m_SN_STB
End Property
' let
'MAC STB

'MAC STB
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let MAC_STB(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "MAC_STB", MAC_STB, NewValue

   m_MAC_STB = NewValue
End If
End Property

'MAC STB
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. MAC_STB
Public Property Get MAC_STB() As String
 LoadFromDatabase
 AccessTime = Now

   MAC_STB = m_MAC_STB
End Property
' let
'Доп. информация

'Доп. информация
'Parameters:
'[IN]   newValue , тип параметра: STRING  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DopInfo(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DopInfo", DopInfo, NewValue

   m_DopInfo = NewValue
End If
End Property

'Доп. информация
'Parameters:
' параметров нет
'Returns:
'  значение типа STRING
'See Also:
'Example:
' dim variable as STRING
' variable = me. DopInfo
Public Property Get DopInfo() As String
 LoadFromDatabase
 AccessTime = Now

   DopInfo = m_DopInfo
End Property
' let
'Координатор

'Координатор
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set Koordin(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Koordin", Koordin, NewValue
On Error Resume Next
m_Koordin_ID = ""
m_Koordin_ID = NewValue.id
'  set   m_Koordin= newValue
End If
End Property

'Координатор
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Koordin
Public Property Get Koordin() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_Koordin As Object
If m_Koordin_ID <> "" Then
  Set tmp_Koordin = Application.FindRowObject("TP_Spr_Koor", m_Koordin_ID)
  If tmp_Koordin Is Nothing Then
    m_Koordin_ID_BRIEF = ""
  Else
    m_Koordin_ID_BRIEF = tmp_Koordin.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "TP_Spr_Koor" & m_Koordin_ID, tmp_Koordin
  Set Koordin = tmp_Koordin
  Exit Property
End If
  '  set Koordin = m_Koordin
End Property
' let
'Инженер

'Инженер
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set Ingener(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Ingener", Ingener, NewValue
On Error Resume Next
m_Ingener_ID = ""
m_Ingener_ID = NewValue.id
'  set   m_Ingener= newValue
End If
End Property

'Инженер
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Ingener
Public Property Get Ingener() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_Ingener As Object
If m_Ingener_ID <> "" Then
  Set tmp_Ingener = Application.FindRowObject("TP_Spr_Ing", m_Ingener_ID)
  If tmp_Ingener Is Nothing Then
    m_Ingener_ID_BRIEF = ""
  Else
    m_Ingener_ID_BRIEF = tmp_Ingener.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "TP_Spr_Ing" & m_Ingener_ID, tmp_Ingener
  Set Ingener = tmp_Ingener
  Exit Property
End If
  '  set Ingener = m_Ingener
End Property
' let
'Тип оборудования

'Тип оборудования
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set DeviceType(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DeviceType", DeviceType, NewValue
On Error Resume Next
m_DeviceType_ID = ""
m_DeviceType_ID = NewValue.id
'  set   m_DeviceType= newValue
End If
End Property

'Тип оборудования
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. DeviceType
Public Property Get DeviceType() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_DeviceType As Object
If m_DeviceType_ID <> "" Then
  Set tmp_DeviceType = Application.FindRowObject("TP_SPR_MT", m_DeviceType_ID)
  If tmp_DeviceType Is Nothing Then
    m_DeviceType_ID_BRIEF = ""
  Else
    m_DeviceType_ID_BRIEF = tmp_DeviceType.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "TP_SPR_MT" & m_DeviceType_ID, tmp_DeviceType
  Set DeviceType = tmp_DeviceType
  Exit Property
End If
  '  set DeviceType = m_DeviceType
End Property
' let
'Выданный модем серийник

'Выданный модем серийник
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let VidanModemSer(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "VidanModemSer", VidanModemSer, NewValue

   m_VidanModemSer = NewValue
End If
End Property

'Выданный модем серийник
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. VidanModemSer
Public Property Get VidanModemSer() As String
 LoadFromDatabase
 AccessTime = Now

   VidanModemSer = m_VidanModemSer
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
Public Property Set Tarif(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Tarif", Tarif, NewValue
On Error Resume Next
m_Tarif_ID = ""
m_Tarif_ID = NewValue.id
'  set   m_Tarif= newValue
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
' Set variable = me. Tarif
Public Property Get Tarif() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_Tarif As Object
If m_Tarif_ID <> "" Then
  Set tmp_Tarif = Application.FindRowObject("TP_Spr_Tar", m_Tarif_ID)
  If tmp_Tarif Is Nothing Then
    m_Tarif_ID_BRIEF = ""
  Else
    m_Tarif_ID_BRIEF = tmp_Tarif.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "TP_Spr_Tar" & m_Tarif_ID, tmp_Tarif
  Set Tarif = tmp_Tarif
  Exit Property
End If
  '  set Tarif = m_Tarif
End Property
' let
'ФИО в договоре

'ФИО в договоре
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FIOdogovor(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FIOdogovor", FIOdogovor, NewValue

   m_FIOdogovor = NewValue
End If
End Property

'ФИО в договоре
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FIOdogovor
Public Property Get FIOdogovor() As String
 LoadFromDatabase
 AccessTime = Now

   FIOdogovor = m_FIOdogovor
End Property
' let
'Дата инсталяции

'Дата инсталяции
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DataInstall(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DataInstall", DataInstall, NewValue

   m_DataInstall = NewValue
End If
End Property

'Дата инсталяции
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. DataInstall
Public Property Get DataInstall() As Date
 LoadFromDatabase
 AccessTime = Now

   DataInstall = m_DataInstall
End Property
' let
'Срок договора

'Срок договора
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set SrochDogovor(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SrochDogovor", SrochDogovor, NewValue
On Error Resume Next
m_SrochDogovor_ID = ""
m_SrochDogovor_ID = NewValue.id
'  set   m_SrochDogovor= newValue
End If
End Property

'Срок договора
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. SrochDogovor
Public Property Get SrochDogovor() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_SrochDogovor As Object
If m_SrochDogovor_ID <> "" Then
  Set tmp_SrochDogovor = Application.FindRowObject("TP_Spr_SrochDog", m_SrochDogovor_ID)
  If tmp_SrochDogovor Is Nothing Then
    m_SrochDogovor_ID_BRIEF = ""
  Else
    m_SrochDogovor_ID_BRIEF = tmp_SrochDogovor.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "TP_Spr_SrochDog" & m_SrochDogovor_ID, tmp_SrochDogovor
  Set SrochDogovor = tmp_SrochDogovor
  Exit Property
End If
  '  set SrochDogovor = m_SrochDogovor
End Property
' let
'Документы получены

'Документы получены
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DocPolych(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DocPolych", DocPolych, NewValue

   m_DocPolych = NewValue
End If
End Property

'Документы получены
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. DocPolych
Public Property Get DocPolych() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   DocPolych = m_DocPolych
End Property
' let
'Дата передачи в СЗТ

'Дата передачи в СЗТ
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DataSZT(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DataSZT", DataSZT, NewValue

   m_DataSZT = NewValue
End If
End Property

'Дата передачи в СЗТ
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. DataSZT
Public Property Get DataSZT() As Date
 LoadFromDatabase
 AccessTime = Now

   DataSZT = m_DataSZT
End Property
' let
'Включена в реестр для оплаты

'Включена в реестр для оплаты
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let VklVReestr(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "VklVReestr", VklVReestr, NewValue

   m_VklVReestr = NewValue
End If
End Property

'Включена в реестр для оплаты
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. VklVReestr
Public Property Get VklVReestr() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   VklVReestr = m_VklVReestr
End Property
' let
'Отказ

'Отказ
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Otkaz(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Otkaz", Otkaz, NewValue

   m_Otkaz = NewValue
End If
End Property

'Отказ
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. Otkaz
Public Property Get Otkaz() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   Otkaz = m_Otkaz
End Property
' let
'Описание проблемы

'Описание проблемы
'Parameters:
'[IN]   newValue , тип параметра: STRING  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let OpisProblem(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "OpisProblem", OpisProblem, NewValue

   m_OpisProblem = NewValue
End If
End Property

'Описание проблемы
'Parameters:
' параметров нет
'Returns:
'  значение типа STRING
'See Also:
'Example:
' dim variable as STRING
' variable = me. OpisProblem
Public Property Get OpisProblem() As String
 LoadFromDatabase
 AccessTime = Now

   OpisProblem = m_OpisProblem
End Property
' let
'Отправлено в КЭУ

'Отправлено в КЭУ
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let OtprVKEY(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "OtprVKEY", OtprVKEY, NewValue

   m_OtprVKEY = NewValue
End If
End Property

'Отправлено в КЭУ
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. OtprVKEY
Public Property Get OtprVKEY() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   OtprVKEY = m_OtprVKEY
End Property
' let
'Дата отправки в КЭУ

'Дата отправки в КЭУ
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DataOtpravVKEY(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DataOtpravVKEY", DataOtpravVKEY, NewValue

   m_DataOtpravVKEY = NewValue
End If
End Property

'Дата отправки в КЭУ
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. DataOtpravVKEY
Public Property Get DataOtpravVKEY() As Date
 LoadFromDatabase
 AccessTime = Now

   DataOtpravVKEY = m_DataOtpravVKEY
End Property
' let
'Дополнительное соглашение

'Дополнительное соглашение
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DopSogl(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DopSogl", DopSogl, NewValue

   m_DopSogl = NewValue
End If
End Property

'Дополнительное соглашение
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. DopSogl
Public Property Get DopSogl() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   DopSogl = m_DopSogl
End Property
' let
'Номер договора

'Номер договора
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let NumDogovor(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "NumDogovor", NumDogovor, NewValue

   m_NumDogovor = NewValue
End If
End Property

'Номер договора
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. NumDogovor
Public Property Get NumDogovor() As String
 LoadFromDatabase
 AccessTime = Now

   NumDogovor = m_NumDogovor
End Property
' let
'Комментарий

'Комментарий
'Parameters:
'[IN]   newValue , тип параметра: STRING  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Komment(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Komment", Komment, NewValue

   m_Komment = NewValue
End If
End Property

'Комментарий
'Parameters:
' параметров нет
'Returns:
'  значение типа STRING
'See Also:
'Example:
' dim variable as STRING
' variable = me. Komment
Public Property Get Komment() As String
 LoadFromDatabase
 AccessTime = Now

   Komment = m_Komment
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

  Set nvi = nv.Add("Num", m_Num)
nvi.ValueType = adInteger
  Set nvi = nv.Add("DataPriem", m_DataPriem)
nvi.ValueType = adDate
 ' Reference to TP_SPR_ZTYPE
    If m_ZType_ID = "" Then
       Set nvi = nv.Add("ZType", "")
    Else
       Set nvi = nv.Add("ZType", m_ZType_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("FIO", m_FIO)
nvi.ValueSize = 255
 ' Reference to TP_Spr_Oper
    If m_TheOperator_ID = "" Then
       Set nvi = nv.Add("TheOperator", "")
    Else
       Set nvi = nv.Add("TheOperator", m_TheOperator_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("Adres", m_Adres)
nvi.ValueSize = 255
 ' Reference to Rayon
    If m_Rayon_ID = "" Then
       Set nvi = nv.Add("Rayon", "")
    Else
       Set nvi = nv.Add("Rayon", m_Rayon_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to TP_Spr_Metro
    If m_Metro_ID = "" Then
       Set nvi = nv.Add("Metro", "")
    Else
       Set nvi = nv.Add("Metro", m_Metro_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("KonrLizo", m_KonrLizo)
nvi.ValueSize = 255
  Set nvi = nv.Add("KontTelefon", m_KontTelefon)
nvi.ValueSize = 100
  Set nvi = nv.Add("KontEMAIL", m_KontEMAIL)
nvi.ValueSize = 100
  Set nvi = nv.Add("VremjaDljaSvjazi", m_VremjaDljaSvjazi)
nvi.ValueSize = 255
  Set nvi = nv.Add("GelData", m_GelData)
nvi.ValueType = adDate
 ' Reference to TP_Spr_VrVisInst
    If m_GelVremja_ID = "" Then
       Set nvi = nv.Add("GelVremja", "")
    Else
       Set nvi = nv.Add("GelVremja", m_GelVremja_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to TP_SPR_Port
    If m_Portref_ID = "" Then
       Set nvi = nv.Add("Portref", "")
    Else
       Set nvi = nv.Add("Portref", m_Portref_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("ABNumber", m_ABNumber)
nvi.ValueSize = 30
  Set nvi = nv.Add("SN_STB", m_SN_STB)
nvi.ValueSize = 20
  Set nvi = nv.Add("MAC_STB", m_MAC_STB)
nvi.ValueSize = 30
  Set nvi = nv.Add("DopInfo", m_DopInfo)
 ' Reference to TP_Spr_Koor
    If m_Koordin_ID = "" Then
       Set nvi = nv.Add("Koordin", "")
    Else
       Set nvi = nv.Add("Koordin", m_Koordin_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to TP_Spr_Ing
    If m_Ingener_ID = "" Then
       Set nvi = nv.Add("Ingener", "")
    Else
       Set nvi = nv.Add("Ingener", m_Ingener_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to TP_SPR_MT
    If m_DeviceType_ID = "" Then
       Set nvi = nv.Add("DeviceType", "")
    Else
       Set nvi = nv.Add("DeviceType", m_DeviceType_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("VidanModemSer", m_VidanModemSer)
nvi.ValueSize = 255
 ' Reference to TP_Spr_Tar
    If m_Tarif_ID = "" Then
       Set nvi = nv.Add("Tarif", "")
    Else
       Set nvi = nv.Add("Tarif", m_Tarif_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("FIOdogovor", m_FIOdogovor)
nvi.ValueSize = 255
  Set nvi = nv.Add("DataInstall", m_DataInstall)
nvi.ValueType = adDate
 ' Reference to TP_Spr_SrochDog
    If m_SrochDogovor_ID = "" Then
       Set nvi = nv.Add("SrochDogovor", "")
    Else
       Set nvi = nv.Add("SrochDogovor", m_SrochDogovor_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("DocPolych", m_DocPolych)
nvi.ValueType = adInteger
  Set nvi = nv.Add("DataSZT", m_DataSZT)
nvi.ValueType = adDate
  Set nvi = nv.Add("VklVReestr", m_VklVReestr)
nvi.ValueType = adInteger
  Set nvi = nv.Add("Otkaz", m_Otkaz)
nvi.ValueType = adInteger
  Set nvi = nv.Add("OpisProblem", m_OpisProblem)
  Set nvi = nv.Add("OtprVKEY", m_OtprVKEY)
nvi.ValueType = adInteger
  Set nvi = nv.Add("DataOtpravVKEY", m_DataOtpravVKEY)
nvi.ValueType = adDate
  Set nvi = nv.Add("DopSogl", m_DopSogl)
nvi.ValueType = adInteger
  Set nvi = nv.Add("NumDogovor", m_NumDogovor)
nvi.ValueSize = 255
  Set nvi = nv.Add("Komment", m_Komment)
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
 m_Brief = m_Brief & Num & "; "
 m_Brief = m_Brief & DataPriem & "; "
 m_Brief = m_Brief & FIO & "; "
 m_Brief = m_Brief & NumDogovor & "; "
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

m_Num = nv.item("Num").Value
m_DataPriem = nv.item("DataPriem").Value
  m_ZType_ID = nv.item("ZType").Value
m_FIO = nv.item("FIO").Value
  m_TheOperator_ID = nv.item("TheOperator").Value
m_Adres = nv.item("Adres").Value
  m_Rayon_ID = nv.item("Rayon").Value
  m_Metro_ID = nv.item("Metro").Value
m_KonrLizo = nv.item("KonrLizo").Value
m_KontTelefon = nv.item("KontTelefon").Value
m_KontEMAIL = nv.item("KontEMAIL").Value
m_VremjaDljaSvjazi = nv.item("VremjaDljaSvjazi").Value
m_GelData = nv.item("GelData").Value
  m_GelVremja_ID = nv.item("GelVremja").Value
  m_Portref_ID = nv.item("Portref").Value
m_ABNumber = nv.item("ABNumber").Value
m_SN_STB = nv.item("SN_STB").Value
m_MAC_STB = nv.item("MAC_STB").Value
m_DopInfo = nv.item("DopInfo").Value
  m_Koordin_ID = nv.item("Koordin").Value
  m_Ingener_ID = nv.item("Ingener").Value
  m_DeviceType_ID = nv.item("DeviceType").Value
m_VidanModemSer = nv.item("VidanModemSer").Value
  m_Tarif_ID = nv.item("Tarif").Value
m_FIOdogovor = nv.item("FIOdogovor").Value
m_DataInstall = nv.item("DataInstall").Value
  m_SrochDogovor_ID = nv.item("SrochDogovor").Value
m_DocPolych = nv.item("DocPolych").Value
m_DataSZT = nv.item("DataSZT").Value
m_VklVReestr = nv.item("VklVReestr").Value
m_Otkaz = nv.item("Otkaz").Value
m_OpisProblem = nv.item("OpisProblem").Value
m_OtprVKEY = nv.item("OtprVKEY").Value
m_DataOtpravVKEY = nv.item("DataOtpravVKEY").Value
m_DopSogl = nv.item("DopSogl").Value
m_NumDogovor = nv.item("NumDogovor").Value
m_Komment = nv.item("Komment").Value
Else

m_Num = nv.Fields("Num").Value
m_DataPriem = nv.Fields("DataPriem").Value
  m_ZType_ID = nv.Fields("ZType").Value
m_FIO = nv.Fields("FIO").Value
  m_TheOperator_ID = nv.Fields("TheOperator").Value
m_Adres = nv.Fields("Adres").Value
  m_Rayon_ID = nv.Fields("Rayon").Value
  m_Metro_ID = nv.Fields("Metro").Value
m_KonrLizo = nv.Fields("KonrLizo").Value
m_KontTelefon = nv.Fields("KontTelefon").Value
m_KontEMAIL = nv.Fields("KontEMAIL").Value
m_VremjaDljaSvjazi = nv.Fields("VremjaDljaSvjazi").Value
m_GelData = nv.Fields("GelData").Value
  m_GelVremja_ID = nv.Fields("GelVremja").Value
  m_Portref_ID = nv.Fields("Portref").Value
m_ABNumber = nv.Fields("ABNumber").Value
m_SN_STB = nv.Fields("SN_STB").Value
m_MAC_STB = nv.Fields("MAC_STB").Value
m_DopInfo = nv.Fields("DopInfo").Value
  m_Koordin_ID = nv.Fields("Koordin").Value
  m_Ingener_ID = nv.Fields("Ingener").Value
  m_DeviceType_ID = nv.Fields("DeviceType").Value
m_VidanModemSer = nv.Fields("VidanModemSer").Value
  m_Tarif_ID = nv.Fields("Tarif").Value
m_FIOdogovor = nv.Fields("FIOdogovor").Value
m_DataInstall = nv.Fields("DataInstall").Value
  m_SrochDogovor_ID = nv.Fields("SrochDogovor").Value
m_DocPolych = nv.Fields("DocPolych").Value
m_DataSZT = nv.Fields("DataSZT").Value
m_VklVReestr = nv.Fields("VklVReestr").Value
m_Otkaz = nv.Fields("Otkaz").Value
m_OpisProblem = nv.Fields("OpisProblem").Value
m_OtprVKEY = nv.Fields("OtprVKEY").Value
m_DataOtpravVKEY = nv.Fields("DataOtpravVKEY").Value
m_DopSogl = nv.Fields("DopSogl").Value
m_NumDogovor = nv.Fields("NumDogovor").Value
m_Komment = nv.Fields("Komment").Value
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
   Dim o As TP_Zay_Zay
   Set o = New TP_Zay_Zay
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
  err.Raise err.Number, "TP_Zay_Zay.Save", err.Description
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
  err.Raise err.Number, "TP_Zay_Zay.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("TP_Zay_Zay", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "TP_Zay_Zay.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "TP_Zay_Zay", id
Exit Sub
bye:
  err.Raise err.Number, "TP_Zay_Zay.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 m_ZType_ID = ""
 Set m_ZType = Nothing
 m_TheOperator_ID = ""
 Set m_TheOperator = Nothing
 m_Rayon_ID = ""
 Set m_Rayon = Nothing
 m_Metro_ID = ""
 Set m_Metro = Nothing
 m_GelVremja_ID = ""
 Set m_GelVremja = Nothing
 m_Portref_ID = ""
 Set m_Portref = Nothing
 m_Koordin_ID = ""
 Set m_Koordin = Nothing
 m_Ingener_ID = ""
 Set m_Ingener = Nothing
 m_DeviceType_ID = ""
 Set m_DeviceType = Nothing
 m_Tarif_ID = ""
 Set m_Tarif = Nothing
 m_SrochDogovor_ID = ""
 Set m_SrochDogovor = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "TP_Zay_Zay.CloseClass"
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
  Num = node.Attributes.getNamedItem("NUM").nodeValue
  DataPriem = node.Attributes.getNamedItem("DATAPRIEM").nodeValue
  Set ZType = Nothing
  m_ZType_ID = node.Attributes.getNamedItem("ZTYPE").nodeValue
  m_ZType_ID_BRIEF = node.Attributes.getNamedItem("ZTYPE_BRIEF").nodeValue
  FIO = Replace(node.Attributes.getNamedItem("FIO").nodeValue, vbLf, vbCrLf)
  Set TheOperator = Nothing
  m_TheOperator_ID = node.Attributes.getNamedItem("THEOPERATOR").nodeValue
  m_TheOperator_ID_BRIEF = node.Attributes.getNamedItem("THEOPERATOR_BRIEF").nodeValue
  Adres = Replace(node.Attributes.getNamedItem("ADRES").nodeValue, vbLf, vbCrLf)
  Set Rayon = Nothing
  m_Rayon_ID = node.Attributes.getNamedItem("RAYON").nodeValue
  m_Rayon_ID_BRIEF = node.Attributes.getNamedItem("RAYON_BRIEF").nodeValue
  Set Metro = Nothing
  m_Metro_ID = node.Attributes.getNamedItem("METRO").nodeValue
  m_Metro_ID_BRIEF = node.Attributes.getNamedItem("METRO_BRIEF").nodeValue
  KonrLizo = Replace(node.Attributes.getNamedItem("KONRLIZO").nodeValue, vbLf, vbCrLf)
  KontTelefon = Replace(node.Attributes.getNamedItem("KONTTELEFON").nodeValue, vbLf, vbCrLf)
  KontEMAIL = Replace(node.Attributes.getNamedItem("KONTEMAIL").nodeValue, vbLf, vbCrLf)
  VremjaDljaSvjazi = Replace(node.Attributes.getNamedItem("VREMJADLJASVJAZI").nodeValue, vbLf, vbCrLf)
  GelData = node.Attributes.getNamedItem("GELDATA").nodeValue
  Set GelVremja = Nothing
  m_GelVremja_ID = node.Attributes.getNamedItem("GELVREMJA").nodeValue
  m_GelVremja_ID_BRIEF = node.Attributes.getNamedItem("GELVREMJA_BRIEF").nodeValue
  Set Portref = Nothing
  m_Portref_ID = node.Attributes.getNamedItem("PORTREF").nodeValue
  m_Portref_ID_BRIEF = node.Attributes.getNamedItem("PORTREF_BRIEF").nodeValue
  ABNumber = Replace(node.Attributes.getNamedItem("ABNUMBER").nodeValue, vbLf, vbCrLf)
  SN_STB = Replace(node.Attributes.getNamedItem("SN_STB").nodeValue, vbLf, vbCrLf)
  MAC_STB = Replace(node.Attributes.getNamedItem("MAC_STB").nodeValue, vbLf, vbCrLf)
  DopInfo = Replace(node.Attributes.getNamedItem("DOPINFO").nodeValue, vbLf, vbCrLf)
  Set Koordin = Nothing
  m_Koordin_ID = node.Attributes.getNamedItem("KOORDIN").nodeValue
  m_Koordin_ID_BRIEF = node.Attributes.getNamedItem("KOORDIN_BRIEF").nodeValue
  Set Ingener = Nothing
  m_Ingener_ID = node.Attributes.getNamedItem("INGENER").nodeValue
  m_Ingener_ID_BRIEF = node.Attributes.getNamedItem("INGENER_BRIEF").nodeValue
  Set DeviceType = Nothing
  m_DeviceType_ID = node.Attributes.getNamedItem("DEVICETYPE").nodeValue
  m_DeviceType_ID_BRIEF = node.Attributes.getNamedItem("DEVICETYPE_BRIEF").nodeValue
  VidanModemSer = Replace(node.Attributes.getNamedItem("VIDANMODEMSER").nodeValue, vbLf, vbCrLf)
  Set Tarif = Nothing
  m_Tarif_ID = node.Attributes.getNamedItem("TARIF").nodeValue
  m_Tarif_ID_BRIEF = node.Attributes.getNamedItem("TARIF_BRIEF").nodeValue
  FIOdogovor = Replace(node.Attributes.getNamedItem("FIODOGOVOR").nodeValue, vbLf, vbCrLf)
  DataInstall = node.Attributes.getNamedItem("DATAINSTALL").nodeValue
  Set SrochDogovor = Nothing
  m_SrochDogovor_ID = node.Attributes.getNamedItem("SROCHDOGOVOR").nodeValue
  m_SrochDogovor_ID_BRIEF = node.Attributes.getNamedItem("SROCHDOGOVOR_BRIEF").nodeValue
  DocPolych = node.Attributes.getNamedItem("DOCPOLYCH").nodeValue
  DataSZT = node.Attributes.getNamedItem("DATASZT").nodeValue
  VklVReestr = node.Attributes.getNamedItem("VKLVREESTR").nodeValue
  Otkaz = node.Attributes.getNamedItem("OTKAZ").nodeValue
  OpisProblem = Replace(node.Attributes.getNamedItem("OPISPROBLEM").nodeValue, vbLf, vbCrLf)
  OtprVKEY = node.Attributes.getNamedItem("OTPRVKEY").nodeValue
  DataOtpravVKEY = node.Attributes.getNamedItem("DATAOTPRAVVKEY").nodeValue
  DopSogl = node.Attributes.getNamedItem("DOPSOGL").nodeValue
  NumDogovor = Replace(node.Attributes.getNamedItem("NUMDOGOVOR").nodeValue, vbLf, vbCrLf)
  Komment = Replace(node.Attributes.getNamedItem("KOMMENT").nodeValue, vbLf, vbCrLf)
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
  node.setAttribute "NUM", Num
  node.setAttribute "DATAPRIEM", CDbl(DataPriem)
  node.setAttribute "ZTYPE", m_ZType_ID
  If Not (ZType Is Nothing) Then
    node.setAttribute "ZTYPE_BRIEF", ZType.Brief
  Else
    node.setAttribute "ZTYPE_BRIEF", m_ZType_ID_BRIEF
  End If
  node.setAttribute "FIO", FIO
  node.setAttribute "THEOPERATOR", m_TheOperator_ID
  If Not (TheOperator Is Nothing) Then
    node.setAttribute "THEOPERATOR_BRIEF", TheOperator.Brief
  Else
    node.setAttribute "THEOPERATOR_BRIEF", m_TheOperator_ID_BRIEF
  End If
  node.setAttribute "ADRES", Adres
  node.setAttribute "RAYON", m_Rayon_ID
  If Not (Rayon Is Nothing) Then
    node.setAttribute "RAYON_BRIEF", Rayon.Brief
  Else
    node.setAttribute "RAYON_BRIEF", m_Rayon_ID_BRIEF
  End If
  node.setAttribute "METRO", m_Metro_ID
  If Not (Metro Is Nothing) Then
    node.setAttribute "METRO_BRIEF", Metro.Brief
  Else
    node.setAttribute "METRO_BRIEF", m_Metro_ID_BRIEF
  End If
  node.setAttribute "KONRLIZO", KonrLizo
  node.setAttribute "KONTTELEFON", KontTelefon
  node.setAttribute "KONTEMAIL", KontEMAIL
  node.setAttribute "VREMJADLJASVJAZI", VremjaDljaSvjazi
  node.setAttribute "GELDATA", CDbl(GelData)
  node.setAttribute "GELVREMJA", m_GelVremja_ID
  If Not (GelVremja Is Nothing) Then
    node.setAttribute "GELVREMJA_BRIEF", GelVremja.Brief
  Else
    node.setAttribute "GELVREMJA_BRIEF", m_GelVremja_ID_BRIEF
  End If
  node.setAttribute "PORTREF", m_Portref_ID
  If Not (Portref Is Nothing) Then
    node.setAttribute "PORTREF_BRIEF", Portref.Brief
  Else
    node.setAttribute "PORTREF_BRIEF", m_Portref_ID_BRIEF
  End If
  node.setAttribute "ABNUMBER", ABNumber
  node.setAttribute "SN_STB", SN_STB
  node.setAttribute "MAC_STB", MAC_STB
  node.setAttribute "DOPINFO", DopInfo
  node.setAttribute "KOORDIN", m_Koordin_ID
  If Not (Koordin Is Nothing) Then
    node.setAttribute "KOORDIN_BRIEF", Koordin.Brief
  Else
    node.setAttribute "KOORDIN_BRIEF", m_Koordin_ID_BRIEF
  End If
  node.setAttribute "INGENER", m_Ingener_ID
  If Not (Ingener Is Nothing) Then
    node.setAttribute "INGENER_BRIEF", Ingener.Brief
  Else
    node.setAttribute "INGENER_BRIEF", m_Ingener_ID_BRIEF
  End If
  node.setAttribute "DEVICETYPE", m_DeviceType_ID
  If Not (DeviceType Is Nothing) Then
    node.setAttribute "DEVICETYPE_BRIEF", DeviceType.Brief
  Else
    node.setAttribute "DEVICETYPE_BRIEF", m_DeviceType_ID_BRIEF
  End If
  node.setAttribute "VIDANMODEMSER", VidanModemSer
  node.setAttribute "TARIF", m_Tarif_ID
  If Not (Tarif Is Nothing) Then
    node.setAttribute "TARIF_BRIEF", Tarif.Brief
  Else
    node.setAttribute "TARIF_BRIEF", m_Tarif_ID_BRIEF
  End If
  node.setAttribute "FIODOGOVOR", FIOdogovor
  node.setAttribute "DATAINSTALL", CDbl(DataInstall)
  node.setAttribute "SROCHDOGOVOR", m_SrochDogovor_ID
  If Not (SrochDogovor Is Nothing) Then
    node.setAttribute "SROCHDOGOVOR_BRIEF", SrochDogovor.Brief
  Else
    node.setAttribute "SROCHDOGOVOR_BRIEF", m_SrochDogovor_ID_BRIEF
  End If
  node.setAttribute "DOCPOLYCH", DocPolych
  node.setAttribute "DATASZT", CDbl(DataSZT)
  node.setAttribute "VKLVREESTR", VklVReestr
  node.setAttribute "OTKAZ", Otkaz
  node.setAttribute "OPISPROBLEM", OpisProblem
  node.setAttribute "OTPRVKEY", OtprVKEY
  node.setAttribute "DATAOTPRAVVKEY", CDbl(DataOtpravVKEY)
  node.setAttribute "DOPSOGL", DopSogl
  node.setAttribute "NUMDOGOVOR", NumDogovor
  node.setAttribute "KOMMENT", Komment
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
m_IsLocked = Application.MTZSession.IsLocked("TP_Zay_Zay", id)
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
OK = Application.MTZSession.LockResource("TP_Zay_Zay", id, Permanent)
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
Application.MTZSession.UnLockResource "TP_Zay_Zay", id
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
CanLock = Application.MTZSession.CanLock("TP_Zay_Zay", id)
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
If mode = "NO" Then
 Select Case child
End Select
End If ' mode="NO"
If mode = "READ" Then
 Select Case child
End Select
End If ' mode="READ"
If mode = "VIP" Then
 Select Case child
End Select
End If ' mode="VIP"
If mode = "POL" Then
 Select Case child
End Select
End If ' mode="POL"
If mode = "YING" Then
 Select Case child
End Select
End If ' mode="YING"
If mode = "NISP" Then
 Select Case child
End Select
End If ' mode="NISP"
If mode = "ALL" Then
 Select Case child
End Select
End If ' mode="ALL"
If mode = "VSZT" Then
 Select Case child
End Select
End If ' mode="VSZT"
If mode = "PROB" Then
 Select Case child
End Select
End If ' mode="PROB"
If mode = "" Then
 Select Case child
 End Select
End If ' mode="" (Default)
End Sub



