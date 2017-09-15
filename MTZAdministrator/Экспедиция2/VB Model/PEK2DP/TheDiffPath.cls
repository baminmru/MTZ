VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TheDiffPath"
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
Private m_DopUslTo As DopUslTo_col
Private m_DopUslFrom As DopUslFrom_col
Private m_TheNumber As Long
Private m_TempTownFrom As Object
Dim m_TempTownFrom_ID As String
Dim m_TempTownFrom_ID_BRIEF As String
Private m_Direction As Object
Dim m_Direction_ID As String
Dim m_Direction_ID_BRIEF As String
Private m_TempDirStation As Object
Dim m_TempDirStation_ID As String
Dim m_TempDirStation_ID_BRIEF As String
Private m_Transporter As Object
Dim m_Transporter_ID As String
Dim m_Transporter_ID_BRIEF As String
Private m_Transport As Object
Dim m_Transport_ID As String
Dim m_Transport_ID_BRIEF As String
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
  PartName = "TheDiffPath"
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
  m_Application.Logger.Message "TheDiffPath.Init"
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

'Данные дочернего раздела Доп. услуги в точке прибытия
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса DopUslTo_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as DopUslTo_col
' Set variable = me. DopUslTo (...параметры...)
Public Property Get DopUslTo(Optional ByVal Refresh As Boolean = True) As DopUslTo_col
 If m_DopUslTo Is Nothing Then
   Set m_DopUslTo = New DopUslTo_col
   Set m_DopUslTo.Parent = Me
   Set m_DopUslTo.Application = Me.Application
   If Refresh Then m_DopUslTo.Refresh
 End If
 Set DopUslTo = m_DopUslTo
End Property

'Данные дочернего раздела Доп. услуги в точке отправления
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса DopUslFrom_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as DopUslFrom_col
' Set variable = me. DopUslFrom (...параметры...)
Public Property Get DopUslFrom(Optional ByVal Refresh As Boolean = True) As DopUslFrom_col
 If m_DopUslFrom Is Nothing Then
   Set m_DopUslFrom = New DopUslFrom_col
   Set m_DopUslFrom.Parent = Me
   Set m_DopUslFrom.Application = Me.Application
   If Refresh Then m_DopUslFrom.Refresh
 End If
 Set DopUslFrom = m_DopUslFrom
End Property
' let
'Номер сегмента в Сложном Маршруте

'Номер сегмента в Сложном Маршруте
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

'Номер сегмента в Сложном Маршруте
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
'Промежуточный пункт отправления

