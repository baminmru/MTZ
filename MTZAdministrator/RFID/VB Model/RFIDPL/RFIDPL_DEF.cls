VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "RFIDPL_DEF"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 215
Option Explicit


'������ �������
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
Private m_TheCode As String
Private m_CurState As Object
Dim m_CurState_ID As String
Dim m_CurState_ID_BRIEF As String
Private m_TheGood As String
Private m_GoodWeight As Double
Private m_GoodWeightBrutto As Double
Private m_CntOfPackage As Double
Private m_PackageWeight As Double
Private m_PWeight As Double
Private m_OnePackageWeight As Double
Private m_OneBoxWeight As Double
Private m_WeightingDate As Date
Private m_LastOpDate As Date
Private m_PalletPlaceRef As Object
Dim m_PalletPlaceRef_ID As String
Dim m_PalletPlaceRef_ID_BRIEF As String
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
Attribute Change.VB_HelpID = 260
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
Attribute Deleted.VB_HelpID = 300
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
Attribute Changed.VB_HelpID = 265
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
Friend Property Let ID(ByVal newID As String)
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
Public Property Get ID() As String
Attribute ID.VB_HelpID = 325
  If m_ID = "" Then m_ID = CreateGUID2
  ID = m_ID
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
Attribute SecureStyleID.VB_HelpID = 420
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
Attribute PartName.VB_HelpID = 380
  PartName = "RFIDPL_DEF"
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
Attribute Parent.VB_HelpID = 375
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
  m_Application.Logger.Message "RFIDPL_DEF.Init"
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
Attribute Application.VB_HelpID = 225
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
Attribute RowRetrived.VB_HelpID = 405
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
Attribute RetriveTime.VB_HelpID = 400
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
Attribute ChangeTime.VB_HelpID = 270
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
Attribute AccessTime.VB_HelpID = 220
  AccessTime = m_AccessTime
End Property
Private Function GetFromXML(ByVal XML As String, ByVal TagName As String) As String
  Dim res As String
  On Error GoTo err
  Dim XMLDoc As New DOMDocument
  Call XMLDoc.loadXML(XML)
  Dim node As MSXML2.IXMLDOMNode
  For Each node In XMLDoc.childNodes.Item(0).childNodes
    If (UCase(node.baseName) = "BRIEF") Then
      res = node.Text
      Exit For
    End If
  Next
err:
  GetFromXML = res
End Function
' let
'����� �������

'����� �������
'Parameters:
'[IN]   newValue , ��� ���������: String  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let TheCode(ByVal NewValue As String)
Attribute TheCode.VB_HelpID = 425
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheCode", TheCode, NewValue

   m_TheCode = NewValue
End If
End Property

'����� �������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� String
'See Also:
'Example:
' dim variable as String
' variable = me. TheCode
Public Property Get TheCode() As String
 LoadFromDatabase
 AccessTime = Now

   TheCode = m_TheCode
End Property
' let
'������� ���������

'������� ���������
'Parameters:
'[IN]   newValue , ��� ���������: object  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Set CurState(ByVal NewValue As Object)
Attribute CurState.VB_HelpID = 290
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CurState", CurState, NewValue
On Error Resume Next
m_CurState_ID = ""
m_CurState_ID = NewValue.ID
'  set   m_CurState= newValue
End If
End Property

'������� ���������
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. CurState
Public Property Get CurState() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_CurState As Object
If m_CurState_ID <> "" Then
  Set tmp_CurState = Application.FindRowObject("RFIDD_PSTATE", m_CurState_ID)
  If tmp_CurState Is Nothing Then
    m_CurState_ID_BRIEF = ""
  Else
    m_CurState_ID_BRIEF = tmp_CurState.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "RFIDD_PSTATE" & m_CurState_ID, tmp_CurState
  Set CurState = tmp_CurState
  Exit Property
End If
  '  set CurState = m_CurState
End Property
' let
'�����

'�����
'Parameters:
'[IN]   newValue , ��� ���������: String  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let TheGood(ByVal NewValue As String)
Attribute TheGood.VB_HelpID = 430
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheGood", TheGood, NewValue

   m_TheGood = NewValue
End If
End Property

