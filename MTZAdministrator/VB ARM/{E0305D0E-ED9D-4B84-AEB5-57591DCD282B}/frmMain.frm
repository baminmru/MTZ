VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
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
      Begin VB.Menu mnuITTOPT 
         Caption         =   "Задание на оптимизацию склада"
         Begin VB.Menu mnuAllITTOPT 
            Caption         =   "Задание на оптимизацию склада - все состояния"
         End
         Begin VB.Menu mnuITTOPT_1 
            Caption         =   "Задание на оптимизацию склада :Задание исполнено"
         End
         Begin VB.Menu mnuITTOPT_2 
            Caption         =   "Задание на оптимизацию склада :Задание напечатано"
         End
         Begin VB.Menu mnuITTOPT_3 
            Caption         =   "Задание на оптимизацию склада :Задание сформировано"
         End
         Begin VB.Menu mnuITTOPT_4 
            Caption         =   "Задание на оптимизацию склада :Идет расчет"
         End
         Begin VB.Menu mnuITTOPT_5 
            Caption         =   "Задание на оптимизацию склада :Исполняется"
         End
         Begin VB.Menu mnuITTOPT_6 
            Caption         =   "Задание на оптимизацию склада :Отменено"
         End
         Begin VB.Menu mnuITTOPT_7 
            Caption         =   "Задание на оптимизацию склада :Оформлен"
         End
         Begin VB.Menu mnuITTOPT_8 
            Caption         =   "Задание на оптимизацию склада :Оформляется"
         End
      End
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
      Begin VB.Menu mnuITTPL 
         Caption         =   "Палетта"
         Begin VB.Menu mnuAllITTPL 
            Caption         =   "Палетта - все состояния"
         End
         Begin VB.Menu mnuITTPL_1 
            Caption         =   "Палетта :Пустая"
         End
         Begin VB.Menu mnuITTPL_2 
            Caption         =   "Палетта :Взвешена"
         End
         Begin VB.Menu mnuITTPL_3 
            Caption         =   "Палетта :На складе с грузом"
         End
         Begin VB.Menu mnuITTPL_4 
            Caption         =   "Палетта :Списана"
         End
         Begin VB.Menu mnuITTPL_5 
            Caption         =   "Палетта :Отправлена с грузом"
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
      Begin VB.Menu mnuITTCS 
         Caption         =   "Услуги клиентов"
      End
   End
   Begin VB.Menu mnuDictionary 
      Caption         =   "Справочники"
      Begin VB.Menu mnuITTFN 
         Caption         =   "Настройки системы"
      End
      Begin VB.Menu mnuITTOP 
         Caption         =   "Операторы и кладовщики"
      End
      Begin VB.Menu mnuITTD 
         Caption         =   "Справочник"
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

Dim WithEvents jfmnuAllITTOPT As frmJournalShow
Attribute jfmnuAllITTOPT.VB_VarHelpID = -1

Dim WithEvents jfmnuITTOPT_1 As frmJournalShow
Attribute jfmnuITTOPT_1.VB_VarHelpID = -1

Dim WithEvents jfmnuITTOPT_2 As frmJournalShow
Attribute jfmnuITTOPT_2.VB_VarHelpID = -1

Dim WithEvents jfmnuITTOPT_3 As frmJournalShow
Attribute jfmnuITTOPT_3.VB_VarHelpID = -1

Dim WithEvents jfmnuITTOPT_4 As frmJournalShow
Attribute jfmnuITTOPT_4.VB_VarHelpID = -1

Dim WithEvents jfmnuITTOPT_5 As frmJournalShow
Attribute jfmnuITTOPT_5.VB_VarHelpID = -1

Dim WithEvents jfmnuITTOPT_6 As frmJournalShow
Attribute jfmnuITTOPT_6.VB_VarHelpID = -1

Dim WithEvents jfmnuITTOPT_7 As frmJournalShow
Attribute jfmnuITTOPT_7.VB_VarHelpID = -1

Dim WithEvents jfmnuITTOPT_8 As frmJournalShow
Attribute jfmnuITTOPT_8.VB_VarHelpID = -1



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



Dim WithEvents jfmnuAllITTPL As frmJournalShow
Attribute jfmnuAllITTPL.VB_VarHelpID = -1

Dim WithEvents jfmnuITTPL_1 As frmJournalShow
Attribute jfmnuITTPL_1.VB_VarHelpID = -1

Dim WithEvents jfmnuITTPL_2 As frmJournalShow
Attribute jfmnuITTPL_2.VB_VarHelpID = -1

Dim WithEvents jfmnuITTPL_3 As frmJournalShow
Attribute jfmnuITTPL_3.VB_VarHelpID = -1

Dim WithEvents jfmnuITTPL_4 As frmJournalShow
Attribute jfmnuITTPL_4.VB_VarHelpID = -1

Dim WithEvents jfmnuITTPL_5 As frmJournalShow
Attribute jfmnuITTPL_5.VB_VarHelpID = -1



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



Dim WithEvents jfmnuITTCS As frmJournalShow
Attribute jfmnuITTCS.VB_VarHelpID = -1

















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


Private Sub mnuAllITTOPT_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuAllITTOPT Is Nothing Then
      Set jfmnuAllITTOPT = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{70D005EF-420B-4A40-8CDF-B4800FCD0F1D}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuAllITTOPT.jv.journal = journal
      jfmnuAllITTOPT.jv.OpenModal = False
      jfmnuAllITTOPT.Caption = "Задание на оптимизацию склада - все состояния"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
    Dim fltr As frmITTOPT
    Set fltr = New frmITTOPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblMade_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to<=" & MakeMSSQLDate(fltr.dtpMade_date_to_LE.Value)
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblPartRef.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_PartRef_ID='" & fltr.txtPartRef.Tag & "'"
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak='" & fltr.cmbIsBrak.Text & "'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good_ID='" & fltr.txtgood.Tag & "'"
      End If
      If fltr.lblMade_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to>=" & MakeMSSQLDate(fltr.dtpMade_date_to_GE.Value)
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblMade_date_From_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From<=" & MakeMSSQLDate(fltr.dtpMade_date_From_LE.Value)
      End If
      If fltr.lblMade_date_From_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From>=" & MakeMSSQLDate(fltr.dtpMade_date_From_GE.Value)
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER_ID='" & fltr.txtKILL_NUMBER.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory_ID='" & fltr.txtFactory.Tag & "'"
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country_ID='" & fltr.txtmade_country.Tag & "'"
      End If
      If fltr.lblarticul.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_articul like '%" & fltr.txtarticul.Text & "%'"
      End If
      If fltr.lblIsCaliber.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsCaliber='" & fltr.cmbIsCaliber.Text & "'"
      End If
      If fltr.lblexp_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to<=" & MakeMSSQLDate(fltr.dtpexp_date_to_LE.Value)
      End If
      If fltr.lblexp_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to>=" & MakeMSSQLDate(fltr.dtpexp_date_to_GE.Value)
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblexp_date_from_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from<=" & MakeMSSQLDate(fltr.dtpexp_date_from_LE.Value)
      End If
      If fltr.lblexp_date_from_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from>=" & MakeMSSQLDate(fltr.dtpexp_date_from_GE.Value)
      End If
      If fltr.lblVidOtruba.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_VidOtruba like '%" & fltr.txtVidOtruba.Text & "%'"
      End If
    jfmnuAllITTOPT.jv.Filter.Add "AUTOITTOPT_DEF", f
    End If
      jfmnuAllITTOPT.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuAllITTOPT.Show
    jfmnuAllITTOPT.WindowState = 0
    jfmnuAllITTOPT.ZOrder 0
End Sub
Private Sub jfmnuAllITTOPT_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTOPT
    Dim f As String
    Set fltr = New frmITTOPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
      If fltr.lblMade_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to<=" & MakeMSSQLDate(fltr.dtpMade_date_to_LE.Value)
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblPartRef.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_PartRef_ID='" & fltr.txtPartRef.Tag & "'"
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak='" & fltr.cmbIsBrak.Text & "'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good_ID='" & fltr.txtgood.Tag & "'"
      End If
      If fltr.lblMade_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to>=" & MakeMSSQLDate(fltr.dtpMade_date_to_GE.Value)
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblMade_date_From_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From<=" & MakeMSSQLDate(fltr.dtpMade_date_From_LE.Value)
      End If
      If fltr.lblMade_date_From_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From>=" & MakeMSSQLDate(fltr.dtpMade_date_From_GE.Value)
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER_ID='" & fltr.txtKILL_NUMBER.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory_ID='" & fltr.txtFactory.Tag & "'"
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country_ID='" & fltr.txtmade_country.Tag & "'"
      End If
      If fltr.lblarticul.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_articul like '%" & fltr.txtarticul.Text & "%'"
      End If
      If fltr.lblIsCaliber.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsCaliber='" & fltr.cmbIsCaliber.Text & "'"
      End If
      If fltr.lblexp_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to<=" & MakeMSSQLDate(fltr.dtpexp_date_to_LE.Value)
      End If
      If fltr.lblexp_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to>=" & MakeMSSQLDate(fltr.dtpexp_date_to_GE.Value)
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblexp_date_from_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from<=" & MakeMSSQLDate(fltr.dtpexp_date_from_LE.Value)
      End If
      If fltr.lblexp_date_from_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from>=" & MakeMSSQLDate(fltr.dtpexp_date_from_GE.Value)
      End If
      If fltr.lblVidOtruba.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_VidOtruba like '%" & fltr.txtVidOtruba.Text & "%'"
      End If
    jfmnuAllITTOPT.jv.Filter.Add "AUTOITTOPT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuAllITTOPT_OnClearFilter()
End Sub
Private Sub jfmnuAllITTOPT_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTOPT", "Задание на оптимизацию склада" & Now, Site
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


Private Sub mnuITTOPT_1_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITTOPT_1 Is Nothing Then
      Set jfmnuITTOPT_1 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{70D005EF-420B-4A40-8CDF-B4800FCD0F1D}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITTOPT_1.jv.journal = journal
      jfmnuITTOPT_1.jv.OpenModal = False
      jfmnuITTOPT_1.Caption = "Задание на оптимизацию склада :Задание исполнено"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{0A7FC795-E787-4D17-9689-96EFFF8F0D9D}'"
    jfmnuITTOPT_1.jv.Filter.Add "AUTOITTOPT_DEF", f
    Dim fltr As frmITTOPT
    Set fltr = New frmITTOPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER_ID='" & fltr.txtKILL_NUMBER.Tag & "'"
      End If
      If fltr.lblarticul.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_articul like '%" & fltr.txtarticul.Text & "%'"
      End If
      If fltr.lblexp_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to>=" & MakeMSSQLDate(fltr.dtpexp_date_to_GE.Value)
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblexp_date_from_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from<=" & MakeMSSQLDate(fltr.dtpexp_date_from_LE.Value)
      End If
      If fltr.lblVidOtruba.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_VidOtruba like '%" & fltr.txtVidOtruba.Text & "%'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblexp_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to<=" & MakeMSSQLDate(fltr.dtpexp_date_to_LE.Value)
      End If
      If fltr.lblMade_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to<=" & MakeMSSQLDate(fltr.dtpMade_date_to_LE.Value)
      End If
      If fltr.lblexp_date_from_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from>=" & MakeMSSQLDate(fltr.dtpexp_date_from_GE.Value)
      End If
      If fltr.lblMade_date_From_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From>=" & MakeMSSQLDate(fltr.dtpMade_date_From_GE.Value)
      End If
      If fltr.lblIsCaliber.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsCaliber='" & fltr.cmbIsCaliber.Text & "'"
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good_ID='" & fltr.txtgood.Tag & "'"
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblPartRef.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_PartRef_ID='" & fltr.txtPartRef.Tag & "'"
      End If
      If fltr.lblMade_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to>=" & MakeMSSQLDate(fltr.dtpMade_date_to_GE.Value)
      End If
      If fltr.lblMade_date_From_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From<=" & MakeMSSQLDate(fltr.dtpMade_date_From_LE.Value)
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory_ID='" & fltr.txtFactory.Tag & "'"
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country_ID='" & fltr.txtmade_country.Tag & "'"
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak='" & fltr.cmbIsBrak.Text & "'"
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
    jfmnuITTOPT_1.jv.Filter.Add "AUTOITTOPT_DEF", f
    End If
      jfmnuITTOPT_1.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITTOPT_1.Show
    jfmnuITTOPT_1.WindowState = 0
    jfmnuITTOPT_1.ZOrder 0
