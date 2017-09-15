VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "RFIDPL_OP"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 1045
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
Private m_OpType As Object
Dim m_OpType_ID As String
Dim m_OpType_ID_BRIEF As String
Private m_QryNum As String
Private m_TheGood As String
Private m_GoodWeight As Double
Private m_GoodWeightBrutto As Double
Private m_CntOfPackage As Double
Private m_PackageWeight As Double
Private m_OnePackageWeight As Double
Private m_OneBoxWeight As Double
Private m_OpDate As Date
Private m_PalletPlaceRef As Object
Dim m_PalletPlaceRef_ID As String
Dim m_PalletPlaceRef_ID_BRIEF As String
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
Attribute Change.VB_HelpID = 1090
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
Attribute Deleted.VB_HelpID = 1125
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
Attribute Changed.VB_HelpID = 1095
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
Friend Property Let ID(ByVal newID As String)
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
Public Property Get ID() As String
Attribute ID.VB_HelpID = 1150
  If m_ID = "" Then m_ID = CreateGUID2
  ID = m_ID
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
Attribute SecureStyleID.VB_HelpID = 1250
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
Attribute PartName.VB_HelpID = 1210
  PartName = "RFIDPL_OP"
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
Attribute Parent.VB_HelpID = 1205
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
  m_Application.Logger.Message "RFIDPL_OP.Init"
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
Attribute Application.VB_HelpID = 1055
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
Attribute RowRetrived.VB_HelpID = 1235
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
Attribute RetriveTime.VB_HelpID = 1230
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
Attribute ChangeTime.VB_HelpID = 1100
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
Attribute AccessTime.VB_HelpID = 1050
  AccessTime = m_AccessTime
End Property
Private Function GetFromXML(ByVal XML As String, ByVal TagName As String) As String
  Dim res As String
  On Error GoTo err
  Dim XMLDoc As New DOMDocument
  Call XMLDoc.loadXML(XML)
  Dim node As MSXML2.IXMLDOMNode
  For Each node In XMLDoc.childNodes.Item(0).childNodes
    If (UCase(node.baseName) = "BRIEF") Then
      res = node.Text
      Exit For
    End If
  Next
err:
  GetFromXML = res
End Function
' let
'Тип операции

'Тип операции
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set OpType(ByVal NewValue As Object)
Attribute OpType.VB_HelpID = 1185
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "OpType", OpType, NewValue
On Error Resume Next
m_OpType_ID = ""
m_OpType_ID = NewValue.ID
'  set   m_OpType= newValue
End If
End Property

'Тип операции
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. OpType
Public Property Get OpType() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_OpType As Object
If m_OpType_ID <> "" Then
  Set tmp_OpType = Application.FindRowObject("RFIIDD_OPTYPE", m_OpType_ID)
  If tmp_OpType Is Nothing Then
    m_OpType_ID_BRIEF = ""
  Else
    m_OpType_ID_BRIEF = tmp_OpType.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "RFIIDD_OPTYPE" & m_OpType_ID, tmp_OpType
  Set OpType = tmp_OpType
  Exit Property
End If
  '  set OpType = m_OpType
End Property
' let
'Номер заказа

'Номер заказа
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let QryNum(ByVal NewValue As String)
Attribute QryNum.VB_HelpID = 1220
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "QryNum", QryNum, NewValue

   m_QryNum = NewValue
End If
End Property

'Номер заказа
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. QryNum
Public Property Get QryNum() As String
 LoadFromDatabase
 AccessTime = Now

   QryNum = m_QryNum
End Property
' let
'Товар

'Товар
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TheGood(ByVal NewValue As String)
Attribute TheGood.VB_HelpID = 1255
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheGood", TheGood, NewValue

   m_TheGood = NewValue
End If
End Property

'Товар
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. TheGood
Public Property Get TheGood() As String
 LoadFromDatabase
 AccessTime = Now

   TheGood = m_TheGood
End Property
' let
'Вес груза НЕТТО

'Вес груза НЕТТО
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let GoodWeight(ByVal NewValue As Double)
Attribute GoodWeight.VB_HelpID = 1140
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "GoodWeight", GoodWeight, NewValue

   m_GoodWeight = NewValue
End If
End Property

'Вес груза НЕТТО
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. GoodWeight
Public Property Get GoodWeight() As Double
 LoadFromDatabase
 AccessTime = Now

   GoodWeight = m_GoodWeight
