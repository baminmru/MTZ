VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "REPD_SendQ"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ ������� ������� �������
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
Private m_SourceSrv As Object
Dim m_SourceSrv_ID As String
Dim m_SourceSrv_ID_BRIEF As String
Private m_Config As String
Private m_SentDate As Date
Private m_DestSrv As Object
Dim m_DestSrv_ID As String
Dim m_DestSrv_ID_BRIEF As String
Private m_Provider As Object
Dim m_Provider_ID As String
Dim m_Provider_ID_BRIEF As String
Private m_Acknowelge As enumBoolean
Private m_SendSize As Long
Private m_CheckDate As Date
Private m_ReplicaPackID As String
Private m_FileName As String
Private m_PartCount As Long
Private m_PartNumber As Long
Private m_Sent As enumYesNo
Private m_ReplicatorPointer As Date
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
  PartName = "REPD_SendQ"
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
  m_Application.Logger.Message "REPD_SendQ.Init"
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
'SourceSrv

'SourceSrv
'Parameters:
'[IN]   newValue , ��� ���������: object  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Set SourceSrv(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SourceSrv", SourceSrv, NewValue
On Error Resume Next
m_SourceSrv_ID = ""
m_SourceSrv_ID = NewValue.id
'  set   m_SourceSrv= newValue
End If
End Property

'SourceSrv
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. SourceSrv
Public Property Get SourceSrv() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_SourceSrv As Object
If m_SourceSrv_ID <> "" Then
  Set tmp_SourceSrv = Application.FindRowObject("REPD_SRV", m_SourceSrv_ID)
  If tmp_SourceSrv Is Nothing Then
    m_SourceSrv_ID_BRIEF = ""
  Else
    m_SourceSrv_ID_BRIEF = tmp_SourceSrv.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "REPD_SRV" & m_SourceSrv_ID, tmp_SourceSrv
  Set SourceSrv = tmp_SourceSrv
  Exit Property
End If
  '  set SourceSrv = m_SourceSrv
End Property
' let
'Config

'Config
'Parameters:
'[IN]   newValue , ��� ���������: STRING  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let Config(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Config", Config, NewValue

   m_Config = NewValue
End If
End Property

'Config
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� STRING
'See Also:
'Example:
' dim variable as STRING
' variable = me. Config
Public Property Get Config() As String
 LoadFromDatabase
 AccessTime = Now

   Config = m_Config
End Property
' let
'SentDate

'SentDate
'Parameters:
'[IN]   newValue , ��� ���������: DATE  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let SentDate(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SentDate", SentDate, NewValue

   m_SentDate = NewValue
End If
End Property

'SentDate
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. SentDate
Public Property Get SentDate() As Date
 LoadFromDatabase
 AccessTime = Now

   SentDate = m_SentDate
End Property
' let
'DestSrv

'DestSrv
'Parameters:
'[IN]   newValue , ��� ���������: object  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Set DestSrv(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DestSrv", DestSrv, NewValue
On Error Resume Next
m_DestSrv_ID = ""
m_DestSrv_ID = NewValue.id
'  set   m_DestSrv= newValue
End If
End Property

'DestSrv
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. DestSrv
Public Property Get DestSrv() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_DestSrv As Object
If m_DestSrv_ID <> "" Then
  Set tmp_DestSrv = Application.FindRowObject("REPD_SRV", m_DestSrv_ID)
  If tmp_DestSrv Is Nothing Then
    m_DestSrv_ID_BRIEF = ""
  Else
    m_DestSrv_ID_BRIEF = tmp_DestSrv.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "REPD_SRV" & m_DestSrv_ID, tmp_DestSrv
  Set DestSrv = tmp_DestSrv
  Exit Property
End If
  '  set DestSrv = m_DestSrv
End Property
' let
'Provider

'Provider
'Parameters:
'[IN]   newValue , ��� ���������: object  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Set Provider(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Provider", Provider, NewValue
On Error Resume Next
m_Provider_ID = ""
m_Provider_ID = NewValue.id
'  set   m_Provider= newValue
End If
End Property

