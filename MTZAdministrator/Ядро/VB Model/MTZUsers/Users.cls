VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Users"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'строка раздела Пользователи
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
Private m_Family As String
Private m_Name As String
Private m_SurName As String
Private m_Login As String
Private m_Password As String
Private m_DomaiName As String
Private m_EMail As String
Private m_Phone As String
Private m_LocalPhone As String
Private m_MobilePhone As String
Private m_Photo As Variant
Private m_BirthDay As Date
Private m_Activity As Object
Dim m_Activity_ID As String
Dim m_Activity_ID_BRIEF As String
Private m_CertificateID As String
Private m_CertData As String
Private m_ClientDef As Object
Dim m_ClientDef_ID As String
Dim m_ClientDef_ID_BRIEF As String
Private m_PersonaData As Object
Dim m_PersonaData_ID As String
Dim m_PersonaData_ID_BRIEF As String
Private m_PositionU As String
Private m_WorkPlace As String
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
  PartName = "Users"
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
  m_Application.Logger.Message "Users.Init"
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
'Фамилия

'Фамилия
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Family(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Family", Family, NewValue

   m_Family = NewValue
End If
End Property

'Фамилия
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. Family
Public Property Get Family() As String
 LoadFromDatabase
 AccessTime = Now

   Family = m_Family
End Property
' let
'Имя

'Имя
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Name(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Name", Name, NewValue

   m_Name = NewValue
End If
End Property

'Имя
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. Name
Public Property Get Name() As String
 LoadFromDatabase
 AccessTime = Now

   Name = m_Name
End Property
' let
'Отчество

'Отчество
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let SurName(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SurName", SurName, NewValue

   m_SurName = NewValue
End If
End Property

'Отчество
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. SurName
Public Property Get SurName() As String
 LoadFromDatabase
 AccessTime = Now

   SurName = m_SurName
End Property
' let
'Имя для входа

'Имя для входа
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Login(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Login", Login, NewValue

   m_Login = NewValue
End If
End Property

'Имя для входа
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. Login
Public Property Get Login() As String
 LoadFromDatabase
 AccessTime = Now

   Login = m_Login
End Property
' let
'Пароль

'Пароль
'Parameters:
'[IN]   newValue , тип параметра: string  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Password(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Password", Password, NewValue

   m_Password = NewValue
End If
End Property

'Пароль
'Parameters:
' параметров нет
'Returns:
'  значение типа string
'See Also:
'Example:
' dim variable as string
' variable = me. Password
Public Property Get Password() As String
 LoadFromDatabase
 AccessTime = Now

   Password = m_Password
End Property
' let
'Доменное имя

'Доменное имя
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DomaiName(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DomaiName", DomaiName, NewValue

   m_DomaiName = NewValue
End If
End Property

'Доменное имя
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. DomaiName
Public Property Get DomaiName() As String
 LoadFromDatabase
 AccessTime = Now

   DomaiName = m_DomaiName
End Property
' let
'e-mail

'e-mail
'Parameters:
'[IN]   newValue , тип параметра: string  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let EMail(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "EMail", EMail, NewValue

   m_EMail = NewValue
End If
End Property

'e-mail
'Parameters:
' параметров нет
'Returns:
'  значение типа string
'See Also:
'Example:
' dim variable as string
' variable = me. EMail
Public Property Get EMail() As String
 LoadFromDatabase
 AccessTime = Now

   EMail = m_EMail
End Property
' let
'Телефон

'Телефон
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Phone(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Phone", Phone, NewValue

   m_Phone = NewValue
End If
End Property

'Телефон
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. Phone
Public Property Get Phone() As String
 LoadFromDatabase
 AccessTime = Now

   Phone = m_Phone
End Property
' let
'Местный телефон

'Местный телефон
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let LocalPhone(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "LocalPhone", LocalPhone, NewValue

   m_LocalPhone = NewValue
End If
End Property

'Местный телефон
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. LocalPhone
Public Property Get LocalPhone() As String
 LoadFromDatabase
 AccessTime = Now

   LocalPhone = m_LocalPhone
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
Public Property Let MobilePhone(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "MobilePhone", MobilePhone, NewValue

   m_MobilePhone = NewValue
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
' variable = me. MobilePhone
Public Property Get MobilePhone() As String
 LoadFromDatabase
 AccessTime = Now

   MobilePhone = m_MobilePhone
End Property
' let
'Фото

'Фото
'Parameters:
'[IN]   newValue , тип параметра: VARIANT  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Photo(ByVal NewValue As Variant)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Photo", Photo, NewValue

   m_Photo = NewValue
End If
End Property

'Фото
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
' dim variable as VARIANT
' variable = me. Photo
' Set variable = me. Photo
Public Property Get Photo() As Variant
 LoadFromDatabase
 AccessTime = Now

   Photo = m_Photo
End Property
' let
'Дата рождения

'Дата рождения
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let BirthDay(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "BirthDay", BirthDay, NewValue

   m_BirthDay = NewValue
End If
End Property

'Дата рождения
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. BirthDay
Public Property Get BirthDay() As Date
 LoadFromDatabase
 AccessTime = Now

   BirthDay = m_BirthDay
End Property
' let
'Журнал активности

'Журнал активности
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set Activity(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Activity", Activity, NewValue
On Error Resume Next
m_Activity_ID = ""
m_Activity_ID = NewValue.id
' set   m_Activity= newValue
End If
End Property

'Журнал активности
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Activity
Public Property Get Activity() As Object
 LoadFromDatabase
 AccessTime = Now
If m_Activity_ID <> "" Then
  Set Activity = Application.Manager.GetInstanceObject(Right(m_Activity_ID, 38))
 Exit Property
End If
  ' set Activity = m_Activity
End Property
' let
'CertificateID

'CertificateID
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let CertificateID(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CertificateID", CertificateID, NewValue

   m_CertificateID = NewValue
End If
End Property

'CertificateID
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. CertificateID
Public Property Get CertificateID() As String
 LoadFromDatabase
 AccessTime = Now

   CertificateID = m_CertificateID
End Property
' let
'CertData

'CertData
'Parameters:
'[IN]   newValue , тип параметра: STRING  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let CertData(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CertData", CertData, NewValue

   m_CertData = NewValue
End If
End Property

'CertData
'Parameters:
' параметров нет
'Returns:
'  значение типа STRING
'See Also:
'Example:
' dim variable as STRING
' variable = me. CertData
Public Property Get CertData() As String
 LoadFromDatabase
 AccessTime = Now

   CertData = m_CertData
End Property
' let
'Ассоциация с клиентом

'Ассоциация с клиентом
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set ClientDef(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ClientDef", ClientDef, NewValue
On Error Resume Next
m_ClientDef_ID = ""
m_ClientDef_ID = NewValue.id
' set   m_ClientDef= newValue
End If
End Property

'Ассоциация с клиентом
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. ClientDef
Public Property Get ClientDef() As Object
 LoadFromDatabase
 AccessTime = Now
If m_ClientDef_ID <> "" Then
  Set ClientDef = Application.Manager.GetInstanceObject(Right(m_ClientDef_ID, 38))
 Exit Property
End If
  ' set ClientDef = m_ClientDef
End Property
' let
'PersonaData

'PersonaData
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set PersonaData(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PersonaData", PersonaData, NewValue
On Error Resume Next
m_PersonaData_ID = ""
m_PersonaData_ID = NewValue.id
' set   m_PersonaData= newValue
End If
End Property

'PersonaData
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. PersonaData
Public Property Get PersonaData() As Object
 LoadFromDatabase
 AccessTime = Now
If m_PersonaData_ID <> "" Then
  Set PersonaData = Application.Manager.GetInstanceObject(Right(m_PersonaData_ID, 38))
 Exit Property
End If
  ' set PersonaData = m_PersonaData
End Property
' let
'Должность

'Должность
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let PositionU(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PositionU", PositionU, NewValue

   m_PositionU = NewValue
End If
End Property

'Должность
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. PositionU
Public Property Get PositionU() As String
 LoadFromDatabase
 AccessTime = Now

   PositionU = m_PositionU
End Property
' let
'Место работы

'Место работы
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let WorkPlace(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "WorkPlace", WorkPlace, NewValue

   m_WorkPlace = NewValue
End If
End Property

'Место работы
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. WorkPlace
Public Property Get WorkPlace() As String
 LoadFromDatabase
 AccessTime = Now

   WorkPlace = m_WorkPlace
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

  Set nvi = nv.Add("Family", m_Family)
nvi.ValueSize = 255
  Set nvi = nv.Add("Name", m_Name)
nvi.ValueSize = 64
  Set nvi = nv.Add("SurName", m_SurName)
nvi.ValueSize = 255
  Set nvi = nv.Add("Login", m_Login)
nvi.ValueSize = 64
Set nvi = nv.Add("Password", m_Password)
  Set nvi = nv.Add("DomaiName", m_DomaiName)
nvi.ValueSize = 255
  Set nvi = nv.Add("EMail", m_EMail)
  Set nvi = nv.Add("Phone", m_Phone)
nvi.ValueSize = 20
  Set nvi = nv.Add("LocalPhone", m_LocalPhone)
nvi.ValueSize = 20
  Set nvi = nv.Add("MobilePhone", m_MobilePhone)
nvi.ValueSize = 20
  Set nvi = nv.Add("Photo", m_Photo)
  Set nvi = nv.Add("BirthDay", m_BirthDay)
nvi.ValueType = adDate
 ' Reference to object
    If m_Activity_ID = "" Then
       Set nvi = nv.Add("Activity", "")
    Else
       Set nvi = nv.Add("Activity", m_Activity_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("CertificateID", m_CertificateID)
nvi.ValueSize = 255
  Set nvi = nv.Add("CertData", m_CertData)
 ' Reference to object
    If m_ClientDef_ID = "" Then
       Set nvi = nv.Add("ClientDef", "")
    Else
       Set nvi = nv.Add("ClientDef", m_ClientDef_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to object
    If m_PersonaData_ID = "" Then
       Set nvi = nv.Add("PersonaData", "")
    Else
       Set nvi = nv.Add("PersonaData", m_PersonaData_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("PositionU", m_PositionU)
nvi.ValueSize = 255
  Set nvi = nv.Add("WorkPlace", m_WorkPlace)
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
 m_Brief = m_Brief & Family & "; "
 m_Brief = m_Brief & Name & "; "
 m_Brief = m_Brief & SurName & "; "
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

m_Family = nv.item("Family").Value
m_Name = nv.item("Name").Value
m_SurName = nv.item("SurName").Value
m_Login = nv.item("Login").Value
m_DomaiName = nv.item("DomaiName").Value
m_EMail = nv.item("EMail").Value
m_Phone = nv.item("Phone").Value
m_LocalPhone = nv.item("LocalPhone").Value
m_MobilePhone = nv.item("MobilePhone").Value
m_Photo = nv.item("Photo").Value
m_BirthDay = nv.item("BirthDay").Value
  m_Activity_ID = nv.item("Activity").Value
m_CertificateID = nv.item("CertificateID").Value
m_CertData = nv.item("CertData").Value
  m_ClientDef_ID = nv.item("ClientDef").Value
  m_PersonaData_ID = nv.item("PersonaData").Value
m_PositionU = nv.item("PositionU").Value
m_WorkPlace = nv.item("WorkPlace").Value
Else

m_Family = nv.Fields("Family").Value
m_Name = nv.Fields("Name").Value
m_SurName = nv.Fields("SurName").Value
m_Login = nv.Fields("Login").Value
m_DomaiName = nv.Fields("DomaiName").Value
m_EMail = nv.Fields("EMail").Value
m_Phone = nv.Fields("Phone").Value
m_LocalPhone = nv.Fields("LocalPhone").Value
m_MobilePhone = nv.Fields("MobilePhone").Value
m_Photo = nv.Fields("Photo").Value
m_BirthDay = nv.Fields("BirthDay").Value
  m_Activity_ID = nv.Fields("Activity").Value
m_CertificateID = nv.Fields("CertificateID").Value
m_CertData = nv.Fields("CertData").Value
  m_ClientDef_ID = nv.Fields("ClientDef").Value
  m_PersonaData_ID = nv.Fields("PersonaData").Value
m_PositionU = nv.Fields("PositionU").Value
m_WorkPlace = nv.Fields("WorkPlace").Value
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
   Dim o As Users
   Set o = New Users
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
  err.Raise err.Number, "Users.Save", err.Description
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
  err.Raise err.Number, "Users.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("Users", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "Users.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "Users", id
Exit Sub
bye:
  err.Raise err.Number, "Users.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 m_Activity_ID = ""
 Set m_Activity = Nothing
 m_ClientDef_ID = ""
 Set m_ClientDef = Nothing
 m_PersonaData_ID = ""
 Set m_PersonaData = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "Users.CloseClass"
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
  Family = Replace(node.Attributes.getNamedItem("FAMILY").nodeValue, vbLf, vbCrLf)
  Name = Replace(node.Attributes.getNamedItem("NAME").nodeValue, vbLf, vbCrLf)
  SurName = Replace(node.Attributes.getNamedItem("SURNAME").nodeValue, vbLf, vbCrLf)
  Login = Replace(node.Attributes.getNamedItem("LOGIN").nodeValue, vbLf, vbCrLf)
  Password = Replace(node.Attributes.getNamedItem("PASSWORD").nodeValue, vbLf, vbCrLf)
  DomaiName = Replace(node.Attributes.getNamedItem("DOMAINAME").nodeValue, vbLf, vbCrLf)
  EMail = Replace(node.Attributes.getNamedItem("EMAIL").nodeValue, vbLf, vbCrLf)
  Phone = Replace(node.Attributes.getNamedItem("PHONE").nodeValue, vbLf, vbCrLf)
  LocalPhone = Replace(node.Attributes.getNamedItem("LOCALPHONE").nodeValue, vbLf, vbCrLf)
  MobilePhone = Replace(node.Attributes.getNamedItem("MOBILEPHONE").nodeValue, vbLf, vbCrLf)
  Photo = HexToArray(node.Attributes.getNamedItem("PHOTO").nodeValue)
  BirthDay = node.Attributes.getNamedItem("BIRTHDAY").nodeValue
  Set Activity = Nothing
  m_Activity_ID = node.Attributes.getNamedItem("ACTIVITY").nodeValue
  m_Activity_ID_BRIEF = node.Attributes.getNamedItem("ACTIVITY_BRIEF").nodeValue
  CertificateID = Replace(node.Attributes.getNamedItem("CERTIFICATEID").nodeValue, vbLf, vbCrLf)
  CertData = Replace(node.Attributes.getNamedItem("CERTDATA").nodeValue, vbLf, vbCrLf)
  Set ClientDef = Nothing
  m_ClientDef_ID = node.Attributes.getNamedItem("CLIENTDEF").nodeValue
  m_ClientDef_ID_BRIEF = node.Attributes.getNamedItem("CLIENTDEF_BRIEF").nodeValue
  Set PersonaData = Nothing
  m_PersonaData_ID = node.Attributes.getNamedItem("PERSONADATA").nodeValue
  m_PersonaData_ID_BRIEF = node.Attributes.getNamedItem("PERSONADATA_BRIEF").nodeValue
  PositionU = Replace(node.Attributes.getNamedItem("POSITIONU").nodeValue, vbLf, vbCrLf)
  WorkPlace = Replace(node.Attributes.getNamedItem("WORKPLACE").nodeValue, vbLf, vbCrLf)
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
  node.setAttribute "FAMILY", Family
  node.setAttribute "NAME", Name
  node.setAttribute "SURNAME", SurName
  node.setAttribute "LOGIN", Login
  node.setAttribute "PASSWORD", Password
  node.setAttribute "DOMAINAME", DomaiName
  node.setAttribute "EMAIL", EMail
  node.setAttribute "PHONE", Phone
  node.setAttribute "LOCALPHONE", LocalPhone
  node.setAttribute "MOBILEPHONE", MobilePhone
  node.setAttribute "PHOTO", ArrayToHex(Photo)
  node.setAttribute "BIRTHDAY", CDbl(BirthDay)
  node.setAttribute "ACTIVITY", m_Activity_ID
  If Not (Activity Is Nothing) Then
    node.setAttribute "ACTIVITY_BRIEF", Activity.Brief
  Else
    node.setAttribute "ACTIVITY_BRIEF", m_Activity_ID_BRIEF
  End If
  node.setAttribute "CERTIFICATEID", CertificateID
  node.setAttribute "CERTDATA", CertData
  node.setAttribute "CLIENTDEF", m_ClientDef_ID
  If Not (ClientDef Is Nothing) Then
    node.setAttribute "CLIENTDEF_BRIEF", ClientDef.Brief
  Else
    node.setAttribute "CLIENTDEF_BRIEF", m_ClientDef_ID_BRIEF
  End If
  node.setAttribute "PERSONADATA", m_PersonaData_ID
  If Not (PersonaData Is Nothing) Then
    node.setAttribute "PERSONADATA_BRIEF", PersonaData.Brief
  Else
    node.setAttribute "PERSONADATA_BRIEF", m_PersonaData_ID_BRIEF
  End If
  node.setAttribute "POSITIONU", PositionU
  node.setAttribute "WORKPLACE", WorkPlace
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
m_IsLocked = Application.MTZSession.IsLocked("Users", id)
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
OK = Application.MTZSession.LockResource("Users", id, Permanent)
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
Application.MTZSession.UnLockResource "Users", id
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
CanLock = Application.MTZSession.CanLock("Users", id)
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



