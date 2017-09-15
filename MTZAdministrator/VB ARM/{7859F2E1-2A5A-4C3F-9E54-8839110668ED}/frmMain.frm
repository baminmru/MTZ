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
   Begin VB.Menu mnuDictionary 
      Caption         =   "Справочники"
      Begin VB.Menu mnuTP_Spr 
         Caption         =   "Справочники"
      End
   End
   Begin VB.Menu mnuJRNL 
      Caption         =   "Журналы"
      Begin VB.Menu mnuTP_Zay 
         Caption         =   "Заявки"
         Begin VB.Menu mnuAllTP_Zay 
            Caption         =   "Заявки - все состояния"
         End
         Begin VB.Menu mnuTP_Zay_1 
            Caption         =   "Заявки :На исполнении"
         End
         Begin VB.Menu mnuTP_Zay_2 
            Caption         =   "Заявки :Проблемная"
         End
         Begin VB.Menu mnuTP_Zay_3 
            Caption         =   "Заявки :Оформляется"
         End
         Begin VB.Menu mnuTP_Zay_4 
            Caption         =   "Заявки :Передана в СЗТ"
         End
         Begin VB.Menu mnuTP_Zay_5 
            Caption         =   "Заявки :Выполнена"
         End
         Begin VB.Menu mnuTP_Zay_6 
            Caption         =   "Заявки :Выяснение"
         End
         Begin VB.Menu mnuTP_Zay_7 
            Caption         =   "Заявки :У инженера"
         End
         Begin VB.Menu mnuTP_Zay_8 
            Caption         =   "Заявки :Получена"
         End
      End
      Begin VB.Menu mnuTP_RaspisPoesd 
         Caption         =   "Расписание поездок инженеров"
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





Dim WithEvents jfmnuAllTP_Zay As frmJournalShow
Attribute jfmnuAllTP_Zay.VB_VarHelpID = -1

Dim WithEvents jfmnuTP_Zay_1 As frmJournalShow
Attribute jfmnuTP_Zay_1.VB_VarHelpID = -1

Dim WithEvents jfmnuTP_Zay_2 As frmJournalShow
Attribute jfmnuTP_Zay_2.VB_VarHelpID = -1

Dim WithEvents jfmnuTP_Zay_3 As frmJournalShow
Attribute jfmnuTP_Zay_3.VB_VarHelpID = -1

Dim WithEvents jfmnuTP_Zay_4 As frmJournalShow
Attribute jfmnuTP_Zay_4.VB_VarHelpID = -1

Dim WithEvents jfmnuTP_Zay_5 As frmJournalShow
Attribute jfmnuTP_Zay_5.VB_VarHelpID = -1

Dim WithEvents jfmnuTP_Zay_6 As frmJournalShow
Attribute jfmnuTP_Zay_6.VB_VarHelpID = -1

Dim WithEvents jfmnuTP_Zay_7 As frmJournalShow
Attribute jfmnuTP_Zay_7.VB_VarHelpID = -1

Dim WithEvents jfmnuTP_Zay_8 As frmJournalShow
Attribute jfmnuTP_Zay_8.VB_VarHelpID = -1



Dim WithEvents jfmnuTP_RaspisPoesd As frmJournalShow
Attribute jfmnuTP_RaspisPoesd.VB_VarHelpID = -1









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


Private Sub mnuTP_Spr_Click()
 Dim o As Object
 Dim rs  As ADODB.Recordset
 Dim ID As String
  Set rs = Manager.ListInstances("", "TP_Spr")
  If Not rs.EOF Then
    ID = rs!InstanceID
  Else
    ID = CreateGUID2
    Manager.NewInstance ID, "TP_Spr", "Справочники"
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




Private Sub mnuAllTP_Zay_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuAllTP_Zay Is Nothing Then
      Set jfmnuAllTP_Zay = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{1DD9CBCB-B944-47CF-8CD1-ABC191592394}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuAllTP_Zay.jv.journal = journal
      jfmnuAllTP_Zay.jv.OpenModal = False
      jfmnuAllTP_Zay.Caption = "Заявки - все состояния"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
    Dim fltr As frmTP_Zay
    Set fltr = New frmTP_Zay
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblDoneDate_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate<=" & MakeMSSQLDate(fltr.dtpDoneDate_LE.Value)
      End If
      If fltr.lblKontLIZO.Value = vbChecked Then
        f = f & " and TP_Zayv_KontLIZO like '%" & fltr.txtKontLIZO.Text & "%'"
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zayv_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zayv_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
      If fltr.lblDocOK.Value = vbChecked Then
        f = f & " and TP_Zayv_DocOK='" & fltr.cmbDocOK.Text & "'"
      End If
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zayv_SrochDogovor='" & fltr.cmbSrochDogovor.Text & "'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zayv_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblNomerZayavSYZIZ.Value = vbChecked Then
        f = f & " and TP_Zayv_NomerZayavSYZIZ like '%" & fltr.txtNomerZayavSYZIZ.Text & "%'"
      End If
      If fltr.lblTheDistrict.Value = vbChecked Then
        f = f & " and TP_Zayv_TheDistrict_ID='" & fltr.txtTheDistrict.Tag & "'"
      End If
      If fltr.lblGelVREMJA.Value = vbChecked Then
        f = f & " and TP_Zayv_GelVREMJA_ID='" & fltr.txtGelVREMJA.Tag & "'"
      End If
      If fltr.lblData_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data<=" & MakeMSSQLDate(fltr.dtpData_LE.Value)
      End If
      If fltr.lblTheCoordinator.Value = vbChecked Then
        f = f & " and TP_Zayv_TheCoordinator_ID='" & fltr.txtTheCoordinator.Tag & "'"
      End If
      If fltr.lblVidanModem.Value = vbChecked Then
        f = f & " and TP_Zayv_VidanModem_ID='" & fltr.txtVidanModem.Tag & "'"
      End If
      If fltr.lblData_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data>=" & MakeMSSQLDate(fltr.dtpData_GE.Value)
      End If
      If fltr.lblDoneDate_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate>=" & MakeMSSQLDate(fltr.dtpDoneDate_GE.Value)
      End If
      If fltr.lblGelDATA_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA<=" & MakeMSSQLDate(fltr.dtpGelDATA_LE.Value)
      End If
      If fltr.lblTheMaster.Value = vbChecked Then
        f = f & " and TP_Zayv_TheMaster_ID='" & fltr.txtTheMaster.Tag & "'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zayv_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zayv_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblGelDATA_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA>=" & MakeMSSQLDate(fltr.dtpGelDATA_GE.Value)
      End If
      If fltr.lblOperator.Value = vbChecked Then
        f = f & " and TP_Zayv_Operator_ID='" & fltr.txtOperator.Tag & "'"
      End If
      If fltr.lblKontTELEFON.Value = vbChecked Then
        f = f & " and TP_Zayv_KontTELEFON like '%" & fltr.txtKontTELEFON.Text & "%'"
      End If
    jfmnuAllTP_Zay.jv.Filter.Add "AUTOTP_Zayv", f
    End If
      jfmnuAllTP_Zay.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuAllTP_Zay.Show
    jfmnuAllTP_Zay.WindowState = 0
    jfmnuAllTP_Zay.ZOrder 0
End Sub
Private Sub jfmnuAllTP_Zay_OnFilter(usedefault As Boolean)
    Dim fltr As frmTP_Zay
    Dim f As String
    Set fltr = New frmTP_Zay
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
      If fltr.lblDoneDate_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate<=" & MakeMSSQLDate(fltr.dtpDoneDate_LE.Value)
      End If
      If fltr.lblKontLIZO.Value = vbChecked Then
        f = f & " and TP_Zayv_KontLIZO like '%" & fltr.txtKontLIZO.Text & "%'"
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zayv_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zayv_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
      If fltr.lblDocOK.Value = vbChecked Then
        f = f & " and TP_Zayv_DocOK='" & fltr.cmbDocOK.Text & "'"
      End If
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zayv_SrochDogovor='" & fltr.cmbSrochDogovor.Text & "'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zayv_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblNomerZayavSYZIZ.Value = vbChecked Then
        f = f & " and TP_Zayv_NomerZayavSYZIZ like '%" & fltr.txtNomerZayavSYZIZ.Text & "%'"
      End If
      If fltr.lblTheDistrict.Value = vbChecked Then
        f = f & " and TP_Zayv_TheDistrict_ID='" & fltr.txtTheDistrict.Tag & "'"
      End If
      If fltr.lblGelVREMJA.Value = vbChecked Then
        f = f & " and TP_Zayv_GelVREMJA_ID='" & fltr.txtGelVREMJA.Tag & "'"
      End If
      If fltr.lblData_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data<=" & MakeMSSQLDate(fltr.dtpData_LE.Value)
      End If
      If fltr.lblTheCoordinator.Value = vbChecked Then
        f = f & " and TP_Zayv_TheCoordinator_ID='" & fltr.txtTheCoordinator.Tag & "'"
      End If
      If fltr.lblVidanModem.Value = vbChecked Then
        f = f & " and TP_Zayv_VidanModem_ID='" & fltr.txtVidanModem.Tag & "'"
      End If
      If fltr.lblData_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data>=" & MakeMSSQLDate(fltr.dtpData_GE.Value)
      End If
      If fltr.lblDoneDate_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate>=" & MakeMSSQLDate(fltr.dtpDoneDate_GE.Value)
      End If
      If fltr.lblGelDATA_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA<=" & MakeMSSQLDate(fltr.dtpGelDATA_LE.Value)
      End If
      If fltr.lblTheMaster.Value = vbChecked Then
        f = f & " and TP_Zayv_TheMaster_ID='" & fltr.txtTheMaster.Tag & "'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zayv_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zayv_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblGelDATA_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA>=" & MakeMSSQLDate(fltr.dtpGelDATA_GE.Value)
      End If
      If fltr.lblOperator.Value = vbChecked Then
        f = f & " and TP_Zayv_Operator_ID='" & fltr.txtOperator.Tag & "'"
      End If
      If fltr.lblKontTELEFON.Value = vbChecked Then
        f = f & " and TP_Zayv_KontTELEFON like '%" & fltr.txtKontTELEFON.Text & "%'"
      End If
    jfmnuAllTP_Zay.jv.Filter.Add "AUTOTP_Zayv", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuAllTP_Zay_OnClearFilter()
