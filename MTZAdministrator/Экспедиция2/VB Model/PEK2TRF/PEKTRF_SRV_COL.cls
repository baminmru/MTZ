VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "PEKTRF_SRV_COL"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ ������ �� ������
Dim mcol As SortableCollection
Dim m_Parent As Object
Dim m_Application As Application
Dim m_Filter As String
Private m_IsLocked As LockStyle







'�������� ������� �������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� string
'See Also:
'Example:
' dim variable as string
' variable = me. ChildPartName
Friend Property Get ChildPartName() As String
  ChildPartName = "PEKTRF_SRV"
End Property


'������ ������������ ������ � �������� ���������
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


'�������� ������������ ������ � �������� ���������
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
'[IN][OUT]  newApplication , ��� ���������: object  - ...
'See Also:
'Example:
' dim value as Variant
' set value = new Variant
' set me. Application = value
Friend Property Set Application(newApplication As Object)
  Set m_Application = newApplication
  m_Application.Logger.Message "PEKTRF_SRV.Init"
End Property


'�������� �������� ������
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
 If m_Parent Is Nothing Then
    Set Application = Me
  Else
    Set Application = m_Application
  End If
End Property


'������ �������������� ������ ���������
'Parameters:
'[IN]   newFilter , ��� ���������: string  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...��������...
' me. Filter = value
Public Property Let Filter(ByVal newFilter As String)
  m_Filter = newFilter
  Refresh
End Property


'�������� �������� �������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� string
'See Also:
'Example:
' dim variable as string
' variable = me. Filter
Public Property Get Filter() As String
    Filter = m_Filter
End Property


'��������� ������������� ������ � ������������� ���������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.CloseParents()
Private Sub CloseParents()
  Set m_Application = Nothing
  Set m_Parent = Nothing
End Sub


'�������� ������ � ������ (�� �� � ���� ������)
'Parameters:
'[IN][OUT]   ID , ��� ���������: string=""  - ...
'Returns:
'  ������ ������  PEKTRF_SRV
'  ,��� Nothing
'See Also:
'Example:
' dim variable as  PEKTRF_SRV
' Set variable = me.Add(...���������...)
Public Function Add(Optional ID As String = "") As PEKTRF_SRV
 Dim LID As String
 Dim o As PEKTRF_SRV
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
  Set o = New PEKTRF_SRV
  o.ID = LID
  o.RowRetrived = False
  Set o.Parent = Me
  Set o.Application = Me.Application
  Me.Application.AddToCash ChildPartName & LID, o
  Set Add = o
  mcol.AddItem o, o.ID
  Set o = Nothing
End Function


'�������� ������ �������
'Parameters:
'[IN]   ID , ��� ���������: variant  - ...
'Returns:
'  ������ ������ PEKTRF_SRV
'  ,��� Nothing
'See Also:
'Example:
' dim variable as PEKTRF_SRV
' Set variable = me.Item(...���������...)
Public Function Item(ByVal ID As Variant) As PEKTRF_SRV
Attribute Item.VB_MemberFlags = "200"
 On Error Resume Next
 Dim o As PEKTRF_SRV
 If Not mcol.Item(ID) Is Nothing Then
   Set o = mcol.Item(ID)
   Set Item = o
   Set o = Nothing
   Exit Function
 End If
End Function


'����� ������ �� �������������� � �������� ��������
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


'�������������� ������������� ������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.Compact()
Public Sub Compact()
 Dim i As Long
 For i = 1 To Count
   Item(i).Compact
 Next
End Sub

'������ ���� �� �������� ����� �����������
'Parameters:
'[IN]   Name , ��� ���������: string  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...��������...
' me. Sort = value
Public Property Let Sort(ByVal Name As String)
 mcol.Sort Name
End Property

'�������� �������� ���� - ������ ����������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� string
'See Also:
'Example:
' dim variable as string
' variable = me. Sort
Public Property Get Sort() As String
 Sort = mcol.SortName
End Property


'�������� ������ � ���. ���� ���������� ����� ��������
'Parameters:
'[IN]   Value , ��� ���������: variant  - ...
'Returns:
'  ������ ������ PEKTRF_SRV
'  ,��� Nothing
'See Also:
'Example:
' dim variable as PEKTRF_SRV
' Set variable = me.GetEQ(...���������...)
Public Function GetEQ(ByVal Value As Variant) As PEKTRF_SRV
   Set GetEQ = mcol.GetEQ(Value)
End Function


