VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Begin VB.Form frmMain 
   Caption         =   " Задания и процессы"
   ClientHeight    =   7380
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9960
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   7380
   ScaleWidth      =   9960
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   10000
      Left            =   7200
      Top             =   120
   End
   Begin MSComctlLib.ImageList ImageList3 
      Left            =   6360
      Top             =   600
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483648
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      UseMaskColor    =   0   'False
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   2
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0442
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0894
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Frame pnlProcessList 
      BorderStyle     =   0  'None
      Height          =   2775
      Left            =   4200
      TabIndex        =   3
      Top             =   3480
      Width           =   5775
      Begin VB.CommandButton cmdGO 
         Caption         =   "Запуск"
         Height          =   375
         Left            =   2160
         TabIndex        =   11
         Top             =   120
         Width           =   975
      End
      Begin VB.CommandButton cmdNewPrc 
         Caption         =   "Создать"
         Height          =   375
         Left            =   0
         TabIndex        =   10
         Top             =   120
         Width           =   975
      End
      Begin VB.CommandButton cmdStopPrc 
         Caption         =   "Завершить"
         Height          =   375
         Left            =   4440
         TabIndex        =   9
         Top             =   120
         Width           =   1215
      End
      Begin VB.CommandButton cmdDebugPrc 
         Caption         =   "Отладка"
         Height          =   375
         Left            =   3240
         TabIndex        =   8
         Top             =   120
         Width           =   1095
      End
      Begin VB.CommandButton cmdOpenPrc 
         Caption         =   "Открыть"
         Height          =   375
         Left            =   1080
         TabIndex        =   5
         Top             =   120
         Width           =   975
      End
      Begin GridEX20.GridEX grdPrcList 
         Height          =   2175
         Left            =   0
         TabIndex        =   4
         Top             =   600
         Width           =   4935
         _ExtentX        =   8705
         _ExtentY        =   3836
         Version         =   "2.0"
         RecordNavigatorString=   ""
         BoundColumnIndex=   ""
         ReplaceColumnIndex=   ""
         CalendarTodayText=   "Сегодня"
         CalendarNoneText=   "Пусто"
         MethodHoldFields=   -1  'True
         GroupByBoxInfoText=   ""
         DataMode        =   99
         ColumnHeaderHeight=   285
         IntProp1        =   0
         IntProp2        =   0
         IntProp7        =   0
         FormatStylesCount=   6
         FormatStyle(1)  =   "frmMain.frx":0CE6
         FormatStyle(2)  =   "frmMain.frx":0DC6
         FormatStyle(3)  =   "frmMain.frx":0F22
         FormatStyle(4)  =   "frmMain.frx":0FD2
         FormatStyle(5)  =   "frmMain.frx":1086
         FormatStyle(6)  =   "frmMain.frx":115E
         ImageCount      =   0
         PrinterProperties=   "frmMain.frx":1216
      End
   End
   Begin VB.Frame pnlTaskList 
      BorderStyle     =   0  'None
      Height          =   2775
      Left            =   120
      TabIndex        =   1
      Top             =   3480
      Width           =   3855
      Begin VB.CommandButton cmdStopTask 
         Caption         =   "Завершить"
         Height          =   375
         Left            =   1200
         TabIndex        =   7
         Top             =   120
         Width           =   1215
      End
      Begin VB.CommandButton cmdOpenTask 
         Caption         =   "Открыть"
         Height          =   375
         Left            =   0
         TabIndex        =   6
         Top             =   120
         Width           =   1095
      End
      Begin GridEX20.GridEX grdTaskList 
         Height          =   2055
         Left            =   0
         TabIndex        =   2
         Top             =   600
         Width           =   3615
         _ExtentX        =   6376
         _ExtentY        =   3625
         Version         =   "2.0"
         RecordNavigatorString=   ""
         BoundColumnIndex=   ""
         ReplaceColumnIndex=   ""
         CalendarTodayText=   "Сегодня"
         CalendarNoneText=   "Пусто"
         MethodHoldFields=   -1  'True
         GroupByBoxInfoText=   ""
         DataMode        =   99
         ColumnHeaderHeight=   285
         IntProp1        =   0
         IntProp2        =   0
         IntProp7        =   0
         FormatStylesCount=   6
         FormatStyle(1)  =   "frmMain.frx":13EE
         FormatStyle(2)  =   "frmMain.frx":14CE
         FormatStyle(3)  =   "frmMain.frx":162A
         FormatStyle(4)  =   "frmMain.frx":16DA
         FormatStyle(5)  =   "frmMain.frx":178E
         FormatStyle(6)  =   "frmMain.frx":1866
         ImageCount      =   0
         PrinterProperties=   "frmMain.frx":191E
      End
   End
   Begin MSComctlLib.TabStrip ts 
      Height          =   3135
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   5055
      _ExtentX        =   8916
      _ExtentY        =   5530
      ImageList       =   "ImageList3"
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   2
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Список заданий"
            Key             =   "tasklist"
            ImageVarType    =   2
            ImageIndex      =   1
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Процессы"
            Key             =   "processlist"
            ImageVarType    =   2
            ImageIndex      =   2
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub LoadFunctions()
  Dim rs As ADODB.Recordset
  Dim i As Long, j As Long, k As Long
  Dim fnc As WFRtm.WFRtm_func
  Dim dfnc As WFDEf.WFDef_func
  Dim wffd As wffd.Application
  Dim wkr As wffd.WFFD_Doer
  Dim grp As MTZUsers.Groups
  Dim gu As MTZUsers.GroupUser
  Dim wffr_fnc As wffr.WFFR_func
  
  Dim OK As Boolean
  Set funcCol = Nothing
  Set funcCol = New Collection
  
  'Set rs = Manager.ListInstances(Site, "WFRtm")
  ' сразу берем только активные процессы
  'Set rs = Session.GetRows("WFRtm_main", "", "", "ProcessState =2")
  
  Dim ID1 As String, ID2 As String, ID3 As String, ID4 As String
  Dim vStates
  
  
  ID1 = CreateGUID2()
  Call Session.TheFinder.FIND_IDS(ID1, "WFRtm_main", "ProcessState", OpEQ, 2)
  ID2 = CreateGUID2()
  Call Session.TheFinder.RowsToInstances("WFRtm_main", ID1, ID2)
  Call Session.TheFinder.DropResults(ID1)
  ' ID2 - идентификаторы активных процессов
  
  ID3 = CreateGUID2()
  vStates = Array(2, 6, 3, 4)
  Call Session.TheFinder.FIND_IDS(ID3, "wffr_func", "State", OpIN_NUMBERS, vStates)
  ID4 = CreateGUID2()
  Call Session.TheFinder.RowsToInstances("wffr_func", ID3, ID4)
  Call Session.TheFinder.DropResults(ID3)
  ' ID4 - идентификаторы активных функций
  
  ID1 = CreateGUID2()
  Call Session.TheFinder.FIND_IDS(ID1, "wfrtm_func", "func", OpIN_RESULT, ID4)
  Call Session.TheFinder.DropResults(ID4)
  Call Session.TheFinder.RowsToInstances("wfrtm_func", ID1, ID4)
  Call Session.TheFinder.DropResults(ID1)
  
  ' ID4 - идентификаторы процессов, содержащих активные функции
   
  ' строим пересечение
  Session.TheFinder.QR_AND_QR ID4, ID2, ID3
  Call Session.TheFinder.DropResults(ID4)
  Call Session.TheFinder.DropResults(ID2)
  
  Set rs = Session.TheFinder.GetResults(ID3)
  
  While Not rs.EOF
    Set Rtm = Manager.GetInstanceObject(rs!result, Site)
    Rtm.WFRtm_main.Refresh
    If Rtm.WFRtm_main.count = 1 Then
      If Rtm.WFRtm_main.Item(1).ProcessState = WFProcessState_Active Then
        Set Def = Rtm.WFRtm_main.Item(1).BasedOn
        Rtm.WFRtm_func.Refresh
        For i = 1 To Rtm.WFRtm_func.count
          Set fnc = Rtm.WFRtm_func.Item(i)
          Set wffr_fnc = fnc.Func.WFFR_func.Item(1)
          wffr_fnc.Refresh
          If _
            wffr_fnc.State = WFFuncState_Active Or _
            wffr_fnc.State = WFFuncState_InControl Or _
            wffr_fnc.State = WFFuncState_InWork Or _
            wffr_fnc.State = WFFuncState_Pause _
          Then
            OK = False
            Set dfnc = wffr_fnc.BasedOn
            Set wffd = dfnc.Func
            For j = 1 To wffd.WFFD_Doer.count
              Set wkr = wffd.WFFD_Doer.Item(j)
              Set grp = wkr.DoerGroup
              
              ' check user as  worker for function
              For k = 1 To grp.GroupUser.count
                Set gu = grp.GroupUser.Item(k)
                If gu.TheUser.ID = UserID Then
                  OK = True
                  Exit For
                End If
                
              Next
              If OK Then Exit For
            Next ' worker
            If OK Then
              funcCol.Add fnc, fnc.ID
            End If
          End If
        Next ' func
      End If
    End If
    rs.MoveNext
  Wend
  Call Session.TheFinder.DropResults(ID3)
