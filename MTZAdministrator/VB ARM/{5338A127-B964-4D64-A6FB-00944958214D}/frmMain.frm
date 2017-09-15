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
   Begin VB.Menu mnuDictionary 
      Caption         =   "Справочники"
      Begin VB.Menu mnuITTNO 
         Caption         =   "Настройки оптмизатора"
      End
      Begin VB.Menu mnuITTOP 
         Caption         =   "Операторы и кладовщики"
      End
      Begin VB.Menu mnuITTD 
         Caption         =   "Справочник"
      End
   End
   Begin VB.Menu mnuJRNL 
      Caption         =   "Журналы"
      Begin VB.Menu mnuITTOPT 
         Caption         =   "Задание на перемещения"
         Begin VB.Menu mnuAllITTOPT 
            Caption         =   "Задание на перемещения - все состояния"
         End
         Begin VB.Menu mnuITTOPT_1 
            Caption         =   "Задание на перемещения :Задание исполнено"
         End
         Begin VB.Menu mnuITTOPT_2 
            Caption         =   "Задание на перемещения :Задание напечатано"
         End
         Begin VB.Menu mnuITTOPT_3 
            Caption         =   "Задание на перемещения :Исполняется"
         End
         Begin VB.Menu mnuITTOPT_4 
            Caption         =   "Задание на перемещения :Обработано"
         End
         Begin VB.Menu mnuITTOPT_5 
            Caption         =   "Задание на перемещения :Отменено"
         End
         Begin VB.Menu mnuITTOPT_6 
            Caption         =   "Задание на перемещения :Оформлено"
         End
         Begin VB.Menu mnuITTOPT_7 
            Caption         =   "Задание на перемещения :Оформляется"
         End
      End
      Begin VB.Menu mnuITT2OPT 
         Caption         =   "Оптимизация"
         Begin VB.Menu mnuAllITT2OPT 
            Caption         =   "Оптимизация - все состояния"
         End
         Begin VB.Menu mnuITT2OPT_1 
            Caption         =   "Оптимизация :Оформляется"
         End
         Begin VB.Menu mnuITT2OPT_2 
            Caption         =   "Оптимизация :Подготовка заданий"
         End
         Begin VB.Menu mnuITT2OPT_3 
            Caption         =   "Оптимизация :Задания подготовлены"
         End
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



Dim WithEvents jfmnuAllITT2OPT As frmJournalShow
Attribute jfmnuAllITT2OPT.VB_VarHelpID = -1

Dim WithEvents jfmnuITT2OPT_1 As frmJournalShow
Attribute jfmnuITT2OPT_1.VB_VarHelpID = -1

Dim WithEvents jfmnuITT2OPT_2 As frmJournalShow
Attribute jfmnuITT2OPT_2.VB_VarHelpID = -1

Dim WithEvents jfmnuITT2OPT_3 As frmJournalShow
Attribute jfmnuITT2OPT_3.VB_VarHelpID = -1











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


Private Sub mnuITTNO_Click()
 Dim o As Object
 Dim rs  As ADODB.Recordset
 Dim ID As String
  Set rs = Manager.ListInstances("", "ITTNO")
  If Not rs.EOF Then
    ID = rs!InstanceID
  Else
    ID = CreateGUID2
    Manager.NewInstance ID, "ITTNO", "Настройки оптмизатора"
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




