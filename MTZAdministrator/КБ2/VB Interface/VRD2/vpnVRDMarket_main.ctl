VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.UserControl vpnVRDMarket_main 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerVRDMarket 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlVRDMarket 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdVRDMarketAcc 
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
      Begin VB.CommandButton cmdVRDMarketRef 
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
      Begin VB.CommandButton cmdVRDMarketDel 
         Enabled         =   0   'False
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
      Begin VB.CommandButton cmdVRDMarketEdit 
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
      Begin VB.CommandButton cmdVRDMarketAdd 
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
      Begin VB.CommandButton cmdVRDMarketAddRoot 
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
      Begin MSComctlLib.TreeView treeVRDMarket 
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
   Begin VB.Menu mnuPopupVRDMarket 
      Caption         =   "Меню для Рынки"
      Visible         =   0   'False
      Begin VB.Menu mnuVRDMarketAddRoot 
         Caption         =   "Создать ветку"
      End
      Begin VB.Menu mnuVRDMarketAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuVRDMarketEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuVRDMarketDelete 
         Caption         =   "Удалить"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuVRDMarketS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuVRDMarketBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuVRDMarketCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuVRDMarketCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuVRDMarketPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuVRDMarketCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuVRDMarketCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuVRDMarketRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuVRDMarketAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnVRDMarket_main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private menuActionVRDMarket As String





Private Sub cmdVRDMarketAdd_Click()
  On Error Resume Next
  On Error Resume Next
  Dim f As Object, p As Object
If (treeVRDMarket.SelectedItem Is Nothing) Then Exit Sub
  Set p = Item.FindRowObject("VRDMarket", Left(treeVRDMarket.SelectedItem.Key, 38))
  Set f = p.VRDMarket.Add()

      Set frmVRDMarket_main.Item = f
again:       frmVRDMarket_main.NotFirstTime = False
      frmVRDMarket_main.OnInit
      frmVRDMarket_main.Show vbModal
      If frmVRDMarket_main.OK Then
        err.Clear
        f.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
          If treeVRDMarket.SelectedItem.Child.Tag <> "ToDelete" Then
            f.LoadToTree treeVRDMarket, treeVRDMarket.SelectedItem.Key
          End If
          Set treeVRDMarket.SelectedItem = treeVRDMarket.Nodes.Item(f.ID & "VRDMarket")
      Else
        Item.VRDMarket.Delete f.ID
        Item.VRDMarket.Remove f.ID
      End If
End Sub

Private Sub cmdVRDMarketAddRoot_Click()
  On Error Resume Next
Dim f As Object, p As Object
  Set f = Item.VRDMarket.Add()

      Set frmVRDMarket_main.Item = f
again:       frmVRDMarket_main.NotFirstTime = False
      frmVRDMarket_main.OnInit
      frmVRDMarket_main.Show vbModal
      If frmVRDMarket_main.OK Then
        err.Clear
        f.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
    Item.VRDMarket.Refresh
    treeVRDMarket.Nodes.Clear
    Item.VRDMarket.filltree treeVRDMarket
          Set treeVRDMarket.SelectedItem = treeVRDMarket.Nodes.Item(f.ID & "VRDMarket")
      Else
        Item.VRDMarket.Remove f.ID
      End If
End Sub

Private Sub cmdVRDMarketEdit_Click()
  On Error Resume Next
  Dim f As Object
  If treeVRDMarket.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("VRDMarket", Left(treeVRDMarket.SelectedItem.Key, 38))
  Set frmVRDMarket_main.Item = f
again:   frmVRDMarket_main.NotFirstTime = False
  frmVRDMarket_main.OnInit
  frmVRDMarket_main.Show vbModal
  If frmVRDMarket_main.OK Then
    err.Clear
    f.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
  End If
End Sub

Private Sub cmdVRDMarketDel_Click()
  On Error Resume Next
End Sub

Private Sub cmdVRDMarketAcc_Click()
  On Error Resume Next
  Dim f As Object
  If treeVRDMarket.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("VRDMarket", Left(treeVRDMarket.SelectedItem.Key, 38))
  Item.Application.Manager.ShowSecurityDialog f
End Sub

Private Sub cmdVRDMarketREf_Click()
  On Error Resume Next
  Item.VRDMarket.Refresh
  treeVRDMarket.Nodes.Clear
  Item.VRDMarket.filltree treeVRDMarket
End Sub

