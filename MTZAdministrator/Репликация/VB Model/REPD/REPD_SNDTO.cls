VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "REPD_SNDTO"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'строка раздела Получатели реплик
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
Private m_REPD_CONST As REPD_CONST_col
Private m_REPD_REPTYPE As REPD_REPTYPE_col
Private m_DestSrv As Object
Dim m_DestSrv_ID As String
Dim m_DestSrv_ID_BRIEF As String
Private m_LastScan As Date
Private m_Config As String
Private m_LastReceive As Date
Private m_Provider As Object
Dim m_Provider_ID As String
Dim m_Provider_ID_BRIEF As String
Private m_Work_Start As Date
Private m_Work_End As Date
Private m_The_Interval As Long
Private m_IsActive As enumBoolean
Private m_LastApproveLog As Date
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
  PartName = "REPD_SNDTO"
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
  m_Application.Logger.Message "REPD_SNDTO.Init"
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

'Данные дочернего раздела Константы к запросу
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса REPD_CONST_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as REPD_CONST_col
' Set variable = me. REPD_CONST (...параметры...)
Public Property Get REPD_CONST(Optional ByVal Refresh As Boolean = True) As REPD_CONST_col
 If m_REPD_CONST Is Nothing Then
   Set m_REPD_CONST = New REPD_CONST_col
   Set m_REPD_CONST.Parent = Me
   Set m_REPD_CONST.Application = Me.Application
   If Refresh Then m_REPD_CONST.Refresh
 End If
 Set REPD_CONST = m_REPD_CONST
End Property

'Данные дочернего раздела Тип репликации документов
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса REPD_REPTYPE_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as REPD_REPTYPE_col
' Set variable = me. REPD_REPTYPE (...параметры...)
Public Property Get REPD_REPTYPE(Optional ByVal Refresh As Boolean = True) As REPD_REPTYPE_col
 If m_REPD_REPTYPE Is Nothing Then
   Set m_REPD_REPTYPE = New REPD_REPTYPE_col
   Set m_REPD_REPTYPE.Parent = Me
   Set m_REPD_REPTYPE.Application = Me.Application
   If Refresh Then m_REPD_REPTYPE.Refresh
 End If
 Set REPD_REPTYPE = m_REPD_REPTYPE
End Property
' let
'DestSrv

