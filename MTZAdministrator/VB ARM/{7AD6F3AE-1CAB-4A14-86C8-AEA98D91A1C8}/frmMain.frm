VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "richtx32.ocx"
Begin VB.MDIForm frmMain 
   BackColor       =   &H8000000C&
   Caption         =   "Главное окно"
   ClientHeight    =   6705
   ClientLeft      =   165
   ClientTop       =   735
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
      Begin VB.Menu mnuITTOUT 
         Caption         =   "Отгрузка"
         Begin VB.Menu mnuAllITTOUT 
            Caption         =   "Отгрузка - все состояния"
         End
         Begin VB.Menu mnuITTOUT_1 
            Caption         =   "Отгрузка :Оформляется"
         End
         Begin VB.Menu mnuITTOUT_2 
            Caption         =   "Отгрузка :Идет отгрузка"
         End
         Begin VB.Menu mnuITTOUT_3 
            Caption         =   "Отгрузка :Обработка завершена"
         End
         Begin VB.Menu mnuITTOUT_4 
            Caption         =   "Отгрузка :Отгрузка завершена"
         End
      End
      Begin VB.Menu mnuITTIN 
         Caption         =   "Приемка груза"
         Begin VB.Menu mnuAllITTIN 
            Caption         =   "Приемка груза - все состояния"
         End
         Begin VB.Menu mnuITTIN_1 
            Caption         =   "Приемка груза :Оформляется"
         End
         Begin VB.Menu mnuITTIN_2 
            Caption         =   "Приемка груза :Приемка заершена"
         End
         Begin VB.Menu mnuITTIN_3 
            Caption         =   "Приемка груза :Идет приемка"
         End
         Begin VB.Menu mnuITTIN_4 
            Caption         =   "Приемка груза :Приемка обработана"
         End
      End
      Begin VB.Menu mnuITTTZ 
         Caption         =   "Транспортный заказ"
         Begin VB.Menu mnuAllITTTZ 
            Caption         =   "Транспортный заказ - все состояния"
         End
         Begin VB.Menu mnuITTTZ_1 
            Caption         =   "Транспортный заказ :Обработан"
         End
         Begin VB.Menu mnuITTTZ_2 
            Caption         =   "Транспортный заказ :Загружен из файла"
         End
         Begin VB.Menu mnuITTTZ_3 
            Caption         =   "Транспортный заказ :Создан"
         End
      End
   End
   Begin VB.Menu mnuDictionary 
      Caption         =   "Справочники"
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

Dim WithEvents jfmnuAllITTOUT As frmJournalShow
Attribute jfmnuAllITTOUT.VB_VarHelpID = -1

Dim WithEvents jfmnuITTOUT_1 As frmJournalShow
Attribute jfmnuITTOUT_1.VB_VarHelpID = -1

Dim WithEvents jfmnuITTOUT_2 As frmJournalShow
Attribute jfmnuITTOUT_2.VB_VarHelpID = -1

Dim WithEvents jfmnuITTOUT_3 As frmJournalShow
Attribute jfmnuITTOUT_3.VB_VarHelpID = -1

Dim WithEvents jfmnuITTOUT_4 As frmJournalShow
Attribute jfmnuITTOUT_4.VB_VarHelpID = -1



Dim WithEvents jfmnuAllITTIN As frmJournalShow
Attribute jfmnuAllITTIN.VB_VarHelpID = -1

Dim WithEvents jfmnuITTIN_1 As frmJournalShow
Attribute jfmnuITTIN_1.VB_VarHelpID = -1

Dim WithEvents jfmnuITTIN_2 As frmJournalShow
Attribute jfmnuITTIN_2.VB_VarHelpID = -1

Dim WithEvents jfmnuITTIN_3 As frmJournalShow
Attribute jfmnuITTIN_3.VB_VarHelpID = -1

Dim WithEvents jfmnuITTIN_4 As frmJournalShow
Attribute jfmnuITTIN_4.VB_VarHelpID = -1



Dim WithEvents jfmnuAllITTTZ As frmJournalShow
Attribute jfmnuAllITTTZ.VB_VarHelpID = -1

Dim WithEvents jfmnuITTTZ_1 As frmJournalShow
Attribute jfmnuITTTZ_1.VB_VarHelpID = -1

Dim WithEvents jfmnuITTTZ_2 As frmJournalShow
Attribute jfmnuITTTZ_2.VB_VarHelpID = -1