End Sub
Private Sub jfmnuAllTP_Zay_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "TP_Zay", "Заявки" & Now, Site
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


Private Sub mnuTP_Zay_1_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuTP_Zay_1 Is Nothing Then
      Set jfmnuTP_Zay_1 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{1DD9CBCB-B944-47CF-8CD1-ABC191592394}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuTP_Zay_1.jv.journal = journal
      jfmnuTP_Zay_1.jv.OpenModal = False
      jfmnuTP_Zay_1.Caption = "Заявки :На исполнении"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{25E09CB4-2F68-4952-AF1F-23B1AA00A22A}'"
    jfmnuTP_Zay_1.jv.Filter.Add "AUTOTP_Zayv", f
    Dim fltr As frmTP_Zay
    Set fltr = New frmTP_Zay
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zayv_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
      If fltr.lblVidanModem.Value = vbChecked Then
        f = f & " and TP_Zayv_VidanModem_ID='" & fltr.txtVidanModem.Tag & "'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zayv_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zayv_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zayv_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblGelDATA_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA<=" & MakeMSSQLDate(fltr.dtpGelDATA_LE.Value)
      End If
      If fltr.lblData_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data>=" & MakeMSSQLDate(fltr.dtpData_GE.Value)
      End If
      If fltr.lblTheMaster.Value = vbChecked Then
        f = f & " and TP_Zayv_TheMaster_ID='" & fltr.txtTheMaster.Tag & "'"
      End If
      If fltr.lblDoneDate_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate<=" & MakeMSSQLDate(fltr.dtpDoneDate_LE.Value)
      End If
      If fltr.lblDocOK.Value = vbChecked Then
        f = f & " and TP_Zayv_DocOK='" & fltr.cmbDocOK.Text & "'"
      End If
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zayv_SrochDogovor='" & fltr.cmbSrochDogovor.Text & "'"
      End If
      If fltr.lblTheCoordinator.Value = vbChecked Then
        f = f & " and TP_Zayv_TheCoordinator_ID='" & fltr.txtTheCoordinator.Tag & "'"
      End If
      If fltr.lblOperator.Value = vbChecked Then
        f = f & " and TP_Zayv_Operator_ID='" & fltr.txtOperator.Tag & "'"
      End If
      If fltr.lblKontLIZO.Value = vbChecked Then
        f = f & " and TP_Zayv_KontLIZO like '%" & fltr.txtKontLIZO.Text & "%'"
      End If
      If fltr.lblKontTELEFON.Value = vbChecked Then
        f = f & " and TP_Zayv_KontTELEFON like '%" & fltr.txtKontTELEFON.Text & "%'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zayv_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblNomerZayavSYZIZ.Value = vbChecked Then
        f = f & " and TP_Zayv_NomerZayavSYZIZ like '%" & fltr.txtNomerZayavSYZIZ.Text & "%'"
      End If
      If fltr.lblData_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data<=" & MakeMSSQLDate(fltr.dtpData_LE.Value)
      End If
      If fltr.lblTheDistrict.Value = vbChecked Then
        f = f & " and TP_Zayv_TheDistrict_ID='" & fltr.txtTheDistrict.Tag & "'"
      End If
      If fltr.lblGelDATA_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA>=" & MakeMSSQLDate(fltr.dtpGelDATA_GE.Value)
      End If
      If fltr.lblGelVREMJA.Value = vbChecked Then
        f = f & " and TP_Zayv_GelVREMJA_ID='" & fltr.txtGelVREMJA.Tag & "'"
      End If
      If fltr.lblDoneDate_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate>=" & MakeMSSQLDate(fltr.dtpDoneDate_GE.Value)
      End If
    jfmnuTP_Zay_1.jv.Filter.Add "AUTOTP_Zayv", f
    End If
      jfmnuTP_Zay_1.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuTP_Zay_1.Show
    jfmnuTP_Zay_1.WindowState = 0
    jfmnuTP_Zay_1.ZOrder 0
End Sub
Private Sub jfmnuTP_Zay_1_OnFilter(usedefault As Boolean)
    Dim fltr As frmTP_Zay
    Dim f As String
    Set fltr = New frmTP_Zay
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{25E09CB4-2F68-4952-AF1F-23B1AA00A22A}'"
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zayv_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
      If fltr.lblVidanModem.Value = vbChecked Then
        f = f & " and TP_Zayv_VidanModem_ID='" & fltr.txtVidanModem.Tag & "'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zayv_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zayv_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zayv_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblGelDATA_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA<=" & MakeMSSQLDate(fltr.dtpGelDATA_LE.Value)
      End If
      If fltr.lblData_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data>=" & MakeMSSQLDate(fltr.dtpData_GE.Value)
      End If
      If fltr.lblTheMaster.Value = vbChecked Then
        f = f & " and TP_Zayv_TheMaster_ID='" & fltr.txtTheMaster.Tag & "'"
      End If
      If fltr.lblDoneDate_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate<=" & MakeMSSQLDate(fltr.dtpDoneDate_LE.Value)
      End If
      If fltr.lblDocOK.Value = vbChecked Then
        f = f & " and TP_Zayv_DocOK='" & fltr.cmbDocOK.Text & "'"
      End If
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zayv_SrochDogovor='" & fltr.cmbSrochDogovor.Text & "'"
      End If
      If fltr.lblTheCoordinator.Value = vbChecked Then
        f = f & " and TP_Zayv_TheCoordinator_ID='" & fltr.txtTheCoordinator.Tag & "'"
      End If
      If fltr.lblOperator.Value = vbChecked Then
        f = f & " and TP_Zayv_Operator_ID='" & fltr.txtOperator.Tag & "'"
      End If
      If fltr.lblKontLIZO.Value = vbChecked Then
        f = f & " and TP_Zayv_KontLIZO like '%" & fltr.txtKontLIZO.Text & "%'"
      End If
      If fltr.lblKontTELEFON.Value = vbChecked Then
        f = f & " and TP_Zayv_KontTELEFON like '%" & fltr.txtKontTELEFON.Text & "%'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zayv_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblNomerZayavSYZIZ.Value = vbChecked Then
        f = f & " and TP_Zayv_NomerZayavSYZIZ like '%" & fltr.txtNomerZayavSYZIZ.Text & "%'"
      End If
      If fltr.lblData_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data<=" & MakeMSSQLDate(fltr.dtpData_LE.Value)
      End If
      If fltr.lblTheDistrict.Value = vbChecked Then
        f = f & " and TP_Zayv_TheDistrict_ID='" & fltr.txtTheDistrict.Tag & "'"
      End If
      If fltr.lblGelDATA_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA>=" & MakeMSSQLDate(fltr.dtpGelDATA_GE.Value)
      End If
      If fltr.lblGelVREMJA.Value = vbChecked Then
        f = f & " and TP_Zayv_GelVREMJA_ID='" & fltr.txtGelVREMJA.Tag & "'"
      End If
      If fltr.lblDoneDate_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate>=" & MakeMSSQLDate(fltr.dtpDoneDate_GE.Value)
      End If
    jfmnuTP_Zay_1.jv.Filter.Add "AUTOTP_Zayv", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuTP_Zay_1_OnClearFilter()
   jfmnuTP_Zay_1.jv.Filter.Add "AUTOTP_Zayv", " INTSANCEStatusID='{25E09CB4-2F68-4952-AF1F-23B1AA00A22A}'"
End Sub
Private Sub jfmnuTP_Zay_1_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "TP_Zay", "Заявки" & Now, Site
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


