VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.UserControl ctl_main 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   8295
   ScaleHeight     =   3600
   ScaleWidth      =   8295
   Tag             =   "Card.ICO"
   Begin WFFRGUI.vpnWFRtm_Doc_ pnlWFRtm_Doc 
      Height          =   1455
      Left            =   4680
      TabIndex        =   3
      Top             =   0
      Width           =   2055
      _ExtentX        =   3625
      _ExtentY        =   2566
   End
   Begin MSComctlLib.TabStrip ts 
      Height          =   1500
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   1
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin WFFRGUI.vpnWFFR_func_ pnlWFFR_func 
      Height          =   1500
      Left            =   1500
      TabIndex        =   1
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin WFFRGUI.vpnWFFR_Fcomm_ pnlWFFR_Fcomm 
      Height          =   1500
      Left            =   3120
      TabIndex        =   2
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
End
Attribute VB_Name = "ctl_main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Public item As Object
Public Host As GUI
Public ModalMode As Boolean
Public ParentForm As Object


Private Sub ts_click()
  On Error Resume Next
  pnlWFFR_Fcomm.Visible = False
  pnlWFFR_func.Visible = False
  pnlWFRtm_Doc.Visible = False

   Select Case ts.SelectedItem.Key
   Case "WFFR_func"
     With pnlWFFR_func
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWFFR_func.OnClick item, ParentForm
     End With
   Case "WFFR_Fcomm"
     With pnlWFFR_Fcomm
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWFFR_Fcomm.OnClick item, ParentForm
     End With
    Case "WFRtm_Doc"
     With pnlWFRtm_Doc
      .Top = ts.ClientTop
      .Left = ts.ClientLeft
      .Width = ts.ClientWidth
      .Height = ts.ClientHeight
      .Visible = True
      .ZOrder 0
      pnlWFRtm_Doc.OnClick GetOwner(item), ParentForm
     End With
   End Select
End Sub

Private Function GetOwner(item As Object) As Object
  Dim rs As ADODB.Recordset
  Set rs = item.Application.MTZSession.GetRow("INSTANCE", item.id)
  Dim obj As Object
  Set obj = item.Application.FindRowObject(rs!OwnerPartName, rs!ownerRowID)
  If Not obj Is Nothing Then
    Set GetOwner = obj.Application
  End If
  Set obj = Nothing
  rs.Close
  Set rs = Nothing
End Function


Public Sub Init(ObjItem As Object, MyHost As GUI, aModalMode As Boolean, aParentForm As Object)
  On Error Resume Next
 Set item = ObjItem
 Set Host = MyHost
 Set ParentForm = aParentForm
 ModalMode = aModalMode
  Dim ff As Long, buf As String
  ts.Tabs.item(1).Caption = "��������"
  ts.Tabs.item(1).Key = "WFFR_func"
  pnlWFFR_func.OnInit item, ParentForm
  Call ts.Tabs.Add(, "WFFR_Fcomm", "�����������")
  pnlWFFR_Fcomm.OnInit item, ParentForm
  Call ts.Tabs.Add(, "WFRtm_Doc", "���������")
  pnlWFRtm_Doc.OnInit GetOwner(item), ParentForm
  ts_click
End Sub
Private Sub UserControl_Terminate()
  On Error Resume Next
  Set item = Nothing
  Set Host = Nothing
  Set ParentForm = Nothing
 pnlWFFR_func.CloseClass
 pnlWFFR_Fcomm.CloseClass
End Sub
Public Sub OnSave()
 pnlWFFR_func.OnSave
 pnlWFFR_Fcomm.OnSave
End Sub
Public Function IsChanged() As Boolean
  Dim m_IsChanged As Boolean
  On Error Resume Next
m_IsChanged = m_IsChanged Or pnlWFFR_func.IsChanged
m_IsChanged = m_IsChanged Or pnlWFFR_Fcomm.IsChanged
  IsChanged = m_IsChanged
End Function
Private Sub UserControl_Resize()
 On Error Resume Next
ts.Top = 0
ts.Left = 0
ts.Width = UserControl.Width
ts.Height = UserControl.Height
ts_click
End Sub

