VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "WFFD_ATTR1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'строка раздела Дополнительные атрибуты для описания функции
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
Private m_ObjectType As Object
Dim m_ObjectType_ID As String
Dim m_ObjectType_ID_BRIEF As String
Private m_ProcessDocument As Object
Dim m_ProcessDocument_ID As String
Dim m_ProcessDocument_ID_BRIEF As String
Private m_SubProcDocument As String
Private m_DocumentPart As Object
Dim m_DocumentPart_ID As String
Dim m_DocumentPart_ID_BRIEF As String
Private m_PartField As Object
Dim m_PartField_ID As String
Dim m_PartField_ID_BRIEF As String
Private m_Folder As Object
Dim m_Folder_ID As String
Dim m_Folder_ID_BRIEF As String
Private m_ProcessParameter As Object
Dim m_ProcessParameter_ID As String
Dim m_ProcessParameter_ID_BRIEF As String
Private m_ProcessParameter2 As Object
Dim m_ProcessParameter2_ID As String
Dim m_ProcessParameter2_ID_BRIEF As String
Private m_the_Value As String
Private m_Value2 As String
Private m_Path As String
Private m_Path2 As String
Private m_Flag As enumBoolean
Private m_Flag2 As enumBoolean
Private m_SubProcessType As Object
Dim m_SubProcessType_ID As String
Dim m_SubProcessType_ID_BRIEF As String
Private m_ProcessParameter3 As Object
Dim m_ProcessParameter3_ID As String
Dim m_ProcessParameter3_ID_BRIEF As String
Private m_ProcessParameter4 As Object
Dim m_ProcessParameter4_ID As String
Dim m_ProcessParameter4_ID_BRIEF As String
Private m_DocState1 As Object
Dim m_DocState1_ID As String
Dim m_DocState1_ID_BRIEF As String
Private m_DocState2 As Object
Dim m_DocState2_ID As String
Dim m_DocState2_ID_BRIEF As String
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
  PartName = "WFFD_ATTR1"
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
  m_Application.Logger.Message "WFFD_ATTR1.Init"
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
'Документ процеса