'Provider
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Provider
Public Property Get Provider() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_Provider As Object
If m_Provider_ID <> "" Then
  Set tmp_Provider = Application.FindRowObject("REPD_PROV", m_Provider_ID)
  If tmp_Provider Is Nothing Then
    m_Provider_ID_BRIEF = ""
  Else
    m_Provider_ID_BRIEF = tmp_Provider.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "REPD_PROV" & m_Provider_ID, tmp_Provider
  Set Provider = tmp_Provider
  Exit Property
End If
  '  set Provider = m_Provider
End Property
' let
'Acknowelge

'Acknowelge
'Parameters:
'[IN]   newValue , ��� ���������: enumBoolean  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let Acknowelge(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Acknowelge", Acknowelge, NewValue

   m_Acknowelge = NewValue
End If
End Property

'Acknowelge
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ enumBoolean
'  ,��� Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. Acknowelge
Public Property Get Acknowelge() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   Acknowelge = m_Acknowelge
End Property
' let
'SendSize

'SendSize
'Parameters:
'[IN]   newValue , ��� ���������: long  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let SendSize(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SendSize", SendSize, NewValue

   m_SendSize = NewValue
End If
End Property

'SendSize
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� long
'See Also:
'Example:
' dim variable as long
' variable = me. SendSize
Public Property Get SendSize() As Long
 LoadFromDatabase
 AccessTime = Now

   SendSize = m_SendSize
End Property
' let
'CheckDate

'CheckDate
'Parameters:
'[IN]   newValue , ��� ���������: DATE  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let CheckDate(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CheckDate", CheckDate, NewValue

   m_CheckDate = NewValue
End If
End Property

'CheckDate
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. CheckDate
Public Property Get CheckDate() As Date
 LoadFromDatabase
 AccessTime = Now

   CheckDate = m_CheckDate
End Property
' let
'ReplicaPackID

'ReplicaPackID
'Parameters:
'[IN]   newValue , ��� ���������: string  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let ReplicaPackID(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ReplicaPackID", ReplicaPackID, NewValue

   m_ReplicaPackID = NewValue
End If
End Property

'ReplicaPackID
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� string
'See Also:
'Example:
' dim variable as string
' variable = me. ReplicaPackID
Public Property Get ReplicaPackID() As String
 LoadFromDatabase
 AccessTime = Now

   ReplicaPackID = m_ReplicaPackID
End Property
' let
'FileName

'FileName
'Parameters:
'[IN]   newValue , ��� ���������: String  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let FileName(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FileName", FileName, NewValue

   m_FileName = NewValue
End If
End Property

'FileName
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� String
'See Also:
'Example:
' dim variable as String
' variable = me. FileName
Public Property Get FileName() As String
 LoadFromDatabase
 AccessTime = Now

   FileName = m_FileName
End Property
' let
'���������� ������

'���������� ������
'Parameters:
'[IN]   newValue , ��� ���������: long  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let PartCount(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PartCount", PartCount, NewValue

   m_PartCount = NewValue
End If
End Property

'���������� ������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� long
'See Also:
'Example:
' dim variable as long
' variable = me. PartCount
Public Property Get PartCount() As Long
 LoadFromDatabase
 AccessTime = Now

   PartCount = m_PartCount
End Property
' let
'�����

'�����
'Parameters:
'[IN]   newValue , ��� ���������: long  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let PartNumber(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PartNumber", PartNumber, NewValue

   m_PartNumber = NewValue
End If
End Property

'�����
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� long
'See Also:
'Example:
' dim variable as long
' variable = me. PartNumber
Public Property Get PartNumber() As Long
 LoadFromDatabase
 AccessTime = Now

   PartNumber = m_PartNumber
End Property
' let
'Sent

'Sent
'Parameters:
'[IN]   newValue , ��� ���������: enumYesNo  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let Sent(ByVal NewValue As enumYesNo)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Sent", Sent, NewValue

   m_Sent = NewValue
End If
End Property

'Sent
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ enumYesNo
'  ,��� Nothing
'See Also:
'Example:
' dim variable as enumYesNo
' Set variable = me. Sent
Public Property Get Sent() As enumYesNo
 LoadFromDatabase
 AccessTime = Now

   Sent = m_Sent
End Property
' let
'��������� ����������

