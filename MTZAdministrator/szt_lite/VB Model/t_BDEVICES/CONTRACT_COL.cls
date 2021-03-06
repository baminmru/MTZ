VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CONTRACT_COL"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ ���������� ���������
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
  ChildPartName = "CONTRACT"
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
  m_Application.Logger.Message "CONTRACT.Init"
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
'  ������ ������  CONTRACT
'  ,��� Nothing
'See Also:
'Example:
' dim variable as  CONTRACT
' Set variable = me.Add(...���������...)
Public Function Add(Optional ID As String = "") As CONTRACT
 Dim LID As String
 Dim o As CONTRACT
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
  Set o = New CONTRACT
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
'  ������ ������ CONTRACT
'  ,��� Nothing
'See Also:
'Example:
' dim variable as CONTRACT
' Set variable = me.Item(...���������...)
Public Function Item(ByVal ID As Variant) As CONTRACT
Attribute Item.VB_MemberFlags = "200"
 On Error Resume Next
 Dim o As CONTRACT
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
'  ������ ������ CONTRACT
'  ,��� Nothing
'See Also:
'Example:
' dim variable as CONTRACT
' Set variable = me.GetEQ(...���������...)
Public Function GetEQ(ByVal Value As Variant) As CONTRACT
   Set GetEQ = mcol.GetEQ(Value)
End Function


'�������� ������ � ���. ���� ���������� ������ ��� ����� ��������
'Parameters:
'[IN]   Value , ��� ���������: variant  - ...
'Returns:
'  ������ ������ CONTRACT
'  ,��� Nothing
'See Also:
'Example:
' dim variable as CONTRACT
' Set variable = me.GetLE(...���������...)
Public Function GetLE(ByVal Value As Variant) As CONTRACT
   Set GetLE = mcol.GetLE(Value)
End Function


'�������� ������ � ���. ���� ���������� ������ ��������
'Parameters:
'[IN]   Value , ��� ���������: variant  - ...
'Returns:
'  ������ ������ CONTRACT
'  ,��� Nothing
'See Also:
'Example:
' dim variable as CONTRACT
' Set variable = me.GetLT(...���������...)
Public Function GetLT(ByVal Value As Variant) As CONTRACT
   Set GetLT = mcol.GetLT(Value)
End Function


'�������� ������ � ���. ���� ���������� ������ ��� ����� ��������
'Parameters:
'[IN]   Value , ��� ���������: variant  - ...
'Returns:
'  ������ ������ CONTRACT
'  ,��� Nothing
'See Also:
'Example:
' dim variable as CONTRACT
' Set variable = me.GetGE(...���������...)
Public Function GetGE(ByVal Value As Variant) As CONTRACT
   Set GetGE = mcol.GetGE(Value)
End Function


