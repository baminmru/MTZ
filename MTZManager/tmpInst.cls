VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "tmpInst"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_HelpID = 890
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

Private mvarID As String 'local copy
Private mvarObjType As String 'local copy
Private mvarName As String
Private mvarIsSingle As Long
Private mvarStatus As String
'����������� ���� ������
'Parameters:
'[IN]   vData , ��� ���������: String  - ...
'See Also:
'  ID
'  Name
'  ObjType
'  Status
'Example:
' dim value as Variant
' value = ...��������...
' me.IsSingle = value
Public Property Let IsSingle(ByVal vData As String)
Attribute IsSingle.VB_HelpID = 900
     mvarIsSingle = vData
End Property
'����������� ���� ������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� String
'See Also:
'  ID
'  Name
'  ObjType
'  Status
'Example:
' dim variable as String
' variable = me.IsSingle
Public Property Get IsSingle() As String
    IsSingle = mvarIsSingle
End Property
'���������
'Parameters:
'[IN]   vData , ��� ���������: String  - ...
'See Also:
'  ID
'  IsSingle
'  Name
'  ObjType
'Example:
' dim value as Variant
' value = ...��������...
' me.Status = value
Public Property Let Status(ByVal vData As String)
Attribute Status.VB_HelpID = 915
     mvarStatus = vData
End Property
'���������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� String
'See Also:
'  ID
'  IsSingle
'  Name
'  ObjType
'Example:
' dim variable as String
' variable = me.Status
Public Property Get Status() As String
    Status = mvarStatus
End Property
'��������
'Parameters:
'[IN]   vData , ��� ���������: String  - ...
'See Also:
'  ID
'  IsSingle
'  ObjType
'  Status
'Example:
' dim value as Variant
' value = ...��������...
' me.Name = value
Public Property Let Name(ByVal vData As String)
Attribute Name.VB_HelpID = 905
     mvarName = vData
End Property
'��������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� String
'See Also:
'  ID
'  IsSingle
'  ObjType
'  Status
'Example:
' dim variable as String
' variable = me.Name
Public Property Get Name() As String
    Name = mvarName
End Property
'�������������
'Parameters:
'[IN]   vData , ��� ���������: String  - ...
'See Also:
'  IsSingle
'  Name
'  ObjType
'  Status
'Example:
' dim value as Variant
' value = ...��������...
' me.ID = value
Public Property Let ID(ByVal vData As String)
Attribute ID.VB_HelpID = 895
    mvarID = vData
End Property
'�������������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� String
'See Also:
'  IsSingle
'  Name
'  ObjType
'  Status
'Example:
' dim variable as String
' variable = me.ID
Public Property Get ID() As String
    ID = mvarID
End Property
'���
'Parameters:
'[IN]   vData , ��� ���������: String  - ...
'See Also:
'  ID
'  IsSingle
'  Name
'  Status
'Example:
' dim value as Variant
' value = ...��������...
' me.ObjType = value
Public Property Let ObjType(ByVal vData As String)
Attribute ObjType.VB_HelpID = 910
    mvarObjType = vData
End Property
'���
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� String
'See Also:
'  ID
'  IsSingle
'  Name
'  Status
'Example:
' dim variable as String
' variable = me.ObjType
Public Property Get ObjType() As String
    ObjType = mvarObjType
End Property

