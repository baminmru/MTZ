VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "WMSG_NOM"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'строка раздела Номенклатура товаров
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
Private m_TheNumber As String
Private m_TheNumberDop As String
Private m_TheClass As Object
Dim m_TheClass_ID As String
Dim m_TheClass_ID_BRIEF As String
Private m_TheCategory As Object
Dim m_TheCategory_ID As String
Dim m_TheCategory_ID_BRIEF As String
Private m_TheType As Object
Dim m_TheType_ID As String
Dim m_TheType_ID_BRIEF As String
Private m_TheDefenition As String
Private m_TheComment As String
Private m_Supplier As Object
Dim m_Supplier_ID As String
Dim m_Supplier_ID_BRIEF As String
Private m_SupCode As String
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
  PartName = "WMSG_NOM"
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
  m_Application.Logger.Message "WMSG_NOM.Init"
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
'№ товара

'№ товара
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TheNumber(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheNumber", TheNumber, NewValue

   m_TheNumber = NewValue
End If
End Property

'№ товара
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. TheNumber
Public Property Get TheNumber() As String
 LoadFromDatabase
 AccessTime = Now

   TheNumber = m_TheNumber
End Property
' let
'Дополнительный № товара

'Дополнительный № товара
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TheNumberDop(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheNumberDop", TheNumberDop, NewValue

   m_TheNumberDop = NewValue
End If
End Property

'Дополнительный № товара
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. TheNumberDop
Public Property Get TheNumberDop() As String
 LoadFromDatabase
 AccessTime = Now

   TheNumberDop = m_TheNumberDop
End Property
' let
'Класс

'Класс
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TheClass(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheClass", TheClass, NewValue
On Error Resume Next
m_TheClass_ID = ""
m_TheClass_ID = NewValue.id
'  set   m_TheClass= newValue
End If
End Property

'Класс
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TheClass
Public Property Get TheClass() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TheClass As Object
If m_TheClass_ID <> "" Then
  Set tmp_TheClass = Application.FindRowObject("WMSG_CLASS", m_TheClass_ID)
  If tmp_TheClass Is Nothing Then
    m_TheClass_ID_BRIEF = ""
  Else
    m_TheClass_ID_BRIEF = tmp_TheClass.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "WMSG_CLASS" & m_TheClass_ID, tmp_TheClass
  Set TheClass = tmp_TheClass
  Exit Property
End If
  '  set TheClass = m_TheClass
End Property
' let
'Категория

'Категория
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set TheCategory(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheCategory", TheCategory, NewValue
On Error Resume Next
m_TheCategory_ID = ""
m_TheCategory_ID = NewValue.id
'  set   m_TheCategory= newValue
End If
End Property

'Категория
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TheCategory
Public Property Get TheCategory() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TheCategory As Object
If m_TheCategory_ID <> "" Then
  Set tmp_TheCategory = Application.FindRowObject("WMSG_CAT", m_TheCategory_ID)
  If tmp_TheCategory Is Nothing Then
    m_TheCategory_ID_BRIEF = ""
  Else
    m_TheCategory_ID_BRIEF = tmp_TheCategory.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "WMSG_CAT" & m_TheCategory_ID, tmp_TheCategory
  Set TheCategory = tmp_TheCategory
  Exit Property
End If
  '  set TheCategory = m_TheCategory
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
Public Property Set TheType(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheType", TheType, NewValue
On Error Resume Next
m_TheType_ID = ""
m_TheType_ID = NewValue.id
'  set   m_TheType= newValue
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
' Set variable = me. TheType
Public Property Get TheType() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TheType As Object
If m_TheType_ID <> "" Then
  Set tmp_TheType = Application.FindRowObject("WMSG_TYPE", m_TheType_ID)
  If tmp_TheType Is Nothing Then
    m_TheType_ID_BRIEF = ""
  Else
    m_TheType_ID_BRIEF = tmp_TheType.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "WMSG_TYPE" & m_TheType_ID, tmp_TheType
  Set TheType = tmp_TheType
  Exit Property
End If
  '  set TheType = m_TheType
End Property
' let
'Описание

'Описание
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TheDefenition(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheDefenition", TheDefenition, NewValue

   m_TheDefenition = NewValue
End If
End Property

'Описание
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. TheDefenition
Public Property Get TheDefenition() As String
 LoadFromDatabase
 AccessTime = Now

   TheDefenition = m_TheDefenition
End Property
' let
'Комментарии

'Комментарии
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
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

'Комментарии
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. TheComment
Public Property Get TheComment() As String
 LoadFromDatabase
 AccessTime = Now

   TheComment = m_TheComment
End Property
' let
'Поклажедатель

'Поклажедатель
'Parameters:
'[IN]   newValue , тип параметра: object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Set Supplier(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Supplier", Supplier, NewValue
On Error Resume Next
m_Supplier_ID = ""
m_Supplier_ID = NewValue.id
'  set   m_Supplier= newValue
End If
End Property

'Поклажедатель
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Supplier
Public Property Get Supplier() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_Supplier As Object
If m_Supplier_ID <> "" Then
  Set tmp_Supplier = Application.FindRowObject("WMSK_DEF", m_Supplier_ID)
  If tmp_Supplier Is Nothing Then
    m_Supplier_ID_BRIEF = ""
  Else
    m_Supplier_ID_BRIEF = tmp_Supplier.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "WMSK_DEF" & m_Supplier_ID, tmp_Supplier
  Set Supplier = tmp_Supplier
  Exit Property
End If
  '  set Supplier = m_Supplier
End Property
' let
'Код поклажедателя

'Код поклажедателя
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let SupCode(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SupCode", SupCode, NewValue

   m_SupCode = NewValue
End If
End Property

'Код поклажедателя
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. SupCode
Public Property Get SupCode() As String
 LoadFromDatabase
 AccessTime = Now

   SupCode = m_SupCode
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

  Set nvi = nv.Add("TheNumber", m_TheNumber)
nvi.ValueSize = 255
  Set nvi = nv.Add("TheNumberDop", m_TheNumberDop)
nvi.ValueSize = 255
 ' Reference to WMSG_CLASS
    If m_TheClass_ID = "" Then
       Set nvi = nv.Add("TheClass", "")
    Else
       Set nvi = nv.Add("TheClass", m_TheClass_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to WMSG_CAT
    If m_TheCategory_ID = "" Then
       Set nvi = nv.Add("TheCategory", "")
    Else
       Set nvi = nv.Add("TheCategory", m_TheCategory_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to WMSG_TYPE
    If m_TheType_ID = "" Then
       Set nvi = nv.Add("TheType", "")
    Else
       Set nvi = nv.Add("TheType", m_TheType_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("TheDefenition", m_TheDefenition)
nvi.ValueSize = 255
  Set nvi = nv.Add("TheComment", m_TheComment)
nvi.ValueSize = 255
 ' Reference to WMSK_DEF
    If m_Supplier_ID = "" Then
       Set nvi = nv.Add("Supplier", "")
    Else
       Set nvi = nv.Add("Supplier", m_Supplier_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("SupCode", m_SupCode)
nvi.ValueSize = 255
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
 m_Brief = m_Brief & TheNumber & "; "
 m_Brief = m_Brief & TheDefenition & "; "
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

m_TheNumber = nv.item("TheNumber").Value
m_TheNumberDop = nv.item("TheNumberDop").Value
  m_TheClass_ID = nv.item("TheClass").Value
  m_TheCategory_ID = nv.item("TheCategory").Value
  m_TheType_ID = nv.item("TheType").Value
m_TheDefenition = nv.item("TheDefenition").Value
m_TheComment = nv.item("TheComment").Value
  m_Supplier_ID = nv.item("Supplier").Value
m_SupCode = nv.item("SupCode").Value
Else

m_TheNumber = nv.Fields("TheNumber").Value
m_TheNumberDop = nv.Fields("TheNumberDop").Value
  m_TheClass_ID = nv.Fields("TheClass").Value
  m_TheCategory_ID = nv.Fields("TheCategory").Value
  m_TheType_ID = nv.Fields("TheType").Value
m_TheDefenition = nv.Fields("TheDefenition").Value
m_TheComment = nv.Fields("TheComment").Value
  m_Supplier_ID = nv.Fields("Supplier").Value
m_SupCode = nv.Fields("SupCode").Value
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
   Dim o As WMSG_NOM
   Set o = New WMSG_NOM
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
  err.Raise err.Number, "WMSG_NOM.Save", err.Description
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
  err.Raise err.Number, "WMSG_NOM.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("WMSG_NOM", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "WMSG_NOM.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "WMSG_NOM", id
Exit Sub
bye:
  err.Raise err.Number, "WMSG_NOM.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 m_TheClass_ID = ""
 Set m_TheClass = Nothing
 m_TheCategory_ID = ""
 Set m_TheCategory = Nothing
 m_TheType_ID = ""
 Set m_TheType = Nothing
 m_Supplier_ID = ""
 Set m_Supplier = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "WMSG_NOM.CloseClass"
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
  TheNumber = Replace(node.Attributes.getNamedItem("THENUMBER").nodeValue, vbLf, vbCrLf)
  TheNumberDop = Replace(node.Attributes.getNamedItem("THENUMBERDOP").nodeValue, vbLf, vbCrLf)
  Set TheClass = Nothing
  m_TheClass_ID = node.Attributes.getNamedItem("THECLASS").nodeValue
  m_TheClass_ID_BRIEF = node.Attributes.getNamedItem("THECLASS_BRIEF").nodeValue
  Set TheCategory = Nothing
  m_TheCategory_ID = node.Attributes.getNamedItem("THECATEGORY").nodeValue
  m_TheCategory_ID_BRIEF = node.Attributes.getNamedItem("THECATEGORY_BRIEF").nodeValue
  Set TheType = Nothing
  m_TheType_ID = node.Attributes.getNamedItem("THETYPE").nodeValue
  m_TheType_ID_BRIEF = node.Attributes.getNamedItem("THETYPE_BRIEF").nodeValue
  TheDefenition = Replace(node.Attributes.getNamedItem("THEDEFENITION").nodeValue, vbLf, vbCrLf)
  TheComment = Replace(node.Attributes.getNamedItem("THECOMMENT").nodeValue, vbLf, vbCrLf)
  Set Supplier = Nothing
  m_Supplier_ID = node.Attributes.getNamedItem("SUPPLIER").nodeValue
  m_Supplier_ID_BRIEF = node.Attributes.getNamedItem("SUPPLIER_BRIEF").nodeValue
  SupCode = Replace(node.Attributes.getNamedItem("SUPCODE").nodeValue, vbLf, vbCrLf)
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
  node.setAttribute "THENUMBER", TheNumber
  node.setAttribute "THENUMBERDOP", TheNumberDop
  node.setAttribute "THECLASS", m_TheClass_ID
  If Not (TheClass Is Nothing) Then
    node.setAttribute "THECLASS_BRIEF", TheClass.Brief
  Else
    node.setAttribute "THECLASS_BRIEF", m_TheClass_ID_BRIEF
  End If
  node.setAttribute "THECATEGORY", m_TheCategory_ID
  If Not (TheCategory Is Nothing) Then
    node.setAttribute "THECATEGORY_BRIEF", TheCategory.Brief
  Else
    node.setAttribute "THECATEGORY_BRIEF", m_TheCategory_ID_BRIEF
  End If
  node.setAttribute "THETYPE", m_TheType_ID
  If Not (TheType Is Nothing) Then
    node.setAttribute "THETYPE_BRIEF", TheType.Brief
  Else
    node.setAttribute "THETYPE_BRIEF", m_TheType_ID_BRIEF
  End If
  node.setAttribute "THEDEFENITION", TheDefenition
  node.setAttribute "THECOMMENT", TheComment
  node.setAttribute "SUPPLIER", m_Supplier_ID
  If Not (Supplier Is Nothing) Then
    node.setAttribute "SUPPLIER_BRIEF", Supplier.Brief
  Else
    node.setAttribute "SUPPLIER_BRIEF", m_Supplier_ID_BRIEF
  End If
  node.setAttribute "SUPCODE", SupCode
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
m_IsLocked = Application.MTZSession.IsLocked("WMSG_NOM", id)
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
OK = Application.MTZSession.LockResource("WMSG_NOM", id, Permanent)
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
Application.MTZSession.UnLockResource "WMSG_NOM", id
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
CanLock = Application.MTZSession.CanLock("WMSG_NOM", id)
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



