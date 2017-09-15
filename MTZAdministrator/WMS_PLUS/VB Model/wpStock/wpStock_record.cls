VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "wpStock_record"
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
Private m_InDocLine As Object
Dim m_InDocLine_ID As String
Dim m_InDocLine_ID_BRIEF As String
Private m_pallet As Object
Dim m_pallet_ID As String
Dim m_pallet_ID_BRIEF As String
Private m_theGood As Object
Dim m_theGood_ID As String
Dim m_theGood_ID_BRIEF As String
Private m_TheCell As Object
Dim m_TheCell_ID As String
Dim m_TheCell_ID_BRIEF As String
Private m_edizm As Object
Dim m_edizm_ID As String
Dim m_edizm_ID_BRIEF As String
Private m_Q_Weight As Double
Private m_Q_Quantity As Double
Private m_TheCountry As Object
Dim m_TheCountry_ID As String
Dim m_TheCountry_ID_BRIEF As String
Private m_TheDeveloper As Object
Dim m_TheDeveloper_ID As String
Dim m_TheDeveloper_ID_BRIEF As String
Private m_TheFactory As Object
Dim m_TheFactory_ID As String
Dim m_TheFactory_ID_BRIEF As String
Private m_SertNum As String
Private m_madeDate_from As Date
Private m_madedate_to As Date
Private m_expdate As Date
Private m_stopdate As Date
Private m_S1 As Object
Dim m_S1_ID As String
Dim m_S1_ID_BRIEF As String
Private m_S2 As Object
Dim m_S2_ID As String
Dim m_S2_ID_BRIEF As String
Private m_S3 As Object
Dim m_S3_ID As String
Dim m_S3_ID_BRIEF As String
Private m_S4 As Object
Dim m_S4_ID As String
Dim m_S4_ID_BRIEF As String
Private m_S5 As Object
Dim m_S5_ID As String
Dim m_S5_ID_BRIEF As String
Private m_D1 As Object
Dim m_D1_ID As String
Dim m_D1_ID_BRIEF As String
Private m_D2 As Object
Dim m_D2_ID As String
Dim m_D2_ID_BRIEF As String
Private m_D3 As Object
Dim m_D3_ID As String
Dim m_D3_ID_BRIEF As String
Private m_D4 As Object
Dim m_D4_ID As String
Dim m_D4_ID_BRIEF As String
Private m_D5 As Object
Dim m_D5_ID As String
Dim m_D5_ID_BRIEF As String
Private m_IsBrak As enumBoolean
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
  PartName = "wpStock_record"
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
  m_Application.Logger.Message "wpStock_record.Init"
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
'Принят по строке

