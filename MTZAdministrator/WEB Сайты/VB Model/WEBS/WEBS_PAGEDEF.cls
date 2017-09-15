VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "WEBS_PAGEDEF"
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
Private m_WEBS_PAGEDEF As WEBS_PAGEDEF_col
Private m_WEBS_PICS As WEBS_PICS_col
Private m_WEBS_PAGEMENU As WEBS_PAGEMENU_col
Private m_WEBS_PAGECONTENT As WEBS_PAGECONTENT_col
Private m_WEBS_PAGEPARS As WEBS_PAGEPARS_col
Private m_WEBS_PAGECOMP As WEBS_PAGECOMP_col
Private m_QueueNumber As Long
Private m_Name As String
Private m_Url As String
Private m_Title As String
Private m_ShortName As String
Private m_ObjectName As Object
Dim m_ObjectName_ID As String
Dim m_ObjectName_ID_BRIEF As String
Private m_ObjectCode As Object
Dim m_ObjectCode_ID As String
Dim m_ObjectCode_ID_BRIEF As String
Private m_AllowHeader As enumBoolean
Private m_the_Mode As String
Private m_PageType As Object
Dim m_PageType_ID As String
Dim m_PageType_ID_BRIEF As String
Private m_ControlPath As String
Private m_SelectIDParameterName As String
Private m_PageContent As String
Private m_AllowAddPage As enumBoolean
Private m_the_IsLocked As enumBoolean
Private m_IsOnMap As enumBoolean
Private m_IsShowHisory As enumBoolean
Private m_RedirectToFirstChild As enumBoolean
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
  PartName = "WEBS_PAGEDEF"
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
  m_Application.Logger.Message "WEBS_PAGEDEF.Init"
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

'Данные поддерева раздела Страница сайта
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса WEBS_PAGEDEF_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as WEBS_PAGEDEF_col
' Set variable = me. WEBS_PAGEDEF (...параметры...)
Public Property Get WEBS_PAGEDEF(Optional ByVal Refresh As Boolean = True) As WEBS_PAGEDEF_col
 If m_WEBS_PAGEDEF Is Nothing Then
   Set m_WEBS_PAGEDEF = New WEBS_PAGEDEF_col
   Set m_WEBS_PAGEDEF.Parent = Me
   Set m_WEBS_PAGEDEF.Application = Me.Application
   If Refresh Then m_WEBS_PAGEDEF.Refresh
 End If
 Set WEBS_PAGEDEF = m_WEBS_PAGEDEF
End Property

'Данные дочернего раздела Картинки
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса WEBS_PICS_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as WEBS_PICS_col
' Set variable = me. WEBS_PICS (...параметры...)
Public Property Get WEBS_PICS(Optional ByVal Refresh As Boolean = True) As WEBS_PICS_col
 If m_WEBS_PICS Is Nothing Then
   Set m_WEBS_PICS = New WEBS_PICS_col
   Set m_WEBS_PICS.Parent = Me
   Set m_WEBS_PICS.Application = Me.Application
   If Refresh Then m_WEBS_PICS.Refresh
 End If
 Set WEBS_PICS = m_WEBS_PICS
End Property

'Данные дочернего раздела Отношения с меню
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса WEBS_PAGEMENU_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as WEBS_PAGEMENU_col
' Set variable = me. WEBS_PAGEMENU (...параметры...)
Public Property Get WEBS_PAGEMENU(Optional ByVal Refresh As Boolean = True) As WEBS_PAGEMENU_col
 If m_WEBS_PAGEMENU Is Nothing Then
   Set m_WEBS_PAGEMENU = New WEBS_PAGEMENU_col
   Set m_WEBS_PAGEMENU.Parent = Me
   Set m_WEBS_PAGEMENU.Application = Me.Application
   If Refresh Then m_WEBS_PAGEMENU.Refresh
 End If
 Set WEBS_PAGEMENU = m_WEBS_PAGEMENU
End Property

