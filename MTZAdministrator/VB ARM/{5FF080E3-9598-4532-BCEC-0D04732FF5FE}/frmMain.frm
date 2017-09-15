VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "richtx32.ocx"
Begin VB.MDIForm frmMain 
   BackColor       =   &H8000000C&
   Caption         =   "Главное окно"
   ClientHeight    =   6705
   ClientLeft      =   165
   ClientTop       =   855
   ClientWidth     =   8760
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.PictureBox Picture1 
      Align           =   2  'Align Bottom
      Height          =   975
      Left            =   0
      ScaleHeight     =   915
      ScaleWidth      =   8700
      TabIndex        =   0
      Top             =   5730
      Visible         =   0   'False
      Width           =   8760
      Begin RichTextLib.RichTextBox rtf 
         Height          =   495
         Left            =   360
         TabIndex        =   1
         Top             =   600
         Width           =   2295
         _ExtentX        =   4048
         _ExtentY        =   873
         _Version        =   393217
         Enabled         =   -1  'True
         TextRTF         =   $"frmMain.frx":030A
      End
   End
   Begin VB.Timer MenuTimer 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   2355
      Top             =   840
   End
   Begin VB.Timer Timer2 
      Interval        =   60000
      Left            =   1665
      Top             =   855
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   10000
      Left            =   1080
      Top             =   840
   End
   Begin MSComDlg.CommonDialog cdlg 
      Left            =   240
      Top             =   840
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Menu mnuWin 
      Caption         =   "Окно"
      WindowList      =   -1  'True
      Begin VB.Menu mnuAbout 
         Caption         =   "О программе"
      End
      Begin VB.Menu mnuCascade 
         Caption         =   "Каскад"
      End
      Begin VB.Menu mnuTileVert 
         Caption         =   "Разложить вертикально"
      End
      Begin VB.Menu mnuTileHor 
         Caption         =   "Разложить горизонтально"
      End
      Begin VB.Menu mnuArrangeIcon 
         Caption         =   "Разложить иконки"
      End
   End
   Begin VB.Menu mnuJRNL 
      Caption         =   "Журналы"
      Begin VB.Menu mnut_LOGCALL 
         Caption         =   "Журнал опроса"
      End
      Begin VB.Menu mnut_BDEVICES 
         Caption         =   "Опрашиваемое устройство"
      End
      Begin VB.Menu mnut_HCMESSAGES 
         Caption         =   "Сообщения о нештатных ситуациях"
      End
      Begin VB.Menu mnut_DATACURR 
         Caption         =   "Текущие значения"
      End
   End
   Begin VB.Menu mnuDictionary 
      Caption         =   "Справочники"
      Begin VB.Menu mnut_WHOGIVETOP 
         Caption         =   "Вышестоящая снабжающая организация"
      End
      Begin VB.Menu mnut_BGROUPS 
         Caption         =   "Группы опрашиваемых устройств"
      End
      Begin VB.Menu mnut_BBUILDINGS 
         Caption         =   "Здания"
      End
      Begin VB.Menu mnut_DEVCLASSES 
         Caption         =   "Классы приборов"
      End
      Begin VB.Menu mnut_COMMONPARAM 
         Caption         =   "Общие параметры"
      End
      Begin VB.Menu mnut_PLANCALL 
         Caption         =   "План опроса устройств"
      End
      Begin VB.Menu mnut_DEVICES 
         Caption         =   "Прибор"
      End
      Begin VB.Menu mnut_WHOGIVE 
         Caption         =   "Снабжающая организация"
      End
      Begin VB.Menu mnut_PARAMTYPE 
         Caption         =   "Тип параметра"
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


'%%%JOURNALPLACEHOLDER%%%
'sample: Dim WithEvents fDog As frmJournalShow

'%%%REPORTPLACEHOLDER%%%
'sample: Public RptResult As ReportShow

'Dim ObjectToReport As Object

Dim frmFind As Form
Dim frmFindFT As Form

Dim inTimer1 As Boolean
Dim inTimer2 As Boolean
Dim OnLoad As Boolean
Dim DelayedCommand As String

Private Declare Sub ExitProcess Lib "kernel32" (ByVal uExitCode As Long)

Dim WithEvents jfmnut_LOGCALL As frmJournalShow
Attribute jfmnut_LOGCALL.VB_VarHelpID = -1

Dim WithEvents jfmnut_BDEVICES As frmJournalShow
Attribute jfmnut_BDEVICES.VB_VarHelpID = -1

Dim WithEvents jfmnut_HCMESSAGES As frmJournalShow
Attribute jfmnut_HCMESSAGES.VB_VarHelpID = -1

