VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TabStates"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_HelpID = 50
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"TabState"
Attribute VB_Ext_KEY = "Member0" ,"TabState"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit
'стандартная коллекция табов

'local variable to hold collection
Private mCol As Collection

Public Function Add(ByVal Visible As Boolean, ByVal Caption As String, ByVal Key As String) As TabState
Attribute Add.VB_HelpID = 55
    Dim objNewMember As TabState
    Set objNewMember = New TabState


    'set the properties passed into the method
    objNewMember.Visible = Visible
    objNewMember.Caption = Caption
    objNewMember.Key = Key
    mCol.Add objNewMember, Key

    Set Add = objNewMember
    Set objNewMember = Nothing
End Function

Public Property Get Item(ByVal vntIndexKey As Variant) As TabState
Attribute Item.VB_HelpID = 65
Attribute Item.VB_UserMemId = 0
  On Error Resume Next
  Set Item = mCol(vntIndexKey)
End Property



Public Property Get Count() As Long
Attribute Count.VB_HelpID = 60
    'used when retrieving the number of elements in the
    'collection. Syntax: Debug.Print x.Count
    Count = mCol.Count
End Property


Public Sub Remove(ByVal vntIndexKey As Variant)
Attribute Remove.VB_HelpID = 75
  On Error Resume Next

    mCol.Remove vntIndexKey
End Sub


Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_HelpID = 70
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

