VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Section"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

Public Query As String
Public rs As adodb.Recordset
Public HeaderRows As sectionrows
Public BodyRows As sectionrows
Public FooterRows As sectionrows

Private Sub Class_Initialize()
  Set HeaderRows = New sectionrows
  Set BodyRows = New sectionrows
  Set FooterRows = New sectionrows
End Sub

Private Sub Class_Terminate()
  Set HeaderRows = Nothing
  Set BodyRows = Nothing
  Set FooterRows = Nothing
End Sub