Private Sub mnuTP_Zay_2_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuTP_Zay_2 Is Nothing Then
      Set jfmnuTP_Zay_2 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{1DD9CBCB-B944-47CF-8CD1-ABC191592394}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuTP_Zay_2.jv.journal = journal
      jfmnuTP_Zay_2.jv.OpenModal = False
      jfmnuTP_Zay_2.Caption = "Заявки :Проблемная"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{A2A50D4D-C697-4092-9DF2-272BB45A81E2}'"
    jfmnuTP_Zay_2.jv.Filter.Add "AUTOTP_Zayv", f
    Dim fltr As frmTP_Zay
    Set fltr = New frmTP_Zay
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblGelVREMJA.Value = vbChecked Then
        f = f & " and TP_Zayv_GelVREMJA_ID='" & fltr.txtGelVREMJA.Tag & "'"
      End If
      If fltr.lblGelDATA_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA>=" & MakeMSSQLDate(fltr.dtpGelDATA_GE.Value)
      End If
      If fltr.lblData_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data>=" & MakeMSSQLDate(fltr.dtpData_GE.Value)
      End If
      If fltr.lblTheMaster.Value = vbChecked Then
        f = f & " and TP_Zayv_TheMaster_ID='" & fltr.txtTheMaster.Tag & "'"
      End If
      If fltr.lblDoneDate_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate<=" & MakeMSSQLDate(fltr.dtpDoneDate_LE.Value)
      End If
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zayv_SrochDogovor='" & fltr.cmbSrochDogovor.Text & "'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zayv_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblKontLIZO.Value = vbChecked Then
        f = f & " and TP_Zayv_KontLIZO like '%" & fltr.txtKontLIZO.Text & "%'"
      End If
      If fltr.lblTheDistrict.Value = vbChecked Then
        f = f & " and TP_Zayv_TheDistrict_ID='" & fltr.txtTheDistrict.Tag & "'"
      End If
      If fltr.lblTheCoordinator.Value = vbChecked Then
        f = f & " and TP_Zayv_TheCoordinator_ID='" & fltr.txtTheCoordinator.Tag & "'"
      End If
      If fltr.lblData_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data<=" & MakeMSSQLDate(fltr.dtpData_LE.Value)
      End If
      If fltr.lblNomerZayavSYZIZ.Value = vbChecked Then
        f = f & " and TP_Zayv_NomerZayavSYZIZ like '%" & fltr.txtNomerZayavSYZIZ.Text & "%'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zayv_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zayv_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
      If fltr.lblGelDATA_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA<=" & MakeMSSQLDate(fltr.dtpGelDATA_LE.Value)
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zayv_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zayv_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblKontTELEFON.Value = vbChecked Then
        f = f & " and TP_Zayv_KontTELEFON like '%" & fltr.txtKontTELEFON.Text & "%'"
      End If
      If fltr.lblDocOK.Value = vbChecked Then
        f = f & " and TP_Zayv_DocOK='" & fltr.cmbDocOK.Text & "'"
      End If
      If fltr.lblOperator.Value = vbChecked Then
        f = f & " and TP_Zayv_Operator_ID='" & fltr.txtOperator.Tag & "'"
      End If
      If fltr.lblDoneDate_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate>=" & MakeMSSQLDate(fltr.dtpDoneDate_GE.Value)
      End If
      If fltr.lblVidanModem.Value = vbChecked Then
        f = f & " and TP_Zayv_VidanModem_ID='" & fltr.txtVidanModem.Tag & "'"
      End If
    jfmnuTP_Zay_2.jv.Filter.Add "AUTOTP_Zayv", f
    End If
      jfmnuTP_Zay_2.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuTP_Zay_2.Show
    jfmnuTP_Zay_2.WindowState = 0
    jfmnuTP_Zay_2.ZOrder 0
End Sub
Private Sub jfmnuTP_Zay_2_OnFilter(usedefault As Boolean)
    Dim fltr As frmTP_Zay
    Dim f As String
    Set fltr = New frmTP_Zay
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{A2A50D4D-C697-4092-9DF2-272BB45A81E2}'"
      If fltr.lblGelVREMJA.Value = vbChecked Then
        f = f & " and TP_Zayv_GelVREMJA_ID='" & fltr.txtGelVREMJA.Tag & "'"
      End If
      If fltr.lblGelDATA_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA>=" & MakeMSSQLDate(fltr.dtpGelDATA_GE.Value)
      End If
      If fltr.lblData_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data>=" & MakeMSSQLDate(fltr.dtpData_GE.Value)
      End If
      If fltr.lblTheMaster.Value = vbChecked Then
        f = f & " and TP_Zayv_TheMaster_ID='" & fltr.txtTheMaster.Tag & "'"
      End If
      If fltr.lblDoneDate_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate<=" & MakeMSSQLDate(fltr.dtpDoneDate_LE.Value)
      End If
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zayv_SrochDogovor='" & fltr.cmbSrochDogovor.Text & "'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zayv_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblKontLIZO.Value = vbChecked Then
        f = f & " and TP_Zayv_KontLIZO like '%" & fltr.txtKontLIZO.Text & "%'"
      End If
      If fltr.lblTheDistrict.Value = vbChecked Then
        f = f & " and TP_Zayv_TheDistrict_ID='" & fltr.txtTheDistrict.Tag & "'"
      End If
      If fltr.lblTheCoordinator.Value = vbChecked Then
        f = f & " and TP_Zayv_TheCoordinator_ID='" & fltr.txtTheCoordinator.Tag & "'"
      End If
      If fltr.lblData_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data<=" & MakeMSSQLDate(fltr.dtpData_LE.Value)
      End If
      If fltr.lblNomerZayavSYZIZ.Value = vbChecked Then
        f = f & " and TP_Zayv_NomerZayavSYZIZ like '%" & fltr.txtNomerZayavSYZIZ.Text & "%'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zayv_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zayv_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
      If fltr.lblGelDATA_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA<=" & MakeMSSQLDate(fltr.dtpGelDATA_LE.Value)
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zayv_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zayv_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblKontTELEFON.Value = vbChecked Then
        f = f & " and TP_Zayv_KontTELEFON like '%" & fltr.txtKontTELEFON.Text & "%'"
      End If
      If fltr.lblDocOK.Value = vbChecked Then
        f = f & " and TP_Zayv_DocOK='" & fltr.cmbDocOK.Text & "'"
      End If
      If fltr.lblOperator.Value = vbChecked Then
        f = f & " and TP_Zayv_Operator_ID='" & fltr.txtOperator.Tag & "'"
      End If
      If fltr.lblDoneDate_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate>=" & MakeMSSQLDate(fltr.dtpDoneDate_GE.Value)
      End If
      If fltr.lblVidanModem.Value = vbChecked Then
        f = f & " and TP_Zayv_VidanModem_ID='" & fltr.txtVidanModem.Tag & "'"
      End If
    jfmnuTP_Zay_2.jv.Filter.Add "AUTOTP_Zayv", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuTP_Zay_2_OnClearFilter()
   jfmnuTP_Zay_2.jv.Filter.Add "AUTOTP_Zayv", " INTSANCEStatusID='{A2A50D4D-C697-4092-9DF2-272BB45A81E2}'"
End Sub
Private Sub jfmnuTP_Zay_2_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "TP_Zay", "Заявки" & Now, Site
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


Private Sub mnuTP_Zay_3_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuTP_Zay_3 Is Nothing Then
      Set jfmnuTP_Zay_3 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{1DD9CBCB-B944-47CF-8CD1-ABC191592394}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuTP_Zay_3.jv.journal = journal
      jfmnuTP_Zay_3.jv.OpenModal = False
      jfmnuTP_Zay_3.Caption = "Заявки :Оформляется"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{83AE05C9-5C22-40DD-937D-46AFFE86C3AE}'"
    jfmnuTP_Zay_3.jv.Filter.Add "AUTOTP_Zayv", f
    Dim fltr As frmTP_Zay
    Set fltr = New frmTP_Zay
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zayv_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblKontTELEFON.Value = vbChecked Then
        f = f & " and TP_Zayv_KontTELEFON like '%" & fltr.txtKontTELEFON.Text & "%'"
      End If
      If fltr.lblGelVREMJA.Value = vbChecked Then
        f = f & " and TP_Zayv_GelVREMJA_ID='" & fltr.txtGelVREMJA.Tag & "'"
      End If
      If fltr.lblData_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data>=" & MakeMSSQLDate(fltr.dtpData_GE.Value)
      End If
      If fltr.lblTheMaster.Value = vbChecked Then
        f = f & " and TP_Zayv_TheMaster_ID='" & fltr.txtTheMaster.Tag & "'"
      End If
      If fltr.lblTheCoordinator.Value = vbChecked Then
        f = f & " and TP_Zayv_TheCoordinator_ID='" & fltr.txtTheCoordinator.Tag & "'"
      End If
      If fltr.lblGelDATA_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA<=" & MakeMSSQLDate(fltr.dtpGelDATA_LE.Value)
      End If
      If fltr.lblDoneDate_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate<=" & MakeMSSQLDate(fltr.dtpDoneDate_LE.Value)
      End If
      If fltr.lblOperator.Value = vbChecked Then
        f = f & " and TP_Zayv_Operator_ID='" & fltr.txtOperator.Tag & "'"
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zayv_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zayv_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblTheDistrict.Value = vbChecked Then
        f = f & " and TP_Zayv_TheDistrict_ID='" & fltr.txtTheDistrict.Tag & "'"
      End If
      If fltr.lblDocOK.Value = vbChecked Then
        f = f & " and TP_Zayv_DocOK='" & fltr.cmbDocOK.Text & "'"
      End If
      If fltr.lblNomerZayavSYZIZ.Value = vbChecked Then
        f = f & " and TP_Zayv_NomerZayavSYZIZ like '%" & fltr.txtNomerZayavSYZIZ.Text & "%'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zayv_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblVidanModem.Value = vbChecked Then
        f = f & " and TP_Zayv_VidanModem_ID='" & fltr.txtVidanModem.Tag & "'"
      End If
      If fltr.lblGelDATA_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA>=" & MakeMSSQLDate(fltr.dtpGelDATA_GE.Value)
      End If
      If fltr.lblKontLIZO.Value = vbChecked Then
        f = f & " and TP_Zayv_KontLIZO like '%" & fltr.txtKontLIZO.Text & "%'"
      End If
      If fltr.lblDoneDate_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate>=" & MakeMSSQLDate(fltr.dtpDoneDate_GE.Value)
      End If
      If fltr.lblData_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data<=" & MakeMSSQLDate(fltr.dtpData_LE.Value)
      End If
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zayv_SrochDogovor='" & fltr.cmbSrochDogovor.Text & "'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zayv_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
    jfmnuTP_Zay_3.jv.Filter.Add "AUTOTP_Zayv", f
    End If
      jfmnuTP_Zay_3.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuTP_Zay_3.Show
    jfmnuTP_Zay_3.WindowState = 0
    jfmnuTP_Zay_3.ZOrder 0
