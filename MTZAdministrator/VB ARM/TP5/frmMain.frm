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
      Begin VB.Menu mnuTP_Zay 
         Caption         =   "Заявки"
         Begin VB.Menu mnuAllTP_Zay 
            Caption         =   "Заявки - все состояния"
         End
         Begin VB.Menu mnuTP_Zay_1 
            Caption         =   "Заявки :У инженера"
         End
         Begin VB.Menu mnuTP_Zay_2 
            Caption         =   "Заявки :Получена"
         End
         Begin VB.Menu mnuTP_Zay_3 
            Caption         =   "Заявки :Выполнена"
         End
         Begin VB.Menu mnuTP_Zay_4 
            Caption         =   "Заявки :Проблемная"
         End
         Begin VB.Menu mnuTP_Zay_5 
            Caption         =   "Заявки :На исполнении"
         End
         Begin VB.Menu mnuTP_Zay_6 
            Caption         =   "Заявки :Передана в СЗТ"
         End
      End
      Begin VB.Menu mnuTP_MIN 
         Caption         =   "Приход модемов"
      End
      Begin VB.Menu mnuTP_MOUT 
         Caption         =   "Расход модемов"
      End
   End
   Begin VB.Menu mnuDictionary 
      Caption         =   "Справочники"
      Begin VB.Menu mnuTP_Spr 
         Caption         =   "Справочники"
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



Dim WithEvents jfmnuTP_MIN As frmJournalShow
Attribute jfmnuTP_MIN.VB_VarHelpID = -1

Dim WithEvents jfmnuTP_MOUT As frmJournalShow
Attribute jfmnuTP_MOUT.VB_VarHelpID = -1













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


