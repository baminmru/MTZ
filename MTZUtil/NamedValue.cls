VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "NamedValue"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 245
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit
'Именованные значения

Public TheName As String
Attribute TheName.VB_VarHelpID = 255

Public Value As Variant
Attribute Value.VB_VarHelpID = 260

Public ValueType As ADODB.DataTypeEnum
Attribute ValueType.VB_VarHelpID = 275

Public ValueSize As Long
Attribute ValueSize.VB_VarHelpID = 270

Public ValueDirection As ADODB.ParameterDirectionEnum
Attribute ValueDirection.VB_VarHelpID = 265

Private Sub Class_Initialize()
  ValueDirection = adParamInput
  ValueType = adVarChar
  ValueSize = 4000
End Sub
'прелобразование формата ID для ORACLE
'Parameters:
' параметров нет
'See Also:
'  TheName
'  Value
'  ValueDirection
'  ValueSize
'  ValueType
'Example:
'  call me.ORACLE_GUID()
Public Sub ORACLE_GUID()
Attribute ORACLE_GUID.VB_HelpID = 250
  ValueType = adChar
  ValueSize = 38
End Sub