Private Sub mnuAllITTOPT_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuAllITTOPT Is Nothing Then
      Set jfmnuAllITTOPT = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{70D005EF-420B-4A40-8CDF-B4800FCD0F1D}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuAllITTOPT.jv.journal = journal
      jfmnuAllITTOPT.jv.OpenModal = False
      jfmnuAllITTOPT.Caption = "Задание на перемещения - все состояния"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
    Dim fltr As frmITTOPT
    Set fltr = New frmITTOPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory like '%" & fltr.txtFactory.Text & "%'"
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER like '%" & fltr.txtKILL_NUMBER.Text & "%'"
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good like '%" & fltr.txtgood.Text & "%'"
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient like '%" & fltr.txtTheClient.Text & "%'"
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country like '%" & fltr.txtmade_country.Text & "%'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak like '%" & fltr.txtIsBrak.Text & "%'"
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
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
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory like '%" & fltr.txtFactory.Text & "%'"
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER like '%" & fltr.txtKILL_NUMBER.Text & "%'"
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good like '%" & fltr.txtgood.Text & "%'"
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient like '%" & fltr.txtTheClient.Text & "%'"
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country like '%" & fltr.txtmade_country.Text & "%'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak like '%" & fltr.txtIsBrak.Text & "%'"
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
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
  Manager.NewInstance ID, "ITTOPT", "Задание на перемещения" & Now, Site
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
      jfmnuITTOPT_1.Caption = "Задание на перемещения :Задание исполнено"
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
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER like '%" & fltr.txtKILL_NUMBER.Text & "%'"
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good like '%" & fltr.txtgood.Text & "%'"
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory like '%" & fltr.txtFactory.Text & "%'"
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak like '%" & fltr.txtIsBrak.Text & "%'"
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient like '%" & fltr.txtTheClient.Text & "%'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country like '%" & fltr.txtmade_country.Text & "%'"
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
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
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER like '%" & fltr.txtKILL_NUMBER.Text & "%'"
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good like '%" & fltr.txtgood.Text & "%'"
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory like '%" & fltr.txtFactory.Text & "%'"
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak like '%" & fltr.txtIsBrak.Text & "%'"
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient like '%" & fltr.txtTheClient.Text & "%'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country like '%" & fltr.txtmade_country.Text & "%'"
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
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
  Manager.NewInstance ID, "ITTOPT", "Задание на перемещения" & Now, Site
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
      jfmnuITTOPT_2.Caption = "Задание на перемещения :Задание напечатано"
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
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country like '%" & fltr.txtmade_country.Text & "%'"
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory like '%" & fltr.txtFactory.Text & "%'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient like '%" & fltr.txtTheClient.Text & "%'"
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good like '%" & fltr.txtgood.Text & "%'"
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER like '%" & fltr.txtKILL_NUMBER.Text & "%'"
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak like '%" & fltr.txtIsBrak.Text & "%'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
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
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country like '%" & fltr.txtmade_country.Text & "%'"
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory like '%" & fltr.txtFactory.Text & "%'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient like '%" & fltr.txtTheClient.Text & "%'"
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good like '%" & fltr.txtgood.Text & "%'"
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER like '%" & fltr.txtKILL_NUMBER.Text & "%'"
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak like '%" & fltr.txtIsBrak.Text & "%'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
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
  Manager.NewInstance ID, "ITTOPT", "Задание на перемещения" & Now, Site
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
      jfmnuITTOPT_3.Caption = "Задание на перемещения :Исполняется"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{9C840B59-7271-4499-92C3-F00ABAF7228A}'"
    jfmnuITTOPT_3.jv.Filter.Add "AUTOITTOPT_DEF", f
    Dim fltr As frmITTOPT
    Set fltr = New frmITTOPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER like '%" & fltr.txtKILL_NUMBER.Text & "%'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient like '%" & fltr.txtTheClient.Text & "%'"
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory like '%" & fltr.txtFactory.Text & "%'"
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good like '%" & fltr.txtgood.Text & "%'"
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak like '%" & fltr.txtIsBrak.Text & "%'"
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country like '%" & fltr.txtmade_country.Text & "%'"
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
   f = " INTSANCEStatusID='{9C840B59-7271-4499-92C3-F00ABAF7228A}'"
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER like '%" & fltr.txtKILL_NUMBER.Text & "%'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient like '%" & fltr.txtTheClient.Text & "%'"
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory like '%" & fltr.txtFactory.Text & "%'"
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good like '%" & fltr.txtgood.Text & "%'"
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak like '%" & fltr.txtIsBrak.Text & "%'"
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country like '%" & fltr.txtmade_country.Text & "%'"
      End If
    jfmnuITTOPT_3.jv.Filter.Add "AUTOITTOPT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTOPT_3_OnClearFilter()
   jfmnuITTOPT_3.jv.Filter.Add "AUTOITTOPT_DEF", " INTSANCEStatusID='{9C840B59-7271-4499-92C3-F00ABAF7228A}'"
