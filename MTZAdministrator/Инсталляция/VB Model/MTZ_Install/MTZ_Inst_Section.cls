VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "MTZ_Inst_Section"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
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
Private m_MTZ_Inst_Sec_Files As MTZ_Inst_Sec_Files_col
Private m_TheName As String
Private m_IsVisible As enumYesNo
Private m_TheDescription As String
Private m_IsNotDeletable As enumYesNo
Private m_TheTargetPlatform As enumDevelopmentBase
Private m_IsCustomSection As enumYesNo
Private m_CustomSectionInstall As Object
Dim m_CustomSectionInstall_ID As String
Dim m_CustomSectionInstall_ID_BRIEF As String
Private m_CustomSectionUnInstall As Object
Dim m_CustomSectionUnInstall_ID As String
Dim m_CustomSectionUnInstall_ID_BRIEF As String
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
  PartName = "MTZ_Inst_Section"
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
  m_Application.Logger.Message "MTZ_Inst_Section.Init"
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

'������ ��������� ������� ����� ������
'Parameters:
'[IN]   Refresh , ��� ���������: boolean = true  - ...
'Returns:
'  ������ ������ MTZ_Inst_Sec_Files_col
'  ,��� Nothing
'See Also:
'Example:
' dim variable as MTZ_Inst_Sec_Files_col
' Set variable = me. MTZ_Inst_Sec_Files (...���������...)
Public Property Get MTZ_Inst_Sec_Files(Optional ByVal Refresh As Boolean = True) As MTZ_Inst_Sec_Files_col
 If m_MTZ_Inst_Sec_Files Is Nothing Then
   Set m_MTZ_Inst_Sec_Files = New MTZ_Inst_Sec_Files_col
   Set m_MTZ_Inst_Sec_Files.Parent = Me
   Set m_MTZ_Inst_Sec_Files.Application = Me.Application
   If Refresh Then m_MTZ_Inst_Sec_Files.Refresh
 End If
 Set MTZ_Inst_Sec_Files = m_MTZ_Inst_Sec_Files
End Property
' let
'�������� (Eng)

'�������� (Eng)
'Parameters:
'[IN]   newValue , ��� ���������: String  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let TheName(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheName", TheName, NewValue

   m_TheName = NewValue
End If
End Property

'�������� (Eng)
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� String
'See Also:
'Example:
' dim variable as String
' variable = me. TheName
Public Property Get TheName() As String
 LoadFromDatabase
 AccessTime = Now

   TheName = m_TheName
End Property
' let
'�������

'�������
'Parameters:
'[IN]   newValue , ��� ���������: enumYesNo  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let IsVisible(ByVal NewValue As enumYesNo)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IsVisible", IsVisible, NewValue

   m_IsVisible = NewValue
End If
End Property

'�������
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ enumYesNo
'  ,��� Nothing
'See Also:
'Example:
' dim variable as enumYesNo
' Set variable = me. IsVisible
Public Property Get IsVisible() As enumYesNo
 LoadFromDatabase
 AccessTime = Now

   IsVisible = m_IsVisible
End Property
' let
'����������� (ToolTip)

'����������� (ToolTip)
'Parameters:
'[IN]   newValue , ��� ���������: String  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let TheDescription(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheDescription", TheDescription, NewValue

   m_TheDescription = NewValue
End If
End Property

'����������� (ToolTip)
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� String
'See Also:
'Example:
' dim variable as String
' variable = me. TheDescription
Public Property Get TheDescription() As String
 LoadFromDatabase
 AccessTime = Now

   TheDescription = m_TheDescription
End Property
' let
'������������

'������������
'Parameters:
'[IN]   newValue , ��� ���������: enumYesNo  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let IsNotDeletable(ByVal NewValue As enumYesNo)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IsNotDeletable", IsNotDeletable, NewValue

   m_IsNotDeletable = NewValue
End If
End Property

'������������
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ enumYesNo
'  ,��� Nothing
'See Also:
'Example:
' dim variable as enumYesNo
' Set variable = me. IsNotDeletable
Public Property Get IsNotDeletable() As enumYesNo
 LoadFromDatabase
 AccessTime = Now

   IsNotDeletable = m_IsNotDeletable