End Sub
Private Sub jfmnuITTOPT_1_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTOPT
    Dim f As String
    Set fltr = New frmITTOPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{0A7FC795-E787-4D17-9689-96EFFF8F0D9D}'"
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER_ID='" & fltr.txtKILL_NUMBER.Tag & "'"
      End If
      If fltr.lblarticul.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_articul like '%" & fltr.txtarticul.Text & "%'"
      End If
      If fltr.lblexp_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to>=" & MakeMSSQLDate(fltr.dtpexp_date_to_GE.Value)
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblexp_date_from_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from<=" & MakeMSSQLDate(fltr.dtpexp_date_from_LE.Value)
      End If
      If fltr.lblVidOtruba.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_VidOtruba like '%" & fltr.txtVidOtruba.Text & "%'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblexp_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to<=" & MakeMSSQLDate(fltr.dtpexp_date_to_LE.Value)
      End If
      If fltr.lblMade_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to<=" & MakeMSSQLDate(fltr.dtpMade_date_to_LE.Value)
      End If
      If fltr.lblexp_date_from_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from>=" & MakeMSSQLDate(fltr.dtpexp_date_from_GE.Value)
      End If
      If fltr.lblMade_date_From_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From>=" & MakeMSSQLDate(fltr.dtpMade_date_From_GE.Value)
      End If
      If fltr.lblIsCaliber.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsCaliber='" & fltr.cmbIsCaliber.Text & "'"
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good_ID='" & fltr.txtgood.Tag & "'"
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblPartRef.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_PartRef_ID='" & fltr.txtPartRef.Tag & "'"
      End If
      If fltr.lblMade_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to>=" & MakeMSSQLDate(fltr.dtpMade_date_to_GE.Value)
      End If
      If fltr.lblMade_date_From_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From<=" & MakeMSSQLDate(fltr.dtpMade_date_From_LE.Value)
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory_ID='" & fltr.txtFactory.Tag & "'"
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country_ID='" & fltr.txtmade_country.Tag & "'"
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak='" & fltr.cmbIsBrak.Text & "'"
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
    jfmnuITTOPT_1.jv.Filter.Add "AUTOITTOPT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTOPT_1_OnClearFilter()
   jfmnuITTOPT_1.jv.Filter.Add "AUTOITTOPT_DEF", " INTSANCEStatusID='{0A7FC795-E787-4D17-9689-96EFFF8F0D9D}'"
End Sub
Private Sub jfmnuITTOPT_1_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTOPT", "Задание на оптимизацию склада" & Now, Site
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


Private Sub mnuITTOPT_2_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITTOPT_2 Is Nothing Then
      Set jfmnuITTOPT_2 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{70D005EF-420B-4A40-8CDF-B4800FCD0F1D}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITTOPT_2.jv.journal = journal
      jfmnuITTOPT_2.jv.OpenModal = False
      jfmnuITTOPT_2.Caption = "Задание на оптимизацию склада :Задание напечатано"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{89E363CD-42B4-4789-9AEA-2FF371A85E0D}'"
    jfmnuITTOPT_2.jv.Filter.Add "AUTOITTOPT_DEF", f
    Dim fltr As frmITTOPT
    Set fltr = New frmITTOPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory_ID='" & fltr.txtFactory.Tag & "'"
      End If
      If fltr.lblMade_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to<=" & MakeMSSQLDate(fltr.dtpMade_date_to_LE.Value)
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER_ID='" & fltr.txtKILL_NUMBER.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblexp_date_from_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from<=" & MakeMSSQLDate(fltr.dtpexp_date_from_LE.Value)
      End If
      If fltr.lblexp_date_from_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from>=" & MakeMSSQLDate(fltr.dtpexp_date_from_GE.Value)
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak='" & fltr.cmbIsBrak.Text & "'"
      End If
      If fltr.lblVidOtruba.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_VidOtruba like '%" & fltr.txtVidOtruba.Text & "%'"
      End If
      If fltr.lblexp_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to<=" & MakeMSSQLDate(fltr.dtpexp_date_to_LE.Value)
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country_ID='" & fltr.txtmade_country.Tag & "'"
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good_ID='" & fltr.txtgood.Tag & "'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblexp_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to>=" & MakeMSSQLDate(fltr.dtpexp_date_to_GE.Value)
      End If
      If fltr.lblMade_date_From_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From>=" & MakeMSSQLDate(fltr.dtpMade_date_From_GE.Value)
      End If
      If fltr.lblMade_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to>=" & MakeMSSQLDate(fltr.dtpMade_date_to_GE.Value)
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblPartRef.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_PartRef_ID='" & fltr.txtPartRef.Tag & "'"
      End If
      If fltr.lblMade_date_From_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From<=" & MakeMSSQLDate(fltr.dtpMade_date_From_LE.Value)
      End If
      If fltr.lblarticul.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_articul like '%" & fltr.txtarticul.Text & "%'"
      End If
      If fltr.lblIsCaliber.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsCaliber='" & fltr.cmbIsCaliber.Text & "'"
      End If
    jfmnuITTOPT_2.jv.Filter.Add "AUTOITTOPT_DEF", f
    End If
      jfmnuITTOPT_2.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITTOPT_2.Show
    jfmnuITTOPT_2.WindowState = 0
    jfmnuITTOPT_2.ZOrder 0
End Sub
Private Sub jfmnuITTOPT_2_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTOPT
    Dim f As String
    Set fltr = New frmITTOPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{89E363CD-42B4-4789-9AEA-2FF371A85E0D}'"
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory_ID='" & fltr.txtFactory.Tag & "'"
      End If
      If fltr.lblMade_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to<=" & MakeMSSQLDate(fltr.dtpMade_date_to_LE.Value)
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER_ID='" & fltr.txtKILL_NUMBER.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblexp_date_from_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from<=" & MakeMSSQLDate(fltr.dtpexp_date_from_LE.Value)
      End If
      If fltr.lblexp_date_from_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from>=" & MakeMSSQLDate(fltr.dtpexp_date_from_GE.Value)
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak='" & fltr.cmbIsBrak.Text & "'"
      End If
      If fltr.lblVidOtruba.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_VidOtruba like '%" & fltr.txtVidOtruba.Text & "%'"
      End If
      If fltr.lblexp_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to<=" & MakeMSSQLDate(fltr.dtpexp_date_to_LE.Value)
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country_ID='" & fltr.txtmade_country.Tag & "'"
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good_ID='" & fltr.txtgood.Tag & "'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblexp_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to>=" & MakeMSSQLDate(fltr.dtpexp_date_to_GE.Value)
      End If
      If fltr.lblMade_date_From_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From>=" & MakeMSSQLDate(fltr.dtpMade_date_From_GE.Value)
      End If
      If fltr.lblMade_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to>=" & MakeMSSQLDate(fltr.dtpMade_date_to_GE.Value)
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblPartRef.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_PartRef_ID='" & fltr.txtPartRef.Tag & "'"
      End If
      If fltr.lblMade_date_From_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From<=" & MakeMSSQLDate(fltr.dtpMade_date_From_LE.Value)
      End If
      If fltr.lblarticul.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_articul like '%" & fltr.txtarticul.Text & "%'"
      End If
      If fltr.lblIsCaliber.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsCaliber='" & fltr.cmbIsCaliber.Text & "'"
      End If
    jfmnuITTOPT_2.jv.Filter.Add "AUTOITTOPT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTOPT_2_OnClearFilter()
   jfmnuITTOPT_2.jv.Filter.Add "AUTOITTOPT_DEF", " INTSANCEStatusID='{89E363CD-42B4-4789-9AEA-2FF371A85E0D}'"
End Sub
Private Sub jfmnuITTOPT_2_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTOPT", "Задание на оптимизацию склада" & Now, Site
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


Private Sub mnuITTOPT_3_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITTOPT_3 Is Nothing Then
      Set jfmnuITTOPT_3 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{70D005EF-420B-4A40-8CDF-B4800FCD0F1D}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITTOPT_3.jv.journal = journal
      jfmnuITTOPT_3.jv.OpenModal = False
      jfmnuITTOPT_3.Caption = "Задание на оптимизацию склада :Задание сформировано"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{1EE8A2DF-6E3C-4399-8ED5-A18B5DE67498}'"
    jfmnuITTOPT_3.jv.Filter.Add "AUTOITTOPT_DEF", f
    Dim fltr As frmITTOPT
    Set fltr = New frmITTOPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblVidOtruba.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_VidOtruba like '%" & fltr.txtVidOtruba.Text & "%'"
      End If
      If fltr.lblPartRef.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_PartRef_ID='" & fltr.txtPartRef.Tag & "'"
      End If
      If fltr.lblMade_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to>=" & MakeMSSQLDate(fltr.dtpMade_date_to_GE.Value)
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER_ID='" & fltr.txtKILL_NUMBER.Tag & "'"
      End If
      If fltr.lblexp_date_from_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from<=" & MakeMSSQLDate(fltr.dtpexp_date_from_LE.Value)
      End If
      If fltr.lblMade_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to<=" & MakeMSSQLDate(fltr.dtpMade_date_to_LE.Value)
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory_ID='" & fltr.txtFactory.Tag & "'"
      End If
      If fltr.lblexp_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to<=" & MakeMSSQLDate(fltr.dtpexp_date_to_LE.Value)
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak='" & fltr.cmbIsBrak.Text & "'"
      End If
      If fltr.lblexp_date_from_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from>=" & MakeMSSQLDate(fltr.dtpexp_date_from_GE.Value)
      End If
      If fltr.lblIsCaliber.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsCaliber='" & fltr.cmbIsCaliber.Text & "'"
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good_ID='" & fltr.txtgood.Tag & "'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblexp_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to>=" & MakeMSSQLDate(fltr.dtpexp_date_to_GE.Value)
      End If
      If fltr.lblMade_date_From_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From<=" & MakeMSSQLDate(fltr.dtpMade_date_From_LE.Value)
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country_ID='" & fltr.txtmade_country.Tag & "'"
      End If
      If fltr.lblarticul.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_articul like '%" & fltr.txtarticul.Text & "%'"
      End If
      If fltr.lblMade_date_From_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From>=" & MakeMSSQLDate(fltr.dtpMade_date_From_GE.Value)
      End If
    jfmnuITTOPT_3.jv.Filter.Add "AUTOITTOPT_DEF", f
    End If
      jfmnuITTOPT_3.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITTOPT_3.Show
    jfmnuITTOPT_3.WindowState = 0
    jfmnuITTOPT_3.ZOrder 0
End Sub
Private Sub jfmnuITTOPT_3_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTOPT
    Dim f As String
    Set fltr = New frmITTOPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{1EE8A2DF-6E3C-4399-8ED5-A18B5DE67498}'"
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblVidOtruba.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_VidOtruba like '%" & fltr.txtVidOtruba.Text & "%'"
      End If
      If fltr.lblPartRef.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_PartRef_ID='" & fltr.txtPartRef.Tag & "'"
      End If
      If fltr.lblMade_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to>=" & MakeMSSQLDate(fltr.dtpMade_date_to_GE.Value)
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER_ID='" & fltr.txtKILL_NUMBER.Tag & "'"
      End If
      If fltr.lblexp_date_from_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from<=" & MakeMSSQLDate(fltr.dtpexp_date_from_LE.Value)
      End If
      If fltr.lblMade_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to<=" & MakeMSSQLDate(fltr.dtpMade_date_to_LE.Value)
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory_ID='" & fltr.txtFactory.Tag & "'"
      End If
      If fltr.lblexp_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to<=" & MakeMSSQLDate(fltr.dtpexp_date_to_LE.Value)
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak='" & fltr.cmbIsBrak.Text & "'"
      End If
      If fltr.lblexp_date_from_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from>=" & MakeMSSQLDate(fltr.dtpexp_date_from_GE.Value)
      End If
      If fltr.lblIsCaliber.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsCaliber='" & fltr.cmbIsCaliber.Text & "'"
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good_ID='" & fltr.txtgood.Tag & "'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblexp_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to>=" & MakeMSSQLDate(fltr.dtpexp_date_to_GE.Value)
      End If
      If fltr.lblMade_date_From_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From<=" & MakeMSSQLDate(fltr.dtpMade_date_From_LE.Value)
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country_ID='" & fltr.txtmade_country.Tag & "'"
      End If
      If fltr.lblarticul.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_articul like '%" & fltr.txtarticul.Text & "%'"
      End If
      If fltr.lblMade_date_From_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From>=" & MakeMSSQLDate(fltr.dtpMade_date_From_GE.Value)
      End If
    jfmnuITTOPT_3.jv.Filter.Add "AUTOITTOPT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTOPT_3_OnClearFilter()
   jfmnuITTOPT_3.jv.Filter.Add "AUTOITTOPT_DEF", " INTSANCEStatusID='{1EE8A2DF-6E3C-4399-8ED5-A18B5DE67498}'"
