VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "WFDef_FuncParam"
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
Private m_ParamType As enumWFFuncParam
Private m_DocField As Object
Dim m_DocField_ID As String
Dim m_DocField_ID_BRIEF As String
Private m_DocPart As Object
Dim m_DocPart_ID As String
Dim m_DocPart_ID_BRIEF As String
Private m_Role As Object
Dim m_Role_ID As String
Dim m_Role_ID_BRIEF As String
Private m_DocType As Object
Dim m_DocType_ID As String
Dim m_DocType_ID_BRIEF As String
Private m_Name As String
Private m_Folder As Object
Dim m_Folder_ID As String
Dim m_Folder_ID_BRIEF As String
Private m_Doc As Object
Dim m_Doc_ID As String
Dim m_Doc_ID_BRIEF As String
Private m_Param As Object
Dim m_Param_ID As String
Dim m_Param_ID_BRIEF As String
Private m_ProcessDoc As Object
Dim m_ProcessDoc_ID As String
Dim m_ProcessDoc_ID_BRIEF As String
Private m_Value As String
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
  PartName = "WFDef_FuncParam"
End Property
Friend Property Set Parent(newParent As Object)
  Set m_Parent = newParent
End Property
Public Property Get Parent() As Object
  Set Parent = m_Parent
End Property
Friend Property Set Application(newApplication As Application)
  Set m_Application = newApplication
  m_Application.Logger.Message "WFDef_FuncParam.Init"
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
'ParamType
Public Property Let ParamType(ByVal NewValue As enumWFFuncParam)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ParamType", ParamType, NewValue

   m_ParamType = NewValue
End If
End Property
Public Property Get ParamType() As enumWFFuncParam
 LoadFromDatabase
 AccessTime = Now

   ParamType = m_ParamType
