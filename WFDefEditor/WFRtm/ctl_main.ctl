VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.UserControl ctl_main 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Tag             =   "Card.ICO"
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
   Begin WFRtmGUI.vpnWFRtm_main_ pnlWFRtm_main 
      Height          =   1500
      Left            =   1500
      TabIndex        =   1
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin WFRtmGUI.vpnWFRtm_func_ pnlWFRtm_func 
      Height          =   1500
      Left            =   3000
      TabIndex        =   2
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin WFRtmGUI.vpnWFRtm_Pcomm_ pnlWFRtm_Pcomm 
      Height          =   1500
      Left            =   4500
      TabIndex        =   3
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin WFRtmGUI.vpnWFRtm_Param_ pnlWFRtm_Param 
      Height          =   1500
      Left            =   6000
      TabIndex        =   4
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin WFRtmGUI.vpnWFRtm_Doc_ pnlWFRtm_Doc 
      Height          =   1500
      Left            =   0
      TabIndex        =   5
      Top             =   1500
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

Public Item As Object
Public Host As GUI
Public ModalMode As Boolean
Public ParentForm As Object


Private Sub ts_click()
  On Error Resume Next
  pnlWFRtm_Doc.Visible = False
  pnlWFRtm_Param.Visible = False
  pnlWFRtm_Pcomm.Visible = False
  pnlWFRtm_func.Visible = False
  pnlWFRtm_main.Visible = False

   Select Case ts.SelectedItem.Key
   Case "WFRtm_main"
     With pnlWFRtm_main
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWFRtm_main.OnClick Item, ParentForm
     End With
   Case "WFRtm_func"
     With pnlWFRtm_func
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWFRtm_func.OnClick Item, ParentForm
     End With
   Case "WFRtm_Pcomm"
     With pnlWFRtm_Pcomm
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWFRtm_Pcomm.OnClick Item, ParentForm
     End With
   Case "WFRtm_Param"
     With pnlWFRtm_Param
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWFRtm_Param.OnClick Item, ParentForm
     End With
   Case "WFRtm_Doc"
     With pnlWFRtm_Doc
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWFRtm_Doc.OnClick Item, ParentForm
     End With
     End Select
End Sub
Public Sub Init(ObjItem As Object, MyHost As GUI, aModalMode As Boolean, aParentForm As Object)
  On Error Resume Next
 Set Item = ObjItem
 Set Host = MyHost
 Set ParentForm = aParentForm
 ModalMode = aModalMode
  Dim ff As Long, buf As String

ts.Tabs.Item(1).Caption = "Общие данные"
ts.Tabs.Item(1).Key = "WFRtm_main"
pnlWFRtm_main.OnInit Item, ParentForm
Call ts.Tabs.Add(, "WFRtm_func", "Функции")
pnlWFRtm_func.OnInit Item, ParentForm
Call ts.Tabs.Add(, "WFRtm_Pcomm", "Комментарии")
pnlWFRtm_Pcomm.OnInit Item, ParentForm
Call ts.Tabs.Add(, "WFRtm_Param", "Параметры")
pnlWFRtm_Param.OnInit Item, ParentForm
Call ts.Tabs.Add(, "WFRtm_Doc", "Документы")
pnlWFRtm_Doc.OnInit Item, ParentForm
 ts_click
End Sub
Private Sub UserControl_Terminate()
  On Error Resume Next
  Set Item = Nothing
  Set Host = Nothing
  Set ParentForm = Nothing
 pnlWFRtm_main.CloseClass
 pnlWFRtm_func.CloseClass
 pnlWFRtm_Pcomm.CloseClass
 pnlWFRtm_Param.CloseClass
 pnlWFRtm_Doc.CloseClass
End Sub
Public Sub OnSave()
 pnlWFRtm_main.OnSave
 pnlWFRtm_func.OnSave
 pnlWFRtm_Pcomm.OnSave
 pnlWFRtm_Param.OnSave
 pnlWFRtm_Doc.OnSave
End Sub
Public Function IsChanged() As Boolean
  Dim m_IsChanged As Boolean
  On Error Resume Next
m_IsChanged = m_IsChanged Or pnlWFRtm_main.IsChanged
m_IsChanged = m_IsChanged Or pnlWFRtm_func.IsChanged
m_IsChanged = m_IsChanged Or pnlWFRtm_Pcomm.IsChanged
m_IsChanged = m_IsChanged Or pnlWFRtm_Param.IsChanged
m_IsChanged = m_IsChanged Or pnlWFRtm_Doc.IsChanged
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