End Sub
Private Sub jfmnuITTOPT_3_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTOPT", "Задание на перемещения" & Now, Site
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
      jfmnuITTOPT_4.Caption = "Задание на перемещения :Обработано"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{A7D3D675-6391-4CE2-88B9-F2A8D4ACF2C5}'"
    jfmnuITTOPT_4.jv.Filter.Add "AUTOITTOPT_DEF", f
    Dim fltr As frmITTOPT
    Set fltr = New frmITTOPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country like '%" & fltr.txtmade_country.Text & "%'"
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER like '%" & fltr.txtKILL_NUMBER.Text & "%'"
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak like '%" & fltr.txtIsBrak.Text & "%'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory like '%" & fltr.txtFactory.Text & "%'"
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient like '%" & fltr.txtTheClient.Text & "%'"
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good like '%" & fltr.txtgood.Text & "%'"
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
   f = " INTSANCEStatusID='{A7D3D675-6391-4CE2-88B9-F2A8D4ACF2C5}'"
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country like '%" & fltr.txtmade_country.Text & "%'"
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER like '%" & fltr.txtKILL_NUMBER.Text & "%'"
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak like '%" & fltr.txtIsBrak.Text & "%'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory like '%" & fltr.txtFactory.Text & "%'"
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient like '%" & fltr.txtTheClient.Text & "%'"
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good like '%" & fltr.txtgood.Text & "%'"
      End If
    jfmnuITTOPT_4.jv.Filter.Add "AUTOITTOPT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTOPT_4_OnClearFilter()
   jfmnuITTOPT_4.jv.Filter.Add "AUTOITTOPT_DEF", " INTSANCEStatusID='{A7D3D675-6391-4CE2-88B9-F2A8D4ACF2C5}'"
End Sub
Private Sub jfmnuITTOPT_4_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTOPT", "Задание на перемещения" & Now, Site
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
      jfmnuITTOPT_5.Caption = "Задание на перемещения :Отменено"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{DE7BE490-19D4-43D0-8F06-87D569FFFCF2}'"
    jfmnuITTOPT_5.jv.Filter.Add "AUTOITTOPT_DEF", f
    Dim fltr As frmITTOPT
    Set fltr = New frmITTOPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good like '%" & fltr.txtgood.Text & "%'"
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak like '%" & fltr.txtIsBrak.Text & "%'"
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country like '%" & fltr.txtmade_country.Text & "%'"
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory like '%" & fltr.txtFactory.Text & "%'"
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER like '%" & fltr.txtKILL_NUMBER.Text & "%'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient like '%" & fltr.txtTheClient.Text & "%'"
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
   f = " INTSANCEStatusID='{DE7BE490-19D4-43D0-8F06-87D569FFFCF2}'"
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good like '%" & fltr.txtgood.Text & "%'"
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak like '%" & fltr.txtIsBrak.Text & "%'"
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country like '%" & fltr.txtmade_country.Text & "%'"
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory like '%" & fltr.txtFactory.Text & "%'"
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER like '%" & fltr.txtKILL_NUMBER.Text & "%'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient like '%" & fltr.txtTheClient.Text & "%'"
      End If
    jfmnuITTOPT_5.jv.Filter.Add "AUTOITTOPT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTOPT_5_OnClearFilter()
   jfmnuITTOPT_5.jv.Filter.Add "AUTOITTOPT_DEF", " INTSANCEStatusID='{DE7BE490-19D4-43D0-8F06-87D569FFFCF2}'"