End Sub
Private Sub jfmnuTP_Zay_3_OnFilter(usedefault As Boolean)
    Dim fltr As frmTP_Zay
    Dim f As String
    Set fltr = New frmTP_Zay
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{83AE05C9-5C22-40DD-937D-46AFFE86C3AE}'"
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zayv_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblKontTELEFON.Value = vbChecked Then
        f = f & " and TP_Zayv_KontTELEFON like '%" & fltr.txtKontTELEFON.Text & "%'"
      End If
      If fltr.lblGelVREMJA.Value = vbChecked Then
        f = f & " and TP_Zayv_GelVREMJA_ID='" & fltr.txtGelVREMJA.Tag & "'"
      End If
      If fltr.lblData_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data>=" & MakeMSSQLDate(fltr.dtpData_GE.Value)
      End If
      If fltr.lblTheMaster.Value = vbChecked Then
        f = f & " and TP_Zayv_TheMaster_ID='" & fltr.txtTheMaster.Tag & "'"
      End If
      If fltr.lblTheCoordinator.Value = vbChecked Then
        f = f & " and TP_Zayv_TheCoordinator_ID='" & fltr.txtTheCoordinator.Tag & "'"
      End If
      If fltr.lblGelDATA_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA<=" & MakeMSSQLDate(fltr.dtpGelDATA_LE.Value)
      End If
      If fltr.lblDoneDate_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate<=" & MakeMSSQLDate(fltr.dtpDoneDate_LE.Value)
      End If
      If fltr.lblOperator.Value = vbChecked Then
        f = f & " and TP_Zayv_Operator_ID='" & fltr.txtOperator.Tag & "'"
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zayv_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zayv_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblTheDistrict.Value = vbChecked Then
        f = f & " and TP_Zayv_TheDistrict_ID='" & fltr.txtTheDistrict.Tag & "'"
      End If
      If fltr.lblDocOK.Value = vbChecked Then
        f = f & " and TP_Zayv_DocOK='" & fltr.cmbDocOK.Text & "'"
      End If
      If fltr.lblNomerZayavSYZIZ.Value = vbChecked Then
        f = f & " and TP_Zayv_NomerZayavSYZIZ like '%" & fltr.txtNomerZayavSYZIZ.Text & "%'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zayv_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblVidanModem.Value = vbChecked Then
        f = f & " and TP_Zayv_VidanModem_ID='" & fltr.txtVidanModem.Tag & "'"
      End If
      If fltr.lblGelDATA_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA>=" & MakeMSSQLDate(fltr.dtpGelDATA_GE.Value)
      End If
      If fltr.lblKontLIZO.Value = vbChecked Then
        f = f & " and TP_Zayv_KontLIZO like '%" & fltr.txtKontLIZO.Text & "%'"
      End If
      If fltr.lblDoneDate_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate>=" & MakeMSSQLDate(fltr.dtpDoneDate_GE.Value)
      End If
      If fltr.lblData_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data<=" & MakeMSSQLDate(fltr.dtpData_LE.Value)
      End If
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zayv_SrochDogovor='" & fltr.cmbSrochDogovor.Text & "'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zayv_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
    jfmnuTP_Zay_3.jv.Filter.Add "AUTOTP_Zayv", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuTP_Zay_3_OnClearFilter()
   jfmnuTP_Zay_3.jv.Filter.Add "AUTOTP_Zayv", " INTSANCEStatusID='{83AE05C9-5C22-40DD-937D-46AFFE86C3AE}'"
End Sub
Private Sub jfmnuTP_Zay_3_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "TP_Zay", "Заявки" & Now, Site
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


Private Sub mnuTP_Zay_4_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuTP_Zay_4 Is Nothing Then
      Set jfmnuTP_Zay_4 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{1DD9CBCB-B944-47CF-8CD1-ABC191592394}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuTP_Zay_4.jv.journal = journal
      jfmnuTP_Zay_4.jv.OpenModal = False
      jfmnuTP_Zay_4.Caption = "Заявки :Передана в СЗТ"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{AAD87A67-60A3-49DA-8B82-73341BBCA683}'"
    jfmnuTP_Zay_4.jv.Filter.Add "AUTOTP_Zayv", f
    Dim fltr As frmTP_Zay
    Set fltr = New frmTP_Zay
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblGelDATA_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA>=" & MakeMSSQLDate(fltr.dtpGelDATA_GE.Value)
      End If
      If fltr.lblGelDATA_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA<=" & MakeMSSQLDate(fltr.dtpGelDATA_LE.Value)
      End If
      If fltr.lblData_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data>=" & MakeMSSQLDate(fltr.dtpData_GE.Value)
      End If
      If fltr.lblKontLIZO.Value = vbChecked Then
        f = f & " and TP_Zayv_KontLIZO like '%" & fltr.txtKontLIZO.Text & "%'"
      End If
      If fltr.lblVidanModem.Value = vbChecked Then
        f = f & " and TP_Zayv_VidanModem_ID='" & fltr.txtVidanModem.Tag & "'"
      End If
      If fltr.lblTheMaster.Value = vbChecked Then
        f = f & " and TP_Zayv_TheMaster_ID='" & fltr.txtTheMaster.Tag & "'"
      End If
      If fltr.lblTheCoordinator.Value = vbChecked Then
        f = f & " and TP_Zayv_TheCoordinator_ID='" & fltr.txtTheCoordinator.Tag & "'"
      End If
      If fltr.lblOperator.Value = vbChecked Then
        f = f & " and TP_Zayv_Operator_ID='" & fltr.txtOperator.Tag & "'"
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zayv_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblDoneDate_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate<=" & MakeMSSQLDate(fltr.dtpDoneDate_LE.Value)
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zayv_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
      If fltr.lblDoneDate_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate>=" & MakeMSSQLDate(fltr.dtpDoneDate_GE.Value)
      End If
      If fltr.lblKontTELEFON.Value = vbChecked Then
        f = f & " and TP_Zayv_KontTELEFON like '%" & fltr.txtKontTELEFON.Text & "%'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zayv_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblNomerZayavSYZIZ.Value = vbChecked Then
        f = f & " and TP_Zayv_NomerZayavSYZIZ like '%" & fltr.txtNomerZayavSYZIZ.Text & "%'"
      End If
      If fltr.lblTheDistrict.Value = vbChecked Then
        f = f & " and TP_Zayv_TheDistrict_ID='" & fltr.txtTheDistrict.Tag & "'"
      End If
      If fltr.lblDocOK.Value = vbChecked Then
        f = f & " and TP_Zayv_DocOK='" & fltr.cmbDocOK.Text & "'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zayv_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblGelVREMJA.Value = vbChecked Then
        f = f & " and TP_Zayv_GelVREMJA_ID='" & fltr.txtGelVREMJA.Tag & "'"
      End If
      If fltr.lblData_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data<=" & MakeMSSQLDate(fltr.dtpData_LE.Value)
      End If
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zayv_SrochDogovor='" & fltr.cmbSrochDogovor.Text & "'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zayv_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
    jfmnuTP_Zay_4.jv.Filter.Add "AUTOTP_Zayv", f
    End If
      jfmnuTP_Zay_4.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuTP_Zay_4.Show
    jfmnuTP_Zay_4.WindowState = 0
    jfmnuTP_Zay_4.ZOrder 0
