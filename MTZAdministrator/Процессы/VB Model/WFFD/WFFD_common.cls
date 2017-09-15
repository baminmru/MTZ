VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "WFFD_common"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'строка раздела Шаг процесса
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
Private m_Name As String
Private m_StepType As Object
Dim m_StepType_ID As String
Dim m_StepType_ID_BRIEF As String
Private m_ReuseStep As enumBoolean
Private m_AutoCheckState As enumBoolean
Private m_ReStartInterval As Long
Private m_StateCeckInterval As Long
Private m_MinPriority As Long
Private m_MaxPriority As Long
Private m_IncPriority As Long
Private m_GrowPriorityInterval As Long
Private m_MaxPassNumber As Long
Private m_TaskDescription As String
Private m_Attachment_EXT As String
Private m_Attachment As Variant
Private m_WorkTime As Double
Private m_IntegrationData1 As String
Private m_IntegrationData2 As String
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
  PartName = "WFFD_common"
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
  m_Application.Logger.Message "WFFD_common.Init"
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
'Тип шага

'Тип шага
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set StepType(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "StepType", StepType, NewValue
On Error Resume Next
m_StepType_ID = ""
m_StepType_ID = NewValue.id
'  set   m_StepType= newValue
End If
End Property

'Тип шага
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. StepType
Public Property Get StepType() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_StepType As Object
If m_StepType_ID <> "" Then
  Set tmp_StepType = Application.FindRowObject("WFDic_func", m_StepType_ID)
  If tmp_StepType Is Nothing Then
    m_StepType_ID_BRIEF = ""
  Else
    m_StepType_ID_BRIEF = tmp_StepType.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "WFDic_func" & m_StepType_ID, tmp_StepType
  Set StepType = tmp_StepType
  Exit Property
End If
  '  set StepType = m_StepType
End Property
' let
'Использовать незавершенный шаг

'Использовать незавершенный шаг
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ReuseStep(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ReuseStep", ReuseStep, NewValue

   m_ReuseStep = NewValue
End If
End Property

'Использовать незавершенный шаг
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. ReuseStep
Public Property Get ReuseStep() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   ReuseStep = m_ReuseStep
End Property
' let
'Проверять состояние

'Проверять состояние
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let AutoCheckState(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "AutoCheckState", AutoCheckState, NewValue

   m_AutoCheckState = NewValue
End If
End Property

'Проверять состояние
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. AutoCheckState
Public Property Get AutoCheckState() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   AutoCheckState = m_AutoCheckState
End Property
' let
'Интервал перезапуска (мин.)

'Интервал перезапуска (мин.)
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ReStartInterval(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ReStartInterval", ReStartInterval, NewValue

   m_ReStartInterval = NewValue
End If
End Property

'Интервал перезапуска (мин.)
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. ReStartInterval
Public Property Get ReStartInterval() As Long
 LoadFromDatabase
 AccessTime = Now

   ReStartInterval = m_ReStartInterval
End Property
' let
'Инетрвал проверки состояния (мин.)

'Инетрвал проверки состояния (мин.)
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let StateCeckInterval(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "StateCeckInterval", StateCeckInterval, NewValue

   m_StateCeckInterval = NewValue
End If
End Property

'Инетрвал проверки состояния (мин.)
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. StateCeckInterval
Public Property Get StateCeckInterval() As Long
 LoadFromDatabase
 AccessTime = Now

   StateCeckInterval = m_StateCeckInterval
End Property
' let
'Минимальный приоритет

'Минимальный приоритет
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let MinPriority(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "MinPriority", MinPriority, NewValue

   m_MinPriority = NewValue
End If
End Property

'Минимальный приоритет
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. MinPriority
Public Property Get MinPriority() As Long
 LoadFromDatabase
 AccessTime = Now

   MinPriority = m_MinPriority
End Property
' let
'Максимальный приоритет

'Максимальный приоритет
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let MaxPriority(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "MaxPriority", MaxPriority, NewValue

   m_MaxPriority = NewValue
End If
End Property

'Максимальный приоритет
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. MaxPriority
Public Property Get MaxPriority() As Long
 LoadFromDatabase
 AccessTime = Now

   MaxPriority = m_MaxPriority
End Property
' let
'Прирост приоритета

'Прирост приоритета
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IncPriority(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IncPriority", IncPriority, NewValue

   m_IncPriority = NewValue
End If
End Property

'Прирост приоритета
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. IncPriority
Public Property Get IncPriority() As Long
 LoadFromDatabase
 AccessTime = Now

   IncPriority = m_IncPriority
End Property
' let
'Интервал роста приоритета (мин.)

'Интервал роста приоритета (мин.)
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let GrowPriorityInterval(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "GrowPriorityInterval", GrowPriorityInterval, NewValue

   m_GrowPriorityInterval = NewValue
End If
End Property

'Интервал роста приоритета (мин.)
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. GrowPriorityInterval
Public Property Get GrowPriorityInterval() As Long
 LoadFromDatabase
 AccessTime = Now

   GrowPriorityInterval = m_GrowPriorityInterval
End Property
' let
'Максимальный номер прохода

'Максимальный номер прохода
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let MaxPassNumber(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "MaxPassNumber", MaxPassNumber, NewValue

   m_MaxPassNumber = NewValue
End If
End Property

'Максимальный номер прохода
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. MaxPassNumber
Public Property Get MaxPassNumber() As Long
 LoadFromDatabase
 AccessTime = Now

   MaxPassNumber = m_MaxPassNumber
End Property
' let
'Описание задания

'Описание задания
'Parameters:
'[IN]   newValue , тип параметра: STRING  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TaskDescription(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TaskDescription", TaskDescription, NewValue

   m_TaskDescription = NewValue
End If
End Property

'Описание задания
'Parameters:
' параметров нет
'Returns:
'  значение типа STRING
'See Also:
'Example:
' dim variable as STRING
' variable = me. TaskDescription
Public Property Get TaskDescription() As String
 LoadFromDatabase
 AccessTime = Now

   TaskDescription = m_TaskDescription
End Property
' let
'Attachment
Public Property Let Attachment_EXT(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Attachment_EXT", Attachment_EXT, NewValue
 m_Attachment_EXT = NewValue
End If
End Property

'Вложение
'Parameters:
' параметров нет
'Returns:
'  значение типа string
'See Also:
'Example:
' dim variable as string
' variable = me. Attachment_EXT
Public Property Get Attachment_EXT() As String
 LoadFromDatabase
 AccessTime = Now
  Attachment_EXT = m_Attachment_EXT
End Property
' let
'Вложение

'Вложение
'Parameters:
'[IN]   newValue , тип параметра: VARIANT  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Attachment(ByVal NewValue As Variant)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Attachment", Attachment, NewValue

   m_Attachment = NewValue
End If
End Property

'Вложение
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
' dim variable as VARIANT
' variable = me. Attachment
' Set variable = me. Attachment
Public Property Get Attachment() As Variant
 LoadFromDatabase
 AccessTime = Now

   Attachment = m_Attachment
End Property
' let
'Срок исполнения (ч.)

'Срок исполнения (ч.)
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let WorkTime(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "WorkTime", WorkTime, NewValue

   m_WorkTime = NewValue
End If
End Property

'Срок исполнения (ч.)
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. WorkTime
Public Property Get WorkTime() As Double
 LoadFromDatabase
 AccessTime = Now

   WorkTime = m_WorkTime
End Property
' let
'Данные для интеграции 1

'Данные для интеграции 1
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IntegrationData1(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IntegrationData1", IntegrationData1, NewValue

   m_IntegrationData1 = NewValue
End If
End Property

'Данные для интеграции 1
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. IntegrationData1
Public Property Get IntegrationData1() As String
 LoadFromDatabase
 AccessTime = Now

   IntegrationData1 = m_IntegrationData1
End Property
' let
'Данные для интеграции 2

'Данные для интеграции 2
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IntegrationData2(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IntegrationData2", IntegrationData2, NewValue

   m_IntegrationData2 = NewValue
End If
End Property

'Данные для интеграции 2
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. IntegrationData2
Public Property Get IntegrationData2() As String
 LoadFromDatabase
 AccessTime = Now

   IntegrationData2 = m_IntegrationData2
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

  Set nvi = nv.Add("Name", m_Name)
nvi.ValueSize = 255
 ' Reference to WFDic_func
    If m_StepType_ID = "" Then
       Set nvi = nv.Add("StepType", "")
    Else
       Set nvi = nv.Add("StepType", m_StepType_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("ReuseStep", m_ReuseStep)
nvi.ValueType = adInteger
  Set nvi = nv.Add("AutoCheckState", m_AutoCheckState)
nvi.ValueType = adInteger
  Set nvi = nv.Add("ReStartInterval", m_ReStartInterval)
nvi.ValueType = adInteger
  Set nvi = nv.Add("StateCeckInterval", m_StateCeckInterval)
nvi.ValueType = adInteger
  Set nvi = nv.Add("MinPriority", m_MinPriority)
nvi.ValueType = adInteger
  Set nvi = nv.Add("MaxPriority", m_MaxPriority)
nvi.ValueType = adInteger
  Set nvi = nv.Add("IncPriority", m_IncPriority)
nvi.ValueType = adInteger
  Set nvi = nv.Add("GrowPriorityInterval", m_GrowPriorityInterval)
nvi.ValueType = adInteger
  Set nvi = nv.Add("MaxPassNumber", m_MaxPassNumber)
nvi.ValueType = adInteger
  Set nvi = nv.Add("TaskDescription", m_TaskDescription)
  Set nvi = nv.Add("Attachment", m_Attachment)
Set nvi = nv.Add("Attachment_EXT", m_Attachment_EXT)
nvi.ValueSize = 10
  Set nvi = nv.Add("WorkTime", m_WorkTime)
nvi.ValueType = adDouble
  Set nvi = nv.Add("IntegrationData1", m_IntegrationData1)
nvi.ValueSize = 120
  Set nvi = nv.Add("IntegrationData2", m_IntegrationData2)
nvi.ValueSize = 120
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
    Brief = "! доступ запрещен ! (" & Err.Description & ")"
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

m_Name = nv.item("Name").Value
  m_StepType_ID = nv.item("StepType").Value
m_ReuseStep = nv.item("ReuseStep").Value
m_AutoCheckState = nv.item("AutoCheckState").Value
m_ReStartInterval = nv.item("ReStartInterval").Value
m_StateCeckInterval = nv.item("StateCeckInterval").Value
m_MinPriority = nv.item("MinPriority").Value
m_MaxPriority = nv.item("MaxPriority").Value
m_IncPriority = nv.item("IncPriority").Value
m_GrowPriorityInterval = nv.item("GrowPriorityInterval").Value
m_MaxPassNumber = nv.item("MaxPassNumber").Value
m_TaskDescription = nv.item("TaskDescription").Value
m_Attachment = nv.item("Attachment").Value
m_Attachment_EXT = nv.item("Attachment_EXT").Value
m_WorkTime = nv.item("WorkTime").Value
m_IntegrationData1 = nv.item("IntegrationData1").Value
m_IntegrationData2 = nv.item("IntegrationData2").Value
Else

m_Name = nv.Fields("Name").Value
  m_StepType_ID = nv.Fields("StepType").Value
m_ReuseStep = nv.Fields("ReuseStep").Value
m_AutoCheckState = nv.Fields("AutoCheckState").Value
m_ReStartInterval = nv.Fields("ReStartInterval").Value
m_StateCeckInterval = nv.Fields("StateCeckInterval").Value
m_MinPriority = nv.Fields("MinPriority").Value
m_MaxPriority = nv.Fields("MaxPriority").Value
m_IncPriority = nv.Fields("IncPriority").Value
m_GrowPriorityInterval = nv.Fields("GrowPriorityInterval").Value
m_MaxPassNumber = nv.Fields("MaxPassNumber").Value
m_TaskDescription = nv.Fields("TaskDescription").Value
m_Attachment = nv.Fields("Attachment").Value
m_Attachment_EXT = nv.Fields("Attachment_EXT").Value
m_WorkTime = nv.Fields("WorkTime").Value
m_IntegrationData1 = nv.Fields("IntegrationData1").Value
m_IntegrationData2 = nv.Fields("IntegrationData2").Value
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
   Dim o As WFFD_common
   Set o = New WFFD_common
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
  Err.Raise Err.Number, "WFFD_common.Save", Err.Description
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
  Err.Raise Err.Number, "WFFD_common.Delete", Err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("WFFD_common", id, SecurityStyleID)
Exit Sub
bye:
  Err.Raise Err.Number, "WFFD_common.Secure", Err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "WFFD_common", id
Exit Sub
bye:
  Err.Raise Err.Number, "WFFD_common.Propagate", Err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 m_StepType_ID = ""
 Set m_StepType = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "WFFD_common.CloseClass"
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
  Name = Replace(node.Attributes.getNamedItem("NAME").nodeValue, vbLf, vbCrLf)
  Set StepType = Nothing
  m_StepType_ID = node.Attributes.getNamedItem("STEPTYPE").nodeValue
  m_StepType_ID_BRIEF = node.Attributes.getNamedItem("STEPTYPE_BRIEF").nodeValue
  ReuseStep = node.Attributes.getNamedItem("REUSESTEP").nodeValue
  AutoCheckState = node.Attributes.getNamedItem("AUTOCHECKSTATE").nodeValue
  ReStartInterval = node.Attributes.getNamedItem("RESTARTINTERVAL").nodeValue
  StateCeckInterval = node.Attributes.getNamedItem("STATECECKINTERVAL").nodeValue
  MinPriority = node.Attributes.getNamedItem("MINPRIORITY").nodeValue
  MaxPriority = node.Attributes.getNamedItem("MAXPRIORITY").nodeValue
  IncPriority = node.Attributes.getNamedItem("INCPRIORITY").nodeValue
  GrowPriorityInterval = node.Attributes.getNamedItem("GROWPRIORITYINTERVAL").nodeValue
  MaxPassNumber = node.Attributes.getNamedItem("MAXPASSNUMBER").nodeValue
  TaskDescription = Replace(node.Attributes.getNamedItem("TASKDESCRIPTION").nodeValue, vbLf, vbCrLf)
  Attachment_EXT = node.Attributes.getNamedItem("ATTACHMENT_EXT").nodeValue
  Attachment = HexToArray(node.Attributes.getNamedItem("ATTACHMENT").nodeValue)
  WorkTime = Val(Replace(node.Attributes.getNamedItem("WORKTIME").nodeValue, vbLf, vbCrLf))
  IntegrationData1 = Replace(node.Attributes.getNamedItem("INTEGRATIONDATA1").nodeValue, vbLf, vbCrLf)
  IntegrationData2 = Replace(node.Attributes.getNamedItem("INTEGRATIONDATA2").nodeValue, vbLf, vbCrLf)
  On Error GoTo bye
  'if m_ChangeTime >= m_RetriveTime then m_Changed = true
  m_Changed = True
  m_RowRetrived = True
  m_Brief = ""
  On Error Resume Next
  Exit Sub
bye:
  DebugOutput Err.Description
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
  node.setAttribute "NAME", Name
  node.setAttribute "STEPTYPE", m_StepType_ID
  If Not (StepType Is Nothing) Then
    node.setAttribute "STEPTYPE_BRIEF", StepType.Brief
  Else
    node.setAttribute "STEPTYPE_BRIEF", m_StepType_ID_BRIEF
  End If
  node.setAttribute "REUSESTEP", ReuseStep
  node.setAttribute "AUTOCHECKSTATE", AutoCheckState
  node.setAttribute "RESTARTINTERVAL", ReStartInterval
  node.setAttribute "STATECECKINTERVAL", StateCeckInterval
  node.setAttribute "MINPRIORITY", MinPriority
  node.setAttribute "MAXPRIORITY", MaxPriority
  node.setAttribute "INCPRIORITY", IncPriority
  node.setAttribute "GROWPRIORITYINTERVAL", GrowPriorityInterval
  node.setAttribute "MAXPASSNUMBER", MaxPassNumber
  node.setAttribute "TASKDESCRIPTION", TaskDescription
  node.setAttribute "ATTACHMENT_EXT", Attachment_EXT
  node.setAttribute "ATTACHMENT", ArrayToHex(Attachment)
  node.setAttribute "WORKTIME", Replace(CStr(WorkTime), ",", ".")
  node.setAttribute "INTEGRATIONDATA1", IntegrationData1
  node.setAttribute "INTEGRATIONDATA2", IntegrationData2
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
m_IsLocked = Application.MTZSession.IsLocked("WFFD_common", id)
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
OK = Application.MTZSession.LockResource("WFFD_common", id, Permanent)
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
Application.MTZSession.UnLockResource "WFFD_common", id
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
CanLock = Application.MTZSession.CanLock("WFFD_common", id)
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
If mode = "" Then
 Select Case child
 End Select
End If ' mode="" (Default)
End Sub



