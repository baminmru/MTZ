VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "PEKZ_WLIST"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'строка раздела Весовой список ППО
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
Private m_PEKZ_WLADDS As PEKZ_WLADDS_col
Private m_sequence As Long
Private m_theWeight As Double
Private m_shCode As String
Private m_NettoWeight As Double
Private m_TNBED As String
Private m_TheCountry As Object
Dim m_TheCountry_ID As String
Dim m_TheCountry_ID_BRIEF As String
Private m_ItemPrice As Double
Private m_VozmCost As Double
Private m_TheCurrency As Object
Dim m_TheCurrency_ID As String
Dim m_TheCurrency_ID_BRIEF As String
Private m_IsPodarok As enumBoolean
Private m_IsDocument As enumBoolean
Private m_IsObrazec As enumBoolean
Private m_IsVozvrat As enumBoolean
Private m_IsProchee As enumBoolean
Private m_ItemDescription As String
Private m_QLicense As Long
Private m_QSertif As Long
Private m_OrderNum As String
Private m_QDocs As Long
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
  PartName = "PEKZ_WLIST"
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
  m_Application.Logger.Message "PEKZ_WLIST.Init"
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

'Данные дочернего раздела Надбавки
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса PEKZ_WLADDS_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as PEKZ_WLADDS_col
' Set variable = me. PEKZ_WLADDS (...параметры...)
Public Property Get PEKZ_WLADDS(Optional ByVal Refresh As Boolean = True) As PEKZ_WLADDS_col
 If m_PEKZ_WLADDS Is Nothing Then
   Set m_PEKZ_WLADDS = New PEKZ_WLADDS_col
   Set m_PEKZ_WLADDS.Parent = Me
   Set m_PEKZ_WLADDS.Application = Me.Application
   If Refresh Then m_PEKZ_WLADDS.Refresh
 End If
 Set PEKZ_WLADDS = m_PEKZ_WLADDS
End Property
' let
'№

'№
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

'№
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
'Вес

