VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "WFRtm_fparents"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


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
Private m_PrevFunc As Object
Dim m_PrevFunc_ID As String
Dim m_PrevFunc_ID_BRIEF As String
Private m_Brief As String
Public Event Change(ByVal fieldName As String, ByVal OldValue, ByRef NewValue)
Private m_IsLocked As LockStyle


Public Property Get Deleted() As Boolean
  Deleted = m_Deleted
End Property
Public Property Get Changed() As Boolean
  Changed = m_Changed
End Property
Friend Property Let Changed(newChanged As Boolean)
  m_Changed = newChanged
End Property
Friend Property Let id(ByVal newID As String)
  If m_ID = "" Then
    m_ID = newID
  End If
End Property
Public Property Get id() As String
  If m_ID = "" Then m_ID = CreateGUID2
  id = m_ID
End Property
Friend Property Let SecureStyleID(ByVal newID As String)
    m_SecureStyleID = newID
End Property
Public Property Get SecureStyleID() As String
  SecureStyleID = m_SecureStyleID
End Property
Public Property Get PartName() As String
  PartName = "WFRtm_fparents"
End Property
Friend Property Set Parent(newParent As Object)
  Set m_Parent = newParent
End Property
Public Property Get Parent() As Object
  Set Parent = m_Parent
End Property
Friend Property Set Application(newApplication As Application)
  Set m_Application = newApplication
  m_Application.Logger.Message "WFRtm_fparents.Init"
End Property
Public Property Get Application() As Application
  Set Application = m_Application
End Property
Private Sub CloseParents()
  Set m_Application = Nothing
  Set m_Parent = Nothing
End Sub
Friend Property Let RowRetrived(newRetrived As Boolean)
  m_RowRetrived = newRetrived
End Property
Public Property Get RowRetrived() As Boolean
  RowRetrived = m_RowRetrived
End Property
Friend Property Let RetriveTime(newRetriveTime As Date)
  m_RetriveTime = newRetriveTime
End Property
Public Property Get RetriveTime() As Date
  RetriveTime = m_RetriveTime
End Property
Friend Property Let ChangeTime(newChangeTime As Date)
  m_ChangeTime = newChangeTime
End Property
Public Property Get ChangeTime() As Date
 ChangeTime = m_ChangeTime
End Property
Friend Property Let AccessTime(newAccessTime As Date)
  m_AccessTime = newAccessTime
  If m_AccessTime <= m_RetriveTime Then m_AccessTime = m_RetriveTime + 0.001
End Property
Public Property Get AccessTime() As Date
  AccessTime = m_AccessTime
