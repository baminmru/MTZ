VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Dloads"
Attribute VB_GlobalNameSpace = True
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Private mCol As Collection

Private Sub Class_Initialize()
  Set mCol = New Collection
End Sub

Public Sub Add(Item As Dload, Key As Variant)
  mCol.Add Item, Key
End Sub

Public Function Item(Index As Variant) As Dload
  On Error Resume Next
  Set Item = mCol.Item(Index)
End Function

Public Sub CloseClass()
  Dim i As Long
  For i = 1 To mCol.Count
    Item(i).CloseClass
    Set Item(i) = Nothing
  Next
  While Count > 0
    Call mCol.Remove(1)
  Wend
End Sub

Public Function Count() As Long
  Count = mCol.Count
End Function