Dim WithEvents jfmnuITTTZ_3 As frmJournalShow
Attribute jfmnuITTTZ_3.VB_VarHelpID = -1













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


Private Sub mnuAllITTOUT_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuAllITTOUT Is Nothing Then
      Set jfmnuAllITTOUT = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{6EE193F7-B45F-4D5E-A6E0-391C006CB646}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuAllITTOUT.jv.journal = journal
      jfmnuAllITTOUT.jv.OpenModal = False
      jfmnuAllITTOUT.Caption = "Отгрузка - все состояния"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
    Dim fltr As frmITTOUT
    Set fltr = New frmITTOUT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblShipOrder.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ShipOrder_ID='" & fltr.txtShipOrder.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
    jfmnuAllITTOUT.jv.Filter.Add "AUTOITTOUT_DEF", f
    End If
      jfmnuAllITTOUT.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuAllITTOUT.Show
    jfmnuAllITTOUT.WindowState = 0
    jfmnuAllITTOUT.ZOrder 0
End Sub
Private Sub jfmnuAllITTOUT_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTOUT
    Dim f As String
    Set fltr = New frmITTOUT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblShipOrder.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ShipOrder_ID='" & fltr.txtShipOrder.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
    jfmnuAllITTOUT.jv.Filter.Add "AUTOITTOUT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuAllITTOUT_OnClearFilter()
End Sub
Private Sub jfmnuAllITTOUT_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTOUT", "Отгрузка" & Now, Site
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


Private Sub mnuITTOUT_1_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITTOUT_1 Is Nothing Then
      Set jfmnuITTOUT_1 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{6EE193F7-B45F-4D5E-A6E0-391C006CB646}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITTOUT_1.jv.journal = journal
      jfmnuITTOUT_1.jv.OpenModal = False
      jfmnuITTOUT_1.Caption = "Отгрузка :Оформляется"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{CDCAFF7F-B013-40AF-BE61-1A27E35DB946}'"
    jfmnuITTOUT_1.jv.Filter.Add "AUTOITTOUT_DEF", f
    Dim fltr As frmITTOUT
    Set fltr = New frmITTOUT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblShipOrder.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ShipOrder_ID='" & fltr.txtShipOrder.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
    jfmnuITTOUT_1.jv.Filter.Add "AUTOITTOUT_DEF", f
    End If
      jfmnuITTOUT_1.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITTOUT_1.Show
    jfmnuITTOUT_1.WindowState = 0
    jfmnuITTOUT_1.ZOrder 0
End Sub
Private Sub jfmnuITTOUT_1_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTOUT
    Dim f As String
    Set fltr = New frmITTOUT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{CDCAFF7F-B013-40AF-BE61-1A27E35DB946}'"
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblShipOrder.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ShipOrder_ID='" & fltr.txtShipOrder.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
    jfmnuITTOUT_1.jv.Filter.Add "AUTOITTOUT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTOUT_1_OnClearFilter()
   jfmnuITTOUT_1.jv.Filter.Add "AUTOITTOUT_DEF", " INTSANCEStatusID='{CDCAFF7F-B013-40AF-BE61-1A27E35DB946}'"
End Sub
Private Sub jfmnuITTOUT_1_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTOUT", "Отгрузка" & Now, Site
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


Private Sub mnuITTOUT_2_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITTOUT_2 Is Nothing Then
      Set jfmnuITTOUT_2 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{6EE193F7-B45F-4D5E-A6E0-391C006CB646}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITTOUT_2.jv.journal = journal
      jfmnuITTOUT_2.jv.OpenModal = False
      jfmnuITTOUT_2.Caption = "Отгрузка :Идет отгрузка"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{70853C28-84B5-434E-8413-52DF8FBBB49B}'"
    jfmnuITTOUT_2.jv.Filter.Add "AUTOITTOUT_DEF", f
    Dim fltr As frmITTOUT
    Set fltr = New frmITTOUT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblShipOrder.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ShipOrder_ID='" & fltr.txtShipOrder.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
    jfmnuITTOUT_2.jv.Filter.Add "AUTOITTOUT_DEF", f
    End If
      jfmnuITTOUT_2.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITTOUT_2.Show
    jfmnuITTOUT_2.WindowState = 0
    jfmnuITTOUT_2.ZOrder 0
