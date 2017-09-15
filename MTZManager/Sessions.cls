VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Sessions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_HelpID = 810
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"Session"
Attribute VB_Ext_KEY = "Member0" ,"Session"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

'local variable to hold collection
Private mCol As Collection
Private mServerUserName As String
Private mServerUserPassword As String
Private mServerDBName As String
Private mServerRootDBName As String

'название базы данных
'Parameters:
'[IN][OUT]  NewVal , тип параметра: String  - название базы данных
'See Also:
'  Add
'  Count
'  IsDemoLic
'  IsWorkLic
'  Item
'  NewEnum
'  Remove
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'Example:
' dim value as Variant
' value = ...значение...
' me.ServerDBName = value
Public Property Let ServerDBName(NewVal As String)
Attribute ServerDBName.VB_HelpID = 850
  mServerDBName = NewVal
End Property

'название стартовой базы данных
'Parameters:
'[IN][OUT]  NewVal , тип параметра: String  - название стартовой базы данных
'See Also:
'  Add
'  Count
'  IsDemoLic
'  IsWorkLic
'  Item
'  NewEnum
'  Remove
'  ServerDBName
'  ServerUserName
'  ServerUserPassword
'Example:
' dim value as Variant
' value = ...значение...
' me.ServerRootDBName = value
Public Property Let ServerRootDBName(NewVal As String)
Attribute ServerRootDBName.VB_HelpID = 855
  mServerRootDBName = NewVal
End Property

'пользователь
'Parameters:
'[IN][OUT]  NewVal , тип параметра: String  - пользователь
'See Also:
'  Add
'  Count
'  IsDemoLic
'  IsWorkLic
'  Item
'  NewEnum
'  Remove
'  ServerDBName
'  ServerRootDBName
'  ServerUserPassword
'Example:
' dim value as Variant
' value = ...значение...
' me.ServerUserName = value
Public Property Let ServerUserName(NewVal As String)
Attribute ServerUserName.VB_HelpID = 860
  mServerUserName = NewVal
End Property

'пароль
'Parameters:
'[IN][OUT]  NewVal , тип параметра: String  - пароль
'See Also:
'  Add
'  Count
'  IsDemoLic
'  IsWorkLic
'  Item
'  NewEnum
'  Remove
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'Example:
' dim value as Variant
' value = ...значение...
' me.ServerUserPassword = value
Public Property Let ServerUserPassword(NewVal As String)
Attribute ServerUserPassword.VB_HelpID = 865
  mServerUserPassword = NewVal
End Property


'добавить новую сессию
'Parameters:
'[IN][OUT]  site , тип параметра: String  - название сайта
'Returns:
'  объект класса MTZSession.session
'  ,или Nothing
'See Also:
'  Count
'  IsDemoLic
'  IsWorkLic
'  Item
'  NewEnum
'  Remove
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'Example:
' dim variable as MTZSession.session
' Set variable = me.Add(...параметры...)
Public Function Add(site As String) As MTZSession.session
Attribute Add.VB_HelpID = 815
    Dim objNewMember As MTZSession.session
    Set objNewMember = Item(site)
    If objNewMember Is Nothing Then
      Set objNewMember = New MTZSession.session
      objNewMember.ServerUserName = mServerUserName
      objNewMember.ServerUserPassword = mServerUserPassword
      objNewMember.ServerDBName = mServerDBName
      objNewMember.ServerRootDBName = mServerRootDBName
      objNewMember.site = site
      mCol.Add objNewMember, site
    End If
    Set Add = objNewMember
    Set objNewMember = Nothing
End Function

