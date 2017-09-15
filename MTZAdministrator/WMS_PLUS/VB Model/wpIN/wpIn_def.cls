VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "wpIn_def"
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
Private m_TheCLient As Object
Dim m_TheCLient_ID As String
Dim m_TheCLient_ID_BRIEF As String
Private m_TheDogovor As Object
Dim m_TheDogovor_ID As String
Dim m_TheDogovor_ID_BRIEF As String
Private m_TheNumber As Long
Private m_TheDate As Date
Private m_TheComment As String
Private m_Supplier As String
Private m_CarNum As String
Private m_Car2Num As String
Private m_TheContainer As String
Private m_TTNNum As String
Private m_TTNDate As Date
Private m_PlombNum As String
Private m_CarInTime As Date
Private m_CarOutTime As Date
Private m_S_code As String
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
  PartName = "wpIn_def"
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
  m_Application.Logger.Message "wpIn_def.Init"
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
'Клиент

'Клиент
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TheCLient(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheCLient", TheCLient, NewValue
On Error Resume Next
m_TheCLient_ID = ""
m_TheCLient_ID = NewValue.id
'  set   m_TheCLient= newValue
End If
End Property

'Клиент
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TheCLient
Public Property Get TheCLient() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TheCLient As Object
If m_TheCLient_ID <> "" Then
  Set tmp_TheCLient = Application.FindRowObject("wpCli_def", m_TheCLient_ID)
  If tmp_TheCLient Is Nothing Then
    m_TheCLient_ID_BRIEF = ""
  Else
    m_TheCLient_ID_BRIEF = tmp_TheCLient.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "wpCli_def" & m_TheCLient_ID, tmp_TheCLient
  Set TheCLient = tmp_TheCLient
  Exit Property
End If
  '  set TheCLient = m_TheCLient
End Property
' let
'Договор

'Договор
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TheDogovor(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheDogovor", TheDogovor, NewValue
On Error Resume Next
m_TheDogovor_ID = ""
m_TheDogovor_ID = NewValue.id
'  set   m_TheDogovor= newValue
End If
End Property

'Договор
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TheDogovor
Public Property Get TheDogovor() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TheDogovor As Object
If m_TheDogovor_ID <> "" Then
  Set tmp_TheDogovor = Application.FindRowObject("wpDog_def", m_TheDogovor_ID)
  If tmp_TheDogovor Is Nothing Then
    m_TheDogovor_ID_BRIEF = ""
  Else
    m_TheDogovor_ID_BRIEF = tmp_TheDogovor.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "wpDog_def" & m_TheDogovor_ID, tmp_TheDogovor
  Set TheDogovor = tmp_TheDogovor
  Exit Property
End If
  '  set TheDogovor = m_TheDogovor
End Property
' let
'Номер заказа

'Номер заказа
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TheNumber(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheNumber", TheNumber, NewValue

   m_TheNumber = NewValue
End If
End Property

'Номер заказа
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. TheNumber
Public Property Get TheNumber() As Long
 LoadFromDatabase
 AccessTime = Now

   TheNumber = m_TheNumber
End Property
' let
'Дата заказа

'Дата заказа
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TheDate(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheDate", TheDate, NewValue

   m_TheDate = NewValue
End If
End Property

'Дата заказа
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. TheDate
Public Property Get TheDate() As Date
 LoadFromDatabase
 AccessTime = Now

   TheDate = m_TheDate
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
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Supplier(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Supplier", Supplier, NewValue

   m_Supplier = NewValue
End If
End Property

'Поставщик
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. Supplier
Public Property Get Supplier() As String
 LoadFromDatabase
 AccessTime = Now

   Supplier = m_Supplier
End Property
' let
'Номер ТС

'Номер ТС
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let CarNum(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CarNum", CarNum, NewValue

   m_CarNum = NewValue
End If
End Property

'Номер ТС
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. CarNum
Public Property Get CarNum() As String
 LoadFromDatabase
 AccessTime = Now

   CarNum = m_CarNum
End Property
' let
'Номер прицепа

'Номер прицепа
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Car2Num(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Car2Num", Car2Num, NewValue

   m_Car2Num = NewValue
End If
End Property

'Номер прицепа
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. Car2Num
Public Property Get Car2Num() As String
 LoadFromDatabase
 AccessTime = Now

   Car2Num = m_Car2Num
End Property
' let
'Номер контейнера

'Номер контейнера
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TheContainer(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheContainer", TheContainer, NewValue

   m_TheContainer = NewValue
End If
End Property

'Номер контейнера
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. TheContainer
Public Property Get TheContainer() As String
 LoadFromDatabase
 AccessTime = Now

   TheContainer = m_TheContainer
End Property
' let
'Номер ТТН

'Номер ТТН
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TTNNum(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TTNNum", TTNNum, NewValue

   m_TTNNum = NewValue
End If
End Property

'Номер ТТН
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. TTNNum
Public Property Get TTNNum() As String
 LoadFromDatabase
 AccessTime = Now

   TTNNum = m_TTNNum
End Property
' let
'Дата ТТН

'Дата ТТН
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TTNDate(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TTNDate", TTNDate, NewValue

   m_TTNDate = NewValue
End If
End Property

'Дата ТТН
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. TTNDate
Public Property Get TTNDate() As Date
 LoadFromDatabase
 AccessTime = Now

   TTNDate = m_TTNDate
End Property
' let
'Номер пломбы

'Номер пломбы
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let PlombNum(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PlombNum", PlombNum, NewValue

   m_PlombNum = NewValue
End If
End Property

'Номер пломбы
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. PlombNum
Public Property Get PlombNum() As String
 LoadFromDatabase
 AccessTime = Now

   PlombNum = m_PlombNum
End Property
' let
'Время прибытия машины

'Время прибытия машины
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let CarInTime(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CarInTime", CarInTime, NewValue

   m_CarInTime = NewValue
End If
End Property

'Время прибытия машины
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. CarInTime
Public Property Get CarInTime() As Date
 LoadFromDatabase
 AccessTime = Now

   CarInTime = m_CarInTime
End Property
' let
'Время убытия машины

'Время убытия машины
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let CarOutTime(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CarOutTime", CarOutTime, NewValue

   m_CarOutTime = NewValue
End If
End Property

'Время убытия машины
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. CarOutTime
Public Property Get CarOutTime() As Date
 LoadFromDatabase
 AccessTime = Now

   CarOutTime = m_CarOutTime
End Property
' let
'Штрихкод

'Штрихкод
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let S_code(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "S_code", S_code, NewValue

   m_S_code = NewValue
End If
End Property

'Штрихкод
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. S_code
Public Property Get S_code() As String
 LoadFromDatabase
 AccessTime = Now

   S_code = m_S_code
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

 ' Reference to wpCli_def
    If m_TheCLient_ID = "" Then
       Set nvi = nv.Add("TheCLient", "")
    Else
       Set nvi = nv.Add("TheCLient", m_TheCLient_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to wpDog_def
    If m_TheDogovor_ID = "" Then
       Set nvi = nv.Add("TheDogovor", "")
    Else
       Set nvi = nv.Add("TheDogovor", m_TheDogovor_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("TheNumber", m_TheNumber)
nvi.ValueType = adInteger
  Set nvi = nv.Add("TheDate", m_TheDate)
nvi.ValueType = adDate
  Set nvi = nv.Add("TheComment", m_TheComment)
  Set nvi = nv.Add("Supplier", m_Supplier)
nvi.ValueSize = 255
  Set nvi = nv.Add("CarNum", m_CarNum)
nvi.ValueSize = 20
  Set nvi = nv.Add("Car2Num", m_Car2Num)
nvi.ValueSize = 20
  Set nvi = nv.Add("TheContainer", m_TheContainer)
nvi.ValueSize = 20
  Set nvi = nv.Add("TTNNum", m_TTNNum)
nvi.ValueSize = 50
  Set nvi = nv.Add("TTNDate", m_TTNDate)
nvi.ValueType = adDate
  Set nvi = nv.Add("PlombNum", m_PlombNum)
nvi.ValueSize = 50
  Set nvi = nv.Add("CarInTime", m_CarInTime)
nvi.ValueType = adDBTimeStamp
  Set nvi = nv.Add("CarOutTime", m_CarOutTime)
nvi.ValueType = adDBTimeStamp
  Set nvi = nv.Add("S_code", m_S_code)
nvi.ValueSize = 30
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
 m_Brief = m_Brief & TheNumber & "; "
 m_Brief = m_Brief & TheDate & "; "
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

  m_TheCLient_ID = nv.item("TheCLient").Value
  m_TheDogovor_ID = nv.item("TheDogovor").Value
m_TheNumber = nv.item("TheNumber").Value
m_TheDate = nv.item("TheDate").Value
m_TheComment = nv.item("TheComment").Value
m_Supplier = nv.item("Supplier").Value
m_CarNum = nv.item("CarNum").Value
m_Car2Num = nv.item("Car2Num").Value
m_TheContainer = nv.item("TheContainer").Value
m_TTNNum = nv.item("TTNNum").Value
m_TTNDate = nv.item("TTNDate").Value
m_PlombNum = nv.item("PlombNum").Value
m_CarInTime = nv.item("CarInTime").Value
m_CarOutTime = nv.item("CarOutTime").Value
m_S_code = nv.item("S_code").Value
Else

  m_TheCLient_ID = nv.Fields("TheCLient").Value
  m_TheDogovor_ID = nv.Fields("TheDogovor").Value
m_TheNumber = nv.Fields("TheNumber").Value
m_TheDate = nv.Fields("TheDate").Value
m_TheComment = nv.Fields("TheComment").Value
m_Supplier = nv.Fields("Supplier").Value
m_CarNum = nv.Fields("CarNum").Value
m_Car2Num = nv.Fields("Car2Num").Value
m_TheContainer = nv.Fields("TheContainer").Value
m_TTNNum = nv.Fields("TTNNum").Value
m_TTNDate = nv.Fields("TTNDate").Value
m_PlombNum = nv.Fields("PlombNum").Value
m_CarInTime = nv.Fields("CarInTime").Value
m_CarOutTime = nv.Fields("CarOutTime").Value
m_S_code = nv.Fields("S_code").Value
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
   Dim o As wpIn_def
   Set o = New wpIn_def
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
  err.Raise err.Number, "wpIn_def.Save", err.Description
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
  err.Raise err.Number, "wpIn_def.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("wpIn_def", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "wpIn_def.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "wpIn_def", id
Exit Sub
bye:
  err.Raise err.Number, "wpIn_def.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 m_TheCLient_ID = ""
 Set m_TheCLient = Nothing
 m_TheDogovor_ID = ""
 Set m_TheDogovor = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "wpIn_def.CloseClass"
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
  Set TheCLient = Nothing
  m_TheCLient_ID = node.Attributes.getNamedItem("THECLIENT").nodeValue
  m_TheCLient_ID_BRIEF = node.Attributes.getNamedItem("THECLIENT_BRIEF").nodeValue
  Set TheDogovor = Nothing
  m_TheDogovor_ID = node.Attributes.getNamedItem("THEDOGOVOR").nodeValue
  m_TheDogovor_ID_BRIEF = node.Attributes.getNamedItem("THEDOGOVOR_BRIEF").nodeValue
  TheNumber = node.Attributes.getNamedItem("THENUMBER").nodeValue
  TheDate = node.Attributes.getNamedItem("THEDATE").nodeValue
  TheComment = Replace(node.Attributes.getNamedItem("THECOMMENT").nodeValue, vbLf, vbCrLf)
  Supplier = Replace(node.Attributes.getNamedItem("SUPPLIER").nodeValue, vbLf, vbCrLf)
  CarNum = Replace(node.Attributes.getNamedItem("CARNUM").nodeValue, vbLf, vbCrLf)
  Car2Num = Replace(node.Attributes.getNamedItem("CAR2NUM").nodeValue, vbLf, vbCrLf)
  TheContainer = Replace(node.Attributes.getNamedItem("THECONTAINER").nodeValue, vbLf, vbCrLf)
  TTNNum = Replace(node.Attributes.getNamedItem("TTNNUM").nodeValue, vbLf, vbCrLf)
  TTNDate = node.Attributes.getNamedItem("TTNDATE").nodeValue
  PlombNum = Replace(node.Attributes.getNamedItem("PLOMBNUM").nodeValue, vbLf, vbCrLf)
  CarInTime = node.Attributes.getNamedItem("CARINTIME").nodeValue
  CarOutTime = node.Attributes.getNamedItem("CAROUTTIME").nodeValue
  S_code = Replace(node.Attributes.getNamedItem("S_CODE").nodeValue, vbLf, vbCrLf)
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
  node.setAttribute "THECLIENT", m_TheCLient_ID
  If Not (TheCLient Is Nothing) Then
    node.setAttribute "THECLIENT_BRIEF", TheCLient.Brief
  Else
    node.setAttribute "THECLIENT_BRIEF", m_TheCLient_ID_BRIEF
  End If
  node.setAttribute "THEDOGOVOR", m_TheDogovor_ID
  If Not (TheDogovor Is Nothing) Then
    node.setAttribute "THEDOGOVOR_BRIEF", TheDogovor.Brief
  Else
    node.setAttribute "THEDOGOVOR_BRIEF", m_TheDogovor_ID_BRIEF
  End If
  node.setAttribute "THENUMBER", TheNumber
  node.setAttribute "THEDATE", CDbl(TheDate)
  node.setAttribute "THECOMMENT", TheComment
  node.setAttribute "SUPPLIER", Supplier
  node.setAttribute "CARNUM", CarNum
  node.setAttribute "CAR2NUM", Car2Num
  node.setAttribute "THECONTAINER", TheContainer
  node.setAttribute "TTNNUM", TTNNum
  node.setAttribute "TTNDATE", CDbl(TTNDate)
  node.setAttribute "PLOMBNUM", PlombNum
  node.setAttribute "CARINTIME", CDbl(CarInTime)
  node.setAttribute "CAROUTTIME", CDbl(CarOutTime)
  node.setAttribute "S_CODE", S_code
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
m_IsLocked = Application.MTZSession.IsLocked("wpIn_def", id)
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
OK = Application.MTZSession.LockResource("wpIn_def", id, Permanent)
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
Application.MTZSession.UnLockResource "wpIn_def", id
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
CanLock = Application.MTZSession.CanLock("wpIn_def", id)
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
If mode = "mnew" Then
 Select Case child
End Select
End If ' mode="mnew"
If mode = "main" Then
 Select Case child
End Select
End If ' mode="main"
If mode = "read" Then
 Select Case child
End Select
End If ' mode="read"
If mode = "" Then
 Select Case child
 End Select
End If ' mode="" (Default)
End Sub