'Промежуточный пункт отправления
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TempTownFrom(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TempTownFrom", TempTownFrom, NewValue
On Error Resume Next
m_TempTownFrom_ID = ""
m_TempTownFrom_ID = NewValue.id
'  set   m_TempTownFrom= newValue
End If
End Property

'Промежуточный пункт отправления
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TempTownFrom
Public Property Get TempTownFrom() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TempTownFrom As Object
If m_TempTownFrom_ID <> "" Then
  Set tmp_TempTownFrom = Application.FindRowObject("ENTDIC_TOWN", m_TempTownFrom_ID)
  If tmp_TempTownFrom Is Nothing Then
    m_TempTownFrom_ID_BRIEF = ""
  Else
    m_TempTownFrom_ID_BRIEF = tmp_TempTownFrom.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "ENTDIC_TOWN" & m_TempTownFrom_ID, tmp_TempTownFrom
  Set TempTownFrom = tmp_TempTownFrom
  Exit Property
End If
  '  set TempTownFrom = m_TempTownFrom
End Property
' let
'Направление

'Направление
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set Direction(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Direction", Direction, NewValue
On Error Resume Next
m_Direction_ID = ""
m_Direction_ID = NewValue.id
'  set   m_Direction= newValue
End If
End Property

'Направление
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Direction
Public Property Get Direction() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_Direction As Object
If m_Direction_ID <> "" Then
  Set tmp_Direction = Application.FindRowObject("PEKD_DIRECTION", m_Direction_ID)
  If tmp_Direction Is Nothing Then
    m_Direction_ID_BRIEF = ""
  Else
    m_Direction_ID_BRIEF = tmp_Direction.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PEKD_DIRECTION" & m_Direction_ID, tmp_Direction
  Set Direction = tmp_Direction
  Exit Property
End If
  '  set Direction = m_Direction
End Property
' let
'Промежуточный пункт прибытия

'Промежуточный пункт прибытия
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TempDirStation(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TempDirStation", TempDirStation, NewValue
On Error Resume Next
m_TempDirStation_ID = ""
m_TempDirStation_ID = NewValue.id
'  set   m_TempDirStation= newValue
End If
End Property

'Промежуточный пункт прибытия
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TempDirStation
Public Property Get TempDirStation() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TempDirStation As Object
If m_TempDirStation_ID <> "" Then
  Set tmp_TempDirStation = Application.FindRowObject("PEKD_DIRSTATION", m_TempDirStation_ID)
  If tmp_TempDirStation Is Nothing Then
    m_TempDirStation_ID_BRIEF = ""
  Else
    m_TempDirStation_ID_BRIEF = tmp_TempDirStation.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PEKD_DIRSTATION" & m_TempDirStation_ID, tmp_TempDirStation
  Set TempDirStation = tmp_TempDirStation
  Exit Property
End If
  '  set TempDirStation = m_TempDirStation
End Property
' let
'Перевозчик

'Перевозчик
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set Transporter(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Transporter", Transporter, NewValue
On Error Resume Next
m_Transporter_ID = ""
m_Transporter_ID = NewValue.id
' set   m_Transporter= newValue
End If
End Property

'Перевозчик
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Transporter
Public Property Get Transporter() As Object
 LoadFromDatabase
 AccessTime = Now
If m_Transporter_ID <> "" Then
  Set Transporter = Application.Manager.GetInstanceObject(Right(m_Transporter_ID, 38))
 Exit Property
End If
  ' set Transporter = m_Transporter
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
Public Property Set Transport(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Transport", Transport, NewValue
On Error Resume Next
m_Transport_ID = ""
m_Transport_ID = NewValue.id
'  set   m_Transport= newValue
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
' Set variable = me. Transport
Public Property Get Transport() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_Transport As Object
If m_Transport_ID <> "" Then
  Set tmp_Transport = Application.FindRowObject("ENTDIC_TransportType", m_Transport_ID)
  If tmp_Transport Is Nothing Then
    m_Transport_ID_BRIEF = ""
  Else
    m_Transport_ID_BRIEF = tmp_Transport.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "ENTDIC_TransportType" & m_Transport_ID, tmp_Transport
  Set Transport = tmp_Transport
  Exit Property
End If
  '  set Transport = m_Transport
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

  Set nvi = nv.Add("TheNumber", m_TheNumber)
nvi.ValueType = adInteger
 ' Reference to ENTDIC_TOWN
    If m_TempTownFrom_ID = "" Then
       Set nvi = nv.Add("TempTownFrom", "")
    Else
       Set nvi = nv.Add("TempTownFrom", m_TempTownFrom_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to PEKD_DIRECTION
    If m_Direction_ID = "" Then
       Set nvi = nv.Add("Direction", "")
    Else
       Set nvi = nv.Add("Direction", m_Direction_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to PEKD_DIRSTATION
    If m_TempDirStation_ID = "" Then
       Set nvi = nv.Add("TempDirStation", "")
    Else
       Set nvi = nv.Add("TempDirStation", m_TempDirStation_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to object
    If m_Transporter_ID = "" Then
       Set nvi = nv.Add("Transporter", "")
    Else
       Set nvi = nv.Add("Transporter", m_Transporter_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to ENTDIC_TransportType
    If m_Transport_ID = "" Then
       Set nvi = nv.Add("Transport", "")
    Else
       Set nvi = nv.Add("Transport", m_Transport_ID)
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
 m_Brief = m_Brief & TheNumber & "; "
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

m_TheNumber = nv.item("TheNumber").Value
  m_TempTownFrom_ID = nv.item("TempTownFrom").Value
  m_Direction_ID = nv.item("Direction").Value
  m_TempDirStation_ID = nv.item("TempDirStation").Value
  m_Transporter_ID = nv.item("Transporter").Value
  m_Transport_ID = nv.item("Transport").Value
Else

m_TheNumber = nv.Fields("TheNumber").Value
  m_TempTownFrom_ID = nv.Fields("TempTownFrom").Value
  m_Direction_ID = nv.Fields("Direction").Value
  m_TempDirStation_ID = nv.Fields("TempDirStation").Value
  m_Transporter_ID = nv.Fields("Transporter").Value
  m_Transport_ID = nv.Fields("Transport").Value
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
   Dim o As TheDiffPath
   Set o = New TheDiffPath
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
  err.Raise err.Number, "TheDiffPath.Save", err.Description
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
  err.Raise err.Number, "TheDiffPath.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("TheDiffPath", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "TheDiffPath.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "TheDiffPath", id
Exit Sub
bye:
  err.Raise err.Number, "TheDiffPath.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

If Not m_DopUslTo Is Nothing Then
  m_DopUslTo.CloseClass
  Set m_DopUslTo = Nothing
End If
If Not m_DopUslFrom Is Nothing Then
  m_DopUslFrom.CloseClass
  Set m_DopUslFrom = Nothing
End If
 m_TempTownFrom_ID = ""
 Set m_TempTownFrom = Nothing
 m_Direction_ID = ""
 Set m_Direction = Nothing
 m_TempDirStation_ID = ""
 Set m_TempDirStation = Nothing
 m_Transporter_ID = ""
 Set m_Transporter = Nothing
 m_Transport_ID = ""
 Set m_Transport = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "TheDiffPath.CloseClass"
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
   Set m_FindObject = DopUslTo.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = DopUslFrom.FindObject(StrID, InstID)
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

DopUslTo.Compact
DopUslFrom.Compact
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
  TheNumber = node.Attributes.getNamedItem("THENUMBER").nodeValue
  Set TempTownFrom = Nothing
  m_TempTownFrom_ID = node.Attributes.getNamedItem("TEMPTOWNFROM").nodeValue
  m_TempTownFrom_ID_BRIEF = node.Attributes.getNamedItem("TEMPTOWNFROM_BRIEF").nodeValue
  Set Direction = Nothing
  m_Direction_ID = node.Attributes.getNamedItem("DIRECTION").nodeValue
  m_Direction_ID_BRIEF = node.Attributes.getNamedItem("DIRECTION_BRIEF").nodeValue
  Set TempDirStation = Nothing
  m_TempDirStation_ID = node.Attributes.getNamedItem("TEMPDIRSTATION").nodeValue
  m_TempDirStation_ID_BRIEF = node.Attributes.getNamedItem("TEMPDIRSTATION_BRIEF").nodeValue
  Set Transporter = Nothing
  m_Transporter_ID = node.Attributes.getNamedItem("TRANSPORTER").nodeValue
  m_Transporter_ID_BRIEF = node.Attributes.getNamedItem("TRANSPORTER_BRIEF").nodeValue
  Set Transport = Nothing
  m_Transport_ID = node.Attributes.getNamedItem("TRANSPORT").nodeValue
  m_Transport_ID_BRIEF = node.Attributes.getNamedItem("TRANSPORT_BRIEF").nodeValue
  On Error GoTo bye
  'if m_ChangeTime >= m_RetriveTime then m_Changed = true
  m_Changed = True
  m_RowRetrived = True
  m_Brief = ""
  On Error Resume Next
  Set e_list = node.selectNodes("DOPUSLTO_COL")
  DopUslTo.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("DOPUSLFROM_COL")
  DopUslFrom.XMLLoad e_list, LoadMode
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
  node.setAttribute "THENUMBER", TheNumber
  node.setAttribute "TEMPTOWNFROM", m_TempTownFrom_ID
  If Not (TempTownFrom Is Nothing) Then
    node.setAttribute "TEMPTOWNFROM_BRIEF", TempTownFrom.Brief
  Else
    node.setAttribute "TEMPTOWNFROM_BRIEF", m_TempTownFrom_ID_BRIEF
  End If
  node.setAttribute "DIRECTION", m_Direction_ID
  If Not (Direction Is Nothing) Then
    node.setAttribute "DIRECTION_BRIEF", Direction.Brief
  Else
    node.setAttribute "DIRECTION_BRIEF", m_Direction_ID_BRIEF
  End If
  node.setAttribute "TEMPDIRSTATION", m_TempDirStation_ID
  If Not (TempDirStation Is Nothing) Then
    node.setAttribute "TEMPDIRSTATION_BRIEF", TempDirStation.Brief
  Else
    node.setAttribute "TEMPDIRSTATION_BRIEF", m_TempDirStation_ID_BRIEF
  End If
  node.setAttribute "TRANSPORTER", m_Transporter_ID
  If Not (Transporter Is Nothing) Then
    node.setAttribute "TRANSPORTER_BRIEF", Transporter.Brief
  Else
    node.setAttribute "TRANSPORTER_BRIEF", m_Transporter_ID_BRIEF
  End If
  node.setAttribute "TRANSPORT", m_Transport_ID
  If Not (Transport Is Nothing) Then
    node.setAttribute "TRANSPORT_BRIEF", Transport.Brief
  Else
    node.setAttribute "TRANSPORT_BRIEF", m_Transport_ID_BRIEF
  End If
  node.setAttribute "AccessTime", CDbl(m_AccessTime)
  DopUslTo.XMLSave node, xdom
  DopUslFrom.XMLSave node, xdom
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
m_IsLocked = Application.MTZSession.IsLocked("TheDiffPath", id)
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
OK = Application.MTZSession.LockResource("TheDiffPath", id, Permanent)
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
Application.MTZSession.UnLockResource "TheDiffPath", id
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
CanLock = Application.MTZSession.CanLock("TheDiffPath", id)
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
 DopUslTo.BatchUpdate
 DopUslFrom.BatchUpdate
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
  DopUslTo.LoadAll
  DopUslFrom.LoadAll
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
If mode = "R" Then
 Select Case child
 Case "DopUslTo"
    item.DopUslTo.Refresh
    For i = 1 To item.DopUslTo.Count
      nid = CreateGUID2() & item.DopUslTo.item(i).id & child
      tree.nodes.Add(key, 4, nid, item.DopUslTo.item(i).Brief(True)).Tag = "Row"
    Next
 Case "DopUslFrom"
    item.DopUslFrom.Refresh
    For i = 1 To item.DopUslFrom.Count
      nid = CreateGUID2() & item.DopUslFrom.item(i).id & child
      tree.nodes.Add(key, 4, nid, item.DopUslFrom.item(i).Brief(True)).Tag = "Row"
    Next
End Select
End If ' mode="R"
If mode = "" Then
 Select Case child
 Case "DopUslTo"
    item.DopUslTo.Refresh
    For i = 1 To item.DopUslTo.Count
    nid = CreateGUID2() & item.DopUslTo.item(i).id
    tree.nodes.Add(key, 4, nid, item.DopUslTo.item(i).Brief(True)).Tag = "Row"
    Next
 Case "DopUslFrom"
    item.DopUslFrom.Refresh
    For i = 1 To item.DopUslFrom.Count
    nid = CreateGUID2() & item.DopUslFrom.item(i).id
    tree.nodes.Add(key, 4, nid, item.DopUslFrom.item(i).Brief(True)).Tag = "Row"
    Next
 End Select
End If ' mode="" (Default)
End Sub