End Sub
Private Sub jfmnuITTOUT_2_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTOUT
    Dim f As String
    Set fltr = New frmITTOUT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{70853C28-84B5-434E-8413-52DF8FBBB49B}'"
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblShipOrder.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ShipOrder_ID='" & fltr.txtShipOrder.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
    jfmnuITTOUT_2.jv.Filter.Add "AUTOITTOUT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTOUT_2_OnClearFilter()
   jfmnuITTOUT_2.jv.Filter.Add "AUTOITTOUT_DEF", " INTSANCEStatusID='{70853C28-84B5-434E-8413-52DF8FBBB49B}'"
End Sub
Private Sub jfmnuITTOUT_2_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTOUT", "Отгрузка" & Now, Site
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


Private Sub mnuITTOUT_3_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITTOUT_3 Is Nothing Then
      Set jfmnuITTOUT_3 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{6EE193F7-B45F-4D5E-A6E0-391C006CB646}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITTOUT_3.jv.journal = journal
      jfmnuITTOUT_3.jv.OpenModal = False
      jfmnuITTOUT_3.Caption = "Отгрузка :Обработка завершена"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{2CDDB562-63D7-483E-B95E-B579A9096CCC}'"
    jfmnuITTOUT_3.jv.Filter.Add "AUTOITTOUT_DEF", f
    Dim fltr As frmITTOUT
    Set fltr = New frmITTOUT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblShipOrder.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ShipOrder_ID='" & fltr.txtShipOrder.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
    jfmnuITTOUT_3.jv.Filter.Add "AUTOITTOUT_DEF", f
    End If
      jfmnuITTOUT_3.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITTOUT_3.Show
    jfmnuITTOUT_3.WindowState = 0
    jfmnuITTOUT_3.ZOrder 0
End Sub
Private Sub jfmnuITTOUT_3_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTOUT
    Dim f As String
    Set fltr = New frmITTOUT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{2CDDB562-63D7-483E-B95E-B579A9096CCC}'"
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblShipOrder.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ShipOrder_ID='" & fltr.txtShipOrder.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
    jfmnuITTOUT_3.jv.Filter.Add "AUTOITTOUT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTOUT_3_OnClearFilter()
   jfmnuITTOUT_3.jv.Filter.Add "AUTOITTOUT_DEF", " INTSANCEStatusID='{2CDDB562-63D7-483E-B95E-B579A9096CCC}'"
End Sub
Private Sub jfmnuITTOUT_3_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTOUT", "Отгрузка" & Now, Site
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


Private Sub mnuITTOUT_4_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITTOUT_4 Is Nothing Then
      Set jfmnuITTOUT_4 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{6EE193F7-B45F-4D5E-A6E0-391C006CB646}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITTOUT_4.jv.journal = journal
      jfmnuITTOUT_4.jv.OpenModal = False
      jfmnuITTOUT_4.Caption = "Отгрузка :Отгрузка завершена"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{881CBAAC-BE9D-4216-AB25-ED3B2761F82F}'"
    jfmnuITTOUT_4.jv.Filter.Add "AUTOITTOUT_DEF", f
    Dim fltr As frmITTOUT
    Set fltr = New frmITTOUT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblShipOrder.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ShipOrder_ID='" & fltr.txtShipOrder.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
    jfmnuITTOUT_4.jv.Filter.Add "AUTOITTOUT_DEF", f
    End If
      jfmnuITTOUT_4.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITTOUT_4.Show
    jfmnuITTOUT_4.WindowState = 0
    jfmnuITTOUT_4.ZOrder 0
End Sub
Private Sub jfmnuITTOUT_4_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTOUT
    Dim f As String
    Set fltr = New frmITTOUT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{881CBAAC-BE9D-4216-AB25-ED3B2761F82F}'"
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblShipOrder.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ShipOrder_ID='" & fltr.txtShipOrder.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
    jfmnuITTOUT_4.jv.Filter.Add "AUTOITTOUT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTOUT_4_OnClearFilter()
   jfmnuITTOUT_4.jv.Filter.Add "AUTOITTOUT_DEF", " INTSANCEStatusID='{881CBAAC-BE9D-4216-AB25-ED3B2761F82F}'"
End Sub
Private Sub jfmnuITTOUT_4_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTOUT", "Отгрузка" & Now, Site
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




