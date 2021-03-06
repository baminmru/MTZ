VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "PEKD_DEPT"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ ������� ������
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
Private m_PEKD_DEPLIMITS As PEKD_DEPLIMITS_col
Private m_PEKD_DEPDOG As PEKD_DEPDOG_col
Private m_PEKD_DEPT1C As PEKD_DEPT1C_col
Private m_name As String
Private m_Address As String
Private m_Supplier As Object
Dim m_Supplier_ID As String
Dim m_Supplier_ID_BRIEF As String
Private m_DocPrefix As String
Private m_PGDPName As String
Private m_town As Object
Dim m_town_ID As String
Dim m_town_ID_BRIEF As String
Private m_Code1C As String
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
  PartName = "PEKD_DEPT"
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
  m_Application.Logger.Message "PEKD_DEPT.Init"
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

'������ ��������� ������� �������������� ������
'Parameters:
'[IN]   Refresh , ��� ���������: boolean = true  - ...
'Returns:
'  ������ ������ PEKD_DEPLIMITS_col
'  ,��� Nothing
'See Also:
'Example:
' dim variable as PEKD_DEPLIMITS_col
' Set variable = me. PEKD_DEPLIMITS (...���������...)
Public Property Get PEKD_DEPLIMITS(Optional ByVal Refresh As Boolean = True) As PEKD_DEPLIMITS_col
 If m_PEKD_DEPLIMITS Is Nothing Then
   Set m_PEKD_DEPLIMITS = New PEKD_DEPLIMITS_col
   Set m_PEKD_DEPLIMITS.Parent = Me
   Set m_PEKD_DEPLIMITS.Application = Me.Application
   If Refresh Then m_PEKD_DEPLIMITS.Refresh
 End If
 Set PEKD_DEPLIMITS = m_PEKD_DEPLIMITS
End Property

'������ ��������� ������� �������� � ������������
'Parameters:
'[IN]   Refresh , ��� ���������: boolean = true  - ...
'Returns:
'  ������ ������ PEKD_DEPDOG_col
'  ,��� Nothing
'See Also:
'Example:
' dim variable as PEKD_DEPDOG_col
' Set variable = me. PEKD_DEPDOG (...���������...)
Public Property Get PEKD_DEPDOG(Optional ByVal Refresh As Boolean = True) As PEKD_DEPDOG_col
 If m_PEKD_DEPDOG Is Nothing Then
   Set m_PEKD_DEPDOG = New PEKD_DEPDOG_col
   Set m_PEKD_DEPDOG.Parent = Me
   Set m_PEKD_DEPDOG.Application = Me.Application
   If Refresh Then m_PEKD_DEPDOG.Refresh
 End If
 Set PEKD_DEPDOG = m_PEKD_DEPDOG
End Property

'������ ��������� ������� ����� � 1�
'Parameters:
'[IN]   Refresh , ��� ���������: boolean = true  - ...
'Returns:
'  ������ ������ PEKD_DEPT1C_col
'  ,��� Nothing
'See Also:
'Example:
' dim variable as PEKD_DEPT1C_col
' Set variable = me. PEKD_DEPT1C (...���������...)
Public Property Get PEKD_DEPT1C(Optional ByVal Refresh As Boolean = True) As PEKD_DEPT1C_col
 If m_PEKD_DEPT1C Is Nothing Then
   Set m_PEKD_DEPT1C = New PEKD_DEPT1C_col
   Set m_PEKD_DEPT1C.Parent = Me
   Set m_PEKD_DEPT1C.Application = Me.Application
   If Refresh Then m_PEKD_DEPT1C.Refresh
 End If
 Set PEKD_DEPT1C = m_PEKD_DEPT1C
End Property
' let
'��������

'��������
'Parameters:
'[IN]   newValue , ��� ���������: String  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let name(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "name", name, NewValue

   m_name = NewValue
End If
End Property

'��������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� String
'See Also:
'Example:
' dim variable as String
' variable = me. name
Public Property Get name() As String
 LoadFromDatabase
 AccessTime = Now

   name = m_name
End Property
' let
'�����

