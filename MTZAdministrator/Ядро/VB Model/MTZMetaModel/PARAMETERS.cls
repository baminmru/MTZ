VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "PARAMETERS"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ ������� ��������� ������
Private m_ID As String
Private m_SecureStyleID As String
Private m_RowRetrived As Boolean
Private m_Changed As Boolean
Private m_Deleted As Boolean
Private m_RetriveTime As Date
Private m_ChangeTime As Date
Private m_AccessTime As Date
Private m_Parent As Object
Private m_Application As Application
Private m_sequence As Long
Private m_Name As String
Private m_Caption As String
Private m_TypeOfParm As Object
Dim m_TypeOfParm_ID As String
Dim m_TypeOfParm_ID_BRIEF As String
Private m_DataSize As Long
Private m_AllowNull As enumBoolean
Private m_OutParam As enumBoolean
Private m_ReferenceType As enumReferenceType
Private m_RefToType As Object
Dim m_RefToType_ID As String
Dim m_RefToType_ID_BRIEF As String
Private m_RefToPart As Object
Dim m_RefToPart_ID As String
Dim m_RefToPart_ID_BRIEF As String
Private m_Brief As String

'��������� �� ��������� ������
'Parameters:
'[IN]   fieldName , ��� ���������: string,
'[IN]   OldValue,, ��� ���������: Variant
'[IN][OUT]   NewValue, ��� ���������: Variant  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Event Change(ByVal fieldName As String, ByVal OldValue, ByRef NewValue)
Private m_IsLocked As LockStyle






'������� ��������
'Parameters:
' ���������� ���
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me. Deleted
Public Property Get Deleted() As Boolean
  Deleted = m_Deleted
End Property

'������� ���������
'Parameters:
' ���������� ���
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me. Changed
Public Property Get Changed() As Boolean
  Changed = m_Changed
End Property

'���������� ������� ���������
'Parameters:
'[IN][OUT]  newChanged , ��� ���������: boolean  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...��������...
' me. Changed = value
Friend Property Let Changed(newChanged As Boolean)
  m_Changed = newChanged
End Property

'������ ������������� ������
'Parameters:
'[IN]   newID , ��� ���������: string  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...��������...
' me. ID = value
Friend Property Let id(ByVal newID As String)
  If m_ID = "" Then
    m_ID = newID
  End If
End Property

'������������� ������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� string
'See Also:
'Example:
' dim variable as string
' variable = me. ID
Public Property Get id() As String
  If m_ID = "" Then m_ID = CreateGUID2
  id = m_ID
End Property

'������ ����� ������
'Parameters:
'[IN]   newID , ��� ���������: string  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...��������...
' me. SecureStyleID = value
Friend Property Let SecureStyleID(ByVal newID As String)
    m_SecureStyleID = newID
End Property

'����� ������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� string
'See Also:
'Example:
' dim variable as string
' variable = me. SecureStyleID
Public Property Get SecureStyleID() As String
  SecureStyleID = m_SecureStyleID
End Property

'�������� ������� �������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� string
'See Also:
'Example:
' dim variable as string
' variable = me. PartName
Public Property Get PartName() As String
  PartName = "PARAMETERS"
End Property

'������ ������������ ������
'Parameters:
'[IN][OUT]  newParent , ��� ���������: object  - ...
'See Also:
'Example:
' dim value as Variant
' set value = new Variant
' set me. Parent = value
Friend Property Set Parent(newParent As Object)
  Set m_Parent = newParent
End Property

'�������� ������������ ������
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Parent
Public Property Get Parent() As Object
  Set Parent = m_Parent
End Property

'������ �������� ������
'Parameters:
'[IN][OUT]  newApplication , ��� ���������: Application  - ...
'See Also:
'Example:
' dim value as Variant
' set value = new Variant
' set me. Application = value
Friend Property Set Application(newApplication As Application)
  Set m_Application = newApplication
  m_Application.Logger.Message "PARAMETERS.Init"
End Property

