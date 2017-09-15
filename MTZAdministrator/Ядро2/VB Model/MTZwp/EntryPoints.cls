VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "EntryPoints"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'строка раздела Меню
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
Private m_EntryPoints As EntryPoints_col
Private m_EPFilterLink As EPFilterLink_col
Private m_sequence As Long
Private m_Name As String
Private m_Caption As String
Private m_AsToolbarItem As enumBoolean
Private m_ActionType As enumMenuActionType
Private m_TheFilter As Object
Dim m_TheFilter_ID As String
Dim m_TheFilter_ID_BRIEF As String
Private m_Journal As Object
Dim m_Journal_ID As String
Dim m_Journal_ID_BRIEF As String
Private m_Report As Object
Dim m_Report_ID As String
Dim m_Report_ID_BRIEF As String
Private m_Document As Object
Dim m_Document_ID As String
Dim m_Document_ID_BRIEF As String
Private m_Method As Object
Dim m_Method_ID As String
Dim m_Method_ID_BRIEF As String
Private m_IconFile As String
Private m_TheExtention As Object
Dim m_TheExtention_ID As String
Dim m_TheExtention_ID_BRIEF As String
Private m_ARM As Object
Dim m_ARM_ID As String
Dim m_ARM_ID_BRIEF As String
Private m_TheComment As String
Private m_ObjectType As Object
Dim m_ObjectType_ID As String
Dim m_ObjectType_ID_BRIEF As String
Private m_JournalFixedQuery As String
Private m_AllowAdd As enumBoolean
Private m_AllowEdit As enumBoolean
Private m_AllowDel As enumBoolean
Private m_AllowFilter As enumBoolean
Private m_AllowPrint As enumBoolean
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
  PartName = "EntryPoints"
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
  m_Application.Logger.Message "EntryPoints.Init"
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

'Данные поддерева раздела Меню
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса EntryPoints_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as EntryPoints_col
' Set variable = me. EntryPoints (...параметры...)
Public Property Get EntryPoints(Optional ByVal Refresh As Boolean = True) As EntryPoints_col
 If m_EntryPoints Is Nothing Then
   Set m_EntryPoints = New EntryPoints_col
   Set m_EntryPoints.Parent = Me
   Set m_EntryPoints.Application = Me.Application
   If Refresh Then m_EntryPoints.Refresh
 End If
 Set EntryPoints = m_EntryPoints
End Property

'Данные дочернего раздела Привязка фильтра
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса EPFilterLink_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as EPFilterLink_col
' Set variable = me. EPFilterLink (...параметры...)
Public Property Get EPFilterLink(Optional ByVal Refresh As Boolean = True) As EPFilterLink_col
 If m_EPFilterLink Is Nothing Then
   Set m_EPFilterLink = New EPFilterLink_col
   Set m_EPFilterLink.Parent = Me
   Set m_EPFilterLink.Application = Me.Application
   If Refresh Then m_EPFilterLink.Refresh
 End If
 Set EPFilterLink = m_EPFilterLink
End Property
' let
'Последовательность

