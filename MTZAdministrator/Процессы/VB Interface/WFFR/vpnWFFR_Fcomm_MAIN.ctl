VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.UserControl vpnWFFR_Fcomm_MAIN 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerWFFR_Fcomm 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlWFFR_Fcomm 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdWFFR_FcommAcc 
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
      Begin VB.CommandButton cmdWFFR_FcommRef 
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
      Begin VB.CommandButton cmdWFFR_FcommDel 
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
      Begin VB.CommandButton cmdWFFR_FcommEdit 
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
      Begin VB.CommandButton cmdWFFR_FcommAdd 
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
      Begin VB.CommandButton cmdWFFR_FcommAddRoot 
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
      Begin MSComctlLib.TreeView treeWFFR_Fcomm 
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
         Sorted          =   -1  'True
         Style           =   7
         Appearance      =   1
      End
   End
   Begin VB.Menu mnuPopupWFFR_Fcomm 
      Caption         =   "Меню для Комментарии"
      Visible         =   0   'False
      Begin VB.Menu mnuWFFR_FcommAddRoot 
         Caption         =   "Создать ветку"
      End
      Begin VB.Menu mnuWFFR_FcommAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFFR_FcommEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFFR_FcommDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFFR_FcommS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFFR_FcommBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFFR_FcommCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFFR_FcommCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFFR_FcommPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFFR_FcommCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFFR_FcommCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFFR_FcommRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFFR_FcommAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnWFFR_Fcomm_MAIN"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private menuActionWFFR_Fcomm As String





Private Sub cmdWFFR_FcommAdd_Click()
  On Error Resume Next
  On Error Resume Next
  Dim f As Object, p As Object
If (treeWFFR_Fcomm.SelectedItem Is Nothing) Then Exit Sub
  Set p = Item.FindRowObject("WFFR_Fcomm", Left(treeWFFR_Fcomm.SelectedItem.Key, 38))
  Set f = p.WFFR_Fcomm.Add()

      Set frmWFFR_Fcomm_MAIN.Item = f
again:       frmWFFR_Fcomm_MAIN.NotFirstTime = False
      frmWFFR_Fcomm_MAIN.OnInit
      frmWFFR_Fcomm_MAIN.Show vbModal
      If frmWFFR_Fcomm_MAIN.OK Then
        Err.Clear
        f.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
          If treeWFFR_Fcomm.SelectedItem.Child.Tag <> "ToDelete" Then
            f.LoadToTree treeWFFR_Fcomm, treeWFFR_Fcomm.SelectedItem.Key
          End If
          Set treeWFFR_Fcomm.SelectedItem = treeWFFR_Fcomm.Nodes.Item(f.ID & "WFFR_Fcomm")
      Else
        Item.WFFR_Fcomm.Delete f.ID
        Item.WFFR_Fcomm.Remove f.ID
      End If
End Sub

Private Sub cmdWFFR_FcommAddRoot_Click()
  On Error Resume Next
Dim f As Object, p As Object
  Set f = Item.WFFR_Fcomm.Add()

      Set frmWFFR_Fcomm_MAIN.Item = f
again:       frmWFFR_Fcomm_MAIN.NotFirstTime = False
      frmWFFR_Fcomm_MAIN.OnInit
      frmWFFR_Fcomm_MAIN.Show vbModal
      If frmWFFR_Fcomm_MAIN.OK Then
        Err.Clear
        f.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
    Item.WFFR_Fcomm.Refresh
    treeWFFR_Fcomm.Nodes.Clear
    Item.WFFR_Fcomm.filltree treeWFFR_Fcomm
          Set treeWFFR_Fcomm.SelectedItem = treeWFFR_Fcomm.Nodes.Item(f.ID & "WFFR_Fcomm")
      Else
        Item.WFFR_Fcomm.Remove f.ID
      End If
End Sub

Private Sub cmdWFFR_FcommEdit_Click()
  On Error Resume Next
  Dim f As Object
  If treeWFFR_Fcomm.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("WFFR_Fcomm", Left(treeWFFR_Fcomm.SelectedItem.Key, 38))
  Set frmWFFR_Fcomm_MAIN.Item = f