End Sub
Private Sub jfmnuITTOPT_3_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTOPT", "Задание на оптимизацию склада" & Now, Site
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


Private Sub mnuITTOPT_4_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITTOPT_4 Is Nothing Then
      Set jfmnuITTOPT_4 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{70D005EF-420B-4A40-8CDF-B4800FCD0F1D}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITTOPT_4.jv.journal = journal
      jfmnuITTOPT_4.jv.OpenModal = False
      jfmnuITTOPT_4.Caption = "Задание на оптимизацию склада :Идет расчет"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{BB9F0837-7426-4E4D-B719-A3473054C6CE}'"
    jfmnuITTOPT_4.jv.Filter.Add "AUTOITTOPT_DEF", f
    Dim fltr As frmITTOPT
    Set fltr = New frmITTOPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblMade_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to>=" & MakeMSSQLDate(fltr.dtpMade_date_to_GE.Value)
      End If
      If fltr.lblarticul.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_articul like '%" & fltr.txtarticul.Text & "%'"
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good_ID='" & fltr.txtgood.Tag & "'"
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak='" & fltr.cmbIsBrak.Text & "'"
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblMade_date_From_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From>=" & MakeMSSQLDate(fltr.dtpMade_date_From_GE.Value)
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblVidOtruba.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_VidOtruba like '%" & fltr.txtVidOtruba.Text & "%'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory_ID='" & fltr.txtFactory.Tag & "'"
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country_ID='" & fltr.txtmade_country.Tag & "'"
      End If
      If fltr.lblIsCaliber.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsCaliber='" & fltr.cmbIsCaliber.Text & "'"
      End If
      If fltr.lblPartRef.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_PartRef_ID='" & fltr.txtPartRef.Tag & "'"
      End If
      If fltr.lblMade_date_From_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From<=" & MakeMSSQLDate(fltr.dtpMade_date_From_LE.Value)
      End If
      If fltr.lblexp_date_from_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from<=" & MakeMSSQLDate(fltr.dtpexp_date_from_LE.Value)
      End If
      If fltr.lblexp_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to>=" & MakeMSSQLDate(fltr.dtpexp_date_to_GE.Value)
      End If
      If fltr.lblexp_date_from_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from>=" & MakeMSSQLDate(fltr.dtpexp_date_from_GE.Value)
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER_ID='" & fltr.txtKILL_NUMBER.Tag & "'"
      End If
      If fltr.lblMade_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to<=" & MakeMSSQLDate(fltr.dtpMade_date_to_LE.Value)
      End If
      If fltr.lblexp_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to<=" & MakeMSSQLDate(fltr.dtpexp_date_to_LE.Value)
      End If
    jfmnuITTOPT_4.jv.Filter.Add "AUTOITTOPT_DEF", f
    End If
      jfmnuITTOPT_4.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITTOPT_4.Show
    jfmnuITTOPT_4.WindowState = 0
    jfmnuITTOPT_4.ZOrder 0
End Sub
Private Sub jfmnuITTOPT_4_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTOPT
    Dim f As String
    Set fltr = New frmITTOPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{BB9F0837-7426-4E4D-B719-A3473054C6CE}'"
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblMade_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to>=" & MakeMSSQLDate(fltr.dtpMade_date_to_GE.Value)
      End If
      If fltr.lblarticul.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_articul like '%" & fltr.txtarticul.Text & "%'"
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good_ID='" & fltr.txtgood.Tag & "'"
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak='" & fltr.cmbIsBrak.Text & "'"
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblMade_date_From_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From>=" & MakeMSSQLDate(fltr.dtpMade_date_From_GE.Value)
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblVidOtruba.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_VidOtruba like '%" & fltr.txtVidOtruba.Text & "%'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory_ID='" & fltr.txtFactory.Tag & "'"
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country_ID='" & fltr.txtmade_country.Tag & "'"
      End If
      If fltr.lblIsCaliber.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsCaliber='" & fltr.cmbIsCaliber.Text & "'"
      End If
      If fltr.lblPartRef.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_PartRef_ID='" & fltr.txtPartRef.Tag & "'"
      End If
      If fltr.lblMade_date_From_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From<=" & MakeMSSQLDate(fltr.dtpMade_date_From_LE.Value)
      End If
      If fltr.lblexp_date_from_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from<=" & MakeMSSQLDate(fltr.dtpexp_date_from_LE.Value)
      End If
      If fltr.lblexp_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to>=" & MakeMSSQLDate(fltr.dtpexp_date_to_GE.Value)
      End If
      If fltr.lblexp_date_from_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from>=" & MakeMSSQLDate(fltr.dtpexp_date_from_GE.Value)
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER_ID='" & fltr.txtKILL_NUMBER.Tag & "'"
      End If
      If fltr.lblMade_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to<=" & MakeMSSQLDate(fltr.dtpMade_date_to_LE.Value)
      End If
      If fltr.lblexp_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to<=" & MakeMSSQLDate(fltr.dtpexp_date_to_LE.Value)
      End If
    jfmnuITTOPT_4.jv.Filter.Add "AUTOITTOPT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTOPT_4_OnClearFilter()
   jfmnuITTOPT_4.jv.Filter.Add "AUTOITTOPT_DEF", " INTSANCEStatusID='{BB9F0837-7426-4E4D-B719-A3473054C6CE}'"
End Sub
Private Sub jfmnuITTOPT_4_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTOPT", "Задание на оптимизацию склада" & Now, Site
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


Private Sub mnuITTOPT_5_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITTOPT_5 Is Nothing Then
      Set jfmnuITTOPT_5 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{70D005EF-420B-4A40-8CDF-B4800FCD0F1D}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITTOPT_5.jv.journal = journal
      jfmnuITTOPT_5.jv.OpenModal = False
      jfmnuITTOPT_5.Caption = "Задание на оптимизацию склада :Исполняется"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{9C840B59-7271-4499-92C3-F00ABAF7228A}'"
    jfmnuITTOPT_5.jv.Filter.Add "AUTOITTOPT_DEF", f
    Dim fltr As frmITTOPT
    Set fltr = New frmITTOPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblMade_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to<=" & MakeMSSQLDate(fltr.dtpMade_date_to_LE.Value)
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory_ID='" & fltr.txtFactory.Tag & "'"
      End If
      If fltr.lblexp_date_from_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from<=" & MakeMSSQLDate(fltr.dtpexp_date_from_LE.Value)
      End If
      If fltr.lblarticul.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_articul like '%" & fltr.txtarticul.Text & "%'"
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country_ID='" & fltr.txtmade_country.Tag & "'"
      End If
      If fltr.lblMade_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to>=" & MakeMSSQLDate(fltr.dtpMade_date_to_GE.Value)
      End If
      If fltr.lblVidOtruba.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_VidOtruba like '%" & fltr.txtVidOtruba.Text & "%'"
      End If
      If fltr.lblMade_date_From_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From<=" & MakeMSSQLDate(fltr.dtpMade_date_From_LE.Value)
      End If
      If fltr.lblexp_date_from_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from>=" & MakeMSSQLDate(fltr.dtpexp_date_from_GE.Value)
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblIsCaliber.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsCaliber='" & fltr.cmbIsCaliber.Text & "'"
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER_ID='" & fltr.txtKILL_NUMBER.Tag & "'"
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good_ID='" & fltr.txtgood.Tag & "'"
      End If
      If fltr.lblexp_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to<=" & MakeMSSQLDate(fltr.dtpexp_date_to_LE.Value)
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak='" & fltr.cmbIsBrak.Text & "'"
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblMade_date_From_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From>=" & MakeMSSQLDate(fltr.dtpMade_date_From_GE.Value)
      End If
      If fltr.lblPartRef.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_PartRef_ID='" & fltr.txtPartRef.Tag & "'"
      End If
      If fltr.lblexp_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to>=" & MakeMSSQLDate(fltr.dtpexp_date_to_GE.Value)
      End If
    jfmnuITTOPT_5.jv.Filter.Add "AUTOITTOPT_DEF", f
    End If
      jfmnuITTOPT_5.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITTOPT_5.Show
    jfmnuITTOPT_5.WindowState = 0
    jfmnuITTOPT_5.ZOrder 0
End Sub
Private Sub jfmnuITTOPT_5_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTOPT
    Dim f As String
    Set fltr = New frmITTOPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{9C840B59-7271-4499-92C3-F00ABAF7228A}'"
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblMade_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to<=" & MakeMSSQLDate(fltr.dtpMade_date_to_LE.Value)
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory_ID='" & fltr.txtFactory.Tag & "'"
      End If
      If fltr.lblexp_date_from_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from<=" & MakeMSSQLDate(fltr.dtpexp_date_from_LE.Value)
      End If
      If fltr.lblarticul.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_articul like '%" & fltr.txtarticul.Text & "%'"
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country_ID='" & fltr.txtmade_country.Tag & "'"
      End If
      If fltr.lblMade_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to>=" & MakeMSSQLDate(fltr.dtpMade_date_to_GE.Value)
      End If
      If fltr.lblVidOtruba.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_VidOtruba like '%" & fltr.txtVidOtruba.Text & "%'"
      End If
      If fltr.lblMade_date_From_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From<=" & MakeMSSQLDate(fltr.dtpMade_date_From_LE.Value)
      End If
      If fltr.lblexp_date_from_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from>=" & MakeMSSQLDate(fltr.dtpexp_date_from_GE.Value)
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblIsCaliber.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsCaliber='" & fltr.cmbIsCaliber.Text & "'"
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER_ID='" & fltr.txtKILL_NUMBER.Tag & "'"
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good_ID='" & fltr.txtgood.Tag & "'"
      End If
      If fltr.lblexp_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to<=" & MakeMSSQLDate(fltr.dtpexp_date_to_LE.Value)
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak='" & fltr.cmbIsBrak.Text & "'"
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblMade_date_From_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From>=" & MakeMSSQLDate(fltr.dtpMade_date_From_GE.Value)
      End If
      If fltr.lblPartRef.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_PartRef_ID='" & fltr.txtPartRef.Tag & "'"
      End If
      If fltr.lblexp_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to>=" & MakeMSSQLDate(fltr.dtpexp_date_to_GE.Value)
      End If
    jfmnuITTOPT_5.jv.Filter.Add "AUTOITTOPT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTOPT_5_OnClearFilter()
   jfmnuITTOPT_5.jv.Filter.Add "AUTOITTOPT_DEF", " INTSANCEStatusID='{9C840B59-7271-4499-92C3-F00ABAF7228A}'"
End Sub
Private Sub jfmnuITTOPT_5_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTOPT", "Задание на оптимизацию склада" & Now, Site
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


Private Sub mnuITTOPT_6_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITTOPT_6 Is Nothing Then
      Set jfmnuITTOPT_6 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{70D005EF-420B-4A40-8CDF-B4800FCD0F1D}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITTOPT_6.jv.journal = journal
      jfmnuITTOPT_6.jv.OpenModal = False
      jfmnuITTOPT_6.Caption = "Задание на оптимизацию склада :Отменено"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{DE7BE490-19D4-43D0-8F06-87D569FFFCF2}'"
    jfmnuITTOPT_6.jv.Filter.Add "AUTOITTOPT_DEF", f
    Dim fltr As frmITTOPT
    Set fltr = New frmITTOPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good_ID='" & fltr.txtgood.Tag & "'"
      End If
      If fltr.lblexp_date_from_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from<=" & MakeMSSQLDate(fltr.dtpexp_date_from_LE.Value)
      End If
      If fltr.lblIsCaliber.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsCaliber='" & fltr.cmbIsCaliber.Text & "'"
      End If
      If fltr.lblMade_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to>=" & MakeMSSQLDate(fltr.dtpMade_date_to_GE.Value)
      End If
      If fltr.lblexp_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to<=" & MakeMSSQLDate(fltr.dtpexp_date_to_LE.Value)
      End If
      If fltr.lblVidOtruba.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_VidOtruba like '%" & fltr.txtVidOtruba.Text & "%'"
      End If
      If fltr.lblMade_date_From_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From<=" & MakeMSSQLDate(fltr.dtpMade_date_From_LE.Value)
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblMade_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to<=" & MakeMSSQLDate(fltr.dtpMade_date_to_LE.Value)
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country_ID='" & fltr.txtmade_country.Tag & "'"
      End If
      If fltr.lblexp_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to>=" & MakeMSSQLDate(fltr.dtpexp_date_to_GE.Value)
      End If
      If fltr.lblarticul.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_articul like '%" & fltr.txtarticul.Text & "%'"
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER_ID='" & fltr.txtKILL_NUMBER.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblMade_date_From_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From>=" & MakeMSSQLDate(fltr.dtpMade_date_From_GE.Value)
      End If
      If fltr.lblexp_date_from_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from>=" & MakeMSSQLDate(fltr.dtpexp_date_from_GE.Value)
      End If
      If fltr.lblPartRef.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_PartRef_ID='" & fltr.txtPartRef.Tag & "'"
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory_ID='" & fltr.txtFactory.Tag & "'"
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak='" & fltr.cmbIsBrak.Text & "'"
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
    jfmnuITTOPT_6.jv.Filter.Add "AUTOITTOPT_DEF", f
    End If
      jfmnuITTOPT_6.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITTOPT_6.Show
    jfmnuITTOPT_6.WindowState = 0
    jfmnuITTOPT_6.ZOrder 0