Private Sub mnuAllTP_Zay_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuAllTP_Zay Is Nothing Then
      Set jfmnuAllTP_Zay = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{19399670-D6CC-40D4-97AC-0348FC9B9F7E}")
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
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_SrochDogovor_ID='" & fltr.txtSrochDogovor.Tag & "'"
      End If
      If fltr.lblDataInstall_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall<=" & MakeMSSQLDate(fltr.dtpDataInstall_LE.Value)
      End If
      If fltr.lblDataSZT_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT>=" & MakeMSSQLDate(fltr.dtpDataSZT_GE.Value)
      End If
      If fltr.lblDocPolych.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DocPolych='" & fltr.cmbDocPolych.Text & "'"
      End If
      If fltr.lblDataInstall_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall>=" & MakeMSSQLDate(fltr.dtpDataInstall_GE.Value)
      End If
      If fltr.lblVidanModemSer.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VidanModemSer like '%" & fltr.txtVidanModemSer.Text & "%'"
      End If
      If fltr.lblIngener.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Ingener_ID='" & fltr.txtIngener.Tag & "'"
      End If
      If fltr.lblFIOdogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIOdogovor like '%" & fltr.txtFIOdogovor.Text & "%'"
      End If
      If fltr.lblTarif.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Tarif_ID='" & fltr.txtTarif.Tag & "'"
      End If
      If fltr.lblDataSZT_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT<=" & MakeMSSQLDate(fltr.dtpDataSZT_LE.Value)
      End If
      If fltr.lblDopSogl.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopSogl='" & fltr.cmbDopSogl.Text & "'"
      End If
      If fltr.lblDataOtpravVKEY_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY<=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_LE.Value)
      End If
      If fltr.lblKomment.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Komment like '%" & fltr.txtKomment.Text & "%'"
      End If
      If fltr.lblNumDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_NumDogovor like '%" & fltr.txtNumDogovor.Text & "%'"
      End If
      If fltr.lblDataOtpravVKEY_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY>=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_GE.Value)
      End If
      If fltr.lblOtkaz.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Otkaz='" & fltr.cmbOtkaz.Text & "'"
      End If
      If fltr.lblVklVReestr.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VklVReestr='" & fltr.cmbVklVReestr.Text & "'"
      End If
      If fltr.lblOtprVKEY.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OtprVKEY='" & fltr.cmbOtprVKEY.Text & "'"
      End If
      If fltr.lblOpisProblem.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OpisProblem like '%" & fltr.txtOpisProblem.Text & "%'"
      End If
      If fltr.lblKoordin.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Koordin_ID='" & fltr.txtKoordin.Tag & "'"
      End If
      If fltr.lblTheOperator.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_TheOperator_ID='" & fltr.txtTheOperator.Tag & "'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblRayon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Rayon_ID='" & fltr.txtRayon.Tag & "'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblZType.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_ZType_ID='" & fltr.txtZType.Tag & "'"
      End If
      If fltr.lblNum_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num<=" & val(fltr.txtNum_LE.Text)
      End If
      If fltr.lblNum_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num>=" & val(fltr.txtNum_GE.Text)
      End If
      If fltr.lblDataPriem_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem<=" & MakeMSSQLDate(fltr.dtpDataPriem_LE.Value)
      End If
      If fltr.lblDataPriem_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem>=" & MakeMSSQLDate(fltr.dtpDataPriem_GE.Value)
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblGelVremja.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelVremja_ID='" & fltr.txtGelVremja.Tag & "'"
      End If
      If fltr.lblGelData_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData<=" & MakeMSSQLDate(fltr.dtpGelData_LE.Value)
      End If
      If fltr.lblDopInfo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopInfo like '%" & fltr.txtDopInfo.Text & "%'"
      End If
      If fltr.lblPortref.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Portref_ID='" & fltr.txtPortref.Tag & "'"
      End If
      If fltr.lblGelData_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData>=" & MakeMSSQLDate(fltr.dtpGelData_GE.Value)
      End If
      If fltr.lblKontTelefon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontTelefon like '%" & fltr.txtKontTelefon.Text & "%'"
      End If
      If fltr.lblKonrLizo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KonrLizo like '%" & fltr.txtKonrLizo.Text & "%'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
    jfmnuAllTP_Zay.jv.Filter.Add "AUTOTP_Zay_Zay", f
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
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_SrochDogovor_ID='" & fltr.txtSrochDogovor.Tag & "'"
      End If
      If fltr.lblDataInstall_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall<=" & MakeMSSQLDate(fltr.dtpDataInstall_LE.Value)
      End If
      If fltr.lblDataSZT_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT>=" & MakeMSSQLDate(fltr.dtpDataSZT_GE.Value)
      End If
      If fltr.lblDocPolych.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DocPolych='" & fltr.cmbDocPolych.Text & "'"
      End If
      If fltr.lblDataInstall_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall>=" & MakeMSSQLDate(fltr.dtpDataInstall_GE.Value)
      End If
      If fltr.lblVidanModemSer.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VidanModemSer like '%" & fltr.txtVidanModemSer.Text & "%'"
      End If
      If fltr.lblIngener.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Ingener_ID='" & fltr.txtIngener.Tag & "'"
      End If
      If fltr.lblFIOdogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIOdogovor like '%" & fltr.txtFIOdogovor.Text & "%'"
      End If
      If fltr.lblTarif.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Tarif_ID='" & fltr.txtTarif.Tag & "'"
      End If
      If fltr.lblDataSZT_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT<=" & MakeMSSQLDate(fltr.dtpDataSZT_LE.Value)
      End If
      If fltr.lblDopSogl.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopSogl='" & fltr.cmbDopSogl.Text & "'"
      End If
      If fltr.lblDataOtpravVKEY_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY<=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_LE.Value)
      End If
      If fltr.lblKomment.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Komment like '%" & fltr.txtKomment.Text & "%'"
      End If
      If fltr.lblNumDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_NumDogovor like '%" & fltr.txtNumDogovor.Text & "%'"
      End If
      If fltr.lblDataOtpravVKEY_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY>=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_GE.Value)
      End If
      If fltr.lblOtkaz.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Otkaz='" & fltr.cmbOtkaz.Text & "'"
      End If
      If fltr.lblVklVReestr.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VklVReestr='" & fltr.cmbVklVReestr.Text & "'"
      End If
      If fltr.lblOtprVKEY.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OtprVKEY='" & fltr.cmbOtprVKEY.Text & "'"
      End If
      If fltr.lblOpisProblem.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OpisProblem like '%" & fltr.txtOpisProblem.Text & "%'"
      End If
      If fltr.lblKoordin.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Koordin_ID='" & fltr.txtKoordin.Tag & "'"
      End If
      If fltr.lblTheOperator.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_TheOperator_ID='" & fltr.txtTheOperator.Tag & "'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblRayon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Rayon_ID='" & fltr.txtRayon.Tag & "'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblZType.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_ZType_ID='" & fltr.txtZType.Tag & "'"
      End If
      If fltr.lblNum_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num<=" & val(fltr.txtNum_LE.Text)
      End If
      If fltr.lblNum_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num>=" & val(fltr.txtNum_GE.Text)
      End If
      If fltr.lblDataPriem_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem<=" & MakeMSSQLDate(fltr.dtpDataPriem_LE.Value)
      End If
      If fltr.lblDataPriem_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem>=" & MakeMSSQLDate(fltr.dtpDataPriem_GE.Value)
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblGelVremja.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelVremja_ID='" & fltr.txtGelVremja.Tag & "'"
      End If
      If fltr.lblGelData_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData<=" & MakeMSSQLDate(fltr.dtpGelData_LE.Value)
      End If
      If fltr.lblDopInfo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopInfo like '%" & fltr.txtDopInfo.Text & "%'"
      End If
      If fltr.lblPortref.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Portref_ID='" & fltr.txtPortref.Tag & "'"
      End If
      If fltr.lblGelData_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData>=" & MakeMSSQLDate(fltr.dtpGelData_GE.Value)
      End If
      If fltr.lblKontTelefon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontTelefon like '%" & fltr.txtKontTelefon.Text & "%'"
      End If
      If fltr.lblKonrLizo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KonrLizo like '%" & fltr.txtKonrLizo.Text & "%'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
    jfmnuAllTP_Zay.jv.Filter.Add "AUTOTP_Zay_Zay", f
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
      Set journal = Manager.GetInstanceObject("{19399670-D6CC-40D4-97AC-0348FC9B9F7E}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuTP_Zay_1.jv.journal = journal
      jfmnuTP_Zay_1.jv.OpenModal = False
      jfmnuTP_Zay_1.Caption = "Заявки :У инженера"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{13EE5E14-75B0-46D3-BAB7-2E5F7C58597D}'"
    jfmnuTP_Zay_1.jv.Filter.Add "AUTOTP_Zay_Zay", f
    Dim fltr As frmTP_Zay
    Set fltr = New frmTP_Zay
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_SrochDogovor_ID='" & fltr.txtSrochDogovor.Tag & "'"
      End If
      If fltr.lblDataInstall_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall<=" & MakeMSSQLDate(fltr.dtpDataInstall_LE.Value)
      End If
      If fltr.lblDataSZT_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT>=" & MakeMSSQLDate(fltr.dtpDataSZT_GE.Value)
      End If
      If fltr.lblDocPolych.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DocPolych='" & fltr.cmbDocPolych.Text & "'"
      End If
      If fltr.lblDataInstall_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall>=" & MakeMSSQLDate(fltr.dtpDataInstall_GE.Value)
      End If
      If fltr.lblVidanModemSer.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VidanModemSer like '%" & fltr.txtVidanModemSer.Text & "%'"
      End If
      If fltr.lblIngener.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Ingener_ID='" & fltr.txtIngener.Tag & "'"
      End If
      If fltr.lblFIOdogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIOdogovor like '%" & fltr.txtFIOdogovor.Text & "%'"
      End If
      If fltr.lblTarif.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Tarif_ID='" & fltr.txtTarif.Tag & "'"
      End If
      If fltr.lblDataSZT_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT<=" & MakeMSSQLDate(fltr.dtpDataSZT_LE.Value)
      End If
      If fltr.lblDopSogl.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopSogl='" & fltr.cmbDopSogl.Text & "'"
      End If
      If fltr.lblDataOtpravVKEY_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY<=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_LE.Value)
      End If
      If fltr.lblKomment.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Komment like '%" & fltr.txtKomment.Text & "%'"
      End If
      If fltr.lblNumDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_NumDogovor like '%" & fltr.txtNumDogovor.Text & "%'"
      End If
      If fltr.lblDataOtpravVKEY_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY>=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_GE.Value)
      End If
      If fltr.lblOtkaz.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Otkaz='" & fltr.cmbOtkaz.Text & "'"
      End If
      If fltr.lblVklVReestr.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VklVReestr='" & fltr.cmbVklVReestr.Text & "'"
      End If
      If fltr.lblOtprVKEY.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OtprVKEY='" & fltr.cmbOtprVKEY.Text & "'"
      End If
      If fltr.lblOpisProblem.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OpisProblem like '%" & fltr.txtOpisProblem.Text & "%'"
      End If
      If fltr.lblKoordin.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Koordin_ID='" & fltr.txtKoordin.Tag & "'"
      End If
      If fltr.lblTheOperator.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_TheOperator_ID='" & fltr.txtTheOperator.Tag & "'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblRayon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Rayon_ID='" & fltr.txtRayon.Tag & "'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblZType.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_ZType_ID='" & fltr.txtZType.Tag & "'"
      End If
      If fltr.lblNum_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num<=" & val(fltr.txtNum_LE.Text)
      End If
      If fltr.lblNum_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num>=" & val(fltr.txtNum_GE.Text)
      End If
      If fltr.lblDataPriem_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem<=" & MakeMSSQLDate(fltr.dtpDataPriem_LE.Value)
      End If
      If fltr.lblDataPriem_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem>=" & MakeMSSQLDate(fltr.dtpDataPriem_GE.Value)
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblGelVremja.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelVremja_ID='" & fltr.txtGelVremja.Tag & "'"
      End If
      If fltr.lblGelData_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData<=" & MakeMSSQLDate(fltr.dtpGelData_LE.Value)
      End If
      If fltr.lblDopInfo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopInfo like '%" & fltr.txtDopInfo.Text & "%'"
      End If
      If fltr.lblPortref.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Portref_ID='" & fltr.txtPortref.Tag & "'"
      End If
      If fltr.lblGelData_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData>=" & MakeMSSQLDate(fltr.dtpGelData_GE.Value)
      End If
      If fltr.lblKontTelefon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontTelefon like '%" & fltr.txtKontTelefon.Text & "%'"
      End If
      If fltr.lblKonrLizo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KonrLizo like '%" & fltr.txtKonrLizo.Text & "%'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
    jfmnuTP_Zay_1.jv.Filter.Add "AUTOTP_Zay_Zay", f
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
   f = " INTSANCEStatusID='{13EE5E14-75B0-46D3-BAB7-2E5F7C58597D}'"
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_SrochDogovor_ID='" & fltr.txtSrochDogovor.Tag & "'"
      End If
      If fltr.lblDataInstall_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall<=" & MakeMSSQLDate(fltr.dtpDataInstall_LE.Value)
      End If
      If fltr.lblDataSZT_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT>=" & MakeMSSQLDate(fltr.dtpDataSZT_GE.Value)
      End If
      If fltr.lblDocPolych.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DocPolych='" & fltr.cmbDocPolych.Text & "'"
      End If
      If fltr.lblDataInstall_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall>=" & MakeMSSQLDate(fltr.dtpDataInstall_GE.Value)
      End If
      If fltr.lblVidanModemSer.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VidanModemSer like '%" & fltr.txtVidanModemSer.Text & "%'"
      End If
      If fltr.lblIngener.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Ingener_ID='" & fltr.txtIngener.Tag & "'"
      End If
      If fltr.lblFIOdogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIOdogovor like '%" & fltr.txtFIOdogovor.Text & "%'"
      End If
      If fltr.lblTarif.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Tarif_ID='" & fltr.txtTarif.Tag & "'"
      End If
      If fltr.lblDataSZT_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT<=" & MakeMSSQLDate(fltr.dtpDataSZT_LE.Value)
      End If
      If fltr.lblDopSogl.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopSogl='" & fltr.cmbDopSogl.Text & "'"
      End If
      If fltr.lblDataOtpravVKEY_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY<=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_LE.Value)
      End If
      If fltr.lblKomment.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Komment like '%" & fltr.txtKomment.Text & "%'"
      End If
      If fltr.lblNumDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_NumDogovor like '%" & fltr.txtNumDogovor.Text & "%'"
      End If
      If fltr.lblDataOtpravVKEY_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY>=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_GE.Value)
      End If
      If fltr.lblOtkaz.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Otkaz='" & fltr.cmbOtkaz.Text & "'"
      End If
      If fltr.lblVklVReestr.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VklVReestr='" & fltr.cmbVklVReestr.Text & "'"
      End If
      If fltr.lblOtprVKEY.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OtprVKEY='" & fltr.cmbOtprVKEY.Text & "'"
      End If
      If fltr.lblOpisProblem.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OpisProblem like '%" & fltr.txtOpisProblem.Text & "%'"
      End If
      If fltr.lblKoordin.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Koordin_ID='" & fltr.txtKoordin.Tag & "'"
      End If
      If fltr.lblTheOperator.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_TheOperator_ID='" & fltr.txtTheOperator.Tag & "'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblRayon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Rayon_ID='" & fltr.txtRayon.Tag & "'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblZType.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_ZType_ID='" & fltr.txtZType.Tag & "'"
      End If
      If fltr.lblNum_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num<=" & val(fltr.txtNum_LE.Text)
      End If
      If fltr.lblNum_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num>=" & val(fltr.txtNum_GE.Text)
      End If
      If fltr.lblDataPriem_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem<=" & MakeMSSQLDate(fltr.dtpDataPriem_LE.Value)
      End If
      If fltr.lblDataPriem_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem>=" & MakeMSSQLDate(fltr.dtpDataPriem_GE.Value)
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblGelVremja.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelVremja_ID='" & fltr.txtGelVremja.Tag & "'"
      End If
      If fltr.lblGelData_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData<=" & MakeMSSQLDate(fltr.dtpGelData_LE.Value)
      End If
      If fltr.lblDopInfo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopInfo like '%" & fltr.txtDopInfo.Text & "%'"
      End If
      If fltr.lblPortref.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Portref_ID='" & fltr.txtPortref.Tag & "'"
      End If
      If fltr.lblGelData_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData>=" & MakeMSSQLDate(fltr.dtpGelData_GE.Value)
      End If
      If fltr.lblKontTelefon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontTelefon like '%" & fltr.txtKontTelefon.Text & "%'"
      End If
      If fltr.lblKonrLizo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KonrLizo like '%" & fltr.txtKonrLizo.Text & "%'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
    jfmnuTP_Zay_1.jv.Filter.Add "AUTOTP_Zay_Zay", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuTP_Zay_1_OnClearFilter()
   jfmnuTP_Zay_1.jv.Filter.Add "AUTOTP_Zay_Zay", " INTSANCEStatusID='{13EE5E14-75B0-46D3-BAB7-2E5F7C58597D}'"
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
      Set journal = Manager.GetInstanceObject("{19399670-D6CC-40D4-97AC-0348FC9B9F7E}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuTP_Zay_2.jv.journal = journal
      jfmnuTP_Zay_2.jv.OpenModal = False
      jfmnuTP_Zay_2.Caption = "Заявки :Получена"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{52241C16-0404-450D-B94E-46A169226076}'"
    jfmnuTP_Zay_2.jv.Filter.Add "AUTOTP_Zay_Zay", f
    Dim fltr As frmTP_Zay
    Set fltr = New frmTP_Zay
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_SrochDogovor_ID='" & fltr.txtSrochDogovor.Tag & "'"
      End If
      If fltr.lblDataInstall_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall<=" & MakeMSSQLDate(fltr.dtpDataInstall_LE.Value)
      End If
      If fltr.lblDataSZT_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT>=" & MakeMSSQLDate(fltr.dtpDataSZT_GE.Value)
      End If
      If fltr.lblDocPolych.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DocPolych='" & fltr.cmbDocPolych.Text & "'"
      End If
      If fltr.lblDataInstall_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall>=" & MakeMSSQLDate(fltr.dtpDataInstall_GE.Value)
      End If
      If fltr.lblVidanModemSer.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VidanModemSer like '%" & fltr.txtVidanModemSer.Text & "%'"
      End If
      If fltr.lblIngener.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Ingener_ID='" & fltr.txtIngener.Tag & "'"
      End If
      If fltr.lblFIOdogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIOdogovor like '%" & fltr.txtFIOdogovor.Text & "%'"
      End If
      If fltr.lblTarif.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Tarif_ID='" & fltr.txtTarif.Tag & "'"
      End If
      If fltr.lblDataSZT_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT<=" & MakeMSSQLDate(fltr.dtpDataSZT_LE.Value)
      End If
      If fltr.lblDopSogl.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopSogl='" & fltr.cmbDopSogl.Text & "'"
      End If
      If fltr.lblDataOtpravVKEY_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY<=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_LE.Value)
      End If
      If fltr.lblKomment.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Komment like '%" & fltr.txtKomment.Text & "%'"
      End If
      If fltr.lblNumDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_NumDogovor like '%" & fltr.txtNumDogovor.Text & "%'"
      End If
      If fltr.lblDataOtpravVKEY_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY>=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_GE.Value)
      End If
      If fltr.lblOtkaz.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Otkaz='" & fltr.cmbOtkaz.Text & "'"
      End If
      If fltr.lblVklVReestr.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VklVReestr='" & fltr.cmbVklVReestr.Text & "'"
      End If
      If fltr.lblOtprVKEY.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OtprVKEY='" & fltr.cmbOtprVKEY.Text & "'"
      End If
      If fltr.lblOpisProblem.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OpisProblem like '%" & fltr.txtOpisProblem.Text & "%'"
      End If
      If fltr.lblKoordin.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Koordin_ID='" & fltr.txtKoordin.Tag & "'"
      End If
      If fltr.lblTheOperator.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_TheOperator_ID='" & fltr.txtTheOperator.Tag & "'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblRayon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Rayon_ID='" & fltr.txtRayon.Tag & "'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblZType.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_ZType_ID='" & fltr.txtZType.Tag & "'"
      End If
      If fltr.lblNum_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num<=" & val(fltr.txtNum_LE.Text)
      End If
      If fltr.lblNum_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num>=" & val(fltr.txtNum_GE.Text)
      End If
      If fltr.lblDataPriem_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem<=" & MakeMSSQLDate(fltr.dtpDataPriem_LE.Value)
      End If
      If fltr.lblDataPriem_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem>=" & MakeMSSQLDate(fltr.dtpDataPriem_GE.Value)
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblGelVremja.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelVremja_ID='" & fltr.txtGelVremja.Tag & "'"
      End If
      If fltr.lblGelData_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData<=" & MakeMSSQLDate(fltr.dtpGelData_LE.Value)
      End If
      If fltr.lblDopInfo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopInfo like '%" & fltr.txtDopInfo.Text & "%'"
      End If
      If fltr.lblPortref.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Portref_ID='" & fltr.txtPortref.Tag & "'"
      End If
      If fltr.lblGelData_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData>=" & MakeMSSQLDate(fltr.dtpGelData_GE.Value)
      End If
      If fltr.lblKontTelefon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontTelefon like '%" & fltr.txtKontTelefon.Text & "%'"
      End If
      If fltr.lblKonrLizo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KonrLizo like '%" & fltr.txtKonrLizo.Text & "%'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
    jfmnuTP_Zay_2.jv.Filter.Add "AUTOTP_Zay_Zay", f
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
   f = " INTSANCEStatusID='{52241C16-0404-450D-B94E-46A169226076}'"
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_SrochDogovor_ID='" & fltr.txtSrochDogovor.Tag & "'"
      End If
      If fltr.lblDataInstall_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall<=" & MakeMSSQLDate(fltr.dtpDataInstall_LE.Value)
      End If
      If fltr.lblDataSZT_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT>=" & MakeMSSQLDate(fltr.dtpDataSZT_GE.Value)
      End If
      If fltr.lblDocPolych.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DocPolych='" & fltr.cmbDocPolych.Text & "'"
      End If
      If fltr.lblDataInstall_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall>=" & MakeMSSQLDate(fltr.dtpDataInstall_GE.Value)
      End If
      If fltr.lblVidanModemSer.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VidanModemSer like '%" & fltr.txtVidanModemSer.Text & "%'"
      End If
      If fltr.lblIngener.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Ingener_ID='" & fltr.txtIngener.Tag & "'"
      End If
      If fltr.lblFIOdogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIOdogovor like '%" & fltr.txtFIOdogovor.Text & "%'"
      End If
      If fltr.lblTarif.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Tarif_ID='" & fltr.txtTarif.Tag & "'"
      End If
      If fltr.lblDataSZT_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT<=" & MakeMSSQLDate(fltr.dtpDataSZT_LE.Value)
      End If
      If fltr.lblDopSogl.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopSogl='" & fltr.cmbDopSogl.Text & "'"
      End If
      If fltr.lblDataOtpravVKEY_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY<=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_LE.Value)
      End If
      If fltr.lblKomment.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Komment like '%" & fltr.txtKomment.Text & "%'"
      End If
      If fltr.lblNumDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_NumDogovor like '%" & fltr.txtNumDogovor.Text & "%'"
      End If
      If fltr.lblDataOtpravVKEY_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY>=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_GE.Value)
      End If
      If fltr.lblOtkaz.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Otkaz='" & fltr.cmbOtkaz.Text & "'"
      End If
      If fltr.lblVklVReestr.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VklVReestr='" & fltr.cmbVklVReestr.Text & "'"
      End If
      If fltr.lblOtprVKEY.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OtprVKEY='" & fltr.cmbOtprVKEY.Text & "'"
      End If
      If fltr.lblOpisProblem.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OpisProblem like '%" & fltr.txtOpisProblem.Text & "%'"
      End If
      If fltr.lblKoordin.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Koordin_ID='" & fltr.txtKoordin.Tag & "'"
      End If
      If fltr.lblTheOperator.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_TheOperator_ID='" & fltr.txtTheOperator.Tag & "'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblRayon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Rayon_ID='" & fltr.txtRayon.Tag & "'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblZType.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_ZType_ID='" & fltr.txtZType.Tag & "'"
      End If
      If fltr.lblNum_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num<=" & val(fltr.txtNum_LE.Text)
      End If
      If fltr.lblNum_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num>=" & val(fltr.txtNum_GE.Text)
      End If
      If fltr.lblDataPriem_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem<=" & MakeMSSQLDate(fltr.dtpDataPriem_LE.Value)
      End If
      If fltr.lblDataPriem_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem>=" & MakeMSSQLDate(fltr.dtpDataPriem_GE.Value)
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblGelVremja.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelVremja_ID='" & fltr.txtGelVremja.Tag & "'"
      End If
      If fltr.lblGelData_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData<=" & MakeMSSQLDate(fltr.dtpGelData_LE.Value)
      End If
      If fltr.lblDopInfo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopInfo like '%" & fltr.txtDopInfo.Text & "%'"
      End If
      If fltr.lblPortref.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Portref_ID='" & fltr.txtPortref.Tag & "'"
      End If
      If fltr.lblGelData_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData>=" & MakeMSSQLDate(fltr.dtpGelData_GE.Value)
      End If
      If fltr.lblKontTelefon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontTelefon like '%" & fltr.txtKontTelefon.Text & "%'"
      End If
      If fltr.lblKonrLizo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KonrLizo like '%" & fltr.txtKonrLizo.Text & "%'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
    jfmnuTP_Zay_2.jv.Filter.Add "AUTOTP_Zay_Zay", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuTP_Zay_2_OnClearFilter()
   jfmnuTP_Zay_2.jv.Filter.Add "AUTOTP_Zay_Zay", " INTSANCEStatusID='{52241C16-0404-450D-B94E-46A169226076}'"
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
      Set journal = Manager.GetInstanceObject("{19399670-D6CC-40D4-97AC-0348FC9B9F7E}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuTP_Zay_3.jv.journal = journal
      jfmnuTP_Zay_3.jv.OpenModal = False
      jfmnuTP_Zay_3.Caption = "Заявки :Выполнена"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{AD516926-E2F7-4412-8DC1-4C7484B322AE}'"
    jfmnuTP_Zay_3.jv.Filter.Add "AUTOTP_Zay_Zay", f
    Dim fltr As frmTP_Zay
    Set fltr = New frmTP_Zay
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_SrochDogovor_ID='" & fltr.txtSrochDogovor.Tag & "'"
      End If
      If fltr.lblDataInstall_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall<=" & MakeMSSQLDate(fltr.dtpDataInstall_LE.Value)
      End If
      If fltr.lblDataSZT_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT>=" & MakeMSSQLDate(fltr.dtpDataSZT_GE.Value)
      End If
      If fltr.lblDocPolych.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DocPolych='" & fltr.cmbDocPolych.Text & "'"
      End If
      If fltr.lblDataInstall_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall>=" & MakeMSSQLDate(fltr.dtpDataInstall_GE.Value)
      End If
      If fltr.lblVidanModemSer.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VidanModemSer like '%" & fltr.txtVidanModemSer.Text & "%'"
      End If
      If fltr.lblIngener.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Ingener_ID='" & fltr.txtIngener.Tag & "'"
      End If
      If fltr.lblFIOdogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIOdogovor like '%" & fltr.txtFIOdogovor.Text & "%'"
      End If
      If fltr.lblTarif.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Tarif_ID='" & fltr.txtTarif.Tag & "'"
      End If
      If fltr.lblDataSZT_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT<=" & MakeMSSQLDate(fltr.dtpDataSZT_LE.Value)
      End If
      If fltr.lblDopSogl.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopSogl='" & fltr.cmbDopSogl.Text & "'"
      End If
      If fltr.lblDataOtpravVKEY_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY<=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_LE.Value)
      End If
      If fltr.lblKomment.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Komment like '%" & fltr.txtKomment.Text & "%'"
      End If
      If fltr.lblNumDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_NumDogovor like '%" & fltr.txtNumDogovor.Text & "%'"
      End If
      If fltr.lblDataOtpravVKEY_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY>=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_GE.Value)
      End If
      If fltr.lblOtkaz.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Otkaz='" & fltr.cmbOtkaz.Text & "'"
      End If
      If fltr.lblVklVReestr.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VklVReestr='" & fltr.cmbVklVReestr.Text & "'"
      End If
      If fltr.lblOtprVKEY.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OtprVKEY='" & fltr.cmbOtprVKEY.Text & "'"
      End If
      If fltr.lblOpisProblem.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OpisProblem like '%" & fltr.txtOpisProblem.Text & "%'"
      End If
      If fltr.lblKoordin.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Koordin_ID='" & fltr.txtKoordin.Tag & "'"
      End If
      If fltr.lblTheOperator.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_TheOperator_ID='" & fltr.txtTheOperator.Tag & "'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblRayon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Rayon_ID='" & fltr.txtRayon.Tag & "'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblZType.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_ZType_ID='" & fltr.txtZType.Tag & "'"
      End If
      If fltr.lblNum_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num<=" & val(fltr.txtNum_LE.Text)
      End If
      If fltr.lblNum_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num>=" & val(fltr.txtNum_GE.Text)
      End If
      If fltr.lblDataPriem_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem<=" & MakeMSSQLDate(fltr.dtpDataPriem_LE.Value)
      End If
      If fltr.lblDataPriem_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem>=" & MakeMSSQLDate(fltr.dtpDataPriem_GE.Value)
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblGelVremja.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelVremja_ID='" & fltr.txtGelVremja.Tag & "'"
      End If
      If fltr.lblGelData_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData<=" & MakeMSSQLDate(fltr.dtpGelData_LE.Value)
      End If
      If fltr.lblDopInfo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopInfo like '%" & fltr.txtDopInfo.Text & "%'"
      End If
      If fltr.lblPortref.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Portref_ID='" & fltr.txtPortref.Tag & "'"
      End If
      If fltr.lblGelData_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData>=" & MakeMSSQLDate(fltr.dtpGelData_GE.Value)
      End If
      If fltr.lblKontTelefon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontTelefon like '%" & fltr.txtKontTelefon.Text & "%'"
      End If
      If fltr.lblKonrLizo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KonrLizo like '%" & fltr.txtKonrLizo.Text & "%'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
    jfmnuTP_Zay_3.jv.Filter.Add "AUTOTP_Zay_Zay", f
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
   f = " INTSANCEStatusID='{AD516926-E2F7-4412-8DC1-4C7484B322AE}'"
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_SrochDogovor_ID='" & fltr.txtSrochDogovor.Tag & "'"
      End If
      If fltr.lblDataInstall_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall<=" & MakeMSSQLDate(fltr.dtpDataInstall_LE.Value)
      End If
      If fltr.lblDataSZT_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT>=" & MakeMSSQLDate(fltr.dtpDataSZT_GE.Value)
      End If
      If fltr.lblDocPolych.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DocPolych='" & fltr.cmbDocPolych.Text & "'"
      End If
      If fltr.lblDataInstall_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall>=" & MakeMSSQLDate(fltr.dtpDataInstall_GE.Value)
      End If
      If fltr.lblVidanModemSer.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VidanModemSer like '%" & fltr.txtVidanModemSer.Text & "%'"
      End If
      If fltr.lblIngener.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Ingener_ID='" & fltr.txtIngener.Tag & "'"
      End If
      If fltr.lblFIOdogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIOdogovor like '%" & fltr.txtFIOdogovor.Text & "%'"
      End If
      If fltr.lblTarif.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Tarif_ID='" & fltr.txtTarif.Tag & "'"
      End If
      If fltr.lblDataSZT_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT<=" & MakeMSSQLDate(fltr.dtpDataSZT_LE.Value)
      End If
      If fltr.lblDopSogl.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopSogl='" & fltr.cmbDopSogl.Text & "'"
      End If
      If fltr.lblDataOtpravVKEY_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY<=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_LE.Value)
      End If
      If fltr.lblKomment.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Komment like '%" & fltr.txtKomment.Text & "%'"
      End If
      If fltr.lblNumDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_NumDogovor like '%" & fltr.txtNumDogovor.Text & "%'"
      End If
      If fltr.lblDataOtpravVKEY_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY>=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_GE.Value)
      End If
      If fltr.lblOtkaz.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Otkaz='" & fltr.cmbOtkaz.Text & "'"
      End If
      If fltr.lblVklVReestr.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VklVReestr='" & fltr.cmbVklVReestr.Text & "'"
      End If
      If fltr.lblOtprVKEY.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OtprVKEY='" & fltr.cmbOtprVKEY.Text & "'"
      End If
      If fltr.lblOpisProblem.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OpisProblem like '%" & fltr.txtOpisProblem.Text & "%'"
      End If
      If fltr.lblKoordin.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Koordin_ID='" & fltr.txtKoordin.Tag & "'"
      End If
      If fltr.lblTheOperator.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_TheOperator_ID='" & fltr.txtTheOperator.Tag & "'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblRayon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Rayon_ID='" & fltr.txtRayon.Tag & "'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblZType.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_ZType_ID='" & fltr.txtZType.Tag & "'"
      End If
      If fltr.lblNum_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num<=" & val(fltr.txtNum_LE.Text)
      End If
      If fltr.lblNum_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num>=" & val(fltr.txtNum_GE.Text)
      End If
      If fltr.lblDataPriem_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem<=" & MakeMSSQLDate(fltr.dtpDataPriem_LE.Value)
      End If
      If fltr.lblDataPriem_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem>=" & MakeMSSQLDate(fltr.dtpDataPriem_GE.Value)
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblGelVremja.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelVremja_ID='" & fltr.txtGelVremja.Tag & "'"
      End If
      If fltr.lblGelData_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData<=" & MakeMSSQLDate(fltr.dtpGelData_LE.Value)
      End If
      If fltr.lblDopInfo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopInfo like '%" & fltr.txtDopInfo.Text & "%'"
      End If
      If fltr.lblPortref.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Portref_ID='" & fltr.txtPortref.Tag & "'"
      End If
      If fltr.lblGelData_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData>=" & MakeMSSQLDate(fltr.dtpGelData_GE.Value)
      End If
      If fltr.lblKontTelefon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontTelefon like '%" & fltr.txtKontTelefon.Text & "%'"
      End If
      If fltr.lblKonrLizo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KonrLizo like '%" & fltr.txtKonrLizo.Text & "%'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
    jfmnuTP_Zay_3.jv.Filter.Add "AUTOTP_Zay_Zay", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuTP_Zay_3_OnClearFilter()
   jfmnuTP_Zay_3.jv.Filter.Add "AUTOTP_Zay_Zay", " INTSANCEStatusID='{AD516926-E2F7-4412-8DC1-4C7484B322AE}'"
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
      Set journal = Manager.GetInstanceObject("{19399670-D6CC-40D4-97AC-0348FC9B9F7E}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuTP_Zay_4.jv.journal = journal
      jfmnuTP_Zay_4.jv.OpenModal = False
      jfmnuTP_Zay_4.Caption = "Заявки :Проблемная"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{338FCEE8-7170-48FD-B156-99C42C5E0385}'"
    jfmnuTP_Zay_4.jv.Filter.Add "AUTOTP_Zay_Zay", f
    Dim fltr As frmTP_Zay
    Set fltr = New frmTP_Zay
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_SrochDogovor_ID='" & fltr.txtSrochDogovor.Tag & "'"
      End If
      If fltr.lblDataInstall_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall<=" & MakeMSSQLDate(fltr.dtpDataInstall_LE.Value)
      End If
      If fltr.lblDataSZT_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT>=" & MakeMSSQLDate(fltr.dtpDataSZT_GE.Value)
      End If
      If fltr.lblDocPolych.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DocPolych='" & fltr.cmbDocPolych.Text & "'"
      End If
      If fltr.lblDataInstall_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall>=" & MakeMSSQLDate(fltr.dtpDataInstall_GE.Value)
      End If
      If fltr.lblVidanModemSer.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VidanModemSer like '%" & fltr.txtVidanModemSer.Text & "%'"
      End If
      If fltr.lblIngener.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Ingener_ID='" & fltr.txtIngener.Tag & "'"
      End If
      If fltr.lblFIOdogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIOdogovor like '%" & fltr.txtFIOdogovor.Text & "%'"
      End If
      If fltr.lblTarif.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Tarif_ID='" & fltr.txtTarif.Tag & "'"
      End If
      If fltr.lblDataSZT_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT<=" & MakeMSSQLDate(fltr.dtpDataSZT_LE.Value)
      End If
      If fltr.lblDopSogl.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopSogl='" & fltr.cmbDopSogl.Text & "'"
      End If
      If fltr.lblDataOtpravVKEY_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY<=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_LE.Value)
      End If
      If fltr.lblKomment.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Komment like '%" & fltr.txtKomment.Text & "%'"
      End If
      If fltr.lblNumDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_NumDogovor like '%" & fltr.txtNumDogovor.Text & "%'"
      End If
      If fltr.lblDataOtpravVKEY_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY>=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_GE.Value)
      End If
      If fltr.lblOtkaz.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Otkaz='" & fltr.cmbOtkaz.Text & "'"
      End If
      If fltr.lblVklVReestr.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VklVReestr='" & fltr.cmbVklVReestr.Text & "'"
      End If
      If fltr.lblOtprVKEY.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OtprVKEY='" & fltr.cmbOtprVKEY.Text & "'"
      End If
      If fltr.lblOpisProblem.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OpisProblem like '%" & fltr.txtOpisProblem.Text & "%'"
      End If
      If fltr.lblKoordin.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Koordin_ID='" & fltr.txtKoordin.Tag & "'"
      End If
      If fltr.lblTheOperator.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_TheOperator_ID='" & fltr.txtTheOperator.Tag & "'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblRayon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Rayon_ID='" & fltr.txtRayon.Tag & "'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblZType.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_ZType_ID='" & fltr.txtZType.Tag & "'"
      End If
      If fltr.lblNum_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num<=" & val(fltr.txtNum_LE.Text)
      End If
      If fltr.lblNum_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num>=" & val(fltr.txtNum_GE.Text)
      End If
      If fltr.lblDataPriem_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem<=" & MakeMSSQLDate(fltr.dtpDataPriem_LE.Value)
      End If
      If fltr.lblDataPriem_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem>=" & MakeMSSQLDate(fltr.dtpDataPriem_GE.Value)
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblGelVremja.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelVremja_ID='" & fltr.txtGelVremja.Tag & "'"
      End If
      If fltr.lblGelData_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData<=" & MakeMSSQLDate(fltr.dtpGelData_LE.Value)
      End If
      If fltr.lblDopInfo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopInfo like '%" & fltr.txtDopInfo.Text & "%'"
      End If
      If fltr.lblPortref.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Portref_ID='" & fltr.txtPortref.Tag & "'"
      End If
      If fltr.lblGelData_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData>=" & MakeMSSQLDate(fltr.dtpGelData_GE.Value)
      End If
      If fltr.lblKontTelefon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontTelefon like '%" & fltr.txtKontTelefon.Text & "%'"
      End If
      If fltr.lblKonrLizo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KonrLizo like '%" & fltr.txtKonrLizo.Text & "%'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
    jfmnuTP_Zay_4.jv.Filter.Add "AUTOTP_Zay_Zay", f
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
   f = " INTSANCEStatusID='{338FCEE8-7170-48FD-B156-99C42C5E0385}'"
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_SrochDogovor_ID='" & fltr.txtSrochDogovor.Tag & "'"
      End If
      If fltr.lblDataInstall_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall<=" & MakeMSSQLDate(fltr.dtpDataInstall_LE.Value)
      End If
      If fltr.lblDataSZT_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT>=" & MakeMSSQLDate(fltr.dtpDataSZT_GE.Value)
      End If
      If fltr.lblDocPolych.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DocPolych='" & fltr.cmbDocPolych.Text & "'"
      End If
      If fltr.lblDataInstall_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall>=" & MakeMSSQLDate(fltr.dtpDataInstall_GE.Value)
      End If
      If fltr.lblVidanModemSer.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VidanModemSer like '%" & fltr.txtVidanModemSer.Text & "%'"
      End If
      If fltr.lblIngener.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Ingener_ID='" & fltr.txtIngener.Tag & "'"
      End If
      If fltr.lblFIOdogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIOdogovor like '%" & fltr.txtFIOdogovor.Text & "%'"
      End If
      If fltr.lblTarif.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Tarif_ID='" & fltr.txtTarif.Tag & "'"
      End If
      If fltr.lblDataSZT_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT<=" & MakeMSSQLDate(fltr.dtpDataSZT_LE.Value)
      End If
      If fltr.lblDopSogl.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopSogl='" & fltr.cmbDopSogl.Text & "'"
      End If
      If fltr.lblDataOtpravVKEY_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY<=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_LE.Value)
      End If
      If fltr.lblKomment.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Komment like '%" & fltr.txtKomment.Text & "%'"
      End If
      If fltr.lblNumDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_NumDogovor like '%" & fltr.txtNumDogovor.Text & "%'"
      End If
      If fltr.lblDataOtpravVKEY_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY>=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_GE.Value)
      End If
      If fltr.lblOtkaz.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Otkaz='" & fltr.cmbOtkaz.Text & "'"
      End If
      If fltr.lblVklVReestr.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VklVReestr='" & fltr.cmbVklVReestr.Text & "'"
      End If
      If fltr.lblOtprVKEY.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OtprVKEY='" & fltr.cmbOtprVKEY.Text & "'"
      End If
      If fltr.lblOpisProblem.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OpisProblem like '%" & fltr.txtOpisProblem.Text & "%'"
      End If
      If fltr.lblKoordin.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Koordin_ID='" & fltr.txtKoordin.Tag & "'"
      End If
      If fltr.lblTheOperator.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_TheOperator_ID='" & fltr.txtTheOperator.Tag & "'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblRayon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Rayon_ID='" & fltr.txtRayon.Tag & "'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblZType.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_ZType_ID='" & fltr.txtZType.Tag & "'"
      End If
      If fltr.lblNum_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num<=" & val(fltr.txtNum_LE.Text)
      End If
      If fltr.lblNum_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num>=" & val(fltr.txtNum_GE.Text)
      End If
      If fltr.lblDataPriem_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem<=" & MakeMSSQLDate(fltr.dtpDataPriem_LE.Value)
      End If
      If fltr.lblDataPriem_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem>=" & MakeMSSQLDate(fltr.dtpDataPriem_GE.Value)
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblGelVremja.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelVremja_ID='" & fltr.txtGelVremja.Tag & "'"
      End If
      If fltr.lblGelData_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData<=" & MakeMSSQLDate(fltr.dtpGelData_LE.Value)
      End If
      If fltr.lblDopInfo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopInfo like '%" & fltr.txtDopInfo.Text & "%'"
      End If
      If fltr.lblPortref.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Portref_ID='" & fltr.txtPortref.Tag & "'"
      End If
      If fltr.lblGelData_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData>=" & MakeMSSQLDate(fltr.dtpGelData_GE.Value)
      End If
      If fltr.lblKontTelefon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontTelefon like '%" & fltr.txtKontTelefon.Text & "%'"
      End If
      If fltr.lblKonrLizo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KonrLizo like '%" & fltr.txtKonrLizo.Text & "%'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
    jfmnuTP_Zay_4.jv.Filter.Add "AUTOTP_Zay_Zay", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuTP_Zay_4_OnClearFilter()
   jfmnuTP_Zay_4.jv.Filter.Add "AUTOTP_Zay_Zay", " INTSANCEStatusID='{338FCEE8-7170-48FD-B156-99C42C5E0385}'"
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
      Set journal = Manager.GetInstanceObject("{19399670-D6CC-40D4-97AC-0348FC9B9F7E}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuTP_Zay_5.jv.journal = journal
      jfmnuTP_Zay_5.jv.OpenModal = False
      jfmnuTP_Zay_5.Caption = "Заявки :На исполнении"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{671F9B19-6917-4CDC-B3F2-D0CF0BC24976}'"
    jfmnuTP_Zay_5.jv.Filter.Add "AUTOTP_Zay_Zay", f
    Dim fltr As frmTP_Zay
    Set fltr = New frmTP_Zay
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_SrochDogovor_ID='" & fltr.txtSrochDogovor.Tag & "'"
      End If
      If fltr.lblDataInstall_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall<=" & MakeMSSQLDate(fltr.dtpDataInstall_LE.Value)
      End If
      If fltr.lblDataSZT_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT>=" & MakeMSSQLDate(fltr.dtpDataSZT_GE.Value)
      End If
      If fltr.lblDocPolych.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DocPolych='" & fltr.cmbDocPolych.Text & "'"
      End If
      If fltr.lblDataInstall_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall>=" & MakeMSSQLDate(fltr.dtpDataInstall_GE.Value)
      End If
      If fltr.lblVidanModemSer.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VidanModemSer like '%" & fltr.txtVidanModemSer.Text & "%'"
      End If
      If fltr.lblIngener.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Ingener_ID='" & fltr.txtIngener.Tag & "'"
      End If
      If fltr.lblFIOdogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIOdogovor like '%" & fltr.txtFIOdogovor.Text & "%'"
      End If
      If fltr.lblTarif.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Tarif_ID='" & fltr.txtTarif.Tag & "'"
      End If
      If fltr.lblDataSZT_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT<=" & MakeMSSQLDate(fltr.dtpDataSZT_LE.Value)
      End If
      If fltr.lblDopSogl.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopSogl='" & fltr.cmbDopSogl.Text & "'"
      End If
      If fltr.lblDataOtpravVKEY_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY<=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_LE.Value)
      End If
      If fltr.lblKomment.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Komment like '%" & fltr.txtKomment.Text & "%'"
      End If
      If fltr.lblNumDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_NumDogovor like '%" & fltr.txtNumDogovor.Text & "%'"
      End If
      If fltr.lblDataOtpravVKEY_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY>=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_GE.Value)
      End If
      If fltr.lblOtkaz.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Otkaz='" & fltr.cmbOtkaz.Text & "'"
      End If
      If fltr.lblVklVReestr.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VklVReestr='" & fltr.cmbVklVReestr.Text & "'"
      End If
      If fltr.lblOtprVKEY.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OtprVKEY='" & fltr.cmbOtprVKEY.Text & "'"
      End If
      If fltr.lblOpisProblem.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OpisProblem like '%" & fltr.txtOpisProblem.Text & "%'"
      End If
      If fltr.lblKoordin.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Koordin_ID='" & fltr.txtKoordin.Tag & "'"
      End If
      If fltr.lblTheOperator.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_TheOperator_ID='" & fltr.txtTheOperator.Tag & "'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblRayon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Rayon_ID='" & fltr.txtRayon.Tag & "'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblZType.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_ZType_ID='" & fltr.txtZType.Tag & "'"
      End If
      If fltr.lblNum_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num<=" & val(fltr.txtNum_LE.Text)
      End If
      If fltr.lblNum_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num>=" & val(fltr.txtNum_GE.Text)
      End If
      If fltr.lblDataPriem_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem<=" & MakeMSSQLDate(fltr.dtpDataPriem_LE.Value)
      End If
      If fltr.lblDataPriem_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem>=" & MakeMSSQLDate(fltr.dtpDataPriem_GE.Value)
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblGelVremja.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelVremja_ID='" & fltr.txtGelVremja.Tag & "'"
      End If
      If fltr.lblGelData_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData<=" & MakeMSSQLDate(fltr.dtpGelData_LE.Value)
      End If
      If fltr.lblDopInfo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopInfo like '%" & fltr.txtDopInfo.Text & "%'"
      End If
      If fltr.lblPortref.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Portref_ID='" & fltr.txtPortref.Tag & "'"
      End If
      If fltr.lblGelData_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData>=" & MakeMSSQLDate(fltr.dtpGelData_GE.Value)
      End If
      If fltr.lblKontTelefon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontTelefon like '%" & fltr.txtKontTelefon.Text & "%'"
      End If
      If fltr.lblKonrLizo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KonrLizo like '%" & fltr.txtKonrLizo.Text & "%'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
    jfmnuTP_Zay_5.jv.Filter.Add "AUTOTP_Zay_Zay", f
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
   f = " INTSANCEStatusID='{671F9B19-6917-4CDC-B3F2-D0CF0BC24976}'"
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_SrochDogovor_ID='" & fltr.txtSrochDogovor.Tag & "'"
      End If
      If fltr.lblDataInstall_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall<=" & MakeMSSQLDate(fltr.dtpDataInstall_LE.Value)
      End If
      If fltr.lblDataSZT_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT>=" & MakeMSSQLDate(fltr.dtpDataSZT_GE.Value)
      End If
      If fltr.lblDocPolych.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DocPolych='" & fltr.cmbDocPolych.Text & "'"
      End If
      If fltr.lblDataInstall_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall>=" & MakeMSSQLDate(fltr.dtpDataInstall_GE.Value)
      End If
      If fltr.lblVidanModemSer.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VidanModemSer like '%" & fltr.txtVidanModemSer.Text & "%'"
      End If
      If fltr.lblIngener.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Ingener_ID='" & fltr.txtIngener.Tag & "'"
      End If
      If fltr.lblFIOdogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIOdogovor like '%" & fltr.txtFIOdogovor.Text & "%'"
      End If
      If fltr.lblTarif.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Tarif_ID='" & fltr.txtTarif.Tag & "'"
      End If
      If fltr.lblDataSZT_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT<=" & MakeMSSQLDate(fltr.dtpDataSZT_LE.Value)
      End If
      If fltr.lblDopSogl.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopSogl='" & fltr.cmbDopSogl.Text & "'"
      End If
      If fltr.lblDataOtpravVKEY_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY<=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_LE.Value)
      End If
      If fltr.lblKomment.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Komment like '%" & fltr.txtKomment.Text & "%'"
      End If
      If fltr.lblNumDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_NumDogovor like '%" & fltr.txtNumDogovor.Text & "%'"
      End If
      If fltr.lblDataOtpravVKEY_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY>=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_GE.Value)
      End If
      If fltr.lblOtkaz.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Otkaz='" & fltr.cmbOtkaz.Text & "'"
      End If
      If fltr.lblVklVReestr.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VklVReestr='" & fltr.cmbVklVReestr.Text & "'"
      End If
      If fltr.lblOtprVKEY.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OtprVKEY='" & fltr.cmbOtprVKEY.Text & "'"
      End If
      If fltr.lblOpisProblem.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OpisProblem like '%" & fltr.txtOpisProblem.Text & "%'"
      End If
      If fltr.lblKoordin.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Koordin_ID='" & fltr.txtKoordin.Tag & "'"
      End If
      If fltr.lblTheOperator.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_TheOperator_ID='" & fltr.txtTheOperator.Tag & "'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblRayon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Rayon_ID='" & fltr.txtRayon.Tag & "'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblZType.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_ZType_ID='" & fltr.txtZType.Tag & "'"
      End If
      If fltr.lblNum_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num<=" & val(fltr.txtNum_LE.Text)
      End If
      If fltr.lblNum_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num>=" & val(fltr.txtNum_GE.Text)
      End If
      If fltr.lblDataPriem_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem<=" & MakeMSSQLDate(fltr.dtpDataPriem_LE.Value)
      End If
      If fltr.lblDataPriem_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem>=" & MakeMSSQLDate(fltr.dtpDataPriem_GE.Value)
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblGelVremja.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelVremja_ID='" & fltr.txtGelVremja.Tag & "'"
      End If
      If fltr.lblGelData_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData<=" & MakeMSSQLDate(fltr.dtpGelData_LE.Value)
      End If
      If fltr.lblDopInfo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopInfo like '%" & fltr.txtDopInfo.Text & "%'"
      End If
      If fltr.lblPortref.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Portref_ID='" & fltr.txtPortref.Tag & "'"
      End If
      If fltr.lblGelData_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData>=" & MakeMSSQLDate(fltr.dtpGelData_GE.Value)
      End If
      If fltr.lblKontTelefon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontTelefon like '%" & fltr.txtKontTelefon.Text & "%'"
      End If
      If fltr.lblKonrLizo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KonrLizo like '%" & fltr.txtKonrLizo.Text & "%'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
    jfmnuTP_Zay_5.jv.Filter.Add "AUTOTP_Zay_Zay", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuTP_Zay_5_OnClearFilter()
   jfmnuTP_Zay_5.jv.Filter.Add "AUTOTP_Zay_Zay", " INTSANCEStatusID='{671F9B19-6917-4CDC-B3F2-D0CF0BC24976}'"
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
      Set journal = Manager.GetInstanceObject("{19399670-D6CC-40D4-97AC-0348FC9B9F7E}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuTP_Zay_6.jv.journal = journal
      jfmnuTP_Zay_6.jv.OpenModal = False
      jfmnuTP_Zay_6.Caption = "Заявки :Передана в СЗТ"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{81A45913-9900-4034-B78D-E083B0285DEC}'"
    jfmnuTP_Zay_6.jv.Filter.Add "AUTOTP_Zay_Zay", f
    Dim fltr As frmTP_Zay
    Set fltr = New frmTP_Zay
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_SrochDogovor_ID='" & fltr.txtSrochDogovor.Tag & "'"
      End If
      If fltr.lblDataInstall_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall<=" & MakeMSSQLDate(fltr.dtpDataInstall_LE.Value)
      End If
      If fltr.lblDataSZT_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT>=" & MakeMSSQLDate(fltr.dtpDataSZT_GE.Value)
      End If
      If fltr.lblDocPolych.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DocPolych='" & fltr.cmbDocPolych.Text & "'"
      End If
      If fltr.lblDataInstall_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall>=" & MakeMSSQLDate(fltr.dtpDataInstall_GE.Value)
      End If
      If fltr.lblVidanModemSer.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VidanModemSer like '%" & fltr.txtVidanModemSer.Text & "%'"
      End If
      If fltr.lblIngener.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Ingener_ID='" & fltr.txtIngener.Tag & "'"
      End If
      If fltr.lblFIOdogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIOdogovor like '%" & fltr.txtFIOdogovor.Text & "%'"
      End If
      If fltr.lblTarif.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Tarif_ID='" & fltr.txtTarif.Tag & "'"
      End If
      If fltr.lblDataSZT_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT<=" & MakeMSSQLDate(fltr.dtpDataSZT_LE.Value)
      End If
      If fltr.lblDopSogl.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopSogl='" & fltr.cmbDopSogl.Text & "'"
      End If
      If fltr.lblDataOtpravVKEY_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY<=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_LE.Value)
      End If
      If fltr.lblKomment.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Komment like '%" & fltr.txtKomment.Text & "%'"
      End If
      If fltr.lblNumDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_NumDogovor like '%" & fltr.txtNumDogovor.Text & "%'"
      End If
      If fltr.lblDataOtpravVKEY_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY>=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_GE.Value)
      End If
      If fltr.lblOtkaz.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Otkaz='" & fltr.cmbOtkaz.Text & "'"
      End If
      If fltr.lblVklVReestr.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VklVReestr='" & fltr.cmbVklVReestr.Text & "'"
      End If
      If fltr.lblOtprVKEY.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OtprVKEY='" & fltr.cmbOtprVKEY.Text & "'"
      End If
      If fltr.lblOpisProblem.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OpisProblem like '%" & fltr.txtOpisProblem.Text & "%'"
      End If
      If fltr.lblKoordin.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Koordin_ID='" & fltr.txtKoordin.Tag & "'"
      End If
      If fltr.lblTheOperator.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_TheOperator_ID='" & fltr.txtTheOperator.Tag & "'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblRayon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Rayon_ID='" & fltr.txtRayon.Tag & "'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblZType.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_ZType_ID='" & fltr.txtZType.Tag & "'"
      End If
      If fltr.lblNum_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num<=" & val(fltr.txtNum_LE.Text)
      End If
      If fltr.lblNum_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num>=" & val(fltr.txtNum_GE.Text)
      End If
      If fltr.lblDataPriem_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem<=" & MakeMSSQLDate(fltr.dtpDataPriem_LE.Value)
      End If
      If fltr.lblDataPriem_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem>=" & MakeMSSQLDate(fltr.dtpDataPriem_GE.Value)
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblGelVremja.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelVremja_ID='" & fltr.txtGelVremja.Tag & "'"
      End If
      If fltr.lblGelData_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData<=" & MakeMSSQLDate(fltr.dtpGelData_LE.Value)
      End If
      If fltr.lblDopInfo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopInfo like '%" & fltr.txtDopInfo.Text & "%'"
      End If
      If fltr.lblPortref.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Portref_ID='" & fltr.txtPortref.Tag & "'"
      End If
      If fltr.lblGelData_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData>=" & MakeMSSQLDate(fltr.dtpGelData_GE.Value)
      End If
      If fltr.lblKontTelefon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontTelefon like '%" & fltr.txtKontTelefon.Text & "%'"
      End If
      If fltr.lblKonrLizo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KonrLizo like '%" & fltr.txtKonrLizo.Text & "%'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
    jfmnuTP_Zay_6.jv.Filter.Add "AUTOTP_Zay_Zay", f
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
   f = " INTSANCEStatusID='{81A45913-9900-4034-B78D-E083B0285DEC}'"
      If fltr.lblSrochDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_SrochDogovor_ID='" & fltr.txtSrochDogovor.Tag & "'"
      End If
      If fltr.lblDataInstall_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall<=" & MakeMSSQLDate(fltr.dtpDataInstall_LE.Value)
      End If
      If fltr.lblDataSZT_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT>=" & MakeMSSQLDate(fltr.dtpDataSZT_GE.Value)
      End If
      If fltr.lblDocPolych.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DocPolych='" & fltr.cmbDocPolych.Text & "'"
      End If
      If fltr.lblDataInstall_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataInstall>=" & MakeMSSQLDate(fltr.dtpDataInstall_GE.Value)
      End If
      If fltr.lblVidanModemSer.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VidanModemSer like '%" & fltr.txtVidanModemSer.Text & "%'"
      End If
      If fltr.lblIngener.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Ingener_ID='" & fltr.txtIngener.Tag & "'"
      End If
      If fltr.lblFIOdogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIOdogovor like '%" & fltr.txtFIOdogovor.Text & "%'"
      End If
      If fltr.lblTarif.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Tarif_ID='" & fltr.txtTarif.Tag & "'"
      End If
      If fltr.lblDataSZT_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataSZT<=" & MakeMSSQLDate(fltr.dtpDataSZT_LE.Value)
      End If
      If fltr.lblDopSogl.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopSogl='" & fltr.cmbDopSogl.Text & "'"
      End If
      If fltr.lblDataOtpravVKEY_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY<=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_LE.Value)
      End If
      If fltr.lblKomment.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Komment like '%" & fltr.txtKomment.Text & "%'"
      End If
      If fltr.lblNumDogovor.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_NumDogovor like '%" & fltr.txtNumDogovor.Text & "%'"
      End If
      If fltr.lblDataOtpravVKEY_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataOtpravVKEY>=" & MakeMSSQLDate(fltr.dtpDataOtpravVKEY_GE.Value)
      End If
      If fltr.lblOtkaz.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Otkaz='" & fltr.cmbOtkaz.Text & "'"
      End If
      If fltr.lblVklVReestr.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VklVReestr='" & fltr.cmbVklVReestr.Text & "'"
      End If
      If fltr.lblOtprVKEY.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OtprVKEY='" & fltr.cmbOtprVKEY.Text & "'"
      End If
      If fltr.lblOpisProblem.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_OpisProblem like '%" & fltr.txtOpisProblem.Text & "%'"
      End If
      If fltr.lblKoordin.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Koordin_ID='" & fltr.txtKoordin.Tag & "'"
      End If
      If fltr.lblTheOperator.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_TheOperator_ID='" & fltr.txtTheOperator.Tag & "'"
      End If
      If fltr.lblFIO.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_FIO like '%" & fltr.txtFIO.Text & "%'"
      End If
      If fltr.lblRayon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Rayon_ID='" & fltr.txtRayon.Tag & "'"
      End If
      If fltr.lblAdres.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Adres like '%" & fltr.txtAdres.Text & "%'"
      End If
      If fltr.lblZType.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_ZType_ID='" & fltr.txtZType.Tag & "'"
      End If
      If fltr.lblNum_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num<=" & val(fltr.txtNum_LE.Text)
      End If
      If fltr.lblNum_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Num>=" & val(fltr.txtNum_GE.Text)
      End If
      If fltr.lblDataPriem_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem<=" & MakeMSSQLDate(fltr.dtpDataPriem_LE.Value)
      End If
      If fltr.lblDataPriem_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DataPriem>=" & MakeMSSQLDate(fltr.dtpDataPriem_GE.Value)
      End If
      If fltr.lblMetro.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Metro_ID='" & fltr.txtMetro.Tag & "'"
      End If
      If fltr.lblGelVremja.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelVremja_ID='" & fltr.txtGelVremja.Tag & "'"
      End If
      If fltr.lblGelData_LE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData<=" & MakeMSSQLDate(fltr.dtpGelData_LE.Value)
      End If
      If fltr.lblDopInfo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_DopInfo like '%" & fltr.txtDopInfo.Text & "%'"
      End If
      If fltr.lblPortref.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_Portref_ID='" & fltr.txtPortref.Tag & "'"
      End If
      If fltr.lblGelData_GE.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_GelData>=" & MakeMSSQLDate(fltr.dtpGelData_GE.Value)
      End If
      If fltr.lblKontTelefon.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontTelefon like '%" & fltr.txtKontTelefon.Text & "%'"
      End If
      If fltr.lblKonrLizo.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KonrLizo like '%" & fltr.txtKonrLizo.Text & "%'"
      End If
      If fltr.lblVremjaDljaSvjazi.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_VremjaDljaSvjazi like '%" & fltr.txtVremjaDljaSvjazi.Text & "%'"
      End If
      If fltr.lblKontEMAIL.Value = vbChecked Then
        f = f & " and TP_Zay_Zay_KontEMAIL like '%" & fltr.txtKontEMAIL.Text & "%'"
      End If
    jfmnuTP_Zay_6.jv.Filter.Add "AUTOTP_Zay_Zay", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuTP_Zay_6_OnClearFilter()
   jfmnuTP_Zay_6.jv.Filter.Add "AUTOTP_Zay_Zay", " INTSANCEStatusID='{81A45913-9900-4034-B78D-E083B0285DEC}'"
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




