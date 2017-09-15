VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TablePart"
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
Private m_FilterUserIDFieldName_ As String
Private m_Filter_ As String
Private m_SelectIDParameterName As String
Private m_EditForm As Object
Dim m_EditForm_ID As String
Dim m_EditForm_ID_BRIEF As String
Private m_AllowDelete As enumBoolean
Private m_AllowAddNew As enumBoolean
Private m_AddStatusColumn_ As enumBoolean
Private m_AllowEditRowStatusNameValue As String
Private m_AllowEditField As String
Private m_JournalID As Object
Dim m_JournalID_ID As String
Dim m_JournalID_ID_BRIEF As String
Private m_FilterUserClientDef As String
Private m_AllowEditUserClientDef As enumBoolean
Private m_ClientDefField As String
Private m_DataNavigateUrlField As String
Private m_PagerSize As Long
Private m_EditCaption As String
Private m_ViewCaption As String
Private m_DeleteCaption As String
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
  PartName = "TablePart"
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
  m_Application.Logger.Message "TablePart.Init"
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
'Имя поля для фильтра UserID

'Имя поля для фильтра UserID
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FilterUserIDFieldName_(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FilterUserIDFieldName_", FilterUserIDFieldName_, NewValue

   m_FilterUserIDFieldName_ = NewValue
End If
End Property

'Имя поля для фильтра UserID
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FilterUserIDFieldName_
Public Property Get FilterUserIDFieldName_() As String
 LoadFromDatabase
 AccessTime = Now

   FilterUserIDFieldName_ = m_FilterUserIDFieldName_
End Property
' let
'Фильтр

'Фильтр
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Filter_(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Filter_", Filter_, NewValue

   m_Filter_ = NewValue
End If
End Property

'Фильтр
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. Filter_
Public Property Get Filter_() As String
 LoadFromDatabase
 AccessTime = Now

   Filter_ = m_Filter_
End Property
' let
'Параметр для передачи ID

'Параметр для передачи ID
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

'Параметр для передачи ID
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
'Страница для редактирования

'Страница для редактирования
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set EditForm(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "EditForm", EditForm, NewValue
On Error Resume Next
m_EditForm_ID = ""
m_EditForm_ID = NewValue.id
'  set   m_EditForm= newValue
End If
End Property

'Страница для редактирования
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. EditForm
Public Property Get EditForm() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_EditForm As Object
If m_EditForm_ID <> "" Then
  Set tmp_EditForm = Application.FindRowObject("WEBS_PAGEDEF", m_EditForm_ID)
  If tmp_EditForm Is Nothing Then
    m_EditForm_ID_BRIEF = ""
  Else
    m_EditForm_ID_BRIEF = tmp_EditForm.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "WEBS_PAGEDEF" & m_EditForm_ID, tmp_EditForm
  Set EditForm = tmp_EditForm
  Exit Property
End If
  '  set EditForm = m_EditForm
End Property
' let
'Разрешено удаление

'Разрешено удаление
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let AllowDelete(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "AllowDelete", AllowDelete, NewValue

   m_AllowDelete = NewValue
End If
End Property

'Разрешено удаление
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. AllowDelete
Public Property Get AllowDelete() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   AllowDelete = m_AllowDelete
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
Public Property Let AllowAddNew(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "AllowAddNew", AllowAddNew, NewValue

   m_AllowAddNew = NewValue
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
' Set variable = me. AllowAddNew
Public Property Get AllowAddNew() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   AllowAddNew = m_AllowAddNew
End Property
' let
'Есть Status колонка

'Есть Status колонка
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let AddStatusColumn_(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "AddStatusColumn_", AddStatusColumn_, NewValue

   m_AddStatusColumn_ = NewValue
End If
End Property

'Есть Status колонка
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. AddStatusColumn_
Public Property Get AddStatusColumn_() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   AddStatusColumn_ = m_AddStatusColumn_
End Property
' let
'Значение Status для редактирования

'Значение Status для редактирования
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let AllowEditRowStatusNameValue(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "AllowEditRowStatusNameValue", AllowEditRowStatusNameValue, NewValue

   m_AllowEditRowStatusNameValue = NewValue
End If
End Property

'Значение Status для редактирования
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. AllowEditRowStatusNameValue
Public Property Get AllowEditRowStatusNameValue() As String
 LoadFromDatabase
 AccessTime = Now

   AllowEditRowStatusNameValue = m_AllowEditRowStatusNameValue
End Property
' let
'AllowEditField

'AllowEditField
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let AllowEditField(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "AllowEditField", AllowEditField, NewValue

   m_AllowEditField = NewValue
End If
End Property

'AllowEditField
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. AllowEditField
Public Property Get AllowEditField() As String
 LoadFromDatabase
 AccessTime = Now

   AllowEditField = m_AllowEditField
End Property
' let
'JournalID

'JournalID
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set JournalID(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "JournalID", JournalID, NewValue
On Error Resume Next
m_JournalID_ID = ""
m_JournalID_ID = NewValue.id
' set   m_JournalID= newValue
End If
End Property

'JournalID
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. JournalID
Public Property Get JournalID() As Object
 LoadFromDatabase
 AccessTime = Now
If m_JournalID_ID <> "" Then
  Set JournalID = Application.Manager.GetInstanceObject(Right(m_JournalID_ID, 38))
 Exit Property
End If
  ' set JournalID = m_JournalID
End Property
' let
'FilterUserClientDef

'FilterUserClientDef
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FilterUserClientDef(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FilterUserClientDef", FilterUserClientDef, NewValue

   m_FilterUserClientDef = NewValue
End If
End Property

'FilterUserClientDef
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FilterUserClientDef
Public Property Get FilterUserClientDef() As String
 LoadFromDatabase
 AccessTime = Now

   FilterUserClientDef = m_FilterUserClientDef
End Property
' let
'AllowEditUserClientDef

'AllowEditUserClientDef
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let AllowEditUserClientDef(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "AllowEditUserClientDef", AllowEditUserClientDef, NewValue

   m_AllowEditUserClientDef = NewValue
End If
End Property

'AllowEditUserClientDef
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. AllowEditUserClientDef
Public Property Get AllowEditUserClientDef() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   AllowEditUserClientDef = m_AllowEditUserClientDef
End Property
' let
'ClientDefField

'ClientDefField
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ClientDefField(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ClientDefField", ClientDefField, NewValue

   m_ClientDefField = NewValue
End If
End Property

'ClientDefField
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. ClientDefField
Public Property Get ClientDefField() As String
 LoadFromDatabase
 AccessTime = Now

   ClientDefField = m_ClientDefField
End Property
' let
'DataNavigateUrlField

'DataNavigateUrlField
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DataNavigateUrlField(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DataNavigateUrlField", DataNavigateUrlField, NewValue

   m_DataNavigateUrlField = NewValue
End If
End Property

'DataNavigateUrlField
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. DataNavigateUrlField
Public Property Get DataNavigateUrlField() As String
 LoadFromDatabase
 AccessTime = Now

   DataNavigateUrlField = m_DataNavigateUrlField
End Property
' let
'PagerSize

'PagerSize
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let PagerSize(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PagerSize", PagerSize, NewValue

   m_PagerSize = NewValue
End If
End Property

'PagerSize
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. PagerSize
Public Property Get PagerSize() As Long
 LoadFromDatabase
 AccessTime = Now

   PagerSize = m_PagerSize
End Property
' let
'EditCaption

'EditCaption
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let EditCaption(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "EditCaption", EditCaption, NewValue

   m_EditCaption = NewValue
End If
End Property

'EditCaption
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. EditCaption
Public Property Get EditCaption() As String
 LoadFromDatabase
 AccessTime = Now

   EditCaption = m_EditCaption
End Property
' let
'ViewCaption

'ViewCaption
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ViewCaption(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ViewCaption", ViewCaption, NewValue

   m_ViewCaption = NewValue
End If
End Property

'ViewCaption
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. ViewCaption
Public Property Get ViewCaption() As String
 LoadFromDatabase
 AccessTime = Now

   ViewCaption = m_ViewCaption
End Property
' let
'DeleteCaption

'DeleteCaption
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DeleteCaption(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DeleteCaption", DeleteCaption, NewValue

   m_DeleteCaption = NewValue
End If
End Property

'DeleteCaption
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. DeleteCaption
Public Property Get DeleteCaption() As String
 LoadFromDatabase
 AccessTime = Now

   DeleteCaption = m_DeleteCaption
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

  Set nvi = nv.Add("FilterUserIDFieldName_", m_FilterUserIDFieldName_)
nvi.ValueSize = 256
  Set nvi = nv.Add("Filter_", m_Filter_)
nvi.ValueSize = 256
  Set nvi = nv.Add("SelectIDParameterName", m_SelectIDParameterName)
nvi.ValueSize = 256
 ' Reference to WEBS_PAGEDEF
    If m_EditForm_ID = "" Then
       Set nvi = nv.Add("EditForm", "")
    Else
       Set nvi = nv.Add("EditForm", m_EditForm_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("AllowDelete", m_AllowDelete)
nvi.ValueType = adInteger
  Set nvi = nv.Add("AllowAddNew", m_AllowAddNew)
nvi.ValueType = adInteger
  Set nvi = nv.Add("AddStatusColumn_", m_AddStatusColumn_)
nvi.ValueType = adInteger
  Set nvi = nv.Add("AllowEditRowStatusNameValue", m_AllowEditRowStatusNameValue)
nvi.ValueSize = 256
  Set nvi = nv.Add("AllowEditField", m_AllowEditField)
nvi.ValueSize = 256
 ' Reference to object
    If m_JournalID_ID = "" Then
       Set nvi = nv.Add("JournalID", "")
    Else
       Set nvi = nv.Add("JournalID", m_JournalID_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("FilterUserClientDef", m_FilterUserClientDef)
nvi.ValueSize = 256
  Set nvi = nv.Add("AllowEditUserClientDef", m_AllowEditUserClientDef)
nvi.ValueType = adInteger
  Set nvi = nv.Add("ClientDefField", m_ClientDefField)
nvi.ValueSize = 256
  Set nvi = nv.Add("DataNavigateUrlField", m_DataNavigateUrlField)
nvi.ValueSize = 256
  Set nvi = nv.Add("PagerSize", m_PagerSize)
nvi.ValueType = adInteger
  Set nvi = nv.Add("EditCaption", m_EditCaption)
nvi.ValueSize = 256
  Set nvi = nv.Add("ViewCaption", m_ViewCaption)
nvi.ValueSize = 256
  Set nvi = nv.Add("DeleteCaption", m_DeleteCaption)
nvi.ValueSize = 256
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
 m_Brief = m_Brief & FilterUserIDFieldName_ & "; "
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

m_FilterUserIDFieldName_ = nv.item("FilterUserIDFieldName_").Value
m_Filter_ = nv.item("Filter_").Value
m_SelectIDParameterName = nv.item("SelectIDParameterName").Value
  m_EditForm_ID = nv.item("EditForm").Value
m_AllowDelete = nv.item("AllowDelete").Value
m_AllowAddNew = nv.item("AllowAddNew").Value
m_AddStatusColumn_ = nv.item("AddStatusColumn_").Value
m_AllowEditRowStatusNameValue = nv.item("AllowEditRowStatusNameValue").Value
m_AllowEditField = nv.item("AllowEditField").Value
  m_JournalID_ID = nv.item("JournalID").Value
m_FilterUserClientDef = nv.item("FilterUserClientDef").Value
m_AllowEditUserClientDef = nv.item("AllowEditUserClientDef").Value
m_ClientDefField = nv.item("ClientDefField").Value
m_DataNavigateUrlField = nv.item("DataNavigateUrlField").Value
m_PagerSize = nv.item("PagerSize").Value
m_EditCaption = nv.item("EditCaption").Value
m_ViewCaption = nv.item("ViewCaption").Value
m_DeleteCaption = nv.item("DeleteCaption").Value
Else

m_FilterUserIDFieldName_ = nv.Fields("FilterUserIDFieldName_").Value
m_Filter_ = nv.Fields("Filter_").Value
m_SelectIDParameterName = nv.Fields("SelectIDParameterName").Value
  m_EditForm_ID = nv.Fields("EditForm").Value
m_AllowDelete = nv.Fields("AllowDelete").Value
m_AllowAddNew = nv.Fields("AllowAddNew").Value
m_AddStatusColumn_ = nv.Fields("AddStatusColumn_").Value
m_AllowEditRowStatusNameValue = nv.Fields("AllowEditRowStatusNameValue").Value
m_AllowEditField = nv.Fields("AllowEditField").Value
  m_JournalID_ID = nv.Fields("JournalID").Value
m_FilterUserClientDef = nv.Fields("FilterUserClientDef").Value
m_AllowEditUserClientDef = nv.Fields("AllowEditUserClientDef").Value
m_ClientDefField = nv.Fields("ClientDefField").Value
m_DataNavigateUrlField = nv.Fields("DataNavigateUrlField").Value
m_PagerSize = nv.Fields("PagerSize").Value
m_EditCaption = nv.Fields("EditCaption").Value
m_ViewCaption = nv.Fields("ViewCaption").Value
m_DeleteCaption = nv.Fields("DeleteCaption").Value
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
   Dim o As TablePart
   Set o = New TablePart
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
  err.Raise err.Number, "TablePart.Save", err.Description
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
  err.Raise err.Number, "TablePart.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("TablePart", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "TablePart.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "TablePart", id
Exit Sub
bye:
  err.Raise err.Number, "TablePart.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 m_EditForm_ID = ""
 Set m_EditForm = Nothing
 m_JournalID_ID = ""
 Set m_JournalID = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "TablePart.CloseClass"
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
  FilterUserIDFieldName_ = Replace(node.Attributes.getNamedItem("FILTERUSERIDFIELDNAME_").nodeValue, vbLf, vbCrLf)
  Filter_ = Replace(node.Attributes.getNamedItem("FILTER_").nodeValue, vbLf, vbCrLf)
  SelectIDParameterName = Replace(node.Attributes.getNamedItem("SELECTIDPARAMETERNAME").nodeValue, vbLf, vbCrLf)
  Set EditForm = Nothing
  m_EditForm_ID = node.Attributes.getNamedItem("EDITFORM").nodeValue
  m_EditForm_ID_BRIEF = node.Attributes.getNamedItem("EDITFORM_BRIEF").nodeValue
  AllowDelete = node.Attributes.getNamedItem("ALLOWDELETE").nodeValue
  AllowAddNew = node.Attributes.getNamedItem("ALLOWADDNEW").nodeValue
  AddStatusColumn_ = node.Attributes.getNamedItem("ADDSTATUSCOLUMN_").nodeValue
  AllowEditRowStatusNameValue = Replace(node.Attributes.getNamedItem("ALLOWEDITROWSTATUSNAMEVALUE").nodeValue, vbLf, vbCrLf)
  AllowEditField = Replace(node.Attributes.getNamedItem("ALLOWEDITFIELD").nodeValue, vbLf, vbCrLf)
  Set JournalID = Nothing
  m_JournalID_ID = node.Attributes.getNamedItem("JOURNALID").nodeValue
  m_JournalID_ID_BRIEF = node.Attributes.getNamedItem("JOURNALID_BRIEF").nodeValue
  FilterUserClientDef = Replace(node.Attributes.getNamedItem("FILTERUSERCLIENTDEF").nodeValue, vbLf, vbCrLf)
  AllowEditUserClientDef = node.Attributes.getNamedItem("ALLOWEDITUSERCLIENTDEF").nodeValue
  ClientDefField = Replace(node.Attributes.getNamedItem("CLIENTDEFFIELD").nodeValue, vbLf, vbCrLf)
  DataNavigateUrlField = Replace(node.Attributes.getNamedItem("DATANAVIGATEURLFIELD").nodeValue, vbLf, vbCrLf)
  PagerSize = node.Attributes.getNamedItem("PAGERSIZE").nodeValue
  EditCaption = Replace(node.Attributes.getNamedItem("EDITCAPTION").nodeValue, vbLf, vbCrLf)
  ViewCaption = Replace(node.Attributes.getNamedItem("VIEWCAPTION").nodeValue, vbLf, vbCrLf)
  DeleteCaption = Replace(node.Attributes.getNamedItem("DELETECAPTION").nodeValue, vbLf, vbCrLf)
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
  node.setAttribute "FILTERUSERIDFIELDNAME_", FilterUserIDFieldName_
  node.setAttribute "FILTER_", Filter_
  node.setAttribute "SELECTIDPARAMETERNAME", SelectIDParameterName
  node.setAttribute "EDITFORM", m_EditForm_ID
  If Not (EditForm Is Nothing) Then
    node.setAttribute "EDITFORM_BRIEF", EditForm.Brief
  Else
    node.setAttribute "EDITFORM_BRIEF", m_EditForm_ID_BRIEF
  End If
  node.setAttribute "ALLOWDELETE", AllowDelete
  node.setAttribute "ALLOWADDNEW", AllowAddNew
  node.setAttribute "ADDSTATUSCOLUMN_", AddStatusColumn_
  node.setAttribute "ALLOWEDITROWSTATUSNAMEVALUE", AllowEditRowStatusNameValue
  node.setAttribute "ALLOWEDITFIELD", AllowEditField
  node.setAttribute "JOURNALID", m_JournalID_ID
  If Not (JournalID Is Nothing) Then
    node.setAttribute "JOURNALID_BRIEF", JournalID.Brief
  Else
    node.setAttribute "JOURNALID_BRIEF", m_JournalID_ID_BRIEF
  End If
  node.setAttribute "FILTERUSERCLIENTDEF", FilterUserClientDef
  node.setAttribute "ALLOWEDITUSERCLIENTDEF", AllowEditUserClientDef
  node.setAttribute "CLIENTDEFFIELD", ClientDefField
  node.setAttribute "DATANAVIGATEURLFIELD", DataNavigateUrlField
  node.setAttribute "PAGERSIZE", PagerSize
  node.setAttribute "EDITCAPTION", EditCaption
  node.setAttribute "VIEWCAPTION", ViewCaption
  node.setAttribute "DELETECAPTION", DeleteCaption
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
m_IsLocked = Application.MTZSession.IsLocked("TablePart", id)
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
OK = Application.MTZSession.LockResource("TablePart", id, Permanent)
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
Application.MTZSession.UnLockResource "TablePart", id
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
CanLock = Application.MTZSession.CanLock("TablePart", id)
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