'переместить клиента в каталоге
'{5CB1388C-1623-4B36-A775-00B70BEE27AF}
Private Sub Run_VBMoveVRC(VRCATFolder As Variant, Optional RowItem As Object)
'do nothing
End Sub



'Передать права объекту контактное лицо от объекта клиент
'{79DED4FD-045C-45F8-AC79-2E5A3D956D97}
Private Sub Run_VBMigrateRight(Optional RowItem As Object)
'Migrate security
On Error GoTo bye
  If RowItem.Person Is Nothing Then Exit Sub

  RowItem.Person.Secure Item.SecureStyleID
  RowItem.Person.Propagate
bye:
  Exit Sub
  MsgBox Err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Применить стиль защиты для объекта Предназначен для  каталога клиентов
'{31EC6CF7-8DBD-4EFE-BF12-4D168F653D34}
Private Sub Run_VBApplySecurity(Optional RowItem As Object)
'Apply security
On Error GoTo bye
  If RowItem.Client Is Nothing Then Exit Sub
  If RowItem.Parent.Parent.AccessLevel Is Nothing Then Exit Sub
  RowItem.Client.Secure RowItem.Parent.Parent.AccessLevel.ID
  RowItem.Client.Propagate
bye:
  Exit Sub
  MsgBox Err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Создание отчета из разных карточек
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
Dim ID As String
 Dim Obj As Object
 'ID = CreateGUID2
 'Call RowItem.Application.Manager.NewInstance(ID, "VRRPT", "Отчет " & Date)
 'Set RowItem.Report = RowItem.Application.Manager.GetInstanceObject(ID)
 If RowItem.Report.VRRPT_MAIN.Count = 0 Then
  Set Obj = RowItem.Report.VRRPT_MAIN.Add
 Else
  Set Obj = RowItem.Report.VRRPT_MAIN.Item(1)
 End If
 
 Set Obj.Author = RowItem.Application.FindRowObject("Users", Item.Application.MTZSession.GetSessionUserID())
 Obj.TheDate = Date
 
 If ReportType = "CLNT" Then
   Set Obj.Client = RowItem.Application
 End If
 If ReportType = "PRJ" Then
   Set Obj.Project = RowItem.Application
 End If
 If ReportType = "CONT" Then
   Set Obj.Contract = RowItem.Application
 End If
 If ReportType = "PERS" Then
   Set Obj.Person = RowItem.Application
 End If
 
 Obj.Save
 RowItem.Save

End Sub



'открытие карточки по идентификатору
'{94E8F6DB-106A-44DC-9483-86C801798FF0}
Private Sub Run_VBOpenRef(StartMode As Variant, ID As Variant, Optional RowItem As Object)
On Error Resume Next
If ID <> "" Then
    Dim Obj As Object
    Set Obj = Item.manager.GetInstanceObject(ID)
    If Not Obj Is Nothing Then
      Dim objGui As Object
      Set objGui = Item.manager.GetInstanceGUI(Obj.ID)
      If objGui Is Nothing Then Exit Sub

       If StartMode = "AUTO" Then
        StartMode = ""
        Dim i As Long
        For i = 100 To 0 Step -10
          If Obj.MTZSession.CheckRight(Obj.SecureStyleID, Obj.TypeName & ":" & "M" & i) Then
            StartMode = "M" & i
            Exit For
          End If
        Next
       End If
      
      objGui.Show StartMode & "", Obj
      Set objGui = Nothing
    End If
  End If
  
End Sub



'
'{069956DC-3305-45EF-9331-91CE323B5942}
Private Sub Run_WFDefName(Optional RowItem As Object)
Item.Name = RowItem.Description
ParentForm.Caption = Item.Name
Item.Save
End Sub



'
'{D8914FB4-6B5D-491A-A72F-985617727583}
Private Sub Run_WFFuncName(Optional RowItem As Object)
Item.Name = RowItem.Name
ParentForm.Caption = Item.Name
Item.Save
End Sub



'Изменить название объекта
'{4FB59D1A-0123-47D3-9F4F-E12085C5D074}
Private Sub Run_VBUpdateItemName(Name As Variant, Optional RowItem As Object)
Item.Name = Name
ParentForm.Caption = Item.Name
Item.Save
End Sub