'�������� ������
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ Application
'  ,��� Nothing
'See Also:
'Example:
' dim variable as Application
' Set variable = me. Application
Public Property Get Application() As Application
  Set Application = m_Application
End Property

'��������� ������������� ����������� ��������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.CloseParents()
Private Sub CloseParents()
  Set m_Application = Nothing
  Set m_Parent = Nothing
End Sub

'���������� ������� - ������� �� ����
'Parameters:
'[IN][OUT]  newRetrived , ��� ���������: boolean  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...��������...
' me. RowRetrived = value
Friend Property Let RowRetrived(newRetrived As Boolean)
  m_RowRetrived = newRetrived
End Property

'�������� ������� - ������� �� ����
'Parameters:
' ���������� ���
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me. RowRetrived
Public Property Get RowRetrived() As Boolean
  RowRetrived = m_RowRetrived
End Property

'������ ���� � ����� ���������� �� ����
'Parameters:
'[IN][OUT]  newRetriveTime , ��� ���������: date  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...��������...
' me. RetriveTime = value
Friend Property Let RetriveTime(newRetriveTime As Date)
  m_RetriveTime = newRetriveTime
End Property

'���� � ����� ���������� �� ����
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� date
'See Also:
'Example:
' dim variable as date
' variable = me. RetriveTime
Public Property Get RetriveTime() As Date
  RetriveTime = m_RetriveTime
End Property

'������ ���� � ����� ���������
'Parameters:
'[IN][OUT]  newChangeTime , ��� ���������: date  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...��������...
' me. ChangeTime = value
Friend Property Let ChangeTime(newChangeTime As Date)
  m_ChangeTime = newChangeTime
End Property

'�������� ���� � ����� ���������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� date
'See Also:
'Example:
' dim variable as date
' variable = me. ChangeTime
Public Property Get ChangeTime() As Date
 ChangeTime = m_ChangeTime
End Property

'������ ����� ���������
'Parameters:
'[IN][OUT]  newAccessTime , ��� ���������: date  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...��������...
' me. AccessTime = value
Friend Property Let AccessTime(newAccessTime As Date)
  m_AccessTime = newAccessTime
  If m_AccessTime <= m_RetriveTime Then m_AccessTime = m_RetriveTime + 0.001
End Property

'�������� ����� ���������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� date
'See Also:
'Example:
' dim variable as date
' variable = me. AccessTime
Public Property Get AccessTime() As Date
  AccessTime = m_AccessTime
End Property
Private Function GetFromXML(ByVal XML As String, ByVal TagName As String) As String
  Dim res As String
  On Error GoTo err
  Dim XMLDoc As New DOMDocument
  Call XMLDoc.loadXML(XML)
  Dim node As MSXML2.IXMLDOMNode
  For Each node In XMLDoc.childNodes.item(0).childNodes
    If (UCase(node.baseName) = "BRIEF") Then
      res = node.Text
      Exit For
    End If
  Next
err:
  GetFromXML = res
End Function
' let
'������������������

'������������������
'Parameters:
'[IN]   newValue , ��� ���������: long  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let sequence(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "sequence", sequence, NewValue

   m_sequence = NewValue
End If
End Property

'������������������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� long
'See Also:
'Example:
' dim variable as long
' variable = me. sequence
Public Property Get sequence() As Long
 LoadFromDatabase
 AccessTime = Now

   sequence = m_sequence
End Property
' let
'���

'���
'Parameters:
'[IN]   newValue , ��� ���������: String  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let Name(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Name", Name, NewValue

   m_Name = NewValue
End If
End Property

'���
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� String
'See Also:
'Example:
' dim variable as String
' variable = me. Name
Public Property Get Name() As String
 LoadFromDatabase
 AccessTime = Now

   Name = m_Name
End Property
' let
'���������

'���������
'Parameters:
'[IN]   newValue , ��� ���������: String  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let Caption(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Caption", Caption, NewValue

   m_Caption = NewValue
End If
End Property

'���������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� String
'See Also:
'Example:
' dim variable as String
' variable = me. Caption
Public Property Get Caption() As String
 LoadFromDatabase
 AccessTime = Now

   Caption = m_Caption
End Property
' let
'��� ������

'��� ������
'Parameters:
'[IN]   newValue , ��� ���������: object  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Set TypeOfParm(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TypeOfParm", TypeOfParm, NewValue
On Error Resume Next
m_TypeOfParm_ID = ""
m_TypeOfParm_ID = NewValue.id
'  set   m_TypeOfParm= newValue
End If
End Property

'��� ������
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. TypeOfParm
Public Property Get TypeOfParm() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_TypeOfParm As Object
If m_TypeOfParm_ID <> "" Then
  Set tmp_TypeOfParm = Application.FindRowObject("FIELDTYPE", m_TypeOfParm_ID)
  If tmp_TypeOfParm Is Nothing Then
    m_TypeOfParm_ID_BRIEF = ""
  Else
    m_TypeOfParm_ID_BRIEF = tmp_TypeOfParm.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "FIELDTYPE" & m_TypeOfParm_ID, tmp_TypeOfParm
  Set TypeOfParm = tmp_TypeOfParm
  Exit Property
End If
  '  set TypeOfParm = m_TypeOfParm
End Property
' let
'������

'������
'Parameters:
'[IN]   newValue , ��� ���������: long  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let DataSize(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DataSize", DataSize, NewValue

   m_DataSize = NewValue
End If
End Property

'������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� long
'See Also:
'Example:
' dim variable as long
' variable = me. DataSize
Public Property Get DataSize() As Long
 LoadFromDatabase
 AccessTime = Now

   DataSize = m_DataSize
End Property
' let
'����� �� ��������

'����� �� ��������
'Parameters:
'[IN]   newValue , ��� ���������: enumBoolean  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let AllowNull(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "AllowNull", AllowNull, NewValue

   m_AllowNull = NewValue
End If
End Property

'����� �� ��������
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ enumBoolean
'  ,��� Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. AllowNull
Public Property Get AllowNull() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   AllowNull = m_AllowNull
End Property
' let
'���������� ��������

'���������� ��������
'Parameters:
'[IN]   newValue , ��� ���������: enumBoolean  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let OutParam(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "OutParam", OutParam, NewValue

   m_OutParam = NewValue
End If
End Property

'���������� ��������
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ enumBoolean
'  ,��� Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. OutParam
Public Property Get OutParam() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   OutParam = m_OutParam
End Property
' let
'��� ������

'��� ������
'Parameters:
'[IN]   newValue , ��� ���������: enumReferenceType  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let ReferenceType(ByVal NewValue As enumReferenceType)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ReferenceType", ReferenceType, NewValue

   m_ReferenceType = NewValue
End If
End Property

'��� ������
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ enumReferenceType
'  ,��� Nothing
'See Also:
'Example:
' dim variable as enumReferenceType
' Set variable = me. ReferenceType
Public Property Get ReferenceType() As enumReferenceType
 LoadFromDatabase
 AccessTime = Now

   ReferenceType = m_ReferenceType
End Property
' let
'������ �� ���

'������ �� ���
'Parameters:
'[IN]   newValue , ��� ���������: object  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Set RefToType(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "RefToType", RefToType, NewValue
On Error Resume Next
m_RefToType_ID = ""
m_RefToType_ID = NewValue.id
'  set   m_RefToType= newValue
End If
End Property

'������ �� ���
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. RefToType
Public Property Get RefToType() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_RefToType As Object
If m_RefToType_ID <> "" Then
  Set tmp_RefToType = Application.FindRowObject("OBJECTTYPE", m_RefToType_ID)
  If tmp_RefToType Is Nothing Then
    m_RefToType_ID_BRIEF = ""
  Else
    m_RefToType_ID_BRIEF = tmp_RefToType.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "OBJECTTYPE" & m_RefToType_ID, tmp_RefToType
  Set RefToType = tmp_RefToType
  Exit Property
End If
  '  set RefToType = m_RefToType