'получить сессию
'Parameters:
'[IN][OUT]  vntIndexKey , тип параметра: Variant  - сайт или номер
'Returns:
'  объект класса MTZSession.session
'  ,или Nothing
'See Also:
'  Add
'  Count
'  IsDemoLic
'  IsWorkLic
'  NewEnum
'  Remove
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'Example:
' dim variable as MTZSession.session
' Set variable = me.Item(...параметры...)
Public Property Get Item(vntIndexKey As Variant) As MTZSession.session
Attribute Item.VB_HelpID = 835
Attribute Item.VB_UserMemId = 0
Attribute Item.VB_MemberFlags = "200"
  On Error Resume Next
  Set Item = mCol(vntIndexKey)
End Property

'кол-во сессий
'Parameters:
' параметров нет
'Returns:
'  значение типа Long
'See Also:
'  Add
'  IsDemoLic
'  IsWorkLic
'  Item
'  NewEnum
'  Remove
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'Example:
' dim variable as Long
' variable = me.Count
Public Property Get Count() As Long
Attribute Count.VB_HelpID = 820
    'used when retrieving the number of elements in the
    'collection. Syntax: debugoutput x.Count
    Count = mCol.Count
End Property

'удалить из коллекции
'Parameters:
'[IN][OUT]  vntIndexKey , тип параметра: Variant  - ключ
'See Also:
'  Add
'  Count
'  IsDemoLic
'  IsWorkLic
'  Item
'  NewEnum
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'Example:
'  call me.Remove(...параметры...)
Public Sub Remove(vntIndexKey As Variant)
Attribute Remove.VB_HelpID = 845
    If Not Item(vntIndexKey) Is Nothing Then
      With Item(vntIndexKey)
        If .sessionid <> "" Then .Logout
        If .Connected Then .CloseClass
      End With
    End If
    mCol.Remove vntIndexKey
End Sub

'перечисление
'Parameters:
' параметров нет
'Returns:
'  объект класса IUnknown
'  ,или Nothing
'See Also:
'  Add
'  Count
'  IsDemoLic
'  IsWorkLic
'  Item
'  Remove
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'Example:
' dim variable as IUnknown
' Set variable = me.NewEnum
Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_HelpID = 840
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
    Set NewEnum = mCol.[_NewEnum]
End Property


Private Sub Class_Initialize()
     Set mCol = New Collection
End Sub


Private Sub Class_Terminate()
    Dim s As MTZSession.session
    On Error Resume Next
    For Each s In mCol
      If Not s Is Nothing Then
        With s
          On Error Resume Next
          If .sessionid <> "" Then .Logout
          If .Connected Then .CloseClass
        End With
      End If
    Next
    Set mCol = Nothing
End Sub

'проверить тип лицензии
'Parameters:
'[IN]   LicCode , тип параметра: String  - строка
'Returns:
' Boolean, семантика результата:
'   true  - демо
'   false - нет
'See Also:
'  Add
'  Count
'  IsWorkLic
'  Item
'  NewEnum
'  Remove
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'Example:
' dim variable as Boolean
' variable = me.IsDemoLic(...параметры...)
Public Function IsDemoLic(ByVal LicCode As String) As Boolean
Attribute IsDemoLic.VB_HelpID = 825
    Dim LT As New LicTester
    'If sessionid <> "" Then
        If LT.TestLicense(LicCode) = LTDemoKey Then
        IsDemoLic = True
        End If
    'End If


End Function

'проверить лицензию
'Parameters:
'[IN]   LicCode , тип параметра: String  - строка
'Returns:
' Boolean, семантика результата:
'   true  - рабочая
'   false - нет
'See Also:
'  Add
'  Count
'  IsDemoLic
'  Item
'  NewEnum
'  Remove
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'Example:
' dim variable as Boolean
' variable = me.IsWorkLic(...параметры...)
Public Function IsWorkLic(ByVal LicCode As String) As Boolean
Attribute IsWorkLic.VB_HelpID = 830
    Dim LT As New LicTester
    'If sessionid <> "" Then
        If LT.TestLicense(LicCode) = LTWorkKey Then
        IsWorkLic = True
        End If
    'End If


End Function

