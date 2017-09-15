VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "PEKD_DIRECTION"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'строка раздела Направление перевозки
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
Private m_PEKD_TRAINS As PEKD_TRAINS_col
Private m_PEKD_DIRSTATION As PEKD_DIRSTATION_col
Private m_Town As Object
Dim m_Town_ID As String
Dim m_Town_ID_BRIEF As String
Private m_Name As String
Private m_Dept As Object
Dim m_Dept_ID As String
Dim m_Dept_ID_BRIEF As String
Private m_Srok As String
Private m_the_Rule As String
Private m_POSTINDEX As String
Private m_TheTransport As Object
Dim m_TheTransport_ID As String
Dim m_TheTransport_ID_BRIEF As String
Private m_TheAgent As Object
Dim m_TheAgent_ID As String
Dim m_TheAgent_ID_BRIEF As String
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
  PartName = "PEKD_DIRECTION"
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
  m_Application.Logger.Message "PEKD_DIRECTION.Init"
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

'Данные дочернего раздела Маршруты
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса PEKD_TRAINS_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as PEKD_TRAINS_col
' Set variable = me. PEKD_TRAINS (...параметры...)
Public Property Get PEKD_TRAINS(Optional ByVal Refresh As Boolean = True) As PEKD_TRAINS_col
 If m_PEKD_TRAINS Is Nothing Then
   Set m_PEKD_TRAINS = New PEKD_TRAINS_col
   Set m_PEKD_TRAINS.Parent = Me
   Set m_PEKD_TRAINS.Application = Me.Application
   If Refresh Then m_PEKD_TRAINS.Refresh
 End If
 Set PEKD_TRAINS = m_PEKD_TRAINS
End Property

'Данные дочернего раздела Точки доставки
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса PEKD_DIRSTATION_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as PEKD_DIRSTATION_col
' Set variable = me. PEKD_DIRSTATION (...параметры...)
Public Property Get PEKD_DIRSTATION(Optional ByVal Refresh As Boolean = True) As PEKD_DIRSTATION_col
 If m_PEKD_DIRSTATION Is Nothing Then
   Set m_PEKD_DIRSTATION = New PEKD_DIRSTATION_col
   Set m_PEKD_DIRSTATION.Parent = Me
   Set m_PEKD_DIRSTATION.Application = Me.Application
   If Refresh Then m_PEKD_DIRSTATION.Refresh
 End If
 Set PEKD_DIRSTATION = m_PEKD_DIRSTATION
End Property
' let
'Город