'�����
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� String
'See Also:
'Example:
' dim variable as String
' variable = me. TheGood
Public Property Get TheGood() As String
 LoadFromDatabase
 AccessTime = Now

   TheGood = m_TheGood
End Property
' let
'��� ����� �����

'��� ����� �����
'Parameters:
'[IN]   newValue , ��� ���������: double  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let GoodWeight(ByVal NewValue As Double)
Attribute GoodWeight.VB_HelpID = 315
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "GoodWeight", GoodWeight, NewValue

   m_GoodWeight = NewValue
End If
End Property

'��� ����� �����
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� double
'See Also:
'Example:
' dim variable as double
' variable = me. GoodWeight
Public Property Get GoodWeight() As Double
 LoadFromDatabase
 AccessTime = Now

   GoodWeight = m_GoodWeight
End Property
' let
'��� ����� ������

'��� ����� ������
'Parameters:
'[IN]   newValue , ��� ���������: double  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let GoodWeightBrutto(ByVal NewValue As Double)
Attribute GoodWeightBrutto.VB_HelpID = 320
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "GoodWeightBrutto", GoodWeightBrutto, NewValue

   m_GoodWeightBrutto = NewValue
End If
End Property

'��� ����� ������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� double
'See Also:
'Example:
' dim variable as double
' variable = me. GoodWeightBrutto
Public Property Get GoodWeightBrutto() As Double
 LoadFromDatabase
 AccessTime = Now

   GoodWeightBrutto = m_GoodWeightBrutto
End Property
' let
'���������� ��������

'���������� ��������
'Parameters:
'[IN]   newValue , ��� ���������: double  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let CntOfPackage(ByVal NewValue As Double)
Attribute CntOfPackage.VB_HelpID = 280
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CntOfPackage", CntOfPackage, NewValue

   m_CntOfPackage = NewValue
End If
End Property

'���������� ��������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� double
'See Also:
'Example:
' dim variable as double
' variable = me. CntOfPackage
Public Property Get CntOfPackage() As Double
 LoadFromDatabase
 AccessTime = Now

   CntOfPackage = m_CntOfPackage
End Property
' let
'��� ��������

'��� ��������
'Parameters:
'[IN]   newValue , ��� ���������: double  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let PackageWeight(ByVal NewValue As Double)
Attribute PackageWeight.VB_HelpID = 365
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PackageWeight", PackageWeight, NewValue

   m_PackageWeight = NewValue
End If
End Property

'��� ��������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� double
'See Also:
'Example:
' dim variable as double
' variable = me. PackageWeight
Public Property Get PackageWeight() As Double
 LoadFromDatabase
 AccessTime = Now

   PackageWeight = m_PackageWeight
End Property
' let
'��� �������

'��� �������
'Parameters:
'[IN]   newValue , ��� ���������: double  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let PWeight(ByVal NewValue As Double)
Attribute PWeight.VB_HelpID = 390
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PWeight", PWeight, NewValue

   m_PWeight = NewValue
End If
End Property

'��� �������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� double
'See Also:
'Example:
' dim variable as double
' variable = me. PWeight
Public Property Get PWeight() As Double
 LoadFromDatabase
 AccessTime = Now

   PWeight = m_PWeight
End Property
' let
'��� ����� ��������

'��� ����� ��������
'Parameters:
'[IN]   newValue , ��� ���������: double  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let OnePackageWeight(ByVal NewValue As Double)
Attribute OnePackageWeight.VB_HelpID = 355
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "OnePackageWeight", OnePackageWeight, NewValue

   m_OnePackageWeight = NewValue
End If
End Property

'��� ����� ��������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� double
'See Also:
'Example:
' dim variable as double
' variable = me. OnePackageWeight
Public Property Get OnePackageWeight() As Double
 LoadFromDatabase
 AccessTime = Now

   OnePackageWeight = m_OnePackageWeight
End Property
' let
'��� ���� ����� ��������

'��� ���� ����� ��������
'Parameters:
'[IN]   newValue , ��� ���������: double  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let OneBoxWeight(ByVal NewValue As Double)
Attribute OneBoxWeight.VB_HelpID = 350
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "OneBoxWeight", OneBoxWeight, NewValue

   m_OneBoxWeight = NewValue
End If
End Property