'�����
'Parameters:
'[IN]   newValue , ��� ���������: STRING  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let Address(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Address", Address, NewValue

   m_Address = NewValue
End If
End Property

'�����
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� STRING
'See Also:
'Example:
' dim variable as STRING
' variable = me. Address
Public Property Get Address() As String
 LoadFromDatabase
 AccessTime = Now

   Address = m_Address
End Property
' let
'�������� ���������

'�������� ���������
'Parameters:
'[IN]   newValue , ��� ���������: object  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Set Supplier(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Supplier", Supplier, NewValue
On Error Resume Next
m_Supplier_ID = ""
m_Supplier_ID = NewValue.id
' set   m_Supplier= newValue
End If
End Property

'�������� ���������
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Supplier
Public Property Get Supplier() As Object
 LoadFromDatabase
 AccessTime = Now
If m_Supplier_ID <> "" Then
  Set Supplier = Application.Manager.GetInstanceObject(Right(m_Supplier_ID, 38))
 Exit Property
End If
  ' set Supplier = m_Supplier
End Property
' let
'������� ������� ����������

'������� ������� ����������
'Parameters:
'[IN]   newValue , ��� ���������: String  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let DocPrefix(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DocPrefix", DocPrefix, NewValue

   m_DocPrefix = NewValue
End If
End Property

'������� ������� ����������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� String
'See Also:
'Example:
' dim variable as String
' variable = me. DocPrefix
Public Property Get DocPrefix() As String
 LoadFromDatabase
 AccessTime = Now

   DocPrefix = m_DocPrefix
End Property
' let
'�������� ����

'�������� ����
'Parameters:
'[IN]   newValue , ��� ���������: String  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let PGDPName(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PGDPName", PGDPName, NewValue

   m_PGDPName = NewValue
End If
End Property

'�������� ����
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� String
'See Also:
'Example:
' dim variable as String
' variable = me. PGDPName
Public Property Get PGDPName() As String
 LoadFromDatabase
 AccessTime = Now

   PGDPName = m_PGDPName
End Property
' let
'�����

'�����
'Parameters:
'[IN]   newValue , ��� ���������: object  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Set town(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "town", town, NewValue
On Error Resume Next
m_town_ID = ""
m_town_ID = NewValue.id
'  set   m_town= newValue
End If
End Property

'�����
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. town
Public Property Get town() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_town As Object
If m_town_ID <> "" Then
  Set tmp_town = Application.FindRowObject("ENTDIC_TOWN", m_town_ID)
  If tmp_town Is Nothing Then
    m_town_ID_BRIEF = ""
  Else
    m_town_ID_BRIEF = tmp_town.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "ENTDIC_TOWN" & m_town_ID, tmp_town
  Set town = tmp_town
  Exit Property
End If
  '  set town = m_town
End Property
' let
'���1�

'���1�
'Parameters:
'[IN]   newValue , ��� ���������: String  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let Code1C(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Code1C", Code1C, NewValue

   m_Code1C = NewValue
End If
End Property

'���1�
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� String
'See Also:
'Example:
' dim variable as String
' variable = me. Code1C
Public Property Get Code1C() As String
 LoadFromDatabase
 AccessTime = Now

   Code1C = m_Code1C
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

  Set nvi = nv.Add("name", m_name)