End Sub


Private Sub cmdDebugPrc_Click()
  If grdPrcList.Row > 0 Then
    If grdPrcList.RowIndex(grdPrcList.Row) > 0 Then
      Set Rtm = processCol.Item(grdPrcList.RowIndex(grdPrcList.Row))
      If Rtm Is Nothing Then
        Set Rtm = processCol.Item(grdPrcList.RowIndex(grdPrcList.Row))
      End If
      Dim f As frmDebug
      Set f = New frmDebug
      Set f.DbgProcess = Rtm
      f.Init
      Timer1.Enabled = False
      f.Show vbModal
      Timer1_Timer
      Timer1.Enabled = True
      
    End If
  End If

End Sub

Private Sub cmdGO_Click()
  If grdPrcList.Row > 0 Then
    If grdPrcList.RowIndex(grdPrcList.Row) > 0 Then
      Set Rtm = processCol.Item(grdPrcList.RowIndex(grdPrcList.Row))
      If Rtm Is Nothing Then
        Set Rtm = processCol.Item(grdPrcList.RowIndex(grdPrcList.Row))
      End If
      Rtm.LockResource False
      If Rtm.IsLocked <> LockSession Then
        MsgBox "Процесс временно зблокирован", vbOKOnly, "Попробуйте еще раз"
        Set Rtm = Nothing
        Exit Sub
      End If
      If Rtm.WFRtm_main.Item(1).ProcessState = WFProcessState_Initial Then
        Rtm.WFRtm_main.Item(1).ProcessState = WFProcessState_Prepare
        Rtm.WFRtm_main.Item(1).Save
      End If
      Rtm.UnLockResource
    End If
  End If