Dim WithEvents jfmnut_DATACURR As frmJournalShow
Attribute jfmnut_DATACURR.VB_VarHelpID = -1





























Public Sub On_Load()
   Me.Caption = App.FileDescription & " (" & Site & "\" & MyRole.Name & "\" & MyUser.Brief & ")"
   On Error Resume Next
   'If command$ <> "DEBUG" Then
     Dim c As Control
     For Each c In Me.Controls
      If TypeName(c) = "Menu" Then
         
        If CheckMenu(c.Name) = RoleMenuStatus_Hidden Then
          c.Visible = False
        Else
          frmSplash.lblWarning = "Инициализация меню: " & c.Caption
          DoEvents
        End If
      End If
     Next
  'End If
   Manager.FreeAllInstanses
End Sub

Private Sub MDIForm_Load()
On_Load
End Sub

Private Sub mdiForm_Unload(cancel As Integer)
On Error Resume Next

' whait for finalize timer loops
inTimer1 = True
Me.Timer1.Enabled = False

inTimer2 = True
Me.Timer2.Enabled = False


Timer1.Enabled = False
Timer2.Enabled = False

On Error Resume Next

' unload all dynamically created journals and reports
UnloadObjects

If Not frmFind Is Nothing Then
  Unload frmFind
End If
Set frmFind = Nothing

If Not frmFindFT Is Nothing Then
  Unload frmFindFT
End If
Set frmFindFT = Nothing



Dim f As Form
For Each f In Forms
  If f.MDIChild = True Then
    On Error Resume Next
    'Call f.Controls.Item(0).object.Init(Nothing, Nothing, False, Nothing)
    Unload f
  End If
Next

  For Each f In Forms
      On Error Resume Next
      Debug.Print f.Name
  Next
  
  
  Set MyRole = Nothing
  Set MyUser = Nothing
  Set usr = Nothing


  Session.Logout
  Set Session = Nothing
  Manager.CloseClass
  Set Manager = Nothing

  If Command$ <> "DEBUG" Then
   TerminateProcess GetCurrentProcess, 0
  'Else
  ' End
  End If
End Sub


Private Sub mnuAbout_Click()
frmAbout.Show vbModal, Me
End Sub



Private Sub mnuArrangeIcon_Click()
  Me.Arrange vbArrangeIcons
End Sub

Private Sub mnuCascade_Click()
  Me.Arrange vbCascade
End Sub

Private Sub mnuExit_Click()
  Unload Me
End Sub

Private Sub mnuTileHor_Click()
  Me.Arrange vbTileHorizontal
End Sub

Private Sub mnuTileVert_Click()
  Me.Arrange vbTileVertical
End Sub

Private Sub Timer2_Timer()
  If inTimer2 Then Exit Sub
  inTimer2 = True
  On Error Resume Next
  Call Session.Exec("SessionTouch", Nothing)
  inTimer2 = False
End Sub





Private Function NoTabs(ByVal s As String) As String
  NoTabs = Replace(Replace(Replace(Replace(s, vbTab, " "), vbCrLf, " "), vbCr, " "), vbLf, " ")
End Function


Private Sub OpenForm(o As Object)
  Dim t As Form
  For Each t In Forms
    If t.Caption = o.Name Then
      t.WindowState = vbNormal
      t.ZOrder 0
      t.Show
      Me.MousePointer = vbNormal
      Exit Sub
    End If
  Next
  
  Dim f As frmObj
  Set f = New frmObj
  f.Init o
  f.Show
  

End Sub



Private Function RTF_To_Text(s As String)
  rtf.Text = ""
  rtf.SelRTF = s
  RTF_To_Text = rtf.Text
  rtf.Text = ""
End Function


Private Function SynchronizeARMDescription()
    Dim objARM As Object
    Dim objMenuItem As Menu
    Dim ObjItem As Object

    Set objARM = Manager.GetInstanceObject(ARMID)
    
    Dim i As Long
    Dim objRS As ADODB.Recordset
    Dim objEntryPoint As Object
    
    For i = 0 To Me.Controls.Count - 1
        Set ObjItem = Me.Controls(i)
        If UCase(TypeName(ObjItem)) = UCase("menu") Then
            If ObjItem.Caption <> "-" Then
              Debug.Print "Found menu " + ObjItem.Caption + "-" + ObjItem.Name
              Set objRS = Session.GetRowsEx("EntryPoints", ARMID, , "Caption='" + ObjItem.Caption + "' or Name='" & ObjItem.Name & "'")
              If objRS.EOF And objRS.BOF Then
                  Set objEntryPoint = objARM.EntryPoints.Add
                  objEntryPoint.Caption = ObjItem.Caption
                  objEntryPoint.Name = ObjItem.Name
                  objEntryPoint.AsToolbarItem = Boolean_Net
                  objEntryPoint.ActionType = 0 'MenuActionType_Nicego_ne_delat_
                  objEntryPoint.Save
              Else
                  Set objEntryPoint = objARM.FindRowObject("EntryPoints", objRS!Entrypointsid)
                  If Not objEntryPoint Is Nothing Then
                    objEntryPoint.Caption = ObjItem.Caption
                    objEntryPoint.Name = ObjItem.Name
                    objEntryPoint.AsToolbarItem = Boolean_Net
                    objEntryPoint.Save
                  End If
              End If
              objRS.Close
            End If
        End If
    Next
