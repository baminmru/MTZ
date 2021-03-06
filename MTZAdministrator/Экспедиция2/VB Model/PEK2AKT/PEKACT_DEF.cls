VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "PEKACT_DEF"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ ������� ��� ������
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
Private m_Podrazdelenie As Object
Dim m_Podrazdelenie_ID As String
Dim m_Podrazdelenie_ID_BRIEF As String
Private m_Client As Object
Dim m_Client_ID As String
Dim m_Client_ID_BRIEF As String
Private m_Number_of_akt As Long
Private m_Date_FROM As Date
Private m_Date_TO As Date
Private m_TheDgovor As Object
Dim m_TheDgovor_ID As String
Dim m_TheDgovor_ID_BRIEF As String
Private m_dateCreate As Date
Private m_dateSend As Date
Private m_dateReceive As Date
Private m_FIO As String
Private m_CalcWithNDS As enumBoolean
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
  PartName = "PEKACT_DEF"
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
  m_Application.Logger.Message "PEKACT_DEF.Init"
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
'�������������

'�������������
'Parameters:
'[IN]   newValue , ��� ���������: object  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Set Podrazdelenie(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Podrazdelenie", Podrazdelenie, NewValue
On Error Resume Next
m_Podrazdelenie_ID = ""
m_Podrazdelenie_ID = NewValue.id
'  set   m_Podrazdelenie= newValue
End If
End Property

'�������������
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Podrazdelenie
Public Property Get Podrazdelenie() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_Podrazdelenie As Object
If m_Podrazdelenie_ID <> "" Then
  Set tmp_Podrazdelenie = Application.FindRowObject("PEKD_DEPT", m_Podrazdelenie_ID)
  If tmp_Podrazdelenie Is Nothing Then
    m_Podrazdelenie_ID_BRIEF = ""
  Else
    m_Podrazdelenie_ID_BRIEF = tmp_Podrazdelenie.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "PEKD_DEPT" & m_Podrazdelenie_ID, tmp_Podrazdelenie
  Set Podrazdelenie = tmp_Podrazdelenie
  Exit Property
End If
  '  set Podrazdelenie = m_Podrazdelenie
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
'�����_����

'�����_����
'Parameters:
'[IN]   newValue , ��� ���������: long  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let Number_of_akt(ByVal NewValue As Long)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Number_of_akt", Number_of_akt, NewValue

   m_Number_of_akt = NewValue
End If
End Property

'�����_����
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� long
'See Also:
'Example:
' dim variable as long
' variable = me. Number_of_akt
Public Property Get Number_of_akt() As Long
 LoadFromDatabase
 AccessTime = Now

   Number_of_akt = m_Number_of_akt
End Property
' let
'���� �

'���� �
'Parameters:
'[IN]   newValue , ��� ���������: DATE  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let Date_FROM(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Date_FROM", Date_FROM, NewValue

   m_Date_FROM = NewValue
End If
End Property

'���� �
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. Date_FROM
Public Property Get Date_FROM() As Date
 LoadFromDatabase
 AccessTime = Now

   Date_FROM = m_Date_FROM
End Property
' let
'���� ��

'���� ��
'Parameters:
'[IN]   newValue , ��� ���������: DATE  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let Date_TO(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Date_TO", Date_TO, NewValue

   m_Date_TO = NewValue
End If
End Property

