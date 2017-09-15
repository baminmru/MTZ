VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "PageLink"
Attribute VB_GlobalNameSpace = True
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Public Name As String
Public ID As String
Public Href As String

Public Pages As New PageLinks

Private Sub Class_Terminate()
  Call CloseClass
  Set Pages = Nothing
End Sub

Public Sub CloseClass()
  On Error Resume Next
  Call Pages.CloseClass
End Sub
