VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "WFRtm_SC_COL"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Dim mcol As SortableCollection
Dim m_Parent As Object
Dim m_Application As Application
Dim m_Filter As String
Private m_IsLocked As LockStyle



Friend Property Get ChildPartName() As String
  ChildPartName = "WFRtm_SC"
End Property

Friend Property Set Parent(newParent As Object)
  Set m_Parent = newParent
End Property

Public Property Get Parent() As Object
  Set Parent = m_Parent
End Property

Friend Property Set Application(newApplication As Object)
  Set m_Application = newApplication
  m_Application.Logger.Message "WFRtm_SC.Init"
End Property

Public Property Get Application() As Application
 If m_Parent Is Nothing Then
    Set Application = Me
  Else
    Set Application = m_Application
  End If
End Property

Public Property Let Filter(ByVal newFilter As String)
  m_Filter = newFilter
  Refresh
End Property

Public Property Get Filter() As String
    Filter = m_Filter
End Property

Private Sub CloseParents()
  Set m_Application = Nothing
  Set m_Parent = Nothing
End Sub

Public Function Add(Optional ID As String = "") As WFRtm_SC
 Dim LID As String
 Dim o As WFRtm_SC
 If ID = "" Then
   LID = CreateGUID2()
 Else
   LID = Left(ID, 38)
 End If
 On Error Resume Next
 If mcol.Count > 0 Then
   If mcol.Item(LID) Is Nothing Then
   GoTo addnew
   Else
     Set Add = mcol.Item(LID)
     Exit Function
   End If
 End If
addnew:
  Set o = New WFRtm_SC
  o.ID = LID
  o.RowRetrived = False
  Set o.Parent = Me
  Set o.Application = Me.Application
  Me.Application.AddToCash ChildPartName & LID, o
  Set Add = o
  mcol.AddItem o, o.ID
  Set o = Nothing
End Function

Public Function Item(ByVal ID As Variant) As WFRtm_SC
Attribute Item.VB_MemberFlags = "200"
 On Error Resume Next
 Dim o As WFRtm_SC
 If Not mcol.Item(ID) Is Nothing Then
   Set o = mcol.Item(ID)
   Set Item = o
   Set o = Nothing
   Exit Function
 End If
End Function

Public Function FindObject(ByVal StrID As String, ByVal InstID As String) As Object
 Dim m_FindObject As Object, i As Long
 If StrID = "" Then Exit Function
 If InstID = "" Then Exit Function
 If Not Application.MTZSession.IsDescendant(StrID, ChildPartName) Then Exit Function
 If StrID = ChildPartName Then
   Set m_FindObject = Item(InstID)
   If Not m_FindObject Is Nothing Then GoTo OK
 End If
 For i = 1 To Count
   Set m_FindObject = Item(i).FindObject(StrID, InstID)
   If Not m_FindObject Is Nothing Then Exit For
 Next
OK:
 Set FindObject = m_FindObject
 Set m_FindObject = Nothing
End Function

Public Sub Compact()
 Dim i As Long
 For i = 1 To Count
   Item(i).Compact
 Next
End Sub
Public Property Let Sort(ByVal Name As String)
 mcol.Sort Name
End Property
Public Property Get Sort() As String
 Sort = mcol.SortName
End Property

Public Function GetEQ(ByVal Value As Variant) As WFRtm_SC
   Set GetEQ = mcol.GetEQ(Value)
End Function

Public Function GetLE(ByVal Value As Variant) As WFRtm_SC
   Set GetLE = mcol.GetLE(Value)
End Function

Public Function GetLT(ByVal Value As Variant) As WFRtm_SC
   Set GetLT = mcol.GetLT(Value)
End Function

Public Function GetGE(ByVal Value As Variant) As WFRtm_SC
   Set GetGE = mcol.GetGE(Value)
End Function

Public Function GetGT(ByVal Value As Variant) As WFRtm_SC
   Set GetGT = mcol.GetGT(Value)
End Function

Public Function GetEQPos(ByVal Value As Variant) As Long
   GetEQPos = mcol.GetEQPos(Value)
End Function

Public Function GetLEPos(ByVal Value As Variant) As Long
   GetLEPos = mcol.GetLEPos(Value)
End Function

Public Function GetLTPos(ByVal Value As Variant) As Long
   GetLTPos = mcol.GetLTPos(Value)
End Function

Public Function GetGEPos(ByVal Value As Variant) As Long
   GetGEPos = mcol.GetGEPos(Value)
End Function

Public Function GetGTPos(ByVal Value As Variant) As Long
   GetGTPos = mcol.GetGTPos(Value)
End Function

