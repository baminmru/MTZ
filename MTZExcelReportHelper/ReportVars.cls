VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ReportVars"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"ReportVar"
Attribute VB_Ext_KEY = "Member0" ,"ReportVar"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

'local variable to hold collection
Private mCol As Collection

Public Function Add(ByVal Name As String) As ReportVar
    
    Dim objNewMember As ReportVar
    
    Set objNewMember = Item(Name)
    
    If objNewMember Is Nothing Then
      Set objNewMember = New ReportVar
      objNewMember.Name = UCase(Name)
      mCol.Add objNewMember, UCase(Name)
    End If
    
    Set Add = objNewMember
    Set objNewMember = Nothing

End Function

Public Property Get Item(ByVal vntIndexKey As Variant) As ReportVar
Attribute Item.VB_UserMemId = 0
  On Error Resume Next
  Set Item = Nothing
  Set Item = mCol(UCase(vntIndexKey))
End Property



Public Property Get Count() As Long
    Count = mCol.Count
End Property


Public Sub Remove(ByVal vntIndexKey As Variant)
    mCol.Remove vntIndexKey
End Sub


Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
    'this property allows you to enumerate
    'this collection with the For...Each syntax
    Set NewEnum = mCol.[_NewEnum]
End Property


Private Sub Class_Initialize()
    'creates the collection when this class is created
    Set mCol = New Collection
End Sub


Private Sub Class_Terminate()
    'destroys collection when this class is terminated
    Set mCol = Nothing
End Sub