'��� ���� ����� ��������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� double
'See Also:
'Example:
' dim variable as double
' variable = me. OneBoxWeight
Public Property Get OneBoxWeight() As Double
 LoadFromDatabase
 AccessTime = Now

   OneBoxWeight = m_OneBoxWeight
End Property
' let
'���� ����������� �������

'���� ����������� �������
'Parameters:
'[IN]   newValue , ��� ���������: DATE  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let WeightingDate(ByVal NewValue As Date)
Attribute WeightingDate.VB_HelpID = 445
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "WeightingDate", WeightingDate, NewValue

   m_WeightingDate = NewValue
End If
End Property

'���� ����������� �������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. WeightingDate
Public Property Get WeightingDate() As Date
 LoadFromDatabase
 AccessTime = Now

   WeightingDate = m_WeightingDate
End Property
' let
'���� ��������� ��������

'���� ��������� ��������
'Parameters:
'[IN]   newValue , ��� ���������: DATE  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let LastOpDate(ByVal NewValue As Date)
Attribute LastOpDate.VB_HelpID = 335
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "LastOpDate", LastOpDate, NewValue

   m_LastOpDate = NewValue
End If
End Property

'���� ��������� ��������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� DATE
'See Also:
'Example:
' dim variable as DATE
' variable = me. LastOpDate
Public Property Get LastOpDate() As Date
 LoadFromDatabase
 AccessTime = Now

   LastOpDate = m_LastOpDate
End Property
' let
'����������

'����������
'Parameters:
'[IN]   newValue , ��� ���������: object  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Set PalletPlaceRef(ByVal NewValue As Object)
Attribute PalletPlaceRef.VB_HelpID = 370
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PalletPlaceRef", PalletPlaceRef, NewValue
On Error Resume Next
m_PalletPlaceRef_ID = ""
m_PalletPlaceRef_ID = NewValue.ID
'  set   m_PalletPlaceRef= newValue
End If
End Property

'����������
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. PalletPlaceRef
Public Property Get PalletPlaceRef() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_PalletPlaceRef As Object
If m_PalletPlaceRef_ID <> "" Then
  Set tmp_PalletPlaceRef = Application.FindRowObject("RFIDCELL_INFO", m_PalletPlaceRef_ID)
  If tmp_PalletPlaceRef Is Nothing Then
    m_PalletPlaceRef_ID_BRIEF = ""
  Else
    m_PalletPlaceRef_ID_BRIEF = tmp_PalletPlaceRef.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "RFIDCELL_INFO" & m_PalletPlaceRef_ID, tmp_PalletPlaceRef
  Set PalletPlaceRef = tmp_PalletPlaceRef
  Exit Property
End If
  '  set PalletPlaceRef = m_PalletPlaceRef
End Property

'��������� ���� � ����������� ���������
'Parameters:
'[IN][OUT]   nv , ��� ���������: NamedValues  - ...
'See Also:
'Example:
'  call me.Pack({���������})
Public Sub Pack(ByRef nv As NamedValues)
Attribute Pack.VB_HelpID = 360
  Dim nvi As NamedValue
  Set nv = Nothing
  Set nv = New NamedValues

  Set nvi = nv.Add("TheCode", m_TheCode)
nvi.ValueSize = 10
 ' Reference to RFIDD_PSTATE
    If m_CurState_ID = "" Then
       Set nvi = nv.Add("CurState", "")
    Else
       Set nvi = nv.Add("CurState", m_CurState_ID)
    End If
    nvi.ORACLE_GUID
  Set nvi = nv.Add("TheGood", m_TheGood)
nvi.ValueSize = 255
  Set nvi = nv.Add("GoodWeight", m_GoodWeight)
nvi.ValueType = adDouble
  Set nvi = nv.Add("GoodWeightBrutto", m_GoodWeightBrutto)
nvi.ValueType = adDouble
  Set nvi = nv.Add("CntOfPackage", m_CntOfPackage)
nvi.ValueType = adDouble
  Set nvi = nv.Add("PackageWeight", m_PackageWeight)
nvi.ValueType = adDouble
  Set nvi = nv.Add("PWeight", m_PWeight)
nvi.ValueType = adDouble
  Set nvi = nv.Add("OnePackageWeight", m_OnePackageWeight)