Friend Sub CloseClass()
 On Error Resume Next
 Dim i As Long
 Dim o As WFRtm_SC
    For i = 1 To mcol.Count
       Set o = mcol.Item(i)
        o.CloseClass
    Next
 If Not Application Is Nothing Then Application.Logger.Message "WFRtm_SC.CloseClass"
 CloseParents
 Set mcol = Nothing
End Sub

Private Sub Class_Initialize()
 Set mcol = New SortableCollection
End Sub

Public Property Get Count() As Long
    Count = mcol.Count
End Property

Public Sub Remove(ByVal vntIndexKey As Variant)
    On Error Resume Next
    Me.Application.RemoveFromCash ChildPartName & Item(vntIndexKey).ID
    mcol.Remove vntIndexKey
End Sub

Public Function Update(ByVal vntIndexKey As Variant) As Boolean
 If Not Item(vntIndexKey) Is Nothing Then
   Update = Item(vntIndexKey).Save
 Else
   Update = False
 End If
End Function

Public Function Delete(ByVal vntIndexKey As Variant) As Boolean
On Error GoTo bye
Dim o As WFRtm_SC
Set o = Item(vntIndexKey)
If o Is Nothing Then Exit Function
If o.Delete Then
  Delete = True
  mcol.Remove vntIndexKey
End If
Exit Function
bye:
Err.Raise Err.Number, "Delete", Err.Description
End Function

Public Sub Refresh()
    On Error Resume Next
    Dim mcol2  As SortableCollection
    Set mcol2 = mcol
    Set mcol = Nothing
    Set mcol = New SortableCollection
    Dim rs As ADODB.Recordset
    If Application.WorkOffline Then Exit Sub
    Dim o As WFRtm_SC
    Dim tmpParent As Object
    Dim tID As String
    Dim SSID As String
    If Application.AutoLoadPart Then
    Set rs = Application.MTZSession.GetRows(ChildPartName, Parent.ID, , Filter)
    Else
    Set rs = Application.MTZSession.GetIDs(ChildPartName, Parent.ID, , Filter)
    End If
    If mcol2 Is Nothing Then Set mcol2 = New SortableCollection
    Dim idx As Long
    While Not rs.EOF
      If Application.AutoLoadPart Then
        tID = rs!WFRtm_SCID
      Else
        tID = rs!ID
      End If
      On Error Resume Next
      SSID = rs!SecurityStyleID
      If mcol2.Item(tID) Is Nothing Then
        Set o = Add(tID)
        If Application.AutoLoadPart Then
          o.UnPack rs
          o.RowRetrived = True
          o.RetriveTime = Now
        End If
      Else
        Set o = mcol2.Item(tID)
          If o.RowRetrived Then
            If o.RetriveTime < rs!Changed Then
               If Application.AutoLoadPart Then
                 o.CleanFields
                 o.UnPack rs
                 o.RetriveTime = Now
               Else
                 o.RowRetrived = False
               End If
            End If
          End If
        mcol.AddItem o, tID
        mcol2.Remove tID
      End If
      o.SecureStyleID = SSID
    rs.MoveNext
    Wend
    For idx = 1 To mcol2.Count
       Set o = mcol2.Item(idx)
       o.CloseClass
    Next
    Set mcol2 = Nothing
End Sub
Public Sub XMLSave(ByRef ParentNode As IXMLDOMElement, Xdom As DOMDocument)
  Dim o As WFRtm_SC
  Dim i As Long
  Dim pnode As IXMLDOMElement
  Set pnode = Xdom.createElement("WFRTM_SC_COL")
  pnode.setAttribute "IsLocked", m_IsLocked
  Dim node As IXMLDOMElement
  ParentNode.appendChild pnode
  For i = 1 To Count
    Set o = Item(i)
    Set node = Xdom.createElement("WFRTM_SC")
    pnode.appendChild node
    o.XMLSave node, Xdom
  Next
End Sub

Public Sub XMLLoad(ByRef NodeList As IXMLDOMNodeList, Optional ByVal LoadMode As Integer = 0)
  On Error Resume Next
  Dim o As WFRtm_SC
  Dim node As IXMLDOMElement
  Dim pnode As IXMLDOMElement
  NodeList.Reset
  Set pnode = NodeList.nextNode
  m_IsLocked = pnode.Attributes.getNamedItem("IsLocked").nodeValue
  Set NodeList = pnode.selectNodes("WFRTM_SC")
  Dim bufcol As Collection
  If LoadMode = 1 Then
    Set bufcol = New Collection
  End If
  Set node = NodeList.nextNode
  While Not node Is Nothing
    ' append mode
    If LoadMode = 0 Then
      If Item(node.Attributes.getNamedItem("ID").nodeValue) Is Nothing Then
        Add(node.Attributes.getNamedItem("ID").nodeValue).XMLLoad node, LoadMode
      Else
        Item(node.Attributes.getNamedItem("ID").nodeValue).XMLLoad node, LoadMode
      End If
    End If
    ' replace mode
    If LoadMode = 1 Then
      If Item(node.Attributes.getNamedItem("ID").nodeValue) Is Nothing Then
        Add(node.Attributes.getNamedItem("ID").nodeValue).XMLLoad node, LoadMode
      Else
        Item(node.Attributes.getNamedItem("ID").nodeValue).XMLLoad node, LoadMode
      End If
      bufcol.Add Item(node.Attributes.getNamedItem("ID").nodeValue), node.Attributes.getNamedItem("ID").nodeValue
    End If
    ' copy with new ID mode
    If LoadMode = 2 Then
        Add().XMLLoad node, LoadMode
    End If
    Set node = NodeList.nextNode
  Wend
    ' remove extra items from collection
  If LoadMode = 1 Then
    Dim i As Long
    ' remove existing
