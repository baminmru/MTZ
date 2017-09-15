VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "BaseItem"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 10
Option Explicit
'Базовый интерфейс (пока не используестя)

Dim mID As String
Dim m_Parent As Object
Dim m_Application As Object

'идентификатор
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  Application
'  CloseParents
'  Parent
'Example:
' dim variable as String
' variable = me.ID
Public Property Get ID() As String
Attribute ID.VB_HelpID = 25
  ID = mID
End Property

'идентификатор
'Parameters:
'[IN][OUT]  s , тип параметра: String  - идентификатор
'See Also:
'  Application
'  CloseParents
'  Parent
'Example:
' dim value as Variant
' value = <значение>
' me.ID = value
Public Property Let ID(s As String)
   mID = s
End Property

'родитель
'Parameters:
'[IN][OUT]  newParent , тип параметра: Object  - родитель
'See Also:
'  Application
'  CloseParents
'  ID
'Example:
' dim value as Variant
' set value = <объект>
' set me.Parent = value
Public Property Set Parent(newParent As Object)
  Set m_Parent = newParent
End Property

'родитель
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  Application
'  CloseParents
'  ID
'Example:
' dim variable as Object
' Set variable = me.Parent
Public Property Get Parent() As Object
Attribute Parent.VB_HelpID = 30
  Set Parent = m_Parent
End Property

'Приложение
'Parameters:
'[IN][OUT]  newApplication , тип параметра: Object  - Приложение
'See Also:
'  CloseParents
'  ID
'  Parent
'Example:
' dim value as Variant
' set value = <объект>
' set me.Application = value
Public Property Set Application(newApplication As Object)
  Set m_Application = newApplication
End Property

'Приложение
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  CloseParents
'  ID
'  Parent
'Example:
' dim variable as Object
' Set variable = me.Application
Public Property Get Application() As Object
Attribute Application.VB_HelpID = 15
 If m_Parent Is Nothing Then
    Set Application = Me
  Else
    Set Application = m_Application
  End If
End Property

' удалить привязку
'Parameters:
' параметров нет
'See Also:
'  Application
'  ID
'  Parent
'Example:
'  call me.CloseParents()
Public Sub CloseParents()
Attribute CloseParents.VB_HelpID = 20
  Set m_Application = Nothing
  Set m_Parent = Nothing
End Sub