End Sub
Private Sub jfmnuTP_Zay_4_OnFilter(usedefault As Boolean)
    Dim fltr As frmTP_Zay
    Dim f As String
    Set fltr = New frmTP_Zay
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{AAD87A67-60A3-49DA-8B82-73341BBCA683}'"
      If fltr.lblGelDATA_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA>=" & MakeMSSQLDate(fltr.dtpGelDATA_GE.Value)
      End If
      If fltr.lblGelDATA_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA<=" & MakeMSSQLDate(fltr.dtpGelDATA_LE.Value)
      End If
      If fltr.lblData_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data>=" & MakeMSSQLDate(fltr.dtpData_GE.Value)
      End If
      If fltr.lblKontLIZO.Value = vbChecked Then
        f = f & " and TP_Zayv_KontLIZO like '%" & fltr.txtKontLIZO.Text & "%'"
      End If
      If fltr.lblVidanModem.Value = vbChecked Then
        f = f & " and TP_Zayv_VidanModem_ID='" & fltr.txtVidanModem.Tag & "'"
      End If
      If fltr.lblTheMaster.Value = vbChecked Then
        f = f & " and TP_Zayv_TheMaster_ID='" & fltr.txtTheMaster.Tag & "'"
      End If
      If fltr.lblTheCoordinator.Value = vbChecked Then
        f = f & " and TP_Zayv_TheCoordinator_ID='" & fltr.txtTheCoordinator.Tag & "'"
      End If
      If fltr.lblOperator.Value = vbChecked Then
        f = f & " and TP_Zayv_Operator_ID='" & fltr.txtOperator.Tag & "'"
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zayv_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblDoneDate_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate<=" & MakeMSSQLDate(fltr.dtpDoneDate_LE.Value)
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zayv_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
      If fltr.lblDoneDate_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate>=" & MakeMSSQLDate(fltr.dtpDoneDate_GE.Value)
      End If
      If fltr.lblKontTELEFON.Value = vbChecked Then
        f = f & " and TP_Zayv_KontTELEFON like '%" & fltr.txtKontTELEFON.Text & "%'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zayv_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblNomerZayavSYZIZ.Value = vbChecked Then
        f = f & " and TP_Zayv_NomerZayavSYZIZ like '%" & fltr.txtNomerZayavSYZIZ.Text & "%'"
      End If
      If fltr.lblTheDistrict.Value = vbChecked Then
        f = f & " and TP_Zayv_TheDistrict_ID='" & fltr.txtTheDistrict.Tag & "'"
      End If
      If fltr.lblDocOK.Value = vbChecked Then
        f = f & " and TP_Zayv_DocOK='" & fltr.cmbDocOK.Text & "'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zayv_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblGelVREMJA.Value = vbChecked Then
        f = f & " and TP_Zayv_GelVREMJA_ID='" & fltr.txtGelVREMJA.Tag & "'"
      End If
      If fltr.lblData_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data<=" & MakeMSSQLDate(fltr.dtpData_LE.Value)
      End If
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zayv_SrochDogovor='" & fltr.cmbSrochDogovor.Text & "'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zayv_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
    jfmnuTP_Zay_4.jv.Filter.Add "AUTOTP_Zayv", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuTP_Zay_4_OnClearFilter()
   jfmnuTP_Zay_4.jv.Filter.Add "AUTOTP_Zayv", " INTSANCEStatusID='{AAD87A67-60A3-49DA-8B82-73341BBCA683}'"
End Sub
Private Sub jfmnuTP_Zay_4_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "TP_Zay", "Заявки" & Now, Site
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


Private Sub mnuTP_Zay_5_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuTP_Zay_5 Is Nothing Then
      Set jfmnuTP_Zay_5 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{1DD9CBCB-B944-47CF-8CD1-ABC191592394}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuTP_Zay_5.jv.journal = journal
      jfmnuTP_Zay_5.jv.OpenModal = False
      jfmnuTP_Zay_5.Caption = "Заявки :Выполнена"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{8EECF812-E0E6-4A36-AAB5-BCA26C183725}'"
    jfmnuTP_Zay_5.jv.Filter.Add "AUTOTP_Zayv", f
    Dim fltr As frmTP_Zay
    Set fltr = New frmTP_Zay
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTheDistrict.Value = vbChecked Then
        f = f & " and TP_Zayv_TheDistrict_ID='" & fltr.txtTheDistrict.Tag & "'"
      End If
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zayv_SrochDogovor='" & fltr.cmbSrochDogovor.Text & "'"
      End If
      If fltr.lblVidanModem.Value = vbChecked Then
        f = f & " and TP_Zayv_VidanModem_ID='" & fltr.txtVidanModem.Tag & "'"
      End If
      If fltr.lblTheCoordinator.Value = vbChecked Then
        f = f & " and TP_Zayv_TheCoordinator_ID='" & fltr.txtTheCoordinator.Tag & "'"
      End If
      If fltr.lblKontLIZO.Value = vbChecked Then
        f = f & " and TP_Zayv_KontLIZO like '%" & fltr.txtKontLIZO.Text & "%'"
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zayv_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
      If fltr.lblTheMaster.Value = vbChecked Then
        f = f & " and TP_Zayv_TheMaster_ID='" & fltr.txtTheMaster.Tag & "'"
      End If
      If fltr.lblData_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data>=" & MakeMSSQLDate(fltr.dtpData_GE.Value)
      End If
      If fltr.lblNomerZayavSYZIZ.Value = vbChecked Then
        f = f & " and TP_Zayv_NomerZayavSYZIZ like '%" & fltr.txtNomerZayavSYZIZ.Text & "%'"
      End If
      If fltr.lblDoneDate_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate>=" & MakeMSSQLDate(fltr.dtpDoneDate_GE.Value)
      End If
      If fltr.lblData_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data<=" & MakeMSSQLDate(fltr.dtpData_LE.Value)
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zayv_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblDocOK.Value = vbChecked Then
        f = f & " and TP_Zayv_DocOK='" & fltr.cmbDocOK.Text & "'"
      End If
      If fltr.lblGelDATA_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA>=" & MakeMSSQLDate(fltr.dtpGelDATA_GE.Value)
      End If
      If fltr.lblGelVREMJA.Value = vbChecked Then
        f = f & " and TP_Zayv_GelVREMJA_ID='" & fltr.txtGelVREMJA.Tag & "'"
      End If
      If fltr.lblDoneDate_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate<=" & MakeMSSQLDate(fltr.dtpDoneDate_LE.Value)
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zayv_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblGelDATA_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA<=" & MakeMSSQLDate(fltr.dtpGelDATA_LE.Value)
      End If
      If fltr.lblOperator.Value = vbChecked Then
        f = f & " and TP_Zayv_Operator_ID='" & fltr.txtOperator.Tag & "'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zayv_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zayv_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblKontTELEFON.Value = vbChecked Then
        f = f & " and TP_Zayv_KontTELEFON like '%" & fltr.txtKontTELEFON.Text & "%'"
      End If
    jfmnuTP_Zay_5.jv.Filter.Add "AUTOTP_Zayv", f
    End If
      jfmnuTP_Zay_5.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuTP_Zay_5.Show
    jfmnuTP_Zay_5.WindowState = 0
    jfmnuTP_Zay_5.ZOrder 0
End Sub
Private Sub jfmnuTP_Zay_5_OnFilter(usedefault As Boolean)
    Dim fltr As frmTP_Zay
    Dim f As String
    Set fltr = New frmTP_Zay
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{8EECF812-E0E6-4A36-AAB5-BCA26C183725}'"
      If fltr.lblTheDistrict.Value = vbChecked Then
        f = f & " and TP_Zayv_TheDistrict_ID='" & fltr.txtTheDistrict.Tag & "'"
      End If
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zayv_SrochDogovor='" & fltr.cmbSrochDogovor.Text & "'"
      End If
      If fltr.lblVidanModem.Value = vbChecked Then
        f = f & " and TP_Zayv_VidanModem_ID='" & fltr.txtVidanModem.Tag & "'"
      End If
      If fltr.lblTheCoordinator.Value = vbChecked Then
        f = f & " and TP_Zayv_TheCoordinator_ID='" & fltr.txtTheCoordinator.Tag & "'"
      End If
      If fltr.lblKontLIZO.Value = vbChecked Then
        f = f & " and TP_Zayv_KontLIZO like '%" & fltr.txtKontLIZO.Text & "%'"
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zayv_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
      If fltr.lblTheMaster.Value = vbChecked Then
        f = f & " and TP_Zayv_TheMaster_ID='" & fltr.txtTheMaster.Tag & "'"
      End If
      If fltr.lblData_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data>=" & MakeMSSQLDate(fltr.dtpData_GE.Value)
      End If
      If fltr.lblNomerZayavSYZIZ.Value = vbChecked Then
        f = f & " and TP_Zayv_NomerZayavSYZIZ like '%" & fltr.txtNomerZayavSYZIZ.Text & "%'"
      End If
      If fltr.lblDoneDate_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate>=" & MakeMSSQLDate(fltr.dtpDoneDate_GE.Value)
      End If
      If fltr.lblData_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data<=" & MakeMSSQLDate(fltr.dtpData_LE.Value)
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zayv_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblDocOK.Value = vbChecked Then
        f = f & " and TP_Zayv_DocOK='" & fltr.cmbDocOK.Text & "'"
      End If
      If fltr.lblGelDATA_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA>=" & MakeMSSQLDate(fltr.dtpGelDATA_GE.Value)
      End If
      If fltr.lblGelVREMJA.Value = vbChecked Then
        f = f & " and TP_Zayv_GelVREMJA_ID='" & fltr.txtGelVREMJA.Tag & "'"
      End If
      If fltr.lblDoneDate_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate<=" & MakeMSSQLDate(fltr.dtpDoneDate_LE.Value)
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zayv_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblGelDATA_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA<=" & MakeMSSQLDate(fltr.dtpGelDATA_LE.Value)
      End If
      If fltr.lblOperator.Value = vbChecked Then
        f = f & " and TP_Zayv_Operator_ID='" & fltr.txtOperator.Tag & "'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zayv_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zayv_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblKontTELEFON.Value = vbChecked Then
        f = f & " and TP_Zayv_KontTELEFON like '%" & fltr.txtKontTELEFON.Text & "%'"
      End If
    jfmnuTP_Zay_5.jv.Filter.Add "AUTOTP_Zayv", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuTP_Zay_5_OnClearFilter()
   jfmnuTP_Zay_5.jv.Filter.Add "AUTOTP_Zayv", " INTSANCEStatusID='{8EECF812-E0E6-4A36-AAB5-BCA26C183725}'"
