VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "MASKSLINE"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ ������� MASKSLINE
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
Private m_CFLD As String
Private m_CHEADER As String
Private m_SEQUENCE As Double
Private m_COLWIDTH As Double
Private m_COLFORMAT As String
Private m_COLHIDDEN As enumBoolean
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
  PartName = "MASKSLINE"
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
  m_Application.Logger.Message "MASKSLINE.Init"
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
Public Property Let CFLD(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CFLD", CFLD, NewValue

   m_CFLD = NewValue
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
' variable = me. CFLD
Public Property Get CFLD() As String
 LoadFromDatabase
 AccessTime = Now

   CFLD = m_CFLD
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
Public Property Let CHEADER(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "CHEADER", CHEADER, NewValue

   m_CHEADER = NewValue
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
' variable = me. CHEADER
Public Property Get CHEADER() As String
 LoadFromDatabase
 AccessTime = Now

   CHEADER = m_CHEADER
End Property
' let
'������� �����������

'������� �����������
'Parameters:
'[IN]   newValue , ��� ���������: double  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let SEQUENCE(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "SEQUENCE", SEQUENCE, NewValue

   m_SEQUENCE = NewValue
End If
End Property

'������� �����������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� double
'See Also:
'Example:
' dim variable as double
' variable = me. SEQUENCE
Public Property Get SEQUENCE() As Double
 LoadFromDatabase
 AccessTime = Now

   SEQUENCE = m_SEQUENCE
End Property
' let
'������ �������

'������ �������
'Parameters:
'[IN]   newValue , ��� ���������: double  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let COLWIDTH(ByVal NewValue As Double)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "COLWIDTH", COLWIDTH, NewValue

   m_COLWIDTH = NewValue
End If
End Property

'������ �������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� double
'See Also:
'Example:
' dim variable as double
' variable = me. COLWIDTH
Public Property Get COLWIDTH() As Double
 LoadFromDatabase
 AccessTime = Now

   COLWIDTH = m_COLWIDTH
End Property
' let
'��� ����

'��� ����
'Parameters:
'[IN]   newValue , ��� ���������: String  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let COLFORMAT(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "COLFORMAT", COLFORMAT, NewValue

   m_COLFORMAT = NewValue
End If
End Property

'��� ����
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� String
'See Also:
'Example:
' dim variable as String
' variable = me. COLFORMAT
Public Property Get COLFORMAT() As String
 LoadFromDatabase
 AccessTime = Now

   COLFORMAT = m_COLFORMAT
End Property
' let
'������ �������

'������ �������
'Parameters:
'[IN]   newValue , ��� ���������: enumBoolean  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'  ,��� �������� ������ ���������� ����
'See Also:
'Example:
Public Property Let COLHIDDEN(ByVal NewValue As enumBoolean)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "COLHIDDEN", COLHIDDEN, NewValue

   m_COLHIDDEN = NewValue
End If
End Property

'������ �������
'Parameters:
' ���������� ���
'Returns:
'  ������ ������ enumBoolean
'  ,��� Nothing
'See Also:
'Example:
' dim variable as enumBoolean
' Set variable = me. COLHIDDEN
Public Property Get COLHIDDEN() As enumBoolean
 LoadFromDatabase
 AccessTime = Now

   COLHIDDEN = m_COLHIDDEN
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

  Set nvi = nv.Add("CFLD", m_CFLD)
nvi.ValueSize = 240
  Set nvi = nv.Add("CHEADER", m_CHEADER)
nvi.ValueSize = 16
  Set nvi = nv.Add("SEQUENCE", m_SEQUENCE)
nvi.ValueType = adDouble
  Set nvi = nv.Add("COLWIDTH", m_COLWIDTH)
nvi.ValueType = adDouble
  Set nvi = nv.Add("COLFORMAT", m_COLFORMAT)
nvi.ValueSize = 1
  Set nvi = nv.Add("COLHIDDEN", m_COLHIDDEN)
nvi.ValueType = adInteger
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
 m_Brief = m_Brief & CFLD & "; "
 m_Brief = m_Brief & CHEADER & "; "
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

m_CFLD = nv.item("CFLD").Value
m_CHEADER = nv.item("CHEADER").Value
m_SEQUENCE = nv.item("SEQUENCE").Value
m_COLWIDTH = nv.item("COLWIDTH").Value
m_COLFORMAT = nv.item("COLFORMAT").Value
m_COLHIDDEN = nv.item("COLHIDDEN").Value
Else

m_CFLD = nv.Fields("CFLD").Value
m_CHEADER = nv.Fields("CHEADER").Value
m_SEQUENCE = nv.Fields("SEQUENCE").Value
m_COLWIDTH = nv.Fields("COLWIDTH").Value
m_COLFORMAT = nv.Fields("COLFORMAT").Value
m_COLHIDDEN = nv.Fields("COLHIDDEN").Value
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
   Dim o As MASKSLINE
   Set o = New MASKSLINE
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
  err.Raise err.Number, "MASKSLINE.Save", err.Description
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
  err.Raise err.Number, "MASKSLINE.Delete", err.Description
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
  m_SecureStyleID = Application.MTZSession.Secure("MASKSLINE", id, SecurityStyleID)
Exit Sub
bye:
  err.Raise err.Number, "MASKSLINE.Secure", err.Description
End Sub

'�������������� ����� �� �������� ������ � �������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
  Application.MTZSession.Propagate "MASKSLINE", id
Exit Sub
bye:
  err.Raise err.Number, "MASKSLINE.Propagate", err.Description
End Sub

'����������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next

 If Not Application Is Nothing Then Application.Logger.Message "MASKSLINE.CloseClass"
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
  CFLD = Replace(node.Attributes.getNamedItem("CFLD").nodeValue, vbLf, vbCrLf)
  CHEADER = Replace(node.Attributes.getNamedItem("CHEADER").nodeValue, vbLf, vbCrLf)
  SEQUENCE = Val(Replace(node.Attributes.getNamedItem("SEQUENCE").nodeValue, vbLf, vbCrLf))
  COLWIDTH = Val(Replace(node.Attributes.getNamedItem("COLWIDTH").nodeValue, vbLf, vbCrLf))
  COLFORMAT = Replace(node.Attributes.getNamedItem("COLFORMAT").nodeValue, vbLf, vbCrLf)
  COLHIDDEN = node.Attributes.getNamedItem("COLHIDDEN").nodeValue
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
  node.setAttribute "CFLD", CFLD
  node.setAttribute "CHEADER", CHEADER
  node.setAttribute "SEQUENCE", Replace(CStr(SEQUENCE), ",", ".")
  node.setAttribute "COLWIDTH", Replace(CStr(COLWIDTH), ",", ".")
  node.setAttribute "COLFORMAT", COLFORMAT
  node.setAttribute "COLHIDDEN", COLHIDDEN
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
m_IsLocked = Application.MTZSession.IsLocked("MASKSLINE", id)
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
OK = Application.MTZSession.LockResource("MASKSLINE", id, Permanent)
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
Application.MTZSession.UnLockResource "MASKSLINE", id
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
CanLock = Application.MTZSession.CanLock("MASKSLINE", id)
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