End Sub

Private Sub cmdNewPrc_Click()
Dim n As String

frmNewPrc.Show vbModal
If frmNewPrc.OK Then
  n = frmNewPrc.txtName.Text
  frmNewPrc.IDCol.Item (frmNewPrc.CmbType.ListIndex + 1)
  
  Dim ID As String
  ID = CreateGUID2
  Call Session.NewInstance(ID, "WFRtm", n)
  Set Rtm = Manager.GetInstanceObject(ID)
  Rtm.Name = n
  Rtm.Save
  With Rtm.WFRtm_main.Add
    .Description = n
    .ProcessState = WFProcessState_Initial
    Set .BasedOn = frmNewPrc.IDCol.Item(frmNewPrc.CmbType.ListIndex + 1)
    .Save
  End With
  
End If
On Error Resume Next
Unload frmNewPrc
Timer1_Timer
End Sub

Private Sub cmdOpenPrc_Click()
  grdPrcList_DblClick
End Sub

Private Sub cmdOpenTask_Click()
  grdTaskList_DblClick
End Sub

Private Sub cmdStopPrc_Click()
  If grdPrcList.Row > 0 Then
    If grdPrcList.RowIndex(grdPrcList.Row) > 0 Then
      Set Rtm = processCol.Item(grdPrcList.RowIndex(grdPrcList.Row))
      If Rtm Is Nothing Then
        Set Rtm = processCol.Item(grdPrcList.RowIndex(grdPrcList.Row))
      End If
      Rtm.LockResource False
      If Rtm.IsLocked <> LockSession Then
        MsgBox "Процесс временно зблокирован", vbOKOnly, "Попробуйте еще раз"
        Set Rtm = Nothing
        Exit Sub
      End If
      
      Rtm.WFRtm_main.Item(1).ProcessState = WFProcessState_Done
      Rtm.WFRtm_main.Item(1).Save
      
      Rtm.UnLockResource
    End If
  End If