End Property
' let
'������� ���������

'������� ���������
'Parameters:
'[IN]   newValue , ��� ���������: enumDevelopmentBase  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let TheTargetPlatform(ByVal NewValue As enumDevelopmentBase)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "TheTargetPlatform", TheTargetPlatform, NewValue

   m_TheTargetPlatform = NewValue
End If
End Property

'������� ���������
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ enumDevelopmentBase
'  ,��� Nothing
'See Also:
'Example:
' dim variable as enumDevelopmentBase
' Set variable = me. TheTargetPlatform
Public Property Get TheTargetPlatform() As enumDevelopmentBase
 LoadFromDatabase
 AccessTime = Now

   TheTargetPlatform = m_TheTargetPlatform
End Property
' let
'Custom Section

'Custom Section
'Parameters:
'[IN]   newValue , ��� ���������: enumYesNo  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let IsCustomSection(ByVal NewValue As enumYesNo)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "IsCustomSection", IsCustomSection, NewValue

   m_IsCustomSection = NewValue
End If
End Property

'Custom Section
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ enumYesNo
'  ,��� Nothing
'See Also:
'Example:
' dim variable as enumYesNo
' Set variable = me. IsCustomSection
Public Property Get IsCustomSection() As enumYesNo
 LoadFromDatabase
 AccessTime = Now

   IsCustomSection = m_IsCustomSection
End Property
' let
'Custom Section Install

'Custom Section Install
'Parameters:
'[IN]   newValue , ��� ���������: object  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Set CustomSectionInstall(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CustomSectionInstall", CustomSectionInstall, NewValue
On Error Resume Next
m_CustomSectionInstall_ID = ""
m_CustomSectionInstall_ID = NewValue.id
'  set   m_CustomSectionInstall= newValue
End If
End Property

'Custom Section Install
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. CustomSectionInstall
Public Property Get CustomSectionInstall() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_CustomSectionInstall As Object
If m_CustomSectionInstall_ID <> "" Then
  Set tmp_CustomSectionInstall = Application.FindRowObject("MTZ_Inst_Common", m_CustomSectionInstall_ID)
  If tmp_CustomSectionInstall Is Nothing Then
    m_CustomSectionInstall_ID_BRIEF = ""
  Else
    m_CustomSectionInstall_ID_BRIEF = tmp_CustomSectionInstall.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "MTZ_Inst_Common" & m_CustomSectionInstall_ID, tmp_CustomSectionInstall
  Set CustomSectionInstall = tmp_CustomSectionInstall
  Exit Property
End If
  '  set CustomSectionInstall = m_CustomSectionInstall
End Property
' let
'Custom Section UnInstall

'Custom Section UnInstall
'Parameters:
'[IN]   newValue , ��� ���������: object  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Set CustomSectionUnInstall(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CustomSectionUnInstall", CustomSectionUnInstall, NewValue
On Error Resume Next
m_CustomSectionUnInstall_ID = ""
m_CustomSectionUnInstall_ID = NewValue.id
'  set   m_CustomSectionUnInstall= newValue
End If
End Property

'Custom Section UnInstall
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. CustomSectionUnInstall
Public Property Get CustomSectionUnInstall() As Object
 LoadFromDatabase
 AccessTime = Now
