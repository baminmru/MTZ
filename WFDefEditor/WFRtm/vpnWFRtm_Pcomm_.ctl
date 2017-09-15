VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.UserControl vpnWFRtm_Pcomm_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerWFRtm_Pcomm 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlWFRtm_Pcomm 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdWFRtm_PcommAcc 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   7
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_PcommRef 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   6
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_PcommDel 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   5
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_PcommEdit 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   4
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_PcommAdd 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   3
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_PcommAddRoot 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   2
         Tag             =   "NEWROOT.ico"
         ToolTipText     =   "Добавить ветку"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin MSComctlLib.TreeView treeWFRtm_Pcomm 
         Height          =   480
         Left            =   225
         TabIndex        =   1
         Top             =   600
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
         _Version        =   393217
         HideSelection   =   0   'False
         Indentation     =   132
         LabelEdit       =   1
         LineStyle       =   1
         PathSeparator   =   ""
         Style           =   7
         Appearance      =   1
      End
   End
   Begin VB.Menu mnuPopupWFRtm_Pcomm 
      Caption         =   "Меню для Комментарии"
      Visible         =   0   'False
      Begin VB.Menu mnuWFRtm_PcommAddRoot 
         Caption         =   "Создать ветку"
      End
      Begin VB.Menu mnuWFRtm_PcommAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFRtm_PcommEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFRtm_PcommDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFRtm_PcommS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFRtm_PcommBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFRtm_PcommCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFRtm_PcommCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFRtm_PcommPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFRtm_PcommCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFRtm_PcommCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFRtm_PcommRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFRtm_PcommAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnWFRtm_Pcomm_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private menuActionWFRtm_Pcomm As String


Private Sub cmdWFRtm_PcommAdd_Click()
  On Error Resume Next
Dim f As Object, p As Object
If (treeWFRtm_Pcomm.SelectedItem Is Nothing) Then Exit Sub
  Set p = Item.FindRowObject("WFRtm_Pcomm", Left(treeWFRtm_Pcomm.SelectedItem.Key, 38))
  Set f = p.WFRtm_Pcomm.Add()

      Set frmWFRtm_Pcomm_.Item = f
again:       frmWFRtm_Pcomm_.NotFirstTime = False
      frmWFRtm_Pcomm_.OnInit
      frmWFRtm_Pcomm_.Show vbModal
      If frmWFRtm_Pcomm_.OK Then
        Err.Clear
        f.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
          If treeWFRtm_Pcomm.SelectedItem.Child.Tag <> "ToDelete" Then
            f.LoadToTree treeWFRtm_Pcomm, treeWFRtm_Pcomm.SelectedItem.Key
          End If
          Set treeWFRtm_Pcomm.SelectedItem = treeWFRtm_Pcomm.Nodes.Item(f.ID & "WFRtm_Pcomm")
      Else
        Item.WFRtm_Pcomm.Remove f.ID
      End If
End Sub

Private Sub cmdWFRtm_PcommAddRoot_Click()
  On Error Resume Next
Dim f As Object, p As Object
  Set f = Item.WFRtm_Pcomm.Add()
  Set frmWFRtm_Pcomm_.Item = f
again:   frmWFRtm_Pcomm_.NotFirstTime = False
  frmWFRtm_Pcomm_.OnInit
  frmWFRtm_Pcomm_.Show vbModal
  If frmWFRtm_Pcomm_.OK Then
    Err.Clear
    f.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
      GoTo again
    End If
    f.LoadToTree treeWFRtm_Pcomm, ""
  Else
    Item.WFRtm_Pcomm.Remove f.ID
  End If
End Sub

Private Sub cmdWFRtm_PcommEdit_Click()
  On Error Resume Next
  Dim f As Object
  If treeWFRtm_Pcomm.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("WFRtm_Pcomm", Left(treeWFRtm_Pcomm.SelectedItem.Key, 38))
  Set frmWFRtm_Pcomm_.Item = f
again:   frmWFRtm_Pcomm_.NotFirstTime = False
  frmWFRtm_Pcomm_.OnInit
  frmWFRtm_Pcomm_.Show vbModal
  If frmWFRtm_Pcomm_.OK Then
    Err.Clear
    f.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
  End If
End Sub

