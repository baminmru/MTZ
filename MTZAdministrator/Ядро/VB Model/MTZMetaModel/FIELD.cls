VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "FIELD"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'строка раздела Поле
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
Private m_FIELDVALIDATOR As FIELDVALIDATOR_col
Private m_FIELDMENU As FIELDMENU_col
Private m_FldExtenders As FldExtenders_col
Private m_FIELDEXPRESSION As FIELDEXPRESSION_col
Private m_DINAMICFILTERSCRIPT As DINAMICFILTERSCRIPT_col
Private m_FIELDSRCDEF As FIELDSRCDEF_col
Private m_Sequence As Long
Private m_Caption As String
Private m_Name As String
Private m_FieldType As Object
Dim m_FieldType_ID As String
Dim m_FieldType_ID_BRIEF As String
Private m_IsBrief As enumBoolean
Private m_AllowNull As enumBoolean
Private m_DataSize As Long
Private m_ReferenceType As enumReferenceType
Private m_RefToType As Object
Dim m_RefToType_ID As String
Dim m_RefToType_ID_BRIEF As String
Private m_RefToPart As Object
Dim m_RefToPart_ID As String
Dim m_RefToPart_ID_BRIEF As String
Private m_InternalReference As enumBoolean
Private m_CreateRefOnly As enumBoolean
Private m_IsAutoNumber As enumBoolean
Private m_TheNumerator As Object
Dim m_TheNumerator_ID As String
Dim m_TheNumerator_ID_BRIEF As String
Private m_ZoneTemplate As String
Private m_NumberDateField As Object
Dim m_NumberDateField_ID As String
Dim m_NumberDateField_ID_BRIEF As String
Private m_TheComment As String
Private m_shablonBrief As String
Private m_theNameClass As String
Private m_TheMask As String
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
  PartName = "FIELD"
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
  m_Application.Logger.Message "FIELD.Init"
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

'Данные дочернего раздела Логика поля на форме
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса FIELDVALIDATOR_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as FIELDVALIDATOR_col
' Set variable = me. FIELDVALIDATOR (...параметры...)
Public Property Get FIELDVALIDATOR(Optional ByVal Refresh As Boolean = True) As FIELDVALIDATOR_col
 If m_FIELDVALIDATOR Is Nothing Then
   Set m_FIELDVALIDATOR = New FIELDVALIDATOR_col
   Set m_FIELDVALIDATOR.Parent = Me
   Set m_FIELDVALIDATOR.Application = Me.Application
   If Refresh Then m_FIELDVALIDATOR.Refresh
 End If
 Set FIELDVALIDATOR = m_FIELDVALIDATOR
End Property

'Данные дочернего раздела Методы поля
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса FIELDMENU_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as FIELDMENU_col
' Set variable = me. FIELDMENU (...параметры...)
Public Property Get FIELDMENU(Optional ByVal Refresh As Boolean = True) As FIELDMENU_col
 If m_FIELDMENU Is Nothing Then
   Set m_FIELDMENU = New FIELDMENU_col
   Set m_FIELDMENU.Parent = Me
   Set m_FIELDMENU.Application = Me.Application
   If Refresh Then m_FIELDMENU.Refresh
 End If
 Set FIELDMENU = m_FIELDMENU
End Property

'Данные дочернего раздела Интерфейсы расширения
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса FldExtenders_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as FldExtenders_col
' Set variable = me. FldExtenders (...параметры...)
Public Property Get FldExtenders(Optional ByVal Refresh As Boolean = True) As FldExtenders_col
 If m_FldExtenders Is Nothing Then
   Set m_FldExtenders = New FldExtenders_col
   Set m_FldExtenders.Parent = Me
   Set m_FldExtenders.Application = Me.Application
   If Refresh Then m_FldExtenders.Refresh
 End If
 Set FldExtenders = m_FldExtenders
End Property