End Function


Private Sub mnut_LOGCALL_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnut_LOGCALL Is Nothing Then
      Set jfmnut_LOGCALL = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{3C14AEEF-FA6B-4DA9-A55E-8EC28BC7686F}")
      Manager.LockInstanceObject journal.ID
      Set jfmnut_LOGCALL.jv.journal = journal
      jfmnut_LOGCALL.jv.OpenModal = False
      jfmnut_LOGCALL.Caption = "Журнал опроса"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
    Dim fltr As frmt_LOGCALL
    Set fltr = New frmt_LOGCALL
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblQMonth_LE.Value = vbChecked Then
        f = f & " and LOG_HEADER_QMonth<=" & val(fltr.txtQMonth_LE.Text)
      End If
      If fltr.lblQMonth_GE.Value = vbChecked Then
        f = f & " and LOG_HEADER_QMonth>=" & val(fltr.txtQMonth_GE.Text)
      End If
      If fltr.lblQDay_LE.Value = vbChecked Then
        f = f & " and LOG_HEADER_QDay<=" & val(fltr.txtQDay_LE.Text)
      End If
      If fltr.lblQDay_GE.Value = vbChecked Then
        f = f & " and LOG_HEADER_QDay>=" & val(fltr.txtQDay_GE.Text)
      End If
      If fltr.lblQYear_LE.Value = vbChecked Then
        f = f & " and LOG_HEADER_QYear<=" & val(fltr.txtQYear_LE.Text)
      End If
      If fltr.lblID_DU.Value = vbChecked Then
        f = f & " and LOG_HEADER_ID_DU_ID='" & fltr.txtID_DU.Tag & "'"
      End If
      If fltr.lblID_BD.Value = vbChecked Then
        f = f & " and LOG_HEADER_ID_BD_ID='" & fltr.txtID_BD.Tag & "'"
      End If
      If fltr.lblQYear_GE.Value = vbChecked Then
        f = f & " and LOG_HEADER_QYear>=" & val(fltr.txtQYear_GE.Text)
      End If
      If fltr.lblID_PTYPE.Value = vbChecked Then
        f = f & " and LOG_HEADER_ID_PTYPE_ID='" & fltr.txtID_PTYPE.Tag & "'"
      End If
    jfmnut_LOGCALL.jv.Filter.Add "AUTOLOG_HEADER", f
    End If
      jfmnut_LOGCALL.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnut_LOGCALL.Show
    jfmnut_LOGCALL.WindowState = 0
    jfmnut_LOGCALL.ZOrder 0
End Sub
Private Sub jfmnut_LOGCALL_OnFilter(usedefault As Boolean)
    Dim fltr As frmt_LOGCALL
    Dim f As String
    Set fltr = New frmt_LOGCALL
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
      If fltr.lblQMonth_LE.Value = vbChecked Then
        f = f & " and LOG_HEADER_QMonth<=" & val(fltr.txtQMonth_LE.Text)
      End If
      If fltr.lblQMonth_GE.Value = vbChecked Then
        f = f & " and LOG_HEADER_QMonth>=" & val(fltr.txtQMonth_GE.Text)
      End If
      If fltr.lblQDay_LE.Value = vbChecked Then
        f = f & " and LOG_HEADER_QDay<=" & val(fltr.txtQDay_LE.Text)
      End If
      If fltr.lblQDay_GE.Value = vbChecked Then
        f = f & " and LOG_HEADER_QDay>=" & val(fltr.txtQDay_GE.Text)
      End If
      If fltr.lblQYear_LE.Value = vbChecked Then
        f = f & " and LOG_HEADER_QYear<=" & val(fltr.txtQYear_LE.Text)
      End If
      If fltr.lblID_DU.Value = vbChecked Then
        f = f & " and LOG_HEADER_ID_DU_ID='" & fltr.txtID_DU.Tag & "'"
      End If
      If fltr.lblID_BD.Value = vbChecked Then
        f = f & " and LOG_HEADER_ID_BD_ID='" & fltr.txtID_BD.Tag & "'"
      End If
      If fltr.lblQYear_GE.Value = vbChecked Then
        f = f & " and LOG_HEADER_QYear>=" & val(fltr.txtQYear_GE.Text)
      End If
      If fltr.lblID_PTYPE.Value = vbChecked Then
        f = f & " and LOG_HEADER_ID_PTYPE_ID='" & fltr.txtID_PTYPE.Tag & "'"
      End If
    jfmnut_LOGCALL.jv.Filter.Add "AUTOLOG_HEADER", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnut_LOGCALL_OnClearFilter()
