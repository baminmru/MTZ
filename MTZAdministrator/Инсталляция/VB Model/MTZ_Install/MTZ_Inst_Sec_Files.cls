VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "MTZ_Inst_Sec_Files"
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
Private m_TheSource As String
Private m_IsCOM As enumYesNo
Private m_HaveToRun As enumYesNo
Private m_CommanLineParams As String
Private m_SysstemObject As Object
Dim m_SysstemObject_ID As String
Dim m_SysstemObject_ID_BRIEF As String
Private m_TheApplication As Object
Dim m_TheApplication_ID As String
Dim m_TheApplication_ID_BRIEF As String
Private m_SubDir As String
Private m_IsShortcut As enumYesNo
Private m_ShortcutName As String
Private m_ShortCutInfo As String
Private m_DefaultInterface As String
Private m_HaveToRunDeinst As enumYesNo
Private m_DeinstallComandParam As String
Private m_IsCustomScript As enumYesNo
Private m_CustomScriptInstall As Object
Dim m_CustomScriptInstall_ID As String
Dim m_CustomScriptInstall_ID_BRIEF As String
Private m_CustomScriptUnInstall As Object
Dim m_CustomScriptUnInstall_ID As String
Dim m_CustomScriptUnInstall_ID_BRIEF As String
Private m_SEQ As Long
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
  PartName = "MTZ_Inst_Sec_Files"
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
  m_Application.Logger.Message "MTZ_Inst_Sec_Files.Init"
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
'Файл или каталог