'Данные дочернего раздела Значение по умолчанию
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса FIELDEXPRESSION_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as FIELDEXPRESSION_col
' Set variable = me. FIELDEXPRESSION (...параметры...)
Public Property Get FIELDEXPRESSION(Optional ByVal Refresh As Boolean = True) As FIELDEXPRESSION_col
 If m_FIELDEXPRESSION Is Nothing Then
   Set m_FIELDEXPRESSION = New FIELDEXPRESSION_col
   Set m_FIELDEXPRESSION.Parent = Me
   Set m_FIELDEXPRESSION.Application = Me.Application
   If Refresh Then m_FIELDEXPRESSION.Refresh
 End If
 Set FIELDEXPRESSION = m_FIELDEXPRESSION
End Property

'Данные дочернего раздела Динамический фильтр
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса DINAMICFILTERSCRIPT_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as DINAMICFILTERSCRIPT_col
' Set variable = me. DINAMICFILTERSCRIPT (...параметры...)
Public Property Get DINAMICFILTERSCRIPT(Optional ByVal Refresh As Boolean = True) As DINAMICFILTERSCRIPT_col
 If m_DINAMICFILTERSCRIPT Is Nothing Then
   Set m_DINAMICFILTERSCRIPT = New DINAMICFILTERSCRIPT_col
   Set m_DINAMICFILTERSCRIPT.Parent = Me
   Set m_DINAMICFILTERSCRIPT.Application = Me.Application
   If Refresh Then m_DINAMICFILTERSCRIPT.Refresh
 End If
 Set DINAMICFILTERSCRIPT = m_DINAMICFILTERSCRIPT
End Property

'Данные дочернего раздела Описание источника данных
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса FIELDSRCDEF_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as FIELDSRCDEF_col
' Set variable = me. FIELDSRCDEF (...параметры...)
Public Property Get FIELDSRCDEF(Optional ByVal Refresh As Boolean = True) As FIELDSRCDEF_col
 If m_FIELDSRCDEF Is Nothing Then
   Set m_FIELDSRCDEF = New FIELDSRCDEF_col
   Set m_FIELDSRCDEF.Parent = Me
   Set m_FIELDSRCDEF.Application = Me.Application
   If Refresh Then m_FIELDSRCDEF.Refresh
 End If
 Set FIELDSRCDEF = m_FIELDSRCDEF
End Property
' let
'№ п/п