'Последовательность
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let sequence(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "sequence", sequence, NewValue

   m_sequence = NewValue
End If
End Property

'Последовательность
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. sequence
Public Property Get sequence() As Long
 LoadFromDatabase
 AccessTime = Now

   sequence = m_sequence
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
'Включить в тулбар

'Включить в тулбар
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let AsToolbarItem(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "AsToolbarItem", AsToolbarItem, NewValue

   m_AsToolbarItem = NewValue
End If
End Property

'Включить в тулбар
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. AsToolbarItem
Public Property Get AsToolbarItem() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   AsToolbarItem = m_AsToolbarItem
End Property
' let
'Вариант действия

'Вариант действия
'Parameters:
'[IN]   newValue , тип параметра: enumMenuActionType  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ActionType(ByVal NewValue As enumMenuActionType)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ActionType", ActionType, NewValue

   m_ActionType = NewValue
End If
End Property

'Вариант действия
'Parameters:
' параметров нет
'Returns:
'  объект класса enumMenuActionType
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumMenuActionType
' Set variable = me. ActionType
Public Property Get ActionType() As enumMenuActionType
 LoadFromDatabase
 AccessTime = Now

   ActionType = m_ActionType
End Property
' let
'Фильтр

'Фильтр
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TheFilter(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheFilter", TheFilter, NewValue
On Error Resume Next
m_TheFilter_ID = ""
m_TheFilter_ID = NewValue.id
' set   m_TheFilter= newValue
End If
End Property

'Фильтр
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TheFilter
Public Property Get TheFilter() As Object
 LoadFromDatabase
 AccessTime = Now
If m_TheFilter_ID <> "" Then
  Set TheFilter = Application.Manager.GetInstanceObject(Right(m_TheFilter_ID, 38))
 Exit Property
End If
  ' set TheFilter = m_TheFilter
End Property
' let
'Журнал

'Журнал
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set Journal(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Journal", Journal, NewValue
On Error Resume Next
m_Journal_ID = ""
m_Journal_ID = NewValue.id
' set   m_Journal= newValue
End If
End Property

'Журнал
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Journal
Public Property Get Journal() As Object
 LoadFromDatabase
 AccessTime = Now
If m_Journal_ID <> "" Then
  Set Journal = Application.Manager.GetInstanceObject(Right(m_Journal_ID, 38))
 Exit Property
End If
  ' set Journal = m_Journal
End Property
' let
'Отчет

'Отчет
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set Report(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Report", Report, NewValue
On Error Resume Next
m_Report_ID = ""
m_Report_ID = NewValue.id
' set   m_Report= newValue
End If
End Property

'Отчет
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Report
Public Property Get Report() As Object
 LoadFromDatabase
 AccessTime = Now
If m_Report_ID <> "" Then
  Set Report = Application.Manager.GetInstanceObject(Right(m_Report_ID, 38))
 Exit Property
End If
  ' set Report = m_Report
End Property
' let
'Документ

'Документ
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set Document(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Document", Document, NewValue
On Error Resume Next
m_Document_ID = ""
m_Document_ID = NewValue.id
' set   m_Document= newValue
End If
End Property

'Документ
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Document
Public Property Get Document() As Object
 LoadFromDatabase
 AccessTime = Now
If m_Document_ID <> "" Then
  Set Document = Application.Manager.GetInstanceObject(Right(m_Document_ID, 38))
 Exit Property
End If
  ' set Document = m_Document
End Property
' let
'Метод

'Метод
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set Method(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Method", Method, NewValue
On Error Resume Next
m_Method_ID = ""
m_Method_ID = NewValue.id
'  set   m_Method= newValue
End If
End Property

'Метод
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Method
Public Property Get Method() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_Method As Object
If m_Method_ID <> "" Then
  Set tmp_Method = Application.FindRowObject("SHAREDMETHOD", m_Method_ID)
  If tmp_Method Is Nothing Then
    m_Method_ID_BRIEF = ""
  Else
    m_Method_ID_BRIEF = tmp_Method.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "SHAREDMETHOD" & m_Method_ID, tmp_Method
  Set Method = tmp_Method
  Exit Property
End If
  '  set Method = m_Method
End Property
' let
'Файл картинки

'Файл картинки
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IconFile(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IconFile", IconFile, NewValue

   m_IconFile = NewValue
End If
End Property

'Файл картинки
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. IconFile
Public Property Get IconFile() As String
 LoadFromDatabase
 AccessTime = Now

   IconFile = m_IconFile
End Property
' let
'Расширение

'Расширение
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TheExtention(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheExtention", TheExtention, NewValue
On Error Resume Next
m_TheExtention_ID = ""
m_TheExtention_ID = NewValue.id
' set   m_TheExtention= newValue
End If
End Property

'Расширение
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TheExtention
Public Property Get TheExtention() As Object
 LoadFromDatabase
 AccessTime = Now
If m_TheExtention_ID <> "" Then
  Set TheExtention = Application.Manager.GetInstanceObject(Right(m_TheExtention_ID, 38))
 Exit Property
End If
  ' set TheExtention = m_TheExtention
End Property
' let
'АРМ

'АРМ
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set ARM(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ARM", ARM, NewValue
On Error Resume Next
m_ARM_ID = ""
m_ARM_ID = NewValue.id
' set   m_ARM= newValue
End If
End Property

'АРМ
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. ARM
Public Property Get ARM() As Object
 LoadFromDatabase
 AccessTime = Now
If m_ARM_ID <> "" Then
  Set ARM = Application.Manager.GetInstanceObject(Right(m_ARM_ID, 38))
 Exit Property
End If
  ' set ARM = m_ARM
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
'Тип документа

'Тип документа
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set ObjectType(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ObjectType", ObjectType, NewValue
On Error Resume Next
m_ObjectType_ID = ""
m_ObjectType_ID = NewValue.id
'  set   m_ObjectType= newValue
End If
End Property

'Тип документа
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. ObjectType
Public Property Get ObjectType() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_ObjectType As Object
If m_ObjectType_ID <> "" Then
  Set tmp_ObjectType = Application.FindRowObject("OBJECTTYPE", m_ObjectType_ID)
  If tmp_ObjectType Is Nothing Then
    m_ObjectType_ID_BRIEF = ""
  Else
    m_ObjectType_ID_BRIEF = tmp_ObjectType.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "OBJECTTYPE" & m_ObjectType_ID, tmp_ObjectType
  Set ObjectType = tmp_ObjectType
  Exit Property
End If
  '  set ObjectType = m_ObjectType
End Property
' let
'Ограничения к журналу

'Ограничения к журналу
'Parameters:
'[IN]   newValue , тип параметра: STRING  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let JournalFixedQuery(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "JournalFixedQuery", JournalFixedQuery, NewValue

   m_JournalFixedQuery = NewValue
End If
End Property

'Ограничения к журналу
'Parameters:
' параметров нет
'Returns:
'  значение типа STRING
'See Also:
'Example:
' dim variable as STRING
' variable = me. JournalFixedQuery
Public Property Get JournalFixedQuery() As String
 LoadFromDatabase
 AccessTime = Now

   JournalFixedQuery = m_JournalFixedQuery
End Property
' let
'Разрешено добавление

'Разрешено добавление
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let AllowAdd(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "AllowAdd", AllowAdd, NewValue

   m_AllowAdd = NewValue
End If
End Property

'Разрешено добавление
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. AllowAdd
Public Property Get AllowAdd() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   AllowAdd = m_AllowAdd
End Property
' let
'Разрешено редактирование

'Разрешено редактирование
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let AllowEdit(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "AllowEdit", AllowEdit, NewValue

   m_AllowEdit = NewValue
End If
End Property

'Разрешено редактирование
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. AllowEdit
Public Property Get AllowEdit() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   AllowEdit = m_AllowEdit
End Property
' let
'Рарешено удаление

'Рарешено удаление
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let AllowDel(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "AllowDel", AllowDel, NewValue

   m_AllowDel = NewValue
End If
End Property

'Рарешено удаление
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. AllowDel
Public Property Get AllowDel() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   AllowDel = m_AllowDel
End Property
' let
'Разрешен фильтр

'Разрешен фильтр
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let AllowFilter(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "AllowFilter", AllowFilter, NewValue

   m_AllowFilter = NewValue
End If
End Property

'Разрешен фильтр
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. AllowFilter
Public Property Get AllowFilter() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   AllowFilter = m_AllowFilter
End Property
' let
'Разрешена печать

'Разрешена печать
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let AllowPrint(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "AllowPrint", AllowPrint, NewValue

   m_AllowPrint = NewValue
End If
End Property

'Разрешена печать
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. AllowPrint
Public Property Get AllowPrint() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   AllowPrint = m_AllowPrint
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
  Set nvi = nv.Add("sequence", m_sequence)
nvi.ValueType = adInteger
  Set nvi = nv.Add("Name", m_Name)
nvi.ValueSize = 38
  Set nvi = nv.Add("Caption", m_Caption)
nvi.ValueSize = 255
  Set nvi = nv.Add("AsToolbarItem", m_AsToolbarItem)
nvi.ValueType = adInteger
  Set nvi = nv.Add("ActionType", m_ActionType)
nvi.ValueType = adInteger
 ' Reference to object
    If m_TheFilter_ID = "" Then
       Set nvi = nv.Add("TheFilter", "")
    Else
       Set nvi = nv.Add("TheFilter", m_TheFilter_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to object
    If m_Journal_ID = "" Then
       Set nvi = nv.Add("Journal", "")
    Else
       Set nvi = nv.Add("Journal", m_Journal_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to object
    If m_Report_ID = "" Then
       Set nvi = nv.Add("Report", "")
    Else
       Set nvi = nv.Add("Report", m_Report_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to object
    If m_Document_ID = "" Then
       Set nvi = nv.Add("Document", "")
    Else
       Set nvi = nv.Add("Document", m_Document_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to SHAREDMETHOD
    If m_Method_ID = "" Then
       Set nvi = nv.Add("Method", "")
    Else
       Set nvi = nv.Add("Method", m_Method_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("IconFile", m_IconFile)
nvi.ValueSize = 2000
 ' Reference to object
    If m_TheExtention_ID = "" Then
       Set nvi = nv.Add("TheExtention", "")
    Else
       Set nvi = nv.Add("TheExtention", m_TheExtention_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to object
    If m_ARM_ID = "" Then
       Set nvi = nv.Add("ARM", "")
    Else
       Set nvi = nv.Add("ARM", m_ARM_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("TheComment", m_TheComment)
 ' Reference to OBJECTTYPE
    If m_ObjectType_ID = "" Then
       Set nvi = nv.Add("ObjectType", "")
    Else
       Set nvi = nv.Add("ObjectType", m_ObjectType_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("JournalFixedQuery", m_JournalFixedQuery)
  Set nvi = nv.Add("AllowAdd", m_AllowAdd)
nvi.ValueType = adInteger
  Set nvi = nv.Add("AllowEdit", m_AllowEdit)
nvi.ValueType = adInteger
  Set nvi = nv.Add("AllowDel", m_AllowDel)
nvi.ValueType = adInteger
  Set nvi = nv.Add("AllowFilter", m_AllowFilter)
nvi.ValueType = adInteger
  Set nvi = nv.Add("AllowPrint", m_AllowPrint)
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
 m_Brief = m_Brief & Name & "; "
 m_Brief = m_Brief & Caption & "; "
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

m_sequence = nv.item("sequence").Value
m_Name = nv.item("Name").Value
m_Caption = nv.item("Caption").Value
m_AsToolbarItem = nv.item("AsToolbarItem").Value
m_ActionType = nv.item("ActionType").Value
  m_TheFilter_ID = nv.item("TheFilter").Value
  m_Journal_ID = nv.item("Journal").Value
  m_Report_ID = nv.item("Report").Value
  m_Document_ID = nv.item("Document").Value
  m_Method_ID = nv.item("Method").Value
m_IconFile = nv.item("IconFile").Value
  m_TheExtention_ID = nv.item("TheExtention").Value
  m_ARM_ID = nv.item("ARM").Value
m_TheComment = nv.item("TheComment").Value
  m_ObjectType_ID = nv.item("ObjectType").Value
m_JournalFixedQuery = nv.item("JournalFixedQuery").Value
m_AllowAdd = nv.item("AllowAdd").Value
m_AllowEdit = nv.item("AllowEdit").Value
m_AllowDel = nv.item("AllowDel").Value
m_AllowFilter = nv.item("AllowFilter").Value
m_AllowPrint = nv.item("AllowPrint").Value
Else

m_sequence = nv.Fields("sequence").Value
m_Name = nv.Fields("Name").Value
m_Caption = nv.Fields("Caption").Value
m_AsToolbarItem = nv.Fields("AsToolbarItem").Value
m_ActionType = nv.Fields("ActionType").Value
  m_TheFilter_ID = nv.Fields("TheFilter").Value
  m_Journal_ID = nv.Fields("Journal").Value
  m_Report_ID = nv.Fields("Report").Value
  m_Document_ID = nv.Fields("Document").Value
  m_Method_ID = nv.Fields("Method").Value
m_IconFile = nv.Fields("IconFile").Value
  m_TheExtention_ID = nv.Fields("TheExtention").Value
  m_ARM_ID = nv.Fields("ARM").Value
m_TheComment = nv.Fields("TheComment").Value
  m_ObjectType_ID = nv.Fields("ObjectType").Value
m_JournalFixedQuery = nv.Fields("JournalFixedQuery").Value
m_AllowAdd = nv.Fields("AllowAdd").Value
m_AllowEdit = nv.Fields("AllowEdit").Value
m_AllowDel = nv.Fields("AllowDel").Value
m_AllowFilter = nv.Fields("AllowFilter").Value
m_AllowPrint = nv.Fields("AllowPrint").Value
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
   Dim o As EntryPoints
   Set o = New EntryPoints
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
   While TypeName(tmpParent.Parent.Parent) = "EntryPoints"
     Set tmpParent = tmpParent.Parent.Parent
   Wend
     Application.MTZSession.SaveRow2 PartName, id, tmpParent.Parent.Parent.id, nv, Application.id
   Changed = False
   Save = True
Exit Function
bye:
  err.Raise err.Number, "EntryPoints.Save", err.Description
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
   For i = 1 To EntryPoints.Count
     EntryPoints.Delete (i)
   Next
  m_Deleted = True
  Delete = True
Else
  If Not CanChangeONLine Then Exit Function
   OK = True
   While OK And EntryPoints.Count > 0
     OK = EntryPoints.Delete(1)
   Wend
   If Not OK Then Exit Function
   Delete = Application.MTZSession.DeleteRow2(PartName, id, Application.id)
   Changed = False
   'Compact
   CloseClass
End If
Exit Function
bye:
  err.Raise err.Number, "EntryPoints.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("EntryPoints", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "EntryPoints.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "EntryPoints", id
Exit Sub
bye:
  err.Raise err.Number, "EntryPoints.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

If Not m_EntryPoints Is Nothing Then
  m_EntryPoints.CloseClass
  Set m_EntryPoints = Nothing
End If
If Not m_EPFilterLink Is Nothing Then
  m_EPFilterLink.CloseClass
  Set m_EPFilterLink = Nothing
End If
 m_TheFilter_ID = ""
 Set m_TheFilter = Nothing
 m_Journal_ID = ""
 Set m_Journal = Nothing
 m_Report_ID = ""
 Set m_Report = Nothing
 m_Document_ID = ""
 Set m_Document = Nothing
 m_Method_ID = ""
 Set m_Method = Nothing
 m_TheExtention_ID = ""
 Set m_TheExtention = Nothing
 m_ARM_ID = ""
 Set m_ARM = Nothing
 m_ObjectType_ID = ""
 Set m_ObjectType = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "EntryPoints.CloseClass"
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
   Set m_FindObject = EntryPoints.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = EPFilterLink.FindObject(StrID, InstID)
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

EntryPoints.Compact
EPFilterLink.Compact
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
  sequence = node.Attributes.getNamedItem("SEQUENCE").nodeValue
  Name = Replace(node.Attributes.getNamedItem("NAME").nodeValue, vbLf, vbCrLf)
  Caption = Replace(node.Attributes.getNamedItem("CAPTION").nodeValue, vbLf, vbCrLf)
  AsToolbarItem = node.Attributes.getNamedItem("ASTOOLBARITEM").nodeValue
  ActionType = node.Attributes.getNamedItem("ACTIONTYPE").nodeValue
  Set TheFilter = Nothing
  m_TheFilter_ID = node.Attributes.getNamedItem("THEFILTER").nodeValue
  m_TheFilter_ID_BRIEF = node.Attributes.getNamedItem("THEFILTER_BRIEF").nodeValue
  Set Journal = Nothing
  m_Journal_ID = node.Attributes.getNamedItem("JOURNAL").nodeValue
  m_Journal_ID_BRIEF = node.Attributes.getNamedItem("JOURNAL_BRIEF").nodeValue
  Set Report = Nothing
  m_Report_ID = node.Attributes.getNamedItem("REPORT").nodeValue
  m_Report_ID_BRIEF = node.Attributes.getNamedItem("REPORT_BRIEF").nodeValue
  Set Document = Nothing
  m_Document_ID = node.Attributes.getNamedItem("DOCUMENT").nodeValue
  m_Document_ID_BRIEF = node.Attributes.getNamedItem("DOCUMENT_BRIEF").nodeValue
  Set Method = Nothing
  m_Method_ID = node.Attributes.getNamedItem("METHOD").nodeValue
  m_Method_ID_BRIEF = node.Attributes.getNamedItem("METHOD_BRIEF").nodeValue
  IconFile = Replace(node.Attributes.getNamedItem("ICONFILE").nodeValue, vbLf, vbCrLf)
  Set TheExtention = Nothing
  m_TheExtention_ID = node.Attributes.getNamedItem("THEEXTENTION").nodeValue
  m_TheExtention_ID_BRIEF = node.Attributes.getNamedItem("THEEXTENTION_BRIEF").nodeValue
  Set ARM = Nothing
  m_ARM_ID = node.Attributes.getNamedItem("ARM").nodeValue
  m_ARM_ID_BRIEF = node.Attributes.getNamedItem("ARM_BRIEF").nodeValue
  TheComment = Replace(node.Attributes.getNamedItem("THECOMMENT").nodeValue, vbLf, vbCrLf)
  Set ObjectType = Nothing
  m_ObjectType_ID = node.Attributes.getNamedItem("OBJECTTYPE").nodeValue
  m_ObjectType_ID_BRIEF = node.Attributes.getNamedItem("OBJECTTYPE_BRIEF").nodeValue
  JournalFixedQuery = Replace(node.Attributes.getNamedItem("JOURNALFIXEDQUERY").nodeValue, vbLf, vbCrLf)
  AllowAdd = node.Attributes.getNamedItem("ALLOWADD").nodeValue
  AllowEdit = node.Attributes.getNamedItem("ALLOWEDIT").nodeValue
  AllowDel = node.Attributes.getNamedItem("ALLOWDEL").nodeValue
  AllowFilter = node.Attributes.getNamedItem("ALLOWFILTER").nodeValue
  AllowPrint = node.Attributes.getNamedItem("ALLOWPRINT").nodeValue
  On Error GoTo bye
  'if m_ChangeTime >= m_RetriveTime then m_Changed = true
  m_Changed = True
  m_RowRetrived = True
  m_Brief = ""
  On Error Resume Next
  Set e_list = node.selectNodes("ENTRYPOINTS_COL")
  EntryPoints.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("EPFILTERLINK_COL")
  EPFilterLink.XMLLoad e_list, LoadMode
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
  node.setAttribute "SEQUENCE", sequence
  node.setAttribute "NAME", Name
  node.setAttribute "CAPTION", Caption
  node.setAttribute "ASTOOLBARITEM", AsToolbarItem
  node.setAttribute "ACTIONTYPE", ActionType
  node.setAttribute "THEFILTER", m_TheFilter_ID
  If Not (TheFilter Is Nothing) Then
    node.setAttribute "THEFILTER_BRIEF", TheFilter.Brief
  Else
    node.setAttribute "THEFILTER_BRIEF", m_TheFilter_ID_BRIEF
  End If
  node.setAttribute "JOURNAL", m_Journal_ID
  If Not (Journal Is Nothing) Then
    node.setAttribute "JOURNAL_BRIEF", Journal.Brief
  Else
    node.setAttribute "JOURNAL_BRIEF", m_Journal_ID_BRIEF
  End If
  node.setAttribute "REPORT", m_Report_ID
  If Not (Report Is Nothing) Then
    node.setAttribute "REPORT_BRIEF", Report.Brief
  Else
    node.setAttribute "REPORT_BRIEF", m_Report_ID_BRIEF
  End If
  node.setAttribute "DOCUMENT", m_Document_ID
  If Not (Document Is Nothing) Then
    node.setAttribute "DOCUMENT_BRIEF", Document.Brief
  Else
    node.setAttribute "DOCUMENT_BRIEF", m_Document_ID_BRIEF
  End If
  node.setAttribute "METHOD", m_Method_ID
  If Not (Method Is Nothing) Then
    node.setAttribute "METHOD_BRIEF", Method.Brief
  Else
    node.setAttribute "METHOD_BRIEF", m_Method_ID_BRIEF
  End If
  node.setAttribute "ICONFILE", IconFile
  node.setAttribute "THEEXTENTION", m_TheExtention_ID
  If Not (TheExtention Is Nothing) Then
    node.setAttribute "THEEXTENTION_BRIEF", TheExtention.Brief
  Else
    node.setAttribute "THEEXTENTION_BRIEF", m_TheExtention_ID_BRIEF
  End If
  node.setAttribute "ARM", m_ARM_ID
  If Not (ARM Is Nothing) Then
    node.setAttribute "ARM_BRIEF", ARM.Brief
  Else
    node.setAttribute "ARM_BRIEF", m_ARM_ID_BRIEF
  End If
  node.setAttribute "THECOMMENT", TheComment
  node.setAttribute "OBJECTTYPE", m_ObjectType_ID
  If Not (ObjectType Is Nothing) Then
    node.setAttribute "OBJECTTYPE_BRIEF", ObjectType.Brief
  Else
    node.setAttribute "OBJECTTYPE_BRIEF", m_ObjectType_ID_BRIEF
  End If
  node.setAttribute "JOURNALFIXEDQUERY", JournalFixedQuery
  node.setAttribute "ALLOWADD", AllowAdd
  node.setAttribute "ALLOWEDIT", AllowEdit
  node.setAttribute "ALLOWDEL", AllowDel
  node.setAttribute "ALLOWFILTER", AllowFilter
  node.setAttribute "ALLOWPRINT", AllowPrint
  node.setAttribute "AccessTime", CDbl(m_AccessTime)
  EntryPoints.XMLSave node, xdom
  EPFilterLink.XMLSave node, xdom
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
m_IsLocked = Application.MTZSession.IsLocked("EntryPoints", id)
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
OK = Application.MTZSession.LockResource("EntryPoints", id, Permanent)
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
Application.MTZSession.UnLockResource "EntryPoints", id
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
CanLock = Application.MTZSession.CanLock("EntryPoints", id)
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
 EPFilterLink.BatchUpdate
  EntryPoints.BatchUpdate
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
  EPFilterLink.LoadAll
    EntryPoints.LoadAll
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
 Case "EntryPoints"
    item.EntryPoints.Refresh
    For i = 1 To item.EntryPoints.Count
    nid = CreateGUID2() & item.EntryPoints.item(i).id
    tree.nodes.Add(key, 4, nid, item.EntryPoints.item(i).Brief(True)).Tag = "Row"
    tree.nodes.Add(nid, 4, nid & "EntryPoints", "Меню").Tag = "EntryPoints"
    tree.nodes.Add(nid & "EntryPoints", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
   ' EPFilterLink
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "EPFilterLink") Then
      tree.nodes.Add(nid, 4, nid & "EPFilterLink", "Привязка фильтра").Tag = "EPFilterLink"
      tree.nodes.Add(nid & "EPFilterLink", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "EPFilterLink", "Привязка фильтра").Tag = "EPFilterLink"
     tree.nodes.Add(nid & "EPFilterLink", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
   End If ' EPFilterLink
    Next 'i
 Case "EPFilterLink"
    item.EPFilterLink.Refresh
    For i = 1 To item.EPFilterLink.Count
    nid = CreateGUID2() & item.EPFilterLink.item(i).id
    tree.nodes.Add(key, 4, nid, item.EPFilterLink.item(i).Brief(True)).Tag = "Row"
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
    For tidx = 1 To item.EntryPoints.Count
      ' EntryPoints
      tid = item.EntryPoints.item(tidx).id
      tree.nodes.Add(key, 4, tid, item.EntryPoints.item(tidx).Brief(True)).Tag = "Row"
      tree.nodes.Add(tid, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
    Next 'tidx
End Sub