'�������� ������ � ���. ���� ���������� ������ ��� ����� ��������
'Parameters:
'[IN]   Value , ��� ���������: variant  - ...
'Returns:
'  ������ ������ PEKTRF_SRV
'  ,��� Nothing
'See Also:
'Example:
' dim variable as PEKTRF_SRV
' Set variable = me.GetLE(...���������...)
Public Function GetLE(ByVal Value As Variant) As PEKTRF_SRV
   Set GetLE = mcol.GetLE(Value)
End Function


'�������� ������ � ���. ���� ���������� ������ ��������
'Parameters:
'[IN]   Value , ��� ���������: variant  - ...
'Returns:
'  ������ ������ PEKTRF_SRV
'  ,��� Nothing
'See Also:
'Example:
' dim variable as PEKTRF_SRV
' Set variable = me.GetLT(...���������...)
Public Function GetLT(ByVal Value As Variant) As PEKTRF_SRV
   Set GetLT = mcol.GetLT(Value)
End Function


'�������� ������ � ���. ���� ���������� ������ ��� ����� ��������
'Parameters:
'[IN]   Value , ��� ���������: variant  - ...
'Returns:
'  ������ ������ PEKTRF_SRV
'  ,��� Nothing
'See Also:
'Example:
' dim variable as PEKTRF_SRV
' Set variable = me.GetGE(...���������...)
Public Function GetGE(ByVal Value As Variant) As PEKTRF_SRV
   Set GetGE = mcol.GetGE(Value)
End Function


'�������� ������ � ���. ���� ���������� ������ ��������
'Parameters:
'[IN]   Value , ��� ���������: variant  - ...
'Returns:
'  ������ ������ PEKTRF_SRV
'  ,��� Nothing
'See Also:
'Example:
' dim variable as PEKTRF_SRV
' Set variable = me.GetGT(...���������...)
Public Function GetGT(ByVal Value As Variant) As PEKTRF_SRV
   Set GetGT = mcol.GetGT(Value)
End Function


'�������� ����� ������ � ���. ���� ���������� ����� ��������
'Parameters:
'[IN]   Value , ��� ���������: variant  - ...
'Returns:
'  ������ ������  long
'  ,��� Nothing
'See Also:
'Example:
' dim variable as  long
' Set variable = me.GetEQPos(...���������...)
Public Function GetEQPos(ByVal Value As Variant) As Long
   GetEQPos = mcol.GetEQPos(Value)
End Function


'�������� ����� ������ � ���. ���� ���������� ������ ��� ����� ��������
'Parameters:
'[IN]   Value , ��� ���������: variant  - ...
'Returns:
'  ������ ������  long
'  ,��� Nothing
'See Also:
'Example:
' dim variable as  long
' Set variable = me.GetLEPos(...���������...)
Public Function GetLEPos(ByVal Value As Variant) As Long
   GetLEPos = mcol.GetLEPos(Value)
End Function


'�������� ����� ������ � ���. ���� ���������� ������ ��������
'Parameters:
'[IN]   Value , ��� ���������: variant  - ...
'Returns:
'  ������ ������  long
'  ,��� Nothing
'See Also:
'Example:
' dim variable as  long
' Set variable = me.GetLTPos(...���������...)
Public Function GetLTPos(ByVal Value As Variant) As Long
   GetLTPos = mcol.GetLTPos(Value)
End Function


'�������� ����� ������ � ���. ���� ���������� ������ ��� ����� ��������
'Parameters:
'[IN]   Value , ��� ���������: variant  - ...
'Returns:
'  ������ ������  long
'  ,��� Nothing
'See Also:
'Example:
' dim variable as  long
' Set variable = me.GetGEPos(...���������...)
Public Function GetGEPos(ByVal Value As Variant) As Long
   GetGEPos = mcol.GetGEPos(Value)
End Function


'�������� ����� ������ � ���. ���� ���������� ������ ��������
'Parameters:
'[IN]   Value , ��� ���������: variant  - ...
'Returns:
'  ������ ������  long
'  ,��� Nothing
'See Also:
'Example:
' dim variable as  long
' Set variable = me.GetGTPos(...���������...)
Public Function GetGTPos(ByVal Value As Variant) As Long
   GetGTPos = mcol.GetGTPos(Value)
End Function


'����������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.CloseClass()
Friend Sub CloseClass()
 On Error Resume Next
 Dim i As Long
 Dim o As PEKTRF_SRV
    For i = 1 To mcol.Count
       Set o = mcol.Item(i)
        o.CloseClass
    Next
 If Not Application Is Nothing Then Application.Logger.Message "PEKTRF_SRV.CloseClass"
 CloseParents
 Set mcol = Nothing
End Sub


'������������� ���������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.Class_Initialize()
Private Sub Class_Initialize()
 Set mcol = New SortableCollection