'����������� ������� � ��������
'{5CB1388C-1623-4B36-A775-00B70BEE27AF}
Private Sub Run_VBMoveVRC(VRCATFolder As Variant, Optional RowItem As Object)
'do nothing
End Sub



'�������� ����� ������� ���������� ���� �� ������� ������
'{79DED4FD-045C-45F8-AC79-2E5A3D956D97}
Private Sub Run_VBMigrateRight(Optional RowItem As Object)
'Migrate security
On Error GoTo bye
  If RowItem.Person Is Nothing Then Exit Sub

  RowItem.Person.Secure item.SecureStyleID
  RowItem.Person.Propagate
bye:
  Exit Sub
  MsgBox Err.Description, vbOKOnly + vbCritical, "�������� ����� ������"
End Sub



'��������� ����� ������ ��� ������� ������������ ���  �������� ��������
'{31EC6CF7-8DBD-4EFE-BF12-4D168F653D34}
Private Sub Run_VBApplySecurity(Optional RowItem As Object)
'Apply security
On Error GoTo bye
  If RowItem.Client Is Nothing Then Exit Sub
  If RowItem.Parent.Parent.AccessLevel Is Nothing Then Exit Sub
  RowItem.Client.Secure RowItem.Parent.Parent.AccessLevel.id
  RowItem.Client.Propagate
bye:
  Exit Sub
  MsgBox Err.Description, vbOKOnly + vbCritical, "�������� ����� ������"
End Sub



'�������� ������ �� ������ ��������
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
Dim id As String
 Dim obj As Object
 'ID = CreateGUID2
 'Call RowItem.Application.Manager.NewInstance(ID, "VRRPT", "����� " & Date)
 'Set RowItem.Report = RowItem.Application.Manager.GetInstanceObject(ID)
 If RowItem.Report.VRRPT_MAIN.Count = 0 Then
  Set obj = RowItem.Report.VRRPT_MAIN.Add
 Else
  Set obj = RowItem.Report.VRRPT_MAIN.item(1)
 End If
 
 Set obj.Author = RowItem.Application.FindRowObject("Users", item.Application.MTZSession.GetSessionUserID())
 obj.TheDate = Date
 
 If ReportType = "CLNT" Then
   Set obj.Client = RowItem.Application
 End If
 If ReportType = "PRJ" Then
   Set obj.Project = RowItem.Application
 End If
 If ReportType = "CONT" Then
   Set obj.Contract = RowItem.Application
 End If
 If ReportType = "PERS" Then
   Set obj.Person = RowItem.Application
 End If
 
 obj.Save
 RowItem.Save

End Sub



'�������� �������� �� ��������������
'{94E8F6DB-106A-44DC-9483-86C801798FF0}
Private Sub Run_VBOpenRef(StartMode As Variant, id As Variant, Optional RowItem As Object)
On Error Resume Next
If id <> "" Then
    Dim obj As Object
    Set obj = item.Manager.GetInstanceObject(id)
    If Not obj Is Nothing Then
      Dim objGui As Object
      Set objGui = item.Manager.GetInstanceGUI(obj.id)
      If objGui Is Nothing Then Exit Sub

       If StartMode = "AUTO" Then
        StartMode = ""
        Dim i As Long
        For i = 100 To 0 Step -10
          If obj.MTZSession.CheckRight(obj.SecureStyleID, obj.TypeName & ":" & "M" & i) Then
            StartMode = "M" & i
            Exit For
          End If
        Next
       End If
      
      objGui.Show StartMode & "", obj
      Set objGui = Nothing
    End If
  End If
  
End Sub



'
'{069956DC-3305-45EF-9331-91CE323B5942}
Private Sub Run_WFDefName(Optional RowItem As Object)
item.Name = RowItem.Description
ParentForm.Caption = item.Name
item.Save
End Sub



'
'{D8914FB4-6B5D-491A-A72F-985617727583}
Private Sub Run_WFFuncName(Optional RowItem As Object)
item.Name = RowItem.Name
ParentForm.Caption = item.Name
item.Save
End Sub



'�������� �������� �������
'{4FB59D1A-0123-47D3-9F4F-E12085C5D074}
Private Sub Run_VBUpdateItemName(Name As Variant, Optional RowItem As Object)
item.Name = Name
ParentForm.Caption = item.Name
item.Save
End Sub


