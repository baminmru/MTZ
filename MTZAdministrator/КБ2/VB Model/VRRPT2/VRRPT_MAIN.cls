VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "VRRPT_MAIN"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ ������� �����
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
Private m_Author As Object
Dim m_Author_ID As String
Dim m_Author_ID_BRIEF As String
Private m_TheDate As Date
Private m_Client As Object
Dim m_Client_ID As String
Dim m_Client_ID_BRIEF As String
Private m_Project As Object
Dim m_Project_ID As String
Dim m_Project_ID_BRIEF As String
Private m_Contract As Object
Dim m_Contract_ID As String
Dim m_Contract_ID_BRIEF As String
Private m_Person As Object
Dim m_Person_ID As String
Dim m_Person_ID_BRIEF As String
Private m_Name As String
Private m_Info As String
Private m_Attrachment_EXT As String
Private m_Attrachment As Variant
Private m_ReportType As Object
Dim m_ReportType_ID As String
Dim m_ReportType_ID_BRIEF As String
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
  PartName = "VRRPT_MAIN"
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
  m_Application.Logger.Message "VRRPT_MAIN.Init"
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
Public Property Set Author(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Author", Author, NewValue
On Error Resume Next
m_Author_ID = ""
m_Author_ID = NewValue.id
'  set   m_Author= newValue
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
' Set variable = me. Author
Public Property Get Author() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_Author As Object
If m_Author_ID <> "" Then
  Set tmp_Author = Application.FindRowObject("Users", m_Author_ID)
  If tmp_Author Is Nothing Then
    m_Author_ID_BRIEF = ""
  Else
    m_Author_ID_BRIEF = tmp_Author.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "Users" & m_Author_ID, tmp_Author
  Set Author = tmp_Author
  Exit Property
End If
  '  set Author = m_Author
End Property
' let
'���� ������

'���� ������
'Parameters:
'[IN]   newValue , ��� ���������: DATE  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let TheDate(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheDate", TheDate, NewValue

   m_TheDate = NewValue
End If
End Property

'���� ������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. TheDate
Public Property Get TheDate() As Date
 LoadFromDatabase
 AccessTime = Now

   TheDate = m_TheDate
End Property
' let
'������

'������
'Parameters:
'[IN]   newValue , ��� ���������: object  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Set Client(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Client", Client, NewValue
On Error Resume Next
m_Client_ID = ""
m_Client_ID = NewValue.id
' set   m_Client= newValue
End If
End Property

'������
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Client
Public Property Get Client() As Object
 LoadFromDatabase
 AccessTime = Now
If m_Client_ID <> "" Then
  Set Client = Application.Manager.GetInstanceObject(Right(m_Client_ID, 38))
 Exit Property
End If
  ' set Client = m_Client
End Property
' let
'������

'������
'Parameters:
'[IN]   newValue , ��� ���������: object  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Set Project(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Project", Project, NewValue
On Error Resume Next
m_Project_ID = ""
m_Project_ID = NewValue.id
' set   m_Project= newValue
End If
End Property

'������
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Project
Public Property Get Project() As Object
 LoadFromDatabase
 AccessTime = Now
If m_Project_ID <> "" Then
  Set Project = Application.Manager.GetInstanceObject(Right(m_Project_ID, 38))
 Exit Property
End If
  ' set Project = m_Project
End Property
' let
'�������

'�������
'Parameters:
'[IN]   newValue , ��� ���������: object  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Set Contract(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Contract", Contract, NewValue
On Error Resume Next
m_Contract_ID = ""
m_Contract_ID = NewValue.id
' set   m_Contract= newValue
End If
End Property

'�������
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Contract
Public Property Get Contract() As Object
 LoadFromDatabase
 AccessTime = Now
If m_Contract_ID <> "" Then
  Set Contract = Application.Manager.GetInstanceObject(Right(m_Contract_ID, 38))
 Exit Property
End If
  ' set Contract = m_Contract
End Property
' let
'���������� ����

'���������� ����
'Parameters:
'[IN]   newValue , ��� ���������: object  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Set Person(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Person", Person, NewValue
On Error Resume Next
m_Person_ID = ""
m_Person_ID = NewValue.id
' set   m_Person= newValue
End If
End Property

'���������� ����
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Person
Public Property Get Person() As Object
 LoadFromDatabase
 AccessTime = Now
If m_Person_ID <> "" Then
  Set Person = Application.Manager.GetInstanceObject(Right(m_Person_ID, 38))
 Exit Property
End If
  ' set Person = m_Person
End Property
' let
'�������� ������

'�������� ������
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

'�������� ������
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
'����������

'����������
'Parameters:
'[IN]   newValue , ��� ���������: STRING  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let Info(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Info", Info, NewValue

   m_Info = NewValue
End If
End Property

'����������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� STRING
'See Also:
'Example:
' dim variable as STRING
' variable = me. Info
Public Property Get Info() As String
 LoadFromDatabase
 AccessTime = Now

   Info = m_Info
End Property
' let
'Attrachment
Public Property Let Attrachment_EXT(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Attrachment_EXT", Attrachment_EXT, NewValue
 m_Attrachment_EXT = NewValue
End If
End Property

'��������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� string
'See Also:
'Example:
' dim variable as string
' variable = me. Attrachment_EXT
Public Property Get Attrachment_EXT() As String
 LoadFromDatabase
 AccessTime = Now
  Attrachment_EXT = m_Attrachment_EXT
End Property
' let
'��������

'��������
'Parameters:
'[IN]   newValue , ��� ���������: VARIANT  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let Attrachment(ByVal NewValue As Variant)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Attrachment", Attrachment, NewValue

   m_Attrachment = NewValue
End If
End Property

'��������
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
' dim variable as VARIANT
' variable = me. Attrachment
' Set variable = me. Attrachment
Public Property Get Attrachment() As Variant
 LoadFromDatabase
 AccessTime = Now

   Attrachment = m_Attrachment
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
Public Property Set ReportType(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ReportType", ReportType, NewValue
On Error Resume Next
m_ReportType_ID = ""
m_ReportType_ID = NewValue.id
'  set   m_ReportType= newValue
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
' Set variable = me. ReportType
Public Property Get ReportType() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_ReportType As Object
If m_ReportType_ID <> "" Then
  Set tmp_ReportType = Application.FindRowObject("VRDRreportType", m_ReportType_ID)
  If tmp_ReportType Is Nothing Then
    m_ReportType_ID_BRIEF = ""
  Else
    m_ReportType_ID_BRIEF = tmp_ReportType.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "VRDRreportType" & m_ReportType_ID, tmp_ReportType
  Set ReportType = tmp_ReportType
  Exit Property
End If
  '  set ReportType = m_ReportType
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

 ' Reference to Users
    If m_Author_ID = "" Then
       Set nvi = nv.Add("Author", "")
    Else
       Set nvi = nv.Add("Author", m_Author_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("TheDate", m_TheDate)
nvi.ValueType = adDate
 ' Reference to object
    If m_Client_ID = "" Then
       Set nvi = nv.Add("Client", "")
    Else
       Set nvi = nv.Add("Client", m_Client_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to object
    If m_Project_ID = "" Then
       Set nvi = nv.Add("Project", "")
    Else
       Set nvi = nv.Add("Project", m_Project_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to object
    If m_Contract_ID = "" Then
       Set nvi = nv.Add("Contract", "")
    Else
       Set nvi = nv.Add("Contract", m_Contract_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to object
    If m_Person_ID = "" Then
       Set nvi = nv.Add("Person", "")
    Else
       Set nvi = nv.Add("Person", m_Person_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("Name", m_Name)
nvi.ValueSize = 255
  Set nvi = nv.Add("Info", m_Info)
  Set nvi = nv.Add("Attrachment", m_Attrachment)
Set nvi = nv.Add("Attrachment_EXT", m_Attrachment_EXT)
nvi.ValueSize = 10
 ' Reference to VRDRreportType
    If m_ReportType_ID = "" Then
       Set nvi = nv.Add("ReportType", "")
    Else
       Set nvi = nv.Add("ReportType", m_ReportType_ID)
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
   If Author Is Nothing Then
     m_Brief = m_Brief & "{" & m_Author_ID_BRIEF & "}; "
   Else
     m_Brief = m_Brief & "{" & Author.Brief & "}; "
   End If
 m_Brief = m_Brief & TheDate & "; "
 m_Brief = m_Brief & Name & "; "
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

  m_Author_ID = nv.item("Author").Value
m_TheDate = nv.item("TheDate").Value
  m_Client_ID = nv.item("Client").Value
  m_Project_ID = nv.item("Project").Value
  m_Contract_ID = nv.item("Contract").Value
  m_Person_ID = nv.item("Person").Value
m_Name = nv.item("Name").Value
m_Info = nv.item("Info").Value
m_Attrachment = nv.item("Attrachment").Value
m_Attrachment_EXT = nv.item("Attrachment_EXT").Value
  m_ReportType_ID = nv.item("ReportType").Value
Else

  m_Author_ID = nv.Fields("Author").Value
m_TheDate = nv.Fields("TheDate").Value
  m_Client_ID = nv.Fields("Client").Value
  m_Project_ID = nv.Fields("Project").Value
  m_Contract_ID = nv.Fields("Contract").Value
  m_Person_ID = nv.Fields("Person").Value
m_Name = nv.Fields("Name").Value
m_Info = nv.Fields("Info").Value
m_Attrachment = nv.Fields("Attrachment").Value
m_Attrachment_EXT = nv.Fields("Attrachment_EXT").Value
  m_ReportType_ID = nv.Fields("ReportType").Value
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
   Dim o As VRRPT_MAIN
   Set o = New VRRPT_MAIN
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
  err.Raise err.Number, "VRRPT_MAIN.Save", err.Description
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
  err.Raise err.Number, "VRRPT_MAIN.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("VRRPT_MAIN", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "VRRPT_MAIN.Secure", err.Description
End Sub

'�������������� ����� �� �������� ������ � �������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "VRRPT_MAIN", id
Exit Sub
bye:
  err.Raise err.Number, "VRRPT_MAIN.Propagate", err.Description
End Sub

'����������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 m_Author_ID = ""
 Set m_Author = Nothing
 m_Client_ID = ""
 Set m_Client = Nothing
 m_Project_ID = ""
 Set m_Project = Nothing
 m_Contract_ID = ""
 Set m_Contract = Nothing
 m_Person_ID = ""
 Set m_Person = Nothing
 m_ReportType_ID = ""
 Set m_ReportType = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "VRRPT_MAIN.CloseClass"
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
  Set Author = Nothing
  m_Author_ID = node.Attributes.getNamedItem("AUTHOR").nodeValue
  m_Author_ID_BRIEF = node.Attributes.getNamedItem("AUTHOR_BRIEF").nodeValue
  TheDate = node.Attributes.getNamedItem("THEDATE").nodeValue
  Set Client = Nothing
  m_Client_ID = node.Attributes.getNamedItem("CLIENT").nodeValue
  m_Client_ID_BRIEF = node.Attributes.getNamedItem("CLIENT_BRIEF").nodeValue
  Set Project = Nothing
  m_Project_ID = node.Attributes.getNamedItem("PROJECT").nodeValue
  m_Project_ID_BRIEF = node.Attributes.getNamedItem("PROJECT_BRIEF").nodeValue
  Set Contract = Nothing
  m_Contract_ID = node.Attributes.getNamedItem("CONTRACT").nodeValue
  m_Contract_ID_BRIEF = node.Attributes.getNamedItem("CONTRACT_BRIEF").nodeValue
  Set Person = Nothing
  m_Person_ID = node.Attributes.getNamedItem("PERSON").nodeValue
  m_Person_ID_BRIEF = node.Attributes.getNamedItem("PERSON_BRIEF").nodeValue
  Name = Replace(node.Attributes.getNamedItem("NAME").nodeValue, vbLf, vbCrLf)
  Info = Replace(node.Attributes.getNamedItem("INFO").nodeValue, vbLf, vbCrLf)
  Attrachment_EXT = node.Attributes.getNamedItem("ATTRACHMENT_EXT").nodeValue
  Attrachment = HexToArray(node.Attributes.getNamedItem("ATTRACHMENT").nodeValue)
  Set ReportType = Nothing
  m_ReportType_ID = node.Attributes.getNamedItem("REPORTTYPE").nodeValue
  m_ReportType_ID_BRIEF = node.Attributes.getNamedItem("REPORTTYPE_BRIEF").nodeValue
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
  node.setAttribute "AUTHOR", m_Author_ID
  If Not (Author Is Nothing) Then
    node.setAttribute "AUTHOR_BRIEF", Author.Brief
  Else
    node.setAttribute "AUTHOR_BRIEF", m_Author_ID_BRIEF
  End If
  node.setAttribute "THEDATE", CDbl(TheDate)
  node.setAttribute "CLIENT", m_Client_ID
  If Not (Client Is Nothing) Then
    node.setAttribute "CLIENT_BRIEF", Client.Brief
  Else
    node.setAttribute "CLIENT_BRIEF", m_Client_ID_BRIEF
  End If
  node.setAttribute "PROJECT", m_Project_ID
  If Not (Project Is Nothing) Then
    node.setAttribute "PROJECT_BRIEF", Project.Brief
  Else
    node.setAttribute "PROJECT_BRIEF", m_Project_ID_BRIEF
  End If
  node.setAttribute "CONTRACT", m_Contract_ID
  If Not (Contract Is Nothing) Then
    node.setAttribute "CONTRACT_BRIEF", Contract.Brief
  Else
    node.setAttribute "CONTRACT_BRIEF", m_Contract_ID_BRIEF
  End If
  node.setAttribute "PERSON", m_Person_ID
  If Not (Person Is Nothing) Then
    node.setAttribute "PERSON_BRIEF", Person.Brief
  Else
    node.setAttribute "PERSON_BRIEF", m_Person_ID_BRIEF
  End If
  node.setAttribute "NAME", Name
  node.setAttribute "INFO", Info
  node.setAttribute "ATTRACHMENT_EXT", Attrachment_EXT
  node.setAttribute "ATTRACHMENT", ArrayToHex(Attrachment)
  node.setAttribute "REPORTTYPE", m_ReportType_ID
  If Not (ReportType Is Nothing) Then
    node.setAttribute "REPORTTYPE_BRIEF", ReportType.Brief
  Else
    node.setAttribute "REPORTTYPE_BRIEF", m_ReportType_ID_BRIEF
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
m_IsLocked = Application.MTZSession.IsLocked("VRRPT_MAIN", id)
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
OK = Application.MTZSession.LockResource("VRRPT_MAIN", id, Permanent)
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
Application.MTZSession.UnLockResource "VRRPT_MAIN", id
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
CanLock = Application.MTZSession.CanLock("VRRPT_MAIN", id)
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
If mode = "CONT" Then
 Select Case child
End Select
End If ' mode="CONT"
If mode = "dflt" Then
 Select Case child
End Select
End If ' mode="dflt"
If mode = "PRJ" Then
 Select Case child
End Select
End If ' mode="PRJ"
If mode = "PERS" Then
 Select Case child
End Select
End If ' mode="PERS"
If mode = "CLNT" Then
 Select Case child
End Select
End If ' mode="CLNT"
If mode = "" Then
 Select Case child
 End Select
End If ' mode="" (Default)
End Sub