nvi.ValueSize = 255
  Set nvi = nv.Add("Address", m_Address)
 ' Reference to object
    If m_Supplier_ID = "" Then
       Set nvi = nv.Add("Supplier", "")
    Else
       Set nvi = nv.Add("Supplier", m_Supplier_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("DocPrefix", m_DocPrefix)
nvi.ValueSize = 3
  Set nvi = nv.Add("PGDPName", m_PGDPName)
nvi.ValueSize = 255
 ' Reference to ENTDIC_TOWN
    If m_town_ID = "" Then
       Set nvi = nv.Add("town", "")
    Else
       Set nvi = nv.Add("town", m_town_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("Code1C", m_Code1C)
nvi.ValueSize = 40
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
 m_Brief = m_Brief & name & "; "
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

m_name = nv.item("name").Value
m_Address = nv.item("Address").Value
  m_Supplier_ID = nv.item("Supplier").Value
m_DocPrefix = nv.item("DocPrefix").Value
m_PGDPName = nv.item("PGDPName").Value
  m_town_ID = nv.item("town").Value
m_Code1C = nv.item("Code1C").Value
Else

m_name = nv.Fields("name").Value
m_Address = nv.Fields("Address").Value
  m_Supplier_ID = nv.Fields("Supplier").Value
m_DocPrefix = nv.Fields("DocPrefix").Value
m_PGDPName = nv.Fields("PGDPName").Value
  m_town_ID = nv.Fields("town").Value
m_Code1C = nv.Fields("Code1C").Value
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
   Dim o As PEKD_DEPT
   Set o = New PEKD_DEPT
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
  err.Raise err.Number, "PEKD_DEPT.Save", err.Description
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
  err.Raise err.Number, "PEKD_DEPT.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("PEKD_DEPT", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "PEKD_DEPT.Secure", err.Description
End Sub

'�������������� ����� �� �������� ������ � �������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "PEKD_DEPT", id
Exit Sub
bye:
  err.Raise err.Number, "PEKD_DEPT.Propagate", err.Description
End Sub

'����������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

If Not m_PEKD_DEPLIMITS Is Nothing Then
  m_PEKD_DEPLIMITS.CloseClass
  Set m_PEKD_DEPLIMITS = Nothing
End If
If Not m_PEKD_DEPDOG Is Nothing Then
  m_PEKD_DEPDOG.CloseClass
  Set m_PEKD_DEPDOG = Nothing
End If
If Not m_PEKD_DEPT1C Is Nothing Then
  m_PEKD_DEPT1C.CloseClass
  Set m_PEKD_DEPT1C = Nothing
End If
 m_Supplier_ID = ""
 Set m_Supplier = Nothing
 m_town_ID = ""
 Set m_town = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "PEKD_DEPT.CloseClass"
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

 If m_FindObject Is Nothing Then
   Set m_FindObject = PEKD_DEPLIMITS.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = PEKD_DEPDOG.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = PEKD_DEPT1C.FindObject(StrID, InstID)
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

PEKD_DEPLIMITS.Compact
PEKD_DEPDOG.Compact
PEKD_DEPT1C.Compact
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
  name = Replace(node.Attributes.getNamedItem("NAME").nodeValue, vbLf, vbCrLf)
  Address = Replace(node.Attributes.getNamedItem("ADDRESS").nodeValue, vbLf, vbCrLf)
  Set Supplier = Nothing
  m_Supplier_ID = node.Attributes.getNamedItem("SUPPLIER").nodeValue
  m_Supplier_ID_BRIEF = node.Attributes.getNamedItem("SUPPLIER_BRIEF").nodeValue
  DocPrefix = Replace(node.Attributes.getNamedItem("DOCPREFIX").nodeValue, vbLf, vbCrLf)
  PGDPName = Replace(node.Attributes.getNamedItem("PGDPNAME").nodeValue, vbLf, vbCrLf)
  Set town = Nothing
  m_town_ID = node.Attributes.getNamedItem("TOWN").nodeValue
  m_town_ID_BRIEF = node.Attributes.getNamedItem("TOWN_BRIEF").nodeValue
  Code1C = Replace(node.Attributes.getNamedItem("CODE1C").nodeValue, vbLf, vbCrLf)
  On Error GoTo bye
  'if m_ChangeTime >= m_RetriveTime then m_Changed = true
  m_Changed = True
  m_RowRetrived = True
  m_Brief = ""
  On Error Resume Next
  Set e_list = node.selectNodes("PEKD_DEPLIMITS_COL")
  PEKD_DEPLIMITS.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("PEKD_DEPDOG_COL")
  PEKD_DEPDOG.XMLLoad e_list, LoadMode
  Set e_list = node.selectNodes("PEKD_DEPT1C_COL")
  PEKD_DEPT1C.XMLLoad e_list, LoadMode
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
  node.setAttribute "NAME", name
  node.setAttribute "ADDRESS", Address
  node.setAttribute "SUPPLIER", m_Supplier_ID
  If Not (Supplier Is Nothing) Then
    node.setAttribute "SUPPLIER_BRIEF", Supplier.Brief
  Else
    node.setAttribute "SUPPLIER_BRIEF", m_Supplier_ID_BRIEF
  End If
  node.setAttribute "DOCPREFIX", DocPrefix
  node.setAttribute "PGDPNAME", PGDPName
  node.setAttribute "TOWN", m_town_ID
  If Not (town Is Nothing) Then
    node.setAttribute "TOWN_BRIEF", town.Brief
  Else
    node.setAttribute "TOWN_BRIEF", m_town_ID_BRIEF
  End If
  node.setAttribute "CODE1C", Code1C
  node.setAttribute "AccessTime", CDbl(m_AccessTime)
  PEKD_DEPLIMITS.XMLSave node, xdom
  PEKD_DEPDOG.XMLSave node, xdom
  PEKD_DEPT1C.XMLSave node, xdom
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
m_IsLocked = Application.MTZSession.IsLocked("PEKD_DEPT", id)
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
OK = Application.MTZSession.LockResource("PEKD_DEPT", id, Permanent)
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
Application.MTZSession.UnLockResource "PEKD_DEPT", id
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
CanLock = Application.MTZSession.CanLock("PEKD_DEPT", id)
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
 PEKD_DEPLIMITS.BatchUpdate
 PEKD_DEPDOG.BatchUpdate
 PEKD_DEPT1C.BatchUpdate
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
  PEKD_DEPLIMITS.LoadAll
  PEKD_DEPDOG.LoadAll
  PEKD_DEPT1C.LoadAll
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
If mode = "admi" Then
 Select Case child
 Case "PEKD_DEPLIMITS"
    item.PEKD_DEPLIMITS.Refresh
    For i = 1 To item.PEKD_DEPLIMITS.Count
      nid = CreateGUID2() & item.PEKD_DEPLIMITS.item(i).id & child
      tree.nodes.Add(key, 4, nid, item.PEKD_DEPLIMITS.item(i).Brief(True)).Tag = "Row"
    Next
 Case "PEKD_DEPDOG"
    item.PEKD_DEPDOG.Refresh
    For i = 1 To item.PEKD_DEPDOG.Count
      nid = CreateGUID2() & item.PEKD_DEPDOG.item(i).id & child
      tree.nodes.Add(key, 4, nid, item.PEKD_DEPDOG.item(i).Brief(True)).Tag = "Row"
    Next
End Select
End If ' mode="admi"
If mode = "main" Then
 Select Case child
 Case "PEKD_DEPLIMITS"
    item.PEKD_DEPLIMITS.Refresh
    For i = 1 To item.PEKD_DEPLIMITS.Count
      nid = CreateGUID2() & item.PEKD_DEPLIMITS.item(i).id & child
      tree.nodes.Add(key, 4, nid, item.PEKD_DEPLIMITS.item(i).Brief(True)).Tag = "Row"
    Next
 Case "PEKD_DEPDOG"
    item.PEKD_DEPDOG.Refresh
    For i = 1 To item.PEKD_DEPDOG.Count
      nid = CreateGUID2() & item.PEKD_DEPDOG.item(i).id & child
      tree.nodes.Add(key, 4, nid, item.PEKD_DEPDOG.item(i).Brief(True)).Tag = "Row"
    Next
End Select
End If ' mode="main"
If mode = "" Then
 Select Case child
 Case "PEKD_DEPLIMITS"
    item.PEKD_DEPLIMITS.Refresh
    For i = 1 To item.PEKD_DEPLIMITS.Count
    nid = CreateGUID2() & item.PEKD_DEPLIMITS.item(i).id
    tree.nodes.Add(key, 4, nid, item.PEKD_DEPLIMITS.item(i).Brief(True)).Tag = "Row"
    Next
 Case "PEKD_DEPDOG"
    item.PEKD_DEPDOG.Refresh
    For i = 1 To item.PEKD_DEPDOG.Count
    nid = CreateGUID2() & item.PEKD_DEPDOG.item(i).id
    tree.nodes.Add(key, 4, nid, item.PEKD_DEPDOG.item(i).Brief(True)).Tag = "Row"
    Next
 End Select
End If ' mode="" (Default)
End Sub