Private Sub cmdWFRtm_PcommDel_Click()
  On Error Resume Next
  Dim f As Object
  If treeWFRtm_Pcomm.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("WFRtm_Pcomm", Left(treeWFRtm_Pcomm.SelectedItem.Key, 38))
  If MsgBox("Удалить элемент" & vbCrLf & f.Brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
  On Error GoTo bye
     If f.Parent.Delete(f.ID) Then
       treeWFRtm_Pcomm.Nodes.Remove treeWFRtm_Pcomm.SelectedItem.Key
     End If
  End If
Exit Sub
bye:
MsgBox Err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub

Private Sub cmdWFRtm_PcommAcc_Click()
  On Error Resume Next
  Dim f As Object
  If treeWFRtm_Pcomm.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("WFRtm_Pcomm", Left(treeWFRtm_Pcomm.SelectedItem.Key, 38))
  Item.Application.Manager.ShowSecurityDialog f
End Sub

Private Sub cmdWFRtm_PcommREf_Click()
  On Error Resume Next
  Item.WFRtm_Pcomm.Refresh
  treeWFRtm_Pcomm.Nodes.Clear
  Item.WFRtm_Pcomm.filltree treeWFRtm_Pcomm
End Sub

Private Sub treeWFRtm_Pcomm_JWDblClick()
If treeWFRtm_Pcomm.SelectedItem Is Nothing Then Exit Sub
  Dim f As Object
  Set f = Item.FindRowObject("WFRtm_Pcomm", Left(treeWFRtm_Pcomm.SelectedItem.Key, 38))
  Set frmWFRtm_Pcomm_.Item = f
again:   frmWFRtm_Pcomm_.NotFirstTime = False
  frmWFRtm_Pcomm_.OnInit
  frmWFRtm_Pcomm_.Show vbModal
  If frmWFRtm_Pcomm_.OK Then
    On Error Resume Next
    Err.Clear
    f.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    treeWFRtm_Pcomm.SelectedItem.Text = f.Brief(True)
    Else
     f.Refresh
  End If
End Sub

Private Sub treeWFRtm_Pcomm_Expand(ByVal Node As MSComctlLib.Node)
If Node.Child.Tag = "ToDelete" Then
 ParentForm.MousePointer = vbHourglass
 treeWFRtm_Pcomm.Nodes.Remove Node.Child.Index
 Dim f As Object
 Set f = Item.FindRowObject("WFRtm_Pcomm", Left(Node.Key, 38))
 f.expandpart treeWFRtm_Pcomm, Node.Key
 ParentForm.MousePointer = vbNormal
End If
End Sub

Private Sub treeWFRtm_Pcomm_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupWFRtm_Pcomm
End If
End Sub
Private Sub mnuWFRtm_PcommAddRoot_click()
   menuActionWFRtm_Pcomm = "ADDROOT"
   menuTimerWFRtm_Pcomm.Enabled = True
End Sub
Private Sub mnuWFRtm_PcommAdd_click()
   menuActionWFRtm_Pcomm = "ADD"
   menuTimerWFRtm_Pcomm.Enabled = True
End Sub
Private Sub mnuWFRtm_PcommEdit_click()
   menuActionWFRtm_Pcomm = "EDIT"
   menuTimerWFRtm_Pcomm.Enabled = True
End Sub
Private Sub mnuWFRtm_PcommDelete_click()
   menuActionWFRtm_Pcomm = "DEL"
   menuTimerWFRtm_Pcomm.Enabled = True
End Sub
  Private Sub mnuWFRtm_PcommCOPY_Click()
    On Error Resume Next
    If treeWFRtm_Pcomm.SelectedItem Is Nothing Then Exit Sub
        Dim u As Object
        Set u = Item.FindRowObject("WFRtm_Pcomm", Left(treeWFRtm_Pcomm.SelectedItem.Key, 38))
        SaveToBuffer u
  End Sub
  Private Sub mnuWFRtm_PcommCUT_Click()
    On Error Resume Next
    If treeWFRtm_Pcomm.SelectedItem Is Nothing Then Exit Sub
    Dim u As Object, BM
    Set u = Item.FindRowObject("WFRtm_Pcomm", Left(treeWFRtm_Pcomm.SelectedItem.Key, 38))
    SaveToBuffer u
    Set BM = u.Parent
    u.Parent.Delete u.ID
    treeWFRtm_Pcomm.Nodes.Remove treeWFRtm_Pcomm.SelectedItem.Key
  End Sub
Private Sub mnuWFRtm_PcommPASTE_Click()
On Error Resume Next
If treeWFRtm_Pcomm.SelectedItem Is Nothing Then Exit Sub
  Dim u As Object, f As Object
  Set f = Item.FindRowObject("WFRtm_Pcomm", Left(treeWFRtm_Pcomm.SelectedItem.Key, 38))
  Set u = f.WFRtm_Pcomm.Add()
  If GetFromBuffer(u) Then
    If treeWFRtm_Pcomm.SelectedItem.Child.Tag <> "ToDelete" Then
      u.LoadToTree treeWFRtm_Pcomm, treeWFRtm_Pcomm.SelectedItem.Key
    End If
  Else
   f.WFRtm_Pcomm.Refresh
  End If
End Sub
Private Sub mnuWFRtm_PcommCHANGE_Click()
  On Error Resume Next
  If treeWFRtm_Pcomm.SelectedItem Is Nothing Then Exit Sub
  Dim u As Object, BM
  Set u = Item.FindRowObject("WFRtm_Pcomm", Left(treeWFRtm_Pcomm.SelectedItem.Key, 38))
  If GetFromBuffer(u) Then
    treeWFRtm_Pcomm.SelectedItem.Text = u.Brief
      treeWFRtm_Pcomm.SelectedItem.Expanded = False
      While treeWFRtm_Pcomm.SelectedItem.children > 0
        treeWFRtm_Pcomm.Nodes.Remove treeWFRtm_Pcomm.SelectedItem.Child.Key
      Wend
      treeWFRtm_Pcomm.Nodes.Add(treeWFRtm_Pcomm.SelectedItem.Key, 4, "Expanding ...").Tag = "ToDelete"
      treeWFRtm_Pcomm_Expand treeWFRtm_Pcomm.SelectedItem
  End If
End Sub
  Private Sub mnuWFRtm_PcommCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFRtm_PcommRef_click()
   menuActionWFRtm_Pcomm = "REF"
   menuTimerWFRtm_Pcomm.Enabled = True
End Sub
Private Sub mnuWFRtm_PcommAcc_click()
   menuActionWFRtm_Pcomm = "ACC"
   menuTimerWFRtm_Pcomm.Enabled = True
End Sub
Private Sub menuTimerWFRtm_Pcomm_timer()
   menuTimerWFRtm_Pcomm.Enabled = False
   If menuActionWFRtm_Pcomm = "ADDROOT" Then cmdWFRtm_PcommAddRoot_Click
   If menuActionWFRtm_Pcomm = "ADD" Then cmdWFRtm_PcommAdd_Click
   If menuActionWFRtm_Pcomm = "EDIT" Then cmdWFRtm_PcommEdit_Click
   If menuActionWFRtm_Pcomm = "DEL" Then cmdWFRtm_PcommDel_Click
   If menuActionWFRtm_Pcomm = "REF" Then cmdWFRtm_PcommREf_Click
   If menuActionWFRtm_Pcomm = "ACC" Then cmdWFRtm_PcommAcc_Click
   menuActionWFRtm_Pcomm = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdWFRtm_PcommAddRoot, cmdWFRtm_PcommAddRoot.Tag
  LoadBtnPictures cmdWFRtm_PcommAdd, cmdWFRtm_PcommAdd.Tag
  LoadBtnPictures cmdWFRtm_PcommEdit, cmdWFRtm_PcommEdit.Tag
  LoadBtnPictures cmdWFRtm_PcommDel, cmdWFRtm_PcommDel.Tag
  LoadBtnPictures cmdWFRtm_PcommRef, cmdWFRtm_PcommRef.Tag
  LoadBtnPictures cmdWFRtm_PcommAcc, cmdWFRtm_PcommAcc.Tag
Item.WFRtm_Pcomm.filltree treeWFRtm_Pcomm
End Sub
Private Sub OnTabClick()

      treeWFRtm_Pcomm.Top = 40 * Screen.TwipsPerPixelX
      treeWFRtm_Pcomm.Left = 5 * Screen.TwipsPerPixelX
      treeWFRtm_Pcomm.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      treeWFRtm_Pcomm.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
End Sub
Public Sub OnClick(aItem As Object, Optional pForm As Object = Nothing)
  On Error Resume Next
  Set Item = aItem
  Set ParentForm = pForm
  OnTabClick
End Sub
Public Sub OnSave()
  
End Sub
Public Function IsChanged() As Boolean
  Dim m_IsChanged As Boolean
  On Error Resume Next
  
  IsChanged = m_IsChanged
End Function
Private Sub UserControl_Resize()
  On Error Resume Next
  pnlWFRtm_Pcomm.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
End Sub
Private Sub UserControl_Terminate()
  On Error Resume Next
  CloseClass
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

  RowItem.Person.Secure Item.SecureStyleid
  RowItem.Person.propagate
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
  RowItem.Client.propagate
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
    Set Obj = Item.Manager.GetInstanceObject(ID)
    If Not Obj Is Nothing Then
      Dim objGui As Object
      Set objGui = Item.Manager.GetInstanceGUI(Obj.ID)
      If objGui Is Nothing Then Exit Sub

       If StartMode = "AUTO" Then
        StartMode = ""
        Dim i As Long
        For i = 100 To 0 Step -10
          If Obj.MTZSession.CheckRight(Obj.SecureStyleid, Obj.TypeName & ":" & "M" & i) Then
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