Private Sub mnuAllITTIN_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuAllITTIN Is Nothing Then
      Set jfmnuAllITTIN = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{5AC03393-7686-4423-AD74-98673546FBA3}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuAllITTIN.jv.journal = journal
      jfmnuAllITTIN.jv.OpenModal = False
      jfmnuAllITTIN.Caption = "Приемка груза - все состояния"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
    Dim fltr As frmITTIN
    Set fltr = New frmITTIN
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblQryCode.Value = vbChecked Then
        f = f & " and ITTIN_DEF_QryCode_ID='" & fltr.txtQryCode.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
    jfmnuAllITTIN.jv.Filter.Add "AUTOITTIN_DEF", f
    End If
      jfmnuAllITTIN.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuAllITTIN.Show
    jfmnuAllITTIN.WindowState = 0
    jfmnuAllITTIN.ZOrder 0
End Sub
Private Sub jfmnuAllITTIN_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTIN
    Dim f As String
    Set fltr = New frmITTIN
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblQryCode.Value = vbChecked Then
        f = f & " and ITTIN_DEF_QryCode_ID='" & fltr.txtQryCode.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
    jfmnuAllITTIN.jv.Filter.Add "AUTOITTIN_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuAllITTIN_OnClearFilter()
End Sub
Private Sub jfmnuAllITTIN_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTIN", "Приемка груза" & Now, Site
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


Private Sub mnuITTIN_1_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITTIN_1 Is Nothing Then
      Set jfmnuITTIN_1 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{5AC03393-7686-4423-AD74-98673546FBA3}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITTIN_1.jv.journal = journal
      jfmnuITTIN_1.jv.OpenModal = False
      jfmnuITTIN_1.Caption = "Приемка груза :Оформляется"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{49A919F7-94A6-49DE-9280-1EEAC973647B}'"
    jfmnuITTIN_1.jv.Filter.Add "AUTOITTIN_DEF", f
    Dim fltr As frmITTIN
    Set fltr = New frmITTIN
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblQryCode.Value = vbChecked Then
        f = f & " and ITTIN_DEF_QryCode_ID='" & fltr.txtQryCode.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
    jfmnuITTIN_1.jv.Filter.Add "AUTOITTIN_DEF", f
    End If
      jfmnuITTIN_1.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITTIN_1.Show
    jfmnuITTIN_1.WindowState = 0
    jfmnuITTIN_1.ZOrder 0
End Sub
Private Sub jfmnuITTIN_1_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTIN
    Dim f As String
    Set fltr = New frmITTIN
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{49A919F7-94A6-49DE-9280-1EEAC973647B}'"
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblQryCode.Value = vbChecked Then
        f = f & " and ITTIN_DEF_QryCode_ID='" & fltr.txtQryCode.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
    jfmnuITTIN_1.jv.Filter.Add "AUTOITTIN_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTIN_1_OnClearFilter()
   jfmnuITTIN_1.jv.Filter.Add "AUTOITTIN_DEF", " INTSANCEStatusID='{49A919F7-94A6-49DE-9280-1EEAC973647B}'"
End Sub
Private Sub jfmnuITTIN_1_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTIN", "Приемка груза" & Now, Site
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


Private Sub mnuITTIN_2_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITTIN_2 Is Nothing Then
      Set jfmnuITTIN_2 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{5AC03393-7686-4423-AD74-98673546FBA3}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITTIN_2.jv.journal = journal
      jfmnuITTIN_2.jv.OpenModal = False
      jfmnuITTIN_2.Caption = "Приемка груза :Приемка заершена"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{E3728A5B-6B62-48BF-9E5A-D4F0BCBFC75B}'"
    jfmnuITTIN_2.jv.Filter.Add "AUTOITTIN_DEF", f
    Dim fltr As frmITTIN
    Set fltr = New frmITTIN
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblQryCode.Value = vbChecked Then
        f = f & " and ITTIN_DEF_QryCode_ID='" & fltr.txtQryCode.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
    jfmnuITTIN_2.jv.Filter.Add "AUTOITTIN_DEF", f
    End If
      jfmnuITTIN_2.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITTIN_2.Show
    jfmnuITTIN_2.WindowState = 0
    jfmnuITTIN_2.ZOrder 0
End Sub
Private Sub jfmnuITTIN_2_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTIN
    Dim f As String
    Set fltr = New frmITTIN
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{E3728A5B-6B62-48BF-9E5A-D4F0BCBFC75B}'"
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblQryCode.Value = vbChecked Then
        f = f & " and ITTIN_DEF_QryCode_ID='" & fltr.txtQryCode.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
    jfmnuITTIN_2.jv.Filter.Add "AUTOITTIN_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTIN_2_OnClearFilter()
   jfmnuITTIN_2.jv.Filter.Add "AUTOITTIN_DEF", " INTSANCEStatusID='{E3728A5B-6B62-48BF-9E5A-D4F0BCBFC75B}'"