End Sub
Private Sub jfmnuITTOPT_6_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTOPT
    Dim f As String
    Set fltr = New frmITTOPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{DE7BE490-19D4-43D0-8F06-87D569FFFCF2}'"
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good_ID='" & fltr.txtgood.Tag & "'"
      End If
      If fltr.lblexp_date_from_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from<=" & MakeMSSQLDate(fltr.dtpexp_date_from_LE.Value)
      End If
      If fltr.lblIsCaliber.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsCaliber='" & fltr.cmbIsCaliber.Text & "'"
      End If
      If fltr.lblMade_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to>=" & MakeMSSQLDate(fltr.dtpMade_date_to_GE.Value)
      End If
      If fltr.lblexp_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to<=" & MakeMSSQLDate(fltr.dtpexp_date_to_LE.Value)
      End If
      If fltr.lblVidOtruba.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_VidOtruba like '%" & fltr.txtVidOtruba.Text & "%'"
      End If
      If fltr.lblMade_date_From_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From<=" & MakeMSSQLDate(fltr.dtpMade_date_From_LE.Value)
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblMade_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to<=" & MakeMSSQLDate(fltr.dtpMade_date_to_LE.Value)
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country_ID='" & fltr.txtmade_country.Tag & "'"
      End If
      If fltr.lblexp_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to>=" & MakeMSSQLDate(fltr.dtpexp_date_to_GE.Value)
      End If
      If fltr.lblarticul.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_articul like '%" & fltr.txtarticul.Text & "%'"
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER_ID='" & fltr.txtKILL_NUMBER.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblMade_date_From_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From>=" & MakeMSSQLDate(fltr.dtpMade_date_From_GE.Value)
      End If
      If fltr.lblexp_date_from_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from>=" & MakeMSSQLDate(fltr.dtpexp_date_from_GE.Value)
      End If
      If fltr.lblPartRef.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_PartRef_ID='" & fltr.txtPartRef.Tag & "'"
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory_ID='" & fltr.txtFactory.Tag & "'"
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak='" & fltr.cmbIsBrak.Text & "'"
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
    jfmnuITTOPT_6.jv.Filter.Add "AUTOITTOPT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTOPT_6_OnClearFilter()
   jfmnuITTOPT_6.jv.Filter.Add "AUTOITTOPT_DEF", " INTSANCEStatusID='{DE7BE490-19D4-43D0-8F06-87D569FFFCF2}'"
End Sub
Private Sub jfmnuITTOPT_6_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTOPT", "Задание на оптимизацию склада" & Now, Site
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


Private Sub mnuITTOPT_7_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITTOPT_7 Is Nothing Then
      Set jfmnuITTOPT_7 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{70D005EF-420B-4A40-8CDF-B4800FCD0F1D}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITTOPT_7.jv.journal = journal
      jfmnuITTOPT_7.jv.OpenModal = False
      jfmnuITTOPT_7.Caption = "Задание на оптимизацию склада :Оформлен"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{300483B2-1D94-4A33-8ADF-ABF32E72E57B}'"
    jfmnuITTOPT_7.jv.Filter.Add "AUTOITTOPT_DEF", f
    Dim fltr As frmITTOPT
    Set fltr = New frmITTOPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER_ID='" & fltr.txtKILL_NUMBER.Tag & "'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblVidOtruba.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_VidOtruba like '%" & fltr.txtVidOtruba.Text & "%'"
      End If
      If fltr.lblexp_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to>=" & MakeMSSQLDate(fltr.dtpexp_date_to_GE.Value)
      End If
      If fltr.lblexp_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to<=" & MakeMSSQLDate(fltr.dtpexp_date_to_LE.Value)
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country_ID='" & fltr.txtmade_country.Tag & "'"
      End If
      If fltr.lblMade_date_From_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From>=" & MakeMSSQLDate(fltr.dtpMade_date_From_GE.Value)
      End If
      If fltr.lblMade_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to<=" & MakeMSSQLDate(fltr.dtpMade_date_to_LE.Value)
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblMade_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to>=" & MakeMSSQLDate(fltr.dtpMade_date_to_GE.Value)
      End If
      If fltr.lblexp_date_from_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from>=" & MakeMSSQLDate(fltr.dtpexp_date_from_GE.Value)
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblIsCaliber.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsCaliber='" & fltr.cmbIsCaliber.Text & "'"
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak='" & fltr.cmbIsBrak.Text & "'"
      End If
      If fltr.lblarticul.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_articul like '%" & fltr.txtarticul.Text & "%'"
      End If
      If fltr.lblexp_date_from_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from<=" & MakeMSSQLDate(fltr.dtpexp_date_from_LE.Value)
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblPartRef.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_PartRef_ID='" & fltr.txtPartRef.Tag & "'"
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory_ID='" & fltr.txtFactory.Tag & "'"
      End If
      If fltr.lblMade_date_From_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From<=" & MakeMSSQLDate(fltr.dtpMade_date_From_LE.Value)
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good_ID='" & fltr.txtgood.Tag & "'"
      End If
    jfmnuITTOPT_7.jv.Filter.Add "AUTOITTOPT_DEF", f
    End If
      jfmnuITTOPT_7.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITTOPT_7.Show
    jfmnuITTOPT_7.WindowState = 0
    jfmnuITTOPT_7.ZOrder 0
End Sub
Private Sub jfmnuITTOPT_7_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTOPT
    Dim f As String
    Set fltr = New frmITTOPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{300483B2-1D94-4A33-8ADF-ABF32E72E57B}'"
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER_ID='" & fltr.txtKILL_NUMBER.Tag & "'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblVidOtruba.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_VidOtruba like '%" & fltr.txtVidOtruba.Text & "%'"
      End If
      If fltr.lblexp_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to>=" & MakeMSSQLDate(fltr.dtpexp_date_to_GE.Value)
      End If
      If fltr.lblexp_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to<=" & MakeMSSQLDate(fltr.dtpexp_date_to_LE.Value)
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country_ID='" & fltr.txtmade_country.Tag & "'"
      End If
      If fltr.lblMade_date_From_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From>=" & MakeMSSQLDate(fltr.dtpMade_date_From_GE.Value)
      End If
      If fltr.lblMade_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to<=" & MakeMSSQLDate(fltr.dtpMade_date_to_LE.Value)
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblMade_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to>=" & MakeMSSQLDate(fltr.dtpMade_date_to_GE.Value)
      End If
      If fltr.lblexp_date_from_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from>=" & MakeMSSQLDate(fltr.dtpexp_date_from_GE.Value)
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblIsCaliber.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsCaliber='" & fltr.cmbIsCaliber.Text & "'"
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak='" & fltr.cmbIsBrak.Text & "'"
      End If
      If fltr.lblarticul.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_articul like '%" & fltr.txtarticul.Text & "%'"
      End If
      If fltr.lblexp_date_from_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from<=" & MakeMSSQLDate(fltr.dtpexp_date_from_LE.Value)
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblPartRef.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_PartRef_ID='" & fltr.txtPartRef.Tag & "'"
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory_ID='" & fltr.txtFactory.Tag & "'"
      End If
      If fltr.lblMade_date_From_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From<=" & MakeMSSQLDate(fltr.dtpMade_date_From_LE.Value)
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good_ID='" & fltr.txtgood.Tag & "'"
      End If
    jfmnuITTOPT_7.jv.Filter.Add "AUTOITTOPT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTOPT_7_OnClearFilter()
   jfmnuITTOPT_7.jv.Filter.Add "AUTOITTOPT_DEF", " INTSANCEStatusID='{300483B2-1D94-4A33-8ADF-ABF32E72E57B}'"
End Sub
Private Sub jfmnuITTOPT_7_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTOPT", "Задание на оптимизацию склада" & Now, Site
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


Private Sub mnuITTOPT_8_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITTOPT_8 Is Nothing Then
      Set jfmnuITTOPT_8 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{70D005EF-420B-4A40-8CDF-B4800FCD0F1D}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITTOPT_8.jv.journal = journal
      jfmnuITTOPT_8.jv.OpenModal = False
      jfmnuITTOPT_8.Caption = "Задание на оптимизацию склада :Оформляется"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{C861FA15-0DF6-42D4-BCE9-2B38C3E6C0CB}'"
    jfmnuITTOPT_8.jv.Filter.Add "AUTOITTOPT_DEF", f
    Dim fltr As frmITTOPT
    Set fltr = New frmITTOPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory_ID='" & fltr.txtFactory.Tag & "'"
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER_ID='" & fltr.txtKILL_NUMBER.Tag & "'"
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblIsCaliber.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsCaliber='" & fltr.cmbIsCaliber.Text & "'"
      End If
      If fltr.lblVidOtruba.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_VidOtruba like '%" & fltr.txtVidOtruba.Text & "%'"
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak='" & fltr.cmbIsBrak.Text & "'"
      End If
      If fltr.lblMade_date_From_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From>=" & MakeMSSQLDate(fltr.dtpMade_date_From_GE.Value)
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblMade_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to>=" & MakeMSSQLDate(fltr.dtpMade_date_to_GE.Value)
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good_ID='" & fltr.txtgood.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblexp_date_from_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from>=" & MakeMSSQLDate(fltr.dtpexp_date_from_GE.Value)
      End If
      If fltr.lblMade_date_From_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From<=" & MakeMSSQLDate(fltr.dtpMade_date_From_LE.Value)
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblexp_date_from_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from<=" & MakeMSSQLDate(fltr.dtpexp_date_from_LE.Value)
      End If
      If fltr.lblPartRef.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_PartRef_ID='" & fltr.txtPartRef.Tag & "'"
      End If
      If fltr.lblexp_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to<=" & MakeMSSQLDate(fltr.dtpexp_date_to_LE.Value)
      End If
      If fltr.lblexp_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to>=" & MakeMSSQLDate(fltr.dtpexp_date_to_GE.Value)
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country_ID='" & fltr.txtmade_country.Tag & "'"
      End If
      If fltr.lblarticul.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_articul like '%" & fltr.txtarticul.Text & "%'"
      End If
      If fltr.lblMade_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to<=" & MakeMSSQLDate(fltr.dtpMade_date_to_LE.Value)
      End If
    jfmnuITTOPT_8.jv.Filter.Add "AUTOITTOPT_DEF", f
    End If
      jfmnuITTOPT_8.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITTOPT_8.Show
    jfmnuITTOPT_8.WindowState = 0
    jfmnuITTOPT_8.ZOrder 0
