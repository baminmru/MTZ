VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "BaseSetting"
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
Private m_USEVOL As enumBoolean
Private m_FIL As Object
Dim m_FIL_ID As String
Dim m_FIL_ID_BRIEF As String
Private m_NDS As String
Private m_NewClientTRF As Object
Dim m_NewClientTRF_ID As String
Dim m_NewClientTRF_ID_BRIEF As String
Private m_SingleSendTRF As Object
Dim m_SingleSendTRF_ID As String
Dim m_SingleSendTRF_ID_BRIEF As String
Private m_SingleSendCli As Object
Dim m_SingleSendCli_ID As String
Dim m_SingleSendCli_ID_BRIEF As String
Private m_Passport As String
Private m_NDS103 As enumBoolean
Private m_Count103 As String
Private m_TrTypeDef As Object
Dim m_TrTypeDef_ID As String
Dim m_TrTypeDef_ID_BRIEF As String
Private m_Direction As Object
Dim m_Direction_ID As String
Dim m_Direction_ID_BRIEF As String
Private m_WED As Object
Dim m_WED_ID As String
Dim m_WED_ID_BRIEF As String
Private m_VED As Object
Dim m_VED_ID As String
Dim m_VED_ID_BRIEF As String
Private m_Code As enumBoolean
Private m_IDX As String
Private m_DateSHCode As String
Private m_Round500 As enumBoolean
Private m_AccountGeneral As String
Private m_CashMan As String
Private m_addInvoiceInfo As String
Private m_genDirector As String
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
  PartName = "BaseSetting"
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
  m_Application.Logger.Message "BaseSetting.Init"
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
'Исполльзовать объемные тарифы