End Sub
Private Sub jfmnut_LOGCALL_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "t_LOGCALL", "Журнал опроса" & Now, Site
  Set o = Manager.GetInstanceObject(ID)
  If IsDocDenied(o) Then
    MsgBox "Не разрешен доступ к документам такого типа"
    Exit Sub
  End If

  Dim g  As Object
  Set g = Manager.GetInstanceGUI(o.ID)
  If Not g Is Nothing Then
    g.Show GetDocumentMode(o), o, False
  End If
  usedefaut = False
  Refesh = False
End Sub


Private Sub mnut_BDEVICES_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnut_BDEVICES Is Nothing Then
      Set jfmnut_BDEVICES = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{251EDAA2-8544-4DF5-B453-EC37CF28ABFE}")
      Manager.LockInstanceObject journal.ID
      Set jfmnut_BDEVICES.jv.journal = journal
      jfmnut_BDEVICES.jv.OpenModal = False
      jfmnut_BDEVICES.Caption = "Опрашиваемое устройство"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
    Dim fltr As frmt_BDEVICES
    Set fltr = New frmt_BDEVICES
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblNPLOCK_LE.Value = vbChecked Then
        f = f & " and BDEVICES_NPLOCK<=" & MakeMSSQLDate(fltr.dtpNPLOCK_LE.Value)
      End If
      If fltr.lblNPLOCK_GE.Value = vbChecked Then
        f = f & " and BDEVICES_NPLOCK>=" & MakeMSSQLDate(fltr.dtpNPLOCK_GE.Value)
      End If
      If fltr.lblID_MD.Value = vbChecked Then
        f = f & " and BDEVICES_ID_MD='" & fltr.cmbID_MD.Text & "'"
      End If
      If fltr.lblCONNECTED.Value = vbChecked Then
        f = f & " and BDEVICES_CONNECTED='" & fltr.cmbCONNECTED.Text & "'"
      End If
      If fltr.lblID_DEV.Value = vbChecked Then
        f = f & " and BDEVICES_ID_DEV_ID='" & fltr.txtID_DEV.Tag & "'"
      End If
      If fltr.lblID_BU.Value = vbChecked Then
        f = f & " and BDEVICES_ID_BU_ID='" & fltr.txtID_BU.Tag & "'"
      End If
      If fltr.lblNPPASSWORD.Value = vbChecked Then
        f = f & " and BDEVICES_NPPASSWORD like '%" & fltr.txtNPPASSWORD.Text & "%'"
      End If
      If fltr.lblNPIP.Value = vbChecked Then
        f = f & " and BDEVICES_NPIP like '%" & fltr.txtNPIP.Text & "%'"
      End If
    jfmnut_BDEVICES.jv.Filter.Add "AUTOBDEVICES", f
    End If
      jfmnut_BDEVICES.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnut_BDEVICES.Show
    jfmnut_BDEVICES.WindowState = 0
    jfmnut_BDEVICES.ZOrder 0