End Sub
Private Sub jfmnuITTOPT_8_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTOPT
    Dim f As String
    Set fltr = New frmITTOPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{C861FA15-0DF6-42D4-BCE9-2B38C3E6C0CB}'"
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory_ID='" & fltr.txtFactory.Tag & "'"
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER_ID='" & fltr.txtKILL_NUMBER.Tag & "'"
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblIsCaliber.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsCaliber='" & fltr.cmbIsCaliber.Text & "'"
      End If
      If fltr.lblVidOtruba.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_VidOtruba like '%" & fltr.txtVidOtruba.Text & "%'"
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak='" & fltr.cmbIsBrak.Text & "'"
      End If
      If fltr.lblMade_date_From_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From>=" & MakeMSSQLDate(fltr.dtpMade_date_From_GE.Value)
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblMade_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to>=" & MakeMSSQLDate(fltr.dtpMade_date_to_GE.Value)
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good_ID='" & fltr.txtgood.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblexp_date_from_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from>=" & MakeMSSQLDate(fltr.dtpexp_date_from_GE.Value)
      End If
      If fltr.lblMade_date_From_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_From<=" & MakeMSSQLDate(fltr.dtpMade_date_From_LE.Value)
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblexp_date_from_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_from<=" & MakeMSSQLDate(fltr.dtpexp_date_from_LE.Value)
      End If
      If fltr.lblPartRef.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_PartRef_ID='" & fltr.txtPartRef.Tag & "'"
      End If
      If fltr.lblexp_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to<=" & MakeMSSQLDate(fltr.dtpexp_date_to_LE.Value)
      End If
      If fltr.lblexp_date_to_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_exp_date_to>=" & MakeMSSQLDate(fltr.dtpexp_date_to_GE.Value)
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country_ID='" & fltr.txtmade_country.Tag & "'"
      End If
      If fltr.lblarticul.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_articul like '%" & fltr.txtarticul.Text & "%'"
      End If
      If fltr.lblMade_date_to_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Made_date_to<=" & MakeMSSQLDate(fltr.dtpMade_date_to_LE.Value)
      End If
    jfmnuITTOPT_8.jv.Filter.Add "AUTOITTOPT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTOPT_8_OnClearFilter()
   jfmnuITTOPT_8.jv.Filter.Add "AUTOITTOPT_DEF", " INTSANCEStatusID='{C861FA15-0DF6-42D4-BCE9-2B38C3E6C0CB}'"
End Sub
Private Sub jfmnuITTOPT_8_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTOPT", "Задание на оптимизацию склада" & Now, Site
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
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblShipOrder.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ShipOrder_ID='" & fltr.txtShipOrder.Tag & "'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
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
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblShipOrder.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ShipOrder_ID='" & fltr.txtShipOrder.Tag & "'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
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
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lblShipOrder.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ShipOrder_ID='" & fltr.txtShipOrder.Tag & "'"
      End If
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
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
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lblShipOrder.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ShipOrder_ID='" & fltr.txtShipOrder.Tag & "'"
      End If
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
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
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblShipOrder.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ShipOrder_ID='" & fltr.txtShipOrder.Tag & "'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
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
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblShipOrder.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ShipOrder_ID='" & fltr.txtShipOrder.Tag & "'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
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
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblShipOrder.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ShipOrder_ID='" & fltr.txtShipOrder.Tag & "'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
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
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblShipOrder.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ShipOrder_ID='" & fltr.txtShipOrder.Tag & "'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
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
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblShipOrder.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ShipOrder_ID='" & fltr.txtShipOrder.Tag & "'"
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
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblShipOrder.Value = vbChecked Then
        f = f & " and ITTOUT_DEF_ShipOrder_ID='" & fltr.txtShipOrder.Tag & "'"
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




Private Sub mnuAllITTPL_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuAllITTPL Is Nothing Then
      Set jfmnuAllITTPL = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{6345F83E-3D6C-4782-B165-51AEADB4D040}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuAllITTPL.jv.journal = journal
      jfmnuAllITTPL.jv.OpenModal = False
      jfmnuAllITTPL.Caption = "Палетта - все состояния"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
    Dim fltr As frmITTPL
    Set fltr = New frmITTPL
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblWeight_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Weight>=" & val(fltr.txtWeight_GE.Text)
      End If
      If fltr.lblPackageWeight_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PackageWeight<=" & val(fltr.txtPackageWeight_LE.Text)
      End If
      If fltr.lblTheNumber_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_TheNumber<=" & val(fltr.txtTheNumber_LE.Text)
      End If
      If fltr.lblCurrentPosition.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentPosition like '%" & fltr.txtCurrentPosition.Text & "%'"
      End If
      If fltr.lblCurrentWeightBrutto_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentWeightBrutto<=" & val(fltr.txtCurrentWeightBrutto_LE.Text)
      End If
      If fltr.lblPalKode.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PalKode like '%" & fltr.txtPalKode.Text & "%'"
      End If
      If fltr.lblWDate_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_WDate<=" & MakeMSSQLDate(fltr.dtpWDate_LE.Value)
      End If
      If fltr.lblWDate_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_WDate>=" & MakeMSSQLDate(fltr.dtpWDate_GE.Value)
      End If
      If fltr.lblPltype.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Pltype_ID='" & fltr.txtPltype.Tag & "'"
      End If
      If fltr.lblTheNumber_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_TheNumber>=" & val(fltr.txtTheNumber_GE.Text)
      End If
      If fltr.lblCode.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Code like '%" & fltr.txtCode.Text & "%'"
      End If
      If fltr.lblCurrentGood.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentGood_ID='" & fltr.txtCurrentGood.Tag & "'"
      End If
      If fltr.lblPrivatePalet.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PrivatePalet='" & fltr.cmbPrivatePalet.Text & "'"
      End If
      If fltr.lblCurrentWeightBrutto_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentWeightBrutto>=" & val(fltr.txtCurrentWeightBrutto_GE.Text)
      End If
      If fltr.lblCaliberQuantity_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CaliberQuantity<=" & val(fltr.txtCaliberQuantity_LE.Text)
      End If
      If fltr.lblCaliberQuantity_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CaliberQuantity>=" & val(fltr.txtCaliberQuantity_GE.Text)
      End If
      If fltr.lblCorePalette_ID_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CorePalette_ID<=" & val(fltr.txtCorePalette_ID_LE.Text)
      End If
      If fltr.lblWeight_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Weight<=" & val(fltr.txtWeight_LE.Text)
      End If
      If fltr.lblCorePalette_ID_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CorePalette_ID>=" & val(fltr.txtCorePalette_ID_GE.Text)
      End If
      If fltr.lblPackageWeight_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PackageWeight>=" & val(fltr.txtPackageWeight_GE.Text)
      End If
    jfmnuAllITTPL.jv.Filter.Add "AUTOITTPL_DEF", f
    End If
      jfmnuAllITTPL.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuAllITTPL.Show
    jfmnuAllITTPL.WindowState = 0
    jfmnuAllITTPL.ZOrder 0
End Sub
Private Sub jfmnuAllITTPL_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTPL
    Dim f As String
    Set fltr = New frmITTPL
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
      If fltr.lblWeight_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Weight>=" & val(fltr.txtWeight_GE.Text)
      End If
      If fltr.lblPackageWeight_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PackageWeight<=" & val(fltr.txtPackageWeight_LE.Text)
      End If
      If fltr.lblTheNumber_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_TheNumber<=" & val(fltr.txtTheNumber_LE.Text)
      End If
      If fltr.lblCurrentPosition.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentPosition like '%" & fltr.txtCurrentPosition.Text & "%'"
      End If
      If fltr.lblCurrentWeightBrutto_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentWeightBrutto<=" & val(fltr.txtCurrentWeightBrutto_LE.Text)
      End If
      If fltr.lblPalKode.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PalKode like '%" & fltr.txtPalKode.Text & "%'"
      End If
      If fltr.lblWDate_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_WDate<=" & MakeMSSQLDate(fltr.dtpWDate_LE.Value)
      End If
      If fltr.lblWDate_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_WDate>=" & MakeMSSQLDate(fltr.dtpWDate_GE.Value)
      End If
      If fltr.lblPltype.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Pltype_ID='" & fltr.txtPltype.Tag & "'"
      End If
      If fltr.lblTheNumber_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_TheNumber>=" & val(fltr.txtTheNumber_GE.Text)
      End If
      If fltr.lblCode.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Code like '%" & fltr.txtCode.Text & "%'"
      End If
      If fltr.lblCurrentGood.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentGood_ID='" & fltr.txtCurrentGood.Tag & "'"
      End If
      If fltr.lblPrivatePalet.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PrivatePalet='" & fltr.cmbPrivatePalet.Text & "'"
      End If
      If fltr.lblCurrentWeightBrutto_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentWeightBrutto>=" & val(fltr.txtCurrentWeightBrutto_GE.Text)
      End If
      If fltr.lblCaliberQuantity_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CaliberQuantity<=" & val(fltr.txtCaliberQuantity_LE.Text)
      End If
      If fltr.lblCaliberQuantity_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CaliberQuantity>=" & val(fltr.txtCaliberQuantity_GE.Text)
      End If
      If fltr.lblCorePalette_ID_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CorePalette_ID<=" & val(fltr.txtCorePalette_ID_LE.Text)
      End If
      If fltr.lblWeight_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Weight<=" & val(fltr.txtWeight_LE.Text)
      End If
      If fltr.lblCorePalette_ID_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CorePalette_ID>=" & val(fltr.txtCorePalette_ID_GE.Text)
      End If
      If fltr.lblPackageWeight_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PackageWeight>=" & val(fltr.txtPackageWeight_GE.Text)
      End If
    jfmnuAllITTPL.jv.Filter.Add "AUTOITTPL_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuAllITTPL_OnClearFilter()
End Sub
Private Sub jfmnuAllITTPL_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTPL", "Палетта" & Now, Site
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


Private Sub mnuITTPL_1_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITTPL_1 Is Nothing Then
      Set jfmnuITTPL_1 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{6345F83E-3D6C-4782-B165-51AEADB4D040}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITTPL_1.jv.journal = journal
      jfmnuITTPL_1.jv.OpenModal = False
      jfmnuITTPL_1.Caption = "Палетта :Пустая"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{E9BFB749-A606-4DEF-A429-07D636F108C6}'"
    jfmnuITTPL_1.jv.Filter.Add "AUTOITTPL_DEF", f
    Dim fltr As frmITTPL
    Set fltr = New frmITTPL
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblWDate_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_WDate>=" & MakeMSSQLDate(fltr.dtpWDate_GE.Value)
      End If
      If fltr.lblCorePalette_ID_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CorePalette_ID>=" & val(fltr.txtCorePalette_ID_GE.Text)
      End If
      If fltr.lblTheNumber_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_TheNumber>=" & val(fltr.txtTheNumber_GE.Text)
      End If
      If fltr.lblCurrentPosition.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentPosition like '%" & fltr.txtCurrentPosition.Text & "%'"
      End If
      If fltr.lblPackageWeight_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PackageWeight<=" & val(fltr.txtPackageWeight_LE.Text)
      End If
      If fltr.lblTheNumber_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_TheNumber<=" & val(fltr.txtTheNumber_LE.Text)
      End If
      If fltr.lblCurrentWeightBrutto_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentWeightBrutto>=" & val(fltr.txtCurrentWeightBrutto_GE.Text)
      End If
      If fltr.lblPalKode.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PalKode like '%" & fltr.txtPalKode.Text & "%'"
      End If
      If fltr.lblPrivatePalet.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PrivatePalet='" & fltr.cmbPrivatePalet.Text & "'"
      End If
      If fltr.lblWeight_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Weight<=" & val(fltr.txtWeight_LE.Text)
      End If
      If fltr.lblCaliberQuantity_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CaliberQuantity<=" & val(fltr.txtCaliberQuantity_LE.Text)
      End If
      If fltr.lblWeight_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Weight>=" & val(fltr.txtWeight_GE.Text)
      End If
      If fltr.lblCode.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Code like '%" & fltr.txtCode.Text & "%'"
      End If
      If fltr.lblWDate_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_WDate<=" & MakeMSSQLDate(fltr.dtpWDate_LE.Value)
      End If
      If fltr.lblCurrentGood.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentGood_ID='" & fltr.txtCurrentGood.Tag & "'"
      End If
      If fltr.lblCurrentWeightBrutto_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentWeightBrutto<=" & val(fltr.txtCurrentWeightBrutto_LE.Text)
      End If
      If fltr.lblPltype.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Pltype_ID='" & fltr.txtPltype.Tag & "'"
      End If
      If fltr.lblCaliberQuantity_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CaliberQuantity>=" & val(fltr.txtCaliberQuantity_GE.Text)
      End If
      If fltr.lblPackageWeight_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PackageWeight>=" & val(fltr.txtPackageWeight_GE.Text)
      End If
      If fltr.lblCorePalette_ID_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CorePalette_ID<=" & val(fltr.txtCorePalette_ID_LE.Text)
      End If
    jfmnuITTPL_1.jv.Filter.Add "AUTOITTPL_DEF", f
    End If
      jfmnuITTPL_1.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITTPL_1.Show
    jfmnuITTPL_1.WindowState = 0
    jfmnuITTPL_1.ZOrder 0