'Данные дочернего раздела Содержимое
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса WEBS_PAGECONTENT_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as WEBS_PAGECONTENT_col
' Set variable = me. WEBS_PAGECONTENT (...параметры...)
Public Property Get WEBS_PAGECONTENT(Optional ByVal Refresh As Boolean = True) As WEBS_PAGECONTENT_col
 If m_WEBS_PAGECONTENT Is Nothing Then
   Set m_WEBS_PAGECONTENT = New WEBS_PAGECONTENT_col
   Set m_WEBS_PAGECONTENT.Parent = Me
   Set m_WEBS_PAGECONTENT.Application = Me.Application
   If Refresh Then m_WEBS_PAGECONTENT.Refresh
 End If
 Set WEBS_PAGECONTENT = m_WEBS_PAGECONTENT
End Property

'Данные дочернего раздела Параметры
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса WEBS_PAGEPARS_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as WEBS_PAGEPARS_col
' Set variable = me. WEBS_PAGEPARS (...параметры...)
Public Property Get WEBS_PAGEPARS(Optional ByVal Refresh As Boolean = True) As WEBS_PAGEPARS_col
 If m_WEBS_PAGEPARS Is Nothing Then
   Set m_WEBS_PAGEPARS = New WEBS_PAGEPARS_col
   Set m_WEBS_PAGEPARS.Parent = Me
   Set m_WEBS_PAGEPARS.Application = Me.Application
   If Refresh Then m_WEBS_PAGEPARS.Refresh
 End If
 Set WEBS_PAGEPARS = m_WEBS_PAGEPARS
End Property

'Данные дочернего раздела Компоненты
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса WEBS_PAGECOMP_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as WEBS_PAGECOMP_col
' Set variable = me. WEBS_PAGECOMP (...параметры...)
Public Property Get WEBS_PAGECOMP(Optional ByVal Refresh As Boolean = True) As WEBS_PAGECOMP_col
 If m_WEBS_PAGECOMP Is Nothing Then
   Set m_WEBS_PAGECOMP = New WEBS_PAGECOMP_col
   Set m_WEBS_PAGECOMP.Parent = Me
   Set m_WEBS_PAGECOMP.Application = Me.Application
   If Refresh Then m_WEBS_PAGECOMP.Refresh
 End If
 Set WEBS_PAGECOMP = m_WEBS_PAGECOMP
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
'Урл