End Property
' let
'Вес груза БРУТТО

'Вес груза БРУТТО
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let GoodWeightBrutto(ByVal NewValue As Double)
Attribute GoodWeightBrutto.VB_HelpID = 1145
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "GoodWeightBrutto", GoodWeightBrutto, NewValue

   m_GoodWeightBrutto = NewValue
End If
End Property

'Вес груза БРУТТО
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. GoodWeightBrutto
Public Property Get GoodWeightBrutto() As Double
 LoadFromDatabase
 AccessTime = Now

   GoodWeightBrutto = m_GoodWeightBrutto
End Property
' let
'Количество упаковок

'Количество упаковок
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let CntOfPackage(ByVal NewValue As Double)
Attribute CntOfPackage.VB_HelpID = 1110
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CntOfPackage", CntOfPackage, NewValue

   m_CntOfPackage = NewValue
End If
End Property

'Количество упаковок
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. CntOfPackage
Public Property Get CntOfPackage() As Double
 LoadFromDatabase
 AccessTime = Now

   CntOfPackage = m_CntOfPackage
End Property
' let
'Вес упаковки

'Вес упаковки
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let PackageWeight(ByVal NewValue As Double)
Attribute PackageWeight.VB_HelpID = 1195
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PackageWeight", PackageWeight, NewValue

   m_PackageWeight = NewValue
End If
End Property

'Вес упаковки
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. PackageWeight
Public Property Get PackageWeight() As Double
 LoadFromDatabase
 AccessTime = Now

   PackageWeight = m_PackageWeight
End Property
' let
'Вес одной упаковки

'Вес одной упаковки
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let OnePackageWeight(ByVal NewValue As Double)
Attribute OnePackageWeight.VB_HelpID = 1175
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "OnePackageWeight", OnePackageWeight, NewValue

   m_OnePackageWeight = NewValue
End If
End Property

'Вес одной упаковки
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. OnePackageWeight
Public Property Get OnePackageWeight() As Double
 LoadFromDatabase
 AccessTime = Now

   OnePackageWeight = m_OnePackageWeight
End Property
' let
'Вес тары одной упаковки

'Вес тары одной упаковки
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let OneBoxWeight(ByVal NewValue As Double)
Attribute OneBoxWeight.VB_HelpID = 1170
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "OneBoxWeight", OneBoxWeight, NewValue

   m_OneBoxWeight = NewValue
End If
End Property

'Вес тары одной упаковки
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. OneBoxWeight
Public Property Get OneBoxWeight() As Double
 LoadFromDatabase
 AccessTime = Now

   OneBoxWeight = m_OneBoxWeight
End Property
' let
'Дата операции

'Дата операции
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let OpDate(ByVal NewValue As Date)
Attribute OpDate.VB_HelpID = 1180
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "OpDate", OpDate, NewValue

   m_OpDate = NewValue
End If
End Property

'Дата операции
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. OpDate
Public Property Get OpDate() As Date
 LoadFromDatabase
 AccessTime = Now

   OpDate = m_OpDate
End Property
' let
'Размещение

'Размещение
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set PalletPlaceRef(ByVal NewValue As Object)
Attribute PalletPlaceRef.VB_HelpID = 1200
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PalletPlaceRef", PalletPlaceRef, NewValue
On Error Resume Next
m_PalletPlaceRef_ID = ""
m_PalletPlaceRef_ID = NewValue.ID
'  set   m_PalletPlaceRef= newValue
End If
End Property

'Размещение
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. PalletPlaceRef
Public Property Get PalletPlaceRef() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_PalletPlaceRef As Object
If m_PalletPlaceRef_ID <> "" Then
  Set tmp_PalletPlaceRef = Application.FindRowObject("RFIDCELL_INFO", m_PalletPlaceRef_ID)
  If tmp_PalletPlaceRef Is Nothing Then
    m_PalletPlaceRef_ID_BRIEF = ""
  Else
    m_PalletPlaceRef_ID_BRIEF = tmp_PalletPlaceRef.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "RFIDCELL_INFO" & m_PalletPlaceRef_ID, tmp_PalletPlaceRef
  Set PalletPlaceRef = tmp_PalletPlaceRef
  Exit Property
End If
  '  set PalletPlaceRef = m_PalletPlaceRef
End Property

