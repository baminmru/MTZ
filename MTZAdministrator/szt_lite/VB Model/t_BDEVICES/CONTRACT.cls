VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CONTRACT"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'строка раздела Договорные установки
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
Private m_FLD12 As String
Private m_FLD13 As String
Private m_FLD14 As String
Private m_FLD15 As String
Private m_FLD16 As String
Private m_FLD17 As String
Private m_FLD18 As String
Private m_FLD19 As String
Private m_FLD20 As String
Private m_FLD21 As String
Private m_FLD22 As String
Private m_FLD23 As String
Private m_FLD24 As String
Private m_FLD25 As String
Private m_FLD26 As String
Private m_FLD27 As String
Private m_FLD28 As String
Private m_FLD29 As String
Private m_FLD30 As String
Private m_FLD31 As String
Private m_FLD32 As String
Private m_FLD33 As String
Private m_FLD34 As String
Private m_FLD35 As String
Private m_FLD36 As String
Private m_FLD37 As String
Private m_FLD40 As String
Private m_FLD41 As String
Private m_FLD42 As String
Private m_FLD43 As String
Private m_FLD45 As String
Private m_FLD46 As String
Private m_FLD47 As String
Private m_FLD48 As String
Private m_FLD49 As String
Private m_FLD50 As String
Private m_FLD51 As String
Private m_FLD52 As String
Private m_FLD53 As String
Private m_FLD54 As String
Private m_FLD55 As String
Private m_FLD56 As String
Private m_FLD57 As String
Private m_FLD58 As String
Private m_FLD59 As String
Private m_FLD60 As String
Private m_FLD61 As String
Private m_FLD62 As String
Private m_FLD63 As String
Private m_FLD64 As String
Private m_FLD65 As String
Private m_FLD66 As String
Private m_FLD67 As String
Private m_FLD68 As String
Private m_FLD69 As String
Private m_FLD70 As String
Private m_FLD71 As String
Private m_FLD72 As String
Private m_FLD73 As String
Private m_FLD81 As String
Private m_FLD82 As String
Private m_FLD83 As String
Private m_FLD84 As String
Private m_FLD85 As String
Private m_FLD86 As String
Private m_FLD87 As String
Private m_FLD88 As String
Private m_FLD89 As String
Private m_FLD90 As String
Private m_FLD92 As String
Private m_FLD93 As String
Private m_FLD94 As String
Private m_FLD95 As String
Private m_FLD96 As String
Private m_FLD97 As String
Private m_FLD98 As String
Private m_FLD99 As String
Private m_FLD100 As String
Private m_FLD101 As String
Private m_FLD102 As String
Private m_FLD103 As String
Private m_FLD104 As String
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
  PartName = "CONTRACT"
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
  m_Application.Logger.Message "CONTRACT.Init"
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
'№ прибора