'№ п/п
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Sequence(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Sequence", Sequence, NewValue

   m_Sequence = NewValue
End If
End Property

'№ п/п
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. Sequence
Public Property Get Sequence() As Long
 LoadFromDatabase
 AccessTime = Now

   Sequence = m_Sequence
End Property
' let
'Надпись

'Надпись
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

'Надпись
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
'Имя поля

'Имя поля
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

'Имя поля
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
'Тип поля

'Тип поля
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set FieldType(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FieldType", FieldType, NewValue
On Error Resume Next
m_FieldType_ID = ""
m_FieldType_ID = NewValue.id
'  set   m_FieldType= newValue
End If
End Property

'Тип поля
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. FieldType
Public Property Get FieldType() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_FieldType As Object
If m_FieldType_ID <> "" Then
  Set tmp_FieldType = Application.FindRowObject("FIELDTYPE", m_FieldType_ID)
  If tmp_FieldType Is Nothing Then
    m_FieldType_ID_BRIEF = ""
  Else
    m_FieldType_ID_BRIEF = tmp_FieldType.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "FIELDTYPE" & m_FieldType_ID, tmp_FieldType
  Set FieldType = tmp_FieldType
  Exit Property
End If
  '  set FieldType = m_FieldType
End Property
' let
'Краткая информация

'Краткая информация
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IsBrief(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IsBrief", IsBrief, NewValue

   m_IsBrief = NewValue
End If
End Property

'Краткая информация
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. IsBrief
Public Property Get IsBrief() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   IsBrief = m_IsBrief
End Property
' let
'Может быть пустым

'Может быть пустым
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let AllowNull(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "AllowNull", AllowNull, NewValue

   m_AllowNull = NewValue
End If
End Property

'Может быть пустым
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. AllowNull
Public Property Get AllowNull() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   AllowNull = m_AllowNull
End Property
' let
'Размер поля

'Размер поля
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DataSize(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DataSize", DataSize, NewValue

   m_DataSize = NewValue
End If
End Property

'Размер поля
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. DataSize
Public Property Get DataSize() As Long
 LoadFromDatabase
 AccessTime = Now

   DataSize = m_DataSize
End Property
' let
'Тип ссылки

'Тип ссылки
'Parameters:
'[IN]   newValue , тип параметра: enumReferenceType  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ReferenceType(ByVal NewValue As enumReferenceType)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ReferenceType", ReferenceType, NewValue

   m_ReferenceType = NewValue
End If
End Property

'Тип ссылки
'Parameters:
' параметров нет
'Returns:
'  объект класса enumReferenceType
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumReferenceType
' Set variable = me. ReferenceType
Public Property Get ReferenceType() As enumReferenceType
 LoadFromDatabase
 AccessTime = Now

   ReferenceType = m_ReferenceType
End Property
' let
'Ссылка на тип

'Ссылка на тип
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set RefToType(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "RefToType", RefToType, NewValue
On Error Resume Next
m_RefToType_ID = ""
m_RefToType_ID = NewValue.id
'  set   m_RefToType= newValue
End If
End Property

'Ссылка на тип
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. RefToType
Public Property Get RefToType() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_RefToType As Object
If m_RefToType_ID <> "" Then
  Set tmp_RefToType = Application.FindRowObject("OBJECTTYPE", m_RefToType_ID)
  If tmp_RefToType Is Nothing Then
    m_RefToType_ID_BRIEF = ""
  Else
    m_RefToType_ID_BRIEF = tmp_RefToType.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "OBJECTTYPE" & m_RefToType_ID, tmp_RefToType
  Set RefToType = tmp_RefToType
  Exit Property
End If
  '  set RefToType = m_RefToType
End Property
' let
'Ссылка на раздел

'Ссылка на раздел
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set RefToPart(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "RefToPart", RefToPart, NewValue
On Error Resume Next
m_RefToPart_ID = ""
m_RefToPart_ID = NewValue.id
'  set   m_RefToPart= newValue
End If
End Property

'Ссылка на раздел
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. RefToPart
Public Property Get RefToPart() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_RefToPart As Object
If m_RefToPart_ID <> "" Then
  Set tmp_RefToPart = Application.FindRowObject("PART", m_RefToPart_ID)
  If tmp_RefToPart Is Nothing Then
    m_RefToPart_ID_BRIEF = ""
  Else
    m_RefToPart_ID_BRIEF = tmp_RefToPart.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PART" & m_RefToPart_ID, tmp_RefToPart
  Set RefToPart = tmp_RefToPart
  Exit Property
End If
  '  set RefToPart = m_RefToPart
End Property
' let
'Ссылка в пределах объекта

'Ссылка в пределах объекта
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let InternalReference(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "InternalReference", InternalReference, NewValue

   m_InternalReference = NewValue
End If
End Property

'Ссылка в пределах объекта
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. InternalReference
Public Property Get InternalReference() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   InternalReference = m_InternalReference
End Property
' let
'Только создание объекта

'Только создание объекта
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let CreateRefOnly(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CreateRefOnly", CreateRefOnly, NewValue

   m_CreateRefOnly = NewValue
End If
End Property

'Только создание объекта
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. CreateRefOnly
Public Property Get CreateRefOnly() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   CreateRefOnly = m_CreateRefOnly
End Property
' let
'Автонумерация

'Автонумерация
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IsAutoNumber(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IsAutoNumber", IsAutoNumber, NewValue

   m_IsAutoNumber = NewValue
End If
End Property

'Автонумерация
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. IsAutoNumber
Public Property Get IsAutoNumber() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   IsAutoNumber = m_IsAutoNumber
End Property
' let
'Нумератор

'Нумератор
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TheNumerator(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheNumerator", TheNumerator, NewValue
On Error Resume Next
m_TheNumerator_ID = ""
m_TheNumerator_ID = NewValue.id
' set   m_TheNumerator= newValue
End If
End Property

'Нумератор
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TheNumerator
Public Property Get TheNumerator() As Object
 LoadFromDatabase
 AccessTime = Now
If m_TheNumerator_ID <> "" Then
  Set TheNumerator = Application.Manager.GetInstanceObject(Right(m_TheNumerator_ID, 38))
 Exit Property
End If
  ' set TheNumerator = m_TheNumerator
End Property
' let
'Шаблон зоны нумерации

'Шаблон зоны нумерации
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ZoneTemplate(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ZoneTemplate", ZoneTemplate, NewValue

   m_ZoneTemplate = NewValue
End If
End Property

'Шаблон зоны нумерации
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. ZoneTemplate
Public Property Get ZoneTemplate() As String
 LoadFromDatabase
 AccessTime = Now

   ZoneTemplate = m_ZoneTemplate
End Property
' let
'Поле для расчета даты

'Поле для расчета даты
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set NumberDateField(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "NumberDateField", NumberDateField, NewValue
On Error Resume Next
m_NumberDateField_ID = ""
m_NumberDateField_ID = NewValue.id
'  set   m_NumberDateField= newValue
End If
End Property

'Поле для расчета даты
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. NumberDateField
Public Property Get NumberDateField() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_NumberDateField As Object
If m_NumberDateField_ID <> "" Then
  Set tmp_NumberDateField = Application.FindRowObject("FIELD", m_NumberDateField_ID)
  If tmp_NumberDateField Is Nothing Then
    m_NumberDateField_ID_BRIEF = ""
  Else
    m_NumberDateField_ID_BRIEF = tmp_NumberDateField.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "FIELD" & m_NumberDateField_ID, tmp_NumberDateField
  Set NumberDateField = tmp_NumberDateField
  Exit Property
End If
  '  set NumberDateField = m_NumberDateField
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
' let
'Шаблон для краткого отображения

'Шаблон для краткого отображения
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let shablonBrief(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "shablonBrief", shablonBrief, NewValue

   m_shablonBrief = NewValue
End If
End Property

'Шаблон для краткого отображения
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. shablonBrief
Public Property Get shablonBrief() As String
 LoadFromDatabase
 AccessTime = Now

   shablonBrief = m_shablonBrief
End Property
' let
'Имя класса для мастера строк

'Имя класса для мастера строк
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let theNameClass(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "theNameClass", theNameClass, NewValue

   m_theNameClass = NewValue
End If
End Property

'Имя класса для мастера строк
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. theNameClass
Public Property Get theNameClass() As String
 LoadFromDatabase
 AccessTime = Now

   theNameClass = m_theNameClass
End Property
' let
'Маска

'Маска
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TheMask(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheMask", TheMask, NewValue

   m_TheMask = NewValue
End If
End Property

'Маска
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. TheMask
Public Property Get TheMask() As String
 LoadFromDatabase
 AccessTime = Now

   TheMask = m_TheMask
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

  Set nvi = nv.Add("Sequence", m_Sequence)
nvi.ValueType = adInteger
  Set nvi = nv.Add("Caption", m_Caption)
nvi.ValueSize = 80
  Set nvi = nv.Add("Name", m_Name)
nvi.ValueSize = 64
 ' Reference to FIELDTYPE
    If m_FieldType_ID = "" Then
       Set nvi = nv.Add("FieldType", "")
    Else
       Set nvi = nv.Add("FieldType", m_FieldType_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("IsBrief", m_IsBrief)
nvi.ValueType = adInteger
  Set nvi = nv.Add("AllowNull", m_AllowNull)
nvi.ValueType = adInteger
  Set nvi = nv.Add("DataSize", m_DataSize)
nvi.ValueType = adInteger
  Set nvi = nv.Add("ReferenceType", m_ReferenceType)
nvi.ValueType = adInteger
 ' Reference to OBJECTTYPE
    If m_RefToType_ID = "" Then
       Set nvi = nv.Add("RefToType", "")
    Else
       Set nvi = nv.Add("RefToType", m_RefToType_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to PART
    If m_RefToPart_ID = "" Then
       Set nvi = nv.Add("RefToPart", "")
    Else
       Set nvi = nv.Add("RefToPart", m_RefToPart_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("InternalReference", m_InternalReference)
nvi.ValueType = adInteger
  Set nvi = nv.Add("CreateRefOnly", m_CreateRefOnly)
nvi.ValueType = adInteger
  Set nvi = nv.Add("IsAutoNumber", m_IsAutoNumber)
nvi.ValueType = adInteger
 ' Reference to object
    If m_TheNumerator_ID = "" Then
       Set nvi = nv.Add("TheNumerator", "")
    Else
       Set nvi = nv.Add("TheNumerator", m_TheNumerator_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("ZoneTemplate", m_ZoneTemplate)
nvi.ValueSize = 255
 ' Reference to FIELD
    If m_NumberDateField_ID = "" Then
       Set nvi = nv.Add("NumberDateField", "")
    Else
       Set nvi = nv.Add("NumberDateField", m_NumberDateField_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("TheComment", m_TheComment)
  Set nvi = nv.Add("shablonBrief", m_shablonBrief)
nvi.ValueSize = 100
  Set nvi = nv.Add("theNameClass", m_theNameClass)
nvi.ValueSize = 100
  Set nvi = nv.Add("TheMask", m_TheMask)
nvi.ValueSize = 64
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
 m_Brief = m_Brief & Caption & "; "
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

m_Sequence = nv.item("Sequence").Value
m_Caption = nv.item("Caption").Value
m_Name = nv.item("Name").Value
  m_FieldType_ID = nv.item("FieldType").Value
m_IsBrief = nv.item("IsBrief").Value
m_AllowNull = nv.item("AllowNull").Value
m_DataSize = nv.item("DataSize").Value
m_ReferenceType = nv.item("ReferenceType").Value
  m_RefToType_ID = nv.item("RefToType").Value
  m_RefToPart_ID = nv.item("RefToPart").Value
m_InternalReference = nv.item("InternalReference").Value
m_CreateRefOnly = nv.item("CreateRefOnly").Value
m_IsAutoNumber = nv.item("IsAutoNumber").Value
  m_TheNumerator_ID = nv.item("TheNumerator").Value
m_ZoneTemplate = nv.item("ZoneTemplate").Value
  m_NumberDateField_ID = nv.item("NumberDateField").Value
m_TheComment = nv.item("TheComment").Value
m_shablonBrief = nv.item("shablonBrief").Value
m_theNameClass = nv.item("theNameClass").Value
m_TheMask = nv.item("TheMask").Value
Else

m_Sequence = nv.Fields("Sequence").Value
m_Caption = nv.Fields("Caption").Value
m_Name = nv.Fields("Name").Value
  m_FieldType_ID = nv.Fields("FieldType").Value
m_IsBrief = nv.Fields("IsBrief").Value
m_AllowNull = nv.Fields("AllowNull").Value
m_DataSize = nv.Fields("DataSize").Value
m_ReferenceType = nv.Fields("ReferenceType").Value
  m_RefToType_ID = nv.Fields("RefToType").Value
  m_RefToPart_ID = nv.Fields("RefToPart").Value
m_InternalReference = nv.Fields("InternalReference").Value
m_CreateRefOnly = nv.Fields("CreateRefOnly").Value
m_IsAutoNumber = nv.Fields("IsAutoNumber").Value
  m_TheNumerator_ID = nv.Fields("TheNumerator").Value
m_ZoneTemplate = nv.Fields("ZoneTemplate").Value
  m_NumberDateField_ID = nv.Fields("NumberDateField").Value
m_TheComment = nv.Fields("TheComment").Value
m_shablonBrief = nv.Fields("shablonBrief").Value
m_theNameClass = nv.Fields("theNameClass").Value
m_TheMask = nv.Fields("TheMask").Value
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
   Dim o As FIELD
   Set o = New FIELD
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
  err.Raise err.Number, "FIELD.Save", err.Description
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
  err.Raise err.Number, "FIELD.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("FIELD", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "FIELD.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "FIELD", id
Exit Sub
bye:
  err.Raise err.Number, "FIELD.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

If Not m_FIELDVALIDATOR Is Nothing Then
  m_FIELDVALIDATOR.CloseClass
  Set m_FIELDVALIDATOR = Nothing
End If
If Not m_FIELDMENU Is Nothing Then
  m_FIELDMENU.CloseClass
  Set m_FIELDMENU = Nothing
End If
If Not m_FldExtenders Is Nothing Then
  m_FldExtenders.CloseClass
  Set m_FldExtenders = Nothing
End If
If Not m_FIELDEXPRESSION Is Nothing Then
  m_FIELDEXPRESSION.CloseClass
  Set m_FIELDEXPRESSION = Nothing
End If
If Not m_DINAMICFILTERSCRIPT Is Nothing Then
  m_DINAMICFILTERSCRIPT.CloseClass
  Set m_DINAMICFILTERSCRIPT = Nothing
End If
If Not m_FIELDSRCDEF Is Nothing Then
  m_FIELDSRCDEF.CloseClass
  Set m_FIELDSRCDEF = Nothing
End If
 m_FieldType_ID = ""
 Set m_FieldType = Nothing
 m_RefToType_ID = ""
 Set m_RefToType = Nothing
 m_RefToPart_ID = ""
 Set m_RefToPart = Nothing
 m_TheNumerator_ID = ""
 Set m_TheNumerator = Nothing
 m_NumberDateField_ID = ""
 Set m_NumberDateField = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "FIELD.CloseClass"
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
   Set m_FindObject = FIELDVALIDATOR.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = FIELDMENU.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = FldExtenders.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = FIELDEXPRESSION.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = DINAMICFILTERSCRIPT.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = FIELDSRCDEF.FindObject(StrID, InstID)
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

FIELDVALIDATOR.Compact
FIELDMENU.Compact
FldExtenders.Compact
FIELDEXPRESSION.Compact
DINAMICFILTERSCRIPT.Compact
FIELDSRCDEF.Compact
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
  Sequence = node.Attributes.getNamedItem("SEQUENCE").nodeValue
  Caption = Replace(node.Attributes.getNamedItem("CAPTION").nodeValue, vbLf, vbCrLf)
  Name = Replace(node.Attributes.getNamedItem("NAME").nodeValue, vbLf, vbCrLf)
  Set FieldType = Nothing
  m_FieldType_ID = node.Attributes.getNamedItem("FIELDTYPE").nodeValue
  m_FieldType_ID_BRIEF = node.Attributes.getNamedItem("FIELDTYPE_BRIEF").nodeValue
  IsBrief = node.Attributes.getNamedItem("ISBRIEF").nodeValue
  AllowNull = node.Attributes.getNamedItem("ALLOWNULL").nodeValue
  DataSize = node.Attributes.getNamedItem("DATASIZE").nodeValue
  ReferenceType = node.Attributes.getNamedItem("REFERENCETYPE").nodeValue
  Set RefToType = Nothing
  m_RefToType_ID = node.Attributes.getNamedItem("REFTOTYPE").nodeValue
  m_RefToType_ID_BRIEF = node.Attributes.getNamedItem("REFTOTYPE_BRIEF").nodeValue
  Set RefToPart = Nothing
  m_RefToPart_ID = node.Attributes.getNamedItem("REFTOPART").nodeValue
  m_RefToPart_ID_BRIEF = node.Attributes.getNamedItem("REFTOPART_BRIEF").nodeValue
  InternalReference = node.Attributes.getNamedItem("INTERNALREFERENCE").nodeValue
  CreateRefOnly = node.Attributes.getNamedItem("CREATEREFONLY").nodeValue
  IsAutoNumber = node.Attributes.getNamedItem("ISAUTONUMBER").nodeValue
  Set TheNumerator = Nothing
  m_TheNumerator_ID = node.Attributes.getNamedItem("THENUMERATOR").nodeValue
  m_TheNumerator_ID_BRIEF = node.Attributes.getNamedItem("THENUMERATOR_BRIEF").nodeValue
  ZoneTemplate = Replace(node.Attributes.getNamedItem("ZONETEMPLATE").nodeValue, vbLf, vbCrLf)
  Set NumberDateField = Nothing
  m_NumberDateField_ID = node.Attributes.getNamedItem("NUMBERDATEFIELD").nodeValue
  m_NumberDateField_ID_BRIEF = node.Attributes.getNamedItem("NUMBERDATEFIELD_BRIEF").nodeValue
  TheComment = Replace(node.Attributes.getNamedItem("THECOMMENT").nodeValue, vbLf, vbCrLf)
  shablonBrief = Replace(node.Attributes.getNamedItem("SHABLONBRIEF").nodeValue, vbLf, vbCrLf)
  theNameClass = Replace(node.Attributes.getNamedItem("THENAMECLASS").nodeValue, vbLf, vbCrLf)
  TheMask = Replace(node.Attributes.getNamedItem("THEMASK").nodeValue, vbLf, vbCrLf)
  On Error GoTo bye
  'if m_ChangeTime >= m_RetriveTime then m_Changed = true
  m_Changed = True
  m_RowRetrived = True
  m_Brief = ""
  On Error Resume Next
  Set e_list = node.selectNodes("FIELDVALIDATOR_COL")
  FIELDVALIDATOR.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("FIELDMENU_COL")
  FIELDMENU.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("FLDEXTENDERS_COL")
  FldExtenders.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("FIELDEXPRESSION_COL")
  FIELDEXPRESSION.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("DINAMICFILTERSCRIPT_COL")
  DINAMICFILTERSCRIPT.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("FIELDSRCDEF_COL")
  FIELDSRCDEF.XMLLoad e_list, LoadMode
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
  node.setAttribute "SEQUENCE", Sequence
  node.setAttribute "CAPTION", Caption
  node.setAttribute "NAME", Name
  node.setAttribute "FIELDTYPE", m_FieldType_ID
  If Not (FieldType Is Nothing) Then
    node.setAttribute "FIELDTYPE_BRIEF", FieldType.Brief
  Else
    node.setAttribute "FIELDTYPE_BRIEF", m_FieldType_ID_BRIEF
  End If
  node.setAttribute "ISBRIEF", IsBrief
  node.setAttribute "ALLOWNULL", AllowNull
  node.setAttribute "DATASIZE", DataSize
  node.setAttribute "REFERENCETYPE", ReferenceType
  node.setAttribute "REFTOTYPE", m_RefToType_ID
  If Not (RefToType Is Nothing) Then
    node.setAttribute "REFTOTYPE_BRIEF", RefToType.Brief
  Else
    node.setAttribute "REFTOTYPE_BRIEF", m_RefToType_ID_BRIEF
  End If
  node.setAttribute "REFTOPART", m_RefToPart_ID
  If Not (RefToPart Is Nothing) Then
    node.setAttribute "REFTOPART_BRIEF", RefToPart.Brief
  Else
    node.setAttribute "REFTOPART_BRIEF", m_RefToPart_ID_BRIEF
  End If
  node.setAttribute "INTERNALREFERENCE", InternalReference
  node.setAttribute "CREATEREFONLY", CreateRefOnly
  node.setAttribute "ISAUTONUMBER", IsAutoNumber
  node.setAttribute "THENUMERATOR", m_TheNumerator_ID
  If Not (TheNumerator Is Nothing) Then
    node.setAttribute "THENUMERATOR_BRIEF", TheNumerator.Brief
  Else
    node.setAttribute "THENUMERATOR_BRIEF", m_TheNumerator_ID_BRIEF
  End If
  node.setAttribute "ZONETEMPLATE", ZoneTemplate
  node.setAttribute "NUMBERDATEFIELD", m_NumberDateField_ID
  If Not (NumberDateField Is Nothing) Then
    node.setAttribute "NUMBERDATEFIELD_BRIEF", NumberDateField.Brief
  Else
    node.setAttribute "NUMBERDATEFIELD_BRIEF", m_NumberDateField_ID_BRIEF
  End If
  node.setAttribute "THECOMMENT", TheComment
  node.setAttribute "SHABLONBRIEF", shablonBrief
  node.setAttribute "THENAMECLASS", theNameClass
  node.setAttribute "THEMASK", TheMask
  node.setAttribute "AccessTime", CDbl(m_AccessTime)
  FIELDVALIDATOR.XMLSave node, xdom
  FIELDMENU.XMLSave node, xdom
  FldExtenders.XMLSave node, xdom
  FIELDEXPRESSION.XMLSave node, xdom
  DINAMICFILTERSCRIPT.XMLSave node, xdom
  FIELDSRCDEF.XMLSave node, xdom
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
m_IsLocked = Application.MTZSession.IsLocked("FIELD", id)
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
OK = Application.MTZSession.LockResource("FIELD", id, Permanent)
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
Application.MTZSession.UnLockResource "FIELD", id
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
CanLock = Application.MTZSession.CanLock("FIELD", id)
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
 FIELDVALIDATOR.BatchUpdate
 FIELDMENU.BatchUpdate
 FldExtenders.BatchUpdate
 FIELDEXPRESSION.BatchUpdate
 DINAMICFILTERSCRIPT.BatchUpdate
 FIELDSRCDEF.BatchUpdate
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
  FIELDVALIDATOR.LoadAll
  FIELDMENU.LoadAll
  FldExtenders.LoadAll
  FIELDEXPRESSION.LoadAll
  DINAMICFILTERSCRIPT.LoadAll
  FIELDSRCDEF.LoadAll
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
 Case "FIELDVALIDATOR"
    item.FIELDVALIDATOR.Refresh
    For i = 1 To item.FIELDVALIDATOR.Count
    nid = CreateGUID2() & item.FIELDVALIDATOR.item(i).id
    tree.nodes.Add(key, 4, nid, item.FIELDVALIDATOR.item(i).Brief(True)).Tag = "Row"
    Next
 Case "FIELDMENU"
    item.FIELDMENU.Refresh
    For i = 1 To item.FIELDMENU.Count
    nid = CreateGUID2() & item.FIELDMENU.item(i).id
    tree.nodes.Add(key, 4, nid, item.FIELDMENU.item(i).Brief(True)).Tag = "Row"
   ' FIELDPARAMMAP
   If Mask <> "" Then
     If Application.MTZSession.IsDescendant(Mask, "FIELDPARAMMAP") Then
      tree.nodes.Add(nid, 4, nid & "FIELDPARAMMAP", "Отображение параметров").Tag = "FIELDPARAMMAP"
      tree.nodes.Add(nid & "FIELDPARAMMAP", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
     End If
   Else
     tree.nodes.Add(nid, 4, nid & "FIELDPARAMMAP", "Отображение параметров").Tag = "FIELDPARAMMAP"
     tree.nodes.Add(nid & "FIELDPARAMMAP", 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
   End If ' FIELDPARAMMAP
    Next
 Case "FldExtenders"
    item.FldExtenders.Refresh
    For i = 1 To item.FldExtenders.Count
    nid = CreateGUID2() & item.FldExtenders.item(i).id
    tree.nodes.Add(key, 4, nid, item.FldExtenders.item(i).Brief(True)).Tag = "Row"
    Next
 Case "FIELDEXPRESSION"
    item.FIELDEXPRESSION.Refresh
    For i = 1 To item.FIELDEXPRESSION.Count
    nid = CreateGUID2() & item.FIELDEXPRESSION.item(i).id
    tree.nodes.Add(key, 4, nid, item.FIELDEXPRESSION.item(i).Brief(True)).Tag = "Row"
    Next
 Case "DINAMICFILTERSCRIPT"
    item.DINAMICFILTERSCRIPT.Refresh
    For i = 1 To item.DINAMICFILTERSCRIPT.Count
    nid = CreateGUID2() & item.DINAMICFILTERSCRIPT.item(i).id
    tree.nodes.Add(key, 4, nid, item.DINAMICFILTERSCRIPT.item(i).Brief(True)).Tag = "Row"
    Next
 Case "FIELDSRCDEF"
    item.FIELDSRCDEF.Refresh
    For i = 1 To item.FIELDSRCDEF.Count
    nid = CreateGUID2() & item.FIELDSRCDEF.item(i).id
    tree.nodes.Add(key, 4, nid, item.FIELDSRCDEF.item(i).Brief(True)).Tag = "Row"
    Next
 End Select
End If ' mode="" (Default)
End Sub