'Вес
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let theWeight(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "theWeight", theWeight, NewValue

   m_theWeight = NewValue
End If
End Property

'Вес
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. theWeight
Public Property Get theWeight() As Double
 LoadFromDatabase
 AccessTime = Now

   theWeight = m_theWeight
End Property
' let
'Штрих Код

'Штрих Код
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let shCode(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "shCode", shCode, NewValue

   m_shCode = NewValue
End If
End Property

'Штрих Код
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. shCode
Public Property Get shCode() As String
 LoadFromDatabase
 AccessTime = Now

   shCode = m_shCode
End Property
' let
'Вес нетто

'Вес нетто
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let NettoWeight(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "NettoWeight", NettoWeight, NewValue

   m_NettoWeight = NewValue
End If
End Property

'Вес нетто
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. NettoWeight
Public Property Get NettoWeight() As Double
 LoadFromDatabase
 AccessTime = Now

   NettoWeight = m_NettoWeight
End Property
' let
'Код ТНВЭД

'Код ТНВЭД
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TNBED(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TNBED", TNBED, NewValue

   m_TNBED = NewValue
End If
End Property

'Код ТНВЭД
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. TNBED
Public Property Get TNBED() As String
 LoadFromDatabase
 AccessTime = Now

   TNBED = m_TNBED
End Property
' let
'Страна происхождения

'Страна происхождения
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TheCountry(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheCountry", TheCountry, NewValue
On Error Resume Next
m_TheCountry_ID = ""
m_TheCountry_ID = NewValue.id
'  set   m_TheCountry= newValue
End If
End Property

'Страна происхождения
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TheCountry
Public Property Get TheCountry() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TheCountry As Object
If m_TheCountry_ID <> "" Then
  Set tmp_TheCountry = Application.FindRowObject("ENTDIC_COUNTRY", m_TheCountry_ID)
  If tmp_TheCountry Is Nothing Then
    m_TheCountry_ID_BRIEF = ""
  Else
    m_TheCountry_ID_BRIEF = tmp_TheCountry.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "ENTDIC_COUNTRY" & m_TheCountry_ID, tmp_TheCountry
  Set TheCountry = tmp_TheCountry
  Exit Property
End If
  '  set TheCountry = m_TheCountry
End Property
' let
'Стоимость посылки

'Стоимость посылки
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ItemPrice(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ItemPrice", ItemPrice, NewValue

   m_ItemPrice = NewValue
End If
End Property

'Стоимость посылки
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. ItemPrice
Public Property Get ItemPrice() As Double
 LoadFromDatabase
 AccessTime = Now

   ItemPrice = m_ItemPrice
End Property
' let
'Стоимость возмщения

'Стоимость возмщения
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let VozmCost(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "VozmCost", VozmCost, NewValue

   m_VozmCost = NewValue
End If
End Property

'Стоимость возмщения
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. VozmCost
Public Property Get VozmCost() As Double
 LoadFromDatabase
 AccessTime = Now

   VozmCost = m_VozmCost
End Property
' let
'Валюта стоимости

'Валюта стоимости
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TheCurrency(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheCurrency", TheCurrency, NewValue
On Error Resume Next
m_TheCurrency_ID = ""
m_TheCurrency_ID = NewValue.id
'  set   m_TheCurrency= newValue
End If
End Property

'Валюта стоимости
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TheCurrency
Public Property Get TheCurrency() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TheCurrency As Object
If m_TheCurrency_ID <> "" Then
  Set tmp_TheCurrency = Application.FindRowObject("ENTDIC_CURRENCY", m_TheCurrency_ID)
  If tmp_TheCurrency Is Nothing Then
    m_TheCurrency_ID_BRIEF = ""
  Else
    m_TheCurrency_ID_BRIEF = tmp_TheCurrency.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "ENTDIC_CURRENCY" & m_TheCurrency_ID, tmp_TheCurrency
  Set TheCurrency = tmp_TheCurrency
  Exit Property
End If
  '  set TheCurrency = m_TheCurrency
End Property
' let
'Подарок

'Подарок
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IsPodarok(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IsPodarok", IsPodarok, NewValue

   m_IsPodarok = NewValue
End If
End Property

'Подарок
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. IsPodarok
Public Property Get IsPodarok() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   IsPodarok = m_IsPodarok
End Property
' let
'Документ

'Документ
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IsDocument(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IsDocument", IsDocument, NewValue

   m_IsDocument = NewValue
End If
End Property

'Документ
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. IsDocument
Public Property Get IsDocument() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   IsDocument = m_IsDocument
End Property
' let
'Коммерческий образец

'Коммерческий образец
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IsObrazec(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IsObrazec", IsObrazec, NewValue

   m_IsObrazec = NewValue
End If
End Property

'Коммерческий образец
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. IsObrazec
Public Property Get IsObrazec() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   IsObrazec = m_IsObrazec
End Property
' let
'Возврат товара

'Возврат товара
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IsVozvrat(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IsVozvrat", IsVozvrat, NewValue

   m_IsVozvrat = NewValue
End If
End Property

'Возврат товара
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. IsVozvrat
Public Property Get IsVozvrat() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   IsVozvrat = m_IsVozvrat
End Property
' let
'Прочее отправление

'Прочее отправление
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IsProchee(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IsProchee", IsProchee, NewValue

   m_IsProchee = NewValue
End If
End Property

'Прочее отправление
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. IsProchee
Public Property Get IsProchee() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   IsProchee = m_IsProchee
End Property
' let
'Описание отправления

'Описание отправления
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ItemDescription(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ItemDescription", ItemDescription, NewValue

   m_ItemDescription = NewValue
End If
End Property

'Описание отправления
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. ItemDescription
Public Property Get ItemDescription() As String
 LoadFromDatabase
 AccessTime = Now

   ItemDescription = m_ItemDescription
End Property
' let
'Количество лицензий

'Количество лицензий
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let QLicense(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "QLicense", QLicense, NewValue

   m_QLicense = NewValue
End If
End Property

'Количество лицензий
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. QLicense
Public Property Get QLicense() As Long
 LoadFromDatabase
 AccessTime = Now

   QLicense = m_QLicense
End Property
' let
'Количество сертификатов

'Количество сертификатов
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let QSertif(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "QSertif", QSertif, NewValue

   m_QSertif = NewValue
End If
End Property

'Количество сертификатов
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. QSertif
Public Property Get QSertif() As Long
 LoadFromDatabase
 AccessTime = Now

   QSertif = m_QSertif
End Property
' let
'№ счета

'№ счета
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let OrderNum(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "OrderNum", OrderNum, NewValue

   m_OrderNum = NewValue
End If
End Property

'№ счета
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. OrderNum
Public Property Get OrderNum() As String
 LoadFromDatabase
 AccessTime = Now

   OrderNum = m_OrderNum
End Property
' let
'Количество сопроводительных документов

'Количество сопроводительных документов
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let QDocs(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "QDocs", QDocs, NewValue

   m_QDocs = NewValue
End If
End Property

'Количество сопроводительных документов
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. QDocs
Public Property Get QDocs() As Long
 LoadFromDatabase
 AccessTime = Now

   QDocs = m_QDocs
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
  Set nvi = nv.Add("theWeight", m_theWeight)
nvi.ValueType = adDouble
  Set nvi = nv.Add("shCode", m_shCode)
nvi.ValueSize = 14
  Set nvi = nv.Add("NettoWeight", m_NettoWeight)
nvi.ValueType = adDouble
  Set nvi = nv.Add("TNBED", m_TNBED)
nvi.ValueSize = 40
 ' Reference to ENTDIC_COUNTRY
    If m_TheCountry_ID = "" Then
       Set nvi = nv.Add("TheCountry", "")
    Else
       Set nvi = nv.Add("TheCountry", m_TheCountry_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("ItemPrice", m_ItemPrice)
nvi.ValueType = adDouble
  Set nvi = nv.Add("VozmCost", m_VozmCost)
nvi.ValueType = adDouble
 ' Reference to ENTDIC_CURRENCY
    If m_TheCurrency_ID = "" Then
       Set nvi = nv.Add("TheCurrency", "")
    Else
       Set nvi = nv.Add("TheCurrency", m_TheCurrency_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("IsPodarok", m_IsPodarok)
nvi.ValueType = adInteger
  Set nvi = nv.Add("IsDocument", m_IsDocument)
nvi.ValueType = adInteger
  Set nvi = nv.Add("IsObrazec", m_IsObrazec)
nvi.ValueType = adInteger
  Set nvi = nv.Add("IsVozvrat", m_IsVozvrat)
nvi.ValueType = adInteger
  Set nvi = nv.Add("IsProchee", m_IsProchee)
nvi.ValueType = adInteger
  Set nvi = nv.Add("ItemDescription", m_ItemDescription)
nvi.ValueSize = 60
  Set nvi = nv.Add("QLicense", m_QLicense)
nvi.ValueType = adInteger
  Set nvi = nv.Add("QSertif", m_QSertif)
nvi.ValueType = adInteger
  Set nvi = nv.Add("OrderNum", m_OrderNum)
nvi.ValueSize = 30
  Set nvi = nv.Add("QDocs", m_QDocs)
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
 m_Brief = m_Brief & sequence & "; "
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
m_theWeight = nv.item("theWeight").Value
m_shCode = nv.item("shCode").Value
m_NettoWeight = nv.item("NettoWeight").Value
m_TNBED = nv.item("TNBED").Value
  m_TheCountry_ID = nv.item("TheCountry").Value
m_ItemPrice = nv.item("ItemPrice").Value
m_VozmCost = nv.item("VozmCost").Value
  m_TheCurrency_ID = nv.item("TheCurrency").Value
m_IsPodarok = nv.item("IsPodarok").Value
m_IsDocument = nv.item("IsDocument").Value
m_IsObrazec = nv.item("IsObrazec").Value
m_IsVozvrat = nv.item("IsVozvrat").Value
m_IsProchee = nv.item("IsProchee").Value
m_ItemDescription = nv.item("ItemDescription").Value
m_QLicense = nv.item("QLicense").Value
m_QSertif = nv.item("QSertif").Value
m_OrderNum = nv.item("OrderNum").Value
m_QDocs = nv.item("QDocs").Value
Else

m_sequence = nv.Fields("sequence").Value
m_theWeight = nv.Fields("theWeight").Value
m_shCode = nv.Fields("shCode").Value
m_NettoWeight = nv.Fields("NettoWeight").Value
m_TNBED = nv.Fields("TNBED").Value
  m_TheCountry_ID = nv.Fields("TheCountry").Value
m_ItemPrice = nv.Fields("ItemPrice").Value
m_VozmCost = nv.Fields("VozmCost").Value
  m_TheCurrency_ID = nv.Fields("TheCurrency").Value
m_IsPodarok = nv.Fields("IsPodarok").Value
m_IsDocument = nv.Fields("IsDocument").Value
m_IsObrazec = nv.Fields("IsObrazec").Value
m_IsVozvrat = nv.Fields("IsVozvrat").Value
m_IsProchee = nv.Fields("IsProchee").Value
m_ItemDescription = nv.Fields("ItemDescription").Value
m_QLicense = nv.Fields("QLicense").Value
m_QSertif = nv.Fields("QSertif").Value
m_OrderNum = nv.Fields("OrderNum").Value
m_QDocs = nv.Fields("QDocs").Value
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
   Dim o As PEKZ_WLIST
   Set o = New PEKZ_WLIST
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
  err.Raise err.Number, "PEKZ_WLIST.Save", err.Description
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
  err.Raise err.Number, "PEKZ_WLIST.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("PEKZ_WLIST", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "PEKZ_WLIST.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "PEKZ_WLIST", id
Exit Sub
bye:
  err.Raise err.Number, "PEKZ_WLIST.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

If Not m_PEKZ_WLADDS Is Nothing Then
  m_PEKZ_WLADDS.CloseClass
  Set m_PEKZ_WLADDS = Nothing
End If
 m_TheCountry_ID = ""
 Set m_TheCountry = Nothing
 m_TheCurrency_ID = ""
 Set m_TheCurrency = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "PEKZ_WLIST.CloseClass"
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

 If m_FindObject Is Nothing Then
   Set m_FindObject = PEKZ_WLADDS.FindObject(StrID, InstID)
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

PEKZ_WLADDS.Compact
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
  theWeight = Val(Replace(node.Attributes.getNamedItem("THEWEIGHT").nodeValue, vbLf, vbCrLf))
  shCode = Replace(node.Attributes.getNamedItem("SHCODE").nodeValue, vbLf, vbCrLf)
  NettoWeight = Val(Replace(node.Attributes.getNamedItem("NETTOWEIGHT").nodeValue, vbLf, vbCrLf))
  TNBED = Replace(node.Attributes.getNamedItem("TNBED").nodeValue, vbLf, vbCrLf)
  Set TheCountry = Nothing
  m_TheCountry_ID = node.Attributes.getNamedItem("THECOUNTRY").nodeValue
  m_TheCountry_ID_BRIEF = node.Attributes.getNamedItem("THECOUNTRY_BRIEF").nodeValue
  ItemPrice = Val(Replace(node.Attributes.getNamedItem("ITEMPRICE").nodeValue, vbLf, vbCrLf))
  VozmCost = Val(Replace(node.Attributes.getNamedItem("VOZMCOST").nodeValue, vbLf, vbCrLf))
  Set TheCurrency = Nothing
  m_TheCurrency_ID = node.Attributes.getNamedItem("THECURRENCY").nodeValue
  m_TheCurrency_ID_BRIEF = node.Attributes.getNamedItem("THECURRENCY_BRIEF").nodeValue
  IsPodarok = node.Attributes.getNamedItem("ISPODAROK").nodeValue
  IsDocument = node.Attributes.getNamedItem("ISDOCUMENT").nodeValue
  IsObrazec = node.Attributes.getNamedItem("ISOBRAZEC").nodeValue
  IsVozvrat = node.Attributes.getNamedItem("ISVOZVRAT").nodeValue
  IsProchee = node.Attributes.getNamedItem("ISPROCHEE").nodeValue
  ItemDescription = Replace(node.Attributes.getNamedItem("ITEMDESCRIPTION").nodeValue, vbLf, vbCrLf)
  QLicense = node.Attributes.getNamedItem("QLICENSE").nodeValue
  QSertif = node.Attributes.getNamedItem("QSERTIF").nodeValue
  OrderNum = Replace(node.Attributes.getNamedItem("ORDERNUM").nodeValue, vbLf, vbCrLf)
  QDocs = node.Attributes.getNamedItem("QDOCS").nodeValue
  On Error GoTo bye
  'if m_ChangeTime >= m_RetriveTime then m_Changed = true
  m_Changed = True
  m_RowRetrived = True
  m_Brief = ""
  On Error Resume Next
  Set e_list = node.selectNodes("PEKZ_WLADDS_COL")
  PEKZ_WLADDS.XMLLoad e_list, LoadMode
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
  node.setAttribute "THEWEIGHT", Replace(CStr(theWeight), ",", ".")
  node.setAttribute "SHCODE", shCode
  node.setAttribute "NETTOWEIGHT", Replace(CStr(NettoWeight), ",", ".")
  node.setAttribute "TNBED", TNBED
  node.setAttribute "THECOUNTRY", m_TheCountry_ID
  If Not (TheCountry Is Nothing) Then
    node.setAttribute "THECOUNTRY_BRIEF", TheCountry.Brief
  Else
    node.setAttribute "THECOUNTRY_BRIEF", m_TheCountry_ID_BRIEF
  End If
  node.setAttribute "ITEMPRICE", Replace(CStr(ItemPrice), ",", ".")
  node.setAttribute "VOZMCOST", Replace(CStr(VozmCost), ",", ".")
  node.setAttribute "THECURRENCY", m_TheCurrency_ID
  If Not (TheCurrency Is Nothing) Then
    node.setAttribute "THECURRENCY_BRIEF", TheCurrency.Brief
  Else
    node.setAttribute "THECURRENCY_BRIEF", m_TheCurrency_ID_BRIEF
  End If
  node.setAttribute "ISPODAROK", IsPodarok
  node.setAttribute "ISDOCUMENT", IsDocument
  node.setAttribute "ISOBRAZEC", IsObrazec
  node.setAttribute "ISVOZVRAT", IsVozvrat
  node.setAttribute "ISPROCHEE", IsProchee
  node.setAttribute "ITEMDESCRIPTION", ItemDescription
  node.setAttribute "QLICENSE", QLicense
  node.setAttribute "QSERTIF", QSertif
  node.setAttribute "ORDERNUM", OrderNum
  node.setAttribute "QDOCS", QDocs
  node.setAttribute "AccessTime", CDbl(m_AccessTime)
  PEKZ_WLADDS.XMLSave node, xdom
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
m_IsLocked = Application.MTZSession.IsLocked("PEKZ_WLIST", id)
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
OK = Application.MTZSession.LockResource("PEKZ_WLIST", id, Permanent)
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
Application.MTZSession.UnLockResource "PEKZ_WLIST", id
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
CanLock = Application.MTZSession.CanLock("PEKZ_WLIST", id)
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
 PEKZ_WLADDS.BatchUpdate
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
  PEKZ_WLADDS.LoadAll
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