'DestSrv
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set DestSrv(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DestSrv", DestSrv, NewValue
On Error Resume Next
m_DestSrv_ID = ""
m_DestSrv_ID = NewValue.id
'  set   m_DestSrv= newValue
End If
End Property

'DestSrv
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. DestSrv
Public Property Get DestSrv() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_DestSrv As Object
If m_DestSrv_ID <> "" Then
  Set tmp_DestSrv = Application.FindRowObject("REPD_SRV", m_DestSrv_ID)
  If tmp_DestSrv Is Nothing Then
    m_DestSrv_ID_BRIEF = ""
  Else
    m_DestSrv_ID_BRIEF = tmp_DestSrv.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "REPD_SRV" & m_DestSrv_ID, tmp_DestSrv
  Set DestSrv = tmp_DestSrv
  Exit Property
End If
  '  set DestSrv = m_DestSrv
End Property
' let
'Last scan

'Last scan
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let LastScan(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "LastScan", LastScan, NewValue

   m_LastScan = NewValue
End If
End Property

'Last scan
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. LastScan
Public Property Get LastScan() As Date
 LoadFromDatabase
 AccessTime = Now

   LastScan = m_LastScan
End Property
' let
'Config

'Config
'Parameters:
'[IN]   newValue , тип параметра: STRING  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Config(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Config", Config, NewValue

   m_Config = NewValue
End If
End Property

'Config
'Parameters:
' параметров нет
'Returns:
'  значение типа STRING
'See Also:
'Example:
' dim variable as STRING
' variable = me. Config
Public Property Get Config() As String
 LoadFromDatabase
 AccessTime = Now

   Config = m_Config
End Property
' let
'Last Receive

'Last Receive
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let LastReceive(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "LastReceive", LastReceive, NewValue

   m_LastReceive = NewValue
End If
End Property

'Last Receive
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. LastReceive
Public Property Get LastReceive() As Date
 LoadFromDatabase
 AccessTime = Now

   LastReceive = m_LastReceive
End Property
' let
'Provider

'Provider
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set Provider(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Provider", Provider, NewValue
On Error Resume Next
m_Provider_ID = ""
m_Provider_ID = NewValue.id
'  set   m_Provider= newValue
End If
End Property

'Provider
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Provider
Public Property Get Provider() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_Provider As Object
If m_Provider_ID <> "" Then
  Set tmp_Provider = Application.FindRowObject("REPD_PROV", m_Provider_ID)
  If tmp_Provider Is Nothing Then
    m_Provider_ID_BRIEF = ""
  Else
    m_Provider_ID_BRIEF = tmp_Provider.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "REPD_PROV" & m_Provider_ID, tmp_Provider
  Set Provider = tmp_Provider
  Exit Property
End If
  '  set Provider = m_Provider
End Property
' let
'Начало работы (время)

'Начало работы (время)
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Work_Start(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Work_Start", Work_Start, NewValue

   m_Work_Start = NewValue
End If
End Property

'Начало работы (время)
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. Work_Start
Public Property Get Work_Start() As Date
 LoadFromDatabase
 AccessTime = Now

   Work_Start = m_Work_Start
End Property
' let
'Окончание работы (время)

'Окончание работы (время)
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Work_End(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Work_End", Work_End, NewValue

   m_Work_End = NewValue
End If
End Property

'Окончание работы (время)
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. Work_End
Public Property Get Work_End() As Date
 LoadFromDatabase
 AccessTime = Now

   Work_End = m_Work_End
End Property
' let
'Интервал

'Интервал
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let The_Interval(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "The_Interval", The_Interval, NewValue

   m_The_Interval = NewValue
End If
End Property

'Интервал
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. The_Interval
Public Property Get The_Interval() As Long
 LoadFromDatabase
 AccessTime = Now

   The_Interval = m_The_Interval
End Property
' let
'Активен

'Активен
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IsActive(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IsActive", IsActive, NewValue

   m_IsActive = NewValue
End If
End Property

'Активен
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. IsActive
Public Property Get IsActive() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   IsActive = m_IsActive
End Property
' let
'Последнее подтверждение (лог)

'Последнее подтверждение (лог)
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let LastApproveLog(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "LastApproveLog", LastApproveLog, NewValue

   m_LastApproveLog = NewValue
End If
End Property

'Последнее подтверждение (лог)
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. LastApproveLog
Public Property Get LastApproveLog() As Date
 LoadFromDatabase
 AccessTime = Now

   LastApproveLog = m_LastApproveLog
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

 ' Reference to REPD_SRV
    If m_DestSrv_ID = "" Then
       Set nvi = nv.Add("DestSrv", "")
    Else
       Set nvi = nv.Add("DestSrv", m_DestSrv_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("LastScan", m_LastScan)
nvi.ValueType = adDBTimeStamp
  Set nvi = nv.Add("Config", m_Config)
  Set nvi = nv.Add("LastReceive", m_LastReceive)
nvi.ValueType = adDBTimeStamp
 ' Reference to REPD_PROV
    If m_Provider_ID = "" Then
       Set nvi = nv.Add("Provider", "")
    Else
       Set nvi = nv.Add("Provider", m_Provider_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("Work_Start", m_Work_Start)
nvi.ValueType = adDBTime
  Set nvi = nv.Add("Work_End", m_Work_End)
nvi.ValueType = adDBTime
  Set nvi = nv.Add("The_Interval", m_The_Interval)
nvi.ValueType = adInteger
  Set nvi = nv.Add("IsActive", m_IsActive)
nvi.ValueType = adInteger
  Set nvi = nv.Add("LastApproveLog", m_LastApproveLog)
nvi.ValueType = adDBTimeStamp
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
   If DestSrv Is Nothing Then
     m_Brief = m_Brief & "{" & m_DestSrv_ID_BRIEF & "}; "
   Else
     m_Brief = m_Brief & "{" & DestSrv.Brief & "}; "
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

  m_DestSrv_ID = nv.item("DestSrv").Value
m_LastScan = nv.item("LastScan").Value
m_Config = nv.item("Config").Value
m_LastReceive = nv.item("LastReceive").Value
  m_Provider_ID = nv.item("Provider").Value
m_Work_Start = nv.item("Work_Start").Value
m_Work_End = nv.item("Work_End").Value
m_The_Interval = nv.item("The_Interval").Value
m_IsActive = nv.item("IsActive").Value
m_LastApproveLog = nv.item("LastApproveLog").Value
Else

  m_DestSrv_ID = nv.Fields("DestSrv").Value
m_LastScan = nv.Fields("LastScan").Value
m_Config = nv.Fields("Config").Value
m_LastReceive = nv.Fields("LastReceive").Value
  m_Provider_ID = nv.Fields("Provider").Value
m_Work_Start = nv.Fields("Work_Start").Value
m_Work_End = nv.Fields("Work_End").Value
m_The_Interval = nv.Fields("The_Interval").Value
m_IsActive = nv.Fields("IsActive").Value
m_LastApproveLog = nv.Fields("LastApproveLog").Value
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
   Dim o As REPD_SNDTO
   Set o = New REPD_SNDTO
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
  err.Raise err.Number, "REPD_SNDTO.Save", err.Description
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
  err.Raise err.Number, "REPD_SNDTO.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("REPD_SNDTO", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "REPD_SNDTO.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "REPD_SNDTO", id
Exit Sub
bye:
  err.Raise err.Number, "REPD_SNDTO.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

If Not m_REPD_CONST Is Nothing Then
  m_REPD_CONST.CloseClass
  Set m_REPD_CONST = Nothing
End If
If Not m_REPD_REPTYPE Is Nothing Then
  m_REPD_REPTYPE.CloseClass
  Set m_REPD_REPTYPE = Nothing
End If
 m_DestSrv_ID = ""
 Set m_DestSrv = Nothing
 m_Provider_ID = ""
 Set m_Provider = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "REPD_SNDTO.CloseClass"
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
   Set m_FindObject = REPD_CONST.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = REPD_REPTYPE.FindObject(StrID, InstID)
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

REPD_CONST.Compact
REPD_REPTYPE.Compact
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
  Set DestSrv = Nothing
  m_DestSrv_ID = node.Attributes.getNamedItem("DESTSRV").nodeValue
  m_DestSrv_ID_BRIEF = node.Attributes.getNamedItem("DESTSRV_BRIEF").nodeValue
  LastScan = node.Attributes.getNamedItem("LASTSCAN").nodeValue
  Config = Replace(node.Attributes.getNamedItem("CONFIG").nodeValue, vbLf, vbCrLf)
  LastReceive = node.Attributes.getNamedItem("LASTRECEIVE").nodeValue
  Set Provider = Nothing
  m_Provider_ID = node.Attributes.getNamedItem("PROVIDER").nodeValue
  m_Provider_ID_BRIEF = node.Attributes.getNamedItem("PROVIDER_BRIEF").nodeValue
  Work_Start = node.Attributes.getNamedItem("WORK_START").nodeValue
  Work_End = node.Attributes.getNamedItem("WORK_END").nodeValue
  The_Interval = node.Attributes.getNamedItem("THE_INTERVAL").nodeValue
  IsActive = node.Attributes.getNamedItem("ISACTIVE").nodeValue
  LastApproveLog = node.Attributes.getNamedItem("LASTAPPROVELOG").nodeValue
  On Error GoTo bye
  'if m_ChangeTime >= m_RetriveTime then m_Changed = true
  m_Changed = True
  m_RowRetrived = True
  m_Brief = ""
  On Error Resume Next
  Set e_list = node.selectNodes("REPD_CONST_COL")
  REPD_CONST.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("REPD_REPTYPE_COL")
  REPD_REPTYPE.XMLLoad e_list, LoadMode
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
  node.setAttribute "DESTSRV", m_DestSrv_ID
  If Not (DestSrv Is Nothing) Then
    node.setAttribute "DESTSRV_BRIEF", DestSrv.Brief
  Else
    node.setAttribute "DESTSRV_BRIEF", m_DestSrv_ID_BRIEF
  End If
  node.setAttribute "LASTSCAN", CDbl(LastScan)
  node.setAttribute "CONFIG", Config
  node.setAttribute "LASTRECEIVE", CDbl(LastReceive)
  node.setAttribute "PROVIDER", m_Provider_ID
  If Not (Provider Is Nothing) Then
    node.setAttribute "PROVIDER_BRIEF", Provider.Brief
  Else
    node.setAttribute "PROVIDER_BRIEF", m_Provider_ID_BRIEF
  End If
  node.setAttribute "WORK_START", CDbl(Work_Start)
  node.setAttribute "WORK_END", CDbl(Work_End)
  node.setAttribute "THE_INTERVAL", The_Interval
  node.setAttribute "ISACTIVE", IsActive
  node.setAttribute "LASTAPPROVELOG", CDbl(LastApproveLog)
  node.setAttribute "AccessTime", CDbl(m_AccessTime)
  REPD_CONST.XMLSave node, xdom
  REPD_REPTYPE.XMLSave node, xdom
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
m_IsLocked = Application.MTZSession.IsLocked("REPD_SNDTO", id)
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
OK = Application.MTZSession.LockResource("REPD_SNDTO", id, Permanent)
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
Application.MTZSession.UnLockResource "REPD_SNDTO", id
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
CanLock = Application.MTZSession.CanLock("REPD_SNDTO", id)
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
 REPD_CONST.BatchUpdate
 REPD_REPTYPE.BatchUpdate
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
  REPD_CONST.LoadAll
  REPD_REPTYPE.LoadAll
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
 Case "REPD_CONST"
    item.REPD_CONST.Refresh
    For i = 1 To item.REPD_CONST.Count
    nid = CreateGUID2() & item.REPD_CONST.item(i).id
    tree.nodes.Add(key, 4, nid, item.REPD_CONST.item(i).Brief(True)).Tag = "Row"
    Next
 Case "REPD_REPTYPE"
    item.REPD_REPTYPE.Refresh
    For i = 1 To item.REPD_REPTYPE.Count
    nid = CreateGUID2() & item.REPD_REPTYPE.item(i).id
    tree.nodes.Add(key, 4, nid, item.REPD_REPTYPE.item(i).Brief(True)).Tag = "Row"
    Next
 End Select
End If ' mode="" (Default)
End Sub



