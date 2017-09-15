VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "WEBS_NEWS"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'строка раздела Древовидный список новостей
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
Private m_WEBS_NEWS As WEBS_NEWS_col
Private m_NEWS_PICS As NEWS_PICS_col
Private m_QueueNumber As Long
Private m_Name As String
Private m_Title As String
Private m_ShortName As String
Private m_the_Mode As String
Private m_PageContent As String
Private m_the_IsLocked As enumBoolean
Private m_IsShowHisory As enumBoolean
Private m_NewsDate As Date
Private m_NewsDescription As String
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
  PartName = "WEBS_NEWS"
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
  m_Application.Logger.Message "WEBS_NEWS.Init"
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

'Данные поддерева раздела Новости
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса WEBS_NEWS_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as WEBS_NEWS_col
' Set variable = me. WEBS_NEWS (...параметры...)
Public Property Get WEBS_NEWS(Optional ByVal Refresh As Boolean = True) As WEBS_NEWS_col
 If m_WEBS_NEWS Is Nothing Then
   Set m_WEBS_NEWS = New WEBS_NEWS_col
   Set m_WEBS_NEWS.Parent = Me
   Set m_WEBS_NEWS.Application = Me.Application
   If Refresh Then m_WEBS_NEWS.Refresh
 End If
 Set WEBS_NEWS = m_WEBS_NEWS
End Property

'Данные дочернего раздела Картинки
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса NEWS_PICS_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as NEWS_PICS_col
' Set variable = me. NEWS_PICS (...параметры...)
Public Property Get NEWS_PICS(Optional ByVal Refresh As Boolean = True) As NEWS_PICS_col
 If m_NEWS_PICS Is Nothing Then
   Set m_NEWS_PICS = New NEWS_PICS_col
   Set m_NEWS_PICS.Parent = Me
   Set m_NEWS_PICS.Application = Me.Application
   If Refresh Then m_NEWS_PICS.Refresh
 End If
 Set NEWS_PICS = m_NEWS_PICS
End Property
' let
'Номер п/п

