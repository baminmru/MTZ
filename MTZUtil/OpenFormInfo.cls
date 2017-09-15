VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "OpenFormInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 335
Option Explicit
'Данные об открытых формах

Public Form As Object
Attribute Form.VB_VarHelpID = 340
Public InstanceID As String
Attribute InstanceID.VB_VarHelpID = 345
Public mode As String
Attribute mode.VB_VarHelpID = 355
Public modal As Boolean
Attribute modal.VB_VarHelpID = 350

