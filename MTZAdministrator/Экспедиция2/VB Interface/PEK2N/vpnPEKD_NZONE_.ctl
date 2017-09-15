VERSION 5.00
Begin VB.UserControl vpnPEKD_NZONE_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Frame pnlPEKD_NZONE 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdPEKD_NZONECfg 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   4
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdPEKD_NZONERef 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   3
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdPEKD_NZONESave 
         Enabled         =   0   'False
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   2
         Tag             =   "SAVE.ico"
         ToolTipText     =   "Сохранить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin PEK2NGUI.PEKD_NZONE editPEKD_NZONE 
         Height          =   480
         Left            =   3900
         TabIndex        =   1
         Top             =   2760
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
      End
   End
End
Attribute VB_Name = "vpnPEKD_NZONE_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean





Private Sub opPEKD_NZONE_UpdateItemName_(RowItem As Object)
With RowItem
Run_VBUpdateItemName Name:="Номера ППО для" & .dept.Brief & " на " & .theMonth & "  " & .TheYear & " года ", RowItem:=RowItem
End With
End Sub
Private Sub cmdPEKD_NZONERef_Click()
  On Error Resume Next
  Item.PEKD_NZONE.Refresh
  cmdPEKD_NZONEAdd_Click
End Sub
Private Sub cmdPEKD_NZONECfg_Click()
    On Error Resume Next
    editPEKD_NZONE.Customize
    Dim ff As Long
    ff = FreeFile
    Open GetSetting("MTZ", "CONFIG", "LAYOUTS", "c:\") & "PEK2N_editPEKD_NZONE_" For Output As #ff
    Print #ff, editPEKD_NZONE.PanelCustomisationString
    Close #ff
End Sub
Private Sub cmdPEKD_NZONEAdd_Click()
  On Error Resume Next
 Dim u As Object
 If Item.PEKD_NZONE.Count = 0 Then
   Set u = Item.PEKD_NZONE.Add


u.TheYear = Year(Now)

 End If
 Set editPEKD_NZONE.Item = Item.PEKD_NZONE.Item(1)
 editPEKD_NZONE.InitPanel
 cmdPEKD_NZONESave.Enabled = True
End Sub
Private Sub cmdPEKD_NZONEDel_Click()
  On Error Resume Next
  If editPEKD_NZONE.Item Is Nothing Then Exit Sub
  If MsgBox("Удалить элемент" & vbCrLf & editPEKD_NZONE.Item.Brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
    On Error GoTo bye
    editPEKD_NZONE.Item.Parent.Delete editPEKD_NZONE.Item.ID
    cmdPEKD_NZONESave.Enabled = False
    editPEKD_NZONE.Enabled = False
    Set editPEKD_NZONE.Item = Nothing
  End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub
Private Sub editPEKD_NZONE_Changed()
 cmdPEKD_NZONESave.Enabled = True
End Sub
Public Function IsOK() As Boolean
    If editPEKD_NZONE.IsOK Then
        IsOK = True
    End If
End Function
Private Sub cmdPEKD_NZONESave_Click()
  On Error Resume Next
    If editPEKD_NZONE.IsOK Then
    MousePointer = vbHourglass
    editPEKD_NZONE.Save
  On Error GoTo bye
    editPEKD_NZONE.Item.Save
    MousePointer = vbNormal
        opPEKD_NZONE_UpdateItemName_ editPEKD_NZONE.Item
    cmdPEKD_NZONESave.Enabled = False
    Else
      MsgBox "Не все обязательные поля заполнены", vbOKOnly + vbExclamation
    End If
Exit Sub
bye:
    MousePointer = vbNormal
   MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
  'editPEKD_NZONE.item.REFRESH
  'editPEKD_NZONE.InitPanel
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdPEKD_NZONESave, cmdPEKD_NZONESave.Tag
  LoadBtnPictures cmdPEKD_NZONERef, cmdPEKD_NZONERef.Tag
  LoadBtnPictures cmdPEKD_NZONECfg, cmdPEKD_NZONECfg.Tag
  Dim ff As Long, buf As String
  ff = FreeFile
  On Error Resume Next
  Open GetSetting("MTZ", "CONFIG", "LAYOUTS", App.Path & "\LAYOUTS\") & "PEK2N_editPEKD_NZONE_" For Input As #ff
  buf = ""
  buf = Input(LOF(ff), ff)
  Close #ff
  If buf <> "" Then editPEKD_NZONE.PanelCustomisationString = buf
  cmdPEKD_NZONEAdd_Click
End Sub
Private Sub OnTabClick()

      editPEKD_NZONE.Top = 40 * Screen.TwipsPerPixelX
      editPEKD_NZONE.Left = 5 * Screen.TwipsPerPixelX
      editPEKD_NZONE.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      editPEKD_NZONE.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
End Sub
Public Sub OnClick(aItem As Object, Optional pForm As Object = Nothing)
  On Error Resume Next
  Set Item = aItem
  Set ParentForm = pForm
  OnTabClick
End Sub
Public Sub OnSave()
  
  editPEKD_NZONE.Save
If editPEKD_NZONE.Item.Changed Then
  editPEKD_NZONE.Item.Save
End If
End Sub
Public Function IsChanged() As Boolean
  Dim m_IsChanged As Boolean
  On Error Resume Next
  
 m_IsChanged = m_IsChanged Or editPEKD_NZONE.IsChanged
  IsChanged = m_IsChanged
End Function
Private Sub UserControl_Resize()
  On Error Resume Next
  pnlPEKD_NZONE.Move 0, 0, UserControl.Width, UserControl.Height
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