End Sub
Private Sub jfmnuTP_Zay_5_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "TP_Zay", "Заявки" & Now, Site
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


Private Sub mnuTP_Zay_6_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuTP_Zay_6 Is Nothing Then
      Set jfmnuTP_Zay_6 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{1DD9CBCB-B944-47CF-8CD1-ABC191592394}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuTP_Zay_6.jv.journal = journal
      jfmnuTP_Zay_6.jv.OpenModal = False
      jfmnuTP_Zay_6.Caption = "Заявки :Выяснение"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{5E89E7F6-2C90-4717-8CAC-C4C53352F703}'"
    jfmnuTP_Zay_6.jv.Filter.Add "AUTOTP_Zayv", f
    Dim fltr As frmTP_Zay
    Set fltr = New frmTP_Zay
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zayv_SrochDogovor='" & fltr.cmbSrochDogovor.Text & "'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zayv_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblKontLIZO.Value = vbChecked Then
        f = f & " and TP_Zayv_KontLIZO like '%" & fltr.txtKontLIZO.Text & "%'"
      End If
      If fltr.lblGelDATA_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA<=" & MakeMSSQLDate(fltr.dtpGelDATA_LE.Value)
      End If
      If fltr.lblDocOK.Value = vbChecked Then
        f = f & " and TP_Zayv_DocOK='" & fltr.cmbDocOK.Text & "'"
      End If
      If fltr.lblTheCoordinator.Value = vbChecked Then
        f = f & " and TP_Zayv_TheCoordinator_ID='" & fltr.txtTheCoordinator.Tag & "'"
      End If
      If fltr.lblVidanModem.Value = vbChecked Then
        f = f & " and TP_Zayv_VidanModem_ID='" & fltr.txtVidanModem.Tag & "'"
      End If
      If fltr.lblDoneDate_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate<=" & MakeMSSQLDate(fltr.dtpDoneDate_LE.Value)
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zayv_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblOperator.Value = vbChecked Then
        f = f & " and TP_Zayv_Operator_ID='" & fltr.txtOperator.Tag & "'"
      End If
      If fltr.lblData_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data>=" & MakeMSSQLDate(fltr.dtpData_GE.Value)
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zayv_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblNomerZayavSYZIZ.Value = vbChecked Then
        f = f & " and TP_Zayv_NomerZayavSYZIZ like '%" & fltr.txtNomerZayavSYZIZ.Text & "%'"
      End If
      If fltr.lblDoneDate_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate>=" & MakeMSSQLDate(fltr.dtpDoneDate_GE.Value)
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zayv_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
      If fltr.lblGelDATA_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA>=" & MakeMSSQLDate(fltr.dtpGelDATA_GE.Value)
      End If
      If fltr.lblTheDistrict.Value = vbChecked Then
        f = f & " and TP_Zayv_TheDistrict_ID='" & fltr.txtTheDistrict.Tag & "'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zayv_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblGelVREMJA.Value = vbChecked Then
        f = f & " and TP_Zayv_GelVREMJA_ID='" & fltr.txtGelVREMJA.Tag & "'"
      End If
      If fltr.lblData_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data<=" & MakeMSSQLDate(fltr.dtpData_LE.Value)
      End If
      If fltr.lblKontTELEFON.Value = vbChecked Then
        f = f & " and TP_Zayv_KontTELEFON like '%" & fltr.txtKontTELEFON.Text & "%'"
      End If
      If fltr.lblTheMaster.Value = vbChecked Then
        f = f & " and TP_Zayv_TheMaster_ID='" & fltr.txtTheMaster.Tag & "'"
      End If
    jfmnuTP_Zay_6.jv.Filter.Add "AUTOTP_Zayv", f
    End If
      jfmnuTP_Zay_6.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuTP_Zay_6.Show
    jfmnuTP_Zay_6.WindowState = 0
    jfmnuTP_Zay_6.ZOrder 0
End Sub
Private Sub jfmnuTP_Zay_6_OnFilter(usedefault As Boolean)
    Dim fltr As frmTP_Zay
    Dim f As String
    Set fltr = New frmTP_Zay
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{5E89E7F6-2C90-4717-8CAC-C4C53352F703}'"
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zayv_SrochDogovor='" & fltr.cmbSrochDogovor.Text & "'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zayv_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblKontLIZO.Value = vbChecked Then
        f = f & " and TP_Zayv_KontLIZO like '%" & fltr.txtKontLIZO.Text & "%'"
      End If
      If fltr.lblGelDATA_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA<=" & MakeMSSQLDate(fltr.dtpGelDATA_LE.Value)
      End If
      If fltr.lblDocOK.Value = vbChecked Then
        f = f & " and TP_Zayv_DocOK='" & fltr.cmbDocOK.Text & "'"
      End If
      If fltr.lblTheCoordinator.Value = vbChecked Then
        f = f & " and TP_Zayv_TheCoordinator_ID='" & fltr.txtTheCoordinator.Tag & "'"
      End If
      If fltr.lblVidanModem.Value = vbChecked Then
        f = f & " and TP_Zayv_VidanModem_ID='" & fltr.txtVidanModem.Tag & "'"
      End If
      If fltr.lblDoneDate_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate<=" & MakeMSSQLDate(fltr.dtpDoneDate_LE.Value)
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zayv_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblOperator.Value = vbChecked Then
        f = f & " and TP_Zayv_Operator_ID='" & fltr.txtOperator.Tag & "'"
      End If
      If fltr.lblData_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data>=" & MakeMSSQLDate(fltr.dtpData_GE.Value)
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zayv_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblNomerZayavSYZIZ.Value = vbChecked Then
        f = f & " and TP_Zayv_NomerZayavSYZIZ like '%" & fltr.txtNomerZayavSYZIZ.Text & "%'"
      End If
      If fltr.lblDoneDate_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate>=" & MakeMSSQLDate(fltr.dtpDoneDate_GE.Value)
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zayv_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
      If fltr.lblGelDATA_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA>=" & MakeMSSQLDate(fltr.dtpGelDATA_GE.Value)
      End If
      If fltr.lblTheDistrict.Value = vbChecked Then
        f = f & " and TP_Zayv_TheDistrict_ID='" & fltr.txtTheDistrict.Tag & "'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zayv_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblGelVREMJA.Value = vbChecked Then
        f = f & " and TP_Zayv_GelVREMJA_ID='" & fltr.txtGelVREMJA.Tag & "'"
      End If
      If fltr.lblData_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data<=" & MakeMSSQLDate(fltr.dtpData_LE.Value)
      End If
      If fltr.lblKontTELEFON.Value = vbChecked Then
        f = f & " and TP_Zayv_KontTELEFON like '%" & fltr.txtKontTELEFON.Text & "%'"
      End If
      If fltr.lblTheMaster.Value = vbChecked Then
        f = f & " and TP_Zayv_TheMaster_ID='" & fltr.txtTheMaster.Tag & "'"
      End If
    jfmnuTP_Zay_6.jv.Filter.Add "AUTOTP_Zayv", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuTP_Zay_6_OnClearFilter()
   jfmnuTP_Zay_6.jv.Filter.Add "AUTOTP_Zayv", " INTSANCEStatusID='{5E89E7F6-2C90-4717-8CAC-C4C53352F703}'"
End Sub
Private Sub jfmnuTP_Zay_6_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "TP_Zay", "Заявки" & Now, Site
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