'Номер п/п
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let QueueNumber(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "QueueNumber", QueueNumber, NewValue

   m_QueueNumber = NewValue
End If
End Property

'Номер п/п
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. QueueNumber
Public Property Get QueueNumber() As Long
 LoadFromDatabase
 AccessTime = Now

   QueueNumber = m_QueueNumber
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
'Титул

'Титул
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Title(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Title", Title, NewValue

   m_Title = NewValue
End If
End Property

'Титул
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. Title
Public Property Get Title() As String
 LoadFromDatabase
 AccessTime = Now

   Title = m_Title
End Property
' let
'Короткое название

'Короткое название
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ShortName(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ShortName", ShortName, NewValue

   m_ShortName = NewValue
End If
End Property

'Короткое название
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. ShortName
Public Property Get ShortName() As String
 LoadFromDatabase
 AccessTime = Now

   ShortName = m_ShortName
End Property
' let
'Режим работы

'Режим работы
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let the_Mode(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "the_Mode", the_Mode, NewValue

   m_the_Mode = NewValue
End If
End Property

'Режим работы
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. the_Mode
Public Property Get the_Mode() As String
 LoadFromDatabase
 AccessTime = Now

   the_Mode = m_the_Mode
End Property
' let
'Cодержимое

'Cодержимое
'Parameters:
'[IN]   newValue , тип параметра: STRING  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let PageContent(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PageContent", PageContent, NewValue

   m_PageContent = NewValue
End If
End Property

'Cодержимое
'Parameters:
' параметров нет
'Returns:
'  значение типа STRING
'See Also:
'Example:
' dim variable as STRING
' variable = me. PageContent
Public Property Get PageContent() As String
 LoadFromDatabase
 AccessTime = Now

   PageContent = m_PageContent
End Property
' let
'Заблокирована

'Заблокирована
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let the_IsLocked(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "the_IsLocked", the_IsLocked, NewValue

   m_the_IsLocked = NewValue
End If
End Property

'Заблокирована
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. the_IsLocked
Public Property Get the_IsLocked() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   the_IsLocked = m_the_IsLocked
End Property
' let
'Отобразить историю

'Отобразить историю
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IsShowHisory(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IsShowHisory", IsShowHisory, NewValue

   m_IsShowHisory = NewValue
End If
End Property

'Отобразить историю
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. IsShowHisory
Public Property Get IsShowHisory() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   IsShowHisory = m_IsShowHisory
End Property
' let
'Дата

'Дата
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let NewsDate(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "NewsDate", NewsDate, NewValue

   m_NewsDate = NewValue
End If
End Property

'Дата
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. NewsDate
Public Property Get NewsDate() As Date
 LoadFromDatabase
 AccessTime = Now

   NewsDate = m_NewsDate
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
Public Property Let NewsDescription(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "NewsDescription", NewsDescription, NewValue

   m_NewsDescription = NewValue
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
' variable = me. NewsDescription
Public Property Get NewsDescription() As String
 LoadFromDatabase
 AccessTime = Now

   NewsDescription = m_NewsDescription
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
  Set nvi = nv.Add("QueueNumber", m_QueueNumber)
nvi.ValueType = adInteger
  Set nvi = nv.Add("Name", m_Name)
nvi.ValueSize = 256
  Set nvi = nv.Add("Title", m_Title)
nvi.ValueSize = 256
  Set nvi = nv.Add("ShortName", m_ShortName)
nvi.ValueSize = 256
  Set nvi = nv.Add("the_Mode", m_the_Mode)
nvi.ValueSize = 256
  Set nvi = nv.Add("PageContent", m_PageContent)
  Set nvi = nv.Add("the_IsLocked", m_the_IsLocked)
nvi.ValueType = adInteger
  Set nvi = nv.Add("IsShowHisory", m_IsShowHisory)
nvi.ValueType = adInteger
  Set nvi = nv.Add("NewsDate", m_NewsDate)
nvi.ValueType = adDBTimeStamp
  Set nvi = nv.Add("NewsDescription", m_NewsDescription)
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
 m_Brief = m_Brief & QueueNumber & "; "
 m_Brief = m_Brief & Name & "; "
 m_Brief = m_Brief & NewsDate & "; "
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

m_QueueNumber = nv.item("QueueNumber").Value
m_Name = nv.item("Name").Value
m_Title = nv.item("Title").Value
m_ShortName = nv.item("ShortName").Value
m_the_Mode = nv.item("the_Mode").Value
m_PageContent = nv.item("PageContent").Value
m_the_IsLocked = nv.item("the_IsLocked").Value
m_IsShowHisory = nv.item("IsShowHisory").Value
m_NewsDate = nv.item("NewsDate").Value
m_NewsDescription = nv.item("NewsDescription").Value
Else

m_QueueNumber = nv.Fields("QueueNumber").Value
m_Name = nv.Fields("Name").Value
m_Title = nv.Fields("Title").Value
m_ShortName = nv.Fields("ShortName").Value
m_the_Mode = nv.Fields("the_Mode").Value
m_PageContent = nv.Fields("PageContent").Value
m_the_IsLocked = nv.Fields("the_IsLocked").Value
m_IsShowHisory = nv.Fields("IsShowHisory").Value
m_NewsDate = nv.Fields("NewsDate").Value
m_NewsDescription = nv.Fields("NewsDescription").Value
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
   Dim o As WEBS_NEWS
   Set o = New WEBS_NEWS
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
   While TypeName(tmpParent.Parent.Parent) = "WEBS_NEWS"
     Set tmpParent = tmpParent.Parent.Parent
   Wend
     Application.MTZSession.SaveRow2 PartName, id, tmpParent.Parent.Parent.id, nv, Application.id
   Changed = False
   Save = True
Exit Function
bye:
  err.Raise err.Number, "WEBS_NEWS.Save", err.Description
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
   For i = 1 To WEBS_NEWS.Count
     WEBS_NEWS.Delete (i)
   Next
  m_Deleted = True
  Delete = True
Else
  If Not CanChangeONLine Then Exit Function
   OK = True
   While OK And WEBS_NEWS.Count > 0
     OK = WEBS_NEWS.Delete(1)
   Wend
   If Not OK Then Exit Function
   Delete = Application.MTZSession.DeleteRow2(PartName, id, Application.id)
   Changed = False
   'Compact
   CloseClass
End If
Exit Function
bye:
  err.Raise err.Number, "WEBS_NEWS.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("WEBS_NEWS", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "WEBS_NEWS.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "WEBS_NEWS", id
Exit Sub
bye:
  err.Raise err.Number, "WEBS_NEWS.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

If Not m_WEBS_NEWS Is Nothing Then
  m_WEBS_NEWS.CloseClass
  Set m_WEBS_NEWS = Nothing
End If
If Not m_NEWS_PICS Is Nothing Then
  m_NEWS_PICS.CloseClass
  Set m_NEWS_PICS = Nothing
End If
 If Not Application Is Nothing Then Application.Logger.Message "WEBS_NEWS.CloseClass"
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
   Set m_FindObject = WEBS_NEWS.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = NEWS_PICS.FindObject(StrID, InstID)
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

WEBS_NEWS.Compact
NEWS_PICS.Compact
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
  QueueNumber = node.Attributes.getNamedItem("QUEUENUMBER").nodeValue
  Name = Replace(node.Attributes.getNamedItem("NAME").nodeValue, vbLf, vbCrLf)
  Title = Replace(node.Attributes.getNamedItem("TITLE").nodeValue, vbLf, vbCrLf)
  ShortName = Replace(node.Attributes.getNamedItem("SHORTNAME").nodeValue, vbLf, vbCrLf)
  the_Mode = Replace(node.Attributes.getNamedItem("THE_MODE").nodeValue, vbLf, vbCrLf)
  PageContent = Replace(node.Attributes.getNamedItem("PAGECONTENT").nodeValue, vbLf, vbCrLf)
  the_IsLocked = node.Attributes.getNamedItem("THE_ISLOCKED").nodeValue
  IsShowHisory = node.Attributes.getNamedItem("ISSHOWHISORY").nodeValue
  NewsDate = node.Attributes.getNamedItem("NEWSDATE").nodeValue
  NewsDescription = Replace(node.Attributes.getNamedItem("NEWSDESCRIPTION").nodeValue, vbLf, vbCrLf)
  On Error GoTo bye
  'if m_ChangeTime >= m_RetriveTime then m_Changed = true
  m_Changed = True
  m_RowRetrived = True
  m_Brief = ""
  On Error Resume Next
  Set e_list = node.selectNodes("WEBS_NEWS_COL")
  WEBS_NEWS.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("NEWS_PICS_COL")
  NEWS_PICS.XMLLoad e_list, LoadMode
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
  node.setAttribute "QUEUENUMBER", QueueNumber
  node.setAttribute "NAME", Name
  node.setAttribute "TITLE", Title
  node.setAttribute "SHORTNAME", ShortName
  node.setAttribute "THE_MODE", the_Mode
  node.setAttribute "PAGECONTENT", PageContent
  node.setAttribute "THE_ISLOCKED", the_IsLocked
  node.setAttribute "ISSHOWHISORY", IsShowHisory
  node.setAttribute "NEWSDATE", CDbl(NewsDate)
  node.setAttribute "NEWSDESCRIPTION", NewsDescription
  node.setAttribute "AccessTime", CDbl(m_AccessTime)
  WEBS_NEWS.XMLSave node, xdom
  NEWS_PICS.XMLSave node, xdom
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
m_IsLocked = Application.MTZSession.IsLocked("WEBS_NEWS", id)
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
OK = Application.MTZSession.LockResource("WEBS_NEWS", id, Permanent)
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
Application.MTZSession.UnLockResource "WEBS_NEWS", id
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
CanLock = Application.MTZSession.CanLock("WEBS_NEWS", id)
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
 NEWS_PICS.BatchUpdate
  WEBS_NEWS.BatchUpdate
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
  NEWS_PICS.LoadAll
    WEBS_NEWS.LoadAll
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
 Case "WEBS_NEWS"
    item.WEBS_NEWS.Refresh
    For i = 1 To item.WEBS_NEWS.Count
    nid = CreateGUID2() & item.WEBS_NEWS.item(i).id
    tree.nodes.Add(key, 4, nid, item.WEBS_NEWS.item(i).Brief(True)).Tag = "Row"
    tree.nodes.Add(nid, 4, nid & "WEBS_NEWS", "Новости").Tag = "WEBS_NEWS"
    tree.nodes.Add(nid & "WEBS_NEWS", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
   ' NEWS_PICS
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "NEWS_PICS") Then
      tree.nodes.Add(nid, 4, nid & "NEWS_PICS", "Картинки").Tag = "NEWS_PICS"
      tree.nodes.Add(nid & "NEWS_PICS", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "NEWS_PICS", "Картинки").Tag = "NEWS_PICS"
     tree.nodes.Add(nid & "NEWS_PICS", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
   End If ' NEWS_PICS
    Next 'i
 Case "NEWS_PICS"
    item.NEWS_PICS.Refresh
    For i = 1 To item.NEWS_PICS.Count
    nid = CreateGUID2() & item.NEWS_PICS.item(i).id
    tree.nodes.Add(key, 4, nid, item.NEWS_PICS.item(i).Brief(True)).Tag = "Row"
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
    For tidx = 1 To item.WEBS_NEWS.Count
      ' WEBS_NEWS
      tid = item.WEBS_NEWS.item(tidx).id
      tree.nodes.Add(key, 4, tid, item.WEBS_NEWS.item(tidx).Brief(True)).Tag = "Row"
      tree.nodes.Add(tid, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
    Next 'tidx
End Sub