Private Sub treeVRDMarket_DblClick()
If treeVRDMarket.SelectedItem Is Nothing Then Exit Sub
  cmdVRDMarketEdit_Click
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub treeVRDMarket_Expand(ByVal Node As MSComctlLib.Node)
If Node.Child.Tag = "ToDelete" Then
 ParentForm.MousePointer = vbHourglass
 treeVRDMarket.Nodes.Remove Node.Child.Index
 Dim f As Object
 Set f = Item.FindRowObject("VRDMarket", Left(Node.Key, 38))
 f.expandpart treeVRDMarket, Node.Key
 ParentForm.MousePointer = vbNormal
End If
End Sub

Private Sub treeVRDMarket_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupVRDMarket
End If
End Sub
Private Sub mnuVRDMarketAddRoot_click()
   menuActionVRDMarket = "ADDROOT"
   menuTimerVRDMarket.Enabled = True
End Sub
Private Sub mnuVRDMarketAdd_click()
   menuActionVRDMarket = "ADD"
   menuTimerVRDMarket.Enabled = True
End Sub
Private Sub mnuVRDMarketEdit_click()
   menuActionVRDMarket = "EDIT"
   menuTimerVRDMarket.Enabled = True
End Sub
Private Sub mnuVRDMarketDelete_click()
   menuActionVRDMarket = "DEL"
   menuTimerVRDMarket.Enabled = True
End Sub
  Private Sub mnuVRDMarketCOPY_Click()
    On Error Resume Next
    If treeVRDMarket.SelectedItem Is Nothing Then Exit Sub
        Dim u As Object
        Set u = Item.FindRowObject("VRDMarket", Left(treeVRDMarket.SelectedItem.Key, 38))
        SaveToBuffer u
  End Sub
  Private Sub mnuVRDMarketCUT_Click()
    On Error Resume Next
    If treeVRDMarket.SelectedItem Is Nothing Then Exit Sub
    Dim u As Object, BM
    Set u = Item.FindRowObject("VRDMarket", Left(treeVRDMarket.SelectedItem.Key, 38))
    SaveToBuffer u
    Set BM = u.Parent
    u.Parent.Delete u.ID
    treeVRDMarket.Nodes.Remove treeVRDMarket.SelectedItem.Key
  End Sub
Private Sub mnuVRDMarketPASTE_Click()
On Error Resume Next
If treeVRDMarket.SelectedItem Is Nothing Then Exit Sub
  Dim u As Object, f As Object
  Set f = Item.FindRowObject("VRDMarket", Left(treeVRDMarket.SelectedItem.Key, 38))
  Set u = f.VRDMarket.Add()
  If GetFromBuffer(u) Then
    If treeVRDMarket.SelectedItem.Child.Tag <> "ToDelete" Then
      u.LoadToTree treeVRDMarket, treeVRDMarket.SelectedItem.Key
    End If
  Else
   f.VRDMarket.Refresh
  End If
End Sub
Private Sub mnuVRDMarketCHANGE_Click()
  On Error Resume Next
  If treeVRDMarket.SelectedItem Is Nothing Then Exit Sub
  Dim u As Object, BM
  Set u = Item.FindRowObject("VRDMarket", Left(treeVRDMarket.SelectedItem.Key, 38))
  If GetFromBuffer(u) Then
    treeVRDMarket.SelectedItem.Text = u.Brief
      treeVRDMarket.SelectedItem.Expanded = False
      While treeVRDMarket.SelectedItem.Children > 0
        treeVRDMarket.Nodes.Remove treeVRDMarket.SelectedItem.Child.Key
      Wend
      treeVRDMarket.Nodes.Add(treeVRDMarket.SelectedItem.Key, 4, "Expanding ...").Tag = "ToDelete"
      treeVRDMarket_Expand treeVRDMarket.SelectedItem
  End If
End Sub
  Private Sub mnuVRDMarketCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuVRDMarketRef_click()
   menuActionVRDMarket = "REF"
   menuTimerVRDMarket.Enabled = True
End Sub
Private Sub mnuVRDMarketAcc_click()
   menuActionVRDMarket = "ACC"
   menuTimerVRDMarket.Enabled = True
