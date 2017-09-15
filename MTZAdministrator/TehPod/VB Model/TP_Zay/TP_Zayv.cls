VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TP_Zayv"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True

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
Private m_NomerZayav As Long
Private m_TipZayav As Object
Dim m_TipZayav_ID As String
Dim m_TipZayav_ID_BRIEF As String
Private m_Data As Date
Private m_TipKlient As Object
Dim m_TipKlient_ID As String
Dim m_TipKlient_ID_BRIEF As String
Private m_FIO As String
Private m_Adres As String
Private m_KodPorta As String
Private m_KontLIZO As String
Private m_KontEMAIL As String
Private m_KontTELEFON As String
Private m_VremjaDljaSvjazi As String
Private m_GelDATA As Date
Private m_GelVREMJA As Object
Dim m_GelVREMJA_ID As String
Dim m_GelVREMJA_ID_BRIEF As String
Private m_Metro As Object
Dim m_Metro_ID As String
Dim m_Metro_ID_BRIEF As String
Private m_TipModemaADSL As Object
Dim m_TipModemaADSL_ID As String
Dim m_TipModemaADSL_ID_BRIEF As String
Private m_TarifPlan As Object
Dim m_TarifPlan_ID As String
Dim m_TarifPlan_ID_BRIEF As String
Private m_FiksirIP As enumBoolean
Private m_FiksIPZnach As String
Private m_TarifPlanZFTV As Object
Dim m_TarifPlanZFTV_ID As String
Dim m_TarifPlanZFTV_ID_BRIEF As String
Private m_PaketVzroslieIstorii As enumBoolean
Private m_PaketFootball As enumBoolean
Private m_NomerZayavSYZIZ As String
Private m_TarifPlanTLF As Object
Dim m_TarifPlanTLF_ID As String
Dim m_TarifPlanTLF_ID_BRIEF As String
Private m_PodborNomerTLF As String
Private m_VnytriZonovajaTLF As enumBoolean
Private m_MGMNTelSviaz As enumBoolean
Private m_ViborOperat As Object
Dim m_ViborOperat_ID As String
Dim m_ViborOperat_ID_BRIEF As String
Private m_DVO As enumBoolean
Private m_YslygiInformSpravSlygb As enumBoolean
Private m_EstAVYorBLOK As Object
Dim m_EstAVYorBLOK_ID As String
Dim m_EstAVYorBLOK_ID_BRIEF As String
Private m_SerNomModem As String
Private m_SrochDogovor As Object
Dim m_SrochDogovor_ID As String
Dim m_SrochDogovor_ID_BRIEF As String
Private m_NalichSignalizazii As enumBoolean
Private m_TipSignalizazii As Object
Dim m_TipSignalizazii_ID As String
Dim m_TipSignalizazii_ID_BRIEF As String
Private m_PaketYsl As Object
Dim m_PaketYsl_ID As String
Dim m_PaketYsl_ID_BRIEF As String
Private m_Rayon As String
Private m_Disp As Object
Dim m_Disp_ID As String
Dim m_Disp_ID_BRIEF As String
Private m_Koord As Object
Dim m_Koord_ID As String
Dim m_Koord_ID_BRIEF As String
Private m_Ingener As Object
Dim m_Ingener_ID As String
Dim m_Ingener_ID_BRIEF As String
Private m_DocPolych As enumBoolean
Private m_DataSZT As Date
Private m_Otkaz As enumBoolean
Private m_OpisProblem As String
Private m_FIOdogovor As String
Private m_DataInstall As Date
Private m_VklVReestr As enumBoolean
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
  PartName = "TP_Zayv"
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
  m_Application.Logger.Message "TP_Zayv.Init"
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
Public Property Let NomerZayav(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "NomerZayav", NomerZayav, NewValue

   m_NomerZayav = NewValue
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
' variable = me. NomerZayav
Public Property Get NomerZayav() As Long
 LoadFromDatabase
 AccessTime = Now

   NomerZayav = m_NomerZayav
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
Public Property Set TipZayav(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TipZayav", TipZayav, NewValue
On Error Resume Next
m_TipZayav_ID = ""
m_TipZayav_ID = NewValue.id
'  set   m_TipZayav= newValue
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
' Set variable = me. TipZayav
Public Property Get TipZayav() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TipZayav As Object
If m_TipZayav_ID <> "" Then
  Set tmp_TipZayav = Application.FindRowObject("TP_Spr_Tzay", m_TipZayav_ID)
  If tmp_TipZayav Is Nothing Then
    m_TipZayav_ID_BRIEF = ""
  Else
    m_TipZayav_ID_BRIEF = tmp_TipZayav.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "TP_Spr_Tzay" & m_TipZayav_ID, tmp_TipZayav
  Set TipZayav = tmp_TipZayav
  Exit Property
End If
  '  set TipZayav = m_TipZayav
End Property
' let
'Дата и время подачи заявки

'Дата и время подачи заявки
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Data(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Data", Data, NewValue

   m_Data = NewValue
End If
End Property

'Дата и время подачи заявки
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. Data
Public Property Get Data() As Date
 LoadFromDatabase
 AccessTime = Now

   Data = m_Data
End Property
' let
'Тип клиента

'Тип клиента
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TipKlient(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TipKlient", TipKlient, NewValue
On Error Resume Next
m_TipKlient_ID = ""
m_TipKlient_ID = NewValue.id
'  set   m_TipKlient= newValue
End If
End Property

'Тип клиента
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TipKlient
Public Property Get TipKlient() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TipKlient As Object
If m_TipKlient_ID <> "" Then
  Set tmp_TipKlient = Application.FindRowObject("TP_Spr_tklient", m_TipKlient_ID)
  If tmp_TipKlient Is Nothing Then
    m_TipKlient_ID_BRIEF = ""
  Else
    m_TipKlient_ID_BRIEF = tmp_TipKlient.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "TP_Spr_tklient" & m_TipKlient_ID, tmp_TipKlient
  Set TipKlient = tmp_TipKlient
  Exit Property
End If
  '  set TipKlient = m_TipKlient
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
'Код порта

'Код порта
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let KodPorta(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "KodPorta", KodPorta, NewValue

   m_KodPorta = NewValue
End If
End Property

'Код порта
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. KodPorta
Public Property Get KodPorta() As String
 LoadFromDatabase
 AccessTime = Now

   KodPorta = m_KodPorta
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
Public Property Let KontLIZO(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "KontLIZO", KontLIZO, NewValue

   m_KontLIZO = NewValue
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
' variable = me. KontLIZO
Public Property Get KontLIZO() As String
 LoadFromDatabase
 AccessTime = Now

   KontLIZO = m_KontLIZO
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
Public Property Let KontTELEFON(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "KontTELEFON", KontTELEFON, NewValue

   m_KontTELEFON = NewValue
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
' variable = me. KontTELEFON
Public Property Get KontTELEFON() As String
 LoadFromDatabase
 AccessTime = Now

   KontTELEFON = m_KontTELEFON
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
Public Property Let GelDATA(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "GelDATA", GelDATA, NewValue

   m_GelDATA = NewValue
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
' variable = me. GelDATA
Public Property Get GelDATA() As Date
 LoadFromDatabase
 AccessTime = Now

   GelDATA = m_GelDATA
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
Public Property Set GelVREMJA(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "GelVREMJA", GelVREMJA, NewValue
On Error Resume Next
m_GelVREMJA_ID = ""
m_GelVREMJA_ID = NewValue.id
'  set   m_GelVREMJA= newValue
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
' Set variable = me. GelVREMJA
Public Property Get GelVREMJA() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_GelVREMJA As Object
If m_GelVREMJA_ID <> "" Then
  Set tmp_GelVREMJA = Application.FindRowObject("TP_Spr_VrVisInst", m_GelVREMJA_ID)
  If tmp_GelVREMJA Is Nothing Then
    m_GelVREMJA_ID_BRIEF = ""
  Else
    m_GelVREMJA_ID_BRIEF = tmp_GelVREMJA.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "TP_Spr_VrVisInst" & m_GelVREMJA_ID, tmp_GelVREMJA
  Set GelVREMJA = tmp_GelVREMJA
  Exit Property
End If
  '  set GelVREMJA = m_GelVREMJA
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
'Тип модема ADSL

'Тип модема ADSL
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TipModemaADSL(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TipModemaADSL", TipModemaADSL, NewValue
On Error Resume Next
m_TipModemaADSL_ID = ""
m_TipModemaADSL_ID = NewValue.id
'  set   m_TipModemaADSL= newValue
End If
End Property

'Тип модема ADSL
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TipModemaADSL
Public Property Get TipModemaADSL() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TipModemaADSL As Object
If m_TipModemaADSL_ID <> "" Then
  Set tmp_TipModemaADSL = Application.FindRowObject("TP_Spr_TipModADSL", m_TipModemaADSL_ID)
  If tmp_TipModemaADSL Is Nothing Then
    m_TipModemaADSL_ID_BRIEF = ""
  Else
    m_TipModemaADSL_ID_BRIEF = tmp_TipModemaADSL.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "TP_Spr_TipModADSL" & m_TipModemaADSL_ID, tmp_TipModemaADSL
  Set TipModemaADSL = tmp_TipModemaADSL
  Exit Property
End If
  '  set TipModemaADSL = m_TipModemaADSL
End Property
' let
'Тарифный план

'Тарифный план
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TarifPlan(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TarifPlan", TarifPlan, NewValue
On Error Resume Next
m_TarifPlan_ID = ""
m_TarifPlan_ID = NewValue.id
'  set   m_TarifPlan= newValue
End If
End Property

'Тарифный план
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TarifPlan
Public Property Get TarifPlan() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TarifPlan As Object
If m_TarifPlan_ID <> "" Then
  Set tmp_TarifPlan = Application.FindRowObject("TP_Spr_Tarplan", m_TarifPlan_ID)
  If tmp_TarifPlan Is Nothing Then
    m_TarifPlan_ID_BRIEF = ""
  Else
    m_TarifPlan_ID_BRIEF = tmp_TarifPlan.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "TP_Spr_Tarplan" & m_TarifPlan_ID, tmp_TarifPlan
  Set TarifPlan = tmp_TarifPlan
  Exit Property
End If
  '  set TarifPlan = m_TarifPlan
End Property
' let
'Фиксированный IP

'Фиксированный IP
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FiksirIP(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FiksirIP", FiksirIP, NewValue

   m_FiksirIP = NewValue
End If
End Property

'Фиксированный IP
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. FiksirIP
Public Property Get FiksirIP() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   FiksirIP = m_FiksirIP
End Property
' let
'Фикс. IP Значение

'Фикс. IP Значение
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FiksIPZnach(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FiksIPZnach", FiksIPZnach, NewValue

   m_FiksIPZnach = NewValue
End If
End Property

'Фикс. IP Значение
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FiksIPZnach
Public Property Get FiksIPZnach() As String
 LoadFromDatabase
 AccessTime = Now

   FiksIPZnach = m_FiksIPZnach
End Property
' let
'Тарифный план ЦФТВ

'Тарифный план ЦФТВ
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TarifPlanZFTV(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TarifPlanZFTV", TarifPlanZFTV, NewValue
On Error Resume Next
m_TarifPlanZFTV_ID = ""
m_TarifPlanZFTV_ID = NewValue.id
'  set   m_TarifPlanZFTV= newValue
End If
End Property

'Тарифный план ЦФТВ
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TarifPlanZFTV
Public Property Get TarifPlanZFTV() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TarifPlanZFTV As Object
If m_TarifPlanZFTV_ID <> "" Then
  Set tmp_TarifPlanZFTV = Application.FindRowObject("TP_Spt_TarplanZFTV", m_TarifPlanZFTV_ID)
  If tmp_TarifPlanZFTV Is Nothing Then
    m_TarifPlanZFTV_ID_BRIEF = ""
  Else
    m_TarifPlanZFTV_ID_BRIEF = tmp_TarifPlanZFTV.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "TP_Spt_TarplanZFTV" & m_TarifPlanZFTV_ID, tmp_TarifPlanZFTV
  Set TarifPlanZFTV = tmp_TarifPlanZFTV
  Exit Property
End If
  '  set TarifPlanZFTV = m_TarifPlanZFTV
End Property
' let
'Пакет ""взрослые истории""

'Пакет ""взрослые истории""
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let PaketVzroslieIstorii(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PaketVzroslieIstorii", PaketVzroslieIstorii, NewValue

   m_PaketVzroslieIstorii = NewValue
End If
End Property

'Пакет ""взрослые истории""
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. PaketVzroslieIstorii
Public Property Get PaketVzroslieIstorii() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   PaketVzroslieIstorii = m_PaketVzroslieIstorii
End Property
' let
'Пакет ""футбол""

'Пакет ""футбол""
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let PaketFootball(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PaketFootball", PaketFootball, NewValue

   m_PaketFootball = NewValue
End If
End Property

'Пакет ""футбол""
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. PaketFootball
Public Property Get PaketFootball() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   PaketFootball = m_PaketFootball
End Property
' let
'Номер заявки СУЗИЗ

'Номер заявки СУЗИЗ
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let NomerZayavSYZIZ(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "NomerZayavSYZIZ", NomerZayavSYZIZ, NewValue

   m_NomerZayavSYZIZ = NewValue
End If
End Property

'Номер заявки СУЗИЗ
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. NomerZayavSYZIZ
Public Property Get NomerZayavSYZIZ() As String
 LoadFromDatabase
 AccessTime = Now

   NomerZayavSYZIZ = m_NomerZayavSYZIZ
End Property
' let
'Тарифный план ТЛФ

'Тарифный план ТЛФ
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TarifPlanTLF(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TarifPlanTLF", TarifPlanTLF, NewValue
On Error Resume Next
m_TarifPlanTLF_ID = ""
m_TarifPlanTLF_ID = NewValue.id
'  set   m_TarifPlanTLF= newValue
End If
End Property

'Тарифный план ТЛФ
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TarifPlanTLF
Public Property Get TarifPlanTLF() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TarifPlanTLF As Object
If m_TarifPlanTLF_ID <> "" Then
  Set tmp_TarifPlanTLF = Application.FindRowObject("TP_Spr_TarplanTLF", m_TarifPlanTLF_ID)
  If tmp_TarifPlanTLF Is Nothing Then
    m_TarifPlanTLF_ID_BRIEF = ""
  Else
    m_TarifPlanTLF_ID_BRIEF = tmp_TarifPlanTLF.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "TP_Spr_TarplanTLF" & m_TarifPlanTLF_ID, tmp_TarifPlanTLF
  Set TarifPlanTLF = tmp_TarifPlanTLF
  Exit Property
End If
  '  set TarifPlanTLF = m_TarifPlanTLF
End Property
' let
'Подбор номера ТЛФ

'Подбор номера ТЛФ
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let PodborNomerTLF(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PodborNomerTLF", PodborNomerTLF, NewValue

   m_PodborNomerTLF = NewValue
End If
End Property

'Подбор номера ТЛФ
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. PodborNomerTLF
Public Property Get PodborNomerTLF() As String
 LoadFromDatabase
 AccessTime = Now

   PodborNomerTLF = m_PodborNomerTLF
End Property
' let
'Внутризоновая ТЛФ

'Внутризоновая ТЛФ
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let VnytriZonovajaTLF(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "VnytriZonovajaTLF", VnytriZonovajaTLF, NewValue

   m_VnytriZonovajaTLF = NewValue
End If
End Property

'Внутризоновая ТЛФ
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. VnytriZonovajaTLF
Public Property Get VnytriZonovajaTLF() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   VnytriZonovajaTLF = m_VnytriZonovajaTLF
End Property
' let
'МГ, МН Телефонная связь

'МГ, МН Телефонная связь
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let MGMNTelSviaz(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "MGMNTelSviaz", MGMNTelSviaz, NewValue

   m_MGMNTelSviaz = NewValue
End If
End Property

'МГ, МН Телефонная связь
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. MGMNTelSviaz
Public Property Get MGMNTelSviaz() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   MGMNTelSviaz = m_MGMNTelSviaz
End Property
' let
'Выбор оператора

'Выбор оператора
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set ViborOperat(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ViborOperat", ViborOperat, NewValue
On Error Resume Next
m_ViborOperat_ID = ""
m_ViborOperat_ID = NewValue.id
'  set   m_ViborOperat= newValue
End If
End Property

'Выбор оператора
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. ViborOperat
Public Property Get ViborOperat() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_ViborOperat As Object
If m_ViborOperat_ID <> "" Then
  Set tmp_ViborOperat = Application.FindRowObject("TP_Spr_Oper", m_ViborOperat_ID)
  If tmp_ViborOperat Is Nothing Then
    m_ViborOperat_ID_BRIEF = ""
  Else
    m_ViborOperat_ID_BRIEF = tmp_ViborOperat.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "TP_Spr_Oper" & m_ViborOperat_ID, tmp_ViborOperat
  Set ViborOperat = tmp_ViborOperat
  Exit Property
End If
  '  set ViborOperat = m_ViborOperat
End Property
' let
'ДВО

'ДВО
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DVO(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DVO", DVO, NewValue

   m_DVO = NewValue
End If
End Property

'ДВО
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. DVO
Public Property Get DVO() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   DVO = m_DVO
End Property
' let
'Услуги информ-справ. служб

'Услуги информ-справ. служб
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let YslygiInformSpravSlygb(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "YslygiInformSpravSlygb", YslygiInformSpravSlygb, NewValue

   m_YslygiInformSpravSlygb = NewValue
End If
End Property

'Услуги информ-справ. служб
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. YslygiInformSpravSlygb
Public Property Get YslygiInformSpravSlygb() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   YslygiInformSpravSlygb = m_YslygiInformSpravSlygb
End Property
' let
'Есть ли АВУ или блокиратор

'Есть ли АВУ или блокиратор
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set EstAVYorBLOK(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "EstAVYorBLOK", EstAVYorBLOK, NewValue
On Error Resume Next
m_EstAVYorBLOK_ID = ""
m_EstAVYorBLOK_ID = NewValue.id
'  set   m_EstAVYorBLOK= newValue
End If
End Property

'Есть ли АВУ или блокиратор
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. EstAVYorBLOK
Public Property Get EstAVYorBLOK() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_EstAVYorBLOK As Object
If m_EstAVYorBLOK_ID <> "" Then
  Set tmp_EstAVYorBLOK = Application.FindRowObject("TP_Spr_AvyILIBlok", m_EstAVYorBLOK_ID)
  If tmp_EstAVYorBLOK Is Nothing Then
    m_EstAVYorBLOK_ID_BRIEF = ""
  Else
    m_EstAVYorBLOK_ID_BRIEF = tmp_EstAVYorBLOK.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "TP_Spr_AvyILIBlok" & m_EstAVYorBLOK_ID, tmp_EstAVYorBLOK
  Set EstAVYorBLOK = tmp_EstAVYorBLOK
  Exit Property
End If
  '  set EstAVYorBLOK = m_EstAVYorBLOK
End Property
' let
'Серийный номер модема

'Серийный номер модема
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let SerNomModem(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SerNomModem", SerNomModem, NewValue

   m_SerNomModem = NewValue
End If
End Property

'Серийный номер модема
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. SerNomModem
Public Property Get SerNomModem() As String
 LoadFromDatabase
 AccessTime = Now

   SerNomModem = m_SerNomModem
End Property
' let
'Срочный доровор

'Срочный доровор
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

'Срочный доровор
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
'Наличие сигнализации

'Наличие сигнализации
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let NalichSignalizazii(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "NalichSignalizazii", NalichSignalizazii, NewValue

   m_NalichSignalizazii = NewValue
End If
End Property

'Наличие сигнализации
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. NalichSignalizazii
Public Property Get NalichSignalizazii() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   NalichSignalizazii = m_NalichSignalizazii
End Property
' let
'Тип сигнализации

'Тип сигнализации
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TipSignalizazii(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TipSignalizazii", TipSignalizazii, NewValue
On Error Resume Next
m_TipSignalizazii_ID = ""
m_TipSignalizazii_ID = NewValue.id
'  set   m_TipSignalizazii= newValue
End If
End Property

'Тип сигнализации
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TipSignalizazii
Public Property Get TipSignalizazii() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TipSignalizazii As Object
If m_TipSignalizazii_ID <> "" Then
  Set tmp_TipSignalizazii = Application.FindRowObject("TP_Spr_TipSignaliz", m_TipSignalizazii_ID)
  If tmp_TipSignalizazii Is Nothing Then
    m_TipSignalizazii_ID_BRIEF = ""
  Else
    m_TipSignalizazii_ID_BRIEF = tmp_TipSignalizazii.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "TP_Spr_TipSignaliz" & m_TipSignalizazii_ID, tmp_TipSignalizazii
  Set TipSignalizazii = tmp_TipSignalizazii
  Exit Property
End If
  '  set TipSignalizazii = m_TipSignalizazii
End Property
' let
'Пакет услуг

'Пакет услуг
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set PaketYsl(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PaketYsl", PaketYsl, NewValue
On Error Resume Next
m_PaketYsl_ID = ""
m_PaketYsl_ID = NewValue.id
'  set   m_PaketYsl= newValue
End If
End Property

'Пакет услуг
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. PaketYsl
Public Property Get PaketYsl() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_PaketYsl As Object
If m_PaketYsl_ID <> "" Then
  Set tmp_PaketYsl = Application.FindRowObject("TP_Spr_PakYsl", m_PaketYsl_ID)
  If tmp_PaketYsl Is Nothing Then
    m_PaketYsl_ID_BRIEF = ""
  Else
    m_PaketYsl_ID_BRIEF = tmp_PaketYsl.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "TP_Spr_PakYsl" & m_PaketYsl_ID, tmp_PaketYsl
  Set PaketYsl = tmp_PaketYsl
  Exit Property
End If
  '  set PaketYsl = m_PaketYsl
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
Public Property Let Rayon(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Rayon", Rayon, NewValue

   m_Rayon = NewValue
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
' variable = me. Rayon
Public Property Get Rayon() As String
 LoadFromDatabase
 AccessTime = Now

   Rayon = m_Rayon
End Property
' let
'Диспетчер

'Диспетчер
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set Disp(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Disp", Disp, NewValue
On Error Resume Next
m_Disp_ID = ""
m_Disp_ID = NewValue.id
'  set   m_Disp= newValue
End If
End Property

'Диспетчер
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Disp
Public Property Get Disp() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_Disp As Object
If m_Disp_ID <> "" Then
  Set tmp_Disp = Application.FindRowObject("TP_Spr_Disp", m_Disp_ID)
  If tmp_Disp Is Nothing Then
    m_Disp_ID_BRIEF = ""
  Else
    m_Disp_ID_BRIEF = tmp_Disp.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "TP_Spr_Disp" & m_Disp_ID, tmp_Disp
  Set Disp = tmp_Disp
  Exit Property
End If
  '  set Disp = m_Disp
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
Public Property Set Koord(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Koord", Koord, NewValue
On Error Resume Next
m_Koord_ID = ""
m_Koord_ID = NewValue.id
'  set   m_Koord= newValue
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
' Set variable = me. Koord
Public Property Get Koord() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_Koord As Object
If m_Koord_ID <> "" Then
  Set tmp_Koord = Application.FindRowObject("TP_Spr_Koor", m_Koord_ID)
  If tmp_Koord Is Nothing Then
    m_Koord_ID_BRIEF = ""
  Else
    m_Koord_ID_BRIEF = tmp_Koord.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "TP_Spr_Koor" & m_Koord_ID, tmp_Koord
  Set Koord = tmp_Koord
  Exit Property
End If
  '  set Koord = m_Koord
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
'[IN]   newValue , тип параметра: String  - ...
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
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. OpisProblem
Public Property Get OpisProblem() As String
 LoadFromDatabase
 AccessTime = Now

   OpisProblem = m_OpisProblem
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
'Включена в реестр оплаты

'Включена в реестр оплаты
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

'Включена в реестр оплаты
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
'Комментарии

'Комментарии
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
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

'Комментарии
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
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

  Set nvi = nv.Add("NomerZayav", m_NomerZayav)
nvi.ValueType = adInteger
nvi.ValueSize = 255
 ' Reference to TP_Spr_Tzay
    If m_TipZayav_ID = "" Then
       Set nvi = nv.Add("TipZayav", "")
    Else
       Set nvi = nv.Add("TipZayav", m_TipZayav_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("Data", m_Data)
nvi.ValueType = adDBTimeStamp
 ' Reference to TP_Spr_tklient
    If m_TipKlient_ID = "" Then
       Set nvi = nv.Add("TipKlient", "")
    Else
       Set nvi = nv.Add("TipKlient", m_TipKlient_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("FIO", m_FIO)
nvi.ValueSize = 255
  Set nvi = nv.Add("Adres", m_Adres)
nvi.ValueSize = 255
  Set nvi = nv.Add("KodPorta", m_KodPorta)
nvi.ValueSize = 255
  Set nvi = nv.Add("KontLIZO", m_KontLIZO)
nvi.ValueSize = 255
  Set nvi = nv.Add("KontEMAIL", m_KontEMAIL)
nvi.ValueSize = 255
  Set nvi = nv.Add("KontTELEFON", m_KontTELEFON)
nvi.ValueSize = 100
  Set nvi = nv.Add("VremjaDljaSvjazi", m_VremjaDljaSvjazi)
nvi.ValueSize = 255
  Set nvi = nv.Add("GelDATA", m_GelDATA)
nvi.ValueType = adDate
 ' Reference to TP_Spr_VrVisInst
    If m_GelVREMJA_ID = "" Then
       Set nvi = nv.Add("GelVREMJA", "")
    Else
       Set nvi = nv.Add("GelVREMJA", m_GelVREMJA_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to TP_Spr_Metro
    If m_Metro_ID = "" Then
       Set nvi = nv.Add("Metro", "")
    Else
       Set nvi = nv.Add("Metro", m_Metro_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to TP_Spr_TipModADSL
    If m_TipModemaADSL_ID = "" Then
       Set nvi = nv.Add("TipModemaADSL", "")
    Else
       Set nvi = nv.Add("TipModemaADSL", m_TipModemaADSL_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to TP_Spr_Tarplan
    If m_TarifPlan_ID = "" Then
       Set nvi = nv.Add("TarifPlan", "")
    Else
       Set nvi = nv.Add("TarifPlan", m_TarifPlan_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("FiksirIP", m_FiksirIP)
nvi.ValueType = adInteger
  Set nvi = nv.Add("FiksIPZnach", m_FiksIPZnach)
nvi.ValueSize = 100
 ' Reference to TP_Spt_TarplanZFTV
    If m_TarifPlanZFTV_ID = "" Then
       Set nvi = nv.Add("TarifPlanZFTV", "")
    Else
       Set nvi = nv.Add("TarifPlanZFTV", m_TarifPlanZFTV_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("PaketVzroslieIstorii", m_PaketVzroslieIstorii)
nvi.ValueType = adInteger
  Set nvi = nv.Add("PaketFootball", m_PaketFootball)
nvi.ValueType = adInteger
  Set nvi = nv.Add("NomerZayavSYZIZ", m_NomerZayavSYZIZ)
nvi.ValueSize = 100
 ' Reference to TP_Spr_TarplanTLF
    If m_TarifPlanTLF_ID = "" Then
       Set nvi = nv.Add("TarifPlanTLF", "")
    Else
       Set nvi = nv.Add("TarifPlanTLF", m_TarifPlanTLF_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("PodborNomerTLF", m_PodborNomerTLF)
nvi.ValueSize = 100
  Set nvi = nv.Add("VnytriZonovajaTLF", m_VnytriZonovajaTLF)
nvi.ValueType = adInteger
  Set nvi = nv.Add("MGMNTelSviaz", m_MGMNTelSviaz)
nvi.ValueType = adInteger
 ' Reference to TP_Spr_Oper
    If m_ViborOperat_ID = "" Then
       Set nvi = nv.Add("ViborOperat", "")
    Else
       Set nvi = nv.Add("ViborOperat", m_ViborOperat_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("DVO", m_DVO)
nvi.ValueType = adInteger
  Set nvi = nv.Add("YslygiInformSpravSlygb", m_YslygiInformSpravSlygb)
nvi.ValueType = adInteger
 ' Reference to TP_Spr_AvyILIBlok
    If m_EstAVYorBLOK_ID = "" Then
       Set nvi = nv.Add("EstAVYorBLOK", "")
    Else
       Set nvi = nv.Add("EstAVYorBLOK", m_EstAVYorBLOK_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("SerNomModem", m_SerNomModem)
nvi.ValueSize = 255
 ' Reference to TP_Spr_SrochDog
    If m_SrochDogovor_ID = "" Then
       Set nvi = nv.Add("SrochDogovor", "")
    Else
       Set nvi = nv.Add("SrochDogovor", m_SrochDogovor_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("NalichSignalizazii", m_NalichSignalizazii)
nvi.ValueType = adInteger
 ' Reference to TP_Spr_TipSignaliz
    If m_TipSignalizazii_ID = "" Then
       Set nvi = nv.Add("TipSignalizazii", "")
    Else
       Set nvi = nv.Add("TipSignalizazii", m_TipSignalizazii_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to TP_Spr_PakYsl
    If m_PaketYsl_ID = "" Then
       Set nvi = nv.Add("PaketYsl", "")
    Else
       Set nvi = nv.Add("PaketYsl", m_PaketYsl_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("Rayon", m_Rayon)
nvi.ValueSize = 255
 ' Reference to TP_Spr_Disp
    If m_Disp_ID = "" Then
       Set nvi = nv.Add("Disp", "")
    Else
       Set nvi = nv.Add("Disp", m_Disp_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to TP_Spr_Koor
    If m_Koord_ID = "" Then
       Set nvi = nv.Add("Koord", "")
    Else
       Set nvi = nv.Add("Koord", m_Koord_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to TP_Spr_Ing
    If m_Ingener_ID = "" Then
       Set nvi = nv.Add("Ingener", "")
    Else
       Set nvi = nv.Add("Ingener", m_Ingener_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("DocPolych", m_DocPolych)
nvi.ValueType = adInteger
  Set nvi = nv.Add("DataSZT", m_DataSZT)
nvi.ValueType = adDate
  Set nvi = nv.Add("Otkaz", m_Otkaz)
nvi.ValueType = adInteger
  Set nvi = nv.Add("OpisProblem", m_OpisProblem)
nvi.ValueSize = 255
  Set nvi = nv.Add("FIOdogovor", m_FIOdogovor)
nvi.ValueSize = 255
  Set nvi = nv.Add("DataInstall", m_DataInstall)
nvi.ValueType = adDate
  Set nvi = nv.Add("VklVReestr", m_VklVReestr)
nvi.ValueSize = 255
nvi.ValueType = adInteger
  Set nvi = nv.Add("Komment", m_Komment)
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
 m_Brief = m_Brief & NomerZayav & "; "
 m_Brief = m_Brief & FIO & "; "
 m_Brief = m_Brief & Adres & "; "
 m_Brief = m_Brief & KodPorta & "; "
 m_Brief = m_Brief & KontLIZO & "; "
 m_Brief = m_Brief & KontEMAIL & "; "
 m_Brief = m_Brief & KontTELEFON & "; "
 m_Brief = m_Brief & VremjaDljaSvjazi & "; "
 m_Brief = m_Brief & FiksIPZnach & "; "
 m_Brief = m_Brief & NomerZayavSYZIZ & "; "
 m_Brief = m_Brief & PodborNomerTLF & "; "
 m_Brief = m_Brief & SerNomModem & "; "
 m_Brief = m_Brief & Rayon & "; "
 m_Brief = m_Brief & OpisProblem & "; "
 m_Brief = m_Brief & FIOdogovor & "; "
Select Case VklVReestr
Case Boolean_Da
   m_Brief = m_Brief & "Да; "
Case Boolean_Net
   m_Brief = m_Brief & "Нет; "
End Select 'VklVReestr
 m_Brief = m_Brief & Komment & "; "
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

m_NomerZayav = nv.item("NomerZayav").Value
  m_TipZayav_ID = nv.item("TipZayav").Value
m_Data = nv.item("Data").Value
  m_TipKlient_ID = nv.item("TipKlient").Value
m_FIO = nv.item("FIO").Value
m_Adres = nv.item("Adres").Value
m_KodPorta = nv.item("KodPorta").Value
m_KontLIZO = nv.item("KontLIZO").Value
m_KontEMAIL = nv.item("KontEMAIL").Value
m_KontTELEFON = nv.item("KontTELEFON").Value
m_VremjaDljaSvjazi = nv.item("VremjaDljaSvjazi").Value
m_GelDATA = nv.item("GelDATA").Value
  m_GelVREMJA_ID = nv.item("GelVREMJA").Value
  m_Metro_ID = nv.item("Metro").Value
  m_TipModemaADSL_ID = nv.item("TipModemaADSL").Value
  m_TarifPlan_ID = nv.item("TarifPlan").Value
m_FiksirIP = nv.item("FiksirIP").Value
m_FiksIPZnach = nv.item("FiksIPZnach").Value
  m_TarifPlanZFTV_ID = nv.item("TarifPlanZFTV").Value
m_PaketVzroslieIstorii = nv.item("PaketVzroslieIstorii").Value
m_PaketFootball = nv.item("PaketFootball").Value
m_NomerZayavSYZIZ = nv.item("NomerZayavSYZIZ").Value
  m_TarifPlanTLF_ID = nv.item("TarifPlanTLF").Value
m_PodborNomerTLF = nv.item("PodborNomerTLF").Value
m_VnytriZonovajaTLF = nv.item("VnytriZonovajaTLF").Value
m_MGMNTelSviaz = nv.item("MGMNTelSviaz").Value
  m_ViborOperat_ID = nv.item("ViborOperat").Value
m_DVO = nv.item("DVO").Value
m_YslygiInformSpravSlygb = nv.item("YslygiInformSpravSlygb").Value
  m_EstAVYorBLOK_ID = nv.item("EstAVYorBLOK").Value
m_SerNomModem = nv.item("SerNomModem").Value
  m_SrochDogovor_ID = nv.item("SrochDogovor").Value
m_NalichSignalizazii = nv.item("NalichSignalizazii").Value
  m_TipSignalizazii_ID = nv.item("TipSignalizazii").Value
  m_PaketYsl_ID = nv.item("PaketYsl").Value
m_Rayon = nv.item("Rayon").Value
  m_Disp_ID = nv.item("Disp").Value
  m_Koord_ID = nv.item("Koord").Value
  m_Ingener_ID = nv.item("Ingener").Value
m_DocPolych = nv.item("DocPolych").Value
m_DataSZT = nv.item("DataSZT").Value
m_Otkaz = nv.item("Otkaz").Value
m_OpisProblem = nv.item("OpisProblem").Value
m_FIOdogovor = nv.item("FIOdogovor").Value
m_DataInstall = nv.item("DataInstall").Value
m_VklVReestr = nv.item("VklVReestr").Value
m_Komment = nv.item("Komment").Value
Else

m_NomerZayav = nv.Fields("NomerZayav").Value
  m_TipZayav_ID = nv.Fields("TipZayav").Value
m_Data = nv.Fields("Data").Value
  m_TipKlient_ID = nv.Fields("TipKlient").Value
m_FIO = nv.Fields("FIO").Value
m_Adres = nv.Fields("Adres").Value
m_KodPorta = nv.Fields("KodPorta").Value
m_KontLIZO = nv.Fields("KontLIZO").Value
m_KontEMAIL = nv.Fields("KontEMAIL").Value
m_KontTELEFON = nv.Fields("KontTELEFON").Value
m_VremjaDljaSvjazi = nv.Fields("VremjaDljaSvjazi").Value
m_GelDATA = nv.Fields("GelDATA").Value
  m_GelVREMJA_ID = nv.Fields("GelVREMJA").Value
  m_Metro_ID = nv.Fields("Metro").Value
  m_TipModemaADSL_ID = nv.Fields("TipModemaADSL").Value
  m_TarifPlan_ID = nv.Fields("TarifPlan").Value
m_FiksirIP = nv.Fields("FiksirIP").Value
m_FiksIPZnach = nv.Fields("FiksIPZnach").Value
  m_TarifPlanZFTV_ID = nv.Fields("TarifPlanZFTV").Value
m_PaketVzroslieIstorii = nv.Fields("PaketVzroslieIstorii").Value
m_PaketFootball = nv.Fields("PaketFootball").Value
m_NomerZayavSYZIZ = nv.Fields("NomerZayavSYZIZ").Value
  m_TarifPlanTLF_ID = nv.Fields("TarifPlanTLF").Value
m_PodborNomerTLF = nv.Fields("PodborNomerTLF").Value
m_VnytriZonovajaTLF = nv.Fields("VnytriZonovajaTLF").Value
m_MGMNTelSviaz = nv.Fields("MGMNTelSviaz").Value
  m_ViborOperat_ID = nv.Fields("ViborOperat").Value
m_DVO = nv.Fields("DVO").Value
m_YslygiInformSpravSlygb = nv.Fields("YslygiInformSpravSlygb").Value
  m_EstAVYorBLOK_ID = nv.Fields("EstAVYorBLOK").Value
m_SerNomModem = nv.Fields("SerNomModem").Value
  m_SrochDogovor_ID = nv.Fields("SrochDogovor").Value
m_NalichSignalizazii = nv.Fields("NalichSignalizazii").Value
  m_TipSignalizazii_ID = nv.Fields("TipSignalizazii").Value
  m_PaketYsl_ID = nv.Fields("PaketYsl").Value
m_Rayon = nv.Fields("Rayon").Value
  m_Disp_ID = nv.Fields("Disp").Value
  m_Koord_ID = nv.Fields("Koord").Value
  m_Ingener_ID = nv.Fields("Ingener").Value
m_DocPolych = nv.Fields("DocPolych").Value
m_DataSZT = nv.Fields("DataSZT").Value
m_Otkaz = nv.Fields("Otkaz").Value
m_OpisProblem = nv.Fields("OpisProblem").Value
m_FIOdogovor = nv.Fields("FIOdogovor").Value
m_DataInstall = nv.Fields("DataInstall").Value
m_VklVReestr = nv.Fields("VklVReestr").Value
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
   Dim o As TP_Zayv
   Set o = New TP_Zayv
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
  err.Raise err.Number, "TP_Zayv.Save", err.Description
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
  err.Raise err.Number, "TP_Zayv.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("TP_Zayv", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "TP_Zayv.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "TP_Zayv", id
Exit Sub
bye:
  err.Raise err.Number, "TP_Zayv.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 m_TipZayav_ID = ""
 Set m_TipZayav = Nothing
 m_TipKlient_ID = ""
 Set m_TipKlient = Nothing
 m_GelVREMJA_ID = ""
 Set m_GelVREMJA = Nothing
 m_Metro_ID = ""
 Set m_Metro = Nothing
 m_TipModemaADSL_ID = ""
 Set m_TipModemaADSL = Nothing
 m_TarifPlan_ID = ""
 Set m_TarifPlan = Nothing
 m_TarifPlanZFTV_ID = ""
 Set m_TarifPlanZFTV = Nothing
 m_TarifPlanTLF_ID = ""
 Set m_TarifPlanTLF = Nothing
 m_ViborOperat_ID = ""
 Set m_ViborOperat = Nothing
 m_EstAVYorBLOK_ID = ""
 Set m_EstAVYorBLOK = Nothing
 m_SrochDogovor_ID = ""
 Set m_SrochDogovor = Nothing
 m_TipSignalizazii_ID = ""
 Set m_TipSignalizazii = Nothing
 m_PaketYsl_ID = ""
 Set m_PaketYsl = Nothing
 m_Disp_ID = ""
 Set m_Disp = Nothing
 m_Koord_ID = ""
 Set m_Koord = Nothing
 m_Ingener_ID = ""
 Set m_Ingener = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "TP_Zayv.CloseClass"
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
  NomerZayav = node.Attributes.getNamedItem("NOMERZAYAV").nodeValue
  Set TipZayav = Nothing
  m_TipZayav_ID = node.Attributes.getNamedItem("TIPZAYAV").nodeValue
  m_TipZayav_ID_BRIEF = node.Attributes.getNamedItem("TIPZAYAV_BRIEF").nodeValue
  Data = node.Attributes.getNamedItem("DATA").nodeValue
  Set TipKlient = Nothing
  m_TipKlient_ID = node.Attributes.getNamedItem("TIPKLIENT").nodeValue
  m_TipKlient_ID_BRIEF = node.Attributes.getNamedItem("TIPKLIENT_BRIEF").nodeValue
  FIO = Replace(node.Attributes.getNamedItem("FIO").nodeValue, vbLf, vbCrLf)
  Adres = Replace(node.Attributes.getNamedItem("ADRES").nodeValue, vbLf, vbCrLf)
  KodPorta = Replace(node.Attributes.getNamedItem("KODPORTA").nodeValue, vbLf, vbCrLf)
  KontLIZO = Replace(node.Attributes.getNamedItem("KONTLIZO").nodeValue, vbLf, vbCrLf)
  KontEMAIL = Replace(node.Attributes.getNamedItem("KONTEMAIL").nodeValue, vbLf, vbCrLf)
  KontTELEFON = Replace(node.Attributes.getNamedItem("KONTTELEFON").nodeValue, vbLf, vbCrLf)
  VremjaDljaSvjazi = Replace(node.Attributes.getNamedItem("VREMJADLJASVJAZI").nodeValue, vbLf, vbCrLf)
  GelDATA = node.Attributes.getNamedItem("GELDATA").nodeValue
  Set GelVREMJA = Nothing
  m_GelVREMJA_ID = node.Attributes.getNamedItem("GELVREMJA").nodeValue
  m_GelVREMJA_ID_BRIEF = node.Attributes.getNamedItem("GELVREMJA_BRIEF").nodeValue
  Set Metro = Nothing
  m_Metro_ID = node.Attributes.getNamedItem("METRO").nodeValue
  m_Metro_ID_BRIEF = node.Attributes.getNamedItem("METRO_BRIEF").nodeValue
  Set TipModemaADSL = Nothing
  m_TipModemaADSL_ID = node.Attributes.getNamedItem("TIPMODEMAADSL").nodeValue
  m_TipModemaADSL_ID_BRIEF = node.Attributes.getNamedItem("TIPMODEMAADSL_BRIEF").nodeValue
  Set TarifPlan = Nothing
  m_TarifPlan_ID = node.Attributes.getNamedItem("TARIFPLAN").nodeValue
  m_TarifPlan_ID_BRIEF = node.Attributes.getNamedItem("TARIFPLAN_BRIEF").nodeValue
  FiksirIP = node.Attributes.getNamedItem("FIKSIRIP").nodeValue
  FiksIPZnach = Replace(node.Attributes.getNamedItem("FIKSIPZNACH").nodeValue, vbLf, vbCrLf)
  Set TarifPlanZFTV = Nothing
  m_TarifPlanZFTV_ID = node.Attributes.getNamedItem("TARIFPLANZFTV").nodeValue
  m_TarifPlanZFTV_ID_BRIEF = node.Attributes.getNamedItem("TARIFPLANZFTV_BRIEF").nodeValue
  PaketVzroslieIstorii = node.Attributes.getNamedItem("PAKETVZROSLIEISTORII").nodeValue
  PaketFootball = node.Attributes.getNamedItem("PAKETFOOTBALL").nodeValue
  NomerZayavSYZIZ = Replace(node.Attributes.getNamedItem("NOMERZAYAVSYZIZ").nodeValue, vbLf, vbCrLf)
  Set TarifPlanTLF = Nothing
  m_TarifPlanTLF_ID = node.Attributes.getNamedItem("TARIFPLANTLF").nodeValue
  m_TarifPlanTLF_ID_BRIEF = node.Attributes.getNamedItem("TARIFPLANTLF_BRIEF").nodeValue
  PodborNomerTLF = Replace(node.Attributes.getNamedItem("PODBORNOMERTLF").nodeValue, vbLf, vbCrLf)
  VnytriZonovajaTLF = node.Attributes.getNamedItem("VNYTRIZONOVAJATLF").nodeValue
  MGMNTelSviaz = node.Attributes.getNamedItem("MGMNTELSVIAZ").nodeValue
  Set ViborOperat = Nothing
  m_ViborOperat_ID = node.Attributes.getNamedItem("VIBOROPERAT").nodeValue
  m_ViborOperat_ID_BRIEF = node.Attributes.getNamedItem("VIBOROPERAT_BRIEF").nodeValue
  DVO = node.Attributes.getNamedItem("DVO").nodeValue
  YslygiInformSpravSlygb = node.Attributes.getNamedItem("YSLYGIINFORMSPRAVSLYGB").nodeValue
  Set EstAVYorBLOK = Nothing
  m_EstAVYorBLOK_ID = node.Attributes.getNamedItem("ESTAVYORBLOK").nodeValue
  m_EstAVYorBLOK_ID_BRIEF = node.Attributes.getNamedItem("ESTAVYORBLOK_BRIEF").nodeValue
  SerNomModem = Replace(node.Attributes.getNamedItem("SERNOMMODEM").nodeValue, vbLf, vbCrLf)
  Set SrochDogovor = Nothing
  m_SrochDogovor_ID = node.Attributes.getNamedItem("SROCHDOGOVOR").nodeValue
  m_SrochDogovor_ID_BRIEF = node.Attributes.getNamedItem("SROCHDOGOVOR_BRIEF").nodeValue
  NalichSignalizazii = node.Attributes.getNamedItem("NALICHSIGNALIZAZII").nodeValue
  Set TipSignalizazii = Nothing
  m_TipSignalizazii_ID = node.Attributes.getNamedItem("TIPSIGNALIZAZII").nodeValue
  m_TipSignalizazii_ID_BRIEF = node.Attributes.getNamedItem("TIPSIGNALIZAZII_BRIEF").nodeValue
  Set PaketYsl = Nothing
  m_PaketYsl_ID = node.Attributes.getNamedItem("PAKETYSL").nodeValue
  m_PaketYsl_ID_BRIEF = node.Attributes.getNamedItem("PAKETYSL_BRIEF").nodeValue
  Rayon = Replace(node.Attributes.getNamedItem("RAYON").nodeValue, vbLf, vbCrLf)
  Set Disp = Nothing
  m_Disp_ID = node.Attributes.getNamedItem("DISP").nodeValue
  m_Disp_ID_BRIEF = node.Attributes.getNamedItem("DISP_BRIEF").nodeValue
  Set Koord = Nothing
  m_Koord_ID = node.Attributes.getNamedItem("KOORD").nodeValue
  m_Koord_ID_BRIEF = node.Attributes.getNamedItem("KOORD_BRIEF").nodeValue
  Set Ingener = Nothing
  m_Ingener_ID = node.Attributes.getNamedItem("INGENER").nodeValue
  m_Ingener_ID_BRIEF = node.Attributes.getNamedItem("INGENER_BRIEF").nodeValue
  DocPolych = node.Attributes.getNamedItem("DOCPOLYCH").nodeValue
  DataSZT = node.Attributes.getNamedItem("DATASZT").nodeValue
  Otkaz = node.Attributes.getNamedItem("OTKAZ").nodeValue
  OpisProblem = Replace(node.Attributes.getNamedItem("OPISPROBLEM").nodeValue, vbLf, vbCrLf)
  FIOdogovor = Replace(node.Attributes.getNamedItem("FIODOGOVOR").nodeValue, vbLf, vbCrLf)
  DataInstall = node.Attributes.getNamedItem("DATAINSTALL").nodeValue
  VklVReestr = node.Attributes.getNamedItem("VKLVREESTR").nodeValue
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
  node.setAttribute "NOMERZAYAV", NomerZayav
  node.setAttribute "TIPZAYAV", m_TipZayav_ID
  If Not (TipZayav Is Nothing) Then
    node.setAttribute "TIPZAYAV_BRIEF", TipZayav.Brief
  Else
    node.setAttribute "TIPZAYAV_BRIEF", m_TipZayav_ID_BRIEF
  End If
  node.setAttribute "DATA", CDbl(Data)
  node.setAttribute "TIPKLIENT", m_TipKlient_ID
  If Not (TipKlient Is Nothing) Then
    node.setAttribute "TIPKLIENT_BRIEF", TipKlient.Brief
  Else
    node.setAttribute "TIPKLIENT_BRIEF", m_TipKlient_ID_BRIEF
  End If
  node.setAttribute "FIO", FIO
  node.setAttribute "ADRES", Adres
  node.setAttribute "KODPORTA", KodPorta
  node.setAttribute "KONTLIZO", KontLIZO
  node.setAttribute "KONTEMAIL", KontEMAIL
  node.setAttribute "KONTTELEFON", KontTELEFON
  node.setAttribute "VREMJADLJASVJAZI", VremjaDljaSvjazi
  node.setAttribute "GELDATA", CDbl(GelDATA)
  node.setAttribute "GELVREMJA", m_GelVREMJA_ID
  If Not (GelVREMJA Is Nothing) Then
    node.setAttribute "GELVREMJA_BRIEF", GelVREMJA.Brief
  Else
    node.setAttribute "GELVREMJA_BRIEF", m_GelVREMJA_ID_BRIEF
  End If
  node.setAttribute "METRO", m_Metro_ID
  If Not (Metro Is Nothing) Then
    node.setAttribute "METRO_BRIEF", Metro.Brief
  Else
    node.setAttribute "METRO_BRIEF", m_Metro_ID_BRIEF
  End If
  node.setAttribute "TIPMODEMAADSL", m_TipModemaADSL_ID
  If Not (TipModemaADSL Is Nothing) Then
    node.setAttribute "TIPMODEMAADSL_BRIEF", TipModemaADSL.Brief
  Else
    node.setAttribute "TIPMODEMAADSL_BRIEF", m_TipModemaADSL_ID_BRIEF
  End If
  node.setAttribute "TARIFPLAN", m_TarifPlan_ID
  If Not (TarifPlan Is Nothing) Then
    node.setAttribute "TARIFPLAN_BRIEF", TarifPlan.Brief
  Else
    node.setAttribute "TARIFPLAN_BRIEF", m_TarifPlan_ID_BRIEF
  End If
  node.setAttribute "FIKSIRIP", FiksirIP
  node.setAttribute "FIKSIPZNACH", FiksIPZnach
  node.setAttribute "TARIFPLANZFTV", m_TarifPlanZFTV_ID
  If Not (TarifPlanZFTV Is Nothing) Then
    node.setAttribute "TARIFPLANZFTV_BRIEF", TarifPlanZFTV.Brief
  Else
    node.setAttribute "TARIFPLANZFTV_BRIEF", m_TarifPlanZFTV_ID_BRIEF
  End If
  node.setAttribute "PAKETVZROSLIEISTORII", PaketVzroslieIstorii
  node.setAttribute "PAKETFOOTBALL", PaketFootball
  node.setAttribute "NOMERZAYAVSYZIZ", NomerZayavSYZIZ
  node.setAttribute "TARIFPLANTLF", m_TarifPlanTLF_ID
  If Not (TarifPlanTLF Is Nothing) Then
    node.setAttribute "TARIFPLANTLF_BRIEF", TarifPlanTLF.Brief
  Else
    node.setAttribute "TARIFPLANTLF_BRIEF", m_TarifPlanTLF_ID_BRIEF
  End If
  node.setAttribute "PODBORNOMERTLF", PodborNomerTLF
  node.setAttribute "VNYTRIZONOVAJATLF", VnytriZonovajaTLF
  node.setAttribute "MGMNTELSVIAZ", MGMNTelSviaz
  node.setAttribute "VIBOROPERAT", m_ViborOperat_ID
  If Not (ViborOperat Is Nothing) Then
    node.setAttribute "VIBOROPERAT_BRIEF", ViborOperat.Brief
  Else
    node.setAttribute "VIBOROPERAT_BRIEF", m_ViborOperat_ID_BRIEF
  End If
  node.setAttribute "DVO", DVO
  node.setAttribute "YSLYGIINFORMSPRAVSLYGB", YslygiInformSpravSlygb
  node.setAttribute "ESTAVYORBLOK", m_EstAVYorBLOK_ID
  If Not (EstAVYorBLOK Is Nothing) Then
    node.setAttribute "ESTAVYORBLOK_BRIEF", EstAVYorBLOK.Brief
  Else
    node.setAttribute "ESTAVYORBLOK_BRIEF", m_EstAVYorBLOK_ID_BRIEF
  End If
  node.setAttribute "SERNOMMODEM", SerNomModem
  node.setAttribute "SROCHDOGOVOR", m_SrochDogovor_ID
  If Not (SrochDogovor Is Nothing) Then
    node.setAttribute "SROCHDOGOVOR_BRIEF", SrochDogovor.Brief
  Else
    node.setAttribute "SROCHDOGOVOR_BRIEF", m_SrochDogovor_ID_BRIEF
  End If
  node.setAttribute "NALICHSIGNALIZAZII", NalichSignalizazii
  node.setAttribute "TIPSIGNALIZAZII", m_TipSignalizazii_ID
  If Not (TipSignalizazii Is Nothing) Then
    node.setAttribute "TIPSIGNALIZAZII_BRIEF", TipSignalizazii.Brief
  Else
    node.setAttribute "TIPSIGNALIZAZII_BRIEF", m_TipSignalizazii_ID_BRIEF
  End If
  node.setAttribute "PAKETYSL", m_PaketYsl_ID
  If Not (PaketYsl Is Nothing) Then
    node.setAttribute "PAKETYSL_BRIEF", PaketYsl.Brief
  Else
    node.setAttribute "PAKETYSL_BRIEF", m_PaketYsl_ID_BRIEF
  End If
  node.setAttribute "RAYON", Rayon
  node.setAttribute "DISP", m_Disp_ID
  If Not (Disp Is Nothing) Then
    node.setAttribute "DISP_BRIEF", Disp.Brief
  Else
    node.setAttribute "DISP_BRIEF", m_Disp_ID_BRIEF
  End If
  node.setAttribute "KOORD", m_Koord_ID
  If Not (Koord Is Nothing) Then
    node.setAttribute "KOORD_BRIEF", Koord.Brief
  Else
    node.setAttribute "KOORD_BRIEF", m_Koord_ID_BRIEF
  End If
  node.setAttribute "INGENER", m_Ingener_ID
  If Not (Ingener Is Nothing) Then
    node.setAttribute "INGENER_BRIEF", Ingener.Brief
  Else
    node.setAttribute "INGENER_BRIEF", m_Ingener_ID_BRIEF
  End If
  node.setAttribute "DOCPOLYCH", DocPolych
  node.setAttribute "DATASZT", CDbl(DataSZT)
  node.setAttribute "OTKAZ", Otkaz
  node.setAttribute "OPISPROBLEM", OpisProblem
  node.setAttribute "FIODOGOVOR", FIOdogovor
  node.setAttribute "DATAINSTALL", CDbl(DataInstall)
  node.setAttribute "VKLVREESTR", VklVReestr
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
m_IsLocked = Application.MTZSession.IsLocked("TP_Zayv", id)
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
OK = Application.MTZSession.LockResource("TP_Zayv", id, Permanent)
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
Application.MTZSession.UnLockResource "TP_Zayv", id
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
CanLock = Application.MTZSession.CanLock("TP_Zayv", id)
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
If mode = "Polyc" Then
 Select Case child
End Select
End If ' mode="Polyc"
If mode = "NaIsp" Then
 Select Case child
End Select
End If ' mode="NaIsp"
If mode = "YIng" Then
 Select Case child
End Select
End If ' mode="YIng"
If mode = "PerVS" Then
 Select Case child
End Select
End If ' mode="PerVS"
If mode = "Vipol" Then
 Select Case child
End Select
End If ' mode="Vipol"
If mode = "Probl" Then
 Select Case child
End Select
End If ' mode="Probl"
If mode = "" Then
 Select Case child
 End Select
End If ' mode="" (Default)
End Sub