Private Sub mnuTP_MIN_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuTP_MIN Is Nothing Then
      Set jfmnuTP_MIN = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{94CFC583-8812-40DC-A731-53212AB151AD}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuTP_MIN.jv.journal = journal
      jfmnuTP_MIN.jv.OpenModal = False
      jfmnuTP_MIN.Caption = "Приход модемов"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
    Dim fltr As frmTP_MIN
    Set fltr = New frmTP_MIN
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblClientReturns.Value = vbChecked Then
        f = f & " and TP_MIN_DEF_ClientReturns='" & fltr.cmbClientReturns.Text & "'"
      End If
      If fltr.lblNDS_GE.Value = vbChecked Then
        f = f & " and TP_MIN_DEF_NDS>=" & val(fltr.txtNDS_GE.Text)
      End If
      If fltr.lblNDS_LE.Value = vbChecked Then
        f = f & " and TP_MIN_DEF_NDS<=" & val(fltr.txtNDS_LE.Text)
      End If
      If fltr.lblTheDAte_GE.Value = vbChecked Then
        f = f & " and TP_MIN_DEF_TheDAte>=" & MakeMSSQLDate(fltr.dtpTheDAte_GE.Value)
      End If
      If fltr.lblTheDAte_LE.Value = vbChecked Then
        f = f & " and TP_MIN_DEF_TheDAte<=" & MakeMSSQLDate(fltr.dtpTheDAte_LE.Value)
      End If
      If fltr.lblActNum.Value = vbChecked Then
        f = f & " and TP_MIN_DEF_ActNum like '%" & fltr.txtActNum.Text & "%'"
      End If
    jfmnuTP_MIN.jv.Filter.Add "AUTOTP_MIN_DEF", f
    End If
      jfmnuTP_MIN.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuTP_MIN.Show
    jfmnuTP_MIN.WindowState = 0
    jfmnuTP_MIN.ZOrder 0