End Sub
Private Sub jfmnuITTOPT_5_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTOPT", "Задание на перемещения" & Now, Site
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
      jfmnuITTOPT_6.Caption = "Задание на перемещения :Оформлено"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{300483B2-1D94-4A33-8ADF-ABF32E72E57B}'"
    jfmnuITTOPT_6.jv.Filter.Add "AUTOITTOPT_DEF", f
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
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country like '%" & fltr.txtmade_country.Text & "%'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak like '%" & fltr.txtIsBrak.Text & "%'"
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good like '%" & fltr.txtgood.Text & "%'"
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient like '%" & fltr.txtTheClient.Text & "%'"
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory like '%" & fltr.txtFactory.Text & "%'"
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER like '%" & fltr.txtKILL_NUMBER.Text & "%'"
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
   f = " INTSANCEStatusID='{300483B2-1D94-4A33-8ADF-ABF32E72E57B}'"
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country like '%" & fltr.txtmade_country.Text & "%'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak like '%" & fltr.txtIsBrak.Text & "%'"
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good like '%" & fltr.txtgood.Text & "%'"
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient like '%" & fltr.txtTheClient.Text & "%'"
      End If
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory like '%" & fltr.txtFactory.Text & "%'"
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER like '%" & fltr.txtKILL_NUMBER.Text & "%'"
      End If
    jfmnuITTOPT_6.jv.Filter.Add "AUTOITTOPT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTOPT_6_OnClearFilter()
   jfmnuITTOPT_6.jv.Filter.Add "AUTOITTOPT_DEF", " INTSANCEStatusID='{300483B2-1D94-4A33-8ADF-ABF32E72E57B}'"
End Sub
Private Sub jfmnuITTOPT_6_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTOPT", "Задание на перемещения" & Now, Site
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
      jfmnuITTOPT_7.Caption = "Задание на перемещения :Оформляется"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{C861FA15-0DF6-42D4-BCE9-2B38C3E6C0CB}'"
    jfmnuITTOPT_7.jv.Filter.Add "AUTOITTOPT_DEF", f
    Dim fltr As frmITTOPT
    Set fltr = New frmITTOPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory like '%" & fltr.txtFactory.Text & "%'"
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good like '%" & fltr.txtgood.Text & "%'"
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country like '%" & fltr.txtmade_country.Text & "%'"
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient like '%" & fltr.txtTheClient.Text & "%'"
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER like '%" & fltr.txtKILL_NUMBER.Text & "%'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak like '%" & fltr.txtIsBrak.Text & "%'"
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
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
   f = " INTSANCEStatusID='{C861FA15-0DF6-42D4-BCE9-2B38C3E6C0CB}'"
      If fltr.lblFactory.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_Factory like '%" & fltr.txtFactory.Text & "%'"
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblgood.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_good like '%" & fltr.txtgood.Text & "%'"
      End If
      If fltr.lblmade_country.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_made_country like '%" & fltr.txtmade_country.Text & "%'"
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblTheClient.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_TheClient like '%" & fltr.txtTheClient.Text & "%'"
      End If
      If fltr.lblKILL_NUMBER.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_KILL_NUMBER like '%" & fltr.txtKILL_NUMBER.Text & "%'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblIsBrak.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_IsBrak like '%" & fltr.txtIsBrak.Text & "%'"
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITTOPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
    jfmnuITTOPT_7.jv.Filter.Add "AUTOITTOPT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITTOPT_7_OnClearFilter()
   jfmnuITTOPT_7.jv.Filter.Add "AUTOITTOPT_DEF", " INTSANCEStatusID='{C861FA15-0DF6-42D4-BCE9-2B38C3E6C0CB}'"
End Sub
Private Sub jfmnuITTOPT_7_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITTOPT", "Задание на перемещения" & Now, Site
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




Private Sub mnuAllITT2OPT_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuAllITT2OPT Is Nothing Then
      Set jfmnuAllITT2OPT = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{DCE95D6B-270C-42B4-ADB5-D3175A7A0AAA}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuAllITT2OPT.jv.journal = journal
      jfmnuAllITT2OPT.jv.OpenModal = False
      jfmnuAllITT2OPT.Caption = "Оптимизация - все состояния"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
    Dim fltr As frmITT2OPT
    Set fltr = New frmITT2OPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblTheRule.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_TheRule_ID='" & fltr.txtTheRule.Tag & "'"
      End If
    jfmnuAllITT2OPT.jv.Filter.Add "AUTOITT2OPT_DEF", f
    End If
      jfmnuAllITT2OPT.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuAllITT2OPT.Show
    jfmnuAllITT2OPT.WindowState = 0
    jfmnuAllITT2OPT.ZOrder 0