End Sub
Private Sub menuTimerVRDMarket_timer()
   menuTimerVRDMarket.Enabled = False
   If menuActionVRDMarket = "ADDROOT" Then cmdVRDMarketAddRoot_Click
   If menuActionVRDMarket = "ADD" Then cmdVRDMarketAdd_Click
   If menuActionVRDMarket = "EDIT" Then cmdVRDMarketEdit_Click
   If menuActionVRDMarket = "DEL" Then cmdVRDMarketDel_Click
   If menuActionVRDMarket = "REF" Then cmdVRDMarketREf_Click
   If menuActionVRDMarket = "ACC" Then cmdVRDMarketAcc_Click
   menuActionVRDMarket = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdVRDMarketAddRoot, cmdVRDMarketAddRoot.Tag
  LoadBtnPictures cmdVRDMarketAdd, cmdVRDMarketAdd.Tag
  LoadBtnPictures cmdVRDMarketEdit, cmdVRDMarketEdit.Tag
  LoadBtnPictures cmdVRDMarketDel, cmdVRDMarketDel.Tag
  LoadBtnPictures cmdVRDMarketRef, cmdVRDMarketRef.Tag
  LoadBtnPictures cmdVRDMarketAcc, cmdVRDMarketAcc.Tag
Item.VRDMarket.filltree treeVRDMarket
End Sub
Private Sub OnTabClick()

      treeVRDMarket.Top = 40 * Screen.TwipsPerPixelX
      treeVRDMarket.Left = 5 * Screen.TwipsPerPixelX
      treeVRDMarket.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      treeVRDMarket.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlVRDMarket.Move 0, 0, UserControl.Width, UserControl.Height
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
On Error Resume Next

'do nothing
End Sub



'Передать права объекту контактное лицо от объекта клиент
'{79DED4FD-045C-45F8-AC79-2E5A3D956D97}
Private Sub Run_VBMigrateRight(Optional RowItem As Object)
On Error Resume Next

'Migrate security
On Error GoTo bye
  If RowItem.Person Is Nothing Then Exit Sub

  RowItem.Person.Secure Item.SecureStyleid
  RowItem.Person.Propagate
bye:
  Exit Sub
  MsgBox err.Description, vbOKOnly + vbCritical, "Установка стиля защиты"
End Sub



'Применить стиль защиты для объекта Предназначен для каталога клиентов
'{31EC6CF7-8DBD-4EFE-BF12-4D168F653D34}
Private Sub Run_VBApplySecurity(Optional RowItem As Object)
On Error Resume Next

'Apply security
On Error GoTo bye
  If RowItem.Client Is Nothing Then Exit Sub
  If RowItem.Parent.Parent.AccessLevel Is Nothing Then Exit Sub
  RowItem.Client.Secure RowItem.Parent.Parent.AccessLevel.ID
  RowItem.Client.Propagate
  Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Установка стиля защиты"
End Sub



'Создание отчета из разных карточек
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
'  ID = CreateGUID2
 'Call RowItem.Application.Manager.NewInstance(ID, "VRRPT2", "Отчет " & Date)
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
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание отчета"
End Sub



'Создать новую оплату из клиента
'{42A1A436-8AA2-4F1F-999B-6680DFF514DE}
Private Sub Run_VBNewPayIn(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2P", "Платеж " & Date)
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
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание Платежа"
End Sub



'Создать новый платеж из клиента
'{2BB30818-90ED-4627-8ABB-85B3FBA46750}
Private Sub Run_VBNewPayOut(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2O", "Оплата " & Date)
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
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание Платежа"
End Sub



'открытие карточки по идентификатору
'{94E8F6DB-106A-44DC-9483-86C801798FF0}
Private Sub Run_VBOpenRef(StartMode As Variant, ID As Variant, Optional RowItem As Object)
On Error Resume Next

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

On Error Resume Next
Item.Name = RowItem.Description
ParentForm.Caption = Item.Name
Item.Save
End Sub



'
'{D8914FB4-6B5D-491A-A72F-985617727583}
Private Sub Run_WFFuncName(Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
Item.Name = RowItem.Name
ParentForm.Caption = Item.Name
Item.Save
End Sub



'Изменить название объекта
'{4FB59D1A-0123-47D3-9F4F-E12085C5D074}
Private Sub Run_VBUpdateItemName(Name As Variant, Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
Item.Name = Name
' может не быть формы, если используем просто ActiveX
ParentForm.Caption = Item.Name
Item.Save
End Sub



'Создать заявку из клиента
'{49EA5CBF-93CF-41A8-B1F1-E37FE4D59EA5}
Private Sub Run_VBNewZayavka(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2Z", "Заявка " & Date)
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
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание Заявки"
End Sub