End Sub
Private Sub jfmnuTP_MIN_OnFilter(usedefault As Boolean)
    Dim fltr As frmTP_MIN
    Dim f As String
    Set fltr = New frmTP_MIN
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
      If fltr.lblClientReturns.Value = vbChecked Then
        f = f & " and TP_MIN_DEF_ClientReturns='" & fltr.cmbClientReturns.Text & "'"
      End If
      If fltr.lblNDS_GE.Value = vbChecked Then
        f = f & " and TP_MIN_DEF_NDS>=" & val(fltr.txtNDS_GE.Text)
      End If
      If fltr.lblNDS_LE.Value = vbChecked Then
        f = f & " and TP_MIN_DEF_NDS<=" & val(fltr.txtNDS_LE.Text)
      End If
      If fltr.lblTheDAte_GE.Value = vbChecked Then
        f = f & " and TP_MIN_DEF_TheDAte>=" & MakeMSSQLDate(fltr.dtpTheDAte_GE.Value)
      End If
      If fltr.lblTheDAte_LE.Value = vbChecked Then
        f = f & " and TP_MIN_DEF_TheDAte<=" & MakeMSSQLDate(fltr.dtpTheDAte_LE.Value)
      End If
      If fltr.lblActNum.Value = vbChecked Then
        f = f & " and TP_MIN_DEF_ActNum like '%" & fltr.txtActNum.Text & "%'"
      End If
    jfmnuTP_MIN.jv.Filter.Add "AUTOTP_MIN_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuTP_MIN_OnClearFilter()
