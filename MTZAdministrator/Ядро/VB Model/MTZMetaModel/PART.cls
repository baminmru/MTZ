VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "PART"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'строка раздела Раздел объекта
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
Private m_PARTMENU As PARTMENU_col
Private m_FIELD As FIELD_col
Private m_PARTVIEW As PARTVIEW_col
Private m_ExtenderInterface As ExtenderInterface_col
Private m_VALIDATOR As VALIDATOR_col
Private m_UNIQUECONSTRAINT As UNIQUECONSTRAINT_col
Private m_Sequence As Long
Private m_PartType As enumPartType
Private m_Caption As String
Private m_Name As String
Private m_the_Comment As String
Private m_NoLog As enumBoolean
Private m_ManualRegister As enumBoolean
Private m_OnCreate As Object
Dim m_OnCreate_ID As String
Dim m_OnCreate_ID_BRIEF As String
Private m_OnSave As Object
Dim m_OnSave_ID As String
Dim m_OnSave_ID_BRIEF As String
Private m_OnRun As Object
Dim m_OnRun_ID As String
Dim m_OnRun_ID_BRIEF As String
Private m_OnDelete As Object
Dim m_OnDelete_ID As String
Dim m_OnDelete_ID_BRIEF As String
Private m_AddBehaivor As enumPartAddBehaivor
Private m_ExtenderObject As Object
Dim m_ExtenderObject_ID As String
Dim m_ExtenderObject_ID_BRIEF As String
Private m_shablonBrief As String
Private m_ruleBrief As String
Private m_IsJormalChange As enumBoolean
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
  PartName = "PART"
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
  m_Application.Logger.Message "PART.Init"
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

'Данные поддерева раздела Раздел
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

'Данные дочернего раздела Методы раздела
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса PARTMENU_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as PARTMENU_col
' Set variable = me. PARTMENU (...параметры...)
Public Property Get PARTMENU(Optional ByVal Refresh As Boolean = True) As PARTMENU_col
 If m_PARTMENU Is Nothing Then
   Set m_PARTMENU = New PARTMENU_col
   Set m_PARTMENU.Parent = Me
   Set m_PARTMENU.Application = Me.Application
   If Refresh Then m_PARTMENU.Refresh
 End If
 Set PARTMENU = m_PARTMENU
End Property

'Данные дочернего раздела Поле
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса FIELD_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as FIELD_col
' Set variable = me. FIELD (...параметры...)
Public Property Get FIELD(Optional ByVal Refresh As Boolean = True) As FIELD_col
 If m_FIELD Is Nothing Then
   Set m_FIELD = New FIELD_col
   Set m_FIELD.Parent = Me
   Set m_FIELD.Application = Me.Application
   If Refresh Then m_FIELD.Refresh
 End If
 Set FIELD = m_FIELD
End Property

'Данные дочернего раздела Представление
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса PARTVIEW_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as PARTVIEW_col
' Set variable = me. PARTVIEW (...параметры...)
Public Property Get PARTVIEW(Optional ByVal Refresh As Boolean = True) As PARTVIEW_col
 If m_PARTVIEW Is Nothing Then
   Set m_PARTVIEW = New PARTVIEW_col
   Set m_PARTVIEW.Parent = Me
   Set m_PARTVIEW.Application = Me.Application
   If Refresh Then m_PARTVIEW.Refresh
 End If
 Set PARTVIEW = m_PARTVIEW
End Property

'Данные дочернего раздела Интерфейсы расширения
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса ExtenderInterface_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as ExtenderInterface_col
' Set variable = me. ExtenderInterface (...параметры...)
Public Property Get ExtenderInterface(Optional ByVal Refresh As Boolean = True) As ExtenderInterface_col
 If m_ExtenderInterface Is Nothing Then
   Set m_ExtenderInterface = New ExtenderInterface_col
   Set m_ExtenderInterface.Parent = Me
   Set m_ExtenderInterface.Application = Me.Application
   If Refresh Then m_ExtenderInterface.Refresh
 End If
 Set ExtenderInterface = m_ExtenderInterface
End Property

'Данные дочернего раздела Логика на форме
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса VALIDATOR_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as VALIDATOR_col
' Set variable = me. VALIDATOR (...параметры...)
Public Property Get VALIDATOR(Optional ByVal Refresh As Boolean = True) As VALIDATOR_col
 If m_VALIDATOR Is Nothing Then
   Set m_VALIDATOR = New VALIDATOR_col
   Set m_VALIDATOR.Parent = Me
   Set m_VALIDATOR.Application = Me.Application
   If Refresh Then m_VALIDATOR.Refresh
 End If
 Set VALIDATOR = m_VALIDATOR
End Property