End Sub
Private Sub jfmnut_BDEVICES_OnFilter(usedefault As Boolean)
    Dim fltr As frmt_BDEVICES
    Dim f As String
    Set fltr = New frmt_BDEVICES
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
      If fltr.lblNPLOCK_LE.Value = vbChecked Then
        f = f & " and BDEVICES_NPLOCK<=" & MakeMSSQLDate(fltr.dtpNPLOCK_LE.Value)
      End If
      If fltr.lblNPLOCK_GE.Value = vbChecked Then
        f = f & " and BDEVICES_NPLOCK>=" & MakeMSSQLDate(fltr.dtpNPLOCK_GE.Value)
      End If
      If fltr.lblID_MD.Value = vbChecked Then
        f = f & " and BDEVICES_ID_MD='" & fltr.cmbID_MD.Text & "'"
      End If
      If fltr.lblCONNECTED.Value = vbChecked Then
        f = f & " and BDEVICES_CONNECTED='" & fltr.cmbCONNECTED.Text & "'"
      End If
      If fltr.lblID_DEV.Value = vbChecked Then
        f = f & " and BDEVICES_ID_DEV_ID='" & fltr.txtID_DEV.Tag & "'"
      End If
      If fltr.lblID_BU.Value = vbChecked Then
        f = f & " and BDEVICES_ID_BU_ID='" & fltr.txtID_BU.Tag & "'"
      End If
      If fltr.lblNPPASSWORD.Value = vbChecked Then
        f = f & " and BDEVICES_NPPASSWORD like '%" & fltr.txtNPPASSWORD.Text & "%'"
      End If
      If fltr.lblNPIP.Value = vbChecked Then
        f = f & " and BDEVICES_NPIP like '%" & fltr.txtNPIP.Text & "%'"
      End If
    jfmnut_BDEVICES.jv.Filter.Add "AUTOBDEVICES", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnut_BDEVICES_OnClearFilter()
End Sub
Private Sub jfmnut_BDEVICES_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "t_BDEVICES", "Опрашиваемое устройство" & Now, Site
  Set o = Manager.GetInstanceObject(ID)
  If IsDocDenied(o) Then
    MsgBox "Не разрешен доступ к документам такого типа"
    Exit Sub
  End If

  Dim g  As Object
  Set g = Manager.GetInstanceGUI(o.ID)
  If Not g Is Nothing Then
    g.Show GetDocumentMode(o), o, False
  End If
  usedefaut = False
  Refesh = False
End Sub


Private Sub mnut_HCMESSAGES_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnut_HCMESSAGES Is Nothing Then
      Set jfmnut_HCMESSAGES = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{949A92F5-D67C-4689-8DB4-C99D14450476}")
      Manager.LockInstanceObject journal.ID
      Set jfmnut_HCMESSAGES.jv.journal = journal
      jfmnut_HCMESSAGES.jv.OpenModal = False
      jfmnut_HCMESSAGES.Caption = "Сообщения о нештатных ситуациях"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
    Dim fltr As frmt_HCMESSAGES
    Set fltr = New frmt_HCMESSAGES
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblQMonth_LE.Value = vbChecked Then
        f = f & " and NS_HEADER_QMonth<=" & val(fltr.txtQMonth_LE.Text)
      End If
      If fltr.lblQDay_GE.Value = vbChecked Then
        f = f & " and NS_HEADER_QDay>=" & val(fltr.txtQDay_GE.Text)
      End If
      If fltr.lblQDay_LE.Value = vbChecked Then
        f = f & " and NS_HEADER_QDay<=" & val(fltr.txtQDay_LE.Text)
      End If
      If fltr.lblQMonth_GE.Value = vbChecked Then
        f = f & " and NS_HEADER_QMonth>=" & val(fltr.txtQMonth_GE.Text)
      End If
      If fltr.lblID_BD.Value = vbChecked Then
        f = f & " and NS_HEADER_ID_BD_ID='" & fltr.txtID_BD.Tag & "'"
      End If
      If fltr.lblQYear_GE.Value = vbChecked Then
        f = f & " and NS_HEADER_QYear>=" & val(fltr.txtQYear_GE.Text)
      End If
      If fltr.lblQYear_LE.Value = vbChecked Then
        f = f & " and NS_HEADER_QYear<=" & val(fltr.txtQYear_LE.Text)
      End If
    jfmnut_HCMESSAGES.jv.Filter.Add "AUTONS_HEADER", f
    End If
      jfmnut_HCMESSAGES.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnut_HCMESSAGES.Show
    jfmnut_HCMESSAGES.WindowState = 0
    jfmnut_HCMESSAGES.ZOrder 0
End Sub
Private Sub jfmnut_HCMESSAGES_OnFilter(usedefault As Boolean)
    Dim fltr As frmt_HCMESSAGES
    Dim f As String
    Set fltr = New frmt_HCMESSAGES
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
      If fltr.lblQMonth_LE.Value = vbChecked Then
        f = f & " and NS_HEADER_QMonth<=" & val(fltr.txtQMonth_LE.Text)
      End If
      If fltr.lblQDay_GE.Value = vbChecked Then
        f = f & " and NS_HEADER_QDay>=" & val(fltr.txtQDay_GE.Text)
      End If
      If fltr.lblQDay_LE.Value = vbChecked Then
        f = f & " and NS_HEADER_QDay<=" & val(fltr.txtQDay_LE.Text)
      End If
      If fltr.lblQMonth_GE.Value = vbChecked Then
        f = f & " and NS_HEADER_QMonth>=" & val(fltr.txtQMonth_GE.Text)
      End If
      If fltr.lblID_BD.Value = vbChecked Then
        f = f & " and NS_HEADER_ID_BD_ID='" & fltr.txtID_BD.Tag & "'"
      End If
      If fltr.lblQYear_GE.Value = vbChecked Then
        f = f & " and NS_HEADER_QYear>=" & val(fltr.txtQYear_GE.Text)
      End If
      If fltr.lblQYear_LE.Value = vbChecked Then
        f = f & " and NS_HEADER_QYear<=" & val(fltr.txtQYear_LE.Text)
      End If
    jfmnut_HCMESSAGES.jv.Filter.Add "AUTONS_HEADER", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnut_HCMESSAGES_OnClearFilter()