End Sub


'���������� ����� � ���������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� Long
'See Also:
'Example:
' dim variable as Long
' variable = me. Count
Public Property Get Count() As Long
    Count = mcol.Count
End Property


'������� ������ �� ���������
'Parameters:
'[IN]   vntIndexKey , ��� ���������: Variant  - ...
'See Also:
'Example:
'  call me.Remove({���������})
Public Sub Remove(ByVal vntIndexKey As Variant)
    On Error Resume Next
    Me.Application.RemoveFromCash ChildPartName & Item(vntIndexKey).ID
    mcol.Remove vntIndexKey
End Sub


'��������� ��������� � ������
'Parameters:
'[IN]   vntIndexKey , ��� ���������: Variant  - ...
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me.Update(...���������...)
Public Function Update(ByVal vntIndexKey As Variant) As Boolean
 If Not Item(vntIndexKey) Is Nothing Then
   Update = Item(vntIndexKey).Save
 Else
   Update = False
 End If
End Function


'������� ������
'Parameters:
'[IN]   vntIndexKey , ��� ���������: Variant  - ...
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me.Delete(...���������...)
Public Function Delete(ByVal vntIndexKey As Variant) As Boolean
On Error GoTo bye
Dim o As PEKTRF_SRV
Set o = Item(vntIndexKey)
If o Is Nothing Then Exit Function
If o.Delete Then
  Delete = True
  mcol.Remove vntIndexKey
End If
Exit Function
bye:
err.Raise err.Number, "Delete", err.Description
End Function


'��������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.Refresh()
Public Sub Refresh()
    On Error Resume Next
    Dim mcol2  As SortableCollection
    Set mcol2 = mcol
    Set mcol = Nothing
    Set mcol = New SortableCollection
    Dim rs As ADODB.Recordset
    If Application.WorkOffline Then Exit Sub
    Dim o As PEKTRF_SRV
    Dim tmpParent As Object
    Dim tID As String
    Dim SSID As String
    Dim rtime As Date
    rtime = Now
    rtime = Application.MTZSession.GetServerTime()
    If Application.AutoLoadPart Then
    Set rs = Application.MTZSession.GetRows(ChildPartName, Parent.ID, , Filter)
    Else
    Set rs = Application.MTZSession.GetIDs(ChildPartName, Parent.ID, , Filter)
    End If
    If mcol2 Is Nothing Then Set mcol2 = New SortableCollection
    Dim idx As Long
    If Not rs Is Nothing Then ' wrong database structure
    While Not rs.EOF
      If Application.AutoLoadPart Then
        tID = rs!PEKTRF_SRVID
      Else
        tID = rs!ID
      End If
      On Error Resume Next
      SSID = rs!SecurityStyleID & ""
      If mcol2.Item(tID) Is Nothing Then
        Set o = Add(tID)
        If Application.AutoLoadPart Then
          o.UnPack rs
          o.RowRetrived = True
          o.RetriveTime = rtime
        End If
      Else
        Set o = mcol2.Item(tID)
        If o.RowRetrived Then
          If o.RetriveTime < rs!ChangeStamp Then
             If Application.AutoLoadPart Then
               o.CleanFields
               o.UnPack rs
               o.RetriveTime = rtime
             Else
               o.RowRetrived = False
             End If
          End If
        Else
          If Application.AutoLoadPart Then
            o.CleanFields
            o.UnPack rs
            o.RetriveTime = rtime
          End If
        End If
        mcol.AddItem o, tID
        mcol2.Remove tID
      End If
      o.SecureStyleID = SSID
    rs.MoveNext
    Wend
    End If ' rs is nothing
    For idx = 1 To mcol2.Count
       Set o = mcol2.Item(idx)
       o.CloseClass
    Next
    Set mcol2 = Nothing
End Sub

'��������� ������ � ��������� XML
'Parameters:
'[IN][OUT]   ParentNode , ��� ���������: IXMLDOMElement,
'[IN][OUT]   Xdom , ��� ���������: DomDocument  - ...
'See Also:
'Example:
'  call me.XMLSave({���������})
Public Sub XMLSave(ByRef ParentNode As IXMLDOMElement, Xdom As DOMDocument)
  Dim o As PEKTRF_SRV
  Dim i As Long
  Dim pnode As IXMLDOMElement
  Set pnode = Xdom.createElement("PEKTRF_SRV_COL")
  pnode.setAttribute "IsLocked", m_IsLocked
  Dim node As IXMLDOMElement
  ParentNode.appendChild pnode
  For i = 1 To Count
    Set o = Item(i)
    Set node = Xdom.createElement("PEKTRF_SRV")
    pnode.appendChild node
    o.XMLSave node, Xdom
  Next
