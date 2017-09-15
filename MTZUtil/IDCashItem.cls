VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "IDCashItem"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 185
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit
' данные для кеша идентификаторов

'local variable(s) to hold property value(s)
Private mvarID As String 'local copy
Private mvarLoadDate As Date 'local copy
Private mvarChanged As Date 'local copy
Private mvarLocked As Boolean 'local copy
Private mvarDeleted As Boolean 'local copy
Private mvarIsNew As Boolean 'local copy
Private mvarStructID As String 'local copy
Private mvarBrief As String 'local copy

'Parameters:
'[IN]   vdata , тип параметра: String  - ...
'See Also:
'  Changed
'  Deleted
'  ID
'  IsNew
'  Locked
'Example:
' dim value as Variant
' value = <значение>
' me.Brief = value
Public Property Let Brief(ByVal vdata As String)
    mvarBrief = vdata
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  Changed
'  Deleted
'  ID
'  IsNew
'  Locked
'Example:
' dim variable as String
' variable = me.Brief
Public Property Get Brief() As String
Attribute Brief.VB_HelpID = 190
    Brief = mvarBrief
End Property

'Parameters:
'[IN]   vdata , тип параметра: String  - ...
'See Also:
'  Changed
'  Deleted
'  ID
'  IsNew
'  Locked
'Example:
' dim value as Variant
' value = <значение>
' me.StructID = value
Public Property Let StructID(ByVal vdata As String)
    mvarStructID = vdata
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  Changed
'  Deleted
'  ID
'  IsNew
'  Locked
'Example:
' dim variable as String
' variable = me.StructID
Public Property Get StructID() As String
Attribute StructID.VB_HelpID = 225
    StructID = mvarStructID
End Property

'Parameters:
'[IN]   vdata , тип параметра: Boolean  - ...
'See Also:
'  Changed
'  Deleted
'  ID
'  Locked
'  StructID
'Example:
' dim value as Variant
' value = <значение>
' me.IsNew = value
Public Property Let IsNew(ByVal vdata As Boolean)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.Locked = 5
    mvarIsNew = vdata
End Property

'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'  Changed
'  Deleted
'  ID
'  Locked
'  StructID
'Example:
' dim variable as Boolean
' variable = me.IsNew
Public Property Get IsNew() As Boolean
Attribute IsNew.VB_HelpID = 210
    IsNew = mvarIsNew
End Property

'Parameters:
'[IN]   vdata , тип параметра: Boolean  - ...
'See Also:
'  Changed
'  ID
'  IsNew
'  Locked
'  StructID
'Example:
' dim value as Variant
' value = <значение>
' me.Deleted = value
Public Property Let Deleted(ByVal vdata As Boolean)
    mvarDeleted = vdata
End Property

'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'  Changed
'  ID
'  IsNew
'  Locked
'  StructID
'Example:
' dim variable as Boolean
' variable = me.Deleted
Public Property Get Deleted() As Boolean
Attribute Deleted.VB_HelpID = 200
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.Locked = 5
    Deleted = mvarDeleted
End Property

'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'  Changed
'  Deleted
'  ID
'  IsNew
'  StructID
'Example:
' dim variable as Boolean
' variable = me.Locked
Public Property Get Locked() As Boolean
Attribute Locked.VB_HelpID = 220
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.Locked
    Locked = mvarLocked
End Property

'Parameters:
'[IN]   vdata , тип параметра: Boolean  - ...
'See Also:
'  Changed
'  Deleted
'  ID
'  IsNew
'  StructID
'Example:
' dim value as Variant
' value = <значение>
' me.Locked = value
Public Property Let Locked(ByVal vdata As Boolean)
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.Locked
     mvarLocked = vdata
End Property

'Parameters:
'[IN]   vdata , тип параметра: Date  - ...
'See Also:
'  Deleted
'  ID
'  IsNew
'  Locked
'  StructID
'Example:
' dim value as Variant
' value = <значение>
' me.Changed = value
Public Property Let Changed(ByVal vdata As Date)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.Changed = 5
    mvarChanged = vdata
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа Date
'See Also:
'  Deleted
'  ID
'  IsNew
'  Locked
'  StructID
'Example:
' dim variable as Date
' variable = me.Changed
Public Property Get Changed() As Date
Attribute Changed.VB_HelpID = 195
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.Changed
    Changed = mvarChanged
End Property

'Parameters:
'[IN]   vdata , тип параметра: Date  - ...
'See Also:
'  Brief
'  Changed
'  Deleted
'  ID
'  IsNew
'  Locked
'  StructID
'Example:
' dim value as Variant
' value = <значение>
' me.Loaddate = value
Public Property Let Loaddate(ByVal vdata As Date)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.LoadDate = 5
    mvarLoadDate = vdata
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа Date
'See Also:
'  Brief
'  Changed
'  Deleted
'  ID
'  IsNew
'  Locked
'  StructID
'Example:
' dim variable as Date
' variable = me.Loaddate
Public Property Get Loaddate() As Date
Attribute Loaddate.VB_HelpID = 215
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.LoadDate
    Loaddate = mvarLoadDate
End Property

'Parameters:
'[IN]   vdata , тип параметра: String  - ...
'See Also:
'  Changed
'  Deleted
'  IsNew
'  Locked
'  StructID
'Example:
' dim value as Variant
' value = <значение>
' me.ID = value
Public Property Let ID(ByVal vdata As String)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.ID = 5
    mvarID = vdata
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  Changed
'  Deleted
'  IsNew
'  Locked
'  StructID
'Example:
' dim variable as String
' variable = me.ID
Public Property Get ID() As String
Attribute ID.VB_HelpID = 205
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.ID
    ID = mvarID
End Property