'Исполльзовать объемные тарифы
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let USEVOL(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "USEVOL", USEVOL, NewValue

   m_USEVOL = NewValue
End If
End Property

'Исполльзовать объемные тарифы
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. USEVOL
Public Property Get USEVOL() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   USEVOL = m_USEVOL
End Property
' let
'Филиал

'Филиал
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set FIL(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FIL", FIL, NewValue
On Error Resume Next
m_FIL_ID = ""
m_FIL_ID = NewValue.id
'  set   m_FIL= newValue
End If
End Property

'Филиал
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. FIL
Public Property Get FIL() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_FIL As Object
If m_FIL_ID <> "" Then
  Set tmp_FIL = Application.FindRowObject("PEKD_DEPT", m_FIL_ID)
  If tmp_FIL Is Nothing Then
    m_FIL_ID_BRIEF = ""
  Else
    m_FIL_ID_BRIEF = tmp_FIL.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PEKD_DEPT" & m_FIL_ID, tmp_FIL
  Set FIL = tmp_FIL
  Exit Property
End If
  '  set FIL = m_FIL
End Property
' let
'Ставка НДС

'Ставка НДС
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let NDS(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "NDS", NDS, NewValue

   m_NDS = NewValue
End If
End Property

'Ставка НДС
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. NDS
Public Property Get NDS() As String
 LoadFromDatabase
 AccessTime = Now

   NDS = m_NDS
End Property
' let
'Тариф для нового клиента

'Тариф для нового клиента
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set NewClientTRF(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "NewClientTRF", NewClientTRF, NewValue
On Error Resume Next
m_NewClientTRF_ID = ""
m_NewClientTRF_ID = NewValue.id
'  set   m_NewClientTRF= newValue
End If
End Property

'Тариф для нового клиента
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. NewClientTRF
Public Property Get NewClientTRF() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_NewClientTRF As Object
If m_NewClientTRF_ID <> "" Then
  Set tmp_NewClientTRF = Application.FindRowObject("PEKD_TRFTYPE", m_NewClientTRF_ID)
  If tmp_NewClientTRF Is Nothing Then
    m_NewClientTRF_ID_BRIEF = ""
  Else
    m_NewClientTRF_ID_BRIEF = tmp_NewClientTRF.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PEKD_TRFTYPE" & m_NewClientTRF_ID, tmp_NewClientTRF
  Set NewClientTRF = tmp_NewClientTRF
  Exit Property
End If
  '  set NewClientTRF = m_NewClientTRF
End Property
' let
'Тариф для разовой отправки

'Тариф для разовой отправки
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set SingleSendTRF(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SingleSendTRF", SingleSendTRF, NewValue
On Error Resume Next
m_SingleSendTRF_ID = ""
m_SingleSendTRF_ID = NewValue.id
'  set   m_SingleSendTRF= newValue
End If
End Property

'Тариф для разовой отправки
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. SingleSendTRF
Public Property Get SingleSendTRF() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_SingleSendTRF As Object
If m_SingleSendTRF_ID <> "" Then
  Set tmp_SingleSendTRF = Application.FindRowObject("PEKD_TRFTYPE", m_SingleSendTRF_ID)
  If tmp_SingleSendTRF Is Nothing Then
    m_SingleSendTRF_ID_BRIEF = ""
  Else
    m_SingleSendTRF_ID_BRIEF = tmp_SingleSendTRF.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PEKD_TRFTYPE" & m_SingleSendTRF_ID, tmp_SingleSendTRF
  Set SingleSendTRF = tmp_SingleSendTRF
  Exit Property
End If
  '  set SingleSendTRF = m_SingleSendTRF
End Property
' let
'Клиент для всех разовых заявок

'Клиент для всех разовых заявок
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set SingleSendCli(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SingleSendCli", SingleSendCli, NewValue
On Error Resume Next
m_SingleSendCli_ID = ""
m_SingleSendCli_ID = NewValue.id
' set   m_SingleSendCli= newValue
End If
End Property

'Клиент для всех разовых заявок
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. SingleSendCli
Public Property Get SingleSendCli() As Object
 LoadFromDatabase
 AccessTime = Now
If m_SingleSendCli_ID <> "" Then
  Set SingleSendCli = Application.Manager.GetInstanceObject(Right(m_SingleSendCli_ID, 38))
 Exit Property
End If
  ' set SingleSendCli = m_SingleSendCli
End Property
' let
'Данные паспорта для Ф116

'Данные паспорта для Ф116
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Passport(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Passport", Passport, NewValue

   m_Passport = NewValue
End If
End Property

'Данные паспорта для Ф116
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. Passport
Public Property Get Passport() As String
 LoadFromDatabase
 AccessTime = Now

   Passport = m_Passport
End Property
' let
'Ф103 с НДС

'Ф103 с НДС
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let NDS103(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "NDS103", NDS103, NewValue

   m_NDS103 = NewValue
End If
End Property

'Ф103 с НДС
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. NDS103
Public Property Get NDS103() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   NDS103 = m_NDS103
End Property
' let
'Кол-во Ф103

'Кол-во Ф103
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Count103(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Count103", Count103, NewValue

   m_Count103 = NewValue
End If
End Property

'Кол-во Ф103
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. Count103
Public Property Get Count103() As String
 LoadFromDatabase
 AccessTime = Now

   Count103 = m_Count103
End Property
' let
'Тип доставки по умолчанию

'Тип доставки по умолчанию
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TrTypeDef(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TrTypeDef", TrTypeDef, NewValue
On Error Resume Next
m_TrTypeDef_ID = ""
m_TrTypeDef_ID = NewValue.id
'  set   m_TrTypeDef= newValue
End If
End Property

'Тип доставки по умолчанию
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TrTypeDef
Public Property Get TrTypeDef() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TrTypeDef As Object
If m_TrTypeDef_ID <> "" Then
  Set tmp_TrTypeDef = Application.FindRowObject("PEKD_TRTYPE", m_TrTypeDef_ID)
  If tmp_TrTypeDef Is Nothing Then
    m_TrTypeDef_ID_BRIEF = ""
  Else
    m_TrTypeDef_ID_BRIEF = tmp_TrTypeDef.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PEKD_TRTYPE" & m_TrTypeDef_ID, tmp_TrTypeDef
  Set TrTypeDef = tmp_TrTypeDef
  Exit Property
End If
  '  set TrTypeDef = m_TrTypeDef
End Property
' let
'Направление по умолчанию

'Направление по умолчанию
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set Direction(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Direction", Direction, NewValue
On Error Resume Next
m_Direction_ID = ""
m_Direction_ID = NewValue.id
'  set   m_Direction= newValue
End If
End Property

'Направление по умолчанию
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Direction
Public Property Get Direction() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_Direction As Object
If m_Direction_ID <> "" Then
  Set tmp_Direction = Application.FindRowObject("PEKD_DIRECTION", m_Direction_ID)
  If tmp_Direction Is Nothing Then
    m_Direction_ID_BRIEF = ""
  Else
    m_Direction_ID_BRIEF = tmp_Direction.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PEKD_DIRECTION" & m_Direction_ID, tmp_Direction
  Set Direction = tmp_Direction
  Exit Property
End If
  '  set Direction = m_Direction
End Property
' let
'Ед. изм. веса по умолчанию

'Ед. изм. веса по умолчанию
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set WED(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "WED", WED, NewValue
On Error Resume Next
m_WED_ID = ""
m_WED_ID = NewValue.id
'  set   m_WED= newValue
End If
End Property

'Ед. изм. веса по умолчанию
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. WED
Public Property Get WED() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_WED As Object
If m_WED_ID <> "" Then
  Set tmp_WED = Application.FindRowObject("ENTDIC_EDIZM", m_WED_ID)
  If tmp_WED Is Nothing Then
    m_WED_ID_BRIEF = ""
  Else
    m_WED_ID_BRIEF = tmp_WED.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "ENTDIC_EDIZM" & m_WED_ID, tmp_WED
  Set WED = tmp_WED
  Exit Property
End If
  '  set WED = m_WED
End Property
' let
'Ед. изм. объема по умолчанию

'Ед. изм. объема по умолчанию
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set VED(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "VED", VED, NewValue
On Error Resume Next
m_VED_ID = ""
m_VED_ID = NewValue.id
'  set   m_VED= newValue
End If
End Property

'Ед. изм. объема по умолчанию
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. VED
Public Property Get VED() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_VED As Object
If m_VED_ID <> "" Then
  Set tmp_VED = Application.FindRowObject("ENTDIC_EDIZM", m_VED_ID)
  If tmp_VED Is Nothing Then
    m_VED_ID_BRIEF = ""
  Else
    m_VED_ID_BRIEF = tmp_VED.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "ENTDIC_EDIZM" & m_VED_ID, tmp_VED
  Set VED = tmp_VED
  Exit Property
End If
  '  set VED = m_VED
End Property
' let
'Присваивать номер при взвешивании

'Присваивать номер при взвешивании
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Code(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Code", Code, NewValue

   m_Code = NewValue
End If
End Property

'Присваивать номер при взвешивании
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. Code
Public Property Get Code() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   Code = m_Code
End Property
' let
'Индекс почтового отделения

'Индекс почтового отделения
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IDX(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IDX", IDX, NewValue

   m_IDX = NewValue
End If
End Property

'Индекс почтового отделения
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. IDX
Public Property Get IDX() As String
 LoadFromDatabase
 AccessTime = Now

   IDX = m_IDX
End Property
' let
'Явный код месяца для штрих-кода

'Явный код месяца для штрих-кода
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DateSHCode(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DateSHCode", DateSHCode, NewValue

   m_DateSHCode = NewValue
End If
End Property

'Явный код месяца для штрих-кода
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. DateSHCode
Public Property Get DateSHCode() As String
 LoadFromDatabase
 AccessTime = Now

   DateSHCode = m_DateSHCode
End Property
' let
'Округление до 500 гр.

'Округление до 500 гр.
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Round500(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Round500", Round500, NewValue

   m_Round500 = NewValue
End If
End Property

'Округление до 500 гр.
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. Round500
Public Property Get Round500() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   Round500 = m_Round500
End Property
' let
'Главный бухгалтер

'Главный бухгалтер
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let AccountGeneral(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "AccountGeneral", AccountGeneral, NewValue

   m_AccountGeneral = NewValue
End If
End Property

'Главный бухгалтер
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. AccountGeneral
Public Property Get AccountGeneral() As String
 LoadFromDatabase
 AccessTime = Now

   AccountGeneral = m_AccountGeneral
End Property
' let
'Кассир

'Кассир
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let CashMan(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CashMan", CashMan, NewValue

   m_CashMan = NewValue
End If
End Property

'Кассир
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. CashMan
Public Property Get CashMan() As String
 LoadFromDatabase
 AccessTime = Now

   CashMan = m_CashMan
End Property
' let
'Доверенность (для счет-фактуры)

'Доверенность (для счет-фактуры)
'Parameters:
'[IN]   newValue , тип параметра: STRING  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let addInvoiceInfo(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "addInvoiceInfo", addInvoiceInfo, NewValue

   m_addInvoiceInfo = NewValue
End If
End Property

'Доверенность (для счет-фактуры)
'Parameters:
' параметров нет
'Returns:
'  значение типа STRING
'See Also:
'Example:
' dim variable as STRING
' variable = me. addInvoiceInfo
Public Property Get addInvoiceInfo() As String
 LoadFromDatabase
 AccessTime = Now

   addInvoiceInfo = m_addInvoiceInfo
End Property
' let
'Руководитель организации

'Руководитель организации
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let genDirector(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "genDirector", genDirector, NewValue

   m_genDirector = NewValue
End If
End Property

'Руководитель организации
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. genDirector
Public Property Get genDirector() As String
 LoadFromDatabase
 AccessTime = Now

   genDirector = m_genDirector
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

  Set nvi = nv.Add("USEVOL", m_USEVOL)
nvi.ValueType = adInteger
 ' Reference to PEKD_DEPT
    If m_FIL_ID = "" Then
       Set nvi = nv.Add("FIL", "")
    Else
       Set nvi = nv.Add("FIL", m_FIL_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("NDS", m_NDS)
nvi.ValueSize = 10
 ' Reference to PEKD_TRFTYPE
    If m_NewClientTRF_ID = "" Then
       Set nvi = nv.Add("NewClientTRF", "")
    Else
       Set nvi = nv.Add("NewClientTRF", m_NewClientTRF_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to PEKD_TRFTYPE
    If m_SingleSendTRF_ID = "" Then
       Set nvi = nv.Add("SingleSendTRF", "")
    Else
       Set nvi = nv.Add("SingleSendTRF", m_SingleSendTRF_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to object
    If m_SingleSendCli_ID = "" Then
       Set nvi = nv.Add("SingleSendCli", "")
    Else
       Set nvi = nv.Add("SingleSendCli", m_SingleSendCli_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("Passport", m_Passport)
nvi.ValueSize = 200
  Set nvi = nv.Add("NDS103", m_NDS103)
nvi.ValueType = adInteger
  Set nvi = nv.Add("Count103", m_Count103)
nvi.ValueSize = 5
 ' Reference to PEKD_TRTYPE
    If m_TrTypeDef_ID = "" Then
       Set nvi = nv.Add("TrTypeDef", "")
    Else
       Set nvi = nv.Add("TrTypeDef", m_TrTypeDef_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to PEKD_DIRECTION
    If m_Direction_ID = "" Then
       Set nvi = nv.Add("Direction", "")
    Else
       Set nvi = nv.Add("Direction", m_Direction_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to ENTDIC_EDIZM
    If m_WED_ID = "" Then
       Set nvi = nv.Add("WED", "")
    Else
       Set nvi = nv.Add("WED", m_WED_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to ENTDIC_EDIZM
    If m_VED_ID = "" Then
       Set nvi = nv.Add("VED", "")
    Else
       Set nvi = nv.Add("VED", m_VED_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("Code", m_Code)
nvi.ValueType = adInteger
  Set nvi = nv.Add("IDX", m_IDX)
nvi.ValueSize = 10
  Set nvi = nv.Add("DateSHCode", m_DateSHCode)
nvi.ValueSize = 10
  Set nvi = nv.Add("Round500", m_Round500)
nvi.ValueType = adInteger
  Set nvi = nv.Add("AccountGeneral", m_AccountGeneral)
nvi.ValueSize = 100
  Set nvi = nv.Add("CashMan", m_CashMan)
nvi.ValueSize = 255
  Set nvi = nv.Add("addInvoiceInfo", m_addInvoiceInfo)
  Set nvi = nv.Add("genDirector", m_genDirector)
nvi.ValueSize = 255
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
   If FIL Is Nothing Then
     m_Brief = m_Brief & "{" & m_FIL_ID_BRIEF & "}; "
   Else
     m_Brief = m_Brief & "{" & FIL.Brief & "}; "
   End If
 m_Brief = m_Brief & NDS & "; "
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

m_USEVOL = nv.item("USEVOL").Value
  m_FIL_ID = nv.item("FIL").Value
m_NDS = nv.item("NDS").Value
  m_NewClientTRF_ID = nv.item("NewClientTRF").Value
  m_SingleSendTRF_ID = nv.item("SingleSendTRF").Value
  m_SingleSendCli_ID = nv.item("SingleSendCli").Value
m_Passport = nv.item("Passport").Value
m_NDS103 = nv.item("NDS103").Value
m_Count103 = nv.item("Count103").Value
  m_TrTypeDef_ID = nv.item("TrTypeDef").Value
  m_Direction_ID = nv.item("Direction").Value
  m_WED_ID = nv.item("WED").Value
  m_VED_ID = nv.item("VED").Value
m_Code = nv.item("Code").Value
m_IDX = nv.item("IDX").Value
m_DateSHCode = nv.item("DateSHCode").Value
m_Round500 = nv.item("Round500").Value
m_AccountGeneral = nv.item("AccountGeneral").Value
m_CashMan = nv.item("CashMan").Value
m_addInvoiceInfo = nv.item("addInvoiceInfo").Value
m_genDirector = nv.item("genDirector").Value
Else

m_USEVOL = nv.Fields("USEVOL").Value
  m_FIL_ID = nv.Fields("FIL").Value
m_NDS = nv.Fields("NDS").Value
  m_NewClientTRF_ID = nv.Fields("NewClientTRF").Value
  m_SingleSendTRF_ID = nv.Fields("SingleSendTRF").Value
  m_SingleSendCli_ID = nv.Fields("SingleSendCli").Value
m_Passport = nv.Fields("Passport").Value
m_NDS103 = nv.Fields("NDS103").Value
m_Count103 = nv.Fields("Count103").Value
  m_TrTypeDef_ID = nv.Fields("TrTypeDef").Value
  m_Direction_ID = nv.Fields("Direction").Value
  m_WED_ID = nv.Fields("WED").Value
  m_VED_ID = nv.Fields("VED").Value
m_Code = nv.Fields("Code").Value
m_IDX = nv.Fields("IDX").Value
m_DateSHCode = nv.Fields("DateSHCode").Value
m_Round500 = nv.Fields("Round500").Value
m_AccountGeneral = nv.Fields("AccountGeneral").Value
m_CashMan = nv.Fields("CashMan").Value
m_addInvoiceInfo = nv.Fields("addInvoiceInfo").Value
m_genDirector = nv.Fields("genDirector").Value
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
   Dim o As BaseSetting
   Set o = New BaseSetting
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
  err.Raise err.Number, "BaseSetting.Save", err.Description
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
  err.Raise err.Number, "BaseSetting.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("BaseSetting", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "BaseSetting.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "BaseSetting", id
Exit Sub
bye:
  err.Raise err.Number, "BaseSetting.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 m_FIL_ID = ""
 Set m_FIL = Nothing
 m_NewClientTRF_ID = ""
 Set m_NewClientTRF = Nothing
 m_SingleSendTRF_ID = ""
 Set m_SingleSendTRF = Nothing
 m_SingleSendCli_ID = ""
 Set m_SingleSendCli = Nothing
 m_TrTypeDef_ID = ""
 Set m_TrTypeDef = Nothing
 m_Direction_ID = ""
 Set m_Direction = Nothing
 m_WED_ID = ""
 Set m_WED = Nothing
 m_VED_ID = ""
 Set m_VED = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "BaseSetting.CloseClass"
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
  USEVOL = node.Attributes.getNamedItem("USEVOL").nodeValue
  Set FIL = Nothing
  m_FIL_ID = node.Attributes.getNamedItem("FIL").nodeValue
  m_FIL_ID_BRIEF = node.Attributes.getNamedItem("FIL_BRIEF").nodeValue
  NDS = Replace(node.Attributes.getNamedItem("NDS").nodeValue, vbLf, vbCrLf)
  Set NewClientTRF = Nothing
  m_NewClientTRF_ID = node.Attributes.getNamedItem("NEWCLIENTTRF").nodeValue
  m_NewClientTRF_ID_BRIEF = node.Attributes.getNamedItem("NEWCLIENTTRF_BRIEF").nodeValue
  Set SingleSendTRF = Nothing
  m_SingleSendTRF_ID = node.Attributes.getNamedItem("SINGLESENDTRF").nodeValue
  m_SingleSendTRF_ID_BRIEF = node.Attributes.getNamedItem("SINGLESENDTRF_BRIEF").nodeValue
  Set SingleSendCli = Nothing
  m_SingleSendCli_ID = node.Attributes.getNamedItem("SINGLESENDCLI").nodeValue
  m_SingleSendCli_ID_BRIEF = node.Attributes.getNamedItem("SINGLESENDCLI_BRIEF").nodeValue
  Passport = Replace(node.Attributes.getNamedItem("PASSPORT").nodeValue, vbLf, vbCrLf)
  NDS103 = node.Attributes.getNamedItem("NDS103").nodeValue
  Count103 = Replace(node.Attributes.getNamedItem("COUNT103").nodeValue, vbLf, vbCrLf)
  Set TrTypeDef = Nothing
  m_TrTypeDef_ID = node.Attributes.getNamedItem("TRTYPEDEF").nodeValue
  m_TrTypeDef_ID_BRIEF = node.Attributes.getNamedItem("TRTYPEDEF_BRIEF").nodeValue
  Set Direction = Nothing
  m_Direction_ID = node.Attributes.getNamedItem("DIRECTION").nodeValue
  m_Direction_ID_BRIEF = node.Attributes.getNamedItem("DIRECTION_BRIEF").nodeValue
  Set WED = Nothing
  m_WED_ID = node.Attributes.getNamedItem("WED").nodeValue
  m_WED_ID_BRIEF = node.Attributes.getNamedItem("WED_BRIEF").nodeValue
  Set VED = Nothing
  m_VED_ID = node.Attributes.getNamedItem("VED").nodeValue
  m_VED_ID_BRIEF = node.Attributes.getNamedItem("VED_BRIEF").nodeValue
  Code = node.Attributes.getNamedItem("CODE").nodeValue
  IDX = Replace(node.Attributes.getNamedItem("IDX").nodeValue, vbLf, vbCrLf)
  DateSHCode = Replace(node.Attributes.getNamedItem("DATESHCODE").nodeValue, vbLf, vbCrLf)
  Round500 = node.Attributes.getNamedItem("ROUND500").nodeValue
  AccountGeneral = Replace(node.Attributes.getNamedItem("ACCOUNTGENERAL").nodeValue, vbLf, vbCrLf)
  CashMan = Replace(node.Attributes.getNamedItem("CASHMAN").nodeValue, vbLf, vbCrLf)
  addInvoiceInfo = Replace(node.Attributes.getNamedItem("ADDINVOICEINFO").nodeValue, vbLf, vbCrLf)
  genDirector = Replace(node.Attributes.getNamedItem("GENDIRECTOR").nodeValue, vbLf, vbCrLf)
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
  node.setAttribute "USEVOL", USEVOL
  node.setAttribute "FIL", m_FIL_ID
  If Not (FIL Is Nothing) Then
    node.setAttribute "FIL_BRIEF", FIL.Brief
  Else
    node.setAttribute "FIL_BRIEF", m_FIL_ID_BRIEF
  End If
  node.setAttribute "NDS", NDS
  node.setAttribute "NEWCLIENTTRF", m_NewClientTRF_ID
  If Not (NewClientTRF Is Nothing) Then
    node.setAttribute "NEWCLIENTTRF_BRIEF", NewClientTRF.Brief
  Else
    node.setAttribute "NEWCLIENTTRF_BRIEF", m_NewClientTRF_ID_BRIEF
  End If
  node.setAttribute "SINGLESENDTRF", m_SingleSendTRF_ID
  If Not (SingleSendTRF Is Nothing) Then
    node.setAttribute "SINGLESENDTRF_BRIEF", SingleSendTRF.Brief
  Else
    node.setAttribute "SINGLESENDTRF_BRIEF", m_SingleSendTRF_ID_BRIEF
  End If
  node.setAttribute "SINGLESENDCLI", m_SingleSendCli_ID
  If Not (SingleSendCli Is Nothing) Then
    node.setAttribute "SINGLESENDCLI_BRIEF", SingleSendCli.Brief
  Else
    node.setAttribute "SINGLESENDCLI_BRIEF", m_SingleSendCli_ID_BRIEF
  End If
  node.setAttribute "PASSPORT", Passport
  node.setAttribute "NDS103", NDS103
  node.setAttribute "COUNT103", Count103
  node.setAttribute "TRTYPEDEF", m_TrTypeDef_ID
  If Not (TrTypeDef Is Nothing) Then
    node.setAttribute "TRTYPEDEF_BRIEF", TrTypeDef.Brief
  Else
    node.setAttribute "TRTYPEDEF_BRIEF", m_TrTypeDef_ID_BRIEF
  End If
  node.setAttribute "DIRECTION", m_Direction_ID
  If Not (Direction Is Nothing) Then
    node.setAttribute "DIRECTION_BRIEF", Direction.Brief
  Else
    node.setAttribute "DIRECTION_BRIEF", m_Direction_ID_BRIEF
  End If
  node.setAttribute "WED", m_WED_ID
  If Not (WED Is Nothing) Then
    node.setAttribute "WED_BRIEF", WED.Brief
  Else
    node.setAttribute "WED_BRIEF", m_WED_ID_BRIEF
  End If
  node.setAttribute "VED", m_VED_ID
  If Not (VED Is Nothing) Then
    node.setAttribute "VED_BRIEF", VED.Brief
  Else
    node.setAttribute "VED_BRIEF", m_VED_ID_BRIEF
  End If
  node.setAttribute "CODE", Code
  node.setAttribute "IDX", IDX
  node.setAttribute "DATESHCODE", DateSHCode
  node.setAttribute "ROUND500", Round500
  node.setAttribute "ACCOUNTGENERAL", AccountGeneral
  node.setAttribute "CASHMAN", CashMan
  node.setAttribute "ADDINVOICEINFO", addInvoiceInfo
  node.setAttribute "GENDIRECTOR", genDirector
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
m_IsLocked = Application.MTZSession.IsLocked("BaseSetting", id)
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
OK = Application.MTZSession.LockResource("BaseSetting", id, Permanent)
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
Application.MTZSession.UnLockResource "BaseSetting", id
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
CanLock = Application.MTZSession.CanLock("BaseSetting", id)
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
If mode = "main" Then
 Select Case child
End Select
End If ' mode="main"
If mode = "" Then
 Select Case child
 End Select
End If ' mode="" (Default)
End Sub