End Property
' let
'������ �� ������

'������ �� ������
'Parameters:
'[IN]   newValue , ��� ���������: object  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Set RefToPart(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "RefToPart", RefToPart, NewValue
On Error Resume Next
m_RefToPart_ID = ""
m_RefToPart_ID = NewValue.id
'  set   m_RefToPart= newValue
End If
End Property

'������ �� ������
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. RefToPart
Public Property Get RefToPart() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_RefToPart As Object
If m_RefToPart_ID <> "" Then
  Set tmp_RefToPart = Application.FindRowObject("PART", m_RefToPart_ID)
  If tmp_RefToPart Is Nothing Then
    m_RefToPart_ID_BRIEF = ""
  Else
    m_RefToPart_ID_BRIEF = tmp_RefToPart.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PART" & m_RefToPart_ID, tmp_RefToPart
  Set RefToPart = tmp_RefToPart
  Exit Property
End If
  '  set RefToPart = m_RefToPart
End Property

'��������� ���� � ����������� ���������
'Parameters:
'[IN][OUT]   nv , ��� ���������: NamedValues  - ...
'See Also:
'Example:
'  call me.Pack({���������})
Public Sub Pack(ByRef nv As NamedValues)
  Dim nvi As NamedValue
  Set nv = Nothing
  Set nv = New NamedValues

  Set nvi = nv.Add("sequence", m_sequence)
nvi.ValueType = adInteger
  Set nvi = nv.Add("Name", m_Name)
nvi.ValueSize = 80
  Set nvi = nv.Add("Caption", m_Caption)