'Документ процеса
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set ProcessDocument(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ProcessDocument", ProcessDocument, NewValue
On Error Resume Next
m_ProcessDocument_ID = ""
m_ProcessDocument_ID = NewValue.id
'  set   m_ProcessDocument= newValue
End If
End Property

'Документ процеса
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. ProcessDocument
Public Property Get ProcessDocument() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_ProcessDocument As Object
If m_ProcessDocument_ID <> "" Then
  Set tmp_ProcessDocument = Application.FindRowObject("WFDef_Doc", m_ProcessDocument_ID)
  If tmp_ProcessDocument Is Nothing Then
    m_ProcessDocument_ID_BRIEF = ""
  Else
    m_ProcessDocument_ID_BRIEF = tmp_ProcessDocument.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "WFDef_Doc" & m_ProcessDocument_ID, tmp_ProcessDocument
  Set ProcessDocument = tmp_ProcessDocument
  Exit Property
End If
  '  set ProcessDocument = m_ProcessDocument
End Property
' let
'Название документа в подпроцессе

'Название документа в подпроцессе
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let SubProcDocument(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SubProcDocument", SubProcDocument, NewValue

   m_SubProcDocument = NewValue
End If
End Property

'Название документа в подпроцессе
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. SubProcDocument
Public Property Get SubProcDocument() As String
 LoadFromDatabase
 AccessTime = Now

   SubProcDocument = m_SubProcDocument
End Property
' let
'Раздел документа

'Раздел документа
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set DocumentPart(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DocumentPart", DocumentPart, NewValue
On Error Resume Next
m_DocumentPart_ID = ""
m_DocumentPart_ID = NewValue.id
'  set   m_DocumentPart= newValue
End If
End Property

'Раздел документа
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. DocumentPart
Public Property Get DocumentPart() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_DocumentPart As Object
If m_DocumentPart_ID <> "" Then
  Set tmp_DocumentPart = Application.FindRowObject("PART", m_DocumentPart_ID)
  If tmp_DocumentPart Is Nothing Then
    m_DocumentPart_ID_BRIEF = ""
  Else
    m_DocumentPart_ID_BRIEF = tmp_DocumentPart.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PART" & m_DocumentPart_ID, tmp_DocumentPart
  Set DocumentPart = tmp_DocumentPart
  Exit Property
End If
  '  set DocumentPart = m_DocumentPart
End Property
' let
'Поле в разделе

'Поле в разделе
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set PartField(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PartField", PartField, NewValue
On Error Resume Next
m_PartField_ID = ""
m_PartField_ID = NewValue.id
'  set   m_PartField= newValue
End If
End Property

'Поле в разделе
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. PartField
Public Property Get PartField() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_PartField As Object
If m_PartField_ID <> "" Then
  Set tmp_PartField = Application.FindRowObject("FIELD", m_PartField_ID)
  If tmp_PartField Is Nothing Then
    m_PartField_ID_BRIEF = ""
  Else
    m_PartField_ID_BRIEF = tmp_PartField.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "FIELD" & m_PartField_ID, tmp_PartField
  Set PartField = tmp_PartField
  Exit Property
End If
  '  set PartField = m_PartField
End Property
' let
'Папка в каталоге

'Папка в каталоге
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set Folder(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Folder", Folder, NewValue
On Error Resume Next
m_Folder_ID = ""
m_Folder_ID = NewValue.id
'  set   m_Folder= newValue
End If
End Property

'Папка в каталоге
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Folder
Public Property Get Folder() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_Folder As Object
If m_Folder_ID <> "" Then
  Set tmp_Folder = Application.FindRowObject("Folder", m_Folder_ID)
  If tmp_Folder Is Nothing Then
    m_Folder_ID_BRIEF = ""
  Else
    m_Folder_ID_BRIEF = tmp_Folder.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "Folder" & m_Folder_ID, tmp_Folder
  Set Folder = tmp_Folder
  Exit Property
End If
  '  set Folder = m_Folder
End Property
' let
'Переменная 1

'Переменная 1
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set ProcessParameter(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ProcessParameter", ProcessParameter, NewValue
On Error Resume Next
m_ProcessParameter_ID = ""
m_ProcessParameter_ID = NewValue.id
'  set   m_ProcessParameter= newValue
End If
End Property

'Переменная 1
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. ProcessParameter
Public Property Get ProcessParameter() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_ProcessParameter As Object
If m_ProcessParameter_ID <> "" Then
  Set tmp_ProcessParameter = Application.FindRowObject("WFDef_param", m_ProcessParameter_ID)
  If tmp_ProcessParameter Is Nothing Then
    m_ProcessParameter_ID_BRIEF = ""
  Else
    m_ProcessParameter_ID_BRIEF = tmp_ProcessParameter.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "WFDef_param" & m_ProcessParameter_ID, tmp_ProcessParameter
  Set ProcessParameter = tmp_ProcessParameter
  Exit Property
End If
  '  set ProcessParameter = m_ProcessParameter
End Property
' let
'Переменная 2

'Переменная 2
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set ProcessParameter2(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ProcessParameter2", ProcessParameter2, NewValue
On Error Resume Next
m_ProcessParameter2_ID = ""
m_ProcessParameter2_ID = NewValue.id
'  set   m_ProcessParameter2= newValue
End If
End Property

'Переменная 2
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. ProcessParameter2
Public Property Get ProcessParameter2() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_ProcessParameter2 As Object
If m_ProcessParameter2_ID <> "" Then
  Set tmp_ProcessParameter2 = Application.FindRowObject("WFDef_param", m_ProcessParameter2_ID)
  If tmp_ProcessParameter2 Is Nothing Then
    m_ProcessParameter2_ID_BRIEF = ""
  Else
    m_ProcessParameter2_ID_BRIEF = tmp_ProcessParameter2.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "WFDef_param" & m_ProcessParameter2_ID, tmp_ProcessParameter2
  Set ProcessParameter2 = tmp_ProcessParameter2
  Exit Property
End If
  '  set ProcessParameter2 = m_ProcessParameter2
End Property
' let
'Значение

'Значение
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let the_Value(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "the_Value", the_Value, NewValue

   m_the_Value = NewValue
End If
End Property

'Значение
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. the_Value
Public Property Get the_Value() As String
 LoadFromDatabase
 AccessTime = Now

   the_Value = m_the_Value
End Property
' let
'Значение2

'Значение2
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Value2(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Value2", Value2, NewValue

   m_Value2 = NewValue
End If
End Property

'Значение2
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. Value2
Public Property Get Value2() As String
 LoadFromDatabase
 AccessTime = Now

   Value2 = m_Value2
End Property
' let
'Директория

'Директория
'Parameters:
'[IN]   newValue , тип параметра: STRING  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Path(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Path", Path, NewValue

   m_Path = NewValue
End If
End Property

'Директория
'Parameters:
' параметров нет
'Returns:
'  значение типа STRING
'See Also:
'Example:
' dim variable as STRING
' variable = me. Path
Public Property Get Path() As String
 LoadFromDatabase
 AccessTime = Now

   Path = m_Path
End Property
' let
'Директория для размещения

'Директория для размещения
'Parameters:
'[IN]   newValue , тип параметра: STRING  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Path2(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Path2", Path2, NewValue

   m_Path2 = NewValue
End If
End Property

'Директория для размещения
'Parameters:
' параметров нет
'Returns:
'  значение типа STRING
'See Also:
'Example:
' dim variable as STRING
' variable = me. Path2
Public Property Get Path2() As String
 LoadFromDatabase
 AccessTime = Now

   Path2 = m_Path2
End Property
' let
'Флаг

'Флаг
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Flag(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Flag", Flag, NewValue

   m_Flag = NewValue
End If
End Property

'Флаг
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. Flag
Public Property Get Flag() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   Flag = m_Flag
End Property
' let
'Флаг 2

'Флаг 2
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Flag2(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Flag2", Flag2, NewValue

   m_Flag2 = NewValue
End If
End Property

'Флаг 2
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. Flag2
Public Property Get Flag2() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   Flag2 = m_Flag2
End Property
' let
'Тип подпроцесса

'Тип подпроцесса
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set SubProcessType(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SubProcessType", SubProcessType, NewValue
On Error Resume Next
m_SubProcessType_ID = ""
m_SubProcessType_ID = NewValue.id
' set   m_SubProcessType= newValue
End If
End Property

'Тип подпроцесса
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. SubProcessType
Public Property Get SubProcessType() As Object
 LoadFromDatabase
 AccessTime = Now
If m_SubProcessType_ID <> "" Then
  Set SubProcessType = Application.Manager.GetInstanceObject(Right(m_SubProcessType_ID, 38))
 Exit Property
End If
  ' set SubProcessType = m_SubProcessType
End Property
' let
'Переменная 3

'Переменная 3
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set ProcessParameter3(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ProcessParameter3", ProcessParameter3, NewValue
On Error Resume Next
m_ProcessParameter3_ID = ""
m_ProcessParameter3_ID = NewValue.id
'  set   m_ProcessParameter3= newValue
End If
End Property

'Переменная 3
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. ProcessParameter3
Public Property Get ProcessParameter3() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_ProcessParameter3 As Object
If m_ProcessParameter3_ID <> "" Then
  Set tmp_ProcessParameter3 = Application.FindRowObject("WFDef_param", m_ProcessParameter3_ID)
  If tmp_ProcessParameter3 Is Nothing Then
    m_ProcessParameter3_ID_BRIEF = ""
  Else
    m_ProcessParameter3_ID_BRIEF = tmp_ProcessParameter3.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "WFDef_param" & m_ProcessParameter3_ID, tmp_ProcessParameter3
  Set ProcessParameter3 = tmp_ProcessParameter3
  Exit Property
End If
  '  set ProcessParameter3 = m_ProcessParameter3
End Property
' let
'Переменная 4

'Переменная 4
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set ProcessParameter4(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ProcessParameter4", ProcessParameter4, NewValue
On Error Resume Next
m_ProcessParameter4_ID = ""
m_ProcessParameter4_ID = NewValue.id
'  set   m_ProcessParameter4= newValue
End If
End Property

'Переменная 4
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. ProcessParameter4
Public Property Get ProcessParameter4() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_ProcessParameter4 As Object
If m_ProcessParameter4_ID <> "" Then
  Set tmp_ProcessParameter4 = Application.FindRowObject("WFDef_param", m_ProcessParameter4_ID)
  If tmp_ProcessParameter4 Is Nothing Then
    m_ProcessParameter4_ID_BRIEF = ""
  Else
    m_ProcessParameter4_ID_BRIEF = tmp_ProcessParameter4.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "WFDef_param" & m_ProcessParameter4_ID, tmp_ProcessParameter4
  Set ProcessParameter4 = tmp_ProcessParameter4
  Exit Property
End If
  '  set ProcessParameter4 = m_ProcessParameter4
End Property
' let
'Состояние 1

'Состояние 1
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set DocState1(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DocState1", DocState1, NewValue
On Error Resume Next
m_DocState1_ID = ""
m_DocState1_ID = NewValue.id
'  set   m_DocState1= newValue
End If
End Property

'Состояние 1
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. DocState1
Public Property Get DocState1() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_DocState1 As Object
If m_DocState1_ID <> "" Then
  Set tmp_DocState1 = Application.FindRowObject("OBJSTATUS", m_DocState1_ID)
  If tmp_DocState1 Is Nothing Then
    m_DocState1_ID_BRIEF = ""
  Else
    m_DocState1_ID_BRIEF = tmp_DocState1.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "OBJSTATUS" & m_DocState1_ID, tmp_DocState1
  Set DocState1 = tmp_DocState1
  Exit Property
End If
  '  set DocState1 = m_DocState1
End Property
' let
'Состояние 2

'Состояние 2
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set DocState2(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DocState2", DocState2, NewValue
On Error Resume Next
m_DocState2_ID = ""
m_DocState2_ID = NewValue.id
'  set   m_DocState2= newValue
End If
End Property

'Состояние 2
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. DocState2
Public Property Get DocState2() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_DocState2 As Object
If m_DocState2_ID <> "" Then
  Set tmp_DocState2 = Application.FindRowObject("OBJSTATUS", m_DocState2_ID)
  If tmp_DocState2 Is Nothing Then
    m_DocState2_ID_BRIEF = ""
  Else
    m_DocState2_ID_BRIEF = tmp_DocState2.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "OBJSTATUS" & m_DocState2_ID, tmp_DocState2
  Set DocState2 = tmp_DocState2
  Exit Property
End If
  '  set DocState2 = m_DocState2
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

 ' Reference to OBJECTTYPE
    If m_ObjectType_ID = "" Then
       Set nvi = nv.Add("ObjectType", "")
    Else
       Set nvi = nv.Add("ObjectType", m_ObjectType_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to WFDef_Doc
    If m_ProcessDocument_ID = "" Then
       Set nvi = nv.Add("ProcessDocument", "")
    Else
       Set nvi = nv.Add("ProcessDocument", m_ProcessDocument_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("SubProcDocument", m_SubProcDocument)
nvi.ValueSize = 255
 ' Reference to PART
    If m_DocumentPart_ID = "" Then
       Set nvi = nv.Add("DocumentPart", "")
    Else
       Set nvi = nv.Add("DocumentPart", m_DocumentPart_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to FIELD
    If m_PartField_ID = "" Then
       Set nvi = nv.Add("PartField", "")
    Else
       Set nvi = nv.Add("PartField", m_PartField_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to Folder
    If m_Folder_ID = "" Then
       Set nvi = nv.Add("Folder", "")
    Else
       Set nvi = nv.Add("Folder", m_Folder_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to WFDef_param
    If m_ProcessParameter_ID = "" Then
       Set nvi = nv.Add("ProcessParameter", "")
    Else
       Set nvi = nv.Add("ProcessParameter", m_ProcessParameter_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to WFDef_param
    If m_ProcessParameter2_ID = "" Then
       Set nvi = nv.Add("ProcessParameter2", "")
    Else
       Set nvi = nv.Add("ProcessParameter2", m_ProcessParameter2_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("the_Value", m_the_Value)
nvi.ValueSize = 255
  Set nvi = nv.Add("Value2", m_Value2)
nvi.ValueSize = 255
  Set nvi = nv.Add("Path", m_Path)
  Set nvi = nv.Add("Path2", m_Path2)
  Set nvi = nv.Add("Flag", m_Flag)
nvi.ValueType = adInteger
  Set nvi = nv.Add("Flag2", m_Flag2)
nvi.ValueType = adInteger
 ' Reference to object
    If m_SubProcessType_ID = "" Then
       Set nvi = nv.Add("SubProcessType", "")
    Else
       Set nvi = nv.Add("SubProcessType", m_SubProcessType_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to WFDef_param
    If m_ProcessParameter3_ID = "" Then
       Set nvi = nv.Add("ProcessParameter3", "")
    Else
       Set nvi = nv.Add("ProcessParameter3", m_ProcessParameter3_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to WFDef_param
    If m_ProcessParameter4_ID = "" Then
       Set nvi = nv.Add("ProcessParameter4", "")
    Else
       Set nvi = nv.Add("ProcessParameter4", m_ProcessParameter4_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to OBJSTATUS
    If m_DocState1_ID = "" Then
       Set nvi = nv.Add("DocState1", "")
    Else
       Set nvi = nv.Add("DocState1", m_DocState1_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to OBJSTATUS
    If m_DocState2_ID = "" Then
       Set nvi = nv.Add("DocState2", "")
    Else
       Set nvi = nv.Add("DocState2", m_DocState2_ID)
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
 m_Brief = m_Brief & the_Value & "; "
 m_Brief = m_Brief & Value2 & "; "
 m_Brief = m_Brief & Path & "; "
 m_Brief = m_Brief & Path2 & "; "
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
    Brief = "! доступ запрещен ! (" & Err.Description & ")"
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

  m_ObjectType_ID = nv.item("ObjectType").Value
  m_ProcessDocument_ID = nv.item("ProcessDocument").Value
m_SubProcDocument = nv.item("SubProcDocument").Value
  m_DocumentPart_ID = nv.item("DocumentPart").Value
  m_PartField_ID = nv.item("PartField").Value
  m_Folder_ID = nv.item("Folder").Value
  m_ProcessParameter_ID = nv.item("ProcessParameter").Value
  m_ProcessParameter2_ID = nv.item("ProcessParameter2").Value
m_the_Value = nv.item("the_Value").Value
m_Value2 = nv.item("Value2").Value
m_Path = nv.item("Path").Value
m_Path2 = nv.item("Path2").Value
m_Flag = nv.item("Flag").Value
m_Flag2 = nv.item("Flag2").Value
  m_SubProcessType_ID = nv.item("SubProcessType").Value
  m_ProcessParameter3_ID = nv.item("ProcessParameter3").Value
  m_ProcessParameter4_ID = nv.item("ProcessParameter4").Value
  m_DocState1_ID = nv.item("DocState1").Value
  m_DocState2_ID = nv.item("DocState2").Value
Else

  m_ObjectType_ID = nv.Fields("ObjectType").Value
  m_ProcessDocument_ID = nv.Fields("ProcessDocument").Value
m_SubProcDocument = nv.Fields("SubProcDocument").Value
  m_DocumentPart_ID = nv.Fields("DocumentPart").Value
  m_PartField_ID = nv.Fields("PartField").Value
  m_Folder_ID = nv.Fields("Folder").Value
  m_ProcessParameter_ID = nv.Fields("ProcessParameter").Value
  m_ProcessParameter2_ID = nv.Fields("ProcessParameter2").Value
m_the_Value = nv.Fields("the_Value").Value
m_Value2 = nv.Fields("Value2").Value
m_Path = nv.Fields("Path").Value
m_Path2 = nv.Fields("Path2").Value
m_Flag = nv.Fields("Flag").Value
m_Flag2 = nv.Fields("Flag2").Value
  m_SubProcessType_ID = nv.Fields("SubProcessType").Value
  m_ProcessParameter3_ID = nv.Fields("ProcessParameter3").Value
  m_ProcessParameter4_ID = nv.Fields("ProcessParameter4").Value
  m_DocState1_ID = nv.Fields("DocState1").Value
  m_DocState2_ID = nv.Fields("DocState2").Value
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
   Dim o As WFFD_ATTR1
   Set o = New WFFD_ATTR1
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
  Err.Raise Err.Number, "WFFD_ATTR1.Save", Err.Description
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
  Err.Raise Err.Number, "WFFD_ATTR1.Delete", Err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("WFFD_ATTR1", id, SecurityStyleID)
Exit Sub
bye:
  Err.Raise Err.Number, "WFFD_ATTR1.Secure", Err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "WFFD_ATTR1", id
Exit Sub
bye:
  Err.Raise Err.Number, "WFFD_ATTR1.Propagate", Err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 m_ObjectType_ID = ""
 Set m_ObjectType = Nothing
 m_ProcessDocument_ID = ""
 Set m_ProcessDocument = Nothing
 m_DocumentPart_ID = ""
 Set m_DocumentPart = Nothing
 m_PartField_ID = ""
 Set m_PartField = Nothing
 m_Folder_ID = ""
 Set m_Folder = Nothing
 m_ProcessParameter_ID = ""
 Set m_ProcessParameter = Nothing
 m_ProcessParameter2_ID = ""
 Set m_ProcessParameter2 = Nothing
 m_SubProcessType_ID = ""
 Set m_SubProcessType = Nothing
 m_ProcessParameter3_ID = ""
 Set m_ProcessParameter3 = Nothing
 m_ProcessParameter4_ID = ""
 Set m_ProcessParameter4 = Nothing
 m_DocState1_ID = ""
 Set m_DocState1 = Nothing
 m_DocState2_ID = ""
 Set m_DocState2 = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "WFFD_ATTR1.CloseClass"
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
  Set ObjectType = Nothing
  m_ObjectType_ID = node.Attributes.getNamedItem("OBJECTTYPE").nodeValue
  m_ObjectType_ID_BRIEF = node.Attributes.getNamedItem("OBJECTTYPE_BRIEF").nodeValue
  Set ProcessDocument = Nothing
  m_ProcessDocument_ID = node.Attributes.getNamedItem("PROCESSDOCUMENT").nodeValue
  m_ProcessDocument_ID_BRIEF = node.Attributes.getNamedItem("PROCESSDOCUMENT_BRIEF").nodeValue
  SubProcDocument = Replace(node.Attributes.getNamedItem("SUBPROCDOCUMENT").nodeValue, vbLf, vbCrLf)
  Set DocumentPart = Nothing
  m_DocumentPart_ID = node.Attributes.getNamedItem("DOCUMENTPART").nodeValue
  m_DocumentPart_ID_BRIEF = node.Attributes.getNamedItem("DOCUMENTPART_BRIEF").nodeValue
  Set PartField = Nothing
  m_PartField_ID = node.Attributes.getNamedItem("PARTFIELD").nodeValue
  m_PartField_ID_BRIEF = node.Attributes.getNamedItem("PARTFIELD_BRIEF").nodeValue
  Set Folder = Nothing
  m_Folder_ID = node.Attributes.getNamedItem("FOLDER").nodeValue
  m_Folder_ID_BRIEF = node.Attributes.getNamedItem("FOLDER_BRIEF").nodeValue
  Set ProcessParameter = Nothing
  m_ProcessParameter_ID = node.Attributes.getNamedItem("PROCESSPARAMETER").nodeValue
  m_ProcessParameter_ID_BRIEF = node.Attributes.getNamedItem("PROCESSPARAMETER_BRIEF").nodeValue
  Set ProcessParameter2 = Nothing
  m_ProcessParameter2_ID = node.Attributes.getNamedItem("PROCESSPARAMETER2").nodeValue
  m_ProcessParameter2_ID_BRIEF = node.Attributes.getNamedItem("PROCESSPARAMETER2_BRIEF").nodeValue
  the_Value = Replace(node.Attributes.getNamedItem("THE_VALUE").nodeValue, vbLf, vbCrLf)
  Value2 = Replace(node.Attributes.getNamedItem("VALUE2").nodeValue, vbLf, vbCrLf)
  Path = Replace(node.Attributes.getNamedItem("PATH").nodeValue, vbLf, vbCrLf)
  Path2 = Replace(node.Attributes.getNamedItem("PATH2").nodeValue, vbLf, vbCrLf)
  Flag = node.Attributes.getNamedItem("FLAG").nodeValue
  Flag2 = node.Attributes.getNamedItem("FLAG2").nodeValue
  Set SubProcessType = Nothing
  m_SubProcessType_ID = node.Attributes.getNamedItem("SUBPROCESSTYPE").nodeValue
  m_SubProcessType_ID_BRIEF = node.Attributes.getNamedItem("SUBPROCESSTYPE_BRIEF").nodeValue
  Set ProcessParameter3 = Nothing
  m_ProcessParameter3_ID = node.Attributes.getNamedItem("PROCESSPARAMETER3").nodeValue
  m_ProcessParameter3_ID_BRIEF = node.Attributes.getNamedItem("PROCESSPARAMETER3_BRIEF").nodeValue
  Set ProcessParameter4 = Nothing
  m_ProcessParameter4_ID = node.Attributes.getNamedItem("PROCESSPARAMETER4").nodeValue
  m_ProcessParameter4_ID_BRIEF = node.Attributes.getNamedItem("PROCESSPARAMETER4_BRIEF").nodeValue
  Set DocState1 = Nothing
  m_DocState1_ID = node.Attributes.getNamedItem("DOCSTATE1").nodeValue
  m_DocState1_ID_BRIEF = node.Attributes.getNamedItem("DOCSTATE1_BRIEF").nodeValue
  Set DocState2 = Nothing
  m_DocState2_ID = node.Attributes.getNamedItem("DOCSTATE2").nodeValue
  m_DocState2_ID_BRIEF = node.Attributes.getNamedItem("DOCSTATE2_BRIEF").nodeValue
  On Error GoTo bye
  'if m_ChangeTime >= m_RetriveTime then m_Changed = true
  m_Changed = True
  m_RowRetrived = True
  m_Brief = ""
  On Error Resume Next
  Exit Sub
bye:
  DebugOutput Err.Description
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
  node.setAttribute "OBJECTTYPE", m_ObjectType_ID
  If Not (ObjectType Is Nothing) Then
    node.setAttribute "OBJECTTYPE_BRIEF", ObjectType.Brief
  Else
    node.setAttribute "OBJECTTYPE_BRIEF", m_ObjectType_ID_BRIEF
  End If
  node.setAttribute "PROCESSDOCUMENT", m_ProcessDocument_ID
  If Not (ProcessDocument Is Nothing) Then
    node.setAttribute "PROCESSDOCUMENT_BRIEF", ProcessDocument.Brief
  Else
    node.setAttribute "PROCESSDOCUMENT_BRIEF", m_ProcessDocument_ID_BRIEF
  End If
  node.setAttribute "SUBPROCDOCUMENT", SubProcDocument
  node.setAttribute "DOCUMENTPART", m_DocumentPart_ID
  If Not (DocumentPart Is Nothing) Then
    node.setAttribute "DOCUMENTPART_BRIEF", DocumentPart.Brief
  Else
    node.setAttribute "DOCUMENTPART_BRIEF", m_DocumentPart_ID_BRIEF
  End If
  node.setAttribute "PARTFIELD", m_PartField_ID
  If Not (PartField Is Nothing) Then
    node.setAttribute "PARTFIELD_BRIEF", PartField.Brief
  Else
    node.setAttribute "PARTFIELD_BRIEF", m_PartField_ID_BRIEF
  End If
  node.setAttribute "FOLDER", m_Folder_ID
  If Not (Folder Is Nothing) Then
    node.setAttribute "FOLDER_BRIEF", Folder.Brief
  Else
    node.setAttribute "FOLDER_BRIEF", m_Folder_ID_BRIEF
  End If
  node.setAttribute "PROCESSPARAMETER", m_ProcessParameter_ID
  If Not (ProcessParameter Is Nothing) Then
    node.setAttribute "PROCESSPARAMETER_BRIEF", ProcessParameter.Brief
  Else
    node.setAttribute "PROCESSPARAMETER_BRIEF", m_ProcessParameter_ID_BRIEF
  End If
  node.setAttribute "PROCESSPARAMETER2", m_ProcessParameter2_ID
  If Not (ProcessParameter2 Is Nothing) Then
    node.setAttribute "PROCESSPARAMETER2_BRIEF", ProcessParameter2.Brief
  Else
    node.setAttribute "PROCESSPARAMETER2_BRIEF", m_ProcessParameter2_ID_BRIEF
  End If
  node.setAttribute "THE_VALUE", the_Value
  node.setAttribute "VALUE2", Value2
  node.setAttribute "PATH", Path
  node.setAttribute "PATH2", Path2
  node.setAttribute "FLAG", Flag
  node.setAttribute "FLAG2", Flag2
  node.setAttribute "SUBPROCESSTYPE", m_SubProcessType_ID
  If Not (SubProcessType Is Nothing) Then
    node.setAttribute "SUBPROCESSTYPE_BRIEF", SubProcessType.Brief
  Else
    node.setAttribute "SUBPROCESSTYPE_BRIEF", m_SubProcessType_ID_BRIEF
  End If
  node.setAttribute "PROCESSPARAMETER3", m_ProcessParameter3_ID
  If Not (ProcessParameter3 Is Nothing) Then
    node.setAttribute "PROCESSPARAMETER3_BRIEF", ProcessParameter3.Brief
  Else
    node.setAttribute "PROCESSPARAMETER3_BRIEF", m_ProcessParameter3_ID_BRIEF
  End If
  node.setAttribute "PROCESSPARAMETER4", m_ProcessParameter4_ID
  If Not (ProcessParameter4 Is Nothing) Then
    node.setAttribute "PROCESSPARAMETER4_BRIEF", ProcessParameter4.Brief
  Else
    node.setAttribute "PROCESSPARAMETER4_BRIEF", m_ProcessParameter4_ID_BRIEF
  End If
  node.setAttribute "DOCSTATE1", m_DocState1_ID
  If Not (DocState1 Is Nothing) Then
    node.setAttribute "DOCSTATE1_BRIEF", DocState1.Brief
  Else
    node.setAttribute "DOCSTATE1_BRIEF", m_DocState1_ID_BRIEF
  End If
  node.setAttribute "DOCSTATE2", m_DocState2_ID
  If Not (DocState2 Is Nothing) Then
    node.setAttribute "DOCSTATE2_BRIEF", DocState2.Brief
  Else
    node.setAttribute "DOCSTATE2_BRIEF", m_DocState2_ID_BRIEF
  End If
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
m_IsLocked = Application.MTZSession.IsLocked("WFFD_ATTR1", id)
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
OK = Application.MTZSession.LockResource("WFFD_ATTR1", id, Permanent)
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
Application.MTZSession.UnLockResource "WFFD_ATTR1", id
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
CanLock = Application.MTZSession.CanLock("WFFD_ATTR1", id)
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