'�������� ������ � ���. ���� ���������� ������ ��������
'Parameters:
'[IN]   Value , ��� ���������: variant  - ...
'Returns:
'  ������ ������ CONTRACT
'  ,��� Nothing
'See Also:
'Example:
' dim variable as CONTRACT
' Set variable = me.GetGT(...���������...)
Public Function GetGT(ByVal Value As Variant) As CONTRACT
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
 Dim o As CONTRACT
    For i = 1 To mcol.Count
       Set o = mcol.Item(i)
        o.CloseClass
    Next
 If Not Application Is Nothing Then Application.Logger.Message "CONTRACT.CloseClass"
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
Dim o As CONTRACT
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
    Dim o As CONTRACT
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
        tID = rs!CONTRACTID
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
  Dim o As CONTRACT
  Dim i As Long
  Dim pnode As IXMLDOMElement
  Set pnode = Xdom.createElement("CONTRACT_COL")
  pnode.setAttribute "IsLocked", m_IsLocked
  Dim node As IXMLDOMElement
  ParentNode.appendChild pnode
  For i = 1 To Count
    Set o = Item(i)
    Set node = Xdom.createElement("CONTRACT")
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
  Dim o As CONTRACT
  Dim node As IXMLDOMElement
  Dim pnode As IXMLDOMElement
  NodeList.Reset
  Set pnode = NodeList.nextNode
  m_IsLocked = pnode.Attributes.getNamedItem("IsLocked").nodeValue
  Set NodeList = pnode.selectNodes("CONTRACT")
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
  YGrid.Columns.Add("� �������", 0, 0, "FLD12").SortType = 1
  YGrid.Columns.Add("������", 0, 0, "FLD13").SortType = 1
  YGrid.Columns.Add("D20��", 0, 0, "FLD14").SortType = 1
  YGrid.Columns.Add("D20��", 0, 0, "FLD15").SortType = 1
  YGrid.Columns.Add("Dy���", 0, 0, "FLD16").SortType = 1
  YGrid.Columns.Add("Dy���", 0, 0, "FLD17").SortType = 1
  YGrid.Columns.Add("Dy��", 0, 0, "FLD18").SortType = 1
  YGrid.Columns.Add("d�����", 0, 0, "FLD19").SortType = 1
  YGrid.Columns.Add("d�����", 0, 0, "FLD20").SortType = 1
  YGrid.Columns.Add("G(���)��", 0, 0, "FLD21").SortType = 1
  YGrid.Columns.Add("G���", 0, 0, "FLD22").SortType = 1
  YGrid.Columns.Add("G��(��� min)", 0, 0, "FLD23").SortType = 1
  YGrid.Columns.Add("G��", 0, 0, "FLD24").SortType = 1
  YGrid.Columns.Add("G��(��� min)", 0, 0, "FLD25").SortType = 1
  YGrid.Columns.Add("G��_min��", 0, 0, "FLD26").SortType = 1
  YGrid.Columns.Add("G��_min��", 0, 0, "FLD27").SortType = 1
  YGrid.Columns.Add("G����", 0, 0, "FLD28").SortType = 1
  YGrid.Columns.Add("G����", 0, 0, "FLD29").SortType = 1
  YGrid.Columns.Add("G��", 0, 0, "FLD30").SortType = 1
  YGrid.Columns.Add("�20��", 0, 0, "FLD31").SortType = 1
  YGrid.Columns.Add("�20��", 0, 0, "FLD32").SortType = 1
  YGrid.Columns.Add("�������", 0, 0, "FLD33").SortType = 1
  YGrid.Columns.Add("������� G2", 0, 0, "FLD34").SortType = 1
  YGrid.Columns.Add("������� G1", 0, 0, "FLD35").SortType = 1
  YGrid.Columns.Add("��������", 0, 0, "FLD36").SortType = 1
  YGrid.Columns.Add("����������", 0, 0, "FLD37").SortType = 1
  YGrid.Columns.Add("����������", 0, 0, "FLD40").SortType = 1
  YGrid.Columns.Add("���������� ���", 0, 0, "FLD41").SortType = 1
  YGrid.Columns.Add("����", 0, 0, "FLD42").SortType = 1
  YGrid.Columns.Add("���", 0, 0, "FLD43").SortType = 1
  YGrid.Columns.Add("������ ������", 0, 0, "FLD45").SortType = 1
  YGrid.Columns.Add("�_������", 0, 0, "FLD46").SortType = 1
  YGrid.Columns.Add("���_������", 0, 0, "FLD47").SortType = 1
  YGrid.Columns.Add("��� �����������", 0, 0, "FLD48").SortType = 1
  YGrid.Columns.Add("��� ����������", 0, 0, "FLD49").SortType = 1
  YGrid.Columns.Add("�������", 0, 0, "FLD50").SortType = 1
  YGrid.Columns.Add("������������ ��������", 0, 0, "FLD51").SortType = 1
  YGrid.Columns.Add("�����", 0, 0, "FLD52").SortType = 1
  YGrid.Columns.Add("Q��", 0, 0, "FLD53").SortType = 1
  YGrid.Columns.Add("Q�", 0, 0, "FLD54").SortType = 1
  YGrid.Columns.Add("Q���", 0, 0, "FLD55").SortType = 1
  YGrid.Columns.Add("Q��", 0, 0, "FLD56").SortType = 1
  YGrid.Columns.Add("G��", 0, 0, "FLD57").SortType = 1
  YGrid.Columns.Add("G�", 0, 0, "FLD58").SortType = 1
  YGrid.Columns.Add("G��", 0, 0, "FLD59").SortType = 1
  YGrid.Columns.Add("�����_�����", 0, 0, "FLD60").SortType = 1
  YGrid.Columns.Add("���_�����", 0, 0, "FLD61").SortType = 1
  YGrid.Columns.Add("����������� ���", 0, 0, "FLD62").SortType = 1
  YGrid.Columns.Add("�1", 0, 0, "FLD63").SortType = 1
  YGrid.Columns.Add("�2", 0, 0, "FLD64").SortType = 1
  YGrid.Columns.Add("�3", 0, 0, "FLD65").SortType = 1
  YGrid.Columns.Add("�4", 0, 0, "FLD66").SortType = 1
  YGrid.Columns.Add("G���", 0, 0, "FLD67").SortType = 1
  YGrid.Columns.Add("G���_���", 0, 0, "FLD68").SortType = 1
  YGrid.Columns.Add("G���_�", 0, 0, "FLD69").SortType = 1
  YGrid.Columns.Add("Q���", 0, 0, "FLD70").SortType = 1
  YGrid.Columns.Add("Q����", 0, 0, "FLD71").SortType = 1
  YGrid.Columns.Add("���", 0, 0, "FLD72").SortType = 1
  YGrid.Columns.Add("���������� ����", 0, 0, "FLD73").SortType = 1
  YGrid.Columns.Add("�������2", 0, 0, "FLD81").SortType = 1
  YGrid.Columns.Add("�����������", 0, 0, "FLD82").SortType = 1
  YGrid.Columns.Add("G����", 0, 0, "FLD83").SortType = 1
  YGrid.Columns.Add("��� ����", 0, 0, "FLD84").SortType = 1
  YGrid.Columns.Add("����_����������������", 0, 0, "FLD85").SortType = 1
  YGrid.Columns.Add("Q���_���", 0, 0, "FLD86").SortType = 1
  YGrid.Columns.Add("Q���_��� ��", 0, 0, "FLD87").SortType = 1
  YGrid.Columns.Add("Q��� ��", 0, 0, "FLD88").SortType = 1
  YGrid.Columns.Add("���� �������", 0, 0, "FLD89").SortType = 1
  YGrid.Columns.Add("�������", 0, 0, "FLD90").SortType = 1
  YGrid.Columns.Add("���� �����", 0, 0, "FLD92").SortType = 1
  YGrid.Columns.Add("���.�����", 0, 0, "FLD93").SortType = 1
  YGrid.Columns.Add("G(���)���", 0, 0, "FLD94").SortType = 1
  YGrid.Columns.Add("Dy����", 0, 0, "FLD95").SortType = 1
  YGrid.Columns.Add("����_���_M1", 0, 0, "FLD96").SortType = 1
  YGrid.Columns.Add("����_���_M2", 0, 0, "FLD97").SortType = 1
  YGrid.Columns.Add("����_���_M1��", 0, 0, "FLD98").SortType = 1
  YGrid.Columns.Add("����_���_M2��", 0, 0, "FLD99").SortType = 1
  YGrid.Columns.Add("���_����_���_M1%", 0, 0, "FLD100").SortType = 1
  YGrid.Columns.Add("���_����_���_M2%", 0, 0, "FLD101").SortType = 1
  YGrid.Columns.Add("���_����_���_M1��%", 0, 0, "FLD102").SortType = 1
  YGrid.Columns.Add("���_����_���_M2��%", 0, 0, "FLD103").SortType = 1
  YGrid.Columns.Add("���������� M2", 0, 0, "FLD104").SortType = 1
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
 Dim obj As CONTRACT
  If RowIndex > 0 And RowIndex <= Count Then
    'If not IsEmpty(BookMArk) then
    '  set obj = item(left(bookmark,38))
    'else
      Set obj = Item(RowIndex)
    'end If
    If obj Is Nothing Then Exit Sub
    On Error Resume Next
    Values.Value(1) = Left(Replace(obj.FLD12, vbCrLf, " "), 255)
    Values.Value(2) = Left(Replace(obj.FLD13, vbCrLf, " "), 255)
    Values.Value(3) = Left(Replace(obj.FLD14, vbCrLf, " "), 255)
    Values.Value(4) = Left(Replace(obj.FLD15, vbCrLf, " "), 255)
    Values.Value(5) = Left(Replace(obj.FLD16, vbCrLf, " "), 255)
    Values.Value(6) = Left(Replace(obj.FLD17, vbCrLf, " "), 255)
    Values.Value(7) = Left(Replace(obj.FLD18, vbCrLf, " "), 255)
    Values.Value(8) = Left(Replace(obj.FLD19, vbCrLf, " "), 255)
    Values.Value(9) = Left(Replace(obj.FLD20, vbCrLf, " "), 255)
    Values.Value(10) = Left(Replace(obj.FLD21, vbCrLf, " "), 255)
    Values.Value(11) = Left(Replace(obj.FLD22, vbCrLf, " "), 255)
    Values.Value(12) = Left(Replace(obj.FLD23, vbCrLf, " "), 255)
    Values.Value(13) = Left(Replace(obj.FLD24, vbCrLf, " "), 255)
    Values.Value(14) = Left(Replace(obj.FLD25, vbCrLf, " "), 255)
    Values.Value(15) = Left(Replace(obj.FLD26, vbCrLf, " "), 255)
    Values.Value(16) = Left(Replace(obj.FLD27, vbCrLf, " "), 255)
    Values.Value(17) = Left(Replace(obj.FLD28, vbCrLf, " "), 255)
    Values.Value(18) = Left(Replace(obj.FLD29, vbCrLf, " "), 255)
    Values.Value(19) = Left(Replace(obj.FLD30, vbCrLf, " "), 255)
    Values.Value(20) = Left(Replace(obj.FLD31, vbCrLf, " "), 255)
    Values.Value(21) = Left(Replace(obj.FLD32, vbCrLf, " "), 255)
    Values.Value(22) = Left(Replace(obj.FLD33, vbCrLf, " "), 255)
    Values.Value(23) = Left(Replace(obj.FLD34, vbCrLf, " "), 255)
    Values.Value(24) = Left(Replace(obj.FLD35, vbCrLf, " "), 255)
    Values.Value(25) = Left(Replace(obj.FLD36, vbCrLf, " "), 255)
    Values.Value(26) = Left(Replace(obj.FLD37, vbCrLf, " "), 255)
    Values.Value(27) = Left(Replace(obj.FLD40, vbCrLf, " "), 255)
    Values.Value(28) = Left(Replace(obj.FLD41, vbCrLf, " "), 255)
    Values.Value(29) = Left(Replace(obj.FLD42, vbCrLf, " "), 255)
    Values.Value(30) = Left(Replace(obj.FLD43, vbCrLf, " "), 255)
    Values.Value(31) = Left(Replace(obj.FLD45, vbCrLf, " "), 255)
    Values.Value(32) = Left(Replace(obj.FLD46, vbCrLf, " "), 255)
    Values.Value(33) = Left(Replace(obj.FLD47, vbCrLf, " "), 255)
    Values.Value(34) = Left(Replace(obj.FLD48, vbCrLf, " "), 255)
    Values.Value(35) = Left(Replace(obj.FLD49, vbCrLf, " "), 255)
    Values.Value(36) = Left(Replace(obj.FLD50, vbCrLf, " "), 255)
    Values.Value(37) = Left(Replace(obj.FLD51, vbCrLf, " "), 255)
    Values.Value(38) = Left(Replace(obj.FLD52, vbCrLf, " "), 255)
    Values.Value(39) = Left(Replace(obj.FLD53, vbCrLf, " "), 255)
    Values.Value(40) = Left(Replace(obj.FLD54, vbCrLf, " "), 255)
    Values.Value(41) = Left(Replace(obj.FLD55, vbCrLf, " "), 255)
    Values.Value(42) = Left(Replace(obj.FLD56, vbCrLf, " "), 255)
    Values.Value(43) = Left(Replace(obj.FLD57, vbCrLf, " "), 255)
    Values.Value(44) = Left(Replace(obj.FLD58, vbCrLf, " "), 255)
    Values.Value(45) = Left(Replace(obj.FLD59, vbCrLf, " "), 255)
    Values.Value(46) = Left(Replace(obj.FLD60, vbCrLf, " "), 255)
    Values.Value(47) = Left(Replace(obj.FLD61, vbCrLf, " "), 255)
    Values.Value(48) = Left(Replace(obj.FLD62, vbCrLf, " "), 255)
    Values.Value(49) = Left(Replace(obj.FLD63, vbCrLf, " "), 255)
    Values.Value(50) = Left(Replace(obj.FLD64, vbCrLf, " "), 255)
    Values.Value(51) = Left(Replace(obj.FLD65, vbCrLf, " "), 255)
    Values.Value(52) = Left(Replace(obj.FLD66, vbCrLf, " "), 255)
    Values.Value(53) = Left(Replace(obj.FLD67, vbCrLf, " "), 255)
    Values.Value(54) = Left(Replace(obj.FLD68, vbCrLf, " "), 255)
    Values.Value(55) = Left(Replace(obj.FLD69, vbCrLf, " "), 255)
    Values.Value(56) = Left(Replace(obj.FLD70, vbCrLf, " "), 255)
    Values.Value(57) = Left(Replace(obj.FLD71, vbCrLf, " "), 255)
    Values.Value(58) = Left(Replace(obj.FLD72, vbCrLf, " "), 255)
    Values.Value(59) = Left(Replace(obj.FLD73, vbCrLf, " "), 255)
    Values.Value(60) = Left(Replace(obj.FLD81, vbCrLf, " "), 255)
    Values.Value(61) = Left(Replace(obj.FLD82, vbCrLf, " "), 255)
    Values.Value(62) = Left(Replace(obj.FLD83, vbCrLf, " "), 255)
    Values.Value(63) = Left(Replace(obj.FLD84, vbCrLf, " "), 255)
    Values.Value(64) = Left(Replace(obj.FLD85, vbCrLf, " "), 255)
    Values.Value(65) = Left(Replace(obj.FLD86, vbCrLf, " "), 255)
    Values.Value(66) = Left(Replace(obj.FLD87, vbCrLf, " "), 255)
    Values.Value(67) = Left(Replace(obj.FLD88, vbCrLf, " "), 255)
    Values.Value(68) = Left(Replace(obj.FLD89, vbCrLf, " "), 255)
    Values.Value(69) = Left(Replace(obj.FLD90, vbCrLf, " "), 255)
    Values.Value(70) = Left(Replace(obj.FLD92, vbCrLf, " "), 255)
    Values.Value(71) = Left(Replace(obj.FLD93, vbCrLf, " "), 255)
    Values.Value(72) = Left(Replace(obj.FLD94, vbCrLf, " "), 255)
    Values.Value(73) = Left(Replace(obj.FLD95, vbCrLf, " "), 255)
    Values.Value(74) = Left(Replace(obj.FLD96, vbCrLf, " "), 255)
    Values.Value(75) = Left(Replace(obj.FLD97, vbCrLf, " "), 255)
    Values.Value(76) = Left(Replace(obj.FLD98, vbCrLf, " "), 255)
    Values.Value(77) = Left(Replace(obj.FLD99, vbCrLf, " "), 255)
    Values.Value(78) = Left(Replace(obj.FLD100, vbCrLf, " "), 255)
    Values.Value(79) = Left(Replace(obj.FLD101, vbCrLf, " "), 255)
    Values.Value(80) = Left(Replace(obj.FLD102, vbCrLf, " "), 255)
    Values.Value(81) = Left(Replace(obj.FLD103, vbCrLf, " "), 255)
    Values.Value(82) = Left(Replace(obj.FLD104, vbCrLf, " "), 255)
   YGrid.RowBookmark(RowIndex) = obj.ID & "CONTRACT"
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