Private Sub mnuTP_Zay_7_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuTP_Zay_7 Is Nothing Then
      Set jfmnuTP_Zay_7 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{1DD9CBCB-B944-47CF-8CD1-ABC191592394}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuTP_Zay_7.jv.journal = journal
      jfmnuTP_Zay_7.jv.OpenModal = False
      jfmnuTP_Zay_7.Caption = "Заявки :У инженера"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{6F6AB4CD-08E5-4F22-BE43-C529B53DE79D}'"
    jfmnuTP_Zay_7.jv.Filter.Add "AUTOTP_Zayv", f
    Dim fltr As frmTP_Zay
    Set fltr = New frmTP_Zay
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblKontTELEFON.Value = vbChecked Then
        f = f & " and TP_Zayv_KontTELEFON like '%" & fltr.txtKontTELEFON.Text & "%'"
      End If
      If fltr.lblOperator.Value = vbChecked Then
        f = f & " and TP_Zayv_Operator_ID='" & fltr.txtOperator.Tag & "'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zayv_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zayv_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblTheMaster.Value = vbChecked Then
        f = f & " and TP_Zayv_TheMaster_ID='" & fltr.txtTheMaster.Tag & "'"
      End If
      If fltr.lblTheCoordinator.Value = vbChecked Then
        f = f & " and TP_Zayv_TheCoordinator_ID='" & fltr.txtTheCoordinator.Tag & "'"
      End If
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zayv_SrochDogovor='" & fltr.cmbSrochDogovor.Text & "'"
      End If
      If fltr.lblGelDATA_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA>=" & MakeMSSQLDate(fltr.dtpGelDATA_GE.Value)
      End If
      If fltr.lblDoneDate_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate>=" & MakeMSSQLDate(fltr.dtpDoneDate_GE.Value)
      End If
      If fltr.lblKontLIZO.Value = vbChecked Then
        f = f & " and TP_Zayv_KontLIZO like '%" & fltr.txtKontLIZO.Text & "%'"
      End If
      If fltr.lblData_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data<=" & MakeMSSQLDate(fltr.dtpData_LE.Value)
      End If
      If fltr.lblGelVREMJA.Value = vbChecked Then
        f = f & " and TP_Zayv_GelVREMJA_ID='" & fltr.txtGelVREMJA.Tag & "'"
      End If
      If fltr.lblData_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data>=" & MakeMSSQLDate(fltr.dtpData_GE.Value)
      End If
      If fltr.lblVidanModem.Value = vbChecked Then
        f = f & " and TP_Zayv_VidanModem_ID='" & fltr.txtVidanModem.Tag & "'"
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zayv_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblDocOK.Value = vbChecked Then
        f = f & " and TP_Zayv_DocOK='" & fltr.cmbDocOK.Text & "'"
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zayv_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
      If fltr.lblDoneDate_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate<=" & MakeMSSQLDate(fltr.dtpDoneDate_LE.Value)
      End If
      If fltr.lblNomerZayavSYZIZ.Value = vbChecked Then
        f = f & " and TP_Zayv_NomerZayavSYZIZ like '%" & fltr.txtNomerZayavSYZIZ.Text & "%'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zayv_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblTheDistrict.Value = vbChecked Then
        f = f & " and TP_Zayv_TheDistrict_ID='" & fltr.txtTheDistrict.Tag & "'"
      End If
      If fltr.lblGelDATA_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA<=" & MakeMSSQLDate(fltr.dtpGelDATA_LE.Value)
      End If
    jfmnuTP_Zay_7.jv.Filter.Add "AUTOTP_Zayv", f
    End If
      jfmnuTP_Zay_7.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuTP_Zay_7.Show
    jfmnuTP_Zay_7.WindowState = 0
    jfmnuTP_Zay_7.ZOrder 0
End Sub
Private Sub jfmnuTP_Zay_7_OnFilter(usedefault As Boolean)
    Dim fltr As frmTP_Zay
    Dim f As String
    Set fltr = New frmTP_Zay
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{6F6AB4CD-08E5-4F22-BE43-C529B53DE79D}'"
      If fltr.lblKontTELEFON.Value = vbChecked Then
        f = f & " and TP_Zayv_KontTELEFON like '%" & fltr.txtKontTELEFON.Text & "%'"
      End If
      If fltr.lblOperator.Value = vbChecked Then
        f = f & " and TP_Zayv_Operator_ID='" & fltr.txtOperator.Tag & "'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zayv_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zayv_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblTheMaster.Value = vbChecked Then
        f = f & " and TP_Zayv_TheMaster_ID='" & fltr.txtTheMaster.Tag & "'"
      End If
      If fltr.lblTheCoordinator.Value = vbChecked Then
        f = f & " and TP_Zayv_TheCoordinator_ID='" & fltr.txtTheCoordinator.Tag & "'"
      End If
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zayv_SrochDogovor='" & fltr.cmbSrochDogovor.Text & "'"
      End If
      If fltr.lblGelDATA_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA>=" & MakeMSSQLDate(fltr.dtpGelDATA_GE.Value)
      End If
      If fltr.lblDoneDate_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate>=" & MakeMSSQLDate(fltr.dtpDoneDate_GE.Value)
      End If
      If fltr.lblKontLIZO.Value = vbChecked Then
        f = f & " and TP_Zayv_KontLIZO like '%" & fltr.txtKontLIZO.Text & "%'"
      End If
      If fltr.lblData_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data<=" & MakeMSSQLDate(fltr.dtpData_LE.Value)
      End If
      If fltr.lblGelVREMJA.Value = vbChecked Then
        f = f & " and TP_Zayv_GelVREMJA_ID='" & fltr.txtGelVREMJA.Tag & "'"
      End If
      If fltr.lblData_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data>=" & MakeMSSQLDate(fltr.dtpData_GE.Value)
      End If
      If fltr.lblVidanModem.Value = vbChecked Then
        f = f & " and TP_Zayv_VidanModem_ID='" & fltr.txtVidanModem.Tag & "'"
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zayv_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblDocOK.Value = vbChecked Then
        f = f & " and TP_Zayv_DocOK='" & fltr.cmbDocOK.Text & "'"
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zayv_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
      If fltr.lblDoneDate_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate<=" & MakeMSSQLDate(fltr.dtpDoneDate_LE.Value)
      End If
      If fltr.lblNomerZayavSYZIZ.Value = vbChecked Then
        f = f & " and TP_Zayv_NomerZayavSYZIZ like '%" & fltr.txtNomerZayavSYZIZ.Text & "%'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zayv_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblTheDistrict.Value = vbChecked Then
        f = f & " and TP_Zayv_TheDistrict_ID='" & fltr.txtTheDistrict.Tag & "'"
      End If
      If fltr.lblGelDATA_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA<=" & MakeMSSQLDate(fltr.dtpGelDATA_LE.Value)
      End If
    jfmnuTP_Zay_7.jv.Filter.Add "AUTOTP_Zayv", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuTP_Zay_7_OnClearFilter()
   jfmnuTP_Zay_7.jv.Filter.Add "AUTOTP_Zayv", " INTSANCEStatusID='{6F6AB4CD-08E5-4F22-BE43-C529B53DE79D}'"
End Sub
Private Sub jfmnuTP_Zay_7_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "TP_Zay", "Заявки" & Now, Site
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


Private Sub mnuTP_Zay_8_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuTP_Zay_8 Is Nothing Then
      Set jfmnuTP_Zay_8 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{1DD9CBCB-B944-47CF-8CD1-ABC191592394}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuTP_Zay_8.jv.journal = journal
      jfmnuTP_Zay_8.jv.OpenModal = False
      jfmnuTP_Zay_8.Caption = "Заявки :Получена"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{8222C19C-D6B2-438A-800E-CA0594D486D4}'"
    jfmnuTP_Zay_8.jv.Filter.Add "AUTOTP_Zayv", f
    Dim fltr As frmTP_Zay
    Set fltr = New frmTP_Zay
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblVidanModem.Value = vbChecked Then
        f = f & " and TP_Zayv_VidanModem_ID='" & fltr.txtVidanModem.Tag & "'"
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zayv_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
      If fltr.lblDoneDate_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate<=" & MakeMSSQLDate(fltr.dtpDoneDate_LE.Value)
      End If
      If fltr.lblDoneDate_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate>=" & MakeMSSQLDate(fltr.dtpDoneDate_GE.Value)
      End If
      If fltr.lblOperator.Value = vbChecked Then
        f = f & " and TP_Zayv_Operator_ID='" & fltr.txtOperator.Tag & "'"
      End If
      If fltr.lblKontTELEFON.Value = vbChecked Then
        f = f & " and TP_Zayv_KontTELEFON like '%" & fltr.txtKontTELEFON.Text & "%'"
      End If
      If fltr.lblTheDistrict.Value = vbChecked Then
        f = f & " and TP_Zayv_TheDistrict_ID='" & fltr.txtTheDistrict.Tag & "'"
      End If
      If fltr.lblKontLIZO.Value = vbChecked Then
        f = f & " and TP_Zayv_KontLIZO like '%" & fltr.txtKontLIZO.Text & "%'"
      End If
      If fltr.lblData_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data>=" & MakeMSSQLDate(fltr.dtpData_GE.Value)
      End If
      If fltr.lblNomerZayavSYZIZ.Value = vbChecked Then
        f = f & " and TP_Zayv_NomerZayavSYZIZ like '%" & fltr.txtNomerZayavSYZIZ.Text & "%'"
      End If
      If fltr.lblTheMaster.Value = vbChecked Then
        f = f & " and TP_Zayv_TheMaster_ID='" & fltr.txtTheMaster.Tag & "'"
      End If
      If fltr.lblGelVREMJA.Value = vbChecked Then
        f = f & " and TP_Zayv_GelVREMJA_ID='" & fltr.txtGelVREMJA.Tag & "'"
      End If
      If fltr.lblData_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data<=" & MakeMSSQLDate(fltr.dtpData_LE.Value)
      End If
      If fltr.lblGelDATA_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA<=" & MakeMSSQLDate(fltr.dtpGelDATA_LE.Value)
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zayv_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblDocOK.Value = vbChecked Then
        f = f & " and TP_Zayv_DocOK='" & fltr.cmbDocOK.Text & "'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zayv_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zayv_SrochDogovor='" & fltr.cmbSrochDogovor.Text & "'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zayv_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zayv_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblGelDATA_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA>=" & MakeMSSQLDate(fltr.dtpGelDATA_GE.Value)
      End If
      If fltr.lblTheCoordinator.Value = vbChecked Then
        f = f & " and TP_Zayv_TheCoordinator_ID='" & fltr.txtTheCoordinator.Tag & "'"
      End If
    jfmnuTP_Zay_8.jv.Filter.Add "AUTOTP_Zayv", f
    End If
      jfmnuTP_Zay_8.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuTP_Zay_8.Show
    jfmnuTP_Zay_8.WindowState = 0
    jfmnuTP_Zay_8.ZOrder 0