nvi.ValueSize = 80
 ' Reference to FIELDTYPE
    If m_TypeOfParm_ID = "" Then
       Set nvi = nv.Add("TypeOfParm", "")
    Else
       Set nvi = nv.Add("TypeOfParm", m_TypeOfParm_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("DataSize", m_DataSize)
nvi.ValueType = adInteger
  Set nvi = nv.Add("AllowNull", m_AllowNull)
nvi.ValueType = adInteger
  Set nvi = nv.Add("OutParam", m_OutParam)
nvi.ValueType = adInteger
  Set nvi = nv.Add("ReferenceType", m_ReferenceType)
nvi.ValueType = adInteger
 ' Reference to OBJECTTYPE
    If m_RefToType_ID = "" Then
       Set nvi = nv.Add("RefToType", "")
    Else
       Set nvi = nv.Add("RefToType", m_RefToType_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to PART
    If m_RefToPart_ID = "" Then
       Set nvi = nv.Add("RefToPart", "")
    Else
       Set nvi = nv.Add("RefToPart", m_RefToPart_ID)
    End If
    nvi.ORACLE_GUID
End Sub

'������� �������� ������
'Parameters:
'[IN]   UseServer , ��� ���������: boolean = false  - ...
'Returns:
'  �������� ���� string
'See Also:
'Example:
' dim variable as string
' variable = me. Brief(...���������...)
Public Function Brief(Optional ByVal UseServer As Boolean = False) As String
 Dim s As String
 If Application.WorkOffline Then

  m_Brief = ""
 m_Brief = m_Brief & Name & "; "
 m_Brief = m_Brief & Caption & "; "
 Brief = m_Brief
 Else
  On Error GoTo bye
   If UseServer Or m_Brief = "" Then
     Application.MTZSession.GetBrief PartName, id, s
     If Len(s) > 255 Then
       Brief = Left(s, 255) & "..."
     Else
       Brief = s
     End If
       m_Brief = Brief
   Else
     Brief = m_Brief
   End If
 End If
Exit Function
bye:
    Brief = "! ������ �������� ! (" & err.Description & ")"
End Function

'����������� �������� ����� �� ����������� ���������
'Parameters:
'[IN][OUT]   nv , ��� ���������: object  - ...
'See Also:
'Example:
'  call me.UnPack({���������})
Public Sub UnPack(ByRef nv As Object)
 On Error Resume Next
If TypeName(nv) = "NamedValues" Then

m_sequence = nv.item("sequence").Value
m_Name = nv.item("Name").Value
m_Caption = nv.item("Caption").Value
  m_TypeOfParm_ID = nv.item("TypeOfParm").Value
m_DataSize = nv.item("DataSize").Value
m_AllowNull = nv.item("AllowNull").Value
m_OutParam = nv.item("OutParam").Value
m_ReferenceType = nv.item("ReferenceType").Value
  m_RefToType_ID = nv.item("RefToType").Value
  m_RefToPart_ID = nv.item("RefToPart").Value
Else

m_sequence = nv.Fields("sequence").Value
m_Name = nv.Fields("Name").Value
m_Caption = nv.Fields("Caption").Value
  m_TypeOfParm_ID = nv.Fields("TypeOfParm").Value
m_DataSize = nv.Fields("DataSize").Value
m_AllowNull = nv.Fields("AllowNull").Value
m_OutParam = nv.Fields("OutParam").Value
m_ReferenceType = nv.Fields("ReferenceType").Value
  m_RefToType_ID = nv.Fields("RefToType").Value
  m_RefToPart_ID = nv.Fields("RefToPart").Value
End If
End Sub

'�������� ����
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.CleanFields()
Public Sub CleanFields()
   Dim nv As NamedValues
   Dim o As PARAMETERS
   Set o = New PARAMETERS
   Set o.Application = Me.Application
   Set o.Parent = Me.Parent
   o.Pack nv
   UnPack nv
   Set o = Nothing
End Sub

'��������� ���������
'Parameters:
' ���������� ���
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
'  variable = me.Save()
Public Function Save() As Boolean
   LoadFromDatabase
   If Application.WorkOffline Then Exit Function
   If Not CanChangeONLine Then Exit Function
   Dim nv As NamedValues
   Pack nv
   On Error GoTo bye
     Application.MTZSession.SaveRow2 PartName, id, Me.Parent.Parent.id, nv, Application.id
   Changed = False
   Save = True
Exit Function
bye:
  err.Raise err.Number, "PARAMETERS.Save", err.Description
End Function

'������� ������
'Parameters:
' ���������� ���
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
'  variable = me.Delete()
Public Function Delete() As Boolean
   Dim i As Long, OK As Boolean
If Application.WorkOffline Then
  If Not CanChangeOffline Then Exit Function
   On Error GoTo bye
  m_Deleted = True
  Delete = True
Else
  If Not CanChangeONLine Then Exit Function
   Delete = Application.MTZSession.DeleteRow2(PartName, id, Application.id)
   Changed = False
   'Compact
   CloseClass
End If
Exit Function
bye:
  err.Raise err.Number, "PARAMETERS.Delete", err.Description
End Function

'������ ����� ������
'Parameters:
'[IN]   SecurityStyleID , ��� ���������: string  - ...
'See Also:
'Example:
'  call me.Secure({���������})
Public Sub Secure(ByVal SecurityStyleID As String)
If Application.WorkOffline Then Exit Sub
On Error GoTo bye
  m_SecureStyleID = Application.MTZSession.Secure("PARAMETERS", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "PARAMETERS.Secure", err.Description
End Sub

'�������������� ����� �� �������� ������ � �������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "PARAMETERS", id
Exit Sub
bye:
  err.Raise err.Number, "PARAMETERS.Propagate", err.Description
End Sub

'����������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 m_TypeOfParm_ID = ""
 Set m_TypeOfParm = Nothing
 m_RefToType_ID = ""
 Set m_RefToType = Nothing
 m_RefToPart_ID = ""
 Set m_RefToPart = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "PARAMETERS.CloseClass"
 CloseParents
End Sub

'��������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.Refresh()
Public Sub Refresh()
    On Error Resume Next
    RowRetrived = False
    m_Brief = ""
End Sub

'��������� �� ���� ������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.LoadFromDatabase ()
Public Sub LoadFromDatabase()
    On Error Resume Next
   If id = "" Then Exit Sub
   If Application.WorkOffline Then
     RowRetrived = True
     RetriveTime = Now
     Exit Sub
   End If
   Dim rs As ADODB.Recordset
   If Not RowRetrived Then
     CleanFields
     Set rs = Application.MTZSession.GetRow(PartName, id)
     UnPack rs
     m_SecureStyleID = rs!SecurityStyleID
     RowRetrived = True
     RetriveTime = Now
   End If
End Sub

'����� ������ ������� � �������� ��������
'Parameters:
'[IN]   StrID , ��� ���������: string,
'[IN]   InstID , ��� ���������: string  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me.FindObject(...���������...)
Public Function FindObject(ByVal StrID As String, ByVal InstID As String) As Object
 Dim m_FindObject As Object
 Static inFindObject As Boolean
 If StrID = "" Then Exit Function
 If InstID = "" Then Exit Function
 If inFindObject Then Exit Function
 inFindObject = True
 If StrID = PartName Then
   If InstID = id Then
     Set m_FindObject = Me
   End If
 End If

 Set FindObject = m_FindObject
 Set m_FindObject = Nothing
 inFindObject = False
End Function

'�������������� ������� �������� ������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.Compact()
Public Sub Compact()
 If Not Changed Then
   CleanFields
   RowRetrived = False
 End If

End Sub

'����������� ��������� �������� ������
'Parameters:
'[IN]   fieldName , ��� ���������: string,
'[IN]   OldValue,, ��� ���������: Variant
'[IN][OUT]   NewValue, ��� ���������: Variant  - ...
'See Also:
'Example:
'  call me.OnChange({���������})
Friend Sub OnChange(ByVal fieldName As String, ByVal OldValue, ByRef NewValue)
RaiseEvent Change(fieldName, OldValue, NewValue)
End Sub



'��������� �� ������� XML
'Parameters:
'[IN][OUT]   node , ��� ���������: IXMLDOMNode,
'[IN]   LoadMode , ��� ���������: integer=0  - ...
'See Also:
'Example:
'  call me.XMLLoad({���������})
Public Sub XMLLoad(node As IXMLDOMNode, Optional ByVal LoadMode As Integer = 0)
  On Error Resume Next
  Dim e_list As IXMLDOMNodeList
  Dim e_ As IXMLDOMNode
  If LoadMode <> 2 Then m_ID = node.Attributes.getNamedItem("ID").nodeValue
  m_Deleted = node.Attributes.getNamedItem("Deleted").nodeValue
  m_IsLocked = node.Attributes.getNamedItem("IsLocked").nodeValue
  If m_IsLocked > 2 Then m_IsLocked = 0
  m_RetriveTime = node.Attributes.getNamedItem("RetriveTime").nodeValue
  m_ChangeTime = node.Attributes.getNamedItem("ChangeTime").nodeValue
  m_AccessTime = node.Attributes.getNamedItem("AccessTime").nodeValue
  If Application.WorkOffline And m_IsLocked = LockSession Then m_IsLocked = NoLock
  Secure node.Attributes.getNamedItem("SECURITYSTYLEID").nodeValue
  sequence = node.Attributes.getNamedItem("SEQUENCE").nodeValue
  Name = Replace(node.Attributes.getNamedItem("NAME").nodeValue, vbLf, vbCrLf)
  Caption = Replace(node.Attributes.getNamedItem("CAPTION").nodeValue, vbLf, vbCrLf)
  Set TypeOfParm = Nothing
  m_TypeOfParm_ID = node.Attributes.getNamedItem("TYPEOFPARM").nodeValue
  m_TypeOfParm_ID_BRIEF = node.Attributes.getNamedItem("TYPEOFPARM_BRIEF").nodeValue
  DataSize = node.Attributes.getNamedItem("DATASIZE").nodeValue
  AllowNull = node.Attributes.getNamedItem("ALLOWNULL").nodeValue
  OutParam = node.Attributes.getNamedItem("OUTPARAM").nodeValue
  ReferenceType = node.Attributes.getNamedItem("REFERENCETYPE").nodeValue
  Set RefToType = Nothing
  m_RefToType_ID = node.Attributes.getNamedItem("REFTOTYPE").nodeValue
  m_RefToType_ID_BRIEF = node.Attributes.getNamedItem("REFTOTYPE_BRIEF").nodeValue
  Set RefToPart = Nothing
  m_RefToPart_ID = node.Attributes.getNamedItem("REFTOPART").nodeValue
  m_RefToPart_ID_BRIEF = node.Attributes.getNamedItem("REFTOPART_BRIEF").nodeValue
  On Error GoTo bye
  'if m_ChangeTime >= m_RetriveTime then m_Changed = true
  m_Changed = True
  m_RowRetrived = True
  m_Brief = ""
  On Error Resume Next
  Exit Sub
bye:
  DebugOutput err.Description
End Sub


'��������� � ������� XML
'Parameters:
'[IN][OUT]  node , ��� ���������: IXMLDOMElement,
'[IN][OUT]   xdom , ��� ���������: DomDocument  - ...
'See Also:
'Example:
'  call me.XMLSave({���������})
Public Sub XMLSave(node As IXMLDOMElement, xdom As DOMDocument)
On Error Resume Next
  Dim e_ As IXMLDOMElement
  LoadFromDatabase
  node.setAttribute "ID", m_ID
  node.setAttribute "Deleted", m_Deleted
  node.setAttribute "IsLocked", m_IsLocked
  node.setAttribute "RetriveTime", CDbl(m_RetriveTime)
  node.setAttribute "ChangeTime", CDbl(m_ChangeTime)
  node.setAttribute "SECURITYSTYLEID", m_SecureStyleID
  node.setAttribute "SEQUENCE", sequence
  node.setAttribute "NAME", Name
  node.setAttribute "CAPTION", Caption
  node.setAttribute "TYPEOFPARM", m_TypeOfParm_ID
  If Not (TypeOfParm Is Nothing) Then
    node.setAttribute "TYPEOFPARM_BRIEF", TypeOfParm.Brief
  Else
    node.setAttribute "TYPEOFPARM_BRIEF", m_TypeOfParm_ID_BRIEF
  End If
  node.setAttribute "DATASIZE", DataSize
  node.setAttribute "ALLOWNULL", AllowNull
  node.setAttribute "OUTPARAM", OutParam
  node.setAttribute "REFERENCETYPE", ReferenceType
  node.setAttribute "REFTOTYPE", m_RefToType_ID
  If Not (RefToType Is Nothing) Then
    node.setAttribute "REFTOTYPE_BRIEF", RefToType.Brief
  Else
    node.setAttribute "REFTOTYPE_BRIEF", m_RefToType_ID_BRIEF
  End If
  node.setAttribute "REFTOPART", m_RefToPart_ID
  If Not (RefToPart Is Nothing) Then
    node.setAttribute "REFTOPART_BRIEF", RefToPart.Brief
  Else
    node.setAttribute "REFTOPART_BRIEF", m_RefToPart_ID_BRIEF
  End If
  node.setAttribute "AccessTime", CDbl(m_AccessTime)
End Sub

'����� �� ���� ��������
'Parameters:
' ���������� ���
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me. CanChange
Public Property Get CanChange() As Boolean
   If Application.WorkOffline Then
     CanChange = CanChangeOffline
   Else
     CanChange = CanChangeONLine
   End If
End Property

'����� �� ���� �������� � ������ Offline
'Parameters:
' ���������� ���
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me. CanChangeOffline
Public Property Get CanChangeOffline() As Boolean
  Dim test As Boolean
  If Not Parent Is Nothing Then
   test = Parent.CanChangeOffline
  End If
  If Not test Then
   test = (IsLocked = LockPermanent)
  End If
   CanChangeOffline = test
End Property

'����� �� ���� �������� � ������ ONline
'Parameters:
' ���������� ���
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me. CanChangeONLine
Public Property Get CanChangeONLine() As Boolean
  Dim test As Boolean
  If Not Parent Is Nothing Then
   test = Parent.CanChangeONLine
  End If
  If Not test Then
   test = (IsLocked < ExternalLockSession)
  End If
   CanChangeONLine = test
End Property

'������ ��� ����������
'Parameters:
'[IN][OUT]  newIsLocked , ��� ���������: LockStyle  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...��������...
' me. IsLocked = value
Friend Property Let IsLocked(newIsLocked As LockStyle)
  m_IsLocked = newIsLocked
End Property

'������� ��� ����������
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ LockStyle
'  ,��� Nothing
'See Also:
'Example:
' dim variable as LockStyle
' Set variable = me. IsLocked
Public Property Get IsLocked() As LockStyle
  If m_IsLocked <> LockSession And m_IsLocked <> LockPermanent Then CheckLock
  IsLocked = m_IsLocked
End Property

'��������� ����������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.CheckLock()
Private Sub CheckLock()
Static LastCheckTime As Date
If Application.WorkOffline Then Exit Sub
If Now - LastCheckTime < CDbl(CDate("00:00:10")) Then Exit Sub
On Error Resume Next
m_IsLocked = Application.MTZSession.IsLocked("PARAMETERS", id)
LastCheckTime = Now
End Sub

'�������������
'Parameters:
'[IN]   Permanent , ��� ���������: boolean=false   - ...
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me.LockResource(...���������...)
Public Function LockResource(Optional ByVal Permanent As Boolean = False) As Boolean
If Application.WorkOffline Then Exit Function
  Dim OK
OK = Application.MTZSession.LockResource("PARAMETERS", id, Permanent)
  If OK Then
    If Permanent Then m_IsLocked = LockPermanent Else m_IsLocked = LockSession
  Else
    m_IsLocked = NoLock
  End If
bye:
End Function

'����� ���������� �������
'Parameters:
' ���������� ���
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
'  variable = me.UnLockResource()
Public Function UnLockResource() As Boolean
If Application.WorkOffline Then Exit Function
On Error GoTo bye
Application.MTZSession.UnLockResource "PARAMETERS", id
m_IsLocked = NoLock
bye:
End Function

'�������� ������������
'Parameters:
' ���������� ���
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
'  variable = me.CanLock()
Public Function CanLock() As Boolean
If Application.WorkOffline Then Exit Function
On Error Resume Next
CanLock = Application.MTZSession.CanLock("PARAMETERS", id)
End Function

'�������� ���������� ���������� �����
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.BatchUpdate()
Public Sub BatchUpdate()
If Not Application.WorkOffline Then
  If Deleted Then
    Delete
    Exit Sub
  End If
  If Changed Then Save
End If
End Sub

'��������� ��� ������ ��������� �� ����
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.LoadAll()
Friend Sub LoadAll()
If Not Application.WorkOffline Then
  LoadFromDatabase
End If
End Sub


'��������� ������� ��� ������ ���� � ���������� ������
'Parameters:
'[IN][OUT]  tree , ��� ���������: object,
'[IN]   key , ��� ���������: string,
'[IN]   mode , ��� ���������: string,
'[IN][OUT]   optional Mask , ��� ���������: string = ""  - ...
'See Also:
'Example:
'  call me.Expand({���������})
Public Sub Expand(tree As Object, ByVal key As String, ByVal mode As String, Optional Mask As String = "")
 Dim id As String, struct As String, child As String
 Dim item As Object, i As Long, nid As String, tmpid As String
 Dim tidx As Long, tid As String 'only for tree styled structure
 On Error Resume Next
 id = Mid(key, 39, 38)
 struct = Right(tree.nodes.item(key).Parent.Parent.key, Len(tree.nodes.item(key).Parent.Parent.key) - 76)
 child = Right(key, Len(key) - 76)
 If id <> m_ID Then
   Exit Sub
 Else
    Set item = Me
 End If
 tree.nodes.item(key).Sorted = True
If mode = "" Then
 Select Case child
 End Select
End If ' mode="" (Default)
End Sub