End Property
' let
'PrevFunc
Public Property Set PrevFunc(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "PrevFunc", PrevFunc, NewValue
On Error Resume Next
m_PrevFunc_ID = ""
m_PrevFunc_ID = NewValue.id
 Set m_PrevFunc = NewValue
End If
End Property
Public Property Get PrevFunc() As Object
 LoadFromDatabase
 AccessTime = Now
If m_PrevFunc Is Nothing And m_PrevFunc_ID <> "" Then
  Set m_PrevFunc = Application.FindRowObject("WFRtm_func", m_PrevFunc_ID)
  If m_PrevFunc Is Nothing Then
    m_PrevFunc_ID_BRIEF = ""
  Else
    m_PrevFunc_ID_BRIEF = m_PrevFunc.Brief
  End If
End If
   Set PrevFunc = m_PrevFunc
End Property
Public Sub Pack(ByRef nv As NamedValues)
  Set nv = Nothing
  Set nv = New NamedValues

 ' Reference to WFRtm_func
  If m_PrevFunc Is Nothing Then
    If m_PrevFunc_ID = "" Then
       nv.Add "PrevFunc", ""
    Else
       nv.Add "PrevFunc", m_PrevFunc_ID
    End If
  Else
     nv.Add "PrevFunc", m_PrevFunc.id
  End If
End Sub
Public Function Brief(Optional ByVal UseServer As Boolean = False) As String
 Dim s As String
 If Application.WorkOffline Then

  m_Brief = ""
  m_Brief = m_Brief & "Предыдущая функция="
   If PrevFunc Is Nothing Then
     m_Brief = m_Brief & "{" & m_PrevFunc_ID_BRIEF & "}; "
   Else
     m_Brief = m_Brief & "{" & PrevFunc.Brief & "}; "
   End If
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
    Brief = "! доступ запрещен !"
End Function
Public Sub UnPack(ByRef nv As Object)
 On Error Resume Next
If TypeName(nv) = "NamedValues" Then

  m_PrevFunc_ID = nv.item("PrevFunc").Value
Else

  m_PrevFunc_ID = nv.Fields("PrevFunc").Value
End If
End Sub
Public Sub CleanFields()
   Dim nv As NamedValues
   Dim o As WFRtm_fparents
   Set o = New WFRtm_fparents
   Set o.Application = Me.Application
   Set o.Parent = Me.Parent
   o.Pack nv
   UnPack nv
   Set o = Nothing
End Sub
Public Function Save() As Boolean
   LoadFromDatabase
   If Application.WorkOffline Then Exit Function
   If Not CanChangeONLine Then Exit Function
   Dim nv As NamedValues
   Pack nv
   On Error GoTo bye
     Application.MTZSession.SaveRow PartName, id, Me.Parent.Parent.id, nv
   Changed = False
   Save = True
Exit Function
bye:
  Err.Raise Err.Number, "WFRtm_fparents.Save", Err.Description
End Function
Public Function Delete() As Boolean
   Dim i As Long, OK As Boolean
If Application.WorkOffline Then
  If Not CanChangeOffline Then Exit Function
   On Error GoTo bye
  m_Deleted = True
  Delete = True
Else
  If Not CanChangeONLine Then Exit Function
   Delete = Application.MTZSession.DeleteRow(PartName, id)
   Changed = False
   'Compact
   CloseClass
End If
Exit Function
bye:
  Err.Raise Err.Number, "WFRtm_fparents.Delete", Err.Description
End Function
Public Sub Secure(ByVal SecurityStyleID As String)
If Application.WorkOffline Then Exit Sub
Dim nv As NamedValues
Set nv = New NamedValues
nv.Add "ROWID", id
nv.Add "SECURITYSTYLEID", SecurityStyleID
On Error GoTo bye
Application.MTZSession.Exec "WFRtm_fparents_SINIT", nv
Set nv = Nothing
m_SecureStyleID = SecurityStyleID
Exit Sub
bye:
Set nv = Nothing
  Err.Raise Err.Number, "WFRtm_fparents.Secure", Err.Description
End Sub
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
Dim nv As NamedValues
Set nv = New NamedValues
nv.Add "ROWID", id
On Error GoTo bye
Application.MTZSession.Exec "WFRtm_fparents_PROPAGATE", nv
Set nv = Nothing
Exit Sub
bye:
Set nv = Nothing
  Err.Raise Err.Number, "WFRtm_fparents.Propagate", Err.Description
End Sub
Friend Sub CloseClass()
 On Error Resume Next

 m_PrevFunc_ID = ""
 Set m_PrevFunc = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "WFRtm_fparents.CloseClass"
 CloseParents
End Sub
Public Sub Refresh()
    On Error Resume Next
    RowRetrived = False
    m_Brief = ""
End Sub
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
Public Sub Compact()
 If Not Changed Then
   CleanFields
   RowRetrived = False
 End If

End Sub
Friend Sub OnChange(ByVal fieldName As String, ByVal OldValue, ByRef NewValue)
RaiseEvent Change(fieldName, OldValue, NewValue)
End Sub


Public Sub XMLLoad(node As IXMLDOMNode, Optional ByVal LoadMode As Integer = 0): On Error Resume Next
  Dim e_list As IXMLDOMNodeList
  Dim e_ As IXMLDOMNode
  m_ID = node.Attributes.getNamedItem("ID").nodeValue
  m_Deleted = node.Attributes.getNamedItem("Deleted").nodeValue
  m_IsLocked = node.Attributes.getNamedItem("IsLocked").nodeValue
  If m_IsLocked > 2 Then m_IsLocked = 0
  m_RetriveTime = node.Attributes.getNamedItem("RetriveTime").nodeValue
  m_ChangeTime = node.Attributes.getNamedItem("ChangeTime").nodeValue
  m_AccessTime = node.Attributes.getNamedItem("AccessTime").nodeValue
  If Application.WorkOffline And m_IsLocked = LockSession Then m_IsLocked = NoLock
  Set PrevFunc = Nothing
  m_PrevFunc_ID = node.Attributes.getNamedItem("PREVFUNC").nodeValue
  m_PrevFunc_ID_BRIEF = node.Attributes.getNamedItem("PREVFUNC_BRIEF").nodeValue
  On Error GoTo bye
  If m_ChangeTime >= m_RetriveTime Then m_Changed = True
  m_RowRetrived = True
  m_Brief = ""
  On Error Resume Next
  Exit Sub
bye:
  Debug.Print Err.Description
End Sub

Public Sub XMLSave(node As IXMLDOMElement, xdom As DOMDocument): On Error Resume Next
  Dim e_ As IXMLDOMElement
  LoadFromDatabase
  node.setAttribute "ID", m_ID
  node.setAttribute "Deleted", m_Deleted
  node.setAttribute "IsLocked", m_IsLocked
  node.setAttribute "RetriveTime", CDbl(m_RetriveTime)
  node.setAttribute "ChangeTime", CDbl(m_ChangeTime)
  node.setAttribute "PREVFUNC", m_PrevFunc_ID
  If Not (PrevFunc Is Nothing) Then
    node.setAttribute "PREVFUNC_BRIEF", PrevFunc.Brief
  Else
    node.setAttribute "PREVFUNC_BRIEF", m_PrevFunc_ID_BRIEF
  End If
  node.setAttribute "AccessTime", CDbl(m_AccessTime)
End Sub
' может ли быть изменено
Public Property Get CanChange() As Boolean
   If Application.WorkOffline Then
     CanChange = CanChangeOffline
   Else
     CanChange = CanChangeONLine
   End If
End Property
' может ли быть изменено в режиме Offline
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
' может ли быть изменено в режиме ONline
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
Friend Property Let IsLocked(newIsLocked As LockStyle)
  m_IsLocked = newIsLocked
End Property
' User has locked record
Public Property Get IsLocked() As LockStyle
  If m_IsLocked <> LockSession And m_IsLocked <> LockPermanent Then CheckLock
  IsLocked = m_IsLocked
End Property
Private Sub CheckLock()
Static LastCheckTime As Date
If Application.WorkOffline Then Exit Sub
If Now - LastCheckTime < CDbl(CDate("0:01:00")) Then Exit Sub
Dim nv As NamedValues, LockType As Long
Set nv = New NamedValues
nv.Add "ROWID", id
nv.Add "IsLocked", LockType
On Error Resume Next
Application.MTZSession.Exec "WFRtm_fparents_ISLOCKED", nv
m_IsLocked = nv.item("ISLocked").Value
Set nv = Nothing
LastCheckTime = Now
End Sub
Public Function LockResource(Optional ByVal Permanent As Boolean = False) As Boolean
If Application.WorkOffline Then Exit Function
  Dim OK
  Dim nv As NamedValues
  Set nv = New NamedValues
nv.Add "ROWID", id
  On Error GoTo bye
  If Not Permanent Then
      nv.Add "LOCKMODE", 1
  Else
      nv.Add "LOCKMODE", 2
  End If
OK = Application.MTZSession.Exec("WFRtm_fparents_LOCK", nv)
  If OK Then
    If Permanent Then m_IsLocked = LockPermanent Else m_IsLocked = LockSession
  Else
    m_IsLocked = NoLock
  End If
bye:
Set nv = Nothing
End Function
Public Function UnLockResource() As Boolean
If Application.WorkOffline Then Exit Function
 Dim nv As NamedValues
Set nv = New NamedValues
nv.Add "ROWID", id
On Error GoTo bye
Application.MTZSession.Exec "WFRtm_fparents_UNLOCK", nv

m_IsLocked = NoLock
bye:
Set nv = Nothing
End Function
Public Function CanLock() As Boolean
If Application.WorkOffline Then Exit Function
Dim nv As NamedValues, notLocked As Long
Set nv = New NamedValues
nv.Add "ROWID", id
nv.Add "LockMode", notLocked
notLocked = 0
On Error Resume Next
Application.MTZSession.Exec "WFRtm_fparents_HCL", nv
If nv.item("LockMode").Value = 0 Then
 CanLock = True
Else
 CanLock = False
End If
Set nv = Nothing
End Function
Friend Sub BatchUpdate()
If Not Application.WorkOffline Then
  If Deleted Then
    Delete
    Exit Sub
  End If
  If Changed Then Save
End If
End Sub
Friend Sub LoadAll()
If Not Application.WorkOffline Then
  LoadFromDatabase
End If
End Sub

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