again:   frmWFFR_Fcomm_MAIN.NotFirstTime = False
  frmWFFR_Fcomm_MAIN.OnInit
  frmWFFR_Fcomm_MAIN.Show vbModal
  If frmWFFR_Fcomm_MAIN.OK Then
    Err.Clear
    f.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
  End If
End Sub

Private Sub cmdWFFR_FcommDel_Click()
  On Error Resume Next
  Dim f As Object
  If treeWFFR_Fcomm.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("WFFR_Fcomm", Left(treeWFFR_Fcomm.SelectedItem.Key, 38))
  If MsgBox("Удалить элемент" & vbCrLf & f.brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
  On Error GoTo bye
     If f.Parent.Delete(f.ID) Then
       treeWFFR_Fcomm.Nodes.Remove treeWFFR_Fcomm.SelectedItem.Key
     End If
  End If
Exit Sub
bye:
MsgBox Err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub

Private Sub cmdWFFR_FcommAcc_Click()
  On Error Resume Next
  Dim f As Object
  If treeWFFR_Fcomm.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("WFFR_Fcomm", Left(treeWFFR_Fcomm.SelectedItem.Key, 38))
  Item.Application.Manager.ShowSecurityDialog f
End Sub

Private Sub cmdWFFR_FcommREf_Click()
  On Error Resume Next
  Item.WFFR_Fcomm.Refresh
  treeWFFR_Fcomm.Nodes.Clear
  Item.WFFR_Fcomm.filltree treeWFFR_Fcomm
End Sub

Private Sub treeWFFR_Fcomm_DblClick()
If treeWFFR_Fcomm.SelectedItem Is Nothing Then Exit Sub
  cmdWFFR_FcommEdit_Click
End Sub
Private Sub treeWFFR_Fcomm_Expand(ByVal Node As MSComctlLib.Node)
If Node.Child.Tag = "ToDelete" Then
 ParentForm.MousePointer = vbHourglass
 treeWFFR_Fcomm.Nodes.Remove Node.Child.Index
 Dim f As Object
 Set f = Item.FindRowObject("WFFR_Fcomm", Left(Node.Key, 38))
 f.expandpart treeWFFR_Fcomm, Node.Key
 ParentForm.MousePointer = vbNormal
End If
End Sub

Private Sub treeWFFR_Fcomm_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupWFFR_Fcomm
End If
End Sub
Private Sub mnuWFFR_FcommAddRoot_click()
   menuActionWFFR_Fcomm = "ADDROOT"
   menuTimerWFFR_Fcomm.Enabled = True
End Sub
Private Sub mnuWFFR_FcommAdd_click()
   menuActionWFFR_Fcomm = "ADD"
   menuTimerWFFR_Fcomm.Enabled = True
End Sub
Private Sub mnuWFFR_FcommEdit_click()
   menuActionWFFR_Fcomm = "EDIT"
   menuTimerWFFR_Fcomm.Enabled = True
End Sub
Private Sub mnuWFFR_FcommDelete_click()
   menuActionWFFR_Fcomm = "DEL"
   menuTimerWFFR_Fcomm.Enabled = True
End Sub
  Private Sub mnuWFFR_FcommCOPY_Click()
    On Error Resume Next
    If treeWFFR_Fcomm.SelectedItem Is Nothing Then Exit Sub
        Dim u As Object
        Set u = Item.FindRowObject("WFFR_Fcomm", Left(treeWFFR_Fcomm.SelectedItem.Key, 38))
        SaveToBuffer u
  End Sub
  Private Sub mnuWFFR_FcommCUT_Click()
    On Error Resume Next
    If treeWFFR_Fcomm.SelectedItem Is Nothing Then Exit Sub
    Dim u As Object, BM
    Set u = Item.FindRowObject("WFFR_Fcomm", Left(treeWFFR_Fcomm.SelectedItem.Key, 38))
    SaveToBuffer u
    Set BM = u.Parent
    u.Parent.Delete u.ID
    treeWFFR_Fcomm.Nodes.Remove treeWFFR_Fcomm.SelectedItem.Key
  End Sub
Private Sub mnuWFFR_FcommPASTE_Click()
On Error Resume Next
If treeWFFR_Fcomm.SelectedItem Is Nothing Then Exit Sub
  Dim u As Object, f As Object
  Set f = Item.FindRowObject("WFFR_Fcomm", Left(treeWFFR_Fcomm.SelectedItem.Key, 38))
  Set u = f.WFFR_Fcomm.Add()
  If GetFromBuffer(u) Then
    If treeWFFR_Fcomm.SelectedItem.Child.Tag <> "ToDelete" Then
      u.LoadToTree treeWFFR_Fcomm, treeWFFR_Fcomm.SelectedItem.Key
    End If
  Else
   f.WFFR_Fcomm.Refresh
  End If
End Sub
Private Sub mnuWFFR_FcommCHANGE_Click()
  On Error Resume Next
  If treeWFFR_Fcomm.SelectedItem Is Nothing Then Exit Sub
  Dim u As Object, BM
  Set u = Item.FindRowObject("WFFR_Fcomm", Left(treeWFFR_Fcomm.SelectedItem.Key, 38))
  If GetFromBuffer(u) Then
    treeWFFR_Fcomm.SelectedItem.Text = u.brief
      treeWFFR_Fcomm.SelectedItem.Expanded = False
      While treeWFFR_Fcomm.SelectedItem.Children > 0
        treeWFFR_Fcomm.Nodes.Remove treeWFFR_Fcomm.SelectedItem.Child.Key
      Wend
      treeWFFR_Fcomm.Nodes.Add(treeWFFR_Fcomm.SelectedItem.Key, 4, "Expanding ...").Tag = "ToDelete"
      treeWFFR_Fcomm_Expand treeWFFR_Fcomm.SelectedItem
  End If
End Sub
  Private Sub mnuWFFR_FcommCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFFR_FcommRef_click()
   menuActionWFFR_Fcomm = "REF"
   menuTimerWFFR_Fcomm.Enabled = True
End Sub
Private Sub mnuWFFR_FcommAcc_click()
   menuActionWFFR_Fcomm = "ACC"
   menuTimerWFFR_Fcomm.Enabled = True
End Sub
Private Sub menuTimerWFFR_Fcomm_timer()
   menuTimerWFFR_Fcomm.Enabled = False
   If menuActionWFFR_Fcomm = "ADDROOT" Then cmdWFFR_FcommAddRoot_Click
   If menuActionWFFR_Fcomm = "ADD" Then cmdWFFR_FcommAdd_Click
   If menuActionWFFR_Fcomm = "EDIT" Then cmdWFFR_FcommEdit_Click
   If menuActionWFFR_Fcomm = "DEL" Then cmdWFFR_FcommDel_Click
   If menuActionWFFR_Fcomm = "REF" Then cmdWFFR_FcommREf_Click
   If menuActionWFFR_Fcomm = "ACC" Then cmdWFFR_FcommAcc_Click
   menuActionWFFR_Fcomm = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdWFFR_FcommAddRoot, cmdWFFR_FcommAddRoot.Tag
  LoadBtnPictures cmdWFFR_FcommAdd, cmdWFFR_FcommAdd.Tag
  LoadBtnPictures cmdWFFR_FcommEdit, cmdWFFR_FcommEdit.Tag
  LoadBtnPictures cmdWFFR_FcommDel, cmdWFFR_FcommDel.Tag
  LoadBtnPictures cmdWFFR_FcommRef, cmdWFFR_FcommRef.Tag
  LoadBtnPictures cmdWFFR_FcommAcc, cmdWFFR_FcommAcc.Tag
Item.WFFR_Fcomm.filltree treeWFFR_Fcomm
End Sub
Private Sub OnTabClick()

      treeWFFR_Fcomm.Top = 40 * Screen.TwipsPerPixelX
      treeWFFR_Fcomm.Left = 5 * Screen.TwipsPerPixelX
      treeWFFR_Fcomm.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      treeWFFR_Fcomm.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlWFFR_Fcomm.Move 0, 0, UserControl.Width, UserControl.Height
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
  RowItem.Person.Propagate
bye:
  Exit Sub
  MsgBox Err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Применить стиль защиты для объекта Предназначен для каталога клиентов
'{31EC6CF7-8DBD-4EFE-BF12-4D168F653D34}
Private Sub Run_VBApplySecurity(Optional RowItem As Object)
'Apply security
On Error GoTo bye
  If RowItem.Client Is Nothing Then Exit Sub
  If RowItem.Parent.Parent.AccessLevel Is Nothing Then Exit Sub
  RowItem.Client.Secure RowItem.Parent.Parent.AccessLevel.ID
  RowItem.Client.Propagate
  Exit Sub
bye:
  MsgBox Err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Создание отчета из разных карточек
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
On Error GoTo bye
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

 Exit Sub
bye:
  MsgBox Err.Description, vbOKOnly + vbCritical, "Создание отчета"
End Sub



'Создать новую оплату из клиента
'{42A1A436-8AA2-4F1F-999B-6680DFF514DE}
Private Sub Run_VBNewPayIn(Optional RowItem As Object)
On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEKP", "Платеж " & Date)
 Set RowItem.TheDocument = RowItem.Application.Manager.GetInstanceObject(ID)

 If RowItem.TheDocument.PEKP_DEF.Count = 0 Then
  Set Obj = RowItem.TheDocument.PEKP_DEF.Add
 Else
  Set Obj = RowItem.TheDocument.PEKP_DEF.Item(1)
 End If
 
 Set Obj.FromClient = RowItem.Application
 Obj.PLPDate = Date
 Obj.Save
 RowItem.Save

 Exit Sub
bye:
  MsgBox Err.Description, vbOKOnly + vbCritical, "Создание Платежа"
End Sub



'Создать новый платеж из клиента
'{2BB30818-90ED-4627-8ABB-85B3FBA46750}
Private Sub Run_VBNewPayOut(Optional RowItem As Object)
On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEKO", "Оплата " & Date)
 Set RowItem.TheDocument = RowItem.Application.Manager.GetInstanceObject(ID)

 If RowItem.TheDocument.PEKO_DEF.Count = 0 Then
  Set Obj = RowItem.TheDocument.PEKO_DEF.Add
 Else
  Set Obj = RowItem.TheDocument.PEKO_DEF.Item(1)
 End If
 
 Set Obj.ToClient = RowItem.Application
 Obj.PLPDate = Date
 Obj.Save
 RowItem.Save

 Exit Sub
bye:
  MsgBox Err.Description, vbOKOnly + vbCritical, "Создание Платежа"
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
On Error Resume Next
Item.Name = RowItem.Description
ParentForm.Caption = Item.Name
Item.Save
End Sub



'
'{D8914FB4-6B5D-491A-A72F-985617727583}
Private Sub Run_WFFuncName(Optional RowItem As Object)
On Error Resume Next
Item.Name = RowItem.Name
ParentForm.Caption = Item.Name
Item.Save
End Sub



'Изменить название объекта
'{4FB59D1A-0123-47D3-9F4F-E12085C5D074}
Private Sub Run_VBUpdateItemName(Name As Variant, Optional RowItem As Object)
On Error Resume Next
Item.Name = Name
' может не быть формы, если используем просто ActiveX
ParentForm.Caption = Item.Name
Item.Save
End Sub



'Создать заявку из клиента
'{49EA5CBF-93CF-41A8-B1F1-E37FE4D59EA5}
Private Sub Run_VBNewZayavka(Optional RowItem As Object)
On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEKZ", "Заявка " & Date)
 Set RowItem.TheDocument = RowItem.Application.Manager.GetInstanceObject(ID)

 If RowItem.TheDocument.PEKO_DEF.Count = 0 Then
  Set Obj = RowItem.TheDocument.PEKZ_DEF.Add
 Else
  Set Obj = RowItem.TheDocument.PEKZ_DEF.Item(1)
 End If
 
 Set Obj.ClientFrom = RowItem.Application
 Obj.QueryDate = Date
 Obj.Save
 RowItem.Save

 Exit Sub
bye:
  MsgBox Err.Description, vbOKOnly + vbCritical, "Создание Заявки"
End Sub





