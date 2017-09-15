VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "OBJECTMODE"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'строка раздела Режим работы
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
Private m_STRUCTRESTRICTION As STRUCTRESTRICTION_col
Private m_FIELDRESTRICTION As FIELDRESTRICTION_col
Private m_METHODRESTRICTION As METHODRESTRICTION_col
Private m_Name As String
Private m_DefaultMode As enumBoolean
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
  PartName = "OBJECTMODE"
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
  m_Application.Logger.Message "OBJECTMODE.Init"
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

'Данные дочернего раздела Органичения разделов
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса STRUCTRESTRICTION_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as STRUCTRESTRICTION_col
' Set variable = me. STRUCTRESTRICTION (...параметры...)
Public Property Get STRUCTRESTRICTION(Optional ByVal Refresh As Boolean = True) As STRUCTRESTRICTION_col
 If m_STRUCTRESTRICTION Is Nothing Then
   Set m_STRUCTRESTRICTION = New STRUCTRESTRICTION_col
   Set m_STRUCTRESTRICTION.Parent = Me
   Set m_STRUCTRESTRICTION.Application = Me.Application
   If Refresh Then m_STRUCTRESTRICTION.Refresh
 End If
 Set STRUCTRESTRICTION = m_STRUCTRESTRICTION
End Property

'Данные дочернего раздела Ограничения полей
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса FIELDRESTRICTION_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as FIELDRESTRICTION_col
' Set variable = me. FIELDRESTRICTION (...параметры...)
Public Property Get FIELDRESTRICTION(Optional ByVal Refresh As Boolean = True) As FIELDRESTRICTION_col
 If m_FIELDRESTRICTION Is Nothing Then
   Set m_FIELDRESTRICTION = New FIELDRESTRICTION_col
   Set m_FIELDRESTRICTION.Parent = Me
   Set m_FIELDRESTRICTION.Application = Me.Application
   If Refresh Then m_FIELDRESTRICTION.Refresh
 End If
 Set FIELDRESTRICTION = m_FIELDRESTRICTION
End Property

'Данные дочернего раздела Ограничения методов
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса METHODRESTRICTION_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as METHODRESTRICTION_col
' Set variable = me. METHODRESTRICTION (...параметры...)
Public Property Get METHODRESTRICTION(Optional ByVal Refresh As Boolean = True) As METHODRESTRICTION_col
 If m_METHODRESTRICTION Is Nothing Then
   Set m_METHODRESTRICTION = New METHODRESTRICTION_col
   Set m_METHODRESTRICTION.Parent = Me
   Set m_METHODRESTRICTION.Application = Me.Application
   If Refresh Then m_METHODRESTRICTION.Refresh
 End If
 Set METHODRESTRICTION = m_METHODRESTRICTION
End Property
' let
'Название режима

'Название режима
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

'Название режима
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
'Этот режим является основным режимом работы объекта

