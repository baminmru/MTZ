VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "REPD_RecvQ"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'строка раздела Очередь полученых реплик
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
Private m_TheRowID As String
Private m_Received As Date
Private m_Provider As Object
Dim m_Provider_ID As String
Dim m_Provider_ID_BRIEF As String
Private m_RecvSize As Long
Private m_SourceSrv As Object
Dim m_SourceSrv_ID As String
Dim m_SourceSrv_ID_BRIEF As String
Private m_DestSrv As Object
Dim m_DestSrv_ID As String
Dim m_DestSrv_ID_BRIEF As String
Private m_Acknowelge As enumBoolean
Private m_ReplicaPackID As String
Private m_PartCount As Long
Private m_PartNumber As Long
Private m_FileName As String
Private m_Completed As enumBoolean
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
  PartName = "REPD_RecvQ"
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
  m_Application.Logger.Message "REPD_RecvQ.Init"
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
'TheRowID

'TheRowID
'Parameters:
'[IN]   newValue , тип параметра: string  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TheRowID(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheRowID", TheRowID, NewValue

   m_TheRowID = NewValue
End If
End Property

'TheRowID
'Parameters:
' параметров нет
'Returns:
'  значение типа string
'See Also:
'Example:
' dim variable as string
' variable = me. TheRowID
Public Property Get TheRowID() As String
 LoadFromDatabase
 AccessTime = Now

   TheRowID = m_TheRowID
End Property
' let
'Received

