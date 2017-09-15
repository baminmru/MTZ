VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "WEBS_PAGECOMP"
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
Private m_TablePart As TablePart_col
Private m_ReplaceValues As ReplaceValues_col
Private m_DenyEdit As DenyEdit_col
Private m_DenyVisible As DenyVisible_col
Private m_AllowEditFieldValues As AllowEditFieldValues_col
Private m_ComboFields As ComboFields_col
Private m_Name As String
Private m_Title As String
Private m_Selected As enumBoolean
Private m_IsCollection As enumBoolean
Private m_the_PartName As Object
Dim m_the_PartName_ID As String
Dim m_the_PartName_ID_BRIEF As String
Private m_IDField As String
Private m_UserIdField As String
Private m_Visible As enumBoolean
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
  PartName = "WEBS_PAGECOMP"
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
  m_Application.Logger.Message "WEBS_PAGECOMP.Init"
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

'Данные дочернего раздела Табличная часть
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса TablePart_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as TablePart_col
' Set variable = me. TablePart (...параметры...)
Public Property Get TablePart(Optional ByVal Refresh As Boolean = True) As TablePart_col
 If m_TablePart Is Nothing Then
   Set m_TablePart = New TablePart_col
   Set m_TablePart.Parent = Me
   Set m_TablePart.Application = Me.Application
   If Refresh Then m_TablePart.Refresh
 End If
 Set TablePart = m_TablePart
End Property

'Данные дочернего раздела Замены
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса ReplaceValues_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as ReplaceValues_col
' Set variable = me. ReplaceValues (...параметры...)
Public Property Get ReplaceValues(Optional ByVal Refresh As Boolean = True) As ReplaceValues_col
 If m_ReplaceValues Is Nothing Then
   Set m_ReplaceValues = New ReplaceValues_col
   Set m_ReplaceValues.Parent = Me
   Set m_ReplaceValues.Application = Me.Application
   If Refresh Then m_ReplaceValues.Refresh
 End If
 Set ReplaceValues = m_ReplaceValues
End Property

'Данные дочернего раздела Запрещённые для редактирования поля
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса DenyEdit_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as DenyEdit_col
' Set variable = me. DenyEdit (...параметры...)
Public Property Get DenyEdit(Optional ByVal Refresh As Boolean = True) As DenyEdit_col
 If m_DenyEdit Is Nothing Then
   Set m_DenyEdit = New DenyEdit_col
   Set m_DenyEdit.Parent = Me
   Set m_DenyEdit.Application = Me.Application
   If Refresh Then m_DenyEdit.Refresh
 End If
 Set DenyEdit = m_DenyEdit
End Property

'Данные дочернего раздела Невидимые поля
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса DenyVisible_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as DenyVisible_col
' Set variable = me. DenyVisible (...параметры...)
Public Property Get DenyVisible(Optional ByVal Refresh As Boolean = True) As DenyVisible_col
 If m_DenyVisible Is Nothing Then
   Set m_DenyVisible = New DenyVisible_col
   Set m_DenyVisible.Parent = Me
   Set m_DenyVisible.Application = Me.Application
   If Refresh Then m_DenyVisible.Refresh
 End If
 Set DenyVisible = m_DenyVisible
End Property

'Данные дочернего раздела Значения поля, разрешающего редактирование
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса AllowEditFieldValues_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as AllowEditFieldValues_col
' Set variable = me. AllowEditFieldValues (...параметры...)
Public Property Get AllowEditFieldValues(Optional ByVal Refresh As Boolean = True) As AllowEditFieldValues_col
 If m_AllowEditFieldValues Is Nothing Then
   Set m_AllowEditFieldValues = New AllowEditFieldValues_col
   Set m_AllowEditFieldValues.Parent = Me
   Set m_AllowEditFieldValues.Application = Me.Application
   If Refresh Then m_AllowEditFieldValues.Refresh
 End If
 Set AllowEditFieldValues = m_AllowEditFieldValues