End Sub
Private Sub jfmnuITTPL_1_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTPL
    Dim f As String
    Set fltr = New frmITTPL
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{E9BFB749-A606-4DEF-A429-07D636F108C6}'"
      If fltr.lblWDate_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_WDate>=" & MakeMSSQLDate(fltr.dtpWDate_GE.Value)
      End If
      If fltr.lblCorePalette_ID_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CorePalette_ID>=" & val(fltr.txtCorePalette_ID_GE.Text)
      End If
      If fltr.lblTheNumber_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_TheNumber>=" & val(fltr.txtTheNumber_GE.Text)
      End If
      If fltr.lblCurrentPosition.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentPosition like '%" & fltr.txtCurrentPosition.Text & "%'"
      End If
      If fltr.lblPackageWeight_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PackageWeight<=" & val(fltr.txtPackageWeight_LE.Text)
      End If
      If fltr.lblTheNumber_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_TheNumber<=" & val(fltr.txtTheNumber_LE.Text)
      End If
      If fltr.lblCurrentWeightBrutto_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentWeightBrutto>=" & val(fltr.txtCurrentWeightBrutto_GE.Text)
      End If
      If fltr.lblPalKode.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PalKode like '%" & fltr.txtPalKode.Text & "%'"
      End If
      If fltr.lblPrivatePalet.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PrivatePalet='" & fltr.cmbPrivatePalet.Text & "'"
      End If
      If fltr.lblWeight_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Weight<=" & val(fltr.txtWeight_LE.Text)
      End If
      If fltr.lblCaliberQuantity_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CaliberQuantity<=" & val(fltr.txtCaliberQuantity_LE.Text)
      End If
      If fltr.lblWeight_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Weight>=" & val(fltr.txtWeight_GE.Text)
      End If
      If fltr.lblCode.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Code like '%" & fltr.txtCode.Text & "%'"
      End If
      If fltr.lblWDate_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_WDate<=" & MakeMSSQLDate(fltr.dtpWDate_LE.Value)
      End If
      If fltr.lblCurrentGood.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentGood_ID='" & fltr.txtCurrentGood.Tag & "'"
      End If
      If fltr.lblCurrentWeightBrutto_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentWeightBrutto<=" & val(fltr.txtCurrentWeightBrutto_LE.Text)
      End If
      If fltr.lblPltype.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Pltype_ID='" & fltr.txtPltype.Tag & "'"
      End If
      If fltr.lblCaliberQuantity_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CaliberQuantity>=" & val(fltr.txtCaliberQuantity_GE.Text)
      End If
      If fltr.lblPackageWeight_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PackageWeight>=" & val(fltr.txtPackageWeight_GE.Text)
      End If
      If fltr.lblCorePalette_ID_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CorePalette_ID<=" & val(fltr.txtCorePalette_ID_LE.Text)
      End If
    jfmnuITTPL_1.jv.Filter.Add "AUTOITTPL_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTPL_1_OnClearFilter()
   jfmnuITTPL_1.jv.Filter.Add "AUTOITTPL_DEF", " INTSANCEStatusID='{E9BFB749-A606-4DEF-A429-07D636F108C6}'"
End Sub
Private Sub jfmnuITTPL_1_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTPL", "Палетта" & Now, Site
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


Private Sub mnuITTPL_2_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITTPL_2 Is Nothing Then
      Set jfmnuITTPL_2 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{6345F83E-3D6C-4782-B165-51AEADB4D040}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITTPL_2.jv.journal = journal
      jfmnuITTPL_2.jv.OpenModal = False
      jfmnuITTPL_2.Caption = "Палетта :Взвешена"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{6FDCC60F-8C10-47E3-BB36-110C49EF2144}'"
    jfmnuITTPL_2.jv.Filter.Add "AUTOITTPL_DEF", f
    Dim fltr As frmITTPL
    Set fltr = New frmITTPL
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblPalKode.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PalKode like '%" & fltr.txtPalKode.Text & "%'"
      End If
      If fltr.lblWeight_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Weight<=" & val(fltr.txtWeight_LE.Text)
      End If
      If fltr.lblCaliberQuantity_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CaliberQuantity<=" & val(fltr.txtCaliberQuantity_LE.Text)
      End If
      If fltr.lblCaliberQuantity_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CaliberQuantity>=" & val(fltr.txtCaliberQuantity_GE.Text)
      End If
      If fltr.lblPackageWeight_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PackageWeight<=" & val(fltr.txtPackageWeight_LE.Text)
      End If
      If fltr.lblWDate_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_WDate>=" & MakeMSSQLDate(fltr.dtpWDate_GE.Value)
      End If
      If fltr.lblPrivatePalet.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PrivatePalet='" & fltr.cmbPrivatePalet.Text & "'"
      End If
      If fltr.lblWeight_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Weight>=" & val(fltr.txtWeight_GE.Text)
      End If
      If fltr.lblCurrentPosition.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentPosition like '%" & fltr.txtCurrentPosition.Text & "%'"
      End If
      If fltr.lblPltype.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Pltype_ID='" & fltr.txtPltype.Tag & "'"
      End If
      If fltr.lblCurrentWeightBrutto_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentWeightBrutto>=" & val(fltr.txtCurrentWeightBrutto_GE.Text)
      End If
      If fltr.lblWDate_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_WDate<=" & MakeMSSQLDate(fltr.dtpWDate_LE.Value)
      End If
      If fltr.lblTheNumber_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_TheNumber<=" & val(fltr.txtTheNumber_LE.Text)
      End If
      If fltr.lblPackageWeight_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PackageWeight>=" & val(fltr.txtPackageWeight_GE.Text)
      End If
      If fltr.lblCorePalette_ID_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CorePalette_ID<=" & val(fltr.txtCorePalette_ID_LE.Text)
      End If
      If fltr.lblTheNumber_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_TheNumber>=" & val(fltr.txtTheNumber_GE.Text)
      End If
      If fltr.lblCurrentGood.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentGood_ID='" & fltr.txtCurrentGood.Tag & "'"
      End If
      If fltr.lblCode.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Code like '%" & fltr.txtCode.Text & "%'"
      End If
      If fltr.lblCurrentWeightBrutto_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentWeightBrutto<=" & val(fltr.txtCurrentWeightBrutto_LE.Text)
      End If
      If fltr.lblCorePalette_ID_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CorePalette_ID>=" & val(fltr.txtCorePalette_ID_GE.Text)
      End If
    jfmnuITTPL_2.jv.Filter.Add "AUTOITTPL_DEF", f
    End If
      jfmnuITTPL_2.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITTPL_2.Show
    jfmnuITTPL_2.WindowState = 0
    jfmnuITTPL_2.ZOrder 0
End Sub
Private Sub jfmnuITTPL_2_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTPL
    Dim f As String
    Set fltr = New frmITTPL
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{6FDCC60F-8C10-47E3-BB36-110C49EF2144}'"
      If fltr.lblPalKode.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PalKode like '%" & fltr.txtPalKode.Text & "%'"
      End If
      If fltr.lblWeight_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Weight<=" & val(fltr.txtWeight_LE.Text)
      End If
      If fltr.lblCaliberQuantity_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CaliberQuantity<=" & val(fltr.txtCaliberQuantity_LE.Text)
      End If
      If fltr.lblCaliberQuantity_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CaliberQuantity>=" & val(fltr.txtCaliberQuantity_GE.Text)
      End If
      If fltr.lblPackageWeight_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PackageWeight<=" & val(fltr.txtPackageWeight_LE.Text)
      End If
      If fltr.lblWDate_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_WDate>=" & MakeMSSQLDate(fltr.dtpWDate_GE.Value)
      End If
      If fltr.lblPrivatePalet.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PrivatePalet='" & fltr.cmbPrivatePalet.Text & "'"
      End If
      If fltr.lblWeight_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Weight>=" & val(fltr.txtWeight_GE.Text)
      End If
      If fltr.lblCurrentPosition.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentPosition like '%" & fltr.txtCurrentPosition.Text & "%'"
      End If
      If fltr.lblPltype.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Pltype_ID='" & fltr.txtPltype.Tag & "'"
      End If
      If fltr.lblCurrentWeightBrutto_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentWeightBrutto>=" & val(fltr.txtCurrentWeightBrutto_GE.Text)
      End If
      If fltr.lblWDate_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_WDate<=" & MakeMSSQLDate(fltr.dtpWDate_LE.Value)
      End If
      If fltr.lblTheNumber_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_TheNumber<=" & val(fltr.txtTheNumber_LE.Text)
      End If
      If fltr.lblPackageWeight_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PackageWeight>=" & val(fltr.txtPackageWeight_GE.Text)
      End If
      If fltr.lblCorePalette_ID_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CorePalette_ID<=" & val(fltr.txtCorePalette_ID_LE.Text)
      End If
      If fltr.lblTheNumber_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_TheNumber>=" & val(fltr.txtTheNumber_GE.Text)
      End If
      If fltr.lblCurrentGood.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentGood_ID='" & fltr.txtCurrentGood.Tag & "'"
      End If
      If fltr.lblCode.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Code like '%" & fltr.txtCode.Text & "%'"
      End If
      If fltr.lblCurrentWeightBrutto_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentWeightBrutto<=" & val(fltr.txtCurrentWeightBrutto_LE.Text)
      End If
      If fltr.lblCorePalette_ID_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CorePalette_ID>=" & val(fltr.txtCorePalette_ID_GE.Text)
      End If
    jfmnuITTPL_2.jv.Filter.Add "AUTOITTPL_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTPL_2_OnClearFilter()
   jfmnuITTPL_2.jv.Filter.Add "AUTOITTPL_DEF", " INTSANCEStatusID='{6FDCC60F-8C10-47E3-BB36-110C49EF2144}'"
End Sub
Private Sub jfmnuITTPL_2_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTPL", "Палетта" & Now, Site
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


Private Sub mnuITTPL_3_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITTPL_3 Is Nothing Then
      Set jfmnuITTPL_3 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{6345F83E-3D6C-4782-B165-51AEADB4D040}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITTPL_3.jv.journal = journal
      jfmnuITTPL_3.jv.OpenModal = False
      jfmnuITTPL_3.Caption = "Палетта :На складе с грузом"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{93E3DE6D-AB8D-48A6-84FD-152BF63FB14C}'"
    jfmnuITTPL_3.jv.Filter.Add "AUTOITTPL_DEF", f
    Dim fltr As frmITTPL
    Set fltr = New frmITTPL
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblWDate_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_WDate>=" & MakeMSSQLDate(fltr.dtpWDate_GE.Value)
      End If
      If fltr.lblTheNumber_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_TheNumber<=" & val(fltr.txtTheNumber_LE.Text)
      End If
      If fltr.lblCaliberQuantity_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CaliberQuantity<=" & val(fltr.txtCaliberQuantity_LE.Text)
      End If
      If fltr.lblPackageWeight_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PackageWeight<=" & val(fltr.txtPackageWeight_LE.Text)
      End If
      If fltr.lblPltype.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Pltype_ID='" & fltr.txtPltype.Tag & "'"
      End If
      If fltr.lblCurrentWeightBrutto_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentWeightBrutto>=" & val(fltr.txtCurrentWeightBrutto_GE.Text)
      End If
      If fltr.lblCaliberQuantity_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CaliberQuantity>=" & val(fltr.txtCaliberQuantity_GE.Text)
      End If
      If fltr.lblWDate_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_WDate<=" & MakeMSSQLDate(fltr.dtpWDate_LE.Value)
      End If
      If fltr.lblCorePalette_ID_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CorePalette_ID>=" & val(fltr.txtCorePalette_ID_GE.Text)
      End If
      If fltr.lblCurrentWeightBrutto_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentWeightBrutto<=" & val(fltr.txtCurrentWeightBrutto_LE.Text)
      End If
      If fltr.lblPalKode.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PalKode like '%" & fltr.txtPalKode.Text & "%'"
      End If
      If fltr.lblPackageWeight_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PackageWeight>=" & val(fltr.txtPackageWeight_GE.Text)
      End If
      If fltr.lblTheNumber_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_TheNumber>=" & val(fltr.txtTheNumber_GE.Text)
      End If
      If fltr.lblWeight_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Weight>=" & val(fltr.txtWeight_GE.Text)
      End If
      If fltr.lblCurrentGood.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentGood_ID='" & fltr.txtCurrentGood.Tag & "'"
      End If
      If fltr.lblCurrentPosition.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentPosition like '%" & fltr.txtCurrentPosition.Text & "%'"
      End If
      If fltr.lblPrivatePalet.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PrivatePalet='" & fltr.cmbPrivatePalet.Text & "'"
      End If
      If fltr.lblWeight_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Weight<=" & val(fltr.txtWeight_LE.Text)
      End If
      If fltr.lblCorePalette_ID_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CorePalette_ID<=" & val(fltr.txtCorePalette_ID_LE.Text)
      End If
      If fltr.lblCode.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Code like '%" & fltr.txtCode.Text & "%'"
      End If
    jfmnuITTPL_3.jv.Filter.Add "AUTOITTPL_DEF", f
    End If
      jfmnuITTPL_3.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITTPL_3.Show
    jfmnuITTPL_3.WindowState = 0
    jfmnuITTPL_3.ZOrder 0