'№ прибора
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD12(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD12", FLD12, NewValue

   m_FLD12 = NewValue
End If
End Property

'№ прибора
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD12
Public Property Get FLD12() As String
 LoadFromDatabase
 AccessTime = Now

   FLD12 = m_FLD12
End Property
' let
'№ключа

'№ключа
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD13(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD13", FLD13, NewValue

   m_FLD13 = NewValue
End If
End Property

'№ключа
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD13
Public Property Get FLD13() As String
 LoadFromDatabase
 AccessTime = Now

   FLD13 = m_FLD13
End Property
' let
'D20ОБ

'D20ОБ
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD14(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD14", FLD14, NewValue

   m_FLD14 = NewValue
End If
End Property

'D20ОБ
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD14
Public Property Get FLD14() As String
 LoadFromDatabase
 AccessTime = Now

   FLD14 = m_FLD14
End Property
' let
'D20ПР

'D20ПР
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD15(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD15", FLD15, NewValue

   m_FLD15 = NewValue
End If
End Property

'D20ПР
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD15
Public Property Get FLD15() As String
 LoadFromDatabase
 AccessTime = Now

   FLD15 = m_FLD15
End Property
' let
'DyГВС

'DyГВС
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD16(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD16", FLD16, NewValue

   m_FLD16 = NewValue
End If
End Property

'DyГВС
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD16
Public Property Get FLD16() As String
 LoadFromDatabase
 AccessTime = Now

   FLD16 = m_FLD16
End Property
' let
'DyОБР

'DyОБР
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD17(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD17", FLD17, NewValue

   m_FLD17 = NewValue
End If
End Property

'DyОБР
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD17
Public Property Get FLD17() As String
 LoadFromDatabase
 AccessTime = Now

   FLD17 = m_FLD17
End Property
' let
'DyПР

'DyПР
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD18(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD18", FLD18, NewValue

   m_FLD18 = NewValue
End If
End Property

'DyПР
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD18
Public Property Get FLD18() As String
 LoadFromDatabase
 AccessTime = Now

   FLD18 = m_FLD18
End Property
' let
'dРпрОБ

'dРпрОБ
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD19(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD19", FLD19, NewValue

   m_FLD19 = NewValue
End If
End Property

'dРпрОБ
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD19
Public Property Get FLD19() As String
 LoadFromDatabase
 AccessTime = Now

   FLD19 = m_FLD19
End Property
' let
'dРпрПР

'dРпрПР
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD20(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD20", FLD20, NewValue

   m_FLD20 = NewValue
End If
End Property

'dРпрПР
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD20
Public Property Get FLD20() As String
 LoadFromDatabase
 AccessTime = Now

   FLD20 = m_FLD20
End Property
' let
'G(гвс)ПР

'G(гвс)ПР
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD21(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD21", FLD21, NewValue

   m_FLD21 = NewValue
End If
End Property

'G(гвс)ПР
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD21
Public Property Get FLD21() As String
 LoadFromDatabase
 AccessTime = Now

   FLD21 = m_FLD21
End Property
' let
'Gгвс

'Gгвс
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD22(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD22", FLD22, NewValue

   m_FLD22 = NewValue
End If
End Property

'Gгвс
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD22
Public Property Get FLD22() As String
 LoadFromDatabase
 AccessTime = Now

   FLD22 = m_FLD22
End Property
' let
'Gоб(гвс min)

'Gоб(гвс min)
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD23(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD23", FLD23, NewValue

   m_FLD23 = NewValue
End If
End Property

'Gоб(гвс min)
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD23
Public Property Get FLD23() As String
 LoadFromDatabase
 AccessTime = Now

   FLD23 = m_FLD23
End Property
' let
'Gов

'Gов
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD24(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD24", FLD24, NewValue

   m_FLD24 = NewValue
End If
End Property

'Gов
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD24
Public Property Get FLD24() As String
 LoadFromDatabase
 AccessTime = Now

   FLD24 = m_FLD24
End Property
' let
'Gпр(гвс min)

'Gпр(гвс min)
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD25(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD25", FLD25, NewValue

   m_FLD25 = NewValue
End If
End Property

'Gпр(гвс min)
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD25
Public Property Get FLD25() As String
 LoadFromDatabase
 AccessTime = Now

   FLD25 = m_FLD25
End Property
' let
'Gпр_minОБ

'Gпр_minОБ
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD26(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD26", FLD26, NewValue

   m_FLD26 = NewValue
End If
End Property

'Gпр_minОБ
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD26
Public Property Get FLD26() As String
 LoadFromDatabase
 AccessTime = Now

   FLD26 = m_FLD26
End Property
' let
'Gпр_minПР

'Gпр_minПР
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD27(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD27", FLD27, NewValue

   m_FLD27 = NewValue
End If
End Property

'Gпр_minПР
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD27
Public Property Get FLD27() As String
 LoadFromDatabase
 AccessTime = Now

   FLD27 = m_FLD27
End Property
' let
'GпрОБ

'GпрОБ
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD28(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD28", FLD28, NewValue

   m_FLD28 = NewValue
End If
End Property

'GпрОБ
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD28
Public Property Get FLD28() As String
 LoadFromDatabase
 AccessTime = Now

   FLD28 = m_FLD28
End Property
' let
'GпрПР

'GпрПР
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD29(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD29", FLD29, NewValue

   m_FLD29 = NewValue
End If
End Property

'GпрПР
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD29
Public Property Get FLD29() As String
 LoadFromDatabase
 AccessTime = Now

   FLD29 = m_FLD29
End Property
' let
'Gут

'Gут
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD30(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD30", FLD30, NewValue

   m_FLD30 = NewValue
End If
End Property

'Gут
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD30
Public Property Get FLD30() As String
 LoadFromDatabase
 AccessTime = Now

   FLD30 = m_FLD30
End Property
' let
'д20ОБ

'д20ОБ
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD31(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD31", FLD31, NewValue

   m_FLD31 = NewValue
End If
End Property

'д20ОБ
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD31
Public Property Get FLD31() As String
 LoadFromDatabase
 AccessTime = Now

   FLD31 = m_FLD31
End Property
' let
'д20ПР

'д20ПР
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD32(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD32", FLD32, NewValue

   m_FLD32 = NewValue
End If
End Property

'д20ПР
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD32
Public Property Get FLD32() As String
 LoadFromDatabase
 AccessTime = Now

   FLD32 = m_FLD32
End Property
' let
'Договор

'Договор
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD33(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD33", FLD33, NewValue

   m_FLD33 = NewValue
End If
End Property

'Договор
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD33
Public Property Get FLD33() As String
 LoadFromDatabase
 AccessTime = Now

   FLD33 = m_FLD33
End Property
' let
'Договор G2

'Договор G2
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD34(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD34", FLD34, NewValue

   m_FLD34 = NewValue
End If
End Property

'Договор G2
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD34
Public Property Get FLD34() As String
 LoadFromDatabase
 AccessTime = Now

   FLD34 = m_FLD34
End Property
' let
'Договор G1

'Договор G1
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD35(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD35", FLD35, NewValue

   m_FLD35 = NewValue
End If
End Property

'Договор G1
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD35
Public Property Get FLD35() As String
 LoadFromDatabase
 AccessTime = Now

   FLD35 = m_FLD35
End Property
' let
'Источник

'Источник
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD36(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD36", FLD36, NewValue

   m_FLD36 = NewValue
End If
End Property

'Источник
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD36
Public Property Get FLD36() As String
 LoadFromDatabase
 AccessTime = Now

   FLD36 = m_FLD36
End Property
' let
'Магистраль

'Магистраль
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD37(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD37", FLD37, NewValue

   m_FLD37 = NewValue
End If
End Property

'Магистраль
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD37
Public Property Get FLD37() As String
 LoadFromDatabase
 AccessTime = Now

   FLD37 = m_FLD37
End Property
' let
'Расходомер

'Расходомер
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD40(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD40", FLD40, NewValue

   m_FLD40 = NewValue
End If
End Property

'Расходомер
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD40
Public Property Get FLD40() As String
 LoadFromDatabase
 AccessTime = Now

   FLD40 = m_FLD40
End Property
' let
'Расходомер ГВС

'Расходомер ГВС
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD41(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD41", FLD41, NewValue

   m_FLD41 = NewValue
End If
End Property

'Расходомер ГВС
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD41
Public Property Get FLD41() As String
 LoadFromDatabase
 AccessTime = Now

   FLD41 = m_FLD41
End Property
' let
'Робр

'Робр
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD42(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD42", FLD42, NewValue

   m_FLD42 = NewValue
End If
End Property

'Робр
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD42
Public Property Get FLD42() As String
 LoadFromDatabase
 AccessTime = Now

   FLD42 = m_FLD42
End Property
' let
'Рпр

'Рпр
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD43(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD43", FLD43, NewValue

   m_FLD43 = NewValue
End If
End Property

'Рпр
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD43
Public Property Get FLD43() As String
 LoadFromDatabase
 AccessTime = Now

   FLD43 = m_FLD43
End Property
' let
'Способ отбора

'Способ отбора
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD45(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD45", FLD45, NewValue

   m_FLD45 = NewValue
End If
End Property

'Способ отбора
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD45
Public Property Get FLD45() As String
 LoadFromDatabase
 AccessTime = Now

   FLD45 = m_FLD45
End Property
' let
'Т_график

'Т_график
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD46(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD46", FLD46, NewValue

   m_FLD46 = NewValue
End If
End Property

'Т_график
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD46
Public Property Get FLD46() As String
 LoadFromDatabase
 AccessTime = Now

   FLD46 = m_FLD46
End Property
' let
'Теп_камера

'Теп_камера
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD47(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD47", FLD47, NewValue

   m_FLD47 = NewValue
End If
End Property

'Теп_камера
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD47
Public Property Get FLD47() As String
 LoadFromDatabase
 AccessTime = Now

   FLD47 = m_FLD47
End Property
' let
'Тип расходомера

'Тип расходомера
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD48(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD48", FLD48, NewValue

   m_FLD48 = NewValue
End If
End Property

'Тип расходомера
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD48
Public Property Get FLD48() As String
 LoadFromDatabase
 AccessTime = Now

   FLD48 = m_FLD48
End Property
' let
'тип термометра

'тип термометра
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD49(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD49", FLD49, NewValue

   m_FLD49 = NewValue
End If
End Property

'тип термометра
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD49
Public Property Get FLD49() As String
 LoadFromDatabase
 AccessTime = Now

   FLD49 = m_FLD49
End Property
' let
'Формула

'Формула
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD50(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD50", FLD50, NewValue

   m_FLD50 = NewValue
End If
End Property

'Формула
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD50
Public Property Get FLD50() As String
 LoadFromDatabase
 AccessTime = Now

   FLD50 = m_FLD50
End Property
' let
'Наименование счетчика

'Наименование счетчика
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD51(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD51", FLD51, NewValue

   m_FLD51 = NewValue
End If
End Property

'Наименование счетчика
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD51
Public Property Get FLD51() As String
 LoadFromDatabase
 AccessTime = Now

   FLD51 = m_FLD51
End Property
' let
'Схема

'Схема
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD52(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD52", FLD52, NewValue

   m_FLD52 = NewValue
End If
End Property

'Схема
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD52
Public Property Get FLD52() As String
 LoadFromDatabase
 AccessTime = Now

   FLD52 = m_FLD52
End Property
' let
'Qот

'Qот
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD53(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD53", FLD53, NewValue

   m_FLD53 = NewValue
End If
End Property

'Qот
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD53
Public Property Get FLD53() As String
 LoadFromDatabase
 AccessTime = Now

   FLD53 = m_FLD53
End Property
' let
'Qв

'Qв
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD54(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD54", FLD54, NewValue

   m_FLD54 = NewValue
End If
End Property

'Qв
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD54
Public Property Get FLD54() As String
 LoadFromDatabase
 AccessTime = Now

   FLD54 = m_FLD54
End Property
' let
'Qгвс

'Qгвс
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD55(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD55", FLD55, NewValue

   m_FLD55 = NewValue
End If
End Property

'Qгвс
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD55
Public Property Get FLD55() As String
 LoadFromDatabase
 AccessTime = Now

   FLD55 = m_FLD55
End Property
' let
'Qну

'Qну
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD56(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD56", FLD56, NewValue

   m_FLD56 = NewValue
End If
End Property

'Qну
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD56
Public Property Get FLD56() As String
 LoadFromDatabase
 AccessTime = Now

   FLD56 = m_FLD56
End Property
' let
'Gот

'Gот
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD57(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD57", FLD57, NewValue

   m_FLD57 = NewValue
End If
End Property

'Gот
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD57
Public Property Get FLD57() As String
 LoadFromDatabase
 AccessTime = Now

   FLD57 = m_FLD57
End Property
' let
'Gв

'Gв
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD58(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD58", FLD58, NewValue

   m_FLD58 = NewValue
End If
End Property

'Gв
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD58
Public Property Get FLD58() As String
 LoadFromDatabase
 AccessTime = Now

   FLD58 = m_FLD58
End Property
' let
'Gну

'Gну
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD59(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD59", FLD59, NewValue

   m_FLD59 = NewValue
End If
End Property

'Gну
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD59
Public Property Get FLD59() As String
 LoadFromDatabase
 AccessTime = Now

   FLD59 = m_FLD59
End Property
' let
'Часов_архив

'Часов_архив
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD60(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD60", FLD60, NewValue

   m_FLD60 = NewValue
End If
End Property

'Часов_архив
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD60
Public Property Get FLD60() As String
 LoadFromDatabase
 AccessTime = Now

   FLD60 = m_FLD60
End Property
' let
'Сут_архив

'Сут_архив
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD61(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD61", FLD61, NewValue

   m_FLD61 = NewValue
End If
End Property

'Сут_архив
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD61
Public Property Get FLD61() As String
 LoadFromDatabase
 AccessTime = Now

   FLD61 = m_FLD61
End Property
' let
'Термопреобр ГВС

'Термопреобр ГВС
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD62(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD62", FLD62, NewValue

   m_FLD62 = NewValue
End If
End Property

'Термопреобр ГВС
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD62
Public Property Get FLD62() As String
 LoadFromDatabase
 AccessTime = Now

   FLD62 = m_FLD62
End Property
' let
'Т1

'Т1
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD63(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD63", FLD63, NewValue

   m_FLD63 = NewValue
End If
End Property

'Т1
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD63
Public Property Get FLD63() As String
 LoadFromDatabase
 AccessTime = Now

   FLD63 = m_FLD63
End Property
' let
'Т2

'Т2
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD64(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD64", FLD64, NewValue

   m_FLD64 = NewValue
End If
End Property

'Т2
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD64
Public Property Get FLD64() As String
 LoadFromDatabase
 AccessTime = Now

   FLD64 = m_FLD64
End Property
' let
'Т3

'Т3
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD65(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD65", FLD65, NewValue

   m_FLD65 = NewValue
End If
End Property

'Т3
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD65
Public Property Get FLD65() As String
 LoadFromDatabase
 AccessTime = Now

   FLD65 = m_FLD65
End Property
' let
'Т4

'Т4
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD66(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD66", FLD66, NewValue

   m_FLD66 = NewValue
End If
End Property

'Т4
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD66
Public Property Get FLD66() As String
 LoadFromDatabase
 AccessTime = Now

   FLD66 = m_FLD66
End Property
' let
'Gтех

'Gтех
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD67(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD67", FLD67, NewValue

   m_FLD67 = NewValue
End If
End Property

'Gтех
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD67
Public Property Get FLD67() As String
 LoadFromDatabase
 AccessTime = Now

   FLD67 = m_FLD67
End Property
' let
'Gтех_гвс

'Gтех_гвс
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD68(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD68", FLD68, NewValue

   m_FLD68 = NewValue
End If
End Property

'Gтех_гвс
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD68
Public Property Get FLD68() As String
 LoadFromDatabase
 AccessTime = Now

   FLD68 = m_FLD68
End Property
' let
'Gгвс_м

'Gгвс_м
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD69(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD69", FLD69, NewValue

   m_FLD69 = NewValue
End If
End Property

'Gгвс_м
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD69
Public Property Get FLD69() As String
 LoadFromDatabase
 AccessTime = Now

   FLD69 = m_FLD69
End Property
' let
'Qтех

'Qтех
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD70(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD70", FLD70, NewValue

   m_FLD70 = NewValue
End If
End Property

'Qтех
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD70
Public Property Get FLD70() As String
 LoadFromDatabase
 AccessTime = Now

   FLD70 = m_FLD70
End Property
' let
'Qвент

'Qвент
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD71(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD71", FLD71, NewValue

   m_FLD71 = NewValue
End If
End Property

'Qвент
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD71
Public Property Get FLD71() As String
 LoadFromDatabase
 AccessTime = Now

   FLD71 = m_FLD71
End Property
' let
'Тхв

'Тхв
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD72(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD72", FLD72, NewValue

   m_FLD72 = NewValue
End If
End Property

'Тхв
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD72
Public Property Get FLD72() As String
 LoadFromDatabase
 AccessTime = Now

   FLD72 = m_FLD72
End Property
' let
'Расходомер ГВСц

'Расходомер ГВСц
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD73(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD73", FLD73, NewValue

   m_FLD73 = NewValue
End If
End Property

'Расходомер ГВСц
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD73
Public Property Get FLD73() As String
 LoadFromDatabase
 AccessTime = Now

   FLD73 = m_FLD73
End Property
' let
'Формула2

'Формула2
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD81(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD81", FLD81, NewValue

   m_FLD81 = NewValue
End If
End Property

'Формула2
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD81
Public Property Get FLD81() As String
 LoadFromDatabase
 AccessTime = Now

   FLD81 = m_FLD81
End Property
' let
'Термопреобр

'Термопреобр
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD82(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD82", FLD82, NewValue

   m_FLD82 = NewValue
End If
End Property

'Термопреобр
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD82
Public Property Get FLD82() As String
 LoadFromDatabase
 AccessTime = Now

   FLD82 = m_FLD82
End Property
' let
'Gвент

'Gвент
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD83(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD83", FLD83, NewValue

   m_FLD83 = NewValue
End If
End Property

'Gвент
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD83
Public Property Get FLD83() As String
 LoadFromDatabase
 AccessTime = Now

   FLD83 = m_FLD83
End Property
' let
'Код УУТЭ

'Код УУТЭ
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD84(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD84", FLD84, NewValue

   m_FLD84 = NewValue
End If
End Property

'Код УУТЭ
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD84
Public Property Get FLD84() As String
 LoadFromDatabase
 AccessTime = Now

   FLD84 = m_FLD84
End Property
' let
'Сист_теплопотребления

'Сист_теплопотребления
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD85(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD85", FLD85, NewValue

   m_FLD85 = NewValue
End If
End Property

'Сист_теплопотребления
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD85
Public Property Get FLD85() As String
 LoadFromDatabase
 AccessTime = Now

   FLD85 = m_FLD85
End Property
' let
'Qтех_гвс

'Qтех_гвс
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD86(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD86", FLD86, NewValue

   m_FLD86 = NewValue
End If
End Property

'Qтех_гвс
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD86
Public Property Get FLD86() As String
 LoadFromDatabase
 AccessTime = Now

   FLD86 = m_FLD86
End Property
' let
'Qтех_гвс ср

'Qтех_гвс ср
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD87(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD87", FLD87, NewValue

   m_FLD87 = NewValue
End If
End Property

'Qтех_гвс ср
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD87
Public Property Get FLD87() As String
 LoadFromDatabase
 AccessTime = Now

   FLD87 = m_FLD87
End Property
' let
'Qгвс ср

'Qгвс ср
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD88(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD88", FLD88, NewValue

   m_FLD88 = NewValue
End If
End Property

'Qгвс ср
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD88
Public Property Get FLD88() As String
 LoadFromDatabase
 AccessTime = Now

   FLD88 = m_FLD88
End Property
' let
'Дата поверки

'Дата поверки
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD89(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD89", FLD89, NewValue

   m_FLD89 = NewValue
End If
End Property

'Дата поверки
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD89
Public Property Get FLD89() As String
 LoadFromDatabase
 AccessTime = Now

   FLD89 = m_FLD89
End Property
' let
'Фамилия

'Фамилия
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD90(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD90", FLD90, NewValue

   m_FLD90 = NewValue
End If
End Property

'Фамилия
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD90
Public Property Get FLD90() As String
 LoadFromDatabase
 AccessTime = Now

   FLD90 = m_FLD90
End Property
' let
'Узел учета

'Узел учета
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD92(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD92", FLD92, NewValue

   m_FLD92 = NewValue
End If
End Property

'Узел учета
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD92
Public Property Get FLD92() As String
 LoadFromDatabase
 AccessTime = Now

   FLD92 = m_FLD92
End Property
' let
'Стр.адрес

'Стр.адрес
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD93(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD93", FLD93, NewValue

   m_FLD93 = NewValue
End If
End Property

'Стр.адрес
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD93
Public Property Get FLD93() As String
 LoadFromDatabase
 AccessTime = Now

   FLD93 = m_FLD93
End Property
' let
'G(гвс)ОБР

'G(гвс)ОБР
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD94(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD94", FLD94, NewValue

   m_FLD94 = NewValue
End If
End Property

'G(гвс)ОБР
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD94
Public Property Get FLD94() As String
 LoadFromDatabase
 AccessTime = Now

   FLD94 = m_FLD94
End Property
' let
'DyГВСц

'DyГВСц
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD95(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD95", FLD95, NewValue

   m_FLD95 = NewValue
End If
End Property

'DyГВСц
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD95
Public Property Get FLD95() As String
 LoadFromDatabase
 AccessTime = Now

   FLD95 = m_FLD95
End Property
' let
'Цена_имп_M1

'Цена_имп_M1
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD96(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD96", FLD96, NewValue

   m_FLD96 = NewValue
End If
End Property

'Цена_имп_M1
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD96
Public Property Get FLD96() As String
 LoadFromDatabase
 AccessTime = Now

   FLD96 = m_FLD96
End Property
' let
'Цена_имп_M2

'Цена_имп_M2
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD97(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD97", FLD97, NewValue

   m_FLD97 = NewValue
End If
End Property

'Цена_имп_M2
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD97
Public Property Get FLD97() As String
 LoadFromDatabase
 AccessTime = Now

   FLD97 = m_FLD97
End Property
' let
'Цена_имп_M1гв

'Цена_имп_M1гв
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD98(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD98", FLD98, NewValue

   m_FLD98 = NewValue
End If
End Property

'Цена_имп_M1гв
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD98
Public Property Get FLD98() As String
 LoadFromDatabase
 AccessTime = Now

   FLD98 = m_FLD98
End Property
' let
'Цена_имп_M2гв

'Цена_имп_M2гв
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD99(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD99", FLD99, NewValue

   m_FLD99 = NewValue
End If
End Property

'Цена_имп_M2гв
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD99
Public Property Get FLD99() As String
 LoadFromDatabase
 AccessTime = Now

   FLD99 = m_FLD99
End Property
' let
'Доп_погр_изм_M1%

'Доп_погр_изм_M1%
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD100(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD100", FLD100, NewValue

   m_FLD100 = NewValue
End If
End Property

'Доп_погр_изм_M1%
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD100
Public Property Get FLD100() As String
 LoadFromDatabase
 AccessTime = Now

   FLD100 = m_FLD100
End Property
' let
'Доп_погр_изм_M2%

'Доп_погр_изм_M2%
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD101(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD101", FLD101, NewValue

   m_FLD101 = NewValue
End If
End Property

'Доп_погр_изм_M2%
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD101
Public Property Get FLD101() As String
 LoadFromDatabase
 AccessTime = Now

   FLD101 = m_FLD101
End Property
' let
'Доп_погр_изм_M1гв%

'Доп_погр_изм_M1гв%
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD102(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD102", FLD102, NewValue

   m_FLD102 = NewValue
End If
End Property

'Доп_погр_изм_M1гв%
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD102
Public Property Get FLD102() As String
 LoadFromDatabase
 AccessTime = Now

   FLD102 = m_FLD102
End Property
' let
'Доп_погр_изм_M2гв%

'Доп_погр_изм_M2гв%
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD103(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD103", FLD103, NewValue

   m_FLD103 = NewValue
End If
End Property

'Доп_погр_изм_M2гв%
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD103
Public Property Get FLD103() As String
 LoadFromDatabase
 AccessTime = Now

   FLD103 = m_FLD103
End Property
' let
'Расходомер M2

'Расходомер M2
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let FLD104(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FLD104", FLD104, NewValue

   m_FLD104 = NewValue
End If
End Property

'Расходомер M2
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. FLD104
Public Property Get FLD104() As String
 LoadFromDatabase
 AccessTime = Now

   FLD104 = m_FLD104
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

  Set nvi = nv.Add("FLD12", m_FLD12)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD13", m_FLD13)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD14", m_FLD14)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD15", m_FLD15)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD16", m_FLD16)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD17", m_FLD17)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD18", m_FLD18)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD19", m_FLD19)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD20", m_FLD20)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD21", m_FLD21)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD22", m_FLD22)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD23", m_FLD23)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD24", m_FLD24)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD25", m_FLD25)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD26", m_FLD26)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD27", m_FLD27)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD28", m_FLD28)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD29", m_FLD29)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD30", m_FLD30)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD31", m_FLD31)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD32", m_FLD32)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD33", m_FLD33)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD34", m_FLD34)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD35", m_FLD35)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD36", m_FLD36)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD37", m_FLD37)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD40", m_FLD40)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD41", m_FLD41)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD42", m_FLD42)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD43", m_FLD43)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD45", m_FLD45)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD46", m_FLD46)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD47", m_FLD47)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD48", m_FLD48)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD49", m_FLD49)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD50", m_FLD50)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD51", m_FLD51)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD52", m_FLD52)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD53", m_FLD53)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD54", m_FLD54)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD55", m_FLD55)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD56", m_FLD56)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD57", m_FLD57)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD58", m_FLD58)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD59", m_FLD59)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD60", m_FLD60)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD61", m_FLD61)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD62", m_FLD62)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD63", m_FLD63)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD64", m_FLD64)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD65", m_FLD65)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD66", m_FLD66)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD67", m_FLD67)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD68", m_FLD68)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD69", m_FLD69)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD70", m_FLD70)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD71", m_FLD71)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD72", m_FLD72)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD73", m_FLD73)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD81", m_FLD81)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD82", m_FLD82)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD83", m_FLD83)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD84", m_FLD84)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD85", m_FLD85)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD86", m_FLD86)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD87", m_FLD87)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD88", m_FLD88)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD89", m_FLD89)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD90", m_FLD90)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD92", m_FLD92)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD93", m_FLD93)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD94", m_FLD94)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD95", m_FLD95)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD96", m_FLD96)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD97", m_FLD97)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD98", m_FLD98)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD99", m_FLD99)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD100", m_FLD100)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD101", m_FLD101)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD102", m_FLD102)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD103", m_FLD103)
nvi.ValueSize = 96
  Set nvi = nv.Add("FLD104", m_FLD104)
nvi.ValueSize = 96
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
 m_Brief = m_Brief & FLD12 & "; "
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

m_FLD12 = nv.item("FLD12").Value
m_FLD13 = nv.item("FLD13").Value
m_FLD14 = nv.item("FLD14").Value
m_FLD15 = nv.item("FLD15").Value
m_FLD16 = nv.item("FLD16").Value
m_FLD17 = nv.item("FLD17").Value
m_FLD18 = nv.item("FLD18").Value
m_FLD19 = nv.item("FLD19").Value
m_FLD20 = nv.item("FLD20").Value
m_FLD21 = nv.item("FLD21").Value
m_FLD22 = nv.item("FLD22").Value
m_FLD23 = nv.item("FLD23").Value
m_FLD24 = nv.item("FLD24").Value
m_FLD25 = nv.item("FLD25").Value
m_FLD26 = nv.item("FLD26").Value
m_FLD27 = nv.item("FLD27").Value
m_FLD28 = nv.item("FLD28").Value
m_FLD29 = nv.item("FLD29").Value
m_FLD30 = nv.item("FLD30").Value
m_FLD31 = nv.item("FLD31").Value
m_FLD32 = nv.item("FLD32").Value
m_FLD33 = nv.item("FLD33").Value
m_FLD34 = nv.item("FLD34").Value
m_FLD35 = nv.item("FLD35").Value
m_FLD36 = nv.item("FLD36").Value
m_FLD37 = nv.item("FLD37").Value
m_FLD40 = nv.item("FLD40").Value
m_FLD41 = nv.item("FLD41").Value
m_FLD42 = nv.item("FLD42").Value
m_FLD43 = nv.item("FLD43").Value
m_FLD45 = nv.item("FLD45").Value
m_FLD46 = nv.item("FLD46").Value
m_FLD47 = nv.item("FLD47").Value
m_FLD48 = nv.item("FLD48").Value
m_FLD49 = nv.item("FLD49").Value
m_FLD50 = nv.item("FLD50").Value
m_FLD51 = nv.item("FLD51").Value
m_FLD52 = nv.item("FLD52").Value
m_FLD53 = nv.item("FLD53").Value
m_FLD54 = nv.item("FLD54").Value
m_FLD55 = nv.item("FLD55").Value
m_FLD56 = nv.item("FLD56").Value
m_FLD57 = nv.item("FLD57").Value
m_FLD58 = nv.item("FLD58").Value
m_FLD59 = nv.item("FLD59").Value
m_FLD60 = nv.item("FLD60").Value
m_FLD61 = nv.item("FLD61").Value
m_FLD62 = nv.item("FLD62").Value
m_FLD63 = nv.item("FLD63").Value
m_FLD64 = nv.item("FLD64").Value
m_FLD65 = nv.item("FLD65").Value
m_FLD66 = nv.item("FLD66").Value
m_FLD67 = nv.item("FLD67").Value
m_FLD68 = nv.item("FLD68").Value
m_FLD69 = nv.item("FLD69").Value
m_FLD70 = nv.item("FLD70").Value
m_FLD71 = nv.item("FLD71").Value
m_FLD72 = nv.item("FLD72").Value
m_FLD73 = nv.item("FLD73").Value
m_FLD81 = nv.item("FLD81").Value
m_FLD82 = nv.item("FLD82").Value
m_FLD83 = nv.item("FLD83").Value
m_FLD84 = nv.item("FLD84").Value
m_FLD85 = nv.item("FLD85").Value
m_FLD86 = nv.item("FLD86").Value
m_FLD87 = nv.item("FLD87").Value
m_FLD88 = nv.item("FLD88").Value
m_FLD89 = nv.item("FLD89").Value
m_FLD90 = nv.item("FLD90").Value
m_FLD92 = nv.item("FLD92").Value
m_FLD93 = nv.item("FLD93").Value
m_FLD94 = nv.item("FLD94").Value
m_FLD95 = nv.item("FLD95").Value
m_FLD96 = nv.item("FLD96").Value
m_FLD97 = nv.item("FLD97").Value
m_FLD98 = nv.item("FLD98").Value
m_FLD99 = nv.item("FLD99").Value
m_FLD100 = nv.item("FLD100").Value
m_FLD101 = nv.item("FLD101").Value
m_FLD102 = nv.item("FLD102").Value
m_FLD103 = nv.item("FLD103").Value
m_FLD104 = nv.item("FLD104").Value
Else

m_FLD12 = nv.Fields("FLD12").Value
m_FLD13 = nv.Fields("FLD13").Value
m_FLD14 = nv.Fields("FLD14").Value
m_FLD15 = nv.Fields("FLD15").Value
m_FLD16 = nv.Fields("FLD16").Value
m_FLD17 = nv.Fields("FLD17").Value
m_FLD18 = nv.Fields("FLD18").Value
m_FLD19 = nv.Fields("FLD19").Value
m_FLD20 = nv.Fields("FLD20").Value
m_FLD21 = nv.Fields("FLD21").Value
m_FLD22 = nv.Fields("FLD22").Value
m_FLD23 = nv.Fields("FLD23").Value
m_FLD24 = nv.Fields("FLD24").Value
m_FLD25 = nv.Fields("FLD25").Value
m_FLD26 = nv.Fields("FLD26").Value
m_FLD27 = nv.Fields("FLD27").Value
m_FLD28 = nv.Fields("FLD28").Value
m_FLD29 = nv.Fields("FLD29").Value
m_FLD30 = nv.Fields("FLD30").Value
m_FLD31 = nv.Fields("FLD31").Value
m_FLD32 = nv.Fields("FLD32").Value
m_FLD33 = nv.Fields("FLD33").Value
m_FLD34 = nv.Fields("FLD34").Value
m_FLD35 = nv.Fields("FLD35").Value
m_FLD36 = nv.Fields("FLD36").Value
m_FLD37 = nv.Fields("FLD37").Value
m_FLD40 = nv.Fields("FLD40").Value
m_FLD41 = nv.Fields("FLD41").Value
m_FLD42 = nv.Fields("FLD42").Value
m_FLD43 = nv.Fields("FLD43").Value
m_FLD45 = nv.Fields("FLD45").Value
m_FLD46 = nv.Fields("FLD46").Value
m_FLD47 = nv.Fields("FLD47").Value
m_FLD48 = nv.Fields("FLD48").Value
m_FLD49 = nv.Fields("FLD49").Value
m_FLD50 = nv.Fields("FLD50").Value
m_FLD51 = nv.Fields("FLD51").Value
m_FLD52 = nv.Fields("FLD52").Value
m_FLD53 = nv.Fields("FLD53").Value
m_FLD54 = nv.Fields("FLD54").Value
m_FLD55 = nv.Fields("FLD55").Value
m_FLD56 = nv.Fields("FLD56").Value
m_FLD57 = nv.Fields("FLD57").Value
m_FLD58 = nv.Fields("FLD58").Value
m_FLD59 = nv.Fields("FLD59").Value
m_FLD60 = nv.Fields("FLD60").Value
m_FLD61 = nv.Fields("FLD61").Value
m_FLD62 = nv.Fields("FLD62").Value
m_FLD63 = nv.Fields("FLD63").Value
m_FLD64 = nv.Fields("FLD64").Value
m_FLD65 = nv.Fields("FLD65").Value
m_FLD66 = nv.Fields("FLD66").Value
m_FLD67 = nv.Fields("FLD67").Value
m_FLD68 = nv.Fields("FLD68").Value
m_FLD69 = nv.Fields("FLD69").Value
m_FLD70 = nv.Fields("FLD70").Value
m_FLD71 = nv.Fields("FLD71").Value
m_FLD72 = nv.Fields("FLD72").Value
m_FLD73 = nv.Fields("FLD73").Value
m_FLD81 = nv.Fields("FLD81").Value
m_FLD82 = nv.Fields("FLD82").Value
m_FLD83 = nv.Fields("FLD83").Value
m_FLD84 = nv.Fields("FLD84").Value
m_FLD85 = nv.Fields("FLD85").Value
m_FLD86 = nv.Fields("FLD86").Value
m_FLD87 = nv.Fields("FLD87").Value
m_FLD88 = nv.Fields("FLD88").Value
m_FLD89 = nv.Fields("FLD89").Value
m_FLD90 = nv.Fields("FLD90").Value
m_FLD92 = nv.Fields("FLD92").Value
m_FLD93 = nv.Fields("FLD93").Value
m_FLD94 = nv.Fields("FLD94").Value
m_FLD95 = nv.Fields("FLD95").Value
m_FLD96 = nv.Fields("FLD96").Value
m_FLD97 = nv.Fields("FLD97").Value
m_FLD98 = nv.Fields("FLD98").Value
m_FLD99 = nv.Fields("FLD99").Value
m_FLD100 = nv.Fields("FLD100").Value
m_FLD101 = nv.Fields("FLD101").Value
m_FLD102 = nv.Fields("FLD102").Value
m_FLD103 = nv.Fields("FLD103").Value
m_FLD104 = nv.Fields("FLD104").Value
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
   Dim o As CONTRACT
   Set o = New CONTRACT
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
  err.Raise err.Number, "CONTRACT.Save", err.Description
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
  err.Raise err.Number, "CONTRACT.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("CONTRACT", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "CONTRACT.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "CONTRACT", id
Exit Sub
bye:
  err.Raise err.Number, "CONTRACT.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 If Not Application Is Nothing Then Application.Logger.Message "CONTRACT.CloseClass"
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
  FLD12 = Replace(node.Attributes.getNamedItem("FLD12").nodeValue, vbLf, vbCrLf)
  FLD13 = Replace(node.Attributes.getNamedItem("FLD13").nodeValue, vbLf, vbCrLf)
  FLD14 = Replace(node.Attributes.getNamedItem("FLD14").nodeValue, vbLf, vbCrLf)
  FLD15 = Replace(node.Attributes.getNamedItem("FLD15").nodeValue, vbLf, vbCrLf)
  FLD16 = Replace(node.Attributes.getNamedItem("FLD16").nodeValue, vbLf, vbCrLf)
  FLD17 = Replace(node.Attributes.getNamedItem("FLD17").nodeValue, vbLf, vbCrLf)
  FLD18 = Replace(node.Attributes.getNamedItem("FLD18").nodeValue, vbLf, vbCrLf)
  FLD19 = Replace(node.Attributes.getNamedItem("FLD19").nodeValue, vbLf, vbCrLf)
  FLD20 = Replace(node.Attributes.getNamedItem("FLD20").nodeValue, vbLf, vbCrLf)
  FLD21 = Replace(node.Attributes.getNamedItem("FLD21").nodeValue, vbLf, vbCrLf)
  FLD22 = Replace(node.Attributes.getNamedItem("FLD22").nodeValue, vbLf, vbCrLf)
  FLD23 = Replace(node.Attributes.getNamedItem("FLD23").nodeValue, vbLf, vbCrLf)
  FLD24 = Replace(node.Attributes.getNamedItem("FLD24").nodeValue, vbLf, vbCrLf)
  FLD25 = Replace(node.Attributes.getNamedItem("FLD25").nodeValue, vbLf, vbCrLf)
  FLD26 = Replace(node.Attributes.getNamedItem("FLD26").nodeValue, vbLf, vbCrLf)
  FLD27 = Replace(node.Attributes.getNamedItem("FLD27").nodeValue, vbLf, vbCrLf)
  FLD28 = Replace(node.Attributes.getNamedItem("FLD28").nodeValue, vbLf, vbCrLf)
  FLD29 = Replace(node.Attributes.getNamedItem("FLD29").nodeValue, vbLf, vbCrLf)
  FLD30 = Replace(node.Attributes.getNamedItem("FLD30").nodeValue, vbLf, vbCrLf)
  FLD31 = Replace(node.Attributes.getNamedItem("FLD31").nodeValue, vbLf, vbCrLf)
  FLD32 = Replace(node.Attributes.getNamedItem("FLD32").nodeValue, vbLf, vbCrLf)
  FLD33 = Replace(node.Attributes.getNamedItem("FLD33").nodeValue, vbLf, vbCrLf)
  FLD34 = Replace(node.Attributes.getNamedItem("FLD34").nodeValue, vbLf, vbCrLf)
  FLD35 = Replace(node.Attributes.getNamedItem("FLD35").nodeValue, vbLf, vbCrLf)
  FLD36 = Replace(node.Attributes.getNamedItem("FLD36").nodeValue, vbLf, vbCrLf)
  FLD37 = Replace(node.Attributes.getNamedItem("FLD37").nodeValue, vbLf, vbCrLf)
  FLD40 = Replace(node.Attributes.getNamedItem("FLD40").nodeValue, vbLf, vbCrLf)
  FLD41 = Replace(node.Attributes.getNamedItem("FLD41").nodeValue, vbLf, vbCrLf)
  FLD42 = Replace(node.Attributes.getNamedItem("FLD42").nodeValue, vbLf, vbCrLf)
  FLD43 = Replace(node.Attributes.getNamedItem("FLD43").nodeValue, vbLf, vbCrLf)
  FLD45 = Replace(node.Attributes.getNamedItem("FLD45").nodeValue, vbLf, vbCrLf)
  FLD46 = Replace(node.Attributes.getNamedItem("FLD46").nodeValue, vbLf, vbCrLf)
  FLD47 = Replace(node.Attributes.getNamedItem("FLD47").nodeValue, vbLf, vbCrLf)
  FLD48 = Replace(node.Attributes.getNamedItem("FLD48").nodeValue, vbLf, vbCrLf)
  FLD49 = Replace(node.Attributes.getNamedItem("FLD49").nodeValue, vbLf, vbCrLf)
  FLD50 = Replace(node.Attributes.getNamedItem("FLD50").nodeValue, vbLf, vbCrLf)
  FLD51 = Replace(node.Attributes.getNamedItem("FLD51").nodeValue, vbLf, vbCrLf)
  FLD52 = Replace(node.Attributes.getNamedItem("FLD52").nodeValue, vbLf, vbCrLf)
  FLD53 = Replace(node.Attributes.getNamedItem("FLD53").nodeValue, vbLf, vbCrLf)
  FLD54 = Replace(node.Attributes.getNamedItem("FLD54").nodeValue, vbLf, vbCrLf)
  FLD55 = Replace(node.Attributes.getNamedItem("FLD55").nodeValue, vbLf, vbCrLf)
  FLD56 = Replace(node.Attributes.getNamedItem("FLD56").nodeValue, vbLf, vbCrLf)
  FLD57 = Replace(node.Attributes.getNamedItem("FLD57").nodeValue, vbLf, vbCrLf)
  FLD58 = Replace(node.Attributes.getNamedItem("FLD58").nodeValue, vbLf, vbCrLf)
  FLD59 = Replace(node.Attributes.getNamedItem("FLD59").nodeValue, vbLf, vbCrLf)
  FLD60 = Replace(node.Attributes.getNamedItem("FLD60").nodeValue, vbLf, vbCrLf)
  FLD61 = Replace(node.Attributes.getNamedItem("FLD61").nodeValue, vbLf, vbCrLf)
  FLD62 = Replace(node.Attributes.getNamedItem("FLD62").nodeValue, vbLf, vbCrLf)
  FLD63 = Replace(node.Attributes.getNamedItem("FLD63").nodeValue, vbLf, vbCrLf)
  FLD64 = Replace(node.Attributes.getNamedItem("FLD64").nodeValue, vbLf, vbCrLf)
  FLD65 = Replace(node.Attributes.getNamedItem("FLD65").nodeValue, vbLf, vbCrLf)
  FLD66 = Replace(node.Attributes.getNamedItem("FLD66").nodeValue, vbLf, vbCrLf)
  FLD67 = Replace(node.Attributes.getNamedItem("FLD67").nodeValue, vbLf, vbCrLf)
  FLD68 = Replace(node.Attributes.getNamedItem("FLD68").nodeValue, vbLf, vbCrLf)
  FLD69 = Replace(node.Attributes.getNamedItem("FLD69").nodeValue, vbLf, vbCrLf)
  FLD70 = Replace(node.Attributes.getNamedItem("FLD70").nodeValue, vbLf, vbCrLf)
  FLD71 = Replace(node.Attributes.getNamedItem("FLD71").nodeValue, vbLf, vbCrLf)
  FLD72 = Replace(node.Attributes.getNamedItem("FLD72").nodeValue, vbLf, vbCrLf)
  FLD73 = Replace(node.Attributes.getNamedItem("FLD73").nodeValue, vbLf, vbCrLf)
  FLD81 = Replace(node.Attributes.getNamedItem("FLD81").nodeValue, vbLf, vbCrLf)
  FLD82 = Replace(node.Attributes.getNamedItem("FLD82").nodeValue, vbLf, vbCrLf)
  FLD83 = Replace(node.Attributes.getNamedItem("FLD83").nodeValue, vbLf, vbCrLf)
  FLD84 = Replace(node.Attributes.getNamedItem("FLD84").nodeValue, vbLf, vbCrLf)
  FLD85 = Replace(node.Attributes.getNamedItem("FLD85").nodeValue, vbLf, vbCrLf)
  FLD86 = Replace(node.Attributes.getNamedItem("FLD86").nodeValue, vbLf, vbCrLf)
  FLD87 = Replace(node.Attributes.getNamedItem("FLD87").nodeValue, vbLf, vbCrLf)
  FLD88 = Replace(node.Attributes.getNamedItem("FLD88").nodeValue, vbLf, vbCrLf)
  FLD89 = Replace(node.Attributes.getNamedItem("FLD89").nodeValue, vbLf, vbCrLf)
  FLD90 = Replace(node.Attributes.getNamedItem("FLD90").nodeValue, vbLf, vbCrLf)
  FLD92 = Replace(node.Attributes.getNamedItem("FLD92").nodeValue, vbLf, vbCrLf)
  FLD93 = Replace(node.Attributes.getNamedItem("FLD93").nodeValue, vbLf, vbCrLf)
  FLD94 = Replace(node.Attributes.getNamedItem("FLD94").nodeValue, vbLf, vbCrLf)
  FLD95 = Replace(node.Attributes.getNamedItem("FLD95").nodeValue, vbLf, vbCrLf)
  FLD96 = Replace(node.Attributes.getNamedItem("FLD96").nodeValue, vbLf, vbCrLf)
  FLD97 = Replace(node.Attributes.getNamedItem("FLD97").nodeValue, vbLf, vbCrLf)
  FLD98 = Replace(node.Attributes.getNamedItem("FLD98").nodeValue, vbLf, vbCrLf)
  FLD99 = Replace(node.Attributes.getNamedItem("FLD99").nodeValue, vbLf, vbCrLf)
  FLD100 = Replace(node.Attributes.getNamedItem("FLD100").nodeValue, vbLf, vbCrLf)
  FLD101 = Replace(node.Attributes.getNamedItem("FLD101").nodeValue, vbLf, vbCrLf)
  FLD102 = Replace(node.Attributes.getNamedItem("FLD102").nodeValue, vbLf, vbCrLf)
  FLD103 = Replace(node.Attributes.getNamedItem("FLD103").nodeValue, vbLf, vbCrLf)
  FLD104 = Replace(node.Attributes.getNamedItem("FLD104").nodeValue, vbLf, vbCrLf)
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
  node.setAttribute "FLD12", FLD12
  node.setAttribute "FLD13", FLD13
  node.setAttribute "FLD14", FLD14
  node.setAttribute "FLD15", FLD15
  node.setAttribute "FLD16", FLD16
  node.setAttribute "FLD17", FLD17
  node.setAttribute "FLD18", FLD18
  node.setAttribute "FLD19", FLD19
  node.setAttribute "FLD20", FLD20
  node.setAttribute "FLD21", FLD21
  node.setAttribute "FLD22", FLD22
  node.setAttribute "FLD23", FLD23
  node.setAttribute "FLD24", FLD24
  node.setAttribute "FLD25", FLD25
  node.setAttribute "FLD26", FLD26
  node.setAttribute "FLD27", FLD27
  node.setAttribute "FLD28", FLD28
  node.setAttribute "FLD29", FLD29
  node.setAttribute "FLD30", FLD30
  node.setAttribute "FLD31", FLD31
  node.setAttribute "FLD32", FLD32
  node.setAttribute "FLD33", FLD33
  node.setAttribute "FLD34", FLD34
  node.setAttribute "FLD35", FLD35
  node.setAttribute "FLD36", FLD36
  node.setAttribute "FLD37", FLD37
  node.setAttribute "FLD40", FLD40
  node.setAttribute "FLD41", FLD41
  node.setAttribute "FLD42", FLD42
  node.setAttribute "FLD43", FLD43
  node.setAttribute "FLD45", FLD45
  node.setAttribute "FLD46", FLD46
  node.setAttribute "FLD47", FLD47
  node.setAttribute "FLD48", FLD48
  node.setAttribute "FLD49", FLD49
  node.setAttribute "FLD50", FLD50
  node.setAttribute "FLD51", FLD51
  node.setAttribute "FLD52", FLD52
  node.setAttribute "FLD53", FLD53
  node.setAttribute "FLD54", FLD54
  node.setAttribute "FLD55", FLD55
  node.setAttribute "FLD56", FLD56
  node.setAttribute "FLD57", FLD57
  node.setAttribute "FLD58", FLD58
  node.setAttribute "FLD59", FLD59
  node.setAttribute "FLD60", FLD60
  node.setAttribute "FLD61", FLD61
  node.setAttribute "FLD62", FLD62
  node.setAttribute "FLD63", FLD63
  node.setAttribute "FLD64", FLD64
  node.setAttribute "FLD65", FLD65
  node.setAttribute "FLD66", FLD66
  node.setAttribute "FLD67", FLD67
  node.setAttribute "FLD68", FLD68
  node.setAttribute "FLD69", FLD69
  node.setAttribute "FLD70", FLD70
  node.setAttribute "FLD71", FLD71
  node.setAttribute "FLD72", FLD72
  node.setAttribute "FLD73", FLD73
  node.setAttribute "FLD81", FLD81
  node.setAttribute "FLD82", FLD82
  node.setAttribute "FLD83", FLD83
  node.setAttribute "FLD84", FLD84
  node.setAttribute "FLD85", FLD85
  node.setAttribute "FLD86", FLD86
  node.setAttribute "FLD87", FLD87
  node.setAttribute "FLD88", FLD88
  node.setAttribute "FLD89", FLD89
  node.setAttribute "FLD90", FLD90
  node.setAttribute "FLD92", FLD92
  node.setAttribute "FLD93", FLD93
  node.setAttribute "FLD94", FLD94
  node.setAttribute "FLD95", FLD95
  node.setAttribute "FLD96", FLD96
  node.setAttribute "FLD97", FLD97
  node.setAttribute "FLD98", FLD98
  node.setAttribute "FLD99", FLD99
  node.setAttribute "FLD100", FLD100
  node.setAttribute "FLD101", FLD101
  node.setAttribute "FLD102", FLD102
  node.setAttribute "FLD103", FLD103
  node.setAttribute "FLD104", FLD104
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
m_IsLocked = Application.MTZSession.IsLocked("CONTRACT", id)
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
OK = Application.MTZSession.LockResource("CONTRACT", id, Permanent)
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
Application.MTZSession.UnLockResource "CONTRACT", id
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
CanLock = Application.MTZSession.CanLock("CONTRACT", id)
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