End Sub
Private Sub jfmnuITTIN_2_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTIN", "Приемка груза" & Now, Site
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


Private Sub mnuITTIN_3_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITTIN_3 Is Nothing Then
      Set jfmnuITTIN_3 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{5AC03393-7686-4423-AD74-98673546FBA3}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITTIN_3.jv.journal = journal
      jfmnuITTIN_3.jv.OpenModal = False
      jfmnuITTIN_3.Caption = "Приемка груза :Идет приемка"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{EB3A7D03-EB3F-4541-AD93-D55C92BE02AC}'"
    jfmnuITTIN_3.jv.Filter.Add "AUTOITTIN_DEF", f
    Dim fltr As frmITTIN
    Set fltr = New frmITTIN
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblQryCode.Value = vbChecked Then
        f = f & " and ITTIN_DEF_QryCode_ID='" & fltr.txtQryCode.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
    jfmnuITTIN_3.jv.Filter.Add "AUTOITTIN_DEF", f
    End If
      jfmnuITTIN_3.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITTIN_3.Show
    jfmnuITTIN_3.WindowState = 0
    jfmnuITTIN_3.ZOrder 0
End Sub
Private Sub jfmnuITTIN_3_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTIN
    Dim f As String
    Set fltr = New frmITTIN
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{EB3A7D03-EB3F-4541-AD93-D55C92BE02AC}'"
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblQryCode.Value = vbChecked Then
        f = f & " and ITTIN_DEF_QryCode_ID='" & fltr.txtQryCode.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
    jfmnuITTIN_3.jv.Filter.Add "AUTOITTIN_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTIN_3_OnClearFilter()
   jfmnuITTIN_3.jv.Filter.Add "AUTOITTIN_DEF", " INTSANCEStatusID='{EB3A7D03-EB3F-4541-AD93-D55C92BE02AC}'"
End Sub
Private Sub jfmnuITTIN_3_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTIN", "Приемка груза" & Now, Site
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


Private Sub mnuITTIN_4_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITTIN_4 Is Nothing Then
      Set jfmnuITTIN_4 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{5AC03393-7686-4423-AD74-98673546FBA3}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITTIN_4.jv.journal = journal
      jfmnuITTIN_4.jv.OpenModal = False
      jfmnuITTIN_4.Caption = "Приемка груза :Приемка обработана"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{E8BA9909-6680-4B2C-B446-F58EF91DCD17}'"
    jfmnuITTIN_4.jv.Filter.Add "AUTOITTIN_DEF", f
    Dim fltr As frmITTIN
    Set fltr = New frmITTIN
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblQryCode.Value = vbChecked Then
        f = f & " and ITTIN_DEF_QryCode_ID='" & fltr.txtQryCode.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
    jfmnuITTIN_4.jv.Filter.Add "AUTOITTIN_DEF", f
    End If
      jfmnuITTIN_4.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITTIN_4.Show
    jfmnuITTIN_4.WindowState = 0
    jfmnuITTIN_4.ZOrder 0
End Sub
Private Sub jfmnuITTIN_4_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTIN
    Dim f As String
    Set fltr = New frmITTIN
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{E8BA9909-6680-4B2C-B446-F58EF91DCD17}'"
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblQryCode.Value = vbChecked Then
        f = f & " and ITTIN_DEF_QryCode_ID='" & fltr.txtQryCode.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
    jfmnuITTIN_4.jv.Filter.Add "AUTOITTIN_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTIN_4_OnClearFilter()
   jfmnuITTIN_4.jv.Filter.Add "AUTOITTIN_DEF", " INTSANCEStatusID='{E8BA9909-6680-4B2C-B446-F58EF91DCD17}'"
End Sub
Private Sub jfmnuITTIN_4_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTIN", "Приемка груза" & Now, Site
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