End Sub
Private Sub jfmnut_HCMESSAGES_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "t_HCMESSAGES", "Сообщения о нештатных ситуациях" & Now, Site
  Set o = Manager.GetInstanceObject(ID)
  If IsDocDenied(o) Then
    MsgBox "Не разрешен доступ к документам такого типа"
    Exit Sub
  End If

  Dim g  As Object
  Set g = Manager.GetInstanceGUI(o.ID)
  If Not g Is Nothing Then
    g.Show GetDocumentMode(o), o, False
  End If
  usedefaut = False
  Refesh = False
End Sub


Private Sub mnut_DATACURR_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnut_DATACURR Is Nothing Then
      Set jfmnut_DATACURR = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{6FB8BB5C-5849-4BBC-968B-9D413E1E4A8A}")
      Manager.LockInstanceObject journal.ID
      Set jfmnut_DATACURR.jv.journal = journal
      jfmnut_DATACURR.jv.OpenModal = False
      jfmnut_DATACURR.Caption = "Текущие значения"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
    Dim fltr As frmt_DATACURR
    Set fltr = New frmt_DATACURR
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblQMonth_LE.Value = vbChecked Then
        f = f & " and DC_HEADER_QMonth<=" & val(fltr.txtQMonth_LE.Text)
      End If
      If fltr.lblQMonth_GE.Value = vbChecked Then
        f = f & " and DC_HEADER_QMonth>=" & val(fltr.txtQMonth_GE.Text)
      End If
      If fltr.lblQDay_LE.Value = vbChecked Then
        f = f & " and DC_HEADER_QDay<=" & val(fltr.txtQDay_LE.Text)
      End If
      If fltr.lblQDay_GE.Value = vbChecked Then
        f = f & " and DC_HEADER_QDay>=" & val(fltr.txtQDay_GE.Text)
      End If
      If fltr.lblID_DU.Value = vbChecked Then
        f = f & " and DC_HEADER_ID_DU_ID='" & fltr.txtID_DU.Tag & "'"
      End If
      If fltr.lblID_BD.Value = vbChecked Then
        f = f & " and DC_HEADER_ID_BD_ID='" & fltr.txtID_BD.Tag & "'"
      End If
      If fltr.lblQYear_LE.Value = vbChecked Then
        f = f & " and DC_HEADER_QYear<=" & val(fltr.txtQYear_LE.Text)
      End If
      If fltr.lblQYear_GE.Value = vbChecked Then
        f = f & " and DC_HEADER_QYear>=" & val(fltr.txtQYear_GE.Text)
      End If
    jfmnut_DATACURR.jv.Filter.Add "AUTODC_HEADER", f
    End If
      jfmnut_DATACURR.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnut_DATACURR.Show
    jfmnut_DATACURR.WindowState = 0
    jfmnut_DATACURR.ZOrder 0
End Sub
Private Sub jfmnut_DATACURR_OnFilter(usedefault As Boolean)
    Dim fltr As frmt_DATACURR
    Dim f As String
    Set fltr = New frmt_DATACURR
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
      If fltr.lblQMonth_LE.Value = vbChecked Then
        f = f & " and DC_HEADER_QMonth<=" & val(fltr.txtQMonth_LE.Text)
      End If
      If fltr.lblQMonth_GE.Value = vbChecked Then
        f = f & " and DC_HEADER_QMonth>=" & val(fltr.txtQMonth_GE.Text)
      End If
      If fltr.lblQDay_LE.Value = vbChecked Then
        f = f & " and DC_HEADER_QDay<=" & val(fltr.txtQDay_LE.Text)
      End If
      If fltr.lblQDay_GE.Value = vbChecked Then
        f = f & " and DC_HEADER_QDay>=" & val(fltr.txtQDay_GE.Text)
      End If
      If fltr.lblID_DU.Value = vbChecked Then
        f = f & " and DC_HEADER_ID_DU_ID='" & fltr.txtID_DU.Tag & "'"
      End If
      If fltr.lblID_BD.Value = vbChecked Then
        f = f & " and DC_HEADER_ID_BD_ID='" & fltr.txtID_BD.Tag & "'"
      End If
      If fltr.lblQYear_LE.Value = vbChecked Then
        f = f & " and DC_HEADER_QYear<=" & val(fltr.txtQYear_LE.Text)
      End If
      If fltr.lblQYear_GE.Value = vbChecked Then
        f = f & " and DC_HEADER_QYear>=" & val(fltr.txtQYear_GE.Text)
      End If
    jfmnut_DATACURR.jv.Filter.Add "AUTODC_HEADER", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnut_DATACURR_OnClearFilter()