End Sub

Private Sub cmdStopTask_Click()
  Dim fnc As WFRtm_func
  Dim wffr_fnc As wffr.WFFR_func
  Dim dfc As WFDEf.WFDef_func
  Dim wffd As wffd.Application
  
    Timer1.Enabled = False
    If grdTaskList.Row > 0 Then
      If grdTaskList.RowIndex(grdTaskList.Row) > 0 Then
        Set fnc = funcCol.Item(grdTaskList.RowIndex(grdTaskList.Row))
        Set wffr_fnc = fnc.Func.WFFR_func.Item(1)
        Set dfc = wffr_fnc.BasedOn
        wffr_fnc.Refresh
        wffr_fnc.LockResource False
        If wffr_fnc.IsLocked = LockSession Then
          wffr_fnc.State = WFFuncState_Done
          wffr_fnc.Save
        End If
        wffr_fnc.UnLockResource
      End If
    End If
    Timer1.Enabled = True
  RefreshTL
End Sub

Private Sub Form_Load()
Dim f As frmLogin
  grdTaskList.ItemCount = 0
  Set f = New frmLogin
again:
  f.Show vbModal
  If Not f.OK Then End
  Set Manager = New MTZManager.Main
  Site = f.txtSite
  Set Session = Manager.GetSession(Site)
  If Session Is Nothing Then
    MsgBox "Неверное имя сайта", vbCritical
    GoTo again
  End If
  Session.Login f.txtUserName, f.txtPassword
  
  If Session.sessionid = "" Then
    MsgBox "Неверный пароль, или имя пользователя", vbCritical
    GoTo again
  End If
  Unload f
  Set f = Nothing
  Dim rs As ADODB.Recordset
  
  Set rs = Session.GetRow("session", Session.sessionid)
  UserID = rs!UsersID
  Set rs = Nothing
  
  Set rs = Manager.ListInstances(Site, "MTZUsers")
  Set musers = Manager.GetInstanceObject(rs!InstanceID)
  Manager.LockInstanceObject musers.ID
  Set rs = Nothing
  Set MyUser = musers.FindRowObject("Users", Session.GetSessionUserID())
  Set rs = Nothing
  Set rs = Manager.ListInstances(Site, "WFDic")
  If rs.EOF Then
    MsgBox "Отсутствует справочник системы управления проессами"
    Exit Sub
  End If
  Set Dic = Manager.GetInstanceObject(rs!InstanceID, Site)
  Set rs = Nothing
  InitGrid grdTaskList
  InitPrcGrid grdPrcList
  Me.Caption = Me.Caption & " (" & MyUser.Brief & ")"
  Timer1_Timer
  Timer1.Enabled = True
  
  
End Sub

Private Sub Form_Resize()
On Error Resume Next
  If Me.WindowState <> vbMinimized Then
    ts.Top = Me.ScaleLeft
    ts.Left = Me.ScaleTop
    ts.Width = Me.ScaleWidth
    ts.Height = Me.ScaleHeight
    ts_Click
  End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
  On Error Resume Next
  Set Session = Nothing
  Set Dic = Nothing
  Set Rtm = Nothing
  Set Def = Nothing
  
  Timer1.Enabled = False
  
  Dim f As Form
  
  For Each f In Forms
    If Not f Is Me Then
      Unload f
    End If
  Next
  
  
  
  If Not Server Is Nothing Then
    Server.Detach
  End If
  
  If Not Session Is Nothing Then
    Session.Logout
  End If
  Set Session = Nothing
  If Not Manager Is Nothing Then Manager.CloseClass
  Set Manager = Nothing
  
  Set Server = Nothing
  If Command$ <> "DEBUG" Then
    StopApplication
  End If
End Sub

Private Sub grdPrcList_DblClick()

  Dim objGUI As Object
  
  If grdPrcList.Row > 0 Then
    If grdPrcList.RowIndex(grdPrcList.Row) > 0 Then
      Set Rtm = processCol.Item(grdPrcList.RowIndex(grdPrcList.Row))
      If Rtm Is Nothing Then
        Set Rtm = processCol.Item(grdPrcList.RowIndex(grdPrcList.Row))
      End If
      Rtm.LockResource False
      If Rtm.IsLocked <> LockSession Then
        MsgBox "Процесс временно зблокирован", vbOKOnly, "Попробуйте еще раз"
        Set Rtm = Nothing
        Exit Sub
      End If
      Set objGUI = Manager.GetInstanceGUI(Rtm.ID)
      objGUI.Show "", Rtm, True
      Rtm.UnLockResource
    End If
  End If