Private Sub mnuAllITTTZ_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuAllITTTZ Is Nothing Then
      Set jfmnuAllITTTZ = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{45CD12F6-996D-4C04-A1F3-473DCD5532B6}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuAllITTTZ.jv.journal = journal
      jfmnuAllITTTZ.jv.OpenModal = False
      jfmnuAllITTTZ.Caption = "Транспортный заказ - все состояния"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
    Dim fltr As frmITTTZ
    Set fltr = New frmITTTZ
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTheNumber.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_TheNumber like '%" & fltr.txtTheNumber.Text & "%'"
      End If
      If fltr.lblSupplierCode.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_SupplierCode like '%" & fltr.txtSupplierCode.Text & "%'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_TheClient like '%" & fltr.txtTheClient.Text & "%'"
      End If
      If fltr.lblDocDate_LE.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_DocDate<=" & MakeMSSQLDate(fltr.dtpDocDate_LE.Value)
      End If
      If fltr.lblCode.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_Code like '%" & fltr.txtCode.Text & "%'"
      End If
      If fltr.lblDirection.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_Direction like '%" & fltr.txtDirection.Text & "%'"
      End If
      If fltr.lblDocDate_GE.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_DocDate>=" & MakeMSSQLDate(fltr.dtpDocDate_GE.Value)
      End If
    jfmnuAllITTTZ.jv.Filter.Add "AUTOITTTZ_DEF", f
    End If
      jfmnuAllITTTZ.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuAllITTTZ.Show
    jfmnuAllITTTZ.WindowState = 0
    jfmnuAllITTTZ.ZOrder 0
End Sub
Private Sub jfmnuAllITTTZ_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTTZ
    Dim f As String
    Set fltr = New frmITTTZ
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
      If fltr.lblTheNumber.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_TheNumber like '%" & fltr.txtTheNumber.Text & "%'"
      End If
      If fltr.lblSupplierCode.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_SupplierCode like '%" & fltr.txtSupplierCode.Text & "%'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_TheClient like '%" & fltr.txtTheClient.Text & "%'"
      End If
      If fltr.lblDocDate_LE.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_DocDate<=" & MakeMSSQLDate(fltr.dtpDocDate_LE.Value)
      End If
      If fltr.lblCode.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_Code like '%" & fltr.txtCode.Text & "%'"
      End If
      If fltr.lblDirection.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_Direction like '%" & fltr.txtDirection.Text & "%'"
      End If
      If fltr.lblDocDate_GE.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_DocDate>=" & MakeMSSQLDate(fltr.dtpDocDate_GE.Value)
      End If
    jfmnuAllITTTZ.jv.Filter.Add "AUTOITTTZ_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuAllITTTZ_OnClearFilter()
End Sub
Private Sub jfmnuAllITTTZ_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTTZ", "Транспортный заказ" & Now, Site
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


Private Sub mnuITTTZ_1_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITTTZ_1 Is Nothing Then
      Set jfmnuITTTZ_1 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{45CD12F6-996D-4C04-A1F3-473DCD5532B6}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITTTZ_1.jv.journal = journal
      jfmnuITTTZ_1.jv.OpenModal = False
      jfmnuITTTZ_1.Caption = "Транспортный заказ :Обработан"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{EBB0BB6C-5585-4B02-A4A7-1664616A034A}'"
    jfmnuITTTZ_1.jv.Filter.Add "AUTOITTTZ_DEF", f
    Dim fltr As frmITTTZ
    Set fltr = New frmITTTZ
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTheNumber.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_TheNumber like '%" & fltr.txtTheNumber.Text & "%'"
      End If
      If fltr.lblSupplierCode.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_SupplierCode like '%" & fltr.txtSupplierCode.Text & "%'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_TheClient like '%" & fltr.txtTheClient.Text & "%'"
      End If
      If fltr.lblDocDate_LE.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_DocDate<=" & MakeMSSQLDate(fltr.dtpDocDate_LE.Value)
      End If
      If fltr.lblCode.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_Code like '%" & fltr.txtCode.Text & "%'"
      End If
      If fltr.lblDirection.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_Direction like '%" & fltr.txtDirection.Text & "%'"
      End If
      If fltr.lblDocDate_GE.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_DocDate>=" & MakeMSSQLDate(fltr.dtpDocDate_GE.Value)
      End If
    jfmnuITTTZ_1.jv.Filter.Add "AUTOITTTZ_DEF", f
    End If
      jfmnuITTTZ_1.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITTTZ_1.Show
    jfmnuITTTZ_1.WindowState = 0
    jfmnuITTTZ_1.ZOrder 0