'Упаковать поля в именованную коллекцию
'Parameters:
'[IN][OUT]   nv , тип параметра: NamedValues  - ...
'See Also:
'Example:
'  call me.Pack({параметры})
Public Sub Pack(ByRef nv As NamedValues)
Attribute Pack.VB_HelpID = 1190
  Dim nvi As NamedValue
  Set nv = Nothing
  Set nv = New NamedValues

 ' Reference to RFIIDD_OPTYPE
    If m_OpType_ID = "" Then
       Set nvi = nv.Add("OpType", "")
    Else
       Set nvi = nv.Add("OpType", m_OpType_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("QryNum", m_QryNum)
nvi.ValueSize = 255
  Set nvi = nv.Add("TheGood", m_TheGood)
nvi.ValueSize = 255
  Set nvi = nv.Add("GoodWeight", m_GoodWeight)
nvi.ValueType = adDouble
  Set nvi = nv.Add("GoodWeightBrutto", m_GoodWeightBrutto)
nvi.ValueType = adDouble
  Set nvi = nv.Add("CntOfPackage", m_CntOfPackage)
nvi.ValueType = adDouble
  Set nvi = nv.Add("PackageWeight", m_PackageWeight)
nvi.ValueType = adDouble
  Set nvi = nv.Add("OnePackageWeight", m_OnePackageWeight)
nvi.ValueType = adDouble
  Set nvi = nv.Add("OneBoxWeight", m_OneBoxWeight)
nvi.ValueType = adDouble
  Set nvi = nv.Add("OpDate", m_OpDate)
nvi.ValueType = adDBTimeStamp
 ' Reference to RFIDCELL_INFO
    If m_PalletPlaceRef_ID = "" Then
       Set nvi = nv.Add("PalletPlaceRef", "")
    Else
       Set nvi = nv.Add("PalletPlaceRef", m_PalletPlaceRef_ID)
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
Attribute Brief.VB_HelpID = 1065
 Dim s As String
 If Application.WorkOffline Then

  m_Brief = ""
   If OpType Is Nothing Then
     m_Brief = m_Brief & "{" & m_OpType_ID_BRIEF & "}; "
   Else
     m_Brief = m_Brief & "{" & OpType.Brief & "}; "
   End If
 Brief = m_Brief
 Else
  On Error GoTo bye
   If UseServer Or m_Brief = "" Then
     Application.MTZSession.GetBrief PartName, ID, s
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
Attribute UnPack.VB_HelpID = 1265
 On Error Resume Next
If TypeName(nv) = "NamedValues" Then

  m_OpType_ID = nv.Item("OpType").Value
m_QryNum = nv.Item("QryNum").Value
m_TheGood = nv.Item("TheGood").Value
m_GoodWeight = nv.Item("GoodWeight").Value
m_GoodWeightBrutto = nv.Item("GoodWeightBrutto").Value
m_CntOfPackage = nv.Item("CntOfPackage").Value
m_PackageWeight = nv.Item("PackageWeight").Value
m_OnePackageWeight = nv.Item("OnePackageWeight").Value
m_OneBoxWeight = nv.Item("OneBoxWeight").Value
m_OpDate = nv.Item("OpDate").Value
  m_PalletPlaceRef_ID = nv.Item("PalletPlaceRef").Value
Else

  m_OpType_ID = nv.Fields("OpType").Value
m_QryNum = nv.Fields("QryNum").Value
m_TheGood = nv.Fields("TheGood").Value
m_GoodWeight = nv.Fields("GoodWeight").Value
m_GoodWeightBrutto = nv.Fields("GoodWeightBrutto").Value
m_CntOfPackage = nv.Fields("CntOfPackage").Value
m_PackageWeight = nv.Fields("PackageWeight").Value
m_OnePackageWeight = nv.Fields("OnePackageWeight").Value
m_OneBoxWeight = nv.Fields("OneBoxWeight").Value
m_OpDate = nv.Fields("OpDate").Value
  m_PalletPlaceRef_ID = nv.Fields("PalletPlaceRef").Value
End If
End Sub

'Очистить поля
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CleanFields()
Public Sub CleanFields()
Attribute CleanFields.VB_HelpID = 1105
   Dim nv As NamedValues
   Dim o As RFIDPL_OP
   Set o = New RFIDPL_OP
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
Attribute Save.VB_HelpID = 1240
   LoadFromDatabase
   If Application.WorkOffline Then Exit Function
   If Not CanChangeONLine Then Exit Function
   Dim nv As NamedValues
   Pack nv
   On Error GoTo bye
     Application.MTZSession.SaveRow2 PartName, ID, Me.Parent.Parent.ID, nv, Application.ID
   Changed = False
   Save = True
Exit Function
bye:
  err.Raise err.Number, "RFIDPL_OP.Save", err.Description
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
Attribute Delete.VB_HelpID = 1120
   Dim i As Long, OK As Boolean
If Application.WorkOffline Then
  If Not CanChangeOffline Then Exit Function
   On Error GoTo bye
  m_Deleted = True
  Delete = True
Else
  If Not CanChangeONLine Then Exit Function
   Delete = Application.MTZSession.DeleteRow2(PartName, ID, Application.ID)
   Changed = False
   'Compact
   CloseClass
End If
Exit Function
bye:
  err.Raise err.Number, "RFIDPL_OP.Delete", err.Description
End Function

'Задать стиль защиты
'Parameters:
'[IN]   SecurityStyleID , тип параметра: string  - ...
'See Also:
'Example:
'  call me.Secure({параметры})
Public Sub Secure(ByVal SecurityStyleID As String)
Attribute Secure.VB_HelpID = 1245
If Application.WorkOffline Then Exit Sub
On Error GoTo bye
  m_SecureStyleID = Application.MTZSession.Secure("RFIDPL_OP", ID, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "RFIDPL_OP.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
Attribute Propagate.VB_HelpID = 1215
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "RFIDPL_OP", ID
Exit Sub
bye:
  err.Raise err.Number, "RFIDPL_OP.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 m_OpType_ID = ""
 Set m_OpType = Nothing
 m_PalletPlaceRef_ID = ""
 Set m_PalletPlaceRef = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "RFIDPL_OP.CloseClass"
 CloseParents
End Sub

'Обновить
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Refresh()
Public Sub Refresh()
Attribute Refresh.VB_HelpID = 1225
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
Attribute LoadFromDatabase.VB_HelpID = 1160
    On Error Resume Next
   If ID = "" Then Exit Sub
   If Application.WorkOffline Then
     RowRetrived = True
     RetriveTime = Now
     Exit Sub
   End If
   Dim rs As ADODB.Recordset
   If Not RowRetrived Then
     CleanFields
     Set rs = Application.MTZSession.GetRow(PartName, ID)
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
Attribute FindObject.VB_HelpID = 1135
 Dim m_FindObject As Object
 Static inFindObject As Boolean
 If StrID = "" Then Exit Function
 If InstID = "" Then Exit Function
 If inFindObject Then Exit Function
 inFindObject = True
 If StrID = PartName Then
   If InstID = ID Then
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
Attribute Compact.VB_HelpID = 1115
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
Attribute XMLLoad.VB_HelpID = 1270
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
  Set OpType = Nothing
  m_OpType_ID = node.Attributes.getNamedItem("OPTYPE").nodeValue
  m_OpType_ID_BRIEF = node.Attributes.getNamedItem("OPTYPE_BRIEF").nodeValue
  QryNum = Replace(node.Attributes.getNamedItem("QRYNUM").nodeValue, vbLf, vbCrLf)
  TheGood = Replace(node.Attributes.getNamedItem("THEGOOD").nodeValue, vbLf, vbCrLf)
  GoodWeight = Val(Replace(node.Attributes.getNamedItem("GOODWEIGHT").nodeValue, vbLf, vbCrLf))
  GoodWeightBrutto = Val(Replace(node.Attributes.getNamedItem("GOODWEIGHTBRUTTO").nodeValue, vbLf, vbCrLf))
  CntOfPackage = Val(Replace(node.Attributes.getNamedItem("CNTOFPACKAGE").nodeValue, vbLf, vbCrLf))
  PackageWeight = Val(Replace(node.Attributes.getNamedItem("PACKAGEWEIGHT").nodeValue, vbLf, vbCrLf))
  OnePackageWeight = Val(Replace(node.Attributes.getNamedItem("ONEPACKAGEWEIGHT").nodeValue, vbLf, vbCrLf))
  OneBoxWeight = Val(Replace(node.Attributes.getNamedItem("ONEBOXWEIGHT").nodeValue, vbLf, vbCrLf))
  OpDate = node.Attributes.getNamedItem("OPDATE").nodeValue
  Set PalletPlaceRef = Nothing
  m_PalletPlaceRef_ID = node.Attributes.getNamedItem("PALLETPLACEREF").nodeValue
  m_PalletPlaceRef_ID_BRIEF = node.Attributes.getNamedItem("PALLETPLACEREF_BRIEF").nodeValue
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
Public Sub XMLSave(node As IXMLDOMElement, Xdom As DOMDocument)
Attribute XMLSave.VB_HelpID = 1275
On Error Resume Next
  Dim e_ As IXMLDOMElement
  LoadFromDatabase
  node.setAttribute "ID", m_ID
  node.setAttribute "Deleted", m_Deleted
  node.setAttribute "IsLocked", m_IsLocked
  node.setAttribute "RetriveTime", CDbl(m_RetriveTime)
  node.setAttribute "ChangeTime", CDbl(m_ChangeTime)
  node.setAttribute "SECURITYSTYLEID", m_SecureStyleID
  node.setAttribute "OPTYPE", m_OpType_ID
  If Not (OpType Is Nothing) Then
    node.setAttribute "OPTYPE_BRIEF", OpType.Brief
  Else
    node.setAttribute "OPTYPE_BRIEF", m_OpType_ID_BRIEF
  End If
  node.setAttribute "QRYNUM", QryNum
  node.setAttribute "THEGOOD", TheGood
  node.setAttribute "GOODWEIGHT", Replace(CStr(GoodWeight), ",", ".")
  node.setAttribute "GOODWEIGHTBRUTTO", Replace(CStr(GoodWeightBrutto), ",", ".")
  node.setAttribute "CNTOFPACKAGE", Replace(CStr(CntOfPackage), ",", ".")
  node.setAttribute "PACKAGEWEIGHT", Replace(CStr(PackageWeight), ",", ".")
  node.setAttribute "ONEPACKAGEWEIGHT", Replace(CStr(OnePackageWeight), ",", ".")
  node.setAttribute "ONEBOXWEIGHT", Replace(CStr(OneBoxWeight), ",", ".")
  node.setAttribute "OPDATE", CDbl(OpDate)
  node.setAttribute "PALLETPLACEREF", m_PalletPlaceRef_ID
  If Not (PalletPlaceRef Is Nothing) Then
    node.setAttribute "PALLETPLACEREF_BRIEF", PalletPlaceRef.Brief
  Else
    node.setAttribute "PALLETPLACEREF_BRIEF", m_PalletPlaceRef_ID_BRIEF
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
Attribute CanChange.VB_HelpID = 1070
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
Attribute CanChangeOffline.VB_HelpID = 1075
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
Attribute CanChangeONLine.VB_HelpID = 1080
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
Attribute IsLocked.VB_HelpID = 1155
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
m_IsLocked = Application.MTZSession.IsLocked("RFIDPL_OP", ID)
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
Attribute LockResource.VB_HelpID = 1165
If Application.WorkOffline Then Exit Function
  Dim OK
OK = Application.MTZSession.LockResource("RFIDPL_OP", ID, Permanent)
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
Attribute UnLockResource.VB_HelpID = 1260
If Application.WorkOffline Then Exit Function
On Error GoTo bye
Application.MTZSession.UnLockResource "RFIDPL_OP", ID
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
Attribute CanLock.VB_HelpID = 1085
If Application.WorkOffline Then Exit Function
On Error Resume Next
CanLock = Application.MTZSession.CanLock("RFIDPL_OP", ID)
End Function

'Массовое обновление измененных строк
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.BatchUpdate()
Public Sub BatchUpdate()
Attribute BatchUpdate.VB_HelpID = 1060
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
Attribute Expand.VB_HelpID = 1130
 Dim ID As String, struct As String, child As String
 Dim Item As Object, i As Long, nid As String, tmpid As String
 Dim tidx As Long, tID As String 'only for tree styled structure
 On Error Resume Next
 ID = Mid(key, 39, 38)
 struct = Right(tree.nodes.Item(key).Parent.Parent.key, Len(tree.nodes.Item(key).Parent.Parent.key) - 76)
 child = Right(key, Len(key) - 76)
 If ID <> m_ID Then
   Exit Sub
 Else
    Set Item = Me
 End If
 tree.nodes.Item(key).Sorted = True
If mode = "" Then
 Select Case child
 End Select
End If ' mode="" (Default)
End Sub