End Sub
Private Sub jfmnuITTPL_3_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTPL
    Dim f As String
    Set fltr = New frmITTPL
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{93E3DE6D-AB8D-48A6-84FD-152BF63FB14C}'"
      If fltr.lblWDate_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_WDate>=" & MakeMSSQLDate(fltr.dtpWDate_GE.Value)
      End If
      If fltr.lblTheNumber_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_TheNumber<=" & val(fltr.txtTheNumber_LE.Text)
      End If
      If fltr.lblCaliberQuantity_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CaliberQuantity<=" & val(fltr.txtCaliberQuantity_LE.Text)
      End If
      If fltr.lblPackageWeight_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PackageWeight<=" & val(fltr.txtPackageWeight_LE.Text)
      End If
      If fltr.lblPltype.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Pltype_ID='" & fltr.txtPltype.Tag & "'"
      End If
      If fltr.lblCurrentWeightBrutto_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentWeightBrutto>=" & val(fltr.txtCurrentWeightBrutto_GE.Text)
      End If
      If fltr.lblCaliberQuantity_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CaliberQuantity>=" & val(fltr.txtCaliberQuantity_GE.Text)
      End If
      If fltr.lblWDate_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_WDate<=" & MakeMSSQLDate(fltr.dtpWDate_LE.Value)
      End If
      If fltr.lblCorePalette_ID_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CorePalette_ID>=" & val(fltr.txtCorePalette_ID_GE.Text)
      End If
      If fltr.lblCurrentWeightBrutto_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentWeightBrutto<=" & val(fltr.txtCurrentWeightBrutto_LE.Text)
      End If
      If fltr.lblPalKode.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PalKode like '%" & fltr.txtPalKode.Text & "%'"
      End If
      If fltr.lblPackageWeight_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PackageWeight>=" & val(fltr.txtPackageWeight_GE.Text)
      End If
      If fltr.lblTheNumber_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_TheNumber>=" & val(fltr.txtTheNumber_GE.Text)
      End If
      If fltr.lblWeight_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Weight>=" & val(fltr.txtWeight_GE.Text)
      End If
      If fltr.lblCurrentGood.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentGood_ID='" & fltr.txtCurrentGood.Tag & "'"
      End If
      If fltr.lblCurrentPosition.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentPosition like '%" & fltr.txtCurrentPosition.Text & "%'"
      End If
      If fltr.lblPrivatePalet.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PrivatePalet='" & fltr.cmbPrivatePalet.Text & "'"
      End If
      If fltr.lblWeight_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Weight<=" & val(fltr.txtWeight_LE.Text)
      End If
      If fltr.lblCorePalette_ID_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CorePalette_ID<=" & val(fltr.txtCorePalette_ID_LE.Text)
      End If
      If fltr.lblCode.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Code like '%" & fltr.txtCode.Text & "%'"
      End If
    jfmnuITTPL_3.jv.Filter.Add "AUTOITTPL_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTPL_3_OnClearFilter()
   jfmnuITTPL_3.jv.Filter.Add "AUTOITTPL_DEF", " INTSANCEStatusID='{93E3DE6D-AB8D-48A6-84FD-152BF63FB14C}'"
End Sub
Private Sub jfmnuITTPL_3_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTPL", "Палетта" & Now, Site
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


Private Sub mnuITTPL_4_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITTPL_4 Is Nothing Then
      Set jfmnuITTPL_4 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{6345F83E-3D6C-4782-B165-51AEADB4D040}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITTPL_4.jv.journal = journal
      jfmnuITTPL_4.jv.OpenModal = False
      jfmnuITTPL_4.Caption = "Палетта :Списана"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{588C5203-1E59-408E-92A1-B3DFED8C19FA}'"
    jfmnuITTPL_4.jv.Filter.Add "AUTOITTPL_DEF", f
    Dim fltr As frmITTPL
    Set fltr = New frmITTPL
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblWDate_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_WDate<=" & MakeMSSQLDate(fltr.dtpWDate_LE.Value)
      End If
      If fltr.lblCurrentPosition.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentPosition like '%" & fltr.txtCurrentPosition.Text & "%'"
      End If
      If fltr.lblCode.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Code like '%" & fltr.txtCode.Text & "%'"
      End If
      If fltr.lblCaliberQuantity_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CaliberQuantity>=" & val(fltr.txtCaliberQuantity_GE.Text)
      End If
      If fltr.lblWeight_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Weight>=" & val(fltr.txtWeight_GE.Text)
      End If
      If fltr.lblTheNumber_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_TheNumber<=" & val(fltr.txtTheNumber_LE.Text)
      End If
      If fltr.lblCurrentGood.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentGood_ID='" & fltr.txtCurrentGood.Tag & "'"
      End If
      If fltr.lblCurrentWeightBrutto_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentWeightBrutto>=" & val(fltr.txtCurrentWeightBrutto_GE.Text)
      End If
      If fltr.lblPltype.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Pltype_ID='" & fltr.txtPltype.Tag & "'"
      End If
      If fltr.lblTheNumber_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_TheNumber>=" & val(fltr.txtTheNumber_GE.Text)
      End If
      If fltr.lblCorePalette_ID_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CorePalette_ID<=" & val(fltr.txtCorePalette_ID_LE.Text)
      End If
      If fltr.lblPackageWeight_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PackageWeight>=" & val(fltr.txtPackageWeight_GE.Text)
      End If
      If fltr.lblCurrentWeightBrutto_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentWeightBrutto<=" & val(fltr.txtCurrentWeightBrutto_LE.Text)
      End If
      If fltr.lblPackageWeight_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PackageWeight<=" & val(fltr.txtPackageWeight_LE.Text)
      End If
      If fltr.lblWeight_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Weight<=" & val(fltr.txtWeight_LE.Text)
      End If
      If fltr.lblCaliberQuantity_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CaliberQuantity<=" & val(fltr.txtCaliberQuantity_LE.Text)
      End If
      If fltr.lblPalKode.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PalKode like '%" & fltr.txtPalKode.Text & "%'"
      End If
      If fltr.lblWDate_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_WDate>=" & MakeMSSQLDate(fltr.dtpWDate_GE.Value)
      End If
      If fltr.lblPrivatePalet.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PrivatePalet='" & fltr.cmbPrivatePalet.Text & "'"
      End If
      If fltr.lblCorePalette_ID_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CorePalette_ID>=" & val(fltr.txtCorePalette_ID_GE.Text)
      End If
    jfmnuITTPL_4.jv.Filter.Add "AUTOITTPL_DEF", f
    End If
      jfmnuITTPL_4.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITTPL_4.Show
    jfmnuITTPL_4.WindowState = 0
    jfmnuITTPL_4.ZOrder 0
End Sub
Private Sub jfmnuITTPL_4_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTPL
    Dim f As String
    Set fltr = New frmITTPL
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{588C5203-1E59-408E-92A1-B3DFED8C19FA}'"
      If fltr.lblWDate_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_WDate<=" & MakeMSSQLDate(fltr.dtpWDate_LE.Value)
      End If
      If fltr.lblCurrentPosition.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentPosition like '%" & fltr.txtCurrentPosition.Text & "%'"
      End If
      If fltr.lblCode.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Code like '%" & fltr.txtCode.Text & "%'"
      End If
      If fltr.lblCaliberQuantity_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CaliberQuantity>=" & val(fltr.txtCaliberQuantity_GE.Text)
      End If
      If fltr.lblWeight_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Weight>=" & val(fltr.txtWeight_GE.Text)
      End If
      If fltr.lblTheNumber_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_TheNumber<=" & val(fltr.txtTheNumber_LE.Text)
      End If
      If fltr.lblCurrentGood.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentGood_ID='" & fltr.txtCurrentGood.Tag & "'"
      End If
      If fltr.lblCurrentWeightBrutto_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentWeightBrutto>=" & val(fltr.txtCurrentWeightBrutto_GE.Text)
      End If
      If fltr.lblPltype.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Pltype_ID='" & fltr.txtPltype.Tag & "'"
      End If
      If fltr.lblTheNumber_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_TheNumber>=" & val(fltr.txtTheNumber_GE.Text)
      End If
      If fltr.lblCorePalette_ID_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CorePalette_ID<=" & val(fltr.txtCorePalette_ID_LE.Text)
      End If
      If fltr.lblPackageWeight_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PackageWeight>=" & val(fltr.txtPackageWeight_GE.Text)
      End If
      If fltr.lblCurrentWeightBrutto_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentWeightBrutto<=" & val(fltr.txtCurrentWeightBrutto_LE.Text)
      End If
      If fltr.lblPackageWeight_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PackageWeight<=" & val(fltr.txtPackageWeight_LE.Text)
      End If
      If fltr.lblWeight_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Weight<=" & val(fltr.txtWeight_LE.Text)
      End If
      If fltr.lblCaliberQuantity_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CaliberQuantity<=" & val(fltr.txtCaliberQuantity_LE.Text)
      End If
      If fltr.lblPalKode.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PalKode like '%" & fltr.txtPalKode.Text & "%'"
      End If
      If fltr.lblWDate_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_WDate>=" & MakeMSSQLDate(fltr.dtpWDate_GE.Value)
      End If
      If fltr.lblPrivatePalet.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PrivatePalet='" & fltr.cmbPrivatePalet.Text & "'"
      End If
      If fltr.lblCorePalette_ID_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CorePalette_ID>=" & val(fltr.txtCorePalette_ID_GE.Text)
      End If
    jfmnuITTPL_4.jv.Filter.Add "AUTOITTPL_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTPL_4_OnClearFilter()
   jfmnuITTPL_4.jv.Filter.Add "AUTOITTPL_DEF", " INTSANCEStatusID='{588C5203-1E59-408E-92A1-B3DFED8C19FA}'"
End Sub
Private Sub jfmnuITTPL_4_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTPL", "Палетта" & Now, Site
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


Private Sub mnuITTPL_5_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITTPL_5 Is Nothing Then
      Set jfmnuITTPL_5 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{6345F83E-3D6C-4782-B165-51AEADB4D040}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITTPL_5.jv.journal = journal
      jfmnuITTPL_5.jv.OpenModal = False
      jfmnuITTPL_5.Caption = "Палетта :Отправлена с грузом"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{7BD977D0-0EF9-4F0D-B047-E409BB1616CA}'"
    jfmnuITTPL_5.jv.Filter.Add "AUTOITTPL_DEF", f
    Dim fltr As frmITTPL
    Set fltr = New frmITTPL
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblCurrentWeightBrutto_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentWeightBrutto<=" & val(fltr.txtCurrentWeightBrutto_LE.Text)
      End If
      If fltr.lblPackageWeight_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PackageWeight>=" & val(fltr.txtPackageWeight_GE.Text)
      End If
      If fltr.lblCode.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Code like '%" & fltr.txtCode.Text & "%'"
      End If
      If fltr.lblTheNumber_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_TheNumber<=" & val(fltr.txtTheNumber_LE.Text)
      End If
      If fltr.lblCorePalette_ID_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CorePalette_ID>=" & val(fltr.txtCorePalette_ID_GE.Text)
      End If
      If fltr.lblWeight_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Weight>=" & val(fltr.txtWeight_GE.Text)
      End If
      If fltr.lblPrivatePalet.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PrivatePalet='" & fltr.cmbPrivatePalet.Text & "'"
      End If
      If fltr.lblCaliberQuantity_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CaliberQuantity>=" & val(fltr.txtCaliberQuantity_GE.Text)
      End If
      If fltr.lblCaliberQuantity_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CaliberQuantity<=" & val(fltr.txtCaliberQuantity_LE.Text)
      End If
      If fltr.lblPalKode.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PalKode like '%" & fltr.txtPalKode.Text & "%'"
      End If
      If fltr.lblCurrentPosition.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentPosition like '%" & fltr.txtCurrentPosition.Text & "%'"
      End If
      If fltr.lblCorePalette_ID_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CorePalette_ID<=" & val(fltr.txtCorePalette_ID_LE.Text)
      End If
      If fltr.lblCurrentWeightBrutto_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentWeightBrutto>=" & val(fltr.txtCurrentWeightBrutto_GE.Text)
      End If
      If fltr.lblPackageWeight_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PackageWeight<=" & val(fltr.txtPackageWeight_LE.Text)
      End If
      If fltr.lblPltype.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Pltype_ID='" & fltr.txtPltype.Tag & "'"
      End If
      If fltr.lblWDate_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_WDate>=" & MakeMSSQLDate(fltr.dtpWDate_GE.Value)
      End If
      If fltr.lblWDate_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_WDate<=" & MakeMSSQLDate(fltr.dtpWDate_LE.Value)
      End If
      If fltr.lblCurrentGood.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentGood_ID='" & fltr.txtCurrentGood.Tag & "'"
      End If
      If fltr.lblTheNumber_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_TheNumber>=" & val(fltr.txtTheNumber_GE.Text)
      End If
      If fltr.lblWeight_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Weight<=" & val(fltr.txtWeight_LE.Text)
      End If
    jfmnuITTPL_5.jv.Filter.Add "AUTOITTPL_DEF", f
    End If
      jfmnuITTPL_5.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITTPL_5.Show
    jfmnuITTPL_5.WindowState = 0
    jfmnuITTPL_5.ZOrder 0