'Файл или каталог
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TheSource(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheSource", TheSource, NewValue

   m_TheSource = NewValue
End If
End Property

'Файл или каталог
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. TheSource
Public Property Get TheSource() As String
 LoadFromDatabase
 AccessTime = Now

   TheSource = m_TheSource
End Property
' let
'Является COM объектом

'Является COM объектом
'Parameters:
'[IN]   newValue , тип параметра: enumYesNo  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IsCOM(ByVal NewValue As enumYesNo)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IsCOM", IsCOM, NewValue

   m_IsCOM = NewValue
End If
End Property

'Является COM объектом
'Parameters:
' параметров нет
'Returns:
'  объект класса enumYesNo
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumYesNo
' Set variable = me. IsCOM
Public Property Get IsCOM() As enumYesNo
 LoadFromDatabase
 AccessTime = Now

   IsCOM = m_IsCOM
End Property
' let
'Обязательно запустить

'Обязательно запустить
'Parameters:
'[IN]   newValue , тип параметра: enumYesNo  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let HaveToRun(ByVal NewValue As enumYesNo)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "HaveToRun", HaveToRun, NewValue

   m_HaveToRun = NewValue
End If
End Property

'Обязательно запустить
'Parameters:
' параметров нет
'Returns:
'  объект класса enumYesNo
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumYesNo
' Set variable = me. HaveToRun
Public Property Get HaveToRun() As enumYesNo
 LoadFromDatabase
 AccessTime = Now

   HaveToRun = m_HaveToRun
End Property
' let
'Ключи запуска

'Ключи запуска
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let CommanLineParams(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CommanLineParams", CommanLineParams, NewValue

   m_CommanLineParams = NewValue
End If
End Property

'Ключи запуска
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. CommanLineParams
Public Property Get CommanLineParams() As String
 LoadFromDatabase
 AccessTime = Now

   CommanLineParams = m_CommanLineParams
End Property
' let
'Объект системы

'Объект системы
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set SysstemObject(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SysstemObject", SysstemObject, NewValue
On Error Resume Next
m_SysstemObject_ID = ""
m_SysstemObject_ID = NewValue.id
'  set   m_SysstemObject= newValue
End If
End Property

'Объект системы
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. SysstemObject
Public Property Get SysstemObject() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_SysstemObject As Object
If m_SysstemObject_ID <> "" Then
  Set tmp_SysstemObject = Application.FindRowObject("OBJECTTYPE", m_SysstemObject_ID)
  If tmp_SysstemObject Is Nothing Then
    m_SysstemObject_ID_BRIEF = ""
  Else
    m_SysstemObject_ID_BRIEF = tmp_SysstemObject.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "OBJECTTYPE" & m_SysstemObject_ID, tmp_SysstemObject
  Set SysstemObject = tmp_SysstemObject
  Exit Property
End If
  '  set SysstemObject = m_SysstemObject
End Property
' let
'Приложение системы

'Приложение системы
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TheApplication(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheApplication", TheApplication, NewValue
On Error Resume Next
m_TheApplication_ID = ""
m_TheApplication_ID = NewValue.id
'  set   m_TheApplication= newValue
End If
End Property

'Приложение системы
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TheApplication
Public Property Get TheApplication() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TheApplication As Object
If m_TheApplication_ID <> "" Then
  Set tmp_TheApplication = Application.FindRowObject("MTZAPP", m_TheApplication_ID)
  If tmp_TheApplication Is Nothing Then
    m_TheApplication_ID_BRIEF = ""
  Else
    m_TheApplication_ID_BRIEF = tmp_TheApplication.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "MTZAPP" & m_TheApplication_ID, tmp_TheApplication
  Set TheApplication = tmp_TheApplication
  Exit Property
End If
  '  set TheApplication = m_TheApplication
End Property
' let
'Подкаталог

'Подкаталог
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let SubDir(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SubDir", SubDir, NewValue

   m_SubDir = NewValue
End If
End Property

'Подкаталог
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. SubDir
Public Property Get SubDir() As String
 LoadFromDatabase
 AccessTime = Now

   SubDir = m_SubDir
End Property
' let
'Ярлык в меню

'Ярлык в меню
'Parameters:
'[IN]   newValue , тип параметра: enumYesNo  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IsShortcut(ByVal NewValue As enumYesNo)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IsShortcut", IsShortcut, NewValue

   m_IsShortcut = NewValue
End If
End Property

'Ярлык в меню
'Parameters:
' параметров нет
'Returns:
'  объект класса enumYesNo
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumYesNo
' Set variable = me. IsShortcut
Public Property Get IsShortcut() As enumYesNo
 LoadFromDatabase
 AccessTime = Now

   IsShortcut = m_IsShortcut
End Property
' let
'Имя ярлыка

'Имя ярлыка
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ShortcutName(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ShortcutName", ShortcutName, NewValue

   m_ShortcutName = NewValue
End If
End Property

'Имя ярлыка
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. ShortcutName
Public Property Get ShortcutName() As String
 LoadFromDatabase
 AccessTime = Now

   ShortcutName = m_ShortcutName
End Property
' let
'Комментярий ярлыка

'Комментярий ярлыка
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ShortCutInfo(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ShortCutInfo", ShortCutInfo, NewValue

   m_ShortCutInfo = NewValue
End If
End Property

'Комментярий ярлыка
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. ShortCutInfo
Public Property Get ShortCutInfo() As String
 LoadFromDatabase
 AccessTime = Now

   ShortCutInfo = m_ShortCutInfo
End Property
' let
'Интерфейс по умолчанию

'Интерфейс по умолчанию
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DefaultInterface(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DefaultInterface", DefaultInterface, NewValue

   m_DefaultInterface = NewValue
End If
End Property

'Интерфейс по умолчанию
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. DefaultInterface
Public Property Get DefaultInterface() As String
 LoadFromDatabase
 AccessTime = Now

   DefaultInterface = m_DefaultInterface
End Property
' let
'Запустить при деинсталляции

'Запустить при деинсталляции
'Parameters:
'[IN]   newValue , тип параметра: enumYesNo  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let HaveToRunDeinst(ByVal NewValue As enumYesNo)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "HaveToRunDeinst", HaveToRunDeinst, NewValue

   m_HaveToRunDeinst = NewValue
End If
End Property

'Запустить при деинсталляции
'Parameters:
' параметров нет
'Returns:
'  объект класса enumYesNo
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumYesNo
' Set variable = me. HaveToRunDeinst
Public Property Get HaveToRunDeinst() As enumYesNo
 LoadFromDatabase
 AccessTime = Now

   HaveToRunDeinst = m_HaveToRunDeinst
End Property
' let
'Ключи деинсталляции

'Ключи деинсталляции
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DeinstallComandParam(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DeinstallComandParam", DeinstallComandParam, NewValue

   m_DeinstallComandParam = NewValue
End If
End Property

'Ключи деинсталляции
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. DeinstallComandParam
Public Property Get DeinstallComandParam() As String
 LoadFromDatabase
 AccessTime = Now

   DeinstallComandParam = m_DeinstallComandParam
End Property
' let
'Пользовательский скрипт (см. поле Файл или каталог)

'Пользовательский скрипт (см. поле Файл или каталог)
'Parameters:
'[IN]   newValue , тип параметра: enumYesNo  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IsCustomScript(ByVal NewValue As enumYesNo)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IsCustomScript", IsCustomScript, NewValue

   m_IsCustomScript = NewValue
End If
End Property

'Пользовательский скрипт (см. поле Файл или каталог)
'Parameters:
' параметров нет
'Returns:
'  объект класса enumYesNo
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumYesNo
' Set variable = me. IsCustomScript
Public Property Get IsCustomScript() As enumYesNo
 LoadFromDatabase
 AccessTime = Now

   IsCustomScript = m_IsCustomScript
End Property
' let
'Custom Script Install

'Custom Script Install
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set CustomScriptInstall(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CustomScriptInstall", CustomScriptInstall, NewValue
On Error Resume Next
m_CustomScriptInstall_ID = ""
m_CustomScriptInstall_ID = NewValue.id
'  set   m_CustomScriptInstall= newValue
End If
End Property

'Custom Script Install
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. CustomScriptInstall
Public Property Get CustomScriptInstall() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_CustomScriptInstall As Object
If m_CustomScriptInstall_ID <> "" Then
  Set tmp_CustomScriptInstall = Application.FindRowObject("MTZ_Inst_Common", m_CustomScriptInstall_ID)
  If tmp_CustomScriptInstall Is Nothing Then
    m_CustomScriptInstall_ID_BRIEF = ""
  Else
    m_CustomScriptInstall_ID_BRIEF = tmp_CustomScriptInstall.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "MTZ_Inst_Common" & m_CustomScriptInstall_ID, tmp_CustomScriptInstall
  Set CustomScriptInstall = tmp_CustomScriptInstall
  Exit Property
End If
  '  set CustomScriptInstall = m_CustomScriptInstall
End Property
' let
'Custom Script UnInstall

'Custom Script UnInstall
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set CustomScriptUnInstall(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CustomScriptUnInstall", CustomScriptUnInstall, NewValue
On Error Resume Next
m_CustomScriptUnInstall_ID = ""
m_CustomScriptUnInstall_ID = NewValue.id
'  set   m_CustomScriptUnInstall= newValue
End If
End Property

'Custom Script UnInstall
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. CustomScriptUnInstall
Public Property Get CustomScriptUnInstall() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_CustomScriptUnInstall As Object
If m_CustomScriptUnInstall_ID <> "" Then
  Set tmp_CustomScriptUnInstall = Application.FindRowObject("MTZ_Inst_Common", m_CustomScriptUnInstall_ID)
  If tmp_CustomScriptUnInstall Is Nothing Then
    m_CustomScriptUnInstall_ID_BRIEF = ""
  Else
    m_CustomScriptUnInstall_ID_BRIEF = tmp_CustomScriptUnInstall.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "MTZ_Inst_Common" & m_CustomScriptUnInstall_ID, tmp_CustomScriptUnInstall
  Set CustomScriptUnInstall = tmp_CustomScriptUnInstall
  Exit Property
End If
  '  set CustomScriptUnInstall = m_CustomScriptUnInstall
End Property
' let
'Порядок

'Порядок
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let SEQ(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SEQ", SEQ, NewValue

   m_SEQ = NewValue
End If
End Property

'Порядок
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. SEQ
Public Property Get SEQ() As Long
 LoadFromDatabase
 AccessTime = Now

   SEQ = m_SEQ
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

  Set nvi = nv.Add("TheSource", m_TheSource)
nvi.ValueSize = 1024
  Set nvi = nv.Add("IsCOM", m_IsCOM)
nvi.ValueType = adInteger
  Set nvi = nv.Add("HaveToRun", m_HaveToRun)
nvi.ValueType = adInteger
  Set nvi = nv.Add("CommanLineParams", m_CommanLineParams)
nvi.ValueSize = 255
 ' Reference to OBJECTTYPE
    If m_SysstemObject_ID = "" Then
       Set nvi = nv.Add("SysstemObject", "")
    Else
       Set nvi = nv.Add("SysstemObject", m_SysstemObject_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to MTZAPP
    If m_TheApplication_ID = "" Then
       Set nvi = nv.Add("TheApplication", "")
    Else
       Set nvi = nv.Add("TheApplication", m_TheApplication_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("SubDir", m_SubDir)
nvi.ValueSize = 255
  Set nvi = nv.Add("IsShortcut", m_IsShortcut)
nvi.ValueType = adInteger
  Set nvi = nv.Add("ShortcutName", m_ShortcutName)
nvi.ValueSize = 255
  Set nvi = nv.Add("ShortCutInfo", m_ShortCutInfo)
nvi.ValueSize = 255
  Set nvi = nv.Add("DefaultInterface", m_DefaultInterface)
nvi.ValueSize = 255
  Set nvi = nv.Add("HaveToRunDeinst", m_HaveToRunDeinst)
nvi.ValueType = adInteger
  Set nvi = nv.Add("DeinstallComandParam", m_DeinstallComandParam)
nvi.ValueSize = 255
  Set nvi = nv.Add("IsCustomScript", m_IsCustomScript)
nvi.ValueType = adInteger
 ' Reference to MTZ_Inst_Common
    If m_CustomScriptInstall_ID = "" Then
       Set nvi = nv.Add("CustomScriptInstall", "")
    Else
       Set nvi = nv.Add("CustomScriptInstall", m_CustomScriptInstall_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to MTZ_Inst_Common
    If m_CustomScriptUnInstall_ID = "" Then
       Set nvi = nv.Add("CustomScriptUnInstall", "")
    Else
       Set nvi = nv.Add("CustomScriptUnInstall", m_CustomScriptUnInstall_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("SEQ", m_SEQ)
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
 m_Brief = m_Brief & TheSource & "; "
   If SysstemObject Is Nothing Then
     m_Brief = m_Brief & "{" & m_SysstemObject_ID_BRIEF & "}; "
   Else
     m_Brief = m_Brief & "{" & SysstemObject.Brief & "}; "
   End If
   If TheApplication Is Nothing Then
     m_Brief = m_Brief & "{" & m_TheApplication_ID_BRIEF & "}; "
   Else
     m_Brief = m_Brief & "{" & TheApplication.Brief & "}; "
   End If
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

m_TheSource = nv.item("TheSource").Value
m_IsCOM = nv.item("IsCOM").Value
m_HaveToRun = nv.item("HaveToRun").Value
m_CommanLineParams = nv.item("CommanLineParams").Value
  m_SysstemObject_ID = nv.item("SysstemObject").Value
  m_TheApplication_ID = nv.item("TheApplication").Value
m_SubDir = nv.item("SubDir").Value
m_IsShortcut = nv.item("IsShortcut").Value
m_ShortcutName = nv.item("ShortcutName").Value
m_ShortCutInfo = nv.item("ShortCutInfo").Value
m_DefaultInterface = nv.item("DefaultInterface").Value
m_HaveToRunDeinst = nv.item("HaveToRunDeinst").Value
m_DeinstallComandParam = nv.item("DeinstallComandParam").Value
m_IsCustomScript = nv.item("IsCustomScript").Value
  m_CustomScriptInstall_ID = nv.item("CustomScriptInstall").Value
  m_CustomScriptUnInstall_ID = nv.item("CustomScriptUnInstall").Value
m_SEQ = nv.item("SEQ").Value
Else

m_TheSource = nv.Fields("TheSource").Value
m_IsCOM = nv.Fields("IsCOM").Value
m_HaveToRun = nv.Fields("HaveToRun").Value
m_CommanLineParams = nv.Fields("CommanLineParams").Value
  m_SysstemObject_ID = nv.Fields("SysstemObject").Value
  m_TheApplication_ID = nv.Fields("TheApplication").Value
m_SubDir = nv.Fields("SubDir").Value
m_IsShortcut = nv.Fields("IsShortcut").Value
m_ShortcutName = nv.Fields("ShortcutName").Value
m_ShortCutInfo = nv.Fields("ShortCutInfo").Value
m_DefaultInterface = nv.Fields("DefaultInterface").Value
m_HaveToRunDeinst = nv.Fields("HaveToRunDeinst").Value
m_DeinstallComandParam = nv.Fields("DeinstallComandParam").Value
m_IsCustomScript = nv.Fields("IsCustomScript").Value
  m_CustomScriptInstall_ID = nv.Fields("CustomScriptInstall").Value
  m_CustomScriptUnInstall_ID = nv.Fields("CustomScriptUnInstall").Value
m_SEQ = nv.Fields("SEQ").Value
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
   Dim o As MTZ_Inst_Sec_Files
   Set o = New MTZ_Inst_Sec_Files
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
  err.Raise err.Number, "MTZ_Inst_Sec_Files.Save", err.Description
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
  err.Raise err.Number, "MTZ_Inst_Sec_Files.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("MTZ_Inst_Sec_Files", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "MTZ_Inst_Sec_Files.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "MTZ_Inst_Sec_Files", id
Exit Sub
bye:
  err.Raise err.Number, "MTZ_Inst_Sec_Files.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 m_SysstemObject_ID = ""
 Set m_SysstemObject = Nothing
 m_TheApplication_ID = ""
 Set m_TheApplication = Nothing
 m_CustomScriptInstall_ID = ""
 Set m_CustomScriptInstall = Nothing
 m_CustomScriptUnInstall_ID = ""
 Set m_CustomScriptUnInstall = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "MTZ_Inst_Sec_Files.CloseClass"
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
  TheSource = Replace(node.Attributes.getNamedItem("THESOURCE").nodeValue, vbLf, vbCrLf)
  IsCOM = node.Attributes.getNamedItem("ISCOM").nodeValue
  HaveToRun = node.Attributes.getNamedItem("HAVETORUN").nodeValue
  CommanLineParams = Replace(node.Attributes.getNamedItem("COMMANLINEPARAMS").nodeValue, vbLf, vbCrLf)
  Set SysstemObject = Nothing
  m_SysstemObject_ID = node.Attributes.getNamedItem("SYSSTEMOBJECT").nodeValue
  m_SysstemObject_ID_BRIEF = node.Attributes.getNamedItem("SYSSTEMOBJECT_BRIEF").nodeValue
  Set TheApplication = Nothing
  m_TheApplication_ID = node.Attributes.getNamedItem("THEAPPLICATION").nodeValue
  m_TheApplication_ID_BRIEF = node.Attributes.getNamedItem("THEAPPLICATION_BRIEF").nodeValue
  SubDir = Replace(node.Attributes.getNamedItem("SUBDIR").nodeValue, vbLf, vbCrLf)
  IsShortcut = node.Attributes.getNamedItem("ISSHORTCUT").nodeValue
  ShortcutName = Replace(node.Attributes.getNamedItem("SHORTCUTNAME").nodeValue, vbLf, vbCrLf)
  ShortCutInfo = Replace(node.Attributes.getNamedItem("SHORTCUTINFO").nodeValue, vbLf, vbCrLf)
  DefaultInterface = Replace(node.Attributes.getNamedItem("DEFAULTINTERFACE").nodeValue, vbLf, vbCrLf)
  HaveToRunDeinst = node.Attributes.getNamedItem("HAVETORUNDEINST").nodeValue
  DeinstallComandParam = Replace(node.Attributes.getNamedItem("DEINSTALLCOMANDPARAM").nodeValue, vbLf, vbCrLf)
  IsCustomScript = node.Attributes.getNamedItem("ISCUSTOMSCRIPT").nodeValue
  Set CustomScriptInstall = Nothing
  m_CustomScriptInstall_ID = node.Attributes.getNamedItem("CUSTOMSCRIPTINSTALL").nodeValue
  m_CustomScriptInstall_ID_BRIEF = node.Attributes.getNamedItem("CUSTOMSCRIPTINSTALL_BRIEF").nodeValue
  Set CustomScriptUnInstall = Nothing
  m_CustomScriptUnInstall_ID = node.Attributes.getNamedItem("CUSTOMSCRIPTUNINSTALL").nodeValue
  m_CustomScriptUnInstall_ID_BRIEF = node.Attributes.getNamedItem("CUSTOMSCRIPTUNINSTALL_BRIEF").nodeValue
  SEQ = node.Attributes.getNamedItem("SEQ").nodeValue
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
  node.setAttribute "THESOURCE", TheSource
  node.setAttribute "ISCOM", IsCOM
  node.setAttribute "HAVETORUN", HaveToRun
  node.setAttribute "COMMANLINEPARAMS", CommanLineParams
  node.setAttribute "SYSSTEMOBJECT", m_SysstemObject_ID
  If Not (SysstemObject Is Nothing) Then
    node.setAttribute "SYSSTEMOBJECT_BRIEF", SysstemObject.Brief
  Else
    node.setAttribute "SYSSTEMOBJECT_BRIEF", m_SysstemObject_ID_BRIEF
  End If
  node.setAttribute "THEAPPLICATION", m_TheApplication_ID
  If Not (TheApplication Is Nothing) Then
    node.setAttribute "THEAPPLICATION_BRIEF", TheApplication.Brief
  Else
    node.setAttribute "THEAPPLICATION_BRIEF", m_TheApplication_ID_BRIEF
  End If
  node.setAttribute "SUBDIR", SubDir
  node.setAttribute "ISSHORTCUT", IsShortcut
  node.setAttribute "SHORTCUTNAME", ShortcutName
  node.setAttribute "SHORTCUTINFO", ShortCutInfo
  node.setAttribute "DEFAULTINTERFACE", DefaultInterface
  node.setAttribute "HAVETORUNDEINST", HaveToRunDeinst
  node.setAttribute "DEINSTALLCOMANDPARAM", DeinstallComandParam
  node.setAttribute "ISCUSTOMSCRIPT", IsCustomScript
  node.setAttribute "CUSTOMSCRIPTINSTALL", m_CustomScriptInstall_ID
  If Not (CustomScriptInstall Is Nothing) Then
    node.setAttribute "CUSTOMSCRIPTINSTALL_BRIEF", CustomScriptInstall.Brief
  Else
    node.setAttribute "CUSTOMSCRIPTINSTALL_BRIEF", m_CustomScriptInstall_ID_BRIEF
  End If
  node.setAttribute "CUSTOMSCRIPTUNINSTALL", m_CustomScriptUnInstall_ID
  If Not (CustomScriptUnInstall Is Nothing) Then
    node.setAttribute "CUSTOMSCRIPTUNINSTALL_BRIEF", CustomScriptUnInstall.Brief
  Else
    node.setAttribute "CUSTOMSCRIPTUNINSTALL_BRIEF", m_CustomScriptUnInstall_ID_BRIEF
  End If
  node.setAttribute "SEQ", SEQ
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
m_IsLocked = Application.MTZSession.IsLocked("MTZ_Inst_Sec_Files", id)
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
OK = Application.MTZSession.LockResource("MTZ_Inst_Sec_Files", id, Permanent)
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
Application.MTZSession.UnLockResource "MTZ_Inst_Sec_Files", id
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
CanLock = Application.MTZSession.CanLock("MTZ_Inst_Sec_Files", id)
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



