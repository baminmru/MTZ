VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "OpenInstances"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_HelpID = 780
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"OpenInstance"
Attribute VB_Ext_KEY = "Member0" ,"OpenInstance"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3B8F879A0147"
Option Explicit
'����������� ��������� ��� �������� ��������

'local variable to hold collection
'##ModelId=3B8F879A01DD
Private mCol As Collection

'��������
'Parameters:
'[IN][OUT]  ID , ��� ���������: String  -�������������  �������
'Returns:
'  ������ ������ OpenInstance
'  ,��� Nothing
'See Also:
'  Count
'  Item
'  NewEnum
'  Remove
'Example:
' dim variable as OpenInstance
' Set variable = me.Add(...���������...)
Public Function Add(ID As String) As OpenInstance
Attribute Add.VB_HelpID = 785
    'create a new object
    Dim objNewMember As OpenInstance
    Set objNewMember = New OpenInstance

    objNewMember.ID = ID
    mCol.Add objNewMember, ID

    'return the object created
    Set Add = objNewMember
    Set objNewMember = Nothing

End Function

'�������� �� ���������
'Parameters:
'[IN]   vntIndexKey , ��� ���������: Variant  - ����
'Returns:
'  ������ ������ OpenInstance
'  ,��� Nothing
'See Also:
'  Add
'  Count
'  NewEnum
'  Remove
'Example:
' dim variable as OpenInstance
' Set variable = me.Item(...���������...)
Public Property Get Item(ByVal vntIndexKey As Variant) As OpenInstance
Attribute Item.VB_HelpID = 795
Attribute Item.VB_UserMemId = 0
Attribute Item.VB_MemberFlags = "200"
  On Error Resume Next
  Set Item = mCol(vntIndexKey)
End Property

'���-��
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� Long
'See Also:
'  Add
'  Item
'  NewEnum
'  Remove
'Example:
' dim variable as Long
' variable = me.Count
Public Property Get Count() As Long
Attribute Count.VB_HelpID = 790
    'used when retrieving the number of elements in the
    'collection. Syntax: debugoutput x.Count
    Count = mCol.Count
End Property

'������� �� ���������
'Parameters:
'[IN]   vntIndexKey , ��� ���������: Variant  - ����
'See Also:
'  Add
'  Count
'  Item
'  NewEnum
'Example:
'  call me.Remove(...���������...)
Public Sub Remove(ByVal vntIndexKey As Variant)
Attribute Remove.VB_HelpID = 805
    

    mCol.Remove vntIndexKey
End Sub

'�������� ���������
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ IUnknown
'  ,��� Nothing
'See Also:
'  Add
'  Count
'  Item
'  Remove
'Example:
' dim variable as IUnknown
' Set variable = me.NewEnum
Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_HelpID = 800
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
    'this property allows you to enumerate
    'this collection with the For...Each syntax
    Set NewEnum = mCol.[_NewEnum]
End Property


'##ModelId=3B8F879A025F
Private Sub Class_Initialize()
    'creates the collection when this class is created
    Set mCol = New Collection
End Sub


'##ModelId=3B8F879A0273
Private Sub Class_Terminate()
    Set mCol = Nothing
    DebugOutput "OpenInstance.Terminate"
End Sub

Friend Sub CloseClass()
  Dim oi As OpenInstance
  On Error Resume Next
  For Each oi In mCol
    If Not oi.COMobject Is Nothing Then
      oi.COMobject.CloseClass
      Set oi.COMobject = Nothing
      oi.ID = ""
    End If
  Next
End Sub