End Sub
Private Sub jfmnuITTPL_5_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTPL
    Dim f As String
    Set fltr = New frmITTPL
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{7BD977D0-0EF9-4F0D-B047-E409BB1616CA}'"
      If fltr.lblCurrentWeightBrutto_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentWeightBrutto<=" & val(fltr.txtCurrentWeightBrutto_LE.Text)
      End If
      If fltr.lblPackageWeight_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PackageWeight>=" & val(fltr.txtPackageWeight_GE.Text)
      End If
      If fltr.lblCode.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Code like '%" & fltr.txtCode.Text & "%'"
      End If
      If fltr.lblTheNumber_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_TheNumber<=" & val(fltr.txtTheNumber_LE.Text)
      End If
      If fltr.lblCorePalette_ID_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CorePalette_ID>=" & val(fltr.txtCorePalette_ID_GE.Text)
      End If
      If fltr.lblWeight_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Weight>=" & val(fltr.txtWeight_GE.Text)
      End If
      If fltr.lblPrivatePalet.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PrivatePalet='" & fltr.cmbPrivatePalet.Text & "'"
      End If
      If fltr.lblCaliberQuantity_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CaliberQuantity>=" & val(fltr.txtCaliberQuantity_GE.Text)
      End If
      If fltr.lblCaliberQuantity_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CaliberQuantity<=" & val(fltr.txtCaliberQuantity_LE.Text)
      End If
      If fltr.lblPalKode.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PalKode like '%" & fltr.txtPalKode.Text & "%'"
      End If
      If fltr.lblCurrentPosition.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentPosition like '%" & fltr.txtCurrentPosition.Text & "%'"
      End If
      If fltr.lblCorePalette_ID_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CorePalette_ID<=" & val(fltr.txtCorePalette_ID_LE.Text)
      End If
      If fltr.lblCurrentWeightBrutto_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentWeightBrutto>=" & val(fltr.txtCurrentWeightBrutto_GE.Text)
      End If
      If fltr.lblPackageWeight_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_PackageWeight<=" & val(fltr.txtPackageWeight_LE.Text)
      End If
      If fltr.lblPltype.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Pltype_ID='" & fltr.txtPltype.Tag & "'"
      End If
      If fltr.lblWDate_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_WDate>=" & MakeMSSQLDate(fltr.dtpWDate_GE.Value)
      End If
      If fltr.lblWDate_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_WDate<=" & MakeMSSQLDate(fltr.dtpWDate_LE.Value)
      End If
      If fltr.lblCurrentGood.Value = vbChecked Then
        f = f & " and ITTPL_DEF_CurrentGood_ID='" & fltr.txtCurrentGood.Tag & "'"
      End If
      If fltr.lblTheNumber_GE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_TheNumber>=" & val(fltr.txtTheNumber_GE.Text)
      End If
      If fltr.lblWeight_LE.Value = vbChecked Then
        f = f & " and ITTPL_DEF_Weight<=" & val(fltr.txtWeight_LE.Text)
      End If
    jfmnuITTPL_5.jv.Filter.Add "AUTOITTPL_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTPL_5_OnClearFilter()
   jfmnuITTPL_5.jv.Filter.Add "AUTOITTPL_DEF", " INTSANCEStatusID='{7BD977D0-0EF9-4F0D-B047-E409BB1616CA}'"
End Sub
Private Sub jfmnuITTPL_5_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTPL", "Палетта" & Now, Site
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
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblQryCode.Value = vbChecked Then
        f = f & " and ITTIN_DEF_QryCode_ID='" & fltr.txtQryCode.Tag & "'"
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
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
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblQryCode.Value = vbChecked Then
        f = f & " and ITTIN_DEF_QryCode_ID='" & fltr.txtQryCode.Tag & "'"
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
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
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblQryCode.Value = vbChecked Then
        f = f & " and ITTIN_DEF_QryCode_ID='" & fltr.txtQryCode.Tag & "'"
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
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
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblQryCode.Value = vbChecked Then
        f = f & " and ITTIN_DEF_QryCode_ID='" & fltr.txtQryCode.Tag & "'"
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
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
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblQryCode.Value = vbChecked Then
        f = f & " and ITTIN_DEF_QryCode_ID='" & fltr.txtQryCode.Tag & "'"
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
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
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblQryCode.Value = vbChecked Then
        f = f & " and ITTIN_DEF_QryCode_ID='" & fltr.txtQryCode.Tag & "'"
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
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
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lblQryCode.Value = vbChecked Then
        f = f & " and ITTIN_DEF_QryCode_ID='" & fltr.txtQryCode.Tag & "'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
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
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
      End If
      If fltr.lblQryCode.Value = vbChecked Then
        f = f & " and ITTIN_DEF_QryCode_ID='" & fltr.txtQryCode.Tag & "'"
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
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
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lblQryCode.Value = vbChecked Then
        f = f & " and ITTIN_DEF_QryCode_ID='" & fltr.txtQryCode.Tag & "'"
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
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
      If fltr.lblThePartyRule.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ThePartyRule_ID='" & fltr.txtThePartyRule.Tag & "'"
      End If
      If fltr.lblProcessDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate<=" & MakeMSSQLDate(fltr.dtpProcessDate_LE.Value)
      End If
      If fltr.lblTrack_time_in_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in>=" & MakeMSSQLDate(fltr.dtpTrack_time_in_GE.Value)
      End If
      If fltr.lblProcessDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_ProcessDate>=" & MakeMSSQLDate(fltr.dtpProcessDate_GE.Value)
      End If
      If fltr.lblTranspNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TranspNumber like '%" & fltr.txtTranspNumber.Text & "%'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TheClient_ID='" & fltr.txtTheClient.Tag & "'"
      End If
      If fltr.lblTTN.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTN like '%" & fltr.txtTTN.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltrack_time_out_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out>=" & MakeMSSQLDate(fltr.dtptrack_time_out_GE.Value)
      End If
      If fltr.lblQryCode.Value = vbChecked Then
        f = f & " and ITTIN_DEF_QryCode_ID='" & fltr.txtQryCode.Tag & "'"
      End If
      If fltr.lbltemp_in_track_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track<=" & val(fltr.txttemp_in_track_LE.Text)
      End If
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblStampNumber.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampNumber like '%" & fltr.txtStampNumber.Text & "%'"
      End If
      If fltr.lblContainer.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Container like '%" & fltr.txtContainer.Text & "%'"
      End If
      If fltr.lblTrack_time_in_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_Track_time_in<=" & MakeMSSQLDate(fltr.dtpTrack_time_in_LE.Value)
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblStampStatus.Value = vbChecked Then
        f = f & " and ITTIN_DEF_StampStatus like '%" & fltr.txtStampStatus.Text & "%'"
      End If
      If fltr.lbltemp_in_track_GE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_temp_in_track>=" & val(fltr.txttemp_in_track_GE.Text)
      End If
      If fltr.lbltrack_time_out_LE.Value = vbChecked Then
        f = f & " and ITTIN_DEF_track_time_out<=" & MakeMSSQLDate(fltr.dtptrack_time_out_LE.Value)
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




Private Sub mnuITTCS_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITTCS Is Nothing Then
      Set jfmnuITTCS = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{D02217FD-2C39-46A2-B88D-011F9FAC08CA}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITTCS.jv.journal = journal
      jfmnuITTCS.jv.OpenModal = False
      jfmnuITTCS.Caption = "Услуги клиентов"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
    Dim fltr As frmITTCS
    Set fltr = New frmITTCS
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblCLIENTCODE.Value = vbChecked Then
        f = f & " and ITTCS_DEF_CLIENTCODE_ID='" & fltr.txtCLIENTCODE.Tag & "'"
      End If
    jfmnuITTCS.jv.Filter.Add "AUTOITTCS_DEF", f
    End If
      jfmnuITTCS.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITTCS.Show
    jfmnuITTCS.WindowState = 0
    jfmnuITTCS.ZOrder 0
End Sub
Private Sub jfmnuITTCS_OnFilter(usedefault As Boolean)
    Dim fltr As frmITTCS
    Dim f As String
    Set fltr = New frmITTCS
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
      If fltr.lblCLIENTCODE.Value = vbChecked Then
        f = f & " and ITTCS_DEF_CLIENTCODE_ID='" & fltr.txtCLIENTCODE.Tag & "'"
      End If
    jfmnuITTCS.jv.Filter.Add "AUTOITTCS_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTCS_OnClearFilter()
End Sub
Private Sub jfmnuITTCS_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTCS", "Услуги клиентов" & Now, Site
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




Private Sub mnuITTFN_Click()
 Dim o As Object
 Dim rs  As ADODB.Recordset
 Dim ID As String
  Set rs = Manager.ListInstances("", "ITTFN")
  If Not rs.EOF Then
    ID = rs!InstanceID
  Else
    ID = CreateGUID2
    Manager.NewInstance ID, "ITTFN", "Настройки системы"
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


Private Sub mnuITTOP_Click()
 Dim o As Object
 Dim rs  As ADODB.Recordset
 Dim ID As String
  Set rs = Manager.ListInstances("", "ITTOP")
  If Not rs.EOF Then
    ID = rs!InstanceID
  Else
    ID = CreateGUID2
    Manager.NewInstance ID, "ITTOP", "Операторы и кладовщики"
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


Private Sub mnuITTD_Click()
 Dim o As Object
 Dim rs  As ADODB.Recordset
 Dim ID As String
  Set rs = Manager.ListInstances("", "ITTD")
  If Not rs.EOF Then
    ID = rs!InstanceID
  Else
    ID = CreateGUID2
    Manager.NewInstance ID, "ITTD", "Справочник"
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



Unload jfmnuAllITTOPT
Set jfmnuAllITTOPT = Nothing

Unload jfmnuITTOPT_1
Set jfmnuITTOPT_1 = Nothing

Unload jfmnuITTOPT_2
Set jfmnuITTOPT_2 = Nothing

Unload jfmnuITTOPT_3
Set jfmnuITTOPT_3 = Nothing

Unload jfmnuITTOPT_4
Set jfmnuITTOPT_4 = Nothing

Unload jfmnuITTOPT_5
Set jfmnuITTOPT_5 = Nothing

Unload jfmnuITTOPT_6
Set jfmnuITTOPT_6 = Nothing

Unload jfmnuITTOPT_7
Set jfmnuITTOPT_7 = Nothing

Unload jfmnuITTOPT_8
Set jfmnuITTOPT_8 = Nothing


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


Unload jfmnuAllITTPL
Set jfmnuAllITTPL = Nothing

Unload jfmnuITTPL_1
Set jfmnuITTPL_1 = Nothing

Unload jfmnuITTPL_2
Set jfmnuITTPL_2 = Nothing

Unload jfmnuITTPL_3
Set jfmnuITTPL_3 = Nothing

Unload jfmnuITTPL_4
Set jfmnuITTPL_4 = Nothing

Unload jfmnuITTPL_5
Set jfmnuITTPL_5 = Nothing


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

Unload jfmnuITTCS
Set jfmnuITTCS = Nothing





End Sub