'Город
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set Town(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Town", Town, NewValue
On Error Resume Next
m_Town_ID = ""
m_Town_ID = NewValue.id
'  set   m_Town= newValue
End If
End Property

'Город
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Town
Public Property Get Town() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_Town As Object
If m_Town_ID <> "" Then
  Set tmp_Town = Application.FindRowObject("ENTDIC_TOWN", m_Town_ID)
  If tmp_Town Is Nothing Then
    m_Town_ID_BRIEF = ""
  Else
    m_Town_ID_BRIEF = tmp_Town.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "ENTDIC_TOWN" & m_Town_ID, tmp_Town
  Set Town = tmp_Town
  Exit Property
End If
  '  set Town = m_Town
End Property
' let
'Направление

'Направление
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

'Направление
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
Public Property Set Dept(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Dept", Dept, NewValue
On Error Resume Next
m_Dept_ID = ""
m_Dept_ID = NewValue.id
'  set   m_Dept= newValue
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
' Set variable = me. Dept
Public Property Get Dept() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_Dept As Object
If m_Dept_ID <> "" Then
  Set tmp_Dept = Application.FindRowObject("PEKD_DEPT", m_Dept_ID)
  If tmp_Dept Is Nothing Then
    m_Dept_ID_BRIEF = ""
  Else
    m_Dept_ID_BRIEF = tmp_Dept.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PEKD_DEPT" & m_Dept_ID, tmp_Dept
  Set Dept = tmp_Dept
  Exit Property
End If
  '  set Dept = m_Dept
End Property
' let
'Срок доставки

'Срок доставки
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Srok(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Srok", Srok, NewValue

   m_Srok = NewValue
End If
End Property

'Срок доставки
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. Srok
Public Property Get Srok() As String
 LoadFromDatabase
 AccessTime = Now

   Srok = m_Srok
End Property
' let
'Отправка

'Отправка
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let the_Rule(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "the_Rule", the_Rule, NewValue

   m_the_Rule = NewValue
End If
End Property

'Отправка
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. the_Rule
Public Property Get the_Rule() As String
 LoadFromDatabase
 AccessTime = Now

   the_Rule = m_the_Rule
End Property
' let
'Почтовый индекс

'Почтовый индекс
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let POSTINDEX(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "POSTINDEX", POSTINDEX, NewValue

   m_POSTINDEX = NewValue
End If
End Property

'Почтовый индекс
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. POSTINDEX
Public Property Get POSTINDEX() As String
 LoadFromDatabase
 AccessTime = Now

   POSTINDEX = m_POSTINDEX
End Property
' let
'Транспорт

'Транспорт
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TheTransport(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheTransport", TheTransport, NewValue
On Error Resume Next
m_TheTransport_ID = ""
m_TheTransport_ID = NewValue.id
'  set   m_TheTransport= newValue
End If
End Property

'Транспорт
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TheTransport
Public Property Get TheTransport() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TheTransport As Object
If m_TheTransport_ID <> "" Then
  Set tmp_TheTransport = Application.FindRowObject("ENTDIC_TransportType", m_TheTransport_ID)
  If tmp_TheTransport Is Nothing Then
    m_TheTransport_ID_BRIEF = ""
  Else
    m_TheTransport_ID_BRIEF = tmp_TheTransport.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "ENTDIC_TransportType" & m_TheTransport_ID, tmp_TheTransport
  Set TheTransport = tmp_TheTransport
  Exit Property
End If
  '  set TheTransport = m_TheTransport
End Property
' let
'Агент

'Агент
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TheAgent(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheAgent", TheAgent, NewValue
On Error Resume Next
m_TheAgent_ID = ""
m_TheAgent_ID = NewValue.id
' set   m_TheAgent= newValue
End If
End Property

'Агент
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TheAgent
Public Property Get TheAgent() As Object
 LoadFromDatabase
 AccessTime = Now
If m_TheAgent_ID <> "" Then
  Set TheAgent = Application.Manager.GetInstanceObject(Right(m_TheAgent_ID, 38))
 Exit Property
End If
  ' set TheAgent = m_TheAgent
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

 ' Reference to ENTDIC_TOWN
    If m_Town_ID = "" Then
       Set nvi = nv.Add("Town", "")
    Else
       Set nvi = nv.Add("Town", m_Town_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("Name", m_Name)
nvi.ValueSize = 255
 ' Reference to PEKD_DEPT
    If m_Dept_ID = "" Then
       Set nvi = nv.Add("Dept", "")
    Else
       Set nvi = nv.Add("Dept", m_Dept_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("Srok", m_Srok)
nvi.ValueSize = 255
  Set nvi = nv.Add("the_Rule", m_the_Rule)
nvi.ValueSize = 255
  Set nvi = nv.Add("POSTINDEX", m_POSTINDEX)
nvi.ValueSize = 20
 ' Reference to ENTDIC_TransportType
    If m_TheTransport_ID = "" Then
       Set nvi = nv.Add("TheTransport", "")
    Else
       Set nvi = nv.Add("TheTransport", m_TheTransport_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to object
    If m_TheAgent_ID = "" Then
       Set nvi = nv.Add("TheAgent", "")
    Else
       Set nvi = nv.Add("TheAgent", m_TheAgent_ID)
    End If
    nvi.ORACLE_GUID
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

  m_Town_ID = nv.item("Town").Value
m_Name = nv.item("Name").Value
  m_Dept_ID = nv.item("Dept").Value
m_Srok = nv.item("Srok").Value
m_the_Rule = nv.item("the_Rule").Value
m_POSTINDEX = nv.item("POSTINDEX").Value
  m_TheTransport_ID = nv.item("TheTransport").Value
  m_TheAgent_ID = nv.item("TheAgent").Value
Else

  m_Town_ID = nv.Fields("Town").Value
m_Name = nv.Fields("Name").Value
  m_Dept_ID = nv.Fields("Dept").Value
m_Srok = nv.Fields("Srok").Value
m_the_Rule = nv.Fields("the_Rule").Value
m_POSTINDEX = nv.Fields("POSTINDEX").Value
  m_TheTransport_ID = nv.Fields("TheTransport").Value
  m_TheAgent_ID = nv.Fields("TheAgent").Value
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
   Dim o As PEKD_DIRECTION
   Set o = New PEKD_DIRECTION
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
  err.Raise err.Number, "PEKD_DIRECTION.Save", err.Description
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
  err.Raise err.Number, "PEKD_DIRECTION.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("PEKD_DIRECTION", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "PEKD_DIRECTION.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "PEKD_DIRECTION", id
Exit Sub
bye:
  err.Raise err.Number, "PEKD_DIRECTION.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

If Not m_PEKD_TRAINS Is Nothing Then
  m_PEKD_TRAINS.CloseClass
  Set m_PEKD_TRAINS = Nothing
End If
If Not m_PEKD_DIRSTATION Is Nothing Then
  m_PEKD_DIRSTATION.CloseClass
  Set m_PEKD_DIRSTATION = Nothing
End If
 m_Town_ID = ""
 Set m_Town = Nothing
 m_Dept_ID = ""
 Set m_Dept = Nothing
 m_TheTransport_ID = ""
 Set m_TheTransport = Nothing
 m_TheAgent_ID = ""
 Set m_TheAgent = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "PEKD_DIRECTION.CloseClass"
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
   Set m_FindObject = PEKD_TRAINS.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = PEKD_DIRSTATION.FindObject(StrID, InstID)
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

PEKD_TRAINS.Compact
PEKD_DIRSTATION.Compact
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
  Set Town = Nothing
  m_Town_ID = node.Attributes.getNamedItem("TOWN").nodeValue
  m_Town_ID_BRIEF = node.Attributes.getNamedItem("TOWN_BRIEF").nodeValue
  Name = Replace(node.Attributes.getNamedItem("NAME").nodeValue, vbLf, vbCrLf)
  Set Dept = Nothing
  m_Dept_ID = node.Attributes.getNamedItem("DEPT").nodeValue
  m_Dept_ID_BRIEF = node.Attributes.getNamedItem("DEPT_BRIEF").nodeValue
  Srok = Replace(node.Attributes.getNamedItem("SROK").nodeValue, vbLf, vbCrLf)
  the_Rule = Replace(node.Attributes.getNamedItem("THE_RULE").nodeValue, vbLf, vbCrLf)
  POSTINDEX = Replace(node.Attributes.getNamedItem("POSTINDEX").nodeValue, vbLf, vbCrLf)
  Set TheTransport = Nothing
  m_TheTransport_ID = node.Attributes.getNamedItem("THETRANSPORT").nodeValue
  m_TheTransport_ID_BRIEF = node.Attributes.getNamedItem("THETRANSPORT_BRIEF").nodeValue
  Set TheAgent = Nothing
  m_TheAgent_ID = node.Attributes.getNamedItem("THEAGENT").nodeValue
  m_TheAgent_ID_BRIEF = node.Attributes.getNamedItem("THEAGENT_BRIEF").nodeValue
  On Error GoTo bye
  'if m_ChangeTime >= m_RetriveTime then m_Changed = true
  m_Changed = True
  m_RowRetrived = True
  m_Brief = ""
  On Error Resume Next
  Set e_list = node.selectNodes("PEKD_TRAINS_COL")
  PEKD_TRAINS.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("PEKD_DIRSTATION_COL")
  PEKD_DIRSTATION.XMLLoad e_list, LoadMode
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
  node.setAttribute "TOWN", m_Town_ID
  If Not (Town Is Nothing) Then
    node.setAttribute "TOWN_BRIEF", Town.Brief
  Else
    node.setAttribute "TOWN_BRIEF", m_Town_ID_BRIEF
  End If
  node.setAttribute "NAME", Name
  node.setAttribute "DEPT", m_Dept_ID
  If Not (Dept Is Nothing) Then
    node.setAttribute "DEPT_BRIEF", Dept.Brief
  Else
    node.setAttribute "DEPT_BRIEF", m_Dept_ID_BRIEF
  End If
  node.setAttribute "SROK", Srok
  node.setAttribute "THE_RULE", the_Rule
  node.setAttribute "POSTINDEX", POSTINDEX
  node.setAttribute "THETRANSPORT", m_TheTransport_ID
  If Not (TheTransport Is Nothing) Then
    node.setAttribute "THETRANSPORT_BRIEF", TheTransport.Brief
  Else
    node.setAttribute "THETRANSPORT_BRIEF", m_TheTransport_ID_BRIEF
  End If
  node.setAttribute "THEAGENT", m_TheAgent_ID
  If Not (TheAgent Is Nothing) Then
    node.setAttribute "THEAGENT_BRIEF", TheAgent.Brief
  Else
    node.setAttribute "THEAGENT_BRIEF", m_TheAgent_ID_BRIEF
  End If
  node.setAttribute "AccessTime", CDbl(m_AccessTime)
  PEKD_TRAINS.XMLSave node, xdom
  PEKD_DIRSTATION.XMLSave node, xdom
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
m_IsLocked = Application.MTZSession.IsLocked("PEKD_DIRECTION", id)
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
OK = Application.MTZSession.LockResource("PEKD_DIRECTION", id, Permanent)
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
Application.MTZSession.UnLockResource "PEKD_DIRECTION", id
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
CanLock = Application.MTZSession.CanLock("PEKD_DIRECTION", id)
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
 PEKD_TRAINS.BatchUpdate
 PEKD_DIRSTATION.BatchUpdate
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
  PEKD_TRAINS.LoadAll
  PEKD_DIRSTATION.LoadAll
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
If mode = "admi" Then
 Select Case child
 Case "PEKD_TRAINS"
    item.PEKD_TRAINS.Refresh
    For i = 1 To item.PEKD_TRAINS.Count
      nid = CreateGUID2() & item.PEKD_TRAINS.item(i).id & child
      tree.nodes.Add(key, 4, nid, item.PEKD_TRAINS.item(i).Brief(True)).Tag = "Row"
    Next
 Case "PEKD_DIRSTATION"
    item.PEKD_DIRSTATION.Refresh
    For i = 1 To item.PEKD_DIRSTATION.Count
      nid = CreateGUID2() & item.PEKD_DIRSTATION.item(i).id & child
      tree.nodes.Add(key, 4, nid, item.PEKD_DIRSTATION.item(i).Brief(True)).Tag = "Row"
    Next
End Select
End If ' mode="admi"
If mode = "main" Then
 Select Case child
 Case "PEKD_TRAINS"
    item.PEKD_TRAINS.Refresh
    For i = 1 To item.PEKD_TRAINS.Count
      nid = CreateGUID2() & item.PEKD_TRAINS.item(i).id & child
      tree.nodes.Add(key, 4, nid, item.PEKD_TRAINS.item(i).Brief(True)).Tag = "Row"
    Next
 Case "PEKD_DIRSTATION"
    item.PEKD_DIRSTATION.Refresh
    For i = 1 To item.PEKD_DIRSTATION.Count
      nid = CreateGUID2() & item.PEKD_DIRSTATION.item(i).id & child
      tree.nodes.Add(key, 4, nid, item.PEKD_DIRSTATION.item(i).Brief(True)).Tag = "Row"
    Next
End Select
End If ' mode="main"
If mode = "" Then
 Select Case child
 Case "PEKD_TRAINS"
    item.PEKD_TRAINS.Refresh
    For i = 1 To item.PEKD_TRAINS.Count
    nid = CreateGUID2() & item.PEKD_TRAINS.item(i).id
    tree.nodes.Add(key, 4, nid, item.PEKD_TRAINS.item(i).Brief(True)).Tag = "Row"
    Next
 Case "PEKD_DIRSTATION"
    item.PEKD_DIRSTATION.Refresh
    For i = 1 To item.PEKD_DIRSTATION.Count
    nid = CreateGUID2() & item.PEKD_DIRSTATION.item(i).id
    tree.nodes.Add(key, 4, nid, item.PEKD_DIRSTATION.item(i).Brief(True)).Tag = "Row"
    Next
 End Select
End If ' mode="" (Default)
End Sub