'Принят по строке
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set InDocLine(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "InDocLine", InDocLine, NewValue
On Error Resume Next
m_InDocLine_ID = ""
m_InDocLine_ID = NewValue.id
'  set   m_InDocLine= newValue
End If
End Property

'Принят по строке
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. InDocLine
Public Property Get InDocLine() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_InDocLine As Object
If m_InDocLine_ID <> "" Then
  Set tmp_InDocLine = Application.FindRowObject("wpin_line", m_InDocLine_ID)
  If tmp_InDocLine Is Nothing Then
    m_InDocLine_ID_BRIEF = ""
  Else
    m_InDocLine_ID_BRIEF = tmp_InDocLine.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "wpin_line" & m_InDocLine_ID, tmp_InDocLine
  Set InDocLine = tmp_InDocLine
  Exit Property
End If
  '  set InDocLine = m_InDocLine
End Property
' let
'Паллета

'Паллета
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set pallet(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "pallet", pallet, NewValue
On Error Resume Next
m_pallet_ID = ""
m_pallet_ID = NewValue.id
'  set   m_pallet= newValue
End If
End Property

'Паллета
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. pallet
Public Property Get pallet() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_pallet As Object
If m_pallet_ID <> "" Then
  Set tmp_pallet = Application.FindRowObject("wpPal_def", m_pallet_ID)
  If tmp_pallet Is Nothing Then
    m_pallet_ID_BRIEF = ""
  Else
    m_pallet_ID_BRIEF = tmp_pallet.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "wpPal_def" & m_pallet_ID, tmp_pallet
  Set pallet = tmp_pallet
  Exit Property
End If
  '  set pallet = m_pallet
End Property
' let
'Товар

'Товар
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set theGood(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "theGood", theGood, NewValue
On Error Resume Next
m_theGood_ID = ""
m_theGood_ID = NewValue.id
'  set   m_theGood= newValue
End If
End Property

'Товар
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. theGood
Public Property Get theGood() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_theGood As Object
If m_theGood_ID <> "" Then
  Set tmp_theGood = Application.FindRowObject("wpg_def", m_theGood_ID)
  If tmp_theGood Is Nothing Then
    m_theGood_ID_BRIEF = ""
  Else
    m_theGood_ID_BRIEF = tmp_theGood.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "wpg_def" & m_theGood_ID, tmp_theGood
  Set theGood = tmp_theGood
  Exit Property
End If
  '  set theGood = m_theGood
End Property
' let
'Ячейка

'Ячейка
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

'Ячейка
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
'Ед. изм.

'Ед. изм.
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set edizm(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "edizm", edizm, NewValue
On Error Resume Next
m_edizm_ID = ""
m_edizm_ID = NewValue.id
'  set   m_edizm= newValue
End If
End Property

'Ед. изм.
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. edizm
Public Property Get edizm() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_edizm As Object
If m_edizm_ID <> "" Then
  Set tmp_edizm = Application.FindRowObject("wpDic_EDIZM", m_edizm_ID)
  If tmp_edizm Is Nothing Then
    m_edizm_ID_BRIEF = ""
  Else
    m_edizm_ID_BRIEF = tmp_edizm.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "wpDic_EDIZM" & m_edizm_ID, tmp_edizm
  Set edizm = tmp_edizm
  Exit Property
End If
  '  set edizm = m_edizm
End Property
' let
'Кол-во в килограммах

'Кол-во в килограммах
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Q_Weight(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Q_Weight", Q_Weight, NewValue

   m_Q_Weight = NewValue
End If
End Property

'Кол-во в килограммах
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. Q_Weight
Public Property Get Q_Weight() As Double
 LoadFromDatabase
 AccessTime = Now

   Q_Weight = m_Q_Weight
End Property
' let
'Кол-во в штуках

'Кол-во в штуках
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Q_Quantity(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Q_Quantity", Q_Quantity, NewValue

   m_Q_Quantity = NewValue
End If
End Property

'Кол-во в штуках
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. Q_Quantity
Public Property Get Q_Quantity() As Double
 LoadFromDatabase
 AccessTime = Now

   Q_Quantity = m_Q_Quantity
End Property
' let
'Страна

'Страна
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TheCountry(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheCountry", TheCountry, NewValue
On Error Resume Next
m_TheCountry_ID = ""
m_TheCountry_ID = NewValue.id
'  set   m_TheCountry= newValue
End If
End Property

'Страна
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TheCountry
Public Property Get TheCountry() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TheCountry As Object
If m_TheCountry_ID <> "" Then
  Set tmp_TheCountry = Application.FindRowObject("wpDic_Country", m_TheCountry_ID)
  If tmp_TheCountry Is Nothing Then
    m_TheCountry_ID_BRIEF = ""
  Else
    m_TheCountry_ID_BRIEF = tmp_TheCountry.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "wpDic_Country" & m_TheCountry_ID, tmp_TheCountry
  Set TheCountry = tmp_TheCountry
  Exit Property
End If
  '  set TheCountry = m_TheCountry
End Property
' let
'Производитель

'Производитель
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TheDeveloper(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheDeveloper", TheDeveloper, NewValue
On Error Resume Next
m_TheDeveloper_ID = ""
m_TheDeveloper_ID = NewValue.id
'  set   m_TheDeveloper= newValue
End If
End Property

'Производитель
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TheDeveloper
Public Property Get TheDeveloper() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TheDeveloper As Object
If m_TheDeveloper_ID <> "" Then
  Set tmp_TheDeveloper = Application.FindRowObject("wpDic_firm", m_TheDeveloper_ID)
  If tmp_TheDeveloper Is Nothing Then
    m_TheDeveloper_ID_BRIEF = ""
  Else
    m_TheDeveloper_ID_BRIEF = tmp_TheDeveloper.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "wpDic_firm" & m_TheDeveloper_ID, tmp_TheDeveloper
  Set TheDeveloper = tmp_TheDeveloper
  Exit Property
End If
  '  set TheDeveloper = m_TheDeveloper
End Property
' let
'Завод

'Завод
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TheFactory(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheFactory", TheFactory, NewValue
On Error Resume Next
m_TheFactory_ID = ""
m_TheFactory_ID = NewValue.id
'  set   m_TheFactory= newValue
End If
End Property

'Завод
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TheFactory
Public Property Get TheFactory() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TheFactory As Object
If m_TheFactory_ID <> "" Then
  Set tmp_TheFactory = Application.FindRowObject("wpDic_factory", m_TheFactory_ID)
  If tmp_TheFactory Is Nothing Then
    m_TheFactory_ID_BRIEF = ""
  Else
    m_TheFactory_ID_BRIEF = tmp_TheFactory.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "wpDic_factory" & m_TheFactory_ID, tmp_TheFactory
  Set TheFactory = tmp_TheFactory
  Exit Property
End If
  '  set TheFactory = m_TheFactory
End Property
' let
'Сертификат

'Сертификат
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let SertNum(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SertNum", SertNum, NewValue

   m_SertNum = NewValue
End If
End Property

'Сертификат
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. SertNum
Public Property Get SertNum() As String
 LoadFromDatabase
 AccessTime = Now

   SertNum = m_SertNum
End Property
' let
'Дата производства с

'Дата производства с
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let madeDate_from(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "madeDate_from", madeDate_from, NewValue

   m_madeDate_from = NewValue
End If
End Property

'Дата производства с
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. madeDate_from
Public Property Get madeDate_from() As Date
 LoadFromDatabase
 AccessTime = Now

   madeDate_from = m_madeDate_from
End Property
' let
'Дата производства по

'Дата производства по
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let madedate_to(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "madedate_to", madedate_to, NewValue

   m_madedate_to = NewValue
End If
End Property

'Дата производства по
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. madedate_to
Public Property Get madedate_to() As Date
 LoadFromDatabase
 AccessTime = Now

   madedate_to = m_madedate_to
End Property
' let
'Окончание срока годности

'Окончание срока годности
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let expdate(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "expdate", expdate, NewValue

   m_expdate = NewValue
End If
End Property

'Окончание срока годности
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. expdate
Public Property Get expdate() As Date
 LoadFromDatabase
 AccessTime = Now

   expdate = m_expdate
End Property
' let
'Дата окончания хранения

'Дата окончания хранения
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let stopdate(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "stopdate", stopdate, NewValue

   m_stopdate = NewValue
End If
End Property

'Дата окончания хранения
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. stopdate
Public Property Get stopdate() As Date
 LoadFromDatabase
 AccessTime = Now

   stopdate = m_stopdate
End Property
' let
'С-Аналитика 1

'С-Аналитика 1
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set S1(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "S1", S1, NewValue
On Error Resume Next
m_S1_ID = ""
m_S1_ID = NewValue.id
'  set   m_S1= newValue
End If
End Property

'С-Аналитика 1
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. S1
Public Property Get S1() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_S1 As Object
If m_S1_ID <> "" Then
  Set tmp_S1 = Application.FindRowObject("wpg_S1", m_S1_ID)
  If tmp_S1 Is Nothing Then
    m_S1_ID_BRIEF = ""
  Else
    m_S1_ID_BRIEF = tmp_S1.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "wpg_S1" & m_S1_ID, tmp_S1
  Set S1 = tmp_S1
  Exit Property
End If
  '  set S1 = m_S1
End Property
' let
'С-Аналитика 2

'С-Аналитика 2
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set S2(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "S2", S2, NewValue
On Error Resume Next
m_S2_ID = ""
m_S2_ID = NewValue.id
'  set   m_S2= newValue
End If
End Property

'С-Аналитика 2
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. S2
Public Property Get S2() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_S2 As Object
If m_S2_ID <> "" Then
  Set tmp_S2 = Application.FindRowObject("wpg_S2", m_S2_ID)
  If tmp_S2 Is Nothing Then
    m_S2_ID_BRIEF = ""
  Else
    m_S2_ID_BRIEF = tmp_S2.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "wpg_S2" & m_S2_ID, tmp_S2
  Set S2 = tmp_S2
  Exit Property
End If
  '  set S2 = m_S2
End Property
' let
'С-Аналитика 3

'С-Аналитика 3
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set S3(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "S3", S3, NewValue
On Error Resume Next
m_S3_ID = ""
m_S3_ID = NewValue.id
'  set   m_S3= newValue
End If
End Property

'С-Аналитика 3
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. S3
Public Property Get S3() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_S3 As Object
If m_S3_ID <> "" Then
  Set tmp_S3 = Application.FindRowObject("wpG_S3", m_S3_ID)
  If tmp_S3 Is Nothing Then
    m_S3_ID_BRIEF = ""
  Else
    m_S3_ID_BRIEF = tmp_S3.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "wpG_S3" & m_S3_ID, tmp_S3
  Set S3 = tmp_S3
  Exit Property
End If
  '  set S3 = m_S3
End Property
' let
'С-Аналитика 4

'С-Аналитика 4
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set S4(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "S4", S4, NewValue
On Error Resume Next
m_S4_ID = ""
m_S4_ID = NewValue.id
'  set   m_S4= newValue
End If
End Property

'С-Аналитика 4
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. S4
Public Property Get S4() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_S4 As Object
If m_S4_ID <> "" Then
  Set tmp_S4 = Application.FindRowObject("wpg_s4", m_S4_ID)
  If tmp_S4 Is Nothing Then
    m_S4_ID_BRIEF = ""
  Else
    m_S4_ID_BRIEF = tmp_S4.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "wpg_s4" & m_S4_ID, tmp_S4
  Set S4 = tmp_S4
  Exit Property
End If
  '  set S4 = m_S4
End Property
' let
'С-Аналитика 5

'С-Аналитика 5
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set S5(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "S5", S5, NewValue
On Error Resume Next
m_S5_ID = ""
m_S5_ID = NewValue.id
'  set   m_S5= newValue
End If
End Property

'С-Аналитика 5
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. S5
Public Property Get S5() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_S5 As Object
If m_S5_ID <> "" Then
  Set tmp_S5 = Application.FindRowObject("wpg_s5", m_S5_ID)
  If tmp_S5 Is Nothing Then
    m_S5_ID_BRIEF = ""
  Else
    m_S5_ID_BRIEF = tmp_S5.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "wpg_s5" & m_S5_ID, tmp_S5
  Set S5 = tmp_S5
  Exit Property
End If
  '  set S5 = m_S5
End Property
' let
'Д-Аналитика 1

'Д-Аналитика 1
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set D1(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "D1", D1, NewValue
On Error Resume Next
m_D1_ID = ""
m_D1_ID = NewValue.id
'  set   m_D1= newValue
End If
End Property

'Д-Аналитика 1
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. D1
Public Property Get D1() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_D1 As Object
If m_D1_ID <> "" Then
  Set tmp_D1 = Application.FindRowObject("wpg_D1", m_D1_ID)
  If tmp_D1 Is Nothing Then
    m_D1_ID_BRIEF = ""
  Else
    m_D1_ID_BRIEF = tmp_D1.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "wpg_D1" & m_D1_ID, tmp_D1
  Set D1 = tmp_D1
  Exit Property
End If
  '  set D1 = m_D1
End Property
' let
'Д-Аналитика 2

'Д-Аналитика 2
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set D2(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "D2", D2, NewValue
On Error Resume Next
m_D2_ID = ""
m_D2_ID = NewValue.id
'  set   m_D2= newValue
End If
End Property

'Д-Аналитика 2
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. D2
Public Property Get D2() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_D2 As Object
If m_D2_ID <> "" Then
  Set tmp_D2 = Application.FindRowObject("wpg_d2", m_D2_ID)
  If tmp_D2 Is Nothing Then
    m_D2_ID_BRIEF = ""
  Else
    m_D2_ID_BRIEF = tmp_D2.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "wpg_d2" & m_D2_ID, tmp_D2
  Set D2 = tmp_D2
  Exit Property
End If
  '  set D2 = m_D2
End Property
' let
'Д-Аналитика 3

'Д-Аналитика 3
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set D3(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "D3", D3, NewValue
On Error Resume Next
m_D3_ID = ""
m_D3_ID = NewValue.id
'  set   m_D3= newValue
End If
End Property

'Д-Аналитика 3
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. D3
Public Property Get D3() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_D3 As Object
If m_D3_ID <> "" Then
  Set tmp_D3 = Application.FindRowObject("wpg_d3", m_D3_ID)
  If tmp_D3 Is Nothing Then
    m_D3_ID_BRIEF = ""
  Else
    m_D3_ID_BRIEF = tmp_D3.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "wpg_d3" & m_D3_ID, tmp_D3
  Set D3 = tmp_D3
  Exit Property
End If
  '  set D3 = m_D3
End Property
' let
'Д-Аналитика 4

'Д-Аналитика 4
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set D4(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "D4", D4, NewValue
On Error Resume Next
m_D4_ID = ""
m_D4_ID = NewValue.id
'  set   m_D4= newValue
End If
End Property

'Д-Аналитика 4
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. D4
Public Property Get D4() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_D4 As Object
If m_D4_ID <> "" Then
  Set tmp_D4 = Application.FindRowObject("wpg_d4", m_D4_ID)
  If tmp_D4 Is Nothing Then
    m_D4_ID_BRIEF = ""
  Else
    m_D4_ID_BRIEF = tmp_D4.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "wpg_d4" & m_D4_ID, tmp_D4
  Set D4 = tmp_D4
  Exit Property
End If
  '  set D4 = m_D4
End Property
' let
'Д-Аналитика 5

'Д-Аналитика 5
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set D5(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "D5", D5, NewValue
On Error Resume Next
m_D5_ID = ""
m_D5_ID = NewValue.id
'  set   m_D5= newValue
End If
End Property

'Д-Аналитика 5
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. D5
Public Property Get D5() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_D5 As Object
If m_D5_ID <> "" Then
  Set tmp_D5 = Application.FindRowObject("wpg_d5", m_D5_ID)
  If tmp_D5 Is Nothing Then
    m_D5_ID_BRIEF = ""
  Else
    m_D5_ID_BRIEF = tmp_D5.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "wpg_d5" & m_D5_ID, tmp_D5
  Set D5 = tmp_D5
  Exit Property
End If
  '  set D5 = m_D5
End Property
' let
'Брак

'Брак
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let IsBrak(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IsBrak", IsBrak, NewValue

   m_IsBrak = NewValue
End If
End Property

'Брак
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. IsBrak
Public Property Get IsBrak() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   IsBrak = m_IsBrak
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

 ' Reference to wpin_line
    If m_InDocLine_ID = "" Then
       Set nvi = nv.Add("InDocLine", "")
    Else
       Set nvi = nv.Add("InDocLine", m_InDocLine_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to wpPal_def
    If m_pallet_ID = "" Then
       Set nvi = nv.Add("pallet", "")
    Else
       Set nvi = nv.Add("pallet", m_pallet_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to wpg_def
    If m_theGood_ID = "" Then
       Set nvi = nv.Add("theGood", "")
    Else
       Set nvi = nv.Add("theGood", m_theGood_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to wpcell_cell
    If m_TheCell_ID = "" Then
       Set nvi = nv.Add("TheCell", "")
    Else
       Set nvi = nv.Add("TheCell", m_TheCell_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to wpDic_EDIZM
    If m_edizm_ID = "" Then
       Set nvi = nv.Add("edizm", "")
    Else
       Set nvi = nv.Add("edizm", m_edizm_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("Q_Weight", m_Q_Weight)
nvi.ValueType = adDouble
  Set nvi = nv.Add("Q_Quantity", m_Q_Quantity)
nvi.ValueType = adDouble
 ' Reference to wpDic_Country
    If m_TheCountry_ID = "" Then
       Set nvi = nv.Add("TheCountry", "")
    Else
       Set nvi = nv.Add("TheCountry", m_TheCountry_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to wpDic_firm
    If m_TheDeveloper_ID = "" Then
       Set nvi = nv.Add("TheDeveloper", "")
    Else
       Set nvi = nv.Add("TheDeveloper", m_TheDeveloper_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to wpDic_factory
    If m_TheFactory_ID = "" Then
       Set nvi = nv.Add("TheFactory", "")
    Else
       Set nvi = nv.Add("TheFactory", m_TheFactory_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("SertNum", m_SertNum)
nvi.ValueSize = 80
  Set nvi = nv.Add("madeDate_from", m_madeDate_from)
nvi.ValueType = adDate
  Set nvi = nv.Add("madedate_to", m_madedate_to)
nvi.ValueType = adDate
  Set nvi = nv.Add("expdate", m_expdate)
nvi.ValueType = adDate
  Set nvi = nv.Add("stopdate", m_stopdate)
nvi.ValueType = adDate
 ' Reference to wpg_S1
    If m_S1_ID = "" Then
       Set nvi = nv.Add("S1", "")
    Else
       Set nvi = nv.Add("S1", m_S1_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to wpg_S2
    If m_S2_ID = "" Then
       Set nvi = nv.Add("S2", "")
    Else
       Set nvi = nv.Add("S2", m_S2_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to wpG_S3
    If m_S3_ID = "" Then
       Set nvi = nv.Add("S3", "")
    Else
       Set nvi = nv.Add("S3", m_S3_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to wpg_s4
    If m_S4_ID = "" Then
       Set nvi = nv.Add("S4", "")
    Else
       Set nvi = nv.Add("S4", m_S4_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to wpg_s5
    If m_S5_ID = "" Then
       Set nvi = nv.Add("S5", "")
    Else
       Set nvi = nv.Add("S5", m_S5_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to wpg_D1
    If m_D1_ID = "" Then
       Set nvi = nv.Add("D1", "")
    Else
       Set nvi = nv.Add("D1", m_D1_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to wpg_d2
    If m_D2_ID = "" Then
       Set nvi = nv.Add("D2", "")
    Else
       Set nvi = nv.Add("D2", m_D2_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to wpg_d3
    If m_D3_ID = "" Then
       Set nvi = nv.Add("D3", "")
    Else
       Set nvi = nv.Add("D3", m_D3_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to wpg_d4
    If m_D4_ID = "" Then
       Set nvi = nv.Add("D4", "")
    Else
       Set nvi = nv.Add("D4", m_D4_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to wpg_d5
    If m_D5_ID = "" Then
       Set nvi = nv.Add("D5", "")
    Else
       Set nvi = nv.Add("D5", m_D5_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("IsBrak", m_IsBrak)
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
   If theGood Is Nothing Then
     m_Brief = m_Brief & "{" & m_theGood_ID_BRIEF & "}; "
   Else
     m_Brief = m_Brief & "{" & theGood.Brief & "}; "
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

  m_InDocLine_ID = nv.item("InDocLine").Value
  m_pallet_ID = nv.item("pallet").Value
  m_theGood_ID = nv.item("theGood").Value
  m_TheCell_ID = nv.item("TheCell").Value
  m_edizm_ID = nv.item("edizm").Value
m_Q_Weight = nv.item("Q_Weight").Value
m_Q_Quantity = nv.item("Q_Quantity").Value
  m_TheCountry_ID = nv.item("TheCountry").Value
  m_TheDeveloper_ID = nv.item("TheDeveloper").Value
  m_TheFactory_ID = nv.item("TheFactory").Value
m_SertNum = nv.item("SertNum").Value
m_madeDate_from = nv.item("madeDate_from").Value
m_madedate_to = nv.item("madedate_to").Value
m_expdate = nv.item("expdate").Value
m_stopdate = nv.item("stopdate").Value
  m_S1_ID = nv.item("S1").Value
  m_S2_ID = nv.item("S2").Value
  m_S3_ID = nv.item("S3").Value
  m_S4_ID = nv.item("S4").Value
  m_S5_ID = nv.item("S5").Value
  m_D1_ID = nv.item("D1").Value
  m_D2_ID = nv.item("D2").Value
  m_D3_ID = nv.item("D3").Value
  m_D4_ID = nv.item("D4").Value
  m_D5_ID = nv.item("D5").Value
m_IsBrak = nv.item("IsBrak").Value
Else

  m_InDocLine_ID = nv.Fields("InDocLine").Value
  m_pallet_ID = nv.Fields("pallet").Value
  m_theGood_ID = nv.Fields("theGood").Value
  m_TheCell_ID = nv.Fields("TheCell").Value
  m_edizm_ID = nv.Fields("edizm").Value
m_Q_Weight = nv.Fields("Q_Weight").Value
m_Q_Quantity = nv.Fields("Q_Quantity").Value
  m_TheCountry_ID = nv.Fields("TheCountry").Value
  m_TheDeveloper_ID = nv.Fields("TheDeveloper").Value
  m_TheFactory_ID = nv.Fields("TheFactory").Value
m_SertNum = nv.Fields("SertNum").Value
m_madeDate_from = nv.Fields("madeDate_from").Value
m_madedate_to = nv.Fields("madedate_to").Value
m_expdate = nv.Fields("expdate").Value
m_stopdate = nv.Fields("stopdate").Value
  m_S1_ID = nv.Fields("S1").Value
  m_S2_ID = nv.Fields("S2").Value
  m_S3_ID = nv.Fields("S3").Value
  m_S4_ID = nv.Fields("S4").Value
  m_S5_ID = nv.Fields("S5").Value
  m_D1_ID = nv.Fields("D1").Value
  m_D2_ID = nv.Fields("D2").Value
  m_D3_ID = nv.Fields("D3").Value
  m_D4_ID = nv.Fields("D4").Value
  m_D5_ID = nv.Fields("D5").Value
m_IsBrak = nv.Fields("IsBrak").Value
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
   Dim o As wpStock_record
   Set o = New wpStock_record
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
  err.Raise err.Number, "wpStock_record.Save", err.Description
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
  err.Raise err.Number, "wpStock_record.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("wpStock_record", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "wpStock_record.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "wpStock_record", id
Exit Sub
bye:
  err.Raise err.Number, "wpStock_record.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 m_InDocLine_ID = ""
 Set m_InDocLine = Nothing
 m_pallet_ID = ""
 Set m_pallet = Nothing
 m_theGood_ID = ""
 Set m_theGood = Nothing
 m_TheCell_ID = ""
 Set m_TheCell = Nothing
 m_edizm_ID = ""
 Set m_edizm = Nothing
 m_TheCountry_ID = ""
 Set m_TheCountry = Nothing
 m_TheDeveloper_ID = ""
 Set m_TheDeveloper = Nothing
 m_TheFactory_ID = ""
 Set m_TheFactory = Nothing
 m_S1_ID = ""
 Set m_S1 = Nothing
 m_S2_ID = ""
 Set m_S2 = Nothing
 m_S3_ID = ""
 Set m_S3 = Nothing
 m_S4_ID = ""
 Set m_S4 = Nothing
 m_S5_ID = ""
 Set m_S5 = Nothing
 m_D1_ID = ""
 Set m_D1 = Nothing
 m_D2_ID = ""
 Set m_D2 = Nothing
 m_D3_ID = ""
 Set m_D3 = Nothing
 m_D4_ID = ""
 Set m_D4 = Nothing
 m_D5_ID = ""
 Set m_D5 = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "wpStock_record.CloseClass"
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
  Set InDocLine = Nothing
  m_InDocLine_ID = node.Attributes.getNamedItem("INDOCLINE").nodeValue
  m_InDocLine_ID_BRIEF = node.Attributes.getNamedItem("INDOCLINE_BRIEF").nodeValue
  Set pallet = Nothing
  m_pallet_ID = node.Attributes.getNamedItem("PALLET").nodeValue
  m_pallet_ID_BRIEF = node.Attributes.getNamedItem("PALLET_BRIEF").nodeValue
  Set theGood = Nothing
  m_theGood_ID = node.Attributes.getNamedItem("THEGOOD").nodeValue
  m_theGood_ID_BRIEF = node.Attributes.getNamedItem("THEGOOD_BRIEF").nodeValue
  Set TheCell = Nothing
  m_TheCell_ID = node.Attributes.getNamedItem("THECELL").nodeValue
  m_TheCell_ID_BRIEF = node.Attributes.getNamedItem("THECELL_BRIEF").nodeValue
  Set edizm = Nothing
  m_edizm_ID = node.Attributes.getNamedItem("EDIZM").nodeValue
  m_edizm_ID_BRIEF = node.Attributes.getNamedItem("EDIZM_BRIEF").nodeValue
  Q_Weight = Val(Replace(node.Attributes.getNamedItem("Q_WEIGHT").nodeValue, vbLf, vbCrLf))
  Q_Quantity = Val(Replace(node.Attributes.getNamedItem("Q_QUANTITY").nodeValue, vbLf, vbCrLf))
  Set TheCountry = Nothing
  m_TheCountry_ID = node.Attributes.getNamedItem("THECOUNTRY").nodeValue
  m_TheCountry_ID_BRIEF = node.Attributes.getNamedItem("THECOUNTRY_BRIEF").nodeValue
  Set TheDeveloper = Nothing
  m_TheDeveloper_ID = node.Attributes.getNamedItem("THEDEVELOPER").nodeValue
  m_TheDeveloper_ID_BRIEF = node.Attributes.getNamedItem("THEDEVELOPER_BRIEF").nodeValue
  Set TheFactory = Nothing
  m_TheFactory_ID = node.Attributes.getNamedItem("THEFACTORY").nodeValue
  m_TheFactory_ID_BRIEF = node.Attributes.getNamedItem("THEFACTORY_BRIEF").nodeValue
  SertNum = Replace(node.Attributes.getNamedItem("SERTNUM").nodeValue, vbLf, vbCrLf)
  madeDate_from = node.Attributes.getNamedItem("MADEDATE_FROM").nodeValue
  madedate_to = node.Attributes.getNamedItem("MADEDATE_TO").nodeValue
  expdate = node.Attributes.getNamedItem("EXPDATE").nodeValue
  stopdate = node.Attributes.getNamedItem("STOPDATE").nodeValue
  Set S1 = Nothing
  m_S1_ID = node.Attributes.getNamedItem("S1").nodeValue
  m_S1_ID_BRIEF = node.Attributes.getNamedItem("S1_BRIEF").nodeValue
  Set S2 = Nothing
  m_S2_ID = node.Attributes.getNamedItem("S2").nodeValue
  m_S2_ID_BRIEF = node.Attributes.getNamedItem("S2_BRIEF").nodeValue
  Set S3 = Nothing
  m_S3_ID = node.Attributes.getNamedItem("S3").nodeValue
  m_S3_ID_BRIEF = node.Attributes.getNamedItem("S3_BRIEF").nodeValue
  Set S4 = Nothing
  m_S4_ID = node.Attributes.getNamedItem("S4").nodeValue
  m_S4_ID_BRIEF = node.Attributes.getNamedItem("S4_BRIEF").nodeValue
  Set S5 = Nothing
  m_S5_ID = node.Attributes.getNamedItem("S5").nodeValue
  m_S5_ID_BRIEF = node.Attributes.getNamedItem("S5_BRIEF").nodeValue
  Set D1 = Nothing
  m_D1_ID = node.Attributes.getNamedItem("D1").nodeValue
  m_D1_ID_BRIEF = node.Attributes.getNamedItem("D1_BRIEF").nodeValue
  Set D2 = Nothing
  m_D2_ID = node.Attributes.getNamedItem("D2").nodeValue
  m_D2_ID_BRIEF = node.Attributes.getNamedItem("D2_BRIEF").nodeValue
  Set D3 = Nothing
  m_D3_ID = node.Attributes.getNamedItem("D3").nodeValue
  m_D3_ID_BRIEF = node.Attributes.getNamedItem("D3_BRIEF").nodeValue
  Set D4 = Nothing
  m_D4_ID = node.Attributes.getNamedItem("D4").nodeValue
  m_D4_ID_BRIEF = node.Attributes.getNamedItem("D4_BRIEF").nodeValue
  Set D5 = Nothing
  m_D5_ID = node.Attributes.getNamedItem("D5").nodeValue
  m_D5_ID_BRIEF = node.Attributes.getNamedItem("D5_BRIEF").nodeValue
  IsBrak = node.Attributes.getNamedItem("ISBRAK").nodeValue
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
  node.setAttribute "INDOCLINE", m_InDocLine_ID
  If Not (InDocLine Is Nothing) Then
    node.setAttribute "INDOCLINE_BRIEF", InDocLine.Brief
  Else
    node.setAttribute "INDOCLINE_BRIEF", m_InDocLine_ID_BRIEF
  End If
  node.setAttribute "PALLET", m_pallet_ID
  If Not (pallet Is Nothing) Then
    node.setAttribute "PALLET_BRIEF", pallet.Brief
  Else
    node.setAttribute "PALLET_BRIEF", m_pallet_ID_BRIEF
  End If
  node.setAttribute "THEGOOD", m_theGood_ID
  If Not (theGood Is Nothing) Then
    node.setAttribute "THEGOOD_BRIEF", theGood.Brief
  Else
    node.setAttribute "THEGOOD_BRIEF", m_theGood_ID_BRIEF
  End If
  node.setAttribute "THECELL", m_TheCell_ID
  If Not (TheCell Is Nothing) Then
    node.setAttribute "THECELL_BRIEF", TheCell.Brief
  Else
    node.setAttribute "THECELL_BRIEF", m_TheCell_ID_BRIEF
  End If
  node.setAttribute "EDIZM", m_edizm_ID
  If Not (edizm Is Nothing) Then
    node.setAttribute "EDIZM_BRIEF", edizm.Brief
  Else
    node.setAttribute "EDIZM_BRIEF", m_edizm_ID_BRIEF
  End If
  node.setAttribute "Q_WEIGHT", Replace(CStr(Q_Weight), ",", ".")
  node.setAttribute "Q_QUANTITY", Replace(CStr(Q_Quantity), ",", ".")
  node.setAttribute "THECOUNTRY", m_TheCountry_ID
  If Not (TheCountry Is Nothing) Then
    node.setAttribute "THECOUNTRY_BRIEF", TheCountry.Brief
  Else
    node.setAttribute "THECOUNTRY_BRIEF", m_TheCountry_ID_BRIEF
  End If
  node.setAttribute "THEDEVELOPER", m_TheDeveloper_ID
  If Not (TheDeveloper Is Nothing) Then
    node.setAttribute "THEDEVELOPER_BRIEF", TheDeveloper.Brief
  Else
    node.setAttribute "THEDEVELOPER_BRIEF", m_TheDeveloper_ID_BRIEF
  End If
  node.setAttribute "THEFACTORY", m_TheFactory_ID
  If Not (TheFactory Is Nothing) Then
    node.setAttribute "THEFACTORY_BRIEF", TheFactory.Brief
  Else
    node.setAttribute "THEFACTORY_BRIEF", m_TheFactory_ID_BRIEF
  End If
  node.setAttribute "SERTNUM", SertNum
  node.setAttribute "MADEDATE_FROM", CDbl(madeDate_from)
  node.setAttribute "MADEDATE_TO", CDbl(madedate_to)
  node.setAttribute "EXPDATE", CDbl(expdate)
  node.setAttribute "STOPDATE", CDbl(stopdate)
  node.setAttribute "S1", m_S1_ID
  If Not (S1 Is Nothing) Then
    node.setAttribute "S1_BRIEF", S1.Brief
  Else
    node.setAttribute "S1_BRIEF", m_S1_ID_BRIEF
  End If
  node.setAttribute "S2", m_S2_ID
  If Not (S2 Is Nothing) Then
    node.setAttribute "S2_BRIEF", S2.Brief
  Else
    node.setAttribute "S2_BRIEF", m_S2_ID_BRIEF
  End If
  node.setAttribute "S3", m_S3_ID
  If Not (S3 Is Nothing) Then
    node.setAttribute "S3_BRIEF", S3.Brief
  Else
    node.setAttribute "S3_BRIEF", m_S3_ID_BRIEF
  End If
  node.setAttribute "S4", m_S4_ID
  If Not (S4 Is Nothing) Then
    node.setAttribute "S4_BRIEF", S4.Brief
  Else
    node.setAttribute "S4_BRIEF", m_S4_ID_BRIEF
  End If
  node.setAttribute "S5", m_S5_ID
  If Not (S5 Is Nothing) Then
    node.setAttribute "S5_BRIEF", S5.Brief
  Else
    node.setAttribute "S5_BRIEF", m_S5_ID_BRIEF
  End If
  node.setAttribute "D1", m_D1_ID
  If Not (D1 Is Nothing) Then
    node.setAttribute "D1_BRIEF", D1.Brief
  Else
    node.setAttribute "D1_BRIEF", m_D1_ID_BRIEF
  End If
  node.setAttribute "D2", m_D2_ID
  If Not (D2 Is Nothing) Then
    node.setAttribute "D2_BRIEF", D2.Brief
  Else
    node.setAttribute "D2_BRIEF", m_D2_ID_BRIEF
  End If
  node.setAttribute "D3", m_D3_ID
  If Not (D3 Is Nothing) Then
    node.setAttribute "D3_BRIEF", D3.Brief
  Else
    node.setAttribute "D3_BRIEF", m_D3_ID_BRIEF
  End If
  node.setAttribute "D4", m_D4_ID
  If Not (D4 Is Nothing) Then
    node.setAttribute "D4_BRIEF", D4.Brief
  Else
    node.setAttribute "D4_BRIEF", m_D4_ID_BRIEF
  End If
  node.setAttribute "D5", m_D5_ID
  If Not (D5 Is Nothing) Then
    node.setAttribute "D5_BRIEF", D5.Brief
  Else
    node.setAttribute "D5_BRIEF", m_D5_ID_BRIEF
  End If
  node.setAttribute "ISBRAK", IsBrak
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
m_IsLocked = Application.MTZSession.IsLocked("wpStock_record", id)
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
OK = Application.MTZSession.LockResource("wpStock_record", id, Permanent)
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
Application.MTZSession.UnLockResource "wpStock_record", id
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
CanLock = Application.MTZSession.CanLock("wpStock_record", id)
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
If mode = "main" Then
 Select Case child
End Select
End If ' mode="main"
If mode = "" Then
 Select Case child
 End Select
End If ' mode="" (Default)
End Sub