'Received
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Received(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Received", Received, NewValue

   m_Received = NewValue
End If
End Property

'Received
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. Received
Public Property Get Received() As Date
 LoadFromDatabase
 AccessTime = Now

   Received = m_Received
End Property
' let
'Provider

'Provider
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set Provider(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Provider", Provider, NewValue
On Error Resume Next
m_Provider_ID = ""
m_Provider_ID = NewValue.id
'  set   m_Provider= newValue
End If
End Property

'Provider
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Provider
Public Property Get Provider() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_Provider As Object
If m_Provider_ID <> "" Then
  Set tmp_Provider = Application.FindRowObject("REPD_PROV", m_Provider_ID)
  If tmp_Provider Is Nothing Then
    m_Provider_ID_BRIEF = ""
  Else
    m_Provider_ID_BRIEF = tmp_Provider.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "REPD_PROV" & m_Provider_ID, tmp_Provider
  Set Provider = tmp_Provider
  Exit Property
End If
  '  set Provider = m_Provider
End Property
' let
'RecvSize

'RecvSize
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let RecvSize(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "RecvSize", RecvSize, NewValue

   m_RecvSize = NewValue
End If
End Property

'RecvSize
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. RecvSize
Public Property Get RecvSize() As Long
 LoadFromDatabase
 AccessTime = Now

   RecvSize = m_RecvSize
End Property
' let
'SourceSrv

'SourceSrv
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set SourceSrv(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SourceSrv", SourceSrv, NewValue
On Error Resume Next
m_SourceSrv_ID = ""
m_SourceSrv_ID = NewValue.id
'  set   m_SourceSrv= newValue
End If
End Property

'SourceSrv
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. SourceSrv
Public Property Get SourceSrv() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_SourceSrv As Object
If m_SourceSrv_ID <> "" Then
  Set tmp_SourceSrv = Application.FindRowObject("REPD_SRV", m_SourceSrv_ID)
  If tmp_SourceSrv Is Nothing Then
    m_SourceSrv_ID_BRIEF = ""
  Else
    m_SourceSrv_ID_BRIEF = tmp_SourceSrv.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "REPD_SRV" & m_SourceSrv_ID, tmp_SourceSrv
  Set SourceSrv = tmp_SourceSrv
  Exit Property
End If
  '  set SourceSrv = m_SourceSrv
End Property
' let
'DestSrv

'DestSrv
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set DestSrv(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DestSrv", DestSrv, NewValue
On Error Resume Next
m_DestSrv_ID = ""
m_DestSrv_ID = NewValue.id
'  set   m_DestSrv= newValue
End If
End Property

'DestSrv
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. DestSrv
Public Property Get DestSrv() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_DestSrv As Object
If m_DestSrv_ID <> "" Then
  Set tmp_DestSrv = Application.FindRowObject("REPD_SRV", m_DestSrv_ID)
  If tmp_DestSrv Is Nothing Then
    m_DestSrv_ID_BRIEF = ""
  Else
    m_DestSrv_ID_BRIEF = tmp_DestSrv.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "REPD_SRV" & m_DestSrv_ID, tmp_DestSrv
  Set DestSrv = tmp_DestSrv
  Exit Property
End If
  '  set DestSrv = m_DestSrv
End Property
' let
'Acknowelge

'Acknowelge
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Acknowelge(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Acknowelge", Acknowelge, NewValue

   m_Acknowelge = NewValue
End If
End Property

'Acknowelge
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. Acknowelge
Public Property Get Acknowelge() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   Acknowelge = m_Acknowelge
End Property
' let
'ReplicaPackID

'ReplicaPackID
'Parameters:
'[IN]   newValue , тип параметра: string  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ReplicaPackID(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ReplicaPackID", ReplicaPackID, NewValue

   m_ReplicaPackID = NewValue
End If
End Property

'ReplicaPackID
'Parameters:
' параметров нет
'Returns:
'  значение типа string
'See Also:
'Example:
' dim variable as string
' variable = me. ReplicaPackID
Public Property Get ReplicaPackID() As String
 LoadFromDatabase
 AccessTime = Now

   ReplicaPackID = m_ReplicaPackID
End Property
' let
'Количество частей

'Количество частей
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let PartCount(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PartCount", PartCount, NewValue

   m_PartCount = NewValue
End If
End Property

'Количество частей
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. PartCount
Public Property Get PartCount() As Long
 LoadFromDatabase
 AccessTime = Now

   PartCount = m_PartCount
End Property
' let
'Часть

'Часть
'Parameters:
'[IN]   newValue , тип параметра: long  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let PartNumber(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PartNumber", PartNumber, NewValue

   m_PartNumber = NewValue
End If
End Property

'Часть
'Parameters:
' параметров нет
'Returns:
'  значение типа long
'See Also:
'Example:
' dim variable as long
' variable = me. PartNumber
Public Property Get PartNumber() As Long
 LoadFromDatabase
 AccessTime = Now

   PartNumber = m_PartNumber
End Property
' let
'FileName

'FileName
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FileName(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FileName", FileName, NewValue

   m_FileName = NewValue
End If
End Property

'FileName
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FileName
Public Property Get FileName() As String
 LoadFromDatabase
 AccessTime = Now

   FileName = m_FileName
End Property
' let
'Completed

'Completed
'Parameters:
'[IN]   newValue , тип параметра: enumBoolean  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Completed(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Completed", Completed, NewValue

   m_Completed = NewValue
End If
End Property

'Completed
'Parameters:
' параметров нет
'Returns:
'  объект класса enumBoolean
'  ,или Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. Completed
Public Property Get Completed() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   Completed = m_Completed
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

  Set nvi = nv.Add("TheRowID", m_TheRowID)
  Set nvi = nv.Add("Received", m_Received)
nvi.ValueType = adDBTimeStamp
 ' Reference to REPD_PROV
    If m_Provider_ID = "" Then
       Set nvi = nv.Add("Provider", "")
    Else
       Set nvi = nv.Add("Provider", m_Provider_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("RecvSize", m_RecvSize)
nvi.ValueType = adInteger
 ' Reference to REPD_SRV
    If m_SourceSrv_ID = "" Then
       Set nvi = nv.Add("SourceSrv", "")
    Else
       Set nvi = nv.Add("SourceSrv", m_SourceSrv_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to REPD_SRV
    If m_DestSrv_ID = "" Then
       Set nvi = nv.Add("DestSrv", "")
    Else
       Set nvi = nv.Add("DestSrv", m_DestSrv_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("Acknowelge", m_Acknowelge)
nvi.ValueType = adInteger
  Set nvi = nv.Add("ReplicaPackID", m_ReplicaPackID)
  Set nvi = nv.Add("PartCount", m_PartCount)
nvi.ValueType = adInteger
  Set nvi = nv.Add("PartNumber", m_PartNumber)
nvi.ValueType = adInteger
  Set nvi = nv.Add("FileName", m_FileName)
nvi.ValueSize = 1024
  Set nvi = nv.Add("Completed", m_Completed)
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
   If SourceSrv Is Nothing Then
     m_Brief = m_Brief & "{" & m_SourceSrv_ID_BRIEF & "}; "
   Else
     m_Brief = m_Brief & "{" & SourceSrv.Brief & "}; "
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

m_TheRowID = nv.item("TheRowID").Value
m_Received = nv.item("Received").Value
  m_Provider_ID = nv.item("Provider").Value
m_RecvSize = nv.item("RecvSize").Value
  m_SourceSrv_ID = nv.item("SourceSrv").Value
  m_DestSrv_ID = nv.item("DestSrv").Value
m_Acknowelge = nv.item("Acknowelge").Value
m_ReplicaPackID = nv.item("ReplicaPackID").Value
m_PartCount = nv.item("PartCount").Value
m_PartNumber = nv.item("PartNumber").Value
m_FileName = nv.item("FileName").Value
m_Completed = nv.item("Completed").Value
Else

m_TheRowID = nv.Fields("TheRowID").Value
m_Received = nv.Fields("Received").Value
  m_Provider_ID = nv.Fields("Provider").Value
m_RecvSize = nv.Fields("RecvSize").Value
  m_SourceSrv_ID = nv.Fields("SourceSrv").Value
  m_DestSrv_ID = nv.Fields("DestSrv").Value
m_Acknowelge = nv.Fields("Acknowelge").Value
m_ReplicaPackID = nv.Fields("ReplicaPackID").Value
m_PartCount = nv.Fields("PartCount").Value
m_PartNumber = nv.Fields("PartNumber").Value
m_FileName = nv.Fields("FileName").Value
m_Completed = nv.Fields("Completed").Value
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
   Dim o As REPD_RecvQ
   Set o = New REPD_RecvQ
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
  err.Raise err.Number, "REPD_RecvQ.Save", err.Description
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
  err.Raise err.Number, "REPD_RecvQ.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("REPD_RecvQ", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "REPD_RecvQ.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "REPD_RecvQ", id
Exit Sub
bye:
  err.Raise err.Number, "REPD_RecvQ.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 m_Provider_ID = ""
 Set m_Provider = Nothing
 m_SourceSrv_ID = ""
 Set m_SourceSrv = Nothing
 m_DestSrv_ID = ""
 Set m_DestSrv = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "REPD_RecvQ.CloseClass"
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
  TheRowID = Replace(node.Attributes.getNamedItem("THEROWID").nodeValue, vbLf, vbCrLf)
  Received = node.Attributes.getNamedItem("RECEIVED").nodeValue
  Set Provider = Nothing
  m_Provider_ID = node.Attributes.getNamedItem("PROVIDER").nodeValue
  m_Provider_ID_BRIEF = node.Attributes.getNamedItem("PROVIDER_BRIEF").nodeValue
  RecvSize = node.Attributes.getNamedItem("RECVSIZE").nodeValue
  Set SourceSrv = Nothing
  m_SourceSrv_ID = node.Attributes.getNamedItem("SOURCESRV").nodeValue
  m_SourceSrv_ID_BRIEF = node.Attributes.getNamedItem("SOURCESRV_BRIEF").nodeValue
  Set DestSrv = Nothing
  m_DestSrv_ID = node.Attributes.getNamedItem("DESTSRV").nodeValue
  m_DestSrv_ID_BRIEF = node.Attributes.getNamedItem("DESTSRV_BRIEF").nodeValue
  Acknowelge = node.Attributes.getNamedItem("ACKNOWELGE").nodeValue
  ReplicaPackID = Replace(node.Attributes.getNamedItem("REPLICAPACKID").nodeValue, vbLf, vbCrLf)
  PartCount = node.Attributes.getNamedItem("PARTCOUNT").nodeValue
  PartNumber = node.Attributes.getNamedItem("PARTNUMBER").nodeValue
  FileName = Replace(node.Attributes.getNamedItem("FILENAME").nodeValue, vbLf, vbCrLf)
  Completed = node.Attributes.getNamedItem("COMPLETED").nodeValue
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
  node.setAttribute "THEROWID", TheRowID
  node.setAttribute "RECEIVED", CDbl(Received)
  node.setAttribute "PROVIDER", m_Provider_ID
  If Not (Provider Is Nothing) Then
    node.setAttribute "PROVIDER_BRIEF", Provider.Brief
  Else
    node.setAttribute "PROVIDER_BRIEF", m_Provider_ID_BRIEF
  End If
  node.setAttribute "RECVSIZE", RecvSize
  node.setAttribute "SOURCESRV", m_SourceSrv_ID
  If Not (SourceSrv Is Nothing) Then
    node.setAttribute "SOURCESRV_BRIEF", SourceSrv.Brief
  Else
    node.setAttribute "SOURCESRV_BRIEF", m_SourceSrv_ID_BRIEF
  End If
  node.setAttribute "DESTSRV", m_DestSrv_ID
  If Not (DestSrv Is Nothing) Then
    node.setAttribute "DESTSRV_BRIEF", DestSrv.Brief
  Else
    node.setAttribute "DESTSRV_BRIEF", m_DestSrv_ID_BRIEF
  End If
  node.setAttribute "ACKNOWELGE", Acknowelge
  node.setAttribute "REPLICAPACKID", ReplicaPackID
  node.setAttribute "PARTCOUNT", PartCount
  node.setAttribute "PARTNUMBER", PartNumber
  node.setAttribute "FILENAME", FileName
  node.setAttribute "COMPLETED", Completed
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
m_IsLocked = Application.MTZSession.IsLocked("REPD_RecvQ", id)
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
OK = Application.MTZSession.LockResource("REPD_RecvQ", id, Permanent)
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
Application.MTZSession.UnLockResource "REPD_RecvQ", id
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
CanLock = Application.MTZSession.CanLock("REPD_RecvQ", id)
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



