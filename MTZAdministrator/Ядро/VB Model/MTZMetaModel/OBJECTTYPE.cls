VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "OBJECTTYPE"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'строка раздела Тип объекта (карточки)
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
Private m_PART As PART_col
Private m_INSTANCEVALIDATOR As INSTANCEVALIDATOR_col
Private m_OBJSTATUS As OBJSTATUS_col
Private m_OBJECTMODE As OBJECTMODE_col
Private m_TYPEMENU As TYPEMENU_col
Private m_Package As Object
Dim m_Package_ID As String
Dim m_Package_ID_BRIEF As String
Private m_the_Comment As String
Private m_Name As String
Private m_IsSingleInstance As enumBoolean
Private m_ChooseView As Object
Dim m_ChooseView_ID As String
Dim m_ChooseView_ID_BRIEF As String
Private m_OnRun As Object
Dim m_OnRun_ID As String
Dim m_OnRun_ID_BRIEF As String
Private m_OnCreate As Object
Dim m_OnCreate_ID As String
Dim m_OnCreate_ID_BRIEF As String
Private m_OnDelete As Object
Dim m_OnDelete_ID As String
Dim m_OnDelete_ID_BRIEF As String
Private m_AllowRefToObject As enumBoolean
Private m_AllowSearch As enumBoolean
Private m_ReplicaType As enumReplicationType
Private m_TheComment As String
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
  PartName = "OBJECTTYPE"
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
  m_Application.Logger.Message "OBJECTTYPE.Init"
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

'Данные дочернего раздела Раздел
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса PART_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as PART_col
' Set variable = me. PART (...параметры...)
Public Property Get PART(Optional ByVal Refresh As Boolean = True) As PART_col
 If m_PART Is Nothing Then
   Set m_PART = New PART_col
   Set m_PART.Parent = Me
   Set m_PART.Application = Me.Application
   If Refresh Then m_PART.Refresh
 End If
 Set PART = m_PART
End Property

'Данные дочернего раздела Проверка правильности
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса INSTANCEVALIDATOR_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as INSTANCEVALIDATOR_col
' Set variable = me. INSTANCEVALIDATOR (...параметры...)
Public Property Get INSTANCEVALIDATOR(Optional ByVal Refresh As Boolean = True) As INSTANCEVALIDATOR_col
 If m_INSTANCEVALIDATOR Is Nothing Then
   Set m_INSTANCEVALIDATOR = New INSTANCEVALIDATOR_col
   Set m_INSTANCEVALIDATOR.Parent = Me
   Set m_INSTANCEVALIDATOR.Application = Me.Application
   If Refresh Then m_INSTANCEVALIDATOR.Refresh
 End If
 Set INSTANCEVALIDATOR = m_INSTANCEVALIDATOR
End Property

'Данные дочернего раздела Состояния
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса OBJSTATUS_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as OBJSTATUS_col
' Set variable = me. OBJSTATUS (...параметры...)
Public Property Get OBJSTATUS(Optional ByVal Refresh As Boolean = True) As OBJSTATUS_col
 If m_OBJSTATUS Is Nothing Then
   Set m_OBJSTATUS = New OBJSTATUS_col
   Set m_OBJSTATUS.Parent = Me
   Set m_OBJSTATUS.Application = Me.Application
   If Refresh Then m_OBJSTATUS.Refresh
 End If
 Set OBJSTATUS = m_OBJSTATUS
End Property

'Данные дочернего раздела Режим работы
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса OBJECTMODE_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as OBJECTMODE_col
' Set variable = me. OBJECTMODE (...параметры...)
Public Property Get OBJECTMODE(Optional ByVal Refresh As Boolean = True) As OBJECTMODE_col
 If m_OBJECTMODE Is Nothing Then
   Set m_OBJECTMODE = New OBJECTMODE_col
   Set m_OBJECTMODE.Parent = Me
   Set m_OBJECTMODE.Application = Me.Application
   If Refresh Then m_OBJECTMODE.Refresh
 End If
 Set OBJECTMODE = m_OBJECTMODE
End Property

