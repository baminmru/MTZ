VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "wpPal_def"
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
Private m_TheNumber As String
Private m_TheWeight As Double
Private m_WeightingDate As Date
Private m_palType As Object
Dim m_palType_ID As String
Dim m_palType_ID_BRIEF As String
Private m_LockedForIn As Object
Dim m_LockedForIn_ID As String
Dim m_LockedForIn_ID_BRIEF As String
Private m_LockedForOut As Object
Dim m_LockedForOut_ID As String
Dim m_LockedForOut_ID_BRIEF As String
Private m_TheCell As Object
Dim m_TheCell_ID As String
Dim m_TheCell_ID_BRIEF As String
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
  PartName = "wpPal_def"
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
  m_Application.Logger.Message "wpPal_def.Init"
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
'Номер паллеты

'Номер паллеты
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TheNumber(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheNumber", TheNumber, NewValue

   m_TheNumber = NewValue
End If
End Property

'Номер паллеты
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. TheNumber
Public Property Get TheNumber() As String
 LoadFromDatabase
 AccessTime = Now

   TheNumber = m_TheNumber
End Property
' let
'Вес паллеты

'Вес паллеты
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TheWeight(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheWeight", TheWeight, NewValue

   m_TheWeight = NewValue
End If
End Property

'Вес паллеты
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. TheWeight
Public Property Get TheWeight() As Double
 LoadFromDatabase
 AccessTime = Now

   TheWeight = m_TheWeight
End Property
' let
'Дата взвешивания

'Дата взвешивания
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let WeightingDate(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "WeightingDate", WeightingDate, NewValue

   m_WeightingDate = NewValue
End If
End Property

'Дата взвешивания
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. WeightingDate
Public Property Get WeightingDate() As Date
 LoadFromDatabase
 AccessTime = Now

   WeightingDate = m_WeightingDate
End Property
' let
'Тип паллеты

'Тип паллеты
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set palType(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "palType", palType, NewValue
On Error Resume Next
m_palType_ID = ""
m_palType_ID = NewValue.id
'  set   m_palType= newValue
End If
End Property

'Тип паллеты
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. palType
Public Property Get palType() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_palType As Object
If m_palType_ID <> "" Then
  Set tmp_palType = Application.FindRowObject("wpDic_paltype", m_palType_ID)
  If tmp_palType Is Nothing Then
    m_palType_ID_BRIEF = ""
  Else
    m_palType_ID_BRIEF = tmp_palType.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "wpDic_paltype" & m_palType_ID, tmp_palType
  Set palType = tmp_palType
  Exit Property
End If
  '  set palType = m_palType
End Property
' let
'Заблокирована для приемки

'Заблокирована для приемки
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set LockedForIn(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "LockedForIn", LockedForIn, NewValue
On Error Resume Next
m_LockedForIn_ID = ""
m_LockedForIn_ID = NewValue.id
'  set   m_LockedForIn= newValue
End If
End Property

'Заблокирована для приемки
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. LockedForIn
Public Property Get LockedForIn() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_LockedForIn As Object
If m_LockedForIn_ID <> "" Then
  Set tmp_LockedForIn = Application.FindRowObject("wpIn_def", m_LockedForIn_ID)
  If tmp_LockedForIn Is Nothing Then
    m_LockedForIn_ID_BRIEF = ""
  Else
    m_LockedForIn_ID_BRIEF = tmp_LockedForIn.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "wpIn_def" & m_LockedForIn_ID, tmp_LockedForIn
  Set LockedForIn = tmp_LockedForIn
  Exit Property
End If
  '  set LockedForIn = m_LockedForIn
End Property
' let
'Заблокирована для отгрузки

'Заблокирована для отгрузки
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set LockedForOut(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "LockedForOut", LockedForOut, NewValue
On Error Resume Next
m_LockedForOut_ID = ""
m_LockedForOut_ID = NewValue.id
'  set   m_LockedForOut= newValue
End If
End Property

'Заблокирована для отгрузки
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. LockedForOut
Public Property Get LockedForOut() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_LockedForOut As Object
If m_LockedForOut_ID <> "" Then
  Set tmp_LockedForOut = Application.FindRowObject("wpOut_def", m_LockedForOut_ID)
  If tmp_LockedForOut Is Nothing Then
    m_LockedForOut_ID_BRIEF = ""
  Else
    m_LockedForOut_ID_BRIEF = tmp_LockedForOut.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "wpOut_def" & m_LockedForOut_ID, tmp_LockedForOut
  Set LockedForOut = tmp_LockedForOut
  Exit Property
End If
  '  set LockedForOut = m_LockedForOut
End Property
' let
'Текущая ячейка

'Текущая ячейка
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TheCell(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheCell", TheCell, NewValue
On Error Resume Next
m_TheCell_ID = ""
m_TheCell_ID = NewValue.id
'  set   m_TheCell= newValue
End If
End Property

'Текущая ячейка
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TheCell
Public Property Get TheCell() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TheCell As Object
If m_TheCell_ID <> "" Then
  Set tmp_TheCell = Application.FindRowObject("wpcell_cell", m_TheCell_ID)
  If tmp_TheCell Is Nothing Then
    m_TheCell_ID_BRIEF = ""
  Else
    m_TheCell_ID_BRIEF = tmp_TheCell.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "wpcell_cell" & m_TheCell_ID, tmp_TheCell
  Set TheCell = tmp_TheCell
  Exit Property
End If
  '  set TheCell = m_TheCell
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

  Set nvi = nv.Add("TheNumber", m_TheNumber)
nvi.ValueSize = 10
  Set nvi = nv.Add("TheWeight", m_TheWeight)
nvi.ValueType = adDouble
  Set nvi = nv.Add("WeightingDate", m_WeightingDate)
nvi.ValueType = adDBTimeStamp
 ' Reference to wpDic_paltype
    If m_palType_ID = "" Then
       Set nvi = nv.Add("palType", "")
    Else
       Set nvi = nv.Add("palType", m_palType_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to wpIn_def
    If m_LockedForIn_ID = "" Then
       Set nvi = nv.Add("LockedForIn", "")
    Else
       Set nvi = nv.Add("LockedForIn", m_LockedForIn_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to wpOut_def
    If m_LockedForOut_ID = "" Then
       Set nvi = nv.Add("LockedForOut", "")
    Else
       Set nvi = nv.Add("LockedForOut", m_LockedForOut_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to wpcell_cell
    If m_TheCell_ID = "" Then
       Set nvi = nv.Add("TheCell", "")
    Else
       Set nvi = nv.Add("TheCell", m_TheCell_ID)
    End If
    nvi.ORACLE_GUID
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
m_TheWeight = nv.item("TheWeight").Value
m_WeightingDate = nv.item("WeightingDate").Value
  m_palType_ID = nv.item("palType").Value
  m_LockedForIn_ID = nv.item("LockedForIn").Value
  m_LockedForOut_ID = nv.item("LockedForOut").Value
  m_TheCell_ID = nv.item("TheCell").Value
m_S_code = nv.item("S_code").Value
Else

m_TheNumber = nv.Fields("TheNumber").Value
m_TheWeight = nv.Fields("TheWeight").Value
m_WeightingDate = nv.Fields("WeightingDate").Value
  m_palType_ID = nv.Fields("palType").Value
  m_LockedForIn_ID = nv.Fields("LockedForIn").Value
  m_LockedForOut_ID = nv.Fields("LockedForOut").Value
  m_TheCell_ID = nv.Fields("TheCell").Value
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
   Dim o As wpPal_def
   Set o = New wpPal_def
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
  err.Raise err.Number, "wpPal_def.Save", err.Description
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
  err.Raise err.Number, "wpPal_def.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("wpPal_def", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "wpPal_def.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "wpPal_def", id
Exit Sub
bye:
  err.Raise err.Number, "wpPal_def.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 m_palType_ID = ""
 Set m_palType = Nothing
 m_LockedForIn_ID = ""
 Set m_LockedForIn = Nothing
 m_LockedForOut_ID = ""
 Set m_LockedForOut = Nothing
 m_TheCell_ID = ""
 Set m_TheCell = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "wpPal_def.CloseClass"
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
  TheNumber = Replace(node.Attributes.getNamedItem("THENUMBER").nodeValue, vbLf, vbCrLf)
  TheWeight = Val(Replace(node.Attributes.getNamedItem("THEWEIGHT").nodeValue, vbLf, vbCrLf))
  WeightingDate = node.Attributes.getNamedItem("WEIGHTINGDATE").nodeValue
  Set palType = Nothing
  m_palType_ID = node.Attributes.getNamedItem("PALTYPE").nodeValue
  m_palType_ID_BRIEF = node.Attributes.getNamedItem("PALTYPE_BRIEF").nodeValue
  Set LockedForIn = Nothing
  m_LockedForIn_ID = node.Attributes.getNamedItem("LOCKEDFORIN").nodeValue
  m_LockedForIn_ID_BRIEF = node.Attributes.getNamedItem("LOCKEDFORIN_BRIEF").nodeValue
  Set LockedForOut = Nothing
  m_LockedForOut_ID = node.Attributes.getNamedItem("LOCKEDFOROUT").nodeValue
  m_LockedForOut_ID_BRIEF = node.Attributes.getNamedItem("LOCKEDFOROUT_BRIEF").nodeValue
  Set TheCell = Nothing
  m_TheCell_ID = node.Attributes.getNamedItem("THECELL").nodeValue
  m_TheCell_ID_BRIEF = node.Attributes.getNamedItem("THECELL_BRIEF").nodeValue
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
  node.setAttribute "THENUMBER", TheNumber
  node.setAttribute "THEWEIGHT", Replace(CStr(TheWeight), ",", ".")
  node.setAttribute "WEIGHTINGDATE", CDbl(WeightingDate)
  node.setAttribute "PALTYPE", m_palType_ID
  If Not (palType Is Nothing) Then
    node.setAttribute "PALTYPE_BRIEF", palType.Brief
  Else
    node.setAttribute "PALTYPE_BRIEF", m_palType_ID_BRIEF
  End If
  node.setAttribute "LOCKEDFORIN", m_LockedForIn_ID
  If Not (LockedForIn Is Nothing) Then
    node.setAttribute "LOCKEDFORIN_BRIEF", LockedForIn.Brief
  Else
    node.setAttribute "LOCKEDFORIN_BRIEF", m_LockedForIn_ID_BRIEF
  End If
  node.setAttribute "LOCKEDFOROUT", m_LockedForOut_ID
  If Not (LockedForOut Is Nothing) Then
    node.setAttribute "LOCKEDFOROUT_BRIEF", LockedForOut.Brief
  Else
    node.setAttribute "LOCKEDFOROUT_BRIEF", m_LockedForOut_ID_BRIEF
  End If
  node.setAttribute "THECELL", m_TheCell_ID
  If Not (TheCell Is Nothing) Then
    node.setAttribute "THECELL_BRIEF", TheCell.Brief
  Else
    node.setAttribute "THECELL_BRIEF", m_TheCell_ID_BRIEF
  End If
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
m_IsLocked = Application.MTZSession.IsLocked("wpPal_def", id)
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
OK = Application.MTZSession.LockResource("wpPal_def", id, Permanent)
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
Application.MTZSession.UnLockResource "wpPal_def", id
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
CanLock = Application.MTZSession.CanLock("wpPal_def", id)
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
If mode = "admi" Then
 Select Case child
End Select
End If ' mode="admi"
If mode = "main" Then
 Select Case child
End Select
End If ' mode="main"
If mode = "" Then
 Select Case child
 End Select
End If ' mode="" (Default)
End Sub



