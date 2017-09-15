VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "FormCash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_HelpID = 55
Option Explicit
Private mCol As Collection

'добавить форму в коллекцию форм
'Parameters:
'[IN][OUT]   f , тип параметра: Form форма,
'[IN]   Name , тип параметра: String - название,
'[IN]   Filter , тип параметра: String  - постфикс
'Returns:
'  объект класса FormCashItem
'  ,или Nothing
'See Also:
'  Count
'  Item
'  NewEnum
'  Remove
'Example:
' dim variable as FormCashItem
' Set variable = me.Add(...параметры...)
Public Function Add(ByRef f As Form, ByVal Name As String, ByVal Filter As String) As FormCashItem
Attribute Add.VB_HelpID = 60
    'create a new object
    Dim objNewMember As FormCashItem
    
    Set objNewMember = Nothing
    On Error Resume Next
    
    
    Set objNewMember = mCol.Item(Name & "_" & Filter)
    If objNewMember Is Nothing Then
      Set objNewMember = New FormCashItem
      mCol.Add objNewMember, Name & "_" & Filter
    End If
    
    'set the properties passed into the method
    Set objNewMember.f = f
    objNewMember.Name = Name
    objNewMember.Filter = Filter

    'return the object created
    Set Add = objNewMember
    Set objNewMember = Nothing


End Function

'получить элемент
'Parameters:
'[IN]   vntIndexKey , тип параметра: Variant  - ключ
'Returns:
'  объект класса FormCashItem
'  ,или Nothing
'See Also:
'  Add
'  Count
'  NewEnum
'  Remove
'Example:
' dim variable as FormCashItem
' Set variable = me.Item(...параметры...)
Public Property Get Item(ByVal vntIndexKey As Variant) As FormCashItem
Attribute Item.VB_HelpID = 70
Attribute Item.VB_UserMemId = 0
Attribute Item.VB_MemberFlags = "200"
  On Error Resume Next
  Set Item = mCol(vntIndexKey)
End Property

'кол-во
'Parameters:
' параметров нет
'Returns:
'  значение типа Long
'See Also:
'  Add
'  Item
'  NewEnum
'  Remove
'Example:
' dim variable as Long
' variable = me.Count
Public Property Get Count() As Long
Attribute Count.VB_HelpID = 65
    Count = mCol.Count
End Property
'улаить из коллекции
'Parameters:
'[IN]   vntIndexKey , тип параметра: Variant  - ключ
'See Also:
'  Add
'  Count
'  Item
'  NewEnum
'Example:
'  call me.Remove(...параметры...)
Public Sub Remove(ByVal vntIndexKey As Variant)
Attribute Remove.VB_HelpID = 80
    On Error Resume Next
    mCol.Remove vntIndexKey
End Sub
' перечисление
'Parameters:
' параметров нет
'Returns:
'  объект класса IUnknown
'  ,или Nothing
'See Also:
'  Add
'  Count
'  Item
'  Remove
'Example:
' dim variable as IUnknown
' Set variable = me.NewEnum
Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_HelpID = 75
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