'Данные дочернего раздела Методы типа
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса TYPEMENU_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as TYPEMENU_col
' Set variable = me. TYPEMENU (...параметры...)
Public Property Get TYPEMENU(Optional ByVal Refresh As Boolean = True) As TYPEMENU_col
 If m_TYPEMENU Is Nothing Then
   Set m_TYPEMENU = New TYPEMENU_col
   Set m_TYPEMENU.Parent = Me
   Set m_TYPEMENU.Application = Me.Application
   If Refresh Then m_TYPEMENU.Refresh
 End If
 Set TYPEMENU = m_TYPEMENU
End Property
' let
'Приложение

'Приложение
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set Package(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Package", Package, NewValue
On Error Resume Next
m_Package_ID = ""
m_Package_ID = NewValue.id
'  set   m_Package= newValue
End If
End Property

'Приложение
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Package
Public Property Get Package() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_Package As Object
If m_Package_ID <> "" Then
  Set tmp_Package = Application.FindRowObject("MTZAPP", m_Package_ID)
  If tmp_Package Is Nothing Then
    m_Package_ID_BRIEF = ""
  Else
    m_Package_ID_BRIEF = tmp_Package.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "MTZAPP" & m_Package_ID, tmp_Package
  Set Package = tmp_Package
  Exit Property
End If
  '  set Package = m_Package
End Property
' let
'Название

'Название
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let the_Comment(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "the_Comment", the_Comment, NewValue

   m_the_Comment = NewValue
End If
End Property

'Название
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. the_Comment
Public Property Get the_Comment() As String
 LoadFromDatabase
 AccessTime = Now

   the_Comment = m_the_Comment
End Property
' let
'Код

'Код
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

'Код
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
'Допускается только один объект

'Допускается только один объект
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IsSingleInstance(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IsSingleInstance", IsSingleInstance, NewValue

   m_IsSingleInstance = NewValue
End If
End Property

'Допускается только один объект
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. IsSingleInstance
Public Property Get IsSingleInstance() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   IsSingleInstance = m_IsSingleInstance
End Property
' let
'Представление для выбора

'Представление для выбора
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set ChooseView(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ChooseView", ChooseView, NewValue
On Error Resume Next
m_ChooseView_ID = ""
m_ChooseView_ID = NewValue.id
'  set   m_ChooseView= newValue
End If
End Property

'Представление для выбора
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. ChooseView
Public Property Get ChooseView() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_ChooseView As Object
If m_ChooseView_ID <> "" Then
  Set tmp_ChooseView = Application.FindRowObject("PARTVIEW", m_ChooseView_ID)
  If tmp_ChooseView Is Nothing Then
    m_ChooseView_ID_BRIEF = ""
  Else
    m_ChooseView_ID_BRIEF = tmp_ChooseView.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PARTVIEW" & m_ChooseView_ID, tmp_ChooseView
  Set ChooseView = tmp_ChooseView
  Exit Property
End If
  '  set ChooseView = m_ChooseView
End Property
' let
'При запуске

'При запуске
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set OnRun(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "OnRun", OnRun, NewValue
On Error Resume Next
m_OnRun_ID = ""
m_OnRun_ID = NewValue.id
'  set   m_OnRun= newValue
End If
End Property

'При запуске
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. OnRun
Public Property Get OnRun() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_OnRun As Object
If m_OnRun_ID <> "" Then
  Set tmp_OnRun = Application.FindRowObject("TYPEMENU", m_OnRun_ID)
  If tmp_OnRun Is Nothing Then
    m_OnRun_ID_BRIEF = ""
  Else
    m_OnRun_ID_BRIEF = tmp_OnRun.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "TYPEMENU" & m_OnRun_ID, tmp_OnRun
  Set OnRun = tmp_OnRun
  Exit Property
End If
  '  set OnRun = m_OnRun
End Property
' let
'При создании

'При создании
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set OnCreate(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "OnCreate", OnCreate, NewValue
On Error Resume Next
m_OnCreate_ID = ""
m_OnCreate_ID = NewValue.id
'  set   m_OnCreate= newValue
End If
End Property

'При создании
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. OnCreate
Public Property Get OnCreate() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_OnCreate As Object
If m_OnCreate_ID <> "" Then
  Set tmp_OnCreate = Application.FindRowObject("TYPEMENU", m_OnCreate_ID)
  If tmp_OnCreate Is Nothing Then
    m_OnCreate_ID_BRIEF = ""
  Else
    m_OnCreate_ID_BRIEF = tmp_OnCreate.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "TYPEMENU" & m_OnCreate_ID, tmp_OnCreate
  Set OnCreate = tmp_OnCreate
  Exit Property
End If
  '  set OnCreate = m_OnCreate
End Property
' let
'При удалении

'При удалении
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set OnDelete(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "OnDelete", OnDelete, NewValue
On Error Resume Next
m_OnDelete_ID = ""
m_OnDelete_ID = NewValue.id
'  set   m_OnDelete= newValue
End If
End Property

'При удалении
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. OnDelete
Public Property Get OnDelete() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_OnDelete As Object
If m_OnDelete_ID <> "" Then
  Set tmp_OnDelete = Application.FindRowObject("TYPEMENU", m_OnDelete_ID)
  If tmp_OnDelete Is Nothing Then
    m_OnDelete_ID_BRIEF = ""
  Else
    m_OnDelete_ID_BRIEF = tmp_OnDelete.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "TYPEMENU" & m_OnDelete_ID, tmp_OnDelete
  Set OnDelete = tmp_OnDelete
  Exit Property
End If
  '  set OnDelete = m_OnDelete
End Property
' let
'Отображать при выборе ссылки

'Отображать при выборе ссылки
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let AllowRefToObject(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "AllowRefToObject", AllowRefToObject, NewValue

   m_AllowRefToObject = NewValue
End If
End Property

'Отображать при выборе ссылки
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. AllowRefToObject
Public Property Get AllowRefToObject() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   AllowRefToObject = m_AllowRefToObject
End Property
' let
'Отображать при поиске

'Отображать при поиске
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let AllowSearch(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "AllowSearch", AllowSearch, NewValue

   m_AllowSearch = NewValue
End If
End Property

'Отображать при поиске
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. AllowSearch
Public Property Get AllowSearch() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   AllowSearch = m_AllowSearch
End Property
' let
'Тип репликации

'Тип репликации
'Parameters:
'[IN]   newValue , тип параметра: enumReplicationType  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ReplicaType(ByVal NewValue As enumReplicationType)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ReplicaType", ReplicaType, NewValue

   m_ReplicaType = NewValue
End If
End Property

'Тип репликации
'Parameters:
' параметров нет
'Returns:
'  объект класса enumReplicationType
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumReplicationType
' Set variable = me. ReplicaType
Public Property Get ReplicaType() As enumReplicationType
 LoadFromDatabase
 AccessTime = Now

   ReplicaType = m_ReplicaType
End Property
' let
'Описание

'Описание
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

'Описание
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

 ' Reference to MTZAPP
    If m_Package_ID = "" Then
       Set nvi = nv.Add("Package", "")
    Else
       Set nvi = nv.Add("Package", m_Package_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("the_Comment", m_the_Comment)
nvi.ValueSize = 255
  Set nvi = nv.Add("Name", m_Name)
nvi.ValueSize = 14
  Set nvi = nv.Add("IsSingleInstance", m_IsSingleInstance)
nvi.ValueType = adInteger
 ' Reference to PARTVIEW
    If m_ChooseView_ID = "" Then
       Set nvi = nv.Add("ChooseView", "")
    Else
       Set nvi = nv.Add("ChooseView", m_ChooseView_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to TYPEMENU
    If m_OnRun_ID = "" Then
       Set nvi = nv.Add("OnRun", "")
    Else
       Set nvi = nv.Add("OnRun", m_OnRun_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to TYPEMENU
    If m_OnCreate_ID = "" Then
       Set nvi = nv.Add("OnCreate", "")
    Else
       Set nvi = nv.Add("OnCreate", m_OnCreate_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to TYPEMENU
    If m_OnDelete_ID = "" Then
       Set nvi = nv.Add("OnDelete", "")
    Else
       Set nvi = nv.Add("OnDelete", m_OnDelete_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("AllowRefToObject", m_AllowRefToObject)
nvi.ValueType = adInteger
  Set nvi = nv.Add("AllowSearch", m_AllowSearch)
nvi.ValueType = adInteger
  Set nvi = nv.Add("ReplicaType", m_ReplicaType)
nvi.ValueType = adInteger
  Set nvi = nv.Add("TheComment", m_TheComment)
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
   If Package Is Nothing Then
     m_Brief = m_Brief & "{" & m_Package_ID_BRIEF & "}; "
   Else
     m_Brief = m_Brief & "{" & Package.Brief & "}; "
   End If
 m_Brief = m_Brief & the_Comment & "; "
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

  m_Package_ID = nv.item("Package").Value
m_the_Comment = nv.item("the_Comment").Value
m_Name = nv.item("Name").Value
m_IsSingleInstance = nv.item("IsSingleInstance").Value
  m_ChooseView_ID = nv.item("ChooseView").Value
  m_OnRun_ID = nv.item("OnRun").Value
  m_OnCreate_ID = nv.item("OnCreate").Value
  m_OnDelete_ID = nv.item("OnDelete").Value
m_AllowRefToObject = nv.item("AllowRefToObject").Value
m_AllowSearch = nv.item("AllowSearch").Value
m_ReplicaType = nv.item("ReplicaType").Value
m_TheComment = nv.item("TheComment").Value
Else

  m_Package_ID = nv.Fields("Package").Value
m_the_Comment = nv.Fields("the_Comment").Value
m_Name = nv.Fields("Name").Value
m_IsSingleInstance = nv.Fields("IsSingleInstance").Value
  m_ChooseView_ID = nv.Fields("ChooseView").Value
  m_OnRun_ID = nv.Fields("OnRun").Value
  m_OnCreate_ID = nv.Fields("OnCreate").Value
  m_OnDelete_ID = nv.Fields("OnDelete").Value
m_AllowRefToObject = nv.Fields("AllowRefToObject").Value
m_AllowSearch = nv.Fields("AllowSearch").Value
m_ReplicaType = nv.Fields("ReplicaType").Value
m_TheComment = nv.Fields("TheComment").Value
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
   Dim o As OBJECTTYPE
   Set o = New OBJECTTYPE
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
  err.Raise err.Number, "OBJECTTYPE.Save", err.Description
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
  err.Raise err.Number, "OBJECTTYPE.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("OBJECTTYPE", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "OBJECTTYPE.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "OBJECTTYPE", id
Exit Sub
bye:
  err.Raise err.Number, "OBJECTTYPE.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

If Not m_PART Is Nothing Then
  m_PART.CloseClass
  Set m_PART = Nothing
End If
If Not m_INSTANCEVALIDATOR Is Nothing Then
  m_INSTANCEVALIDATOR.CloseClass
  Set m_INSTANCEVALIDATOR = Nothing
End If
If Not m_OBJSTATUS Is Nothing Then
  m_OBJSTATUS.CloseClass
  Set m_OBJSTATUS = Nothing
End If
If Not m_OBJECTMODE Is Nothing Then
  m_OBJECTMODE.CloseClass
  Set m_OBJECTMODE = Nothing
End If
If Not m_TYPEMENU Is Nothing Then
  m_TYPEMENU.CloseClass
  Set m_TYPEMENU = Nothing
End If
 m_Package_ID = ""
 Set m_Package = Nothing
 m_ChooseView_ID = ""
 Set m_ChooseView = Nothing
 m_OnRun_ID = ""
 Set m_OnRun = Nothing
 m_OnCreate_ID = ""
 Set m_OnCreate = Nothing
 m_OnDelete_ID = ""
 Set m_OnDelete = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "OBJECTTYPE.CloseClass"
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
   Set m_FindObject = PART.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = INSTANCEVALIDATOR.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = OBJSTATUS.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = OBJECTMODE.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = TYPEMENU.FindObject(StrID, InstID)
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

PART.Compact
INSTANCEVALIDATOR.Compact
OBJSTATUS.Compact
OBJECTMODE.Compact
TYPEMENU.Compact
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
  Set Package = Nothing
  m_Package_ID = node.Attributes.getNamedItem("PACKAGE").nodeValue
  m_Package_ID_BRIEF = node.Attributes.getNamedItem("PACKAGE_BRIEF").nodeValue
  the_Comment = Replace(node.Attributes.getNamedItem("THE_COMMENT").nodeValue, vbLf, vbCrLf)
  Name = Replace(node.Attributes.getNamedItem("NAME").nodeValue, vbLf, vbCrLf)
  IsSingleInstance = node.Attributes.getNamedItem("ISSINGLEINSTANCE").nodeValue
  Set ChooseView = Nothing
  m_ChooseView_ID = node.Attributes.getNamedItem("CHOOSEVIEW").nodeValue
  m_ChooseView_ID_BRIEF = node.Attributes.getNamedItem("CHOOSEVIEW_BRIEF").nodeValue
  Set OnRun = Nothing
  m_OnRun_ID = node.Attributes.getNamedItem("ONRUN").nodeValue
  m_OnRun_ID_BRIEF = node.Attributes.getNamedItem("ONRUN_BRIEF").nodeValue
  Set OnCreate = Nothing
  m_OnCreate_ID = node.Attributes.getNamedItem("ONCREATE").nodeValue
  m_OnCreate_ID_BRIEF = node.Attributes.getNamedItem("ONCREATE_BRIEF").nodeValue
  Set OnDelete = Nothing
  m_OnDelete_ID = node.Attributes.getNamedItem("ONDELETE").nodeValue
  m_OnDelete_ID_BRIEF = node.Attributes.getNamedItem("ONDELETE_BRIEF").nodeValue
  AllowRefToObject = node.Attributes.getNamedItem("ALLOWREFTOOBJECT").nodeValue
  AllowSearch = node.Attributes.getNamedItem("ALLOWSEARCH").nodeValue
  ReplicaType = node.Attributes.getNamedItem("REPLICATYPE").nodeValue
  TheComment = Replace(node.Attributes.getNamedItem("THECOMMENT").nodeValue, vbLf, vbCrLf)
  On Error GoTo bye
  'if m_ChangeTime >= m_RetriveTime then m_Changed = true
  m_Changed = True
  m_RowRetrived = True
  m_Brief = ""
  On Error Resume Next
  Set e_list = node.selectNodes("PART_COL")
  PART.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("INSTANCEVALIDATOR_COL")
  INSTANCEVALIDATOR.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("OBJSTATUS_COL")
  OBJSTATUS.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("OBJECTMODE_COL")
  OBJECTMODE.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("TYPEMENU_COL")
  TYPEMENU.XMLLoad e_list, LoadMode
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
  node.setAttribute "PACKAGE", m_Package_ID
  If Not (Package Is Nothing) Then
    node.setAttribute "PACKAGE_BRIEF", Package.Brief
  Else
    node.setAttribute "PACKAGE_BRIEF", m_Package_ID_BRIEF
  End If
  node.setAttribute "THE_COMMENT", the_Comment
  node.setAttribute "NAME", Name
  node.setAttribute "ISSINGLEINSTANCE", IsSingleInstance
  node.setAttribute "CHOOSEVIEW", m_ChooseView_ID
  If Not (ChooseView Is Nothing) Then
    node.setAttribute "CHOOSEVIEW_BRIEF", ChooseView.Brief
  Else
    node.setAttribute "CHOOSEVIEW_BRIEF", m_ChooseView_ID_BRIEF
  End If
  node.setAttribute "ONRUN", m_OnRun_ID
  If Not (OnRun Is Nothing) Then
    node.setAttribute "ONRUN_BRIEF", OnRun.Brief
  Else
    node.setAttribute "ONRUN_BRIEF", m_OnRun_ID_BRIEF
  End If
  node.setAttribute "ONCREATE", m_OnCreate_ID
  If Not (OnCreate Is Nothing) Then
    node.setAttribute "ONCREATE_BRIEF", OnCreate.Brief
  Else
    node.setAttribute "ONCREATE_BRIEF", m_OnCreate_ID_BRIEF
  End If
  node.setAttribute "ONDELETE", m_OnDelete_ID
  If Not (OnDelete Is Nothing) Then
    node.setAttribute "ONDELETE_BRIEF", OnDelete.Brief
  Else
    node.setAttribute "ONDELETE_BRIEF", m_OnDelete_ID_BRIEF
  End If
  node.setAttribute "ALLOWREFTOOBJECT", AllowRefToObject
  node.setAttribute "ALLOWSEARCH", AllowSearch
  node.setAttribute "REPLICATYPE", ReplicaType
  node.setAttribute "THECOMMENT", TheComment
  node.setAttribute "AccessTime", CDbl(m_AccessTime)
  PART.XMLSave node, xdom
  INSTANCEVALIDATOR.XMLSave node, xdom
  OBJSTATUS.XMLSave node, xdom
  OBJECTMODE.XMLSave node, xdom
  TYPEMENU.XMLSave node, xdom
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
m_IsLocked = Application.MTZSession.IsLocked("OBJECTTYPE", id)
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
OK = Application.MTZSession.LockResource("OBJECTTYPE", id, Permanent)
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
Application.MTZSession.UnLockResource "OBJECTTYPE", id
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
CanLock = Application.MTZSession.CanLock("OBJECTTYPE", id)
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
 PART.BatchUpdate
 INSTANCEVALIDATOR.BatchUpdate
 OBJSTATUS.BatchUpdate
 OBJECTMODE.BatchUpdate
 TYPEMENU.BatchUpdate
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
  PART.LoadAll
  INSTANCEVALIDATOR.LoadAll
  OBJSTATUS.LoadAll
  OBJECTMODE.LoadAll
  TYPEMENU.LoadAll
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
 Case "PART"
    item.PART.Refresh
    For i = 1 To item.PART.Count
    nid = CreateGUID2() & item.PART.item(i).id
    tree.nodes.Add(key, 4, nid, item.PART.item(i).Brief(True)).Tag = "Row"
   ' PART
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "PART") Then
      tree.nodes.Add(nid, 4, nid & "PART", "Раздел").Tag = "PART"
      tree.nodes.Add(nid & "PART", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "PART", "Раздел").Tag = "PART"
     tree.nodes.Add(nid & "PART", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' PART
   ' PARTMENU
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "PARTMENU") Then
      tree.nodes.Add(nid, 4, nid & "PARTMENU", "Методы раздела").Tag = "PARTMENU"
      tree.nodes.Add(nid & "PARTMENU", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "PARTMENU", "Методы раздела").Tag = "PARTMENU"
     tree.nodes.Add(nid & "PARTMENU", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' PARTMENU
   ' FIELD
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "FIELD") Then
      tree.nodes.Add(nid, 4, nid & "FIELD", "Поле").Tag = "FIELD"
      tree.nodes.Add(nid & "FIELD", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "FIELD", "Поле").Tag = "FIELD"
     tree.nodes.Add(nid & "FIELD", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' FIELD
   ' PARTVIEW
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "PARTVIEW") Then
      tree.nodes.Add(nid, 4, nid & "PARTVIEW", "Представление").Tag = "PARTVIEW"
      tree.nodes.Add(nid & "PARTVIEW", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "PARTVIEW", "Представление").Tag = "PARTVIEW"
     tree.nodes.Add(nid & "PARTVIEW", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' PARTVIEW
   ' ExtenderInterface
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "ExtenderInterface") Then
      tree.nodes.Add(nid, 4, nid & "ExtenderInterface", "Интерфейсы расширения").Tag = "ExtenderInterface"
      tree.nodes.Add(nid & "ExtenderInterface", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "ExtenderInterface", "Интерфейсы расширения").Tag = "ExtenderInterface"
     tree.nodes.Add(nid & "ExtenderInterface", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' ExtenderInterface
   ' VALIDATOR
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "VALIDATOR") Then
      tree.nodes.Add(nid, 4, nid & "VALIDATOR", "Логика на форме").Tag = "VALIDATOR"
      tree.nodes.Add(nid & "VALIDATOR", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "VALIDATOR", "Логика на форме").Tag = "VALIDATOR"
     tree.nodes.Add(nid & "VALIDATOR", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' VALIDATOR
   ' UNIQUECONSTRAINT
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "UNIQUECONSTRAINT") Then
      tree.nodes.Add(nid, 4, nid & "UNIQUECONSTRAINT", "Ограничение уникальности").Tag = "UNIQUECONSTRAINT"
      tree.nodes.Add(nid & "UNIQUECONSTRAINT", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "UNIQUECONSTRAINT", "Ограничение уникальности").Tag = "UNIQUECONSTRAINT"
     tree.nodes.Add(nid & "UNIQUECONSTRAINT", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' UNIQUECONSTRAINT
    Next
 Case "INSTANCEVALIDATOR"
    item.INSTANCEVALIDATOR.Refresh
    For i = 1 To item.INSTANCEVALIDATOR.Count
    nid = CreateGUID2() & item.INSTANCEVALIDATOR.item(i).id
    tree.nodes.Add(key, 4, nid, item.INSTANCEVALIDATOR.item(i).Brief(True)).Tag = "Row"
    Next
 Case "OBJSTATUS"
    item.OBJSTATUS.Refresh
    For i = 1 To item.OBJSTATUS.Count
    nid = CreateGUID2() & item.OBJSTATUS.item(i).id
    tree.nodes.Add(key, 4, nid, item.OBJSTATUS.item(i).Brief(True)).Tag = "Row"
   ' NEXTSTATE
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "NEXTSTATE") Then
      tree.nodes.Add(nid, 4, nid & "NEXTSTATE", "Разрешенные переходы").Tag = "NEXTSTATE"
      tree.nodes.Add(nid & "NEXTSTATE", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "NEXTSTATE", "Разрешенные переходы").Tag = "NEXTSTATE"
     tree.nodes.Add(nid & "NEXTSTATE", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' NEXTSTATE
    Next
 Case "OBJECTMODE"
    item.OBJECTMODE.Refresh
    For i = 1 To item.OBJECTMODE.Count
    nid = CreateGUID2() & item.OBJECTMODE.item(i).id
    tree.nodes.Add(key, 4, nid, item.OBJECTMODE.item(i).Brief(True)).Tag = "Row"
   ' STRUCTRESTRICTION
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "STRUCTRESTRICTION") Then
      tree.nodes.Add(nid, 4, nid & "STRUCTRESTRICTION", "Органичения разделов").Tag = "STRUCTRESTRICTION"
      tree.nodes.Add(nid & "STRUCTRESTRICTION", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "STRUCTRESTRICTION", "Органичения разделов").Tag = "STRUCTRESTRICTION"
     tree.nodes.Add(nid & "STRUCTRESTRICTION", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' STRUCTRESTRICTION
   ' FIELDRESTRICTION
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "FIELDRESTRICTION") Then
      tree.nodes.Add(nid, 4, nid & "FIELDRESTRICTION", "Ограничения полей").Tag = "FIELDRESTRICTION"
      tree.nodes.Add(nid & "FIELDRESTRICTION", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "FIELDRESTRICTION", "Ограничения полей").Tag = "FIELDRESTRICTION"
     tree.nodes.Add(nid & "FIELDRESTRICTION", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' FIELDRESTRICTION
   ' METHODRESTRICTION
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "METHODRESTRICTION") Then
      tree.nodes.Add(nid, 4, nid & "METHODRESTRICTION", "Ограничения методов").Tag = "METHODRESTRICTION"
      tree.nodes.Add(nid & "METHODRESTRICTION", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "METHODRESTRICTION", "Ограничения методов").Tag = "METHODRESTRICTION"
     tree.nodes.Add(nid & "METHODRESTRICTION", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' METHODRESTRICTION
    Next
 Case "TYPEMENU"
    item.TYPEMENU.Refresh
    For i = 1 To item.TYPEMENU.Count
    nid = CreateGUID2() & item.TYPEMENU.item(i).id
    tree.nodes.Add(key, 4, nid, item.TYPEMENU.item(i).Brief(True)).Tag = "Row"
    Next
 End Select
End If ' mode="" (Default)
End Sub



