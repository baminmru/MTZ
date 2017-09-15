VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "pekz_dop"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'строка раздела Дополнительные услуги
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
Private m_SRV As Object
Dim m_SRV_ID As String
Dim m_SRV_ID_BRIEF As String
Private m_Quantity As Double
Private m_EDIZM As Object
Dim m_EDIZM_ID As String
Dim m_EDIZM_ID_BRIEF As String
Private m_PathFilial As Object
Dim m_PathFilial_ID As String
Dim m_PathFilial_ID_BRIEF As String
Private m_TheComment As String
Private m_DopSupplier As Object
Dim m_DopSupplier_ID As String
Dim m_DopSupplier_ID_BRIEF As String
Private m_SupMoneyDate As Date
Private m_TheCurrency As Object
Dim m_TheCurrency_ID As String
Dim m_TheCurrency_ID_BRIEF As String
Private m_TRF As Double
Private m_Summ As Double
Private m_SummNDS As Double
Private m_SupTRF As Double
Private m_SupSumm As Double
Private m_SupSummNDS As Double
Private m_CalcWithNDS As enumBoolean
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
  PartName = "pekz_dop"
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
  m_Application.Logger.Message "pekz_dop.Init"
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
'Услуга

'Услуга
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set SRV(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SRV", SRV, NewValue
On Error Resume Next
m_SRV_ID = ""
m_SRV_ID = NewValue.id
'  set   m_SRV= newValue
End If
End Property

'Услуга
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. SRV
Public Property Get SRV() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_SRV As Object
If m_SRV_ID <> "" Then
  Set tmp_SRV = Application.FindRowObject("PEKD_SRV", m_SRV_ID)
  If tmp_SRV Is Nothing Then
    m_SRV_ID_BRIEF = ""
  Else
    m_SRV_ID_BRIEF = tmp_SRV.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PEKD_SRV" & m_SRV_ID, tmp_SRV
  Set SRV = tmp_SRV
  Exit Property
End If
  '  set SRV = m_SRV
End Property
' let
'Количество

'Количество
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Quantity(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Quantity", Quantity, NewValue

   m_Quantity = NewValue
End If
End Property

'Количество
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. Quantity
Public Property Get Quantity() As Double
 LoadFromDatabase
 AccessTime = Now

   Quantity = m_Quantity
End Property
' let
'Ед. измерения

'Ед. измерения
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set EDIZM(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "EDIZM", EDIZM, NewValue
On Error Resume Next
m_EDIZM_ID = ""
m_EDIZM_ID = NewValue.id
'  set   m_EDIZM= newValue
End If
End Property

'Ед. измерения
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. EDIZM
Public Property Get EDIZM() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_EDIZM As Object
If m_EDIZM_ID <> "" Then
  Set tmp_EDIZM = Application.FindRowObject("ENTDIC_EDIZM", m_EDIZM_ID)
  If tmp_EDIZM Is Nothing Then
    m_EDIZM_ID_BRIEF = ""
  Else
    m_EDIZM_ID_BRIEF = tmp_EDIZM.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "ENTDIC_EDIZM" & m_EDIZM_ID, tmp_EDIZM
  Set EDIZM = tmp_EDIZM
  Exit Property
End If
  '  set EDIZM = m_EDIZM
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
Public Property Set PathFilial(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PathFilial", PathFilial, NewValue
On Error Resume Next
m_PathFilial_ID = ""
m_PathFilial_ID = NewValue.id
'  set   m_PathFilial= newValue
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
' Set variable = me. PathFilial
Public Property Get PathFilial() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_PathFilial As Object
If m_PathFilial_ID <> "" Then
  Set tmp_PathFilial = Application.FindRowObject("PEKD_DEPT", m_PathFilial_ID)
  If tmp_PathFilial Is Nothing Then
    m_PathFilial_ID_BRIEF = ""
  Else
    m_PathFilial_ID_BRIEF = tmp_PathFilial.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PEKD_DEPT" & m_PathFilial_ID, tmp_PathFilial
  Set PathFilial = tmp_PathFilial
  Exit Property
End If
  '  set PathFilial = m_PathFilial
End Property
' let
'Примечание

'Примечание
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

'Примечание
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
Public Property Set DopSupplier(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DopSupplier", DopSupplier, NewValue
On Error Resume Next
m_DopSupplier_ID = ""
m_DopSupplier_ID = NewValue.id
' set   m_DopSupplier= newValue
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
' Set variable = me. DopSupplier
Public Property Get DopSupplier() As Object
 LoadFromDatabase
 AccessTime = Now
If m_DopSupplier_ID <> "" Then
  Set DopSupplier = Application.Manager.GetInstanceObject(Right(m_DopSupplier_ID, 38))
 Exit Property
End If
  ' set DopSupplier = m_DopSupplier
End Property
' let
'Cписание денежных средств поставщиком

'Cписание денежных средств поставщиком
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let SupMoneyDate(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SupMoneyDate", SupMoneyDate, NewValue

   m_SupMoneyDate = NewValue
End If
End Property

'Cписание денежных средств поставщиком
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. SupMoneyDate
Public Property Get SupMoneyDate() As Date
 LoadFromDatabase
 AccessTime = Now

   SupMoneyDate = m_SupMoneyDate
End Property
' let
'Валюта

'Валюта
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

'Валюта
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
'Тариф

'Тариф
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TRF(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TRF", TRF, NewValue

   m_TRF = NewValue
End If
End Property

'Тариф
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. TRF
Public Property Get TRF() As Double
 LoadFromDatabase
 AccessTime = Now

   TRF = m_TRF
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
'Тариф поставщика

'Тариф поставщика
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let SupTRF(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SupTRF", SupTRF, NewValue

   m_SupTRF = NewValue
End If
End Property

'Тариф поставщика
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. SupTRF
Public Property Get SupTRF() As Double
 LoadFromDatabase
 AccessTime = Now

   SupTRF = m_SupTRF
End Property
' let
'Сумма поставщику без НДС

'Сумма поставщику без НДС
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let SupSumm(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SupSumm", SupSumm, NewValue

   m_SupSumm = NewValue
End If
End Property

'Сумма поставщику без НДС
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. SupSumm
Public Property Get SupSumm() As Double
 LoadFromDatabase
 AccessTime = Now

   SupSumm = m_SupSumm
End Property
' let
'Сумма поставщику с НДС

'Сумма поставщику с НДС
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let SupSummNDS(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SupSummNDS", SupSummNDS, NewValue

   m_SupSummNDS = NewValue
End If
End Property

'Сумма поставщику с НДС
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. SupSummNDS
Public Property Get SupSummNDS() As Double
 LoadFromDatabase
 AccessTime = Now

   SupSummNDS = m_SupSummNDS
End Property
' let
'Расчет с НДС

'Расчет с НДС
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let CalcWithNDS(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CalcWithNDS", CalcWithNDS, NewValue

   m_CalcWithNDS = NewValue
End If
End Property

'Расчет с НДС
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. CalcWithNDS
Public Property Get CalcWithNDS() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   CalcWithNDS = m_CalcWithNDS
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
 ' Reference to PEKD_SRV
    If m_SRV_ID = "" Then
       Set nvi = nv.Add("SRV", "")
    Else
       Set nvi = nv.Add("SRV", m_SRV_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("Quantity", m_Quantity)
nvi.ValueType = adDouble
 ' Reference to ENTDIC_EDIZM
    If m_EDIZM_ID = "" Then
       Set nvi = nv.Add("EDIZM", "")
    Else
       Set nvi = nv.Add("EDIZM", m_EDIZM_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to PEKD_DEPT
    If m_PathFilial_ID = "" Then
       Set nvi = nv.Add("PathFilial", "")
    Else
       Set nvi = nv.Add("PathFilial", m_PathFilial_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("TheComment", m_TheComment)
 ' Reference to object
    If m_DopSupplier_ID = "" Then
       Set nvi = nv.Add("DopSupplier", "")
    Else
       Set nvi = nv.Add("DopSupplier", m_DopSupplier_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("SupMoneyDate", m_SupMoneyDate)
nvi.ValueType = adDate
 ' Reference to ENTDIC_CURRENCY
    If m_TheCurrency_ID = "" Then
       Set nvi = nv.Add("TheCurrency", "")
    Else
       Set nvi = nv.Add("TheCurrency", m_TheCurrency_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("TRF", m_TRF)
nvi.ValueType = adDouble
  Set nvi = nv.Add("Summ", m_Summ)
nvi.ValueType = adDouble
  Set nvi = nv.Add("SummNDS", m_SummNDS)
nvi.ValueType = adDouble
  Set nvi = nv.Add("SupTRF", m_SupTRF)
nvi.ValueType = adDouble
  Set nvi = nv.Add("SupSumm", m_SupSumm)
nvi.ValueType = adDouble
  Set nvi = nv.Add("SupSummNDS", m_SupSummNDS)
nvi.ValueType = adDouble
  Set nvi = nv.Add("CalcWithNDS", m_CalcWithNDS)
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
   If SRV Is Nothing Then
     m_Brief = m_Brief & "{" & m_SRV_ID_BRIEF & "}; "
   Else
     m_Brief = m_Brief & "{" & SRV.Brief & "}; "
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
  m_SRV_ID = nv.item("SRV").Value
m_Quantity = nv.item("Quantity").Value
  m_EDIZM_ID = nv.item("EDIZM").Value
  m_PathFilial_ID = nv.item("PathFilial").Value
m_TheComment = nv.item("TheComment").Value
  m_DopSupplier_ID = nv.item("DopSupplier").Value
m_SupMoneyDate = nv.item("SupMoneyDate").Value
  m_TheCurrency_ID = nv.item("TheCurrency").Value
m_TRF = nv.item("TRF").Value
m_Summ = nv.item("Summ").Value
m_SummNDS = nv.item("SummNDS").Value
m_SupTRF = nv.item("SupTRF").Value
m_SupSumm = nv.item("SupSumm").Value
m_SupSummNDS = nv.item("SupSummNDS").Value
m_CalcWithNDS = nv.item("CalcWithNDS").Value
Else

m_sequence = nv.Fields("sequence").Value
  m_SRV_ID = nv.Fields("SRV").Value
m_Quantity = nv.Fields("Quantity").Value
  m_EDIZM_ID = nv.Fields("EDIZM").Value
  m_PathFilial_ID = nv.Fields("PathFilial").Value
m_TheComment = nv.Fields("TheComment").Value
  m_DopSupplier_ID = nv.Fields("DopSupplier").Value
m_SupMoneyDate = nv.Fields("SupMoneyDate").Value
  m_TheCurrency_ID = nv.Fields("TheCurrency").Value
m_TRF = nv.Fields("TRF").Value
m_Summ = nv.Fields("Summ").Value
m_SummNDS = nv.Fields("SummNDS").Value
m_SupTRF = nv.Fields("SupTRF").Value
m_SupSumm = nv.Fields("SupSumm").Value
m_SupSummNDS = nv.Fields("SupSummNDS").Value
m_CalcWithNDS = nv.Fields("CalcWithNDS").Value
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
   Dim o As pekz_dop
   Set o = New pekz_dop
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
  err.Raise err.Number, "pekz_dop.Save", err.Description
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
  err.Raise err.Number, "pekz_dop.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("pekz_dop", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "pekz_dop.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "pekz_dop", id
Exit Sub
bye:
  err.Raise err.Number, "pekz_dop.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 m_SRV_ID = ""
 Set m_SRV = Nothing
 m_EDIZM_ID = ""
 Set m_EDIZM = Nothing
 m_PathFilial_ID = ""
 Set m_PathFilial = Nothing
 m_DopSupplier_ID = ""
 Set m_DopSupplier = Nothing
 m_TheCurrency_ID = ""
 Set m_TheCurrency = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "pekz_dop.CloseClass"
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
  Set SRV = Nothing
  m_SRV_ID = node.Attributes.getNamedItem("SRV").nodeValue
  m_SRV_ID_BRIEF = node.Attributes.getNamedItem("SRV_BRIEF").nodeValue
  Quantity = Val(Replace(node.Attributes.getNamedItem("QUANTITY").nodeValue, vbLf, vbCrLf))
  Set EDIZM = Nothing
  m_EDIZM_ID = node.Attributes.getNamedItem("EDIZM").nodeValue
  m_EDIZM_ID_BRIEF = node.Attributes.getNamedItem("EDIZM_BRIEF").nodeValue
  Set PathFilial = Nothing
  m_PathFilial_ID = node.Attributes.getNamedItem("PATHFILIAL").nodeValue
  m_PathFilial_ID_BRIEF = node.Attributes.getNamedItem("PATHFILIAL_BRIEF").nodeValue
  TheComment = Replace(node.Attributes.getNamedItem("THECOMMENT").nodeValue, vbLf, vbCrLf)
  Set DopSupplier = Nothing
  m_DopSupplier_ID = node.Attributes.getNamedItem("DOPSUPPLIER").nodeValue
  m_DopSupplier_ID_BRIEF = node.Attributes.getNamedItem("DOPSUPPLIER_BRIEF").nodeValue
  SupMoneyDate = node.Attributes.getNamedItem("SUPMONEYDATE").nodeValue
  Set TheCurrency = Nothing
  m_TheCurrency_ID = node.Attributes.getNamedItem("THECURRENCY").nodeValue
  m_TheCurrency_ID_BRIEF = node.Attributes.getNamedItem("THECURRENCY_BRIEF").nodeValue
  TRF = Val(Replace(node.Attributes.getNamedItem("TRF").nodeValue, vbLf, vbCrLf))
  Summ = Val(Replace(node.Attributes.getNamedItem("SUMM").nodeValue, vbLf, vbCrLf))
  SummNDS = Val(Replace(node.Attributes.getNamedItem("SUMMNDS").nodeValue, vbLf, vbCrLf))
  SupTRF = Val(Replace(node.Attributes.getNamedItem("SUPTRF").nodeValue, vbLf, vbCrLf))
  SupSumm = Val(Replace(node.Attributes.getNamedItem("SUPSUMM").nodeValue, vbLf, vbCrLf))
  SupSummNDS = Val(Replace(node.Attributes.getNamedItem("SUPSUMMNDS").nodeValue, vbLf, vbCrLf))
  CalcWithNDS = node.Attributes.getNamedItem("CALCWITHNDS").nodeValue
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
  node.setAttribute "SRV", m_SRV_ID
  If Not (SRV Is Nothing) Then
    node.setAttribute "SRV_BRIEF", SRV.Brief
  Else
    node.setAttribute "SRV_BRIEF", m_SRV_ID_BRIEF
  End If
  node.setAttribute "QUANTITY", Replace(CStr(Quantity), ",", ".")
  node.setAttribute "EDIZM", m_EDIZM_ID
  If Not (EDIZM Is Nothing) Then
    node.setAttribute "EDIZM_BRIEF", EDIZM.Brief
  Else
    node.setAttribute "EDIZM_BRIEF", m_EDIZM_ID_BRIEF
  End If
  node.setAttribute "PATHFILIAL", m_PathFilial_ID
  If Not (PathFilial Is Nothing) Then
    node.setAttribute "PATHFILIAL_BRIEF", PathFilial.Brief
  Else
    node.setAttribute "PATHFILIAL_BRIEF", m_PathFilial_ID_BRIEF
  End If
  node.setAttribute "THECOMMENT", TheComment
  node.setAttribute "DOPSUPPLIER", m_DopSupplier_ID
  If Not (DopSupplier Is Nothing) Then
    node.setAttribute "DOPSUPPLIER_BRIEF", DopSupplier.Brief
  Else
    node.setAttribute "DOPSUPPLIER_BRIEF", m_DopSupplier_ID_BRIEF
  End If
  node.setAttribute "SUPMONEYDATE", CDbl(SupMoneyDate)
  node.setAttribute "THECURRENCY", m_TheCurrency_ID
  If Not (TheCurrency Is Nothing) Then
    node.setAttribute "THECURRENCY_BRIEF", TheCurrency.Brief
  Else
    node.setAttribute "THECURRENCY_BRIEF", m_TheCurrency_ID_BRIEF
  End If
  node.setAttribute "TRF", Replace(CStr(TRF), ",", ".")
  node.setAttribute "SUMM", Replace(CStr(Summ), ",", ".")
  node.setAttribute "SUMMNDS", Replace(CStr(SummNDS), ",", ".")
  node.setAttribute "SUPTRF", Replace(CStr(SupTRF), ",", ".")
  node.setAttribute "SUPSUMM", Replace(CStr(SupSumm), ",", ".")
  node.setAttribute "SUPSUMMNDS", Replace(CStr(SupSummNDS), ",", ".")
  node.setAttribute "CALCWITHNDS", CalcWithNDS
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
m_IsLocked = Application.MTZSession.IsLocked("pekz_dop", id)
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
OK = Application.MTZSession.LockResource("pekz_dop", id, Permanent)
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
Application.MTZSession.UnLockResource "pekz_dop", id
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
CanLock = Application.MTZSession.CanLock("pekz_dop", id)
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