removeAgain:
    For i = 1 To Count
      If bufcol.Item(Item(i).ID) Is Nothing Then
        Delete Item(i).ID
        GoTo removeAgain
      End If
    Next
    Set bufcol = Nothing
  End If
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
nv.Add "ROWID", Parent.ID
nv.Add "IsLocked", LockType
On Error Resume Next
Application.MTZSession.Exec "WFRtm_func_ISLOCKED", nv
m_IsLocked = nv.Item("ISLocked").Value
Set nv = Nothing
LastCheckTime = Now
End Sub
Public Function LockResource(Optional ByVal Permanent As Boolean = False) As Boolean
If Application.WorkOffline Then Exit Function
  Dim OK
  Dim nv As NamedValues
  Set nv = New NamedValues
nv.Add "ROWID", Parent.ID
  On Error GoTo bye
  If Not Permanent Then
      nv.Add "LOCKMODE", 1
  Else
      nv.Add "LOCKMODE", 2
  End If
OK = Application.MTZSession.Exec("WFRtm_func_LOCK", nv)
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
nv.Add "ROWID", Parent.ID
On Error GoTo bye
Application.MTZSession.Exec "WFRtm_func_UNLOCK", nv

m_IsLocked = NoLock
bye:
Set nv = Nothing
End Function
Public Function CanLock() As Boolean
If Application.WorkOffline Then Exit Function
Dim nv As NamedValues, notLocked As Long
Set nv = New NamedValues
nv.Add "ROWID", Parent.ID & ChildPartName
nv.Add "LockMode", notLocked
notLocked = 0
On Error Resume Next
Application.MTZSession.Exec "WFRtm_func_HCL", nv
If nv.Item("LockMode").Value = 0 Then
 CanLock = True
Else
 CanLock = False
End If
Set nv = Nothing
End Function


Public Sub PrepareGrid(YGrid As Object)
YGrid.ItemCount = 0
YGrid.Groups.Clear
YGrid.SortKeys.Clear
YGrid.Columns.Clear
  YGrid.Columns.Add("На основании", 0, 0, "BasedOn").SortType = 1
  YGrid.Columns.Add("Ярлык", 0, 0, "ShortCut").SortType = 1
YGrid.ItemCount = Count
End Sub

Public Sub LoadRow(YGrid As Object, ByVal RowIndex As Long, ByVal Bookmark As Variant, Values)
 Dim obj As WFRtm_SC
  If RowIndex > 0 And RowIndex <= Count Then
    If Not IsEmpty(Bookmark) Then
      Set obj = Item(Left(Bookmark, 38))
    Else
      Set obj = Item(RowIndex)
    End If
    If obj Is Nothing Then Exit Sub
    On Error Resume Next
   If obj.BasedOn Is Nothing Then
    Values.Value(1) = "Не задано"
   Else
    Values.Value(1) = Left(Replace(obj.BasedOn.Brief, vbCrLf, " "), 255)
   End If
   If obj.ShortCut Is Nothing Then
    Values.Value(2) = "Не задано"
   Else
    Values.Value(2) = Left(Replace(obj.ShortCut.Brief, vbCrLf, " "), 255)
   End If
   YGrid.RowBookmark(RowIndex) = obj.ID & "WFRtm_SC"
  End If 'RowIndex
End Sub
Friend Sub BatchUpdate()
 On Error GoTo bye
If Not Application.WorkOffline Then
 Dim i As Long
again:
 For i = 1 To Count
    If Item(i) Is Nothing Then Exit For
    If Item(i).Deleted Then
      If Delete(i) Then GoTo again
    ElseIf Item(i).Changed Then
      Item(i).BatchUpdate
    End If
 Next
End If
bye:
End Sub
Friend Sub LoadAll()
On Error GoTo bye
If Not Application.WorkOffline Then
 Dim i As Long
 Refresh
 For i = 1 To Count
     Item(i).LoadAll
 Next
End If
bye:
End Sub