End Sub


'��������� ������ �� XML
'Parameters:
'[IN][OUT]   NodeList , ��� ���������: IXMLDOMnodeList,
'[IN]   LoadMode , ��� ���������: integer=0  - ...
'See Also:
'Example:
'  call me.XMLLoad({���������})
Public Sub XMLLoad(ByRef NodeList As IXMLDOMNodeList, Optional ByVal LoadMode As Integer = 0)
  On Error Resume Next
  Dim o As PEKTRF_SRV
  Dim node As IXMLDOMElement
  Dim pnode As IXMLDOMElement
  NodeList.Reset
  Set pnode = NodeList.nextNode
  m_IsLocked = pnode.Attributes.getNamedItem("IsLocked").nodeValue
  Set NodeList = pnode.selectNodes("PEKTRF_SRV")
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
m_IsLocked = Application.MTZSession.IsLocked("INSTANCE", Parent.ID)
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
OK = Application.MTZSession.LockResource("INSTANCE", Parent.ID, Permanent)
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
Application.MTZSession.UnLockResource "INSTANCE", Parent.ID
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
CanLock = Application.MTZSession.CanLock("INSTANCE", Parent.ID)
End Function



'��������� ����� �� ����� �������
'Parameters:
'[IN][OUT]  YGrid , ��� ���������: object  - ...
'See Also:
'Example:
'  call me.PrepareGrid({���������})
Public Sub PrepareGrid(YGrid As Object)
YGrid.ItemCount = 0
YGrid.Groups.Clear
YGrid.SortKeys.Clear
YGrid.Columns.Clear
  YGrid.Columns.Add("������", 0, 0, "SrvTYPE").SortType = 1
  YGrid.Columns.Add("����", 0, 0, "Price").SortType = 2
  YGrid.Columns.Add("������", 0, 0, "TheCurrency").SortType = 1
  YGrid.Columns.Add("��. ���.", 0, 0, "EDIZM").SortType = 1
  YGrid.Columns.Add("����������", 0, 0, "Quant").SortType = 2
YGrid.ItemCount = Count
End Sub


'������ ������ ������ ������� � ����
'Parameters:
'[IN][OUT]  YGrid , ��� ���������: object,
'[IN]   RowIndex , ��� ���������: Long,
'[IN]   Bookmark , ��� ���������: Variant,
'[IN][OUT]    Values , ��� ���������: Variant  - ...
'See Also:
'Example:
'  call me.LoadRow({���������})
Public Sub LoadRow(YGrid As Object, ByVal RowIndex As Long, ByVal Bookmark As Variant, Values)
 Dim obj As PEKTRF_SRV
  If RowIndex > 0 And RowIndex <= Count Then
    'If not IsEmpty(BookMArk) then
    '  set obj = item(left(bookmark,38))
    'else
      Set obj = Item(RowIndex)
    'end If
    If obj Is Nothing Then Exit Sub
    On Error Resume Next
   If obj.SrvTYPE Is Nothing Then
    Values.Value(1) = "�� ������"
   Else
    Values.Value(1) = Left(Replace(obj.SrvTYPE.Brief, vbCrLf, " "), 255)
   End If
    Values.Value(2) = Left(Replace(obj.Price, vbCrLf, " "), 255)
   If obj.TheCurrency Is Nothing Then
    Values.Value(3) = "�� ������"
   Else
    Values.Value(3) = Left(Replace(obj.TheCurrency.Brief, vbCrLf, " "), 255)
   End If
   If obj.EDIZM Is Nothing Then
    Values.Value(4) = "�� ������"
   Else
    Values.Value(4) = Left(Replace(obj.EDIZM.Brief, vbCrLf, " "), 255)
   End If
    Values.Value(5) = Left(Replace(obj.Quant, vbCrLf, " "), 255)
   YGrid.RowBookmark(RowIndex) = obj.ID & "PEKTRF_SRV"
  End If 'RowIndex
End Sub

'�������� ���������� ���������� ����� ���������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.BatchUpdate()
Friend Sub BatchUpdate()
 On Error GoTo bye
If Not Application.WorkOffline Then
 Dim i As Long
again:
 For i = 1 To Count
    If Item(i) Is Nothing Then Exit For
    If Item(i).Deleted Then
      If Delete(i) Then GoTo again
    Else
      On Error Resume Next
      Item(i).BatchUpdate
      On Error GoTo bye
    End If
 Next
End If
bye:
End Sub

'�������� ������ �� ����
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.LoadAll()
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