End Sub
Private Sub jfmnuITTTZ_1_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTTZ
    Dim f As String
    Set fltr = New frmITTTZ
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{EBB0BB6C-5585-4B02-A4A7-1664616A034A}'"
      If fltr.lblTheNumber.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_TheNumber like '%" & fltr.txtTheNumber.Text & "%'"
      End If
      If fltr.lblSupplierCode.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_SupplierCode like '%" & fltr.txtSupplierCode.Text & "%'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_TheClient like '%" & fltr.txtTheClient.Text & "%'"
      End If
      If fltr.lblDocDate_LE.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_DocDate<=" & MakeMSSQLDate(fltr.dtpDocDate_LE.Value)
      End If
      If fltr.lblCode.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_Code like '%" & fltr.txtCode.Text & "%'"
      End If
      If fltr.lblDirection.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_Direction like '%" & fltr.txtDirection.Text & "%'"
      End If
      If fltr.lblDocDate_GE.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_DocDate>=" & MakeMSSQLDate(fltr.dtpDocDate_GE.Value)
      End If
    jfmnuITTTZ_1.jv.Filter.Add "AUTOITTTZ_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTTZ_1_OnClearFilter()
   jfmnuITTTZ_1.jv.Filter.Add "AUTOITTTZ_DEF", " INTSANCEStatusID='{EBB0BB6C-5585-4B02-A4A7-1664616A034A}'"
End Sub
Private Sub jfmnuITTTZ_1_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTTZ", "Транспортный заказ" & Now, Site
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


Private Sub mnuITTTZ_2_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITTTZ_2 Is Nothing Then
      Set jfmnuITTTZ_2 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{45CD12F6-996D-4C04-A1F3-473DCD5532B6}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITTTZ_2.jv.journal = journal
      jfmnuITTTZ_2.jv.OpenModal = False
      jfmnuITTTZ_2.Caption = "Транспортный заказ :Загружен из файла"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{EFA0E3E9-BD9A-4490-9E1E-305FC681A48D}'"
    jfmnuITTTZ_2.jv.Filter.Add "AUTOITTTZ_DEF", f
    Dim fltr As frmITTTZ
    Set fltr = New frmITTTZ
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTheNumber.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_TheNumber like '%" & fltr.txtTheNumber.Text & "%'"
      End If
      If fltr.lblSupplierCode.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_SupplierCode like '%" & fltr.txtSupplierCode.Text & "%'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_TheClient like '%" & fltr.txtTheClient.Text & "%'"
      End If
      If fltr.lblDocDate_LE.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_DocDate<=" & MakeMSSQLDate(fltr.dtpDocDate_LE.Value)
      End If
      If fltr.lblCode.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_Code like '%" & fltr.txtCode.Text & "%'"
      End If
      If fltr.lblDirection.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_Direction like '%" & fltr.txtDirection.Text & "%'"
      End If
      If fltr.lblDocDate_GE.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_DocDate>=" & MakeMSSQLDate(fltr.dtpDocDate_GE.Value)
      End If
    jfmnuITTTZ_2.jv.Filter.Add "AUTOITTTZ_DEF", f
    End If
      jfmnuITTTZ_2.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITTTZ_2.Show
    jfmnuITTTZ_2.WindowState = 0
    jfmnuITTTZ_2.ZOrder 0
End Sub
Private Sub jfmnuITTTZ_2_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTTZ
    Dim f As String
    Set fltr = New frmITTTZ
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{EFA0E3E9-BD9A-4490-9E1E-305FC681A48D}'"
      If fltr.lblTheNumber.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_TheNumber like '%" & fltr.txtTheNumber.Text & "%'"
      End If
      If fltr.lblSupplierCode.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_SupplierCode like '%" & fltr.txtSupplierCode.Text & "%'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_TheClient like '%" & fltr.txtTheClient.Text & "%'"
      End If
      If fltr.lblDocDate_LE.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_DocDate<=" & MakeMSSQLDate(fltr.dtpDocDate_LE.Value)
      End If
      If fltr.lblCode.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_Code like '%" & fltr.txtCode.Text & "%'"
      End If
      If fltr.lblDirection.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_Direction like '%" & fltr.txtDirection.Text & "%'"
      End If
      If fltr.lblDocDate_GE.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_DocDate>=" & MakeMSSQLDate(fltr.dtpDocDate_GE.Value)
      End If
    jfmnuITTTZ_2.jv.Filter.Add "AUTOITTTZ_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTTZ_2_OnClearFilter()
   jfmnuITTTZ_2.jv.Filter.Add "AUTOITTTZ_DEF", " INTSANCEStatusID='{EFA0E3E9-BD9A-4490-9E1E-305FC681A48D}'"
End Sub
Private Sub jfmnuITTTZ_2_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTTZ", "Транспортный заказ" & Now, Site
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


