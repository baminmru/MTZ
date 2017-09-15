VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "pekmsg_path"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'строка раздела Маршрут доставки
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
Private m_SendDate As Date
Private m_RcvWaitDate As Date
Private m_trainNo As Object
Dim m_trainNo_ID As String
Dim m_trainNo_ID_BRIEF As String
Private m_vagNo As String
Private m_PathFilial As Object
Dim m_PathFilial_ID As String
Dim m_PathFilial_ID_BRIEF As String
Private m_TransSupplier As Object
Dim m_TransSupplier_ID As String
Dim m_TransSupplier_ID_BRIEF As String
Private m_TheDirection As Object
Dim m_TheDirection_ID As String
Dim m_TheDirection_ID_BRIEF As String
Private m_PPONum As Long
Private m_DestStation As Object
Dim m_DestStation_ID As String
Dim m_DestStation_ID_BRIEF As String
Private m_PPODescription As Object
Dim m_PPODescription_ID As String
Dim m_PPODescription_ID_BRIEF As String
Private m_Receiver As Object
Dim m_Receiver_ID As String
Dim m_Receiver_ID_BRIEF As String
Private m_PPOWeight As Double
Private m_WeightEDIZM As Object
Dim m_WeightEDIZM_ID As String
Dim m_WeightEDIZM_ID_BRIEF As String
Private m_PPOVol As Double
Private m_ValueEDIZM As Object
Dim m_ValueEDIZM_ID As String
Dim m_ValueEDIZM_ID_BRIEF As String
Private m_PassFIO As String
Private m_PassDate As Date
Private m_RcvFIO As String
Private m_RcvDate As Date
Private m_InforRcvFIO As String
Private m_InfoDate As Date
Private m_InfoSendType As Object
Dim m_InfoSendType_ID As String
Dim m_InfoSendType_ID_BRIEF As String
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
  PartName = "pekmsg_path"
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
  m_Application.Logger.Message "pekmsg_path.Init"
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
'Дата отправки