End Sub
Private Sub jfmnuAllITT2OPT_OnFilter(usedefault As Boolean)
    Dim fltr As frmITT2OPT
    Dim f As String
    Set fltr = New frmITT2OPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblTheRule.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_TheRule_ID='" & fltr.txtTheRule.Tag & "'"
      End If
    jfmnuAllITT2OPT.jv.Filter.Add "AUTOITT2OPT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuAllITT2OPT_OnClearFilter()
End Sub
Private Sub jfmnuAllITT2OPT_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITT2OPT", "Оптимизация" & Now, Site
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


Private Sub mnuITT2OPT_1_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITT2OPT_1 Is Nothing Then
      Set jfmnuITT2OPT_1 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{DCE95D6B-270C-42B4-ADB5-D3175A7A0AAA}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITT2OPT_1.jv.journal = journal
      jfmnuITT2OPT_1.jv.OpenModal = False
      jfmnuITT2OPT_1.Caption = "Оптимизация :Оформляется"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{EA1BFF2B-89AB-4EAA-A39B-17380CE9D963}'"
    jfmnuITT2OPT_1.jv.Filter.Add "AUTOITT2OPT_DEF", f
    Dim fltr As frmITT2OPT
    Set fltr = New frmITT2OPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblTheRule.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_TheRule_ID='" & fltr.txtTheRule.Tag & "'"
      End If
    jfmnuITT2OPT_1.jv.Filter.Add "AUTOITT2OPT_DEF", f
    End If
      jfmnuITT2OPT_1.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITT2OPT_1.Show
    jfmnuITT2OPT_1.WindowState = 0
    jfmnuITT2OPT_1.ZOrder 0
End Sub
Private Sub jfmnuITT2OPT_1_OnFilter(usedefault As Boolean)
    Dim fltr As frmITT2OPT
    Dim f As String
    Set fltr = New frmITT2OPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{EA1BFF2B-89AB-4EAA-A39B-17380CE9D963}'"
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblTheRule.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_TheRule_ID='" & fltr.txtTheRule.Tag & "'"
      End If
    jfmnuITT2OPT_1.jv.Filter.Add "AUTOITT2OPT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITT2OPT_1_OnClearFilter()
   jfmnuITT2OPT_1.jv.Filter.Add "AUTOITT2OPT_DEF", " INTSANCEStatusID='{EA1BFF2B-89AB-4EAA-A39B-17380CE9D963}'"
End Sub
Private Sub jfmnuITT2OPT_1_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITT2OPT", "Оптимизация" & Now, Site
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


Private Sub mnuITT2OPT_2_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITT2OPT_2 Is Nothing Then
      Set jfmnuITT2OPT_2 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{DCE95D6B-270C-42B4-ADB5-D3175A7A0AAA}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITT2OPT_2.jv.journal = journal
      jfmnuITT2OPT_2.jv.OpenModal = False
      jfmnuITT2OPT_2.Caption = "Оптимизация :Подготовка заданий"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{451AF4A2-1E63-42B6-9494-A4F8301AEEBB}'"
    jfmnuITT2OPT_2.jv.Filter.Add "AUTOITT2OPT_DEF", f
    Dim fltr As frmITT2OPT
    Set fltr = New frmITT2OPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblTheRule.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_TheRule_ID='" & fltr.txtTheRule.Tag & "'"
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
    jfmnuITT2OPT_2.jv.Filter.Add "AUTOITT2OPT_DEF", f
    End If
      jfmnuITT2OPT_2.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITT2OPT_2.Show
    jfmnuITT2OPT_2.WindowState = 0
    jfmnuITT2OPT_2.ZOrder 0