End Property
' let
'DocField
Public Property Set DocField(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DocField", DocField, NewValue
On Error Resume Next
m_DocField_ID = ""
m_DocField_ID = NewValue.id
 Set m_DocField = NewValue
End If
End Property
Public Property Get DocField() As Object
 LoadFromDatabase
 AccessTime = Now
If m_DocField Is Nothing And m_DocField_ID <> "" Then
  Set m_DocField = Application.FindRowObject("FIELD", m_DocField_ID)
  If m_DocField Is Nothing Then
    m_DocField_ID_BRIEF = ""
  Else
    m_DocField_ID_BRIEF = m_DocField.Brief
  End If
End If
   Set DocField = m_DocField
End Property
' let
'DocPart
Public Property Set DocPart(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DocPart", DocPart, NewValue
On Error Resume Next
m_DocPart_ID = ""
m_DocPart_ID = NewValue.id
 Set m_DocPart = NewValue
End If
End Property
Public Property Get DocPart() As Object
 LoadFromDatabase
 AccessTime = Now
If m_DocPart Is Nothing And m_DocPart_ID <> "" Then
  Set m_DocPart = Application.FindRowObject("PART", m_DocPart_ID)
  If m_DocPart Is Nothing Then
    m_DocPart_ID_BRIEF = ""
  Else
    m_DocPart_ID_BRIEF = m_DocPart.Brief
  End If
End If
   Set DocPart = m_DocPart
End Property
' let
'Role
Public Property Set Role(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Role", Role, NewValue
On Error Resume Next
m_Role_ID = ""
m_Role_ID = NewValue.id
 Set m_Role = NewValue
End If
End Property
Public Property Get Role() As Object
 LoadFromDatabase
 AccessTime = Now
If m_Role Is Nothing And m_Role_ID <> "" Then
  Set m_Role = Application.FindRowObject("Groups", m_Role_ID)
  If m_Role Is Nothing Then
    m_Role_ID_BRIEF = ""
  Else
    m_Role_ID_BRIEF = m_Role.Brief
  End If
End If
   Set Role = m_Role
End Property
' let
'DocType
Public Property Set DocType(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "DocType", DocType, NewValue
On Error Resume Next
m_DocType_ID = ""
m_DocType_ID = NewValue.id
 Set m_DocType = NewValue
End If
End Property
Public Property Get DocType() As Object
 LoadFromDatabase
 AccessTime = Now
If m_DocType Is Nothing And m_DocType_ID <> "" Then
  Set m_DocType = Application.FindRowObject("OBJECTTYPE", m_DocType_ID)
  If m_DocType Is Nothing Then
    m_DocType_ID_BRIEF = ""
  Else
    m_DocType_ID_BRIEF = m_DocType.Brief
  End If
End If
   Set DocType = m_DocType
End Property
' let
'Name
Public Property Let Name(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Name", Name, NewValue

   m_Name = NewValue
End If
End Property
Public Property Get Name() As String
 LoadFromDatabase
 AccessTime = Now

   Name = m_Name
End Property
' let
'Folder
Public Property Set Folder(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Folder", Folder, NewValue
On Error Resume Next
m_Folder_ID = ""
m_Folder_ID = NewValue.id
 Set m_Folder = NewValue
End If
End Property
Public Property Get Folder() As Object
 LoadFromDatabase
 AccessTime = Now
If m_Folder Is Nothing And m_Folder_ID <> "" Then
  Set m_Folder = Application.FindRowObject("Folder", m_Folder_ID)
  If m_Folder Is Nothing Then
    m_Folder_ID_BRIEF = ""
  Else
    m_Folder_ID_BRIEF = m_Folder.Brief
  End If
End If
   Set Folder = m_Folder
End Property
' let
'Doc
Public Property Set Doc(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Doc", Doc, NewValue
On Error Resume Next
m_Doc_ID = ""
m_Doc_ID = NewValue.id
 Set m_Doc = NewValue
End If
End Property
Public Property Get Doc() As Object
 LoadFromDatabase
 AccessTime = Now
If m_Doc Is Nothing And m_Doc_ID <> "" Then
  Set m_Doc = Application.Manager.GetInstanceObject(Right(m_Doc_ID, 38))
 'set m_Doc.Changed = true
End If
   Set Doc = m_Doc
End Property
' let
'Param
Public Property Set Param(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Param", Param, NewValue
On Error Resume Next
m_Param_ID = ""
m_Param_ID = NewValue.id
 Set m_Param = NewValue
End If
End Property
Public Property Get Param() As Object
 LoadFromDatabase
 AccessTime = Now
If m_Param Is Nothing And m_Param_ID <> "" Then
  Set m_Param = Application.FindRowObject("WFDef_param", m_Param_ID)
  If m_Param Is Nothing Then
    m_Param_ID_BRIEF = ""
  Else
    m_Param_ID_BRIEF = m_Param.Brief
  End If
End If
   Set Param = m_Param
End Property
' let
'ProcessDoc
Public Property Set ProcessDoc(ByVal NewValue As Object)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "ProcessDoc", ProcessDoc, NewValue
On Error Resume Next
m_ProcessDoc_ID = ""
m_ProcessDoc_ID = NewValue.id
 Set m_ProcessDoc = NewValue
End If
End Property
Public Property Get ProcessDoc() As Object
 LoadFromDatabase
 AccessTime = Now
If m_ProcessDoc Is Nothing And m_ProcessDoc_ID <> "" Then
  Set m_ProcessDoc = Application.FindRowObject("WFDef_Doc", m_ProcessDoc_ID)
  If m_ProcessDoc Is Nothing Then
    m_ProcessDoc_ID_BRIEF = ""
  Else
    m_ProcessDoc_ID_BRIEF = m_ProcessDoc.Brief
  End If
End If
   Set ProcessDoc = m_ProcessDoc
End Property
' let
'Value
Public Property Let Value(ByVal NewValue As String)
 LoadFromDatabase
If CanChange Then
 ChangeTime = Now
 Changed = True
 OnChange "Value", Value, NewValue

   m_Value = NewValue
End If
End Property
Public Property Get Value() As String
 LoadFromDatabase
 AccessTime = Now

   Value = m_Value
End Property
Public Sub Pack(ByRef nv As NamedValues)
  Set nv = Nothing
  Set nv = New NamedValues

nv.Add "ParamType", m_ParamType
 ' Reference to FIELD
  If m_DocField Is Nothing Then
    If m_DocField_ID = "" Then
       nv.Add "DocField", ""
    Else
       nv.Add "DocField", m_DocField_ID
    End If
  Else
     nv.Add "DocField", m_DocField.id
  End If
 ' Reference to PART
  If m_DocPart Is Nothing Then
    If m_DocPart_ID = "" Then
       nv.Add "DocPart", ""
    Else
       nv.Add "DocPart", m_DocPart_ID
    End If
  Else
     nv.Add "DocPart", m_DocPart.id
  End If
 ' Reference to Groups
  If m_Role Is Nothing Then
    If m_Role_ID = "" Then
       nv.Add "Role", ""
    Else
       nv.Add "Role", m_Role_ID
    End If
  Else
     nv.Add "Role", m_Role.id
  End If
 ' Reference to OBJECTTYPE
  If m_DocType Is Nothing Then
    If m_DocType_ID = "" Then
       nv.Add "DocType", ""
    Else
       nv.Add "DocType", m_DocType_ID
    End If
  Else
     nv.Add "DocType", m_DocType.id
  End If
nv.Add "Name", m_Name
 ' Reference to Folder
  If m_Folder Is Nothing Then
    If m_Folder_ID = "" Then
       nv.Add "Folder", ""
    Else
       nv.Add "Folder", m_Folder_ID
    End If
  Else
     nv.Add "Folder", m_Folder.id
  End If
 ' Reference to object
  If m_Doc Is Nothing Then
    If m_Doc_ID = "" Then
       nv.Add "Doc", ""
    Else
       nv.Add "Doc", m_Doc_ID
    End If
  Else
     nv.Add "Doc", m_Doc.id
  End If
 ' Reference to WFDef_param
  If m_Param Is Nothing Then
    If m_Param_ID = "" Then
       nv.Add "Param", ""
    Else
       nv.Add "Param", m_Param_ID
    End If
  Else
     nv.Add "Param", m_Param.id
  End If
 ' Reference to WFDef_Doc
  If m_ProcessDoc Is Nothing Then
    If m_ProcessDoc_ID = "" Then
       nv.Add "ProcessDoc", ""
    Else
       nv.Add "ProcessDoc", m_ProcessDoc_ID
    End If
  Else
     nv.Add "ProcessDoc", m_ProcessDoc.id
  End If
nv.Add "Value", m_Value
End Sub
Public Function Brief(Optional ByVal UseServer As Boolean = False) As String
 Dim s As String
 If Application.WorkOffline Then

  m_Brief = ""
  m_Brief = m_Brief & "Название="
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
    Brief = "! доступ запрещен !"
End Function
Public Sub UnPack(ByRef nv As Object)
 On Error Resume Next
If TypeName(nv) = "NamedValues" Then

m_ParamType = nv.item("ParamType").Value
  m_DocField_ID = nv.item("DocField").Value
  m_DocPart_ID = nv.item("DocPart").Value
  m_Role_ID = nv.item("Role").Value
  m_DocType_ID = nv.item("DocType").Value
m_Name = nv.item("Name").Value
  m_Folder_ID = nv.item("Folder").Value
  m_Doc_ID = nv.item("Doc").Value
  m_Param_ID = nv.item("Param").Value
  m_ProcessDoc_ID = nv.item("ProcessDoc").Value
m_Value = nv.item("Value").Value
Else

m_ParamType = nv.Fields("ParamType").Value
  m_DocField_ID = nv.Fields("DocField").Value
  m_DocPart_ID = nv.Fields("DocPart").Value
  m_Role_ID = nv.Fields("Role").Value
  m_DocType_ID = nv.Fields("DocType").Value
m_Name = nv.Fields("Name").Value
  m_Folder_ID = nv.Fields("Folder").Value
  m_Doc_ID = nv.Fields("Doc").Value
  m_Param_ID = nv.Fields("Param").Value
  m_ProcessDoc_ID = nv.Fields("ProcessDoc").Value
m_Value = nv.Fields("Value").Value
End If
End Sub
Public Sub CleanFields()
   Dim nv As NamedValues
   Dim o As WFDef_FuncParam
   Set o = New WFDef_FuncParam
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
  Err.Raise Err.Number, "WFDef_FuncParam.Save", Err.Description
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
  Err.Raise Err.Number, "WFDef_FuncParam.Delete", Err.Description
End Function
Public Sub Secure(ByVal SecurityStyleID As String)
If Application.WorkOffline Then Exit Sub
Dim nv As NamedValues
Set nv = New NamedValues
nv.Add "ROWID", id
nv.Add "SECURITYSTYLEID", SecurityStyleID
On Error GoTo bye
Application.MTZSession.Exec "WFDef_FuncParam_SINIT", nv
Set nv = Nothing
m_SecureStyleID = SecurityStyleID
Exit Sub
bye:
Set nv = Nothing
  Err.Raise Err.Number, "WFDef_FuncParam.Secure", Err.Description
End Sub
Public Sub Propagate()
If Application.WorkOffline Then Exit Sub
Dim nv As NamedValues
Set nv = New NamedValues
nv.Add "ROWID", id
On Error GoTo bye
Application.MTZSession.Exec "WFDef_FuncParam_PROPAGATE", nv
Set nv = Nothing
Exit Sub
bye:
Set nv = Nothing
  Err.Raise Err.Number, "WFDef_FuncParam.Propagate", Err.Description
End Sub
Friend Sub CloseClass()
 On Error Resume Next

 m_DocField_ID = ""
 Set m_DocField = Nothing
 m_DocPart_ID = ""
 Set m_DocPart = Nothing
 m_Role_ID = ""
 Set m_Role = Nothing
 m_DocType_ID = ""
 Set m_DocType = Nothing
 m_Folder_ID = ""
 Set m_Folder = Nothing
 m_Doc_ID = ""
 Set m_Doc = Nothing
 m_Param_ID = ""
 Set m_Param = Nothing
 m_ProcessDoc_ID = ""
 Set m_ProcessDoc = Nothing
 If Not Application Is Nothing Then Application.Logger.Message "WFDef_FuncParam.CloseClass"
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
  Name = Replace(node.Attributes.getNamedItem("NAME").nodeValue, vbLf, vbCrLf)
  ParamType = node.Attributes.getNamedItem("PARAMTYPE").nodeValue
  Value = Replace(node.Attributes.getNamedItem("VALUE").nodeValue, vbLf, vbCrLf)
  Set Param = Nothing
  m_Param_ID = node.Attributes.getNamedItem("PARAM").nodeValue
  m_Param_ID_BRIEF = node.Attributes.getNamedItem("PARAM_BRIEF").nodeValue
  Set ProcessDoc = Nothing
  m_ProcessDoc_ID = node.Attributes.getNamedItem("PROCESSDOC").nodeValue
  m_ProcessDoc_ID_BRIEF = node.Attributes.getNamedItem("PROCESSDOC_BRIEF").nodeValue
  Set Doc = Nothing
  m_Doc_ID = node.Attributes.getNamedItem("DOC").nodeValue
  m_Doc_ID_BRIEF = node.Attributes.getNamedItem("DOC_BRIEF").nodeValue
  Set Role = Nothing
  m_Role_ID = node.Attributes.getNamedItem("ROLE").nodeValue
  m_Role_ID_BRIEF = node.Attributes.getNamedItem("ROLE_BRIEF").nodeValue
  Set Folder = Nothing
  m_Folder_ID = node.Attributes.getNamedItem("FOLDER").nodeValue
  m_Folder_ID_BRIEF = node.Attributes.getNamedItem("FOLDER_BRIEF").nodeValue
  Set DocType = Nothing
  m_DocType_ID = node.Attributes.getNamedItem("DOCTYPE").nodeValue
  m_DocType_ID_BRIEF = node.Attributes.getNamedItem("DOCTYPE_BRIEF").nodeValue
  Set DocPart = Nothing
  m_DocPart_ID = node.Attributes.getNamedItem("DOCPART").nodeValue
  m_DocPart_ID_BRIEF = node.Attributes.getNamedItem("DOCPART_BRIEF").nodeValue
  Set DocField = Nothing
  m_DocField_ID = node.Attributes.getNamedItem("DOCFIELD").nodeValue
  m_DocField_ID_BRIEF = node.Attributes.getNamedItem("DOCFIELD_BRIEF").nodeValue
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
  node.setAttribute "NAME", Name
  node.setAttribute "PARAMTYPE", ParamType
  node.setAttribute "VALUE", Value
  node.setAttribute "PARAM", m_Param_ID
  If Not (Param Is Nothing) Then
    node.setAttribute "PARAM_BRIEF", Param.Brief
  Else
    node.setAttribute "PARAM_BRIEF", m_Param_ID_BRIEF
  End If
  node.setAttribute "PROCESSDOC", m_ProcessDoc_ID
  If Not (ProcessDoc Is Nothing) Then
    node.setAttribute "PROCESSDOC_BRIEF", ProcessDoc.Brief
  Else
    node.setAttribute "PROCESSDOC_BRIEF", m_ProcessDoc_ID_BRIEF
  End If
  node.setAttribute "DOC", m_Doc_ID
  If Not (Doc Is Nothing) Then
    node.setAttribute "DOC_BRIEF", Doc.Brief
  Else
    node.setAttribute "DOC_BRIEF", m_Doc_ID_BRIEF
  End If
  node.setAttribute "ROLE", m_Role_ID
  If Not (Role Is Nothing) Then
    node.setAttribute "ROLE_BRIEF", Role.Brief
  Else
    node.setAttribute "ROLE_BRIEF", m_Role_ID_BRIEF
  End If
  node.setAttribute "FOLDER", m_Folder_ID
  If Not (Folder Is Nothing) Then
    node.setAttribute "FOLDER_BRIEF", Folder.Brief
  Else
    node.setAttribute "FOLDER_BRIEF", m_Folder_ID_BRIEF
  End If
  node.setAttribute "DOCTYPE", m_DocType_ID
  If Not (DocType Is Nothing) Then
    node.setAttribute "DOCTYPE_BRIEF", DocType.Brief
  Else
    node.setAttribute "DOCTYPE_BRIEF", m_DocType_ID_BRIEF
  End If
  node.setAttribute "DOCPART", m_DocPart_ID
  If Not (DocPart Is Nothing) Then
    node.setAttribute "DOCPART_BRIEF", DocPart.Brief
  Else
    node.setAttribute "DOCPART_BRIEF", m_DocPart_ID_BRIEF
  End If
  node.setAttribute "DOCFIELD", m_DocField_ID
  If Not (DocField Is Nothing) Then
    node.setAttribute "DOCFIELD_BRIEF", DocField.Brief
  Else
    node.setAttribute "DOCFIELD_BRIEF", m_DocField_ID_BRIEF
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
Application.MTZSession.Exec "WFDef_FuncParam_ISLOCKED", nv
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
OK = Application.MTZSession.Exec("WFDef_FuncParam_LOCK", nv)
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
Application.MTZSession.Exec "WFDef_FuncParam_UNLOCK", nv

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
Application.MTZSession.Exec "WFDef_FuncParam_HCL", nv
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