'���� ��
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. Date_TO
Public Property Get Date_TO() As Date
 LoadFromDatabase
 AccessTime = Now

   Date_TO = m_Date_TO
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
Public Property Set TheDgovor(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheDgovor", TheDgovor, NewValue
On Error Resume Next
m_TheDgovor_ID = ""
m_TheDgovor_ID = NewValue.id
' set   m_TheDgovor= newValue
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
' Set variable = me. TheDgovor
Public Property Get TheDgovor() As Object
 LoadFromDatabase
 AccessTime = Now
If m_TheDgovor_ID <> "" Then
  Set TheDgovor = Application.Manager.GetInstanceObject(Right(m_TheDgovor_ID, 38))
 Exit Property
End If
  ' set TheDgovor = m_TheDgovor
End Property
' let
'���� ���������� ����

'���� ���������� ����
'Parameters:
'[IN]   newValue , ��� ���������: DATE  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let dateCreate(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "dateCreate", dateCreate, NewValue

   m_dateCreate = NewValue
End If
End Property

'���� ���������� ����
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. dateCreate
Public Property Get dateCreate() As Date
 LoadFromDatabase
 AccessTime = Now

   dateCreate = m_dateCreate
End Property
' let
'���� �������� ���� �������

'���� �������� ���� �������
'Parameters:
'[IN]   newValue , ��� ���������: DATE  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let dateSend(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "dateSend", dateSend, NewValue

   m_dateSend = NewValue
End If
End Property

'���� �������� ���� �������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. dateSend
Public Property Get dateSend() As Date
 LoadFromDatabase
 AccessTime = Now

   dateSend = m_dateSend
End Property
' let
'���� �������� ������������ ���� ������

'���� �������� ������������ ���� ������
'Parameters:
'[IN]   newValue , ��� ���������: DATE  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let dateReceive(ByVal NewValue As Date)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "dateReceive", dateReceive, NewValue

   m_dateReceive = NewValue
End If
End Property

'���� �������� ������������ ���� ������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. dateReceive
Public Property Get dateReceive() As Date
 LoadFromDatabase
 AccessTime = Now

   dateReceive = m_dateReceive
End Property
' let
'��� ����������� ���

'��� ����������� ���
'Parameters:
'[IN]   newValue , ��� ���������: String  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let FIO(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "FIO", FIO, NewValue

   m_FIO = NewValue
End If
End Property

'��� ����������� ���
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� String
'See Also:
'Example:
' dim variable as String
' variable = me. FIO
Public Property Get FIO() As String
 LoadFromDatabase
 AccessTime = Now

   FIO = m_FIO
End Property
' let
'������ � ���

'������ � ���
'Parameters:
'[IN]   newValue , ��� ���������: enumBoolean  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let CalcWithNDS(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CalcWithNDS", CalcWithNDS, NewValue

   m_CalcWithNDS = NewValue
End If
End Property

'������ � ���
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ enumBoolean
'  ,��� Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. CalcWithNDS
Public Property Get CalcWithNDS() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   CalcWithNDS = m_CalcWithNDS
End Property
' let
'��� 1�

'��� 1�
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

'��� 1�
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

 ' Reference to PEKD_DEPT
    If m_Podrazdelenie_ID = "" Then
       Set nvi = nv.Add("Podrazdelenie", "")
    Else
       Set nvi = nv.Add("Podrazdelenie", m_Podrazdelenie_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to object
    If m_Client_ID = "" Then
       Set nvi = nv.Add("Client", "")
    Else
       Set nvi = nv.Add("Client", m_Client_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("Number_of_akt", m_Number_of_akt)
nvi.ValueType = adInteger
  Set nvi = nv.Add("Date_FROM", m_Date_FROM)
nvi.ValueType = adDate
  Set nvi = nv.Add("Date_TO", m_Date_TO)
nvi.ValueType = adDate
 ' Reference to object
    If m_TheDgovor_ID = "" Then
       Set nvi = nv.Add("TheDgovor", "")
    Else
       Set nvi = nv.Add("TheDgovor", m_TheDgovor_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("dateCreate", m_dateCreate)
nvi.ValueType = adDate
  Set nvi = nv.Add("dateSend", m_dateSend)
nvi.ValueType = adDate
  Set nvi = nv.Add("dateReceive", m_dateReceive)
nvi.ValueType = adDate
  Set nvi = nv.Add("FIO", m_FIO)
nvi.ValueSize = 100
  Set nvi = nv.Add("CalcWithNDS", m_CalcWithNDS)
nvi.ValueType = adInteger
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
   If Client Is Nothing Then
     m_Brief = m_Brief & "{" & m_Client_ID_BRIEF & "}; "
   Else
     m_Brief = m_Brief & "{" & Client.Brief & "}; "
   End If
 m_Brief = m_Brief & Number_of_akt & "; "
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

  m_Podrazdelenie_ID = nv.item("Podrazdelenie").Value
  m_Client_ID = nv.item("Client").Value
m_Number_of_akt = nv.item("Number_of_akt").Value
m_Date_FROM = nv.item("Date_FROM").Value
m_Date_TO = nv.item("Date_TO").Value
  m_TheDgovor_ID = nv.item("TheDgovor").Value
m_dateCreate = nv.item("dateCreate").Value
m_dateSend = nv.item("dateSend").Value
m_dateReceive = nv.item("dateReceive").Value
m_FIO = nv.item("FIO").Value
m_CalcWithNDS = nv.item("CalcWithNDS").Value
m_Code1C = nv.item("Code1C").Value
Else

  m_Podrazdelenie_ID = nv.Fields("Podrazdelenie").Value
  m_Client_ID = nv.Fields("Client").Value
m_Number_of_akt = nv.Fields("Number_of_akt").Value
m_Date_FROM = nv.Fields("Date_FROM").Value
m_Date_TO = nv.Fields("Date_TO").Value
  m_TheDgovor_ID = nv.Fields("TheDgovor").Value
m_dateCreate = nv.Fields("dateCreate").Value
m_dateSend = nv.Fields("dateSend").Value
m_dateReceive = nv.Fields("dateReceive").Value
m_FIO = nv.Fields("FIO").Value
m_CalcWithNDS = nv.Fields("CalcWithNDS").Value
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
   Dim o As PEKACT_DEF
   Set o = New PEKACT_DEF
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
  err.Raise err.Number, "PEKACT_DEF.Save", err.Description
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
  err.Raise err.Number, "PEKACT_DEF.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("PEKACT_DEF", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "PEKACT_DEF.Secure", err.Description
End Sub

'�������������� ����� �� �������� ������ � �������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "PEKACT_DEF", id
Exit Sub
bye:
  err.Raise err.Number, "PEKACT_DEF.Propagate", err.Description
End Sub

'����������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 m_Podrazdelenie_ID = ""
 Set m_Podrazdelenie = Nothing
 m_Client_ID = ""
 Set m_Client = Nothing
 m_TheDgovor_ID = ""
 Set m_TheDgovor = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "PEKACT_DEF.CloseClass"
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
  Set Podrazdelenie = Nothing
  m_Podrazdelenie_ID = node.Attributes.getNamedItem("PODRAZDELENIE").nodeValue
  m_Podrazdelenie_ID_BRIEF = node.Attributes.getNamedItem("PODRAZDELENIE_BRIEF").nodeValue
  Set Client = Nothing
  m_Client_ID = node.Attributes.getNamedItem("CLIENT").nodeValue
  m_Client_ID_BRIEF = node.Attributes.getNamedItem("CLIENT_BRIEF").nodeValue
  Number_of_akt = node.Attributes.getNamedItem("NUMBER_OF_AKT").nodeValue
  Date_FROM = node.Attributes.getNamedItem("DATE_FROM").nodeValue
  Date_TO = node.Attributes.getNamedItem("DATE_TO").nodeValue
  Set TheDgovor = Nothing
  m_TheDgovor_ID = node.Attributes.getNamedItem("THEDGOVOR").nodeValue
  m_TheDgovor_ID_BRIEF = node.Attributes.getNamedItem("THEDGOVOR_BRIEF").nodeValue
  dateCreate = node.Attributes.getNamedItem("DATECREATE").nodeValue
  dateSend = node.Attributes.getNamedItem("DATESEND").nodeValue
  dateReceive = node.Attributes.getNamedItem("DATERECEIVE").nodeValue
  FIO = Replace(node.Attributes.getNamedItem("FIO").nodeValue, vbLf, vbCrLf)
  CalcWithNDS = node.Attributes.getNamedItem("CALCWITHNDS").nodeValue
  Code1C = Replace(node.Attributes.getNamedItem("CODE1C").nodeValue, vbLf, vbCrLf)
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
  node.setAttribute "PODRAZDELENIE", m_Podrazdelenie_ID
  If Not (Podrazdelenie Is Nothing) Then
    node.setAttribute "PODRAZDELENIE_BRIEF", Podrazdelenie.Brief
  Else
    node.setAttribute "PODRAZDELENIE_BRIEF", m_Podrazdelenie_ID_BRIEF
  End If
  node.setAttribute "CLIENT", m_Client_ID
  If Not (Client Is Nothing) Then
    node.setAttribute "CLIENT_BRIEF", Client.Brief
  Else
    node.setAttribute "CLIENT_BRIEF", m_Client_ID_BRIEF
  End If
  node.setAttribute "NUMBER_OF_AKT", Number_of_akt
  node.setAttribute "DATE_FROM", CDbl(Date_FROM)
  node.setAttribute "DATE_TO", CDbl(Date_TO)
  node.setAttribute "THEDGOVOR", m_TheDgovor_ID
  If Not (TheDgovor Is Nothing) Then
    node.setAttribute "THEDGOVOR_BRIEF", TheDgovor.Brief
  Else
    node.setAttribute "THEDGOVOR_BRIEF", m_TheDgovor_ID_BRIEF
  End If
  node.setAttribute "DATECREATE", CDbl(dateCreate)
  node.setAttribute "DATESEND", CDbl(dateSend)
  node.setAttribute "DATERECEIVE", CDbl(dateReceive)
  node.setAttribute "FIO", FIO
  node.setAttribute "CALCWITHNDS", CalcWithNDS
  node.setAttribute "CODE1C", Code1C
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
m_IsLocked = Application.MTZSession.IsLocked("PEKACT_DEF", id)
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
OK = Application.MTZSession.LockResource("PEKACT_DEF", id, Permanent)
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
Application.MTZSession.UnLockResource "PEKACT_DEF", id
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
CanLock = Application.MTZSession.CanLock("PEKACT_DEF", id)
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
If mode = "main" Then
 Select Case child
End Select
End If ' mode="main"
If mode = "fill" Then
 Select Case child
End Select
End If ' mode="fill"
If mode = "" Then
 Select Case child
 End Select
End If ' mode="" (Default)
End Sub