End Sub
Private Sub jfmnuITT2OPT_2_OnFilter(usedefault As Boolean)
    Dim fltr As frmITT2OPT
    Dim f As String
    Set fltr = New frmITT2OPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{451AF4A2-1E63-42B6-9494-A4F8301AEEBB}'"
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblTheRule.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_TheRule_ID='" & fltr.txtTheRule.Tag & "'"
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
    jfmnuITT2OPT_2.jv.Filter.Add "AUTOITT2OPT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITT2OPT_2_OnClearFilter()
   jfmnuITT2OPT_2.jv.Filter.Add "AUTOITT2OPT_DEF", " INTSANCEStatusID='{451AF4A2-1E63-42B6-9494-A4F8301AEEBB}'"
End Sub
Private Sub jfmnuITT2OPT_2_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITT2OPT", "Оптимизация" & Now, Site
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


Private Sub mnuITT2OPT_3_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuITT2OPT_3 Is Nothing Then
      Set jfmnuITT2OPT_3 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{DCE95D6B-270C-42B4-ADB5-D3175A7A0AAA}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuITT2OPT_3.jv.journal = journal
      jfmnuITT2OPT_3.jv.OpenModal = False
      jfmnuITT2OPT_3.Caption = "Оптимизация :Задания подготовлены"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{83661D54-7427-46DF-9FE7-F8CFED10E2E5}'"
    jfmnuITT2OPT_3.jv.Filter.Add "AUTOITT2OPT_DEF", f
    Dim fltr As frmITT2OPT
    Set fltr = New frmITT2OPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblTheRule.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_TheRule_ID='" & fltr.txtTheRule.Tag & "'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
    jfmnuITT2OPT_3.jv.Filter.Add "AUTOITT2OPT_DEF", f
    End If
      jfmnuITT2OPT_3.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuITT2OPT_3.Show
    jfmnuITT2OPT_3.WindowState = 0
    jfmnuITT2OPT_3.ZOrder 0
End Sub
Private Sub jfmnuITT2OPT_3_OnFilter(usedefault As Boolean)
    Dim fltr As frmITT2OPT
    Dim f As String
    Set fltr = New frmITT2OPT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{83661D54-7427-46DF-9FE7-F8CFED10E2E5}'"
      If fltr.lblDateToOptimize_LE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_DateToOptimize<=" & MakeMSSQLDate(fltr.dtpDateToOptimize_LE.Value)
      End If
      If fltr.lblOPtDate_LE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_OPtDate<=" & MakeMSSQLDate(fltr.dtpOPtDate_LE.Value)
      End If
      If fltr.lblTheRule.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_TheRule_ID='" & fltr.txtTheRule.Tag & "'"
      End If
      If fltr.lblDateToOptimize_GE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_DateToOptimize>=" & MakeMSSQLDate(fltr.dtpDateToOptimize_GE.Value)
      End If
      If fltr.lblOptType.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_OptType_ID='" & fltr.txtOptType.Tag & "'"
      End If
      If fltr.lblOPtDate_GE.Value = vbChecked Then
        f = f & " and ITT2OPT_DEF_OPtDate>=" & MakeMSSQLDate(fltr.dtpOPtDate_GE.Value)
      End If
    jfmnuITT2OPT_3.jv.Filter.Add "AUTOITT2OPT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuITT2OPT_3_OnClearFilter()
   jfmnuITT2OPT_3.jv.Filter.Add "AUTOITT2OPT_DEF", " INTSANCEStatusID='{83661D54-7427-46DF-9FE7-F8CFED10E2E5}'"
End Sub
Private Sub jfmnuITT2OPT_3_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "ITT2OPT", "Оптимизация" & Now, Site
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


Unload jfmnuAllITT2OPT
Set jfmnuAllITT2OPT = Nothing

Unload jfmnuITT2OPT_1
Set jfmnuITT2OPT_1 = Nothing

Unload jfmnuITT2OPT_2
Set jfmnuITT2OPT_2 = Nothing

Unload jfmnuITT2OPT_3
Set jfmnuITT2OPT_3 = Nothing

End Sub