End Property

'Данные дочернего раздела Комбобоксы
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса ComboFields_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as ComboFields_col
' Set variable = me. ComboFields (...параметры...)
Public Property Get ComboFields(Optional ByVal Refresh As Boolean = True) As ComboFields_col
 If m_ComboFields Is Nothing Then
   Set m_ComboFields = New ComboFields_col
   Set m_ComboFields.Parent = Me
   Set m_ComboFields.Application = Me.Application
   If Refresh Then m_ComboFields.Refresh
 End If
 Set ComboFields = m_ComboFields
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
Public Property Let Selected(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Selected", Selected, NewValue

   m_Selected = NewValue
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
' Set variable = me. Selected
Public Property Get Selected() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   Selected = m_Selected
End Property
' let
'Коллекция

'Коллекция
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IsCollection(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IsCollection", IsCollection, NewValue

   m_IsCollection = NewValue
End If
End Property

'Коллекция
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. IsCollection
Public Property Get IsCollection() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   IsCollection = m_IsCollection
End Property
' let
'Раздел

'Раздел
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set the_PartName(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "the_PartName", the_PartName, NewValue
On Error Resume Next
m_the_PartName_ID = ""
m_the_PartName_ID = NewValue.id
'  set   m_the_PartName= newValue
End If
End Property

'Раздел
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. the_PartName
Public Property Get the_PartName() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_the_PartName As Object
If m_the_PartName_ID <> "" Then
  Set tmp_the_PartName = Application.FindRowObject("PART", m_the_PartName_ID)
  If tmp_the_PartName Is Nothing Then
    m_the_PartName_ID_BRIEF = ""
  Else
    m_the_PartName_ID_BRIEF = tmp_the_PartName.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PART" & m_the_PartName_ID, tmp_the_PartName
  Set the_PartName = tmp_the_PartName
  Exit Property
End If
  '  set the_PartName = m_the_PartName
End Property
' let
'Поле ID

'Поле ID
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IDField(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IDField", IDField, NewValue

   m_IDField = NewValue
End If
End Property

'Поле ID
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. IDField
Public Property Get IDField() As String
 LoadFromDatabase
 AccessTime = Now

   IDField = m_IDField
End Property
' let
'поле UserID

'поле UserID
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let UserIdField(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "UserIdField", UserIdField, NewValue

   m_UserIdField = NewValue
End If
End Property

'поле UserID
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. UserIdField
Public Property Get UserIdField() As String
 LoadFromDatabase
 AccessTime = Now

   UserIdField = m_UserIdField
End Property
' let
'Видимость

'Видимость
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Visible(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Visible", Visible, NewValue

   m_Visible = NewValue
End If
End Property

'Видимость
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. Visible
Public Property Get Visible() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   Visible = m_Visible
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
nvi.ValueSize = 256
  Set nvi = nv.Add("Title", m_Title)
nvi.ValueSize = 256
  Set nvi = nv.Add("Selected", m_Selected)
nvi.ValueType = adInteger
  Set nvi = nv.Add("IsCollection", m_IsCollection)
nvi.ValueType = adInteger
 ' Reference to PART
    If m_the_PartName_ID = "" Then
       Set nvi = nv.Add("the_PartName", "")
    Else
       Set nvi = nv.Add("the_PartName", m_the_PartName_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("IDField", m_IDField)
nvi.ValueSize = 256
  Set nvi = nv.Add("UserIdField", m_UserIdField)
nvi.ValueSize = 256
  Set nvi = nv.Add("Visible", m_Visible)
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
m_Title = nv.item("Title").Value
m_Selected = nv.item("Selected").Value
m_IsCollection = nv.item("IsCollection").Value
  m_the_PartName_ID = nv.item("the_PartName").Value
m_IDField = nv.item("IDField").Value
m_UserIdField = nv.item("UserIdField").Value
m_Visible = nv.item("Visible").Value
Else

m_Name = nv.Fields("Name").Value
m_Title = nv.Fields("Title").Value
m_Selected = nv.Fields("Selected").Value
m_IsCollection = nv.Fields("IsCollection").Value
  m_the_PartName_ID = nv.Fields("the_PartName").Value
m_IDField = nv.Fields("IDField").Value
m_UserIdField = nv.Fields("UserIdField").Value
m_Visible = nv.Fields("Visible").Value
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
   Dim o As WEBS_PAGECOMP
   Set o = New WEBS_PAGECOMP
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
  err.Raise err.Number, "WEBS_PAGECOMP.Save", err.Description
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
  err.Raise err.Number, "WEBS_PAGECOMP.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("WEBS_PAGECOMP", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "WEBS_PAGECOMP.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "WEBS_PAGECOMP", id
Exit Sub
bye:
  err.Raise err.Number, "WEBS_PAGECOMP.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

If Not m_TablePart Is Nothing Then
  m_TablePart.CloseClass
  Set m_TablePart = Nothing
End If
If Not m_ReplaceValues Is Nothing Then
  m_ReplaceValues.CloseClass
  Set m_ReplaceValues = Nothing
End If
If Not m_DenyEdit Is Nothing Then
  m_DenyEdit.CloseClass
  Set m_DenyEdit = Nothing
End If
If Not m_DenyVisible Is Nothing Then
  m_DenyVisible.CloseClass
  Set m_DenyVisible = Nothing
End If
If Not m_AllowEditFieldValues Is Nothing Then
  m_AllowEditFieldValues.CloseClass
  Set m_AllowEditFieldValues = Nothing
End If
If Not m_ComboFields Is Nothing Then
  m_ComboFields.CloseClass
  Set m_ComboFields = Nothing
End If
 m_the_PartName_ID = ""
 Set m_the_PartName = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "WEBS_PAGECOMP.CloseClass"
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
   Set m_FindObject = TablePart.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = ReplaceValues.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = DenyEdit.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = DenyVisible.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = AllowEditFieldValues.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = ComboFields.FindObject(StrID, InstID)
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

TablePart.Compact
ReplaceValues.Compact
DenyEdit.Compact
DenyVisible.Compact
AllowEditFieldValues.Compact
ComboFields.Compact
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
  Title = Replace(node.Attributes.getNamedItem("TITLE").nodeValue, vbLf, vbCrLf)
  Selected = node.Attributes.getNamedItem("SELECTED").nodeValue
  IsCollection = node.Attributes.getNamedItem("ISCOLLECTION").nodeValue
  Set the_PartName = Nothing
  m_the_PartName_ID = node.Attributes.getNamedItem("THE_PARTNAME").nodeValue
  m_the_PartName_ID_BRIEF = node.Attributes.getNamedItem("THE_PARTNAME_BRIEF").nodeValue
  IDField = Replace(node.Attributes.getNamedItem("IDFIELD").nodeValue, vbLf, vbCrLf)
  UserIdField = Replace(node.Attributes.getNamedItem("USERIDFIELD").nodeValue, vbLf, vbCrLf)
  Visible = node.Attributes.getNamedItem("VISIBLE").nodeValue
  On Error GoTo bye
  'if m_ChangeTime >= m_RetriveTime then m_Changed = true
  m_Changed = True
  m_RowRetrived = True
  m_Brief = ""
  On Error Resume Next
  Set e_list = node.selectNodes("TABLEPART_COL")
  TablePart.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("REPLACEVALUES_COL")
  ReplaceValues.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("DENYEDIT_COL")
  DenyEdit.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("DENYVISIBLE_COL")
  DenyVisible.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("ALLOWEDITFIELDVALUES_COL")
  AllowEditFieldValues.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("COMBOFIELDS_COL")
  ComboFields.XMLLoad e_list, LoadMode
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
  node.setAttribute "TITLE", Title
  node.setAttribute "SELECTED", Selected
  node.setAttribute "ISCOLLECTION", IsCollection
  node.setAttribute "THE_PARTNAME", m_the_PartName_ID
  If Not (the_PartName Is Nothing) Then
    node.setAttribute "THE_PARTNAME_BRIEF", the_PartName.Brief
  Else
    node.setAttribute "THE_PARTNAME_BRIEF", m_the_PartName_ID_BRIEF
  End If
  node.setAttribute "IDFIELD", IDField
  node.setAttribute "USERIDFIELD", UserIdField
  node.setAttribute "VISIBLE", Visible
  node.setAttribute "AccessTime", CDbl(m_AccessTime)
  TablePart.XMLSave node, xdom
  ReplaceValues.XMLSave node, xdom
  DenyEdit.XMLSave node, xdom
  DenyVisible.XMLSave node, xdom
  AllowEditFieldValues.XMLSave node, xdom
  ComboFields.XMLSave node, xdom
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
m_IsLocked = Application.MTZSession.IsLocked("WEBS_PAGECOMP", id)
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
OK = Application.MTZSession.LockResource("WEBS_PAGECOMP", id, Permanent)
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
Application.MTZSession.UnLockResource "WEBS_PAGECOMP", id
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
CanLock = Application.MTZSession.CanLock("WEBS_PAGECOMP", id)
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
 TablePart.BatchUpdate
 ReplaceValues.BatchUpdate
 DenyEdit.BatchUpdate
 DenyVisible.BatchUpdate
 AllowEditFieldValues.BatchUpdate
 ComboFields.BatchUpdate
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
  TablePart.LoadAll
  ReplaceValues.LoadAll
  DenyEdit.LoadAll
  DenyVisible.LoadAll
  AllowEditFieldValues.LoadAll
  ComboFields.LoadAll
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
 Case "TablePart"
    item.TablePart.Refresh
    For i = 1 To item.TablePart.Count
    nid = CreateGUID2() & item.TablePart.item(i).id
    tree.nodes.Add(key, 4, nid, item.TablePart.item(i).Brief(True)).Tag = "Row"
    Next
 Case "ReplaceValues"
    item.ReplaceValues.Refresh
    For i = 1 To item.ReplaceValues.Count
    nid = CreateGUID2() & item.ReplaceValues.item(i).id
    tree.nodes.Add(key, 4, nid, item.ReplaceValues.item(i).Brief(True)).Tag = "Row"
    Next
 Case "DenyEdit"
    item.DenyEdit.Refresh
    For i = 1 To item.DenyEdit.Count
    nid = CreateGUID2() & item.DenyEdit.item(i).id
    tree.nodes.Add(key, 4, nid, item.DenyEdit.item(i).Brief(True)).Tag = "Row"
    Next
 Case "DenyVisible"
    item.DenyVisible.Refresh
    For i = 1 To item.DenyVisible.Count
    nid = CreateGUID2() & item.DenyVisible.item(i).id
    tree.nodes.Add(key, 4, nid, item.DenyVisible.item(i).Brief(True)).Tag = "Row"
    Next
 Case "AllowEditFieldValues"
    item.AllowEditFieldValues.Refresh
    For i = 1 To item.AllowEditFieldValues.Count
    nid = CreateGUID2() & item.AllowEditFieldValues.item(i).id
    tree.nodes.Add(key, 4, nid, item.AllowEditFieldValues.item(i).Brief(True)).Tag = "Row"
    Next
 Case "ComboFields"
    item.ComboFields.Refresh
    For i = 1 To item.ComboFields.Count
    nid = CreateGUID2() & item.ComboFields.item(i).id
    tree.nodes.Add(key, 4, nid, item.ComboFields.item(i).Brief(True)).Tag = "Row"
    Next
 End Select
End If ' mode="" (Default)
End Sub