Dim tmp_CustomSectionUnInstall As Object
If m_CustomSectionUnInstall_ID <> "" Then
  Set tmp_CustomSectionUnInstall = Application.FindRowObject("MTZ_Inst_Common", m_CustomSectionUnInstall_ID)
  If tmp_CustomSectionUnInstall Is Nothing Then
    m_CustomSectionUnInstall_ID_BRIEF = ""
  Else
    m_CustomSectionUnInstall_ID_BRIEF = tmp_CustomSectionUnInstall.Brief
  End If
  '''''' Speed optimization ONLY '''''''''
  Application.AddToCash "MTZ_Inst_Common" & m_CustomSectionUnInstall_ID, tmp_CustomSectionUnInstall
  Set CustomSectionUnInstall = tmp_CustomSectionUnInstall
  Exit Property
End If
  '  set CustomSectionUnInstall = m_CustomSectionUnInstall
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

  Set nvi = nv.Add("TheName", m_TheName)
nvi.ValueSize = 255
  Set nvi = nv.Add("IsVisible", m_IsVisible)
nvi.ValueType = adInteger
  Set nvi = nv.Add("TheDescription", m_TheDescription)
nvi.ValueSize = 2048
  Set nvi = nv.Add("IsNotDeletable", m_IsNotDeletable)
nvi.ValueType = adInteger
  Set nvi = nv.Add("TheTargetPlatform", m_TheTargetPlatform)
nvi.ValueType = adInteger
  Set nvi = nv.Add("IsCustomSection", m_IsCustomSection)
nvi.ValueType = adInteger
 ' Reference to MTZ_Inst_Common
    If m_CustomSectionInstall_ID = "" Then
       Set nvi = nv.Add("CustomSectionInstall", "")
    Else
       Set nvi = nv.Add("CustomSectionInstall", m_CustomSectionInstall_ID)
    End If
    nvi.ORACLE_GUID
 ' Reference to MTZ_Inst_Common
    If m_CustomSectionUnInstall_ID = "" Then
       Set nvi = nv.Add("CustomSectionUnInstall", "")
    Else
       Set nvi = nv.Add("CustomSectionUnInstall", m_CustomSectionUnInstall_ID)
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
 m_Brief = m_Brief & TheName & "; "
Select Case TheTargetPlatform
Case DevelopmentBase_JAVA
   m_Brief = m_Brief & "JAVA; "
Case DevelopmentBase_OTHER
   m_Brief = m_Brief & "OTHER; "
Case DevelopmentBase_DOTNET
   m_Brief = m_Brief & "DOTNET; "
Case DevelopmentBase_VB6
   m_Brief = m_Brief & "VB6; "
End Select 'TheTargetPlatform
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

m_TheName = nv.item("TheName").Value
m_IsVisible = nv.item("IsVisible").Value
m_TheDescription = nv.item("TheDescription").Value
m_IsNotDeletable = nv.item("IsNotDeletable").Value
m_TheTargetPlatform = nv.item("TheTargetPlatform").Value
m_IsCustomSection = nv.item("IsCustomSection").Value
  m_CustomSectionInstall_ID = nv.item("CustomSectionInstall").Value
  m_CustomSectionUnInstall_ID = nv.item("CustomSectionUnInstall").Value
Else

m_TheName = nv.Fields("TheName").Value
m_IsVisible = nv.Fields("IsVisible").Value
m_TheDescription = nv.Fields("TheDescription").Value
m_IsNotDeletable = nv.Fields("IsNotDeletable").Value
m_TheTargetPlatform = nv.Fields("TheTargetPlatform").Value
m_IsCustomSection = nv.Fields("IsCustomSection").Value
  m_CustomSectionInstall_ID = nv.Fields("CustomSectionInstall").Value
  m_CustomSectionUnInstall_ID = nv.Fields("CustomSectionUnInstall").Value
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
   Dim o As MTZ_Inst_Section
   Set o = New MTZ_Inst_Section
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
  err.Raise err.Number, "MTZ_Inst_Section.Save", err.Description
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
  err.Raise err.Number, "MTZ_Inst_Section.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("MTZ_Inst_Section", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "MTZ_Inst_Section.Secure", err.Description
End Sub

'�������������� ����� �� �������� ������ � �������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "MTZ_Inst_Section", id
Exit Sub
bye:
  err.Raise err.Number, "MTZ_Inst_Section.Propagate", err.Description
End Sub

'����������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

If Not m_MTZ_Inst_Sec_Files Is Nothing Then
  m_MTZ_Inst_Sec_Files.CloseClass
  Set m_MTZ_Inst_Sec_Files = Nothing
End If
 m_CustomSectionInstall_ID = ""
 Set m_CustomSectionInstall = Nothing
 m_CustomSectionUnInstall_ID = ""
 Set m_CustomSectionUnInstall = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "MTZ_Inst_Section.CloseClass"
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
   Set m_FindObject = MTZ_Inst_Sec_Files.FindObject(StrID, InstID)
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

MTZ_Inst_Sec_Files.Compact
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
  TheName = Replace(node.Attributes.getNamedItem("THENAME").nodeValue, vbLf, vbCrLf)
  IsVisible = node.Attributes.getNamedItem("ISVISIBLE").nodeValue
  TheDescription = Replace(node.Attributes.getNamedItem("THEDESCRIPTION").nodeValue, vbLf, vbCrLf)
  IsNotDeletable = node.Attributes.getNamedItem("ISNOTDELETABLE").nodeValue
  TheTargetPlatform = node.Attributes.getNamedItem("THETARGETPLATFORM").nodeValue
  IsCustomSection = node.Attributes.getNamedItem("ISCUSTOMSECTION").nodeValue
  Set CustomSectionInstall = Nothing
  m_CustomSectionInstall_ID = node.Attributes.getNamedItem("CUSTOMSECTIONINSTALL").nodeValue
  m_CustomSectionInstall_ID_BRIEF = node.Attributes.getNamedItem("CUSTOMSECTIONINSTALL_BRIEF").nodeValue
  Set CustomSectionUnInstall = Nothing
  m_CustomSectionUnInstall_ID = node.Attributes.getNamedItem("CUSTOMSECTIONUNINSTALL").nodeValue
  m_CustomSectionUnInstall_ID_BRIEF = node.Attributes.getNamedItem("CUSTOMSECTIONUNINSTALL_BRIEF").nodeValue
  On Error GoTo bye
  'if m_ChangeTime >= m_RetriveTime then m_Changed = true
  m_Changed = True
  m_RowRetrived = True
  m_Brief = ""
  On Error Resume Next
  Set e_list = node.selectNodes("MTZ_INST_SEC_FILES_COL")
  MTZ_Inst_Sec_Files.XMLLoad e_list, LoadMode
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
  node.setAttribute "THENAME", TheName
  node.setAttribute "ISVISIBLE", IsVisible
  node.setAttribute "THEDESCRIPTION", TheDescription
  node.setAttribute "ISNOTDELETABLE", IsNotDeletable
  node.setAttribute "THETARGETPLATFORM", TheTargetPlatform
  node.setAttribute "ISCUSTOMSECTION", IsCustomSection
  node.setAttribute "CUSTOMSECTIONINSTALL", m_CustomSectionInstall_ID
  If Not (CustomSectionInstall Is Nothing) Then
    node.setAttribute "CUSTOMSECTIONINSTALL_BRIEF", CustomSectionInstall.Brief
  Else
    node.setAttribute "CUSTOMSECTIONINSTALL_BRIEF", m_CustomSectionInstall_ID_BRIEF
  End If
  node.setAttribute "CUSTOMSECTIONUNINSTALL", m_CustomSectionUnInstall_ID
  If Not (CustomSectionUnInstall Is Nothing) Then
    node.setAttribute "CUSTOMSECTIONUNINSTALL_BRIEF", CustomSectionUnInstall.Brief
  Else
    node.setAttribute "CUSTOMSECTIONUNINSTALL_BRIEF", m_CustomSectionUnInstall_ID_BRIEF
  End If
  node.setAttribute "AccessTime", CDbl(m_AccessTime)
  MTZ_Inst_Sec_Files.XMLSave node, xdom
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
m_IsLocked = Application.MTZSession.IsLocked("MTZ_Inst_Section", id)
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
OK = Application.MTZSession.LockResource("MTZ_Inst_Section", id, Permanent)
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
Application.MTZSession.UnLockResource "MTZ_Inst_Section", id
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
CanLock = Application.MTZSession.CanLock("MTZ_Inst_Section", id)
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
 MTZ_Inst_Sec_Files.BatchUpdate
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
  MTZ_Inst_Sec_Files.LoadAll
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
 Case "MTZ_Inst_Sec_Files"
    item.MTZ_Inst_Sec_Files.Refresh
    For i = 1 To item.MTZ_Inst_Sec_Files.Count
    nid = CreateGUID2() & item.MTZ_Inst_Sec_Files.item(i).id
    tree.nodes.Add(key, 4, nid, item.MTZ_Inst_Sec_Files.item(i).Brief(True)).Tag = "Row"
    Next
 End Select
End If ' mode="" (Default)
End Sub