'��������� ����������
'Parameters:
'[IN]   newValue , ��� ���������: DATE  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let ReplicatorPointer(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ReplicatorPointer", ReplicatorPointer, NewValue

   m_ReplicatorPointer = NewValue
End If
End Property

'��������� ����������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. ReplicatorPointer
Public Property Get ReplicatorPointer() As Date
 LoadFromDatabase
 AccessTime = Now

   ReplicatorPointer = m_ReplicatorPointer
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

 ' Reference to REPD_SRV
    If m_SourceSrv_ID = "" Then
       Set nvi = nv.Add("SourceSrv", "")
    Else
       Set nvi = nv.Add("SourceSrv", m_SourceSrv_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("Config", m_Config)
  Set nvi = nv.Add("SentDate", m_SentDate)
nvi.ValueType = adDBTimeStamp
 ' Reference to REPD_SRV
    If m_DestSrv_ID = "" Then
       Set nvi = nv.Add("DestSrv", "")
    Else
       Set nvi = nv.Add("DestSrv", m_DestSrv_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to REPD_PROV
    If m_Provider_ID = "" Then
       Set nvi = nv.Add("Provider", "")
    Else
       Set nvi = nv.Add("Provider", m_Provider_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("Acknowelge", m_Acknowelge)
nvi.ValueType = adInteger
  Set nvi = nv.Add("SendSize", m_SendSize)
nvi.ValueType = adInteger
  Set nvi = nv.Add("CheckDate", m_CheckDate)
nvi.ValueType = adDBTimeStamp
  Set nvi = nv.Add("ReplicaPackID", m_ReplicaPackID)
  Set nvi = nv.Add("FileName", m_FileName)
nvi.ValueSize = 1024
  Set nvi = nv.Add("PartCount", m_PartCount)
nvi.ValueType = adInteger
  Set nvi = nv.Add("PartNumber", m_PartNumber)
nvi.ValueType = adInteger
  Set nvi = nv.Add("Sent", m_Sent)
nvi.ValueType = adInteger
  Set nvi = nv.Add("ReplicatorPointer", m_ReplicatorPointer)
nvi.ValueType = adDBTimeStamp
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
 m_Brief = m_Brief & FileName & "; "
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

  m_SourceSrv_ID = nv.item("SourceSrv").Value
m_Config = nv.item("Config").Value
m_SentDate = nv.item("SentDate").Value
  m_DestSrv_ID = nv.item("DestSrv").Value
  m_Provider_ID = nv.item("Provider").Value
m_Acknowelge = nv.item("Acknowelge").Value
m_SendSize = nv.item("SendSize").Value
m_CheckDate = nv.item("CheckDate").Value
m_ReplicaPackID = nv.item("ReplicaPackID").Value
m_FileName = nv.item("FileName").Value
m_PartCount = nv.item("PartCount").Value
m_PartNumber = nv.item("PartNumber").Value
m_Sent = nv.item("Sent").Value
m_ReplicatorPointer = nv.item("ReplicatorPointer").Value
Else

  m_SourceSrv_ID = nv.Fields("SourceSrv").Value
m_Config = nv.Fields("Config").Value
m_SentDate = nv.Fields("SentDate").Value
  m_DestSrv_ID = nv.Fields("DestSrv").Value
  m_Provider_ID = nv.Fields("Provider").Value
m_Acknowelge = nv.Fields("Acknowelge").Value
m_SendSize = nv.Fields("SendSize").Value
m_CheckDate = nv.Fields("CheckDate").Value
m_ReplicaPackID = nv.Fields("ReplicaPackID").Value
m_FileName = nv.Fields("FileName").Value
m_PartCount = nv.Fields("PartCount").Value
m_PartNumber = nv.Fields("PartNumber").Value
m_Sent = nv.Fields("Sent").Value
m_ReplicatorPointer = nv.Fields("ReplicatorPointer").Value
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
   Dim o As REPD_SendQ
   Set o = New REPD_SendQ
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
  err.Raise err.Number, "REPD_SendQ.Save", err.Description
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
  err.Raise err.Number, "REPD_SendQ.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("REPD_SendQ", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "REPD_SendQ.Secure", err.Description
End Sub

'�������������� ����� �� �������� ������ � �������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "REPD_SendQ", id
Exit Sub
bye:
  err.Raise err.Number, "REPD_SendQ.Propagate", err.Description
End Sub

'����������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 m_SourceSrv_ID = ""
 Set m_SourceSrv = Nothing
 m_DestSrv_ID = ""
 Set m_DestSrv = Nothing
 m_Provider_ID = ""
 Set m_Provider = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "REPD_SendQ.CloseClass"
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
  Set SourceSrv = Nothing
  m_SourceSrv_ID = node.Attributes.getNamedItem("SOURCESRV").nodeValue
  m_SourceSrv_ID_BRIEF = node.Attributes.getNamedItem("SOURCESRV_BRIEF").nodeValue
  Config = Replace(node.Attributes.getNamedItem("CONFIG").nodeValue, vbLf, vbCrLf)
  SentDate = node.Attributes.getNamedItem("SENTDATE").nodeValue
  Set DestSrv = Nothing
  m_DestSrv_ID = node.Attributes.getNamedItem("DESTSRV").nodeValue
  m_DestSrv_ID_BRIEF = node.Attributes.getNamedItem("DESTSRV_BRIEF").nodeValue
  Set Provider = Nothing
  m_Provider_ID = node.Attributes.getNamedItem("PROVIDER").nodeValue
  m_Provider_ID_BRIEF = node.Attributes.getNamedItem("PROVIDER_BRIEF").nodeValue
  Acknowelge = node.Attributes.getNamedItem("ACKNOWELGE").nodeValue
  SendSize = node.Attributes.getNamedItem("SENDSIZE").nodeValue
  CheckDate = node.Attributes.getNamedItem("CHECKDATE").nodeValue
  ReplicaPackID = Replace(node.Attributes.getNamedItem("REPLICAPACKID").nodeValue, vbLf, vbCrLf)
  FileName = Replace(node.Attributes.getNamedItem("FILENAME").nodeValue, vbLf, vbCrLf)
  PartCount = node.Attributes.getNamedItem("PARTCOUNT").nodeValue
  PartNumber = node.Attributes.getNamedItem("PARTNUMBER").nodeValue
  Sent = node.Attributes.getNamedItem("SENT").nodeValue
  ReplicatorPointer = node.Attributes.getNamedItem("REPLICATORPOINTER").nodeValue
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
  node.setAttribute "SOURCESRV", m_SourceSrv_ID
  If Not (SourceSrv Is Nothing) Then
    node.setAttribute "SOURCESRV_BRIEF", SourceSrv.Brief
  Else
    node.setAttribute "SOURCESRV_BRIEF", m_SourceSrv_ID_BRIEF
  End If
  node.setAttribute "CONFIG", Config
  node.setAttribute "SENTDATE", CDbl(SentDate)
  node.setAttribute "DESTSRV", m_DestSrv_ID
  If Not (DestSrv Is Nothing) Then
    node.setAttribute "DESTSRV_BRIEF", DestSrv.Brief
  Else
    node.setAttribute "DESTSRV_BRIEF", m_DestSrv_ID_BRIEF
  End If
  node.setAttribute "PROVIDER", m_Provider_ID
  If Not (Provider Is Nothing) Then
    node.setAttribute "PROVIDER_BRIEF", Provider.Brief
  Else
    node.setAttribute "PROVIDER_BRIEF", m_Provider_ID_BRIEF
  End If
  node.setAttribute "ACKNOWELGE", Acknowelge
  node.setAttribute "SENDSIZE", SendSize
  node.setAttribute "CHECKDATE", CDbl(CheckDate)
  node.setAttribute "REPLICAPACKID", ReplicaPackID
  node.setAttribute "FILENAME", FileName
  node.setAttribute "PARTCOUNT", PartCount
  node.setAttribute "PARTNUMBER", PartNumber
  node.setAttribute "SENT", Sent
  node.setAttribute "REPLICATORPOINTER", CDbl(ReplicatorPointer)
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
m_IsLocked = Application.MTZSession.IsLocked("REPD_SendQ", id)
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
OK = Application.MTZSession.LockResource("REPD_SendQ", id, Permanent)
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
Application.MTZSession.UnLockResource "REPD_SendQ", id
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
CanLock = Application.MTZSession.CanLock("REPD_SendQ", id)
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