Private Sub mnuITTTZ_3_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITTTZ_3 Is Nothing Then
      Set jfmnuITTTZ_3 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{45CD12F6-996D-4C04-A1F3-473DCD5532B6}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITTTZ_3.jv.journal = journal
      jfmnuITTTZ_3.jv.OpenModal = False
      jfmnuITTTZ_3.Caption = "Транспортный заказ :Создан"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{4B130153-10BD-4E3E-A462-A8F7DF40E059}'"
    jfmnuITTTZ_3.jv.Filter.Add "AUTOITTTZ_DEF", f
    Dim fltr As frmITTTZ
    Set fltr = New frmITTTZ
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTheNumber.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_TheNumber like '%" & fltr.txtTheNumber.Text & "%'"
      End If
      If fltr.lblSupplierCode.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_SupplierCode like '%" & fltr.txtSupplierCode.Text & "%'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_TheClient like '%" & fltr.txtTheClient.Text & "%'"
      End If
      If fltr.lblDocDate_LE.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_DocDate<=" & MakeMSSQLDate(fltr.dtpDocDate_LE.Value)
      End If
      If fltr.lblCode.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_Code like '%" & fltr.txtCode.Text & "%'"
      End If
      If fltr.lblDirection.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_Direction like '%" & fltr.txtDirection.Text & "%'"
      End If
      If fltr.lblDocDate_GE.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_DocDate>=" & MakeMSSQLDate(fltr.dtpDocDate_GE.Value)
      End If
    jfmnuITTTZ_3.jv.Filter.Add "AUTOITTTZ_DEF", f
    End If
      jfmnuITTTZ_3.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITTTZ_3.Show
    jfmnuITTTZ_3.WindowState = 0
    jfmnuITTTZ_3.ZOrder 0
End Sub
Private Sub jfmnuITTTZ_3_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTTZ
    Dim f As String
    Set fltr = New frmITTTZ
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{4B130153-10BD-4E3E-A462-A8F7DF40E059}'"
      If fltr.lblTheNumber.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_TheNumber like '%" & fltr.txtTheNumber.Text & "%'"
      End If
      If fltr.lblSupplierCode.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_SupplierCode like '%" & fltr.txtSupplierCode.Text & "%'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_TheClient like '%" & fltr.txtTheClient.Text & "%'"
      End If
      If fltr.lblDocDate_LE.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_DocDate<=" & MakeMSSQLDate(fltr.dtpDocDate_LE.Value)
      End If
      If fltr.lblCode.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_Code like '%" & fltr.txtCode.Text & "%'"
      End If
      If fltr.lblDirection.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_Direction like '%" & fltr.txtDirection.Text & "%'"
      End If
      If fltr.lblDocDate_GE.Value = vbChecked Then
        f = f & " and ITTTZ_DEF_DocDate>=" & MakeMSSQLDate(fltr.dtpDocDate_GE.Value)
      End If
    jfmnuITTTZ_3.jv.Filter.Add "AUTOITTTZ_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTTZ_3_OnClearFilter()
   jfmnuITTTZ_3.jv.Filter.Add "AUTOITTTZ_DEF", " INTSANCEStatusID='{4B130153-10BD-4E3E-A462-A8F7DF40E059}'"
End Sub
Private Sub jfmnuITTTZ_3_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTTZ", "Транспортный заказ" & Now, Site
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



Unload jfmnuAllITTOUT
Set jfmnuAllITTOUT = Nothing

Unload jfmnuITTOUT_1
Set jfmnuITTOUT_1 = Nothing

Unload jfmnuITTOUT_2
Set jfmnuITTOUT_2 = Nothing

Unload jfmnuITTOUT_3
Set jfmnuITTOUT_3 = Nothing

Unload jfmnuITTOUT_4
Set jfmnuITTOUT_4 = Nothing


Unload jfmnuAllITTIN
Set jfmnuAllITTIN = Nothing

Unload jfmnuITTIN_1
Set jfmnuITTIN_1 = Nothing

Unload jfmnuITTIN_2
Set jfmnuITTIN_2 = Nothing

Unload jfmnuITTIN_3
Set jfmnuITTIN_3 = Nothing

Unload jfmnuITTIN_4
Set jfmnuITTIN_4 = Nothing


Unload jfmnuAllITTTZ
Set jfmnuAllITTTZ = Nothing

Unload jfmnuITTTZ_1
Set jfmnuITTTZ_1 = Nothing

Unload jfmnuITTTZ_2
Set jfmnuITTTZ_2 = Nothing

Unload jfmnuITTTZ_3
Set jfmnuITTTZ_3 = Nothing


End Sub