nvi.ValueType = adDouble
  Set nvi = nv.Add("OneBoxWeight", m_OneBoxWeight)
nvi.ValueType = adDouble
  Set nvi = nv.Add("WeightingDate", m_WeightingDate)
nvi.ValueType = adDBTimeStamp
  Set nvi = nv.Add("LastOpDate", m_LastOpDate)
nvi.ValueType = adDBTimeStamp
 ' Reference to RFIDCELL_INFO
    If m_PalletPlaceRef_ID = "" Then
       Set nvi = nv.Add("PalletPlaceRef", "")
    Else
       Set nvi = nv.Add("PalletPlaceRef", m_PalletPlaceRef_ID)
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
Attribute Brief.VB_HelpID = 235
 Dim s As String
 If Application.WorkOffline Then

  m_Brief = ""
 m_Brief = m_Brief & TheCode & "; "
   If CurState Is Nothing Then
     m_Brief = m_Brief & "{" & m_CurState_ID_BRIEF & "}; "
   Else
     m_Brief = m_Brief & "{" & CurState.Brief & "}; "
   End If
 Brief = m_Brief
 Else
  On Error GoTo bye
   If UseServer Or m_Brief = "" Then
     Application.MTZSession.GetBrief PartName, ID, s
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
Attribute UnPack.VB_HelpID = 440
 On Error Resume Next
If TypeName(nv) = "NamedValues" Then

m_TheCode = nv.Item("TheCode").Value
  m_CurState_ID = nv.Item("CurState").Value
m_TheGood = nv.Item("TheGood").Value
m_GoodWeight = nv.Item("GoodWeight").Value
m_GoodWeightBrutto = nv.Item("GoodWeightBrutto").Value
m_CntOfPackage = nv.Item("CntOfPackage").Value
m_PackageWeight = nv.Item("PackageWeight").Value
m_PWeight = nv.Item("PWeight").Value
m_OnePackageWeight = nv.Item("OnePackageWeight").Value
m_OneBoxWeight = nv.Item("OneBoxWeight").Value
m_WeightingDate = nv.Item("WeightingDate").Value
m_LastOpDate = nv.Item("LastOpDate").Value
  m_PalletPlaceRef_ID = nv.Item("PalletPlaceRef").Value
Else

m_TheCode = nv.Fields("TheCode").Value
  m_CurState_ID = nv.Fields("CurState").Value
m_TheGood = nv.Fields("TheGood").Value
m_GoodWeight = nv.Fields("GoodWeight").Value
m_GoodWeightBrutto = nv.Fields("GoodWeightBrutto").Value
m_CntOfPackage = nv.Fields("CntOfPackage").Value
m_PackageWeight = nv.Fields("PackageWeight").Value
m_PWeight = nv.Fields("PWeight").Value
m_OnePackageWeight = nv.Fields("OnePackageWeight").Value
m_OneBoxWeight = nv.Fields("OneBoxWeight").Value
m_WeightingDate = nv.Fields("WeightingDate").Value
m_LastOpDate = nv.Fields("LastOpDate").Value
  m_PalletPlaceRef_ID = nv.Fields("PalletPlaceRef").Value
End If
End Sub

'�������� ����
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.CleanFields()
Public Sub CleanFields()
Attribute CleanFields.VB_HelpID = 275
   Dim nv As NamedValues
   Dim o As RFIDPL_DEF
   Set o = New RFIDPL_DEF
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
Attribute Save.VB_HelpID = 410
   LoadFromDatabase
   If Application.WorkOffline Then Exit Function
   If Not CanChangeONLine Then Exit Function
   Dim nv As NamedValues
   Pack nv
   On Error GoTo bye
     Application.MTZSession.SaveRow2 PartName, ID, Me.Parent.Parent.ID, nv, Application.ID
   Changed = False
   Save = True
Exit Function
bye:
  err.Raise err.Number, "RFIDPL_DEF.Save", err.Description
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
Attribute Delete.VB_HelpID = 295
   Dim i As Long, OK As Boolean
If Application.WorkOffline Then
  If Not CanChangeOffline Then Exit Function
   On Error GoTo bye
  m_Deleted = True
  Delete = True
Else
  If Not CanChangeONLine Then Exit Function
   Delete = Application.MTZSession.DeleteRow2(PartName, ID, Application.ID)
   Changed = False
   'Compact
   CloseClass