End Sub
Private Sub jfmnuTP_MIN_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "TP_MIN", "Приход модемов" & Now, Site
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


Private Sub mnuTP_MOUT_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuTP_MOUT Is Nothing Then
      Set jfmnuTP_MOUT = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{E1210353-7BC6-410E-AF62-E79B13F6BCB7}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuTP_MOUT.jv.journal = journal
      jfmnuTP_MOUT.jv.OpenModal = False
      jfmnuTP_MOUT.Caption = "Расход модемов"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
    Dim fltr As frmTP_MOUT
    Set fltr = New frmTP_MOUT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblRetToSZT.Value = vbChecked Then
        f = f & " and TP_MOUT_DEF_RetToSZT='" & fltr.cmbRetToSZT.Text & "'"
      End If
      If fltr.lblNDS_GE.Value = vbChecked Then
        f = f & " and TP_MOUT_DEF_NDS>=" & val(fltr.txtNDS_GE.Text)
      End If
      If fltr.lblNDS_LE.Value = vbChecked Then
        f = f & " and TP_MOUT_DEF_NDS<=" & val(fltr.txtNDS_LE.Text)
      End If
      If fltr.lblTheDAte_GE.Value = vbChecked Then
        f = f & " and TP_MOUT_DEF_TheDAte>=" & MakeMSSQLDate(fltr.dtpTheDAte_GE.Value)
      End If
      If fltr.lblTheDAte_LE.Value = vbChecked Then
        f = f & " and TP_MOUT_DEF_TheDAte<=" & MakeMSSQLDate(fltr.dtpTheDAte_LE.Value)
      End If
      If fltr.lblActNum.Value = vbChecked Then
        f = f & " and TP_MOUT_DEF_ActNum like '%" & fltr.txtActNum.Text & "%'"
      End If
    jfmnuTP_MOUT.jv.Filter.Add "AUTOTP_MOUT_DEF", f
    End If
      jfmnuTP_MOUT.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuTP_MOUT.Show
    jfmnuTP_MOUT.WindowState = 0
    jfmnuTP_MOUT.ZOrder 0
