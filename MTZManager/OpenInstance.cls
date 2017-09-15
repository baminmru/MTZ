VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "OpenInstance"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_HelpID = 755
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3B8F879903C6"
Option Explicit
'открытые объекты

Private mvarLocked As Boolean 'local copy
Private mvarID As String 'local copy
Private mvarSite As String 'local copy
Private mvarCOMobject As Object 'local copy

'объект COM
'Parameters:
'[IN]   vData , тип параметра: Object  - объект
'See Also:
'  ID
'  Locked
'  site
'Example:
' dim value as Variant
' set value = new Variant
' set me.COMobject = value
Public Property Set COMobject(ByVal vData As Object)
Attribute COMobject.VB_HelpID = 760
    Set mvarCOMobject = vData
    
End Property

'объект COM
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  ID
'  Locked
'  site
'Example:
' dim variable as Object
' Set variable = me.COMobject
Public Property Get COMobject() As Object
    Set COMobject = mvarCOMobject
End Property

' ID объекта
'Parameters:
'[IN]   vData , тип параметра: String  - ID объекта
'See Also:
'  COMobject
'  Locked
'  site
'Example:
' dim value as Variant
' value = ...значение...
' me.ID = value
Public Property Let ID(ByVal vData As String)
Attribute ID.VB_HelpID = 765
    mvarID = vData
End Property

'ID объекта
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  COMobject
'  Locked
'  site
'Example:
' dim variable as String
' variable = me.ID
Public Property Get ID() As String
    ID = mvarID
End Property


'Блокировка от выгрузки из памяти
'Parameters:
'[IN]   vData , тип параметра: Boolean  - блокирован
'See Also:
'  COMobject
'  ID
'  site
'Example:
' dim value as Variant
' value = ...значение...
' me.Locked = value
Public Property Let Locked(ByVal vData As Boolean)
Attribute Locked.VB_HelpID = 770
    mvarLocked = vData
End Property

'Блокировка от выгрузки из памяти
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  - блокирован
'   false - нет
'See Also:
'  COMobject
'  ID
'  site
'Example:
' dim variable as Boolean
' variable = me.Locked
Public Property Get Locked() As Boolean
    Locked = mvarLocked
End Property

'сайт
'Parameters:
'[IN]   vData , тип параметра: String  - сайт
'See Also:
'  COMobject
'  ID
'  Locked
'Example:
' dim value as Variant
' value = ...значение...
' me.site = value
Public Property Let site(ByVal vData As String)
Attribute site.VB_HelpID = 775
    mvarSite = vData
End Property

'сайт
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  COMobject
'  ID
'  Locked
'Example:
' dim variable as String
' variable = me.site
Public Property Get site() As String
    site = mvarSite
End Property



Private Sub Class_Terminate()
DebugOutput "OpenInstance.Terminate"
End Sub
