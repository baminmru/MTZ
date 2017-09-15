VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "DATACURR_H"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'строка раздела Часовые архивы
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
Private m_DCALL As Date
Private m_DCOUNTER As Date
Private m_Q1 As Double
Private m_Q2 As Double
Private m_T1 As Double
Private m_T2 As Double
Private m_DT12 As Double
Private m_T3 As Double
Private m_T4 As Double
Private m_T5 As Double
Private m_DT45 As Double
Private m_T6 As Double
Private m_V1 As Double
Private m_V2 As Double
Private m_DV12 As Double
Private m_V3 As Double
Private m_V4 As Double
Private m_V5 As Double
Private m_DV45 As Double
Private m_V6 As Double
Private m_M1 As Double
Private m_M2 As Double
Private m_DM12 As Double
Private m_M3 As Double
Private m_M4 As Double
Private m_M5 As Double
Private m_DM45 As Double
Private m_M6 As Double
Private m_P1 As Double
Private m_P2 As Double
Private m_P3 As Double
Private m_P4 As Double
Private m_P5 As Double
Private m_P6 As Double
Private m_G1 As Double
Private m_G2 As Double
Private m_G3 As Double
Private m_G4 As Double
Private m_G5 As Double
Private m_G6 As Double
Private m_TCOOL As Double
Private m_TCE1 As Double
Private m_TCE2 As Double
Private m_TSUM1 As Double
Private m_TSUM2 As Double
Private m_Q1H As Double
Private m_Q2H As Double
Private m_V1H As Double
Private m_V2H As Double
Private m_V4H As Double
Private m_V5H As Double
Private m_ERRTIME As Double
Private m_ERRTIMEH As Double
Private m_HC As String
Private m_SP As Double
Private m_SP_TB1 As Double
Private m_SP_TB2 As Double
Private m_datetimeCOUNTER As Date
Private m_DG12 As Double
Private m_DG45 As Double
Private m_DP12 As Double
Private m_DP45 As Double
Private m_UNITSR As String
Private m_Q3 As Double
Private m_Q4 As Double
Private m_PATM As Double
Private m_Q5 As Double
Private m_DQ12 As Double
Private m_DQ45 As Double
Private m_PXB As Double
Private m_DQ As Double
Private m_HC_1 As String
Private m_HC_2 As String
Private m_THOT As Double
Private m_DANS1 As Double
Private m_DANS2 As Double
Private m_DANS3 As Double
Private m_DANS4 As Double
Private m_DANS5 As Double
Private m_DANS6 As Double
Private m_CHECK_A As Double
Private m_OKTIME As Double
Private m_WORKTIME As Double
Private m_TAIR1 As Double
Private m_TAIR2 As Double
Private m_HC_CODE As String
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
  PartName = "DATACURR_H"
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
  m_Application.Logger.Message "DATACURR_H.Init"
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
'Дата опроса