End Sub

Private Sub grdPrcList_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
  If processCol Is Nothing Then Exit Sub
  If RowIndex > 0 And RowIndex <= count Then
    Set Rtm = processCol.Item(RowIndex)
    If Rtm.WFRtm_main.Item(1).BasedOn Is Nothing Then
      Values.Value(1) = Left(Replace(Rtm.Name, vbCrLf, " "), 255)
    Else
      Set Def = Rtm.WFRtm_main.Item(1).BasedOn
      Values.Value(1) = Left(Replace(Rtm.Name & "(" & Def.WFDef_INFO.Item(1).Description & ")", vbCrLf, " "), 255)
    End If
    Select Case Rtm.WFRtm_main.Item(1).ProcessState
    Case WFProcessState_Active
      Values.Value(2) = "Активен"
    Case WFProcessState_Done
      Values.Value(2) = "Завершен"
    Case WFProcessState_Initial
      Values.Value(2) = "Инициализация"
    Case WFProcessState_Prepare
      Values.Value(2) = "Подготовка к запуску"
    Case WFProcessState_Pause
      Values.Value(2) = "Приостановлен"
    Case WFProcessState_Processed
      Values.Value(2) = "Окончательно обработан"
    End Select
    On Error Resume Next
   grdTaskList.RowBookmark(RowIndex) = Rtm.ID
  End If 'RowIndex

End Sub

Private Sub grdTaskList_DblClick()
  Dim fnc As WFRtm_func
  Dim objGUI As Object
  
  If grdTaskList.Row > 0 Then
    If grdTaskList.RowIndex(grdTaskList.Row) > 0 Then
      Set fnc = funcCol.Item(grdTaskList.RowIndex(grdTaskList.Row))
      If fnc Is Nothing Then
        Set fnc = funcCol.Item(grdTaskList.RowIndex(grdTaskList.Row))
      End If
      fnc.Func.LockResource False
      If fnc.Func.IsLocked <> LockSession Then
        MsgBox "Функция временно зблокирована", vbOKOnly, "Попробуйте еще раз"
        Set fnc = Nothing
        Exit Sub
      End If
      Set objGUI = Manager.GetInstanceGUI(fnc.Func.ID)
      objGUI.Show "", fnc.Func, True
      fnc.Func.UnLockResource
    End If
  End If
End Sub


Private Sub grdTaskList_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
 Dim obj As WFDic_func
  If funcCol Is Nothing Then Exit Sub
  If RowIndex > 0 And RowIndex <= count Then
    Dim fnc As WFRtm_func
    Dim dfc As WFDEf.WFDef_func
    Dim wffd As wffd.Application
    Dim wffr_fnc As wffr.WFFR_func
    
    Set fnc = funcCol.Item(RowIndex)
    Set wffr_fnc = fnc.Func.WFFR_func.Item(1)
    Set dfc = wffr_fnc.BasedOn
    Set wffd = dfc.Func
    fnc.Refresh
    wffd.WFFD_common.Refresh
    Values.Value(1) = Left(Replace(wffd.WFFD_common.Item(1).Name, vbCrLf, " "), 255)
    Select Case wffr_fnc.State
    Case WFFuncState_Active
      Values.Value(2) = "Активна"
    Case WFFuncState_Done
      Values.Value(2) = "Завершена"
    Case WFFuncState_InControl
      Values.Value(2) = "На контроле"
    Case WFFuncState_InWork
      Values.Value(2) = "В работе"
    Case WFFuncState_Pause
      Values.Value(2) = "Приостановлена"
    Case WFFuncState_Ready
      Values.Value(2) = "Готова"
    End Select
    Values.Value(3) = wffr_fnc.Priority
    On Error Resume Next
   grdTaskList.RowBookmark(RowIndex) = fnc.ID
  End If 'RowIndex

End Sub