End Sub
Private Sub jfmnuTP_MOUT_OnFilter(usedefault As Boolean)
    Dim fltr As frmTP_MOUT
    Dim f As String
    Set fltr = New frmTP_MOUT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
      If fltr.lblRetToSZT.Value = vbChecked Then
        f = f & " and TP_MOUT_DEF_RetToSZT='" & fltr.cmbRetToSZT.Text & "'"
      End If
      If fltr.lblNDS_GE.Value = vbChecked Then
        f = f & " and TP_MOUT_DEF_NDS>=" & val(fltr.txtNDS_GE.Text)
      End If
      If fltr.lblNDS_LE.Value = vbChecked Then
        f = f & " and TP_MOUT_DEF_NDS<=" & val(fltr.txtNDS_LE.Text)
      End If
      If fltr.lblTheDAte_GE.Value = vbChecked Then
        f = f & " and TP_MOUT_DEF_TheDAte>=" & MakeMSSQLDate(fltr.dtpTheDAte_GE.Value)
      End If
      If fltr.lblTheDAte_LE.Value = vbChecked Then
        f = f & " and TP_MOUT_DEF_TheDAte<=" & MakeMSSQLDate(fltr.dtpTheDAte_LE.Value)
      End If
      If fltr.lblActNum.Value = vbChecked Then
        f = f & " and TP_MOUT_DEF_ActNum like '%" & fltr.txtActNum.Text & "%'"
      End If
    jfmnuTP_MOUT.jv.Filter.Add "AUTOTP_MOUT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuTP_MOUT_OnClearFilter()
End Sub
Private Sub jfmnuTP_MOUT_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "TP_MOUT", "Расход модемов" & Now, Site
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

Unload jfmnuTP_MIN
Set jfmnuTP_MIN = Nothing

Unload jfmnuTP_MOUT
Set jfmnuTP_MOUT = Nothing



End Sub