End Sub
Private Sub jfmnut_DATACURR_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "t_DATACURR", "Текущие значения" & Now, Site
  Set o = Manager.GetInstanceObject(ID)
  If IsDocDenied(o) Then
    MsgBox "Не разрешен доступ к документам такого типа"
    Exit Sub
  End If

  Dim g  As Object
  Set g = Manager.GetInstanceGUI(o.ID)
  If Not g Is Nothing Then
    g.Show GetDocumentMode(o), o, False
  End If
  usedefaut = False
  Refesh = False
End Sub




Private Sub mnut_WHOGIVETOP_Click()
 Dim o As Object
 Dim rs  As ADODB.Recordset
 Dim ID As String
  Set rs = Manager.ListInstances("", "t_WHOGIVETOP")
  If Not rs.EOF Then
    ID = rs!InstanceID
  Else
    ID = CreateGUID2
    Manager.NewInstance ID, "t_WHOGIVETOP", "Вышестоящая снабжающая организация"
  End If
    Set o = Manager.GetInstanceObject(ID)
    If IsDocDenied(o) Then
      MsgBox "Не разрешен доступ к документам такого типа"
      Exit Sub
    End If

    Dim g  As Object
    Set g = Manager.GetInstanceGUI(o.ID)
    If Not g Is Nothing Then
      g.Show GetDocumentMode(o), o, False
    End If
  Set rs = Nothing
End Sub


Private Sub mnut_BGROUPS_Click()
 Dim o As Object
 Dim rs  As ADODB.Recordset
 Dim ID As String
  Set rs = Manager.ListInstances("", "t_BGROUPS")
  If Not rs.EOF Then
    ID = rs!InstanceID
  Else
    ID = CreateGUID2
    Manager.NewInstance ID, "t_BGROUPS", "Группы опрашиваемых устройств"
  End If
    Set o = Manager.GetInstanceObject(ID)
    If IsDocDenied(o) Then
      MsgBox "Не разрешен доступ к документам такого типа"
      Exit Sub
    End If

    Dim g  As Object
    Set g = Manager.GetInstanceGUI(o.ID)
    If Not g Is Nothing Then
      g.Show GetDocumentMode(o), o, False
    End If
  Set rs = Nothing
End Sub


Private Sub mnut_BBUILDINGS_Click()
 Dim o As Object
 Dim rs  As ADODB.Recordset
 Dim ID As String
  Set rs = Manager.ListInstances("", "t_BBUILDINGS")
  If Not rs.EOF Then
    ID = rs!InstanceID
  Else
    ID = CreateGUID2
    Manager.NewInstance ID, "t_BBUILDINGS", "Здания"
  End If
    Set o = Manager.GetInstanceObject(ID)
    If IsDocDenied(o) Then
      MsgBox "Не разрешен доступ к документам такого типа"
      Exit Sub
    End If

    Dim g  As Object
    Set g = Manager.GetInstanceGUI(o.ID)
    If Not g Is Nothing Then
      g.Show GetDocumentMode(o), o, False
    End If
  Set rs = Nothing
End Sub


Private Sub mnut_DEVCLASSES_Click()
 Dim o As Object
 Dim rs  As ADODB.Recordset
 Dim ID As String
  Set rs = Manager.ListInstances("", "t_DEVCLASSES")
  If Not rs.EOF Then
    ID = rs!InstanceID
  Else
    ID = CreateGUID2
    Manager.NewInstance ID, "t_DEVCLASSES", "Классы приборов"
  End If
    Set o = Manager.GetInstanceObject(ID)
    If IsDocDenied(o) Then
      MsgBox "Не разрешен доступ к документам такого типа"
      Exit Sub
    End If

    Dim g  As Object
    Set g = Manager.GetInstanceGUI(o.ID)
    If Not g Is Nothing Then
      g.Show GetDocumentMode(o), o, False
    End If
  Set rs = Nothing