Private Sub tbrTask_ButtonClick(ByVal Button As MSComctlLib.Button)
  
  Dim fnc As WFRtm_func
  Dim wffr_fnc As wffr.WFFR_func
  Dim dfc As WFDEf.WFDef_func
  Dim wffd As wffd.Application
  
  
    If grdTaskList.Row > 0 Then
      If grdTaskList.RowIndex(grdTaskList.Row) > 0 Then
        Set fnc = funcCol.Item(grdTaskList.RowIndex(grdTaskList.Row))
        Set wffr_fnc = fnc.Func.WFFR_func.Item(1)
        Set dfc = wffr_fnc.BasedOn
        wffr_fnc.Refresh
        wffr_fnc.LockResource False
        If wffr_fnc.IsLocked = LockSession Then
          If Button.Key = "stop" Then
            If wffr_fnc.State = WFFuncState_InWork Then
              wffr_fnc.State = WFFuncState_Done
              wffr_fnc.Save
            End If
          End If
          If Button.Key = "run" Then
             wffr_fnc.State = WFFuncState_InWork
          End If
          
          If Button.Key = "pause" Then
            If wffr_fnc.State = WFFuncState_InWork Then
              wffr_fnc.State = WFFuncState_Pause
              wffr_fnc.Save
            End If
          End If
          
          If Button.Key = "back" Then
              wffr_fnc.State = WFFuncState_Active
              wffr_fnc.Save
          End If
        End If
        wffr_fnc.UnLockResource
      End If
    End If
  
  RefreshTL
End Sub

Private Sub RefreshTL()
  LoadFunctions
  RefreshGrid grdTaskList, funcCol.count
End Sub

Private Sub RefreshPL()
  LoadProcesses
  RefreshGrid grdPrcList, processCol.count
End Sub



Private Sub Timer1_Timer()
  On Error Resume Next
  RefreshTL
  RefreshPL
  On Error Resume Next: Session.Exec "SessionTouch", Nothing
End Sub

Private Sub ts_Click()
  pnlTaskList.Visible = False
  pnlProcessList.Visible = False
  Select Case ts.SelectedItem.Key
   Case "tasklist"
     With pnlTaskList
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     grdTaskList.Left = 0
     'grdTaskList.Top = 0
     grdTaskList.Width = .Width
     grdTaskList.Height = .Height - grdTaskList.Top
     End With
     Set Me.Icon = ImageList3.ListImages.Item(1).Picture
     
   Case "processlist"
     With pnlProcessList
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     grdPrcList.Left = 0
     'grdPrcList.Top = 0 'tbrTask.Height
     grdPrcList.Width = .Width
     grdPrcList.Height = .Height - grdPrcList.Top
     
     End With
     Set Me.Icon = ImageList3.ListImages.Item(2).Picture
   End Select
End Sub


Private Sub RefreshGrid(YGrid As GridEX20.GridEX, ByVal count As Integer)
YGrid.ItemCount = count
YGrid.Refetch
End Sub

Private Sub InitGrid(YGrid As GridEX20.GridEX)
YGrid.ItemCount = 0
YGrid.Columns.Clear
YGrid.Groups.Clear
YGrid.SortKeys.Clear
Call YGrid.Columns.Add("Название", 0, 0, "Name")
Call YGrid.Columns.Add("Состояние", 0, 0, "StepClass")
Call YGrid.Columns.Add("Приоритет", 0, 0, "EdtMode")
End Sub

Private Sub InitPrcGrid(YGrid As GridEX20.GridEX)
YGrid.ItemCount = 0
YGrid.Columns.Clear
YGrid.Groups.Clear
YGrid.SortKeys.Clear
Call YGrid.Columns.Add("Название", 0, 0, "Name")
Call YGrid.Columns.Add("Состояние", 0, 0, "StepClass")
End Sub

''''''''''''''''''''''''
Private Sub LoadProcesses()
  Dim rs As ADODB.Recordset
  
  Set processCol = Nothing
  Set processCol = New Collection
  
  Set rs = Session.GetRows("WFRtm_main", "", "", " ProcessState < 5 ")
  
  While Not rs.EOF
    Set Rtm = Manager.GetInstanceObject(rs!InstanceID, Site)
    Rtm.WFRtm_main.Refresh
    If Rtm.WFRtm_main.count = 1 Then
        processCol.Add Rtm, Rtm.ID
    End If
    rs.MoveNext
  Wend
  
End Sub