'Данные дочернего раздела Ограничение уникальности
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса UNIQUECONSTRAINT_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as UNIQUECONSTRAINT_col
' Set variable = me. UNIQUECONSTRAINT (...параметры...)
Public Property Get UNIQUECONSTRAINT(Optional ByVal Refresh As Boolean = True) As UNIQUECONSTRAINT_col
 If m_UNIQUECONSTRAINT Is Nothing Then
   Set m_UNIQUECONSTRAINT = New UNIQUECONSTRAINT_col
   Set m_UNIQUECONSTRAINT.Parent = Me
   Set m_UNIQUECONSTRAINT.Application = Me.Application
   If Refresh Then m_UNIQUECONSTRAINT.Refresh
 End If
 Set UNIQUECONSTRAINT = m_UNIQUECONSTRAINT
End Property
' let
'№ п/п

'№ п/п
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Sequence(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Sequence", Sequence, NewValue

   m_Sequence = NewValue
End If
End Property

'№ п/п
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. Sequence
Public Property Get Sequence() As Long
 LoadFromDatabase
 AccessTime = Now

   Sequence = m_Sequence
End Property
' let
'Тип структры

'Тип структры
'Parameters:
'[IN]   newValue , тип параметра: enumPartType  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let PartType(ByVal NewValue As enumPartType)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PartType", PartType, NewValue

   m_PartType = NewValue
End If
End Property

'Тип структры
'Parameters:
' параметров нет
'Returns:
'  объект класса enumPartType
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumPartType
' Set variable = me. PartType
Public Property Get PartType() As enumPartType
 LoadFromDatabase
 AccessTime = Now

   PartType = m_PartType
End Property
' let
'Заголовок

'Заголовок
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Caption(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Caption", Caption, NewValue

   m_Caption = NewValue
End If
End Property

'Заголовок
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. Caption
Public Property Get Caption() As String
 LoadFromDatabase
 AccessTime = Now

   Caption = m_Caption
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
Public Property Let Name(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Name", Name, NewValue

   m_Name = NewValue
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
' variable = me. Name
Public Property Get Name() As String
 LoadFromDatabase
 AccessTime = Now

   Name = m_Name
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
Public Property Let the_Comment(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "the_Comment", the_Comment, NewValue

   m_the_Comment = NewValue
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
' variable = me. the_Comment
Public Property Get the_Comment() As String
 LoadFromDatabase
 AccessTime = Now

   the_Comment = m_the_Comment
End Property
' let
'Не записывать в журнал

'Не записывать в журнал
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let NoLog(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "NoLog", NoLog, NewValue

   m_NoLog = NewValue
End If
End Property

'Не записывать в журнал
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. NoLog
Public Property Get NoLog() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   NoLog = m_NoLog
End Property
' let
'Исключить из индексирования

'Исключить из индексирования
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ManualRegister(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ManualRegister", ManualRegister, NewValue

   m_ManualRegister = NewValue
End If
End Property

'Исключить из индексирования
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. ManualRegister
Public Property Get ManualRegister() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   ManualRegister = m_ManualRegister
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
  Set tmp_OnCreate = Application.FindRowObject("PARTMENU", m_OnCreate_ID)
  If tmp_OnCreate Is Nothing Then
    m_OnCreate_ID_BRIEF = ""
  Else
    m_OnCreate_ID_BRIEF = tmp_OnCreate.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PARTMENU" & m_OnCreate_ID, tmp_OnCreate
  Set OnCreate = tmp_OnCreate
  Exit Property
End If
  '  set OnCreate = m_OnCreate
End Property
' let
'При сохранении

'При сохранении
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set OnSave(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "OnSave", OnSave, NewValue
On Error Resume Next
m_OnSave_ID = ""
m_OnSave_ID = NewValue.id
'  set   m_OnSave= newValue
End If
End Property

'При сохранении
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. OnSave
Public Property Get OnSave() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_OnSave As Object
If m_OnSave_ID <> "" Then
  Set tmp_OnSave = Application.FindRowObject("PARTMENU", m_OnSave_ID)
  If tmp_OnSave Is Nothing Then
    m_OnSave_ID_BRIEF = ""
  Else
    m_OnSave_ID_BRIEF = tmp_OnSave.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PARTMENU" & m_OnSave_ID, tmp_OnSave
  Set OnSave = tmp_OnSave
  Exit Property
End If
  '  set OnSave = m_OnSave
End Property
' let
'При открытии

'При открытии
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

'При открытии
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
  Set tmp_OnRun = Application.FindRowObject("PARTMENU", m_OnRun_ID)
  If tmp_OnRun Is Nothing Then
    m_OnRun_ID_BRIEF = ""
  Else
    m_OnRun_ID_BRIEF = tmp_OnRun.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PARTMENU" & m_OnRun_ID, tmp_OnRun
  Set OnRun = tmp_OnRun
  Exit Property
End If
  '  set OnRun = m_OnRun
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
  Set tmp_OnDelete = Application.FindRowObject("PARTMENU", m_OnDelete_ID)
  If tmp_OnDelete Is Nothing Then
    m_OnDelete_ID_BRIEF = ""
  Else
    m_OnDelete_ID_BRIEF = tmp_OnDelete.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PARTMENU" & m_OnDelete_ID, tmp_OnDelete
  Set OnDelete = tmp_OnDelete
  Exit Property
End If
  '  set OnDelete = m_OnDelete
End Property
' let
'Поведение при добавлении

'Поведение при добавлении
'Parameters:
'[IN]   newValue , тип параметра: enumPartAddBehaivor  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let AddBehaivor(ByVal NewValue As enumPartAddBehaivor)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "AddBehaivor", AddBehaivor, NewValue

   m_AddBehaivor = NewValue
End If
End Property

'Поведение при добавлении
'Parameters:
' параметров нет
'Returns:
'  объект класса enumPartAddBehaivor
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumPartAddBehaivor
' Set variable = me. AddBehaivor
Public Property Get AddBehaivor() As enumPartAddBehaivor
 LoadFromDatabase
 AccessTime = Now

   AddBehaivor = m_AddBehaivor
End Property
' let
'Объект расширения

'Объект расширения
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set ExtenderObject(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ExtenderObject", ExtenderObject, NewValue
On Error Resume Next
m_ExtenderObject_ID = ""
m_ExtenderObject_ID = NewValue.id
' set   m_ExtenderObject= newValue
End If
End Property

'Объект расширения
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. ExtenderObject
Public Property Get ExtenderObject() As Object
 LoadFromDatabase
 AccessTime = Now
If m_ExtenderObject_ID <> "" Then
  Set ExtenderObject = Application.Manager.GetInstanceObject(Right(m_ExtenderObject_ID, 38))
 Exit Property
End If
  ' set ExtenderObject = m_ExtenderObject
End Property
' let
'Шаблон для краткого отображения

'Шаблон для краткого отображения
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let shablonBrief(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "shablonBrief", shablonBrief, NewValue

   m_shablonBrief = NewValue
End If
End Property

'Шаблон для краткого отображения
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. shablonBrief
Public Property Get shablonBrief() As String
 LoadFromDatabase
 AccessTime = Now

   shablonBrief = m_shablonBrief
End Property
' let
'Правило составления BRIEF поля

'Правило составления BRIEF поля
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ruleBrief(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ruleBrief", ruleBrief, NewValue

   m_ruleBrief = NewValue
End If
End Property

'Правило составления BRIEF поля
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. ruleBrief
Public Property Get ruleBrief() As String
 LoadFromDatabase
 AccessTime = Now

   ruleBrief = m_ruleBrief
End Property
' let
'Вести журнал изменений

'Вести журнал изменений
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IsJormalChange(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IsJormalChange", IsJormalChange, NewValue

   m_IsJormalChange = NewValue
End If
End Property

'Вести журнал изменений
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. IsJormalChange
Public Property Get IsJormalChange() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   IsJormalChange = m_IsJormalChange
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

If TypeName(Me.Parent.Parent) = TypeName(Me) Then
  Set nvi = nv.Add("ParentRowID", Me.Parent.Parent.id)
  nvi.ORACLE_GUID
Else
  Set nvi = nv.Add("ParentRowID", Null)
  nvi.ORACLE_GUID
End If
  Set nvi = nv.Add("Sequence", m_Sequence)
nvi.ValueType = adInteger
  Set nvi = nv.Add("PartType", m_PartType)
nvi.ValueType = adInteger
  Set nvi = nv.Add("Caption", m_Caption)
nvi.ValueSize = 255
  Set nvi = nv.Add("Name", m_Name)
nvi.ValueSize = 20
  Set nvi = nv.Add("the_Comment", m_the_Comment)
  Set nvi = nv.Add("NoLog", m_NoLog)
nvi.ValueType = adInteger
  Set nvi = nv.Add("ManualRegister", m_ManualRegister)
nvi.ValueType = adInteger
 ' Reference to PARTMENU
    If m_OnCreate_ID = "" Then
       Set nvi = nv.Add("OnCreate", "")
    Else
       Set nvi = nv.Add("OnCreate", m_OnCreate_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to PARTMENU
    If m_OnSave_ID = "" Then
       Set nvi = nv.Add("OnSave", "")
    Else
       Set nvi = nv.Add("OnSave", m_OnSave_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to PARTMENU
    If m_OnRun_ID = "" Then
       Set nvi = nv.Add("OnRun", "")
    Else
       Set nvi = nv.Add("OnRun", m_OnRun_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to PARTMENU
    If m_OnDelete_ID = "" Then
       Set nvi = nv.Add("OnDelete", "")
    Else
       Set nvi = nv.Add("OnDelete", m_OnDelete_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("AddBehaivor", m_AddBehaivor)
nvi.ValueType = adInteger
 ' Reference to object
    If m_ExtenderObject_ID = "" Then
       Set nvi = nv.Add("ExtenderObject", "")
    Else
       Set nvi = nv.Add("ExtenderObject", m_ExtenderObject_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("shablonBrief", m_shablonBrief)
nvi.ValueSize = 100
  Set nvi = nv.Add("ruleBrief", m_ruleBrief)
nvi.ValueSize = 500
  Set nvi = nv.Add("IsJormalChange", m_IsJormalChange)
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
 m_Brief = m_Brief & Caption & "; "
 m_Brief = m_Brief & Name & "; "
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

m_Sequence = nv.item("Sequence").Value
m_PartType = nv.item("PartType").Value
m_Caption = nv.item("Caption").Value
m_Name = nv.item("Name").Value
m_the_Comment = nv.item("the_Comment").Value
m_NoLog = nv.item("NoLog").Value
m_ManualRegister = nv.item("ManualRegister").Value
  m_OnCreate_ID = nv.item("OnCreate").Value
  m_OnSave_ID = nv.item("OnSave").Value
  m_OnRun_ID = nv.item("OnRun").Value
  m_OnDelete_ID = nv.item("OnDelete").Value
m_AddBehaivor = nv.item("AddBehaivor").Value
  m_ExtenderObject_ID = nv.item("ExtenderObject").Value
m_shablonBrief = nv.item("shablonBrief").Value
m_ruleBrief = nv.item("ruleBrief").Value
m_IsJormalChange = nv.item("IsJormalChange").Value
Else

m_Sequence = nv.Fields("Sequence").Value
m_PartType = nv.Fields("PartType").Value
m_Caption = nv.Fields("Caption").Value
m_Name = nv.Fields("Name").Value
m_the_Comment = nv.Fields("the_Comment").Value
m_NoLog = nv.Fields("NoLog").Value
m_ManualRegister = nv.Fields("ManualRegister").Value
  m_OnCreate_ID = nv.Fields("OnCreate").Value
  m_OnSave_ID = nv.Fields("OnSave").Value
  m_OnRun_ID = nv.Fields("OnRun").Value
  m_OnDelete_ID = nv.Fields("OnDelete").Value
m_AddBehaivor = nv.Fields("AddBehaivor").Value
  m_ExtenderObject_ID = nv.Fields("ExtenderObject").Value
m_shablonBrief = nv.Fields("shablonBrief").Value
m_ruleBrief = nv.Fields("ruleBrief").Value
m_IsJormalChange = nv.Fields("IsJormalChange").Value
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
   Dim o As PART
   Set o = New PART
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
   Dim tmpParent As Object
   Set tmpParent = Me
   While TypeName(tmpParent.Parent.Parent) = "PART"
     Set tmpParent = tmpParent.Parent.Parent
   Wend
     Application.MTZSession.SaveRow2 PartName, id, tmpParent.Parent.Parent.id, nv, Application.id
   Changed = False
   Save = True
Exit Function
bye:
  err.Raise err.Number, "PART.Save", err.Description
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
   For i = 1 To PART.Count
     PART.Delete (i)
   Next
  m_Deleted = True
  Delete = True
Else
  If Not CanChangeONLine Then Exit Function
   OK = True
   While OK And PART.Count > 0
     OK = PART.Delete(1)
   Wend
   If Not OK Then Exit Function
   Delete = Application.MTZSession.DeleteRow2(PartName, id, Application.id)
   Changed = False
   'Compact
   CloseClass
End If
Exit Function
bye:
  err.Raise err.Number, "PART.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("PART", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "PART.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "PART", id
Exit Sub
bye:
  err.Raise err.Number, "PART.Propagate", err.Description
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
If Not m_PARTMENU Is Nothing Then
  m_PARTMENU.CloseClass
  Set m_PARTMENU = Nothing
End If
If Not m_FIELD Is Nothing Then
  m_FIELD.CloseClass
  Set m_FIELD = Nothing
End If
If Not m_PARTVIEW Is Nothing Then
  m_PARTVIEW.CloseClass
  Set m_PARTVIEW = Nothing
End If
If Not m_ExtenderInterface Is Nothing Then
  m_ExtenderInterface.CloseClass
  Set m_ExtenderInterface = Nothing
End If
If Not m_VALIDATOR Is Nothing Then
  m_VALIDATOR.CloseClass
  Set m_VALIDATOR = Nothing
End If
If Not m_UNIQUECONSTRAINT Is Nothing Then
  m_UNIQUECONSTRAINT.CloseClass
  Set m_UNIQUECONSTRAINT = Nothing
End If
 m_OnCreate_ID = ""
 Set m_OnCreate = Nothing
 m_OnSave_ID = ""
 Set m_OnSave = Nothing
 m_OnRun_ID = ""
 Set m_OnRun = Nothing
 m_OnDelete_ID = ""
 Set m_OnDelete = Nothing
 m_ExtenderObject_ID = ""
 Set m_ExtenderObject = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "PART.CloseClass"
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
   Set m_FindObject = PARTMENU.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = FIELD.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = PARTVIEW.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = ExtenderInterface.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = VALIDATOR.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = UNIQUECONSTRAINT.FindObject(StrID, InstID)
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
PARTMENU.Compact
FIELD.Compact
PARTVIEW.Compact
ExtenderInterface.Compact
VALIDATOR.Compact
UNIQUECONSTRAINT.Compact
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
  Sequence = node.Attributes.getNamedItem("SEQUENCE").nodeValue
  PartType = node.Attributes.getNamedItem("PARTTYPE").nodeValue
  Caption = Replace(node.Attributes.getNamedItem("CAPTION").nodeValue, vbLf, vbCrLf)
  Name = Replace(node.Attributes.getNamedItem("NAME").nodeValue, vbLf, vbCrLf)
  the_Comment = Replace(node.Attributes.getNamedItem("THE_COMMENT").nodeValue, vbLf, vbCrLf)
  NoLog = node.Attributes.getNamedItem("NOLOG").nodeValue
  ManualRegister = node.Attributes.getNamedItem("MANUALREGISTER").nodeValue
  Set OnCreate = Nothing
  m_OnCreate_ID = node.Attributes.getNamedItem("ONCREATE").nodeValue
  m_OnCreate_ID_BRIEF = node.Attributes.getNamedItem("ONCREATE_BRIEF").nodeValue
  Set OnSave = Nothing
  m_OnSave_ID = node.Attributes.getNamedItem("ONSAVE").nodeValue
  m_OnSave_ID_BRIEF = node.Attributes.getNamedItem("ONSAVE_BRIEF").nodeValue
  Set OnRun = Nothing
  m_OnRun_ID = node.Attributes.getNamedItem("ONRUN").nodeValue
  m_OnRun_ID_BRIEF = node.Attributes.getNamedItem("ONRUN_BRIEF").nodeValue
  Set OnDelete = Nothing
  m_OnDelete_ID = node.Attributes.getNamedItem("ONDELETE").nodeValue
  m_OnDelete_ID_BRIEF = node.Attributes.getNamedItem("ONDELETE_BRIEF").nodeValue
  AddBehaivor = node.Attributes.getNamedItem("ADDBEHAIVOR").nodeValue
  Set ExtenderObject = Nothing
  m_ExtenderObject_ID = node.Attributes.getNamedItem("EXTENDEROBJECT").nodeValue
  m_ExtenderObject_ID_BRIEF = node.Attributes.getNamedItem("EXTENDEROBJECT_BRIEF").nodeValue
  shablonBrief = Replace(node.Attributes.getNamedItem("SHABLONBRIEF").nodeValue, vbLf, vbCrLf)
  ruleBrief = Replace(node.Attributes.getNamedItem("RULEBRIEF").nodeValue, vbLf, vbCrLf)
  IsJormalChange = node.Attributes.getNamedItem("ISJORMALCHANGE").nodeValue
  On Error GoTo bye
  'if m_ChangeTime >= m_RetriveTime then m_Changed = true
  m_Changed = True
  m_RowRetrived = True
  m_Brief = ""
  On Error Resume Next
  Set e_list = node.selectNodes("PART_COL")
  PART.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("PARTMENU_COL")
  PARTMENU.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("FIELD_COL")
  FIELD.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("PARTVIEW_COL")
  PARTVIEW.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("EXTENDERINTERFACE_COL")
  ExtenderInterface.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("VALIDATOR_COL")
  VALIDATOR.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("UNIQUECONSTRAINT_COL")
  UNIQUECONSTRAINT.XMLLoad e_list, LoadMode
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
  node.setAttribute "SEQUENCE", Sequence
  node.setAttribute "PARTTYPE", PartType
  node.setAttribute "CAPTION", Caption
  node.setAttribute "NAME", Name
  node.setAttribute "THE_COMMENT", the_Comment
  node.setAttribute "NOLOG", NoLog
  node.setAttribute "MANUALREGISTER", ManualRegister
  node.setAttribute "ONCREATE", m_OnCreate_ID
  If Not (OnCreate Is Nothing) Then
    node.setAttribute "ONCREATE_BRIEF", OnCreate.Brief
  Else
    node.setAttribute "ONCREATE_BRIEF", m_OnCreate_ID_BRIEF
  End If
  node.setAttribute "ONSAVE", m_OnSave_ID
  If Not (OnSave Is Nothing) Then
    node.setAttribute "ONSAVE_BRIEF", OnSave.Brief
  Else
    node.setAttribute "ONSAVE_BRIEF", m_OnSave_ID_BRIEF
  End If
  node.setAttribute "ONRUN", m_OnRun_ID
  If Not (OnRun Is Nothing) Then
    node.setAttribute "ONRUN_BRIEF", OnRun.Brief
  Else
    node.setAttribute "ONRUN_BRIEF", m_OnRun_ID_BRIEF
  End If
  node.setAttribute "ONDELETE", m_OnDelete_ID
  If Not (OnDelete Is Nothing) Then
    node.setAttribute "ONDELETE_BRIEF", OnDelete.Brief
  Else
    node.setAttribute "ONDELETE_BRIEF", m_OnDelete_ID_BRIEF
  End If
  node.setAttribute "ADDBEHAIVOR", AddBehaivor
  node.setAttribute "EXTENDEROBJECT", m_ExtenderObject_ID
  If Not (ExtenderObject Is Nothing) Then
    node.setAttribute "EXTENDEROBJECT_BRIEF", ExtenderObject.Brief
  Else
    node.setAttribute "EXTENDEROBJECT_BRIEF", m_ExtenderObject_ID_BRIEF
  End If
  node.setAttribute "SHABLONBRIEF", shablonBrief
  node.setAttribute "RULEBRIEF", ruleBrief
  node.setAttribute "ISJORMALCHANGE", IsJormalChange
  node.setAttribute "AccessTime", CDbl(m_AccessTime)
  PART.XMLSave node, xdom
  PARTMENU.XMLSave node, xdom
  FIELD.XMLSave node, xdom
  PARTVIEW.XMLSave node, xdom
  ExtenderInterface.XMLSave node, xdom
  VALIDATOR.XMLSave node, xdom
  UNIQUECONSTRAINT.XMLSave node, xdom
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
m_IsLocked = Application.MTZSession.IsLocked("PART", id)
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
OK = Application.MTZSession.LockResource("PART", id, Permanent)
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
Application.MTZSession.UnLockResource "PART", id
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
CanLock = Application.MTZSession.CanLock("PART", id)
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
 PARTMENU.BatchUpdate
 FIELD.BatchUpdate
 PARTVIEW.BatchUpdate
 ExtenderInterface.BatchUpdate
 VALIDATOR.BatchUpdate
 UNIQUECONSTRAINT.BatchUpdate
  PART.BatchUpdate
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
  PARTMENU.LoadAll
  FIELD.LoadAll
  PARTVIEW.LoadAll
  ExtenderInterface.LoadAll
  VALIDATOR.LoadAll
  UNIQUECONSTRAINT.LoadAll
    PART.LoadAll
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
    tree.nodes.Add(nid, 4, nid & "PART", "Раздел").Tag = "PART"
    tree.nodes.Add(nid & "PART", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
   ' PARTMENU
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "PARTMENU") Then
      tree.nodes.Add(nid, 4, nid & "PARTMENU", "Методы раздела").Tag = "PARTMENU"
      tree.nodes.Add(nid & "PARTMENU", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "PARTMENU", "Методы раздела").Tag = "PARTMENU"
     tree.nodes.Add(nid & "PARTMENU", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
   End If ' PARTMENU
   ' FIELD
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "FIELD") Then
      tree.nodes.Add(nid, 4, nid & "FIELD", "Поле").Tag = "FIELD"
      tree.nodes.Add(nid & "FIELD", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "FIELD", "Поле").Tag = "FIELD"
     tree.nodes.Add(nid & "FIELD", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
   End If ' FIELD
   ' PARTVIEW
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "PARTVIEW") Then
      tree.nodes.Add(nid, 4, nid & "PARTVIEW", "Представление").Tag = "PARTVIEW"
      tree.nodes.Add(nid & "PARTVIEW", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "PARTVIEW", "Представление").Tag = "PARTVIEW"
     tree.nodes.Add(nid & "PARTVIEW", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
   End If ' PARTVIEW
   ' ExtenderInterface
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "ExtenderInterface") Then
      tree.nodes.Add(nid, 4, nid & "ExtenderInterface", "Интерфейсы расширения").Tag = "ExtenderInterface"
      tree.nodes.Add(nid & "ExtenderInterface", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "ExtenderInterface", "Интерфейсы расширения").Tag = "ExtenderInterface"
     tree.nodes.Add(nid & "ExtenderInterface", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
   End If ' ExtenderInterface
   ' VALIDATOR
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "VALIDATOR") Then
      tree.nodes.Add(nid, 4, nid & "VALIDATOR", "Логика на форме").Tag = "VALIDATOR"
      tree.nodes.Add(nid & "VALIDATOR", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "VALIDATOR", "Логика на форме").Tag = "VALIDATOR"
     tree.nodes.Add(nid & "VALIDATOR", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
   End If ' VALIDATOR
   ' UNIQUECONSTRAINT
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "UNIQUECONSTRAINT") Then
      tree.nodes.Add(nid, 4, nid & "UNIQUECONSTRAINT", "Ограничение уникальности").Tag = "UNIQUECONSTRAINT"
      tree.nodes.Add(nid & "UNIQUECONSTRAINT", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "UNIQUECONSTRAINT", "Ограничение уникальности").Tag = "UNIQUECONSTRAINT"
     tree.nodes.Add(nid & "UNIQUECONSTRAINT", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
   End If ' UNIQUECONSTRAINT
    Next 'i
 Case "PARTMENU"
    item.PARTMENU.Refresh
    For i = 1 To item.PARTMENU.Count
    nid = CreateGUID2() & item.PARTMENU.item(i).id
    tree.nodes.Add(key, 4, nid, item.PARTMENU.item(i).Brief(True)).Tag = "Row"
   ' PARTPARAMMAP
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "PARTPARAMMAP") Then
      tree.nodes.Add(nid, 4, nid & "PARTPARAMMAP", "Отображение параметров").Tag = "PARTPARAMMAP"
      tree.nodes.Add(nid & "PARTPARAMMAP", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "PARTPARAMMAP", "Отображение параметров").Tag = "PARTPARAMMAP"
     tree.nodes.Add(nid & "PARTPARAMMAP", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' PARTPARAMMAP
    Next
 Case "FIELD"
    item.FIELD.Refresh
    For i = 1 To item.FIELD.Count
    nid = CreateGUID2() & item.FIELD.item(i).id
    tree.nodes.Add(key, 4, nid, item.FIELD.item(i).Brief(True)).Tag = "Row"
   ' FIELDVALIDATOR
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "FIELDVALIDATOR") Then
      tree.nodes.Add(nid, 4, nid & "FIELDVALIDATOR", "Логика поля на форме").Tag = "FIELDVALIDATOR"
      tree.nodes.Add(nid & "FIELDVALIDATOR", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "FIELDVALIDATOR", "Логика поля на форме").Tag = "FIELDVALIDATOR"
     tree.nodes.Add(nid & "FIELDVALIDATOR", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' FIELDVALIDATOR
   ' FIELDMENU
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "FIELDMENU") Then
      tree.nodes.Add(nid, 4, nid & "FIELDMENU", "Методы поля").Tag = "FIELDMENU"
      tree.nodes.Add(nid & "FIELDMENU", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "FIELDMENU", "Методы поля").Tag = "FIELDMENU"
     tree.nodes.Add(nid & "FIELDMENU", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' FIELDMENU
   ' FldExtenders
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "FldExtenders") Then
      tree.nodes.Add(nid, 4, nid & "FldExtenders", "Интерфейсы расширения").Tag = "FldExtenders"
      tree.nodes.Add(nid & "FldExtenders", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "FldExtenders", "Интерфейсы расширения").Tag = "FldExtenders"
     tree.nodes.Add(nid & "FldExtenders", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' FldExtenders
   ' FIELDEXPRESSION
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "FIELDEXPRESSION") Then
      tree.nodes.Add(nid, 4, nid & "FIELDEXPRESSION", "Значение по умолчанию").Tag = "FIELDEXPRESSION"
      tree.nodes.Add(nid & "FIELDEXPRESSION", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "FIELDEXPRESSION", "Значение по умолчанию").Tag = "FIELDEXPRESSION"
     tree.nodes.Add(nid & "FIELDEXPRESSION", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' FIELDEXPRESSION
   ' DINAMICFILTERSCRIPT
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "DINAMICFILTERSCRIPT") Then
      tree.nodes.Add(nid, 4, nid & "DINAMICFILTERSCRIPT", "Динамический фильтр").Tag = "DINAMICFILTERSCRIPT"
      tree.nodes.Add(nid & "DINAMICFILTERSCRIPT", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "DINAMICFILTERSCRIPT", "Динамический фильтр").Tag = "DINAMICFILTERSCRIPT"
     tree.nodes.Add(nid & "DINAMICFILTERSCRIPT", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' DINAMICFILTERSCRIPT
   ' FIELDSRCDEF
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "FIELDSRCDEF") Then
      tree.nodes.Add(nid, 4, nid & "FIELDSRCDEF", "Описание источника данных").Tag = "FIELDSRCDEF"
      tree.nodes.Add(nid & "FIELDSRCDEF", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "FIELDSRCDEF", "Описание источника данных").Tag = "FIELDSRCDEF"
     tree.nodes.Add(nid & "FIELDSRCDEF", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' FIELDSRCDEF
    Next
 Case "PARTVIEW"
    item.PARTVIEW.Refresh
    For i = 1 To item.PARTVIEW.Count
    nid = CreateGUID2() & item.PARTVIEW.item(i).id
    tree.nodes.Add(key, 4, nid, item.PARTVIEW.item(i).Brief(True)).Tag = "Row"
   ' ViewColumn
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "ViewColumn") Then
      tree.nodes.Add(nid, 4, nid & "ViewColumn", "Колонка").Tag = "ViewColumn"
      tree.nodes.Add(nid & "ViewColumn", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "ViewColumn", "Колонка").Tag = "ViewColumn"
     tree.nodes.Add(nid & "ViewColumn", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' ViewColumn
   ' PARTVIEW_LNK
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "PARTVIEW_LNK") Then
      tree.nodes.Add(nid, 4, nid & "PARTVIEW_LNK", "Связанные представления").Tag = "PARTVIEW_LNK"
      tree.nodes.Add(nid & "PARTVIEW_LNK", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "PARTVIEW_LNK", "Связанные представления").Tag = "PARTVIEW_LNK"
     tree.nodes.Add(nid & "PARTVIEW_LNK", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' PARTVIEW_LNK
    Next
 Case "ExtenderInterface"
    item.ExtenderInterface.Refresh
    For i = 1 To item.ExtenderInterface.Count
    nid = CreateGUID2() & item.ExtenderInterface.item(i).id
    tree.nodes.Add(key, 4, nid, item.ExtenderInterface.item(i).Brief(True)).Tag = "Row"
    Next
 Case "VALIDATOR"
    item.VALIDATOR.Refresh
    For i = 1 To item.VALIDATOR.Count
    nid = CreateGUID2() & item.VALIDATOR.item(i).id
    tree.nodes.Add(key, 4, nid, item.VALIDATOR.item(i).Brief(True)).Tag = "Row"
    Next
 Case "UNIQUECONSTRAINT"
    item.UNIQUECONSTRAINT.Refresh
    For i = 1 To item.UNIQUECONSTRAINT.Count
    nid = CreateGUID2() & item.UNIQUECONSTRAINT.item(i).id
    tree.nodes.Add(key, 4, nid, item.UNIQUECONSTRAINT.item(i).Brief(True)).Tag = "Row"
   ' CONSTRAINTFIELD
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "CONSTRAINTFIELD") Then
      tree.nodes.Add(nid, 4, nid & "CONSTRAINTFIELD", "Поля ограничения").Tag = "CONSTRAINTFIELD"
      tree.nodes.Add(nid & "CONSTRAINTFIELD", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "CONSTRAINTFIELD", "Поля ограничения").Tag = "CONSTRAINTFIELD"
     tree.nodes.Add(nid & "CONSTRAINTFIELD", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' CONSTRAINTFIELD
    Next
 End Select
End If ' mode="" (Default)
End Sub


'Загрузка информации в дерево
'Parameters:
'[IN][OUT]  tree , тип параметра: object,
'[IN]   key , тип параметра: string  - ...
'See Also:
'Example:
'  call me.LoadTotree({параметры})
Public Sub LoadTotree(tree As Object, ByVal key As String)
      Dim tid As String 'only for tree styled structure
      tid = id
      If key = "" Then
        tree.nodes.Add(, 0, tid, Brief(True)).Tag = "Row"
      Else
        tree.nodes.Add(key, 4, tid, Brief(True)).Tag = "Row"
      End If
      tree.nodes.Add(tid, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
End Sub

'Загрузка в дерево данных раздела
'Parameters:
'[IN][OUT]  tree , тип параметра: object,
'[IN]   key , тип параметра: string  - ...
'See Also:
'Example:
'  call me.ExpandPart({параметры})
Public Sub ExpandPart(tree As Object, ByVal key As String)
 Dim item As Object, i As Long, nid As String, tmpid As String
 Dim tidx As Long, tid As String 'only for tree styled structure
 Set item = Application.FindRowObject(PartName, key)
 If Not item Is Me Then
   item.ExpandPart tree, key
   Exit Sub
 End If
 tree.nodes.item(key).Sorted = True
    For tidx = 1 To item.PART.Count
      ' PART
      tid = item.PART.item(tidx).id
      tree.nodes.Add(key, 4, tid, item.PART.item(tidx).Brief(True)).Tag = "Row"
      tree.nodes.Add(tid, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
    Next 'tidx
End Sub