'Урл
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Url(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Url", Url, NewValue

   m_Url = NewValue
End If
End Property

'Урл
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. Url
Public Property Get Url() As String
 LoadFromDatabase
 AccessTime = Now

   Url = m_Url
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
'Имя объекта

'Имя объекта
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set ObjectName(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ObjectName", ObjectName, NewValue
On Error Resume Next
m_ObjectName_ID = ""
m_ObjectName_ID = NewValue.id
'  set   m_ObjectName= newValue
End If
End Property

'Имя объекта
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. ObjectName
Public Property Get ObjectName() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_ObjectName As Object
If m_ObjectName_ID <> "" Then
  Set tmp_ObjectName = Application.FindRowObject("OBJECTTYPE", m_ObjectName_ID)
  If tmp_ObjectName Is Nothing Then
    m_ObjectName_ID_BRIEF = ""
  Else
    m_ObjectName_ID_BRIEF = tmp_ObjectName.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "OBJECTTYPE" & m_ObjectName_ID, tmp_ObjectName
  Set ObjectName = tmp_ObjectName
  Exit Property
End If
  '  set ObjectName = m_ObjectName
End Property
' let
'Имя раздела

'Имя раздела
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set ObjectCode(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ObjectCode", ObjectCode, NewValue
On Error Resume Next
m_ObjectCode_ID = ""
m_ObjectCode_ID = NewValue.id
'  set   m_ObjectCode= newValue
End If
End Property

'Имя раздела
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. ObjectCode
Public Property Get ObjectCode() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_ObjectCode As Object
If m_ObjectCode_ID <> "" Then
  Set tmp_ObjectCode = Application.FindRowObject("PART", m_ObjectCode_ID)
  If tmp_ObjectCode Is Nothing Then
    m_ObjectCode_ID_BRIEF = ""
  Else
    m_ObjectCode_ID_BRIEF = tmp_ObjectCode.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PART" & m_ObjectCode_ID, tmp_ObjectCode
  Set ObjectCode = tmp_ObjectCode
  Exit Property
End If
  '  set ObjectCode = m_ObjectCode
End Property
' let
'Выводить заголовок

'Выводить заголовок
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let AllowHeader(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "AllowHeader", AllowHeader, NewValue

   m_AllowHeader = NewValue
End If
End Property

'Выводить заголовок
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. AllowHeader
Public Property Get AllowHeader() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   AllowHeader = m_AllowHeader
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
'Тип

'Тип
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set PageType(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PageType", PageType, NewValue
On Error Resume Next
m_PageType_ID = ""
m_PageType_ID = NewValue.id
'  set   m_PageType= newValue
End If
End Property

'Тип
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. PageType
Public Property Get PageType() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_PageType As Object
If m_PageType_ID <> "" Then
  Set tmp_PageType = Application.FindRowObject("WEBSDIC_PAGETYPE", m_PageType_ID)
  If tmp_PageType Is Nothing Then
    m_PageType_ID_BRIEF = ""
  Else
    m_PageType_ID_BRIEF = tmp_PageType.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "WEBSDIC_PAGETYPE" & m_PageType_ID, tmp_PageType
  Set PageType = tmp_PageType
  Exit Property
End If
  '  set PageType = m_PageType
End Property
' let
'Контрол

'Контрол
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ControlPath(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ControlPath", ControlPath, NewValue

   m_ControlPath = NewValue
End If
End Property

'Контрол
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. ControlPath
Public Property Get ControlPath() As String
 LoadFromDatabase
 AccessTime = Now

   ControlPath = m_ControlPath
End Property
' let
'Имя параметра для передачи в форму редактирования

'Имя параметра для передачи в форму редактирования
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let SelectIDParameterName(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SelectIDParameterName", SelectIDParameterName, NewValue

   m_SelectIDParameterName = NewValue
End If
End Property

'Имя параметра для передачи в форму редактирования
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. SelectIDParameterName
Public Property Get SelectIDParameterName() As String
 LoadFromDatabase
 AccessTime = Now

   SelectIDParameterName = m_SelectIDParameterName
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
'Разрешено добавлять страницы

'Разрешено добавлять страницы
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let AllowAddPage(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "AllowAddPage", AllowAddPage, NewValue

   m_AllowAddPage = NewValue
End If
End Property

'Разрешено добавлять страницы
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. AllowAddPage
Public Property Get AllowAddPage() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   AllowAddPage = m_AllowAddPage
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
'Отображать на карте сайта

'Отображать на карте сайта
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IsOnMap(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IsOnMap", IsOnMap, NewValue

   m_IsOnMap = NewValue
End If
End Property

'Отображать на карте сайта
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. IsOnMap
Public Property Get IsOnMap() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   IsOnMap = m_IsOnMap
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
'Перейти на первую дочернюю страницу

'Перейти на первую дочернюю страницу
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let RedirectToFirstChild(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "RedirectToFirstChild", RedirectToFirstChild, NewValue

   m_RedirectToFirstChild = NewValue
End If
End Property

'Перейти на первую дочернюю страницу
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. RedirectToFirstChild
Public Property Get RedirectToFirstChild() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   RedirectToFirstChild = m_RedirectToFirstChild
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
  Set nvi = nv.Add("Url", m_Url)
nvi.ValueSize = 1024
  Set nvi = nv.Add("Title", m_Title)
nvi.ValueSize = 256
  Set nvi = nv.Add("ShortName", m_ShortName)
nvi.ValueSize = 256
 ' Reference to OBJECTTYPE
    If m_ObjectName_ID = "" Then
       Set nvi = nv.Add("ObjectName", "")
    Else
       Set nvi = nv.Add("ObjectName", m_ObjectName_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to PART
    If m_ObjectCode_ID = "" Then
       Set nvi = nv.Add("ObjectCode", "")
    Else
       Set nvi = nv.Add("ObjectCode", m_ObjectCode_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("AllowHeader", m_AllowHeader)
nvi.ValueType = adInteger
  Set nvi = nv.Add("the_Mode", m_the_Mode)
nvi.ValueSize = 256
 ' Reference to WEBSDIC_PAGETYPE
    If m_PageType_ID = "" Then
       Set nvi = nv.Add("PageType", "")
    Else
       Set nvi = nv.Add("PageType", m_PageType_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("ControlPath", m_ControlPath)
nvi.ValueSize = 256
  Set nvi = nv.Add("SelectIDParameterName", m_SelectIDParameterName)
nvi.ValueSize = 256
  Set nvi = nv.Add("PageContent", m_PageContent)
  Set nvi = nv.Add("AllowAddPage", m_AllowAddPage)
nvi.ValueType = adInteger
  Set nvi = nv.Add("the_IsLocked", m_the_IsLocked)
nvi.ValueType = adInteger
  Set nvi = nv.Add("IsOnMap", m_IsOnMap)
nvi.ValueType = adInteger
  Set nvi = nv.Add("IsShowHisory", m_IsShowHisory)
nvi.ValueType = adInteger
  Set nvi = nv.Add("RedirectToFirstChild", m_RedirectToFirstChild)
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
 m_Brief = m_Brief & QueueNumber & "; "
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

m_QueueNumber = nv.item("QueueNumber").Value
m_Name = nv.item("Name").Value
m_Url = nv.item("Url").Value
m_Title = nv.item("Title").Value
m_ShortName = nv.item("ShortName").Value
  m_ObjectName_ID = nv.item("ObjectName").Value
  m_ObjectCode_ID = nv.item("ObjectCode").Value
m_AllowHeader = nv.item("AllowHeader").Value
m_the_Mode = nv.item("the_Mode").Value
  m_PageType_ID = nv.item("PageType").Value
m_ControlPath = nv.item("ControlPath").Value
m_SelectIDParameterName = nv.item("SelectIDParameterName").Value
m_PageContent = nv.item("PageContent").Value
m_AllowAddPage = nv.item("AllowAddPage").Value
m_the_IsLocked = nv.item("the_IsLocked").Value
m_IsOnMap = nv.item("IsOnMap").Value
m_IsShowHisory = nv.item("IsShowHisory").Value
m_RedirectToFirstChild = nv.item("RedirectToFirstChild").Value
Else

m_QueueNumber = nv.Fields("QueueNumber").Value
m_Name = nv.Fields("Name").Value
m_Url = nv.Fields("Url").Value
m_Title = nv.Fields("Title").Value
m_ShortName = nv.Fields("ShortName").Value
  m_ObjectName_ID = nv.Fields("ObjectName").Value
  m_ObjectCode_ID = nv.Fields("ObjectCode").Value
m_AllowHeader = nv.Fields("AllowHeader").Value
m_the_Mode = nv.Fields("the_Mode").Value
  m_PageType_ID = nv.Fields("PageType").Value
m_ControlPath = nv.Fields("ControlPath").Value
m_SelectIDParameterName = nv.Fields("SelectIDParameterName").Value
m_PageContent = nv.Fields("PageContent").Value
m_AllowAddPage = nv.Fields("AllowAddPage").Value
m_the_IsLocked = nv.Fields("the_IsLocked").Value
m_IsOnMap = nv.Fields("IsOnMap").Value
m_IsShowHisory = nv.Fields("IsShowHisory").Value
m_RedirectToFirstChild = nv.Fields("RedirectToFirstChild").Value
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
   Dim o As WEBS_PAGEDEF
   Set o = New WEBS_PAGEDEF
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
   While TypeName(tmpParent.Parent.Parent) = "WEBS_PAGEDEF"
     Set tmpParent = tmpParent.Parent.Parent
   Wend
     Application.MTZSession.SaveRow2 PartName, id, tmpParent.Parent.Parent.id, nv, Application.id
   Changed = False
   Save = True
Exit Function
bye:
  err.Raise err.Number, "WEBS_PAGEDEF.Save", err.Description
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
   For i = 1 To WEBS_PAGEDEF.Count
     WEBS_PAGEDEF.Delete (i)
   Next
  m_Deleted = True
  Delete = True
Else
  If Not CanChangeONLine Then Exit Function
   OK = True
   While OK And WEBS_PAGEDEF.Count > 0
     OK = WEBS_PAGEDEF.Delete(1)
   Wend
   If Not OK Then Exit Function
   Delete = Application.MTZSession.DeleteRow2(PartName, id, Application.id)
   Changed = False
   'Compact
   CloseClass
End If
Exit Function
bye:
  err.Raise err.Number, "WEBS_PAGEDEF.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("WEBS_PAGEDEF", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "WEBS_PAGEDEF.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "WEBS_PAGEDEF", id
Exit Sub
bye:
  err.Raise err.Number, "WEBS_PAGEDEF.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

If Not m_WEBS_PAGEDEF Is Nothing Then
  m_WEBS_PAGEDEF.CloseClass
  Set m_WEBS_PAGEDEF = Nothing
End If
If Not m_WEBS_PICS Is Nothing Then
  m_WEBS_PICS.CloseClass
  Set m_WEBS_PICS = Nothing
End If
If Not m_WEBS_PAGEMENU Is Nothing Then
  m_WEBS_PAGEMENU.CloseClass
  Set m_WEBS_PAGEMENU = Nothing
End If
If Not m_WEBS_PAGECONTENT Is Nothing Then
  m_WEBS_PAGECONTENT.CloseClass
  Set m_WEBS_PAGECONTENT = Nothing
End If
If Not m_WEBS_PAGEPARS Is Nothing Then
  m_WEBS_PAGEPARS.CloseClass
  Set m_WEBS_PAGEPARS = Nothing
End If
If Not m_WEBS_PAGECOMP Is Nothing Then
  m_WEBS_PAGECOMP.CloseClass
  Set m_WEBS_PAGECOMP = Nothing
End If
 m_ObjectName_ID = ""
 Set m_ObjectName = Nothing
 m_ObjectCode_ID = ""
 Set m_ObjectCode = Nothing
 m_PageType_ID = ""
 Set m_PageType = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "WEBS_PAGEDEF.CloseClass"
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
   Set m_FindObject = WEBS_PAGEDEF.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = WEBS_PICS.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = WEBS_PAGEMENU.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = WEBS_PAGECONTENT.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = WEBS_PAGEPARS.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = WEBS_PAGECOMP.FindObject(StrID, InstID)
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

WEBS_PAGEDEF.Compact
WEBS_PICS.Compact
WEBS_PAGEMENU.Compact
WEBS_PAGECONTENT.Compact
WEBS_PAGEPARS.Compact
WEBS_PAGECOMP.Compact
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
  Url = Replace(node.Attributes.getNamedItem("URL").nodeValue, vbLf, vbCrLf)
  Title = Replace(node.Attributes.getNamedItem("TITLE").nodeValue, vbLf, vbCrLf)
  ShortName = Replace(node.Attributes.getNamedItem("SHORTNAME").nodeValue, vbLf, vbCrLf)
  Set ObjectName = Nothing
  m_ObjectName_ID = node.Attributes.getNamedItem("OBJECTNAME").nodeValue
  m_ObjectName_ID_BRIEF = node.Attributes.getNamedItem("OBJECTNAME_BRIEF").nodeValue
  Set ObjectCode = Nothing
  m_ObjectCode_ID = node.Attributes.getNamedItem("OBJECTCODE").nodeValue
  m_ObjectCode_ID_BRIEF = node.Attributes.getNamedItem("OBJECTCODE_BRIEF").nodeValue
  AllowHeader = node.Attributes.getNamedItem("ALLOWHEADER").nodeValue
  the_Mode = Replace(node.Attributes.getNamedItem("THE_MODE").nodeValue, vbLf, vbCrLf)
  Set PageType = Nothing
  m_PageType_ID = node.Attributes.getNamedItem("PAGETYPE").nodeValue
  m_PageType_ID_BRIEF = node.Attributes.getNamedItem("PAGETYPE_BRIEF").nodeValue
  ControlPath = Replace(node.Attributes.getNamedItem("CONTROLPATH").nodeValue, vbLf, vbCrLf)
  SelectIDParameterName = Replace(node.Attributes.getNamedItem("SELECTIDPARAMETERNAME").nodeValue, vbLf, vbCrLf)
  PageContent = Replace(node.Attributes.getNamedItem("PAGECONTENT").nodeValue, vbLf, vbCrLf)
  AllowAddPage = node.Attributes.getNamedItem("ALLOWADDPAGE").nodeValue
  the_IsLocked = node.Attributes.getNamedItem("THE_ISLOCKED").nodeValue
  IsOnMap = node.Attributes.getNamedItem("ISONMAP").nodeValue
  IsShowHisory = node.Attributes.getNamedItem("ISSHOWHISORY").nodeValue
  RedirectToFirstChild = node.Attributes.getNamedItem("REDIRECTTOFIRSTCHILD").nodeValue
  On Error GoTo bye
  'if m_ChangeTime >= m_RetriveTime then m_Changed = true
  m_Changed = True
  m_RowRetrived = True
  m_Brief = ""
  On Error Resume Next
  Set e_list = node.selectNodes("WEBS_PAGEDEF_COL")
  WEBS_PAGEDEF.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("WEBS_PICS_COL")
  WEBS_PICS.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("WEBS_PAGEMENU_COL")
  WEBS_PAGEMENU.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("WEBS_PAGECONTENT_COL")
  WEBS_PAGECONTENT.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("WEBS_PAGEPARS_COL")
  WEBS_PAGEPARS.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("WEBS_PAGECOMP_COL")
  WEBS_PAGECOMP.XMLLoad e_list, LoadMode
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
  node.setAttribute "URL", Url
  node.setAttribute "TITLE", Title
  node.setAttribute "SHORTNAME", ShortName
  node.setAttribute "OBJECTNAME", m_ObjectName_ID
  If Not (ObjectName Is Nothing) Then
    node.setAttribute "OBJECTNAME_BRIEF", ObjectName.Brief
  Else
    node.setAttribute "OBJECTNAME_BRIEF", m_ObjectName_ID_BRIEF
  End If
  node.setAttribute "OBJECTCODE", m_ObjectCode_ID
  If Not (ObjectCode Is Nothing) Then
    node.setAttribute "OBJECTCODE_BRIEF", ObjectCode.Brief
  Else
    node.setAttribute "OBJECTCODE_BRIEF", m_ObjectCode_ID_BRIEF
  End If
  node.setAttribute "ALLOWHEADER", AllowHeader
  node.setAttribute "THE_MODE", the_Mode
  node.setAttribute "PAGETYPE", m_PageType_ID
  If Not (PageType Is Nothing) Then
    node.setAttribute "PAGETYPE_BRIEF", PageType.Brief
  Else
    node.setAttribute "PAGETYPE_BRIEF", m_PageType_ID_BRIEF
  End If
  node.setAttribute "CONTROLPATH", ControlPath
  node.setAttribute "SELECTIDPARAMETERNAME", SelectIDParameterName
  node.setAttribute "PAGECONTENT", PageContent
  node.setAttribute "ALLOWADDPAGE", AllowAddPage
  node.setAttribute "THE_ISLOCKED", the_IsLocked
  node.setAttribute "ISONMAP", IsOnMap
  node.setAttribute "ISSHOWHISORY", IsShowHisory
  node.setAttribute "REDIRECTTOFIRSTCHILD", RedirectToFirstChild
  node.setAttribute "AccessTime", CDbl(m_AccessTime)
  WEBS_PAGEDEF.XMLSave node, xdom
  WEBS_PICS.XMLSave node, xdom
  WEBS_PAGEMENU.XMLSave node, xdom
  WEBS_PAGECONTENT.XMLSave node, xdom
  WEBS_PAGEPARS.XMLSave node, xdom
  WEBS_PAGECOMP.XMLSave node, xdom
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
m_IsLocked = Application.MTZSession.IsLocked("WEBS_PAGEDEF", id)
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
OK = Application.MTZSession.LockResource("WEBS_PAGEDEF", id, Permanent)
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
Application.MTZSession.UnLockResource "WEBS_PAGEDEF", id
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
CanLock = Application.MTZSession.CanLock("WEBS_PAGEDEF", id)
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
 WEBS_PICS.BatchUpdate
 WEBS_PAGEMENU.BatchUpdate
 WEBS_PAGECONTENT.BatchUpdate
 WEBS_PAGEPARS.BatchUpdate
 WEBS_PAGECOMP.BatchUpdate
  WEBS_PAGEDEF.BatchUpdate
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
  WEBS_PICS.LoadAll
  WEBS_PAGEMENU.LoadAll
  WEBS_PAGECONTENT.LoadAll
  WEBS_PAGEPARS.LoadAll
  WEBS_PAGECOMP.LoadAll
    WEBS_PAGEDEF.LoadAll
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
 Case "WEBS_PAGEDEF"
    item.WEBS_PAGEDEF.Refresh
    For i = 1 To item.WEBS_PAGEDEF.Count
    nid = CreateGUID2() & item.WEBS_PAGEDEF.item(i).id
    tree.nodes.Add(key, 4, nid, item.WEBS_PAGEDEF.item(i).Brief(True)).Tag = "Row"
    tree.nodes.Add(nid, 4, nid & "WEBS_PAGEDEF", "Страница сайта").Tag = "WEBS_PAGEDEF"
    tree.nodes.Add(nid & "WEBS_PAGEDEF", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
   ' WEBS_PICS
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "WEBS_PICS") Then
      tree.nodes.Add(nid, 4, nid & "WEBS_PICS", "Картинки").Tag = "WEBS_PICS"
      tree.nodes.Add(nid & "WEBS_PICS", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "WEBS_PICS", "Картинки").Tag = "WEBS_PICS"
     tree.nodes.Add(nid & "WEBS_PICS", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
   End If ' WEBS_PICS
   ' WEBS_PAGEMENU
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "WEBS_PAGEMENU") Then
      tree.nodes.Add(nid, 4, nid & "WEBS_PAGEMENU", "Отношения с меню").Tag = "WEBS_PAGEMENU"
      tree.nodes.Add(nid & "WEBS_PAGEMENU", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "WEBS_PAGEMENU", "Отношения с меню").Tag = "WEBS_PAGEMENU"
     tree.nodes.Add(nid & "WEBS_PAGEMENU", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
   End If ' WEBS_PAGEMENU
   ' WEBS_PAGECONTENT
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "WEBS_PAGECONTENT") Then
      tree.nodes.Add(nid, 4, nid & "WEBS_PAGECONTENT", "Содержимое").Tag = "WEBS_PAGECONTENT"
      tree.nodes.Add(nid & "WEBS_PAGECONTENT", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "WEBS_PAGECONTENT", "Содержимое").Tag = "WEBS_PAGECONTENT"
     tree.nodes.Add(nid & "WEBS_PAGECONTENT", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
   End If ' WEBS_PAGECONTENT
   ' WEBS_PAGEPARS
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "WEBS_PAGEPARS") Then
      tree.nodes.Add(nid, 4, nid & "WEBS_PAGEPARS", "Параметры").Tag = "WEBS_PAGEPARS"
      tree.nodes.Add(nid & "WEBS_PAGEPARS", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "WEBS_PAGEPARS", "Параметры").Tag = "WEBS_PAGEPARS"
     tree.nodes.Add(nid & "WEBS_PAGEPARS", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
   End If ' WEBS_PAGEPARS
   ' WEBS_PAGECOMP
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "WEBS_PAGECOMP") Then
      tree.nodes.Add(nid, 4, nid & "WEBS_PAGECOMP", "Компоненты").Tag = "WEBS_PAGECOMP"
      tree.nodes.Add(nid & "WEBS_PAGECOMP", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "WEBS_PAGECOMP", "Компоненты").Tag = "WEBS_PAGECOMP"
     tree.nodes.Add(nid & "WEBS_PAGECOMP", 4, CreateGUID2(), "Expanding ..").Tag = "ToDelete"
   End If ' WEBS_PAGECOMP
    Next 'i
 Case "WEBS_PICS"
    item.WEBS_PICS.Refresh
    For i = 1 To item.WEBS_PICS.Count
    nid = CreateGUID2() & item.WEBS_PICS.item(i).id
    tree.nodes.Add(key, 4, nid, item.WEBS_PICS.item(i).Brief(True)).Tag = "Row"
    Next
 Case "WEBS_PAGEMENU"
    item.WEBS_PAGEMENU.Refresh
    For i = 1 To item.WEBS_PAGEMENU.Count
    nid = CreateGUID2() & item.WEBS_PAGEMENU.item(i).id
    tree.nodes.Add(key, 4, nid, item.WEBS_PAGEMENU.item(i).Brief(True)).Tag = "Row"
    Next
 Case "WEBS_PAGECONTENT"
    item.WEBS_PAGECONTENT.Refresh
    For i = 1 To item.WEBS_PAGECONTENT.Count
    nid = CreateGUID2() & item.WEBS_PAGECONTENT.item(i).id
    tree.nodes.Add(key, 4, nid, item.WEBS_PAGECONTENT.item(i).Brief(True)).Tag = "Row"
    Next
 Case "WEBS_PAGEPARS"
    item.WEBS_PAGEPARS.Refresh
    For i = 1 To item.WEBS_PAGEPARS.Count
    nid = CreateGUID2() & item.WEBS_PAGEPARS.item(i).id
    tree.nodes.Add(key, 4, nid, item.WEBS_PAGEPARS.item(i).Brief(True)).Tag = "Row"
    Next
 Case "WEBS_PAGECOMP"
    item.WEBS_PAGECOMP.Refresh
    For i = 1 To item.WEBS_PAGECOMP.Count
    nid = CreateGUID2() & item.WEBS_PAGECOMP.item(i).id
    tree.nodes.Add(key, 4, nid, item.WEBS_PAGECOMP.item(i).Brief(True)).Tag = "Row"
   ' TablePart
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "TablePart") Then
      tree.nodes.Add(nid, 4, nid & "TablePart", "Табличная часть").Tag = "TablePart"
      tree.nodes.Add(nid & "TablePart", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "TablePart", "Табличная часть").Tag = "TablePart"
     tree.nodes.Add(nid & "TablePart", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' TablePart
   ' ReplaceValues
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "ReplaceValues") Then
      tree.nodes.Add(nid, 4, nid & "ReplaceValues", "Замены").Tag = "ReplaceValues"
      tree.nodes.Add(nid & "ReplaceValues", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "ReplaceValues", "Замены").Tag = "ReplaceValues"
     tree.nodes.Add(nid & "ReplaceValues", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' ReplaceValues
   ' DenyEdit
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "DenyEdit") Then
      tree.nodes.Add(nid, 4, nid & "DenyEdit", "Запрещённые для редактирования поля").Tag = "DenyEdit"
      tree.nodes.Add(nid & "DenyEdit", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "DenyEdit", "Запрещённые для редактирования поля").Tag = "DenyEdit"
     tree.nodes.Add(nid & "DenyEdit", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' DenyEdit
   ' DenyVisible
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "DenyVisible") Then
      tree.nodes.Add(nid, 4, nid & "DenyVisible", "Невидимые поля").Tag = "DenyVisible"
      tree.nodes.Add(nid & "DenyVisible", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "DenyVisible", "Невидимые поля").Tag = "DenyVisible"
     tree.nodes.Add(nid & "DenyVisible", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' DenyVisible
   ' AllowEditFieldValues
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "AllowEditFieldValues") Then
      tree.nodes.Add(nid, 4, nid & "AllowEditFieldValues", "Значения поля, разрешающего редактирование").Tag = "AllowEditFieldValues"
      tree.nodes.Add(nid & "AllowEditFieldValues", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "AllowEditFieldValues", "Значения поля, разрешающего редактирование").Tag = "AllowEditFieldValues"
     tree.nodes.Add(nid & "AllowEditFieldValues", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' AllowEditFieldValues
   ' ComboFields
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "ComboFields") Then
      tree.nodes.Add(nid, 4, nid & "ComboFields", "Комбобоксы").Tag = "ComboFields"
      tree.nodes.Add(nid & "ComboFields", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "ComboFields", "Комбобоксы").Tag = "ComboFields"
     tree.nodes.Add(nid & "ComboFields", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' ComboFields
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
    For tidx = 1 To item.WEBS_PAGEDEF.Count
      ' WEBS_PAGEDEF
      tid = item.WEBS_PAGEDEF.item(tidx).id
      tree.nodes.Add(key, 4, tid, item.WEBS_PAGEDEF.item(tidx).Brief(True)).Tag = "Row"
      tree.nodes.Add(tid, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
    Next 'tidx
End Sub