End Sub


Private Sub mnut_COMMONPARAM_Click()
 Dim o As Object
 Dim rs  As ADODB.Recordset
 Dim ID As String
  Set rs = Manager.ListInstances("", "t_COMMONPARAM")
  If Not rs.EOF Then
    ID = rs!InstanceID
  Else
    ID = CreateGUID2
    Manager.NewInstance ID, "t_COMMONPARAM", "Общие параметры"
  End If
    Set o = Manager.GetInstanceObject(ID)
    If IsDocDenied(o) Then
      MsgBox "Не разрешен доступ к документам такого типа"
      Exit Sub
    End If

    Dim g  As Object
    Set g = Manager.GetInstanceGUI(o.ID)
    If Not g Is Nothing Then
      g.Show GetDocumentMode(o), o, False
    End If
  Set rs = Nothing
End Sub


Private Sub mnut_PLANCALL_Click()
 Dim o As Object
 Dim rs  As ADODB.Recordset
 Dim ID As String
  Set rs = Manager.ListInstances("", "t_PLANCALL")
  If Not rs.EOF Then
    ID = rs!InstanceID
  Else
    ID = CreateGUID2
    Manager.NewInstance ID, "t_PLANCALL", "План опроса устройств"
  End If
    Set o = Manager.GetInstanceObject(ID)
    If IsDocDenied(o) Then
      MsgBox "Не разрешен доступ к документам такого типа"
      Exit Sub
    End If

    Dim g  As Object
    Set g = Manager.GetInstanceGUI(o.ID)
    If Not g Is Nothing Then
      g.Show GetDocumentMode(o), o, False
    End If
  Set rs = Nothing
End Sub


Private Sub mnut_DEVICES_Click()
 Dim o As Object
 Dim rs  As ADODB.Recordset
 Dim ID As String
  Set rs = Manager.ListInstances("", "t_DEVICES")
  If Not rs.EOF Then
    ID = rs!InstanceID
  Else
    ID = CreateGUID2
    Manager.NewInstance ID, "t_DEVICES", "Прибор"
  End If
    Set o = Manager.GetInstanceObject(ID)
    If IsDocDenied(o) Then
      MsgBox "Не разрешен доступ к документам такого типа"
      Exit Sub
    End If

    Dim g  As Object
    Set g = Manager.GetInstanceGUI(o.ID)
    If Not g Is Nothing Then
      g.Show GetDocumentMode(o), o, False
    End If
  Set rs = Nothing
End Sub


Private Sub mnut_WHOGIVE_Click()
 Dim o As Object
 Dim rs  As ADODB.Recordset
 Dim ID As String
  Set rs = Manager.ListInstances("", "t_WHOGIVE")
  If Not rs.EOF Then
    ID = rs!InstanceID
  Else
    ID = CreateGUID2
    Manager.NewInstance ID, "t_WHOGIVE", "Снабжающая организация"
  End If
    Set o = Manager.GetInstanceObject(ID)
    If IsDocDenied(o) Then
      MsgBox "Не разрешен доступ к документам такого типа"
      Exit Sub
    End If

    Dim g  As Object
    Set g = Manager.GetInstanceGUI(o.ID)
    If Not g Is Nothing Then
      g.Show GetDocumentMode(o), o, False
    End If
  Set rs = Nothing
End Sub


Private Sub mnut_PARAMTYPE_Click()
 Dim o As Object
 Dim rs  As ADODB.Recordset
 Dim ID As String
  Set rs = Manager.ListInstances("", "t_PARAMTYPE")
  If Not rs.EOF Then
    ID = rs!InstanceID
  Else
    ID = CreateGUID2
    Manager.NewInstance ID, "t_PARAMTYPE", "Тип параметра"
  End If
    Set o = Manager.GetInstanceObject(ID)
    If IsDocDenied(o) Then
      MsgBox "Не разрешен доступ к документам такого типа"
      Exit Sub
    End If

    Dim g  As Object
    Set g = Manager.GetInstanceGUI(o.ID)
    If Not g Is Nothing Then
      g.Show GetDocumentMode(o), o, False
    End If
  Set rs = Nothing
End Sub




Private Sub UnloadObjects()


Unload jfmnut_LOGCALL
Set jfmnut_LOGCALL = Nothing

Unload jfmnut_BDEVICES
Set jfmnut_BDEVICES = Nothing

Unload jfmnut_HCMESSAGES
Set jfmnut_HCMESSAGES = Nothing

Unload jfmnut_DATACURR
Set jfmnut_DATACURR = Nothing











End Sub