'Дата отправки
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let SendDate(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SendDate", SendDate, NewValue

   m_SendDate = NewValue
End If
End Property

'Дата отправки
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. SendDate
Public Property Get SendDate() As Date
 LoadFromDatabase
 AccessTime = Now

   SendDate = m_SendDate
End Property
' let
'Ориентировочная дата получения

'Ориентировочная дата получения
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let RcvWaitDate(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "RcvWaitDate", RcvWaitDate, NewValue

   m_RcvWaitDate = NewValue
End If
End Property

'Ориентировочная дата получения
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. RcvWaitDate
Public Property Get RcvWaitDate() As Date
 LoadFromDatabase
 AccessTime = Now

   RcvWaitDate = m_RcvWaitDate
End Property
' let
'Поезд

'Поезд
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set trainNo(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "trainNo", trainNo, NewValue
On Error Resume Next
m_trainNo_ID = ""
m_trainNo_ID = NewValue.id
'  set   m_trainNo= newValue
End If
End Property

'Поезд
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. trainNo
Public Property Get trainNo() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_trainNo As Object
If m_trainNo_ID <> "" Then
  Set tmp_trainNo = Application.FindRowObject("PEKD_TRAINS", m_trainNo_ID)
  If tmp_trainNo Is Nothing Then
    m_trainNo_ID_BRIEF = ""
  Else
    m_trainNo_ID_BRIEF = tmp_trainNo.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PEKD_TRAINS" & m_trainNo_ID, tmp_trainNo
  Set trainNo = tmp_trainNo
  Exit Property
End If
  '  set trainNo = m_trainNo
End Property
' let
'Вагон №

'Вагон №
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let vagNo(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "vagNo", vagNo, NewValue

   m_vagNo = NewValue
End If
End Property

'Вагон №
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. vagNo
Public Property Get vagNo() As String
 LoadFromDatabase
 AccessTime = Now

   vagNo = m_vagNo
End Property
' let
'Филиал

'Филиал
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set PathFilial(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PathFilial", PathFilial, NewValue
On Error Resume Next
m_PathFilial_ID = ""
m_PathFilial_ID = NewValue.id
'  set   m_PathFilial= newValue
End If
End Property

'Филиал
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. PathFilial
Public Property Get PathFilial() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_PathFilial As Object
If m_PathFilial_ID <> "" Then
  Set tmp_PathFilial = Application.FindRowObject("PEKD_DEPT", m_PathFilial_ID)
  If tmp_PathFilial Is Nothing Then
    m_PathFilial_ID_BRIEF = ""
  Else
    m_PathFilial_ID_BRIEF = tmp_PathFilial.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PEKD_DEPT" & m_PathFilial_ID, tmp_PathFilial
  Set PathFilial = tmp_PathFilial
  Exit Property
End If
  '  set PathFilial = m_PathFilial
End Property
' let
'Поставщик

'Поставщик
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TransSupplier(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TransSupplier", TransSupplier, NewValue
On Error Resume Next
m_TransSupplier_ID = ""
m_TransSupplier_ID = NewValue.id
' set   m_TransSupplier= newValue
End If
End Property

'Поставщик
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TransSupplier
Public Property Get TransSupplier() As Object
 LoadFromDatabase
 AccessTime = Now
If m_TransSupplier_ID <> "" Then
  Set TransSupplier = Application.Manager.GetInstanceObject(Right(m_TransSupplier_ID, 38))
 Exit Property
End If
  ' set TransSupplier = m_TransSupplier
End Property
' let
'Направление

'Направление
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TheDirection(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheDirection", TheDirection, NewValue
On Error Resume Next
m_TheDirection_ID = ""
m_TheDirection_ID = NewValue.id
'  set   m_TheDirection= newValue
End If
End Property

'Направление
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TheDirection
Public Property Get TheDirection() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TheDirection As Object
If m_TheDirection_ID <> "" Then
  Set tmp_TheDirection = Application.FindRowObject("PEKD_DIRECTION", m_TheDirection_ID)
  If tmp_TheDirection Is Nothing Then
    m_TheDirection_ID_BRIEF = ""
  Else
    m_TheDirection_ID_BRIEF = tmp_TheDirection.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PEKD_DIRECTION" & m_TheDirection_ID, tmp_TheDirection
  Set TheDirection = tmp_TheDirection
  Exit Property
End If
  '  set TheDirection = m_TheDirection
End Property
' let
'Кол-во ПО

'Кол-во ПО
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let PPONum(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PPONum", PPONum, NewValue

   m_PPONum = NewValue
End If
End Property

'Кол-во ПО
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. PPONum
Public Property Get PPONum() As Long
 LoadFromDatabase
 AccessTime = Now

   PPONum = m_PPONum
End Property
' let
'Станция назначения

'Станция назначения
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set DestStation(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DestStation", DestStation, NewValue
On Error Resume Next
m_DestStation_ID = ""
m_DestStation_ID = NewValue.id
'  set   m_DestStation= newValue
End If
End Property

'Станция назначения
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. DestStation
Public Property Get DestStation() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_DestStation As Object
If m_DestStation_ID <> "" Then
  Set tmp_DestStation = Application.FindRowObject("PEKD_DIRSTATION", m_DestStation_ID)
  If tmp_DestStation Is Nothing Then
    m_DestStation_ID_BRIEF = ""
  Else
    m_DestStation_ID_BRIEF = tmp_DestStation.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PEKD_DIRSTATION" & m_DestStation_ID, tmp_DestStation
  Set DestStation = tmp_DestStation
  Exit Property
End If
  '  set DestStation = m_DestStation
End Property
' let
'Характер груза

'Характер груза
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set PPODescription(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PPODescription", PPODescription, NewValue
On Error Resume Next
m_PPODescription_ID = ""
m_PPODescription_ID = NewValue.id
'  set   m_PPODescription= newValue
End If
End Property

'Характер груза
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. PPODescription
Public Property Get PPODescription() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_PPODescription As Object
If m_PPODescription_ID <> "" Then
  Set tmp_PPODescription = Application.FindRowObject("PEKD_POSTTYPE", m_PPODescription_ID)
  If tmp_PPODescription Is Nothing Then
    m_PPODescription_ID_BRIEF = ""
  Else
    m_PPODescription_ID_BRIEF = tmp_PPODescription.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PEKD_POSTTYPE" & m_PPODescription_ID, tmp_PPODescription
  Set PPODescription = tmp_PPODescription
  Exit Property
End If
  '  set PPODescription = m_PPODescription
End Property
' let
'Получатель

'Получатель
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set Receiver(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Receiver", Receiver, NewValue
On Error Resume Next
m_Receiver_ID = ""
m_Receiver_ID = NewValue.id
' set   m_Receiver= newValue
End If
End Property

'Получатель
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Receiver
Public Property Get Receiver() As Object
 LoadFromDatabase
 AccessTime = Now
If m_Receiver_ID <> "" Then
  Set Receiver = Application.Manager.GetInstanceObject(Right(m_Receiver_ID, 38))
 Exit Property
End If
  ' set Receiver = m_Receiver
End Property
' let
'Вес ПО

'Вес ПО
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let PPOWeight(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PPOWeight", PPOWeight, NewValue

   m_PPOWeight = NewValue
End If
End Property

'Вес ПО
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. PPOWeight
Public Property Get PPOWeight() As Double
 LoadFromDatabase
 AccessTime = Now

   PPOWeight = m_PPOWeight
End Property
' let
'Ед. изм. веса

'Ед. изм. веса
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set WeightEDIZM(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "WeightEDIZM", WeightEDIZM, NewValue
On Error Resume Next
m_WeightEDIZM_ID = ""
m_WeightEDIZM_ID = NewValue.id
'  set   m_WeightEDIZM= newValue
End If
End Property

'Ед. изм. веса
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. WeightEDIZM
Public Property Get WeightEDIZM() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_WeightEDIZM As Object
If m_WeightEDIZM_ID <> "" Then
  Set tmp_WeightEDIZM = Application.FindRowObject("ENTDIC_EDIZM", m_WeightEDIZM_ID)
  If tmp_WeightEDIZM Is Nothing Then
    m_WeightEDIZM_ID_BRIEF = ""
  Else
    m_WeightEDIZM_ID_BRIEF = tmp_WeightEDIZM.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "ENTDIC_EDIZM" & m_WeightEDIZM_ID, tmp_WeightEDIZM
  Set WeightEDIZM = tmp_WeightEDIZM
  Exit Property
End If
  '  set WeightEDIZM = m_WeightEDIZM
End Property
' let
'Объем ПО

'Объем ПО
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let PPOVol(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PPOVol", PPOVol, NewValue

   m_PPOVol = NewValue
End If
End Property

'Объем ПО
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. PPOVol
Public Property Get PPOVol() As Double
 LoadFromDatabase
 AccessTime = Now

   PPOVol = m_PPOVol
End Property
' let
'Ед.изм. объема

'Ед.изм. объема
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set ValueEDIZM(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ValueEDIZM", ValueEDIZM, NewValue
On Error Resume Next
m_ValueEDIZM_ID = ""
m_ValueEDIZM_ID = NewValue.id
'  set   m_ValueEDIZM= newValue
End If
End Property

'Ед.изм. объема
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. ValueEDIZM
Public Property Get ValueEDIZM() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_ValueEDIZM As Object
If m_ValueEDIZM_ID <> "" Then
  Set tmp_ValueEDIZM = Application.FindRowObject("ENTDIC_EDIZM", m_ValueEDIZM_ID)
  If tmp_ValueEDIZM Is Nothing Then
    m_ValueEDIZM_ID_BRIEF = ""
  Else
    m_ValueEDIZM_ID_BRIEF = tmp_ValueEDIZM.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "ENTDIC_EDIZM" & m_ValueEDIZM_ID, tmp_ValueEDIZM
  Set ValueEDIZM = tmp_ValueEDIZM
  Exit Property
End If
  '  set ValueEDIZM = m_ValueEDIZM
End Property
' let
'ФИО Кладовщика

'ФИО Кладовщика
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let PassFIO(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PassFIO", PassFIO, NewValue

   m_PassFIO = NewValue
End If
End Property

'ФИО Кладовщика
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. PassFIO
Public Property Get PassFIO() As String
 LoadFromDatabase
 AccessTime = Now

   PassFIO = m_PassFIO
End Property
' let
'Дата передачи груза в вагон

'Дата передачи груза в вагон
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let PassDate(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PassDate", PassDate, NewValue

   m_PassDate = NewValue
End If
End Property

'Дата передачи груза в вагон
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. PassDate
Public Property Get PassDate() As Date
 LoadFromDatabase
 AccessTime = Now

   PassDate = m_PassDate
End Property
' let
'ФИО ВПН

'ФИО ВПН
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let RcvFIO(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "RcvFIO", RcvFIO, NewValue

   m_RcvFIO = NewValue
End If
End Property

'ФИО ВПН
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. RcvFIO
Public Property Get RcvFIO() As String
 LoadFromDatabase
 AccessTime = Now

   RcvFIO = m_RcvFIO
End Property
' let
'Дата получения груза в ПО

'Дата получения груза в ПО
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let RcvDate(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "RcvDate", RcvDate, NewValue

   m_RcvDate = NewValue
End If
End Property

'Дата получения груза в ПО
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. RcvDate
Public Property Get RcvDate() As Date
 LoadFromDatabase
 AccessTime = Now

   RcvDate = m_RcvDate
End Property
' let
'Кому передана информация

'Кому передана информация
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let InforRcvFIO(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "InforRcvFIO", InforRcvFIO, NewValue

   m_InforRcvFIO = NewValue
End If
End Property

'Кому передана информация
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. InforRcvFIO
Public Property Get InforRcvFIO() As String
 LoadFromDatabase
 AccessTime = Now

   InforRcvFIO = m_InforRcvFIO
End Property
' let
'Дата передачи информации

'Дата передачи информации
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let InfoDate(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "InfoDate", InfoDate, NewValue

   m_InfoDate = NewValue
End If
End Property

'Дата передачи информации
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. InfoDate
Public Property Get InfoDate() As Date
 LoadFromDatabase
 AccessTime = Now

   InfoDate = m_InfoDate
End Property
' let
'Способ передачи информации

'Способ передачи информации
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set InfoSendType(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "InfoSendType", InfoSendType, NewValue
On Error Resume Next
m_InfoSendType_ID = ""
m_InfoSendType_ID = NewValue.id
'  set   m_InfoSendType= newValue
End If
End Property

'Способ передачи информации
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. InfoSendType
Public Property Get InfoSendType() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_InfoSendType As Object
If m_InfoSendType_ID <> "" Then
  Set tmp_InfoSendType = Application.FindRowObject("PEKD_INFOSENDTYPE", m_InfoSendType_ID)
  If tmp_InfoSendType Is Nothing Then
    m_InfoSendType_ID_BRIEF = ""
  Else
    m_InfoSendType_ID_BRIEF = tmp_InfoSendType.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PEKD_INFOSENDTYPE" & m_InfoSendType_ID, tmp_InfoSendType
  Set InfoSendType = tmp_InfoSendType
  Exit Property
End If
  '  set InfoSendType = m_InfoSendType
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

  Set nvi = nv.Add("SendDate", m_SendDate)
nvi.ValueType = adDate
  Set nvi = nv.Add("RcvWaitDate", m_RcvWaitDate)
nvi.ValueType = adDate
 ' Reference to PEKD_TRAINS
    If m_trainNo_ID = "" Then
       Set nvi = nv.Add("trainNo", "")
    Else
       Set nvi = nv.Add("trainNo", m_trainNo_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("vagNo", m_vagNo)
nvi.ValueSize = 8
 ' Reference to PEKD_DEPT
    If m_PathFilial_ID = "" Then
       Set nvi = nv.Add("PathFilial", "")
    Else
       Set nvi = nv.Add("PathFilial", m_PathFilial_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to object
    If m_TransSupplier_ID = "" Then
       Set nvi = nv.Add("TransSupplier", "")
    Else
       Set nvi = nv.Add("TransSupplier", m_TransSupplier_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to PEKD_DIRECTION
    If m_TheDirection_ID = "" Then
       Set nvi = nv.Add("TheDirection", "")
    Else
       Set nvi = nv.Add("TheDirection", m_TheDirection_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("PPONum", m_PPONum)
nvi.ValueType = adInteger
 ' Reference to PEKD_DIRSTATION
    If m_DestStation_ID = "" Then
       Set nvi = nv.Add("DestStation", "")
    Else
       Set nvi = nv.Add("DestStation", m_DestStation_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to PEKD_POSTTYPE
    If m_PPODescription_ID = "" Then
       Set nvi = nv.Add("PPODescription", "")
    Else
       Set nvi = nv.Add("PPODescription", m_PPODescription_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to object
    If m_Receiver_ID = "" Then
       Set nvi = nv.Add("Receiver", "")
    Else
       Set nvi = nv.Add("Receiver", m_Receiver_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("PPOWeight", m_PPOWeight)
nvi.ValueType = adDouble
 ' Reference to ENTDIC_EDIZM
    If m_WeightEDIZM_ID = "" Then
       Set nvi = nv.Add("WeightEDIZM", "")
    Else
       Set nvi = nv.Add("WeightEDIZM", m_WeightEDIZM_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("PPOVol", m_PPOVol)
nvi.ValueType = adDouble
 ' Reference to ENTDIC_EDIZM
    If m_ValueEDIZM_ID = "" Then
       Set nvi = nv.Add("ValueEDIZM", "")
    Else
       Set nvi = nv.Add("ValueEDIZM", m_ValueEDIZM_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("PassFIO", m_PassFIO)
nvi.ValueSize = 255
  Set nvi = nv.Add("PassDate", m_PassDate)
nvi.ValueType = adDate
  Set nvi = nv.Add("RcvFIO", m_RcvFIO)
nvi.ValueSize = 255
  Set nvi = nv.Add("RcvDate", m_RcvDate)
nvi.ValueType = adDate
  Set nvi = nv.Add("InforRcvFIO", m_InforRcvFIO)
nvi.ValueSize = 255
  Set nvi = nv.Add("InfoDate", m_InfoDate)
nvi.ValueType = adDate
 ' Reference to PEKD_INFOSENDTYPE
    If m_InfoSendType_ID = "" Then
       Set nvi = nv.Add("InfoSendType", "")
    Else
       Set nvi = nv.Add("InfoSendType", m_InfoSendType_ID)
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
 m_Brief = m_Brief & vagNo & "; "
   If TheDirection Is Nothing Then
     m_Brief = m_Brief & "{" & m_TheDirection_ID_BRIEF & "}; "
   Else
     m_Brief = m_Brief & "{" & TheDirection.Brief & "}; "
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

m_SendDate = nv.item("SendDate").Value
m_RcvWaitDate = nv.item("RcvWaitDate").Value
  m_trainNo_ID = nv.item("trainNo").Value
m_vagNo = nv.item("vagNo").Value
  m_PathFilial_ID = nv.item("PathFilial").Value
  m_TransSupplier_ID = nv.item("TransSupplier").Value
  m_TheDirection_ID = nv.item("TheDirection").Value
m_PPONum = nv.item("PPONum").Value
  m_DestStation_ID = nv.item("DestStation").Value
  m_PPODescription_ID = nv.item("PPODescription").Value
  m_Receiver_ID = nv.item("Receiver").Value
m_PPOWeight = nv.item("PPOWeight").Value
  m_WeightEDIZM_ID = nv.item("WeightEDIZM").Value
m_PPOVol = nv.item("PPOVol").Value
  m_ValueEDIZM_ID = nv.item("ValueEDIZM").Value
m_PassFIO = nv.item("PassFIO").Value
m_PassDate = nv.item("PassDate").Value
m_RcvFIO = nv.item("RcvFIO").Value
m_RcvDate = nv.item("RcvDate").Value
m_InforRcvFIO = nv.item("InforRcvFIO").Value
m_InfoDate = nv.item("InfoDate").Value
  m_InfoSendType_ID = nv.item("InfoSendType").Value
Else

m_SendDate = nv.Fields("SendDate").Value
m_RcvWaitDate = nv.Fields("RcvWaitDate").Value
  m_trainNo_ID = nv.Fields("trainNo").Value
m_vagNo = nv.Fields("vagNo").Value
  m_PathFilial_ID = nv.Fields("PathFilial").Value
  m_TransSupplier_ID = nv.Fields("TransSupplier").Value
  m_TheDirection_ID = nv.Fields("TheDirection").Value
m_PPONum = nv.Fields("PPONum").Value
  m_DestStation_ID = nv.Fields("DestStation").Value
  m_PPODescription_ID = nv.Fields("PPODescription").Value
  m_Receiver_ID = nv.Fields("Receiver").Value
m_PPOWeight = nv.Fields("PPOWeight").Value
  m_WeightEDIZM_ID = nv.Fields("WeightEDIZM").Value
m_PPOVol = nv.Fields("PPOVol").Value
  m_ValueEDIZM_ID = nv.Fields("ValueEDIZM").Value
m_PassFIO = nv.Fields("PassFIO").Value
m_PassDate = nv.Fields("PassDate").Value
m_RcvFIO = nv.Fields("RcvFIO").Value
m_RcvDate = nv.Fields("RcvDate").Value
m_InforRcvFIO = nv.Fields("InforRcvFIO").Value
m_InfoDate = nv.Fields("InfoDate").Value
  m_InfoSendType_ID = nv.Fields("InfoSendType").Value
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
   Dim o As pekmsg_path
   Set o = New pekmsg_path
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
  err.Raise err.Number, "pekmsg_path.Save", err.Description
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
  err.Raise err.Number, "pekmsg_path.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("pekmsg_path", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "pekmsg_path.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "pekmsg_path", id
Exit Sub
bye:
  err.Raise err.Number, "pekmsg_path.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 m_trainNo_ID = ""
 Set m_trainNo = Nothing
 m_PathFilial_ID = ""
 Set m_PathFilial = Nothing
 m_TransSupplier_ID = ""
 Set m_TransSupplier = Nothing
 m_TheDirection_ID = ""
 Set m_TheDirection = Nothing
 m_DestStation_ID = ""
 Set m_DestStation = Nothing
 m_PPODescription_ID = ""
 Set m_PPODescription = Nothing
 m_Receiver_ID = ""
 Set m_Receiver = Nothing
 m_WeightEDIZM_ID = ""
 Set m_WeightEDIZM = Nothing
 m_ValueEDIZM_ID = ""
 Set m_ValueEDIZM = Nothing
 m_InfoSendType_ID = ""
 Set m_InfoSendType = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "pekmsg_path.CloseClass"
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
  SendDate = node.Attributes.getNamedItem("SENDDATE").nodeValue
  RcvWaitDate = node.Attributes.getNamedItem("RCVWAITDATE").nodeValue
  Set trainNo = Nothing
  m_trainNo_ID = node.Attributes.getNamedItem("TRAINNO").nodeValue
  m_trainNo_ID_BRIEF = node.Attributes.getNamedItem("TRAINNO_BRIEF").nodeValue
  vagNo = Replace(node.Attributes.getNamedItem("VAGNO").nodeValue, vbLf, vbCrLf)
  Set PathFilial = Nothing
  m_PathFilial_ID = node.Attributes.getNamedItem("PATHFILIAL").nodeValue
  m_PathFilial_ID_BRIEF = node.Attributes.getNamedItem("PATHFILIAL_BRIEF").nodeValue
  Set TransSupplier = Nothing
  m_TransSupplier_ID = node.Attributes.getNamedItem("TRANSSUPPLIER").nodeValue
  m_TransSupplier_ID_BRIEF = node.Attributes.getNamedItem("TRANSSUPPLIER_BRIEF").nodeValue
  Set TheDirection = Nothing
  m_TheDirection_ID = node.Attributes.getNamedItem("THEDIRECTION").nodeValue
  m_TheDirection_ID_BRIEF = node.Attributes.getNamedItem("THEDIRECTION_BRIEF").nodeValue
  PPONum = node.Attributes.getNamedItem("PPONUM").nodeValue
  Set DestStation = Nothing
  m_DestStation_ID = node.Attributes.getNamedItem("DESTSTATION").nodeValue
  m_DestStation_ID_BRIEF = node.Attributes.getNamedItem("DESTSTATION_BRIEF").nodeValue
  Set PPODescription = Nothing
  m_PPODescription_ID = node.Attributes.getNamedItem("PPODESCRIPTION").nodeValue
  m_PPODescription_ID_BRIEF = node.Attributes.getNamedItem("PPODESCRIPTION_BRIEF").nodeValue
  Set Receiver = Nothing
  m_Receiver_ID = node.Attributes.getNamedItem("RECEIVER").nodeValue
  m_Receiver_ID_BRIEF = node.Attributes.getNamedItem("RECEIVER_BRIEF").nodeValue
  PPOWeight = Val(Replace(node.Attributes.getNamedItem("PPOWEIGHT").nodeValue, vbLf, vbCrLf))
  Set WeightEDIZM = Nothing
  m_WeightEDIZM_ID = node.Attributes.getNamedItem("WEIGHTEDIZM").nodeValue
  m_WeightEDIZM_ID_BRIEF = node.Attributes.getNamedItem("WEIGHTEDIZM_BRIEF").nodeValue
  PPOVol = Val(Replace(node.Attributes.getNamedItem("PPOVOL").nodeValue, vbLf, vbCrLf))
  Set ValueEDIZM = Nothing
  m_ValueEDIZM_ID = node.Attributes.getNamedItem("VALUEEDIZM").nodeValue
  m_ValueEDIZM_ID_BRIEF = node.Attributes.getNamedItem("VALUEEDIZM_BRIEF").nodeValue
  PassFIO = Replace(node.Attributes.getNamedItem("PASSFIO").nodeValue, vbLf, vbCrLf)
  PassDate = node.Attributes.getNamedItem("PASSDATE").nodeValue
  RcvFIO = Replace(node.Attributes.getNamedItem("RCVFIO").nodeValue, vbLf, vbCrLf)
  RcvDate = node.Attributes.getNamedItem("RCVDATE").nodeValue
  InforRcvFIO = Replace(node.Attributes.getNamedItem("INFORRCVFIO").nodeValue, vbLf, vbCrLf)
  InfoDate = node.Attributes.getNamedItem("INFODATE").nodeValue
  Set InfoSendType = Nothing
  m_InfoSendType_ID = node.Attributes.getNamedItem("INFOSENDTYPE").nodeValue
  m_InfoSendType_ID_BRIEF = node.Attributes.getNamedItem("INFOSENDTYPE_BRIEF").nodeValue
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
  node.setAttribute "SENDDATE", CDbl(SendDate)
  node.setAttribute "RCVWAITDATE", CDbl(RcvWaitDate)
  node.setAttribute "TRAINNO", m_trainNo_ID
  If Not (trainNo Is Nothing) Then
    node.setAttribute "TRAINNO_BRIEF", trainNo.Brief
  Else
    node.setAttribute "TRAINNO_BRIEF", m_trainNo_ID_BRIEF
  End If
  node.setAttribute "VAGNO", vagNo
  node.setAttribute "PATHFILIAL", m_PathFilial_ID
  If Not (PathFilial Is Nothing) Then
    node.setAttribute "PATHFILIAL_BRIEF", PathFilial.Brief
  Else
    node.setAttribute "PATHFILIAL_BRIEF", m_PathFilial_ID_BRIEF
  End If
  node.setAttribute "TRANSSUPPLIER", m_TransSupplier_ID
  If Not (TransSupplier Is Nothing) Then
    node.setAttribute "TRANSSUPPLIER_BRIEF", TransSupplier.Brief
  Else
    node.setAttribute "TRANSSUPPLIER_BRIEF", m_TransSupplier_ID_BRIEF
  End If
  node.setAttribute "THEDIRECTION", m_TheDirection_ID
  If Not (TheDirection Is Nothing) Then
    node.setAttribute "THEDIRECTION_BRIEF", TheDirection.Brief
  Else
    node.setAttribute "THEDIRECTION_BRIEF", m_TheDirection_ID_BRIEF
  End If
  node.setAttribute "PPONUM", PPONum
  node.setAttribute "DESTSTATION", m_DestStation_ID
  If Not (DestStation Is Nothing) Then
    node.setAttribute "DESTSTATION_BRIEF", DestStation.Brief
  Else
    node.setAttribute "DESTSTATION_BRIEF", m_DestStation_ID_BRIEF
  End If
  node.setAttribute "PPODESCRIPTION", m_PPODescription_ID
  If Not (PPODescription Is Nothing) Then
    node.setAttribute "PPODESCRIPTION_BRIEF", PPODescription.Brief
  Else
    node.setAttribute "PPODESCRIPTION_BRIEF", m_PPODescription_ID_BRIEF
  End If
  node.setAttribute "RECEIVER", m_Receiver_ID
  If Not (Receiver Is Nothing) Then
    node.setAttribute "RECEIVER_BRIEF", Receiver.Brief
  Else
    node.setAttribute "RECEIVER_BRIEF", m_Receiver_ID_BRIEF
  End If
  node.setAttribute "PPOWEIGHT", Replace(CStr(PPOWeight), ",", ".")
  node.setAttribute "WEIGHTEDIZM", m_WeightEDIZM_ID
  If Not (WeightEDIZM Is Nothing) Then
    node.setAttribute "WEIGHTEDIZM_BRIEF", WeightEDIZM.Brief
  Else
    node.setAttribute "WEIGHTEDIZM_BRIEF", m_WeightEDIZM_ID_BRIEF
  End If
  node.setAttribute "PPOVOL", Replace(CStr(PPOVol), ",", ".")
  node.setAttribute "VALUEEDIZM", m_ValueEDIZM_ID
  If Not (ValueEDIZM Is Nothing) Then
    node.setAttribute "VALUEEDIZM_BRIEF", ValueEDIZM.Brief
  Else
    node.setAttribute "VALUEEDIZM_BRIEF", m_ValueEDIZM_ID_BRIEF
  End If
  node.setAttribute "PASSFIO", PassFIO
  node.setAttribute "PASSDATE", CDbl(PassDate)
  node.setAttribute "RCVFIO", RcvFIO
  node.setAttribute "RCVDATE", CDbl(RcvDate)
  node.setAttribute "INFORRCVFIO", InforRcvFIO
  node.setAttribute "INFODATE", CDbl(InfoDate)
  node.setAttribute "INFOSENDTYPE", m_InfoSendType_ID
  If Not (InfoSendType Is Nothing) Then
    node.setAttribute "INFOSENDTYPE_BRIEF", InfoSendType.Brief
  Else
    node.setAttribute "INFOSENDTYPE_BRIEF", m_InfoSendType_ID_BRIEF
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
m_IsLocked = Application.MTZSession.IsLocked("pekmsg_path", id)
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
OK = Application.MTZSession.LockResource("pekmsg_path", id, Permanent)
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
Application.MTZSession.UnLockResource "pekmsg_path", id
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
CanLock = Application.MTZSession.CanLock("pekmsg_path", id)
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