'Дата опроса
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DCALL(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DCALL", DCALL, NewValue

   m_DCALL = NewValue
End If
End Property

'Дата опроса
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. DCALL
Public Property Get DCALL() As Date
 LoadFromDatabase
 AccessTime = Now

   DCALL = m_DCALL
End Property
' let
'Дата счетчика

'Дата счетчика
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DCOUNTER(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DCOUNTER", DCOUNTER, NewValue

   m_DCOUNTER = NewValue
End If
End Property

'Дата счетчика
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. DCOUNTER
Public Property Get DCOUNTER() As Date
 LoadFromDatabase
 AccessTime = Now

   DCOUNTER = m_DCOUNTER
End Property
' let
'Тепловая энергия канал 1

'Тепловая энергия канал 1
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Q1(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Q1", Q1, NewValue

   m_Q1 = NewValue
End If
End Property

'Тепловая энергия канал 1
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. Q1
Public Property Get Q1() As Double
 LoadFromDatabase
 AccessTime = Now

   Q1 = m_Q1
End Property
' let
'Тепловая энергия канал 2

'Тепловая энергия канал 2
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Q2(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Q2", Q2, NewValue

   m_Q2 = NewValue
End If
End Property

'Тепловая энергия канал 2
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. Q2
Public Property Get Q2() As Double
 LoadFromDatabase
 AccessTime = Now

   Q2 = m_Q2
End Property
' let
'Температура по каналу 1

'Температура по каналу 1
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let T1(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "T1", T1, NewValue

   m_T1 = NewValue
End If
End Property

'Температура по каналу 1
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. T1
Public Property Get T1() As Double
 LoadFromDatabase
 AccessTime = Now

   T1 = m_T1
End Property
' let
'Температура по каналу 2

'Температура по каналу 2
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let T2(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "T2", T2, NewValue

   m_T2 = NewValue
End If
End Property

'Температура по каналу 2
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. T2
Public Property Get T2() As Double
 LoadFromDatabase
 AccessTime = Now

   T2 = m_T2
End Property
' let
'Разность Температур по каналу 1 и 2

'Разность Температур по каналу 1 и 2
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DT12(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DT12", DT12, NewValue

   m_DT12 = NewValue
End If
End Property

'Разность Температур по каналу 1 и 2
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. DT12
Public Property Get DT12() As Double
 LoadFromDatabase
 AccessTime = Now

   DT12 = m_DT12
End Property
' let
'Температура по каналу 3

'Температура по каналу 3
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let T3(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "T3", T3, NewValue

   m_T3 = NewValue
End If
End Property

'Температура по каналу 3
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. T3
Public Property Get T3() As Double
 LoadFromDatabase
 AccessTime = Now

   T3 = m_T3
End Property
' let
'Температура по каналу 4

'Температура по каналу 4
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let T4(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "T4", T4, NewValue

   m_T4 = NewValue
End If
End Property

'Температура по каналу 4
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. T4
Public Property Get T4() As Double
 LoadFromDatabase
 AccessTime = Now

   T4 = m_T4
End Property
' let
'Температура по каналу 5

'Температура по каналу 5
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let T5(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "T5", T5, NewValue

   m_T5 = NewValue
End If
End Property

'Температура по каналу 5
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. T5
Public Property Get T5() As Double
 LoadFromDatabase
 AccessTime = Now

   T5 = m_T5
End Property
' let
'Разность Температур по каналу 4 и 5

'Разность Температур по каналу 4 и 5
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DT45(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DT45", DT45, NewValue

   m_DT45 = NewValue
End If
End Property

'Разность Температур по каналу 4 и 5
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. DT45
Public Property Get DT45() As Double
 LoadFromDatabase
 AccessTime = Now

   DT45 = m_DT45
End Property
' let
'Температура по каналу 6

'Температура по каналу 6
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let T6(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "T6", T6, NewValue

   m_T6 = NewValue
End If
End Property

'Температура по каналу 6
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. T6
Public Property Get T6() As Double
 LoadFromDatabase
 AccessTime = Now

   T6 = m_T6
End Property
' let
'Объемный расход воды по каналу 1

'Объемный расход воды по каналу 1
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let V1(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "V1", V1, NewValue

   m_V1 = NewValue
End If
End Property

'Объемный расход воды по каналу 1
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. V1
Public Property Get V1() As Double
 LoadFromDatabase
 AccessTime = Now

   V1 = m_V1
End Property
' let
'Объемный расход воды по каналу 2

'Объемный расход воды по каналу 2
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let V2(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "V2", V2, NewValue

   m_V2 = NewValue
End If
End Property

'Объемный расход воды по каналу 2
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. V2
Public Property Get V2() As Double
 LoadFromDatabase
 AccessTime = Now

   V2 = m_V2
End Property
' let
'Разность объемов канал 1  (расход ГВС)

'Разность объемов канал 1  (расход ГВС)
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DV12(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DV12", DV12, NewValue

   m_DV12 = NewValue
End If
End Property

'Разность объемов канал 1  (расход ГВС)
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. DV12
Public Property Get DV12() As Double
 LoadFromDatabase
 AccessTime = Now

   DV12 = m_DV12
End Property
' let
'Объемный расход воды по каналу 3

'Объемный расход воды по каналу 3
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let V3(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "V3", V3, NewValue

   m_V3 = NewValue
End If
End Property

'Объемный расход воды по каналу 3
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. V3
Public Property Get V3() As Double
 LoadFromDatabase
 AccessTime = Now

   V3 = m_V3
End Property
' let
'Объемный расход воды по каналу 4

'Объемный расход воды по каналу 4
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let V4(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "V4", V4, NewValue

   m_V4 = NewValue
End If
End Property

'Объемный расход воды по каналу 4
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. V4
Public Property Get V4() As Double
 LoadFromDatabase
 AccessTime = Now

   V4 = m_V4
End Property
' let
'Объемный расход воды по каналу 5

'Объемный расход воды по каналу 5
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let V5(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "V5", V5, NewValue

   m_V5 = NewValue
End If
End Property

'Объемный расход воды по каналу 5
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. V5
Public Property Get V5() As Double
 LoadFromDatabase
 AccessTime = Now

   V5 = m_V5
End Property
' let
'Разность объемов канал 2

'Разность объемов канал 2
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DV45(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DV45", DV45, NewValue

   m_DV45 = NewValue
End If
End Property

'Разность объемов канал 2
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. DV45
Public Property Get DV45() As Double
 LoadFromDatabase
 AccessTime = Now

   DV45 = m_DV45
End Property
' let
'Объемный расход воды по каналу 6

'Объемный расход воды по каналу 6
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let V6(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "V6", V6, NewValue

   m_V6 = NewValue
End If
End Property

'Объемный расход воды по каналу 6
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. V6
Public Property Get V6() As Double
 LoadFromDatabase
 AccessTime = Now

   V6 = m_V6
End Property
' let
'Масса воды по каналу 1

'Масса воды по каналу 1
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let M1(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "M1", M1, NewValue

   m_M1 = NewValue
End If
End Property

'Масса воды по каналу 1
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. M1
Public Property Get M1() As Double
 LoadFromDatabase
 AccessTime = Now

   M1 = m_M1
End Property
' let
'Масса воды по каналу 2

'Масса воды по каналу 2
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let M2(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "M2", M2, NewValue

   m_M2 = NewValue
End If
End Property

'Масса воды по каналу 2
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. M2
Public Property Get M2() As Double
 LoadFromDatabase
 AccessTime = Now

   M2 = m_M2
End Property
' let
'Разность масс канал 1  (расход ГВС)

'Разность масс канал 1  (расход ГВС)
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DM12(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DM12", DM12, NewValue

   m_DM12 = NewValue
End If
End Property

'Разность масс канал 1  (расход ГВС)
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. DM12
Public Property Get DM12() As Double
 LoadFromDatabase
 AccessTime = Now

   DM12 = m_DM12
End Property
' let
'Масса воды по каналу 3

'Масса воды по каналу 3
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let M3(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "M3", M3, NewValue

   m_M3 = NewValue
End If
End Property

'Масса воды по каналу 3
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. M3
Public Property Get M3() As Double
 LoadFromDatabase
 AccessTime = Now

   M3 = m_M3
End Property
' let
'Масса воды по каналу 4

'Масса воды по каналу 4
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let M4(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "M4", M4, NewValue

   m_M4 = NewValue
End If
End Property

'Масса воды по каналу 4
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. M4
Public Property Get M4() As Double
 LoadFromDatabase
 AccessTime = Now

   M4 = m_M4
End Property
' let
'Масса воды по каналу 5

'Масса воды по каналу 5
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let M5(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "M5", M5, NewValue

   m_M5 = NewValue
End If
End Property

'Масса воды по каналу 5
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. M5
Public Property Get M5() As Double
 LoadFromDatabase
 AccessTime = Now

   M5 = m_M5
End Property
' let
'Разность масс канал 2

'Разность масс канал 2
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DM45(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DM45", DM45, NewValue

   m_DM45 = NewValue
End If
End Property

'Разность масс канал 2
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. DM45
Public Property Get DM45() As Double
 LoadFromDatabase
 AccessTime = Now

   DM45 = m_DM45
End Property
' let
'Масса воды по каналу 6

'Масса воды по каналу 6
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let M6(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "M6", M6, NewValue

   m_M6 = NewValue
End If
End Property

'Масса воды по каналу 6
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. M6
Public Property Get M6() As Double
 LoadFromDatabase
 AccessTime = Now

   M6 = m_M6
End Property
' let
'Давление в трубопроводе 1

'Давление в трубопроводе 1
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let P1(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "P1", P1, NewValue

   m_P1 = NewValue
End If
End Property

'Давление в трубопроводе 1
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. P1
Public Property Get P1() As Double
 LoadFromDatabase
 AccessTime = Now

   P1 = m_P1
End Property
' let
'Давление в трубопроводе 2

'Давление в трубопроводе 2
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let P2(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "P2", P2, NewValue

   m_P2 = NewValue
End If
End Property

'Давление в трубопроводе 2
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. P2
Public Property Get P2() As Double
 LoadFromDatabase
 AccessTime = Now

   P2 = m_P2
End Property
' let
'Давление в трубопроводе 3

'Давление в трубопроводе 3
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let P3(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "P3", P3, NewValue

   m_P3 = NewValue
End If
End Property

'Давление в трубопроводе 3
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. P3
Public Property Get P3() As Double
 LoadFromDatabase
 AccessTime = Now

   P3 = m_P3
End Property
' let
'Давление в трубопроводе 4

'Давление в трубопроводе 4
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let P4(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "P4", P4, NewValue

   m_P4 = NewValue
End If
End Property

'Давление в трубопроводе 4
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. P4
Public Property Get P4() As Double
 LoadFromDatabase
 AccessTime = Now

   P4 = m_P4
End Property
' let
'Давление в трубопроводе 5

'Давление в трубопроводе 5
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let P5(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "P5", P5, NewValue

   m_P5 = NewValue
End If
End Property

'Давление в трубопроводе 5
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. P5
Public Property Get P5() As Double
 LoadFromDatabase
 AccessTime = Now

   P5 = m_P5
End Property
' let
'Давление в трубопроводе 6

'Давление в трубопроводе 6
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let P6(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "P6", P6, NewValue

   m_P6 = NewValue
End If
End Property

'Давление в трубопроводе 6
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. P6
Public Property Get P6() As Double
 LoadFromDatabase
 AccessTime = Now

   P6 = m_P6
End Property
' let
'Текущее значение расхода в трубопроводе 1

'Текущее значение расхода в трубопроводе 1
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let G1(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "G1", G1, NewValue

   m_G1 = NewValue
End If
End Property

'Текущее значение расхода в трубопроводе 1
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. G1
Public Property Get G1() As Double
 LoadFromDatabase
 AccessTime = Now

   G1 = m_G1
End Property
' let
'Текущее значение расхода в трубопроводе 2

'Текущее значение расхода в трубопроводе 2
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let G2(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "G2", G2, NewValue

   m_G2 = NewValue
End If
End Property

'Текущее значение расхода в трубопроводе 2
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. G2
Public Property Get G2() As Double
 LoadFromDatabase
 AccessTime = Now

   G2 = m_G2
End Property
' let
'Текущее значение расхода в трубопроводе 3

'Текущее значение расхода в трубопроводе 3
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let G3(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "G3", G3, NewValue

   m_G3 = NewValue
End If
End Property

'Текущее значение расхода в трубопроводе 3
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. G3
Public Property Get G3() As Double
 LoadFromDatabase
 AccessTime = Now

   G3 = m_G3
End Property
' let
'Текущее значение расхода в трубопроводе 4

'Текущее значение расхода в трубопроводе 4
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let G4(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "G4", G4, NewValue

   m_G4 = NewValue
End If
End Property

'Текущее значение расхода в трубопроводе 4
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. G4
Public Property Get G4() As Double
 LoadFromDatabase
 AccessTime = Now

   G4 = m_G4
End Property
' let
'Текущее значение расхода в трубопроводе 5

'Текущее значение расхода в трубопроводе 5
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let G5(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "G5", G5, NewValue

   m_G5 = NewValue
End If
End Property

'Текущее значение расхода в трубопроводе 5
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. G5
Public Property Get G5() As Double
 LoadFromDatabase
 AccessTime = Now

   G5 = m_G5
End Property
' let
'Текущее значение расхода в трубопроводе 6

'Текущее значение расхода в трубопроводе 6
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let G6(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "G6", G6, NewValue

   m_G6 = NewValue
End If
End Property

'Текущее значение расхода в трубопроводе 6
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. G6
Public Property Get G6() As Double
 LoadFromDatabase
 AccessTime = Now

   G6 = m_G6
End Property
' let
'Температура холодной воды

'Температура холодной воды
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TCOOL(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TCOOL", TCOOL, NewValue

   m_TCOOL = NewValue
End If
End Property

'Температура холодной воды
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. TCOOL
Public Property Get TCOOL() As Double
 LoadFromDatabase
 AccessTime = Now

   TCOOL = m_TCOOL
End Property
' let
'Температура холодного конца канал 1

'Температура холодного конца канал 1
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TCE1(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TCE1", TCE1, NewValue

   m_TCE1 = NewValue
End If
End Property

'Температура холодного конца канал 1
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. TCE1
Public Property Get TCE1() As Double
 LoadFromDatabase
 AccessTime = Now

   TCE1 = m_TCE1
End Property
' let
'Температура холодного конца канал 2

'Температура холодного конца канал 2
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TCE2(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TCE2", TCE2, NewValue

   m_TCE2 = NewValue
End If
End Property

'Температура холодного конца канал 2
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. TCE2
Public Property Get TCE2() As Double
 LoadFromDatabase
 AccessTime = Now

   TCE2 = m_TCE2
End Property
' let
'Тотальное время счета TB1

'Тотальное время счета TB1
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TSUM1(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TSUM1", TSUM1, NewValue

   m_TSUM1 = NewValue
End If
End Property

'Тотальное время счета TB1
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. TSUM1
Public Property Get TSUM1() As Double
 LoadFromDatabase
 AccessTime = Now

   TSUM1 = m_TSUM1
End Property
' let
'Тотальное время счета TB2

'Тотальное время счета TB2
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TSUM2(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TSUM2", TSUM2, NewValue

   m_TSUM2 = NewValue
End If
End Property

'Тотальное время счета TB2
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. TSUM2
Public Property Get TSUM2() As Double
 LoadFromDatabase
 AccessTime = Now

   TSUM2 = m_TSUM2
End Property
' let
'Тепловая энергия канал 1 нарастающим итогом

'Тепловая энергия канал 1 нарастающим итогом
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Q1H(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Q1H", Q1H, NewValue

   m_Q1H = NewValue
End If
End Property

'Тепловая энергия канал 1 нарастающим итогом
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. Q1H
Public Property Get Q1H() As Double
 LoadFromDatabase
 AccessTime = Now

   Q1H = m_Q1H
End Property
' let
'Тепловая энергия канал 2 нарастающим итогом

'Тепловая энергия канал 2 нарастающим итогом
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Q2H(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Q2H", Q2H, NewValue

   m_Q2H = NewValue
End If
End Property

'Тепловая энергия канал 2 нарастающим итогом
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. Q2H
Public Property Get Q2H() As Double
 LoadFromDatabase
 AccessTime = Now

   Q2H = m_Q2H
End Property
' let
'Объемный расход воды по каналу 1  нарастающим итогом

'Объемный расход воды по каналу 1  нарастающим итогом
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let V1H(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "V1H", V1H, NewValue

   m_V1H = NewValue
End If
End Property

'Объемный расход воды по каналу 1  нарастающим итогом
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. V1H
Public Property Get V1H() As Double
 LoadFromDatabase
 AccessTime = Now

   V1H = m_V1H
End Property
' let
'Объемный расход воды по каналу 2  нарастающим итогом

'Объемный расход воды по каналу 2  нарастающим итогом
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let V2H(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "V2H", V2H, NewValue

   m_V2H = NewValue
End If
End Property

'Объемный расход воды по каналу 2  нарастающим итогом
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. V2H
Public Property Get V2H() As Double
 LoadFromDatabase
 AccessTime = Now

   V2H = m_V2H
End Property
' let
'Объемный расход воды по каналу 4  нарастающим итогом

'Объемный расход воды по каналу 4  нарастающим итогом
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let V4H(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "V4H", V4H, NewValue

   m_V4H = NewValue
End If
End Property

'Объемный расход воды по каналу 4  нарастающим итогом
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. V4H
Public Property Get V4H() As Double
 LoadFromDatabase
 AccessTime = Now

   V4H = m_V4H
End Property
' let
'Объемный расход воды по каналу 5  нарастающим итогом

'Объемный расход воды по каналу 5  нарастающим итогом
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let V5H(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "V5H", V5H, NewValue

   m_V5H = NewValue
End If
End Property

'Объемный расход воды по каналу 5  нарастающим итогом
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. V5H
Public Property Get V5H() As Double
 LoadFromDatabase
 AccessTime = Now

   V5H = m_V5H
End Property
' let
'Время аварии

'Время аварии
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ERRTIME(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ERRTIME", ERRTIME, NewValue

   m_ERRTIME = NewValue
End If
End Property

'Время аварии
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. ERRTIME
Public Property Get ERRTIME() As Double
 LoadFromDatabase
 AccessTime = Now

   ERRTIME = m_ERRTIME
End Property
' let
'Время аварии нарастающим итогом

'Время аварии нарастающим итогом
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let ERRTIMEH(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ERRTIMEH", ERRTIMEH, NewValue

   m_ERRTIMEH = NewValue
End If
End Property

'Время аварии нарастающим итогом
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. ERRTIMEH
Public Property Get ERRTIMEH() As Double
 LoadFromDatabase
 AccessTime = Now

   ERRTIMEH = m_ERRTIMEH
End Property
' let
'Нештатные ситуации общ

'Нештатные ситуации общ
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let HC(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "HC", HC, NewValue

   m_HC = NewValue
End If
End Property

'Нештатные ситуации общ
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. HC
Public Property Get HC() As String
 LoadFromDatabase
 AccessTime = Now

   HC = m_HC
End Property
' let
'Схема потребления

'Схема потребления
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let SP(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SP", SP, NewValue

   m_SP = NewValue
End If
End Property

'Схема потребления
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. SP
Public Property Get SP() As Double
 LoadFromDatabase
 AccessTime = Now

   SP = m_SP
End Property
' let
'Схема потребления TB1

'Схема потребления TB1
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let SP_TB1(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SP_TB1", SP_TB1, NewValue

   m_SP_TB1 = NewValue
End If
End Property

'Схема потребления TB1
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. SP_TB1
Public Property Get SP_TB1() As Double
 LoadFromDatabase
 AccessTime = Now

   SP_TB1 = m_SP_TB1
End Property
' let
'Схема потребления TB2

'Схема потребления TB2
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let SP_TB2(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SP_TB2", SP_TB2, NewValue

   m_SP_TB2 = NewValue
End If
End Property

'Схема потребления TB2
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. SP_TB2
Public Property Get SP_TB2() As Double
 LoadFromDatabase
 AccessTime = Now

   SP_TB2 = m_SP_TB2
End Property
' let
'datetimeCOUNTER

'datetimeCOUNTER
'Parameters:
'[IN]   newValue , тип параметра: DATE  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let datetimeCOUNTER(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "datetimeCOUNTER", datetimeCOUNTER, NewValue

   m_datetimeCOUNTER = NewValue
End If
End Property

'datetimeCOUNTER
'Parameters:
' параметров нет
'Returns:
'  значение типа DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. datetimeCOUNTER
Public Property Get datetimeCOUNTER() As Date
 LoadFromDatabase
 AccessTime = Now

   datetimeCOUNTER = m_datetimeCOUNTER
End Property
' let
'G1-G2

'G1-G2
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DG12(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DG12", DG12, NewValue

   m_DG12 = NewValue
End If
End Property

'G1-G2
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. DG12
Public Property Get DG12() As Double
 LoadFromDatabase
 AccessTime = Now

   DG12 = m_DG12
End Property
' let
'G4-G5

'G4-G5
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DG45(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DG45", DG45, NewValue

   m_DG45 = NewValue
End If
End Property

'G4-G5
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. DG45
Public Property Get DG45() As Double
 LoadFromDatabase
 AccessTime = Now

   DG45 = m_DG45
End Property
' let
'P1-P2

'P1-P2
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DP12(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DP12", DP12, NewValue

   m_DP12 = NewValue
End If
End Property

'P1-P2
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. DP12
Public Property Get DP12() As Double
 LoadFromDatabase
 AccessTime = Now

   DP12 = m_DP12
End Property
' let
'P4-P5

'P4-P5
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DP45(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DP45", DP45, NewValue

   m_DP45 = NewValue
End If
End Property

'P4-P5
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. DP45
Public Property Get DP45() As Double
 LoadFromDatabase
 AccessTime = Now

   DP45 = m_DP45
End Property
' let
'Единицы измерения расхода

'Единицы измерения расхода
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let UNITSR(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "UNITSR", UNITSR, NewValue

   m_UNITSR = NewValue
End If
End Property

'Единицы измерения расхода
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. UNITSR
Public Property Get UNITSR() As String
 LoadFromDatabase
 AccessTime = Now

   UNITSR = m_UNITSR
End Property
' let
'Тепловая энергия канал 3

'Тепловая энергия канал 3
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Q3(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Q3", Q3, NewValue

   m_Q3 = NewValue
End If
End Property

'Тепловая энергия канал 3
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. Q3
Public Property Get Q3() As Double
 LoadFromDatabase
 AccessTime = Now

   Q3 = m_Q3
End Property
' let
'Тепловая энергия канал 4

'Тепловая энергия канал 4
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Q4(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Q4", Q4, NewValue

   m_Q4 = NewValue
End If
End Property

'Тепловая энергия канал 4
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. Q4
Public Property Get Q4() As Double
 LoadFromDatabase
 AccessTime = Now

   Q4 = m_Q4
End Property
' let
'Атмосферное давление

'Атмосферное давление
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let PATM(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PATM", PATM, NewValue

   m_PATM = NewValue
End If
End Property

'Атмосферное давление
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. PATM
Public Property Get PATM() As Double
 LoadFromDatabase
 AccessTime = Now

   PATM = m_PATM
End Property
' let
'Тепловая энергия канал 5

'Тепловая энергия канал 5
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let Q5(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Q5", Q5, NewValue

   m_Q5 = NewValue
End If
End Property

'Тепловая энергия канал 5
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. Q5
Public Property Get Q5() As Double
 LoadFromDatabase
 AccessTime = Now

   Q5 = m_Q5
End Property
' let
'Тепловая энергия потребитель 1

'Тепловая энергия потребитель 1
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DQ12(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DQ12", DQ12, NewValue

   m_DQ12 = NewValue
End If
End Property

'Тепловая энергия потребитель 1
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. DQ12
Public Property Get DQ12() As Double
 LoadFromDatabase
 AccessTime = Now

   DQ12 = m_DQ12
End Property
' let
'Тепловая энергия потребитель 2

'Тепловая энергия потребитель 2
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DQ45(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DQ45", DQ45, NewValue

   m_DQ45 = NewValue
End If
End Property

'Тепловая энергия потребитель 2
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. DQ45
Public Property Get DQ45() As Double
 LoadFromDatabase
 AccessTime = Now

   DQ45 = m_DQ45
End Property
' let
'Давление холодной воды

'Давление холодной воды
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let PXB(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PXB", PXB, NewValue

   m_PXB = NewValue
End If
End Property

'Давление холодной воды
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. PXB
Public Property Get PXB() As Double
 LoadFromDatabase
 AccessTime = Now

   PXB = m_PXB
End Property
' let
'Расход энергии потребитель 1

'Расход энергии потребитель 1
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DQ(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DQ", DQ, NewValue

   m_DQ = NewValue
End If
End Property

'Расход энергии потребитель 1
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. DQ
Public Property Get DQ() As Double
 LoadFromDatabase
 AccessTime = Now

   DQ = m_DQ
End Property
' let
'Нештатная ситуация 1 (ТВ1 или внешняя)

'Нештатная ситуация 1 (ТВ1 или внешняя)
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let HC_1(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "HC_1", HC_1, NewValue

   m_HC_1 = NewValue
End If
End Property

'Нештатная ситуация 1 (ТВ1 или внешняя)
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. HC_1
Public Property Get HC_1() As String
 LoadFromDatabase
 AccessTime = Now

   HC_1 = m_HC_1
End Property
' let
'Нештатная ситуация 2 (ТВ2 или внутренняя)

'Нештатная ситуация 2 (ТВ2 или внутренняя)
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let HC_2(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "HC_2", HC_2, NewValue

   m_HC_2 = NewValue
End If
End Property

'Нештатная ситуация 2 (ТВ2 или внутренняя)
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. HC_2
Public Property Get HC_2() As String
 LoadFromDatabase
 AccessTime = Now

   HC_2 = m_HC_2
End Property
' let
'Температура горячей воды

'Температура горячей воды
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let THOT(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "THOT", THOT, NewValue

   m_THOT = NewValue
End If
End Property

'Температура горячей воды
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. THOT
Public Property Get THOT() As Double
 LoadFromDatabase
 AccessTime = Now

   THOT = m_THOT
End Property
' let
'DANS1

'DANS1
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DANS1(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DANS1", DANS1, NewValue

   m_DANS1 = NewValue
End If
End Property

'DANS1
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. DANS1
Public Property Get DANS1() As Double
 LoadFromDatabase
 AccessTime = Now

   DANS1 = m_DANS1
End Property
' let
'DANS2

'DANS2
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DANS2(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DANS2", DANS2, NewValue

   m_DANS2 = NewValue
End If
End Property

'DANS2
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. DANS2
Public Property Get DANS2() As Double
 LoadFromDatabase
 AccessTime = Now

   DANS2 = m_DANS2
End Property
' let
'DANS3

'DANS3
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DANS3(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DANS3", DANS3, NewValue

   m_DANS3 = NewValue
End If
End Property

'DANS3
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. DANS3
Public Property Get DANS3() As Double
 LoadFromDatabase
 AccessTime = Now

   DANS3 = m_DANS3
End Property
' let
'DANS4

'DANS4
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DANS4(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DANS4", DANS4, NewValue

   m_DANS4 = NewValue
End If
End Property

'DANS4
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. DANS4
Public Property Get DANS4() As Double
 LoadFromDatabase
 AccessTime = Now

   DANS4 = m_DANS4
End Property
' let
'DANS5

'DANS5
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DANS5(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DANS5", DANS5, NewValue

   m_DANS5 = NewValue
End If
End Property

'DANS5
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. DANS5
Public Property Get DANS5() As Double
 LoadFromDatabase
 AccessTime = Now

   DANS5 = m_DANS5
End Property
' let
'DANS6

'DANS6
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let DANS6(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DANS6", DANS6, NewValue

   m_DANS6 = NewValue
End If
End Property

'DANS6
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. DANS6
Public Property Get DANS6() As Double
 LoadFromDatabase
 AccessTime = Now

   DANS6 = m_DANS6
End Property
' let
'Проверка архивных данных на НС (0 - не производилась, 1 - произведена)

'Проверка архивных данных на НС (0 - не производилась, 1 - произведена)
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let CHECK_A(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CHECK_A", CHECK_A, NewValue

   m_CHECK_A = NewValue
End If
End Property

'Проверка архивных данных на НС (0 - не производилась, 1 - произведена)
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. CHECK_A
Public Property Get CHECK_A() As Double
 LoadFromDatabase
 AccessTime = Now

   CHECK_A = m_CHECK_A
End Property
' let
'Время безошиб.работы

'Время безошиб.работы
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let OKTIME(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "OKTIME", OKTIME, NewValue

   m_OKTIME = NewValue
End If
End Property

'Время безошиб.работы
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. OKTIME
Public Property Get OKTIME() As Double
 LoadFromDatabase
 AccessTime = Now

   OKTIME = m_OKTIME
End Property
' let
'Время работы

'Время работы
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let WORKTIME(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "WORKTIME", WORKTIME, NewValue

   m_WORKTIME = NewValue
End If
End Property

'Время работы
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. WORKTIME
Public Property Get WORKTIME() As Double
 LoadFromDatabase
 AccessTime = Now

   WORKTIME = m_WORKTIME
End Property
' let
'Температура воздуха канал 1

'Температура воздуха канал 1
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TAIR1(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TAIR1", TAIR1, NewValue

   m_TAIR1 = NewValue
End If
End Property

'Температура воздуха канал 1
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. TAIR1
Public Property Get TAIR1() As Double
 LoadFromDatabase
 AccessTime = Now

   TAIR1 = m_TAIR1
End Property
' let
'Температура воздуха канал 2

'Температура воздуха канал 2
'Parameters:
'[IN]   newValue , тип параметра: double  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let TAIR2(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TAIR2", TAIR2, NewValue

   m_TAIR2 = NewValue
End If
End Property

'Температура воздуха канал 2
'Parameters:
' параметров нет
'Returns:
'  значение типа double
'See Also:
'Example:
' dim variable as double
' variable = me. TAIR2
Public Property Get TAIR2() As Double
 LoadFromDatabase
 AccessTime = Now

   TAIR2 = m_TAIR2
End Property
' let
'Код нештатной ситуации тепловычислителя

'Код нештатной ситуации тепловычислителя
'Parameters:
'[IN]   newValue , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
Public Property Let HC_CODE(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "HC_CODE", HC_CODE, NewValue

   m_HC_CODE = NewValue
End If
End Property

'Код нештатной ситуации тепловычислителя
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me. HC_CODE
Public Property Get HC_CODE() As String
 LoadFromDatabase
 AccessTime = Now

   HC_CODE = m_HC_CODE
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

  Set nvi = nv.Add("DCALL", m_DCALL)
nvi.ValueType = adDBTimeStamp
  Set nvi = nv.Add("DCOUNTER", m_DCOUNTER)
nvi.ValueType = adDBTimeStamp
  Set nvi = nv.Add("Q1", m_Q1)
nvi.ValueType = adDouble
  Set nvi = nv.Add("Q2", m_Q2)
nvi.ValueType = adDouble
  Set nvi = nv.Add("T1", m_T1)
nvi.ValueType = adDouble
  Set nvi = nv.Add("T2", m_T2)
nvi.ValueType = adDouble
  Set nvi = nv.Add("DT12", m_DT12)
nvi.ValueType = adDouble
  Set nvi = nv.Add("T3", m_T3)
nvi.ValueType = adDouble
  Set nvi = nv.Add("T4", m_T4)
nvi.ValueType = adDouble
  Set nvi = nv.Add("T5", m_T5)
nvi.ValueType = adDouble
  Set nvi = nv.Add("DT45", m_DT45)
nvi.ValueType = adDouble
  Set nvi = nv.Add("T6", m_T6)
nvi.ValueType = adDouble
  Set nvi = nv.Add("V1", m_V1)
nvi.ValueType = adDouble
  Set nvi = nv.Add("V2", m_V2)
nvi.ValueType = adDouble
  Set nvi = nv.Add("DV12", m_DV12)
nvi.ValueType = adDouble
  Set nvi = nv.Add("V3", m_V3)
nvi.ValueType = adDouble
  Set nvi = nv.Add("V4", m_V4)
nvi.ValueType = adDouble
  Set nvi = nv.Add("V5", m_V5)
nvi.ValueType = adDouble
  Set nvi = nv.Add("DV45", m_DV45)
nvi.ValueType = adDouble
  Set nvi = nv.Add("V6", m_V6)
nvi.ValueType = adDouble
  Set nvi = nv.Add("M1", m_M1)
nvi.ValueType = adDouble
  Set nvi = nv.Add("M2", m_M2)
nvi.ValueType = adDouble
  Set nvi = nv.Add("DM12", m_DM12)
nvi.ValueType = adDouble
  Set nvi = nv.Add("M3", m_M3)
nvi.ValueType = adDouble
  Set nvi = nv.Add("M4", m_M4)
nvi.ValueType = adDouble
  Set nvi = nv.Add("M5", m_M5)
nvi.ValueType = adDouble
  Set nvi = nv.Add("DM45", m_DM45)
nvi.ValueType = adDouble
  Set nvi = nv.Add("M6", m_M6)
nvi.ValueType = adDouble
  Set nvi = nv.Add("P1", m_P1)
nvi.ValueType = adDouble
  Set nvi = nv.Add("P2", m_P2)
nvi.ValueType = adDouble
  Set nvi = nv.Add("P3", m_P3)
nvi.ValueType = adDouble
  Set nvi = nv.Add("P4", m_P4)
nvi.ValueType = adDouble
  Set nvi = nv.Add("P5", m_P5)
nvi.ValueType = adDouble
  Set nvi = nv.Add("P6", m_P6)
nvi.ValueType = adDouble
  Set nvi = nv.Add("G1", m_G1)
nvi.ValueType = adDouble
  Set nvi = nv.Add("G2", m_G2)
nvi.ValueType = adDouble
  Set nvi = nv.Add("G3", m_G3)
nvi.ValueType = adDouble
  Set nvi = nv.Add("G4", m_G4)
nvi.ValueType = adDouble
  Set nvi = nv.Add("G5", m_G5)
nvi.ValueType = adDouble
  Set nvi = nv.Add("G6", m_G6)
nvi.ValueType = adDouble
  Set nvi = nv.Add("TCOOL", m_TCOOL)
nvi.ValueType = adDouble
  Set nvi = nv.Add("TCE1", m_TCE1)
nvi.ValueType = adDouble
  Set nvi = nv.Add("TCE2", m_TCE2)
nvi.ValueType = adDouble
  Set nvi = nv.Add("TSUM1", m_TSUM1)
nvi.ValueType = adDouble
  Set nvi = nv.Add("TSUM2", m_TSUM2)
nvi.ValueType = adDouble
  Set nvi = nv.Add("Q1H", m_Q1H)
nvi.ValueType = adDouble
  Set nvi = nv.Add("Q2H", m_Q2H)
nvi.ValueType = adDouble
  Set nvi = nv.Add("V1H", m_V1H)
nvi.ValueType = adDouble
  Set nvi = nv.Add("V2H", m_V2H)
nvi.ValueType = adDouble
  Set nvi = nv.Add("V4H", m_V4H)
nvi.ValueType = adDouble
  Set nvi = nv.Add("V5H", m_V5H)
nvi.ValueType = adDouble
  Set nvi = nv.Add("ERRTIME", m_ERRTIME)
nvi.ValueType = adDouble
  Set nvi = nv.Add("ERRTIMEH", m_ERRTIMEH)
nvi.ValueType = adDouble
  Set nvi = nv.Add("HC", m_HC)
nvi.ValueSize = 360
  Set nvi = nv.Add("SP", m_SP)
nvi.ValueType = adDouble
  Set nvi = nv.Add("SP_TB1", m_SP_TB1)
nvi.ValueType = adDouble
  Set nvi = nv.Add("SP_TB2", m_SP_TB2)
nvi.ValueType = adDouble
  Set nvi = nv.Add("datetimeCOUNTER", m_datetimeCOUNTER)
nvi.ValueType = adDBTimeStamp
  Set nvi = nv.Add("DG12", m_DG12)
nvi.ValueType = adDouble
  Set nvi = nv.Add("DG45", m_DG45)
nvi.ValueType = adDouble
  Set nvi = nv.Add("DP12", m_DP12)
nvi.ValueType = adDouble
  Set nvi = nv.Add("DP45", m_DP45)
nvi.ValueType = adDouble
  Set nvi = nv.Add("UNITSR", m_UNITSR)
nvi.ValueSize = 24
  Set nvi = nv.Add("Q3", m_Q3)
nvi.ValueType = adDouble
  Set nvi = nv.Add("Q4", m_Q4)
nvi.ValueType = adDouble
  Set nvi = nv.Add("PATM", m_PATM)
nvi.ValueType = adDouble
  Set nvi = nv.Add("Q5", m_Q5)
nvi.ValueType = adDouble
  Set nvi = nv.Add("DQ12", m_DQ12)
nvi.ValueType = adDouble
  Set nvi = nv.Add("DQ45", m_DQ45)
nvi.ValueType = adDouble
  Set nvi = nv.Add("PXB", m_PXB)
nvi.ValueType = adDouble
  Set nvi = nv.Add("DQ", m_DQ)
nvi.ValueType = adDouble
  Set nvi = nv.Add("HC_1", m_HC_1)
nvi.ValueSize = 360
  Set nvi = nv.Add("HC_2", m_HC_2)
nvi.ValueSize = 360
  Set nvi = nv.Add("THOT", m_THOT)
nvi.ValueType = adDouble
  Set nvi = nv.Add("DANS1", m_DANS1)
nvi.ValueType = adDouble
  Set nvi = nv.Add("DANS2", m_DANS2)
nvi.ValueType = adDouble
  Set nvi = nv.Add("DANS3", m_DANS3)
nvi.ValueType = adDouble
  Set nvi = nv.Add("DANS4", m_DANS4)
nvi.ValueType = adDouble
  Set nvi = nv.Add("DANS5", m_DANS5)
nvi.ValueType = adDouble
  Set nvi = nv.Add("DANS6", m_DANS6)
nvi.ValueType = adDouble
  Set nvi = nv.Add("CHECK_A", m_CHECK_A)
nvi.ValueType = adDouble
  Set nvi = nv.Add("OKTIME", m_OKTIME)
nvi.ValueType = adDouble
  Set nvi = nv.Add("WORKTIME", m_WORKTIME)
nvi.ValueType = adDouble
  Set nvi = nv.Add("TAIR1", m_TAIR1)
nvi.ValueType = adDouble
  Set nvi = nv.Add("TAIR2", m_TAIR2)
nvi.ValueType = adDouble
  Set nvi = nv.Add("HC_CODE", m_HC_CODE)
nvi.ValueSize = 360
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
 m_Brief = m_Brief & DCALL & "; "
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

m_DCALL = nv.item("DCALL").Value
m_DCOUNTER = nv.item("DCOUNTER").Value
m_Q1 = nv.item("Q1").Value
m_Q2 = nv.item("Q2").Value
m_T1 = nv.item("T1").Value
m_T2 = nv.item("T2").Value
m_DT12 = nv.item("DT12").Value
m_T3 = nv.item("T3").Value
m_T4 = nv.item("T4").Value
m_T5 = nv.item("T5").Value
m_DT45 = nv.item("DT45").Value
m_T6 = nv.item("T6").Value
m_V1 = nv.item("V1").Value
m_V2 = nv.item("V2").Value
m_DV12 = nv.item("DV12").Value
m_V3 = nv.item("V3").Value
m_V4 = nv.item("V4").Value
m_V5 = nv.item("V5").Value
m_DV45 = nv.item("DV45").Value
m_V6 = nv.item("V6").Value
m_M1 = nv.item("M1").Value
m_M2 = nv.item("M2").Value
m_DM12 = nv.item("DM12").Value
m_M3 = nv.item("M3").Value
m_M4 = nv.item("M4").Value
m_M5 = nv.item("M5").Value
m_DM45 = nv.item("DM45").Value
m_M6 = nv.item("M6").Value
m_P1 = nv.item("P1").Value
m_P2 = nv.item("P2").Value
m_P3 = nv.item("P3").Value
m_P4 = nv.item("P4").Value
m_P5 = nv.item("P5").Value
m_P6 = nv.item("P6").Value
m_G1 = nv.item("G1").Value
m_G2 = nv.item("G2").Value
m_G3 = nv.item("G3").Value
m_G4 = nv.item("G4").Value
m_G5 = nv.item("G5").Value
m_G6 = nv.item("G6").Value
m_TCOOL = nv.item("TCOOL").Value
m_TCE1 = nv.item("TCE1").Value
m_TCE2 = nv.item("TCE2").Value
m_TSUM1 = nv.item("TSUM1").Value
m_TSUM2 = nv.item("TSUM2").Value
m_Q1H = nv.item("Q1H").Value
m_Q2H = nv.item("Q2H").Value
m_V1H = nv.item("V1H").Value
m_V2H = nv.item("V2H").Value
m_V4H = nv.item("V4H").Value
m_V5H = nv.item("V5H").Value
m_ERRTIME = nv.item("ERRTIME").Value
m_ERRTIMEH = nv.item("ERRTIMEH").Value
m_HC = nv.item("HC").Value
m_SP = nv.item("SP").Value
m_SP_TB1 = nv.item("SP_TB1").Value
m_SP_TB2 = nv.item("SP_TB2").Value
m_datetimeCOUNTER = nv.item("datetimeCOUNTER").Value
m_DG12 = nv.item("DG12").Value
m_DG45 = nv.item("DG45").Value
m_DP12 = nv.item("DP12").Value
m_DP45 = nv.item("DP45").Value
m_UNITSR = nv.item("UNITSR").Value
m_Q3 = nv.item("Q3").Value
m_Q4 = nv.item("Q4").Value
m_PATM = nv.item("PATM").Value
m_Q5 = nv.item("Q5").Value
m_DQ12 = nv.item("DQ12").Value
m_DQ45 = nv.item("DQ45").Value
m_PXB = nv.item("PXB").Value
m_DQ = nv.item("DQ").Value
m_HC_1 = nv.item("HC_1").Value
m_HC_2 = nv.item("HC_2").Value
m_THOT = nv.item("THOT").Value
m_DANS1 = nv.item("DANS1").Value
m_DANS2 = nv.item("DANS2").Value
m_DANS3 = nv.item("DANS3").Value
m_DANS4 = nv.item("DANS4").Value
m_DANS5 = nv.item("DANS5").Value
m_DANS6 = nv.item("DANS6").Value
m_CHECK_A = nv.item("CHECK_A").Value
m_OKTIME = nv.item("OKTIME").Value
m_WORKTIME = nv.item("WORKTIME").Value
m_TAIR1 = nv.item("TAIR1").Value
m_TAIR2 = nv.item("TAIR2").Value
m_HC_CODE = nv.item("HC_CODE").Value
Else

m_DCALL = nv.Fields("DCALL").Value
m_DCOUNTER = nv.Fields("DCOUNTER").Value
m_Q1 = nv.Fields("Q1").Value
m_Q2 = nv.Fields("Q2").Value
m_T1 = nv.Fields("T1").Value
m_T2 = nv.Fields("T2").Value
m_DT12 = nv.Fields("DT12").Value
m_T3 = nv.Fields("T3").Value
m_T4 = nv.Fields("T4").Value
m_T5 = nv.Fields("T5").Value
m_DT45 = nv.Fields("DT45").Value
m_T6 = nv.Fields("T6").Value
m_V1 = nv.Fields("V1").Value
m_V2 = nv.Fields("V2").Value
m_DV12 = nv.Fields("DV12").Value
m_V3 = nv.Fields("V3").Value
m_V4 = nv.Fields("V4").Value
m_V5 = nv.Fields("V5").Value
m_DV45 = nv.Fields("DV45").Value
m_V6 = nv.Fields("V6").Value
m_M1 = nv.Fields("M1").Value
m_M2 = nv.Fields("M2").Value
m_DM12 = nv.Fields("DM12").Value
m_M3 = nv.Fields("M3").Value
m_M4 = nv.Fields("M4").Value
m_M5 = nv.Fields("M5").Value
m_DM45 = nv.Fields("DM45").Value
m_M6 = nv.Fields("M6").Value
m_P1 = nv.Fields("P1").Value
m_P2 = nv.Fields("P2").Value
m_P3 = nv.Fields("P3").Value
m_P4 = nv.Fields("P4").Value
m_P5 = nv.Fields("P5").Value
m_P6 = nv.Fields("P6").Value
m_G1 = nv.Fields("G1").Value
m_G2 = nv.Fields("G2").Value
m_G3 = nv.Fields("G3").Value
m_G4 = nv.Fields("G4").Value
m_G5 = nv.Fields("G5").Value
m_G6 = nv.Fields("G6").Value
m_TCOOL = nv.Fields("TCOOL").Value
m_TCE1 = nv.Fields("TCE1").Value
m_TCE2 = nv.Fields("TCE2").Value
m_TSUM1 = nv.Fields("TSUM1").Value
m_TSUM2 = nv.Fields("TSUM2").Value
m_Q1H = nv.Fields("Q1H").Value
m_Q2H = nv.Fields("Q2H").Value
m_V1H = nv.Fields("V1H").Value
m_V2H = nv.Fields("V2H").Value
m_V4H = nv.Fields("V4H").Value
m_V5H = nv.Fields("V5H").Value
m_ERRTIME = nv.Fields("ERRTIME").Value
m_ERRTIMEH = nv.Fields("ERRTIMEH").Value
m_HC = nv.Fields("HC").Value
m_SP = nv.Fields("SP").Value
m_SP_TB1 = nv.Fields("SP_TB1").Value
m_SP_TB2 = nv.Fields("SP_TB2").Value
m_datetimeCOUNTER = nv.Fields("datetimeCOUNTER").Value
m_DG12 = nv.Fields("DG12").Value
m_DG45 = nv.Fields("DG45").Value
m_DP12 = nv.Fields("DP12").Value
m_DP45 = nv.Fields("DP45").Value
m_UNITSR = nv.Fields("UNITSR").Value
m_Q3 = nv.Fields("Q3").Value
m_Q4 = nv.Fields("Q4").Value
m_PATM = nv.Fields("PATM").Value
m_Q5 = nv.Fields("Q5").Value
m_DQ12 = nv.Fields("DQ12").Value
m_DQ45 = nv.Fields("DQ45").Value
m_PXB = nv.Fields("PXB").Value
m_DQ = nv.Fields("DQ").Value
m_HC_1 = nv.Fields("HC_1").Value
m_HC_2 = nv.Fields("HC_2").Value
m_THOT = nv.Fields("THOT").Value
m_DANS1 = nv.Fields("DANS1").Value
m_DANS2 = nv.Fields("DANS2").Value
m_DANS3 = nv.Fields("DANS3").Value
m_DANS4 = nv.Fields("DANS4").Value
m_DANS5 = nv.Fields("DANS5").Value
m_DANS6 = nv.Fields("DANS6").Value
m_CHECK_A = nv.Fields("CHECK_A").Value
m_OKTIME = nv.Fields("OKTIME").Value
m_WORKTIME = nv.Fields("WORKTIME").Value
m_TAIR1 = nv.Fields("TAIR1").Value
m_TAIR2 = nv.Fields("TAIR2").Value
m_HC_CODE = nv.Fields("HC_CODE").Value
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
   Dim o As DATACURR_H
   Set o = New DATACURR_H
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
  err.Raise err.Number, "DATACURR_H.Save", err.Description
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
  err.Raise err.Number, "DATACURR_H.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("DATACURR_H", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "DATACURR_H.Secure", err.Description
End Sub

'Распространить права на дочерние строки и разделы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "DATACURR_H", id
Exit Sub
bye:
  err.Raise err.Number, "DATACURR_H.Propagate", err.Description
End Sub

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 If Not Application Is Nothing Then Application.Logger.Message "DATACURR_H.CloseClass"
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
  DCALL = node.Attributes.getNamedItem("DCALL").nodeValue
  DCOUNTER = node.Attributes.getNamedItem("DCOUNTER").nodeValue
  Q1 = Val(Replace(node.Attributes.getNamedItem("Q1").nodeValue, vbLf, vbCrLf))
  Q2 = Val(Replace(node.Attributes.getNamedItem("Q2").nodeValue, vbLf, vbCrLf))
  T1 = Val(Replace(node.Attributes.getNamedItem("T1").nodeValue, vbLf, vbCrLf))
  T2 = Val(Replace(node.Attributes.getNamedItem("T2").nodeValue, vbLf, vbCrLf))
  DT12 = Val(Replace(node.Attributes.getNamedItem("DT12").nodeValue, vbLf, vbCrLf))
  T3 = Val(Replace(node.Attributes.getNamedItem("T3").nodeValue, vbLf, vbCrLf))
  T4 = Val(Replace(node.Attributes.getNamedItem("T4").nodeValue, vbLf, vbCrLf))
  T5 = Val(Replace(node.Attributes.getNamedItem("T5").nodeValue, vbLf, vbCrLf))
  DT45 = Val(Replace(node.Attributes.getNamedItem("DT45").nodeValue, vbLf, vbCrLf))
  T6 = Val(Replace(node.Attributes.getNamedItem("T6").nodeValue, vbLf, vbCrLf))
  V1 = Val(Replace(node.Attributes.getNamedItem("V1").nodeValue, vbLf, vbCrLf))
  V2 = Val(Replace(node.Attributes.getNamedItem("V2").nodeValue, vbLf, vbCrLf))
  DV12 = Val(Replace(node.Attributes.getNamedItem("DV12").nodeValue, vbLf, vbCrLf))
  V3 = Val(Replace(node.Attributes.getNamedItem("V3").nodeValue, vbLf, vbCrLf))
  V4 = Val(Replace(node.Attributes.getNamedItem("V4").nodeValue, vbLf, vbCrLf))
  V5 = Val(Replace(node.Attributes.getNamedItem("V5").nodeValue, vbLf, vbCrLf))
  DV45 = Val(Replace(node.Attributes.getNamedItem("DV45").nodeValue, vbLf, vbCrLf))
  V6 = Val(Replace(node.Attributes.getNamedItem("V6").nodeValue, vbLf, vbCrLf))
  M1 = Val(Replace(node.Attributes.getNamedItem("M1").nodeValue, vbLf, vbCrLf))
  M2 = Val(Replace(node.Attributes.getNamedItem("M2").nodeValue, vbLf, vbCrLf))
  DM12 = Val(Replace(node.Attributes.getNamedItem("DM12").nodeValue, vbLf, vbCrLf))
  M3 = Val(Replace(node.Attributes.getNamedItem("M3").nodeValue, vbLf, vbCrLf))
  M4 = Val(Replace(node.Attributes.getNamedItem("M4").nodeValue, vbLf, vbCrLf))
  M5 = Val(Replace(node.Attributes.getNamedItem("M5").nodeValue, vbLf, vbCrLf))
  DM45 = Val(Replace(node.Attributes.getNamedItem("DM45").nodeValue, vbLf, vbCrLf))
  M6 = Val(Replace(node.Attributes.getNamedItem("M6").nodeValue, vbLf, vbCrLf))
  P1 = Val(Replace(node.Attributes.getNamedItem("P1").nodeValue, vbLf, vbCrLf))
  P2 = Val(Replace(node.Attributes.getNamedItem("P2").nodeValue, vbLf, vbCrLf))
  P3 = Val(Replace(node.Attributes.getNamedItem("P3").nodeValue, vbLf, vbCrLf))
  P4 = Val(Replace(node.Attributes.getNamedItem("P4").nodeValue, vbLf, vbCrLf))
  P5 = Val(Replace(node.Attributes.getNamedItem("P5").nodeValue, vbLf, vbCrLf))
  P6 = Val(Replace(node.Attributes.getNamedItem("P6").nodeValue, vbLf, vbCrLf))
  G1 = Val(Replace(node.Attributes.getNamedItem("G1").nodeValue, vbLf, vbCrLf))
  G2 = Val(Replace(node.Attributes.getNamedItem("G2").nodeValue, vbLf, vbCrLf))
  G3 = Val(Replace(node.Attributes.getNamedItem("G3").nodeValue, vbLf, vbCrLf))
  G4 = Val(Replace(node.Attributes.getNamedItem("G4").nodeValue, vbLf, vbCrLf))
  G5 = Val(Replace(node.Attributes.getNamedItem("G5").nodeValue, vbLf, vbCrLf))
  G6 = Val(Replace(node.Attributes.getNamedItem("G6").nodeValue, vbLf, vbCrLf))
  TCOOL = Val(Replace(node.Attributes.getNamedItem("TCOOL").nodeValue, vbLf, vbCrLf))
  TCE1 = Val(Replace(node.Attributes.getNamedItem("TCE1").nodeValue, vbLf, vbCrLf))
  TCE2 = Val(Replace(node.Attributes.getNamedItem("TCE2").nodeValue, vbLf, vbCrLf))
  TSUM1 = Val(Replace(node.Attributes.getNamedItem("TSUM1").nodeValue, vbLf, vbCrLf))
  TSUM2 = Val(Replace(node.Attributes.getNamedItem("TSUM2").nodeValue, vbLf, vbCrLf))
  Q1H = Val(Replace(node.Attributes.getNamedItem("Q1H").nodeValue, vbLf, vbCrLf))
  Q2H = Val(Replace(node.Attributes.getNamedItem("Q2H").nodeValue, vbLf, vbCrLf))
  V1H = Val(Replace(node.Attributes.getNamedItem("V1H").nodeValue, vbLf, vbCrLf))
  V2H = Val(Replace(node.Attributes.getNamedItem("V2H").nodeValue, vbLf, vbCrLf))
  V4H = Val(Replace(node.Attributes.getNamedItem("V4H").nodeValue, vbLf, vbCrLf))
  V5H = Val(Replace(node.Attributes.getNamedItem("V5H").nodeValue, vbLf, vbCrLf))
  ERRTIME = Val(Replace(node.Attributes.getNamedItem("ERRTIME").nodeValue, vbLf, vbCrLf))
  ERRTIMEH = Val(Replace(node.Attributes.getNamedItem("ERRTIMEH").nodeValue, vbLf, vbCrLf))
  HC = Replace(node.Attributes.getNamedItem("HC").nodeValue, vbLf, vbCrLf)
  SP = Val(Replace(node.Attributes.getNamedItem("SP").nodeValue, vbLf, vbCrLf))
  SP_TB1 = Val(Replace(node.Attributes.getNamedItem("SP_TB1").nodeValue, vbLf, vbCrLf))
  SP_TB2 = Val(Replace(node.Attributes.getNamedItem("SP_TB2").nodeValue, vbLf, vbCrLf))
  datetimeCOUNTER = node.Attributes.getNamedItem("DATETIMECOUNTER").nodeValue
  DG12 = Val(Replace(node.Attributes.getNamedItem("DG12").nodeValue, vbLf, vbCrLf))
  DG45 = Val(Replace(node.Attributes.getNamedItem("DG45").nodeValue, vbLf, vbCrLf))
  DP12 = Val(Replace(node.Attributes.getNamedItem("DP12").nodeValue, vbLf, vbCrLf))
  DP45 = Val(Replace(node.Attributes.getNamedItem("DP45").nodeValue, vbLf, vbCrLf))
  UNITSR = Replace(node.Attributes.getNamedItem("UNITSR").nodeValue, vbLf, vbCrLf)
  Q3 = Val(Replace(node.Attributes.getNamedItem("Q3").nodeValue, vbLf, vbCrLf))
  Q4 = Val(Replace(node.Attributes.getNamedItem("Q4").nodeValue, vbLf, vbCrLf))
  PATM = Val(Replace(node.Attributes.getNamedItem("PATM").nodeValue, vbLf, vbCrLf))
  Q5 = Val(Replace(node.Attributes.getNamedItem("Q5").nodeValue, vbLf, vbCrLf))
  DQ12 = Val(Replace(node.Attributes.getNamedItem("DQ12").nodeValue, vbLf, vbCrLf))
  DQ45 = Val(Replace(node.Attributes.getNamedItem("DQ45").nodeValue, vbLf, vbCrLf))
  PXB = Val(Replace(node.Attributes.getNamedItem("PXB").nodeValue, vbLf, vbCrLf))
  DQ = Val(Replace(node.Attributes.getNamedItem("DQ").nodeValue, vbLf, vbCrLf))
  HC_1 = Replace(node.Attributes.getNamedItem("HC_1").nodeValue, vbLf, vbCrLf)
  HC_2 = Replace(node.Attributes.getNamedItem("HC_2").nodeValue, vbLf, vbCrLf)
  THOT = Val(Replace(node.Attributes.getNamedItem("THOT").nodeValue, vbLf, vbCrLf))
  DANS1 = Val(Replace(node.Attributes.getNamedItem("DANS1").nodeValue, vbLf, vbCrLf))
  DANS2 = Val(Replace(node.Attributes.getNamedItem("DANS2").nodeValue, vbLf, vbCrLf))
  DANS3 = Val(Replace(node.Attributes.getNamedItem("DANS3").nodeValue, vbLf, vbCrLf))
  DANS4 = Val(Replace(node.Attributes.getNamedItem("DANS4").nodeValue, vbLf, vbCrLf))
  DANS5 = Val(Replace(node.Attributes.getNamedItem("DANS5").nodeValue, vbLf, vbCrLf))
  DANS6 = Val(Replace(node.Attributes.getNamedItem("DANS6").nodeValue, vbLf, vbCrLf))
  CHECK_A = Val(Replace(node.Attributes.getNamedItem("CHECK_A").nodeValue, vbLf, vbCrLf))
  OKTIME = Val(Replace(node.Attributes.getNamedItem("OKTIME").nodeValue, vbLf, vbCrLf))
  WORKTIME = Val(Replace(node.Attributes.getNamedItem("WORKTIME").nodeValue, vbLf, vbCrLf))
  TAIR1 = Val(Replace(node.Attributes.getNamedItem("TAIR1").nodeValue, vbLf, vbCrLf))
  TAIR2 = Val(Replace(node.Attributes.getNamedItem("TAIR2").nodeValue, vbLf, vbCrLf))
  HC_CODE = Replace(node.Attributes.getNamedItem("HC_CODE").nodeValue, vbLf, vbCrLf)
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
  node.setAttribute "DCALL", CDbl(DCALL)
  node.setAttribute "DCOUNTER", CDbl(DCOUNTER)
  node.setAttribute "Q1", Replace(CStr(Q1), ",", ".")
  node.setAttribute "Q2", Replace(CStr(Q2), ",", ".")
  node.setAttribute "T1", Replace(CStr(T1), ",", ".")
  node.setAttribute "T2", Replace(CStr(T2), ",", ".")
  node.setAttribute "DT12", Replace(CStr(DT12), ",", ".")
  node.setAttribute "T3", Replace(CStr(T3), ",", ".")
  node.setAttribute "T4", Replace(CStr(T4), ",", ".")
  node.setAttribute "T5", Replace(CStr(T5), ",", ".")
  node.setAttribute "DT45", Replace(CStr(DT45), ",", ".")
  node.setAttribute "T6", Replace(CStr(T6), ",", ".")
  node.setAttribute "V1", Replace(CStr(V1), ",", ".")
  node.setAttribute "V2", Replace(CStr(V2), ",", ".")
  node.setAttribute "DV12", Replace(CStr(DV12), ",", ".")
  node.setAttribute "V3", Replace(CStr(V3), ",", ".")
  node.setAttribute "V4", Replace(CStr(V4), ",", ".")
  node.setAttribute "V5", Replace(CStr(V5), ",", ".")
  node.setAttribute "DV45", Replace(CStr(DV45), ",", ".")
  node.setAttribute "V6", Replace(CStr(V6), ",", ".")
  node.setAttribute "M1", Replace(CStr(M1), ",", ".")
  node.setAttribute "M2", Replace(CStr(M2), ",", ".")
  node.setAttribute "DM12", Replace(CStr(DM12), ",", ".")
  node.setAttribute "M3", Replace(CStr(M3), ",", ".")
  node.setAttribute "M4", Replace(CStr(M4), ",", ".")
  node.setAttribute "M5", Replace(CStr(M5), ",", ".")
  node.setAttribute "DM45", Replace(CStr(DM45), ",", ".")
  node.setAttribute "M6", Replace(CStr(M6), ",", ".")
  node.setAttribute "P1", Replace(CStr(P1), ",", ".")
  node.setAttribute "P2", Replace(CStr(P2), ",", ".")
  node.setAttribute "P3", Replace(CStr(P3), ",", ".")
  node.setAttribute "P4", Replace(CStr(P4), ",", ".")
  node.setAttribute "P5", Replace(CStr(P5), ",", ".")
  node.setAttribute "P6", Replace(CStr(P6), ",", ".")
  node.setAttribute "G1", Replace(CStr(G1), ",", ".")
  node.setAttribute "G2", Replace(CStr(G2), ",", ".")
  node.setAttribute "G3", Replace(CStr(G3), ",", ".")
  node.setAttribute "G4", Replace(CStr(G4), ",", ".")
  node.setAttribute "G5", Replace(CStr(G5), ",", ".")
  node.setAttribute "G6", Replace(CStr(G6), ",", ".")
  node.setAttribute "TCOOL", Replace(CStr(TCOOL), ",", ".")
  node.setAttribute "TCE1", Replace(CStr(TCE1), ",", ".")
  node.setAttribute "TCE2", Replace(CStr(TCE2), ",", ".")
  node.setAttribute "TSUM1", Replace(CStr(TSUM1), ",", ".")
  node.setAttribute "TSUM2", Replace(CStr(TSUM2), ",", ".")
  node.setAttribute "Q1H", Replace(CStr(Q1H), ",", ".")
  node.setAttribute "Q2H", Replace(CStr(Q2H), ",", ".")
  node.setAttribute "V1H", Replace(CStr(V1H), ",", ".")
  node.setAttribute "V2H", Replace(CStr(V2H), ",", ".")
  node.setAttribute "V4H", Replace(CStr(V4H), ",", ".")
  node.setAttribute "V5H", Replace(CStr(V5H), ",", ".")
  node.setAttribute "ERRTIME", Replace(CStr(ERRTIME), ",", ".")
  node.setAttribute "ERRTIMEH", Replace(CStr(ERRTIMEH), ",", ".")
  node.setAttribute "HC", HC
  node.setAttribute "SP", Replace(CStr(SP), ",", ".")
  node.setAttribute "SP_TB1", Replace(CStr(SP_TB1), ",", ".")
  node.setAttribute "SP_TB2", Replace(CStr(SP_TB2), ",", ".")
  node.setAttribute "DATETIMECOUNTER", CDbl(datetimeCOUNTER)
  node.setAttribute "DG12", Replace(CStr(DG12), ",", ".")
  node.setAttribute "DG45", Replace(CStr(DG45), ",", ".")
  node.setAttribute "DP12", Replace(CStr(DP12), ",", ".")
  node.setAttribute "DP45", Replace(CStr(DP45), ",", ".")
  node.setAttribute "UNITSR", UNITSR
  node.setAttribute "Q3", Replace(CStr(Q3), ",", ".")
  node.setAttribute "Q4", Replace(CStr(Q4), ",", ".")
  node.setAttribute "PATM", Replace(CStr(PATM), ",", ".")
  node.setAttribute "Q5", Replace(CStr(Q5), ",", ".")
  node.setAttribute "DQ12", Replace(CStr(DQ12), ",", ".")
  node.setAttribute "DQ45", Replace(CStr(DQ45), ",", ".")
  node.setAttribute "PXB", Replace(CStr(PXB), ",", ".")
  node.setAttribute "DQ", Replace(CStr(DQ), ",", ".")
  node.setAttribute "HC_1", HC_1
  node.setAttribute "HC_2", HC_2
  node.setAttribute "THOT", Replace(CStr(THOT), ",", ".")
  node.setAttribute "DANS1", Replace(CStr(DANS1), ",", ".")
  node.setAttribute "DANS2", Replace(CStr(DANS2), ",", ".")
  node.setAttribute "DANS3", Replace(CStr(DANS3), ",", ".")
  node.setAttribute "DANS4", Replace(CStr(DANS4), ",", ".")
  node.setAttribute "DANS5", Replace(CStr(DANS5), ",", ".")
  node.setAttribute "DANS6", Replace(CStr(DANS6), ",", ".")
  node.setAttribute "CHECK_A", Replace(CStr(CHECK_A), ",", ".")
  node.setAttribute "OKTIME", Replace(CStr(OKTIME), ",", ".")
  node.setAttribute "WORKTIME", Replace(CStr(WORKTIME), ",", ".")
  node.setAttribute "TAIR1", Replace(CStr(TAIR1), ",", ".")
  node.setAttribute "TAIR2", Replace(CStr(TAIR2), ",", ".")
  node.setAttribute "HC_CODE", HC_CODE
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
m_IsLocked = Application.MTZSession.IsLocked("DATACURR_H", id)
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
OK = Application.MTZSession.LockResource("DATACURR_H", id, Permanent)
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
Application.MTZSession.UnLockResource "DATACURR_H", id
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
CanLock = Application.MTZSession.CanLock("DATACURR_H", id)
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