'Этот режим является основным режимом работы объекта
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DefaultMode(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DefaultMode", DefaultMode, NewValue

   m_DefaultMode = NewValue
End If
End Property

'Этот режим является основным режимом работы объекта
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. DefaultMode
Public Property Get DefaultMode() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   DefaultMode = m_DefaultMode
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

  Set nvi = nv.Add("Name", m_Name)
nvi.ValueSize = 5
  Set nvi = nv.Add("DefaultMode", m_DefaultMode)
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
 m_Brief = m_Brief & Name & "; "
Select Case DefaultMode
Case Boolean_Da
   m_Brief = m_Brief & "Да; "
Case Boolean_Net
   m_Brief = m_Brief & "Нет; "
End Select 'DefaultMode
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

m_Name = nv.item("Name").Value
m_DefaultMode = nv.item("DefaultMode").Value
m_TheComment = nv.item("TheComment").Value
Else

m_Name = nv.Fields("Name").Value
m_DefaultMode = nv.Fields("DefaultMode").Value
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
   Dim o As OBJECTMODE
   Set o = New OBJECTMODE
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
  err.Raise err.Number, "OBJECTMODE.Save", err.Description
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
  err.Raise err.Number, "OBJECTMODE.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("OBJECTMODE", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "OBJECTMODE.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "OBJECTMODE", id
Exit Sub
bye:
  err.Raise err.Number, "OBJECTMODE.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

If Not m_STRUCTRESTRICTION Is Nothing Then
  m_STRUCTRESTRICTION.CloseClass
  Set m_STRUCTRESTRICTION = Nothing
End If
If Not m_FIELDRESTRICTION Is Nothing Then
  m_FIELDRESTRICTION.CloseClass
  Set m_FIELDRESTRICTION = Nothing
End If
If Not m_METHODRESTRICTION Is Nothing Then
  m_METHODRESTRICTION.CloseClass
  Set m_METHODRESTRICTION = Nothing
End If
 If Not Application Is Nothing Then Application.Logger.Message "OBJECTMODE.CloseClass"
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
   Set m_FindObject = STRUCTRESTRICTION.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = FIELDRESTRICTION.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = METHODRESTRICTION.FindObject(StrID, InstID)
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

STRUCTRESTRICTION.Compact
FIELDRESTRICTION.Compact
METHODRESTRICTION.Compact
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
  DefaultMode = node.Attributes.getNamedItem("DEFAULTMODE").nodeValue
  TheComment = Replace(node.Attributes.getNamedItem("THECOMMENT").nodeValue, vbLf, vbCrLf)
  On Error GoTo bye
  'if m_ChangeTime >= m_RetriveTime then m_Changed = true
  m_Changed = True
  m_RowRetrived = True
  m_Brief = ""
  On Error Resume Next
  Set e_list = node.selectNodes("STRUCTRESTRICTION_COL")
  STRUCTRESTRICTION.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("FIELDRESTRICTION_COL")
  FIELDRESTRICTION.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("METHODRESTRICTION_COL")
  METHODRESTRICTION.XMLLoad e_list, LoadMode
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
  node.setAttribute "NAME", Name
  node.setAttribute "DEFAULTMODE", DefaultMode
  node.setAttribute "THECOMMENT", TheComment
  node.setAttribute "AccessTime", CDbl(m_AccessTime)
  STRUCTRESTRICTION.XMLSave node, xdom
  FIELDRESTRICTION.XMLSave node, xdom
  METHODRESTRICTION.XMLSave node, xdom
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
m_IsLocked = Application.MTZSession.IsLocked("OBJECTMODE", id)
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
OK = Application.MTZSession.LockResource("OBJECTMODE", id, Permanent)
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
Application.MTZSession.UnLockResource "OBJECTMODE", id
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
CanLock = Application.MTZSession.CanLock("OBJECTMODE", id)
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
 STRUCTRESTRICTION.BatchUpdate
 FIELDRESTRICTION.BatchUpdate
 METHODRESTRICTION.BatchUpdate
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
  STRUCTRESTRICTION.LoadAll
  FIELDRESTRICTION.LoadAll
  METHODRESTRICTION.LoadAll
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
 Case "STRUCTRESTRICTION"
    item.STRUCTRESTRICTION.Refresh
    For i = 1 To item.STRUCTRESTRICTION.Count
    nid = CreateGUID2() & item.STRUCTRESTRICTION.item(i).id
    tree.nodes.Add(key, 4, nid, item.STRUCTRESTRICTION.item(i).Brief(True)).Tag = "Row"
    Next
 Case "FIELDRESTRICTION"
    item.FIELDRESTRICTION.Refresh
    For i = 1 To item.FIELDRESTRICTION.Count
    nid = CreateGUID2() & item.FIELDRESTRICTION.item(i).id
    tree.nodes.Add(key, 4, nid, item.FIELDRESTRICTION.item(i).Brief(True)).Tag = "Row"
    Next
 Case "METHODRESTRICTION"
    item.METHODRESTRICTION.Refresh
    For i = 1 To item.METHODRESTRICTION.Count
    nid = CreateGUID2() & item.METHODRESTRICTION.item(i).id
    tree.nodes.Add(key, 4, nid, item.METHODRESTRICTION.item(i).Brief(True)).Tag = "Row"
    Next
 End Select
End If ' mode="" (Default)
End Sub