End If
Exit Function
bye:
  err.Raise err.Number, "RFIDPL_DEF.Delete", err.Description
End Function

'������ ����� ������
'Parameters:
'[IN]   SecurityStyleID , ��� ���������: string  - ...
'See Also:
'Example:
'  call me.Secure({���������})
Public Sub Secure(ByVal SecurityStyleID As String)
Attribute Secure.VB_HelpID = 415
If Application.WorkOffline Then Exit Sub
On Error GoTo bye
  m_SecureStyleID = Application.MTZSession.Secure("RFIDPL_DEF", ID, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "RFIDPL_DEF.Secure", err.Description
End Sub

'�������������� ����� �� �������� ������ � �������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
Attribute Propagate.VB_HelpID = 385
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "RFIDPL_DEF", ID
Exit Sub
bye:
  err.Raise err.Number, "RFIDPL_DEF.Propagate", err.Description
End Sub

'����������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 m_CurState_ID = ""
 Set m_CurState = Nothing
 m_PalletPlaceRef_ID = ""
 Set m_PalletPlaceRef = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "RFIDPL_DEF.CloseClass"
 CloseParents
End Sub

'��������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.Refresh()
Public Sub Refresh()
Attribute Refresh.VB_HelpID = 395
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
Attribute LoadFromDatabase.VB_HelpID = 340
    On Error Resume Next
   If ID = "" Then Exit Sub
   If Application.WorkOffline Then
     RowRetrived = True
     RetriveTime = Now
     Exit Sub
   End If
   Dim rs As ADODB.Recordset
   If Not RowRetrived Then
     CleanFields
     Set rs = Application.MTZSession.GetRow(PartName, ID)
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
Attribute FindObject.VB_HelpID = 310
 Dim m_FindObject As Object
 Static inFindObject As Boolean
 If StrID = "" Then Exit Function
 If InstID = "" Then Exit Function
 If inFindObject Then Exit Function
 inFindObject = True
 If StrID = PartName Then
   If InstID = ID Then
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
Attribute Compact.VB_HelpID = 285
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
Attribute XMLLoad.VB_HelpID = 450
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
  TheCode = Replace(node.Attributes.getNamedItem("THECODE").nodeValue, vbLf, vbCrLf)
  Set CurState = Nothing
  m_CurState_ID = node.Attributes.getNamedItem("CURSTATE").nodeValue
  m_CurState_ID_BRIEF = node.Attributes.getNamedItem("CURSTATE_BRIEF").nodeValue
  TheGood = Replace(node.Attributes.getNamedItem("THEGOOD").nodeValue, vbLf, vbCrLf)
  GoodWeight = Val(Replace(node.Attributes.getNamedItem("GOODWEIGHT").nodeValue, vbLf, vbCrLf))
  GoodWeightBrutto = Val(Replace(node.Attributes.getNamedItem("GOODWEIGHTBRUTTO").nodeValue, vbLf, vbCrLf))
  CntOfPackage = Val(Replace(node.Attributes.getNamedItem("CNTOFPACKAGE").nodeValue, vbLf, vbCrLf))
  PackageWeight = Val(Replace(node.Attributes.getNamedItem("PACKAGEWEIGHT").nodeValue, vbLf, vbCrLf))
  PWeight = Val(Replace(node.Attributes.getNamedItem("PWEIGHT").nodeValue, vbLf, vbCrLf))
  OnePackageWeight = Val(Replace(node.Attributes.getNamedItem("ONEPACKAGEWEIGHT").nodeValue, vbLf, vbCrLf))
  OneBoxWeight = Val(Replace(node.Attributes.getNamedItem("ONEBOXWEIGHT").nodeValue, vbLf, vbCrLf))
  WeightingDate = node.Attributes.getNamedItem("WEIGHTINGDATE").nodeValue
  LastOpDate = node.Attributes.getNamedItem("LASTOPDATE").nodeValue
  Set PalletPlaceRef = Nothing
  m_PalletPlaceRef_ID = node.Attributes.getNamedItem("PALLETPLACEREF").nodeValue
  m_PalletPlaceRef_ID_BRIEF = node.Attributes.getNamedItem("PALLETPLACEREF_BRIEF").nodeValue
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
Public Sub XMLSave(node As IXMLDOMElement, Xdom As DOMDocument)
Attribute XMLSave.VB_HelpID = 455
On Error Resume Next
  Dim e_ As IXMLDOMElement
  LoadFromDatabase
  node.setAttribute "ID", m_ID
  node.setAttribute "Deleted", m_Deleted
  node.setAttribute "IsLocked", m_IsLocked
  node.setAttribute "RetriveTime", CDbl(m_RetriveTime)
  node.setAttribute "ChangeTime", CDbl(m_ChangeTime)
  node.setAttribute "SECURITYSTYLEID", m_SecureStyleID
  node.setAttribute "THECODE", TheCode
  node.setAttribute "CURSTATE", m_CurState_ID
  If Not (CurState Is Nothing) Then
    node.setAttribute "CURSTATE_BRIEF", CurState.Brief
  Else
    node.setAttribute "CURSTATE_BRIEF", m_CurState_ID_BRIEF
  End If
  node.setAttribute "THEGOOD", TheGood
  node.setAttribute "GOODWEIGHT", Replace(CStr(GoodWeight), ",", ".")
  node.setAttribute "GOODWEIGHTBRUTTO", Replace(CStr(GoodWeightBrutto), ",", ".")
  node.setAttribute "CNTOFPACKAGE", Replace(CStr(CntOfPackage), ",", ".")
  node.setAttribute "PACKAGEWEIGHT", Replace(CStr(PackageWeight), ",", ".")
  node.setAttribute "PWEIGHT", Replace(CStr(PWeight), ",", ".")
  node.setAttribute "ONEPACKAGEWEIGHT", Replace(CStr(OnePackageWeight), ",", ".")
  node.setAttribute "ONEBOXWEIGHT", Replace(CStr(OneBoxWeight), ",", ".")
  node.setAttribute "WEIGHTINGDATE", CDbl(WeightingDate)
  node.setAttribute "LASTOPDATE", CDbl(LastOpDate)
  node.setAttribute "PALLETPLACEREF", m_PalletPlaceRef_ID
  If Not (PalletPlaceRef Is Nothing) Then
    node.setAttribute "PALLETPLACEREF_BRIEF", PalletPlaceRef.Brief
  Else
    node.setAttribute "PALLETPLACEREF_BRIEF", m_PalletPlaceRef_ID_BRIEF
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
Attribute CanChange.VB_HelpID = 240
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
Attribute CanChangeOffline.VB_HelpID = 245
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
Attribute CanChangeONLine.VB_HelpID = 250
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
Attribute IsLocked.VB_HelpID = 330
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
m_IsLocked = Application.MTZSession.IsLocked("RFIDPL_DEF", ID)
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
Attribute LockResource.VB_HelpID = 345
If Application.WorkOffline Then Exit Function
  Dim OK
OK = Application.MTZSession.LockResource("RFIDPL_DEF", ID, Permanent)
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
Attribute UnLockResource.VB_HelpID = 435
If Application.WorkOffline Then Exit Function
On Error GoTo bye
Application.MTZSession.UnLockResource "RFIDPL_DEF", ID
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
Attribute CanLock.VB_HelpID = 255
If Application.WorkOffline Then Exit Function
On Error Resume Next
CanLock = Application.MTZSession.CanLock("RFIDPL_DEF", ID)
End Function

'�������� ���������� ���������� �����
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.BatchUpdate()
Public Sub BatchUpdate()
Attribute BatchUpdate.VB_HelpID = 230
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
Attribute Expand.VB_HelpID = 305
 Dim ID As String, struct As String, child As String
 Dim Item As Object, i As Long, nid As String, tmpid As String
 Dim tidx As Long, tID As String 'only for tree styled structure
 On Error Resume Next
 ID = Mid(key, 39, 38)
 struct = Right(tree.nodes.Item(key).Parent.Parent.key, Len(tree.nodes.Item(key).Parent.Parent.key) - 76)
 child = Right(key, Len(key) - 76)
 If ID <> m_ID Then
   Exit Sub
 Else
    Set Item = Me
 End If
 tree.nodes.Item(key).Sorted = True
If mode = "" Then
 Select Case child
 End Select
End If ' mode="" (Default)
End Sub