End Sub
Private Sub jfmnuTP_Zay_8_OnFilter(usedefault As Boolean)
    Dim fltr As frmTP_Zay
    Dim f As String
    Set fltr = New frmTP_Zay
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{8222C19C-D6B2-438A-800E-CA0594D486D4}'"
      If fltr.lblVidanModem.Value = vbChecked Then
        f = f & " and TP_Zayv_VidanModem_ID='" & fltr.txtVidanModem.Tag & "'"
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zayv_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
      If fltr.lblDoneDate_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate<=" & MakeMSSQLDate(fltr.dtpDoneDate_LE.Value)
      End If
      If fltr.lblDoneDate_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_DoneDate>=" & MakeMSSQLDate(fltr.dtpDoneDate_GE.Value)
      End If
      If fltr.lblOperator.Value = vbChecked Then
        f = f & " and TP_Zayv_Operator_ID='" & fltr.txtOperator.Tag & "'"
      End If
      If fltr.lblKontTELEFON.Value = vbChecked Then
        f = f & " and TP_Zayv_KontTELEFON like '%" & fltr.txtKontTELEFON.Text & "%'"
      End If
      If fltr.lblTheDistrict.Value = vbChecked Then
        f = f & " and TP_Zayv_TheDistrict_ID='" & fltr.txtTheDistrict.Tag & "'"
      End If
      If fltr.lblKontLIZO.Value = vbChecked Then
        f = f & " and TP_Zayv_KontLIZO like '%" & fltr.txtKontLIZO.Text & "%'"
      End If
      If fltr.lblData_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data>=" & MakeMSSQLDate(fltr.dtpData_GE.Value)
      End If
      If fltr.lblNomerZayavSYZIZ.Value = vbChecked Then
        f = f & " and TP_Zayv_NomerZayavSYZIZ like '%" & fltr.txtNomerZayavSYZIZ.Text & "%'"
      End If
      If fltr.lblTheMaster.Value = vbChecked Then
        f = f & " and TP_Zayv_TheMaster_ID='" & fltr.txtTheMaster.Tag & "'"
      End If
      If fltr.lblGelVREMJA.Value = vbChecked Then
        f = f & " and TP_Zayv_GelVREMJA_ID='" & fltr.txtGelVREMJA.Tag & "'"
      End If
      If fltr.lblData_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_Data<=" & MakeMSSQLDate(fltr.dtpData_LE.Value)
      End If
      If fltr.lblGelDATA_LE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA<=" & MakeMSSQLDate(fltr.dtpGelDATA_LE.Value)
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zayv_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblDocOK.Value = vbChecked Then
        f = f & " and TP_Zayv_DocOK='" & fltr.cmbDocOK.Text & "'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zayv_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zayv_SrochDogovor='" & fltr.cmbSrochDogovor.Text & "'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zayv_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zayv_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblGelDATA_GE.Value = vbChecked Then
        f = f & " and TP_Zayv_GelDATA>=" & MakeMSSQLDate(fltr.dtpGelDATA_GE.Value)
      End If
      If fltr.lblTheCoordinator.Value = vbChecked Then
        f = f & " and TP_Zayv_TheCoordinator_ID='" & fltr.txtTheCoordinator.Tag & "'"
      End If
    jfmnuTP_Zay_8.jv.Filter.Add "AUTOTP_Zayv", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuTP_Zay_8_OnClearFilter()
   jfmnuTP_Zay_8.jv.Filter.Add "AUTOTP_Zayv", " INTSANCEStatusID='{8222C19C-D6B2-438A-800E-CA0594D486D4}'"
End Sub
Private Sub jfmnuTP_Zay_8_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "TP_Zay", "Заявки" & Now, Site
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




Private Sub mnuTP_RaspisPoesd_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuTP_RaspisPoesd Is Nothing Then
      Set jfmnuTP_RaspisPoesd = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{40195F21-6030-4112-8A49-0C8D87DF0964}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuTP_RaspisPoesd.jv.journal = journal
      jfmnuTP_RaspisPoesd.jv.OpenModal = False
      jfmnuTP_RaspisPoesd.Caption = "Расписание поездок инженеров"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
    Dim fltr As frmTP_RaspisPoesd
    Set fltr = New frmTP_RaspisPoesd
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblData_LE.Value = vbChecked Then
        f = f & " and TP_Rasp_Rasp_Data<=" & MakeMSSQLDate(fltr.dtpData_LE.Value)
      End If
      If fltr.lblVipolnenno.Value = vbChecked Then
        f = f & " and TP_Rasp_Rasp_Vipolnenno='" & fltr.cmbVipolnenno.Text & "'"
      End If
      If fltr.lblKomment.Value = vbChecked Then
        f = f & " and TP_Rasp_Rasp_Komment like '%" & fltr.txtKomment.Text & "%'"
      End If
      If fltr.lblData_GE.Value = vbChecked Then
        f = f & " and TP_Rasp_Rasp_Data>=" & MakeMSSQLDate(fltr.dtpData_GE.Value)
      End If
      If fltr.lblIng.Value = vbChecked Then
        f = f & " and TP_Rasp_Rasp_Ing_ID='" & fltr.txtIng.Tag & "'"
      End If
      If fltr.lblZayav.Value = vbChecked Then
        f = f & " and TP_Rasp_Rasp_Zayav_ID='" & fltr.txtZayav.Tag & "'"
      End If
      If fltr.lblVremjaVipoln.Value = vbChecked Then
        f = f & " and TP_Rasp_Rasp_VremjaVipoln_ID='" & fltr.txtVremjaVipoln.Tag & "'"
      End If
    jfmnuTP_RaspisPoesd.jv.Filter.Add "AUTOTP_Rasp_Rasp", f
    End If
      jfmnuTP_RaspisPoesd.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuTP_RaspisPoesd.Show
    jfmnuTP_RaspisPoesd.WindowState = 0
    jfmnuTP_RaspisPoesd.ZOrder 0
End Sub
Private Sub jfmnuTP_RaspisPoesd_OnFilter(usedefault As Boolean)
    Dim fltr As frmTP_RaspisPoesd
    Dim f As String
    Set fltr = New frmTP_RaspisPoesd
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
      If fltr.lblData_LE.Value = vbChecked Then
        f = f & " and TP_Rasp_Rasp_Data<=" & MakeMSSQLDate(fltr.dtpData_LE.Value)
      End If
      If fltr.lblVipolnenno.Value = vbChecked Then
        f = f & " and TP_Rasp_Rasp_Vipolnenno='" & fltr.cmbVipolnenno.Text & "'"
      End If
      If fltr.lblKomment.Value = vbChecked Then
        f = f & " and TP_Rasp_Rasp_Komment like '%" & fltr.txtKomment.Text & "%'"
      End If
      If fltr.lblData_GE.Value = vbChecked Then
        f = f & " and TP_Rasp_Rasp_Data>=" & MakeMSSQLDate(fltr.dtpData_GE.Value)
      End If
      If fltr.lblIng.Value = vbChecked Then
        f = f & " and TP_Rasp_Rasp_Ing_ID='" & fltr.txtIng.Tag & "'"
      End If
      If fltr.lblZayav.Value = vbChecked Then
        f = f & " and TP_Rasp_Rasp_Zayav_ID='" & fltr.txtZayav.Tag & "'"
      End If
      If fltr.lblVremjaVipoln.Value = vbChecked Then
        f = f & " and TP_Rasp_Rasp_VremjaVipoln_ID='" & fltr.txtVremjaVipoln.Tag & "'"
      End If
    jfmnuTP_RaspisPoesd.jv.Filter.Add "AUTOTP_Rasp_Rasp", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuTP_RaspisPoesd_OnClearFilter()
End Sub
Private Sub jfmnuTP_RaspisPoesd_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "TP_RaspisPoesd", "Расписание поездок инженеров" & Now, Site
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




Private Sub UnloadObjects()





Unload jfmnuAllTP_Zay
Set jfmnuAllTP_Zay = Nothing

Unload jfmnuTP_Zay_1
Set jfmnuTP_Zay_1 = Nothing

Unload jfmnuTP_Zay_2
Set jfmnuTP_Zay_2 = Nothing

Unload jfmnuTP_Zay_3
Set jfmnuTP_Zay_3 = Nothing

Unload jfmnuTP_Zay_4
Set jfmnuTP_Zay_4 = Nothing

Unload jfmnuTP_Zay_5
Set jfmnuTP_Zay_5 = Nothing

Unload jfmnuTP_Zay_6
Set jfmnuTP_Zay_6 = Nothing

Unload jfmnuTP_Zay_7
Set jfmnuTP_Zay_7 = Nothing

Unload jfmnuTP_Zay_8
Set jfmnuTP_Zay_8 = Nothing

Unload jfmnuTP_RaspisPoesd
Set jfmnuTP_RaspisPoesd = Nothing

End Sub



